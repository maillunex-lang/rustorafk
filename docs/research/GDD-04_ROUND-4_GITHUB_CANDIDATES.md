# GDD-04 Round 4 GitHub research (2026-11-22)

Approved design: QUEST-RESET-001 B (06:00 Europe/Moscow daily, Monday weekly), TOWER-REWARD-001 C (one-time permanent tower rewards, seasonal repeatable rewards/ranking), DUNGEON-ENTRY-001 B (free daily entries plus resource-paid entries), BOSS-REWARD-001 C (participation/contribution/rank rewards, separate co-op rewards). Research only, no integration approval.

## Candidate decisions
- GH04-026 **ADAPT** [robfig/cron](https://github.com/robfig/cron) v3, MIT LICENSE verified: Go cron parser and per-job time zones, configure Europe/Moscow at 06:00. Adapt as wake-up scheduler only; PostgreSQL period IDs, transactional reset and recovery on missed jobs are custom. Go service compatibility test pending.
- GH04-027 **STUDY** [go-co-op/gocron](https://github.com/go-co-op/gocron) v2, MIT LICENSE verified: alternative daily/weekly Go scheduler with singleton and distributed lock patterns. Do not install both schedulers by default.
- GH04-028 **STUDY** [Rubonnek/quest-manager](https://github.com/Rubonnek/quest-manager), MIT LICENSE verified: quest-state metadata/UI reference for reset countdown and claim states; already GH04-017 STUDY, this is reuse, not duplicate plugin integration.
- GH04-029 **STUDY** [PieKing1215/godot-loot-tables](https://github.com/PieKing1215/godot-loot-tables), MIT LICENSE verified, WIP: reference for visual floor/dungeon/boss reward table editing; previously GH04-010 STUDY. Never roll authoritative rewards on client.
- GH04-030 **STUDY** [NVIDIA/go-ratelimit](https://github.com/NVIDIA/go-ratelimit), Apache-2.0 LICENSE verified: Redis-based Go API rate-limiting/abuse defense, not a dungeon-entry entitlement counter or replacement for PostgreSQL transactions. Redis would add infrastructure, so study only.
- GH04-031 **BUILD** own reset-period IDs and idempotent daily/weekly quest generation for 06:00 Moscow, Monday weekly; handle late starts, downtime, duplicate executions, countdown and transactional claims.
- GH04-032 **BUILD** permanent tower one-time floor claim ledger plus seasonal tower season IDs, repeatable rewards, ranking snapshots, tie rules and season rollover.
- GH04-033 **BUILD** transactional dungeon attempt wallet: free daily counters and optional in-game-resource purchases with per-mode policies, refund-on-failed-entry and idempotent debits; amounts and resource type require later approval.
- GH04-034 **BUILD** authoritative world boss reward eligibility, participation/contribution/rank tiers, anti-AFK/anti-collusion validation and distinct co-op reward claim ledger, reusing approved GH04-015/025.

## Checks and boundaries
GitHub README/LICENSE inspected via connected GitHub connector; scheduler capabilities corroborated by upstream GitHub docs. Five repos are either MIT or Apache-2.0 as listed; no copying of code. The Godot addons are research references and Android compatibility unverified. No dependencies installed, no tests run, no game/server/APK modifications. Owner must separately approve GH04-026…034. Reset is fixed by design at 06:00 Moscow; exact season length, entry count/currency, contribution thresholds and rankings remain open.
