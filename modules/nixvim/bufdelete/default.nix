{
  plugins.bufdelete = {
    enable = true;
  };

  keymaps = [
    {
      key = "<leader>q";
      mode = [ "n" ];
      action = "<cmd>Bdelete<cr>";
      options = {
        silent = true;
        desc = "Close Buffer";
      };
    }
    {
      key = "<leader>x";
      mode = [ "n" ];
      action = "<cmd>Bdelete<cr>";
      options = {
        silent = true;
        desc = "Close Buffer";
      };
    }
  ];
}
