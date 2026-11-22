# GDD DECISIONS

## Project
- Platform: Android / RuStore; Godot 4 client, server-authoritative online systems.
- Genre: collectible 3D Anime Fantasy Idle RPG, asynchronous arena.
- Monthly additional budget: 3,000-10,000 RUB.
- Meshy AI API for humanoid 3D models and rigging.
- Owner approves every GDD stage and separately approves third-party technology integration.

## GDD-01 - APPROVED (2026-11-22)
- VIS-001 A: premium richly illustrated anime fantasy presentation based on owner-provided visual references; original characters and UI, no direct copying.
- WORLD-001 A: War of Heaven and Abyss; celestial and abyssal factions.
- BATTLE-001 B: five versus five; characters move around 3D arenas and use abilities.
- HERO-001 B: target 24 unique collectible heroes at full release, smaller prototype roster.
- BASE-001 A: no base-building; focus on heroes.
- STORY-001 B: extensive story campaign with dialogue and hero stories.
- ORIENT-001 A: portrait 9:16.
- Mandatory production constraint: every hero, enemy and boss is humanoid with a compatible skeletal rig for Meshy AI pipeline; verify retargeting and animation per model.
- 2D hero splash art and 3D battle models are distinct assets requiring visual consistency.

## Implementation gate
GDD-01 technology selections approved 2026-11-22:
- TECH-001 ADOPT: nathanhoad/godot_dialogue_manager (conditional on version/license/Android verification).
- TECH-002 ADAPT: expressobits/inventory-system (conditional on GDExtension/Android binary verification).
- TECH-003 BUILD: custom authoritative 5v5 combat, roster, economy, arena and idle logic.
- GLoot is REFERENCE only, not selected for integration.
- Scope: approved technical PoC only. GDD-01 PoC ACCEPTED by owner on 2026-11-22 after Android screenshots and confirmation of smooth Meshy animation. GDD-02 design is open, but no GDD-02 choices or technology are approved.
- No claim of Android compatibility until an APK is built and tested.

## GDD-01 acceptance evidence and deferred QA
- Android device screenshots: app opens in portrait; Meshy humanoid renders; UI displays Dialogue Manager and Expresso OK; 5v5 turns progress from 0 to 17, survivors from 5:5 to 2:0.
- Owner explicitly confirmed smooth character walking and accepted GDD-01.
- This is functional acceptance, not evidence of measured FPS/RAM or full 10-character 3D performance.
- Deferred: FPS/RAM profiling, prolonged stability, ten animated humanoids simultaneously.
- Do not mark these deferred checks as passed.

## GDD-02 - APPROVED (2026-11-22)
- COMBAT-001 B: auto real-time 5v5 battle with manual ultimate activation.
- ROLE-001 C: tank, warrior, assassin, marksman, mage, support/healer.
- SKILL-001 B: 3 ordinary abilities plus 1 ultimate per hero.
- ULT-001 A: ultimate effects occur directly on the arena; no separate cinematic.
- PACE-001 B: target battle length 30-60 seconds.
- FORM-001 B: freely arrange five pre-battle positions.
- GDD-02 technology choices APPROVED 2026-11-22: AI-TECH-001 ADAPT LimboAI; MOVE-TECH-001 ADOPT NavigationAgent3D; SKILL-TECH-001 BUILD custom skills; CAM-TECH-001 ADAPT Phantom Camera; ANIM-TECH-001 ADOPT Godot humanoid retargeting/AnimationTree; FORM-TECH-001 BUILD formations and combat rules. Scope isolated PoC only. Owner authorized GDD-03 design transition 2026-11-22; implementation and final QA remain deferred.

## GDD-02 design handoff (2026-11-22)
Owner explicitly authorized transition to GDD-03 in accelerated design-first mode. GDD-02 design decisions and isolated Android prototype are retained; this is not final production implementation/QA acceptance. Deferred to development: automatic ordinary skills, balance, AnimationTree/retargeting, integration of GDD-01 addons, reproducible Meshy and native binary pipeline, extended Android QA.

## GDD-03 - ROUND 1 APPROVED (2026-11-22)
- HERO-001 D: hybrid hero acquisition via summons, hero fragments, events and story rewards.
- RARITY-001 C: six hero rarities N / R / SR / SSR / UR / Mythic.
- LEVEL-001 C: hero progression via level, stars, skills and equipment. Awakening/talents are not included by this choice.
- DUP-001 D: duplicate heroes support a hybrid system of star upgrades, fragments and exchange; precise conversion rates and rules are deferred to development/balance design.
- Preserve GDD-01 roster target of 24 unique heroes at full release and GDD-02 six combat roles. These decisions do not specify rarity distribution, summon odds, currencies, caps or pricing; those remain undecided.
- GDD-03 further rounds pending owner selection. No implementation, APK, or third-party integration during GDD without explicit request.

