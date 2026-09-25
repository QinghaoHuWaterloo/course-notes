# Course Notes — Project Handoff and Note-Making Standard

Read this file first before creating or editing material anywhere in this
repository. It is the project-level counterpart to a course handoff: it tells
you what belongs where, what "finished notes" mean, and how to make a safe,
reviewable change. A course-specific handoff (when present) takes precedence
over this document for its own course.

## Purpose and editorial promise

This is a personal archive of undergraduate course notes, designed to remain
useful after the term rather than merely recording what was said in class.
The desired voice is: *my own notes, written clearly enough that a future me
can recover the ideas, not only the final answers.*

When polishing existing notes, preserve the source course's mathematical or
technical content, order, notation, proof/programming strategy, and level.
Improve the explanation; do not silently turn the notes into a different
textbook. When writing new notes from class material, prefer a compact,
self-contained account of the concepts and reasoning over a transcript.

## Repository map

```
1a/
  math135/                 Honor Algebra course notes
    note.tex                document root (qhnotes `color` option only, no watermark)
    chapters/cN.tex         chapter assembly files (c1-c5; c4 proof techniques, c5 sets)
    chapters/uN/sN.tex      unit/lecture source files; `remark` environment in active use
                            for proof-idea notes (see u2/u3/u4)
    hw/                     homework sources and their build artifacts
  math147/
    note-course/            Analysis course notes
      note.tex              document root
      handoff.md            detailed, course-specific editing handoff
      chapters/...          chapter and lecture sources
    hw/                     homework sources and artifacts; separate from notes
  cs135/                    Discontinued Designing Functional Programming archive
    note.tex                document root
    chapters/...            chapter and lecture sources
    hw/                     Racket homework/source work; separate from notes
  emls102/week1/            course documents (currently a Word exercise)
```

`note.tex` is always the compilation root for a LaTeX note set. `chapters/cN.tex`
controls a chapter's inclusion order; `chapters/uN/sN.tex` is normally the
smallest independently editable lecture unit. Do not put homework solutions,
scratch work, build files, or copied source slides into a note chapter.

### Current course facts

| Course | Scope / source root | Build command | Important local rule |
| --- | --- | --- | --- |
| MATH 135 | `1a/math135/note.tex` | `latexmk -pdf -interaction=nonstopmode note.tex` | Narrow, two-sided page layout; theorem/proof environments are styled boxes; `remark` (optional `[Proof idea]` title) is available and used for proof-idea notes and substitution/instantiation justifications. |
| MATH 147 | `1a/math147/note-course/note.tex` | `latexmk -pdf -interaction=nonstopmode note.tex` | Read `note-course/handoff.md` first. All chapters currently build. |
| CS 135 | `1a/cs135/` | — | Discontinued archive. Do not extend, polish, or use as a template unless explicitly asked. |

Run each command from the relevant course directory. Do not assume that a
successful partial build proves that disabled chapters are healthy.

## Non-negotiable standards for every note

### 1. Teach the idea, then record the result

Every substantial topic should let a returning reader answer these questions:

1. What problem or distinction is this concept for?
2. What is the exact definition, rule, or interface?
3. How is it used in a representative example?
4. What reasoning links the assumptions to the conclusion?
5. What common confusion, limitation, or boundary matters?

The answer need not be five paragraphs. A definition plus one well-chosen
sentence, example, or proof-idea note is often enough. Expand conceptual
jumps, not routine algebra or obvious syntax.

### 2. Preserve the course's reasoning

For an existing proof, derivation, program, or design recipe:

- retain its main method and order of steps when it is valid;
- state the construction's purpose before a non-obvious choice;
- make critical implication chains explicit;
- use labels such as `\textbf{Step 1: ...}` only when they reveal real
  structure;
- correct errors rather than preserving them, but do not replace an elementary
  course method with more advanced machinery just because it is shorter.

If a correction changes meaning, a theorem statement, a proof strategy, a
program's output, or notation used elsewhere, treat it as a content change:
check the surrounding lecture and record the reason in the commit/hand-off.

