import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.NormedSpace.BoundedLinearMaps
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Data.Nat.Prime
import Mathlib.Tactic

open Topology

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/--
A family of operators indexed by primes.
Used to define the Ξ (Xi) operator in the Affine Core.
-/
structure PrimeSectorFamily (H : Type*) [NormedAddCommGroup H] [NormedSpace ℂ H] where
  weight   : ℕ → ℂ
  operator : ℕ → H →L[ℂ] H
  support_prime : ∀ p, weight p ≠ 0 → Nat.Prime p

/--
A prime sector family is absolutely convergent if the sum of the products of
the weights and operator norms is finite.
-/
def AbsolutelyConvergent (F : PrimeSectorFamily H) : Prop :=
  Summable (fun p => ‖F.weight p‖ * ‖F.operator p‖)

/--
The evolution operator Ξ is the sum of weighted prime-indexed operators.
-/
noncomputable def Xi (F : PrimeSectorFamily H) (_hF : AbsolutelyConvergent F) : H →L[ℂ] H :=
  ∑' p, (F.weight p) • (F.operator p)

/--
Theorem: If the family is absolutely convergent, the operator series converges
in the operator norm topology.
-/
theorem xi_summable (F : PrimeSectorFamily H) (hF : AbsolutelyConvergent F) :
    Summable (fun p => (F.weight p) • (F.operator p)) := by
  apply Summable.of_norm
  simp_rw [norm_smul]
  exact hF
