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
