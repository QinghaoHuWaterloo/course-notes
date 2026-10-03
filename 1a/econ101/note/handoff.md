# ECON 101 Notes — Editing Handoff

Profile: `computation`, adapted for an introductory economics course as below.
Read `../../../HANDOFF.md`, `../../../STYLE.md`, and
`../../../SLIDES-TO-NOTES.md` first. This handoff takes precedence.

## Scope

- Sources: all three `chapterN_econ101_fall2026.pdf` decks in the parent
  directory, Mikal Skuterud, Fall 2026. Preserve topic order, substantive
  content, examples and source data; omit test logistics and room assignments.
- Owner's clarification (2026-10-02): the purpose is more rigorous language
  and reasoning than the slides, **not extra mathematical formalisation**.
  Explain hypotheses, comparisons, units and implications in ordinary English.
  Use arithmetic and simple formulas only when they help the source examples.
  No added optimisation theorems, partial derivatives, topology or analysis
  prerequisite. This overrides the playbook's math-first/proof/extension rules.
- Economic laws and principles are model relationships, not universal
  mathematical theorems. Explanatory qualifications are the note-taker's work.
- Do not add later material such as market equilibrium or elasticity.

## Layout and Local Rules

- Root: `note.tex`; 11pt article, Latin Modern, one-sided;
  `qhnotes[europe,paper=a4]` owns layout, fonts, statement boxes and index.
- One `chapters/cN.tex` per PDF; numbered topic subsections; prose chapter
  openers rather than theorem-based concept maps (intentional local exception).
- Shared `definition`, `example` and `remark` environments. No local theorem
  aliases or custom coloured boxes. Principles/rules are explanatory prose.
- Every numbered block has a semantic label. Use cleveref; optional label
  types `[example]` / `[definition]` avoid qhnotes' shared-counter naming quirk.
- Index concepts with `term`; the printed index is retained.
- State a period/unit for data; calculate differences before rounding.
- Quantities in slide tables are discrete; exact marginal equality is not
  required. Explain smooth interior equality in words only where the slides
  invoke it. State how zero marginal surplus gives ties.
- Graphs use existing pgfplots/TikZ; price vertically, quantity horizontally.
  Connecting lines are illustrative, not inferred data outside the source range.
- All present statement boxes are short; root `mdfsetup{nobreak=true}` keeps
  them intact. Reconsider this document-local setting before adding long boxes.
  `uN/sN` files are not used in this note set.
- End chapters with *In practice* and any lecture exercises. Do not invent
  questions or solutions merely to fill an end section.

## Content Checks

- Restaurant comparison covers only worker counts 2--7. Five and six both
  yield maximum surplus 1200; the sixth worker adds zero surplus. Both MB
  and MC decrease, but their difference also decreases.
- Tuition's 37.50-per-lecture figure is an average allocation, not attendance's
  marginal cost; the attendance decision assumes tuition is nonrefundable.
- Fixed costs cancel only between options incurring the same payment.
  Fixed does not mean sunk; avoidable operating fees affect participation.
- Shell's first supply graph and the ten-seller aggregation example have
  different individual quantities. They are separate slide illustrations.
- Production tables step through different variables: whole labour units
  first, then whole output units with fractional labour. The 0.64 marginal
  product comes from exact square roots; subtracting rounded outputs gives
  0.63. Capital cost is omitted from the cost table in the slides.
- Adding buyers/sellers shifts the market sum while holding existing
  individual curves fixed; congestion or network effects can separately
  change individual demand.

## Build and Status (2026-10-02)

Build from this directory: `latexmk -pdf -interaction=nonstopmode note.tex`.
After reflow: `latexmk -C note.tex`, then rebuild.

- Rewrote all three chapters in the clarified explanatory style, replaced
  the standalone preamble with the shared `europe` template, retained the
  source examples and substantive topics, and redrew the key diagrams.
- Removed the previous extra theorems, continuous production/supply models,
  invented exercise answers and unsupported extrapolations. Preserved the
  lecture discussion questions without supplying causal conclusions.
- Cross-checked the PDFs' charts and numerical tables visually and recomputed
  their example arithmetic. No new source-uncertainty markers.
- Final clean build: **16 pages**, **0 errors**, **0 LaTeX warnings**,
  **0 undefined references**, **0 overfull/underfull boxes**, **0 mdframed
  split infos**. Inspected graph, definition and production-table pages;
  corrected split boxes and an isolated end-of-chapter practice page.
