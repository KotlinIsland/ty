# by

[![PyPI](https://img.shields.io/pypi/v/basedpython.svg)](https://pypi.python.org/pypi/basedpython)

An extremely fast Python type checker and language server, written in Rust. Built on
[basedpython](https://github.com/KotlinIsland/basedpython) (a fork of [Ruff](https://github.com/astral-sh/ruff))
and based on Astral's [ty](https://github.com/astral-sh/ty).

<br />

<p align="center">
  <img alt="Shows a bar chart with benchmark results." width="500px" src="https://raw.githubusercontent.com/KotlinIsland/basedpython-by/main/docs/assets/ty-benchmark-cli.svg">
</p>

<p align="center">
  <i>Type checking the <a href="https://github.com/home-assistant/core">home-assistant</a> project without caching.</i>
</p>

<br />

by is currently in [beta](#version-policy).

## Highlights

- 10x - 100x faster than mypy and Pyright
- Comprehensive diagnostics with rich contextual information
- Configurable rule levels, per-file overrides, suppression comments, and first-class project support
- Designed for adoption, with support for redeclarations and partially typed code
- Language server with code navigation, completions, code actions, auto-import, inlay hints, on-hover help, etc.
- Fine-grained incremental analysis designed for fast updates when editing files in an IDE
- Editor integrations for VS Code, PyCharm, Neovim and more
- Advanced typing features like first-class intersection types, advanced type narrowing, and
    sophisticated reachability analysis

## Getting started

Install from PyPI:

```shell
pip install basedpython
by check
```

Or run via [uvx](https://docs.astral.sh/uv/guides/tools/#running-tools):

```shell
uvx --from basedpython by check
```

For documentation, see <https://kotlinisland.github.io/basedpython-by>.

## Installation

Install the `basedpython` package from PyPI. The CLI is exposed as `by`.

## Getting help

If you have questions or want to report a bug, please open an
[issue](https://github.com/KotlinIsland/basedpython-by/issues) in this repository.

## Contributing

Type-checker source code lives in the [basedpython](https://github.com/KotlinIsland/basedpython)
repository (the `basedpython` submodule of this repo, which includes all of the Rust source code).
Open pull requests there for changes to the type-checker. Pull requests for the packaging,
release infrastructure, and docs in this repo are welcome here.

See the [contributing guide](./CONTRIBUTING.md) for more details.

## Version policy

by uses `0.0.x` versioning. by does not yet have a stable API; breaking changes, including changes
to diagnostics, may occur between any two versions.

## FAQ

<!-- We intentionally use smaller headings for the FAQ items -->

<!-- markdownlint-disable MD001 -->

#### How do you pronounce by?

"bee - why".

#### How should I stylize by?

Just "by", please.

<!-- markdownlint-enable MD001 -->

## License

by is licensed under the MIT license ([LICENSE](LICENSE) or
<https://opensource.org/licenses/MIT>).

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in by
by you, as defined in the MIT license, shall be licensed as above, without any additional terms or
conditions.
