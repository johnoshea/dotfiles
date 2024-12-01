return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = false },
}

-- PERF: foo
-- HACK: bar
-- TODO: baz
-- NOTE: foo
-- FIX: bar
-- WARN: baz
