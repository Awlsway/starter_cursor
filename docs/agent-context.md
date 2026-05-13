# Starter Package Context for New Agent

## Brief introduction
Use this document when a new AI agent joins the repository. It summarizes business intent, coding expectations, architecture patterns, and what to avoid so output remains aligned with ANSVK standards.

## Business intent
- Build consistent ANSVK business apps quickly from one reusable baseline.
- Prioritize maintainability and predictable AI-assisted development over one-off speed hacks.

## What this starter already guarantees
- Riverpod + go_router baseline app structure
- Reusable core UI components in `lib/ui/components/`
- Token generation pipeline (`tokens/` -> `tool/` -> `lib/ui/tokens/`)
- CI quality checks (format, analyze, test with coverage)
- Bootstrap script for new project setup

## Where to put code
- App/bootstrap and router: `lib/app/`
- Cross-cutting helpers: `lib/core/`
- Reusable UI: `lib/ui/`
- Business modules: `lib/features/<feature_name>/`

## How to build new features
Copy pattern from `lib/features/inventory_items/`:
1. Add domain model
2. Add repository in data layer
3. Add Riverpod provider/notifier
4. Add pages (list/form/details as needed)
5. Register route(s) in `lib/app/router.dart`

## UI conventions
- Use existing `App*` components first.
- If a reusable pattern is missing, create a new `App*` component and export it from `lib/ui/components/components.dart`.
- Use `AppTokens` rather than ad-hoc colors/spacing.

## Data/token conventions
- Edit token source in `tokens/design_tokens.light.json`.
- Run `dart run tool/generate_tokens.dart`.
- Do not hand-edit `lib/ui/tokens/design_tokens.dart`.

## Definition of done for agent tasks
1. Code fits architecture/rules/docs.
2. Formatting is clean.
3. `flutter analyze` passes.
4. `flutter test --coverage` passes.
5. Docs/rules updated if architecture or conventions changed.

## Primary references
- `AGENTS.md`
- `README.md`
- `docs/quickstart.md`
- `docs/architecture.md`
- `docs/data/token-pipeline.md`
- `docs/ui/00 UI index.md`
