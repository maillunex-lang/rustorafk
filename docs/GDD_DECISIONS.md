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
- GDD-02 technology choices APPROVED 2026-11-22: AI-TECH-001 ADAPT LimboAI; MOVE-TECH-001 ADOPT NavigationAgent3D; SKILL-TECH-001 BUILD custom skills; CAM-TECH-001 ADAPT Phantom Camera; ANIM-TECH-001 ADOPT Godot humanoid retargeting/AnimationTree; FORM-TECH-001 BUILD formations and combat rules. Scope isolated PoC only. No GDD-03 before owner acceptance.
