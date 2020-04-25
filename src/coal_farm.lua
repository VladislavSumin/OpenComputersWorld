package.loaded.librobot = nil
local robot = require('librobot')
local sides = require('sides')
local component = require('component')

local size = 11

local function collectCoal()
    robot.exec('is1,ie,sd,ie,md,sd,md,sd,md,sf,mf,sd,su')
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

local function placeWood()
    local selectedSlot = 3
    robot.select(selectedSlot)
    local function callback()
        if robot.count() == 0 then
            selectedSlot = selectedSlot + 1
            robot.select(selectedSlot)
        end
    end

    robot.exec('md5,mf')

    for i = 1, size - 1 do
        robot.exec(('((pd,mb,pf)%d,tl)2'):format(i), callback)
    end
    robot.exec(('((pd,mb,pf)%d,tl)'):format(size - 1))
    robot.exec('pd,mu,pd,mu')
    robot.exec(('((pu,pd,mb,pf)%d,tl)'):format(size - 1), callback)
    for i = size - 1, 1, -1 do
        robot.exec(('((pu,pd,mb,pf)%d,tl)2'):format(i), callback)
    end

    robot.exec('pu,pd,sf,mf,tl2,pf,su,mu,pd,mu,pd,mu,is2,pd', callback)
end

local function moveCoalToStorage()
    robot.exec('tr')
    robot.dropSlotRange(sides.front,3)
    robot.exec('tl')
end

local function supplyWood()
    robot.exec('tl,is3')
    local count = size * size * 5
    while count ~= 0 do
        count = count - (robot.suck(sides.forward, count) or 0)
    end
    robot.exec('tr')
end

while true do
    while(component.redstone.getInput(sides.forward)==0) do
        os.sleep(10)
    end

    collectCoal()
    moveCoalToStorage()
    supplyWood()
    placeWood()

    os.sleep(30)
end