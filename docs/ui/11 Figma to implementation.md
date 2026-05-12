## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

# Figma ↔ Implementation (ANSVK)

Short rules so **Figma**, **DB tokens**, and **Flutter** stay aligned when using AI (including Figma MCP in Cursor).

**Accepted stack:** **Riverpod** + **go_router** — implementation details and navigation must match `9 Flutter UI conventions.md`.

---

## Source of truth order

1. **DB** — canonical token keys and values (`6 Token governance.md`, `7 token list.md`).  
2. **Figma** — visual layout and component structure; variables should mirror DB keys where possible.  
3. **Flutter** — generated `design_tokens.dart` + `lib/ui/components/*`; no one-off hex in features.

If Figma and DB disagree, **fix DB first**, then regenerate Dart and refresh Figma variables (export/sync per workflow).

---

## Working with the AI from Figma

1. **Copy the frame or file link** from Figma (node selected).  
2. In Cursor, paste the link and state the goal: e.g. “Implement this frame as Flutter route `inventoryStock` using `AppTable` and Riverpod.”  
3. **Explicitly require:** tokens only, components from `8 Component contracts.md`, page layout from `10 Page patterns.md`.

The agent uses MCP to read design context; it does not “browse” the URL like a human—**the link must include `node-id`** when implementing a specific frame.

---

## Naming alignment

- Figma component names should match code: **`AppButton`**, **`AppCard`**, etc.  
- Figma variables should map to token keys: e.g. `color.bg.app.default`, `space.lg`.  
- When introducing a new token in Figma, **add the key to DB first** (or same change batch), then export.

---

## go_router + screens from designs

- One primary Figma frame → one **page** widget + one **GoRoute** (or nested route).  
- Deep links: Figma artboard names should correspond to **route path segments** in documentation (table in repo README optional).

---

## Riverpod scope from designs

- **Screen-level** state: filters, pagination, selection → dedicated providers in the feature module.  
- **Do not** bind Figma “variants” directly to ad-hoc global singletons—use typed providers.

---

## Checklist before merging UI from AI

- [ ] No hardcoded colors outside token generator output  
- [ ] Uses `App*` components per contracts  
- [ ] Loading / empty / error states for lists and tables  
- [ ] Route registered in go_router  
- [ ] Riverpod providers disposed correctly (`autoDispose` where appropriate)  

---

*Document version: v1*

