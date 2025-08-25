return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	config = function()
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
		end

		map("<M-h>", "<cmd>TmuxNavigateLeft<cr>", "Navigate Left")
		map("<M-j>", "<cmd>TmuxNavigateDown<cr>", "Navigate Down")
		map("<M-k>", "<cmd>TmuxNavigateUp<cr>", "Navigate Up")
		map("<M-l>", "<cmd>TmuxNavigateRight<cr>", "Navigate Right")
		map("<M-'>", "<cmd>TmuxNavigatePrevious<cr>", "Navigate Previous")
	end,
}