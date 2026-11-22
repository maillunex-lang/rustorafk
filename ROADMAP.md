## GDD workflow: accelerated design-first (2026-11-22)

Owner requested concise GDD design without implementation, but explicitly reaffirmed mandatory GitHub research and technical option approval after EACH approved design round (2026-11-22). Workflow: owner selects mechanics -> record approved decisions -> research GitHub candidates/licenses/version fit -> present ADOPT/ADAPT/BUILD/STUDY -> obtain separate owner technical approval -> record decisions -> only then move to next design round. Do not build APKs, integrate plugins, run exhaustive tests or implement unfinished features during GDD unless separately requested. Existing GDD-02 prototype and approved decisions remain intact. Remaining GDD-02 tasks (automatic ordinary-skill use, balance, AnimationTree/retargeting, full integration, production server authority and device QA) are implementation backlog, not a blocker to design-stage progression. GitHub candidates must still be separately approved before any integration. GDD-02 design closure and GDD-03 start require explicit owner approval.

# ROADMAP - RuStore AFK

Status: GDD-01 accepted; GDD-02 design approved, implementation/QA deferred; GDD-03 design CLOSED (16/16 approved); GDD-04 design IN PROGRESS (2026-11-22).

- [x] INIT-001: repository and approval workflow initialized
- [x] GDD-01: setting, art style, orientation, battle concept, roster, no base, story
- [x] GDD-01-R: GitHub research and license classification documented
- [x] GDD-01-T: owner approved TECH-001 ADOPT, TECH-002 ADAPT, TECH-003 BUILD
- [x] GDD-01-P: dependency verification, prototype, Android functional test and owner acceptance (performance deferred)
  - [x] Pin and verify approved dependencies, test the portrait PoC in Godot 4.7.2
  - [x] Import two Meshy GLBs, transfer their walk clips in Godot and export signed Android ARM64 debug APK
  - [x] Owner screenshots confirm Android launch, character rendering, animation and 5v5 turn button; owner reports smooth walk
  - [ ] Deferred: collect FPS/memory, long-run stability, ten simultaneous animated humanoids
  - [x] Owner acceptance (functional PoC)
- [x] GDD-02: combat, roles, skills, battle pacing (owner approved gameplay decisions)
- [x] GDD-02-R: GitHub candidate research and preliminary licensing/compatibility review
- [x] GDD-02-T: owner approved AI adapt, movement adopt, skills build, camera adapt, animation adopt, formation build
- [ ] GDD-02-P: isolated Android PoC functional and owner-tested; final feature acceptance NOT yet granted. Detailed audit: [GDD-02 gap audit](docs/audits/GDD-02_GAP_AUDIT_2026-11-22.md)
  - [x] Owner Android smoke test accepted for six-role tactical APK (2026-11-22): 5v5 battle continues, HUD cooldowns visible; screenshot FPS 121 / avg 113.1, Godot RAM 40.7 MB, VRAM 94.8 MB. Tactical decisions verified separately by headless tests, not screenshot.\n  - [x] Owner approved upgraded mobile combat HUD on Android (2026-11-22): four large skill buttons, vector icons, circular cooldown indicators; screenshot confirms RECOVER +8 HP, FPS 121 / avg 102.3, Godot RAM 39.1 MB, VRAM 91.5 MB. Minor icon vertical alignment polish remains optional.\n  - [x] 5v5 auto combat, manual ultimate, synchronized Meshy animations, impact VFX, death/victory animations
  - [x] LimboAI v1.8.1 compiled for Linux and Android ARM64; 10 BTPlayer target selectors verified headless and APK tested on Android
  - [x] Phantom Camera integrated; Android owner confirms comfortable view and smooth combat
  - [x] Android snapshot: FPS 121 / min 98 / avg 120.0, Godot RAM 38.1 MB / peak 63.6 MB, VRAM 90.8 MB (one run/device; not full Android RSS)
  - [x] Fixed ultimate-damage test: checks delayed 65 damage and impact event; automated battle still passes at 46.9 seconds
  - [ ] Three ordinary skills implemented in combat domain and hero-1 test UI (guard shield, strike damage, recover heal), cooldowns and six-role numeric parameters; six-role baseline behaviors added (tank shield, warrior non-tank preference, assassin low-HP target, marksman backline priority, mage splash, support autoheal); full AI skill policy and balance still pending
  - [x] Five-slot prebattle formation editor: select any two slots to swap, START BATTLE lock; headless UI test passed; owner Android screenshots accepted 2026-11-22
  - [x] NavigationAgent3D now drives fighter movement on a two-polygon arena NavigationMesh; 10 agents and measured headless movement -2.50 -> -1.05; owner Android screenshots accepted 2026-11-22 (around 120 FPS during battle)
  - [ ] Validate AnimationTree and humanoid retargeting on distinct Meshy rigs
  - [x] Extend LimboAI target selection by role: assassin low-HP, marksman backline priority, warrior non-tank; other roles default first living target. Automated 10/10 BT test and role tests passed\n  - [ ] AI-driven active-skill policies, balance tests and role differentiation with unique models
  - [ ] Restore GDD-01 addons and verify integrated project; document VPS-only Meshy asset/native binary reproducibility
  - [x] Exported signed 54 MB Android ARM64 APK with three skill test buttons, LimboAI and performance overlay\n  - [x] Exported signed Android ARM64 54 MB formation/navigation APK (gdd02-formation-navigation-arm64.apk)\n  - [x] Exported signed Android ARM64 54 MB six-role tactics APK (gdd02-six-roles-arm64.apk), device test pending\n  - [ ] Final production GDD-02 implementation/QA acceptance deferred to development phase; owner approved moving to GDD-03 design on 2026-11-22
