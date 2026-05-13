# AGENTS Context for flutter-ansvk-starter

## Brief introduction
This file gives a new coding agent the minimum context needed to work effectively in this repository. Read this first, then follow linked docs and Cursor rules before making architectural or UI decisions.

## Project purpose
- This repository is a reusable Flutter starter template for ANSVK business apps.
- It is not a finished product; it provides patterns, rules, and reusable building blocks.

## Canonical stack
- Flutter
- Riverpod (state management)
- go_router (navigation/routing)

## Source-of-truth hierarchy
1. Governance docs in `docs/` and `docs/ui/`
2. Cursor rules in `.cursor/rules/`
3. Implemented code in `lib/`

For UI tokens specifically:
1. `tokens/design_tokens.light.json` (source payload)
2. `tool/generate_tokens.dart` (generator)
3. `lib/ui/tokens/design_tokens.dart` (generated output, do not hand-edit)

## Critical rules
- Do not introduce Bloc for new features unless explicitly requested.
- Register module routes in `lib/app/router.dart` using go_router.
- Prefer `App*` components from `lib/ui/components/` over ad-hoc widgets.
- Keep token usage centralized; do not scatter hardcoded color literals in feature code.

## Feature development pattern
Use `inventory_items` as the canonical feature template:
- `domain/` model
- `data/` repository (stub or real)
- `presentation/providers/` Riverpod notifier/provider
- `presentation/pages/` list + form pages

Reference: `docs/architecture/feature-template-inventory-items.md`

## Required read order for new agents
1. `README.md`
2. `docs/quickstart.md`
3. `docs/architecture.md`
4. `docs/data/schema-conventions.md`
5. `docs/data/token-pipeline.md`
6. `docs/ui/00 UI index.md`
7. `.cursor/rules/00-constitution.mdc`
8. `.cursor/rules/10-architecture.mdc`
9. `.cursor/rules/20-data.mdc`
10. `.cursor/rules/30-ui.mdc`

## Working agreements
- Keep edits incremental and easy to review.
- Run local checks before proposing completion:
  - `dart format .`
  - `flutter analyze`
  - `flutter test --coverage`
- If a change affects tokens, regenerate via:
  - `dart run tool/generate_tokens.dart`

## Notes
- Solo workflow optimized for one PC.
- Bootstrap script for fresh projects:
  - `scripts/bootstrap.ps1`
