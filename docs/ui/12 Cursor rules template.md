## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

# Cursor rules template (copy into Flutter repo)

**Purpose:** Paste the block below into a new file in your Flutter project, e.g. `.cursor/rules/ansvk-ui.mdc` (Cursor rules often use the `.mdc` extension).

If you use a **symlink** from `my_app/docs/ui` → `D:\deepS\UI`, keep **rules** inside the repo (`.cursor/rules/`) because Cursor applies rules from the **workspace root**, not from an external path unless that path is the workspace.

---

## File: `.cursor/rules/ansvk-ui.mdc`

Use this frontmatter and body (adjust `globs` to match your repo):

```yaml
---
description: ANSVK Flutter UI — tokens, App components, Riverpod, go_router
globs: lib/**/*.dart
alwaysApply: false
---

# ANSVK UI rules

## Accepted stack
- **State:** Riverpod only for new code (`ConsumerWidget` / `ConsumerStatefulWidget`, `ref.watch` / `ref.read`). Do not add Bloc/Cubit unless explicitly requested in a task.
- **Navigation:** go_router only for module routes (`context.go`, `context.push`, `context.pop`). Avoid raw `Navigator.push` for feature navigation.

## Tokens and styling
- No `Color(0xFF...)` or raw hex in `lib/features/**` or `lib/ui/components/**` except inside **generated** `design_tokens.dart` (or the single generator script).
- Spacing, radius, typography: use tokens / `ThemeExtension` / shared constants produced from the DB pipeline. No magic numbers unless justified in a comment and later tokenized.

## Components
- Use only **`App*`** widgets from `lib/ui/components/` per `docs/ui/8 Component contracts.md` (or symlinked `D:\deepS\UI`).
- Do not invent parallel components (`PrimaryButton`, `MyCard`)—extend existing `App*` or flag a gap in review.

## Pages
- ERP screens follow `docs/ui/10 Page patterns.md`: header → optional filters/summary → main `AppTable` / form inside `AppCard` where applicable.
- Tables must handle **loading**, **empty**, and **error** states.

## Routing
- New screens: register a **GoRoute** in the central router file; use typed `extra` / path params per project convention.

## Figma
- When the user supplies a Figma frame URL, use Figma MCP tools to fetch design context; align naming with token keys and `App*` components. If tokens are missing, add keys to the DB spec (`7 token list.md`) before hardcoding.

## Documentation
- UI governance markdown may live under `docs/ui/` (symlinked to `D:\deepS\UI` on the author’s machine). Do not move token source of truth into code comments—DB remains canonical per `6 Token governance.md`.
```

---

*Template version: v1 — matches `8`–`11` and workflow doc stack.*

