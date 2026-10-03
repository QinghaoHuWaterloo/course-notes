# MATH 147 Notes — Editing Handoff

Profile: **`mixed`** (see `../../../STYLE.md` §3.3). This course is the
reference implementation of that profile. Read `../../../HANDOFF.md`, then
`STYLE.md`, then this file. Where they disagree, this file wins for MATH 147.

## Scope

- Honours real analysis (MATH 147), LaTeX notes for long-term study, not
  homework submission. The lecturer largely follows Bartle & Sherbert,
  *Introduction to Real Analysis*.
- Preserve: the lecturer's definitions, notation, order of results, and
  proof strategies — exactly. Improve exposition only (`STYLE.md` P2, P8).
- Out of scope: `chapters/u1/s1.tex` and `chapters/c1.tex` (course
  logistics; no mathematics to edit).
- Target reading: *my original MATH 147 notes, written by a mathematically
  mature version of myself who carefully explains why each step is taken.*
  Compact where the mathematics is straightforward; expanded where the
  reasoning matters.

## Layout and build

```
note.tex        root: \documentclass[11pt, latinmodern]{article},
                \usepackage[europe,paper=a4]{qhnotes}; no active \includeonly
chapters/
  c1.tex        \section{Course Information}      -> u1/s1 (logistics)
  c2.tex        \section{The Real Number System}  -> u2/s1 .. u2/s5
  c3.tex        \section{Sequences and Limits}    -> u3/s1 .. u3/s4
  u2/s1.tex     Numbers and logic: N/Z/Q, sqrt 2 irrational, quantifiers
                (the European-notation `notation` box lives here)
  u2/s2.tex     Induction and well-ordering
  u2/s3.tex     R as an ordered field: field/order axioms, |x|, triangle ineq.
  u2/s4.tex     Suprema and infima, epsilon-characterisation
  u2/s5.tex     Completeness and consequences: Archimedean property, sqrt 2
                exists, density of Q, countability  — highest care
  u3/s1.tex     Convergent sequences: limit, uniqueness, divergence,
                boundedness, divergence to +-infinity, limit laws
  u3/s2.tex     Limits and order, squeeze theorem, monotone convergence,
                a recursively defined sequence
  u3/s3.tex     Euler's number via MCT, subsequences, tails, geometric limit
  u3/s4.tex     Bolzano--Weierstrass by bisection; monotone subsequences
```

One `uN/sN.tex` = one `\subsection` = the editing unit. The `%!TEX root`
spelling varies (`../../note`, `../../note.tex`, with or without spaces);
do not normalise it for style. `chapters/c2.tex` was corrected to `../note`
on 2026-09-29; one line still points to the wrong place and may be corrected
when next edited: `chapters/u2/s1.tex` (`../../../note`, should be
`../../note`).

Build and check: `HANDOFF.md`, "Verification".

## Local rules

- **`idea` and `scratch`** are defined in `note.tex` (amsthm `noteblock`
  style plus `\surroundwithmdframed`: pale-blue and grey left-bar boxes).
  They stay local to MATH 147's roots; other courses that adopt `mixed` copy
  the definitions. Do not move them into `qhnotes`.
- **`\insymbols{…}`** (in `note.tex`, since 2026-09-26) ends every theorem,
  proposition, lemma, corollary and axiom, plus the three principles typeset
  as definitions (induction in `u2/s2`, the completeness preview in `u2/s3`,
  the Archimedean property in `u2/s5`): 26 in all. The convention is
  announced in the `notation` box of `u2/s1`. Rules:
  - European quantifiers; only notation defined *before* the statement.
    So the `u2/s3` completeness preview unfolds "least upper bound", while
    `u2/s5` may write `u_0 = \sup S`.
  - Multi-part results: `\begin{aligned}` with the statement's own labels,
    as rendered (`a)`, `(a)`, `(i)`).
  - Lines wider than ~70% of the box are broken with `aligned` and indented
    continuation lines (`&\quad\Rightarrow …`).
  - Examples are not given symbolic forms, even when they state a claim.
- **Current visual rendering:** the shared `europe` option supplies pastel
  statement boxes and grey proof sidebars; the writing profile remains
  `mixed`. Index entries remain in the source, but the root currently omits
  `\printindex` (an intentional exception to `STYLE.md` §5.4).
