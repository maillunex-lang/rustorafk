# GDD-04 Round 6 GitHub research and technical candidates (2026-11-22)

Design approved: ACCOUNT-XP-001 C (account XP from campaign, quests and PvE with anti-farm caps); SWEEP-001 B (after first win, consuming mode attempts or energy); DUNGEON-EXTRA-001 C (up to 3 additional paid-in-game-resource entries per dungeon type/day, escalating prices); TOWER-RANK-001 B (highest floor then battle result tie-breaker). Planning/research only.

## GitHub candidates for separate approval
- GH04-044 **STUDY** [ShomyKohai/quest-system](https://github.com/ShomyKohai/quest-system), MIT LICENSE verified, Godot 4.4+ per README, resource-based quest progress and serialization. Study event-to-XP progress UI patterns only, not authoritative XP or replacement for previously approved Questify.
- GH04-045 **STUDY** [CodingQuests/godot-dialogue-quest-system](https://github.com/CodingQuests/godot-dialogue-quest-system), MIT LICENSE verified, Godot 4.7+ per README, event bus, quest objective tracking and reward conditions; study client UI/event presentation, not client-issued XP grants. 2D example; Windows-tested Godot 4.7.2, Android unverified.
- GH04-046 **STUDY** [Rubonnek/quest-manager](https://github.com/Rubonnek/quest-manager), MIT LICENSE verified, Godot 4.2.1+; quest state/claim UI for sweep eligibility and results; reuse GH04-017/028 STUDY, not another integration.
- GH04-047 **STUDY** [hatchet-dev/pgoutbox](https://github.com/hatchet-dev/pgoutbox), MIT LICENSE verified; Go pgx/PostgreSQL transactional outbox reference for durable XP, sweep and purchased-entry audit events; reuses GH04-035 STUDY.
- GH04-048 **STUDY** [ducthanhdragonvip/Realtime-Leader-Broad](https://github.com/ducthanhdragonvip/Realtime-Leader-Broad), README verified: Go Gin, PostgreSQL source of truth, Redis ranking cache, WebSocket updates. License file NOT verified, so study architecture only; no code reuse without license verification, and Redis is optional/not approved infrastructure.
- GH04-049 **BUILD** own Go/PostgreSQL account-XP ledger with source categories (campaign/quests/PvE), anti-farm caps and idempotent awards; no client-authoritative XP, exact amounts/caps deferred.
- GH04-050 **BUILD** own server-authoritative sweep eligibility (prior victory), mode-specific attempt/energy spend and atomic reward claim, reusing GH04-014; no universal energy introduced by this choice.
- GH04-051 **BUILD** own transactional 3 extra dungeon purchases per type/day with monotonically escalating cost table, 06:00 MSK period keys, retry/idempotency and rollback; exact prices/currency deferred; extends GH04-033/041.
- GH04-052 **BUILD** own tower leaderboard sorted by highest cleared floor then validated battle-result metric, season snapshot/tie-break stability, anti-cheat; exact secondary metric deferred, extends GH04-032/042.

## Coverage and verification
ACCOUNT-XP: GH04-044/045/049; SWEEP: GH04-046/047/050; DUNGEON-EXTRA: GH04-047/051; TOWER-RANK: GH04-048/052. Six distinct GitHub READMEs reviewed via connected GitHub connector; LICENSE verified for five, leaderboard license unresolved. Third-party art licenses and Godot Android support need separate checks. No installs, copies, code edits, tests, APKs, or gameplay changes. The proposed dispositions are NOT approved until owner responds.
