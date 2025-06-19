local function config()
	require("illuminate").configure({
		-- delay: delay in milliseconds
		delay = 0,
	})
end

return {
	"RRethy/vim-illuminate",
	config = config,
}
