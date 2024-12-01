return {
  "preservim/vimux",
  config = function()
    local keymap = vim.keymap.set -- shorten function name
    local opts = { silent = true } -- silent keymap option
    local function createOpts(params)
      local result = opts

      -- If params table is provided, merge it with result
      if params then
        for k, v in pairs(params) do
          result[k] = v
        end
      end

      return result
    end
    keymap("n", "<Leader>vp", ":VimuxPromptCommand<CR>", createOpts({ desc = "[v]imux [p]rompt" }))
    keymap("n", "<Leader>vl", ":VimuxRunLastCommand<CR>", createOpts({ desc = "[v]imux [l]ast" }))
    keymap("n", "<Leader>vi", ":VimuxInspectRunner<CR>", createOpts({ desc = "[v]imux [i]nspect" }))
    keymap("n", "<Leader>vq", ":VimuxCloseRunner<CR>", createOpts({ desc = "[v]imux [q]uit" }))
    keymap("n", "<Leader>vx", ":VimuxInterruptRunner<CR>", createOpts({ desc = "[v]imux [x] interrupt runner" }))
    keymap("n", "<Leader>vr", ":VimuxRunCommand<CR>", createOpts({ desc = "[v]imux [r]un command" }))
    keymap("n", "<Leader>vz", ":call VimuxZoomRunner()<CR>", createOpts({ desc = "[v]imux [z]oom runner" })) -- Zoom the runner pane (use <bind-key> z to restore runner pane)
  end,
}
