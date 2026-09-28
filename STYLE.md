# Course Notes — Writing and Style Standard

This is the style guide for every note set in this repository. `HANDOFF.md`
covers the operational side (repository map, build, workflow, hygiene); this
file covers *what the notes should look like and how they should read*.

Precedence: a course's own `handoff.md` > this file > general habit. A course
handoff may switch a device off or tune it, but should say so explicitly.

Contents:

1. Editorial principles (apply everywhere)
2. Device catalogue — named presentation devices (Idea, Trap, …)
3. Style profiles — complete ways of writing a note set (`mixed`, `rudin`, …)
4. Mathematical writing conventions
5. LaTeX conventions
6. Layout pitfalls on the `qhnotes` page
7. Review checklist

---

## 1. Editorial principles

**Voice.** *My own notes, written clearly enough that a future me can recover
the ideas, not only the final answers.* Standard mathematical/technical
English, neither chatty nor ornate. Useful course vocabulary stays.

**P1 — Teach the idea, then record the result.** For each substantial topic a
returning reader should be able to answer: What problem is this for? What is
the exact definition/rule? How is it used in a representative example? What
reasoning links hypotheses to conclusion? What confusion or boundary matters?
One well-chosen sentence often answers several of these. Expand conceptual
jumps, not routine algebra or obvious syntax.

**P2 — Preserve the course's reasoning.** Keep the source's definitions,
notation, order of results, proof strategy, and level. Do not replace an
elementary argument with a shorter one that uses heavier machinery, and do not
introduce results that have not appeared yet. Correct genuine errors, but
treat any change to a statement, hypothesis, strategy, or notation used
elsewhere as a *content change*: check the surroundings and record why in the
commit message or course handoff.

**P3 — Examples do work.** An example must instantiate a definition,
demonstrate a method, separate nearby concepts, or expose an edge case.
Explain its decisive step. No filler examples.

**P4 — Make scope visible.** State hypotheses, domains, quantifier order,
types, and preconditions where they matter. Distinguish definition from
theorem, example from proof, implication from converse. For code: source text
vs. evaluation vs. value vs. error.

**P5 — Durable notation.** Use the notation of the course root, consistently.
Define a nonstandard symbol at its first useful use. Never normalise notation
across courses.

**P6 — Skimmable.** Prose for explanation, displays for equations that
deserve one, lists only for genuine collections. Descriptive headings. Focused
paragraphs. A long proof may be staged; a short one stays short.

**P7 — Rewrite, don't paste.** Lecture slides, textbooks, and assignments are
sources, not text to copy. Name a source briefly when it materially matters.
No private course-platform content or credentials in the repository.

**P8 — Do not overedit.** Length growth must come from explaining transitions
and strategy, not padding. Avoid: rewriting every paragraph, history and
philosophy, premature abstraction, stacks of remarks, expanding trivial
algebra, doubling a file's length without clear benefit.

**P9 — Never invent course content.** If a lecture source is illegible,
incomplete, or ambiguous, do not guess. Write what is certain and leave a
source comment `% TODO(check): <what is unclear>` (see §5.1). A missing proof
may be completed only when the user asks, and the completion must be marked
in the commit message.

---

## 2. Device catalogue

Each device is a named, reusable way of presenting one kind of content. A
profile (§3) decides which devices a course uses, so a device that one
profile requires may be forbidden by another (e.g. Idea boxes are `mixed`
only). Do not invent further boxed environments or colours; everything below
is built from the environments `qhnotes` already provides (for `cambridge`,
see its own mapping in §3.8), plus the MATH 147-local
environments `idea` and `scratch` and the macro `\insymbols` (a course that
adopts them copies their definitions from `1a/math147/note-course/note.tex`
into its own root).

### 2.1 Statement devices

