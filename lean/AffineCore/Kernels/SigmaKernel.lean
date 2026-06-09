import AffineCore.Foundations.BanachSpace

-- Use a complex Banach space E
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/--
The Beta function for a quartic coupling in melonic GFT.
β_4(λ) = λ^2 - 0.1 * λ
-/
def beta4 (λ : ℝ) : ℝ := λ^2 - 0.1 * λ

/--
The Beta function for a sextic coupling in melonic GFT.
β_6(λ) = λ^2 - 0.08 * λ - 0.02
-/
def beta6 (λ : ℝ) : ℝ := λ^2 - 0.08 * λ - 0.02

/--
Equilibrium Fixed Point for λ4.
λ* satisfies β_4(λ*) = 0.
Possible values: 0, 0.1.
-/
theorem lambda4_fixed_point_stable :
    beta4 0.1 = 0 := by
  simp [beta4]; ring

/--
Theorem: Monotonicity of flow toward the IR attractor.
For λ in the basin of attraction (0, 0.1), β_4(λ) < 0,
which implies λ(t) decreases as RG time t increases (log(k) decreasing).
Wait, t = log(k/k0). Flow to IR means k decreases, so t decreases.
dλ/dt = β(λ). If β < 0 and dt < 0, then dλ > 0 (increases toward FP).
If λ_uv = 0.045, and λ* = 0.1, it should increase.
-/
theorem beta4_neg_in_range (λ : ℝ) (h1 : 0 < λ) (h2 : λ < 0.1) :
    beta4 λ < 0 := by
  simp [beta4]
  have h3 : λ * (λ - 0.1) < 0 := by
    apply mul_neg_of_pos_of_neg h1
    linarith
  linarith
