-- scripts/menu.lua
menuOptions = {"Difficulty", "Local", "Multiplayer"}
selectedOption = 1

function drawMenu()
    love.graphics.setColor(1, 1, 1) -- Normal color for "Pong" and "Difficulty"
    love.graphics.print("Revolutionary Pong", windowWidth / 2 - 50, 50)

    for i, option in ipairs(menuOptions) do
        if i == selectedOption then
            love.graphics.setColor(1, 0, 0) -- Highlight color
        else
            love.graphics.setColor(1, 1, 1) -- Normal color
        end
        love.graphics.print(option, windowWidth / 2 - 50, 100 + (i - 1) * 50)
    end
end

function startGameMusic()
    song = love.audio.newSource("assets/Audio/Music/song.ogg", "stream")
    song:setLooping(true)
    song:setVolume(0.25)
    love.audio.play(song)
end

function handleMenuInput(key)
    if key == "up" then
        selectedOption = selectedOption - 1
        if selectedOption < 1 then
            selectedOption = #menuOptions
        end
        sfx_menu_navigate:play()
    elseif key == "down" then
        selectedOption = selectedOption + 1
        if selectedOption > #menuOptions then
            selectedOption = 1
        end
        sfx_menu_navigate:play()
    end

    if key == "return" then
        sfx_menu_select:play()
        if menuOptions[selectedOption] == 'Local' then
            gameState = 'playing'
            startGameMusic()
        elseif menuOptions[selectedOption] == 'Multiplayer' then
            gameState = 'playing_online'
            startGameMusic()
        elseif menuOptions[selectedOption] == 'Difficulty' then
            gameState = 'Difficulty'
        end
    end
end