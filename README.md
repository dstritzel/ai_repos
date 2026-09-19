# My AI Services Repo
## Description

This repo is designed to be shared in case someone wants to replicate my AI setup.

## Services and Purpose

- OmniRoute — used for routing local, free, and paid services

## External Services

- ollama \*1&4 — local instance run on a box dedicated to using LLMs
- SwarmUI \*1&2 — running on the AI box; it uses ComfyUI internally so models are shared between ComfyUI and SwarmUI. In the future these will be separated.
- Kokoro \*1&3 — Runs on GPU, might not need it

1. Currently on the AI box.
2. Plan to split and move the non-GPU portion to a new box.
3. Plan to test and/or move to a non-GPU system.
4. Plan to add low-latency, lightweight LLMs as copies to low-end AI machines.

## Servers

- Main servers — node# — may be able to use ROCm, but are mainly used for non-GPU apps.
  - Organize into high-usage apps vs. standard.
    - Example: Open Reader compute backup when processing uses a lot of CPU.
- AI box — thinker (Spark DGX 128GB UM - GB10)
  - Box needs dusting; it gets very hot.
- Temp box?
  - Windows with RTX 4080 16GB
    - Sometimes faster than the AI box with smaller LLMs.
    - Used for gaming, so AI usage in the background would not be ideal.
    - Might avoid using it for AI — not as power- or heat-efficient.
- Low-need AI devices
  - Mac Mini M1 (8GB UM)
  - MacBook Pro M1 Ultra (32GB UM)*
    - This is a travel device; using it recklessly would not be ideal (heat, etc.).

All boxes except the desktop might be considered ~low-powered~, but if a high-powered box is needed (like the desktop) it might be a toggleable instance in the API.

TODO:
- Main servers: repair 3rd node server and look into 4th usage.
- Consider plans for unused Pi 4 and 5 devices.
- Wipe and reinit Mac Mini M1 (maybe the MBP as well).

## Networking

Currently:
- Uses both `ai_network` and `homelab` on the main server network.

TODO:
- Make some resources dedicated to AI only: agents, databases.
- Create a new VLAN that is AI-only.
- Create a routing plan for VPN/proxy; OmniRoute will help with this.
 
## Projects and Ideas

- Add an AI workflow that tests if an image is NSFW or illegal and flags it.
  - This might not be possible — you don't want to download illegal material as training data. NSFW detection might be feasible.
- Get OpenClaw to do something for me. Brainstorm and write it down.

## Special Notes

These are **some** general notes everyone should follow for responsible AI usage.
- Know exactly what your agents can do and what they have access to. Humans should be responsible for keeping AI in check. This repo/author is not responsible for users who do not manage their own AI.
- Log all outgoing connections and web calls so we can determine if the AI is going where it shouldn't.
- AI does not replace humans; it augments them. It is the same as a keyboard/mouse.
- AI is not artificial sentience (yet?). Do not get emotionally attached to it.
  - Note: with my autism it would be nice to have a conversation with the AI to practice my speaking to others. (dstritzel)
- All code written by AI needs to be reviewed by a competent human. AI will always make mistakes, include unnecessary code, or use placeholders.
- Scraping the public web is theft of work. Free use is fine for informational purposes, but we cannot sell what is scraped. Trillions of hours of human work — pictures, programming, and writing — are out there for informational use and interpretation. Just stealing it and selling it to others is wrong.
- AI as of 2026 is not a true artificial intelligence. It is a token-inference system; it cannot think on its own.

## Thoughts

Basically a rant and my thoughts on AI. Moved to its own file. Not everyone is interested. [THOUGHTS](THOUGHTS.md)

## Disclaimer

- Written by a human and corrected grammar and spelling by AI.