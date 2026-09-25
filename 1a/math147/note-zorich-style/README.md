# MATH 147 — Zorich-style rewrite (experiment)

A rewrite of `../note-course` in the style of Zorich, *Mathematical Analysis I*.
The mathematics (definitions, proof strategies, order, notation) is the lecturer's,
which largely follows Bartle & Sherbert, *Introduction to Real Analysis*.
Only the exposition changes. The original notes are untouched.

Compile: `latexmk -pdf -interaction=nonstopmode note.tex`

## Layout

| New file | Section | Source (`../note-course/chapters/`) |
|---|---|---|
| `chapters/c1/s1.tex` | 1.1 Numbers and the Language of Logic | `u2/s1.tex` |
| `chapters/c1/s2.tex` | 1.2 Induction and Well-Ordering | `u2/s2.tex` |
| `chapters/c1/s3.tex` | 1.3 The Axioms for the Real Numbers | `u2/s3.tex` |
| `chapters/c1/s4.tex` | 1.4 Bounded Sets; Supremum and Infimum | `u2/s4.tex` |
| `chapters/c1/s5.tex` | 1.5 Consequences of the Completeness Axiom | `u2/s5.tex` |
| `chapters/c2/s1.tex` | 2.1 The Limit of a Sequence | `u3/s1.tex` |

`u1/s1.tex` (course logistics) is left out.

## Style rules used

1. **Structure**: chapter → numbered section (1.3) → lettered subsection (a., b., …),
   as in Zorich. Each chapter and section opens with one or two sentences
   saying what it is for.
2. **Proof idea in prose**: one or two sentences *before* the proof, not a
   `remark[Proof idea]` box. The proof itself stays short.
3. **Remarks are rare.** A remark only for a real conceptual point
   (e.g. min vs. sup, sup vs. max, quantifier order). No boxed slogans.
4. **Definitions in quantifier form** where Zorich would write them that way
   (e.g. the limit, the ε-characterization of sup), with a plain-language
   reading right after. European notation: each quantifier in parentheses,
   the statement it governs in square brackets, e.g.
   `(\forall \epsilon>0)(\exists n_\epsilon\in\N)(\forall n\geq n_\epsilon)\,[\abs{x_n-a}<\epsilon]`.
5. **Keep the lecturer's arguments**: sup ℕ for Archimedes, sup S with the
   two-case nudge for √2, A = {n : y < n} + well-ordering for n_y − 1 ≤ y < n_y,
   the grid m/n for density, and so on.
6. **Typography**: `qhnotes` with `color`, the same visual system as the
   original notes. Its `proof` box always puts the QED mark on its own line,
   so do not use `\qedhere`.
7. Defined terms use `\term{}`, so they go into the index.

## Content changes beyond wording

- Principle of induction is an `axiom` (it is assumed, not defined);
  the Archimedean property is a `theorem` (it was typeset as a definition).
- "Q is not complete" moved after the density theorem and re-proved there:
  the original argument ("the only possible sup is √2 ∉ Q") skipped a step
  that needs density of Q.
- Filled in the unfinished proofs in the last lecture: the two infinite-limit
  examples (following the lecturer's hint "make √n > M − 1") and parts (1)–(2)
  of the limit-laws theorem. The unused hypothesis y_n → b was dropped from that
  statement until the lecture that continues it.
- Unbounded-sequence examples now say why they matter: unbounded ⇒ divergent.
- Fixed typos (`\lim_{x_n}`, a_n/x_n mix, "x → ∞" for a sequence).
