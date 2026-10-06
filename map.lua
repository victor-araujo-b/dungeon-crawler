local map = {
    {1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 1},
    {1, 0, 1, 1, 1, 0, 1},
    {1, 0, 0, 0, 1, 0, 1},
    {1, 0, 1, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1}
}

local Map = {}

function Map.getTile(x, y)
    return map[y] and map[y][x]
end

function Map.isWalkable(x, y)
    return map[y] and map[y][x] == 0
end

function Map.draw()
    local tileSize = 32
    for y, row in ipairs(map) do
        for x, tile in ipairs(row) do
            local mode = "line"
            if tile == 1 then
                mode = "fill"
            end
            love.graphics.rectangle(mode, (x - 1) * tileSize, (y - 1) * tileSize, tileSize, tileSize)
        end
    end
end

return Map