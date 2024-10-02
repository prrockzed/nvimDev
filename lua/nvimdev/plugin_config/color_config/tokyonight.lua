local status_ok, options = pcall(require, "tokyonight")
if not status_ok then
	return
end

options.setup({})

