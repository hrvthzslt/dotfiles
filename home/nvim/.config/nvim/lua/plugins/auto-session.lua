local function config()
    require("auto-session").setup {
      log_level = "error",
    }
end

return {
    'rmagatti/auto-session',
    config = config
}
