# Story 004: Relógio do plantão e exaustão

> **Epic**: Plantão
> **Status**: Ready
> **Layer**: Core
> **Type**: Logic
> **Estimate**: M
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: `Brief MVP feature 2`

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP feature 2; Core loop; fail state "exaustão da equipe chegando a 100%"):*

- [ ] O plantão dura 12 horas de jogo, começando em 0h.
- [ ] Aplicar uma ação avança o relógio pelo custo de tempo dela (story 002).
- [ ] Cada hora cheia que passa dispara um tick de evolução em todos os pacientes (story 001).
- [ ] Cada ação soma seu custo de equipe a uma barra de exaustão de 0 a 100%.
- [ ] O relógio e a exaustão aparecem na tela (sobre a grade da story 003).
- [ ] O relógio emite um sinal ao chegar em 12h e outro quando a exaustão chega a 100% (consumidos pela story 006).
- [ ] Duração do plantão e custos vêm da config.

---

## Implementation Notes

- `ShiftClock` como lógica pura com sinais (`hour_passed`, `shift_ended`, `exhaustion_maxed`); injetado, não singleton.

---

## Out of Scope

- Story 005: eventos sorteados ao longo das horas.
- Story 006: o que acontece no fim.

---

## Files

- `src/core/shift_clock.gd`
- `assets/data/shift_config.tres`
- `tests/unit/plantao/shift_clock_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above*

---

## Test Evidence

**Story Type**: Logic
**Required evidence**: `tests/unit/plantao/shift_clock_test.gd` — advisory at `qa.level: minimal` (tests waived).

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/plantao/story-001-patient-evolution.md`, `production/epics/plantao/story-002-clinical-actions.md`
- Unlocks: `production/epics/plantao/story-005-admissions-events.md`, `production/epics/plantao/story-006-shift-end.md`
