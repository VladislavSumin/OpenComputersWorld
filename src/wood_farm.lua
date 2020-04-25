-- Components
local component = require('component')
local tractor_beam = component.tractor_beam

-- System libs
local sides = require('sides')

-- Local lib
package.loaded.librobot = nil
local robot = require('librobot')

-- Settings
local SAPLING_SLOT = 1
local WOOD_SLOT = 2

local function waitUntilGrow()
    robot.select(WOOD_SLOT)
    while true do
        local result = robot.compare(sides.front)
        if result then
            return
        else
            os.sleep(10)
        end
    end
end

local function mainLoop()
    waitUntilGrow()

    -- cut down a tree
    robot.select(SAPLING_SLOT)
    robot.swing(sides.forward)

    -- plantTree
    robot.exec('mf2,tr,pf,tr,mf,tl,pf,tl,pf,mb,pf')

    -- wood collecting
    while tractor_beam.suck() or robot.count(robot.inventorySize()) ~= 0 do
        if (robot.count(robot.inventorySize() - 3) ~= 0) then
            robot.turn(true)
            robot.dropSlotRange(sides.forward, 3)
            robot.select(1)
            robot.turn(false)
        end
    end

    -- going around to collect a tree that fell in far from the turtle
    robot.exec('mb2,tl,mf3,tr,mf7,tr,mf7,tr,mf7,tr,mf4,tr,mf2', 'tbs')
end


-- Entry point
while true do
    mainLoop()
end

