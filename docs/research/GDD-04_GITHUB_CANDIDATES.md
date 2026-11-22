# GDD-04 GitHub research: candidates for separate approval (2026-11-22)

Scope: approved GDD-04 round 1: linear chapter campaign; 20–30 fights + scenes/chapter; story/daily/weekly/event/hero quests; tower, resource/boss dungeons, world bosses and co-op. Research only, NO integration authorized.

## Candidates
- GH04-001 **ADAPT** [TheWalruzz/godot-questify](https://github.com/TheWalruzz/godot-questify): graph-based quest editor/runtime for Godot 4, signals for quest and objective completion. MIT license verified from LICENSE. Adapt for quest templates and UI only; authoritative progress/reward checks must be server-side. Need compatibility/performance smoke test with project's Godot 4.7.2 and Android.
- GH04-002 **STUDY** [Chevifier/QuestManager](https://github.com/Chevifier/QuestManager): alternative quest manager/editor, README specifies Godot 4.2+, says MIT. LICENSE path not found in preliminary inspection; verify actual license text and suitability before considering integration. Do not integrate alongside Questify without deliberate choice.
- GH04-003 **ADOPT already approved GDD-01; reuse if verified** [nathanhoad/godot_dialogue_manager](https://github.com/nathanhoad/godot_dialogue_manager): dialogue editor/runtime for Godot 4.6+, MIT LICENSE verified. Appropriate for story scenes between chapter fights. Prior TECH-001 ADOPT approval is conditional; verify version, Android and project integration later.
- GH04-004 **STUDY** [gdquest-demos/godot-4-pcg-basic-dungeon](https://github.com/gdquest-demos/godot-4-pcg-basic-dungeon): procedural dungeon generation reference. LICENSE notes MIT source code but separate art-asset license; review asset restrictions before any reuse. Could be unnecessary for menu-based resource dungeons; prefer custom staged encounters unless exploration is explicitly selected.
- GH04-005 **STUDY** [CodingQuests/godot-multiplayer-starter](https://github.com/CodingQuests/godot-multiplayer-starter): Godot 4 server-authoritative co-op, lobby, ready-up, ENet; MIT LICENSE verified. Networking model is a reference, not automatically compatible with the project's existing Go authoritative backend. Avoid adopting a competing server architecture without owner approval.
- GH04-006 **STUDY** [tngklp/godot-multiplayer-lobby-system](https://github.com/tngklp/godot-multiplayer-lobby-system): Godot 4.6 ENet authoritative lobby; README and LICENSE indicate MIT. Alternative lobby reference; requires architecture and Android evaluation.

## Proposed custom systems
- GH04-007 **BUILD** campaign chapter/stage data, unlock rules and progress persistence in existing authoritative server, with 20–30 stages/chapter configurable rather than hardcoded.
- GH04-008 **BUILD** repeatable quest scheduling, daily/weekly/event reset rules, reward idempotency, anti-cheat, tower/dungeon/boss state and co-op reward validation server-side.

## Decision gate
Owner must separately approve candidate dispositions. No dependency install, code changes, APK build or integration during GDD. Repository inspection is preliminary, not proof of Godot 4.7.2/Android compatibility. The chapter structure and PvE modes are approved; technical candidates are proposals only.
