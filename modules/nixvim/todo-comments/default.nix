{
  plugins.todo-comments = {
    enable = true;

    settings = {
      signs = true;

      highlight = {
        multiline = true;
        pattern = ''.*<(KEYWORDS)\s*:'';
        before = "fg";
      };

      search = {
        pattern = ''\b(KEYWORDS):'';
      };

      mergeKeywords = true;
    };
  };
}
