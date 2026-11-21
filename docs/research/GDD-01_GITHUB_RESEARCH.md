# GDD-01 GitHub Research - proposals only

Date: 2026-11-22. Status: awaiting owner technology approval. No dependencies installed or copied.

## Candidate shortlist
1. ADOPT (conditional): https://github.com/nathanhoad/godot_dialogue_manager
   - MIT; branching dialogue, localization. Current v4 targets Godot 4.6+.
   - Check exact release/tag and transitive assets, verify Godot target, custom portrait UI and Android.
2. ADAPT (conditional): https://github.com/expressobits/inventory-system
   - MIT; modular item/inventory logic separate from UI; multiplayer-oriented examples.
   - Adapt to server-authoritative item ownership and equipment; never trust client inventory changes.
3. REFERENCE: https://github.com/peter-kish/gloot
   - MIT; alternative universal inventory plugin for Godot 4.4+; evaluate versus expressobits, do not install both by default.
4. BUILD: 5v5 moving combat and ability scheduling, character roster/gacha, authoritative arena, idle rewards, account economy, server security.
   - Core game differentiators and anti-cheat need project-specific implementation.
5. ADAPT/BUILD (research pending): Meshy humanoid GLB import, skeletal retargeting, animation state machine, Android LOD and VFX. Do not select an unverified repository.

## Licensing and safety gates
- MIT code requires preservation of license/copyright notices; code license does not automatically cover third-party art.
- Verify LICENSE at pinned commit/tag and dependency manifests before adoption.
- Test import, animation retargeting, memory/frametime on target Android hardware.
- External tools and licenses must be separately approved by owner.
- Avoid copying art, character designs, logos or UI from commercial reference screenshots.

## Approval request
Owner must approve ADOPT Dialogue Manager, ADAPT expressobits inventory, GLoot as reference, and BUILD of authoritative game-specific systems (or request alternatives). Only then may PoC/integration begin.
