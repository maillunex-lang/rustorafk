# GDD-02 Final Gap Audit - 2026-11-22

## Scope and evidence
Read-only audit of approved decisions in `docs/GDD_DECISIONS.md`, repository `poc/godot/gdd02_combat.gd`, `gdd02_arena.gd`, `gdd02_bt_target.gd`, VPS isolated project at `/srv/rustorafk-gdd02/clean`, and tests `test_battle.gd`, `test_limbo_battle.gd`. Android screenshots and owner feedback: stable visuals, 121 FPS instantaneous, 120.0 average, 98 minimum, Godot tracked RAM 38.1 MB, peak 63.6 MB, VRAM 90.8 MB. These numbers apply only to that device and run.

## Acceptance matrix
| Approved item | Current evidence | Status |
| --- | --- | --- |
| COMBAT-001 B auto 5v5, manual ultimate | `step`, `_tick_team`, `manual_ultimate`; owner device screenshots | Implemented PoC |
| ROLE-001 C six roles | `ROLES` has six names but five slots per team; only tank/assassin have distinctive basic attack values; no role-specific targeting or skills | Partial |
| SKILL-001 B 3 ordinary skills + 1 ultimate | `cooldowns` has four entries, but no three ordinary skill activations/effects; one ultimate implementation | Missing core mechanics |
| ULT-001 A arena-local VFX | `Charged_Slash` and transient impact flash | Implemented PoC |
| PACE-001 B 30–60 sec | headless battle 46.3 s, Android snapshot still ongoing at 41.6 s | Verified only for sampled configuration |
| FORM-001 B free 5-slot pre-battle arrangement | `move_formation` swaps two indices; UI has only SWAP 1/5 | Partial |
| AI-TECH-001 LimboAI | 10 BTPlayer nodes and custom `BTAction` target first living enemy; Android ARM64 GDExtension in APK; headless 10/10 test | Integrated baseline; tactics incomplete |
| MOVE-TECH-001 NavigationAgent3D | 10 NavigationAgent3D nodes exist; actual position uses `move_toward`, no navigation path | Not implemented as approved |
| SKILL-TECH-001 custom skills | Data-driven 3+1 system not built; only ultimate | Partial |
| CAM-TECH-001 Phantom Camera | addon/host/PhantomCamera3D instantiated; owner confirms comfortable camera | Accepted PoC; advanced tracking unverified |
| ANIM-TECH-001 humanoid retargeting/AnimationTree | Meshy animation clips driven by AnimationPlayer; same model reused 10 times; no verified AnimationTree/retarget workflow | Partial |
| FORM-TECH-001 formation/combat rules | Basic combat and swap implemented; role-specific rules absent | Partial |

## Specific defects / quality gates
1. `test_battle.gd` asserts enemy HP total <600 after queuing an ultimate. The initial enemy roster has five 115-HP units = 575 HP, so this assertion can pass even if ultimate does zero damage. Replace with before/after HP assertion after advancing simulated time beyond hit delay.
2. `manual_ultimate` can be triggered at elapsed=0 and only for player slot 0 in arena UI; energy starts full. No per-hero ultimate selection UX.
3. `_play_action` uses original animation length rather than Animation Lab's approved target timing; may cause visual queues and delayed impacts. Owner accepted appearance, so preserve current visuals unless measured problem.
4. `_spawn_impact` on ultimate trigger creates a flash before delayed damage, plus another on impact. Clarify intended timing.
5. `BTAction` selects the first living enemy, not meaningful role-aware tactics. Client-side LimboAI must never authorize server damage.
6. Godot tracked RAM is not full Android process RSS; minimum FPS improved between separate runs but not a controlled before/after comparison.
7. Isolated GDD-02 scene lacks restored GDD-01 Dialogue Manager and inventory; integrated project smoke test outstanding.
8. Godot source scene depends on VPS-only `assets/kaeron_animated.glb` and native addon binaries. GitHub text scripts alone do not reproduce APK. Track asset licensing, binary provenance, hashes and reproducible build steps.
9. Tests cover one deterministic outcome and BT node presence/target metadata, not multiple matchups, role abilities, cooldown interactions, navigation or Android long-run stability.

## Recommended completion order (within approved GDD-02 scope)
1. Correct combat test to assert delayed ultimate damage and add role/cooldown/edge-case tests.
2. Implement three ordinary skills with cooldowns and deterministic hit events, then six distinct role behaviors.
3. Implement full five-slot pre-battle formation UI and consistent hero-slot mapping.
4. Wire NavigationAgent3D movement and validate collision/avoidance costs on Android.
5. Validate AnimationTree and Meshy retargeting on at least two different rigs; preserve approved animation appearance.
6. Verify LimboAI targeting and skill-selection policies under tests; keep authoritative outcomes on server in production.
7. Restore GDD-01 integrations in a separate full-project integration branch/test scene; validate dependencies.
8. Repeat Android profiling and 5v5 manual smoke test; seek explicit owner GDD-02 acceptance before GDD-03.

**Audit outcome:** GDD-02 PoC functional and performant on tested Android device, but not feature-complete. Do not mark GDD-02 accepted.
