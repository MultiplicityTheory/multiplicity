import MOC.Config
import MOC.Core
import MOC.Rewrites
import PIRTM.Transition
import PIRTM.SovereignBoundary

namespace CRMF

/-- Tier definition -/
inductive Tier where
  | L0 | L1 | L2 | L3 | L4
  deriving Repr, DecidableEq

/-- Sparse Polymorphic Multiplicity Density Matrix -/
structure SparsePMDM where
  data : List (Nat × Float)
  deriving Repr

/-- MTPI Witness: Evidence that the configuration decomposes into prime-indexed irreducibles -/
structure MTPIWitness {n : Nat} (cfg : MOC.Configuration n) where
  witness : String
  deriving Repr

/-- CRMF State -/
structure CRMFState {s : MOC.Schema} {last_seq : Nat} {v : MOC.ValidatedSchema s last_seq} {n : Nat} where
  config : MOC.Configuration n
  word : MOC.OperatorWord s last_seq v n
  multiplicityGain : Float
  tier : Tier
  pm : SparsePMDM
  dm : SparsePMDM
  resonanceScore : Float
  deriving Repr

/-- Resonance-gated update with explicit MTPI gate -/
def resonanceGatedUpdate 
  {last_seq : Nat} 
  (vs : MOC.VerifiedSchema last_seq) 
  [MOC.PermittedPrimes vs]
  {n : Nat}
  (state : CRMFState {s := vs.schema} {last_seq := last_seq} {v := vs} {n := n}) 
  (Δ : MOC.OperatorWord vs n) 
  (boundary : PIRTM.SovereignBoundary vs)
  (mtpi : MTPIWitness state.config)
  : Option (CRMFState {s := vs.schema} {last_seq := last_seq} {v := vs} {n := n} × PIRTM.StabilityCertificate vs) :=
  let nf := MOC.N state.config
  let new_cert : PIRTM.StabilityCertificate vs := MOC.stability_108_cycle
  if boundary.is_sovereign (new_cert) ∧ state.resonanceScore >= 0.5 ∧ mtpi.witness == "MTPI_VALID" then
    some (state, new_cert) 
  else
    none

end CRMF
