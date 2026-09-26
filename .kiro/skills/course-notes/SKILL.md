---
name: course-notes
description: Organize course LaTeX notes with minimal context and cost-aware Haiku/Auto routing
---

# Course note organizer

Organize the LaTeX course notes requested in `$ARGUMENTS`. If the course, target, or desired change is unclear, ask one short question instead of scanning the repository.

## Standard

Before editing, read `HANDOFF.md` (operations), `STYLE.md` (writing standard,
devices, style profiles), and the target course's `handoff.md` if present.
Apply the profile the course handoff names. This skill only adds routing and
validation rules on top of those files.

## Guardrails

- Each course directory may have its own `note.tex` entry and file layout. Detect the target course first, then follow only the relevant `\input` and `\include` chain.
- Preserve existing uncommitted work and edit only explicitly requested source files. Never commit, reset, checkout, clean, or rewrite unrelated text.
- Preserve mathematical or technical meaning, formulas, assumptions, labels, references, environment boundaries, and existing macros unless the user explicitly requests a change.
- The main agent is the only writer. Subagents are read-only advisers and must return concise findings, not full-file rewrites.

## Minimal-context workflow

1. Read `git status --short`, the target file, its current diff, and only its nearest include/heading context.
2. Read another file only to resolve a concrete macro, symbol, label, reference, or dependency. Never preload the whole repository or unrelated courses.
3. Classify once and route without debate:
   - **Low risk:** spelling, punctuation, spacing, indentation, or a known local formatting fix. Use no subagent.
   - **Medium risk:** substantial prose cleanup or local LaTeX structure/style, with technical meaning fixed. Call exactly one subagent with `model: claude-haiku-4.5` for a short edit plan.
   - **High risk:** definitions, theorem statements, proof logic, technical claims, assumptions, formulas, unknown macros, labels/references, or cross-file effects. Call exactly one subagent with the default Kiro Auto model (do not set a `model` override) for evidence-based risk findings.
   - Call both only for a multi-file task that changes technical meaning: Haiku proposes the minimal wording/structure change, then a Kiro Auto reviewer (no `model` override) reviews only semantic and cross-file risks. Do not ask them the same question.
4. Give a subagent only the task, allowed paths, relevant line ranges or short excerpts, immutable items, and current risk. Require output no longer than needed in this form: `issues: [{path, line, reason, minimal_action}]; missing_context; build_needed`.
5. Apply one minimal patch. Do not perform opportunistic cleanup.

## Validation

- Always inspect the allowed-file diff and run `git diff --check`.
- For purely textual edits that do not change TeX structure, stop after focused diff checks.
- Otherwise, from the target course directory, run one final build after all edits:
  `latexmk -pdf -interaction=nonstopmode -halt-on-error note.tex`
- On failure, inspect only the first actionable error, make one focused repair, and rerun once. Do not send full logs to subagents.
- Finish with a concise report: changed files, routing used (or none), validation result, and unresolved ambiguity. Do not commit.
