# ADR-001: Production Installation of MOC Lawful Core

## Status
Proposed

## Context
The MOC lawful core (`lean/MOC/Core.lean` and `lean/PIRTM/Transition/`) is now formally verified, axiom-clean, and formally anchored to the `Ξ-Constitution`. To maintain this integrity in a production environment on this machine, we must move from ad-hoc builds to a reproducible, hermetic installation and lifecycle management process.

## Decision
We will establish a hermetic installation pipeline that treats the `axiom-clean` core as an immutable system dependency, preventing any possibility of `Mathlib`-tainted drift.

## Proposed Pipeline
1.  **Hermetic Build Environment:** Use a dedicated Nix/Elan environment strictly pinning the Lean 4 compiler version to ensure bit-reproducible build outputs.
2.  **Axiom-Clean Enforcement:** Implement a pre-build hook that strictly validates the import graph of `lean/`, rejecting any module importing `Mathlib`.
3.  **Deployment:** Install the validated core as a system library, allowing downstream components (the Lisp-bridge and production CRMF agents) to link against the anchored stability certificates.
4.  **Lifecycle Management:** Any update to the production core must be accompanied by a re-verification of all stability certificates within the axiom-clean environment, followed by a ledger-anchored re-certification.

## Consequences
- **Positive:** Guaranteed axiom-cleanliness across all production deployments; elimination of build-time drift.
- **Negative:** Increased complexity in local development workflows; stricter dependency management.
- **Mitigation:** Provide automated "lawful-core" containers for developers to easily replicate the hermetic environment.
