local export = {}

	
	function export.sendToFile(logList)
		local appDataPath = love.filesystem.getAppdataDirectory() .. "/MyGame/"


	    if not love.filesystem.getInfo(appDataPath) then
	        love.filesystem.createDirectory(appDataPath)
	    end



		local filename = os.date("%Y-%m-%d_%H-%M-%S") .. "_log.txt"

	    local file = love.filesystem.newFile(filename, "w")

	    if not file then
	        print("Error opening file for writing logs")
	        return
	    end

	    for _, log in ipairs(logList) do
        	file:write(string.format("[%s] %s\n", log.type, log.content))
   		end

   		file:close()
	end


return export