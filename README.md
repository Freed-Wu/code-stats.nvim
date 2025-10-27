# code-stats.nvim

[![readthedocs](https://shields.io/readthedocs/code-stats-nvim)](https://code-stats-nvim.readthedocs.io)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/code-stats.nvim/main.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/code-stats.nvim/main)
[![github/workflow](https://github.com/Freed-Wu/code-stats.nvim/actions/workflows/main.yml/badge.svg)](https://github.com/Freed-Wu/code-stats.nvim/actions)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/code-stats.nvim/total)](https://github.com/Freed-Wu/code-stats.nvim/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/code-stats.nvim/latest/total)](https://github.com/Freed-Wu/code-stats.nvim/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim)
[![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim)
[![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim)
[![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim)
[![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim)
[![github/v](https://shields.io/github/v/release/Freed-Wu/code-stats.nvim)](https://github.com/Freed-Wu/code-stats.nvim)

[![luarocks](https://img.shields.io/luarocks/v/Freed-Wu/code-stats.nvim)](https://luarocks.org/modules/Freed-Wu/code-stats.nvim)

[Code::Stats](https://codestats.net) plugin for Neovim.

## Install

### rocks.nvim

#### Command style

```vim
:Rocks install code-stats.nvim
```

#### Declare style

`~/.config/nvim/rocks.toml`:

```toml
[plugins]
"code-stats.nvim" = "scm"
```

Then

```vim
:Rocks sync
```

or:

```sh
$ luarocks --lua-version 5.1 --local --tree ~/.local/share/nvim/rocks install code-stats.nvim
# ~/.local/share/nvim/rocks is the default rocks tree path
# you can change it according to your vim.g.rocks_nvim.rocks_path
```

## Configure

```lua
local CodeStats = require 'code-stats.nvim.codestats'.CodeStats
local codestats = CodeStats {
    args = {
        headers = {
            ['X-API-Token'] = "XXXXXXX.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        }
    }
}
codestats:create_autocmds()
```

For compatibility of
[code-stats-zsh](https://gitlab.com/code-stats/code-stats-zsh) and
[code-stats-bash](https://github.com/Freed-Wu/code-stats-bash), the following is
also OK:

```lua
local CodeStats = require 'code-stats.nvim.codestats'.CodeStats
local codestats = CodeStats {
    dotenv = "/the/path/of/codestats.sh"
}
codestats:create_autocmds()
```

`/the/path/of/codestats.sh`:

```sh
CODESTATS_API_KEY=XXXXXXX.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## Tips

For Nix user, run
`/the/path/of/luarocks/rocks-5.1/code-stats.nvim/VERSION/scripts/update.sh` when
dynamic link libraries are broken after `nix-collect-garbage -d`.

## Related Projects

- [code-stats-vim](https://gitlab.com/code-stats/code-stats-vim)
