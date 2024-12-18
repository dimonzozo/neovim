{
  plugins = {
    luasnip = {
      enable = true;
      fromVscode = [ { } ];
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        snippet.expand = ''
          function(args)
          require('luasnip').lsp_expand(args.body)
          end
        '';
        sources = [
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_document_symbol"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "emoji"; }
        ];
        window = {
          documentation.max_height = "math.floor(40 * (40 / vim.o.lines))";
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
            col_offset = -3;
            side_padding = 0;
          };
        };
        formatting = {
          fields = [
            "kind"
            "abbr"
            "menu"
          ];
        };
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = ''
                        cmp.mapping(function(fallback)
                          local function has_words_before()
            	              unpack = unpack or table.unpack
            	              local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            	              return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                          end
                          if cmp.visible() then
                            cmp.select_next_item()
                          elseif require("luasnip").expand_or_locally_jumpable() then
                            require("luasnip").expand_or_jump()
                          elseif has_words_before() then
                            cmp.complete()
                          else
                            fallback()
                          end
                        end, { "i", "s" })
          '';
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<Up>" = "cmp.mapping.select_prev_item()";
          "<Down>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-u>" = "cmp.mapping.scroll_docs(-4)";
          "<C-d>" = "cmp.mapping.scroll_docs(4)";
        };
      };
    };

    cmp-emoji.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-nvim-lua.enable = true;
    cmp_luasnip.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;

    friendly-snippets.enable = true;

    lspkind = {
      enable = true;
      mode = "symbol_text";
      cmp = {
        enable = true;
        # Custom Theme
        after = ''
          function(entry, vim_item, kind)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"
          return kind
          end
        '';
      };
    };
  };
}
