import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.NormedSpace.BoundedLinearMaps
import Mathlib.Topology.MetricSpace.Contracting
import Mathlib.Tactic.Linarith

/-!
# PIRTM Recursive Stability: Λₘ Contraction Theorem

This module formalizes the core stability result of the Prime-Indexed Recursive Trust Model.
Specifically, it proves that the convex update rule:
  Ψ_{t+1} = (1 - λ_m)Ψ_t + λ_m G(Ψ_t, x_t)
is a Banach contraction when G is contractive and λ_m ∈ (0, 1].

Reference: PIRTM_CORE_SPEC.md §5
-/

variable {H : Type*} [NormedAddCommGroup H] [NormedSpace ℝ H] [CompleteSpace H]

/-- The Λₘ contraction constant: c = 1 - λ_m(1 - L_G). -/
def pirtm_contraction_const (lambda_m : ℝ) (L_G : ℝ) : ℝ :=
  1 - lambda_m * (1 - L_G)

/--
The Λₘ update map: T_{λ_m}(Ψ) = (1 - λ_m)Ψ + λ_m G(Ψ).
This represents the discrete-time evolution step of the PIRTM state.
-/
def pirtmUpdate (lambda_m : ℝ) (G : H → H) : H → H :=
  fun Ψ => (1 - lambda_m) • Ψ + lambda_m • G Ψ

/--
Theorem (Λₘ contraction):
If G is a Lipschitz map with constant L_G < 1, and λ_m ∈ (0, 1],
then the update map is a contraction with constant c = 1 - λ_m(1 - L_G) < 1.
-/
theorem pirtm_contraction_theorem
    (lambda_m : ℝ) (G : H → H) (L_G : ℝ≥0)
    (hG : LipschitzWith L_G G)
    (hL : L_G < 1)
    (h_lam_pos : 0 < lambda_m)
    (h_lam_le : lambda_m ≤ 1) :
    ∃ (K : ℝ≥0), (K : ℝ) = pirtm_contraction_const lambda_m L_G ∧ K < 1 ∧ LipschitzWith K (pirtmUpdate lambda_m G) := by
  -- Define the contraction constant c
  let c := pirtm_contraction_const lambda_m L_G
  
  -- c is non-negative: since λ_m ≤ 1 and L_G < 1, 1 - λ_m(1-L_G) ≥ 1 - (1-L_G) = L_G ≥ 0
  have hc_nonneg : 0 ≤ c := by
    unfold pirtm_contraction_const
    have h_le : lambda_m * (1 - (L_G : ℝ)) ≤ 1 * (1 - (L_G : ℝ)) := by
      apply mul_le_mul_of_nonneg_right h_lam_le
      linarith [L_G.coe_nonneg]
    linarith [L_G.coe_nonneg]
    
  let K : ℝ≥0 := ⟨c, hc_nonneg⟩
  use K
  constructor
  · rfl
  constructor
  · -- Show K < 1
    show (K : ℝ) < 1
    unfold pirtm_contraction_const
    have h1L : 0 < 1 - (L_G : ℝ) := by linarith [L_G.coe_nonneg]
    have h_prod_pos : 0 < lambda_m * (1 - (L_G : ℝ)) := mul_pos h_lam_pos h1L
    linarith
  · -- Prove Lipschitz bound
    intro x y
    unfold pirtmUpdate
    -- ‖(1 - λ_m)x + λ_m G x - ((1 - λ_m)y + λ_m G y)‖
    rw [add_sub_add_comm, ← smul_sub, ← smul_sub]
    apply le_trans (norm_add_le _ _)
    -- ‖(1 - λ_m)(x - y)‖ + ‖λ_m(G x - G y)‖
    rw [norm_smul, norm_smul, Real.norm_eq_abs, Real.norm_eq_abs]
    
    have h1 : abs (1 - lambda_m) = 1 - lambda_m := abs_of_nonneg (by linarith)
    rw [h1]
    
    have h2 : abs lambda_m = lambda_m := abs_of_nonneg (by linarith)
    rw [h2]
    
    have hG_bound := hG.norm_sub_le x y
    
    -- Combine
    have : (1 - lambda_m) * ‖x - y‖ + lambda_m * ‖G x - G y‖ ≤ (1 - lambda_m) * ‖x - y‖ + lambda_m * ((L_G : ℝ) * ‖x - y‖) := by
      apply add_le_add_left
      exact mul_le_mul_of_nonneg_left hG_bound (by linarith)
    
    apply le_trans this
    -- Factor out ‖x - y‖
    rw [← add_mul, ← mul_assoc]
    -- (1 - λ_m + λ_m * L_G) * ‖x - y‖
    -- This is exactly c * ‖x - y‖
    have : (1 - lambda_m + lambda_m * (L_G : ℝ)) = c := by 
      unfold pirtm_contraction_const
      linarith
    rw [this]
    rfl

