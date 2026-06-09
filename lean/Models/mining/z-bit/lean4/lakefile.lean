import Lake
open Lake DSL

package «affine-core» where
  -- No extra name field needed here if defined in the package header

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"

lean_lib «AffineCore» where
  roots := #[`AffineCore]
