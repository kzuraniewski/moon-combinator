-- desc: resource marking
-- FIXME: after last zone updated, the coordinates stay on output and the tile cannot be marked by other zones

local SIGNAL_NAME = 'zone-disc-white'
local RESOURCE_ZONES = {
    ['iron-ore'] = 'zone-disc-cyan',
    ['copper-ore'] = 'zone-disc-orange',
    ['stone'] = 'zone-disc-yellow',
    ['coal'] = 'zone-disc-black',
    ['uranium-ore'] = 'zone-disc-green'
}

-- output coordinates
out = {
    ['signal-x-tile'] = red['signal-x-tile'],
    ['signal-y-tile'] = red['signal-y-tile']
}

-- check if the tile contains ore
local foundSignal = ''
for itemSignal, zoneSignal in pairs(RESOURCE_ZONES) do
    if red[itemSignal] > 0 then 
        foundSignal = itemSignal;
        break;
    end
end

-- if a resource signal is found then mark the tile
if foundSignal ~= '' then out[RESOURCE_ZONES[foundSignal]] = 1 end

delay = 999999999
irq = SIGNAL_NAME