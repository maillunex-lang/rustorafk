# GDD-01 GitHub Research and technical verification

Owner approval 2026-11-22: TECH-001 ADOPT Dialogue Manager; TECH-002 ADAPT Expresso Inventory System; TECH-003 BUILD own authoritative combat/economy; GLoot REFERENCE only.

## Versions and licensing
- Dialogue Manager 4: Godot 4.6+ per upstream README; MIT. Exact release tag not yet pinned, must resolve before vendor import. Older v3.10 targets Godot 4.4/4.5. https://github.com/nathanhoad/godot_dialogue_manager
- Expresso Inventory System: upstream addon-2.13.0 at short commit 5d9a6f4 (release listing); MIT. Upstream main contains C++ GDExtension, godot-cpp submodule and compiled addon branch. Verify exact full SHA, license text, Android arm64-v8a binaries and Godot ABI before import. https://github.com/expressobits/inventory-system
- GLoot: reference only, not installed. https://github.com/peter-kish/gloot

## Critical integration risks
- GDExtension Android arm64-v8a binary availability not yet verified. Do not ship desktop-only binaries.
- Code MIT license does not imply unrestricted demo artwork rights. Upstream Expresso cites Kenney demo assets; review those separately.
- Server must validate inventory ownership, currencies, drops, combat results; never trust client mutations.
- Dialogue Manager v4 requires Godot >=4.6; engine target should be pinned before import.
- Meshy GLB humanoid rig and animation retargeting need real sample asset and device test.

## Approved PoC boundary
Minimal Godot portrait scene with simulated 5v5 positions and custom combat domain model; dialogue plugin smoke test; inventory plugin compatibility smoke test; Android debug export and FPS/memory profiling. No monetization, no production backend, no GDD-02 implementation.

## Verification status
Documentation/release metadata reviewed. No Android build or runtime test completed yet. Exact Dialogue Manager tag and Expresso full commit remain unverified. Do not label PoC passed.
