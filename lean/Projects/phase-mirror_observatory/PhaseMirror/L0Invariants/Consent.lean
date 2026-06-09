import Mathlib.Order.Basic

/--
An abstract type for Agent Identifiers.
-/
axiom AgentId : Type

/--
L0 Invariant: Consent Monotonicity.
Consent is a monotone boolean function over time.
-/
structure ConsentHistory where
  -- Given an agent and a timestamp, was consent active?
  active : AgentId → ℕ → Prop
  -- Monotonicity: if active at time t, it remains active for all t' ≥ t
  monotone : ∀ a t t', t ≤ t' → active a t → active a t'

/--
Theorem: Once consent is given, it cannot be revoked within the L0 envelope.
-/
theorem consent_non_revocable (h : ConsentHistory) (a : AgentId) (t t' : ℕ) (ht : t ≤ t') :
    h.active a t → h.active a t' :=
  h.monotone a t t' ht

/--
Refining with an inductive state to show that a 'Revoked' state is unreachable
if the transition system follows the monotonicity invariant.
-/
inductive ConsentState
  | NotGiven
  | Given

def next_state (current : ConsentState) (action_give : Bool) : ConsentState :=
  match current, action_give with
  | ConsentState.NotGiven, true  => ConsentState.Given
  | ConsentState.NotGiven, false => ConsentState.NotGiven
  | ConsentState.Given,    _     => ConsentState.Given

theorem once_given_always_given (s : ConsentState) (action : Bool) :
    s = ConsentState.Given → next_state s action = ConsentState.Given := by
  intro h
  rw [h]
  simp [next_state]

/--
A Quorum is a set of agents.
-/
def Quorum := Set AgentId

/--
A quorum is active if ALL members in the quorum have active consent.
This represents a joint PLIC (Prime-Lawful Invariant Contract).
-/
def quorum_active (h : ConsentHistory) (q : Quorum) (t : ℕ) : Prop :=
  ∀ a ∈ q, h.active a t

/--
Theorem: Quorum consent is also monotone over time.
If a quorum is active at time t, it remains active for all t' ≥ t.
-/
theorem quorum_consent_monotone (h : ConsentHistory) (q : Quorum) (t t' : ℕ) (ht : t ≤ t') :
    quorum_active h q t → quorum_active h q t' := by
  intro hq a ha
  apply h.monotone a t t' ht
  exact hq a ha

/--
Theorem: Composition of quorums.
The union of two active quorums is also active.
-/
theorem active_quorum_union (h : ConsentHistory) (q1 q2 : Quorum) (t : ℕ) :
    quorum_active h q1 t → quorum_active h q2 t → quorum_active h (q1 ∪ q2) t := by
  intro hq1 hq2 a ha
  cases ha with
  | inl h1 => exact hq1 a h1
  | inr h2 => exact hq2 a h2

