# MATH 147 Notes — Editing Handoff

Read this file first in any new session before touching the notes. It exists so
you (or an agent) don't have to re-derive the project layout, macros, or editing
rules from scratch every time — do that once, then edit one lecture/file at a time.

**The "Presentation standard" section below is the current house style for all
MATH 147 notes and overrides the older spec wherever they disagree.** The
notes in this directory already follow it; `style-migration.md` records the
conversion.

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
                          no active \includeonly, so all chapters render.
chapters/
  c1.tex               <- \section{Course Information}; \input{u1/s1.tex}
  c2.tex               <- \section{The Real Number System}; u2/s1..s5
  c3.tex               <- \section{Sequences and Limits}; u3/s1
                          THIS is the real analysis material.
  u1/s1.tex            <- Logistics (contact info, schedule) — out of scope
  u2/s1.tex            <- Numbers and Logic: N/Z/Q, sqrt(2) irrational,
                          quantifiers (European-style notation box)
  u2/s2.tex            <- Induction and Well-Ordering
  u2/s3.tex            <- R as an Ordered Field: field/order axioms, |x|,
                          triangle inequality
  u2/s4.tex            <- Suprema and Infima, epsilon-characterization
  u2/s5.tex            <- Completeness and Its Consequences: Archimedean
                          Property, sqrt(2) exists, density of Q, countability
                          — HIGHEST PRIORITY section, most care here
  u3/s1.tex            <- Convergent Sequences: limit, uniqueness, divergence,
                          boundedness, divergence to +-infinity
```

Each `uN/sN.tex` is one lecture / one `\subsection`. **Edit one file per
session** — that's the natural unit, keeps diffs reviewable, and keeps token
cost down (no need to reload the whole project into context, just this file +
this handoff).

Compile with: `latexmk -pdf -interaction=nonstopmode note.tex` from the project
root. Use `latexmk -C note.tex` first if you need a truly clean rebuild (clears
aux/log/fls cache) — do this if you see weird stale-looking warnings.

## Shared-style facts (don't re-read `note.tex` unless you suspect it changed)

`note.tex` loads the installed `qhnotes` package with the `color` option
(default font: Times). `note.tex` also defines the MATH 147-only `idea` and
`scratch` environments, and `\paren{}`, `\abs{}`, `\norm{}`,
`\bracks{}`, `\set{}`, `\R`, `\N`, `\Z`, `\Q`, `\C`, `\ds`, `\blue`,
`\red`, and `\mypic`; keep those shortcuts local to the document and reuse
them rather than defining additional variants. Do not copy the package
preamble into `note.tex`.

- Theorem environments, one shared counter numbered by subsection: `theorem`,
  `lemma`, `proposition`, `corollary`, `definition`, `example` (all boxed or
  sidebar-colored via mdframed). Unnumbered: `remark`, `axiom`, `assumption`,
  `notation` (amsthm `\newtheorem*`). Proof ideas do **not** go in `remark`;
  use the MATH 147-local `idea` / `scratch` environments or prose, per the
  Presentation standard below. **Do not invent further environments.**
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
- Each `sN.tex` file has a
  `%!TEX root=...` comment — formatting is inconsistent across files
  (sometimes `../../note`, sometimes `../../note.tex`, sometimes leading
  space). Preserve whatever that specific file already has, don't normalize it.

## Presentation standard (adopted 2026-09-25)

Applies to every MATH 147 note file. The current `chapters/` follow it;
`style-migration.md` lists every conversion made.
Overrides spec §2, §6, §8 and §10 below, and the older "use `remark[Proof
idea]`" rule.

### 1. Proof ideas: four devices

| Device | Use when | Form |
|---|---|---|
| `\begin{idea}` | the strategy fits in 1–3 sentences | pale-blue box directly above the `proof` |
| `\begin{scratch}` | the proof must *choose* something ($n_\epsilon$, $\epsilon/2$, how small a nudge $1/n$) | grey box titled *Scratch work*: work **backwards** from the goal to the choice; the proof then runs forwards |
| motivation prose | the explanation is really "why this construction / what are we looking for" | plain paragraph(s) **before** the statement (Abbott style) |
| nothing | the proof is ≤ 3 lines and explains itself | — |

An `idea` states the plan, not the proof: no inequalities chains, no case
analysis. Do not repeat the Idea/Scratch text inside the proof; if a proof
opens by restating its idea, cut that opening. Both environments are defined
in `note.tex` (local to MATH 147 — **do not move them into the shared
`qhnotes` package**; other courses are not on this standard).

### 2. Remarks are rare

A `remark` is kept only for a genuine conceptual trap that a reader could get
wrong: quantifier order, min vs sup, sup vs max, and similar. Everything else
that used to be a remark becomes:
- **prose** — bridges, readings of a definition, geometric interpretations,
  "the converse fails" notes, previews;
- **part of an Idea** — "this step is the ε-characterisation with ε = 1";
- **In practice** (see §3) — recipes, templates, techniques;
- **deleted** — anything that repeats nearby text.

Remarks are unboxed, so a prose paragraph directly after a remark needs
`\medskip\noindent` or a heading, or it reads as part of the remark.

### 3. "In practice" at the end of each lecture file

Techniques and recipes ("to show $u=\sup S$, check …", induction template,
case-split with trichotomy, add-and-subtract) are collected at the **end** of
their `\subsection` (one `uN/sN.tex` file) under

```latex
\subsubsection*{In practice}
\begin{itemize}
    \item \textbf{Short name.} One to three sentences.
