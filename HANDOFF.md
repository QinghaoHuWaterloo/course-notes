# Course Notes — Project Handoff

Read this file first before creating or editing anything in this repository.
It says what belongs where, how to work safely, and how to verify a change.
Then read:

1. **`STYLE.md`** — the writing standard, the device catalogue (Idea, Scratch
   work, Trap, *In practice*, …), and the style profiles (`mixed`, `rudin`,
   `zorich`, `abbott`, `tao`, `cambridge`, …).
2. **The course's `handoff.md`**, if it has one — it takes precedence over
   both project files for its own course.

## Purpose

A personal archive of undergraduate course notes, built to stay useful after
the term: *my own notes, written clearly enough that a future me can recover
the ideas, not only the final answers.* When polishing, preserve the course's
content, order, notation, strategy, and level and improve the explanation.
When writing from new class material, write a compact, self-contained account
of the ideas and reasoning, not a transcript.

## Repository map

```
HANDOFF.md                  this file (operations)
STYLE.md                    writing standard, devices, profiles
CLAUDE.md                   pointer for Claude Code
.kiro/skills/course-notes/  Kiro skill (routing only; defers to these files)
1a/                         term directory (next term: 1b/, …)
  math135/                  Algebra for Honours Mathematics — profile legacy
    note.tex                root
    chapters/cN.tex         c1–c5 (c4 proof techniques, c5 sets)
    chapters/uN/sN.tex      lecture files (u1–u5)
    hw/                     homework (profile homework)
  math147/
    note-course/            Intro to Analysis — profile mixed (reference course)
      note.tex, handoff.md, style-migration.md, chapters/
    note-cambridge-style/   alternative rendering in profile cambridge
    hw/                     homework (profile homework)
  cs135/                    discontinued archive — do not extend or copy
  ENGL119/                  syllabus documents (profile writing)
```

`note.tex` is always the compilation root of a note set; `chapters/cN.tex`
fixes chapter order; `chapters/uN/sN.tex` is the smallest normal editing
unit. Homework, rough drafts, build files, and copied slides never go into a
note chapter.

### Current course facts

| Course | Root | Profile | Local rules |
| --- | --- | --- | --- |
| MATH 135 | `1a/math135/note.tex` | `legacy` | 10pt, twoside, `color`; QED is an italic "Q.E.D."; `remark[Proof idea]` before hard proofs; no index. No course handoff yet. |
| MATH 147 | `1a/math147/note-course/note.tex` | **`mixed`** | Read `note-course/handoff.md` first. 11pt, twoside, `color`; local `idea` / `scratch` environments and `\insymbols` macro. |
| CS 135 | `1a/cs135/note.tex` | — | Discontinued. Touch only if explicitly asked. |
| ENGL 119 | `1a/ENGL119/` | `writing` | Syllabus only so far. |

Build (from the course directory):
`latexmk -pdf -interaction=nonstopmode note.tex`.

## Shared LaTeX packages

`qhnotes` (notes) and `qhhomework` (homework), both on top of `qhbase`, own
the shared preamble: fonts (Times/newtx by default since 2026-09-25), the
160×240 mm page, theorem boxes, colours, headers, index. They live in the
separate `references` repository (`~/references/template/sty`, GitHub
`QinghaoHuWaterloo/references`); `~/Library/texmf/tex/latex/qhtemplates` is a
symlink to that directory, and its option list is in
`~/references/template/README.md`. Package changes are committed there, not
here, and are never part of an ordinary note edit: they reflow every
document, so after one rebuild every `qhnotes` document cleanly and recheck
page splitting.

Document roots define their own shortcuts (`\R \N \Z \Q \C`, `\paren{}`,
`\abs{}`, `\norm{}`, `\bracks{}`, `\set{}`, `\ds`, `\blue`, `\red`,
`\mypic`); reuse them, do not add variants.

## Working rules for agents

- **Read little, precisely.** This file, `STYLE.md`, the course handoff,
  the target file, and only the context needed to resolve a concrete macro,
  label, or dependency. Do not preload other courses.
- **One file at a time.** One lecture file per edit keeps diffs reviewable.
- **Classify the risk before editing.**
  - *Low* — spelling, punctuation, spacing, a known formatting fix.
  - *Medium* — prose, structure, applying devices; technical meaning fixed.
  - *High* — definitions, statements, hypotheses, proof logic, formulas,
    labels, anything cross-file. Verify against the diff line by line.
