package.loaded.librobot = nil
local robot = require('librobot') or require('component').robot
local sides = require('sides')

local size = 11

local function collectCoal()
    robot.exec('is1,ie,sd,ie,md,sd,md,sd,md,sf,mf,sd')
    for i = 1, size - 1 do
        robot.exec(('((sf,mf,sd,su)%d,tl)2'):format(i))
    end
    robot.exec(('(sf,mf,sd,su)%d,tl'):format(size - 1))
    robot.exec('md,sd,md,sd')
    robot.exec(('(sf,mf,sd,su)%d,tl'):format(size - 1))
    for i = size - 1, 1, -1 do
        robot.exec(('((sf,mf,sd)%d,tl)2'):format(i))
    end
    robot.exec('mf,mu5,tl2')
end

local function moveCoalToStorage()
    robot.exec('tr')
    for i = 3, robot.inventorySize() do
        robot.select(i)
        robot.drop(sides.front)
    end
    robot.exec('tl')
end

collectCoal()
moveCoalToStorage()