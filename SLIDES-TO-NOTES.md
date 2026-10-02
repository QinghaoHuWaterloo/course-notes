# Slides → mathematical LaTeX notes

A playbook for any agent (Kiro, Claude Code, Codex, Cursor, …) asked to
"make a LaTeX note based on these slides". It adds slide-specific steps on
top of `HANDOFF.md` (operations, safety, verification) and `STYLE.md`
(writing standard). If they disagree, the course's `handoff.md` wins, then
`HANDOFF.md`/`STYLE.md`, then this file.

Reference output: `1a/econ101/note/` (ECON 101, Chapters 1–3).

## 1. Scope

- If the user doesn't say which slides, cover every lecture PDF in the course
  directory and state that in the report. Don't stop to ask.
- Skip admin slides (test logistics, room lists, office hours) unless asked.
- Slides stay where the user keeps them. Never copy them into `chapters/`.

## 2. Layout

```
<term>/<course>/
  <slides>.pdf           source, untouched
  note/
    note.tex             root: preamble + \include{chapters/cN}
    chapters/cN.tex      one file per slide deck (= one \section)
```

- First lines of each chapter file:
  `%!TEX root = ../note.tex` and `% Source: ../<slides>.pdf`.
- If `note/` already exists, add `chapters/cN.tex` plus one `\include` line.
  Do not rewrite existing chapters unless asked.
- Use one `\subsection` per slide topic and `\subsubsection*` for minor
  groupings.
- If the course already has a primary note set with a `uN/sN.tex` layout,
  follow that layout instead (`HANDOFF.md`, "Writing new lecture notes").

## 3. Preamble

For a new course, copy `1a/econ101/note/note.tex` and change only the
`\n…` fields (term, year, lecturer, course) and the course-specific operators.
It provides:

- unnumbered environments `defi, eg, ex, law, assumption, principle,
  notation, remark, warning`;
- numbered environments `nthm, nprop, ncor, nlemma`, sharing one counter per
  section;
- `\term{…}`: italics plus an index entry, for every newly defined term;
- `significant`: a one-line takeaway after a key result;
- operators such as `\MB`, `\MC`, `\TC` via `\DeclareMathOperator`.

New macros go in the preamble, never mid-chapter.

## 4. Reading the slides cheaply

1. `pdftotext -layout <deck>.pdf -` for all decks, read once.
2. Graphs and tables often carry numbers that the text dump misses. Render
   only those pages (usually titles with little or no body text):
   `pdftoppm -r 90 -png -f P -l P <deck>.pdf /tmp/s2n/dK`. 90 dpi is
   readable; 50 dpi is not.
3. Delete `/tmp/s2n` at the end.

## 5. Writing: math-first

- **Formalise.** Every concept becomes a `defi` with notation (sets,
  functions, sums, partial derivatives). The slides' informal
  "principles"/"laws" go in `principle`/`law`.
- **Prove what can be proved.** Turn slide claims into `nprop`/`nthm` with
  short proofs (monotonicity, telescoping sums, first-order conditions,
  inverse-function rule). Label them and cross-reference with `\ref`.
- **Examples use the slide numbers exactly.** Rebuild tables with `booktabs`
  and show one sample calculation per table. Recompute every number. If the
  slide data violates a theorem's hypothesis, weaken the hypothesis or say so.
  Never adjust the data to fit.
- **Add value.** Give continuous/calculus versions of discrete rules and
  closed forms for tabulated examples. Add a `warning` for common confusions,
  and 1–3 `ex` with short answers in a `remark`.
- **Figures.** Redraw key graphs with `pgfplots` from the slide numbers. Do
  not paste slide images.
- **Honesty.** The title page states that theorem statements and proofs are
  the note-taker's formalisation, not the lecturer's. Mark anything you
  couldn't read with `% TODO(check)`.
- Write in English unless the user asks otherwise. Keep prose tight.

## 6. Build and verify

```sh
cd <course>/note
latexmk -pdf -interaction=nonstopmode note.tex > /tmp/s2n-build.log 2>&1; echo "exit=$?"
grep -E '^!|Overfull|undefined' note.log | head
```

- Done means: exit 0, no `!` errors, no undefined references, no overfull
  boxes.
- Render 3–4 pages at 60 dpi and look at them (tables, figures, theorem
  spacing).
- Never paste the full log into the conversation.

## 7. Report

Keep it short:

- files created;
- per chapter, the main definitions, theorems and examples;
- the build result;
- anything flagged: data that conflicts with a hypothesis, skipped slides,
  claims that are the note-taker's own.

Do not commit unless asked.