- **Never** delete or rewrite existing uncommitted work (the user's or
  anyone else's), run
  destructive Git commands to "clean" the tree, rewrite history, or commit
  unless asked. Check `git status --short` first.
- **Summaries are not evidence.** Confirm a sub-agent's (or your own)
  claimed result in the diff and the build log.
- **Keep handoffs true.** When a layout, build command, profile, scope, or
  known pitfall changes, update the relevant handoff in the same change.

## Workflow

### Editing one existing lecture

1. Read the files listed under "Working rules".
2. Identify the original argument or teaching objective before drafting.
3. Edit that one file according to the course's profile in `STYLE.md`.
4. Build and verify (below).
5. Review `git diff -- <file>`: every original statement, condition, and key
   step is present or deliberately corrected.
6. Report what changed, which checks passed, and anything unresolved
   (including new `% TODO(check)` markers).

### Writing new lecture notes from class material

1. Put the source (slides, photos) *outside* `chapters/` — e.g.
   `lecture-ppt/` — or leave it where the user keeps it.
2. Create `chapters/uN/sN.tex` with the root line and a `% Source:` comment,
   add it to `chapters/cN.tex`.
3. Write in the course's profile (`STYLE.md` §3). Mark anything unreadable
   with `% TODO(check)`. As you write, add a semantic `\label` to every
   numbered theorem-like block, `\cref` any cross-reference (never bare
   `\ref` or "the preceding …"), and `\index` each new concept definition
   (`STYLE.md` §5.3–5.4). If the lecture starts a new chapter, add that
   chapter's concept map (`STYLE.md` §5.6).
4. Build, inspect the rendered pages, update the course handoff's status.

### Rendering a course in another style (`rudin`, `zorich`, …)

1. Create `<course>/note-<style>-style/` next to the primary notes (e.g.
   `math147/note-course/` → `math147/note-cambridge-style/`; for a course whose
   `note.tex` sits directly in the course directory, the new directory goes
   in that course directory too). Copy the root's class options and
   shortcuts, then add only what the style's section in `STYLE.md` §3
   prescribes (heading format, `numberwithin`); a `cambridge` rendering
   starts from its own template instead.
2. Rewrite lecture by lecture from the primary `chapters/`; the originals
   are read-only for this task.
3. Keep a `README.md`: model book, source map, style rules used, and
   *Content changes beyond wording* (see `note-cambridge-style/README.md`).
4. Build and inspect as usual. The rendering is not the course's primary
   notes unless the user says so; then update the course handoff.

### Creating a new course note set

1. `<term>/<course>/` with `note.tex`, `chapters/`, and `hw/` if needed.
2. Start the root from `~/references/template/note-color/template.tex`
   (or `note/` for plain amsthm styling; `cambridge/template.tex` for the
   `cambridge` profile). Never from CS 135.
3. Pick a profile from `STYLE.md` §3; if it is `mixed`, copy the `idea` /
   `scratch` environments and the `\insymbols` macro from MATH 147's
   `note.tex`. Also copy MATH 147's `\AtEndPreamble{…cleveref…}` block so
   cross-references and concept maps work from the start (`STYLE.md` §5.3);
   `\printindex` is already called by the template's root.
4. Write `handoff.md` from the template below before the course grows.
5. Write one representative lecture, build it, inspect the PDF, then scale.

## Verification

```sh
latexmk -C note.tex && latexmk -pdf -interaction=nonstopmode note.tex
grep -nE 'Output written|^!' note.log
grep -ciE 'overfull' note.log
grep -niE 'splittet|overfull \\vbox' note.log
```

A clean rebuild is required after layout-sensitive edits, font or size
changes, or whenever a build looks stale; an incremental build can hide a
page-count shift that exposes a split bug. Compare warnings against the
course handoff's recorded baseline: investigate every new error, overfull
box, or split warning (fixes: `STYLE.md` §6). Do not hide warnings by
deleting content.

A text-only edit to a `.md` file needs no build.

## Repository hygiene

- Build artifacts (`.aux`, `.log`, `.out`, `.toc`, `.synctex.gz`,
  `_minted*`, …) are ignored and never committed.
- Committed PDFs are intentional output: regenerate only from a source that
  builds cleanly, and commit a PDF together with its source change.
- Keep homework build files out of note changes.
- Commit messages: `<course>: <what changed>` (e.g.
  `math147: add In practice to u3/s1`); mention content changes explicitly.

## Definition of done

Faithful to the course; clearer where a future reader would get stuck;
consistent with the course's profile and visual system; no new build or
layout problems; a small diff whose content was actually reviewed; handoffs
still true.

## Course-handoff template

```md
# COURSE Notes — Editing Handoff

Profile: `mixed` | `rudin` | `zorich` | `abbott` | `tao` | `cambridge` | `legacy` |
`computation` | `programming` | `writing`
(see `STYLE.md` at the repository root). Deviations from the profile are
listed below.

## Scope
- Course / topic / source (lecturer, textbook):
- What to preserve when editing:
- Out of scope:

## Layout and build
- Root and document class options:
- Chapter/lecture files:
- Active `\includeonly` (or none):
- Build baseline (pages, overfull count, known split warnings):

## Local rules
- Local environments/macros beyond the shared ones:
- Notation decisions:
- Profile deviations:
- Course-specific pitfalls:

## Content notes
- Topics that need special care, and the arguments that must be kept:

## Status (YYYY-MM-DD)
- Done:
- Next:
- Known gaps / intentional exceptions:
```
