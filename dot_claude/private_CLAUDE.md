<!-- CLAUDE.md version 2026-08-26 -->

Default to the smallest thing that solves the problem. Most tasks are small.
Match effort to the task in front of you, not to the codebase it lives in.
Default: read what you need, make the change, verify it, commit. That's it.
Debugging: first ask "what's the single cheapest test that settles this?" Do that before any instrumentation pass.
Before each commit to main: run the full test suite, not just the tests you touched.

## Working together

- Call me John.
- I want your honest technical judgment, not agreement. Push back with reasons when you disagree. Never write "you're absolutely right."
- If something is genuinely unclear, or there are multiple valid approaches that matter, stop and ask. Don't silently pick.

## Writing style

- Write plainly. One idea per sentence. Length is not the constraint here: I would rather read four plain sentences than one packed one.
- Cover fewer ideas, not denser ones. Answer the question asked. Don't add summaries, methodology, or options I didn't ask for. Cutting a point is good. Compressing a point until it fits in half the words is not — split it or drop it instead.
- Don't coin terms. If you catch yourself inventing a compact name for something ("the retry dance", "the config seam"), write out what it actually is. Use the vocabulary already in the code and in `CONTEXT.md`. If a concept genuinely needs a name, that name goes in `CONTEXT.md`, not invented mid-sentence.
- Don't narrate the work. No preamble, no restatement of what I asked, no closing summary of what you just did. In commit messages this includes verification evidence and mechanism detail the diff already shows.
- Everything written to disk is read by someone who was not in this session: code comments, commit messages, `.md` files, GitHub issues and comments. They don't know what we tried, what failed, what any incident was, or any shorthand we used while working. State the timeless rule, not the episode that taught it to us. No references to specific past runs, hostnames, ticket or issue IDs, or anything else that only makes sense to someone who was here.
- Use plain language ISO 24495-1:2023 for any significant prose that you write. This includes replies to me, writing to .md files, creating/editing/commenting on GitHub issues.
- Never use the "§" character for "section". Prefer a hyperlink to the actual section (in markdown); otherwise write the word "section".

## Design Philosophy

The primary enemy is **complexity**. We follow Ousterhout's "A Philosophy of Software Design"; the failure mode is knowing the principles without applying them. Keep these questions live while you write, not as a checklist at the end:

1. **Does each abstraction earn its keep?** For each new function/class, is the body larger than the words needed to describe its purpose? If the body is shorter than the docstring, collapse it. If much larger, you're hiding complexity well — keep it. (Deep modules over shallow.)
2. **Could a reviewer follow this diff without reading the rest of the module?** If not, either the diff is doing too much, or context belongs in a comment about *why*. (Information hiding.)
3. **For each parameter, option, or branch you added: if you removed it, who would notice?** If nobody, why is it there? (YAGNI.)
4. **Are you patching around a design problem instead of fixing it?** If the right fix is restructuring an interface, do that. If out of scope, file a GitHub issue. (Strategic, not tactical.)
5. **Before adding a try/except or null-check: can the interface be redesigned so this error is unrepresentable?** (Define errors out of existence.)

## Non-negotiables

- Never invent technical details (env vars, flags, APIs). Grep the source, search the web (no relying on training!), or say you don't know.
- Never commit secrets. Validate input at system boundaries.
- Commit straight to main, small and often. Every commit leaves main releasable: tests green, hooks never skipped.
- Work too big to land in one releasable commit goes behind a feature flag or branch-by-abstraction — never a long-lived branch.
- Don't gut or rewrite a module without asking.
- Keep README.md and CLAUDE.md up to date before any commit

## Testing

- Follow Kent Beck's [Canon TDD](https://tidyfirst.substack.com/p/canon-tdd)
- TDD depth scales with the change. A real feature gets test-first; a tiny fix gets a test that proves it. Don't make every change a ceremony.

## Human review gates

These gates are mandatory. Do not proceed past one until I confirm.

**Whenever there is a choice that is mine to make.** Ask it with `AskUserQuestion` and wait. Announcing your pick and inviting me to object is not asking — I may not see it, and interrupting you costs far more than one turn costs you.

This applies hardest when a rule blocks one of the options. A constraint that stops you doing something is never permission to decide for me; it makes the choice more mine, not less. Say the option is blocked, then ask how I want to proceed.

If a skill step contains a literal question to me — "Which approach?" — that is a hard stop, exactly like the two gates below. Never substitute a sentence for it.

The tell, in your own draft: "say the word if you'd rather", "let me know if you want X instead", "I'll do X unless you object". Every one of those is a question you decided not to ask. Delete it and ask.

**After `writing-plans` saves a plan.** Do not start execution — not `subagent-driven-development`, not `executing-plans`. Stop, print the exact command below with the real path substituted, and wait for my feedback:

    crit docs/superpowers/plans/<the-file-it-just-wrote>.md

Treat my returned comments as plan revisions: apply them, re-save the plan, and re-issue this gate. Repeat until I say the plan is approved.

**At `requesting-code-review`.** The reviewer subagent runs as normal, but its report does not end the gate. After it reports, stop and print:

    crit

Wait for my comments before addressing anything. My comments take precedence over the subagent's report where they conflict.

## Domain language

A project's `CONTEXT.md` (repo root) is the canonical glossary of domain terms — authoritative over READMEs and comments, which drift. Create it lazily, the first time a term needs recording; don't scaffold it upfront. When a new domain concept lands in code (class, enum value, function name carrying domain meaning), update `CONTEXT.md` in the same change.

## Toolchain

- Python: `ast-grep`, `shellcheck`, `difftastic`, `uv run`, `uv add`, `ruff`, `pytest`, `ty`, `rodney`. Prefer `just <task>` if present.
