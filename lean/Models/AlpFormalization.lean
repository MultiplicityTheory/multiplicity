/-
Formalization of ALP (Atomic Language Processing) invariants.
Target: Injectivity of the Grapheme-to-Prime mapping.
-/

import Mathlib.Data.List.Basic
import Mathlib.Data.Nat.Prime

/-!
### 1. Mapping Definition
We represent the grapheme mapping as a function from a Type (representing Graphemes) to Primes.
-/

variable {Grapheme : Type}

structure Decomposer (Grapheme : Type) where
  map : Grapheme → ℕ
  is_prime : ∀ g, Nat.Prime (map g)

/-!
### 2. Injectivity Invariant
A critical safety property is that the decomposition is reversible/deterministic, 
which requires the mapping to be injective (distinct graphemes map to distinct primes).
-/

theorem injectivity_of_mapping {G : Type} (d : Decomposer G) 
  (h_inj : Function.Injective d.map) (g1 g2 : G) :
  d.map g1 = d.map g2 → g1 = g2 := by
  apply h_inj

/-!
### 3. Prime Invariant
Ensuring all mapped values are indeed primes.
-/
theorem mapping_is_prime {G : Type} (d : Decomposer G) (g : G) :
  Nat.Prime (d.map g) := by
  apply d.is_prime