/--
Corollary: Existence and uniqueness of the fixed point Ψ*.
-/
theorem pirtm_fixed_point_exists
    (lambda_m : ℝ) (G : H → H) (L_G : ℝ≥0)
    (hG : LipschitzWith L_G G)
    (hL : L_G < 1)
    (h_lam_pos : 0 < lambda_m)
    (h_lam_le : lambda_m ≤ 1) :
    ∃! Ψ, pirtmUpdate lambda_m G Ψ = Ψ := by
  obtain ⟨K, _, hK_lt_1, hK_lip⟩ := pirtm_contraction_theorem lambda_m G L_G hG hL h_lam_pos h_lam_le
  -- Use the Banach Fixed Point Theorem from Mathlib
  let T : ContractingWith K (pirtmUpdate lambda_m G) := ⟨hK_lt_1, hK_lip⟩
  exact T.exists_unique_fixedPoint

/-! ## Operator-Norm Bounds -/

/--
The Step Function G(Ψ) = Ξ Ψ + Λ T(Ψ).
Commonly used in PIRTM implementations where Ξ and Λ are linear operators.
-/
def pirtmStep (Xi : H →L[ℝ] H) (Lambda : H →L[ℝ] H) (T : H → H) : H → H :=
  fun Ψ => Xi Ψ + Lambda (T Ψ)

/--
Theorem: Lipschitz constant of the pirtmStep.
L_G ≤ ‖Ξ‖ + ‖Λ‖ * L_T.
-/
theorem pirtm_step_lipschitz
    (Xi : H →L[ℝ] H) (Lambda : H →L[ℝ] H) (T : H → H) (L_T : ℝ≥0)
    (hT : LipschitzWith L_T T) :
    LipschitzWith (Real.toNNReal (‖Xi‖ + ‖Lambda‖ * L_T)) (pirtmStep Xi Lambda T) := by
  let L_G := ‖Xi‖ + ‖Lambda‖ * L_T
  have hL_nonneg : 0 ≤ L_G := by
    apply add_nonneg
    · exact norm_nonneg _
    · apply mul_nonneg
      · exact norm_nonneg _
      · exact L_T.coe_nonneg
  
  intro x y
  unfold pirtmStep
  -- ‖Xi x + Lambda (T x) - (Xi y + Lambda (T y))‖
  rw [add_sub_add_comm, ← Xi.map_sub]
  apply le_trans (norm_add_le _ _)
  -- ‖Xi (x - y)‖ + ‖Lambda (T x) - Lambda (T y)‖
  rw [← Lambda.map_sub]
  
  have h_xi_bound : ‖Xi (x - y)‖ ≤ ‖Xi‖ * ‖x - y‖ := Xi.le_op_norm (x - y)
  have h_lam_bound : ‖Lambda (T x - T y)‖ ≤ ‖Lambda‖ * ‖T x - T y‖ := Lambda.le_op_norm (T x - T y)
  have h_t_bound : ‖T x - T y‖ ≤ L_T * ‖x - y‖ := hT.norm_sub_le x y
  
  apply le_trans (add_le_add h_xi_bound _)
  apply le_trans (mul_le_mul_of_nonneg_left h_t_bound (norm_nonneg _))
  
  rw [← add_mul, ← mul_assoc]
  rw [Real.toNNReal_of_nonneg hL_nonneg]
  exact le_rfl
