## GDD workflow: accelerated design-first (2026-11-22)

Owner requested that remaining GDD work be concise: present 3–4 design options per system, record approved choices and deferred implementation requirements, then move to next GDD section. Do not build APKs, integrate plugins, run exhaustive tests or implement unfinished features during GDD unless separately requested. Existing GDD-02 prototype and approved decisions remain intact. Remaining GDD-02 tasks (automatic ordinary-skill use, balance, AnimationTree/retargeting, full integration, production server authority and device QA) are implementation backlog, not a blocker to design-stage progression. GitHub candidates must still be separately approved before any integration. GDD-02 design closure and GDD-03 start require explicit owner approval.

# ROADMAP - RuStore AFK

Status: GDD-01 accepted; GDD-02 game design and technologies approved; isolated PoC underway; GDD-03 blocked until owner acceptance.

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
  - [x] Exported signed 54 MB Android ARM64 APK with three skill test buttons, LimboAI and performance overlay\n  - [x] Exported signed Android ARM64 54 MB formation/navigation APK (gdd02-formation-navigation-arm64.apk)\n  - [x] Exported signed Android ARM64 54 MB six-role tactics APK (gdd02-six-roles-arm64.apk), device test pending\n  - [ ] Repeat Android QA and obtain explicit owner final GDD-02 acceptance
- [ ] GDD-03: heroes, collection, rarity, progression + research/approval
- [ ] GDD-04: campaign, quests, PvE + research/approval
- [ ] GDD-05: idle rewards, equipment and economy (BASE-001 A: no base building)
- [ ] GDD-06: online, PvP, leaderboards, guild roadmap
- [ ] GDD-07: monetization, fairness, RuStore compliance
- [ ] GDD-08: Meshy humanoid asset pipeline, retargeting, animation, optimization
- [ ] GDD-09: portrait UI/UX, onboarding, accessibility
- [ ] GDD-10: backend, security, analytics, live operations
- [ ] GDD-11: production milestones, QA, beta, launch

For every subsequent GDD: owner chooses decisions -> GitHub research -> license and dependency review -> owner approves technology -> staged integration and tests -> update roadmap. No third-party integration without explicit approval.
