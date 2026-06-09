import Lake
open Lake DSL

package ataraxia_formal where
  -- add package configuration options here

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

lean_lib Ataraxia where
  -- add library configuration options here

@[default_target]
lean_exe ataraxia_formal where
  root := `Main
