local function get_php_version_from_composer()
	local composer_file = io.open("composer.json", "r")
	if composer_file == nil then
		return nil
	end

	local composer_content = composer_file:read("*a")
	composer_file:close()

	local composer_data = vim.fn.json_decode(composer_content)

	if composer_data and composer_data.require and composer_data.require.php then
		return composer_data.require.php
	else
		return nil
	end
end

local php_version = get_php_version_from_composer()

local settings = {}

if php_version then
	settings = {
		intelephense = {
			environment = {
				phpVersion = php_version,
			},
		},
	}
end

return {
	commands = {
		IntelephenseIndex = {
			function()
				vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
			end,
		},
	},
	settings = settings,
}
