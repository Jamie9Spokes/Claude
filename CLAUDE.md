# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a **Claude Code Skills repository** — a collection of skill definitions that extend Claude Code's capabilities. Skills are invoked via slash commands (e.g., `/session-start-hook`).

## Structure

Skills live in `.claude/skills/<skill-name>/SKILL.md`. Each `SKILL.md` contains:
- A YAML frontmatter block with `name` and `description` fields
- Markdown instructions that are injected into Claude's context when the skill is invoked

## Adding a New Skill

1. Create `.claude/skills/<skill-name>/SKILL.md`
2. Add YAML frontmatter with `name` and `description`
3. Write the skill workflow in Markdown

## Existing Skills

### `session-start-hook`
Guides creation of `SessionStart` hooks for Claude Code on the web. The hook installs project dependencies so tests and linters work in remote sessions. Key behaviors:
- Creates `.claude/hooks/session-start.sh` (idempotent, non-interactive bash script)
- Registers the hook in `.claude/settings.json`
- Validates the hook, linter, and test execution before committing
- Runs synchronously by default; async mode available if session startup latency is a concern
- Uses `$CLAUDE_CODE_REMOTE=true` guard so the hook only runs in remote (web) sessions

## Hook Environment Variables

When writing hooks or skills that involve hooks:
- `$CLAUDE_PROJECT_DIR` — repository root
- `$CLAUDE_ENV_FILE` — file to write persistent environment variables for the session
- `$CLAUDE_CODE_REMOTE` — set to `"true"` in Claude Code on the web
