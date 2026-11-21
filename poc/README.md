# GDD-01 isolated technical PoC (NOT a game release)

This is a tiny Godot 4 portrait project, with a deterministic 5v5 combat-domain simulation and a headless smoke test. It does not yet render 3D characters, move them, use Meshy assets, import third-party addons or implement the production backend. It is an initial scaffold only, not completion of the approved PoC.

Commands (requires Godot 4.6+ installed):

```bash
godot --headless --path poc/godot --script res://tests/test_combat.gd
godot --path poc/godot
```

Pending gates: pin exact Dialogue Manager release, validate license, import and smoke test; pin Expresso Inventory addon-2.13.0 full commit and verify GDExtension Android arm64 binary and transitive dependencies; integrate humanoid Meshy sample and retarget animations; Android SDK/JDK export template setup, debug APK export, install and device smoke/FPS/memory tests. No test commands have been executed in the connected GitHub environment. GDD-02 blocked until owner accepts evidence.
