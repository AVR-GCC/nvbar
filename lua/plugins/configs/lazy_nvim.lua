return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
  icons = {
    dap = {
      Breakpoint = { "🟥", "DiagnosticError" },        -- Red square for breakpoints
      BreakpointCondition = { "🟧", "DiagnosticWarn" }, -- Orange square for conditional breakpoints
      BreakpointRejected = { "❌", "DiagnosticError" }, -- Cross for rejected breakpoints
      Stopped = { "🟩", "DiagnosticInfo" },            -- Green square for stopped state
      LogPoint = { "🟦", "DiagnosticHint" },           -- Blue square for log points
      Pause = { "⏸️", "DiagnosticInfo" },              -- Pause icon
      Continue = { "▶️", "DiagnosticInfo" },           -- Play icon for continue
      StepOver = { "➡️", "DiagnosticInfo" },           -- Arrow for step over
      StepInto = { "⬇️", "DiagnosticInfo" },           -- Down arrow for step into
      StepOut = { "⬆️", "DiagnosticInfo" },            -- Up arrow for step out
      StepBack = { "⏪", "DiagnosticInfo" },            -- Rewind for step back
      Terminate = { "⏹️", "DiagnosticInfo" },          -- Stop icon for terminate
      Restart = { "🔄", "DiagnosticInfo" },            -- Refresh icon for restart
    }
  }
}
