local redstone = {}

-- Get the bundled redstone input on the specified side and with the specified color.
function redstone.getBundledInput(side, color)
	-- side:number
	-- color:number

	-- return number or table 
end

-- Get the bundled redstone output on the specified side and with the specified color.
function redstone.getBundledOutput(side, color)
	-- side:number
	-- color:number

	-- return number or table 
end

-- Get the comparator input on the specified side.
function redstone.getComparatorInput(side)
	-- side:number

	-- return number 
end

-- Get the redstone input on the specified side.
function redstone.getInput(side)
	-- side:number

	-- return number 
end

-- Get the redstone output on the specified side.
function redstone.getOutput(side)
	-- side:number

	-- return number 
end

-- Get the current wake-up threshold.
function redstone.getWakeThreshold()

	-- return number 
end

-- Set the bundled redstone output on the specified side and with the specified color.
function redstone.setBundledOutput(side, color, value)
	-- side:number
	-- color:number
	-- value:number

	-- return number 
end

-- Set the redstone output on the specified side.
function redstone.setOutput(side, value)
	-- side:number
	-- value:number

	-- return number 
end

-- Set the wake-up threshold.
function redstone.setWakeThreshold(threshold)
	-- threshold:number

	-- return number 
end

return redstone
