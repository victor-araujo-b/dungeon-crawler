local Camera = {}

local directions = {
    { x = 0, y = -1 },
    { x = 1, y = 0 },
    { x = 0, y = 1 },
    { x = -1, y = 0 }
}

local function getSideDirection(direction)
    if direction.x == 0 then
        return { x = 1, y = 0 }
    end

    return { x = 0, y = 1 }
end

function Camera.draw(player, map)
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()

    local centerX = screenWidth / 2
    local centerY = screenHeight / 2

    local cameraX = player.x
    local cameraY = player.y

    local direction = directions[player.direction + 1]
    local sideDirection = getSideDirection(direction)

    local x = cameraX
    local y = cameraY

    for distance = 1, 4 do
        x = x + direction.x
        y = y + direction.y

        local tile = map.getTile(x, y)

        local leftX = x - sideDirection.x
        local leftY = y - sideDirection.y

        local rightX = x + sideDirection.x
        local rightY = y + sideDirection.y

        local leftTile = map.getTile(leftX, leftY)
        local rightTile = map.getTile(rightX, rightY)

        -- Parede esquerda
        if leftTile == 1 then
            local size = 300 / distance

            love.graphics.polygon(
                "line",
                centerX - size / 2,
                centerY - size / 2,
                centerX - size,
                centerY - size * 1.5,
                centerX - size,
                centerY + size * 1.5,
                centerX - size / 2,
                centerY + size / 2
            )
        end

        -- Parede frontal
        if tile == 1 then
            local size = 300 / distance

            love.graphics.rectangle(
                "line",
                centerX - size / 2,
                centerY - size / 2,
                size,
                size
            )

            break
        end
    end
end

return Camera