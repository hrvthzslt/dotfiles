-- Try to load 'local.lua' from the current working directory, if it exists.
local local_config = vim.loop.cwd() .. "/local.lua"
local stat = vim.loop.fs_stat(local_config)
if stat and stat.type == "file" then
	local ok, err = pcall(dofile, local_config)
	if not ok then
		vim.notify("Error loading local.lua: " .. tostring(err), vim.log.levels.ERROR)
	else
        vim.notify("Loaded local.lua from current working directory", vim.log.levels.INFO)
	end
end
