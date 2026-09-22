# MATH 147 Notes — Editing Handoff

Read this file first in any new session before touching the notes. It exists so
you (or an agent) don't have to re-derive the project layout, macros, or editing
rules from scratch every time — do that once, then edit one lecture/file at a time.

## What this project is

Undergraduate honours real analysis (MATH 147) lecture notes, LaTeX, for
long-term personal study — not homework submission. Editing goal: keep the
original mathematical content, proof strategy, order, and notation exactly as
written, while improving exposition (motivation, explicit reasoning steps,
LaTeX quality). Full 20-section editing spec is reproduced at the bottom of
this file — do not paraphrase it away, sub-agents need it close to verbatim.

## Project layout

```
note.tex              <- root file, compile this one. Currently has
                          \includeonly{chapters/c2} so only c2 (+ its
                          \input files) actually renders. Update this if
                          you add/enable more chapters later.
chapters/
  c1.tex               <- \input{u1/s1.tex}, course logistics, NOT math content
  c2.tex               <- \input{u2/s1.tex .. s6.tex}, \section{Foundations of Calculus}
                          THIS is the real analysis material.
  u1/s1.tex            <- course logistics (contact info, schedule) — out of scope
  u2/s1.tex            <- Lecture 1: N/Z/Q, sqrt(2) irrational, quantifiers
  u2/s2.tex            <- Mathematical Induction, Well-Ordering Principle
  u2/s3.tex            <- Algebraic & Order Properties of R, |x|, triangle ineq.
  u2/s4.tex            <- Bounds: sup/inf definitions, epsilon-characterization
  u2/s5.tex            <- Completeness, Archimedean Property, sqrt(2) exists,
                          density of Q — HIGHEST PRIORITY section, most care here
  u2/s6.tex            <- Limits of sequences, epsilon-delta, one tikz figure
```

Each `u2/sN.tex` is one lecture / one `\subsection`. **Edit one file per
session** — that's the natural unit, keeps diffs reviewable, and keeps token
cost down (no need to reload the whole project into context, just this file +
this handoff).

Compile with: `latexmk -pdf -interaction=nonstopmode note.tex` from the project
root. Use `latexmk -C note.tex` first if you need a truly clean rebuild (clears
aux/log/fls cache) — do this if you see weird stale-looking warnings.

## Shared-style facts (don't re-read `note.tex` unless you suspect it changed)

`note.tex` loads the installed `qhnotes` package with `color, watermark`
options. `note.tex` itself defines `\paren{}`, `\abs{}`, `\norm{}`,
`\bracks{}`, `\set{}`, `\R`, `\N`, `\Z`, `\Q`, `\C`, `\ds`, `\blue`,
`\red`, and `\mypic`; keep those shortcuts local to the document and reuse
them rather than defining additional variants. Do not copy the package
preamble into `note.tex`.

- Theorem environments, one shared counter numbered by subsection: `theorem`,
  `lemma`, `proposition`, `corollary`, `definition`, `example` (all boxed or
  sidebar-colored via mdframed). Unnumbered: `remark`, `axiom`, `assumption`,
  `notation` (amsthm `\newtheorem*`). `remark` supports an optional title:
  `\begin{remark}[Proof idea] ... \end{remark}` — this is the standard place
  for "Proof idea" / "Why this set" / practical-usage asides. **Do not invent
  new environments.**
- `proof` is redefined (bold non-italic head, own line, blue sidebar box, QED
  symbol is `\blacksquare`).
- Shortcuts: `\R \N \Z \Q \C` (blackboard bold), `\paren{}` = `\left(\right)`,
  `\abs{}` = `\left|\right|`, `\norm{}`, `\bracks{}` = `\left[\right]`,
  `\set{}` = `\left\{\right\}`, `\ds` = `\displaystyle`. Don't add new macros
  unless truly necessary; reuse these.
- Page is narrow (160mm × 240mm custom geometry) — **any `\boxed{...}` or
  similar single-line display must be checked for width**. Long one-liners in
  `\boxed{}` WILL overflow. Wrap in `\begin{array}{c} ... \\ ... \end{array}`
  with manual linebreaks if the boxed content is more than ~6-7 words.
