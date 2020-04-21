local modem = {}

-- Broadcasts the specified data on the specified port.
function modem.broadcast(port, data, ...)
	-- port:number
	-- data...

	-- return 
end

-- Closes the specified port (default: all ports). Returns true if ports were closed.
function modem.close(port)
	-- port:number

	-- return boolean 
end

-- Get the current wake-up message.
function modem.getWakeMessage()

	-- return string, boolean 
end

-- Whether the specified port is open.
function modem.isOpen(port)
	-- port:number

	-- return boolean 
end

-- Whether this card has wired networking capability.
function modem.isWired()

	-- return boolean 
end

-- Whether this card has wireless networking capability.
function modem.isWireless()

	-- return boolean 
end

-- Gets the maximum packet size (config setting).
function modem.maxPacketSize()

	-- return number 
end

-- Opens the specified port. Returns true if the port was opened.
function modem.open(port)
	-- port:number

	-- return boolean 
end

-- Sends the specified data to the specified target.
function modem.send(address, port, data, ...)
	-- address:string
	-- port:number
	-- data...

	-- return 
end

-- Set the wake-up message and whether to ignore additional data/parameters.
function modem.setWakeMessage(message, fuzzy)
	-- message:string
	-- fuzzy:boolean

	-- return string 
end

return modem