- **`\raggedbottom`** (in `note.tex`): `twoside` turns on `\flushbottom`,
  which stretched pages around unbreakable boxes; ragged bottom avoids it.
- **Shortcuts** in `note.tex`: `\paren{} \abs{} \norm{} \bracks{} \set{}`,
  `\R \N \Z \Q \C`, `\ds`, `\blue`, `\red`, `\mypic`. No new macros unless
  unavoidable.
- **Sequence-limit notation.** In new lectures, prefer
  `$\lim_{n\to\infty}x_n=a$` to `$x_n\to a$` when stating or invoking a
  limit, matching the lecturer's usage.
- **Typography.** Traditional Latin Modern text and math, 11pt, one-sided
  (selected 2026-10-01 via the `latinmodern` class option). Previously:
  Times + newtx (the `qhnotes` default), 11pt: at 10pt Times
  ran ~90 characters per line on the 124 mm block. Tried and rejected:
  Century Schoolbook (`fouriernc`), Concrete + Euler (no bold), Palatino.
  After the migration (2026-09-25) the root became `twoside`.
- **Remarks in use** (all Traps): quantifier order ∀∃ vs ∃∀ (`u2/s1`),
  why min not sup (`u2/s2`), sup vs max for `[0,1)` (`u2/s4`), part (c) is
  a min argument (`u2/s5`). Remarks went from 22 to 4 in the migration; keep
  it that way. All four now have titles naming the trap (2026-10-02).
- **Key mechanism lines** exist in `u2/s1` (parity contradiction) and
  `u2/s5` (Archimedean property, plus the two √2 cases as `array{c}`). The
  √2 pair counts as one mechanism, so `u2/s5` is at the limit of two; add
  none there.
- **Known `nobreak` spots:** a long proof in `u2/s2`, the `1/n → 0` proof
  in `u3/s1`, the field-facts theorem in `u2/s3` and the √2-exists
  proposition in `u2/s5` (both keep their symbolic form on the same page),
  and the
  ε-characterisation lemma statement in `u2/s4` (it left one word on the next
  page at 11pt). The square-positivity and absolute-value proofs in `u2/s3`,
  the convergence-implies-boundedness proof and the final rational-function
  example proof in `u3/s1` also use local `nobreak` pairs (2026-10-02) to
  avoid empty continuations or a lone closing sentence. The `[0,1)` example
  in `u2/s4` no longer nests its proofs
  inside the example box.

## Content notes — arguments that must be kept

- **Bounds and completeness (`u2/s4`, `u2/s5`).** Extra care on bounded
  sets, upper/lower bounds, sup/inf, the ε-characterisation, completeness,
  the Archimedean property, `inf{1/n} = 0`, the integer `n` with
  `n−1 ≤ y < n`, existence of √2, density of ℚ, and incompleteness of ℚ.
  Later analysis depends on these.
- **Archimedean property.** Keep the contradiction through `u = sup N`:
  suppose ℕ bounded above → completeness gives `u` → `u−1 < u` is not an
  upper bound (least upper bound) → some `m ∈ ℕ` with `u−1 < m` → `u < m+1`
  → `m+1 ∈ ℕ` (inductive closure) → `m+1 ≤ u`, contradiction. Both
  completeness and inductive closure are used; say so.
- **Integer location (corollary (c)).** Keep `A = {n ∈ ℕ : y < n}`:
  Archimedes makes `A` nonempty, well-ordering gives `n_y = min A`,
  `y < n_y`, and `n_y − 1 > y` would contradict minimality. The Trap remark
  explains why this is a min argument, not a sup argument (`A` is unbounded
  above; well-ordering needs no upper bound).
- **Existence of √2.** Keep `S = {t ∈ ℝ : t ≥ 0, t² < 2}`, `x = sup S`, and
  the two cases (`x² < 2`: nudge right and stay in `S`; `x² > 2`: nudge left
  and stay an upper bound). Keep the detailed inequalities. Do not replace
  with continuity, IVT, decimals, or Dedekind cuts.
