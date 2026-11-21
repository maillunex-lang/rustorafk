# GDD-02 GitHub Research - proposals only

Date: 2026-11-22. Status: GDD-02 game design APPROVED; technology proposals PENDING owner approval. No new dependencies installed.

## Approved gameplay decisions
- COMBAT-001 B: automatic real-time combat, manual ultimate activation.
- ROLE-001 C: six roles: tank, warrior, assassin, marksman, mage, support/healer.
- SKILL-001 B: 3 regular abilities plus 1 ultimate per hero.
- ULT-001 A: ultimate VFX directly on battle arena, no separate cutscene.
- PACE-001 B: 30-60 second target combat duration.
- FORM-001 B: five freely selectable pre-battle formation positions.
- Existing constraints: 5v5 moving 3D humanoid characters; portrait 9:16; Meshy AI rigs; server authoritative.

## Candidate components (approval required)
- AI-TECH-001 ADAPT: https://github.com/limbonaut/limboai
  MIT source. 1.8.x supports Godot 4.7 module and GDExtension Godot 4.6+. Android ARM64 binaries, GDExtension ABI and measured 10-agent CPU load NOT verified. Use only for client behavior presentation, not trusted server outcomes.
  REFERENCE alternative https://github.com/bitbrain/beehave (MIT).
- MOVE-TECH-001 ADOPT: built-in Godot NavigationAgent3D / NavigationServer3D (Godot MIT). Avoidance is costly; enable only where necessary, test 10 agents on low-end Android.
- SKILL-TECH-001 BUILD: custom data-driven 3 ordinary skills + 1 ultimate; cooldowns, targets, effect stacking, animation events, interrupts, deterministic server calculation and visual cue replication.
  REFERENCE https://github.com/LiGameAcademy/godot_ability_system (MIT, requires Godot 4.5+, upstream warns API may change). Do not integrate by default.
- CAM-TECH-001 ADAPT: https://github.com/ramokz/phantom-camera (MIT, asset store minimum Godot 4.4; version v0.11.0.3 marked unstable). Restrict to smooth battle camera, target tracking and arena-local ultimate emphasis. Test portrait framing on Android.
- ANIM-TECH-001 ADOPT: built-in Godot SkeletonProfileHumanoid, BoneMap, AnimationTree/AnimationPlayer (engine MIT). Retarget Meshy humanoid rigs; profile names and bone rests must match; validate attacks, movement and interruptions.
- FORM-TECH-001 BUILD: custom 5-position formation, 6 roles, automatic target selection, 30-60s pacing, manual ultimate button, and authoritative combat timeline.

## Compatibility and licensing
MIT generally permits commercial distribution with copyright and license notices preserved. Third-party demo assets may carry separate terms; do not copy them. The Godot engine is MIT licensed. LimboAI demo art has CC BY 4.0 attribution obligations.
Godot 4.7.2: documentation-level compatibility only for most candidates. None of the new plugins were installed or runtime-tested on the project.
Android: runtime compatibility and memory/FPS NOT confirmed for new plugins. Exact pinned tags, commit SHAs, native dependencies, arm64 binaries, APK export and device smoke tests are implementation gates AFTER approval.
No production/server behavior may depend on client-side AI or trust client-reported damage.
Avoid vendor assets and character designs from existing commercial games.

## Owner technology approval required
Approve/reject individually AI-TECH-001, MOVE-TECH-001, SKILL-TECH-001, CAM-TECH-001, ANIM-TECH-001, FORM-TECH-001.
No GDD-02 implementation before explicit approval.
