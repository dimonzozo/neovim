{
  pkgs,
    ...
}:
{
  extraPlugins = [
    (
       pkgs.vimUtils.buildVimPlugin {
        name = "mini-indentscope";
        src = pkgs.fetchFromGitHub {
          owner = "echasnovski";
          repo = "mini.indentscope";
          rev = "da9af64649e114aa79480c238fd23f6524bc0903";
          hash = "sha256-zzD+RFSA9YHNWJO1030G7k6vCI0X0l3ra2vGhAmLcN0=";
        };
      }
    )
  ];

  extraConfigLua = ''
    require("mini.indentscope").setup({
	    symbol = "│",
	    options = { try_as_border = true },
    })

    vim.api.nvim_create_autocmd("FileType", {
	    pattern = {
		    "help",
		    "alpha",
		    "dashboard",
		    "neo-tree",
		    "Trouble",
		    "trouble",
		    "lazy",
		    "mason",
		    "notify",
		    "toggleterm",
		    "lazyterm",
		    "NvimTree",
	    },
	    callback = function()
		    vim.b.miniindentscope_disable = true
	    end,
    })

    vim.api.nvim_create_autocmd("ColorScheme", {
	    pattern = "*",
	    callback = function()
		    --vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "@lsp.type.comment" })
		    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#393836"})
	    end,
    })
  '';
}
