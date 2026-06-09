/-
Operator Lie Grammar & Bounded Reconstruction Asymmetry (BRA) Formalization.
Objective: Prove the Order Divergence Invariant, Metric Split, and Geometry-First Separation.
-/

import Mathlib.Algebra.Lie.Basic
import Mathlib.Data.Real.Basic

/-- The Coupling Mode of the generator embedding. -/
inductive CouplingMode where
  | full
  | partialMode

/-- The structure defining our specific generator configuration. -/
structure GeneratorSet (L : Type*) [LieRing L] [LieAlgebra ℝ L] where
  P2 : L
  P3 : L
  Q1 : L
  -- In partial decoupling mode, P2 and Q1 commute.
  partial_decouple : ⁅P2, Q1⁆ = 0
  -- In full cross-coupling mode, P2 and Q1 do not commute.
  full_couple : ⁅P2, Q1⁆ ≠ 0

/-- 
LieExpr captures the syntactic construction of an element to track metadata.
-/
inductive LieExpr (L : Type*) where
  | gen (name : String) (val : L)
  | add (e1 e2 : LieExpr L)
  | sub (e1 e2 : LieExpr L)
  | smul (s : ℝ) (e : LieExpr L)
  | bracket (e1 e2 : LieExpr L)

/-- Evaluate a LieExpr into the concrete Lie Algebra L. -/
def eval {L : Type*} [LieRing L] [LieAlgebra ℝ L] : LieExpr L → L
  | .gen _ v => v
  | .add e1 e2 => (eval e1) + (eval e2)
  | .sub e1 e2 => (eval e1) - (eval e2)
  | .smul s e => s • (eval e)
  | .bracket e1 e2 => ⁅eval e1, eval e2⁆

/-- 
Structural Depth (D): Measures non-zero commutator nesting.
Vanishes if the commutator resolves to zero.
-/
def structural_depth {L : Type*} [LieRing L] [LieAlgebra ℝ L] [DecidableEq L] : LieExpr L → ℕ
  | .gen _ _ => 0
  | .add e1 e2 => max (structural_depth e1) (structural_depth e2)
  | .sub e1 e2 => max (structural_depth e1) (structural_depth e2)
  | .smul _ e => structural_depth e
  | .bracket e1 e2 => 
    if eval (.bracket e1 e2) = 0 then 0 
    else (structural_depth e1) + (structural_depth e2) + 1

/-- 
Syntactic Complexity (S): Measures the total size of the expression tree.
Does not vanish when algebra vanishes.
-/
def syntactic_complexity {L : Type*} : LieExpr L → ℕ
  | .gen _ _ => 1
  | .add e1 e2 => (syntactic_complexity e1) + (syntactic_complexity e2)
  | .sub e1 e2 => (syntactic_complexity e1) + (syntactic_complexity e2)
  | .smul _ e => syntactic_complexity e
  | .bracket e1 e2 => (syntactic_complexity e1) + (syntactic_complexity e2) + 1

/-- 
BRA Cost Functional (Control-Gated):
C(W) = length + alpha * D + beta * Q
-/
noncomputable def bra_cost {L : Type*} [LieRing L] [LieAlgebra ℝ L] [DecidableEq L] 
  (len : ℕ) (expr : LieExpr L) (q_count : ℕ) (alpha beta : ℝ) : ℝ :=
  (len : ℝ) + alpha * (structural_depth expr : ℝ) + beta * (q_count : ℝ)

/- BCH Expansion Terms as LieExpr -/

def expr_term_2 {L : Type*} (X Y : LieExpr L) : LieExpr L :=
  .smul (2 : ℝ)⁻¹ (.bracket X Y)

def expr_term_3 {L : Type*} (X Y : LieExpr L) : LieExpr L :=
  .sub (.smul (12 : ℝ)⁻¹ (.bracket X (.bracket X Y)))
       (.smul (12 : ℝ)⁻¹ (.bracket Y (.bracket Y X)))

