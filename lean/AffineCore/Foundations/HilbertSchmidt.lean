import AffineCore.Foundations.BanachSpace
import Mathlib.Analysis.HilbertSpace.HilbertSchmidt

-- Use a Hilbert space H for Hilbert-Schmidt operations
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/--
The Hilbert-Schmidt norm satisfies: ‖M‖_op ≤ ‖M‖_HS.
This is a standard property in Mathlib4.
-/
theorem op_norm_le_hs_norm (M : HilbertSchmidtOperator H H) :
    ‖(M : H →L[ℂ] H)‖ ≤ ‖M‖_HS :=
  HilbertSchmidtOperator.norm_le_hs_norm M

/--
Boundedness of M_t in HS norm implies boundedness in operator norm.
-/
def IsHSBounded (M : ℕ → HilbertSchmidtOperator H H) (C : ℝ) : Prop :=
  ∀ t, ‖M t‖_HS ≤ C

theorem op_norm_bounded_of_hs_bounded
    (M : ℕ → HilbertSchmidtOperator H H) (C : ℝ) (hM : IsHSBounded M C) :
    ∀ t, ‖(M t : H →L[ℂ] H)‖ ≤ C := by
  intro t
  trans ‖M t‖_HS
  · exact op_norm_le_hs_norm (M t)
  · exact hM t
