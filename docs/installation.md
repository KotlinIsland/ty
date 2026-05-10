# Installing by

The PyPI package is named `basedpython`. The CLI binary is `by`.

## Running by without installation

Use [uvx](https://docs.astral.sh/uv/guides/tools/) to quickly get started:

```shell
uvx --from basedpython by
```

## Installation methods

### Adding by to your project

!!! tip

    Adding basedpython as a dependency ensures that all developers on the project are using the
    same version of the type checker.

Use [uv](https://github.com/astral-sh/uv) (or your project manager of choice) to add basedpython as a
development dependency:

```shell
uv add --dev basedpython
```

Then, use `uv run` to invoke by:

```shell
uv run by
```

To update, use `--upgrade-package`:

```shell
uv lock --upgrade-package basedpython
```

### Installing globally with uv

Install globally with uv:

```shell
uv tool install basedpython@latest
```

To update, use `uv tool upgrade`:

```shell
uv tool upgrade basedpython
```

### Installing from GitHub Releases

by release artifacts can be downloaded directly from
[GitHub Releases](https://github.com/KotlinIsland/basedpython-by/releases).

Each release page includes binaries for all supported platforms as well as instructions for using
the standalone installer via `github.com`.

### Installing globally with pipx

Install globally with pipx:

```shell
pipx install basedpython
```

To update, use `pipx upgrade`:

```shell
pipx upgrade basedpython
```

### Installing with pip

Install into your current Python environment with pip:

```shell
pip install basedpython
```

## Adding by to your editor

See the [editor integration](./editors.md) guide to add ty to your editor.

## Shell autocompletion

!!! tip

    You can run `echo $SHELL` to help you determine your shell.

To enable shell autocompletion for by commands, run one of the following:

=== "Bash"

    ```bash
    echo 'eval "$(by generate-shell-completion bash)"' >> ~/.bashrc
    ```

=== "Zsh"

    ```bash
    echo 'eval "$(by generate-shell-completion zsh)"' >> ~/.zshrc
    ```

=== "fish"

    ```bash
    echo 'by generate-shell-completion fish | source' > ~/.config/fish/completions/by.fish
    ```

=== "Elvish"

    ```bash
    echo 'eval (by generate-shell-completion elvish | slurp)' >> ~/.elvish/rc.elv
    ```

=== "PowerShell / pwsh"

    ```powershell
    if (!(Test-Path -Path $PROFILE)) {
      New-Item -ItemType File -Path $PROFILE -Force
    }
    Add-Content -Path $PROFILE -Value '(& by generate-shell-completion powershell) | Out-String | Invoke-Expression'
    ```

Then restart the shell or source the shell config file.