def expr_term_4 {L : Type*} (X Y : LieExpr L) : LieExpr L :=
  .smul (-(24 : ℝ)⁻¹) (.bracket Y (.bracket X (.bracket X Y)))

/-- 
Theorem: Early Halt Condition under Partial Decoupling.
Syntactically, the terms exist, but concretely they vanish.
-/
theorem partial_decoupling_halt {L : Type*} [LieRing L] [LieAlgebra ℝ L] (gens : GeneratorSet L) :
  eval (expr_term_3 (.gen "P2" gens.P2) (.gen "Q1" gens.Q1)) = 0 ∧ 
  eval (expr_term_4 (.gen "P2" gens.P2) (.gen "Q1" gens.Q1)) = 0 := by
  have h_comm : ⁅gens.P2, gens.Q1⁆ = 0 := gens.partial_decouple
  have h_skew := lie_skew gens.P2 gens.Q1
  rw [← h_skew] at h_comm
  have h_rev : ⁅gens.Q1, gens.P2⁆ = 0 := neg_eq_zero.mp h_comm
  constructor
  · simp [expr_term_3, eval, h_comm, h_rev]
  · simp [expr_term_4, eval, h_comm]

/--
Theorem: Truncation Order Divergence.
In full coupling mode, the third-order BCH terms do not vanish.
-/
theorem order_divergence_invariant {L : Type*} [LieRing L] [LieAlgebra ℝ L] [NoZeroSMulDivisors ℝ L] (gens : GeneratorSet L) 
  (h_non_trivial : ⁅gens.P2, ⁅gens.P2, gens.Q1⁆⁆ - ⁅gens.Q1, ⁅gens.Q1, gens.P2⁆⁆ ≠ 0) :
  eval (expr_term_3 (.gen "P2" gens.P2) (.gen "Q1" gens.Q1)) ≠ 0 := by
  intro h_zero
  simp [expr_term_3, eval] at h_zero
  have h_factor : (12 : ℝ)⁻¹ • (⁅gens.P2, ⁅gens.P2, gens.Q1⁆⁆ - ⁅gens.Q1, ⁅gens.Q1, gens.P2⁆⁆) = 0 := by
    rw [smul_sub]
    exact h_zero
  have h_inner : ⁅gens.P2, ⁅gens.P2, gens.Q1⁆⁆ - ⁅gens.Q1, ⁅gens.Q1, gens.P2⁆⁆ = 0 := by
    exact smul_eq_zero.mp h_factor |>.resolve_left (by norm_num)
  exact h_non_trivial h_inner

/-- 
Theorem: Metric Split Invariant.
Vanishing algebra has 0 structural depth but non-zero syntactic complexity.
-/
theorem metric_split_invariant {L : Type*} [LieRing L] [LieAlgebra ℝ L] [DecidableEq L] (X Y : LieExpr L) 
  (h_comm : ⁅eval X, eval Y⁆ = 0) :
  structural_depth (.bracket X Y) = 0 ∧ syntactic_complexity (.bracket X Y) > 0 := by
  constructor
  · simp [structural_depth, eval, h_comm]
  · simp [syntactic_complexity]
    apply Nat.succ_pos

/-- 
Theorem: Geometry-Only Separation (Beta = 0).
If the overlay history has non-vanishing commutators that the internal does not,
separation persists even without tag penalties.
-/
theorem geometry_only_separation {L : Type*} [LieRing L] [LieAlgebra ℝ L] [DecidableEq L]
  (len_i len_o : ℕ) (expr_i expr_o : LieExpr L) (q_i q_o : ℕ) (alpha : ℝ) 
  (h_alpha : alpha > 0)
  (h_len : len_i = len_o)
  (h_depth : structural_depth expr_o > structural_depth expr_i) :
  bra_cost len_o expr_o q_o alpha 0 > bra_cost len_i expr_i q_i alpha 0 := by
  simp [bra_cost]
  rw [h_len]
  simp
  apply (mul_lt_mul_left h_alpha).mpr
  norm_cast
