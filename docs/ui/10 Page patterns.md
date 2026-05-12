## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

# ANSVK ERP Page Patterns (v1)

Standard layouts reduce AI drift and keep every module feeling like one product.

**Canonical stack:** **Riverpod** (data + UI state for the page) + **go_router** (each module page is a `GoRoute`; deep links map to the same structure).

---

## Pattern A — Standard module page (default)

Use for: inventory lists, HR lists, approvals, master data.

**Vertical structure (top → bottom)**

1. **Page header** (`AppTopBar` region or embedded header row)  
   - Title (module + context, e.g. “Stock on hand — Warehouse A”)  
   - Primary actions (e.g. “Receive”, “Export”) as `AppButton`  
   - Optional **breadcrumbs** (`AppBreadcrumbs`) when depth ≥ 2  

2. **Optional filter / summary strip**  
   - Chips, date range, search `AppTextField`  
   - Optional **KPI cards** in a horizontal `AppGrid` / row of `AppCard`  

3. **Main content**  
   - Usually **`AppTable`** inside **`AppCard`**  
   - Pagination footer **inside** the card or directly below per module consistency  

4. **Optional sticky footer** (`AppSystemFooter`) — app version, user, environment  

**Spacing**

- Between major blocks: `space.xxl` (or `space.xl` on compact breakpoints).  
- Inside cards: `space.lg` padding per tokens.

**Riverpod**

- Page-level provider exposes `AsyncValue<PageVm>` or split `tableStateProvider` + `filtersProvider`.  
- Header actions `ref.read` notifiers; table body `ref.watch` for rebuild.

**go_router**

- One route = one **page widget** under `lib/features/<x>/presentation/pages/`.  
- Query params for filters optional; prefer restoring filter state from provider + `RouteState` if complexity grows.

---

## Pattern B — Master / detail (split)

Use for: record overview + tabs (e.g. employee profile).

**Layout**

- `expanded`: **two columns** — left summary `AppCard`, right tabbed content.  
- `compact`: **single column** — summary collapsible, tabs below.

**Navigation**

- **go_router** nested routes: `/employees/:id`, child routes `/employees/:id/leave`, etc.  
- **Riverpod:** `family` provider keyed by `id` from `GoRouterState`.

---

## Pattern C — Form page (create / edit)

Use for: receive stock, new employee, settings panel.

**Structure**

1. Header with title + **Cancel** (`AppButton` text) + **Save** (primary)  
2. Form body in one or two columns (`expanded`) / single column (`compact`)  
3. Sticky bottom bar on mobile with Save (optional)

**Validation**

- Follow `9 Flutter UI conventions.md` (submit vs blur).

**Riverpod**

- `Notifier` / `AsyncNotifier` for submit; disable Save while `loading`.

---

## Pattern D — Dashboard (executive)

Use for: KPI-heavy landing within ERP.

**Structure**

- Row of KPI `AppCard` widgets  
- Secondary charts/tables below  
- Avoid more than **one** primary `AppTable` above the fold unless product requires it.

---

## Anti-patterns (do not generate)

- Random `Padding` values not from spacing tokens.  
- Multiple competing headers on one page.  
- Tables without empty/loading/error handling.  
- New routes without `go_router` registration.  
- Bloc or raw `Navigator` patterns for new code (stack is **Riverpod + go_router** per `9 Flutter UI conventions.md`).

---

*Document version: v1*

