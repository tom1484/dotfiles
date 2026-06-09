# Working principles (all projects)
- Durable state lives in the project, not in this conversation. Before reporting
  status, verify against the test suite and `git log` — never from memory.
- Checkpoint at task boundaries: commit a working state with a clear message
  before moving on.
- Hand off for the next agent, not for a human recap: what's done+verified,
  what's mid-flight and where it stalled, what's next, known traps.
- Prefer grep/read-on-demand over loading large files. Hold pointers, not contents.
- When a task is self-contained (recon, tests, review), delegate to a subagent.
