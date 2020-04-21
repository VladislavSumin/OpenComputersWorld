local robot = {}

-- Compare the block on the specified side with the one in the selected slot. Returns true if equal.
function robot.compare(side, fuzzy)
	-- side:number
	-- fuzzy:boolean=false

	-- return boolean 
end

-- Compare the fluid in the selected tank with the fluid in the specified tank on the specified side. Returns true if equal.
function robot.compareFluid(side, tank)
	-- side:number
	-- tank:number

	-- return boolean 
end

-- Compares the fluids in the selected and the specified tank. Returns true if equal.
function robot.compareFluidTo(index)
	-- index:number

	-- return boolean 
end

-- Compare the contents of the selected slot to the contents of the specified slot.
function robot.compareTo(otherSlot, checkNBT)
	-- otherSlot:number
	-- checkNBT:boolean=false

	-- return boolean 
end

-- Get the number of items in the specified slot, otherwise in the selected slot.
function robot.count(slot)
	-- slot:number

	-- return number 
end

-- Checks the contents of the block on the specified sides and returns the findings.
function robot.detect(side)
	-- side:number

	-- return boolean, string 
end

-- Drains the specified amount of fluid from the specified side. Returns the amount drained, or an error message.
function robot.drain(side, amount)
	-- side:boolean
	-- amount:number=1000

	-- return boolean, number or string 
end

-- Drops items from the selected slot towards the specified side.
function robot.drop(side, count)
	-- side:number
	-- count:number=64

	-- return boolean 
end

-- Get the durability of the currently equipped tool.
function robot.durability()

	-- return number 
end

-- Eject the specified amount of fluid to the specified side. Returns the amount ejected or an error message.
function robot.fill(side, amount)
	-- side:number
	-- amount:number=1000

	-- return boolean, number of string 
end

-- Get the current color of the activity light as an integer encoded RGB value (0xRRGGBB).
function robot.getLightColor()

	-- return number 
end

-- The size of this device's internal inventory.
function robot.inventorySize()

	-- return number 
end

-- Move in the specified direction.
function robot.move(direction)
	-- direction:number

	-- return boolean 
end

-- Get the name of the agent.
function robot.name()

	-- return string 
end

-- Place a block towards the specified side. The `face' allows a more precise click calibration, and is relative to the targeted blockspace.
function robot.place(side, face, sneaky)
	-- side:number
	-- face:number=side
	-- sneaky:boolean=false

	-- return boolean 
end

-- Get the currently selected slot; set the selected slot if specified.
function robot.select(slot)
	-- slot:number

	-- return number 
end

-- Select a tank and/or get the number of the currently selected tank.
function robot.selectTank(index)
	-- index:number

	-- return number 
end

-- Set the color of the activity light to the specified integer encoded RGB value (0xRRGGBB).
function robot.setLightColor(value)
	-- value:number

	-- return number 
end

-- Get the remaining space in the specified slot, otherwise in the selected slot.
function robot.space(slot)
	-- slot:number

	-- return number 
end

-- Suck up items from the specified side.
function robot.suck(side, count)
	-- side:number
	-- count:number=64

	-- return boolean 
end

-- Perform a 'left click' towards the specified side. The `face' allows a more precise click calibration, and is relative to the targeted blockspace.
function robot.swing(side, face, sneaky)
	-- side:number
	-- face:number=side
	-- sneaky:boolean=false

	-- return boolean, string 
end

-- The number of tanks installed in the device.
function robot.tankCount()

	-- return number 
end

-- Get the fluid amount in the specified or selected tank.
function robot.tankLevel(index)
	-- index:number

	-- return number 
end

-- Get the remaining fluid capacity in the specified or selected tank.
function robot.tankSpace(index)
	-- index:number

	-- return number 
end

-- Move the specified amount of fluid from the selected tank into the specified tank.
function robot.transferFluidTo(index, count)
	-- index:number
	-- count:number=1000

	-- return boolean 
end

-- Move up to the specified amount of items from the selected slot into the specified slot.
function robot.transferTo(toSlot, amount)
	-- toSlot:number
	-- amount:number

	-- return boolean 
end

-- Rotate in the specified direction.
function robot.turn(clockwise)
	-- clockwise:boolean

	-- return boolean 
end

-- Perform a 'right click' towards the specified side. The `face' allows a more precise click calibration, and is relative to the targeted blockspace.
function robot.use(side, face, sneaky, duration)
	-- side:number
	-- face:number=side
	-- sneaky:boolean=false
	-- duration:number=0

	-- return boolean, string 
end

return robot