## GDD-03 - ROUND 2 APPROVED (2026-11-22)
- FACTION-001 C: four main factions plus two special factions. Faction names, affinities and bonuses are not yet specified.
- ROSTER-001 B: among the 24 unique heroes planned for full release, most belong to the four main factions, with fewer rare heroes in the two special factions. Exact counts are deferred.
- STAR-001 B: hero star progression capped at six stars. Star-upgrade costs and rarity-specific rules are deferred.
- CLASS-002 A: each hero has one fixed combat class; no class switching. Preserve the six GDD-02 combat roles.
- Development backlog: faction distribution and bonuses, rarity distribution, six-star economy and duplicate requirements, hero-specific class assignments and roster UI. No implementation or third-party integration during GDD without separate approval.
- GDD-03 design remains open for the next concise round.

## GDD-03 - ROUND 3 APPROVED (2026-11-22)
- EXP-001 B: hero levels advance through experience consumables (XP potions) and experience earned in battles.
- SKILL-UP-001 B: individual abilities are upgraded separately using gold and materials.
- FACTION-BONUS-001 C: faction synergies support flexible thresholds of 2 / 3 / 5 heroes of the same faction in the five-hero squad. Exact bonus magnitudes and interaction rules are deferred to development/balance.
- TEAM-001 A: freely compose the five-hero squad from any owned heroes; no mandatory tank, support, or class quota. This is compatible with optional faction synergy bonuses.
- Deferred implementation details: XP curves and caps, potion drops, skill upgrade costs, faction synergy effects and stacking, combat balancing and UI explanations. No code or APK during accelerated GDD.

## GDD-03 - ROUND 4 APPROVED; DESIGN CLOSED (2026-11-22)
- CAP-001 B: hero maximum level is 200.
- RARITY-UP-001 B: heroes can increase rarity, subject to a limit determined by their starting rarity; exact rarity-to-rarity ceilings and upgrade recipes deferred to development.
- RESET-001 C: hero progression reset is free up to a defined level, then costs ordinary in-game currency; threshold, currency amount, and refunded resources deferred to development.
- COLLECTION-001 C: hero album/collection, achievements, and modest passive collection bonuses; bonus amounts and eligibility deferred to development.
- All 16 GDD-03 design choices across four rounds approved. GDD-03 design phase CLOSED by owner direction; this does not certify implementation, testing, economy balance, or production readiness.
- Development backlog: hero data models, 24-hero roster/faction and rarity assignment, six classes, summon/fragment/event/story acquisition and guarantees, N/R/SR/SSR/UR/Mythic rarity transitions and ceilings, duplicate conversions, six-star costs, XP to level 200, skill upgrade costs, free/paid reset threshold and refund rules, collection album/achievements/modest bonuses, 2/3/5 faction synergies, free five-hero squad, server authority, UI, balance, testing and GitHub technology review/approval before integration.

## GDD-04 - IN DESIGN (2026-11-22)
Scope: story campaign, quests, PvE. Round 1 approved below; later rounds pending. Accelerated design-first workflow: ask for owner choices, record decisions, defer implementation and technology integration.

## GDD-04 - ROUND 1 APPROVED (2026-11-22)
- STORY-001 A: linear main story campaign organized into chapters, in the approved Heaven versus Abyss setting. Branching narrative is not selected.
- CAMPAIGN-001 B: each campaign chapter has 20–30 battles plus story scenes; exact count, scene scripts and chapter count deferred to content production.
- QUEST-001 D: story, daily, weekly, event and hero-specific quests. Hero-specific quests do not by themselves imply separate hero story campaigns.
- PVE-001 D: hybrid PvE includes a challenge tower, resource/boss dungeons, world bosses and cooperative play. Multiplayer architecture and release phasing deferred.
- Implementation backlog: chapter/quest content, mission tracking and rewards, repeatability/reset cadence, PvE difficulty and matchmaking, authoritative progression, live events, boss balance, localization, QA. No code or APK during GDD.

