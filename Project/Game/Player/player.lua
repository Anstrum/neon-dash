local player = {}


    local MAX_SPEED = 600
    local ACCELERATION = 1000
    local SLOW_POWER = 2000
    local GRAVITY = 1000
    local JUMP_BOOST = -600
    local STOP_THRESHOLD = 50


    player.x = 0
    player.y = 0
    player.height = 70
    player.width = 40


    player.hitbox = {
        x = 0,
        y = 0,
        width = 0,
        height = 0,
        color = "playerHbColor",
        scale = 1,
        offsetX = 0,
        offsetY = 0
    }



    function player.load()
        player.x = screen.width / 2
        player.y = screen.height * 0.6
        player.vx = 0
        player.vy = 0

        colors.newColor(player.hitbox.color, 1, 0, 0, 1)
    end


    local function handleMovement(dt)
        local direction = 0
        if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
            direction = direction + 1
        end
        if love.keyboard.isDown("q") or love.keyboard.isDown("left") then
            direction = direction - 1
        end

        if direction ~= 0 then
            if player.vx * direction < 0 then
                player.vx = player.vx + direction * SLOW_POWER * dt
            else
                player.vx = player.vx + direction * ACCELERATION * dt
            end
            if math.abs(player.vx) > MAX_SPEED then
                player.vx = direction * MAX_SPEED
            end
        else
            if math.abs(player.vx) < STOP_THRESHOLD then
                player.vx = 0
            else
                player.vx = player.vx - math.sign(player.vx) * SLOW_POWER * dt
            end
        end
    end

    local function handleGravity(dt)
        player.vy = player.vy + GRAVITY * dt
        if player.y > screen.height * 0.6 then
            player.y = screen.height * 0.6
            player.vy = 0
        end
    end


    function player.update(dt)
        handleMovement(dt)
        player.x = player.x + player.vx * dt
        player.y = player.y + player.vy * dt
        handleGravity(dt)
    end


    function player.keypressed(key)
        if key == "space" and player.y == screen.height * 0.6 then
            player.vy = JUMP_BOOST
        end
    end


    function player.mousepressed(x, y, click)
    end


    function player.draw()
        colors.set(player.hitbox.color)
        love.graphics.rectangle("line", 
            player.x + player.hitbox.offsetX, 
            player.y + player.hitbox.offsetY, 
            player.width * player.hitbox.scale, 
            player.height * player.hitbox.scale)
    end

return player