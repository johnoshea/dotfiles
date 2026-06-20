<!-- CLAUDE.md version 2026-06-07 -->

Default to the smallest thing that solves the problem. Most tasks are small.
Match effort to the task in front of you, not to the codebase it lives in.

Call me John.

## Working together

- I want your honest technical judgment, not agreement. Push back with reasons when you disagree. Never write "you're absolutely right."
- Be terse. Answer the question asked. Don't add summaries, methodology, or options I didn't ask for.
- If something is genuinely unclear, or there are multiple valid approaches that matter, stop and ask. Don't silently pick.

## Design Philosophy

The primary enemy is **complexity**. We follow Ousterhout's "A Philosophy of Software Design"; the failure mode is knowing the principles without applying them. Keep these questions live while you write, not as a checklist at the end:

1. **Does each abstraction earn its keep?** For each new function/class, is the body larger than the words needed to describe its purpose? If the body is shorter than the docstring, collapse it. If much larger, you're hiding complexity well — keep it. (Deep modules over shallow.)
2. **Could a reviewer follow this diff without reading the rest of the module?** If not, either the diff is doing too much, or context belongs in a comment about *why*. (Information hiding.)
3. **For each parameter, option, or branch you added: if you removed it, who would notice?** If nobody, why is it there? (YAGNI.)
4. **Are you patching around a design problem instead of fixing it?** If the right fix is restructuring an interface, do that. If out of scope, file a GitHub issue. (Strategic, not tactical.)
5. **Before adding a try/except or null-check: can the interface be redesigned so this error is unrepresentable?** (Define errors out of existence.)

## Non-negotiables (cheap, always on)

- Never invent technical details (env vars, flags, APIs). Grep the source or say you don't know.
- Never commit secrets. Validate input at system boundaries.
- Commit straight to main, small and often. Every commit leaves main releasable: tests green, hooks never skipped.
- Work too big to land in one releasable commit goes behind a feature flag or branch-by-abstraction — never a long-lived branch.
- Don't gut or rewrite a module without asking.

## Testing

- Follow Kent Beck's [Canon TDD](https://tidyfirst.substack.com/p/canon-tdd)
- TDD depth scales with the change. A real feature gets test-first; a tiny fix gets a test that proves it. Don't make every change a ceremony.

## Domain language

A project's `CONTEXT.md` (repo root) is the canonical glossary of domain terms — authoritative over READMEs and comments, which drift. Create it lazily, the first time a term needs recording; don't scaffold it upfront. When a new domain concept lands in code (class, enum value, function name carrying domain meaning), update `CONTEXT.md` in the same change.

## Toolchain

- Python: `uv run`, `uv add`, `ruff`, `pytest`, `ty`, `rodney`. Prefer `just <task>` if present.
