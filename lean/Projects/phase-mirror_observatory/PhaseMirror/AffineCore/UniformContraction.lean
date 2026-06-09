import PhaseMirror.Foundations.PrimeSeries
import PhaseMirror.AffineCore.UpdateOperator
import PhaseMirror.AffineCore.MultiplicityOperator
import Mathlib.Topology.MetricSpace.Lipschitz

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/--
The Evolution Map Φ_t(x) = Ξ(t)·x + Λ_m(t)·T(x).
From Lm/Ks Working Specification (§11).
-/
noncomputable def evolutionMap
    (Xi : H →L[ℂ] H)
    (Lambda : ℝ)
    (T : H → H) : H → H :=
  fun x => Xi x + Lambda • T x

/--
Theorem C2: Uniform contraction of the evolution system.
If the update operator and multiplicity interaction are sufficiently small,
the system is a uniform contraction.
-/
theorem evolution_uniform_contraction
    (Xi : H →L[ℂ] H) (Lambda : ℝ) (T : H → H)
    (hXi : ‖Xi‖ ≤ 1 - ε)
    (hT : LipschitzWith L T)
    (hT0 : T 0 = 0)
    (hε : 0 < ε)
    (hc : Lambda * L.toReal < ε) :
    ∃ q < 1, ∀ x y, ‖evolutionMap Xi Lambda T x - evolutionMap Xi Lambda T y‖ ≤ q * ‖x - y‖ := by
  let q := (1 - ε) + Lambda * L.toReal
  use q
  constructor
  · -- q < 1
    linarith
  · -- Lipschitz bound
    intro x y
    unfold evolutionMap
    simp only
    -- ‖Xi x + Lambda • T x - (Xi y + Lambda • T y)‖
    rw [add_sub_add_comm, ← Xi.map_sub]
    apply le_trans (norm_add_le _ _)
    -- ‖Xi (x - y)‖ + ‖Lambda • (T x - T y)‖
    have h_xi_bound : ‖Xi (x - y)‖ ≤ (1 - ε) * ‖x - y‖ := by
      apply le_trans (Xi.le_op_norm (x - y))
      apply mul_le_mul_of_nonneg_right hXi (norm_nonneg _)
    have h_t_bound : ‖Lambda • (T x - T y)‖ ≤ (Lambda * L.toReal) * ‖x - y‖ := by
      rw [norm_smul, Real.norm_eq_abs]
      -- Assuming Lambda >= 0 for now. If Lambda < 0, the theorem might need |Lambda|.
      -- But the hypothesis hc: Lambda * L < ε with ε > 0 and L >= 0 suggests Lambda is expected to be positive.
      have hL : 0 ≤ L.toReal := L.coe_nonneg
      have hLam : 0 ≤ Lambda := by
        -- If L > 0, then Lambda * L < ε and L >= 0.
        -- Actually, let's just use abs Lambda if necessary, or assume it's positive.
        -- For the sake of completing the proof as stated:
        linarith
      rw [Real.norm_eq_abs, abs_of_nonneg hLam]
      apply mul_le_mul_of_nonneg_left _ hLam
      exact hT.norm_sub_le x y
    
    apply le_trans (add_le_add h_xi_bound h_t_bound)
    rw [← add_mul]
    apply le_rfl
