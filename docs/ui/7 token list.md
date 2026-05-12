## Brief introduction
Use this document as prompt context for AI-assisted coding in Cursor. It defines one focused part of the ANSVK system so generated Flutter code stays consistent with Riverpod + go_router, token governance, and reusable component contracts.

## 1) Color tokens (`type=color`)

- `color.bg.app.default` = `#F8FAFC`
    
- `color.bg.surface.default` = `#FFFFFF`
    
- `color.bg.surface.alt` = `#F1F5F9`
    
- `color.bg.disabled.default` = `#E2E8F0`
    
- `color.text.primary.default` = `#0F172A`
    
- `color.text.secondary.default` = `#64748B`
    
- `color.text.inverse.default` = `#FFFFFF`
    
- `color.text.disabled.default` = `#94A3B8`
    
- `color.border.default` = `#E2E8F0`
    
- `color.border.focus` = `#6366F1`
    
- `color.action.primary.default` = `#6366F1`
    
- `color.action.primary.hover` = `#4F46E5`
    
- `color.action.secondary.default` = `#0F172A`
    
- `color.action.secondary.hover` = `#1E293B`
    
- `color.action.danger.default` = `#EF4444`
    
- `color.action.danger.hover` = `#DC2626`
    
- `color.status.success.default` = `#10B981`
    
- `color.status.warning.default` = `#F59E0B`
    
- `color.status.danger.default` = `#EF4444`
    
- `color.status.info.default` = `#3B82F6`
    
- `color.overlay.scrim.default` = `#0F172A1A`  
    (10% alpha scrim for dialogs/menus)
    

---

## 2) Spacing tokens (`type=space`)

- `space.xxs` = `2`
- `space.xs` = `4`
- `space.sm` = `8`
- `space.md` = `12`
- `space.lg` = `16`
- `space.xl` = `24`
- `space.xxl` = `32`
- `space.huge` = `64`

---

## 3) Radius tokens (`type=radius`)

- `radius.xs` = `2`
- `radius.sm` = `4`
- `radius.md` = `8`
- `radius.lg` = `16`
- `radius.pill` = `999`

---

## 4) Border tokens (`type=border`)

- `border.width.sm` = `1`
- `border.width.md` = `2`

---

## 5) Shadow tokens (`type=shadow`)

Use structured value JSON in DB for shadows:

- `shadow.none` = `{"x":0,"y":0,"blur":0,"spread":0,"color":"#00000000"}`
- `shadow.sm` = `{"x":0,"y":1,"blur":2,"spread":0,"color":"#0000001A"}`
- `shadow.md` = `{"x":0,"y":4,"blur":6,"spread":0,"color":"#0000001A"}`
- `shadow.lg` = `{"x":0,"y":10,"blur":15,"spread":0,"color":"#0000001F"}`

---

## 6) Typography tokens (`type=typography`)

Use JSON value format:

- `text.display` = `{"size":48,"weight":700,"lineHeight":1.2}`
- `text.h1` = `{"size":32,"weight":700,"lineHeight":1.2}`
- `text.h2` = `{"size":24,"weight":600,"lineHeight":1.3}`
- `text.h3` = `{"size":18,"weight":600,"lineHeight":1.4}`
- `text.button` = `{"size":14,"weight":600,"lineHeight":1.0}`
- `text.body` = `{"size":14,"weight":400,"lineHeight":1.5}`
- `text.caption` = `{"size":12,"weight":400,"lineHeight":1.4}`

---

## 7) Motion tokens (`type=motion`) — optional but recommended

- `motion.duration.fast` = `150`
- `motion.duration.base` = `200`
- `motion.duration.slow` = `250`
- `motion.easing.standard` = `cubic-bezier(0.2,0,0,1)`

---

## 8) Minimum DB columns for v1

- `token_key` (unique)
- `type`
- `value`
- `theme` (set all to `light`)
- `state` (nullable, e.g. `hover`)
- `status` (`active`)
- `version` (`1`)
- `updated_at`
- `updated_by`
- `notes`

---

If you want next, I can give you this same v1 list as a ready SQL seed insert template format (so you can paste into your DB quickly).
