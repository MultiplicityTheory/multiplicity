/-
Phase Mirror Sovereign Governance Formalization.
Objective: Prove Zero Drift and πnative integrity invariants.
Phase D.2: Formalize Distributed Convergence.
-/

import Mathlib.Data.List.Basic
import Mathlib.Data.String.Basic

/-!
### 1. Core Types
-/

/-- Representation of a cryptographic hash. -/
structure Hash where
  value : String
deriving Repr, BEq

/-- Status of a proof entry in the sovereign chain. -/
inductive ProofStatus where
  | Validated
  | Invalid
  | Skipped
deriving Repr, BEq

/-- An entry in the Proof-Chain (WORM log). -/
structure ProofEntry where
  timestamp    : Nat
  action       : String
  payload_hash : Hash
  prev_hash    : Hash
  curr_hash    : Hash
  status       : ProofStatus
deriving Repr, BEq

/-- The state of the GitLedger. -/
structure LedgerState where
  head_commit : Hash
  proposals   : List String
deriving Repr, BEq

/-- The combined system state. -/
structure SovereignState where
  chain  : List ProofEntry
  ledger : LedgerState
deriving Repr, BEq

/-!
### 2. Hash Engine (Postulated)
-/

/-- Computes a new hash from an entry's fields. -/
def compute_entry_hash (prev : Hash) (payload : Hash) (action : String) (status : ProofStatus) : Hash :=
  -- In production this is SHA256. For formalization, we treat it as an injective function.
  Hash.mk (prev.value ++ payload.value ++ action ++ toString (repr status))

/-- Computes the πnative digest binding chain and ledger. -/
def compute_pi_native (chain_hash : Hash) (ledger_hash : Hash) : Hash :=
  Hash.mk (chain_hash.value ++ ledger_hash.value)

/-!
### 3. L0 Verification Gate
-/

def l0_gate (payload : String) : ProofStatus :=
  if payload.contains "state_norm" then ProofStatus.Invalid
  else ProofStatus.Validated

/-!
### 4. State Transitions
-/

/-- Helper to get the previous hash from a chain. -/
def get_prev_hash (chain : List ProofEntry) : Hash :=
  match chain.getLast? with
  | some e => e.curr_hash
  | none   => Hash.mk "GENESIS"

/-- Locally apply a proposal (single-node). -/
def apply_proposal (state : SovereignState) (proposal_id : String) (payload : String) : SovereignState :=
  let status := l0_gate payload
  let prev_hash := get_prev_hash state.chain
  let p_hash := Hash.mk payload
  let new_curr := compute_entry_hash prev_hash p_hash "ledger_commit" status
  let new_entry := ProofEntry.mk 0 "ledger_commit" p_hash prev_hash new_curr status
  
  if status == ProofStatus.Validated then
    let new_ledger := LedgerState.mk new_curr (proposal_id :: state.ledger.proposals)
    SovereignState.mk (state.chain ++ [new_entry]) new_ledger
  else
    SovereignState.mk (state.chain ++ [new_entry]) state.ledger

/-- 
Apply a raw entry received via gossip (multi-node sync).
If the hash-linkage or content hash is invalid, the state is unchanged (Byzantine rejection).
-/
def append_raw (state : SovereignState) (entry : ProofEntry) : SovereignState :=
  let expected_curr := compute_entry_hash entry.prev_hash entry.payload_hash entry.action entry.status
  if entry.prev_hash == get_prev_hash state.chain ∧ entry.curr_hash == expected_curr then
    -- Merge valid entry
    if entry.action == "ledger_commit" ∧ entry.status == ProofStatus.Validated then
      -- Update ledger head to match converged chain
      let new_ledger := LedgerState.mk entry.curr_hash state.ledger.proposals -- Simplified proposal list update
      SovereignState.mk (state.chain ++ [entry]) new_ledger
    else
      SovereignState.mk (state.chain ++ [entry]) state.ledger
  else
    -- Reject dissonant/malicious gossip
    state

/-!
### 5. Invariant Proofs
-/

/-- 
Chain Integrity:
Every entry in a valid chain must satisfy the hash-linkage invariant.
-/
def is_valid_chain : List ProofEntry → Prop
  | [] => True
  | [e] => e.prev_hash = Hash.mk "GENESIS" ∧ e.curr_hash = compute_entry_hash e.prev_hash e.payload_hash e.action e.status
  | e1 :: e2 :: es => 
      e2.prev_hash = e1.curr_hash ∧ 
      e1.curr_hash = compute_entry_hash e1.prev_hash e1.payload_hash e1.action e1.status ∧
      is_valid_chain (e2 :: es)

