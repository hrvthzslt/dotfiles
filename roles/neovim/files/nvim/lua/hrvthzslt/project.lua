local M = {}

-- Read a config file called hrvthzslt.json in the current directory and return the content as a table.
-- Example conf.json:
-- {
--     "test": {
--         "python": "/path/to/python"
--     }
-- }
-- @return table<string, table<string, string>>|nil
function M.read_json_conf()
	local file = io.open("hrvthzslt.json", "r")
	if file then
		local content = file:read("*a")
		file:close()
		return vim.json.decode(content)
	end
	return nil
end

return M
