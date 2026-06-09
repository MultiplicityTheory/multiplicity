import Mathlib.Analysis.NormedSpace.OperatorNorm
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Topology.MetricSpace.Contracting
import Mathlib.Topology.MetricSpace.Lipschitz
import Mathlib.Topology.MetricSpace.ContractingMap
import Mathlib.Analysis.HilbertSpace.HilbertSchmidt
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.NumberTheory.Primorial

-- The ambient space: a complex Banach space
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

-- State trajectory type
def StateSeq (E : Type*) := ℕ → E

/--
The central claim of the Affine Core: existence of a stable trajectory.
This file sets up the Banach space foundations and Mathlib4 linkages.
-/
