{ config, ... }:
{
  plugins.gitsigns = {
    enable = true;

    settings = {
      current_line_blame = false;
      trouble = config.plugins.trouble.enable;

      signs = {
        add.text = "+";
        change.text = "~";
        delete.text = "-";
        topdelete.text = "-";
        changedelete.text = "~";
        untracked.text = "┆";
      };
    };
  };
}