## GDD-04 - TECHNICAL CANDIDATES APPROVED (2026-11-22)
Owner approved dispositions after round-1 GitHub research; these are architecture/planning choices, NOT permission to integrate during GDD:
- GH04-001 ADAPT: TheWalruzz/godot-questify for Godot quest authoring/client presentation; authoritative validation remains server-side.
- GH04-002 STUDY: Chevifier/QuestManager as alternative/reference only; verify license text and compatibility before any further proposal.
- GH04-003 ADOPT: nathanhoad/godot_dialogue_manager for story dialogues; reiterates conditional GDD-01 TECH-001 selection, with Godot/Android verification still pending.
- GH04-004 STUDY: gdquest-demos/godot-4-pcg-basic-dungeon, with source/art license distinctions.
- GH04-005 STUDY: CodingQuests/godot-multiplayer-starter, server-authoritative co-op reference, not a replacement for planned Go server.
- GH04-006 STUDY: tngklp/godot-multiplayer-lobby-system, lobby reference only.
- GH04-007 BUILD: own chapter/stage definitions, unlocks and server-persisted campaign progression.
- GH04-008 BUILD: own authoritative quest schedule, reset rules, reward validation, PvE state and co-op reward handling.
Source review: docs/research/GDD-04_GITHUB_CANDIDATES.md. Next: GDD-04 round 2 design choices. No plugins installed, no integration, no APK.

## GDD-04 - ROUND 2 APPROVED (2026-11-22)
- UNLOCK-001 B: new chapters require both completion of the preceding chapter and a minimum level; precise level gate and whether it refers to account or heroes require subsequent specification, not assumed.
- REPLAY-001 C: completed campaign battles can be replayed, with quick-battle/sweep available after victory; exact sweep limits, resource costs and reward eligibility remain undecided.
- SCENE-001 A: story scenes use text dialogue with character portraits; do not assume 3D cutscenes or illustrated/3D character scene presentation.
- REWARD-001 C: PvE rewards include resources, equipment, hero fragments and rare rewards; tables, drop rates, anti-abuse and mode eligibility deferred.
- Next step: research GitHub implementations and submit separate GH04 round-2 candidate choices for owner approval. No implementation or dependency installation authorized.

## GDD-04 - ROUND 2 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner explicitly approved the following planning dispositions after the round-2 GitHub research; no integration, tests, or code changes are authorized:
- GH04-009 ADAPT: adapt previously approved Dialogue Manager for portrait-and-text story presentation.
- GH04-010 STUDY: PieKing1215/godot-loot-tables, WIP editor-facing loot tables reference; never trust client RNG for server rewards.
- GH04-011 STUDY: CodingQuests/godot-save-system for local settings/cache patterns only; authoritative account state remains server-side.
- GH04-012 STUDY: TommyKooij/SaveSystem as alternative local save reference only.
- GH04-013 BUILD: own server-side campaign chapter gate, prior-chapter completion plus minimum level; precise level type/threshold remain undecided.
- GH04-014 BUILD: own server-validated replay/sweep eligibility, atomic resource/reward handling and abuse protection.
- GH04-015 BUILD: own authoritative PvE loot tables, drops, fragments and idempotent grants.
- GH04-016 BUILD: own portrait/text UI presentation on the approved Dialogue Manager runtime; no 3D cutscenes.
- Research record: docs/research/GDD-04_ROUND-2_GITHUB_CANDIDATES.md. Next: GDD-04 round 3 design. Implementation deferred until separately authorized.

## GDD-04 - ROUND 3 APPROVED (2026-11-22)
- DAILY-001 B: daily and weekly quests reset at a configured unified server reset time. Exact time, time zone, weekly boundary, and event exceptions are deferred.
- TOWER-001 C: persistent-progress challenge tower plus a separate seasonal tower; seasonal reset/reward rules and floor counts deferred.
- DUNGEON-001 B: separate resource dungeons for gold, experience, equipment and upgrade materials; exact difficulty tiers, entry limits and loot tables deferred.
- BOSS-001 C: hybrid world boss with shared target/damage ranking plus distinct cooperative battles; live-versus-asynchronous world boss participation and co-op session design deferred.
- Next: GitHub research for all four mechanics and separate owner approval of technical dispositions. No implementation, integration, builds or tests during GDD.

