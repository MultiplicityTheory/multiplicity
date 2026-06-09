import AffineCore.Foundations.BanachSpace
import AffineCore.Stability.UniformContraction
import Mathlib.Algebra.BigOperators.Group.Finset
import Mathlib.Tactic.Linarith

-- Use a complex Banach space E
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

open BigOperators

/--
Theorem D1: BIBO Stability.
Bounded external input G_t implies bounded state X_t.
Also proves exponential input rejection (error decay).
-/
theorem bibo_stability
    (f : E → E) (G G' : ℕ → E)
    (q : ℝ) (hq : q < 1) (hq0 : 0 ≤ q)
    (h_contract : ∀ x y, ‖f x - f y‖ ≤ q * ‖x - y‖)
    (X X' : ℕ → E)
    (hX  : ∀ t, X  (t+1) = f (X  t) + G  t)
    (hX' : ∀ t, X' (t+1) = f (X' t) + G' t) :
    ∀ t : ℕ, ‖X t - X' t‖ ≤
      q^t * ‖X 0 - X' 0‖ +
      ∑ k in Finset.range t, q^(t - 1 - k) * ‖G k - G' k‖ := by
  intro t
  induction t with
  | zero => simp
  | succ t ih =>
    rw [hX, hX']
    rw [add_sub_add_comm]
    calc ‖(f (X t) - f (X' t)) + (G t - G' t)‖
        ≤ ‖f (X t) - f (X' t)‖ + ‖G t - G' t‖ := norm_add_le _ _
      _ ≤ q * ‖X t - X' t‖ + ‖G t - G' t‖ := add_le_add (h_contract _ _) le_rfl
      _ ≤ q * (q^t * ‖X 0 - X' 0‖ + ∑ k in Finset.range t, q^(t - 1 - k) * ‖G k - G' k‖) + ‖G t - G' t‖ := by
            apply add_le_add_right
            exact mul_le_mul_of_nonneg_left ih hq0
      _ = q^(t+1) * ‖X 0 - X' 0‖ + (∑ k in Finset.range t, q^(t - k) * ‖G k - G' k‖) + ‖G t - G' t‖ := by
            -- Distribution and exponent algebra
            simp [mul_add, ← mul_assoc, pow_succ]
            congr 1
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro k hk
            rw [← pow_succ]
            congr 1; omega
      _ = q^(t+1) * ‖X 0 - X' 0‖ + ∑ k in Finset.range (t + 1), q^(t - k) * ‖G k - G' k‖ := by
            -- Combine sum
            rw [Finset.sum_range_succ]
            simp
            ring
