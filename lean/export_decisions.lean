import AffineCore.Stability.BoundedApproval

def main : IO Unit := do
  let table := exportDecisionTable
  IO.println "["
  let entries := table.map (fun entry => 
    s!"  \{\"proposal_id\": \"{entry.proposal_id}\", \"confidence\": {entry.confidence}, \"is_admissible\": {if entry.is_admissible then "true" else "false"} \}"
  )
  IO.println (String.intercalate ",\n" entries)
  IO.println "]"
