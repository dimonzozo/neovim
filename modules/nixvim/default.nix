{
  pkgs,
  ...
}:
{
  luaLoader.enable = true;

  extraPlugins = with pkgs.vimPlugins; [
    fugitive
    vim-unimpaired
  ];

  globals = {
    mapleader = ",";
    # loaded_ruby_provider = 0;
    # loaded_perl_provider = 0;
    # loaded_python_provider = 0;
    disable_diagnostics = false;
    disable_hardtime = false;
    disable_autoformat = false;
    spell_enabled = true;
    colorizing_enabled = 1;
    first_buffer_opened = false;
  };

  opts = {
    number = true;
    updatetime = 100;
    swapfile = false;
    relativenumber = false;
    clipboard = "unnamedplus";
    timeout = true;
    timeoutlen = 300;
    smarttab = true;
    # foldenable = true;
    # foldcolumn = "1";
    # fillchars = {
    #   eob = " ";
    #   fold = " ";
    #   foldopen = "";
    #   foldsep = " ";
    #   foldclose = "";
    # };
    # foldlevel = 99;
    # foldlevelstart = 99;
    tabstop = 2;
    shiftwidth = 2;
    autoindent = true;
    cindent = true;
    smartindent = true;
    smartcase = true;
    ignorecase = true;
    infercase = true;
    showmode = false;
    ruler = false;
    showcmd = false;
    breakindent = true;
    lazyredraw = false; # Faster scrolling if enabled, breaks noice
    showmatch = true; # when closing a bracket, briefly flash the matching one
    matchtime = 1; # duration of that flashing n deci-seconds
    copyindent = true;
    cursorline = true;
    expandtab = true;
    preserveindent = true;
    pumheight = 10;
    undofile = true;
    virtualedit = "block";
    wrap = false;
    titlestring = "neovim";
    title = true;
    splitbelow = true;
    splitright = true;
  };

  autoCmd = [
    {
      event = [ "TextYankPost" ];
      command = "lua vim.highlight.on_yank()";
    }
  ];

  keymaps = [
    # Buffers navigation with <TAB>
    {
      key = "<TAB>";
      mode = [ "n" ];
      action = "<cmd>b#<CR>";
      options = {
        silent = true;
        desc = "Other buffer";
      };
    }
    # Quality of life changes
    {
      key = "<leader><space>";
      mode = [ "n" ];
      action = "<cmd>nohlsearch<CR>";
      options = {
        silent = true;
        desc = "No highlight";
      };
    }
    {
      key = "<leader>w";
      mode = [ "n" ];
      action = "<cmd>write<cr>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }
    {
      key = "<";
      mode = [ "v" ];
      action = "<gv";
      options = {
        silent = true;
        desc = "Decrease identation";
      };
    }
    {
      key = "p";
      mode = [ "v" ];
      action = "\"_dP";
      options = {
        silent = true;
        noremap = true;
        desc = "Paste (replace without yanking)";
      };
    }
    {
      key = ">";
      mode = [ "v" ];
      action = ">gv";
      options = {
        silent = true;
        desc = "Increase identation";
      };
    }
    {
      key = "E";
      mode = [ "n" ];
      action = "$";
      options = {
        noremap = true;
      };
    }
    {
      key = "B";
      mode = [ "n" ];
      action = "^";
      options = {
        noremap = true;
      };
    }
    # Splits
    {
      key = "<c-w>,";
      mode = [ "n" ];
      action = ":vertical resize -10<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      key = "<c-w>.";
      mode = [ "n" ];
      action = ":vertical resize +10<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    # Word wrap things
    {
      key = "k";
      mode = [ "n" ];
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        silent = true;
        expr = true;
      };
    }
    {
      key = "j";
      mode = [ "n" ];
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        silent = true;
        expr = true;
      };
    }
  ];
}
