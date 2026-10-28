# Game Brief: Plantão

**One-sentence pitch:** Sobreviva a um plantão de 12 horas na UTI, em que cada decisão sobre leito, droga e equipe pode estabilizar ou perder um paciente.

## Core loop
- Chega uma admissão ou intercorrência, num cartão com sinais vitais.
- O jogador escolhe uma intervenção gastando recursos limitados: tempo, equipe, leitos e insumos.
- A cada hora de jogo, os pacientes melhoram ou pioram conforme o que foi feito.
- No fim do plantão, sai a pontuação, e o plantão seguinte é mais difícil.

## Player goal & fail state — what "working" looks like
- **Objetivo:** fechar as 12h com o máximo de pacientes estáveis.
- **Derrota:** 3 óbitos evitáveis, ou exaustão da equipe chegando a 100%.

## MVP — what must exist to be the game
1. Grade com 6 leitos e sinais vitais simplificados: PA, FC, SpO₂ e nível de consciência.
2. Relógio do plantão, em que cada ação consome tempo.
3. Cinco ações básicas: O₂/IOT, volume, vasopressor, antibiótico e chamar especialista.
4. Evolução do paciente por regras simples, com os valores em arquivo de configuração.
5. Admissões e intercorrências sorteadas.
6. Tela de fim de plantão com a pontuação.

## Out of scope — not building this
- Realismo farmacológico e qualquer pretensão educativa ou clínica.
- Multiplayer, história/narrativa, progressão entre plantões, sistema de save.

## Build order
1. Um paciente que evolui e responde às 5 ações, para provar que decidir é divertido.
2. Seis leitos e o relógio.
3. Admissões e intercorrências.
4. Tela de fim de plantão.
5. Polimento.

---
**Who it's for / what they feel:** Profissionais de saúde e fãs de jogos de gestão; tensão de decidir sob pressão em sessões de 15 a 20 min.

**Art & audio direction:** Interface 2D no visual de monitor multiparamétrico, com alarmes de monitor e de bomba de infusão.

**Reference game:** *Papers, Please*. O MVP mantém só o loop de decidir sob pressão de tempo dentro de um turno, sem a história.
