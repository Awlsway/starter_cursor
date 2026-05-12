## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

# ANSVK Component API Contracts (v1)

This document defines the **allowed public surface** for core UI building blocks. AI and humans must implement **these names and behaviors** only—no parallel `CustomButton`, `PrimaryBtn`, etc.

**Canonical Flutter stack (accepted):** **Riverpod** (state) + **go_router** (navigation). New UI code uses `ConsumerWidget` / `ConsumerStatefulWidget` (or `HookConsumerWidget` only if the project already adopts hooks) and `context.push` / `context.go` from go_router—do not mix Bloc for new features unless this document is revised.

Cross-references: `3. ANSVK_Universal_Component_List.md` (full inventory), `7 token list.md`, `6 Token governance.md`.

---

## Global rules (all components)

- **Tokens only:** colors, spacing, radius, borders, shadows, typography come from generated `design_tokens.dart` (or DB-backed runtime in dev—never hardcode `Color(0xFF...)` in feature or component code except inside the generator output).
- **States:** every interactive component documents **default, hover (web), focus, disabled, loading** where applicable.
- **Accessibility:** minimum tap target **44×44** logical px; focus ring uses `color.border.focus` (or dedicated focus token when added).
- **Text:** use `text.*` styles from tokens; no orphan `fontSize:` in widgets except rare one-offs approved in review.

---

## AppScaffold (page shell)

**Purpose:** Outer wrapper for authenticated ERP pages—background, padding, optional sidebar slot.

**Required parameters**

- `child` — main content.

**Optional parameters**

- `title` — `String?` for window / section semantics (may feed `AppTopBar`).
- `actions` — `List<Widget>?` for header actions region.
- `floatingActionButton` — `Widget?` if the module uses FAB (rare in ERP; prefer header actions).

**Variants**

- `variant`: `standard` | `fullBleed`  
  - `standard`: page padding from `space.xl` (or token `page.padding.horizontal` when introduced).  
  - `fullBleed`: child handles its own horizontal padding (tables edge-to-edge inside card).

**States**

- N/A (layout only). Loading/error live **inside** `child`.

**Use when**

- Any module screen that is not a standalone auth/marketing page.

**Do not use when**

- Landing/marketing layout—use marketing-specific templates from component list.

---

## AppButton

**Purpose:** Primary user actions.

**Variants**

- `primary` | `secondary` | `danger` | `text`

**Sizes**

- `sm` | `md` | `lg` (map padding + `text.button` / scaled token when defined)

**Required parameters**

- `label` — `String`
- `onPressed` — `VoidCallback?` (null = disabled)

**Optional parameters**

- `variant` — default `primary`
- `size` — default `md`
- `leadingIcon` / `trailingIcon` — `IconData?` or project icon enum
- `loading` — `bool`, default `false` (when true: show spinner, ignore presses)
- `fullWidth` — `bool`, default `false`

**States**

- default, hover (web), pressed, focus, disabled (`onPressed == null` or explicit disabled flag), loading

**Behavior**

- While `loading == true`, button is non-interactive and shows progress indicator sized for `size`.
- Keyboard: **Enter / Space** activates when focused.

**Content**

- Prefer single line; max **32 characters** before truncation with ellipsis in dense tables.

---

## AppTextField

**Purpose:** Text, number, email, password, search inputs.

**Variants**

- `outline` (default) | `filled` (if tokenized)

**Sizes**

- `sm` | `md` | `lg` — height and horizontal padding from spacing tokens.

**Required parameters**

- `controller` — `TextEditingController` (or `initialValue` + `onChanged` pattern only for trivial read-only demos—prefer controller for ERP forms)

**Optional parameters**

- `label`, `hint`, `helperText`, `errorText`
- `obscureText`, `keyboardType`, `textInputAction`, `maxLines` (default 1)
- `prefixIcon`, `suffixIcon`
- `enabled` — default `true`
- `onSubmitted` — for search bars

**States**

- empty, focused, filled, error, disabled, read-only (display mode)

**Behavior**

- `errorText != null` → error border color from `color.status.danger` or dedicated `color.border.error` when added to token list.

**Use when**

- Any form field that maps to a single string/number input.

---

## AppTable

**Purpose:** Dense ERP data grid (inventory, HR lists, approvals).

**Required parameters**

- `columns` — list of column definitions (id, label, sortable?, width flex?)
- `rows` — list of row models or `DataRow`-like builders bound to domain types (project choice: keep **presentation** row DTOs in UI layer).

**Optional parameters**

- `sortColumnId`, `sortAscending`, `onSort`
- `selection` — `SelectionMode.none | single | multi` + `selectedRowIds`, `onSelectionChanged`
- `onRowTap`, `onRowSecondaryTap` (context menu)
- `emptyState` — `Widget` when `rows.isEmpty`
- `loading` — `bool`; when true show skeleton or overlay per convention doc
- `error` — `Object?` or `String?`; when set show `AppSnackbar` or inline error per `9 Flutter UI conventions.md`

**States**

- loading, empty, populated, error, offline (optional banner from parent—see sync components)

**Behavior**

- Table header sticky if specified by module (optional flag `stickyHeader` default false for v1).
- Horizontal scroll on narrow web—**never** clip without scroll.

**Use when**

- Primary content is tabular data **> ~8 columns** or needs sort/selection.

**Do not use when**

- Simple key-value lists—use `AppListGroup` when added.

---

## AppDialog (modal)

**Purpose:** Confirmations, forms in overlay, destructive action gates.

**Variants**

- `alert` — title + message + 1–2 actions  
- `form` — scrollable body + primary/secondary actions  
- `fullScreen` (mobile/small width only—optional v2)

**Required parameters**

- `title` — `String`
- `actions` — row of `AppButton` (or `text` variant for cancel)

**Optional parameters**

- `content` — `Widget?`
- `barrierDismissible` — default `false` for destructive flows

**States**

- opening animation uses `motion.duration.base` token.

**Behavior**

- Primary action disabled while nested async `loading` true (e.g. delete confirm).

---

## AppBadge

**Purpose:** Status chips (Active, Pending, Offline, Low stock).

**Variants (semantic)**

- `success` | `warning` | `danger` | `info` | `neutral`

**Sizes**

- `sm` | `md`

**Required parameters**

- `label` — `String`

**Optional parameters**

- `variant` — default `neutral`
- `icon` — optional leading status icon

**States**

- static display only (not a button; use `AppButton` + `text` for actions).

---

## Riverpod + go_router integration notes

- **Providers** supply table data, form state, and dialog controllers; widgets **watch** read-only state and **read** notifiers for actions.
- **Navigation to a screen** that needs refreshed data: prefer `context.pushNamed` with `extra` or path params; **do not** pass large objects through query strings.
- Opening `AppDialog` from a route: use root `navigatorKey` or `showDialog` with `useRootNavigator: true` consistently (document per app once in `9 Flutter UI conventions.md`).

---

## Versioning

- Bump this file’s **v1** footer when adding props or variants; mark breaking changes with migration notes.

*Document version: v1 — aligned with ANSVK universal list and DB-first token governance.*

