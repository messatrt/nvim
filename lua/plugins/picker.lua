return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {"rose-pine", "moonfly"}, -- Your list of installed colorschemes.
  livePreview = true,
      })
    end
  }
