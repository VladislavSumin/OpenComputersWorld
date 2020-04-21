local eeprom = {}

-- Get the currently stored byte array.
function eeprom.get()

	-- return string 
end

-- Get the checksum of the data on this EEPROM.
function eeprom.getChecksum()

	-- return string 
end

-- Get the currently stored byte array.
function eeprom.getData()

	-- return string 
end

-- Get the storage capacity of this EEPROM.
function eeprom.getDataSize()

	-- return number 
end

-- Get the label of the EEPROM.
function eeprom.getLabel()

	-- return string 
end

-- Get the storage capacity of this EEPROM.
function eeprom.getSize()

	-- return number 
end

-- Make this EEPROM readonly if it isn't already. This process cannot be reversed!
function eeprom.makeReadonly(checksum)
	-- checksum:string

	-- return boolean 
end

-- Overwrite the currently stored byte array.
function eeprom.set(data)
	-- data:string

	-- return 
end

-- Overwrite the currently stored byte array.
function eeprom.setData(data)
	-- data:string

	-- return 
end

-- Set the label of the EEPROM.
function eeprom.setLabel(data)
	-- data:string

	-- return string 
end

return eeprom