| Device | Markup | Use for |
|---|---|---|
| Definition | `definition` | a new term; put the defined word in `\term{}` if the root prints an index |
| Result | `theorem` / `proposition` / `lemma` / `corollary` | theorem = major named result; proposition = ordinary result; lemma = tool for a later proof; corollary = quick consequence |
| Named result | `\begin{theorem}[Archimedean Property]` | any result the course or the literature refers to by name |
| Axiom / assumption | `axiom`, `assumption` | assumed, not proved (e.g. completeness, induction principle) |
| Notation box | `notation` | a convention used for the rest of the document; state it once |
| Worked example | `example` + `proof` or prose after it | demonstrates a method; the task goes in the box, the solution after it (never nest `proof` inside `example`, see §6) |
| Counterexample | `\begin{example}[Counterexample]` | shows a converse fails or a hypothesis is needed; say *which* hypothesis/implication fails |

### 2.2 Explanation devices

| Device | Markup | Use when | Limits |
|---|---|---|---|
| **Lecture opener** | 1–2 sentences of prose right after `\subsection` | every lecture file in `mixed`, `zorich`, `computation`: what problem this lecture solves or what it builds toward | no preview lists, no history |
| **Motivation prose** | paragraph(s) *before* a statement | the explanation is really "why this construction / what are we looking for" | — |
| **Reading** | one sentence after a definition: "In words: …" | a definition with quantifiers or several conditions | one sentence; recipes go to *In practice* |
| **Idea** | `\begin{idea}` directly above `proof` | the proof strategy fits in 1–3 sentences | states the plan only: no inequality chains, no case analysis; the proof must not repeat it |
| **Scratch work** | `\begin{scratch}` between statement and `proof` | the proof must *choose* something ($n_\epsilon$, $\epsilon/2$, $\delta$, a nudge $1/n$) | works **backwards** from the goal to the choice; the proof then runs forwards |
| **Nothing** | — | the proof is ≤ 3 lines and explains itself | — |
| **Trap** | `\begin{remark}[<the confusion>]`, e.g. `[Why $\min$, not $\sup$]` | a genuine conceptual trap: quantifier order, sup vs max, min vs sup, a tempting wrong step | rare (a few per chapter); title names the trap; everything else is prose, Idea, or *In practice* |
| **Symbolic form** | `\insymbols{…}` as the last line inside the statement box (local macro, like `idea` / `scratch`) | every theorem-like statement, so the words and the logic can be compared | quantifiers and connectives only, in the profile's quantifier style; notation defined *before* the statement (sup, \|·\|, →) may be used, anything newer is unfolded; multi-part results use `aligned` with the statement's own labels |
| **Negation line** | display after the definition's symbolic form | a quantified definition whose negation is used later (divergence, unboundedness, discontinuity) | the negation only, in the same quantifier style |
| **Comparison table** | small `tabular` | ≥ 3 nearby concepts share ≥ 2 attributes (upper bound / supremum / maximum; injective / surjective / bijective) | fits in `\linewidth`; no colour |
| **Key mechanism** | `\[\boxed{\text{…}}\]` after a proof | the whole proof reduces to one memorable implication | ≤ 2 per file; width check (§6, item 4) |
| **Figure** | TikZ in `center` or `figure` | ordering, geometry, or an ε-band carries the idea | ≤ `0.9\linewidth`; caption only when the figure needs explanation |

### 2.3 Proof devices

- **Staged proof.** `\textbf{Step 1: <purpose>.}` only when a proof has
  several conceptually different moves. Title each step by what it achieves.
- **Cases.** `\textbf{Case 1: $x>0$.}`; say why the cases are exhaustive
  (e.g. trichotomy) unless obvious.
- **Justified chain.** In a multi-step `align*` whose steps each use a
  different axiom or earlier result, annotate the step:
  `&= a + (b + c) && \text{(F2)}`. Short tags only; on the narrow page prefer
  prose after the display if the reasons are long.
