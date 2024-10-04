{
  plugins.which-key = {
    enable = true;
    settings = {
      disable.ft = [ "TelescopePrompt" ];
      spec = [
        {
          __unkeyed = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed = "<leader>f";
          group = "Files";
        }
        {
          __unkeyed = "<leader>b";
          group = "Buffer";
        }
        {
          __unkeyed = "<leader>l";
          group = "LSP";
        }
      ];
    };
  };
}