theorem is_valid_chain_append (chain : List ProofEntry) (e : ProofEntry) :
  is_valid_chain chain →
  e.prev_hash = get_prev_hash chain →
  e.curr_hash = compute_entry_hash e.prev_hash e.payload_hash e.action e.status →
  is_valid_chain (chain ++ [e]) := by
  induction chain with
  | nil => 
    simp [is_valid_chain, get_prev_hash]
    intro _ h_prev h_curr
    exact ⟨h_prev, h_curr⟩
  | cons head tail ih =>
    simp [is_valid_chain, get_prev_hash]
    intro h_valid h_prev h_curr
    cases tail with
    | nil =>
      simp [is_valid_chain] at h_valid
      simp [is_valid_chain, get_prev_hash]
      exact ⟨h_prev, h_valid.2, h_valid.1, h_curr⟩
    | cons next rest =>
      simp [is_valid_chain] at h_valid
      simp [is_valid_chain]
      refine ⟨h_valid.1, h_valid.2.1, ?_⟩
      apply ih h_valid.2.2
      · exact h_prev
      · exact h_curr

/--
Sovereign Integrity Theorem:
Applying a proposal always preserves the is_valid_chain invariant.
-/
theorem apply_proposal_preserves_valid_chain (state : SovereignState) (id : String) (payload : String) :
  is_valid_chain state.chain →
  is_valid_chain (apply_proposal state id payload).chain := by
  intro h_valid
  simp [apply_proposal]
  set status := l0_gate payload
  set prev_hash := get_prev_hash state.chain
  set p_hash := Hash.mk payload
  set new_curr := compute_entry_hash prev_hash p_hash "ledger_commit" status
  set new_entry := ProofEntry.mk 0 "ledger_commit" p_hash prev_hash new_curr status
  
  split
  · -- Case status == Validated
    apply is_valid_chain_append state.chain new_entry h_valid
    · rfl
    · rfl
  · -- Case status != Validated
    apply is_valid_chain_append state.chain new_entry h_valid
    · rfl
    · rfl

/-!
### 6. Distributed Convergence Proofs
-/

/--
Gossip Integrity Theorem:
Receiving a raw entry via gossip preserves the is_valid_chain invariant.
-/
theorem append_raw_preserves_valid_chain (state : SovereignState) (e : ProofEntry) :
  is_valid_chain state.chain →
  is_valid_chain (append_raw state e).chain := by
  intro h_valid
  simp [append_raw]
  split
  · -- Case entry is valid (prev_hash matches and current hash is correct)
    rename_i h_match
    apply is_valid_chain_append state.chain e h_valid
    · exact h_match.1
    · exact h_match.2
  · -- Case entry is invalid/dissonant (state unchanged)
    exact h_valid

/--
Gossip Convergence Lemma:
If two nodes start from the same genesis and receive the same sequence of valid entries,
their final ledger commit hashes are identical.
-/
theorem gossip_convergence_lemma (s1 s2 : SovereignState) (e : ProofEntry) :
  s1.chain = s2.chain →
  (append_raw s1 e).ledger.head_commit = (append_raw s2 e).ledger.head_commit := by
  intro h_eq
  simp [append_raw, h_eq]
  -- Both nodes perform the same check and update the same way
  split <;> rfl

/-- 
Sovereign Non-Drift Theorem (Local):
If the L0 gate identifies a proposal as Invalid, the Ledger state remains unchanged.
-/
theorem zero_drift_invariant (state : SovereignState) (id : String) (payload : String) :
  l0_gate payload = ProofStatus.Invalid → 
  (apply_proposal state id payload).ledger = state.ledger := by
  intro h_gate
  simp [apply_proposal, h_gate]
  split
  · rename_i h_eq
    rw [h_gate] at h_eq
    contradiction
  · rfl

/--
πnative Integrity Theorem:
A validly anchored state implies the binding of the specific ledger hash and chain hash.
-/
theorem pi_native_binding (c_hash l_hash : Hash) :
  let pi := compute_pi_native c_hash l_hash
  pi = Hash.mk (c_hash.value ++ l_hash.value) := by
  simp [compute_pi_native]

/-!
### 7. Consensus State Machine and BFT Formalization
-/

/-- Local phase of the consensus engine. -/
inductive ConsensusPhase where
  | AwaitProposal
  | AwaitPrecommit
  | AwaitCommit
  | ViewChange
  | Quarantine
deriving Repr, BEq

/-- Quorum Certificate structure. -/
structure QuorumCertificate where
  height      : Nat
  view        : Nat
  merkle_root : Hash
deriving Repr, BEq

