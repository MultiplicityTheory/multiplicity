import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.FreeMonoid.Basic
import Mathlib.Data.Multiset.Basic
import Mathlib.Algebra.BigOperators.Group.List
import Mathlib.Data.List.Perm.Basic
import Mathlib.Data.Nat.Factors
import Mathlib.Data.Nat.Factorization.Basic

/-!
# Multiplicity Operator Calculus (MOC) Foundations

This module formalizes the non-commutative operator word monoid W and its
relationship to the commutative prime product identity (PrimeWord).

In accordance with Issue #17:
h(w1) = h(w2) ↔ multiset(w1) = multiset(w2)
-/

/-- 
The alphabet of prime-indexed operators.
Each operator O_p is indexed by a unique prime p.
-/
def Operator := { p : ℕ // Nat.Prime p }

/--
The Non-Commutative Monoid of Operator Words W.
-/
def W := FreeMonoid Operator

/--
The Identity Homomorphism h: W -> (ℕ, *)
Maps an operator word to its unique integer identity value.
-/
def h (w : W) : ℕ :=
  (w.map (fun op => op.val)).prod

/--
Theorem: Prime-Indexed Identity Uniqueness.
Establishes the biconditional between identity equality (commutative)
and operator multiset equality (non-commutative composition invariant).

Note on Asymmetry:
- The (⇐) direction follows from the commutativity of ℕ multiplication.
- The (⇒) direction requires the uniqueness property of the Fundamental Theorem of Arithmetic.
-/
theorem prime_indexed_identity_uniqueness (w1 w2 : W) :
  h w1 = h w2 ↔ (w1.toList : Multiset Operator) = (w2.toList : Multiset Operator) := by
  constructor
  · intro heq
    have h_primes1 : ∀ p ∈ w1.toList.map (fun op => op.val), Nat.Prime p := by
      intro p hp
      rw [List.mem_map] at hp
      rcases hp with ⟨op, _, rfl⟩
      exact op.property
    have h_primes2 : ∀ p ∈ w2.toList.map (fun op => op.val), Nat.Prime p := by
      intro p hp
      rw [List.mem_map] at hp
      rcases hp with ⟨op, _, rfl⟩
      exact op.property
    have perm1 := Nat.primeFactorsList_unique rfl h_primes1
    have h_prod2 : List.prod (w2.toList.map (fun op => op.val)) = (w1.toList.map (fun op => op.val)).prod := by
      exact heq.symm
    have perm2 := Nat.primeFactorsList_unique h_prod2 h_primes2
    have perm_val : List.Perm (w1.toList.map (fun op => op.val)) (w2.toList.map (fun op => op.val)) :=
      perm1.trans perm2.symm
    have multiset_eq : (w1.toList.map (fun op => op.val) : Multiset ℕ) = (w2.toList.map (fun op => op.val) : Multiset ℕ) := by
      rwa [Multiset.coe_eq_coe]
    rw [← Multiset.map_coe, ← Multiset.map_coe] at multiset_eq
    have inj : Function.Injective (Multiset.map (fun (op : Operator) => op.val)) := Multiset.map_injective Subtype.val_injective
    exact inj multiset_eq
  · intro h_perm
    rw [Multiset.coe_eq_coe] at h_perm
    have h_perm_val : List.Perm (w1.toList.map (fun op => op.val)) (w2.toList.map (fun op => op.val)) := List.Perm.map (fun op => op.val) h_perm
    exact List.Perm.prod_eq h_perm_val

---

/--
The PrimeWord structure (Model of agi-os/moonshine/src/multiplicity_moonshine/prime_word.py).
Represents a monomial in the bosonic Fock space over primes.
Encoded as a list of exponents for a fixed set of primes.
-/
structure PrimeWord where
  exponents : List ℕ
  primes : List ℕ
  h_len : exponents.length = primes.length

/--
The Ω-grading (total degree) of a PrimeWord.
-/
def PrimeWord.omega (pw : PrimeWord) : ℕ :=
  pw.exponents.sum

/--
The integer value n = Π p_i^k_i.
-/
def PrimeWord.n (pw : PrimeWord) : ℕ :=
  List.zipWith (fun p k => p ^ k) pw.primes pw.exponents |>.prod

-- Helper theorems for prime_word_injectivity

theorem zipWith_prod_ne_zero
    (P : List ℕ) (h_primes : ∀ q ∈ P, Nat.Prime q)
    (e : List ℕ) (h_len : e.length = P.length) :
    (List.zipWith (fun p k => p ^ k) P e).prod ≠ 0 := by
  induction P generalizing e with
  | nil =>
    simp
  | cons p Ps ih =>
    rcases e with _ | ⟨k, ks⟩
    · simp at h_len
    · simp only [List.zipWith_cons_cons, List.prod_cons]
      have hp : Nat.Prime p := h_primes p (List.mem_cons_self _ _)
      have hp_ne_zero : p ≠ 0 := hp.ne_zero
      have hpk_ne_zero : p ^ k ≠ 0 := pow_ne_zero k hp_ne_zero
      have h_primes_Ps : ∀ q ∈ Ps, Nat.Prime q := fun q hq => h_primes q (List.mem_cons_of_mem p hq)
      have h_len_Ps : ks.length = Ps.length := by
        simp at h_len
        exact h_len
      have ih_Ps := ih h_primes_Ps ks h_len_Ps
      exact mul_ne_zero hpk_ne_zero ih_Ps

theorem not_dvd_zipWith_prod
    (p : ℕ) (hp : Nat.Prime p)
    (Ps : List ℕ) (h_primes : ∀ q ∈ Ps, Nat.Prime q) (h_not_in : ∀ q ∈ Ps, q ≠ p)
    (ks : List ℕ) (h_len : ks.length = Ps.length) :
    ¬ p ∣ (List.zipWith (fun p k => p ^ k) Ps ks).prod := by
  induction Ps generalizing ks with
  | nil =>
    simp only [List.zipWith_nil_left, List.prod_nil, Nat.dvd_one]
    exact hp.ne_one
  | cons q qs ih =>
    rcases ks with _ | ⟨m, ms⟩
    · simp at h_len
    · simp only [List.zipWith_cons_cons, List.prod_cons]
      intro h_dvd
      have h_primes_qs : ∀ x ∈ qs, Nat.Prime x := fun x hx => h_primes x (List.mem_cons_of_mem q hx)
      have h_not_in_qs : ∀ x ∈ qs, x ≠ p := fun x hx => h_not_in x (List.mem_cons_of_mem q hx)
      have h_len_qs : ms.length = qs.length := by
        simp at h_len
        exact h_len
      have ih_qs := ih h_primes_qs h_not_in_qs ms h_len_qs
      have hq_prime : Nat.Prime q := h_primes q (List.mem_cons_self _ _)
      have hq_ne_p : q ≠ p := h_not_in q (List.mem_cons_self _ _)
      have hp_dvd_or : p ∣ q ^ m ∨ p ∣ (List.zipWith (fun p k => p ^ k) qs ms).prod := by
        exact hp.dvd_mul.mp h_dvd
      rcases hp_dvd_or with hp_dvd_qm | hp_dvd_prod
      · have hp_dvd_q : p ∣ q := hp.dvd_of_dvd_pow hp_dvd_qm
        have hq_eq_p : q = p := (Nat.Prime.dvd_iff_eq hq_prime hp.ne_one).mp hp_dvd_q
        exact hq_ne_p hq_eq_p
      · exact ih_qs hp_dvd_prod

theorem factorization_step (p : ℕ) (hp : Nat.Prime p)
    (Ps : List ℕ) (h_primes_Ps : ∀ q ∈ Ps, Nat.Prime q) (h_not_in_Ps : ∀ q ∈ Ps, q ≠ p)
    (ks : List ℕ) (h_len_Ps : ks.length = Ps.length) (k : ℕ) :
    let X := (List.zipWith (fun p k => p ^ k) Ps ks).prod
    Nat.factorization (p^k * X) p = k := by
  intro X
  have hpk_ne : p^k ≠ 0 := pow_ne_zero k hp.ne_zero
  have hX_ne : X ≠ 0 := zipWith_prod_ne_zero Ps h_primes_Ps ks h_len_Ps
  have h_not_dvd : ¬ p ∣ X := not_dvd_zipWith_prod p hp Ps h_primes_Ps h_not_in_Ps ks h_len_Ps
  have hX_p_zero : Nat.factorization X p = 0 := Nat.factorization_eq_zero_of_not_dvd h_not_dvd
  have h_fac_mul : Nat.factorization (p^k * X) p = Nat.factorization (p^k) p + Nat.factorization X p := by
    rw [Nat.factorization_mul hpk_ne hX_ne, Finsupp.add_apply]
  have h_fac_pow : Nat.factorization (p^k) p = k := by
    rw [Nat.factorization_pow, Finsupp.smul_apply, hp.factorization_self, smul_eq_mul, mul_one]
  rw [h_fac_mul, h_fac_pow, hX_p_zero, add_zero]

/--
Theorem: Prime-Word Injectivity.
The mapping from a PrimeWord (with its exponent list) to its integer value n 
is injective given a fixed set of distinct primes.
This follows from the Fundamental Theorem of Arithmetic.
-/
theorem prime_word_injectivity
    (P : List ℕ) (h_primes : ∀ p ∈ P, Nat.Prime p) (h_distinct : P.Pairwise (· ≠ ·))
    (e1 e2 : List ℕ) (h_len1 : e1.length = P.length) (h_len2 : e2.length = P.length) :
    (PrimeWord.mk e1 P h_len1).n = (PrimeWord.mk e2 P h_len2).n → e1 = e2 := by
  induction P generalizing e1 e2 with
  | nil =>
    rcases e1 with _ | ⟨k, ks⟩
    · rcases e2 with _ | ⟨j, js⟩
      · intro _
        rfl
      · simp at h_len2
    · simp at h_len1
  | cons p Ps ih =>
    rcases e1 with _ | ⟨k, ks⟩
    · simp at h_len1
    · rcases e2 with _ | ⟨j, js⟩
      · simp at h_len2
      · dsimp [PrimeWord.n]
        intro heq
        have hp : Nat.Prime p := h_primes p (List.mem_cons_self _ _)
        have h_primes_Ps : ∀ q ∈ Ps, Nat.Prime q := fun q hq => h_primes q (List.mem_cons_of_mem p hq)
        have h_distinct_Ps : List.Pairwise (· ≠ ·) Ps := (List.pairwise_cons.mp h_distinct).2
        have h_not_in_Ps : ∀ q ∈ Ps, q ≠ p := fun q hq => ((List.pairwise_cons.mp h_distinct).1 q hq).symm
        have h_len_ks : ks.length = Ps.length := by
          simp at h_len1
          exact h_len1
        have h_len_js : js.length = Ps.length := by
          simp at h_len2
          exact h_len2
        have h_fac_eq : Nat.factorization (p^k * (List.zipWith (fun p k => p ^ k) Ps ks).prod) p =
                       Nat.factorization (p^j * (List.zipWith (fun p k => p ^ k) Ps js).prod) p := by
          rw [heq]
        have h_fac_L : Nat.factorization (p^k * (List.zipWith (fun p k => p ^ k) Ps ks).prod) p = k := by
          exact factorization_step p hp Ps h_primes_Ps h_not_in_Ps ks h_len_ks k
        have h_fac_R : Nat.factorization (p^j * (List.zipWith (fun p k => p ^ k) Ps js).prod) p = j := by
          exact factorization_step p hp Ps h_primes_Ps h_not_in_Ps js h_len_js j
        rw [h_fac_L, h_fac_R] at h_fac_eq
        rw [h_fac_eq] at heq
        have hpj_ne : p^j ≠ 0 := pow_ne_zero j hp.ne_zero
        have h_X_eq_Y : (List.zipWith (fun p k => p ^ k) Ps ks).prod = (List.zipWith (fun p k => p ^ k) Ps js).prod := by
          exact mul_left_cancel₀ hpj_ne heq
        have ih_inst := ih h_primes_Ps h_distinct_Ps ks js h_len_ks h_len_js h_X_eq_Y
        rw [h_fac_eq, ih_inst]
