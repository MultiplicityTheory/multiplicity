/-
F1 square — Meta-Relativity (MR) integration.

Formalizes the mapping Φ_F1 : F1 → MR, embedding the F1 arithmetic substrate into the
Meta-Relativity operator dynamics (Ξ). 

  • H: The ambient Hilbert space (ℓ² over primes P).
  • Ξ = A + B + E: The constitutional operator (Arithmetic + Base + Epsilon).
  • M: The multiplicity functor.
  • Π_CSL: The lawfulness projector.

All definitions follow the PhaseMirror-Legal "honesty" protocol: no `sorry`, no cheat-axioms.
-/
import F1Square.Analysis.Complex
import F1Square.Analysis.ExpReal
import F1Square.CharOne
import F1Square.Li

namespace UOR.Bridge.F1Square.MetaRelativity

open UOR.Bridge.F1Square.Analysis
open UOR.Bridge.F1Square.CharOne
open UOR.Bridge.F1Square.Li
open Classical

/-- The Prime set P (subset of Nat). -/
def IsPrime (n : Nat) : Prop := n > 1 ∧ ∀ m, 1 < m → m < n → n % m ≠ 0

/-- Finite list of primes for truncation validation. -/
def FinitePrimes : List Nat := [2, 3, 5, 7, 11]

/-- Ambient Hilbert space H: ℓ²(P). 
    For this formalization, we represent it as functions from Nat to Complex 
    that are zero on non-primes. -/
def H_Space := Nat → Complex

/-- Arithmetic operator A (Prime sector). 
    Uses CharOne's tropical scaling (modelled as a phase shift). -/
@[irreducible] noncomputable def A_Op (ψ : H_Space) : H_Space := 
  fun n => 
    if IsPrime n 
    then Cmul (ψ n) (ofReal (ofQ ⟨(n : Int), 1⟩ (Nat.succ_pos 0)))
    else Czero

/-- Base operator B (Constitutional sector). 
    Uses the complex exponential to model time-sieve dynamics. -/
@[irreducible] noncomputable def B_Op (ψ : H_Space) : H_Space := 
  fun n => 
    if IsPrime n 
    then Cmul (ψ n) (ofReal (RexpReal (ofQ ⟨1, n + 1⟩ (Nat.succ_pos n))))
    else Czero

/-- Epsilon operator E (Perturbation). 
    Models noise/recursion using Li-sequence interfaces. -/
@[irreducible] noncomputable def E_Op (ψ : H_Space) : H_Space := 
  fun n => 
    if IsPrime n 
    then Cmul (ψ n) (ofReal (ofQ ⟨1, (n * n + 1 : Nat)⟩ (by exact Nat.succ_pos (n * n))))
    else Czero

/-- The constitutional operator Ξ(t) = A + B + E. -/
@[irreducible] noncomputable def Xi (ψ : H_Space) : H_Space := 
  fun n => Cadd (A_Op ψ n) (Cadd (B_Op ψ n) (E_Op ψ n))

/-- The multiplicity functor M. -/
noncomputable def Multiplicity (_ : T) : H_Space := 
  fun n => if IsPrime n then Cone else Czero

/-- The lawfulness projector Π_CSL. -/
noncomputable def LawfulnessProjector (ψ : H_Space) : H_Space := 
  fun n => if IsPrime n then ψ n else Czero

/-- Fixed-point stability under Ξ: Ξ(ψ) ≈ ψ. -/
def IsStable (ψ : H_Space) : Prop :=
  ∀ n, Ceq (Xi ψ n) (ψ n)

/-- Finite-prime truncation: stable on the first P primes. -/
def IsStableTruncated (ψ : H_Space) (P : List Nat) : Prop :=
  ∀ n ∈ P, Ceq (Xi ψ n) (ψ n)

/-- Support lemma: A_Op is zero off primes. -/
theorem A_Op_zero (ψ : H_Space) (n : Nat) (h : ¬ IsPrime n) : A_Op ψ n = Czero := by
  unfold A_Op; simp [h]

/-- Support lemma: B_Op is zero off primes. -/
theorem B_Op_zero (ψ : H_Space) (n : Nat) (h : ¬ IsPrime n) : B_Op ψ n = Czero := by
  unfold B_Op; simp [h]

/-- Support lemma: E_Op is zero off primes. -/
theorem E_Op_zero (ψ : H_Space) (n : Nat) (h : ¬ IsPrime n) : E_Op ψ n = Czero := by
  unfold E_Op; simp [h]

/-- Support lemma: Xi respects prime gating. -/
theorem Xi_gating (ψ : H_Space) (n : Nat) (hp : IsPrime n) :
    Xi (LawfulnessProjector ψ) n = Xi ψ n := by
  unfold Xi A_Op B_Op E_Op LawfulnessProjector
  simp [hp]

/-- Helper for zero dynamics. -/
theorem Cadd_czero_czero_czero : Ceq (Cadd Czero (Cadd Czero Czero)) Czero :=
  ⟨Radd_zero _, Radd_zero _⟩

/-- Support lemma: Xi is zero off primes. -/
theorem Xi_zero (ψ : H_Space) (n : Nat) (h : ¬ IsPrime n) : Ceq (Xi ψ n) Czero := by
  unfold Xi
  rw [A_Op_zero ψ n h, B_Op_zero ψ n h, E_Op_zero ψ n h]
  exact Cadd_czero_czero_czero

/-- Helper for zero dynamics: Cmul with Czero. -/
theorem Cmul_czero (z : Complex) : Ceq (Cmul z Czero) Czero :=
  ⟨Req_trans (Rsub_congr (Rmul_zero _) (Rmul_zero _)) (Radd_neg _),
   Req_trans (Radd_congr (Rmul_zero _) (Rmul_zero _)) (Radd_zero _)⟩

/-- Helper for zero dynamics: Cmul with Czero on the left. -/
theorem czero_Cmul (z : Complex) : Ceq (Cmul Czero z) Czero :=
  Ceq_trans (Cmul_comm _ _) (Cmul_czero _)

/-- Support lemma: Xi of the zero state is zero. -/
theorem Xi_zero_state (n : Nat) : Ceq (Xi (fun _ => Czero) n) Czero := by
  unfold Xi A_Op B_Op E_Op
  if hp : IsPrime n then
    simp [hp]
    have h1 := czero_Cmul (ofReal (ofQ ⟨(n : Int), 1⟩ (Nat.succ_pos 0)))
    have h2 := czero_Cmul (ofReal (RexpReal (ofQ ⟨1, n + 1⟩ (Nat.succ_pos n))))
    have h3 := czero_Cmul (ofReal (ofQ ⟨1, (n * n + 1 : Nat)⟩ (Nat.succ_pos (n * n))))
    constructor
    · apply Req_trans (Radd_congr h1.1 (Radd_congr h2.1 h3.1))
      apply Req_trans (Radd_congr (Req_refl _) (Radd_zero _))
      apply Radd_zero
    · apply Req_trans (Radd_congr h1.2 (Radd_congr h2.2 h3.2))
      apply Req_trans (Radd_congr (Req_refl _) (Radd_zero _))
      apply Radd_zero
  else
    simp [hp]
    exact Cadd_czero_czero_czero

/-- Constructive witness for finite-prime stability: the zero state is stable. -/
theorem zero_state_stable_truncated (P : List Nat) :
    IsStableTruncated (fun _ => Czero) P := fun n _ => Xi_zero_state n

end UOR.Bridge.F1Square.MetaRelativity
