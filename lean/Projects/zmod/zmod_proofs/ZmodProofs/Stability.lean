import Mathlib.Data.Nat.Factorization
import Mathlib.Analysis.SpecialFunctions.Log.Basic

namespace ZMod

/-- Exponent of prime p in the prime factorization of t. -/
def nat_factor_exp (t : ℕ) (p : ℕ) : ℕ :=
  t.factorization p

/-- 
Multiplicity tensor state: Maps primes to their accumulated spectral interaction.
In Lean, we model this as a function from primes to ℝ. 
-/
def MultiplicityTensor := ℕ → ℝ

/-- 
Multiplicity-aware learning rate scaling factor Λ_m(t, mt).
This definition mirrors the Rust implementation's update logic.
-/
def lambda_m (t : ℕ) (mt : MultiplicityTensor) (primes : List ℕ) : ℝ :=
  let damping (p : ℕ) : ℝ := (1.0 + (mt p) / (Real.log (p : ℝ)))⁻¹
  primes.foldl (fun acc p => acc * (damping p) ^ (nat_factor_exp t p)) 1.0

end ZMod
