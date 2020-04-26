local rcsteeltankvalvetile = {}

--- @class tankInfoTableItemContents
--- @field amount number
--- @field id number
--- @field name string
--- @field rawName string
local tankInfoTableItemContents = {}

--- @class tankInfoTableItem
--- @field capacity number
--- @field contents tankInfoTableItemContents
local tankInfoTableItem = {}

--- @class tankInfoTable
--- @field item tankInfoTableItem - fake method
local tankInfoTable = {
    {
        capacity = 10000,
        contents = {
            amount = 8000,
            id = 1,
            name = 'water',
            rawName = 'Water'
        }
    },
    {
        --- other indexes
    }
}

--- A table of tanks will be returned, each with a table of information
--- @param direction string or nil {DOWN, UP, NORTH, SOUTH, WEST,EAST, UNKNOWN}
--- @return tankInfoTable
function rcsteeltankvalvetile.getTankInfo(direction)
end

return rcsteeltankvalvetile