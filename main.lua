local Map    = require("map")
local Player = require("player")
local Camera = require("camera")

local player

function love.load()
    player = Player.new(2, 2)
end

function love.keypressed(key)
    if key == "w" then
        Player.moveForward(player, Map)
    elseif key == "a" then
        Player.turnLeft(player)
    elseif key == "d" then
        Player.turnRight(player)
    end
end

function love.update(dt)

end

function love.draw()
    Map.draw()
    Player.draw(player)
    Camera.draw(player, Map)
end