- [x] GDD-03: heroes, collection, rarity, progression (design closed; implementation deferred)
  - [x] Round 1 owner approved 2026-11-22: HERO-001 D (summons/fragments/events/story), RARITY-001 C (N/R/SR/SSR/UR/Mythic), LEVEL-001 C (level/stars/skills/equipment), DUP-001 D (star upgrades/fragments/exchange)
  - [x] Round 2 owner approved 2026-11-22: FACTION-001 C (four main + two special factions), ROSTER-001 B (most of 24 heroes in main factions; fewer rare heroes in special factions), STAR-001 B (six stars maximum), CLASS-002 A (fixed hero class)\n  - [x] Round 3 owner approved 2026-11-22: EXP-001 B (XP potions + battle XP), SKILL-UP-001 B (gold/materials per skill), FACTION-BONUS-001 C (2/3/5 faction synergy), TEAM-001 A (unrestricted five-hero composition)\n  - [x] Round 4 owner approved 2026-11-22: CAP-001 B (level cap 200), RARITY-UP-001 B (rarity upgrades with starting-rarity ceilings), RESET-001 C (free early reset then in-game currency), COLLECTION-001 C (hero album, achievements, modest bonuses)\n  - [x] Design sign-off: all 16 choices approved across four rounds; no production implementation or QA acceptance implied
  - [ ] Development backlog: summon odds/guarantees, duplicate conversions, XP curve to level 200, skill materials, faction 2/3/5 effects and roster counts, six-star costs, starting-rarity upgrade ceilings, free/paid reset threshold and refunds, collection album/achievements/modest bonuses, UI, server authority, analytics, balance, tests and technology approvals; no implementation during GDD
