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
    on_attach = function(client)
        client.server_capabilities.completionProvider = false
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.implementationProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.renameProvider = false
        client.server_capabilities.selectionRangeProvider = false
        client.server_capabilities.signatureHelpProvider = false
        client.server_capabilities.typeDefinitionProvider = false
        client.server_capabilities.workspaceSymbolProvider = false
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.documentHighlightProvider = false
        client.server_capabilities.documentSymbolProvider = false
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
	commands = {
		IntelephenseIndex = {
			function()
				vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
			end,
		},
	},
	settings = settings,
}
