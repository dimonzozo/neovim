{
  plugins.indent-blankline = {
    enable = false;
    settings = {
      exclude = {
        buftypes = [
          "terminal"
          "quickfix"
          "nofile"
          "prompt"
        ];
        filetypes = [
          "alpha"
          "checkhealth"
          "help"
          "lspinfo"
          "TelescopePrompt"
          "TelescopeResults"
          "NvimTree"
          "neo-tree"
          "toggleterm"
          "dashboard"
        ];
      };
      indent = {
        char = "│";
      };
      scope = {
        show_end = false;
        show_exact_scope = true;
        show_start = false;
      };
    };
  };
}
