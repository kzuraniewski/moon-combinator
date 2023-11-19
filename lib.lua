--- This is a universal library to the AAI Moon Combinator control system
--- The below code will be compressed and parsed into each combinator script
--- The library operates solely on red wire

--- common utility functions for controllers
lib = {};

lib.CLOCK_SIGNAL = 'signal-A';
lib.MAX_DELAY = 60 * 60 * 60 * 24 * 365; -- 1 year

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
    delay = lib.MAX_DELAY;
    irq = signalName;
end

--- synchronize this controller with attached clock
function lib.synchronize()
    lib.createTrigger(lib.CLOCK_SIGNAL);
end

function lib.reset()
    out = {};
    var = {};
end
