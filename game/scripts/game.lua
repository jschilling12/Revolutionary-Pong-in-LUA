-- scripts/game.lua
function drawGame()
    love.graphics.setColor(1, 1, 1)

    -- Draw paddles
    love.graphics.rectangle("fill", left_side.x, left_side.y, left_side.width, left_side.height)
    love.graphics.rectangle("fill", right_side.x, right_side.y, right_side.width, right_side.height)

    -- Draw net line
    love.graphics.line(windowWidth / 2, 0, windowWidth / 2, windowHeight)

    -- Draw ball
    love.graphics.circle("fill", circle.x, circle.y, circle.radius, 100)

    -- Draw scoreboard
    love.graphics.print("Player: " .. scoreboard.player, 50, 10)
    love.graphics.print("Opponent: " .. scoreboard.opponent, windowWidth - 150, 10)
end

function paddle_ball(dt)
    -- Player-controlled left paddle
    if love.keyboard.isDown("up") then
        left_side.y = left_side.y - left_side.speed * dt
    elseif love.keyboard.isDown("down") then
        left_side.y = left_side.y + left_side.speed * dt
    end
    left_side.y = math.max(0, math.min(windowHeight - left_side.height, left_side.y))

    -- Ball movement
    circle.x = circle.x + circle.vx * dt
    circle.y = circle.y + circle.vy * dt

    -- Ball boundary collision (top/bottom)
    if circle.y - circle.radius <= 0 or circle.y + circle.radius >= windowHeight then
        circle.vy = -circle.vy
    end

    -- Paddle collisions
    if circle.x - circle.radius <= left_side.x + left_side.width 
        and circle.y >= left_side.y 
        and circle.y <= left_side.y + left_side.height then
            circle.vx = math.abs(circle.vx)
            sfx_ball:play()
    elseif circle.x + circle.radius >= right_side.x
        and circle.y >= right_side.y 
        and circle.y <= right_side.y + right_side.height then
            circle.vx = -math.abs(circle.vx)
            sfx_ball:play()
    end

    -- Scoring logic
    if circle.x + circle.radius < 0 then
        scoreboard.opponent = scoreboard.opponent + 1
        sfx_score:play()
        resetBall()
    elseif circle.x - circle.radius > windowWidth then 
        scoreboard.player = scoreboard.player + 1
        sfx_score:play()
        resetBall()
    end
end