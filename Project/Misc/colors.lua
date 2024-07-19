local colors = {}

	colors.list = {}

	function colors.load()
		colors.list[0] = colors.newColor("white", 1, 1, 1, 1)
	end

	function colors.newColor(name, r, g, b, a)
		for i = 1, #colors.list do
			if colors.list[i].name == name then
				love.event.quit()
			end
		end

		local myColor = {}
			myColor.name = name
			myColor.r = r
			myColor.g = g
			myColor.b = b
			myColor.a = a or 1
		table.insert(colors.list, myColor)
	end

	function colors.set(name)
		local colorToSet = colors.list[0]
		for i = 1, #colors.list do
			local currentColor = colors.list[i]
			if currentColor.name == name then
				colorToSet = currentColor
				break
			end
		end
		love.graphics.setColor(colorToSet.r, colorToSet.g, colorToSet.b, colorToSet.a)
	end

return colors