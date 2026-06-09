import AffineCore.Foundations.BanachSpace
import Mathlib.Analysis.InnerProductSpace.Projection
import Mathlib.Analysis.Convex.Basic

-- Use a Hilbert space H for projection
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/--
Policy projector onto a convex closed set F.
This formalizes Theorems B1 and B2.
-/
variable {F : Set H} (hF : Convex ℝ F) (hF_closed : IsClosed F) (hF_nonempty : F.Nonempty)

/--
The policy projector is the metric projection (nearest point map).
-/
noncomputable def policyProjector (u : H) : H :=
  (orthogonalProjection hF hF_closed hF_nonempty u : H)

/--
Theorem B1: Nonexpansiveness of projection onto convex closed set.
-/
theorem projector_nonexpansive :
    ∀ u v : H, ‖policyProjector hF hF_closed hF_nonempty u -
               policyProjector hF hF_closed hF_nonempty v‖ ≤ ‖u - v‖ := by
  intro u v
  simp [policyProjector]
  exact (orthogonalProjection hF hF_closed hF_nonempty).lipschitz.dist_le_mul u v

/--
Theorem B2: Composition P ∘ Φ is contractive if Φ is contractive.
More generally, Lipschitz constants compose.
-/
theorem composed_lipschitz
    (f : H → H) (hf : LipschitzWith k f) :
    LipschitzWith k (fun x => policyProjector hF hF_closed hF_nonempty (f x)) := by
  have hP : LipschitzWith 1 (policyProjector hF hF_closed hF_nonempty) := by
    apply LipschitzWith.of_dist_le_mul
    intro u v
    simp [NNReal.coe_one, one_mul]
    exact projector_nonexpansive hF hF_closed hF_nonempty u v
  exact LipschitzWith.comp hP hf
