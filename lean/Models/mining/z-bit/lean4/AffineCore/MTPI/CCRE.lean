import Mathlib.Tactic
import Mathlib.Data.Real.Basic

namespace AffineCore.MTPI

/--
CCRE runtime parameters and gate invariants.
- /
structure CCREParams where
  kappa : ℝ
  resonance : ℝ
  drift : ℝ
  lower : ℝ := 0.0
  upper : ℝ := 1.0
  driftThreshold : ℝ := 0.3
  deriving Repr, Inhabited

/-- Contraction gate for CCRE. -/
def contractionHolds (kappa : ℝ) : Prop :=
  kappa < 1

/-- Resonance gate for CCRE. -/
def resonanceHolds (resonance lower upper : ℝ) : Prop :=
  lower ≤ resonance ∧ resonance ≤ upper

/-- Drift gate for CCRE. -/
def driftHolds (drift threshold : ℝ) : Prop :=
  drift ≤ threshold

theorem contraction_holds_of_lt_one {kappa : ℝ} (h : kappa < 1) :
    contractionHolds kappa :=
  h

theorem resonance_holds_of_in_band {resonance lower upper : ℝ}
    (h : lower ≤ resonance ∧ resonance ≤ upper) :
    resonanceHolds resonance lower upper :=
  h

theorem drift_holds_of_below_threshold {drift threshold : ℝ} (h : drift ≤ threshold) :
    driftHolds drift threshold :=
  h

/-- A complete permitted CCRE update if all gate invariants hold. -/
def ccreUpdatePermitted (p : CCREParams) : Prop :=
  contractionHolds p.kappa ∧ resonanceHolds p.resonance p.lower p.upper ∧
    driftHolds p.drift p.driftThreshold

/-- The permitted update condition expanded as the raw parameter inequalities. -/
theorem ccreUpdatePermitted_iff (p : CCREParams) :
    ccreUpdatePermitted p ↔
      p.kappa < 1 ∧ p.lower ≤ p.resonance ∧ p.resonance ≤ p.upper ∧
        p.drift ≤ p.driftThreshold := by
  constructor
  · intro h
    have hres := h.2.1
    exact ⟨h.1, hres.1, hres.2, h.2.2⟩
  · intro h
    constructor
    · exact h.1
    · constructor
      · exact ⟨h.2, h.3⟩
      · exact h.4

/-- If contraction fails, the CCRE update is rejected. -/
theorem ccre_update_rejected_if_contraction_fails (p : CCREParams)
    (h : ¬ contractionHolds p.kappa) :
    ¬ ccreUpdatePermitted p := by
  intro hperm
  exact h hperm.1

end AffineCore.MTPI
