return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      suppressed_dirs = {
        "/",
        "/Users",
        "/opt",
        "/private",
        "~/",
        "~/Downloads",
        "~/Projects",
      },
    })
  end,
}
