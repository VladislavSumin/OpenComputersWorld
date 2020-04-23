local component = require('component')
local robot = component.robot
local sides = require('sides')

local libRobot = setmetatable({}, { __index = robot })

---------------------------------------------------------------------------
---                         movementPolicies                            ---
---------------------------------------------------------------------------

libRobot.defaultMovementPolicies = {
    --- Assert movement policy. Throw exception on triggered
    --- @param direction number
    --- @param error string
    --- @return boolean - throw exception
    assert = function(direction, error)
        _G.error('robot can`t move {side: ' .. sides[direction] .. ', error: ' .. error .. '}')
    end,

    --- Retry movement policy.
    --- @return boolean always true
    retry = function()
        return true
    end,

    --- Skip movement policy.
    --- @return boolean always false
    skip = function()
        return false
    end,
}

libRobot.movementPolicies = setmetatable(
        {
            entity = libRobot.defaultMovementPolicies.retry,
            default = libRobot.defaultMovementPolicies.assert,
        }, {
            __index = function(table, index)
                if (index == 'already moving') then
                    return libRobot.defaultMovementPolicies.retry
                end
                return table.default
            end
        }
)

---------------------------------------------------------------------------
---                 default robot methods overrides                     ---
---------------------------------------------------------------------------

--- Move in the specified direction. Apply librobot.movementPolicies
--- @param direction number
--- @return boolean
function libRobot.move(direction)
    while true do
        local isSuccess, error = robot.move(direction)
        if isSuccess or not libRobot.movementPolicies[error](direction, error) then
            return isSuccess, error
        end
    end
end

---------------------------------------------------------------------------
---                             exec api                                ---
---------------------------------------------------------------------------

local words = {
    -- Move
    mf = function()
        libRobot.move(sides.forward)
    end,
    mb = function()
        libRobot.move(sides.back)
    end,
    mu = function()
        libRobot.move(sides.up)
    end,
    md = function()
        libRobot.move(sides.down)
    end,

    -- Turn
    tl = function()
        libRobot.turn(false)
    end,
    tr = function()
        libRobot.turn(true)
    end,

    -- Place
    pf = function()
        libRobot.place(sides.forward)
    end,
    pu = function()
        libRobot.place(sides.up)
    end,
    pd = function()
        libRobot.place(sides.down)
    end,

    -- Swing
    sf = function()
        libRobot.swing(sides.forward)
    end,
    su = function()
        libRobot.swing(sides.up)
    end,
    sd = function()
        libRobot.swing(sides.down)
    end,

    -- Inventory
    is = function(slot)
        libRobot.select(slot)
        return true
    end,
    ie = function()
        component.inventory_controller.equip()
    end,

    -- Special
    tbs = function()
        while true do
            if not component.tractor_beam.suck() then
                return
            end
        end
    end,
}

--- @param commands string
function libRobot.exec(commands, afterEach)
    for command in string.gmatch(commands, '[^,]+') do
        local word, count = string.match(command, '([a-z]+)([%d]*)')
        count = tonumber(count) or 1
        for i = 1, count do
            local flag = words[word](count)
            if afterEach then
                libRobot.exec(afterEach)
            end
            if flag then
                break
            end
        end
    end
end

return libRobot