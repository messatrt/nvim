return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = { "rose-pine",
        "moonfly",
        "rose-pine-moon",
        "onedark", "onelight",
        "onedark_vivid",
        "onedark_dark"
      }, -- Your list of installed colorschemes.
      livePreview = true,
    })
  end
}