- Each `sN.tex` file ends with (or in s6.tex's case, starts with) a
  `%!TEX root=...` comment — formatting is inconsistent across files
  (sometimes `../../note`, sometimes `../../note.tex`, sometimes leading
  space). Preserve whatever that specific file already has, don't normalize it.

## Known pitfalls hit last time — avoid repeating these

1. **`\fbox{\parbox{...}}` inside `\begin{center}`** to make a highlighted
   summary box: don't do this. It's an unbreakable box and will crash mdframed
   page-splitting if it lands near a page boundary (cascading "Overfull \vbox"
   warnings, escalating pt-by-pt, plus "Box was splittet wrong"). Use the
   existing `remark` environment instead — it's already visually subtle and
   breakable.
2. **A `proof` environment that grows too long** (e.g. after adding a lot of
   explanatory prose inside the proof body itself, not in a separate remark)
   can trigger the same mdframed splitting failure if it straddles a page
   break awkwardly. If you see "Package mdframed Warning: correct box splittet
   fails" or an escalating "Overfull \vbox ... detected at line N" loop:
   - First try trimming the proof body back toward the original wording (put
     the extra explanation in a `remark` before/after the proof instead of
     inline).
   - If that's not enough, the standard fix is to force that one proof box to
     not attempt a split:
     ```
     \mdfsetup{nobreak=true}
     \begin{proof}
       ...
     \end{proof}
     \mdfsetup{nobreak=false}
     ```
     Always reset `nobreak=false` after, or every later boxed environment in
     the document will refuse to split too.
3. **`\boxed{...}` single-line overflow** on the narrow page — see above, wrap
   in `array{c}` with `\\` linebreaks.
4. **Always verify with a full clean rebuild**, not just an incremental one:
   `latexmk -C note.tex && latexmk -pdf -interaction=nonstopmode note.tex`,
   then `grep -iE "overfull|splittet|! |error" note.log`. An incremental
   rebuild can miss a page-count shift that exposes a splitting bug.
5. **Diff against git before trusting sub-agent/self summaries.** Use
   `git diff -- chapters/u2/sN.tex` and manually confirm every original
   equation/inequality/theorem statement is still present verbatim. Sub-agent
   self-reports are not sufficient evidence of correctness on their own.

## Recommended workflow for editing ONE lecture (token-efficient)

1. Read only `handoff.md` (this file) + the one target `sN.tex` file. Do not
   re-read note.tex's preamble or other chapters unless something here seems
   stale (e.g. you suspect the preamble changed).
2. Apply the 20-section spec below to that one file.
3. Write the edited file back.
4. `latexmk -C note.tex >/dev/null 2>&1; latexmk -pdf -interaction=nonstopmode note.tex`
5. `grep -iE "overfull|splittet|! |error" note.log` — fix anything new (see
   pitfalls above) before declaring done.
6. `git diff --stat -- chapters/u2/sN.tex` and a manual read-through of the
   diff to confirm nothing mathematical was altered.
7. If you want to delegate the drafting itself to a cheaper model/sub-agent to
   save tokens, give it: this handoff file's "Preamble facts" + "Known
   pitfalls" sections, the full spec below, and the target file's content —
   then do steps 4-6 yourself before trusting it's done.

## Status as of last session (2026-09-21)

All 6 files in `chapters/u2/` (s1–s6) have already been edited once per this
spec. Baseline was 21 pages; edited version is 29 pages. Build is clean (only
4 pre-existing harmless unresolved refs from the c1/u1 stub, unrelated to c2
content, and one cosmetic ~2.5pt overfull hbox in s5.tex that's not worth
chasing further). If you're revisiting a file, check `git log` /
`git diff HEAD~1` to see what the last pass already added before adding more —
avoid re-adding proof-idea remarks etc. that are already there.

`chapters/u1/s1.tex` and `chapters/c1.tex` (course logistics) have NOT been
touched — they're out of scope for this spec (no theorems/proofs to enrich).

---

## Full editing spec (verbatim reference — pass this to any drafting agent)

This is lecture notes for undergraduate honours real analysis (MATH 147),
intended for long-term personal study and review, not just for submitting
homework. Do NOT rewrite the notes into a different textbook and do NOT
replace the original mathematical arguments with different proofs.

**Highest-priority requirement:** preserve the original mathematical thought
process, proof strategy, order of presentation, definitions, notation, and
course structure, while substantially improving readability, rigor,
exposition, and pedagogical detail.

### 1. Core editing principle
For every section, theorem, proposition, example, proof, corollary, remark:
preserve the original mathematical idea; preserve the original proof strategy
whenever mathematically valid; preserve the current order of results; preserve
notation unless there's a clear consistency problem; don't unnecessarily
shorten arguments; don't replace elementary proofs with more advanced
machinery; don't introduce results that haven't appeared yet unless
absolutely necessary; don't make the notes resemble a different textbook;
don't change the mathematical level of the course. Goal = original content +
clearer logical structure + more motivation + more intermediate reasoning +
better explanation of why each construction is used + better LaTeX.

### 2. Add proof architecture
For important/nontrivial proofs, add a short "Idea"/"Proof strategy" remark
BEFORE the formal proof explaining: what we're trying to prove; what the main
construction is; why that construction is natural; which previous
theorem/axiom is being used; where the contradiction or key step will come
from. Pattern: `\begin{remark}[Proof idea] ... \end{remark}`. Not excessively
verbose.

### 3. Break long proofs into logical steps
When a proof has several conceptually different moves, split into labeled
steps (`\textbf{Step 1: ...}`, etc.) — only where it genuinely improves
readability. Do not mechanically add steps to every short proof.

### 4. Explain why sets are constructed
Whenever a set like `A = {n in N : y < n}` or `S = {t in R : t >= 0, t^2 < 2}`
is introduced, explicitly explain in prose why that particular set is the
natural one to consider for the argument at hand.

### 5. Distinguish supremum / minimum / maximum / infimum
Make explicit why a proof uses supremum, infimum, minimum, maximum, or the
well-ordering principle. Highlight: completeness applies to suitable subsets
of R; well-ordering applies to nonempty subsets of N; a supremum need not
belong to the set; a minimum must belong to the set; an unbounded-above set
has no real supremum. If a tempting-but-wrong alternative exists, add a short
remark on why it fails.

### 6. Expand definitions into practical usage
After important definitions (upper/lower bound, supremum, infimum,
completeness, convergence, injective/surjective/bijective), add a short
practical-interpretation remark — supplementing, not replacing, the formal
definition. E.g. after supremum: "to show u = sup S, verify (1) u is an upper
bound, (2) no smaller number is; equivalently, for every epsilon>0 there is
x in S with u-epsilon < x <= u."

### 7. Make implication chains explicit
Don't skip mathematically simple but conceptually important reasoning. Spell
out why each step follows from the last (e.g. "since u is the least upper
bound, any smaller number can't be an upper bound, hence u-1 is not an upper
bound for N, hence there exists m in N with u-1 < m").

### 8. Highlight key mechanisms (sparingly)
After especially important proofs, optionally add a concise boxed summary
exposing the proof mechanism, e.g.
`\[\boxed{\text{Completeness}+\text{closure of }\N\text{ under }+1 \Longrightarrow \text{Archimedean Property}}\]`.
Use sparingly (a couple per file at most). **Check page width — wrap in
`array{c}` with manual linebreaks if long, see pitfalls above.**

### 9. Improve English and mathematical prose
Fix grammar, punctuation, awkward phrasing, inconsistent terminology,
repetition, unclear antecedents, informal wording. Prefer standard
mathematical English, not excessively formal or ornate.

### 10. Preserve the current visual system
Reuse existing theorem/definition/proof environments and colors. Don't
redesign. If genuinely needed, the `remark` environment (with optional
bracket title) is the one lightweight vehicle for explanatory asides — keep
it visually subtle, don't add new colored boxes.

### 11. Special attention: bounds and completeness (s4.tex, s5.tex)
Extra care on: bounded sets; upper/lower bounds; supremum/infimum;
epsilon-characterization of supremum; completeness of R; Archimedean
Property; inf{1/n} = 0; existence of n with n-1 <= y < n; existence of
sqrt(2); density of Q; failure of completeness of Q. Later analysis depends
on these being exceptionally clear.

### 12. Archimedean Property (s5.tex)
Retain the current contradiction argument using u = sup N. Make explicit:
(1) suppose N bounded above; (2) completeness gives u = sup N; (3) u-1 < u
so u-1 is not an upper bound (explain why — least upper bound principle);
(4) hence exists m in N with u-1 < m; (5) hence u < m+1; (6) m+1 in N
(inductive closure); (7) u is an upper bound so m+1 <= u; (8) contradiction.
Emphasize both completeness AND inductive closure (`m in N => m+1 in N`) are
used.

### 13. Integer-location result (s5.tex, corollary part c)
Preserve `A = {n in N : y < n}`. Explain: Archimedean makes A nonempty; A
subset of N; Well-Ordering gives `n_y = min A`; `y < n_y` since `n_y in A`;
if `n_y - 1 > y` then `n_y - 1` would also be in A, contradicting minimality.
Add a remark on why this is a minimum argument, not a supremum argument (A is
generally unbounded above, so sup A wouldn't even be useful/finite; but
well-ordering doesn't need boundedness above).

### 14. Existence of sqrt(2) (s5.tex)
Preserve `S = {t in R : t >= 0, t^2 < 2}`, `x = sup S`. Before the technical
proof, explain the architecture: x^2 < 2 means x too small, can move right and
stay in S; x^2 > 2 means x too large, can move left and stay an upper bound;
both contradict x = sup S; therefore x^2 = 2. Keep the detailed inequalities,
connect each to its purpose. Do NOT replace with continuity/IVT/decimal
expansion/Dedekind cuts.

### 15. Density of Q (s5.tex)
Preserve the Archimedean-Property-based proof. Explain roles of n and m:
choose n large enough that 1/n < y-x (spacing smaller than interval length);
choose m as the integer just right of nx; m/n lands strictly between x and y.
This picture should appear before/during the proof.

### 16. Limits section (s6.tex)
Keep the formal epsilon definition but add a plain-language interpretation:
"for every tolerance epsilon>0, all sufficiently late terms lie inside
(a-epsilon, a+epsilon)." Clarify roles of epsilon, n_epsilon, "for all
n>=n_epsilon", and the dependence of n_epsilon on epsilon. Don't expand into
a full textbook chapter (no subsequences/Cauchy/limit algebra) unless later
material in the actual notes requires it.

### 17. LaTeX quality
Consistent spacing; consistent equation environments; proper `\text{}`; avoid
unnecessary display equations; avoid malformed line breaks; avoid overfull
boxes (check page width, see pitfalls); use `align*` for chains of
equalities/inequalities when clearer; keep theorem numbering and
cross-references intact; don't break existing macros; don't remove existing
custom commands unless necessary. **Compile after editing and fix all LaTeX
errors/warnings introduced.** Don't modify package choices unless necessary.

### 18. Do not overedit
Avoid: rewriting every paragraph; excessive philosophical or historical
material; replacing proofs with shorter "standard" ones; advanced
topology/abstract analysis premature for the course level; too many remarks;
expanding trivial algebra; doubling length without clear pedagogical benefit.
Length growth should come from explaining logical transitions and proof
strategy, not padding.

### 19. Workflow (per section/file)
1. Read the original carefully. 2. Identify the existing mathematical
argument. 3. Preserve it. 4. Improve exposition. 5. Add missing motivation
only where useful. 6. Add intermediate reasoning where a reader could get
lost. 7. Correct English and LaTeX. 8. Compile/check. 9. Move to the next
section. Edit the actual files — don't just give suggestions.

### 20. Final quality standard
The finished notes should read like "my original MATH 147 notes, but written
by a mathematically mature version of myself who carefully explains why each
step is being taken." A reader returning one or two years later should
recover not just theorem statements and calculations but the main proof
ideas. Preserve compactness where the math is straightforward; expand where
conceptual reasoning matters.
