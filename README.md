# Homebrew Tap for Ruflo

[Ruflo](https://github.com/ruvnet/ruflo) is an enterprise AI orchestration platform for Claude.

## Prerequisites

Ruflo requires [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Install it however you prefer:

```bash
brew install --cask claude-code   # via Homebrew
```

or follow the [official install instructions](https://docs.anthropic.com/en/docs/claude-code).

## Install

```bash
brew tap vincent-r-kennedy/ruflo
brew install ruflo
```

## Migrating from npm/npx

If you already have ruflo installed globally via npm:

```bash
# Remove the existing global install
npm uninstall -g ruflo        # or: npm uninstall -g claude-flow

# Install via Homebrew
brew tap vincent-r-kennedy/ruflo
brew install ruflo

# Verify
ruflo --version
```

Your existing project configurations and data are unaffected — only the CLI binary is replaced.

> **Note:** Homebrew installs core dependencies only. If you use optional features,
> run `ruflo init --wizard` after installing to set them up.

## Update

```bash
brew update && brew upgrade ruflo
```

## Uninstall

```bash
brew uninstall ruflo
brew untap vincent-r-kennedy/ruflo
```
