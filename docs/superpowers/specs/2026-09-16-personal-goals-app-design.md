# Personal Goals iOS App — Design

Data: 2026-09-16

## Visão geral

App iOS de metas pessoais, visual pastel/fofo. Dashboard com gráfico de
estatísticas (dia/semana/mês, alternando barra/linha), checklist de metas,
menu hambúrguer para criar hábito diário / meta semanal / meta mensal /
evento, e menu de perfil (Perfil, Notificações, Alterar senha, Sair).

Referência visual: [Figma — Personal Goals iOS App Design](https://www.figma.com/make/ld7ekwQ4N3LLkZWnbdE35E/Personal-Goals-iOS-App-Design)
(acesso via MCP do Figma pendente de autorização pelo usuário).

## Decisões de escopo e arquitetura

| Decisão | Escolha | Motivo |
|---|---|---|
| Backend | Supabase (Auth + Postgres + RLS) | App já prevê conta de usuário (perfil, alterar senha); ensina Networking/Auth/Segurança reais |
| Alcance | Publicar na App Store, sem foco em escala de muitos usuários | Portfólio, mas com fluxo de conta real |
| Notificações | Locais (UNUserNotificationCenter) no MVP; push remoto (APNs) fica de backlog | Evita exigir infra de servidor de push agora |
| Calendário | EventKit somente para exportar (escrita); sem leitura do calendário nativo | Menos invasivo, escopo menor |
| Gráfico | Swift Charts, alternância Barra ↔ Linha | Cobre bem dia/semana/mês sem excesso de variedade |
| Offline | Offline-first com sync (SwiftData local + Supabase remoto) | Padrão de mercado; módulo próprio por causa da complexidade |
| Arquitetura | MVVM com `@Observable` | Nativo do SwiftUI moderno, curva de aprendizado compatível com o restante das novidades do projeto (Supabase, sync, EventKit, notificações) |
| Plataforma | iOS 17+, somente iPhone | `@Observable` exige iOS 17+; sem complexidade de layout adaptativo por ora |

## Divisão em módulos

1. **Fundamentos & Design System** — setup do projeto, tokens visuais (cores
   pastel, tipografia), componentes base.
2. **Autenticação (Supabase)** — cadastro/login, sessão, telas de Perfil /
   Notificações / Alterar senha.
3. **Persistência & Sync (offline-first)** — modelagem de dados local
   (SwiftData) e remota (Supabase/Postgres), repositório offline-first, sync
   e RLS.
4. **Metas & Hábitos** — menu hambúrguer, formulário de criação, checklist
   com filtro concluídas/pendentes.
5. **Dashboard & Gráficos** — layout dia/semana/mês, Swift Charts
   barra/linha, cálculo de estatísticas.
6. **Calendário & Eventos** — tela de criar evento, exportação via EventKit.
7. **Notificações locais** — permissão, lembretes de água/movimento,
   curiosidade rotativa.

### Backlog (fora do MVP)

- Push remoto via APNs (curiosidades dinâmicas via servidor)
- Suporte a iPad / layout adaptativo
- Leitura do calendário nativo (hoje só escrita)

## Histórias por módulo

Ver divisão detalhada aprovada em conversa com o usuário em 2026-09-16
(módulos 1–7 acima, cada um com 2–4 histórias). As histórias serão
detalhadas (contexto, passo a passo, exercício, perguntas de fixação)
conforme cada módulo for aberto, seguindo o processo descrito no
`CLAUDE.md` do projeto.
