local filesystem = {}

-- fsnode          table: 0x7f63dc5fb380

-- Closes an open file descriptor with the specified handle.
function filesystem.close(handle)
	-- handle:userdata

	-- return 
end

-- Returns whether an object exists at the specified absolute path in the file system.
function filesystem.exists(path)
	-- path:string

	-- return boolean 
end

-- Get the current label of the drive.
function filesystem.getLabel()

	-- return string 
end

-- Returns whether the object at the specified absolute path in the file system is a directory.
function filesystem.isDirectory(path)
	-- path:string

	-- return boolean 
end

-- Returns whether the file system is read-only.
function filesystem.isReadOnly()

	-- return boolean 
end

-- Returns the (real world) timestamp of when the object at the specified absolute path in the file system was modified.
function filesystem.lastModified(path)
	-- path:string

	-- return number 
end

-- Returns a list of names of objects in the directory at the specified absolute path in the file system.
function filesystem.list(path)
	-- path:string

	-- return table 
end

-- Creates a directory at the specified absolute path in the file system. Creates parent directories, if necessary.
function filesystem.makeDirectory(path)
	-- path:string

	-- return boolean 
end

-- Opens a new file descriptor and returns its handle.
function filesystem.open(path, mode)
	-- path:string
	-- mode:string='r'

	-- return userdata 
end

-- Reads up to the specified amount of data from an open file descriptor with the specified handle. Returns nil when EOF is reached.
function filesystem.read(handle, count)
	-- handle:userdata
	-- count:number

	-- return string or nil 
end

-- Removes the object at the specified absolute path in the file system.
function filesystem.remove(path)
	-- path:string

	-- return boolean 
end

-- Renames/moves an object from the first specified absolute path in the file system to the second.
function filesystem.rename(from, to)
	-- from:string
	-- to:string

	-- return boolean 
end

-- Seeks in an open file descriptor with the specified handle. Returns the new pointer position.
function filesystem.seek(handle, whence, offset)
	-- handle:userdata
	-- whence:string
	-- offset:number

	-- return number 
end

-- Sets the label of the drive. Returns the new value, which may be truncated.
function filesystem.setLabel(value)
	-- value:string

	-- return string 
end

-- Returns the size of the object at the specified absolute path in the file system.
function filesystem.size(path)
	-- path:string

	-- return number 
end

-- The overall capacity of the file system, in bytes.
function filesystem.spaceTotal()

	-- return number 
end

-- The currently used capacity of the file system, in bytes.
function filesystem.spaceUsed()

	-- return number 
end

-- Writes the specified data to an open file descriptor with the specified handle.
function filesystem.write(handle, value)
	-- handle:userdata
	-- value:string

	-- return boolean 
end

return filesystem
