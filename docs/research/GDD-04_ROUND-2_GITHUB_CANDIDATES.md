# GDD-04 Round 2: GitHub research and technical proposals (2026-11-22)

Design approved: UNLOCK-001 B (previous chapter + minimum level), REPLAY-001 C (replay and quick battle after win), SCENE-001 A (text dialogues + portraits), REWARD-001 C (resources, equipment, hero fragments, rare rewards). This is research, NOT integration approval.

## Candidates requiring separate owner disposition
- GH04-009 **ADAPT** [nathanhoad/godot_dialogue_manager](https://github.com/nathanhoad/godot_dialogue_manager): use existing approved GH04-003 ADOPT for runtime dialogue and customize Godot UI for text + portraits. README supports Godot 4.6+, MIT LICENSE checked. This is an extension of already selected dependency, not a second dialogue system. Test portraits, localization and Android UI in development.
- GH04-010 **STUDY** [PieKing1215/godot-loot-tables](https://github.com/PieKing1215/godot-loot-tables): weighted PoolEntry/Pool/LootTable Resources for Godot 4, MIT LICENSE checked. README calls it WIP and graph editor unfinished. Study editor-facing reward authoring, never use client rolls for authoritative online rewards.
- GH04-011 **STUDY** [CodingQuests/godot-save-system](https://github.com/CodingQuests/godot-save-system): versioned atomic JSON saves, MIT LICENSE checked, README states Godot 4.7+ and Windows 4.7.2 tested. Useful for local settings/cache pattern only; account level, campaign progress and rewards remain on authoritative Go server.
- GH04-012 **STUDY** [TommyKooij/SaveSystem](https://github.com/TommyKooij/SaveSystem): alternate Godot 4.5+ save/load example, MIT LICENSE checked. Do not adopt a second save system by default.
- GH04-013 **BUILD** server-authoritative campaign chapter unlock checks (previous chapter completed AND minimum level) with versioned configurable gate. Which level type (account/hero) is not decided and requires separate GDD clarification.
- GH04-014 **BUILD** server-authoritative stage replay and sweep eligibility after first win; atomic/idempotent resource spending and reward grants; configurable limits and abuse protection.
- GH04-015 **BUILD** server-authoritative PvE reward tables for resources, equipment, fragments and rare drops; auditable RNG, reward idempotency, balancing and anti-cheat. Godot editor can preview data but cannot grant rewards.
- GH04-016 **BUILD** portrait/text dialogue UI layer on top of approved Dialogue Manager with chapter trigger points, portrait asset references, mobile scaling and localization; no 3D cutscenes.

## Boundaries
No source copied, dependencies installed, integration, code, builds or tests. Compatibility with target Android devices and Godot 4.7.2 remains unverified for the proposed add-ons. Technical dispositions require owner approval before inclusion in canon; implementation later needs its own authorization. Existing GH04-007 and GH04-008 BUILD decisions remain in force; 013–016 refine their scope.
