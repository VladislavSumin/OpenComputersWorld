-- Components
local component = require('component')
local tractor_beam = component.tractor_beam

-- System libs
local sides = require('sides')

-- Local lib
package.loaded.librobot = nil
local robot = require('librobot')

local function waitUntilGrow()
    while true do
        robot.move(sides.up)
        local result = robot.detect(sides.front)
        robot.move(sides.down)
        if result then
            return
        else
            os.sleep(20)
        end
    end
end

local function plantTree()
    robot.move(sides.forward)
    robot.move(sides.forward)
    robot.turn(true)
    robot.place(sides.forward)
    robot.turn(true)
    robot.move(sides.forward)
    robot.turn(false)
    robot.place(sides.forward)
    robot.turn(false)
    robot.place(sides.forward)
    robot.move(sides.back)
    robot.place(sides.forward)
end

local function mainLoop()
    waitUntilGrow()

    -- cut down a tree
    robot.swing(sides.forward)

    plantTree()

    -- wood collecting
    while tractor_beam.suck() or robot.count(robot.inventorySize()) ~= 0 do
        if (robot.count(robot.inventorySize()) ~= 0) then
            robot.turn(true)
            for i = 2, robot.inventorySize() do
                robot.select(i)
                robot.drop(sides.front)
            end
            robot.select(1)
            robot.turn(false)
        end
    end
end


-- Entry point
while true do
    mainLoop()
end

