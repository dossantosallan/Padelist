# Story 002: As 5 ações clínicas

> **Epic**: Plantão
> **Status**: Ready
> **Layer**: Core
> **Type**: Logic
> **Estimate**: M
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: `Brief MVP feature 3`

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP feature 3; Core loop step 2):*

- [ ] Existem exatamente 5 ações: O₂/IOT, volume, vasopressor, antibiótico e chamar especialista.
- [ ] Aplicar uma ação a um paciente altera sua evolução nos ticks seguintes conforme regras em config.
- [ ] A ação indicada para o quadro do paciente melhora seus sinais; uma ação não indicada não melhora (e pode piorar, se a config disser).
- [ ] Cada ação tem um custo em tempo e em equipe, definido em config (consumido pela story 004).
- [ ] Uma ação não pode ser aplicada a um paciente em óbito.
- [ ] Um paciente que recebeu a ação indicada antes de morrer não conta como óbito evitável.

---

## Implementation Notes

- Ações como dados (`Resource` por ação), não um `match` fixo no código.
- Interface pura: `apply_action(patient, action) -> Result`, testável sem cena.

---

## Out of Scope

- Story 003: botões/toque para escolher a ação.
- Story 004: desconto do tempo e da equipe.

---

## Files

- `src/core/clinical_action.gd`
- `src/core/action_resolver.gd`
- `assets/data/actions/*.tres`
- `tests/unit/plantao/clinical_actions_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above*

---

## Test Evidence

**Story Type**: Logic
**Required evidence**: `tests/unit/plantao/clinical_actions_test.gd` — advisory at `qa.level: minimal` (tests waived).

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/plantao/story-001-patient-evolution.md`
- Unlocks: `production/epics/plantao/story-003-bed-grid.md`, `production/epics/plantao/story-004-shift-clock.md`
