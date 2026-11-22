# GDD-04 Round 7 GitHub research (2026-11-22)

Approved gameplay: XP-CAP-001 C (full account XP on first clears and quests, diminishing XP on repeat farm), SWEEP-REWARD-001 B (same reward pools/chances as normal battle), TOWER-TIE-001 B (floor, remaining team HP, then time achieved), SEASON-RESET-001 B (28-day season rolls over at 06:00 Europe/Moscow). Proposals only; no code or dependencies approved.

## GitHub technical candidates for separate owner approval
- GH04-053 **STUDY** [Rubonnek/quest-manager](https://github.com/Rubonnek/quest-manager), MIT LICENSE verified, quest state and repeatable progress references for displaying first-time vs repeated XP. Reuse GH04-017/028/046 STUDY, no new integration.
- GH04-054 **STUDY** [hatchet-dev/pgoutbox](https://github.com/hatchet-dev/pgoutbox), MIT LICENSE verified, PostgreSQL transactional outbox for durable reward/XP/season notification events. Reuse GH04-035/047 STUDY, not required for authoritative ledger itself.
- GH04-055 **STUDY** [PieKing1215/godot-loot-tables](https://github.com/PieKing1215/godot-loot-tables), MIT LICENSE verified, Godot 4 WIP weighted loot pool editing reference; use shared reward definitions for regular/sweep visual preview only. Never roll rewards on the client. Reuse GH04-010/029 STUDY.
- GH04-056 **STUDY** [ducthanhdragonvip/Realtime-Leader-Broad](https://github.com/ducthanhdragonvip/Realtime-Leader-Broad), README reviewed; Go/Postgres/Redis live leaderboard architecture reference. LICENSE still NOT verified; architecture study only, no code reuse. Reuse GH04-048 STUDY. Redis remains unapproved.
- GH04-057 **ADAPT** [robfig/cron](https://github.com/robfig/cron) v3, MIT LICENSE verified, reuse previously approved GH04-026/036 ADAPT for 06:00 Europe/Moscow rollover wake-up. Must compute anchored 28-day season IDs in PostgreSQL, not use a 28-day cron interval; idempotency/downtime recovery custom.
- GH04-058 **BUILD** own server XP source/first-clear ledger and repeat-farm diminishing-return policy, deterministic award IDs and caps/exemptions configured later. Extends GH04-049.
- GH04-059 **BUILD** own shared authoritative reward resolver for normal and sweep battle, identical eligible loot tables/probabilities, atomic attempt consumption/claim, anti-reroll. Extends GH04-014/015/050.
- GH04-060 **BUILD** own tower rank comparator: highest cleared floor DESC, validated remaining party HP DESC, server-recorded achievement time ASC; stable tie rules and snapshot/audit. HP normalization (absolute vs percent) requires later owner decision. Extends GH04-052.
- GH04-061 **BUILD** own anchored 28-day season rollover at 06:00 Moscow with snapshot, reward settlement, idempotency, recovery and independent permanent tower. Extends GH04-042.

## Coverage and constraints
XP: GH04-053/054/058; SWEEP: GH04-055/054/059; TOWER TIES: GH04-056/060; RESET: GH04-057/061. README inspected for six distinct GitHub repositories; LICENSE verified for five, leaderboard license unresolved. Godot 4.7.2 Android compatibility and art licenses require later verification. Upstream robfig/cron has timezone support, but scheduled execution alone does not ensure transactionally correct rollovers. No installations, implementation, tests, code copying, APK builds or server changes.
