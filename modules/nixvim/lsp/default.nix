{
  helpers,
  ...
}:
{
  plugins = {
    #LSP Formatting
    lsp-format.enable = true;
    # Native LSP
    lsp = {
      enable = true;
      servers = {
        gopls.enable = true;
        eslint.enable = false;
        pyright.enable = true;
        # pylsp.enable = true;
        ruff_lsp.enable = true;
        # pylyzer.enable = true;
        nil_ls = {
          enable = true;
          settings = {
            formatting.command = [ "nixfmt" ];
            nix.flake.autoArchive = true;
          };
        };
        nixd = {
          enable = false;
          settings = {
            options = {
              nixpkgs.expr = "import <nixpkgs> { }";
              nixos.expr = ''(builtins.head (builtins.attrValues (builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations)).options'';
              home_manager.expr = ''(builtins.head (builtins.attrValues (builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations)).options'';
              nix_darwin.expr = ''(builtins.head (builtins.attrValues (builtins.getFlake ("git+file://" + toString ./.)).darwinConfigurations)).options'';
            };
          };
        };
        # rust_analyzer = {
        #   enable = true;
        #   installCargo = true;
        #   installRustc = true;
        # };
        # tsserver = {
        #   enable = true;
        #   onAttach.function = ''
        #     client.server_capabilities.documentFormattingProvider = false
        #   '';
        # };
        # biome = {
        #   enable = true;
        #   onAttach.function = ''
        #     client.server_capabilities.documentFormattingProvider = false
        #   '';
        # };
        tailwindcss.enable = true;
        # cssls.enable = true;
        # astro.enable = true;
        # volar.enable = true;
        lua_ls = {
          enable = true;
          settings = {
            workspace.library = [ (helpers.mkRaw "vim.api.nvim_get_runtime_file(\"\", true)") ];
          };
        };
        # omnisharp.enable = true;
        # ruff-lsp.enable = true;
        # pyright.enable = true;
        # elixirls.enable = true;
        # dartls.enable = true;
        # java-language-server.enable = true;
      };
    };
    # LSP saga
    lspsaga = {
      enable = true;
      symbolInWinbar.enable = false;
      lightbulb.sign = false; # disable bulb in status col
      lightbulb.virtualText = false; # enable at end of line
    };
  };

  # LSP Mappings
  keymaps = [
    # Workspace
    {
      key = "<space>wa";
      mode = [ "n" ];
      action = "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>";
      options = {
        silent = true;
        desc = "Add folder to workspace";
      };
    }
    {
      key = "<space>wr";
      mode = [ "n" ];
      action = "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>";
      options = {
        silent = true;
        desc = "Remove folder from workspace";
      };
    }
    {
      key = "<space>wl";
      mode = [ "n" ];
      action.__raw = ''
        function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end
      '';
      options = {
        desc = "Show all workspace folders";
      };
    }
    # Async LSP Finder
    {
      key = "<leader>lf";
      mode = [ "n" ];
      action = ":Lspsaga finder def+ref<CR>";
      options = {
        silent = true;
        desc = "Lspsaga Finder";
      };
    }
    # Call hierarchy
    {
      key = "<leader>lci";
      mode = [ "n" ];
      action = ":Lspsaga incoming_calls<CR>";
      options = {
        silent = true;
        desc = "Lspsaga Incoming Calls";
      };
    }
    {
      key = "<leader>lco";
      mode = [ "n" ];
      action = ":Lspsaga outgoing_calls<CR>";
      options = {
        silent = true;
        desc = "Lspsaga Outgoing Calls";
      };
    }
    # Code Action
    {
      key = "<leader>la";
      mode = [ "n" ];
      action = ":Lspsaga code_action<CR>";
      options = {
        silent = true;
        desc = "Code Action";
      };
    }
    {
      key = "<leader>la";
      mode = [ "v" ];
      action = ":<C-U>Lspsaga range_code_action<CR>";
      options = {
        silent = true;
        desc = "Code Action";
      };
    }
    # Rename
    {
      key = "<leader>lr";
      mode = [ "n" ];
      action = ":Lspsaga rename<CR>";
      options = {
        silent = true;
        desc = "LSP Rename";
      };
    }
    # Peek Definitions
    {
      key = "<leader>lpd";
      mode = [ "n" ];
      action = ":Lspsaga peek_definition<CR>";
      options = {
        silent = true;
        desc = "Peek Definition";
      };
    }
    {
      key = "<leader>lpt";
      mode = [ "n" ];
      action = ":Lspsaga peek_type_definition<CR>";
      options = {
        silent = true;
        desc = "Peek Type Definition";
      };
    }
    # Goto
    {
      key = "gD";
      mode = [ "n" ];
      action = "<Cmd>lua vim.lsp.buf.declaration()<CR>";
      options = {
        silent = true;
        desc = "Goto Declaration";
      };
    }
    {
      key = "gd";
      mode = [ "n" ];
      action = "<Cmd>:Lspsaga goto_definition<CR>";
      options = {
        silent = true;
        desc = "Goto Definition";
      };
    }
    {
      key = "gi";
      mode = [ "n" ];
      action = "<Cmd>lua vim.lsp.buf.implementation()<CR>";
      options = {
        silent = true;
        desc = "Goto Implementation";
      };
    }
    # LSP Outline
    {
      key = "<leader>lo";
      mode = [ "n" ];
      action = "<Cmd>Lspsaga outline<CR>";
      options = {
        silent = true;
        desc = "LSP Outline";
      };
    }
    # Hover
    {
      key = "<leader>lk";
      mode = [ "n" ];
      action = "<Cmd>Lspsaga hover_doc<CR>";
      options = {
        silent = true;
        desc = "Hover Info";
      };
    }
    {
      key = "<leader>ll";
      mode = [ "n" ];
      action = "<Cmd>Lspsaga show_line_diagnostics<CR>";
      options = {
        silent = true;
        desc = "Show Line Diagnostics";
      };
    }
    # Move Between Diagnostics
    {
      key = "[d";
      mode = [ "n" ];
      action = "<Cmd>lua vim.diagnostic.goto_prev()<CR>";
      options = {
        silent = true;
        desc = "Previous Diagnostic";
      };
    }
    {
      key = "]d";
      mode = [ "n" ];
      action = "<Cmd>lua vim.diagnostic.goto_next()<CR>";
      options = {
        silent = true;
        desc = "Next Diagnostic";
      };
    }
  ];
}