## GDD-04 - ROUND 3 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner explicitly approved all nine technical candidate dispositions following the round-3 GitHub research. These are planning decisions, NOT authorization to install or implement:
- GH04-017 STUDY: Rubonnek/quest-manager, hierarchical quest-state reference; do not replace already approved Questify without new approval.
- GH04-018 STUDY: RyosukeMondo/snap-dungeon-v2, mobile daily runs/floors reference, including third-party asset licensing review.
- GH04-019 STUDY: Drejzer/FloorArchitect, optional room-layout reference; procedural dungeons are not approved by DUNGEON-001 B.
- GH04-020 STUDY: CodingQuests/godot-multiplayer-starter, authoritative co-op and lobby reference; not a replacement for planned Go backend.
- GH04-021 STUDY: tngklp/godot-multiplayer-lobby-system, alternate lobby and readiness reference, not permission for peer-host authority.
- GH04-022 BUILD: custom server daily/weekly reset scheduler with configured boundary, idempotency and outage recovery.
- GH04-023 BUILD: custom permanent and seasonal tower progress, season resets and reward state.
- GH04-024 BUILD: custom data-driven gold/XP/equipment/material dungeon definitions and server-validated entry/rewards.
- GH04-025 BUILD: custom world-boss damage ranking plus separate authoritative cooperative encounters.
- Research record: docs/research/GDD-04_ROUND-3_GITHUB_CANDIDATES.md. Godot 4.7.2/Android compatibility tests and implementation remain deferred. Next: GDD-04 round 4 design.

## GDD-04 - ROUND 4 APPROVED (2026-11-22)
- QUEST-RESET-001 B: unified server daily reset at 06:00 Moscow time; weekly reset on Monday at the same server boundary. Moscow time is UTC+03:00. Event exceptions and notification behavior deferred.
- TOWER-REWARD-001 C: permanent tower progress never seasonally resets and offers one-time floor rewards; separate seasonal tower has repeatable seasonal rewards and a ranking. Season length, claim timing and tie rules deferred.
- DUNGEON-ENTRY-001 B: free daily dungeon attempts plus optional extra entries purchased with in-game resources; exact number, costs, caps and whether resources are premium deferred, no real-money purchases implied.
- BOSS-REWARD-001 C: participation reward plus individual contribution and ranking rewards for world boss; separate co-op rewards. Contribution floors, eligibility and anti-abuse rules deferred.
- Next: GitHub research for each mechanism, propose technical candidates for separate owner approval. No implementation, integration, tests or builds.

## GDD-04 - ROUND 4 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner explicitly approved technical dispositions, for future planning only:
- GH04-026 ADAPT: robfig/cron v3 for scheduled Go jobs at 06:00 Europe/Moscow; durable period IDs, recovery and atomic claims remain custom.
- GH04-027 STUDY: go-co-op/gocron v2 as alternate scheduler, not a second approved dependency.
- GH04-028 STUDY: Rubonnek/quest-manager for quest UI/reset state reference, reusing prior GH04-017 STUDY.
- GH04-029 STUDY: PieKing1215/godot-loot-tables for editor-facing rewards reference, reusing GH04-010 STUDY; never trust client RNG.
- GH04-030 STUDY: NVIDIA/go-ratelimit for API protection only, not gameplay attempt balances; Redis requirement requires later assessment.
- GH04-031 BUILD: own idempotent daily/weekly reset period state at 06:00 MSK and Monday, including downtime recovery and transactional claims.
- GH04-032 BUILD: own one-time permanent tower floor claims and seasonal rewards/rankings/rollovers.
- GH04-033 BUILD: own transactional daily free attempts and in-game-resource extra dungeon entries, with idempotency/refunds.
- GH04-034 BUILD: own world-boss participation/contribution/ranking reward validation and separate co-op claims.
- Research record: docs/research/GDD-04_ROUND-4_GITHUB_CANDIDATES.md. No installation, integration, tests, APK or server/game code changes authorized. Next: GDD-04 round 5 design choices.

## GDD-04 - ROUND 5 APPROVED (2026-11-22)
- CHAPTER-LEVEL-001 B: unlock next chapter only when previous chapter completed AND account level meets a chapter-specific minimum. Exact level thresholds deferred.
- DUNGEON-LIMIT-001 B: three free daily attempts for EACH of the four resource dungeon types (gold, XP, equipment, materials); additional resource-paid entries remain as approved in DUNGEON-ENTRY-001 B. Purchase caps/costs deferred.
- TOWER-SEASON-001 C: seasonal tower cycle lasts 28 days; permanent tower progress and one-time rewards are unaffected. Season alignment and rollover timing deferred.
- DIFFICULTY-001 C: PvE difficulty escalates through enemy stats, new enemy abilities and special stage conditions, not just stat inflation; exact curves, skill unlocks and modifiers deferred.
- Next: GitHub research for each mechanic, propose GH04 round-5 technical candidates for separate owner approval. No implementation or integration authorized.

