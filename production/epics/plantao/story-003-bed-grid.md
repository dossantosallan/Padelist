# Story 003: Grade de 6 leitos

> **Epic**: Plantão
> **Status**: Ready
> **Layer**: Presentation
> **Type**: UI
> **Estimate**: M
> **Manifest Version**: N/A (minimal — no control manifest)
> **Last Updated**: [set by /dev-story when implementation begins]

## Context

**GDD**: `design/game-brief.md`
**Requirement**: `Brief MVP feature 1`

**ADR Governing Implementation**: N/A (minimal — no ADRs)
**ADR Decision Summary**: N/A (minimal — no ADRs)
**ADR Version**: N/A (minimal — no ADRs)

**Engine**: Godot 4.7 | **Risk**: HIGH
**Engine Notes**: none (no ADR engine-compatibility analysis at minimal)

**Control Manifest Rules (this layer)**: N/A (minimal — no control manifest)

---

## Acceptance Criteria

*From `design/game-brief.md` (MVP feature 1; Art & audio direction; technical-preferences Input & Platform):*

- [ ] A tela mostra 6 leitos; cada leito ocupado mostra PA, FC, SpO₂ e nível de consciência.
- [ ] Leito vazio é visualmente distinto de leito ocupado.
- [ ] O estado do paciente (estável, instável, crítico, óbito) é legível sem depender só de cor (ícone ou texto também).
- [ ] Tocar num leito ocupado abre as 5 ações da story 002; tocar numa ação a aplica.
- [ ] Alvos de toque têm no mínimo 44 px; nenhuma ação depende de passar o mouse; também funciona com mouse.
- [ ] Os sinais na tela atualizam após cada tick e cada ação.
- [ ] Visual no estilo de monitor multiparamétrico (brief, Art & audio).

---

## Implementation Notes

- Nós `Control` em `GridContainer`; a cena só lê o estado e emite sinais (`action_requested`), sem regra clínica na UI.
- Renderizador Compatibility (web).

---

## Out of Scope

- Story 004: relógio na tela.
- Story 006: tela de fim de plantão.
- Alarmes sonoros (polimento).

---

## Files

- `src/ui/bed_grid.tscn`, `src/ui/bed_grid.gd`
- `src/ui/bed_card.tscn`, `src/ui/bed_card.gd`
- `src/ui/action_menu.tscn`, `src/ui/action_menu.gd`

---

## QA Test Cases

*N/A — no qa-lead specs at this tier; implement against the Acceptance Criteria above*

---

## Test Evidence

**Story Type**: UI
**Required evidence**: retained screenshot of the bed grid and the action menu in `production/qa/evidence/` — BLOCKING (not waived at `qa.level: minimal`).

**Status**: [ ] Not yet created

---

## Dependencies

- Depends on: `production/epics/plantao/story-002-clinical-actions.md`
- Unlocks: `production/epics/plantao/story-005-admissions-events.md`
