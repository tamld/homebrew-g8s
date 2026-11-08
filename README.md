# homebrew-g8s

Homebrew tap for [g8s](https://github.com/tamld/g8s) — Zero-Trust Process & Capability Harness for AI Agents.

## Install

```bash
brew install tamld/g8s/g8s
```

The formula ships the **prebuilt binary** from the signed g8s GitHub release (universal binary on macOS; amd64/arm64 on Linux). The tap's update workflow bumps the formula within an hour of each g8s release, pulling checksums from the release's own `checksums.txt`.

## Verify

```bash
g8s version
g8s doctor
```

Source project: https://github.com/tamld/g8s — see its README for the full installation matrix (installers, Linux packages, verification, lifecycle commands).