- **Density of ℚ.** Keep the Archimedean proof: `n` with `1/n < y−x` (grid
  finer than the interval), `m` the integer just right of `nx`, so `m/n`
  lands in `(x, y)`. The grid picture (described in prose) appears before or
  during the proof.
- **Limits (`u3/s1`).** Keep the ε-definition with its plain reading
  ("every tolerance ε > 0: all sufficiently late terms lie in `(a−ε, a+ε)`")
  and the roles of ε, `n_ε`, and "for all `n ≥ n_ε`". Do not expand into
  subsequences, Cauchy sequences, or limit laws before the lectures do.

## Course-specific pitfalls

- `\boxed{}` lines overflow the narrow page beyond ~6–7 words; use
  `array{c}` with manual breaks (`STYLE.md` §6, item 4).
- Do not re-add proof-idea remarks: the 2026-09-25 migration converted them
  all (`style-migration.md` lists each). Check `git log -p -- <file>` before
  adding explanation to a file that was already edited.

## Status (2026-10-02)

- **New-note整理 (2026-10-02), current baseline:** polished the additions
  in `u3/s3` and the new `u3/s4` in `mixed`; restored *In practice* and
  retained the unsolved sine example as a lecture exercise. Added semantic
  labels, index entries, cross-references, and the `c3` concept-map links.
  Corrections to the rough notes: BW asserts a convergent **subsequence**
  and is a theorem, not a definition; bisection keeps **at least** one half
  with infinitely many term indices; interval length is `2m/2^(k-1)`;
  peak-case construction includes the possibility of no peaks. In the
  geometric-limit proof, `x <= b < 1` now explicitly excludes the root 1.
  Preserved the bisection/endpoints/squeeze and peak proof strategies.
  Clean rebuild: **41 pages**, **0 overfull or underfull boxes**, **0 LaTeX
  warnings**, **0 undefined references**, **5 mdframed split infos**
  (unchanged). New content on pages 39--41 was visually checked; no new
  `TODO(check)` markers.

- **Layout cleanup (2026-10-02), earlier baseline:** retained the existing
  A4, 11pt, one-sided `europe` rendering. List-first statement boxes now
  start their lists below the heading; the reverse-triangle corollary and
  its proof headings consistently use (i)/(ii). Added titles to the three
  untitled Traps and text alternatives for all mathematical section titles
  in PDF bookmarks. Mathematical statements and proof steps are unchanged.
  Clean rebuild: **39 pages**, **0 overfull or underfull boxes**, **0 LaTeX
  warnings**, **0 undefined references**, **5 mdframed split infos** (down
  from 7 infos and 2 bad-break warnings before cleanup). Affected proof
  pages and the remaining split boundaries were visually checked. The
  older build records below describe earlier layouts.

- **A4 restored (2026-10-01):** the root now uses `paper=a4`; font and
  point size are unchanged. Reflow required an explicit prose line break
  before `prop:induction-set-form` in `u2/s2`. Rebuilt PDF: **40 pages**,
  **0 overfull or underfull boxes**, **7 split infos**, no errors or
  undefined references. MCT on page 34 was visually checked.
- **Layout fix (2026-10-01):** `thm:monotone-convergence` now displays
  each limit conclusion separately and breaks the symbolic implications
  across lines; a local `nobreak` pair keeps the whole statement together.
  Clean Latin Modern build: **54 pages**, **6 overfull hboxes** elsewhere,
  **1 underfull hbox**, **5 split infos**, no errors or undefined references.
  The theorem on page 46 was visually checked and has no overflow.
- **Done:** all of `chapters/` follows `mixed` (migration 2026-09-25, see
  `style-migration.md`). Cross-reference + index + concept-map layer added
  2026-09-29 (see below).
- **Build baseline** (clean build 2026-09-29, twoside, 11pt, with
  `\insymbols`, `\raggedbottom`, cleveref, populated index and two concept
  maps): **45 pages**; **0 overfull and 0 underfull** boxes; **7** mdframed
  "Box was splittet wrong" info messages, with no visible defect on those
  pages; **0 undefined references**. (The pre-linking baseline was 43 pages
  / 3 overfull / 5 split on 2026-09-28; reflow removed the 3 overfull, the
  index and concept maps added 2 pages and 2 split infos.)
