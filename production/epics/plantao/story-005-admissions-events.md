# Story 005: Admissões e intercorrências

> **Epic**: Plantão
> **Status**: Ready
> **Layer**: Feature
> **Type**: Logic
> **Estimate**: M
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: `Brief MVP feature 5`

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP feature 5; Core loop step 1):*

- [ ] Ao longo do plantão, admissões chegam e ocupam um leito vazio com um paciente novo e seus sinais.
- [ ] Intercorrências pioram de repente um paciente já internado.
- [ ] Os eventos são sorteados a partir de uma semente; a mesma semente gera a mesma sequência.
- [ ] Admissão com os 6 leitos cheios não ocupa leito e é registrada como recusada (sem travar o jogo).
- [ ] Frequência e tipos de evento vêm da config.
- [ ] Cada evento é mostrado ao jogador (um cartão ou aviso na grade).

---

## Implementation Notes

- `EventSpawner` recebe o RNG por injeção (`RandomNumberGenerator` com semente) para testes determinísticos.
- Ouve `hour_passed` da story 004.

---

## Out of Scope

- Plantões seguintes mais difíceis (fora do MVP: sem progressão entre plantões).

---

## Files

- `src/core/event_spawner.gd`
- `assets/data/event_table.tres`
- `tests/unit/plantao/event_spawner_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above*

---

## Test Evidence

**Story Type**: Logic
**Required evidence**: `tests/unit/plantao/event_spawner_test.gd` — advisory at `qa.level: minimal` (tests waived).

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/plantao/story-003-bed-grid.md`, `production/epics/plantao/story-004-shift-clock.md`
- Unlocks: `production/epics/plantao/story-006-shift-end.md`
