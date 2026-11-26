# Roadmap

Ten slices. Each one is small, ends with passing tests and leaves the app working. A slice is finished when its check passes, not when the code exists.

- [ ] **1. Walking skeleton.** A Rails app with a ticket inbox that lists seeded tickets, and tests and lint running in CI. Done when a system spec opens the inbox and sees the seeded tickets, CI is green and the README shows how to run it locally.
- [ ] **2. Demo product and scenarios.** The driving-school tables, plus a scenario builder that plants one known cause (for example, the car is already booked) and writes the matching ticket. Done when a plain SQL check proves, for every scenario, that the planted cause is true in the data.
- [ ] **3. Safe query tool.** One method that runs model-written SQL for one account, under a read-only role, as a single SELECT, with a statement timeout, a row limit and row-level security. Done when specs show it refuses writes and multiple statements, cannot return another account's rows and stops a slow query.
- [ ] **4. First model call.** Category and urgency for a new ticket as structured output, behind a small client interface with a fake for tests. It runs on a free open model on the same machine through Ollama, and the model is set in config. Tokens and time are saved for every call. Done when the specs pass against the fake and one real call is recorded and replayed in CI.
- [ ] **5. Investigation loop.** The agent calls the schema and query tools until it reaches a conclusion or runs out of budget. Every step is saved, and the run happens in a background job. Done when specs with a scripted model cover a normal run, a tool error, the step limit and the token limit.
- [ ] **6. Live timeline.** The ticket page shows each step as it happens, with the SQL and the rows. Done when a browser spec sees steps appear without a reload and a failed run shows why it failed.
- [ ] **7. Finding, draft reply and approval.** A run ends with a cause, its evidence and a draft reply. A person approves, edits or rejects it, and that is recorded. Done when specs show nothing can be marked as sent without an approval and every finding links to real steps.
- [ ] **8. Evals.** A command runs every scenario and reports cause accuracy, evidence validity, tokens and time per ticket, for each model tried. CI runs a small recorded set. Done when the report is in the repo and the README shows the first numbers.
- [ ] **9. Hardening.** Tickets that attempt prompt injection, model errors and timeouts, and jobs that are safe to retry. Done when the injection scenarios pass in the eval and a retried job does not duplicate steps.
- [ ] **10. Polish.** Screenshots and a short screen recording in the README, an architecture note, and setup in one command. Done when a stranger can understand the project from the README in two minutes and run it locally with `bin/setup`.

## Later, maybe

- Point the agent at a real Lessonlane database instead of the demo one.
- Search past tickets for similar cases.
- Redact personal data in tool results before the model sees them.
