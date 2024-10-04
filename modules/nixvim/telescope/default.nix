{
  pkgs,
  ...
}:
{
  extraPackages = with pkgs; [ ripgrep ];

  plugins.telescope = {
    enable = true;

    settings = {
      pickers.colorscheme.enable_preview = true;
      file_ignore_patterns = [ "node%_modules/.*" ];
      defaults = {
        prompt_prefix = " ";
        selection_caret = "❯ ";
        path_display = [ "truncate" ];
        sorting_strategy = "ascending";
        layout_config = {
          horizontal = {
            prompt_position = "top";
            preview_width = 0.55;
          };
          vertical = {
            mirror = false;
          };
          width = 0.87;
          height = 0.8;
          preview_cutoff = 120;
        };
      };
    };

    extensions = {
      fzf-native.enable = true;
      media-files.enable = true;
      ui-select.enable = true;
    };
  };

  keymaps = [
    {
      key = "<leader>f<cr>";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").resume() end'';
      options = {
        silent = true;
        desc = "Resume previous search";
      };
    }
    {
      key = "<leader><leader>";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").find_files() end'';
      options = {
        silent = true;
        desc = "Find Files";
      };
    }
    {
      key = "<leader>ff";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").find_files() end'';
      options = {
        silent = true;
        desc = "Find Files";
      };
    }
    {
      key = "<leader>fF";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end'';
      options = {
        silent = true;
        desc = "Find all Files";
      };
    }
    {
      key = "<leader>fw";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''
        function()
                  local actions = require("telescope.actions")
          	      local opts = {temp__scrolling_limit=1000}
          	      local tag_item = {
          		      tagname = vim.fn.expand('<cword>'),
          		      from = { vim.fn.bufnr('%'), vim.fn.line('.'), vim.fn.col('.'), 0 },
          		      winid = vim.fn.win_getid(),
          	      }

          	      vim.fn.systemlist("git rev-parse --is-inside-work-tree")
          	      if vim.v.shell_error == 0 then
          		      opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
          	      end
          	      opts.attach_mappings = function(_, map)
          		      map("i", "<c-g>", actions.to_fuzzy_refine)
          		      map({"i", "n"}, "<CR>", function(prompt_bufnr)
          			      vim.fn.settagstack(tag_item.winid, { items = { tag_item } }, 't')
          			      actions.select_default(prompt_bufnr)
          			      vim.cmd.normal("zz")
          		      end)
          		      return true
          	      end
          	      require('telescope.builtin').live_grep(opts)
                end'';
      options = {
        silent = true;
        desc = "Find Words";
      };
    }
    {
      key = "<leader>fW";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''
        function()
          require("telescope.builtin").live_grep {
            additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
          }
        end
      '';
      options = {
        silent = true;
        desc = "Find Words";
      };
    }
    {
      key = "<leader>fb";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").buffers() end'';
      options = {
        silent = true;
        desc = "Find Buffers";
      };
    }

    {
      key = "K";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''
        function()
                  local actions = require("telescope.actions")
          	      local opts = {temp__scrolling_limit=1000}
          	      local tag_item = {
          		      tagname = vim.fn.expand('<cword>'),
          		      from = { vim.fn.bufnr('%'), vim.fn.line('.'), vim.fn.col('.'), 0 },
          		      winid = vim.fn.win_getid(),
          	      }

          	      vim.fn.systemlist("git rev-parse --is-inside-work-tree")
          	      if vim.v.shell_error == 0 then
          		      opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
          	      end
          	      opts.attach_mappings = function(_, map)
          		      map("i", "<c-g>", actions.to_fuzzy_refine)
          		      map({"i", "n"}, "<CR>", function(prompt_bufnr)
          			      vim.fn.settagstack(tag_item.winid, { items = { tag_item } }, 't')
          			      actions.select_default(prompt_bufnr)
          			      vim.cmd.normal("zz")
          		      end)
          		      return true
          	      end
          	      require('telescope.builtin').grep_string(opts)
                end'';
      options = {
        noremap = true;
        silent = true;
        desc = "Find word under Cursor";
      };
    }
    {
      key = "<leader>fC";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").commands() end'';
      options = {
        silent = true;
        desc = "Find Commands";
      };
    }
    {
      key = "<leader>fk";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").keymaps() end'';
      options = {
        silent = true;
        desc = "Find keymaps";
      };
    }
    {
      key = "<leader>ft";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").colorscheme { enable_preview = true } end'';
      options = {
        silent = true;
        desc = "Find themes";
      };
    }
    {
      key = "<leader>fn";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope").extensions.notify.notify() end'';
      options = {
        silent = true;
        desc = "Find notifications";
      };
    }
    {
      key = "<leader>fp";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>Telescope projects<cr>";
      options = {
        silent = true;
        desc = "Find projects";
      };
    }
    {
      key = "<leader>gb";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").git_branches() end'';
      options = {
        silent = true;
        desc = "Git branches";
      };
    }
    {
      key = "<leader>lD";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").diagnostics() end'';
      options = {
        silent = true;
        desc = "Search diagnostics";
      };
    }
    {
      key = "<leader>ls";
      mode = [
        "n"
        "v"
      ];
      action.__raw = ''function() require("telescope.builtin").lsp_document_symbols() end'';
      options = {
        silent = true;
        desc = "Search symbols";
      };
    }
  ];
}