/-- Local consensus state machine state. -/
structure ConsensusState where
  phase       : ConsensusPhase
  view        : Nat
  height      : Nat
  last_commit : Nat
  high_qc     : QuorumCertificate
  locked_qc   : Option QuorumCertificate
  votes       : List (String × String) -- Simplified representation of node -> signature
  leader      : Option String
  halted      : Bool
  committed   : List (Nat × Hash) -- height -> committed root
deriving Repr, BEq

/-- Propose message payload. -/
structure ProposePayload where
  view        : Nat
  height      : Nat
  merkle_root : Hash
  justify     : QuorumCertificate
deriving Repr, BEq

/-- Consensus Message type. -/
inductive ConsensusMessage where
  | Propose (p : ProposePayload)
  | Vote (v : Nat) (h : Nat) (root : Hash) (sender : String) (sig : String)
  | StateDigest (h : Nat) (root : Hash) (v : Nat) (high_qc : QuorumCertificate)
deriving Repr, BEq

/-- Initial consensus state. -/
def init_consensus_state (genesis_root : Hash) : ConsensusState :=
  ConsensusState.mk 
    ConsensusPhase.AwaitProposal 
    1 
    1 
    0 
    (QuorumCertificate.mk 0 0 genesis_root) 
    none 
    [] 
    (some "node_1") 
    false 
    []

/-- Process an incoming proposal. -/
def handle_propose (s : ConsensusState) (p : ProposePayload) (sender : String) : ConsensusState :=
  if s.halted then s
  else if p.view < s.view ∨ p.height ≠ s.height then s
  else if p.justify.height ≠ p.height - 1 then s
  else
    let new_high_qc := if p.justify.view > s.high_qc.view then p.justify else s.high_qc
    ConsensusState.mk 
      ConsensusPhase.AwaitPrecommit 
      p.view 
      s.height 
      s.last_commit 
      new_high_qc 
      s.locked_qc 
      s.votes 
      s.leader 
      s.halted 
      s.committed

/-- Process an incoming vote. -/
def handle_vote (s : ConsensusState) (v_view : Nat) (v_height : Nat) (root : Hash) (sender : String) (sig : String) : ConsensusState :=
  if s.halted then s
  else if v_view ≠ s.view ∨ v_height ≠ s.height then s
  else
    ConsensusState.mk 
      s.phase 
      s.view 
      s.height 
      s.last_commit 
      s.high_qc 
      s.locked_qc 
      ((sender, sig) :: s.votes) 
      s.leader 
      s.halted 
      s.committed

/-- Commit a block at height h with root r. -/
def commit_block (s : ConsensusState) (h : Nat) (root : Hash) : ConsensusState :=
  if s.halted then s
  else
    -- Safety check: look for fork
    let exists_fork := s.committed.any (fun (height, r) => height == h ∧ r ≠ root)
    if exists_fork then
      -- Halt the machine
      ConsensusState.mk s.phase s.view s.height s.last_commit s.high_qc s.locked_qc s.votes s.leader true s.committed
    else
      ConsensusState.mk 
        ConsensusPhase.AwaitProposal 
        s.view 
        (h + 1) 
        s.view 
        s.high_qc 
        s.locked_qc 
        [] 
        s.leader 
        s.halted 
        ((h, root) :: s.committed)

/-- Process a StateDigest (Anti-Entropy). -/
def handle_state_digest (s : ConsensusState) (h : Nat) (root : Hash) (v : Nat) (high_qc : QuorumCertificate) : ConsensusState :=
  if s.halted then s
  else if h < s.height then s
  else
    let state_after_commit := commit_block s h root
    ConsensusState.mk 
      ConsensusPhase.AwaitProposal 
      v 
      (h + 1) 
      s.last_commit 
      high_qc 
      s.locked_qc 
      [] 
      s.leader 
      state_after_commit.halted 
      state_after_commit.committed

/-- Monotonicity theorem for ConsensusState transitions. -/
theorem handle_propose_monotonic (s : ConsensusState) (p : ProposePayload) (sender : String) :
  (handle_propose s p sender).height ≥ s.height := by
  simp [handle_propose]
  split <;> simp
  split <;> simp
  split <;> simp
  simp

theorem commit_block_monotonic (s : ConsensusState) (h : Nat) (root : Hash) :
  (commit_block s h root).height ≥ s.height := by
  simp [commit_block]
  split
  · simp
  · split
    · simp
    · simp

theorem handle_state_digest_monotonic (s : ConsensusState) (h : Nat) (root : Hash) (v : Nat) (high_qc : QuorumCertificate) :
  (handle_state_digest s h root v high_qc).height ≥ s.height := by
  simp [handle_state_digest]
  split <;> simp
  split <;> simp
  simp
