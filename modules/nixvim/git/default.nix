{
  keymaps = [
    # Git
    {
      key = "X";
      mode = [ "v" ];
      action.__raw = ''
        function()
          local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(0, '<'))
          local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(0, '>'))
          vim.api.nvim_command(string.format("vertical Git log --oneline --no-patch -L%d,%d:%%", start_row, end_row))
        end
      '';
      options = {
        silent = true;
        desc = "Line Git history";
      };
    }
  ];
}
