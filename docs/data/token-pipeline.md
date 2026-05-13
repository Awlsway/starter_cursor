# Token Pipeline

## Brief introduction
This document explains how design tokens flow into Flutter code. The current starter uses JSON as a stand-in for DB export so the same generation workflow can be used in future DB-first environments.

## Current flow (v1.1 step 1)
1. Edit token source in `tokens/design_tokens.light.json`.
2. Run generator: `dart run tool/generate_tokens.dart`.
3. Generated file updates: `lib/ui/tokens/design_tokens.dart`.

## Rule
- Do **not** edit `lib/ui/tokens/design_tokens.dart` by hand.
- Always update source tokens, then regenerate.

## Future DB integration
- Replace the JSON source with a DB export step (or API fetch) that writes the same JSON schema before generation.
- Keep token keys stable so component code does not require frequent refactors.
