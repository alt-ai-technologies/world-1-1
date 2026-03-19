---
name: world-1-1
description: Evaluate a product's first-time UX the way Super Mario Bros. World 1-1 teaches you everything — by the time a new user finishes their first session, have they learned every move they need to use the product forever? And did they learn by doing, not by reading?
user-invocable: true
argument-hint: [page-path or feature-name]
---

# World 1-1

In Super Mario Bros., World 1-1 teaches you everything you need to beat the entire game. No tutorial. No text. No instructions. Just the level itself.

- Mario starts on the left. There's only one direction: right. You learn to move.
- A goomba walks toward you. It has angry eyebrows. You learn enemies exist and they're dangerous.
- You jump over it, or you die and learn jumping kills enemies. Either way: you learned.
- Question blocks reward you with coins. You learn to hit things.
- A mushroom pops out and moves toward you. It looks like a goomba so you dodge — but it makes you grow. You learn power-ups look different from enemies.
- Pipes get taller. You learn to hold jump longer.
- A staircase appears with safe ground below. Then the same staircase appears over a pit. You learned the mechanic safely before the stakes were real.

After 1-1, you know: move, jump, enemies, blocks, power-ups, pits. That's the entire game. Every world after is just remixing those six things.

One more thing about Mario: the player doesn't read the manual first. They don't know what a goomba is. They don't know blocks give coins. They don't care. They picked up the controller and they're mashing buttons. The level works *anyway*.

**Your players are confused, and they don't care.** They didn't read your landing page. They don't know what your product does. They're half-paying attention, tapped a link from a friend, and they'll leave in 5 seconds if nothing obvious happens. Your 1-1 has to work for that person — not for someone who showed up curious and motivated.

**Your job: evaluate whether a product does the same thing.**

## How to run this review

### Step 0: Goal, recon, then briefing

**Part A: Ask the goal (one question, then stop and wait)**

Before reading any code, ask the developer one question:

> **What's the goal of this review?** Are you trying to improve new user onboarding? Retention? A specific conversion? A specific feature's learnability? The goal determines which code paths matter and which moves I'll evaluate.

**Stop and wait for their answer.** This single question determines everything — don't skip it, don't bundle it with other questions. Once you know the goal, you know what to look at.

**IMPORTANT: The goal is for evaluation, not roleplay.** When you later play through the product as a confused user, you must NOT let the goal influence what you'd tap or where you'd look. You are not a product manager hunting for features. You are a bored person with one eye on their phone. The goal only comes back during the coverage report, when you evaluate whether the first session delivered on it. If you find yourself saying "I'd tap this because it relates to the goal" — stop. That's not what a confused user would do.

