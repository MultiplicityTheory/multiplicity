/-
F1 square — the frame morphism Φ_F1 : F1 → MR.

Maps the F1 arithmetic substrate (intersection theory, Li-criterion) to the
Meta-Relativity (MR) operator dynamics and stability invariants.

  • Φ_P: Maps a Polarized lattice P in F1 maps to a stability condition in MR.
  • Φ_Li: Maps the Li-positivity guard to an MR budget constraint.

Metric: spectral inclusion holds under bounded perturbation.
-/

import F1Square.MetaRelativity.Basic
import F1Square.Crux
import F1Square.Li

set_option maxHeartbeats 10000000

namespace UOR.Bridge.F1Square.MetaRelativity

open UOR.Bridge.F1Square.Analysis
open UOR.Bridge.F1Square.Crux
open UOR.Bridge.F1Square.Li

/-- Helper: Cadd with Czero is identity (up to Ceq). -/
theorem Cadd_czero (z : Complex) : Ceq (Cadd z Czero) z :=
  ⟨Radd_zero _, Radd_zero _⟩

/-- Spectral inclusion: Stable states are supported on the prime sector. -/
theorem stable_supported_on_primes (ψ : H_Space) (h : IsStable ψ) :
    ∀ n, ¬ IsPrime n → Ceq (ψ n) Czero := fun n hnp =>
  Ceq_trans (Ceq_symm (h n)) (Xi_zero ψ n hnp)

/-- Spectral inclusion lemma: stability is preserved under the lawfulness projector. -/
theorem spectral_inclusion (ψ : H_Space) (h : IsStable ψ) :
    IsStable (LawfulnessProjector ψ) := by
  intro n
  if hp : IsPrime n then
    have hxi : Ceq (Xi (LawfulnessProjector ψ) n) (Xi ψ n) := by
      rw [Xi_gating ψ n hp]
      apply Ceq_refl
    have hproj : Ceq (ψ n) (LawfulnessProjector ψ n) := by
      unfold LawfulnessProjector; simp [hp]
      apply Ceq_refl
    exact Ceq_trans hxi (Ceq_trans (h n) hproj)
  else
    have hxi : Ceq (Xi (LawfulnessProjector ψ) n) Czero := Xi_zero _ n hp
    have hproj : Ceq Czero (LawfulnessProjector ψ n) := by
      unfold LawfulnessProjector; simp [hp]
      apply Ceq_refl
    apply Ceq_trans hxi hproj

/-- Morphism Φ_P: A Polarized lattice P in F1 maps to a stability condition in MR.
    Hodge-index positivity on P becomes fixed-point stability under Ξ. -/
def Phi_P (P : Polarized) (ψ : H_Space) : Prop :=
  HodgeIndex P → IsStable ψ

/-- Morphism Φ_Li: The Li-positivity guard in F1 maps to an MR gap/slope budget.
    Positivity of the Li sequence (RH) is the analytic face of stability. -/
def Phi_Li (lam : Nat → ExactBoundedReal) (ψ : H_Space) : Prop :=
  LiPositive lam → IsStable ψ

/-- Morphism Φ_F1: The combined frame morphism. -/
structure Phi_F1 where
  polarized_to_stable : Polarized → H_Space → Prop
  li_to_stable : (Nat → ExactBoundedReal) → H_Space → Prop

/-- The canonical frame morphism instance. -/
def canonical_Phi : Phi_F1 where
  polarized_to_stable := Phi_P
  li_to_stable := Phi_Li

end UOR.Bridge.F1Square.MetaRelativity
