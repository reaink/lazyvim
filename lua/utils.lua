local M = {}

-- use https://github.com/sho-87/dotfiles/blob/f335d930f6a5745157072e9f1eee851ca375740b/nvim/lua/plugins/modules/alpha.lua#L18
M.create_gradient = function(start, finish, steps)
	local r1, g1, b1 =
		tonumber("0x" .. start:sub(2, 3)), tonumber("0x" .. start:sub(4, 5)), tonumber("0x" .. start:sub(6, 7))
	local r2, g2, b2 =
		tonumber("0x" .. finish:sub(2, 3)), tonumber("0x" .. finish:sub(4, 5)), tonumber("0x" .. finish:sub(6, 7))

	local r_step = (r2 - r1) / steps
	local g_step = (g2 - g1) / steps
	local b_step = (b2 - b1) / steps

	local gradient = {}
	for i = 1, steps do
		local r = math.floor(r1 + r_step * i)
		local g = math.floor(g1 + g_step * i)
		local b = math.floor(b1 + b_step * i)
		table.insert(gradient, string.format("#%02x%02x%02x", r, g, b))
	end

	return gradient
end

return M
