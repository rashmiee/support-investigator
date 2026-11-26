# Support Investigator

A support inbox where an AI agent does the first investigation of a customer ticket, and a person stays in charge of the answer.

When a ticket arrives, the agent reads it and runs read-only SQL against the product's database to find out what actually happened. Every step it takes is saved and shown on the ticket. It finishes with a cause, the rows that back it up, and a draft reply. Nothing goes to the customer until a support person approves or edits it.

Status - just started. The plan is in [ROADMAP.md](ROADMAP.md) and the choices behind it are in [DECISIONS.md](DECISIONS.md).

## Why

Most support tickets for a SaaS product are answered by looking things up. Someone reads the ticket, opens the database or an admin page, works out why the customer saw what they saw, and writes it up in plain words. The looking up is slow and repetitive, but the answer still has to be right. So the agent does the looking and a person keeps the decision.

## How it will work

1. A ticket comes in for one customer account.
2. A background job starts an investigation. The agent has two tools. One describes the tables it may read. The other runs a single read-only query.
3. Each step is saved with its SQL and the rows that came back, and appears live on the ticket page.
4. The agent ends with a cause, the evidence and a draft reply.
5. A person approves, edits or rejects the draft.

## What has to be true

- The agent cannot change data and cannot read another customer's rows. Queries run under a read-only database role with row-level security, a statement timeout and a row limit. That holds even when the model writes a bad query or the ticket text tries to trick it.
- It is measured. The repo ships with seeded scenarios where the cause of each ticket is known, and an eval run reports how often the agent finds it, what a ticket costs and how long it takes.
- Every finding shows its work, with links to the queries and rows behind it.
- Cost is visible. Tokens and cost are recorded for each step and each ticket.

## The demo product

The agent needs a product to investigate. The repo includes a small booking database for a driving school, with instructors, students, cars, lessons and availability. A typical ticket is "why can't I book Saturday at 10 with Sam?".

## Stack

Ruby on Rails, PostgreSQL, Hotwire, Solid Queue, RSpec, and Claude through the Anthropic API.

## License

MIT
