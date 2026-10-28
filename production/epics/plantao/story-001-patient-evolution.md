# Story 001: Evolução do paciente

> **Epic**: Plantão
> **Status**: In Progress
> **Layer**: Core
> **Type**: Logic
> **Estimate**: M
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: 2026-10-28

## Context

**GDD**: `design/game-brief.md`
**Requirement**: `Brief MVP feature 4`

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP feature 4; Core loop step 3; fail state):*

- [ ] Um paciente tem 4 sinais simplificados: PA, FC, SpO₂ e nível de consciência.
- [ ] Cada paciente tem um estado derivado dos sinais: estável, instável, crítico ou óbito.
- [ ] A cada hora de jogo (tick), os sinais mudam segundo regras do quadro clínico do paciente; sem intervenção, um paciente instável tende a piorar.
- [ ] Todos os valores das regras (limiares de estado, taxas de piora/melhora) vêm de um arquivo de configuração, nenhum fixo no código.
- [ ] A evolução é determinística para a mesma entrada e a mesma semente.
- [ ] Um óbito ocorrido sem que o paciente tenha recebido a ação indicada é marcado como "evitável" (usado pela condição de derrota na story 006).

---

## Implementation Notes

- Lógica pura, sem nós de cena: classe `Patient` (dados) e `PatientEvolution` (regras), testáveis sem rodar o jogo.
- Regras em `Resource` (`.tres`) ou JSON em `assets/data/`.
- Realismo farmacológico está fora do escopo: regras simples bastam.

---

## Out of Scope

- Story 002: as ações que alteram a evolução.
- Story 004: o relógio que dispara os ticks.

---

## Files

- `src/core/patient.gd`
- `src/core/patient_evolution.gd`
- `assets/data/patient_rules.tres`
- `tests/unit/plantao/patient_evolution_test.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above*

---

## Test Evidence

**Story Type**: Logic
**Required evidence**: `tests/unit/plantao/patient_evolution_test.gd` — advisory at `qa.level: minimal` (tests waived).

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: None
- Unlocks: `production/epics/plantao/story-002-clinical-actions.md`, `production/epics/plantao/story-004-shift-clock.md`
