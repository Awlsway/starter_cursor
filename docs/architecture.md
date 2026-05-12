# Architecture Guide

## Brief introduction
This guide defines repository structure, dependency direction, and integration points so new features remain consistent and easy for AI or humans to extend.

## High-level principles
- Feature-first modules
- Riverpod for state
- go_router for navigation
- Shared UI in `lib/ui/`, shared helpers in `lib/core/`

## Dependency direction
presentation -> application/provider -> domain -> data

## Routing
- Central route registration in `lib/app/router.dart`
