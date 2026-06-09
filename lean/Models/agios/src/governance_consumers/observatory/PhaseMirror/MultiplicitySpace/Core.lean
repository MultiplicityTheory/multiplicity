import Mathlib.Data.Nat.Prime

/--
A Multiplicity Space `M` is a type where every element has a prime-indexed label.
The `interact` function defines how elements (agents, trust atoms) combine.
-/
structure MultiplicitySpace where
  carrier   : Type
  label     : carrier → ℕ
  prime_lbl : ∀ x, Nat.Prime (label x) ∨ label x = 1
  interact  : carrier → carrier → carrier

/--
An identity element in a multiplicity space has a label of 1.
-/
def IsIdentity (M : MultiplicitySpace) (x : M.carrier) : Prop :=
  M.label x = 1
