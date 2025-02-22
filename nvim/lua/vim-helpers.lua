-- all vim helper functions here

local vim = vim
vim.keymap.set("n", "<leader>ce", function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diagnostics > 0 then
		local message = diagnostics[1].message
		vim.fn.setreg("+", message)
		print("Copied diagnostic: " .. message)
	else
		print("No diagnostic at cursor")
	end
end, { noremap = true, silent = true })

-- go to errors in a file :/
vim.keymap.set("n", "<leader>ne", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true }) -- next Error
vim.keymap.set("n", "<leader>pe", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true }) -- prev Error
vim.keymap.set("n", "<leader>le", function()
  vim.diagnostic.open_float({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true }) -- open List Error

-- go to warning in a file :/
vim.keymap.set("n", "<leader>nw", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { silent = true }) -- next Warn
vim.keymap.set("n", "<leader>pw", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
end, { silent = true }) -- prev Warn
vim.keymap.set("n", "<leader>lw", function()
  vim.diagnostic.open_float({ severity = vim.diagnostic.severity.WARN })
end, { silent = true }) -- open List Warn

-- copy current file path (absolute) into clipboard
vim.keymap.set("n", "<leader>cp", function()
	local filepath = vim.fn.expand("%:p")
	vim.fn.setreg("+", filepath) -- Copy to Neovim clipboard
	vim.fn.system("echo '" .. filepath .. "' | pbcopy") -- Copy to macOS clipboard
	print("Copied: " .. filepath)
end, { desc = "Copy absolute path to clipboard" })
