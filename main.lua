io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")


logger = require("Project/Logs/logger")
debugger = require("Project/Debug/debugger")

require("Project/Misc/misc")

game = require("Project/Game/game")

function love.load()
	colors.load()
	colors.newColor("red", 1, 0, 0)

	game.load()
end


function love.update(dt)
	mouse.update()
	
	game.update(dt)
end


function love.quit()
	logger.addLog(logger.codeList.info, "Game close required")
	logger.export()
end


function love.keypressed(key)
	logger.keypressed(key)

	game.keypressed(key)
end


function love.mousepressed(x, y, click)
	game.mousepressed(x, y, click)
end


function love.draw()
	game.draw()
end