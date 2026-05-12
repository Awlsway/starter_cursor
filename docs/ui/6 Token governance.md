## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

- Source of truth
    
    - DB is canonical
    - Figma and code are downstream consumers
- Naming policy (my recommended format)
    
    - `category.role.state.scale`
    - Examples:
        - `color.bg.surface.default`
        - `color.text.primary.default`
        - `color.action.primary.hover`
        - `space.md`
        - `radius.lg`
        - `shadow.card.md`
        - `text.body.md`
    - Keep names semantic, not raw (`blue500`), unless you need palette primitives internally.
- Required token metadata in DB
    
    - `token_key` (unique)
    - `value`
    - `type` (`color|space|radius|shadow|typography|border`)
    - `state` (`default|hover|focus|disabled|active`) if applicable
    - `status` (`active|deprecated`)
    - `version` (int)
    - `updated_at`, `updated_by`
    - `notes`
- Versioning rules
    
    - Non-breaking value tweak: patch version
    - Rename/remove token: mark deprecated first, remove in next major
    - Never delete active tokens directly
- Sync flow
    
    - DB -> export -> Figma variables
    - DB -> generate `design_tokens.dart`
    - No manual token edits directly in app code
- Light theme scope
    
    - Only `theme=light` rows exist now
    - Reserve schema field for future dark theme
