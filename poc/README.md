# GDD-01 technical PoC

Portrait Godot project for the approved Dialogue Manager, Expresso Inventory and custom 5v5 simulation. The phone UI runs the branching dialogue and inventory checks on launch and has a touch button to step the simulation. An optional locally supplied Meshy walking GLB appears above the controls. The model stays outside Git.

## Run with Godot 4.7.2

```bash
bash poc/install-addons.sh
godot --headless --path poc/godot --import
godot --headless --path poc/godot --script res://tests/test_combat.gd
godot --headless --path poc/godot -- --poc-smoke
```

To display a Meshy preview, copy a rigged, animated humanoid GLB to `poc/godot/local_assets/meshy_walk.glb` before importing. To test clip transfer between two compatible Meshy rigs:

```bash
godot --headless --path poc/godot --script res://tests/test_meshy.gd -- /path/animated-source.glb /path/rigged-target.glb
```

## Android ARM64 debug

Install the matching Godot Android export templates. Configure the Android SDK and JDK paths in Godot's Editor Settings. Export to an absolute path.

```bash
godot --headless --path poc/godot --export-debug "Android PoC" /tmp/rustorafk-gdd01-arm64-debug.apk
adb install -r /tmp/rustorafk-gdd01-arm64-debug.apk
```

On a device, confirm that the app opens in portrait, displays "Dialogue Manager и Expresso: OK", plays the sample walk if bundled, and increments the turn with the touch button. Check logcat for the PoC PASS messages or errors. Record device model, Android version, and performance separately. The APK built on Lunex includes the optional sample.

See [verification evidence](../docs/research/GDD-01_GITHUB_RESEARCH.md) for results and open items.
