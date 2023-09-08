# Untitled Game Idea for Godot Wild Jam

To be decided...

## Pre-requisites

- Git (https://git-scm.com/downloads)
- Git-LFS (https://git-lfs.github.com)
- Godot 4.1 (https://godotengine.org/download)
- Code editor (Godot, JetBrains, VSCode, etc.)
- Python 3.10+ (https://www.python.org/downloads)
- Pipenv (https://pipenv.pypa.io/en/latest/install/#installing-pipenv)

## Setup

1. Clone the repository with LFS enabled
2. Run `setup.sh` (in bash) to install hooks and python packages
3. Open the project in Godot 4.1

This will install pre and post commit hooks that will automatically format your
code, as well as update the `git_info.gd` file with the current commit info.

## Structure

- `/Addons`: Any external plugins we use, ideally as git submodules
- `/Build`: Exported game files (mainly used in CI/CD pipelines)
- `/Distribution`: Files and assets we intend to distribute with the game exports
- `/Globals`: Auto-loaded or named classes for delivering global functionality
- `/Game`: Main Module that delivers the core game experience
- `/Content`: (FUTURE) Downloadable content modules that extend the game
- `/Scenes`: Main Screens and Transitions that frame the game experience
- `/UI`: Main UI Patterns, Components, Actions, and attachable Traits

## Linting and Formatting

The project uses https://github.com/Scony/godot-gdscript-toolkit for linting
and formatting, which you can reach by running `pipenv run fmt` or 
`pipenv run lint`.

Note that the formatter is executed automatically before you commit, so it 
should keep the codebase relatively clean.
