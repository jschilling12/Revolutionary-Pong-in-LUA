if arg[2] == "debug" then
    require("lldebugger").start()
end
launch_type = "debug"

windowWidth, windowHeight = 800, 600
missOffset = 0
gameState = 'menu'

-- Require scripts
require("scripts.menu")
require("scripts.difficulty")
require("scripts.game")
require("scripts.utils")

function love.load()

    if gameState == 'playing' or gameState == 'playing_online' then
    song = love.audio.newSource("assets/Audio/Music/song.ogg", "stream")
    song:setLooping(true)
    song:setVolume(0.5)
    love.audio.play(song)
    end

    windowWidth, windowHeight = love.graphics.getDimensions()
    math.randomseed(os.time())

    left_side = {
        x = 10,
        y = windowHeight / 2 - 50,
        width = 25,
        height = 100,
        speed = 600
    }

    right_side = {
        x = windowWidth - 35,
        y = windowHeight / 2 - 50,
        width = 25,
        height = 100,
        speed = 600
    }

    circle = {
        x = windowWidth / 2,
        y = windowHeight / 2,
        radius = 20,
        speed = 600
    }

    scoreboard = {
        player = 0,
        opponent = 0
    }

    resetBall()

    sfx_ball = love.audio.newSource("assets/Audio/SFX/Ball_Impact.ogg", "static")
    sfx_score = love.audio.newSource("assets/Audio/SFX/Score.ogg", "static")
    sfx_menu_select = love.audio.newSource("assets/Audio/SFX/Menu_Buttons_Confirm.ogg", "static")
    sfx_menu_navigate = love.audio.newSource("assets/Audio/SFX/Menu_Options.ogg", "static")
    sfx_score:setVolume(0.5)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if gameState == 'menu' then
        handleMenuInput(key)
    elseif gameState == 'Difficulty' then
        handleDifficultyInput(key)
    end
end

function love.update(dt)
    if gameState == 'playing_online' then
        -- existing gameplay logic here
        -- (keep all existing logic inside this condition)

        if love.keyboard.isDown("w") then
            right_side.y = right_side.y - right_side.speed * dt
        elseif love.keyboard.isDown("s") then
            right_side.y = right_side.y + right_side.speed * dt
        end

        if left_side.y < 0 then
            left_side.y = 0
        elseif left_side.y > (600 - left_side.height) then -- 500 is your lower boundary (window height - rectangle height)
            left_side.y = 600 - left_side.height
        end

        if right_side.y < 0 then
            right_side.y = 0
        elseif right_side.y > (windowHeight - right_side.height) then
            right_side.y = windowHeight - right_side.height
        end
        paddle_ball(dt)
    elseif gameState == 'playing' then
        -- AI paddle movement with randomness
        local target_y = circle.y + missOffset - right_side.height / 2
        local paddle_speed = right_side.speed * dt

        if right_side.y + right_side.height / 2 < target_y then
            right_side.y = math.min(right_side.y + paddle_speed, windowHeight - right_side.height)
        elseif right_side.y + right_side.height / 2 > target_y then
            right_side.y = math.max(right_side.y - paddle_speed, 0)
        end
        paddle_ball(dt)
    end
end

function love.draw()
    if gameState == 'menu' then
        drawMenu()
    elseif gameState == 'Difficulty' then
        drawDifficulty()
    elseif gameState == 'playing' or gameState == 'playing_online' then
        drawGame()
    end
end

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end