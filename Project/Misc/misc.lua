mouse = require("Project/Misc/mouse")
colors = require("Project/Misc/colors")
screen = require("Project/Misc/screen")
calc = require("Project/Misc/calc")

function math.sign(x)
    if x < 0 then
        return -1
    elseif x > 0 then
        return 1
    else
        return 0
    end
end