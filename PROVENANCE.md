# Provenance and statement audit

## Published JSP wording

JSP-000235 is published in `TheJustinSunPrize/awards` as:

> Can a group be partitioned into cosets of pairwise distinct sizes?

At the audited awards revision `bcf1866ea9a4ae82b32bd95b82ffd812b9ee80d2`, the entry is marked Open and does not state a lower bound on the number of cosets in the partition.

## Historical/source formulation

The maintained Formal Conjectures source for Erdős Problem 274 / the Herzog–Schönheim conjecture, at commit

`2a46c7bd74505b85f4967475bb733ded0ef8d348`

in `FormalConjectures/ErdosProblems/274.lean`, explicitly states the nontriviality condition in two equivalent forms:

- the prose asks for an exact covering "by more than one coset";
- the formal theorem requires `1 < Fintype.card ι`;
- the Herzog–Schönheim docstring states that the partition has `k > 1`.

The maintained theorem additionally records the intended conclusion that two subgroup sizes/indices coincide.

## Framing difference

The live JSP sentence omits the historical `k > 1` / more-than-one-coset requirement.  With that condition omitted, every group has a literal witness: the singleton partition containing the whole group itself.

For this reason the Lean statement in this repository intentionally models only the published JSP wording.  It does not weaken, solve, or claim progress on the historical nontrivial Herzog–Schönheim conjecture.

## Prior-art audit

Before this repository was prepared, searches of the public awards repository and GitHub found JSP-000235 submissions concerning the historical conjecture or small arithmetic examples, but no public Lean proof identified as solving the published JSP sentence via the singleton-coset loophole.

This is a best-effort public prior-art statement, not a claim of absolute priority.
