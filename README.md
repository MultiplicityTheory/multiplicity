Multiplicity Operator Calculus: Axiom-Clean Lawful Core

The Multiplicity Operator Calculus (MOC) is now implemented in a formally verified, axiom-clean Lean 4 core, satisfying the binding requirements of the `Ξ-Constitution`.

## Architecture

- **`lean/`**: The canonical, axiom-clean lawful core.
  - **`MOC/Core.lean`**: Axiom-clean operator calculus and stability predicates (No Mathlib, No Sorry).
  - **`PIRTM/Transition/`**: Anchored transition models and verified stability certificates.
  - **`legacy/`**: Exploratory/theatrical modules dependent on Mathlib (Non-binding, non-production).
- **`bridge/`**: S-expression bridge connecting Lisp macros to the certified core.

## Getting Started

1. **Build the Lawful Core:**
   ```bash
   cd lean && lake build
   ```
2. **Verify Stability:**
   All production paths anchor to verified `StabilityCertificate` objects in the lawful core.

## Governance & Compliance

- **Binding Source:** `lean/MOC/Core.lean` and `lean/PIRTM/Transition/` are the **single, binding, axiom-clean source of truth**. 
- **Legacy Status:** Code in `lean/legacy/` does not constitute constitutional law and must not be used for production stability proofs.
- **Constitutional Core:** All system evolutions must comply with the `Ξ-Constitution`.

<!-- LawfulRecursionVersion:1.0 -->