## GDD-04 - ROUND 5 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner explicitly approved these planning dispositions after round-5 GitHub research:
- GH04-035 STUDY: hatchet-dev/pgoutbox transactional outbox reference for durable Go/PostgreSQL progress/reward events; no dependency installation.
- GH04-036 ADAPT: reuse approved robfig/cron v3 for 28-day season boundary checks; exact 28-day periods and idempotent rollover must be anchored in database, not inferred from cron alone.
- GH04-037 ADAPT: reuse approved LimboAI behavior trees/state machines for enemy abilities, phases and stage modifiers; Android compatibility testing deferred.
- GH04-038 STUDY: CodingQuests/godot-enemy-ai, 2D enemy telegraphs and patterns reference only.
- GH04-039 STUDY: CodingQuests/godot-state-machine, 2D state transition reference only; no replacement of LimboAI.
- GH04-040 BUILD: own authoritative chapter gates using account level and previous chapter completion.
- GH04-041 BUILD: own three free daily entries per resource dungeon type, with atomic claims/reset and optional paid entries.
- GH04-042 BUILD: own 28-day seasonal tower cycle, rankings/rewards/rollover without affecting permanent tower.
- GH04-043 BUILD: own data-driven PvE difficulty scaling with stats, abilities and stage conditions.
- Research: docs/research/GDD-04_ROUND-5_GITHUB_CANDIDATES.md. No code changes, dependency installation, integration, tests or APK builds authorized. Next: GDD-04 round 6 design choices.

## GDD-04 - ROUND 6 APPROVED (2026-11-22)
- ACCOUNT-XP-001 C: account XP comes from campaign, quests and PvE activities, with anti-farm limits. Exact XP amounts, eligible events and caps deferred.
- SWEEP-001 B: quick/sweep battles available after first victory and consume attempts or energy belonging to that mode. Sweep reward eligibility and mode exceptions deferred; no new universal energy system is implied.
- DUNGEON-EXTRA-001 C: up to three extra entries per resource dungeon type each day, with increasing cost per purchase; free three per type remain unchanged. Resource denomination and cost curve deferred.
- TOWER-RANK-001 B: seasonal tower ranks by highest cleared floor, with battle result as a secondary tie-breaker. Definition of battle result, remaining tie-breakers and season snapshot rules deferred.
- Next: research GitHub for each mechanic and seek separate owner approval of GH04 round-6 technical proposals. No implementation authorized.

## GDD-04 - ROUND 6 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner approved the following dispositions as planning decisions only:
- GH04-044 STUDY: ShomyKohai/quest-system, Godot quest event/XP UI reference; no replacement of approved Questify.
- GH04-045 STUDY: CodingQuests/godot-dialogue-quest-system, quest events and reward presentation reference; not client-authoritative XP.
- GH04-046 STUDY: Rubonnek/quest-manager, sweep eligibility/result state reference; reuse prior GH04-017/028 STUDY.
- GH04-047 STUDY: hatchet-dev/pgoutbox, durable event delivery for XP, sweep and purchases; reuse GH04-035 STUDY.
- GH04-048 STUDY: ducthanhdragonvip/Realtime-Leader-Broad, Go/Postgres/Redis ranking architecture reference only. License NOT verified; no code copying or integration, Redis not approved.
- GH04-049 BUILD: own authoritative account-XP ledger for campaign/quests/PvE with anti-farm limits and idempotent grants.
- GH04-050 BUILD: own sweep eligibility after first victory, mode-specific attempt/energy consumption and atomic rewards.
- GH04-051 BUILD: own maximum three extra dungeon purchases per type/day with increasing costs, server period keys and transactional debits.
- GH04-052 BUILD: own seasonal tower leaderboard sorted by highest cleared floor then server-validated battle result, stable tie-breaking and anti-cheat.
- Research record: docs/research/GDD-04_ROUND-6_GITHUB_CANDIDATES.md. No code changes, integrations, dependencies, tests or APK builds authorized. Next: GDD-04 round 7 design.