### 3. Use examples as tests of understanding

An example must do explanatory work. It should instantiate a definition,
demonstrate a method, distinguish nearby concepts, or expose an edge case.
Do not add examples merely to make a page look fuller. Keep examples close to
the idea they support, and explain the decisive step rather than presenting a
bare answer.

### 4. Make limits and scope visible

State hypotheses, domains, type restrictions, quantifier order, and
preconditions where they matter. For code, distinguish source text,
evaluation, value, and error. For mathematics, distinguish definitions from
theorems, examples from proofs, and an implication from its converse.

### 5. Prefer durable notation and terminology

Use the notation established by the course root and keep it consistent inside
a note set. Define nonstandard symbols at first useful use. Prefer standard
mathematical and technical English over informal shorthand, but retain useful
course vocabulary. Never bulk-normalize notation across courses without an
explicit request: each document may intentionally differ.

### 6. Keep the document skimmable

Use prose for explanation, displays for meaningful equations or traces, and
lists only for genuine collections of cases or requirements. Give sections
descriptive titles. Keep paragraphs focused. A long proof or program walk
through may be divided into logical stages; a short one should remain short.

### 7. Preserve provenance without copying noise

Notes may reflect lectures, textbooks, assignments, and personal insights,
but should be rewritten into a coherent personal explanation. Do not paste
large blocks from a source. If an external source, convention, or attribution
materially matters, cite or name it briefly in the notes. Do not put private
course-platform content or credentials in the repository.

## Subject-specific additions

### Mathematics notes

- Put formal statements in the existing `definition`, `theorem`, `lemma`,
  `proposition`, `corollary`, `axiom`, `assumption`, `notation`, or `example`
  environment that best describes them. Do not invent a new visual system.
- A proof should make the plan and every nontrivial inference recoverable.
  Add a short `remark` with an optional title such as `Proof idea` before a
  difficult proof when that helps.
- Explain the purpose of constructed sets, substitutions, induction
  hypotheses, contradictions, and extremal choices. Name exactly which
  theorem, axiom, definition, or closure property licenses a key step.
- Distinguish nearby terms carefully: e.g., upper bound/supremum/maximum and
  existential/universal quantifiers. Do not use an example as proof of a
  universal statement.
- Use `align*` for multi-step equalities or inequalities when alignment helps;
  use inline mathematics for short expressions. Avoid ornamental displays.

### Writing and non-LaTeX course material

Keep course documents in the relevant course/week directory, using a clear,
descriptive filename. Preserve the instructor's requested format. When
editing `.docx` material, render and visually inspect it before calling it
finished; do not rely only on the document XML or a text extraction.

## LaTeX and visual-system rules

The installed `qhnotes` and `qhhomework` packages own the active courses'
shared preamble, theorem styles, geometry, and common build behaviour. Each
document root selects its package options, course metadata, and its own local
shortcuts. The packages live in the separate `references` repository
(`~/references/template/sty`, GitHub `QinghaoHuWaterloo/references`);
`~/Library/texmf/tex/latex/qhtemplates` is a symlink to that directory. Commit
package changes there, not in this repository.
Since 2026-09-25 the `qhnotes` default face is Times with matching math
(newtx); the `latinmodern` option restores Latin Modern, and `springer` is
kept only for compatibility. A font change moves page breaks, so rebuild every
`qhnotes` document cleanly afterwards and check for mdframed split loops.
Reuse this setup. Do not copy package internals into a document,
add packages, change geometry, or redesign theorem boxes as part of ordinary
note editing. Such a change affects the entire document and needs a deliberate
separate review.

Within an existing note set:

- retain the file's current `%!TEX root` convention if it has one;
- preserve `\include` / `\input` structure and cross-references;
- use the document's existing local shortcuts (for example `\R`, `\N`,
  `\Q`, `\paren{}`, `\abs{}`) rather than adding near-duplicates;
