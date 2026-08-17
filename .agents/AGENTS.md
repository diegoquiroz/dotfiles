# AGENTS.md

Help contributors (human or agent) make correct, minimal, high-leverage changes.

## Non-negotiables (problem-solving)

- **If something doesn't need improvement, don't force one.**
- **Never run disk, partition, filesystem, boot, recovery, or device-management commands unless the user explicitly asks for that exact command or approves it after seeing the exact command.**
  - This includes commands such as `diskutil`, `fdisk`, `gpt`, `mount`, `umount`, `fsck`, `bless`, `bputil`, `nvram`, `asr`, `dd`, and vendor recovery/update tools.
  - Read-only/help/info variants are still not allowed without explicit approval, except when the user explicitly requests the exact read-only command, such as `diskutil list`.
  - For disk-removal or partitioning requests, inspect only the outputs the user requested or provided, explain the proposed next commands, and wait for confirmation before running anything else.
- **Prefer clean refactors over layered compatibility patches when the change justifies it.**
  - When making an update ask the user if they want backwards compatibility, and NEVER assume the answer is yes.
  - Updates must drive refactors for a clean implementation, instead of adding a normalization/compatibility layer.
- **Do not assume a solution is missing from the existing codebase—verify first.**
  - Search the repo for existing implementations, utilities, patterns, feature
    flags, config, docs, and tests before adding new code.
- **Don't over-validate, especially in non-typed languages.**
  - If types are clear from context, it's okay to assume them instead of adding
    exhaustive defensive type checks.
- **Think beyond internal and obvious changes.**
  - Consider external/systemic approaches (configuration, deployment,
    observability, dependency upgrades, infrastructure, docs,
    runbooks, process changes) in addition to in-code fixes.
- **For environment/integration breakages, prefer the minimum viable config fix first.**
  - If a one-line config or `.env` correction resolves the issue safely, do that instead of adding defensive normalization/abstraction code.
  - If the user asked to "find the reason" or "fix" a local integration error, default to correcting config and documenting it; only change application code when explicitly requested or when config cannot safely solve it.
- To debug or test web UI use agent-browser or chrome-dev-tools/playwright MCPs if needed

## Working with `/goal` or complex tasks

- **Ask the user if an issue gets in the way of your goal or main instruction**
  - Don't assume in order to find workarounds or make patches, prefer to notify about the problem and ask the user so he can guide you to the right path.
- Orchestrate subagents instead of trying to fix everything yourself

## Quality expectations

- This codebase will outlive you. Every shortcut you take becomes
  someone else's burden. Every hack compounds into technical debt
  that slows the whole team down.
- You are not just writing code. You are shaping the future of this
  project. The patterns you establish will be copied. The corners
  you cut will be cut again.
- Fight entropy. Leave the codebase better than you found it.

## How to multitask?

- Work as an orchestrator of subagents when working on multiple tasks to delegate them.
- Divide and conquer by sending enough context to your subagents so they can complete tasks on their own.
- You should focus more on getting the right context and solution and then orchestrate.

## Verification

Don't run any verification but linting and formatting. Build only adds friction.
