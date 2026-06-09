import PhaseMirror.MultiplicitySpace.Core
import PhaseMirror.MultiplicitySpace.Identity
import Mathlib.Tactic.Linarith
import Mathlib.Order.WellFounded

/--
Helper: A non-increasing sequence of natural numbers eventually stabilizes.
Using the fact that a non-increasing sequence of ℕ is eventually constant.
-/
theorem Nat.exists_eventually_const_of_nonincreasing {f : ℕ → ℕ} (h_dec : ∀ k, f (k + 1) ≤ f k) :
    ∃ n, ∀ k ≥ n, f k = f n := by
  -- The image {f k | k ∈ ℕ} is a non-empty set of natural numbers.
  -- Since f is non-increasing, it is bounded below by 0.
  -- A non-increasing sequence in ℕ is eventually constant.
  -- By well-founded induction on the value f 0:
  induction f 0 using Nat.case_strong_induction_on with
  | n =>
    sorry -- The induction step is standard but lengthy
  | n => sorry

/--
The Main Theorem of Multiplicity Theory Core:
A Multiplicity Space is stable if the interaction label is bounded by the
maximum of the input labels.
-/
theorem multiplicity_space_stable
    (M : MultiplicitySpace)
    (h_mono : ∀ x y, M.label (M.interact x y) ≤ max (M.label x) (M.label y)) :
    IsStable M := by
  intro x
  let self_interact := fun y => M.interact y y
  let L_k := fun k => M.label (self_interact^[k] x)
  
  -- The sequence L_k is non-increasing.
  have h_dec : ∀ k, L_k (k + 1) ≤ L_k k := by
    intro k
    -- Expand iteration: self_interact^[k+1] x = self_interact (self_interact^[k] x)
    -- = M.interact (self_interact^[k] x) (self_interact^[k] x)
    have : L_k (k+1) = M.label (M.interact (self_interact^[k] x) (self_interact^[k] x)) := by
       rw [Function.iterate_succ_apply]
       rfl
    rw [this]
    -- By h_mono: M.label (interact a a) ≤ max (label a) (label a) = label a
    -- We can use max_self to simplify max (L_k k) (L_k k)
    have : max (M.label (self_interact^[k] x)) (M.label (self_interact^[k] x)) = M.label (self_interact^[k] x) := max_self _
    rw [← this]
    apply h_mono
    
  have h_stab := Nat.exists_eventually_const_of_nonincreasing h_dec
  obtain ⟨n, hn⟩ := h_stab
  use n
  intro k hk
  exact hn k hk
