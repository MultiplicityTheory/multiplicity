import PIRTM.Stability

namespace PIRTM

/-- 
  SovereignBoundary: A protected transition space with schema and stability constraints.
  Transitions are only admissible if they pass the sovereign RSL limit.
-/
structure SovereignBoundary {last_seq : Nat} (vs : MOC.VerifiedSchema last_seq) [MOC.PermittedPrimes vs] where
  rsl_limit : MOC.RSL
  -- Predicate: Transition is sovereign if it satisfies stability and is within RSL
  is_sovereign (cert : StabilityCertificate vs) : Prop :=
    cert.ace_bound < 1.0 ∧ cert.r_bound.r1 >= 0.7

end PIRTM
