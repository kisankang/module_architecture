# module_architecture

This project is a kind of module which has basic architecture with GetX package to start another project easily

<br>

## Key features
---

1. Architecture (design pattern) &rarr; [MVC](#1-mvc)

2. State management &rarr; [GetX](https://pub.dev/packages/get)

3. Flutter version management &rarr; [FVM](#2-fvm)

<br>
<br>
<br>

### Details
---
<br>

#### 1. MVC

```
module_architecture
├─ lib
│  ├─ common
│  │  ├─ config
│  │  ├─ theme
│  │  └─ translations
│  ├─ data
│  │  ├─ api
│  │  ├─ models        // Model
│  │  ├─ repositories
│  │  └─ services
│  ├─ modules
│  │  ├─ splash
│  │  │  ├─ splash_binding.dart
│  │  │  ├─ splash_controller.dart  // Controller
│  │  │  └─ splash_page.dart        // View
│  │  └─ welcome
│  │     ├─ welcome_binding.dart
│  │     ├─ welcome_controller.dart // Controller
│  │     └─ welcome_page.dart       // View
│  ├─ routes
│  ├─ helper
│  ├─ utils
│  ├─ widgets
│  └─ main.dart
```


#### 2. FVM
 change Flutter version for your project from ***"dart.flutterSdkPath"*** in ***.vscode/settings.json***



### commands
1. Generate .g file command
<br>
flutter pub run build_runner build --delete-conflicting-outputs

2. Generate splash screen
<br>
flutter pub run flutter_native_splash:create

3. Generate app logo launcher
<br>
flutter pub run flutter_launcher_icons:main
