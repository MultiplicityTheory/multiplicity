#!/bin/bash
# Pre-build hook: check for Mathlib or sorry imports in the production core
if grep -rE "import Mathlib|sorry" MOC/ PIRTM/Transition/ | grep -v "legacy" | grep -v "MOC/Core.lean"; then
    echo "ERROR: Axiom-clean mandate violation detected!"
    exit 1
fi
echo "Import validation passed."