\end{itemize}
```

Unnumbered, not in the TOC. Omit the block when a file has no techniques;
never invent filler.

### 4. Quantifiers: European style

Each quantifier in parentheses, the governed statement in square brackets,
read left to right; no trailing "$\forall c$" after a formula.

```latex
(\forall\epsilon>0)(\exists n_\epsilon\in\N)(\forall n\geq n_\epsilon)\,\bigl[\abs{x_n-a}<\epsilon\bigr]
\neg(\forall n\in\N)\,[P(n)] \iff (\exists n\in\N)\,[\neg P(n)]
```

Use `\bigl[ \bigr]` when the bracketed statement contains `\abs{}` or
fractions. Words ("for every $x$ there exists …") remain fine in prose and in
theorem statements; the rule is about symbolic formulas. The convention is
stated once, in the `notation` box in `u2/s1`.

### 5. Headers

- `\section` (chapter file `cN.tex`) = the topic: *The Real Number System*,
  *Sequences and Limits*.
- `\subsection` (one lecture file) is named by content, never "Lecture N".
- `\subsubsection` marks each major block so the TOC is skimmable — roughly
  one per 2–4 pages (e.g. *The Field Axioms*, *The Existence of $\sqrt2$*,
  *Uniqueness of the Limit*). Title case; math allowed in titles.
- `\subsubsection*{In practice}` is always last in its file.

### 6. Typography

Times text + matching math (newtx) — the usual face of modern mathematical
publishing (Springer, Elsevier, most journals). Since 2026-09-25 this is the
**`qhnotes` default**, so `\usepackage[color]{qhnotes}` is enough; the
`latinmodern` option restores the old face. Body size is **11pt**
(`\documentclass[11pt]{article}`): Times is narrow, and at 10pt lines ran
to ~90 characters on the 124 mm text block.

Page stays at the `qhnotes` default 160×240 mm (close to Springer's
155×235 mm trim). Tried and rejected: Century Schoolbook (`fouriernc`),
Concrete + Euler (no bold), Palatino. `idea` / `scratch` stay local to
MATH 147's `note.tex`.

Switching fonts moves page breaks: after any font or size change, do a clean
rebuild and check for the mdframed split loop (pitfall 2) and for boxes
split badly across pages. At 11pt: the ε-characterization **lemma statement**
in `u2/s4` is wrapped in `\mdfsetup{nobreak=true}` (it used to leave one word
on the next page), and the `[0,1)` example no longer nests its two proofs
inside the example box (nested mdframed boxes cannot split, which left a
third of a page blank). Avoid nesting `proof` inside `example` in general.

## Known pitfalls hit last time — avoid repeating these

1. **`\fbox{\parbox{...}}` inside `\begin{center}`** to make a highlighted
   summary box: don't do this. It's an unbreakable box and will crash mdframed
   page-splitting if it lands near a page boundary (cascading "Overfull \vbox"
   warnings, escalating pt-by-pt, plus "Box was splittet wrong"). Use the
   prose or, for a genuine conceptual trap, a `remark` — both are breakable.
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

The original 6 files in `chapters/u2/` (s1–s6) were edited once per this
spec. Baseline was 21 pages; edited version is 29 pages. Build is clean (only
4 pre-existing harmless unresolved refs from the c1/u1 stub, unrelated to c2
content, and one cosmetic ~2.5pt overfull hbox in s5.tex that's not worth
chasing further). If you're revisiting a file, check `git log` /
`git diff HEAD~1` to see what the last pass already added before adding more —
avoid re-adding proof-idea remarks etc. that are already there.

`chapters/u1/s1.tex` and `chapters/c1.tex` (course logistics) have NOT been
touched — they're out of scope for this spec (no theorems/proofs to enrich).

## Status update (2026-09-25)

All of `chapters/` was converted to the Presentation standard (see
`style-migration.md`): 14 proof-idea remarks became Idea / Scratch work /
motivation prose, remarks went from 22 to 4, techniques moved to
end-of-lecture *In practice* blocks, symbolic logic is European style, headers
were renamed by content, and the font is Times. The conversion was drafted in
`../note-mixed-style/` and copied here; that directory was then removed. Then
switched to 11pt. Clean build: 35 pages, 0 overfull.

`../note-zorich-style/` is an older, separate experiment and does not follow
this standard.

## Status update (2026-09-23)

The former `u2/s6.tex` sequence-limit introduction is now in `u3/s1.tex`.
The continuous-function limit example was replaced by a graph of the discrete
sequence $1/n$ entering an epsilon band. `c2.tex` ends at `u2/s5.tex`, while `c3.tex` includes
the combined sequence lecture. The root currently builds all chapters.

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
*(Superseded by Presentation standard §1.)* For important/nontrivial proofs,
make the plan visible BEFORE the formal proof: what we're trying to prove;
what the main construction is; why that construction is natural; which
previous theorem/axiom is being used; where the contradiction or key step will
come from. Use `idea`, `scratch`, or motivation prose — not a remark.

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
*(Superseded by Presentation standard §2–§3.)* After important definitions
(upper/lower bound, supremum, infimum, completeness, convergence,
injective/surjective/bijective), give a one-sentence plain reading in prose
right after the definition, and put the working recipe in the file's
*In practice* block — supplementing, not replacing, the formal definition. E.g. after supremum: "to show u = sup S, verify (1) u is an upper
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
*(Amended by Presentation standard.)* Reuse existing theorem/definition/proof
environments and colors, plus the local `idea` and `scratch` boxes. Don't add
further colored boxes. Explanatory asides go in prose; `remark` is only for
conceptual traps.

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

### 16. Limits section (now u3/s1.tex)
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
