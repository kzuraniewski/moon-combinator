-- desc: item status display

-- set display through external signal
delay = red['signal-D']

-- local display data
local maxQuantity = 100000
local displayHeight = 5
local itemSignal = 'wood'

-- DISPLAY CONTROL --------------------------------------------------------------------------------------------------------------------

local amount = red[itemSignal]

-- set display color
local colorSignal = nil
if amount < (maxQuantity / 3) then
    colorSignal = 'signal-red'
elseif amount >= (2 * maxQuantity / 3) then
    colorSignal = 'signal-green'
else colorSignal = 'signal-yellow' end

-- refresh output
out = { ['signal-A'] = amount, [colorSignal] = 1 }

-- calculate thresholds
for i=1, (displayHeight - 1) do
    out['signal-' ..i] = i * maxQuantity / displayHeight
end