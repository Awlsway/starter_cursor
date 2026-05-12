## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

## What is already good

- Clear UI direction and constraints
- Component-first thinking
- Tokenization mindset
- Figma -> DB -> generated Dart flow
- ERP-focused data components included (`AppTable`, status, sync indicators)

## What you should add now (important gaps)

- Token governance
    
    - Define single source of truth: Figma-first or DB-first.
    - Add token naming/version policy (`v1`, deprecations, migration rules).
    - Add dark mode/theming strategy now (even if phase 2).
- Component API contracts
    
    - For each component, define required props + variants + states.
    - Example: `AppButton` variants (`primary|secondary|danger|text`), sizes, loading, disabled.
    - Without this, design and code drift quickly.
- State matrix for ERP-critical components
    
    - Especially for `AppTable`, forms, badges, sync banners.
    - Must include: empty, loading, error, offline, permission denied, long text overflow.
- Responsive behavior rules
    
    - Explicit breakpoints and behavior per component/page section.
    - ERP web apps fail here if not written down early.
- Accessibility baseline
    
    - Color contrast targets, keyboard navigation, focus rings, minimum hit areas.
    - Needed for enterprise quality and future compliance.
- Design-to-code mapping rules
    
    - Define exact mapping: Figma variable -> token key -> Dart constant -> component usage.
    - Include “no hardcoded value” lint/check strategy.
- Release workflow
    
    - Who approves token/component changes?
    - How changes are tested before production token generation.
    - Add rollback strategy for bad token releases.

## One thing to simplify

You currently mention dynamic DB-driven theming in dev. Good idea, but can become complex early.  
Consider phased rollout:

1. static tokens from Figma export first,
2. component library stable,
3. then DB-driven live theming.

This reduces early architecture risk.

---

If you want, next I can do a focused plan audit in this format:

- Keep as-is
- Add now
- Defer to later
- Remove/avoid  
    for each of your 5 documents.
