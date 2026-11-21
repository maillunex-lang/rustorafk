# GDD-01 GitHub Research and PoC verification

Owner approved TECH-001 ADOPT, TECH-002 ADAPT and TECH-003 BUILD. GLoot remains an alternative and was not installed. Work is scoped to the GDD-01 PoC. GDD-02 waits for owner acceptance.

## Locked dependencies

| Component | Tag and commit | License and scope |
| --- | --- | --- |
| [Dialogue Manager](https://github.com/nathanhoad/godot_dialogue_manager/tree/v4.1.0) | v4.1.0 / `a719088aea342572f29b5559fd8726896c9519b2` | MIT. Godot 4.6+ upstream. PoC uses the GDScript runtime with a Russian fixture and two branches. Unused C# demo/editor scenes are excluded from APK export. |
| [Expresso Inventory](https://github.com/expressobits/inventory-system/tree/addon-2.13.0) | addon-2.13.0 / `5d9a6f430cdee01f39c4c37d0c78a24c181411c0` | MIT. Prebuilt C++ GDExtension with godot-cpp bindings and no separate godot-cpp install. The shipped manifest maps Android debug ARM64 to the editor-named library and release ARM64 to the release library. The PoC uses one local item and verifies add/remove. |
| [GLoot](https://github.com/peter-kish/gloot) | Alternative | No project dependency. |

MIT notices from both pinned add-ons are present in the debug APK. Upstream inventory demo assets are excluded from installation. Expresso's ARM64 ELF depends on Android libc, libdl, libm and libc++_shared. The built APK includes the extension and libc++_shared. No production backend is part of this PoC.

## Evidence from Lunex, 2026-11-22

- Godot `4.7.2.stable.official.ed1daf0bf`, JDK 17, Android SDK 36 and matching Godot export templates.
- Exit 0 from the baseline 5v5 smoke test, from the combined dialogue/inventory/Meshy preview test in headless Godot and from the same combined test under Xvfb/OpenGL Compatibility. Dialogue Manager reports a retained dialogue resource at desktop shutdown when the smoke test immediately quits. Xvfb also reports that its driver cannot change V-Sync.
- Reused two completed Meshy rigging tasks. Tested original GLBs in both directions. Each test verified matching 24-bone hierarchies, bound 25 animation tracks and observed changes in 22 bone rotations. This verifies clip transfer for these two compatible rigs. The private debug APK includes one Meshy walking sample. The GLBs are not published in Git.
- Android ARM64 debug export passed APK signature verification and 16 KB zip alignment. Verified package `ru.lunex.rustorafk.poc`, min SDK 24, target SDK 36, portrait orientation, native library, imported dialogue and sample assets. APK size 48,877,239 bytes. Built artifact SHA-256 `3d829fc1ec005c5ce4cad3061b81e51467ee154a834ad09f87b24e0475607026`.
- Runtime on Android is pending. ADB found no attached devices and Lunex has no /dev/kvm for an accelerated emulator. Touch input, ARM64 native execution, frame times and memory therefore remain open. GDD-01-P stays in progress pending device results and owner acceptance.
