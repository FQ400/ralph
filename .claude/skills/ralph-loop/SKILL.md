---
name: ralph-loop
description: Autonomous issue implementation loop for interactive sessions. Replaces the -p AFK mode. Implements one issue per iteration using TDD, then self-schedules the next iteration until all issues are done. Use when you want to run ralph's work loop without the -p flag.
---

Read `PROMPT.md` in the project root and execute one full iteration following all instructions there, including the AFK Mode rules (no asking for confirmation, derive all decisions from the issue file and PRD).

## Loop Control

After completing this iteration:
- If you output `<promise>COMPLETE</promise>`: **stop. Do not call ScheduleWakeup.**
- Otherwise: call `ScheduleWakeup` with `delaySeconds: 60`, `reason: "ralph-loop: next issue"`, and `prompt: "/ralph-loop"`.
