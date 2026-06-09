/-
Formalization of sigma-kernel primitives.
Target: Sigma Bilinear Form and Zeno Projector Stability.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-!
### 1. Sigma Bilinear Form
Definition of the weighted inner product: σ(x, y) = Σ x_i * y_i / log(p_i)
-/

def sigma_bilinear_form (x y : List ℝ) (primes : List ℝ) : ℝ :=
  (List.zipWith (fun a b => a * b) x y).zipWith (fun val p => val / Real.log p) primes |>.sum

/-!
### 2. Zeno Projector Stability
Definition of the projection: ρ' = ρ₀ + (ε / W) * (ρ - ρ₀)
-/

def zeno_project (ρ ρ₀ : ℝ) (residual : ℝ) (ε : ℝ) : ℝ :=
  if residual ≤ ε then ρ
  else ρ₀ + (ρ - ρ₀) * (ε / residual)

/-!
### 3. Properties
-/

-- Property: If residual ≤ ε, Zeno project returns the input state.
theorem zeno_stable (ρ ρ₀ ε : ℝ) (h : 0 < ε) : 
  zeno_project ρ ρ₀ ε ε = ρ := by
  simp [zeno_project]

-- Property: Monotonicity toward reference state
-- If the residual > ε, the projected state is closer to ρ₀.
theorem zeno_correction (ρ ρ₀ ε res : ℝ) (h_res : ε < res) (h_e : 0 ≤ ε) (h_r : 0 < res) :
  |zeno_project ρ ρ₀ res ε - ρ₀| = |(ρ - ρ₀)| * (ε / res) := by
  simp [zeno_project, h_res]
  rw [abs_mul]
  have h_pos : 0 ≤ ε / res := div_nonneg h_e (le_of_lt h_r)
  rw [abs_eq_self.mpr h_pos]
  rfl
