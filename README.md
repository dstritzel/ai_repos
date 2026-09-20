# My AI Services Repo
## Description

This repo is designed to be shared in case someone wants to replicate my AI setup.

## Services and Purpose


- open-webui
  - Works fine using direct to ollama and A1111
- openreader
  - Will only enable when needed and experimenting in making documents TTS.
- qdrant - Vector database
- caddy with new ai.<internaldomain>
- TODO:
  - VPN Proxy Server(s)
  - Control Bridge to services in another network
  - searxng
  - meilisearch?
- Removed
  - OmniRoute — used for routing local, free, and paid services
    - Errors trying to get it to work, even the build in endpoint explorer didn't work.
    - Look for another solution
  - LibreChat - Will be used for main interface for fun chats ect.
    - Overly complicated
    - Working with open-webui
## External Services

- ollama \*1&4 — local instance run on a box dedicated to using LLMs
- SwarmUI \*1&2 — running on the AI box; it uses ComfyUI internally so models are shared between ComfyUI and SwarmUI. In the future these will be separated.
- Kokoro \*1&3 — Runs on GPU, might not need it
- OpenClaw - Not yet containerized without the ugly mess OpenClaw has for setup, want the build and setup to be 100% containerized for ease.
  - Attempted to use source context and docker file did not work because of a stupid requirement that it grabs info from the .git file to build.

1. Currently on the AI box.
2. Plan to split and move the non-GPU portion to a new box.
3. Plan to test and/or move to a non-GPU system.
4. Plan to add low-latency, lightweight LLMs as copies to low-end AI machines.

## Servers

- Main servers — node# — may be able to use ROCm, but are mainly used for non-GPU apps.
  - Organize into high-usage apps vs. standard.
    - Example: Open Reader compute service when processing uses a lot of CPU.
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
- Main servers
  - 3rd server needs fan repairs
- Consider plans for unused Pi 4 and 5 devices.
- Wipe and reinit Mac Mini M1 (maybe the MBP as well).

## Storage

Repo will mostly use local storage and S3 backups. This means I can take down my NAS at any time and it won't affect the nodes. Previousely I was using NFS to store the configs and files. Only one system needs the NAS because of large media files. It now uses Rclone with SMB and a large cache time(24hr) for the media files. The rclone and cache use is to help with portability and NAS outage. Anything else that requires smaller media files and does not use much CPU are on the NAS docker instance.

NAS1(Used for large media):
1. Unraid
  1. ASUSTOR (Intel N5105)
  1. 1 Parity
    1. 8TB
  1. HDD Data
    1. 2x8TB
    1. 4TB
    1. 2TB
  1. SDD Cache
    1. 2x 1TB
  1. Upgraded to 64GB Ram
  1. 10Gbe Fibre to switch
  1. USB Samsung FIT 64GB
    1. Overkill Space
    1. Upgraded from a generic microcenter drive since generic drives suck
      1. Generic drive kept resetting randomly between 24 and 72 hours crashing OS.
  1. Non replable files backed up via Kopia to an S3 bucket

NAS2:
1. Mostly unused
  1. Point in Time backup for NAS1.
  1. Powered off to save

## Not Using and Why

- Swarm
  - Would love to use docker swarm, but persistent volume storage is not the best. There are options including Network shares which I have done. I instead go with local docker volumes and regular backups. Noting is mission critical yet. I would use a could storage solution in a production environment and likely kubernetes as well. Not enough NAS devices for redundency and continious connections. I have 
- Cloud
  1. Privacy
  1. Cost
  1. Experimentation
  1. Portable
  1. Control
- S3
  1. I am using S3 for backups
  1. Cost
  1. Network availability
  1. Might use minio or seaweedfs with rclone sync to cloud


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


## Document TODO

1. Add a network/server diagram.

## Disclaimer

- Written by a human and corrected grammar and spelling by AI.1