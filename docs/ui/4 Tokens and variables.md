## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

You are absolutely right. While a minimal token set is a good starting point, a production-grade ERP and a public landing page require more granularity to handle interaction states (like hovering or disabled buttons), visual depth (shadows), and denser data layouts.
Here is the expanded, comprehensive token list. This will give you the exact control you need for a professional application without becoming overwhelmingly complex.
### 1. Expanded Color Tokens (color_tokens table)
*Added interaction states (hover, disabled), nested surfaces, and an 'Info' semantic color.*

| token_name | hex_value | description |
|---|---|---|
| color_primary | #0F172A | Deep blue (Brand/Headers) |
| color_primary_hover | #1E293B | Slightly lighter for interactions |
| color_accent | #6366F1 | Modern indigo (Primary actions) |
| color_accent_hover | #4F46E5 | Darker indigo for button presses |
| color_bg | #F8FAFC | Main app background (AppScaffold) |
| color_surface | #FFFFFF | Top-level cards and modals |
| color_surface_alt | #F1F5F9 | Nested cards or highlighted table rows |
| color_text_primary | #0F172A | Main typography |
| color_text_secondary | #64748B | Subtitles and hints |
| color_text_inverse | #FFFFFF | Text on top of Primary or Accent colors |
| color_text_disabled | #94A3B8 | Un-clickable text |
| color_border | #E2E8F0 | Standard dividers and input outlines |
| color_border_focus | #6366F1 | Outline when an input is clicked |
| color_bg_disabled | #E2E8F0 | Background for un-clickable buttons/inputs |
| color_success | #10B981 | Completed, Active, or Positive |
| color_warning | #F59E0B | Pending, Low Stock |
| color_danger | #EF4444 | Destructive, Offline, Errors |
| color_info | #3B82F6 | Neutral information or Help alerts |
### 2. Expanded Spacing Tokens (spacing_tokens table)
*Added finer steps for dense data tables and massive steps for landing page sections.*

| token_name | value_px | description |
|---|---|---|
| spacing_xxs | 2 | Micro adjustments (e.g., inside complex table cells) |
| spacing_xs | 4 | Tight gaps (e.g., icon next to text) |
| spacing_sm | 8 | Small padding (e.g., inside inputs, table cells) |
| spacing_md | 12 | Inner component padding |
| spacing_lg | 16 | Standard container padding (e.g., inside AppCard) |
| spacing_xl | 24 | Page margins, gaps between form fields |
| spacing_xxl | 32 | Major section breaks in the ERP |
| spacing_huge | 64 | Landing page sections (e.g., below Hero Section) |
### 3. Expanded Radius & Border Tokens (border_tokens table)
*Combined border width and radius. Added an extra-small radius and border widths.*

| token_name | value_px | description |
|---|---|---|
| radius_xs | 2 | Very subtle rounding for inner table elements |
| radius_sm | 4 | Checkboxes, small badges |
| radius_md | 8 | Inputs, Buttons |
| radius_lg | 16 | Cards, Modals, Dialogs |
| radius_pill | 999 | Fully rounded (Avatars, pill badges) |
| border_width_sm | 1 | Standard dividers and card borders |
| border_width_md | 2 | Active/Focused input borders |
### 4. Elevation & Shadow Tokens (shadow_tokens table)
*Crucial for a layered, professional UI. Shadows dictate hierarchy.*

| token_name | value | description |
|---|---|---|
| shadow_none | 0px | Flat elements |
| shadow_sm | y: 1px, blur: 2px | Subtle depth for AppButtons |
| shadow_md | y: 4px, blur: 6px | Standard AppCard elevation |
| shadow_lg | y: 10px, blur: 15px | AppDropdown menus and AppDialog modals |
### 5. Expanded Typography Tokens (typography_tokens table)
*Added a 'Display' size for landing pages/dashboards, a specific 'Button' style, and explicit line heights for better readability.*

| token_name | font_size | font_weight | line_height | description |
|---|---|---|---|---|
| text_display | 48 | Bold (700) | 1.2 | Landing page hero, huge dashboard metrics |
| text_h1 | 32 | Bold (700) | 1.2 | Major module titles |
| text_h2 | 24 | SemiBold (600) | 1.3 | Section headers, Dialog titles |
| text_h3 | 18 | SemiBold (600) | 1.4 | Card titles |
| text_button | 14 | SemiBold (600) | 1.0 | Action text inside AppButton |
| text_body | 14 | Normal (400) | 1.5 | Standard text, Table rows |
| text_caption | 12 | Normal (400) | 1.4 | Hints, timestamps, metadata |
This expanded set gives your database the exact parameters needed to render a flawless, interactive UI. Does this level of granularity look sufficient for your database schema?

