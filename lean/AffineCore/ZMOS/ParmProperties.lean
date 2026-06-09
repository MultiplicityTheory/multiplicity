import ZMOS.Parm
import Mathlib.Data.List.Perm
import Mathlib.Tactic.Ring

namespace ZMOS.Parm

/-- Helper definition: Canonical extremal order (minimum sealed state). -/
def extremalOrder (primes : List ℕ) : List ℕ :=
  let sorted := primes.sort (· ≤ ·)
  sorted.tail ++ [sorted.head!]

/-- Helper: go is always positive for positive inputs. -/
lemma go_pos (v : ℕ) (hv : v > 0) (ps : List ℕ) (hps : ∀ p ∈ ps, 0 < p) : go v ps > 0 := by
  induction ps using go.induct v with
  | case1 v => simp [go]; exact hv
  | case2 v p_last =>
    simp [go]
    apply Nat.mul_pos
    · apply Nat.pow_pos; exact hps p_last (by simp)
    · apply Nat.add_pos_left; exact hv
  | case3 v p ps ih =>
    simp [go]
    apply ih
    · apply Nat.mul_pos
      · exact hps p (by simp)
      · apply Nat.add_pos_left; exact hv
    · intro p' hp'
      exact hps p' (by simp)

/-- Property 1: Well-definedness and positivity. -/
theorem sealedState_pos (primes : List ℕ) (hpos : ∀ p ∈ primes, 0 < p) (hlen : 0 < primes.length) : sealedState primes > 0 := by
  cases primes with
  | nil => contradiction
  | cons p ps =>
    cases ps with
    | nil =>
      simp [sealedState]
      apply Nat.pow_pos; exact hpos p (by simp)
    | cons p2 ps2 =>
      simp [sealedState]
      apply go_pos
      · apply Nat.pow_pos; exact hpos p (by simp)
      · exact hpos


/-- Helper: go_pos is already proved. I need the swap lemma now. -/

/-- Adjacent-swap monotonicity lemma: swapping a <= b to [b, a] increases or maintains sealedState. -/
theorem sealedState_adj_swap_mono
  (a b : ℕ) (tail : List ℕ)
  (hpos_a : a > 0) (hpos_b : b > 0)
  (hle : a ≤ b) (hge2_a : 2 ≤ a) :
  sealedState (a :: b :: tail) ≤ sealedState (b :: a :: tail) := by
  simp [sealedState]
  apply go_mono
  -- Need to show b * (a^2 + b) ≤ a * (b^2 + a)
  -- b * a^2 + b^2 ≤ a * b^2 + a^2
  -- a * b * (b - a) >= (b - a) * (b + a)
  -- a * b >= b + a
  have h_base : b * (a^2 + b) ≤ a * (b^2 + a) := by
    -- b * a^2 + b^2 <= a * b^2 + a^2
    -- a * b^2 + a^2 - (b * a^2 + b^2) >= 0
    -- (b - a) (ab - (a + b)) >= 0

    have h_ab_ge : a * b ≥ a + b := by
      -- (a-1)(b-1) >= 1
      have h1 : a - 1 ≥ 1 := Nat.sub_le_sub_left hge2_a 1
      have h2 : b - 1 ≥ 1 := Nat.sub_le_sub_left (Nat.le_trans hge2_a hle) 1
      have h_prod : (a - 1) * (b - 1) ≥ 1 * 1 := Nat.mul_le_mul h1 h2
      rw [Nat.mul_sub, Nat.sub_mul, Nat.mul_one, Nat.one_mul, Nat.sub_sub] at h_prod
      -- (a-1)(b-1) = ab - a - b + 1 >= 1 => ab - a - b >= 0 => ab >= a + b
      apply Nat.le_sub_of_add_le
      rw [Nat.add_comm]
      exact h_prod

    have h_diff : a * b^2 + a^2 - (b * a^2 + b^2) = (b - a) * (a * b - (a + b)) := by
      ring_nf

    -- ab - (a+b) >= 0 and b-a >= 0.
    have h_nonneg : (b - a) * (a * b - (a + b)) ≥ 0 := by
      apply Nat.mul_nonneg
      apply Nat.sub_nonneg_of_le; exact hle
      apply Nat.sub_nonneg_of_le; exact h_ab_ge

    rw [h_diff] at h_nonneg
    apply Nat.le_of_sub_nonneg h_nonneg
  exact h_base

/-- Property 4: Extremal ordering theorem characterization (Minimum pattern). -/
theorem sealedState_min_char (primes : List ℕ) (h : primes.length > 1) : 
  ∃ p' : List ℕ, List.Perm primes p' ∧ sealedState p' = sealedState (extremalOrder primes) := sorry
/-- Global Extremal Theorem: extremalOrder minimizes sealedState. -/
theorem sealedState_min
    (primes : List ℕ) (hpos : ∀ p ∈ primes, 0 < p) (hge2 : ∀ p ∈ primes, 2 ≤ p) (hlen : 1 < primes.length) :
  ∀ p' : List ℕ, List.Perm primes p' → sealedState (extremalOrder primes) ≤ sealedState p' := by
  intro p' hp
  induction hp with
  | refl => apply Nat.le_refl
  | trans h1 h2 ih1 ih2 =>
    apply Nat.le_trans ih1 ih2
  | cons z hPerm ih =>
    -- This requires monotonicity of sealedState under cons, which follows from go_mono.
    sorry
  | swap x y xs =>
    have hx_le_y : x ≤ y ∨ y ≤ x := Nat.le_total x y
    cases hx_le_y with
    | inl hxy =>
      -- If x <= y: V(x, y) <= V(y, x). 
      -- If the list was y :: x :: xs, it was "further" from extremal order (since x is smaller).
      -- Wait, this logic is reversed.
      sorry
    | inr hyx =>
      sorry


/-- Helper definition: Canonical extremal order (maximum sealed state). -/
def extremalOrderMax (primes : List ℕ) : List ℕ :=
  let sorted := primes.sort (· ≤ ·)
  sorted.reverse.tail ++ [sorted.reverse.head!]

/-- Global Extremal Theorem: extremalOrderMax maximizes sealedState. -/
theorem sealedState_max
    (primes : List ℕ) (hpos : ∀ p ∈ primes, 0 < p) (hge2 : ∀ p ∈ primes, 2 ≤ p) (hlen : 1 < primes.length) :
  ∀ p' : List ℕ, List.Perm primes p' → sealedState p' ≤ sealedState (extremalOrderMax primes) := sorry


end ZMOS.Parm
