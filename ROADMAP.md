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
- [ ] GDD-02-P: isolated PoC PARTIAL (custom 5v5 logic tested; 10 humanoid proxy scene headless startup tested; clean ARM64 APK exported and signature verified; previous battle previews owner-accepted as smooth; Phantom Camera headless scene integration done, new APK device test pending; LimboAI pending)
  - [x] Built-in NavigationAgent3D present on all 10 proxy fighters; actual navigation movement pending
  - [x] Manual ultimate and formation swap proof of concept
  - [ ] Restore GDD-01 Dialogue Manager/Inventory in full integrated project
  - [ ] LimboAI v1.8.1 GDExtension binaries and behavior trees, Android test
  - [ ] Phantom Camera v0.11.0.3: addon and runtime camera host integrated, headless scene starts without errors, signed ARM64 APK exported; physical Android verification pending
  - [ ] Ten Meshy humanoids with attacks, animation retargeting, FPS/RAM profiling (one existing animated Meshy GLB instantiated for 10 fighters in isolated VPS Android APK; running/stance animations and HP bars wired; device FPS/RAM still pending; Meshy asset remains VPS-only, not committed to GitHub)
  - [x] Godot 4.7.2 headless automatic battle test passed (5v5, HP, auto attacks, manual ultimate, win at 22.1s); 28 MB signed ARM64 battle preview APK built and owner confirmed smooth Android combat; 43 MB signed Meshy preview APK exported, device testing pending
  - [x] Owner confirmed Meshy synced animations and 5v5 Android battle visuals are good\n  - [x] Added transient impact VFX, headless scene test and 52 MB signed Android ARM64 APK\n  - [ ] FPS/RAM profiling, LimboAI integration, Phantom Camera physical-device verification, owner final GDD-02 acceptance
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
