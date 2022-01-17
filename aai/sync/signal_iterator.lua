-- desc: synchronic signal iterator
-- FIXME: when no units of type, doesnt work
local SIGNAL_NAMES = {
    'vehicle-hauler-0-_-signal', 'vehicle-miner-0-_-signal',
    'vehicle-miner-mk2-0-_-signal'
}

-- if last quantity was 0 then move to next signal, else increment unitIndex
if red['signal-count'] == 0 or (var.unitIndex or 0) >= red['signal-count'] then
    -- increment signalIndex
    var.signalIndex = (var.signalIndex or 0) % #SIGNAL_NAMES + 1

    -- reset unitIndex
    var.unitIndex = 1
else
    -- increment unitIndex
    var.unitIndex = (var.unitIndex) % red['signal-count'] + 1
end

-- send test signal
out = {[SIGNAL_NAMES[var.signalIndex]] = var.unitIndex}

delay = 999999999
irq = 'signal-A'
