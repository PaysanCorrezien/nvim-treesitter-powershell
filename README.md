# nvim-treesitter-powershell

Powershell grammar for [tree-sitter](https://github.com/tree-sitter/tree-sitter)

Forked from [github](https://github.com/airbus-cert/tree-sitter-powershell)

## Description

This is a simple fork, with a prebuild `powershell.so` that nvim-tree-sitter can use.

It also include somes of the additionals files that nvim-tree-sitter need to work properly :

[./queries/highlights.scm](./queries/highlights.scm)
[./queries/textobjects.scm](./queries/textobjects.scm)
[./queries/folds.scm](./queries/folds.scm)

Most of the features from nvim-tree-sitter textobjects are working just fine.

Perfect to work with [Mini.ai](https://github.com/echasnovski/mini.ai)

# Build manualy

## Build by Neovim

There is a issue to build automatically with default neovim on windows. GCC installed through `choco install mingw` can't build on my system.
The workaround is to use zig `choco install zig` and set is a default on nvim (see below).

## Manual setup

This is my setup on `LazyVIM`, but the setup should be similar on a standard nvim setup.

`./plugins/tree-sitter.lua` :

```lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			-- Set preferred compiler order
			local install = require("nvim-treesitter.install")
			install.compilers = { "zig", "gcc" } --Use zig as default
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.powershell = {
				install_info = {
					url = parser_path, -- Directory of the installed parser
					files = { "src/parser.c", "src/scanner.c" }, -- Both need to be include in the build process of it fail
					branch = "main",
				},
				filetype = "ps1", -- Associate the parser with 'ps1' files
			}
		end,
	},
}

```

## Using the Queries

Copy the `.scm` files in `~/.config/nvim/queries/powershell/` or any other files where neovim try to read them : [Neovim Docs](https://neovim.io/doc/user/treesitter.html)

[Neovim TS Windows](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)

## References

- [Powershell 7.3](https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-15?view=powershell-7.3)
