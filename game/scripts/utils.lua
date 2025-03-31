-- scripts/utils.lua
function resetBall()
    circle.x, circle.y = windowWidth / 2, windowHeight / 2

    -- Ensure noticeable horizontal motion
    local angle
    repeat
        angle = math.random() * (2 * math.pi)
    until math.abs(math.cos(angle)) > 0.3

    circle.vx = math.cos(angle) * circle.speed
    circle.vy = math.sin(angle) * circle.speed

    missOffset = randomGaussian(0, 0.15) * windowHeight
end

function randomGaussian(mean, stddev)
    local u1 = math.random()
    local u2 = math.random()
    local z0 = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
    return z0 * stddev + mean
end