local component = require('component')
local robot = component.robot
local sides = require('sides')

local libRobot = setmetatable({}, { __index = robot })

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
    retry = function(direction, error)
        return true
    end,

    --- Skip movement policy.
    --- @return boolean always false
    skip = function(direction, error)
        return false
    end,

}

libRobot.movementPolicies = setmetatable(
        {
            entity = libRobot.defaultMovementPolicies.retry,
            default = libRobot.defaultMovementPolicies.assert,
        }, {
            __index = function(table, index)
                return table.default
            end
        }
)

--- Move in the specified direction.
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

return libRobot