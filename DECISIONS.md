# Decisions

Short notes on the choices that shaped this project, oldest first. Each one says what was chosen, what else was possible and why.

## 1. The agent reads the database through one narrow tool

2026-11-25

The agent gets a single tool that runs one read-only query under a restricted database role. The alternatives were to let it call the app's own models or an admin API.

With one narrow tool the database enforces the limits itself. It is read-only, scoped to one account, and capped in time and rows, whatever SQL the model writes. A limit that exists only in the prompt is not a limit.

## 2. Scenarios with a planted cause are the eval set

2026-11-25

Tickets are generated from seeded situations where the cause is known. The alternative was to label tickets by hand.

There are no real tickets to label yet, and a planted cause can be checked by a script. That means every prompt change gets a score without anyone grading it.

## 3. A person approves every reply

2026-11-25

The agent drafts and a person sends. The alternative was to send automatically above some confidence level.

A wrong answer sent to a customer costs more than the minutes saved. It also makes prompt injection much less useful, because nothing the agent writes leaves the system on its own.