- **Explicit implication chains.** Spell out conceptually important links
  ("since $u$ is the *least* upper bound, $u-1$ is not an upper bound, so there
  is $m\in\N$ with $u-1<m$"). Name the axiom, definition, or result that
  licenses a key step.
- **Constructed objects.** When a set, sequence, or function is introduced
  for an argument, say in one sentence why it is the natural one.
- **Contradiction / induction.** State the assumption being contradicted or
  the induction hypothesis explicitly, and say where it is used.

### 2.4 End-of-lecture devices

In profiles that use them (`mixed`, `legacy`, `computation`,
`programming`), always the last things in a lecture file, in this order, and
omitted when empty — never invent filler. `rudin`, `zorich`, `abbott`,
`tao` and `cambridge` place exercises as their own sections describe.

```latex
\subsubsection*{In practice}
\begin{itemize}
    \item \textbf{Short name.} One to three sentences: the recipe or technique.
\end{itemize}

\subsubsection*{Exercises}
\begin{enumerate}
    \item Exercise from lecture or the textbook (say which, briefly).
\end{enumerate}
```

- **In practice**: techniques and templates taught or used in this lecture
  ("to show $u=\sup S$, check …", induction template, add and subtract).
- **Exercises**: problems the course posed, or self-made ones marked
  "(own)". No full solutions in the notes; a one-line hint is allowed.
  Assignment problems do not go here (they live in `hw/`).

Both headings are starred: unnumbered and absent from the TOC.

---

## 3. Style profiles

A **profile** is a complete, named way of writing a note set: which devices
it uses, how it is structured, and what voice it has. A course handoff names
its profile in its first lines; a new course picks one when its `handoff.md`
is created.

Current assignments (keep in sync with the table in `HANDOFF.md`):

| Note set | Profile |
|---|---|
| `1a/math147/note-course` | **`mixed`** |
| `1a/math147/note-cambridge-style` | `cambridge` (alternative rendering) |
| `1a/math135` | `legacy` |
| `1a/math147/hw`, `1a/math135/hw` | `homework` |
| `1a/ENGL119` | `writing` |

There are two families:

- **Mathematical exposition styles** (§3.1–§3.9) for proof-based
  mathematics: `mixed` (the house default), `rudin`, `zorich`, `abbott`,
  `tao`, `cambridge`, and `legacy`. The author-named styles are modelled on a textbook's
  *way of explaining*, never on its content or proofs.
- **Course-type profiles** (§3.10) for everything else: `computation`,
  `programming`, `writing`, `homework`.

### 3.1 Rules common to all exposition styles

1. **A style changes exposition only.** P2 still binds: the lecturer's
   definitions, notation, order, and proof strategies stay, whatever the
   style. Rudin's shorter proof of a theorem is *not* part of the `rudin`
   style; its terseness is.
2. **One style per note set.** Do not mix styles inside one `note.tex`.
3. **Alternative renderings live beside the course notes.** To try another
   style on an existing course, rewrite into a sibling directory
   `note-<style>-style/` (as `1a/math147/note-cambridge-style/`), never inside
   `note-course/`. Give it a `README.md` with: the model book, a source map
   (new file → original file), the style rules used, and a section
   *Content changes beyond wording* listing every mathematical change.
4. **Built from the shared environments.** Except `cambridge` (§3.8), a
   style may set heading formats, the `numberwithin` option, and at most the
   local `idea` / `scratch` environments in its `note.tex`. It may not add packages, colours, or new
   boxes (§5.5).
5. **Imitate the method, not the text.** Never copy sentences, examples, or
   exercises from the model book.

### 3.2 Choosing a style

| | `mixed` | `rudin` | `zorich` | `abbott` | `tao` | `cambridge` |
|---|---|---|---|---|---|---|
| Model | house style (MATH 147) | *Principles of Mathematical Analysis* | *Mathematical Analysis I* | *Understanding Analysis* | *Analysis I* | Cambridge Tripos notes (Dexter Chua) |
| Rough target length vs. lecture | +40–70% | −10 to +10% | +20–40% | +50–80% | +40–70% | +10–30% |
| Motivation | Idea / Scratch boxes, prose before hard results | one sentence per chapter | 1–2 sentences per chapter and section | a discussion before every major result | a remark on why a definition is shaped this way | an introduction chapter, a paragraph per chapter, "Intuitively, …" sentences |
| Proof ideas | boxed (Idea, Scratch work) | none | one prose sentence before the proof | long prose before the statement | none; each step justified instead | one prose sentence at most |
| Logic notation | European quantifiers | words | European quantifiers, symbolic definitions | words | words, with formal/informal distinction | words |
| Remarks | Traps only | short untitled observations | rare | rare (discussion is prose) | frequent | frequent; traps as `warning` |
| Exercises | end of lecture | end of chapter | end of section | end of section | end of section, cited from the results they prove | occasional inline `ex` |
| Best for | first-pass study and review | a compact reference sheet after the course | rigorous yet readable reference | building intuition for hard topics | foundations, constructions from axioms | a complete record of a whole course, dense but readable |

Default for new proof-based courses: `mixed`. When the user asks for "a
<author>-style version", use §3.1 rule 3.

### 3.3 `mixed` — house default (assigned: MATH 147)

Named after its drafting directory `note-mixed-style/`: it mixes boxed
proof aids with textbook prose.

- **Structure.** `\section` topic → `\subsection` lecture → `\subsubsection`
  blocks (§5.2). Each lecture starts with a Lecture opener and ends with
  *In practice* (then *Exercises*, if any).
- **Before results.** Motivation prose when the question is *why this
  construction*; a Reading sentence after quantified definitions.
- **Proof ideas.** Idea (1–3 sentences), Scratch work (backward search for a
  choice), motivation prose, or nothing (§2.2). Never `remark[Proof idea]`.
- **Remarks.** Traps only.
- **Logic.** European quantifier style, stated once in a `notation` box.
- **Symbolic forms.** Every theorem, proposition, lemma, corollary and
  axiom (and any principle typeset as a definition) ends with a Symbolic
  form (§2.2).
- **Extras.** Key mechanism lines (≤ 2 per file), Negation lines,
  Comparison tables, figures where a picture carries the idea.
- **Not this style:** unboxed "Proof idea" remarks; recipes inside remarks;
  an Idea that previews the inequalities of the proof.

### 3.4 `rudin` — terse reference

Model: Rudin, *Principles of Mathematical Analysis*. The notes become a
compact, exact reference: every word is load-bearing, and the reader is
expected to supply routine verifications.

- **Voice.** Impersonal "we"; short declarative sentences; no rhetorical
  questions, no "note that", no "clearly" unless it truly is.
- **Structure.** `numberwithin=section`, so every statement shares one
  counter per chapter (1.1 Definition, 1.2 Theorem, 1.3 Example, …).
  `\subsection` only for the lecture/topic; no `\subsubsection` blocks, no
  *In practice*.
- **Motivation.** One sentence at the start of each chapter, at most. None
  before individual results.
- **Definitions.** Stated once, precisely, with the defined word in
  `\term{}`. Several related definitions may share one `definition`
  environment as an enumerated list. No Reading sentence.
- **Proofs.** Keep the lecturer's argument, but write it at its minimal
  complete length: omit restatements, keep every non-routine inference.
  Routine verifications may be left as "it is easy to verify that …" *only*
  if the step is genuinely routine for the course level. No Idea, no Scratch
  work, no staged proofs unless the proof is longer than half a page.
- **Examples.** Few and sharp, mostly counterexamples that show a
  hypothesis cannot be dropped: `\begin{example}[Counterexample]`.
- **Remarks.** Untitled `remark` for a short observation or a comment on
  a hypothesis; the Trap device is not used.
- **Logic.** In words ("for every $\epsilon>0$ there is an integer $N$ such
  that …"); no bracket notation.
- **Exercises.** Collected at the end of the chapter file `cN.tex` under
  `\subsection*{Exercises}` (numbered list), none per lecture.
- **Figures.** None, unless the lecture itself relied on one.
- **Not this style:** motivational prose, boxed summaries, figures, colour
  emphasis (`\blue`, `\red`), repeated statements, bullet-point recipes.

### 3.5 `zorich` — rigorous and readable

A MATH 147 rendering in this style existed until 2026-09-26; it can be
recovered from git history (`git show aa70c37:1a/math147/note-zorich-style/README.md`).

Model: Zorich, *Mathematical Analysis I*. Formal statements in logical
symbolism with a plain reading beside them; motivation is brief but always
present.

- **Voice.** "Let us …", "We now show …"; measured, explanatory.
- **Structure.** Chapter (`\section`) → numbered section 1.3
  (`\subsection`) → lettered subsection a., b., … (`\subsubsection`).
  Implement the letters in `note.tex`:
  ```latex
  \renewcommand{\thesubsubsection}{\alph{subsubsection}}
  \makeatletter
  \renewcommand{\@seccntformat}[1]{%
    \csname the#1\endcsname\csname qh@punct@#1\endcsname\quad}
  \newcommand{\qh@punct@subsubsection}{.}
  \makeatother
  ```
  Every chapter and every section opens with one or two sentences saying
  what it is for.
- **Definitions.** In quantifier form (European style) where a formula
  exists, followed immediately by a plain-language reading; defined words in
  `\term{}` (the root prints an index).
- **Proof ideas.** One or two prose sentences *before* the proof; no boxes.
  The proof itself stays short.
- **Remarks.** Rare: a real conceptual point only (quantifier order, sup vs
  max). No boxed slogans, no Key mechanism lines.
- **Recipes.** As a prose paragraph right after the result they come from
  ("Thus, to prove $u=\sup S$ one checks two things: …"), not in an
  *In practice* list.
- **References.** Every result that is used later is labelled (§5.3) and
  cited by number where it is used.
- **Exercises.** End of section, under `\subsubsection*{Problems and
  Exercises}`.
- **Not this style:** Idea/Scratch boxes, In practice lists, long informal
  discussion, unlabelled results that are cited later.

### 3.6 `abbott` — discussion first

Model: Abbott, *Understanding Analysis*. Every major result is reached
through a question, so the reader sees why the theorem must be true before
reading its proof.

- **Voice.** Conversational but precise; direct questions are allowed
  ("Can a set of rationals have an irrational supremum?").
- **Structure.** Each chapter opens with `\subsection*{Discussion: <the
  question>}`: a concrete puzzle or a failed naive attempt that the chapter
  answers. Each chapter closes with `\subsection*{Epilogue}`: one or two
  paragraphs on what was gained and where it leads next in the course.
- **Before results.** Substantial motivation prose (a paragraph or more)
  before every theorem that is not routine: try the naive approach, see it
  fail, extract the right hypothesis.
- **Proof ideas.** In the motivation prose, not in boxes. Scratch work may
  appear as prose ("To find $N$, we work backwards: …").
- **Examples.** Exploratory examples come *before* the definition they
  motivate, as well as after it.
- **Remarks.** Rare; the discussion does their job.
- **Exercises.** End of section, numbered; conceptual questions ("Decide
  whether …, and justify") are preferred to drills.
- **Not this style:** statement dumps, results without a question behind
  them, boxed summaries.

### 3.7 `tao` — built from the axioms

Model: Tao, *Analysis I*. Nothing is taken on faith: each object is
constructed, each step is justified by a cited axiom, definition, or earlier
result, and the reader is repeatedly asked to prove the small results.

- **Voice.** Careful and explicit; distinguishes formal definitions from
  informal intuition ("Informally, … . Formally, …").
- **Structure.** `numberwithin=subsection`; one `\subsection` per topic.
- **Definitions.** Every definition labelled and numbered; after it, a
  `remark` on *why* it is shaped that way or what would go wrong with an
  obvious alternative.
- **Proofs.** Fully justified: each nontrivial step cites what licenses it
  (Justified chains, §2.3, are the normal form). No "clearly". Staged proofs
  are common.
- **Results left as exercises.** A small result that the lecture stated
  without proof, or a routine consequence, is still stated where it is first
  needed, followed by "\emph{Proof.} See Exercise~\ref{exr:…}."; the
  exercise itself goes in `\subsubsection*{Exercises}` at the end of the
  lecture file. Never turn a result that the lecture *did* prove into an
  exercise.
- **Remarks.** Frequent and short: scope of a definition, why a hypothesis
  is needed, formal vs informal reading.
- **Logic.** In words, with symbolic forms only where the course used them.
- **Not this style:** skipped justifications, forward references to results
  not yet proved, pictures used as proofs.

### 3.8 `cambridge` — a complete, lecture-faithful record (reference: `1a/math147/note-cambridge-style`)

Model: Cambridge Mathematical Tripos notes as typeset by Dexter Chua
(dec41.user.srcf.net/notes). Dense but readable: every lecture is recorded
in full, statements are plain and unboxed, and short informal sentences
carry the intuition between them.

- **Root.** The one profile that does *not* use `qhnotes`: start from
  `~/references/template/cambridge/template.tex` (standalone preamble, kept
  verbatim; an exception to §3.1 rule 4). Fill in `\npart` (the term, e.g.
  `1A`), `\nterm`, `\nyear`, `\nlecturer`, `\ncourse`. The template already
  has `\R \N \Z \Q \C`, `\abs`, `\norm`, `\term`; if the lectures need
  `\paren`, `\set`, `\bracks`, or `\ds`, add them after its preamble with
  the same definitions as the other roots. Do not otherwise edit the
  preamble.
- **Voice.** "We", present tense, brisk. Short informal lead-ins are
  welcome: "Intuitively, …", "The idea is …", "This is not too surprising,
  since …".
- **Structure.** After the contents, `\setcounter{section}{-1}` and
  `\section{Introduction}`: one page on what the course is about and how it
  hangs together. Then `\section` per chapter, `\subsection` per topic. Each
  chapter opens with a paragraph saying what it does and why. A topic the
  lecturer declared non-examinable gets "(non-examinable)" in its heading.
- **Statements.** Unnumbered by default: `defi`, `thm`, `prop`, `lemma`,
  `cor`, `eg`, `notation`, `remark`, `claim`, `law`. A result that is cited
  later uses the numbered twin (`nthm`, `nprop`, `nlemma`, `ncor`) with a
  `\label`. Named results carry their name: `\begin{thm}[Bolzano--Weierstrass]`.
- **Definitions.** Defined words always in `\term{}`; the root prints the
  index.
- **Examples.** Many and short. Group several instances in one `eg` with an
  `enumerate`, and include non-examples with the reason ("$\Z$ is not a
  field, since $2$ has no inverse").
- **Proof ideas.** At most one prose sentence before the proof ("The idea is
  to …"). No boxes. Proofs are complete but compact; multi-part results are
  proved part by part, "(i) $\Rightarrow$ (ii)", …
- **Traps.** `warning` (Cambridge's "Warning."), not a titled remark.
- **Slogans.** `\begin{significant} … \end{significant}` (a centred italic
  minipage) replaces the `\boxed{}` Key mechanism line; ≤ 2 per file, one or
  two lines each, since a minipage cannot break across pages.
- **Own additions.** Explanation that was not in the lecture goes in
  `\begin{own} … \end{own}` (grey text), so the record stays distinguishable
  from what was lectured (P7, P9).
- **Exercises.** Occasional `ex` inline, where the lecturer set one. No
  end-of-lecture blocks; methods are stated as `law` / `remark` or prose.
- **Figures.** TikZ diagrams wherever the lecturer drew one.
- **Not this style:** coloured boxes, Idea / Scratch work, *In practice*
  lists, European bracket quantifiers (write words; inline $\forall$ /
  $\exists$ only where the lecturer used them), numbering every statement.

### 3.9 `legacy` — MATH 135 as it stands

The older, pre-`mixed` house style: proof ideas are
`\begin{remark}[Proof idea]` before the proof; untitled remarks for side
notes; `\subsubsection*{Exercises}` at the end of topics; logic inline
(`$\forall a,b\in\Z,\ \dots$`). Keep a file in this style when making small
edits. Migrate to `mixed` only when the user asks, one whole file at a time,
and log the conversion as `1a/math147/note-course/style-migration.md` does.

### 3.10 Course-type profiles

#### `computation` — method-driven courses (calculus, computational linear algebra, statistics)

- Worked examples are the main vehicle: task in `example`, solution in prose
  or displays after it, final answer stated in a sentence.
- Each method gets one clean worked example and an *In practice* entry with
  the procedure and its preconditions (when the method applies, what can go
  wrong).
- End a long computation with a **check line** when one exists: "Check:
  differentiating gives back the integrand."
- Each lecture file starts with a Lecture opener and ends with *In practice*.
- Proofs, when they appear, follow `mixed`.

#### `programming` — CS courses

- Load code with the `code` option (minted; build with `-shell-escape`).
  Inline code with `\mintinline{<lang>}{…}`; blocks with `minted`.
- For each language construct: syntax → meaning (evaluation rule) → one
  example → common error. Show evaluation as a **trace** (`align*` or a
  `minted` block with `⇒` steps), one rewrite per line.
- Distinguish source text, value, and error explicitly (P4).
- A design recipe or template goes in *In practice*.
- CS 135 is a discontinued archive: never use it as a template.

#### `writing` — communication / essay courses (e.g. ENGL 119)

- Keep course documents in their original format (`.docx`, `.pdf`) inside
  the course/week directory with descriptive filenames.
- Preserve the instructor's required format exactly. Render and visually
  inspect a `.docx` before calling it finished.
- Personal notes, if any, are Markdown: one file per topic, a one-paragraph
  summary first, then headings; no LaTeX.

#### `homework` — `hw/` directories

- Built with `qhhomework`. Existing layouts differ: MATH 135 `w02/` has one
  `problems/pN.tex` per problem using `problem[short title]` / `solution`;
  MATH 147 has one root `hw/assign.tex` that includes `A1/a1.tex`, with
  problems as `\subsection`s. Keep an assignment's existing layout; start a
  new one in the `w02/` layout. The assignment handout goes in `tex/`.
- Homework is the student's own work. Typeset, fix LaTeX, and check
  formatting as asked; do not write or complete solutions unless the user
  explicitly asks for it.
- Nothing flows between `hw/` and the notes: no solutions in notes, no note
  text pasted into homework.

---

## 4. Mathematical writing conventions

### 4.1 Quantifiers and logic

Profiles `mixed` and `zorich` write symbolic logic in European style: each
quantifier in parentheses, the governed statement in square brackets, read
left to right; no trailing "$\forall c$".

```latex
(\forall\epsilon>0)(\exists n_\epsilon\in\N)(\forall n\geq n_\epsilon)\,\bigl[\abs{x_n-a}<\epsilon\bigr]
\neg(\forall n\in\N)\,[P(n)] \iff (\exists n\in\N)\,[\neg P(n)]
```

Use `\bigl[ \bigr]` when the bracketed statement contains `\abs{}` or
fractions. In prose and theorem statements words are fine ("for every
$\epsilon>0$ there is …"); the rule is about symbolic formulas.
`legacy` keeps the course's inline style (`$\forall a,b\in\Z,\ \dots$`);
`rudin`, `abbott`, `tao` and `cambridge` prefer words.

### 4.2 Nearby concepts

Keep these distinctions explicit wherever they are in play: upper bound /
supremum / maximum (and the lower counterparts); a supremum need not belong
to the set, a maximum must; completeness applies to nonempty bounded-above
subsets of $\R$, well-ordering to nonempty subsets of $\N$ (no boundedness
needed); ∃∀ vs ∀∃; necessary vs sufficient; an example never proves a
universal statement.

### 4.3 Displays

- Inline math for short expressions; a display only when the formula is
  referred to, long, or the point of the paragraph.
- `align*` for multi-step chains, aligned on the relation.
- `\text{}` for words in math; `\quad` around a spaced `\Longrightarrow`.
- Punctuate displays as part of the sentence.
- Use the document's shortcuts (`\R`, `\N`, `\abs{}`, `\paren{}`, `\set{}`,
  …); never define near-duplicates.

---

## 5. LaTeX conventions

### 5.1 Files

- `note.tex` is the only compilation root. `chapters/cN.tex` holds a
  `\section` and `\input`s lectures; `chapters/uN/sN.tex` holds one
  `\subsection` (one lecture or topic) and is the normal editing unit.
- Keep each file's existing `%!TEX root` line exactly as it is.
- A new lecture file starts with its root line and, optionally, a provenance
  comment: `% Source: Lecture 7 (2026-09-24); B&S §2.3`.
- `% TODO(check): …` marks uncertain transcription (P9). Search for
  `TODO(check)` before calling a course finished.

### 5.2 Headings

Defaults (`mixed`, `legacy`, `computation`); the profiles in §3 override
them where they say so.

- `\section` (chapter file) = the topic: *The Real Number System*.
- `\subsection` (lecture file) = its content, never "Lecture N".
- `\subsubsection` for each major block, roughly one per 2–4 pages, so the
  TOC is skimmable. Title Case; math allowed in titles.
- Starred headings only for *In practice*, *Exercises*, and the headings a
  profile prescribes (Abbott's *Discussion* / *Epilogue*, …).

### 5.3 Labels and references

Label only what is referenced. Prefixes: `def:`, `thm:`, `prop:`, `lem:`,
`cor:`, `ex:` (example), `exr:` (exercise), `eq:`, `fig:`, `sec:`; then a short kebab-case name
(`thm:archimedes`, `prop:sqrt2-exists`). Refer as `Theorem~\ref{thm:…}`, or
by name for named results. Never renumber or rename an existing label
without updating every reference.

### 5.4 Index

If the root calls `\printindex`, each defined term is written `\term{word}`
in its `definition` (it is emphasised and indexed). If the root does not
print an index, use `\emph{}`.

### 5.5 Visual system

`qhnotes` (installed package; see `HANDOFF.md`) owns fonts, geometry,
theorem boxes, and colours; the `cambridge` template owns its own preamble.
In a note set: no new packages, no geometry or font changes, no copied
package internals, no ad-hoc coloured boxes. Such
changes are package work in the `references` repository and affect every
course.

---

## 6. Layout pitfalls on the `qhnotes` page

The default page is 160×240 mm (text block ≈ 124 mm); coloured boxes are
`mdframed`.

1. **Unbreakable boxes.** Never put `\fbox{\parbox{…}}` (or any unbreakable
   box) in `center` for a summary: near a page break it crashes mdframed
   splitting (escalating "Overfull \vbox", "Box was splittet wrong"). Use
   prose or a Trap remark.
2. **Nested boxes.** Do not nest `proof` (or another boxed environment)
   inside `example`: nested mdframed boxes cannot split and leave half-empty
   pages. Close the `example`, then write the `proof`.
3. **Long boxed proofs.** If a proof straddles a page badly or triggers the
   split loop, first move commentary out of the proof (into Idea / Scratch
   work / prose). If that is not enough, wrap only that box:
   ```latex
   \mdfsetup{nobreak=true}
   \begin{proof} … \end{proof}
   \mdfsetup{nobreak=false}
   ```
   Always reset `nobreak=false` immediately.
4. **Width.** A `\boxed{}` or single-line display longer than ~6–7 words
   overflows. Break it with `\begin{array}{c} … \\ … \end{array}`.
5. **Unboxed remarks.** A prose paragraph directly after a `remark` needs
   `\medskip\noindent` or a heading, or it reads as part of the remark.
6. **Font or size changes move every page break.** After one, rebuild
   cleanly and recheck all splitting warnings.
7. **No `\qedhere`.** With the `color` option the `proof` box always sets
   the QED mark on its own line; `\qedhere` does not work there.

---

## 7. Review checklist

Before calling a note edit done:

- [ ] Every original definition, statement, hypothesis, and key step is still
      present (checked in `git diff`, not from memory or a summary).
- [ ] Any content change is deliberate and recorded.
- [ ] Devices match the course's profile and avoid its "Not this style"
      list; in `mixed`: no Idea that repeats the proof, no remark that is not
      a Trap.
- [ ] Headings name content and follow the profile; end-of-lecture blocks
      (where the profile uses them) are last.
- [ ] Notation and shortcuts match the rest of the document.
- [ ] No new `TODO(check)` left unexplained in the report.
- [ ] Clean build; no new overfull boxes or split warnings (`HANDOFF.md`,
      "Verification").
