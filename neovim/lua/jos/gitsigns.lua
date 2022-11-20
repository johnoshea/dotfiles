local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[g', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    -- Popup what's changed in a hunk under cursor
    map('n', '<leader>gpr', gs.preview_hunk)

    -- stage/reset individual hunks under cursor
    map({'n', 'v'}, '<leader>gs', gs.stage_hunk)
    map({'n', 'v'}, '<leader>gr', gs.reset_hunk)
    map({'n', 'v'}, '<leader>gu', gs.undo_stage_hunk)

    -- stage/reset all hunks in a file
    map({'n', 'v'}, '<leader>gS', gs.stage_buffer)
    map({'n', 'v'}, '<leader>gR', gs.reset_buffer)
    map({'n', 'v'}, '<leader>gU', gs.reset_buffer_index)


    -- toggle line blame
    map({'n', 'v'}, '<leader>gb', function() gs.blame_line{full=true} end)
    map({'n', 'v'}, '<leader>gB', gs.toggle_current_line_blame)

    -- diffthis
    map({'n', 'v'}, '<leader>gd', gs.diffthis)
    map({'n', 'v'}, '<leader>gD', function() gs.diffthis('~') end)

    map({'n', 'v'}, '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