- [ ] GDD-04: campaign, quests, PvE (design in progress; implementation and technology research deferred)
  - [x] Round 1 owner approved 2026-11-22: STORY-001 A (linear chapters), CAMPAIGN-001 B (20–30 battles + scenes per chapter), QUEST-001 D (story/daily/weekly/event/hero quests), PVE-001 D (tower/dungeons/world bosses/co-op)
  - [x] GitHub research after round 1: [GDD-04 GitHub candidates](docs/research/GDD-04_GITHUB_CANDIDATES.md); GH04-001…008 researched and owner-approved for planning\n  - [x] Technical approval 2026-11-22: GH04-001 ADAPT, GH04-002 STUDY, GH04-003 ADOPT, GH04-004 STUDY, GH04-005 STUDY, GH04-006 STUDY, GH04-007 BUILD, GH04-008 BUILD; no implementation authorized\n  - [x] Round 2 owner approved 2026-11-22: UNLOCK-001 B (previous chapter + minimum level), REPLAY-001 C (replay + quick battle after win), SCENE-001 A (text + portraits), REWARD-001 C (resources/equipment/fragments/rare rewards)
  - [x] GitHub research after round 2: [GDD-04 round-2 candidates](docs/research/GDD-04_ROUND-2_GITHUB_CANDIDATES.md), GH04-009…016 proposed for separate technical approval
  - [x] Technical approval 2026-11-22: GH04-009 ADAPT, GH04-010 STUDY, GH04-011 STUDY, GH04-012 STUDY, GH04-013 BUILD, GH04-014 BUILD, GH04-015 BUILD, GH04-016 BUILD; implementation deferred
  - [x] Round 3 owner approved 2026-11-22: DAILY-001 B (unified server reset), TOWER-001 C (permanent + seasonal tower), DUNGEON-001 B (gold/XP/equipment/material dungeons), BOSS-001 C (world boss damage ranking + separate co-op fights)
  - [x] GitHub research after round 3: [GDD-04 round-3 candidates](docs/research/GDD-04_ROUND-3_GITHUB_CANDIDATES.md); GH04-017…025 researched and proposed
  - [x] Technical approval 2026-11-22: GH04-017 STUDY, GH04-018 STUDY, GH04-019 STUDY, GH04-020 STUDY, GH04-021 STUDY, GH04-022 BUILD, GH04-023 BUILD, GH04-024 BUILD, GH04-025 BUILD; no integration authorized
  - [ ] Round 4 design: remaining PvE progression/access and quest details (owner choice pending; GitHub research and separate technical approval mandatory afterward)
  - [x] Round 4 owner approved 2026-11-22: QUEST-RESET-001 B (06:00 MSK daily, Monday weekly), TOWER-REWARD-001 C (permanent one-time + seasonal repeatable/ranked rewards), DUNGEON-ENTRY-001 B (free daily + resource-paid entries), BOSS-REWARD-001 C (participation + contribution + rank; separate co-op rewards)
  - [x] GitHub research after round 4: [GDD-04 round-4 candidates](docs/research/GDD-04_ROUND-4_GITHUB_CANDIDATES.md); GH04-026…034 proposed for separate owner technical approval
  - [x] Technical approval 2026-11-22: GH04-026 ADAPT, GH04-027 STUDY, GH04-028 STUDY, GH04-029 STUDY, GH04-030 STUDY, GH04-031 BUILD, GH04-032 BUILD, GH04-033 BUILD, GH04-034 BUILD; no implementation authorized
  - [ ] Round 5 design: specify remaining PvE balancing/access parameters and chapter-level gate (owner choices pending; research required afterward)
  - [x] Round 5 owner approved 2026-11-22: CHAPTER-LEVEL-001 B (account level + previous chapter), DUNGEON-LIMIT-001 B (3 free daily attempts per type), TOWER-SEASON-001 C (28 days), DIFFICULTY-001 C (stats + abilities + stage conditions)
  - [x] GitHub research after round 5: [GDD-04 round-5 candidates](docs/research/GDD-04_ROUND-5_GITHUB_CANDIDATES.md), GH04-035…043 proposed for separate owner technical approval
  - [x] Technical approval 2026-11-22: GH04-035 STUDY, GH04-036 ADAPT, GH04-037 ADAPT, GH04-038 STUDY, GH04-039 STUDY, GH04-040 BUILD, GH04-041 BUILD, GH04-042 BUILD, GH04-043 BUILD; implementation deferred
  - [ ] Round 6 design: remaining campaign/PvE specifications (owner approval pending; research required after choices)
  - [x] Round 6 owner approved 2026-11-22: ACCOUNT-XP-001 C (campaign/quest/PvE XP with farm caps), SWEEP-001 B (after first win, spend mode attempts/energy), DUNGEON-EXTRA-001 C (up to 3 escalating-price extra entries per type/day), TOWER-RANK-001 B (highest floor then battle result)
  - [x] GitHub research after round 6: [GDD-04 round-6 candidates](docs/research/GDD-04_ROUND-6_GITHUB_CANDIDATES.md); GH04-044…052 proposed, license gap noted for leaderboard example
  - [x] Technical approval 2026-11-22: GH04-044 STUDY, GH04-045 STUDY, GH04-046 STUDY, GH04-047 STUDY, GH04-048 STUDY (license unverified, architecture only), GH04-049 BUILD, GH04-050 BUILD, GH04-051 BUILD, GH04-052 BUILD; implementation deferred
  - [ ] Round 7 design: remaining PvE tuning, progression and seasonal rules (owner choices pending; research after approval)
  - [x] Round 7 owner approved 2026-11-22: XP-CAP-001 C (full first-time/quest XP, diminishing repeats), SWEEP-REWARD-001 B (same loot tables and chances as normal), TOWER-TIE-001 B (floor then remaining HP then achievement time), SEASON-RESET-001 B (28-day rollover at 06:00 MSK)
  - [x] GitHub research after round 7: [GDD-04 round-7 candidates](docs/research/GDD-04_ROUND-7_GITHUB_CANDIDATES.md), GH04-053…061 proposed for separate owner technical approval
  - [x] Technical approval 2026-11-22: GH04-053 STUDY, GH04-054 STUDY, GH04-055 STUDY, GH04-056 STUDY (unverified license, architecture only), GH04-057 ADAPT, GH04-058 BUILD, GH04-059 BUILD, GH04-060 BUILD, GH04-061 BUILD; implementation deferred
  - [ ] Round 8 design: remaining PvE rule details (owner choices pending; research required after approval)
  - [x] Round 8 owner approved 2026-11-22: TOWER-HP-001 B (remaining total team HP percentage), SEASON-ANCHOR-001 B (global Monday 06:00 MSK every four weeks), SWEEP-ACCESS-001 B (repeatable PvE only after first victory), BOSS-ELIGIBILITY-001 C (minimum contribution OR meaningful activity)
  - [x] GitHub research after round 8: [GDD-04 round-8 candidates](docs/research/GDD-04_ROUND-8_GITHUB_CANDIDATES.md), GH04-062…070 proposed for separate owner technical approval
  - [x] Technical approval 2026-11-22: GH04-062 STUDY, GH04-063 STUDY, GH04-064 STUDY, GH04-065 STUDY, GH04-066 ADAPT, GH04-067 BUILD, GH04-068 BUILD, GH04-069 BUILD, GH04-070 BUILD; no implementation authorized
  - [x] Round 9 owner approved 2026-11-22: CHAPTER-GATE-001 B (configurable per-chapter account-level gates), DUNGEON-PRICE-001 B (escalating three-purchase ladder), BOSS-SUPPORT-001 C (damage/effective healing/buffs/prevented damage), SEASON-CLAIM-001 B (automatic server reward settlement and notification)
  - [x] GitHub research after round 9: [GDD-04 round-9 candidates](docs/research/GDD-04_ROUND-9_GITHUB_CANDIDATES.md), GH04-071…080 proposed for separate technical approval
  - [x] Technical approval 2026-11-22: GH04-071 STUDY, GH04-072 STUDY, GH04-073 STUDY, GH04-074 STUDY, GH04-075 STUDY, GH04-076 ADAPT, GH04-077 BUILD, GH04-078 BUILD, GH04-079 BUILD, GH04-080 BUILD; implementation not authorized
  - [x] Round 10 approved 2026-11-22: XP-DECAY-001 B (three full-repeat XP awards then progressive nonzero floor), DUNGEON-CURRENCY-001 B (ordinary earnable currency), BOSS-REWARD-TIER-001 C (participation base + contribution/rank), TOWER-REWARD-001 B (seasonal floor milestones + leaderboard rewards)
  - [x] GitHub research after round 10: [GDD-04 round-10 candidates](docs/research/GDD-04_ROUND-10_GITHUB_CANDIDATES.md), GH04-081…090 proposed for separate technical approval
  - [x] Technical approval 2026-11-22: GH04-081 STUDY, GH04-082 STUDY, GH04-083 STUDY, GH04-084 STUDY, GH04-085 STUDY, GH04-086 ADAPT, GH04-087 BUILD, GH04-088 BUILD, GH04-089 BUILD, GH04-090 BUILD; documentation only, implementation not authorized
  - [ ] Round 11 design: remaining GDD-04 progression/PvE parameters (owner choices pending; GitHub research after approval)
  - [ ] Development backlog: chapter scripts, quest content and reward tables, minimum-level gate type/threshold, replay/sweep limits and idempotency, portrait UI, reset time/time zone, permanent and seasonal tower state, challenge tower, resource/boss dungeons, world bosses, co-op/matchmaking, server authority, events, QA; no implementation during GDD
