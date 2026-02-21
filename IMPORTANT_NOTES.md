# IMPORTANT_NOTES

## What This File Is

This is the single place for high-signal reminders and key setup decisions.
When important changes happen, add a short note here.

## Current Status (2026-02-21)

- Fork workflow is set up:
  - `origin`: `git@github.com:JohnKruse/nanoclaw.git`
  - `upstream`: `https://github.com/qwibitai/nanoclaw.git`

- Telegram support was applied to your fork.

- NanoClaw service is installed via launchd and was confirmed running.

- Main Telegram channel registration is in place:
  - JID: `tg:853485742`
  - Trigger: `@Stella`

- Runtime mismatch fix applied:
  - Startup now uses runtime abstraction (`src/container-runtime.ts`) instead of hardcoded Apple Container calls in `src/index.ts`.
  - Goal: keep Docker mode consistent.

- Agent container image built locally:
  - `nanoclaw-agent:latest`

- OpenRouter-first provider mode enabled in code/config:
  - Runner now uses OpenRouter when `OPENROUTER_API_KEY` is set.
  - Default model set to `openai/gpt-5-nano`.
  - Anthropic credentials are now optional fallback only.

## Syncing Your Fork With Upstream

Use:

```bash
cd /Users/john/Documents/nanoclaw
./scripts/sync-upstream.sh
```

This script fetches upstream, merges `upstream/main` into your local `main`, and pushes to your fork.

## Recent Commits Pushed

- `7226fcf` - Add Telegram channel support and align runtime with Docker
- `9db8bfa` - Document fork workflow and add upstream sync helper

## Operational Notes

- Memory notes are not scheduling. For must-do timed tasks, use scheduler/cron mechanisms.
- If Telegram responds but agent actions fail, check service logs first:

```bash
tail -f /Users/john/Documents/nanoclaw/logs/nanoclaw.log
```

```bash
tail -f /Users/john/Documents/nanoclaw/logs/nanoclaw.error.log
```
