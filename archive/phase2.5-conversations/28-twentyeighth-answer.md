Completely self-contained. Commander receives: what the folder is, what it's doing, who it is, the exact execution sequence (13 steps), the exact content of every config file to create, the version-resolution rules with acceptance criteria, the classification table for unaccounted files, the verification checks to run before committing, and three explicit prohibitions (don't push, don't create the state-of-institution doc, don't do any work beyond reorganization).

The prompt is ~350 lines. That's substantial but necessary — a stateless agent executing a complex filesystem reorganization with classification judgments needs the full spec in the prompt. Claude Code's context window handles this comfortably.

One operational note: you'll want to provide `SYNCRESCENDENCE-STATE-OF-THE-INSTITUTION.md` separately after the commit if you want it in the repo. I excluded it from Commander's creation responsibilities because it references the full three-thread arc — context Commander doesn't have and shouldn't fabricate.

Point Claude Code at the folder. Paste. Let it run. Review the diff before approving. That's the whole interaction.