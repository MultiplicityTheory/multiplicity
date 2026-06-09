import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.NormedSpace.BoundedLinearMaps

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/--
The generators of the Mother Operator Ω.
From `omega_operator.py` architecture.
-/
structure MultiplicityGenerators (H : Type*) [NormedAddCommGroup H] [NormedSpace ℂ H] where
  D_sigma : H →L[ℂ] H  -- Prime-graded scaling
  K       : H →L[ℂ] H  -- Interaction kernel
  C       : H →L[ℂ] H  -- Time-sieve multiplier
  Xi      : H →L[ℂ] H  -- Internal recursive block

/--
The Mother Operator Ω is the sum of its four core generators.
Ω = D_sigma + K + C + Xi
-/
noncomputable def omegaOperator (G : MultiplicityGenerators H) : H →L[ℂ] H :=
  G.D_sigma + G.K + G.C + G.Xi

/--
Theorem: The Mother Operator Ω is a bounded linear operator.
This follows from the fact that the space of bounded linear operators
forms a normed algebra (specifically, a Banach space here).
-/
theorem omega_is_bounded (G : MultiplicityGenerators H) :
    ‖omegaOperator G‖ ≤ ‖G.D_sigma‖ + ‖G.K‖ + ‖G.C‖ + ‖G.Xi‖ := by
  unfold omegaOperator
  apply le_trans (norm_add_le _ _)
  apply add_le_add_left
  apply le_trans (norm_add_le _ _)
  apply add_le_add_left
  apply norm_add_le

/--
Lawfulness condition: Ω must commute with the CSL Projector P_CSL
within an admissibility threshold ε.
-/
def IsLawful (G : MultiplicityGenerators H) (P_CSL : H →L[ℂ] H) (ε : ℝ) : Prop :=
  ‖(omegaOperator G) ∘L P_CSL - P_CSL ∘L (omegaOperator G)‖ ≤ ε
