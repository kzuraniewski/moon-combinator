-- desc: dot movement control

-- grid size
local gridSize = { ['width'] = 4, ['height'] = 4 }

-- instantiate position
if var.pos == nil then var.pos = { ['x'] = 0, ['y'] = 0 } end

-- movement control
if red['signal-X'] ~= 0 then
    var.pos.x = (var.pos.x + red['signal-X']) % gridSize.width
end

if red['signal-Y'] ~= 0 then
    var.pos.y = (var.pos.y + red['signal-Y']) % gridSize.height
end

-- display control
local signals = 'ABCD'
local signal = signals:sub(var.pos.x + 1, var.pos.x + 1)

out = { ['signal-' ..signal] = var.pos.y + 1, ['signal-red'] = 1 }