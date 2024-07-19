local game = {}

	player = require("Project/Game/Player/player")
	map = require("Project/Game/Map/map")
	camera = require("Project/Game/Camera/camera")

	function game.load()
		camera.load()
		player.load()
		map.load()
	end

	function game.update(dt)
		player.update(dt)
	end

	function game.keypressed(key)
		player.keypressed(key)
	end

	function game.mousepressed(x, y, click)
		player.mousepressed(x, y, click)
	end

	function game.draw()
		map.draw()
		player.draw()
	end



return game