# Contributing

> [!IMPORTANT]
> If you want to contribute changes to by's core, please check out the
> [dedicated `ty` contributing guide in basedpython](https://github.com/KotlinIsland/basedpython/blob/main/crates/ty/CONTRIBUTING.md).
> Keep reading if you want to contribute to by's documentation or release process instead.

## Repository structure

This repository contains by's documentation and release infrastructure. The core of by's Rust codebase is
located in the [basedpython](https://github.com/KotlinIsland/basedpython) repository (a fork of
[Ruff](https://github.com/astral-sh/ruff)). While the relationship between these
two projects will evolve over time, they currently share foundational crates and it's easiest to use a single
repository for the Rust development.

by's command-line help text, and part of `docs/reference/`, are auto-generated from Rust code in the
basedpython repository, using generation scripts that live in
[`crates/ruff_dev/src/`](https://github.com/KotlinIsland/basedpython/tree/main/crates/ruff_dev/src):

- Configuration options, from
    [basedpython/crates/ty_project/src/metadata/options.rs](https://github.com/KotlinIsland/basedpython/blob/main/crates/ty_project/src/metadata/options.rs)
- Rules, from
    [basedpython/crates/ty_python_semantic/src/](https://github.com/KotlinIsland/basedpython/tree/main/crates/ty_python_semantic/src)
- Command-line interface reference, from
    [basedpython/crates/ty/src/args.rs](https://github.com/KotlinIsland/basedpython/blob/main/crates/ty/src/args.rs)

The basedpython repository is included as a submodule inside this repository to allow by's release tags to reflect
an exact snapshot of the basedpython project. The submodule is only updated on release. To see the latest development
code, check out the `main` branch of the basedpython repository.

## Getting started with the by repository

Clone the repository:

```shell
git clone https://github.com/KotlinIsland/basedpython-by.git
```

Then, ensure the submodule is initialized:

```shell
git submodule update --init --recursive
```

### Prerequisites

You'll need [uv](https://docs.astral.sh/uv/getting-started/installation/) (or `pipx` and `pip`) to
run Python utility commands.

You can optionally install prek hooks to automatically run the validation checks
when making a commit:

```shell
uv tool install prek
prek install
```

## Building the Python package

The Python package can be built with any Python build frontend (Maturin is used as a backend), e.g.:

```shell
uv build
```

## Updating the basedpython commit

To update the basedpython submodule to the latest commit:

```shell
git -C basedpython pull origin main
```

Or, to update the basedpython submodule to a specific commit:

```shell
git -C basedpython checkout <commit>
```

To commit the changes:

```shell
commit=$(git -C basedpython rev-parse --short HEAD)
git switch -c "sync/basedpython-${commit}"
git add basedpython
git commit -m "Update basedpython submodule to https://github.com/KotlinIsland/basedpython/commit/${commit}"
```

To restore the basedpython submodule to a clean-state, reset, then update the submodule:

```shell
git -C basedpython reset --hard
git submodule update
```

To restore the basedpython submodule to the commit from `main`:

```shell
git -C basedpython reset --hard $(git ls-tree main -- basedpython | awk '{print $3}')
git add basedpython
```

## Documentation

To preview any changes to the documentation locally run the development server with:

```shell
uvx --with-requirements docs/requirements.txt -- mkdocs serve -f mkdocs.yml
```

The documentation should then be available locally at
[http://127.0.0.1:8000/by/](http://127.0.0.1:8000/by/).

To update the documentation dependencies, edit `docs/requirements.in`, then run:

```shell
uv pip compile docs/requirements.in -o docs/requirements.txt --universal -p 3.12
```

After making changes to the documentation, format the markdown files with:

```shell
npx prettier --prose-wrap always --write "**/*.md"
```

## Releasing by

Preparation for the release is automated.

1. Install the prek hooks as described above, if you haven't already.

1. Checkout the `main` branch and run `git pull origin main --recurse-submodules --tags`.

1. Create and checkout a new branch for the release.

1. Run `./scripts/release.sh`.

    The release script will:

    - Update the basedpython submodule to the latest commit on `main` upstream
    - Generate changelog entries based on pull requests here, and in basedpython
    - Bump the versions in the `pyproject.toml` and `dist-workspace.toml`
    - Update the generated reference documentation in `docs/reference`

1. Editorialize the `CHANGELOG.md` file to ensure entries are consistently styled.

1. Create a pull request with the changelog and version changes.

    The pull requests are usually titled as: `Bump version to <version>`.

    Binary builds will automatically be tested for the release.

1. Merge the pull request.

1. Run the [release workflow](https://github.com/KotlinIsland/basedpython-by/actions/workflows/release.yml) with
    the version tag.

    **Do not include a leading `v`**.

    When running the release workflow for pre-release versions, use the Cargo version format (not PEP
    440), e.g. `0.0.1-alpha.5` (not `0.0.1a5`). For stable releases, these formats are identical.

1. Request a deployment approval from another team member.

    The release workflow will pause at the `release-gate` job until this approval is granted.

    The release will automatically be created on GitHub after the distributions are published.

1. Run `uv run --no-project ./scripts/update_schemastore.py` (optional)

    This script will prepare a branch to update the `ty.json` schema in the `schemastore`
    repository. Requires a `KotlinIsland/schemastore` fork.

    Follow the link in the script's output to submit the pull request.

    The script is a no-op if there are no schema changes.
