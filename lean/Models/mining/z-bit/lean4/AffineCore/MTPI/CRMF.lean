import Mathlib.Tactic
import Mathlib.Data.Real.Basic

namespace AffineCore.MTPI

/--
CRMF runtime parameters and proof obligations.
- /
structure CRMFParams where
  rho : ℝ
  resonance : ℝ
  alpha : ℝ := 0.1
  bandLower : ℝ := 0.0
  bandUpper : ℝ := 1.0
  deriving Repr, Inhabited

/-- Incremental contraction bound used in CRMF certification. -/
noncomputable def contractionBound (rho : ℝ) : ℝ :=
  1 / (1 + rho)

theorem contractionBound_nonneg (hrho : 0 ≤ rho) :
    0 ≤ contractionBound rho := by
  have : 0 < 1 + rho := by linarith
  positivity

theorem contractionBound_le_one (hrho : 0 ≤ rho) :
    contractionBound rho ≤ 1 := by
  have : 0 < 1 + rho := by linarith
  nlinarith

/--
The CRMF contraction theorem: if the spectral radius is non-negative and below one,
then the contraction bound lies below one.
- /
theorem contractionTheorem (hrho : 0 ≤ rho) (hlt : rho < 1) :
    contractionBound rho < 1 := by
  have : 0 < 1 + rho := by linarith
  nlinarith

/-- Resonance is inside the safe band for CRMF. -/
def resonanceInBand (resonance bandLower bandUpper : ℝ) : Prop :=
  bandLower ≤ resonance ∧ resonance ≤ bandUpper

/-- Lipschitz resonance product used for CRMF stability coupling. -/
def lipschitzProduct (alpha bandLower bandUpper : ℝ) : ℝ :=
  alpha * (bandUpper - bandLower)

/-- Stable CRMF coupling if resonance is in-band and the Lipschitz product is sub-unity. -/
def stableCoupling (resonance alpha bandLower bandUpper : ℝ) : Prop :=
  resonanceInBand resonance bandLower bandUpper ∧ lipschitzProduct alpha bandLower bandUpper < 1

/-- The CRMF modulation gain used for bounded gain proofs. -/
noncomputable def boundedModulationGain (rho resonance : ℝ) : ℝ :=
  contractionBound rho * resonance

/--
If CRMF resonance is non-negative and the band upper bound is at most `1 + rho`, then
bounded modulation gain stays below unity.
- /
theorem boundedModulationGain_le_one
    {rho resonance bandLower bandUpper : ℝ}
    (hrho : 0 ≤ rho)
    (hband : bandLower ≤ resonance)
    (hband' : resonance ≤ bandUpper)
    (hupper : bandUpper ≤ 1 + rho) :
    boundedModulationGain rho resonance ≤ 1 := by
  have hpos : 0 < 1 + rho := by linarith
  have hres_nonneg : 0 ≤ resonance := by linarith
  have hres_bound : resonance ≤ 1 + rho := by linarith
  nlinarith

/-- A safe CRMF parameter configuration. -/
def crmfSafe (p : CRMFParams) : Prop :=
  0 ≤ p.rho ∧ p.rho < 1 ∧ resonanceInBand p.resonance p.bandLower p.bandUpper ∧
    lipschitzProduct p.alpha p.bandLower p.bandUpper < 1

/--
If the CRMF parameterization is safe and the band upper limit is properly clamped,
then the modulation gain is bounded by one.
- /
theorem crmfSafe_bound_gain_le_one (p : CRMFParams) (h : crmfSafe p)
    (hupper : p.bandUpper ≤ 1 + p.rho) :
    boundedModulationGain p.rho p.resonance ≤ 1 := by
  exact boundedModulationGain_le_one h.1 h.2.2.1 h.2.2.2 hupper

end AffineCore.MTPI
