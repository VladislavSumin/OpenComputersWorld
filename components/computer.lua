local computer = {}

-- Plays a tone, useful to alert users via audible feedback.
function computer.beep(frequency, duration)
	-- frequency:number
	-- duration:number

	-- return 
end

-- Collect information on all connected devices.
function computer.getDeviceInfo()

	-- return table 
end

-- Returns a map of program name to disk label for known programs.
function computer.getProgramLocations()

	-- return table 
end

-- Returns whether the computer is running.
function computer.isRunning()

	-- return boolean 
end

-- Starts the computer. Returns true if the state changed.
function computer.start()

	-- return boolean 
end

-- Stops the computer. Returns true if the state changed.
function computer.stop()

	-- return boolean 
end

return computer
