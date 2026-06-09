import Lake
open Lake DSL

package «PhaseMirror» where
  -- add package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.7.0"

lean_lib «PhaseMirror» where
  roots := #[`PhaseMirror]
