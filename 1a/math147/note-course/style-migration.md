# MATH 147 — style migration log (2026-09-25)

What changed when these notes moved to the Presentation standard in
`handoff.md`. The work was done in a copy (`note-mixed-style/`), which then
replaced `chapters/` and `note.tex` here. Mathematics, order, notation and the
proofs themselves are unchanged (apart from deleting sentences inside proofs
that repeated the new Idea/Scratch text). The pre-migration sources are in git
history.

Compile: `latexmk -pdf -interaction=nonstopmode note.tex`

## The three devices

Every former `\begin{remark}[Proof idea]` became one of these (or was deleted):

| Device | Looks like | Use when | Borrowed from |
|---|---|---|---|
| `\begin{idea}` | pale-blue box, sits right on top of the Proof | the strategy fits in 1–3 sentences | — |
| `\begin{scratch}` | grey "paper" box titled *Scratch work* | the proof has to **choose** something (`n_ε`, `ε/2`, how small a nudge `1/n`) — show the backward reasoning that finds it | Velleman, Cummings |
| motivation prose | plain paragraph **before** the statement | the explanation is really *why this construction / what are we looking for* | Abbott |
| (nothing) | — | the proof is ≤ 3 lines and explains itself | — |

Both environments are defined in `note.tex`, next to the other shortcuts.

## Where each one was used

| File | Statement | Now |
|---|---|---|
| `u2/s1` | √2 irrational | idea |
| `u2/s2` | Well-ordering principle | idea |
| `u2/s2` | Σk² via well-ordering | idea; the minimal-counterexample pattern (two old remarks merged) is in *In practice*; "Why min, not sup" moved after the proof |
| `u2/s3` | \|·\| theorem | idea |
| `u2/s3` | Triangle inequality | idea (the "Key mechanism" fbox was the same sentence, removed) |
| `u2/s4` | uniqueness of sup | remark with "Idea:" → one prose paragraph |
| `u2/s4` | ε-characterisation lemma | prose before ("when is there a gap?") |
| `u2/s5` | Archimedean property | idea (prose with the two ingredients was already before it) |
| `u2/s5` | Corollary (a)(b)(c) | idea, one line per part; duplicate opening of proof (c) removed |
| `u2/s5` | √2 exists | prose before (candidates from below, two ways to miss) + scratch (how small the nudge must be) |
| `u2/s5` | Density of ℚ | prose before (the 1/n grid picture) + scratch (want `xn < m < yn`); duplicate sentences in the proof removed |
| `u2/s5` | Irrationals dense | idea |
| `u2/s5` | Infinitely many rationals | deleted (3-line proof) |
| `u3/s1` | (4n+3)/(n+1) → 4 | **new** scratch (simplify the distance, then find `n_ε`) |
| `u3/s1` | \|x−y\|<ε ∀ε ⇒ x=y | deleted (1-line proof) |
| `u3/s1` | Uniqueness of limits | scratch (the ε/2 trick) |
| `u3/s1` | Convergent ⇒ bounded | idea |

## Remarks and "In practice" (round 2)

Remarks went from 22 to 4. A remark is kept only for a genuine conceptual
trap:

| File | Kept remark |
|---|---|
| `u2/s1` | quantifier order ∀∃ vs ∃∀ |
| `u2/s2` | why min, not sup (and induction ⇔ well-ordering) |
| `u2/s4` | sup vs max for `[0,1)` |
| `u2/s5` | part (c) is a min argument, not a sup argument |

Every other remark became one of:

- **prose** — bridges and readings (ℚ is also a field / ordered field, the
  completeness preview, |a| as distance, reading the limit definition,
  ℚ is not complete, bounded ⇏ convergent, lim = ±∞ still diverges);
- **part of an Idea** — "u−1 is not an upper bound = ε-characterisation with ε=1";
- **deleted** — the s5 "recall the sup recipe" remark (now in s4's In practice);
- **In practice** — techniques and recipes, moved to the end of their section
  under `\inpractice` (unnumbered, listed in the TOC):
  - `u2/s2`: induction template; minimal-counterexample pattern
  - `u2/s3`: algebra is F1–F9; case-split with trichotomy; a>b ⇔ a−b∈P;
    unpack |x|≤c; add and subtract
  - `u2/s4`: verifying sup S (ε-form); the inf version

## Round 3: quantifiers, headers, font

The rules are now the MATH 147 house style: see
`handoff.md`, section **Presentation standard**.

- **Quantifiers** — all symbolic formulas in European style,
  `(\forall x\in\R)(\exists y\in\R)\,[x^3-y^3=1]`; convention stated in a
  `notation` box in `u2/s1`; the limit definition gained its symbolic form.
- **Headers** — content names instead of "Lecture 1" / "Course Notes";
  extra `\subsubsection`s (*The Field Axioms*, *The Order Axioms*,
  *The ε-Characterization of the Supremum*, *The Existence of √2*,
  *Countable and Uncountable Sets*, *The Limit of a Sequence*,
  *Uniqueness of the Limit*, …).
- **In practice** — plain `\subsubsection*{In practice}`, not in the TOC.
- **Font** — Times + matching math, now the `qhnotes` default
  (Century Schoolbook was tried first and dropped). `idea` / `scratch` are also defined in `note.tex`; the shared
  `qhnotes` package is untouched.

## Layout note

Remarks are unboxed, so a motivation paragraph that directly follows a remark
starts with `\medskip\noindent` to show it is not part of the remark.
