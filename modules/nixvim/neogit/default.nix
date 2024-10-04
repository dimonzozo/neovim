{
  plugins.neogit = {
    enable = true;
    settings = {
      integrations.diffview = true;
      status.recent_commit_count = 30;
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
