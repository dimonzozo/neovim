{
  plugins.trouble = {
    enable = true;

    settings = {
      auto_close = true;
      auto_open = false;
      auto_fold = false;
      auto_preview = false;
    };
  };

  keymaps = [
    {
      mode = "n";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      key = "<leader>tt";
      options = {
        desc = "Toggle trouble";
      };
    }
    {
      mode = "n";
      action = "<cmd>Trouble todo toggle<cr>";
      key = "<leader>tn";
      options = {
        desc = "Toggle notes";
      };
    }
  ];
}
