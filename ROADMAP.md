# ROADMAP - RuStore AFK

Status: GDD-01 ACCEPTED by owner on 2026-11-22. GDD-02 design OPEN, no GDD-02 choices or technologies approved.

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
- [ ] GDD-02-T: owner separately approves ADOPT/ADAPT/BUILD technology choices
- [ ] GDD-02-P: only approved integrations and Godot 4.7.2/Android PoC
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
