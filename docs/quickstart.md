# Quickstart

## Brief introduction
This quickstart provides a repeatable setup flow when cloning this starter into a new project. Use the bootstrap script to rename app metadata and initialize local environment files in one step.

## 1) Clone and enter project
```powershell
git clone <your-repo-url>
cd <your-project-folder>
```

## 2) Run bootstrap script
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap.ps1 -AppName "my_new_app" -DisplayName "My New App" -Env "development"
```

## 3) Install and generate
```powershell
flutter pub get
dart run tool/generate_tokens.dart
```

## 4) Verify baseline
```powershell
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test --coverage
```

## Notes
- If `.env` does not exist, bootstrap creates it from `.env.example`.
- You can rerun bootstrap with a different `-DisplayName` later.
