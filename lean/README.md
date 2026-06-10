# AffineCore: Formal Verification (`lean4`)

## 📐 Multiplicity Theory Role
**Invariant:** The supermodule spectral radius $\rho(C \cdot \text{diag}(\gamma)) < 1$ guarantees global system stability.

The `lean4` directory contains the **AffineCore** certification library. Its role is to provide machine-checkable mathematical proofs that the substrate's core axioms (stability, existence, and uniqueness) are sound. It transforms mathematical specifications into binding constraints that the implementation must follow to be considered lawful.

---

## 🏗️ Structure
- **`AffineCore/`**: The core Lean 4 proof modules.
- **`CompleteFormalizationPlan.md`**: The end-to-end roadmap for ecosystem-wide verification.

## 🚀 Usage
To run the formal verification suite:
```bash
lake build
```

<!-- LawfulRecursionVersion:1.0 -->