## GDD-04 - ROUND 7 APPROVED (2026-11-22)
- XP-CAP-001 C: first-time completions and quests grant full account XP; repeated farming yields diminishing account XP. Exact decay schedule, per-source exemptions and thresholds deferred; no blanket hard daily XP cap implied.
- SWEEP-REWARD-001 B: eligible sweep battles grant the same reward pools and probabilities as regular battles; still require first victory and spend mode-specific attempts/energy. Server-authoritative RNG and idempotent claims required; no client-side rerolling.
- TOWER-TIE-001 B: seasonal tower ranking first sorts by highest cleared floor, then remaining team health, then time the floor was achieved. Exact health normalization and timestamp semantics deferred.
- SEASON-RESET-001 B: 28-day tower seasons roll over at 06:00 Europe/Moscow, aligned to daily reset; anchor date and reward-claim grace policy deferred. Permanent tower remains unchanged.
- Next: GitHub research per mechanic and separate technical candidate approval. No implementation, dependencies, tests or builds authorized.

## GDD-04 - ROUND 7 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner explicitly approved these planning dispositions after round-7 GitHub research:
- GH04-053 STUDY: Rubonnek/quest-manager, quest state/UI reference for first-time and repeat account-XP presentation; reuse previous STUDY, no plugin installation.
- GH04-054 STUDY: hatchet-dev/pgoutbox, PostgreSQL transactional event delivery reference for XP/rewards/season notifications; reuse previous STUDY.
- GH04-055 STUDY: PieKing1215/godot-loot-tables, Godot 4 WIP weighted loot table editor reference for sweep/normal reward parity; no client-authoritative RNG.
- GH04-056 STUDY: ducthanhdragonvip/Realtime-Leader-Broad, ranking architecture only; LICENSE NOT verified, no code copying, Redis not approved.
- GH04-057 ADAPT: reuse robfig/cron v3 for 06:00 Europe/Moscow season rollover trigger; exact 28-day period anchors, recovery and transactions are custom.
- GH04-058 BUILD: own server first-clear and repeat-farm account XP ledger with configurable diminishing returns and idempotent grants.
- GH04-059 BUILD: own shared server reward resolver for normal and sweep battles, same eligible loot pools and probabilities, atomic spend and claim.
- GH04-060 BUILD: own seasonal tower rank comparator (highest floor, remaining team HP, achievement time), validation and snapshot; HP metric deferred.
- GH04-061 BUILD: own 28-day season rollover at 06:00 MSK with settlement, idempotency and outage recovery; permanent tower untouched.
- Research record: docs/research/GDD-04_ROUND-7_GITHUB_CANDIDATES.md. This approval does not authorize integration, implementation, installs, testing or builds. Next: GDD-04 round 8 design choices.

## GDD-04 - ROUND 8 APPROVED (2026-11-22)
- TOWER-HP-001 B: seasonal tower ranking HP tie-break is remaining total party HP as a percentage of the party's total maximum HP, after highest cleared floor; achievement time remains the next tie-break. Precise rounding, snapshot and dead-hero treatment deferred.
- SEASON-ANCHOR-001 B: shared global tower seasons anchored to Monday 06:00 Europe/Moscow, every four weeks (28 days), not per-player. First anchor Monday/date deferred; permanent tower unaffected.
- SWEEP-ACCESS-001 B: sweeps unlock after the first victory ONLY on repeatable PvE stages; non-repeatable/story-only rewards and other modes are excluded unless later explicitly approved. Existing mode-specific attempts/energy consumption and equal eligible reward chances remain.
- BOSS-ELIGIBILITY-001 C: world boss participation rewards require a validated minimum contribution OR meaningful active participation; exact thresholds, anti-idle criteria and accessibility cases deferred. Ranking/contribution rewards remain separate.
- Next: GitHub research for each approved mechanic and separate owner approval of GH04 round-8 technical candidates. No implementation, installation, testing, server/game changes or APK builds authorized.

