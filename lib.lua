--- v. 0.1.0
--- This is a universal library to the AAI Moon Combinator control system
--- The below code will be compressed and parsed into each combinator script
--- The library operates solely on red wire

--- common utility functions for controllers
lib = {};

-- clear output
out = {};

--- Pass specified signals from input to output if received. 
--- Provide signal names as arguments or leave empty to pass all.
function lib.passSignals(...)
    local args = {...};
    
    if #args == 0 then
        out = red;
        return;
    end

    if out == nil then out = {}; end

    for index, signal in ipairs(args) do
        out[signal] = red[signal];
    end
end

function lib.createTrigger(signalName)
    delay = math.maxinteger;
    irq = signalName;
end
