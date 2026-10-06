local Player = {}

local directions = {
    { x = 0, y = -1 },
    { x = 1, y = 0 },
    { x = 0, y = 1 },
    { x = -1, y = 0 }
}

function Player.new(x, y)
    return { x = x, y = y, direction = 0 }
end

function Player.moveForward(player, map)
    local direction = directions[player.direction + 1]

    local newX = player.x + direction.x
    local newY = player.y + direction.y

    if map.isWalkable(newX, newY) then
        player.x = newX
        player.y = newY
    end
end

function Player.turnLeft(player)
    player.direction = (player.direction - 1) % 4
end

function Player.turnRight(player)
    player.direction = (player.direction + 1) % 4
end

function Player.draw(player)
    local tileSize = 32
    local centerX = (player.x - 1) * tileSize + tileSize / 2
    local centerY = (player.y - 1) * tileSize + tileSize / 2

    local size = 10

    local points = {
        centerX, centerY - size,
        centerX - size, centerY + size,
        centerX + size, centerY + size
    }

    if player.direction == 1 then -- leste
        points = {
            centerX + size, centerY,
            centerX - size, centerY - size,
            centerX - size, centerY + size
        }
    elseif player.direction == 2 then -- sul
        points = {
            centerX, centerY + size,
            centerX - size, centerY - size,
            centerX + size, centerY - size
        }
    elseif player.direction == 3 then -- oeste
        points = {
            centerX - size, centerY,
            centerX + size, centerY - size,
            centerX + size, centerY + size
        }
    end

    love.graphics.polygon("fill", points)
end

return Player