{
  config,
  ...
}:
{
  plugins.vim-matchup = {
    enable = true;
    treesitterIntegration.enable = config.plugins.treesitter.enable;
  };
}
