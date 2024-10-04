{
  plugins.lazygit.enable = true;

  keymaps = [
    {
      key = "<leader>lg";
      mode = [
        "n"
        "v"
      ];
      action = "<CMD>LazyGit<CR>";
      options = {
        silent = true;
        desc = "LazyGit";
      };
    }
  ];
}
