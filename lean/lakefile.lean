import Lake
open Lake DSL

package «moc-v2» where
  -- add package configuration options here

lean_lib MOC where
  -- add library configuration options here

lean_lib PIRTM where
  -- add library configuration options here

@[default_target]
lean_exe «moc-v2» where
  root := `Main
