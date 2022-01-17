-- desc: clock

local SIGNAL_NAME = 'signal-A'

if out[SIGNAL_NAME] == 0 then
    out = { [SIGNAL_NAME] = 1 }
    delay = 0
else
    out = {}
    delay = 20
end