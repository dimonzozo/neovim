{
  pkgs,
  ...
}:
{
  plugins = {
    treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        go
        rust
        nix
        lua
        # haskell
        # java
        # html
        # astro
        # javascript
        # typescript
        # tsx
        # json
        # json5
        markdown
        markdown-inline
        vim
        regex
        bash
      ];

      settings = {
        # folding.enable = true;
        indent.enable = false;

        ensure_installed = [
          "go"
          # "rust"
          "nix"
          "lua"
          # "haskell"
          # "java"
          # "html"
          # "astro"
          # "javascript"
          # "typescript"
          # "tsx"
          # "json"
          # "json5"
          "lua"
          "markdown"
          "markdown_inline"
        ];
      };
    };
  };
}
