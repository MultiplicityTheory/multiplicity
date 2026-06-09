import PhaseMirror.MultiplicitySpace.Core
import Mathlib.Logic.Function.Iterate
import Mathlib.Data.Nat.Basic

/--
Recursive Identity preservation:
An element `x` reaches an identity fixed point if its label becomes constant
after a finite number of self-interactions.
-/
def RecursiveIdentity (M : MultiplicitySpace) (x : M.carrier) : Prop :=
  let self_interact := fun y => M.interact y y
  ∃ n : ℕ, ∀ k ≥ n,
    M.label (self_interact^[k] x) = M.label (self_interact^[n] x)

/--
A Multiplicity Space is Stable if all elements satisfy the RecursiveIdentity property.
-/
def IsStable (M : MultiplicitySpace) : Prop :=
  ∀ x : M.carrier, RecursiveIdentity M x