## GDD-04 - ROUND 8 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner explicitly approved these planning dispositions:
- GH04-062 STUDY: CodingQuests/godot-multiplayer-starter, authoritative multiplayer action/event patterns for world-boss participation; Godot ENet example is not a drop-in replacement for Go backend.
- GH04-063 STUDY: Rubonnek/quest-manager, first-victory/repeatable PvE stage sweep UI state reference; reuse previous STUDY.
- GH04-064 STUDY: ShomyKohai/quest-system, quest/event conditions for participation and sweep UI; reuse previous STUDY, no duplicate integration.
- GH04-065 STUDY: go-co-op/gocron v2, alternative Go scheduler reference; robfig/cron remains selected for adaptation.
- GH04-066 ADAPT: robfig/cron v3, Monday 06:00 Europe/Moscow season boundary wake-up; PostgreSQL stores actual 28-day anchor/season IDs and recovery state.
- GH04-067 BUILD: own server validated seasonal tower remaining HP percentage tie-break and deterministic ranking snapshots; exact rounding/dead-hero semantics deferred.
- GH04-068 BUILD: own globally anchored Monday 06:00 MSK 28-day season IDs, rollover and outage recovery, independent permanent tower; first anchor date deferred.
- GH04-069 BUILD: own server sweep eligibility on repeatable PvE stages after first victory, mode-specific attempts/energy and equal eligible reward chances.
- GH04-070 BUILD: own world-boss contribution/active participation event ledger, anti-AFK checks and support/healing participation; exact thresholds deferred.
- Research: docs/research/GDD-04_ROUND-8_GITHUB_CANDIDATES.md. Approval does not authorize implementation, integration, dependency installation, tests, server/game changes or APK builds. Next: GDD-04 round 9 design choices.

## GDD-04 - ROUND 9 APPROVED (2026-11-22)
- CHAPTER-GATE-001 B: chapter access uses a configurable per-chapter account-level requirement table, with gradually increasing requirements; previous chapter completion remains mandatory. Exact level thresholds and live-balance/versioning policy deferred.
- DUNGEON-PRICE-001 B: three additional entries per resource dungeon type per day use a configurable escalating three-step price ladder (first cheapest, third most expensive); default ladder is shared across dungeon types. Currency and amounts deferred; three free entries per type unaffected.
- BOSS-SUPPORT-001 C: world boss contribution accounts for damage, effective healing, beneficial buffs and prevented damage, with anti-exploit protections. Support/tank participation must not be unfairly excluded; exact coefficients, attribution windows and caps deferred.
- SEASON-CLAIM-001 B: at season close server automatically grants earned tower seasonal rewards and notifies players, including offline players. Grants must be idempotent and auditable; delivery UI and retention policy deferred.
- Next: GitHub research per mechanic and separate technical candidate approval. No implementation, integration, installs, tests, server/game changes or APK builds authorized.

## GDD-04 - ROUND 9 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner explicitly approved the following planning dispositions, based on docs/research/GDD-04_ROUND-9_GITHUB_CANDIDATES.md:
- GH04-071 STUDY: Rubonnek/quest-manager, hierarchical quest conditions for chapter unlock UI; reuse prior STUDY, no client-side authority.
- GH04-072 STUDY: ShomyKohai/quest-system, Godot 4.4+ modular quest events and chapter unlock feedback; no competing quest framework integration.
- GH04-073 STUDY: PieKing1215/godot-loot-tables, Godot 4 WIP resource/reward display reference for dungeons; pricing and debits remain server-side.
- GH04-074 STUDY: CodingQuests/godot-multiplayer-starter, authoritative action-event patterns for boss contribution; ENet example is not a drop-in replacement for Go server.
- GH04-075 STUDY: hatchet-dev/pgoutbox, PostgreSQL transactional outbox reference for offline seasonal notifications; not the reward ledger.
- GH04-076 ADAPT: reuse robfig/cron v3 for 06:00 Europe/Moscow seasonal settlement wake-up; PostgreSQL stores anchored 28-day season and handles recovery.
- GH04-077 BUILD: own versioned data-driven per-chapter account level and previous-chapter gates, validated by server and configurable in admin panel; exact thresholds deferred.
- GH04-078 BUILD: own three-step escalating extra dungeon entry price ladder per type/day, transactional resource debit, idempotency and 06:00 MSK reset; amounts/currency deferred.
- GH04-079 BUILD: own world-boss contribution scoring for damage, effective healing, buffs and prevented damage, with deduplication and anti-abuse; coefficients deferred.
- GH04-080 BUILD: own automatic seasonal tower reward settlement, offline-safe inventory/mailbox credit, notifications, unique claim keys and audit/retry.
- Approval records technical design only; no implementation, dependencies, integration, tests, server/game changes or APK builds authorized. Next: GDD-04 round 10 design.

