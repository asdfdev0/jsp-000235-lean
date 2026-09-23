# JSP-000235 literal Lean proof

This repository formalizes the **literal published wording** of JSP-000235:

> Can a group be partitioned into cosets of pairwise distinct sizes?

Under that wording, the answer is yes for every group. The singleton family consisting only of the whole group is a one-coset partition. Any pairwise-distinctness condition is vacuous on a singleton family.

The formalization deliberately abstracts the word `size` as an arbitrary function on subsets. Consequently the proof does not depend on interpreting size as cardinality, subgroup index, or any other conventional invariant.

## Historical/source distinction

The maintained source formulation for Erdős Problem 274 / the Herzog–Schönheim conjecture requires a **nontrivial** exact covering: more than one coset (`k > 1`). The published JSP-000235 sentence omits that lower bound on the number of parts.

Accordingly, this repository does **not** claim to solve the historical Herzog–Schönheim conjecture. It proves only the literal JSP wording as published.

## Main theorem

`JSP000235.jsp_000235_literal`

The theorem states that for every group `G` and every function assigning a size value to each subset of `G`, there exists a finite coset partition whose distinct members have pairwise distinct size values. The witness is `{Set.univ}`.

## Reproduction

From a fresh clone:

```bash
lake update
lake exe cache get
lake build
lake env lean JSP000235.lean
lake env lean Audit.lean
```

Pinned environment:

- Lean: `leanprover/lean4:v4.33.0`
- mathlib: `db584cd6d46c92f209a44c0f1c829460d327499d`

## Attribution

Mathematical observation and Lean formalization for the literal JSP wording: `asdfdev0`.

No priority claim is made over unrelated work on the historical Herzog–Schönheim conjecture or its nontrivial variants.