- **Cross-reference, index, concept-map layer (2026-09-29).** Implements
  `STYLE.md` §5.3–5.6:
  - `note.tex` loads cleveref via `\AtEndPreamble` (after qhbase's hyperref
    hook) with `\crefname`/`\Crefname` for the six numbered theorem
    environments.
  - Every numbered theorem-like block across `u2/s1`–`u2/s5` and
    `u3/s1`–`u3/s2` has a semantic `\label` (`def:`/`thm:`/`prop:`/`lem:`/
    `cor:`). The starred `axiom` (completeness) is unnumbered, so it is
    `\index`ed but not labelled.
  - Prose pointers ("the preceding theorem", "the difference law", "part (c)
    of the preceding corollary", …) converted to `\cref`, including one
    cross-chapter link `\cref{lem:eps-characterization}` (u3/s2 → u2/s4).
    Multi-part references keep the part in prose: `part (c) of
    \cref{thm:abs-value}`.
  - Concept definitions carry `\index{}` (47 entries → populated `Index` in
    the TOC at the last page).
  - `c2.tex` and `c3.tex` each open with a `\cref`-linked concept map.
  - `c2.tex` `%!TEX root` corrected to `../note`.
- **Gaps against the current `STYLE.md`:**
  - Lecture openers (§2.2): present in `u2/s3`, `u2/s4`, and `u3/s1`;
    missing in `u2/s1`, `u2/s2`, and `u2/s5`.
  - Corollary 2.3.10 (`u2/s3`) proof headings were aligned with (i)/(ii)
    on 2026-10-02.
- **`u3/s2` pass (2026-09-30):** subsection retitled "Limits, Order, and
  Monotone Sequences" with blocks Limits and Inequalities / The Squeeze
  Theorem / Monotone Sequences; prose pointers converted to `\cref`
  (`def:archimedean`, `thm:squeeze`, `thm:convergent-bounded`,
  `cor:inf-existence`); example labelled `ex:sin-over-sqrt`; MCT symbolic
  form gained the iff line; the infimum case of the MCT proof now argues
  directly from "greatest lower bound" (no inf version of
  `lem:eps-characterization` exists). Later the same day: the lecture's
  recursive example became `ex:recursive-mct` (staged proof: bound,
  monotone, limit via the shifted sequence, limit laws and uniqueness),
  and *In practice* was restored.
- **`u3/s3` (2026-09-30), new lecture:** Euler's number and subsequences.
  Binomial expansion completed (general term and last term), "decreasing"
  corrected to increasing, the `n_k >= k` claim (set as HW in lecture) is
  `lem:subsequence-index` with the lecture's inductive step, and the
  subsequence proof now runs from `k >= n_eps`. Content change: the lecture
  bounded `y_n` by the infinite geometric series; the notes use the finite
  sum (series are not defined yet). New labels: `thm:binomial`,
  `prop:e-limit`, `def:e`, `def:subsequence`, `ex:alternating-subsequences`,
  `thm:subsequence-limit`. `c3` concept map extended.
- **Build baseline (clean build 2026-09-30):** 52 pages, 0 overfull, 7
  split infos (one `nobreak` pair each on the `prop:e-limit` Idea and the
  `thm:subsequence-limit` proof), 0 undefined references.
- **Known cleveref quirk:** all numbered environments share the `theorem`
  counter, so `\cref` prints "Theorem" for lemmas, propositions and
  examples (e.g. "Theorem 2.4.4" for the lemma). Pre-existing; fix in
  `note.tex` if wanted.
- **Next:** new lectures go into `chapters/u3/` (and `c3.tex`) in the
  `mixed` profile, adding `\label`/`\cref`/`\index` as written (`STYLE.md`
  §5.3–5.4) and extending the `c3` concept map when the chapter grows.
- **Alternative rendering** (not kept in sync with later edits here; covers
  u2/s1–u3/s1): `../note-cambridge-style/` (profile `cambridge`,
  2026-09-26). The Zorich-style rendering was deleted on 2026-09-26 (in git
  history before that date). The
  Cambridge README lists a source issue worth fixing here too: the
  "ℚ is not complete" argument needs density of ℚ. The listed `u3/s1`
  typos were corrected on 2026-09-28.
