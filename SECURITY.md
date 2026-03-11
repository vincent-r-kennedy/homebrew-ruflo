# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this Homebrew tap, please report it responsibly by emailing the maintainer or opening a private security advisory via GitHub:

**https://github.com/vincent-r-kennedy/homebrew-ruflo/security/advisories/new**

Please do not open a public issue for security vulnerabilities.

## How This Tap Stays Safe

- **SHA256 verification** — Every formula pins the exact hash of the npm tarball. Homebrew verifies the hash on install.
- **Automated updates** — A GitHub Actions workflow checks for new ruflo versions and updates the formula with the correct hash.
- **CI testing** — Every formula change is tested via `brew install`, `brew test`, and `brew audit --strict`.
- **Code scanning** — CodeQL runs on every push and weekly to detect vulnerabilities.
- **Dependency monitoring** — Dependabot alerts and updates are enabled for GitHub Actions dependencies.

## Scope

This policy covers the Homebrew formula and CI workflows in this repository. For security issues in ruflo itself, please report to the [ruflo project](https://github.com/ruvnet/ruflo).
