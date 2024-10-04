{
  plugins.lspkind = {
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
}
