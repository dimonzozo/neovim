{
  lib,
  config,
  helpers,
  ...
}:
{
  plugins.neo-tree = {
    enable = true;

    extraOptions = {
      commands = {
        "system_open" =
          helpers.mkRaw # lua
            ''
              function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                -- macOs: open file in default application in the background.
                vim.fn.jobstart({ "open", path }, { detach = true })
              end
            '';
        "copy_selector" =
          helpers.mkRaw # lua
            ''
              function(state)
                -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
                -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
                local node = state.tree:get_node()
                local filepath = node:get_id()
                local filename = node.name
                local modify = vim.fn.fnamemodify

                local results = {
                  filename,
                  modify(filename, ":r"), -- filename without extension
                  filepath,
                  modify(filepath, ":~"), -- relative to HOME
                  modify(filepath, ":."), -- relative to CWD
                  modify(filename, ":e"), -- filename extension
                }

                vim.ui.select({
                  "1. Filename: " .. results[1],
                  "2. Filename without extension: " .. results[2],
                  "3. Absolute path: " .. results[3],
                  "4. Path relative to HOME: " .. results[4],
                  "5. Path relative to CWD: " .. results[5],
                  "6. Extension of the filename: " .. results[6],
                  }, { prompt = "Choose to copy to clipboard:" }, function(choice)
                  if choice then
                    local i = tonumber(choice:sub(1, 1))
                    if i then
                      local result = results[i]
                      vim.fn.setreg('+', result)
                      vim.notify("Copied: " .. result)
                    else
                      vim.notify("Invalid selection")
                    end
                  else
                    vim.notify("Selection cancelled")
                  end
                end)
              end
            '';
      };
    };
    enableDiagnostics = true;
    enableGitStatus = true;
    enableModifiedMarkers = true;
    enableRefreshOnWrite = true;
    autoCleanAfterSessionRestore = true;
    sourceSelector = {
      statusline = true;
      contentLayout = "focus";
      sources = [
        {
          source = "filesystem";
          displayName = " File";
        }
        {
          source = "buffers";
          displayName = " Buffer";
        }
        {
          source = "git_status";
          displayName = " Git";
        }
        {
          source = "diagnostics";
          displayName = " Diagnostics";
        }
      ];
    };
    defaultComponentConfigs = {
      indent = {
        padding = 1;
        indentSize = 3;
      };
      icon = {
        folderClosed = "";
        folderOpen = "";
        folderEmpty = "";
        default = "";
      };
      modified.symbol = "";
      gitStatus.symbols = {
        added = "✚";
        modified = "";
        deleted = "✖";
        renamed = "󰁕";
        untracked = "";
        ignored = "◌";
        unstaged = "󰄱";
        staged = "";
        conflict = "";
      };
    };
    closeIfLastWindow = false;
    window = {
      width = 30;
    };
    filesystem = {
      window = {
        mappings = {
          "l" = {
            command = "open";
            nowait = true;
          };
          "o" = {
            command = "open";
            nowait = true;
            noremap = true;
          };
          "S" = {
            command = "system_open";
            nowait = true;
          };
          "Y" = {
            command = "copy_selector";
          };
        };
      };
      bindToCwd = true;
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = true;
      };
      useLibuvFileWatcher = true;
      filteredItems = {
        visible = false;
        hideGitignored = true;
        hideHidden = true;
        hideDotfiles = true;
        neverShow = [
          ".DS_Store"
          "thumbs.db"
        ];
      };
    };
    buffers = {
      bindToCwd = true;
      followCurrentFile.enabled = true;
      window = {
        mappings = {
          "l" = {
            command = "open";
            nowait = true;
          };
          "o" = {
            command = "open";
            nowait = true;
            noremap = true;
          };
          "S" = {
            command = "system_open";
            nowait = true;
          };
          "Y" = {
            command = "copy_selector";
          };
        };
      };
    };
    gitStatus = {
      window = {
        mappings = {
          "l" = {
            command = "open";
            nowait = true;
          };
          "o" = {
            command = "open";
            nowait = true;
            noremap = true;
          };
          "S" = {
            command = "system_open";
            nowait = true;
          };
          "Y" = {
            command = "copy_selector";
          };
        };
      };
    };
  };
  keymaps = lib.mkIf config.plugins.neo-tree.enable [
    {
      key = "tt";
      mode = [ "n" ];
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Neotree toggle";
      };
    }
  ];
}
