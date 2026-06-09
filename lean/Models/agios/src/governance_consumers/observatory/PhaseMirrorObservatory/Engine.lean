import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Analysis.Normed.MulAction
import Mathlib.Topology.MetricSpace.Contracting
import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Order.FixedPoints
import Mathlib.Data.Real.Basic

/-!
Multiplicity Engine: Concrete Contraction Proof.
This file proves that the update law is a contraction given Lipschitz bounds
on the components Xi and T, and a sufficient bound on Lambda.
-/

namespace MultiplicityEngine

open scoped NNReal

/--
The composite Lipschitz bound for the multiplicity update.
If `L_Xi + |lambda| * L_T < 1`, the update is a contraction.
-/
def compositeBound (L_Xi L_T : ℝ≥0) (lambda : ℝ) : ℝ :=
  (L_Xi : ℝ) + |lambda| * (L_T : ℝ)

/--
Theorem: The multiplicity update law is a contraction if the composite bound is < 1.
-/
theorem update_is_contracting
    {E : Type _} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (Xi T : E → E) (lambda : ℝ)
    (L_Xi L_T : ℝ≥0)
    (h_Xi : LipschitzWith L_Xi Xi)
    (h_T : LipschitzWith L_T T)
    (h_bound : compositeBound L_Xi L_T lambda < 1) :
    ∃ K : ℝ≥0, ContractingWith K (fun x => Xi x + lambda • T x) := by
  -- 1. Convert the composite bound to NNReal
  let lambda_abs := |lambda|
  let K_val : ℝ := (L_Xi : ℝ) + lambda_abs * (L_T : ℝ)
  have h_K_pos : 0 ≤ K_val := by
    apply add_nonneg
    · exact L_Xi.coe_nonneg
    · apply mul_nonneg (abs_nonneg _) L_T.coe_nonneg
  let K : ℝ≥0 := ⟨K_val, h_K_pos⟩
  
  -- 2. Prove the map is Lipschitz with K
  have h_lipschitz : LipschitzWith K (fun x => Xi x + lambda • T x) := by
    -- LipschitzWith (|lambda| * L_T) (lambda • T)
    have h_smul : LipschitzWith (‖lambda‖₊ * L_T) (fun x => lambda • T x) := by
      exact (lipschitzWith_smul lambda).comp h_T
    -- Since ||lambda||₊ = |lambda|, the constants match
    apply LipschitzWith.add h_Xi h_smul

  -- 3. Show K < 1 and conclude
  have h_K_lt_1 : K < 1 := h_bound
  exact ⟨K, h_K_lt_1, h_lipschitz⟩

/--
Main Convergence Result:
Given a complete normed space, the multiplicity update law has a unique fixed point.
-/
theorem multiplicity_convergence
    {E : Type _} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Nonempty E]
    (Xi T : E → E) (lambda : ℝ)
    (L_Xi L_T : ℝ≥0)
    (h_Xi : LipschitzWith L_Xi Xi)
    (h_T : LipschitzWith L_T T)
    (h_bound : compositeBound L_Xi L_T lambda < 1) :
    ∃! x : E, Xi x + lambda • T x = x := by
  rcases update_is_contracting Xi T lambda L_Xi L_T h_Xi h_T h_bound with ⟨K, h_contracting⟩
  refine ⟨ContractingWith.fixedPoint _ h_contracting, 
         ContractingWith.fixedPoint_isFixedPt h_contracting, 
         fun x hx => ?_⟩
  exact ContractingWith.fixedPoint_unique h_contracting hx

end MultiplicityEngine
