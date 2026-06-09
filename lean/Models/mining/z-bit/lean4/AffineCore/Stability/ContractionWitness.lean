import AffineCore.Foundations.BanachSpace
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.Calculus.FDeriv.Basic

-- Use a Banach space E
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/--
The contraction witness q_t — four equivalent formulations from the Affine Core.
Formalizes the witness families (W1–W4).
-/
inductive WitnessFamily (Φ : E → E) where
  /-- W1: Jacobian spectral norm (for differentiable Φ). -/
  | Jacobian (x : E) (f' : E →L[ℂ] E) (h : HasFDerivAt Φ f' x) :
    WitnessFamily Φ

  /-- W2: Lyapunov energy decay (for positive-definite V). -/
  | Lyapunov (V : E → ℝ) (hV_pos : ∀ x, 0 < V x) (hV_decay : ∀ x, V (Φ x) < V x) :
    WitnessFamily Φ

  /-- W3: Incremental gain (Lipschitz constant). -/
  | Incremental (L : ℝ) (hL : LipschitzWith (Real.toNNReal L) Φ) :
    WitnessFamily Φ

  /-- W4: Wasserstein contraction (abstract placeholder for measure-theoretic version). -/
  | Wasserstein : WitnessFamily Φ

/--
Certification condition: q < 1 - ε.
Ensures uniform contraction with a safety margin ε.
-/
def certified (q : ℝ) (ε : ℝ) : Prop := 0 < ε ∧ q < 1 - ε
