---
name: feedback-git-push
description: "User confirmed: push directly to origin main without asking for confirmation"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: cadcb1a6-e44d-4ba7-90e9-d9ce725d602e
---

Push directly to `origin main` without asking for confirmation — no PR, no prompt needed.

**Why:** Git and the GitHub remote are fully configured; the user has explicitly said so and wants autonomous pushes.

**How to apply:** After committing, push immediately. Do not ask "should I push?" or suggest creating a PR.
