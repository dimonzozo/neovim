{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        always_show_bufferline = true;
        diagnostics = "nvim_lsp";
        max_name_length = 18;
        max_prefix_length = 15;
        mode = "buffers";
        offsets = [
          {
            filetype = "neo-tree";
            highlight = "Directory";
            text = "File Explorer";
            text_align = "center";
          }
        ];
        enforce_regular_tabs = false;
        persist_buffer_sort = true;
        tab_size = 18;
        show_buffer_close_icons = false;
        show_buffer_icons = true;
        show_close_icon = false;
      };
    };
  };
  keymaps = [
    {
      key = "]b";
      mode = [ "n" ];
      action = "<cmd>bn<cr>";
      options = {
        silent = true;
        desc = "Next Buffer";
      };
    }
    {
      key = "[b";
      mode = [ "n" ];
      action = "<cmd>bp<cr>";
      options = {
        silent = true;
        desc = "Previous Buffer";
      };
    }
    {
      key = "<leader>bc";
      mode = [ "n" ];
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        silent = true;
        desc = "Close all Buffers except Current";
      };
    }
  ];
}
