import Mathlib.Data.List.Basic
import Mathlib.Algebra.Group.Basic

namespace ZMOS.Parm

/-- Recursive helper function for `sealedState`. -/
def go (v : ℕ) : List ℕ → ℕ
  | [] => v
  | [p_last] => p_last^2 * (v + p_last)
  | p :: ps => go (p * (v + p)) ps

/-- Computes the sealed state V_N for a sequence of natural numbers (primes). -/
def sealedState : List ℕ → ℕ
  | [] => 0
  | [p] => p^2
  | p :: ps => go (p^2) ps

/-- Resonance Quotient (RQ) calculation using deterministic min/max permutations. -/
def calculateRQ (primes : List ℕ) : Rat :=
  let sortedP := primes.sort (· ≤ ·)
  let vMin := sealedState (sortedP.tail ++ [sortedP.head!])
  let vMax := sealedState (sortedP.reverse.tail.reverse ++ [sortedP.getLast!])
  let vActual := sealedState primes
  if vMax == vMin then 0.5
  else (vActual - vMin : Rat) / (vMax - vMin : Rat)

/-- Structural Lemma: sealedState on single element. -/
@[simp] lemma sealedState_singleton (p : ℕ) : sealedState [p] = p^2 := rfl

/-- Structural Lemma: go is monotone in the initial value v. -/
lemma go_mono (v1 v2 : ℕ) (hv : v1 ≤ v2) (ps : List ℕ) : go v1 ps ≤ go v2 ps := by
  induction ps using go.induct v1 with
  | case1 _ => exact hv
  | case2 _ p_last =>
    simp [go]
    apply Nat.mul_le_mul_left
    apply Nat.add_le_add_right hv
  | case3 _ p ps ih =>
    simp [go]
    apply ih
    apply Nat.mul_le_mul_left
    apply Nat.add_le_add_right hv

end ZMOS.Parm
