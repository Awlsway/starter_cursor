# flutter-ansvk-starter

## Brief introduction
This private starter template gives you a repeatable foundation for solo Flutter projects using Riverpod + go_router, DB-first UI tokens, and strict Cursor AI guardrails to keep architecture, UI, and data conventions consistent.

## What this template includes
- Flutter app skeleton with feature-first structure
- Riverpod + go_router baseline wiring
- UI token and component starter files
- Cursor rules for architecture, data, and UI governance
- Reusable documentation in `docs/` and `docs/ui/`

## Project structure
```text
lib/
  app/
  core/
  features/
  ui/
.cursor/rules/
docs/
  ui/
```

## Getting started
1. Open this repo in Cursor.
2. Run `flutter pub get`.
3. Start from `lib/main.dart`.
4. Add your first feature under `lib/features/`.
5. For new projects, run `scripts/bootstrap.ps1` (see `docs/quickstart.md`).
6. For new AI agents, read `AGENTS.md` and `docs/agent-context.md`.

## Token pipeline
- Token source file: `tokens/design_tokens.light.json`
- Generator script: `tool/generate_tokens.dart`
- Generated output: `lib/ui/tokens/design_tokens.dart`
- Regenerate after token updates:
  - `dart run tool/generate_tokens.dart`

## Notes
- This template is designed for solo development on one PC.
- Keep DB token governance and UI contracts in sync with implementation.
- New project bootstrap script: `scripts/bootstrap.ps1`.

## CI checks
- `dart format --output=none --set-exit-if-changed .`
- `flutter analyze`
- `flutter test --coverage`
