/-
Formalization of pirtm-core primitives.
Target: ContractiveOperator and SpectralLinear Lipschitz bound.
-/

import Mathlib.Analysis.Normed.Operator.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.LinearAlgebra.Matrix.Spectrum
import Mathlib.Analysis.Matrix

/-!
### 1. Formalizing ContractiveOperator
We define a contractive operator as a bounded linear operator on a normed space 
with a Lipschitz constant less than 1.
-/

class ContractiveOperator {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] (f : E → E) : Prop where
  is_lipschitz : LipschitzWith 1 f -- Simplified for now to 1-Lipschitz

/-!
### 2. SpectralLinear Contractivity Certification
We aim to prove that a SpectralLinear layer, when normalized by its spectral norm
to kappa, satisfies the contractivity requirement.
-/

-- Structure capturing the linear map and the Lipschitz bound constraint.
structure SpectralLinear (n m : ℕ) where
  W : Matrix (Fin m) (Fin n) ℝ
  kappa : ℝ
  h_norm : ‖(W.toLin' : (Fin n → ℝ) →L[ℝ] (Fin m → ℝ))‖ ≤ kappa

/-!
### 3. Contractivity Proof
We prove that a SpectralLinear layer is L-Lipschitz with L = kappa.
-/

-- Property: The induced norm of the linear map is bounded by kappa, 
-- implies Lipschitz continuity.
theorem spectral_linear_contractive {n m : ℕ} (L : SpectralLinear n m) :
    LipschitzWith L.kappa (fun (x : Fin n → ℝ) ↦ (L.W.toLin' x)) := by
  -- Convert to BoundedLinearMap and use norm bound
  have h_map : (L.W.toLin' : (Fin n → ℝ) →L[ℝ] (Fin m → ℝ)) = (L.W.toLin' : (Fin n → ℝ) →L[ℝ] (Fin m → ℝ)) := rfl
  exact BoundedLinearMap.lipschitz_with_of_norm_le (L.W.toLin') L.h_norm
