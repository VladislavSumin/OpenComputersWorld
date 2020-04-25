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
local MAX_WOOD_HEIGHT = 32

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

local function cleanInventory()
    robot.turn(true)
    robot.dropSlotRange(sides.forward, 3)
    robot.turn(false)
end

local function checkAndReplaceTools()
    if not robot.durability() then
        robot.select(robot.inventorySize())
        robot.exec('tl')
        while not robot.suck(sides.forward, 1) do
            os.sleep(10)
        end
        robot.exec('ie,tr')
        return true
    end
    return false
end

local function mainLoop()
    waitUntilGrow()

    -- cut down a tree
    robot.select(SAPLING_SLOT)
    robot.swing(sides.forward)

    if checkAndReplaceTools() then
        local currentZ = 1
        robot.move(sides.forward)
        while currentZ <= MAX_WOOD_HEIGHT do
            if robot.detect(sides.front) then
                robot.swing(sides.front)
                break
            end
            if robot.detect(sides.up) then
                robot.swing(sides.up)
                break
            end
            robot.exec('mu')
            currentZ = currentZ + 1
        end
        robot.exec('sf,su,mf,tr,sf,mf,tr')
        while currentZ ~= 1 do
            robot.exec('sf,sd,md')
            currentZ = currentZ - 1
        end
        robot.exec('sf,mf,tr,mf,tl,mf,tl2')
    end

    -- plantTree
    robot.exec('is1,mf2,tr,pf,tr,mf,tl,pf,tl,pf,mb,pf')

    -- wood collecting and
    -- going around to collect a tree that fell in far from the turtle
    robot.exec('mb2,tl,mf3,(tr,mf7)3,tr,mf4,tr,mf2', 'tbs')

    cleanInventory()
end


-- Entry point
while true do
    mainLoop()
end

