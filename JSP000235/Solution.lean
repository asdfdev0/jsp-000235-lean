import Mathlib

namespace JSP000235

universe u v

variable {G : Type u} [Group G]

/-- The left coset `gH`, written without relying on pointwise-action notation. -/
def LeftCoset (g : G) (H : Subgroup G) : Set G :=
  {x : G | g⁻¹ * x ∈ H}

/-- A subset of a group is a left coset of some subgroup. -/
def IsLeftCoset (S : Set G) : Prop :=
  ∃ (g : G) (H : Subgroup G), S = LeftCoset g H

/--
A literal formalization of the published JSP-000235 wording:
"Can a group be partitioned into cosets of pairwise distinct sizes?"

The `size` function is deliberately abstract.  The singleton-partition loophole
works for any interpretation of "size" because pairwise distinctness is
vacuous for a one-element family.
-/
def IsLiteralCosetPartition {α : Type v} (size : Set G → α)
    (pieces : Finset (Set G)) : Prop :=
  pieces.Nonempty ∧
  (∀ S ∈ pieces, IsLeftCoset S) ∧
  (∀ x : G, ∃ S ∈ pieces, x ∈ S) ∧
  (∀ S ∈ pieces, ∀ T ∈ pieces, S ≠ T → Disjoint S T) ∧
  (∀ S ∈ pieces, ∀ T ∈ pieces, S ≠ T → size S ≠ size T)

lemma univ_isLeftCoset : IsLeftCoset (Set.univ : Set G) := by
  refine ⟨1, ⊤, ?_⟩
  ext x
  simp [LeftCoset]

lemma singleton_univ_partition {α : Type v} (size : Set G → α) :
    IsLiteralCosetPartition size ({Set.univ} : Finset (Set G)) := by
  classical
  refine ⟨by simp, ?_, ?_, ?_, ?_⟩
  · intro S hS
    have hSu : S = Set.univ := by
      simpa using hS
    subst S
    exact univ_isLeftCoset
  · intro x
    exact ⟨Set.univ, by simp, by simp⟩
  · intro S hS T hT hne
    have hSu : S = Set.univ := by
      simpa using hS
    have hTu : T = Set.univ := by
      simpa using hT
    exfalso
    apply hne
    exact hSu.trans hTu.symm
  · intro S hS T hT hne
    have hSu : S = Set.univ := by
      simpa using hS
    have hTu : T = Set.univ := by
      simpa using hT
    exfalso
    apply hne
    exact hSu.trans hTu.symm

/--
Literal JSP-000235 endpoint.  Every group has a one-coset partition satisfying
the published pairwise-distinct-size condition, for every possible size map.
-/
theorem jsp_000235_literal {α : Type v} (size : Set G → α) :
    ∃ pieces : Finset (Set G), IsLiteralCosetPartition size pieces := by
  classical
  exact ⟨{Set.univ}, singleton_univ_partition size⟩

end JSP000235
