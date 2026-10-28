# Story 006: Fim de plantão e pontuação

> **Epic**: Plantão
> **Status**: Ready
> **Layer**: Presentation
> **Type**: UI
> **Estimate**: S
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: `Brief MVP feature 6`

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP feature 6; Player goal & fail state):*

- [ ] O plantão termina em vitória ao chegar às 12h sem atingir uma condição de derrota.
- [ ] O plantão termina em derrota no 3º óbito evitável.
- [ ] O plantão termina em derrota quando a exaustão da equipe chega a 100%.
- [ ] A tela de fim mostra o resultado (vitória/derrota e o motivo), pacientes estáveis, óbitos (evitáveis e não evitáveis) e a pontuação.
- [ ] A pontuação cresce com o número de pacientes estáveis no fim; a regra vem da config.
- [ ] Um botão (alvo ≥ 44 px) começa um plantão novo.

---

## Implementation Notes

- Detecção do fim em lógica pura (`ShiftOutcome`), ouvindo os sinais da story 004 e a contagem de óbitos evitáveis da story 001; a tela só exibe.
- Limite de óbitos (3) em config.

---

## Out of Scope

- Sistema de save, ranking, progressão entre plantões (fora do escopo do brief).

---

## Files

- `src/core/shift_outcome.gd`
- `src/ui/shift_end_screen.tscn`, `src/ui/shift_end_screen.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above*

---

## Test Evidence

**Story Type**: UI
**Required evidence**: retained screenshot of the end screen (victory and defeat) in `production/qa/evidence/` — BLOCKING (not waived at `qa.level: minimal`).

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/plantao/story-004-shift-clock.md`, `production/epics/plantao/story-005-admissions-events.md`
- Unlocks: None
