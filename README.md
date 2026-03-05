# Flakes

This repository is used to centrally store `flake.nix` / `flake.lock` files for **non-Nix projects**.

## Directory Conventions

- Each subdirectory corresponds to one upstream project.
- A project subdirectory usually contains:
  - `flake.nix`
  - `flake.lock`

## Usage Examples

Run inside a project directory (for example, `tgbot-cpp`):

```bash
nix build .#tgbot-cpp
```

Or build the default package directly:

```bash
nix build .#
```

