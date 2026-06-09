import AffineCore.Foundations.BanachSpace
import AffineCore.Stability.UniformContraction
import Mathlib.Topology.MetricSpace.ContractingMap

-- Use a complex Banach space E
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/--
General helper to construct a ContractingMap from a Lipschitz bound.
-/
noncomputable def mkContractingMap
    (f : E → E) (q : ℝ) (hq : q < 1) (hq0 : 0 ≤ q)
    (h_lipschitz : ∀ x y, ‖f x - f y‖ ≤ q * ‖x - y‖) :
    ContractingMap E where
  toFun := f
  contracting_const := Real.toNNReal q
  dist_le_mul x y := by
    rw [Real.coe_toNNReal qhq0]
    exact h_lipschitz x y

/--
Instance: The evolution map is a ContractingMap if it satisfies the C2 conditions.
-/
noncomputable def evolutionContractingMap
    (Ξ : E →L[ℂ] E) (Λ : ℂ) (T : E → E)
    (q : ℝ) (hq : q < 1) (hq0 : 0 ≤ q)
    (h_lipschitz : ∀ x y, ‖evolutionMap Ξ Λ T x - evolutionMap Ξ Λ T y‖ ≤ q * ‖x - y‖) :
    ContractingMap E :=
  mkContractingMap (evolutionMap Ξ Λ T) q hq hq0 h_lipschitz

/--
MASTER THEOREM: Banach Fixed-Point for the Affine Core.
Existence and uniqueness of the stable trajectory (Theorem C3).
-/
theorem affine_core_unique_fixed_point
    (Ξ : E →L[ℂ] E) (Λ : ℂ) (T : E → E)
    (ε : ℝ) (hε : 0 < ε)
    (hΞ : ‖Ξ‖ ≤ 1 - ε)
    (L : ℝ≥0) (hT : LipschitzWith L T) (hT0 : T 0 = 0)
    (hc : ‖Λ‖ * (L : ℝ) < ε) :
    ∃! x : E, evolutionMap Ξ Λ T x = x := by
  -- Obtain the contraction proof from Theorem C2
  let h_contract := evolution_uniform_contraction Ξ Λ T ε hε hΞ L hT hT0 hc
  let q := ‖Ξ‖ + ‖Λ‖ * (L : ℝ)
  have hq0 : 0 ≤ q := add_nonneg (norm_nonneg _) (mul_nonneg (norm_nonneg _) (NNReal.coe_nonneg _))
  have hq1 : q < 1 := by
    calc q = ‖Ξ‖ + ‖Λ‖ * (L : ℝ) := rfl
      _ < (1 - ε) + ε := add_lt_add_of_le_of_lt hΞ hc
      _ = 1 := by ring
  have h_lip : ∀ x y, ‖evolutionMap Ξ Λ T x - evolutionMap Ξ Λ T y‖ ≤ q * ‖x - y‖ :=
    h_contract.choose_spec.2
  -- Apply Banach Fixed-Point Theorem
  apply ContractingMap.exists_unique_fixedPoint
  exact mkContractingMap (evolutionMap Ξ Λ T) q hq1 hq0 h_lip
