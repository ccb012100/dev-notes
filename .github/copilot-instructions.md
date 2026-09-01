# dev-notes

Public personal reference notes on programming languages, dev tools, and operating systems.
Markdown only — no build, no tests, no CI.

## Structure

Top-level folders are broad subject areas; files within are one topic each, named after the
tool or language (`fzf.md`, `Rust/`, `SQL Server.md`). Nesting mirrors the subject hierarchy,
e.g. `Operating Systems/Linux_UNIX/tmux.md`.

## Conventions

- Each file opens with a single `#` heading matching the topic name.
- Content is terse and example-first: a one-line description of the problem, then the command,
  snippet, or setting that solves it. Prose paragraphs are the exception.
- Commands, flags, file paths, and config keys go in backticks.
- This repo is public — never add credentials, internal hostnames, customer names, or anything
  SHI-internal. That material belongs in the separate `work-notes` repo.

## Working here

- Prefer appending to the existing topic file over creating a new one.
- Match the surrounding file's formatting rather than imposing a house style.
- Don't reflow, reorder, or "tidy" sections you weren't asked to touch.
