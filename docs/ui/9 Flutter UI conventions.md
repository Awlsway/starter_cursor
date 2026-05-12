## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

# ANSVK Flutter UI Conventions

This document locks **project-level** choices so AI-generated Flutter code stays consistent.

---

## Canonical stack (accepted)

| Concern | Choice | Notes |
|--------|--------|--------|
| **State management** | **Riverpod** | Use `@riverpod` / `Notifier` patterns as adopted by the repo; avoid introducing Bloc for new features. |
| **Routing / navigation** | **go_router** | Declarative routes, web URLs, `context.go` / `context.push` / `context.pop`. Do not use ad-hoc `Navigator.push` for module navigation unless escaping a dialog. |

This stack is **accepted** for the ANSVK Flutter Web ERP and related apps. If you change stack, update this file and Cursor rules together.

---

## Documentation location: symlink preference (accepted)

**Preference:** Keep authoritative UI docs in **`D:\deepS\UI`** and link the Flutter repo with a **symlink** (Windows: **directory junction** or symlink) so `docs/ui` (or similar) in the project points at this folder.

**Example intent**

- Flutter repo: `my_app/docs/ui` → same content as `D:\deepS\UI`.

**Why junction/symlink**

- Single source of truth while editing in Obsidian or Cursor.
- Cursor sees files **inside the opened workspace** when the symlink resolves.

**Cautions**

- **Git:** symlinks committed on Windows may not resolve for teammates or CI without the same path—document whether `docs/ui` is optional locally or use **copy** for shared clones (see hybrid below).
- **CI / builds:** documentation is not required to compile; broken symlink only affects docs, not `flutter build`.
- **Hybrid:** symlink on your machine; in README note “clone without symlink: copy `D:\deepS\UI` into `docs/ui` once.”

Creating the link is a **one-time local setup** (Developer Mode + symlink, or `mklink /J` as Administrator)—details live in your repo README, not duplicated here.

---

## Folder layout (recommended)

```
lib/
  app/                 # MaterialApp, router, theme wiring
  core/                # shared utils, errors, constants (non-UI)
  features/<feature>/  # feature-first: data + ui per module
    presentation/
      pages/
      widgets/
    application/       # riverpod notifiers / services if used
    domain/
  ui/
    theme/             # ThemeData, component theme extensions
    tokens/            # generated design_tokens.dart (do not hand-edit)
    components/        # AppButton, AppCard, … public widgets
```

AI must place **reusable** widgets under `lib/ui/components/` and feature-specific under `lib/features/<feature>/presentation/`.

---

## Theming and tokens

- **Production:** UI reads **`design_tokens.dart`** (generated from DB per `2. ANSVK_UI_Development_Workflow.md`).
- **No raw colors** in `lib/features/**` or `lib/ui/components/**` except comments—**tokens only**.
- **ThemeData:** map semantic colors to Material `ColorScheme` where practical; keep ANSVK semantic tokens as extensions if needed.

---

## Riverpod conventions

- **Providers:** suffix with `Provider` / `NotifierProvider`; keep provider files next to feature `application/` or `presentation/di/`.
- **Widgets:** prefer `ConsumerWidget` / `ConsumerStatefulWidget` for screens that depend on providers.
- **Reads:** `ref.watch` for rebuild; `ref.read` for one-shot in callbacks (not inside `build`).
- **Async:** use `AsyncValue` from `riverpod` for loading/error/data; UI shows skeleton / error per patterns below.

---

## go_router conventions

- **Route names:** `kebab-case` in path, **lowerCamelCase** for `name:` parameters (pick one style per repo and stick to it—recommend **`name: 'inventoryStock'`**).
- **Parameters:** use `path` params for IDs; use `extra` for complex objects only when necessary and document types.
- **Redirects:** auth and role checks live in router `redirect` callback—not scattered in `build()`.
- **Shell routes:** ERP layout (sidebar + content) implemented once as `ShellRoute`.

---

## Web responsiveness

| Breakpoint | Approx width | Behavior |
|-------------|----------------|----------|
| `compact` | &lt; 600 | Collapse sidebar to drawer; stack filters above table |
| `medium` | 600–1199 | Sidebar icon rail or narrow sidebar |
| `expanded` | ≥ 1200 | Full sidebar + multi-column filters |

Use `LayoutBuilder` / `MediaQuery.sizeOf` or shared `Breakpoint` helper—define the helper once under `lib/ui/theme/` or `lib/core/responsive/`.

---

## Loading, empty, and error (tables and pages)

| State | UI expectation |
|--------|----------------|
| **Loading** | Prefer skeleton rows or `LinearProgressIndicator` at top of `AppTable`; avoid infinite spinners with no copy |
| **Empty** | Dedicated `emptyState` widget with short message + optional primary action |
| **Error** | Inline retry in content area **or** `AppSnackbar` for transient errors; loggable errors include correlation id in debug only |
| **Offline** | Use `AppSyncIndicator` / banner from universal list; table may show cached data with stale badge |

---

## Forms and validation

- Validate on **submit** for long forms; validate on **blur** for critical single fields if product requires.
- Error text on fields uses tokenized error color; snackbar for server-side failures.

---

## AI / Cursor usage

- When generating a new screen: follow **`10 Page patterns.md`** and **`8 Component contracts.md`**.
- When generating navigation: add/update **go_router** `GoRoute` entries in the central router file—do not create orphan `MaterialPageRoute` factories for module navigation.

---

*Document version: v1 — stack: Riverpod + go_router; docs: symlink preference to `D:\deepS\UI`.*

