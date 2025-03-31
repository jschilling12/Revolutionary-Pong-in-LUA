-- scripts/difficulty.lua
difficulty = 1
difficulty_options = {"Easy", "Medium", "Hard"}

function drawDifficulty()
    love.graphics.setColor(1, 1, 1) -- Normal color for "Difficulty"
    love.graphics.print("Select Difficulty", windowWidth / 2 - 50, 50)
    
    for i, option in ipairs(difficulty_options) do
        if i == difficulty then
            love.graphics.setColor(1, 0, 0) -- Highlight color
        else
            love.graphics.setColor(1, 1, 1) -- Normal color
        end
        love.graphics.print(option, windowWidth / 2 - 50, 100 + (i - 1) * 50)
    end
end

function handleDifficultyInput(key)
    if key == "up" then
        difficulty = difficulty - 1
        if difficulty < 1 then
            difficulty = #difficulty_options
        end
        sfx_menu_navigate:play()
    elseif key == "down" then
        difficulty = difficulty + 1
        if difficulty > #difficulty_options then
            difficulty = 1
        end
        sfx_menu_navigate:play()
    end

    if key == "return" then
        sfx_menu_select:play()
        if difficulty_options[difficulty] == 'Easy' then
            circle.speed = 400
        elseif difficulty_options[difficulty] == 'Medium' then
            circle.speed = 600
        elseif difficulty_options[difficulty] == 'Hard' then
            circle.speed = 1000
        end
        print("Selected difficulty:", difficulty_options[difficulty], "Circle speed:", circle.speed)
        resetBall()  -- Ensure the ball speed is updated immediately
        gameState = 'menu'
    end
end