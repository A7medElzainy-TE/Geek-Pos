# Geek POS — Agent Working Agreement

This repository is the canonical source for Geek POS development.

## Repository workflow

- Default branch: `main`.
- Never implement feature work directly on `main`.
- Create a short task branch, preferably prefixed with `agent/`.
- Inspect the current repository before editing; do not rely on stale assumptions about file layout.
- Keep changes scoped to the user's request and preserve unrelated behavior.
- Open a Pull Request into `main` after implementation.
- Do not merge a Pull Request unless the user explicitly asks for it.

## Product conventions

- Geek POS is Arabic/RTL first. Preserve RTL behavior unless the task explicitly changes it.
- Prefer compact, practical POS layouts over oversized marketing-style UI.
- Do not show application version text in the visible UI unless explicitly requested.
- Preserve cashier/receipt usability when changing layout or print-related code.
- Supabase may be used by the app. Never commit service-role keys, database passwords, private tokens, or other secrets.

## Engineering checks

Before opening a Pull Request:

1. Re-read every changed file.
2. Check HTML/CSS/JavaScript syntax and obvious browser regressions.
3. Check RTL alignment and responsive behavior for UI work.
4. Run available build/tests/CI when the repository provides them.
5. If no automated validation exists, state that clearly in the Pull Request instead of claiming tests passed.

## Sensitive changes

Treat the following as requiring explicit user direction before irreversible production actions:

- destructive SQL or production database changes,
- license/activation data changes,
- deployments/releases,
- deleting production data,
- merging to `main`.

Prepare safe code, migration files, or a Pull Request first whenever possible.

## Missing components

If the user asks to modify something that is not present in this repository, report what is missing instead of inventing files or pretending the change was applied.

## Completion report

At the end of a task, report:

- what changed,
- branch and Pull Request,
- validation performed,
- anything the user should verify manually.