- prefer the existing theorem and remark environments over ad-hoc boxes;
- keep equations, tables, figures, and code within the page width;
- add a caption when a figure needs explanation, and use descriptive labels
  for references when the local document already uses labels.

Narrow layouts and `mdframed` boxes need special care. Avoid placing long
unbreakable constructions (especially `\fbox{\parbox{...}}`) in a centered
environment. If a boxed proof or theorem develops page-splitting warnings,
move nonessential commentary into a nearby `remark` or apply the documented
course-local workaround, then reset any local setting immediately.

## Standard workflow

### Editing one existing lecture

1. Read this handoff, then the target course's handoff if it has one.
2. Read the target source file and the smallest necessary surrounding context
   (chapter assembler, referenced definition, or root only when needed).
3. Identify the original argument or teaching objective before drafting.
4. Make a focused edit to one lecture/file when practical. Keep diffs small
   enough to review.
5. Compile the document root using the course's command. Use a clean rebuild
   when layout-sensitive material changed or when a prior build looks stale:
   `latexmk -C note.tex && latexmk ...`.
6. Inspect the log for errors and newly introduced layout warnings. A useful
   baseline check is `rg -n -i 'overfull|underfull|warning|error|^!' note.log`.
   Investigate errors and material overfull/splitting warnings; do not hide
   them by deleting content blindly.
7. Review `git diff -- path/to/edited-file`. For mathematical or code changes,
   manually confirm that every important original statement, condition, and
   step remains or has a deliberate documented correction.
8. State what changed and what verification passed. Update the course handoff
   if its layout, build command, scope, or known pitfalls have changed.

### Creating a new course note set

1. Create a course directory under the term (for example `1b/math237/`) with
   a `note.tex` root, `chapters/`, and, when applicable, a separate `hw/`.
2. Start from the project's established visual conventions only when they fit
   the course; otherwise make the difference intentional and document it. Do
   not use discontinued courses as templates.
3. Create `chapters/c1.tex` and use `chapters/uN/sN.tex` for lecture-scale
   content. Keep the root as the only compilation entry point.
4. Add a local `handoff.md` before the course grows. Record the layout, build
   command, active `\includeonly`, macro/environment facts, known pitfalls,
   editing scope, and current status.
5. Add one representative lecture, compile it, and inspect its rendered PDF
   before multiplying the structure.

### Minimum course-handoff template

```md
# COURSE CODE Notes — Editing Handoff

Read this before editing the course notes.

## Purpose and scope
- Course/topic:
- Intended reader/use:
- What to preserve when editing:
- Explicitly out of scope:

## Layout and build
- Root file: `note.tex`
- Chapter/lecture convention:
- Build command:
- Active `\includeonly` (or “none”):

## Local writing and LaTeX rules
- Existing macros/environments to reuse:
- Course-specific notation/style decisions:
- Code/listing/figure rules, if applicable:
- Known layout or compilation pitfalls:

## Workflow and verification
- Smallest normal editing unit:
- Required checks:
- How to review content-sensitive changes:

## Status (YYYY-MM-DD)
- Completed material:
- Current priority / next file:
- Known warnings or intentional exceptions:
```

## Repository hygiene

Generated LaTeX artifacts are covered by `.gitignore`; do not add `.aux`,
`.log`, `.out`, `.toc`, `.synctex.gz`, `_minted*`, or similar build output.
Committed PDFs are acceptable when they are intentional course-note output;
regenerate them only after their source compiles successfully. Keep unrelated
homework build artifacts out of note changes.

Before a multi-file cleanup or structural change, check `git status --short`.
The repository can contain someone else's in-progress work. Preserve unrelated
changes, never use destructive Git commands to "clean" the tree, and do not
rewrite history for an ordinary note edit.

## Definition of done

A note change is done when it is faithful to the course material, clearer at
the point a future reader would otherwise get stuck, visually consistent with
its course, free of introduced build/layout problems, and represented by a
small diff whose content was actually reviewed. The handoff is part of the
notes: keep it current whenever its operational facts stop being true.
