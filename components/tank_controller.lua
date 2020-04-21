local tank_controller = {}

-- Get a description of the fluid in the the specified tank on the specified side.
function tank_controller.getFluidInTank(side, tank)
	-- side:number
	-- tank:number

	-- return table 
end

-- Get the capacity of the specified tank on the specified side.
function tank_controller.getTankCapacity(side, tank)
	-- side:number
	-- tank:number

	-- return number 
end

-- Get the number of tanks available on the specified side.
function tank_controller.getTankCount(side)
	-- side:number

	-- return number 
end

-- Get the amount of fluid in the specified tank on the specified side.
function tank_controller.getTankLevel(side, tank)
	-- side:number
	-- tank:number

	-- return number 
end

return tank_controller
