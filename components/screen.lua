-- SCREEN LVL 1

local screen = {}

-- The aspect ratio of the screen. For multi-block screens this is the number of blocks, horizontal and vertical.
function screen.getAspectRatio()

	-- return number, number 
end

-- The list of keyboards attached to the screen.
function screen.getKeyboards()

	-- return table 
end

-- Returns whether the screen is currently on.
function screen.isOn()

	-- return boolean 
end

-- Returns whether the screen is in high precision mode (sub-pixel mouse event positions).
function screen.isPrecise()

	-- return boolean 
end

-- Set whether to use high precision mode (sub-pixel mouse event positions).
function screen.setPrecise(enabled)
	-- enabled:boolean

	-- return boolean 
end

-- Turns off the screen. Returns true if it was on.
function screen.turnOff()

	-- return boolean 
end

-- Turns the screen on. Returns true if it was off.
function screen.turnOn()

	-- return boolean 
end

return screen
