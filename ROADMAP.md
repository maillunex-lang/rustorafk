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
  - [x] 5v5 auto combat, manual ultimate, synchronized Meshy animations, impact VFX, death/victory animations
  - [x] LimboAI v1.8.1 compiled for Linux and Android ARM64; 10 BTPlayer target selectors verified headless and APK tested on Android
  - [x] Phantom Camera integrated; Android owner confirms comfortable view and smooth combat
  - [x] Android snapshot: FPS 121 / min 98 / avg 120.0, Godot RAM 38.1 MB / peak 63.6 MB, VRAM 90.8 MB (one run/device; not full Android RSS)
  - [ ] Fix ultimate-damage test: current HP assertion can pass without damage; add deterministic combat tests
  - [ ] Implement three ordinary skills + cooldown/effect rules and meaningful six-class behavior
  - [ ] Replace single swap button with full five-slot formation editor
  - [ ] Connect NavigationAgent3D to actual navigation movement
  - [ ] Validate AnimationTree and humanoid retargeting on distinct Meshy rigs
  - [ ] Extend LimboAI tactical behavior beyond first-living target selection
  - [ ] Restore GDD-01 addons and verify integrated project; document VPS-only Meshy asset/native binary reproducibility
  - [ ] Repeat Android QA and obtain explicit owner final GDD-02 acceptance
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