- [ ] GDD-05: idle rewards, equipment and economy (BASE-001 A: no base building)
- [ ] GDD-06: online, PvP, leaderboards, guild roadmap
- [ ] GDD-07: monetization, fairness, RuStore compliance
- [ ] GDD-08: Meshy humanoid asset pipeline, retargeting, animation, optimization
- [ ] GDD-09: portrait UI/UX, onboarding, accessibility
- [ ] GDD-10: backend, security, analytics, live operations
- [ ] GDD-11: production milestones, QA, beta, launch

For each remaining GDD round: owner chooses concise design decisions -> record in GitHub -> GitHub research/license and compatibility pre-review -> propose ADOPT/ADAPT/BUILD/STUDY -> separate owner approval -> record technical decisions -> next design round. Actual integration and tests are deferred to development; no third-party integration without explicit approval.

## Mandatory GDD research and approval gate (owner reaffirmed 2026-11-22)
For EVERY approved GDD design round, without needing a repeated reminder: (1) record approved mechanics in docs/GDD_DECISIONS.md and ROADMAP.md; (2) research GitHub for EACH approved mechanic, inspecting candidate repositories, documentation, licensing, Godot/Android compatibility and risks; (3) prepare concrete GH candidate IDs and recommended ADOPT/ADAPT/STUDY/BUILD dispositions; (4) request SEPARATE owner technical approval; (5) record approved technical choices in both files; (6) only then proceed to the next GDD round. No integration, dependency installation, game/server changes, APK builds or implementation during GDD unless the owner explicitly authorizes them. If research is unavailable, report the gap and do not silently skip it.
