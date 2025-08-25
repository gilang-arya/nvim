return {
  "folke/ts-comments.nvim",
  event = "BufReadPre",
  config = function()
    require("ts-comments").setup({
      keymaps = {
        toggle_line = "gb",
        toggle_block = "gc",
      },
    })
  end,
}