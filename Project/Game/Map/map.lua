local map = {}

	map.currentLevel = nil

	function map.load()
		map.currentLevel = require("Project/Game/Map/testMapLevel")

		for i = 1, #map.currentLevel.colors do
			colors.newColor(map.currentLevel.colors[i][1],
				map.currentLevel.colors[i][2],
				map.currentLevel.colors[i][3],
				map.currentLevel.colors[i][4],
				map.currentLevel.colors[i][5])
		end
	end

	function map.update(dt)
	end

	function map.draw()
		local myMap = map.currentLevel

		for i = 1, #myMap.walls do
			colors.set(myMap.walls[i][1])
			love.graphics.rectangle('fill', myMap.x + myMap.walls[i][2],
				myMap.y + myMap.walls[i][3],
				myMap.walls[i][4],
			myMap.walls[i][5])
		end
	end

return map