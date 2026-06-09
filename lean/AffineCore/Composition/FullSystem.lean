import AffineCore.Foundations.BanachSpace
import AffineCore.Operators.PolicyProjector
import AffineCore.Operators.MultiplicityOperator
import AffineCore.Stability.ExistenceUniqueness
import Mathlib.Topology.MetricSpace.ContractingMap

-- Use a Hilbert space H for the full system (to use projection)
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/--
The composed full system map:
X_{t+1} = P[Φ(X_t)] + Λ·T(X_t)
where P is the policy projector and Λ·T is the multiplicity term.
-/
noncomputable def fullSystemMap
    (Φ : H →L[ℂ] H)
    (F_set : Set H) (hF : Convex ℝ F_set) (hF_cl : IsClosed F_set) (hF_ne : F_set.Nonempty)
    (Λ : ℂ) (T : H → H) : H → H :=
  fun x => policyProjector hF hF_cl hF_ne (Φ x) + Λ • T x

/--
Theorem E1: Full system contraction.
If P is nonexpansive, Φ is contractive, and Λ·T is sufficiently small,
the full system is contractive.
-/
theorem full_system_contractive
    (Φ : H →L[ℂ] H)
    (F_set : Set H) (hF : Convex ℝ F_set) (hF_cl : IsClosed F_set) (hF_ne : F_set.Nonempty)
    (Λ : ℂ) (T : H → H) (L : ℝ≥0) (hT : LipschitzWith L T)
    (q_Φ : ℝ) (h_phi : ‖Φ‖ ≤ q_Φ)
    (ε : ℝ) (hε : 0 < ε)
    (h_stability : q_Φ + ‖Λ‖ * (L : ℝ) ≤ 1 - ε) :
    ∃ q < 1, ∀ x y, ‖fullSystemMap Φ F_set hF hF_cl hF_ne Λ T x -
                        fullSystemMap Φ F_set hF hF_cl hF_ne Λ T y‖ ≤ q * ‖x - y‖ := by
  let q := q_Φ + ‖Λ‖ * (L : ℝ)
  use q
  constructor
  · -- q < 1
    calc q ≤ 1 - ε := h_stability
      _ < 1 := by linarith
  · -- Lipschitz bound
    intro x y
    simp_rw [fullSystemMap]
    rw [add_sub_add_comm, ← smul_sub]
    calc ‖(policyProjector hF hF_cl hF_ne (Φ x) - policyProjector hF hF_cl hF_ne (Φ y)) + Λ • (T x - T y)‖
        ≤ ‖policyProjector hF hF_cl hF_ne (Φ x) - policyProjector hF hF_cl hF_ne (Φ y)‖ + ‖Λ • (T x - T y)‖ := norm_add_le _ _
      _ ≤ ‖Φ x - Φ y‖ + ‖Λ‖ * ‖T x - T y‖ := by
            apply add_le_add
            · exact projector_nonexpansive hF hF_cl hF_ne _ _
            · exact (norm_smul _ _).le
      _ ≤ ‖Φ‖ * ‖x - y‖ + ‖Λ‖ * (L * ‖x - y‖) := by
            apply add_le_add
            · exact Φ.le_opNorm _
            · apply mul_le_mul_of_nonneg_left
              exact hT.dist_le_mul x y
              exact norm_nonneg _
      _ ≤ q_Φ * ‖x - y‖ + ‖Λ‖ * (L * ‖x - y‖) := by
            apply add_le_add_right
            apply mul_le_mul_of_nonneg_right h_phi (norm_nonneg _)
      _ = q * ‖x - y‖ := by ring

/--
MASTER THEOREM (FULL SYSTEM): Existence and uniqueness of the governed trajectory.
This certifies the entire Affine Core architecture.
-/
theorem full_system_unique_fixed_point
    (Φ : H →L[ℂ] H)
    (F_set : Set H) (hF : Convex ℝ F_set) (hF_cl : IsClosed F_set) (hF_ne : F_set.Nonempty)
    (Λ : ℂ) (T : H → H) (L : ℝ≥0) (hT : LipschitzWith L T)
    (q_Φ : ℝ) (h_phi : ‖Φ‖ ≤ q_Φ)
    (ε : ℝ) (hε : 0 < ε)
    (h_stability : q_Φ + ‖Λ‖ * (L : ℝ) ≤ 1 - ε) :
    ∃! x : H, fullSystemMap Φ F_set hF hF_cl hF_ne Λ T x = x := by
  -- Obtain contraction proof
  let h_contract := full_system_contractive Φ F_set hF hF_cl hF_ne Λ T L hT q_Φ h_phi ε hε h_stability
  let q := q_Φ + ‖Λ‖ * (L : ℝ)
  have hq0 : 0 ≤ q := by
    apply add_nonneg
    · exact le_trans (norm_nonneg _) h_phi
    · exact mul_nonneg (norm_nonneg _) (NNReal.coe_nonneg _)
  have hq1 : q < 1 := by
    calc q ≤ 1 - ε := h_stability
      _ < 1 := by linarith
  -- Apply Banach Fixed-Point
  apply ContractingMap.exists_unique_fixedPoint
  exact mkContractingMap (fullSystemMap Φ F_set hF hF_cl hF_ne Λ T) q hq1 hq0 (by
    intro x y
    exact h_contract.choose_spec.2 x y)
