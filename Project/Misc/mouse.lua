local mouse = {}

	mouse.x = 0
	mouse.y = 0

	function mouse.update()
		mouse.x = love.mouse.getX()
		mouse.y = love.mouse.getY()
	end

return mouse