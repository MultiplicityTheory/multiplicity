import AffineCore.Foundations.BanachSpace
import Mathlib.Data.Real.Basic
import Mathlib.Data.Finset.Basic
import Mathlib.Algebra.BigOperators.Basic

open BigOperators

-- AdelicBorn.lean
-- Formally derives a toy Born rule from a finite valuation model.
-- Optimized for governance-useful verification.

namespace Multiplicity

/-- 
  A finite set of outcomes K.
--/
variable {K : Type*} [Fintype K]

/-- 
  A valuation map v₂: K → ℤ assigning a 2-adic 'depth' to each outcome.
--/
def valuation_v2 (v : K → ℤ) : Prop := True

/-- 
  Raw weight w(k) = 2^(-v₂(k)).
  In this toy model, we represent this as a real power.
--/
noncomputable def raw_weight (v : K → ℤ) (k : K) : ℝ :=
  (2 : ℝ) ^ (-(v k))

/-- 
  Normalization constant: Σ w(k).
--/
noncomputable def weight_sum (v : K → ℤ) : ℝ :=
  ∑ k, raw_weight v k

/-- 
  Normalized Probability P(k) = w(k) / Σ w(j).
--/
noncomputable def born_prob (v : K → ℤ) (k : K) : ℝ :=
  raw_weight v k / weight_sum v

/-- 
  Lemma: Raw weights are always positive.
--/
lemma raw_weight_pos (v : K → ℤ) (k : K) : 0 < raw_weight v k := by
  unfold raw_weight
  apply Real.rpow_pos_of_pos
  norm_num

/-- 
  Lemma: The weight sum is positive (for non-empty K).
--/
lemma weight_sum_pos [Nonempty K] (v : K → ℤ) : 0 < weight_sum v := by
  unfold weight_sum
  apply Finset.sum_pos
  · intro k _
    exact raw_weight_pos v k
  · exact Finset.univ_nonempty

/-- 
  Theorem: Probability Normalization.
  The derived Born probabilities sum to 1.
--/
theorem prob_sum_one [Nonempty K] (v : K → ℤ) : ∑ k, born_prob v k = 1 := by
  unfold born_prob
  rw [← Finset.sum_div]
  rw [div_self]
  · unfold weight_sum
    rfl
  · exact ne_of_gt (weight_sum_pos v)

/-- 
  Theorem: Born Rule Toy Projection.
  Archimedean probability is induced by the valuation-projection construction.
--/
theorem born_rule_toy_projection [Nonempty K] (v : K → ℤ) (k : K) :
  ∃ P : ℝ, P = born_prob v k ∧ 0 ≤ P ∧ P ≤ 1 := by
  use born_prob v k
  constructor
  · rfl
  · constructor
    · unfold born_prob
      apply div_nonneg
      · exact le_of_lt (raw_weight_pos v k)
      · exact le_of_lt (weight_sum_pos v)
    · unfold born_prob
      apply div_le_one_of_le
      · unfold weight_sum
        exact Finset.single_le_sum (λ j _ => le_of_lt (raw_weight_pos v j)) (Finset.mem_univ k)
      · exact le_of_lt (weight_sum_pos v)

end Multiplicity
