# World 1-1

Evaluate your product's first-time user experience the way Super Mario Bros. World 1-1 teaches players everything in its first level -- by doing, not by reading.

In World 1-1, you learn every move you need to beat the entire game. This skill applies that same lens to your product: by the time a new user finishes their first session, have they learned every move they need to accomplish the product's most important goals? And did they learn by doing?

## Add to your project

Copy the skill into your project's `.claude/skills/` directory:

```bash
git clone https://github.com/alt-ai-technologies/world-1-1.git /tmp/world-1-1
cp -r /tmp/world-1-1/skills/world-1-1 .claude/skills/world-1-1
```

Or just copy the `skills/world-1-1/` folder manually into `.claude/skills/`.

## Usage

Run inside any project with a frontend codebase:

```
/world-1-1                    # full review (requires codebase)
/world-1-1 /your-route        # start from a specific page
/world-1-1 "sharing"          # focus on a specific mechanic
/world-1-1 walkthrough        # screenshot-based review (no code needed)
```

The review walks through your first-session user flow and produces a coverage report:

- ✅ **Taught by design** — the user learned by doing
- ⚠️ **Taught by words** — a tooltip or label had to explain it
- ❌ **Never taught** — the user will need this later but never saw it
- 🌉 **Bridge in place** — not taught yet, but a pattern was established that will make it learnable later
- 🔇 **Taught but never needed** — clutter

## How it works

**Code mode** (`/world-1-1`): Reads your codebase and traces through the actual screens a new user encounters. It identifies every "move" (distinct action) your product requires to achieve your product's most important goals, then checks whether your first session teaches each one; and whether it teaches through design or through words.

**Walkthrough mode** (`/world-1-1 walkthrough`): For products you don't have code access to. You feed screenshots one at a time, and Claude plays the confused new user — saying what it sees and what it would tap *before* you show it what's next.

It's opinionated. Words are a failure of design. If you have to explain it, the level is wrong.

## Example

See a [full walkthrough of Spotify's first-time experience](examples/spotify-walkthrough/walkthrough.md) to see what a World 1-1 review looks like in practice.

## License

MIT
