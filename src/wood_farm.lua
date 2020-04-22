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
        --robot.move(sides.up)
        robot.select(2)
        local result = robot.compare(sides.front)
        robot.select(1)
        --robot.move(sides.down)
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
    robot.swing(sides.forward)

    -- plantTree
    robot.exec('mf2,tr,pf,tr,mf,tl,pf,tl,pf,mb,pf')


    -- wood collecting
    while tractor_beam.suck() or robot.count(robot.inventorySize()) ~= 0 do
        if (robot.count(robot.inventorySize() - 3) ~= 0) then
            robot.turn(true)
            for i = 3, robot.inventorySize() do
                robot.select(i)
                robot.drop(sides.front)
            end
            robot.select(1)
            robot.turn(false)
        end
    end

    robot.exec('mb2,tl,mf3,tr,mf7,tr,mf7,tr,mf7,tr,mf4,tr,mf2', 'tbs')

end


-- Entry point
while true do
    mainLoop()
end