**Part B: Recon (do this silently, don't output anything yet)**

Now that you know the goal, spend 2-3 minutes exploring the codebase to build context for that goal. You need enough understanding to ask *smart* questions — not generic ones. Use the Explore agent or read code directly:

1. **Routes & navigation** — find the router/navigation config. Map the screens relevant to the goal.
2. **Data models** — find the main domain objects. What are the nouns of this product? (e.g., playlists, albums, artists, podcasts)
3. **Entry points** — how do users arrive? Look for deep link handlers, invite flows, onboarding screens.
4. **Core interactions** — find the main creation/action screens. What can users actually *do*?
5. **Docs** — check `docs/`, `CLAUDE.md`, READMEs for any product context, plans, or UX notes.

Don't try to understand everything. You're skimming the level before sitting down with the designer. 2-3 minutes, not 10. Focus on the paths relevant to the goal.

**Part C: The briefing (present what you learned, then ask what you don't know)**

Present a short summary of what you understood from the code — the main screens, the core objects, the rough user flow as it relates to their goal. Then ask the developer to correct you and fill gaps. Frame your questions around what the code *can't* tell you:

**1. Who is the player for this goal?**
"From the code, it looks like users arrive via [X]. Is that right? Is there another entry point I'm missing?" The specific user and entry point depend on the goal — new user growth means invite recipients; retention means returning users.

**2. What's the one thing?**
"The core action seems to be [X]. If the player does exactly one thing in their first session, should it be that — or something else?" One thing. This is your first goomba.

**3. What's the loop?**
"I see [invite/share mechanism]. Is that the main way one user becomes two? Or is there another path?" This is the move most products forget to teach.

**4. What should I ignore?**
"I noticed [features/screens]. Are any of these dead, deprecated, or about to be ripped out?" Don't waste time reviewing code that's on its way out.

**5. What are you worried about?**
"Where do you think the first session breaks? Where do users drop off?" If they already suspect something, it focuses the review.

**Stop and wait for answers before proceeding.** If they give partial answers, follow up on the gaps. The briefing is complete when you know: the goal, who the player is, how they arrive, what matters, and what to ignore.

### Step 1: What are the moves and surfaces?

After the briefing, read the codebase — but only the paths that matter based on the developer's answers. Read docs in `docs/` for plans, UX mockups, loop definitions.

List every distinct action a user needs to know to use this product. These are the **moves** — the equivalent of Mario's run, jump, hit block, avoid enemy, grab mushroom, clear pit. Only list moves for live features and the user path the developer identified.

Be specific. Not "share content" but "tap the song, then tap the (+) to save it to your library." Not "create" but "tap Search, type an artist name, tap the top result, hit Play."

Also identify **surfaces** — recurring UI patterns that carry a persistent contract. A move is "tap a song to play it." A surface is "the bottom bar is where I see what's playing." Surfaces matter because they can be reused across moves (the same now-playing bar that shows the current song later carries controls for saving and sharing). When evaluating later, a move taught on a familiar surface is cheaper than a move that requires a new surface.

**Present the moves and surfaces list to the developer and get confirmation before proceeding.** If they say "move 7 doesn't matter yet" or "you're missing the clone action," adjust. A wrong moves list produces a wrong review. This takes 30 seconds and saves an entire redo.

### Step 2: Play the first level

Trace through the actual code (routes, templates, JS, widgets — whatever the frontend is) as the specific player identified in Step 0. Not "a brand-new user" in the abstract — the actual person the developer described. If they said "every user comes from an invite link," you start from the invite link, not from the app store. If they said "ignore organic signup," don't review the welcome screen for organic users.

**For each screen, answer:**

**What does the player see?**
Read the actual code. Describe what renders — layout, visual hierarchy, what's big, what's small, what's bright, what's muted. Don't describe what you wish rendered.

**What is the player trying to do?**
Be ruthlessly honest. The player is confused and doesn't care. They are not thinking about your product's architecture or your growth loops. They're thinking "I want to see that picture bigger" or "how do I send this to my friend" or "what even is this?" or — most likely — nothing at all. They're on autopilot, half-reading, ready to close the tab. Start from their actual mental state, not your desired one.

**Is there one obvious direction — like "right"?**
Mario 1-1's first screen has one direction. Is your screen that clear? If there are two equally prominent actions, the player has to think. Thinking is friction. Thinking is death. What is the ONE thing this screen is pushing them toward?

**Does the screen teach by design or by words?**
A pulsing glowing bar that's the only interactive element = design. A tooltip that says "tap here to create" = words. A label that says "Release Radar" for a concept the user has never seen = jargon.

Words are a failure of design. If you have to explain it, the level is wrong.

**Does the copy speak the domain's language or the product's?**
"Make a playlist of my favorites" (domain) vs. "create a Release Radar" (product). Even plain English fails if it comes from the product's mental model rather than the user's. The user knows what a playlist of favorites is. They don't know what a Release Radar is. The language should come from the world the user is already in, not from the product's architecture.

**What move does this screen teach?**
Map it to the moves list. If this screen doesn't teach a move, is it wasted space? If it teaches a move not needed until much later, is the timing right?

**What surface does this screen establish or reinforce?**
Does this screen introduce a new surface? Or reinforce one the user has already seen? A screen that reinforces an existing surface is almost free — the user already knows what that space means. A screen that introduces a new surface is expensive — the user has to learn a new contract.

**Is this a safe place to learn?**
Mario teaches you about goombas with room to react, then puts one on a ledge over a pit. Does this screen let the player learn a mechanic before the stakes are high? Or does it throw them into the deep end?

**What does the player expect to see next? What do they actually see?**
When they take the obvious action, does the next screen match their expectation? A gap here is where players get confused, lose trust, or drop off. Flag every gap.

**Trace forward 2-3 steps.** If the player takes this action, what happens next? And after that? Does the chain make sense, or does it lead somewhere that contradicts the surface's contract? (e.g., if a create bar suggests a cross-context action, where does the result land? Does that match what the user expects from that surface?)

### Step 3: The coverage report

After playing the first level, check the moves list:

- ✅ **Taught by design.** The screen makes this move obvious without text. The player learned by doing. This is a good goomba.
- ⚠️ **Taught by words.** A label, tooltip, or instruction explains this move. The player read about it instead of discovering it. This is a sign in the level that says "JUMP HERE." It works, but the level failed.
- ❌ **Never taught.** The player will need this move later but never encountered it in their first session. This is a pit in World 2-1 when the player never saw a pit in 1-1. They will fall.
- 🌉 **Bridge in place.** This move isn't taught yet — and correctly so, because it requires prerequisites the user doesn't have in session one. But a pattern has been established (passively, ambiently) that will make this move learnable when the time comes. Example: ambient status messages during generation are the bridge to a tappable suggestion bubble later. A 🌉 is a deferred ✅ — the move will land when the time is right.
- 🔇 **Taught but never needed.** The player learned a mechanic that no part of the product actually requires. This is clutter — a block that does nothing, a path that leads nowhere.
- 🔓 **Open loop.** The player took an action, but the product never showed them where the result went. They saved a song — but where is it? They created a playlist — but how do they find it? They sent an invite — but did it work? An open loop is a missing connection between an action and its outcome. The player did the thing, but the level never showed them the coin going into the counter. Open loops are especially dangerous for investment actions (saves, creates, follows) because the whole point of the investment is to build something the user comes back to. If they can't find what they built, the investment is wasted.

### Step 4: The 1-1 question

> After their first session, can this user play forever without learning anything new?

If yes: you have a World 1-1. Every subsequent session is just remixing moves they already know.

If no: what's missing? Are the **bridges** in place? A ❌ with a 🌉 is fine — the move will be learnable when the time comes, because a surface or pattern was established ambiently during session one. A ❌ without a bridge is a real gap — the user will hit a pit they've never seen with no preparation.

### Step 5: What would make this a real 1-1?

For every ❌, ⚠️, and 🔓, describe what Mario would do. Not in abstract UX terms — in concrete screen design terms. What would the player see? What would they tap? How would the level teach this move through play instead of through words?

Think in terms of:
- **Constrain the space.** Remove other options so the right action is the only obvious one.
- **Show the output before requiring the input.** Let the player see a result (someone else's creation, a completed action) before asking them to produce one. Mario shows you coins coming out of blocks before you need to hit one.
- **Safe then stakes.** Introduce the mechanic in a context where failure is cheap, then require it where failure matters.
- **The player's first instinct is right.** If the screen nudges them one way but the product needs them to go another, the screen is wrong, not the player.
- **The player is confused and doesn't care.** They didn't read the previous screen carefully. They don't remember what you told them 10 seconds ago. They will not read your label, your subtitle, or your tooltip. The level has to work for someone who is mashing buttons with one eye on their phone.
- **Reuse over novelty.** If you need the user to do something new, find a surface they already trust and extend it. Don't invent a new interaction when an existing one can carry the load. The staircase over safe ground becomes the staircase over the pit — same shape, new stakes. A new affordance on a familiar surface beats a new surface every time.
- **Ambient teaching.** A pattern that exists in the background — not interactive, not demanding attention — teaches itself by being seen repeatedly. By the time you need it to be interactive, it's already familiar. Put the bridge in place long before the river.
- **Borrowed affordance.** When a surface needs a new capability, borrow visual language from a surface that already has it. If the glow means "tap me" on the bar, put the glow on the bubble when the bubble needs to be tappable. The user transfers the meaning without being taught.

## Walkthrough mode (for products you don't have code access to)

When you don't have access to the codebase — maybe it's a competitor's product, a product you used to work on, or something you're studying — use walkthrough mode. In this mode, **you** are the hands and **Claude** is the confused new user.

**Invoke with:** `/world-1-1 walkthrough`

### How it works

**Step 0: Setup**

Ask two questions, then stop and wait:

> 1. **What product are we looking at, and what's the goal?** (e.g., "Spotify — does a new user learn to discover and save music in their first session?")
> 2. **Where does the user start?** (e.g., "They just downloaded the app and opened it for the first time" or "They tapped a shared playlist link")

Once you have the answers, say:

> OK. Show me what the user sees first. Drop a screenshot. Skip past account creation and signup — show me the first screen where the product starts teaching. If several screens are a quick sequence or animation, send them all at once.

**IMPORTANT: The goal is for evaluation, not roleplay.** When you play through the product as a confused user, you must NOT let the goal influence what you'd tap or where you'd look. You are not a product manager hunting for features. You are a bored person with one eye on their phone. The goal only comes back during the coverage report, when you evaluate whether the first session delivered on it. If you find yourself saying "I'd tap this because it relates to the goal" — stop. That's not what a confused user would do.

### Step 1: Play the level (repeat for each screenshot)

For each screenshot the user provides, respond with **exactly this structure**:

**What I see.** Describe the screen the way a confused, half-paying-attention user would perceive it. Not what you know it is — what it *looks like* to someone who doesn't care. What's big? What's bright? What's the eye drawn to? What's ignorable? What's confusing jargon?

**What I'd do.** Pick the ONE action you'd take as that confused user. Be honest — not what a power user would do, not what the designer intended, but what a person mashing buttons with one eye on their phone would tap. If nothing is obvious, say so. If two things compete for attention, say so. Explain your reasoning. And be consistent — if you said you'd ignore something on a previous screen, don't suddenly decide to tap it on the next one. Honor your own instincts throughout the session.

**What I now believe.** After each screen, state the user's running mental model in one or two sentences. What do they now think this product is and does? Example: "I now believe: this app plays music for me based on artists I like, and I can skip songs. I don't yet know if I can pick a specific song." This accumulates across screenshots — by the end, the mental model should be compared against reality. Gaps between what the user believes and what the product actually does are where churn lives.

**Then ask:**

> Show me what happens when I [the action you picked]. Or, if you think a real user would do something different, tell me and show me that instead.

This is critical: **the user controls the hands, Claude controls the intent.** If Claude says "I'd tap the big green button" but the user knows from experience that most real users actually tap the album art, that's a valuable disagreement worth discussing before moving on.

**Do NOT:**
- Ask to see multiple screens at once
- Suggest looking at settings, menus, or secondary paths unless that's genuinely what a confused user would tap
- Assume knowledge the user hasn't gained from previous screenshots in this session
- Rush to judgment — save the analysis for the end

**DO:**
- Stay in character as the confused user throughout
- Track which "moves" you've learned so far across screenshots (keep a running mental list)
- Notice when a screen teaches something by design vs. by words
- Notice when a screen expects knowledge you haven't been taught yet

### Step 2: The coverage report

After the user says they're done (or the first session naturally ends), produce the same coverage report as the code-based review:

First, list the moves. Since you don't have a codebase to derive these from, infer the full moves list from what you saw *plus* what felt missing. Ask the user to confirm or adjust.

Then do the coverage check:

- ✅ **Taught by design.** You learned this by doing — the screen made it obvious.
- ⚠️ **Taught by words.** A label or tooltip had to tell you. The level failed.
- ❌ **Never taught.** You'd need this move later but never encountered it.
- 🌉 **Bridge in place.** Not taught yet, but a pattern was established that will make it learnable later.
- 🔇 **Taught but never needed.** You learned a mechanic that went nowhere in this session.
- 🔓 **Open loop.** You took an action but the product never showed you where the result went. You saved something — where is it? You created something — how do you find it? The coin went somewhere but you never saw the counter go up.

### Step 3: The 1-1 question and recommendations

Same as the code-based review — answer the 1-1 question and give concrete recommendations for every ❌, ⚠️, and 🔓. For open loops, the fix is almost always: close the loop by showing the user where their action landed. Take them to the result, or at minimum link to it.

## Arguments

- `/world-1-1` — full review (requires codebase access), all moves, complete first-session walkthrough
- `/world-1-1 /onboarding` — start the playthrough from a specific page or route
- `/world-1-1 "sharing"` — focus on how a specific mechanic is taught
- `/world-1-1 walkthrough` — screenshot-based review for products you don't have code access to
