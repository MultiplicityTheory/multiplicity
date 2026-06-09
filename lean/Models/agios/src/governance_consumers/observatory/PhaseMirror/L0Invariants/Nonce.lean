import Mathlib.Data.String.Basic
import Mathlib.Logic.Function.Basic

/--
An abstract type for Event Identifiers.
-/
axiom EventId : Type

/--
A NonceStore is a mapping from EventIds to Strings.
L0 Invariant: The mapping must be injective (uniqueness).
-/
def NonceStore := { f : EventId → String // Function.Injective f }

/--
Theorem: Nonce injectivity ensures that distinct events always have distinct nonces.
-/
theorem nonce_injective (store : NonceStore) (a b : EventId) :
    store.val a = store.val b → a = b := by
  intro h
  exact store.property h
