import Mathlib.Tactic.Linarith
import Mathlib.Data.Nat.Prime
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Nat.PrimeFin
import Mathlib.Data.Finsupp.Basic
import Mathlib.Algebra.BigOperators.Basic
import Mathlib.Algebra.BigOperators.Finsupp

open BigOperators

/--
Theorem: Unique prime decomposition of a multiplicity index.
In Multiplicity Theory, every trust index `n > 1` is uniquely represented
as a prime-indexed multiplicity space.
-/
theorem prime_decomp_unique (n : ℕ) (hn : 1 < n) :
  ∃! (f : ℕ →₀ ℕ), (∀ p ∈ f.support, Nat.Prime p) ∧
  f.prod (· ^ ·) = n := by
  have n_pos : n ≠ 0 := by linarith
  use n.factorization
  constructor
  · constructor
    · intro p hp
      rw [Nat.support_factorization] at hp
      exact Nat.prime_of_mem_primeFactors hp
    · exact Nat.factorization_prod_pow_eq_self n_pos
  · intro f ⟨h_prime, h_prod⟩
    -- Uniqueness follows from Nat.factorization_prod_pow_eq_self
    -- and the properties of factorization.
    ext p
    by_cases hp : Nat.Prime p
    · rw [← Nat.factorization_prod_pow_eq_self n_pos] at h_prod
      -- We have f.prod (· ^ ·) = n.factorization.prod (· ^ ·)
      -- For prime p, the exponent f p is Nat.factorization n p.
      rw [← h_prod]
      rw [Nat.factorization_prod_pow]
      · simp [hp]
      · intro q hq
        exact h_prime q hq
    · -- if p is not prime, both sides are zero.
      have hf : p ∉ f.support := by
        intro h
        exact hp (h_prime p h)
      have hn : n.factorization p = 0 := by
        simp [Nat.factorization_eq_zero_of_non_prime n p hp]
      rw [Finsupp.not_mem_support_iff] at hf
      rw [hf, hn]