## GDD-04 - ROUND 10 APPROVED (2026-11-22)
- XP-DECAY-001 B: first three eligible repeat completions grant the full repeat-clear account XP amount; subsequent repeated farming progressively diminishes account XP to a nonzero minimum. First-time clears and quests retain full account XP per XP-CAP-001 C. Exact decay function, minimum and per-source/reset scope deferred; no universal hard XP cap.
- DUNGEON-CURRENCY-001 B: extra resource dungeon entries are purchased using ordinary earnable in-game currency, not mandatory premium diamonds; three free entries per type/day remain and three paid entries per type/day use escalating price ladder. Exact currency name, amounts and sinks deferred.
- BOSS-REWARD-TIER-001 C: world boss offers a guaranteed participation reward to eligible active/contributing players plus separate contribution/ranking bonuses. Support/healing contribution counts; thresholds and tier distribution deferred.
- TOWER-REWARD-001 B: seasonal tower rewards include milestones for reached floors plus separate leaderboard placement rewards; automatically settled at season end for eligible rewards per SEASON-CLAIM-001 B. Permanent tower one-time rewards remain separate. Exact floor milestones, tier tables and duplicate rules deferred.
- Next: GitHub research per mechanic and separate technical candidate approval. No implementation, dependencies, integration, tests, server/game changes or APK builds authorized.

## GDD-04 - ROUND 10 TECHNICAL CHOICES APPROVED (2026-11-22)
Owner approved the following technical planning dispositions from docs/research/GDD-04_ROUND-10_GITHUB_CANDIDATES.md:
- GH04-081 STUDY: Rubonnek/quest-manager, quest progress/repeat state for account XP decay UI; server owns XP awards.
- GH04-082 STUDY: PieKing1215/godot-loot-tables, Godot 4 WIP resource/reward preview reference; wallet and reward RNG remain server-side.
- GH04-083 STUDY: ShomyKohai/quest-system, Godot 4.4+ progress/conditions for boss participation and tower floor milestones; no duplicate quest framework installation.
- GH04-084 STUDY: CodingQuests/godot-multiplayer-starter, server-authoritative event patterns for boss eligibility/rank; ENet starter not a drop-in Go backend replacement.
- GH04-085 STUDY: hatchet-dev/pgoutbox, pgx transactional outbox reference for XP/wallet/boss/tower notifications; own ledgers and idempotent consumer remain required.
- GH04-086 ADAPT: reuse robfig/cron v3 for 06:00 Europe/Moscow daily repeat-counter and 28-day season settlement wake-ups; server persistence/recovery and idempotency custom.
- GH04-087 BUILD: own per-source account XP repeat ledger, first three full repeat XP then diminishing nonzero floor, exemptions and idempotent first clears/quests; exact curve and reset scope deferred.
- GH04-088 BUILD: own earnable-currency wallet and atomic transaction ledger for three paid extra dungeon entries per type/day at escalating prices; no mandatory premium currency.
- GH04-089 BUILD: own world boss guaranteed eligible participation reward plus contribution/ranking bonus tiers, support scoring, anti-abuse, idempotent grants; thresholds deferred.
- GH04-090 BUILD: own seasonal tower floor milestone and ranking reward resolver, automatic offline-safe season-end settlement, deduplicated payouts, audit and notifications; milestone table deferred.
- This approval is documentation/planning only; no code, dependencies, integration, tests, server changes or APK builds authorized. Next: GDD-04 round 11 design.

## GDD-04 - ROUND 11 APPROVED (2026-11-22)
- XP-DECAY-RATE-001 B: after the first three full-XP repeat completions, repeat account XP follows a smooth sequence of 100%, 80%, 65%, 50%, then a minimum of 30% of the eligible repeat-clear base XP. Exact indexing beyond the displayed sequence, scope of repeat counter and reset semantics remain to be specified; first clears/quests retain full XP, no hard zero-XP cap.
- DUNGEON-PRICE-SCALE-001 B: three paid extra entries per resource dungeon type per day cost 1x, 2x, 3x a configurable base price in ordinary earnable currency. Three free entries per type/day remain. Base price and currency name deferred.
- BOSS-RANK-REWARD-001 C: world boss bonus rewards are allocated by percentile groups top 1%, 5%, 20%, 50%, in addition to the guaranteed eligible participation reward. Exact tie handling, bracket boundary rounding and bonus values deferred; support/healing contributions count.
- TOWER-MILESTONE-001 B: seasonal tower floor milestone rewards every five floors, with enhanced rewards every 25 floors; separate leaderboard rewards and automatic season-end settlement remain. Exact floor cap, amounts and claim/deduplication policy deferred.
- Next: GitHub research for each mechanic and separate technical candidate approval. No implementation, integration, dependencies, tests, server/game changes or APK builds authorized.
