-- desc: synchronic signal iterator
-- FIXME: when no units of type, doesnt work

local SIGNAL_NAMES = {'vehicle-hauler-0-_-signal', 'vehicle-miner-0-_-signal'}

-- quantity
local N = math.max(red['signal-count'], 1)

local signal = SIGNAL_NAMES[math.min(var.signalIndex or 1, #SIGNAL_NAMES)]

-- increment value
var.index = (var.index or 0) % N + 1
out = {[signal] = var.index}

-- next signal if last index met
if var.index >= N then
    var.signalIndex = (var.signalIndex or 1) % #SIGNAL_NAMES + 1;
    var.index = 0;
end

delay = 999999999
irq = 'signal-A'