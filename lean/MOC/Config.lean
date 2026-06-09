import Init.Data.Nat.Basic
import Init.Data.List.Basic
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Vector
import MOC.Core

namespace MOC

/-- 
  A configuration is a pair (Q, p), 
  Q is an integral symmetric form (matrix) 
  p is an integral refinement vector.
-/
structure Configuration (n : Nat) where
  Q : Matrix (Fin n) (Fin n) Int
  p : Vector Int n
  h_sym : Q.transpose = Q

/-- 
  Rewrite operators dependently typed on the schema witness.
-/
inductive RewriteOp {s : Schema} {last_seq : Nat} {v : ValidatedSchema s last_seq} (n : Nat) where
  | slide (i j : Fin n) (ε : Int) : RewriteOp n
  | blowup (σ : Int) : RewriteOp n
  | blowdown (σ : Int) : RewriteOp n
  | hyp_add : RewriteOp n
  | hyp_cancel : RewriteOp n

/-- Word: A dependently-typed sequence of operators. -/
structure OperatorWord (s : Schema) (last_seq : Nat) (v : ValidatedSchema s last_seq) (n : Nat) where
  ops : List (RewriteOp n)
  deriving Repr

end MOC
