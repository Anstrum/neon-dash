local export = require("Project/Logs/exportLog")
local logger = {}

	logger.exportOnEnd = true

	logger.codeList = {}
		logger.codeList.info = "INFO"
		logger.codeList.warn = "WARNING"
		logger.codeList.error = "ERROR"

	logger.logList = {}


	function logger.keypressed(key)
		if key == "f1" then
			logger.exportOnEnd = not logger.exportOnEnd
		end
	end


	function logger.export()
		if not logger.exportOnEnd then
			return
		end

		export.sendToFile(logger.logList)
	end



	function logger.addLog(type, content, toPrint)
		if content == nil  then
			logger.addLog(logger.codeList.error, "NO LOG CONTENT")

			love.event.quit()
			return
		end

		local myLog = {
			type = type,
			content = content
		}

		table.insert(logger.logList, myLog)

		if toPrint then
        	print(string.format("[%s] %s", type, content))
    	end
	end

return logger