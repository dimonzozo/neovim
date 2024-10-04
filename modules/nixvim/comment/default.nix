{
  plugins.comment.enable = true;

  keymaps = [
    # Comment Line
    {
      key = "<leader>gc";
      mode = [ "v" ];
      action = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>";
      options = {
        silent = true;
        desc = "Comment line";
      };
    }
  ];
}
