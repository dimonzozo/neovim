{
  pkgs,
  ...
}:
{
  plugins = {
    # TODO: use harpoon from nixvim after release
    # harpoon = {
    #   enable = true;
    #   enableTelescope = true;
    # };
  };

  extraPlugins = [
    (
       pkgs.vimUtils.buildVimPlugin {
        name = "harpoon";
        src = pkgs.fetchFromGitHub {
          owner = "ThePrimeagen";
          repo = "harpoon";
          rev = "0378a6c428a0bed6a2781d459d7943843f374bce";
          hash = "sha256-FZQH38E02HuRPIPAog/nWM55FuBxKp8AyrEldFkoLYk=";
        };
      }
    )
  ];

  extraConfigLuaPre = ''
    local harpoon = require('harpoon')
    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })
  '';

  keymaps = [
    {
      key = "m";
      mode = [ "n" ];
      action.__raw = ''
        function()
          harpoon:list():add()
          local f = vim.api.nvim_buf_get_name(0)
          vim.notify("Harpoon: <" .. f .. "> added", vim.log.levels.INFO, {})
        end
      '';
      options = {
        silent = true;
        desc = "Add file to harpoon";
      };
    }
    {
      key = "MM";
      mode = [ "n" ];
      action.__raw = ''
        function()
          local toggle_opts = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            ui_width_ratio = 0.375,
            title_pos = "center",
          }
          harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Harpoon menu";
      };
    }
    {
      key = "MM";
      mode = [ "n" ];
      action.__raw = ''
        function()
          local toggle_opts = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            ui_width_ratio = 0.375,
            title_pos = "center",
          }
          harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Harpoon menu";
      };
    }
    {
      key = "M1";
      mode = [ "n" ];
      action = ''<cmd>lua require('harpoon'):list():select(1)<cr>'';
      options = {
        silent = true;
        desc = "Harpoon select #1";
      };
    }
    {
      key = "M2";
      mode = [ "n" ];
      action = ''<cmd>lua require('harpoon'):list():select(2)<cr>'';
      options = {
        silent = true;
        desc = "Harpoon select #2";
      };
    }
    {
      key = "M3";
      mode = [ "n" ];
      action = ''<cmd>lua require('harpoon'):list():select(3)<cr>'';
      options = {
        silent = true;
        desc = "Harpoon select #3";
      };
    }
    {
      key = "M4";
      mode = [ "n" ];
      action = ''<cmd>lua require('harpoon'):list():select(4)<cr>'';
      options = {
        silent = true;
        desc = "Harpoon select #4";
      };
    }
    {
      key = "M5";
      mode = [ "n" ];
      action = ''<cmd>lua require('harpoon'):list():select(5)<cr>'';
      options = {
        silent = true;
        desc = "Harpoon select #5";
      };
    }
    {
      key = "<leader>e";
      mode = [ "n" ];
      action = ''<cmd>Telescope harpoon marks<cr>'';
      options = {
        silent = true;
        desc = "Open Harpoon window";
      };
    }
  ];
}
