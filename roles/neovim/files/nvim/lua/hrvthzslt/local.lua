-- Try to load 'local.lua' from the current working directory, if it exists.
local local_config = vim.uv.cwd() .. "/local.lua"
local stat = vim.uv.fs_stat(local_config)
if stat and stat.type == "file" then
	local ok, err = pcall(dofile, local_config)
	if not ok then
		vim.notify("Error loading local.lua: " .. tostring(err), vim.log.levels.ERROR)
	end
end
