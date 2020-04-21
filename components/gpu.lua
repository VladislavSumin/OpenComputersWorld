-- THIS IS 1 LVL GPU ONLY

local gpu = {}

-- Binds the GPU to the screen with the specified address and resets screen settings if `reset` is true.
function gpu.bind(address, reset)
	-- address:string
	-- reset:boolean=true

	-- return boolean 
end

-- Copies a portion of the screen from the specified location with the specified size by the specified translation.
function gpu.copy(x, y, width, height, tx, ty)
	-- x:number
	-- y:number
	-- width:number
	-- height:number
	-- tx:number
	-- ty:number

	-- return boolean 
end

-- Fills a portion of the screen at the specified position with the specified size with the specified character.
function gpu.fill(x, y, width, height, char)
	-- x:number
	-- y:number
	-- width:number
	-- height:number
	-- char:string

	-- return boolean 
end

-- Get the value displayed on the screen at the specified index, as well as the foreground and background color. If the foreground or background is from the palette, returns the palette indices as fourth and fifth results, else nil, respectively.
function gpu.get(x, y)
	-- x:number
	-- y:number

	-- return string, number, number, number or nil, number or nil 
end

-- Get the current background color and whether it's from the palette or not.
function gpu.getBackground()

	-- return number, boolean 
end

-- Returns the currently set color depth.
function gpu.getDepth()

	-- return number 
end

-- Get the current foreground color and whether it's from the palette or not.
function gpu.getForeground()

	-- return number, boolean 
end

-- Get the palette color at the specified palette index.
function gpu.getPaletteColor(index)
	-- index:number

	-- return number 
end

-- Get the current screen resolution.
function gpu.getResolution()

	-- return number, number 
end

-- Get the address of the screen the GPU is currently bound to.
function gpu.getScreen()

	-- return string 
end

-- Get the current viewport resolution.
function gpu.getViewport()

	-- return number, number 
end

-- Get the maximum supported color depth.
function gpu.maxDepth()

	-- return number 
end

-- Get the maximum screen resolution.
function gpu.maxResolution()

	-- return number, number 
end

-- Plots a string value to the screen at the specified position. Optionally writes the string vertically.
function gpu.set(x, y, value, vertical)
	-- x:number
	-- y:number
	-- value:string
	-- vertical:boolean

	-- return boolean 
end

-- Sets the background color to the specified value. Optionally takes an explicit palette index. Returns the old value and if it was from the palette its palette index.
function gpu.setBackground(value, palette)
	-- value:number
	-- palette:boolean

	-- return number, number or nil 
end

-- Set the color depth. Returns the previous value.
function gpu.setDepth(depth)
	-- depth:number

	-- return number 
end

-- Sets the foreground color to the specified value. Optionally takes an explicit palette index. Returns the old value and if it was from the palette its palette index.
function gpu.setForeground(value, palette)
	-- value:number
	-- palette:boolean

	-- return number, number or nil 
end

-- Set the palette color at the specified palette index. Returns the previous value.
function gpu.setPaletteColor(index, color)
	-- index:number
	-- color:number

	-- return number 
end

-- Set the screen resolution. Returns true if the resolution changed.
function gpu.setResolution(width, height)
	-- width:number
	-- height:number

	-- return boolean 
end

-- Set the viewport resolution. Cannot exceed the screen resolution. Returns true if the resolution changed.
function gpu.setViewport(width, height)
	-- width:number
	-- height:number

	-- return boolean 
end

return gpu
