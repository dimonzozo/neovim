{ lib, config, helpers, ... }:
{
  plugins.neo-tree = {
    enable = true;
    
    extraOptions = {
      commands = {
        "system_open" = helpers.mkRaw # lua
        ''
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            -- macOs: open file in default application in the background.
            vim.fn.jobstart({ "open", path }, { detach = true })
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
      # winbar = true;
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
        folderEmpty = "";
        default = "";
      };
      modified.symbol = "";
      gitStatus.symbols = {
        added = "";
        deleted = "";
        modified = "";
        renamed = "➜";
        untracked = "★";
        ignored = "◌";
        unstaged = "✗";
        staged = "✓";
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
        };
      };
      bindToCwd = true;
      followCurrentFile.enabled = true;
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
