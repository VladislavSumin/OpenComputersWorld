local component = require('component')
local robot = component.robot
local sides = require('sides')

local libRobot = setmetatable({}, { __index = robot }) or robot -- this hack to syntax highlight

---------------------------------------------------------------------------
---                              policies                               ---
---------------------------------------------------------------------------

local defaultPolicies = {
    --- Assert policy. Throw exception on triggered
    --- @param error any
    --- @return boolean - throw exception
    assert = function(error, ...)
        -- TODO add ... to assert
        _G.error('assert policy, error: ' .. tostring(error))
    end,

    --- Retry policy.
    --- @return boolean always true
    retry = function()
        return true
    end,

    --- Skip policy.
    --- @return boolean always false
    skip = function()
        return false
    end,
}
libRobot.defaultPolicies = defaultPolicies

local policies = setmetatable(
        {
            entity = defaultPolicies.retry,
            ['already moving'] = defaultPolicies.retry,
            ['inventory full'] = defaultPolicies.retry,
            default = libRobot.defaultPolicies.assert,
        }, {
            __index = function(table, _)
                return table.default
            end
        }
)
libRobot.policies = policies

---------------------------------------------------------------------------
---                 default robot methods overrides                     ---
---------------------------------------------------------------------------

--- Move in the specified direction. Apply librobot.movementPolicies
--- @param direction number
--- @return boolean,
function libRobot.move(direction)
    while true do
        local isSuccess, error = robot.move(direction)
        if isSuccess or not policies[error](error, direction) then
            return isSuccess, error
        end
    end
end

--- Drops items from the selected slot towards the specified side.
--- @param side number
--- @param count number=64
--- @return boolean, string - second return error
function libRobot.drop(side, count)
    while true do
        local isSuccess, error = robot.drop(side, count)
        -- error == nil when transfer items from empty slot
        if isSuccess or error == nil or not policies[error](error, side, count) then
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

--- @param word string
--- @param afterEach string - execute after each command
--- @param afterEach function - execute after each command
local function execWord(word, afterEach)
    --print('e: ' .. command)
    local wordCommand, count = string.match(word, '([a-z]+)([%d]*)')
    count = tonumber(count) or 1
    for i = 1, count do
        local flag = words[wordCommand](count)
        if afterEach then
            if type(afterEach) == 'function' then
                afterEach()
            else
                execWord(afterEach)
            end
        end
        if flag then
            break
        end
    end
end

--- @param commands string
--- @param index number
--- @param afterEach function
--- @param afterEach string
local function execInternal(commands, index, afterEach)
    -- TODO переписать нормально
    --print("-> " .. commands:sub(index))
    local firstIndex = index
    while index <= commands:len() do
        local char = commands:sub(index, index)
        if char == '(' then
            firstIndex = index
            index = execInternal(commands, index + 1, afterEach)
            local count = commands:sub(index):match('^[%d]+')
            if count then
                index = index + tostring(count):len()
                for i = 1, count - 1 do
                    execInternal(commands, firstIndex + 1, afterEach)
                end
            end
            firstIndex = index
        elseif char == ',' then
            execWord(commands:sub(firstIndex, index - 1), afterEach)
            firstIndex = index + 1
        elseif char == ')' then
            execWord(commands:sub(firstIndex, index - 1), afterEach)
            return index + 1
        end

        index = index + 1
    end
    if (firstIndex ~= index - 1) then
        execWord(commands:sub(firstIndex), afterEach)
    end
    return index
end

--- @param commands string
--- @param afterEach function
--- @param afterEach  string
libRobot.exec = function(commands, afterEach)
    execInternal(commands, 1, afterEach)
end

---------------------------------------------------------------------------
---                          Support functions                          ---
---------------------------------------------------------------------------

--- Drop all items from slot range, change selected clot
--- @param side number
--- @param from number
--- @param to number=inventorySize()
function libRobot.dropSlotRange(side, from, to)
    to = to or libRobot.inventorySize()
    for i = from, to do
        libRobot.select(i)
        while libRobot.count(i) ~= 0 do
            libRobot.drop(side)
        end
    end
end

return libRobot