return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	config = function()
		local map = function(lhs, rhs, desc) 
			vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
		end

		map("<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", "Navigate Left")
		map("<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", "Navigate Down")
		map("<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", "Navigate Up")
		map("<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", "Navigate Right")
		map("<c-\">", "<cmd><C-U>TmuxNavigatePrevious<cr>", "Navigate Previous")
	end,
}