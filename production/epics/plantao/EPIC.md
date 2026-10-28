# Epic: Plantão

> **Source**: `design/game-brief.md` (workflow: minimal — no GDD, no ADRs)
> **Layer**: Core

## Goal

Sobreviva a um plantão de 12 horas na UTI, em que cada decisão sobre leito, droga e equipe pode estabilizar ou perder um paciente.

## Scope (brief MVP)

1. Grade com 6 leitos e sinais vitais simplificados (PA, FC, SpO₂, consciência).
2. Relógio do plantão; cada ação consome tempo.
3. Cinco ações básicas: O₂/IOT, volume, vasopressor, antibiótico, chamar especialista.
4. Evolução do paciente por regras simples, valores em config.
5. Admissões e intercorrências sorteadas.
6. Tela de fim de plantão com pontuação.

## Order (brief Build order)

1. Um paciente que evolui e responde às 5 ações (stories 001–002).
2. Seis leitos e o relógio (stories 003–004).
3. Admissões e intercorrências (story 005).
4. Fim de plantão (story 006).

## Stories

| # | Story | Type | Status | ADR |
|---|-------|------|--------|-----|
| 001 | Evolução do paciente | Logic | Ready | N/A (minimal) |
| 002 | As 5 ações clínicas | Logic | Ready | N/A (minimal) |
| 003 | Grade de 6 leitos | UI | Ready | N/A (minimal) |
| 004 | Relógio do plantão e exaustão | Logic | Ready | N/A (minimal) |
| 005 | Admissões e intercorrências | Logic | Ready | N/A (minimal) |
| 006 | Fim de plantão e pontuação | UI | Ready | N/A (minimal) |
