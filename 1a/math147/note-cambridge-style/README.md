# MATH 147 — Cambridge-style rendering

A rewrite of `../note-course` in the `cambridge` profile
(`../../../STYLE.md` §3.8): Cambridge Tripos notes as typeset by Dexter
Chua. The mathematics — definitions, proof strategies, order, notation — is
the lecturer's, as recorded in `../note-course/chapters/`. Only the
exposition changes; the originals are untouched.

Compile: `latexmk -pdf -interaction=nonstopmode note.tex`
Baseline (2026-09-26, clean build): 19 pages, 0 overfull boxes, no undefined
references; one `etex` "Extended allocation already in use" warning, which
comes from the template's preamble.

## Layout

| File | Section | Source (`../note-course/chapters/`) |
|---|---|---|
| `chapters/c0.tex` | 0 Introduction | first paragraph from `u2/s1.tex` (*What Is Calculus?*); the rest is a summary written for this rendering |
| `chapters/c1/s1.tex` | 1.1 Numbers and logic | `u2/s1.tex` |
| `chapters/c1/s2.tex` | 1.2 Induction and well-ordering | `u2/s2.tex` |
| `chapters/c1/s3.tex` | 1.3 ℝ as an ordered field | `u2/s3.tex` |
| `chapters/c1/s4.tex` | 1.4 Suprema and infima | `u2/s4.tex` |
| `chapters/c1/s5.tex` | 1.5 Completeness and its consequences | `u2/s5.tex` |
| `chapters/c2/s1.tex` | 2.1 Convergent sequences | `u3/s1.tex` |

`u1/s1.tex` (course logistics) is left out.

`note.tex` is `~/references/template/cambridge/template.tex` verbatim, with
`\npart`, `\nlecturer`, `\ncourse` filled in and `\paren`, `\bracks`, `\set`,
`\ds` added after the preamble (same definitions as `../note-course`).

## Style rules applied

1. **Plain statements.** Unnumbered `defi`, `thm`, `prop`, `cor`, `eg`,
   `remark`, `warning`, `axiom`, `notation`; numbered `nthm` / `nprop` /
   `nlemma` / `ncor` only for results cited later (√2 irrational,
   well-ordering, |·| properties, triangle inequality, ε-characterisation,
   Archimedes and its corollary, √2 exists, density of ℚ, and the three
   results on limits), each with a `\label` and cited by number.
2. **Proof aids as prose.** Each Idea / Scratch box became at most one
   sentence before the proof ("The idea is …"). The In practice lists became
   remarks or sentences next to the result they belong to.
3. **Traps as `warning`**: quantifier order, minimum vs infimum, sup vs max,
   the min argument in Corollary 1.7(c), and "diverges to ±∞ is still
   divergent".
4. **Slogans**: two `significant` lines (√2 irrational, Archimedes). The two
   boxed √2 case lines were dropped; the prose before Proposition 1.8 already
   says the same.
5. **Logic in words**, quantifiers written inline
   (`∀ε > 0 ∃n_ε ∈ ℕ ∀n ≥ n_ε, …`) instead of the house bracket style.
6. **Examples grouped** into one `eg` with a list where they belong together
   (the two quantifier examples, the two bijections, the unbounded
   sequences).
7. **Index**: every defined term in `\term{}`.
8. **Headings** in sentence case; `\subsubsection*` for blocks inside a
   subsection.
9. **Provenance.** The text of `../note-course` counts as the lecture record.
   Anything added beyond it is in a grey `own` block.

## Content changes beyond wording

- The principle of induction is an `axiom` (it was typeset as a definition),
  and the Archimedean property is a theorem (Theorem 1.6; it was typeset as a
  definition although it is proved).
- *ℚ is not complete* (§1.5): the original argument ("the only possible
  supremum is √2 ∉ ℚ") skips a step that needs density of ℚ. The missing
  step is supplied in an `own` block, with a forward reference to
  Theorem 1.9; the order of the notes is unchanged.
- Typos fixed in `u3/s1`: `\lim_{x_n}` → `\lim_{n\to\infty} x_n`; `a_n` →
  `x_n` in the ±∞ definitions; `x → ∞` → `n → ∞`; `n_m` → `n_M`; the hint
  "√n > m − 1" → "√n > M − 1". The second unbounded-sequence example, which
  stopped at "|n| > M", now reads "exceeds M as soon as n > M".
- Added (in `own`): "By Theorem 2.3, neither sequence converges" after the
  unbounded examples.

## Deliberately not done

- The two ±∞ examples in §2.1 were not proved in lecture. They are stated
  with the lecturer's hint and a `% TODO(check)`, not completed (STYLE P9).
- The limit-laws theorem at the end of §2.1 is stated as lectured, without
  proof; its unused hypothesis on `y_n` is kept (`% TODO(check)`).
- `\nlecturer` is "M. Molino", taken from the course email address; the full
  name is unconfirmed (`% TODO(check)` in `note.tex`).

This rendering is not kept in sync with later edits to `../note-course`.
