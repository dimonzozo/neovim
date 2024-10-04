{
  config,
  ...
}:
{
  colorschemes = {
    # tokyonight = {
    #   enable = true;
    # };
    catppuccin = {
      enable = true;
      settings = {
        integrations = {
          which_key = config.plugins.which-key.enable;
          native_lsp.enabled = true;
          gitsigns = config.plugins.gitsigns.enable;
          telescope.enabled = config.plugins.telescope.enable;
          treesitter = config.plugins.treesitter.enable;
          indent_blankline = config.plugins.indent-blankline.enable;
          neotree = config.plugins.neo-tree.enable;
        };
      };
    };
  };
}
