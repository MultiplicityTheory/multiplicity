import CRMF.Resonance
import PIRTM.Stability

namespace CRMF

/-- General stability theorem for arbitrary CRMF updates -/
theorem crmf_update_valid 
  {last_seq : Nat} 
  (vs : MOC.VerifiedSchema last_seq) 
  [MOC.PermittedPrimes vs]
  {n : Nat}
  (state : CRMFState {s := vs.schema} {last_seq := last_seq} {v := vs} {n := n})
  (Δ : MOC.OperatorWord vs n)
  (boundary : PIRTM.SovereignBoundary vs)
  (h_sovereign : boundary.is_sovereign MOC.stability_108_cycle)
  (h_res : state.resonanceScore >= 0.5)
  : ∃ (next_state : CRMFState {s := vs.schema} {last_seq := last_seq} {v := vs} {n := n}) 
      (cert : PIRTM.StabilityCertificate vs),
    resonanceGatedUpdate vs state Δ boundary = some (next_state, cert) :=
  by
    exists state
    exists MOC.stability_108_cycle
    simp [resonanceGatedUpdate, h_sovereign, h_res]

end CRMF
