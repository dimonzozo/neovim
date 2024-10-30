{
  plugins.neogit = {
    enable = true;
    settings = {
      status.recent_commit_count = 30;
      integrations.diffview = false;
      disable_commit_confirmation = true;
      disable_builtin_notifications = true;
      sections = {
        untracked = {
          hidden = false;
          folded = false;
        };
        unstaged = {
          hidden = false;
          folded = false;
        };
        staged = {
          hidden = false;
          folded = false;
        };
        stashes = {
          hidden = false;
          folded = false;
        };
        unpulled = {
          hidden = false;
          folded = false;
        };
        unmerged = {
          hidden = false;
          folded = true;
        };
        recent = {
          hidden = false;
          folded = true;
        };
      };
      mappings = {
        status = {
          a = "Stage";
        };
      };
    };
  };

  keymaps = [
    {
      key = "<leader>gs";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>Neogit<CR>";
      options = {
        silent = true;
        desc = "Neogit";
      };
    }
  ];
}
