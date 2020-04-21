local inventory_controller = {}

-- Get whether the items in the two specified slots of the inventory on the specified side of the device are equivalent (have shared OreDictionary IDs).
function inventory_controller.areStacksEquivalent(side, slotA, slotB)
	-- side:number
	-- slotA:number
	-- slotB:number

	-- return boolean 
end

-- Compare an item in the specified slot in the inventory on the specified side with one in the database with the specified address.
function inventory_controller.compareStackToDatabase(side, slot, dbAddress, dbSlot, checkNBT)
	-- side:number
	-- slot:number
	-- dbAddress:string
	-- dbSlot:number
	-- checkNBT:boolean=false

	-- return boolean 
end

-- Get whether the items in the two specified slots of the inventory on the specified side of the device are of the same type.
function inventory_controller.compareStacks(side, slotA, slotB, checkNBT)
	-- side:number
	-- slotA:number
	-- slotB:number
	-- checkNBT:boolean=false

	-- return boolean 
end

-- Compare an item in the specified slot with one in the database with the specified address.
function inventory_controller.compareToDatabase(slot, dbAddress, dbSlot, checkNBT)
	-- slot:number
	-- dbAddress:string
	-- dbSlot:number
	-- checkNBT:boolean=false

	-- return boolean 
end

-- Drops an item into the specified slot in the item inventory.
function inventory_controller.dropIntoItemInventory(inventorySlot, slot, count)
	-- inventorySlot:number
	-- slot:number
	-- count:number=64

	-- return number 
end

-- Drops the selected item stack into the specified slot of an inventory.
function inventory_controller.dropIntoSlot(facing, slot, count, fromSide)
	-- facing:number
	-- slot:number
	-- count:number
	-- fromSide:number

	-- return boolean 
end

-- Swaps the equipped tool with the content of the currently selected inventory slot.
function inventory_controller.equip()
	-- 

	-- return boolean 
end

-- Get a description of all stacks in the inventory on the specified side of the device.
function inventory_controller.getAllStacks(side)
	-- side:number

	-- return userdata 
end

-- Get the the name of the inventory on the specified side of the device.
function inventory_controller.getInventoryName(side)
	-- side:number

	-- return string 
end

-- Get the number of slots in the inventory on the specified side of the device.
function inventory_controller.getInventorySize(side)
	-- side:number

	-- return number 
end

-- The size of an item inventory in the specified slot.
function inventory_controller.getItemInventorySize(slot)
	-- slot:number

	-- return number 
end

-- Get the maximum number of items in the specified slot of the inventory on the specified side of the device.
function inventory_controller.getSlotMaxStackSize(side, slot)
	-- side:number
	-- slot:number

	-- return number 
end

-- Get number of items in the specified slot of the inventory on the specified side of the device.
function inventory_controller.getSlotStackSize(side, slot)
	-- side:number
	-- slot:number

	-- return number 
end

-- Get a description of the stack in the specified slot or the selected slot.
function inventory_controller.getStackInInternalSlot(slot)
	-- slot:number

	-- return table 
end

-- Get a description of the stack in the inventory on the specified side of the device.
function inventory_controller.getStackInSlot(side, slot)
	-- side:number
	-- slot:number

	-- return table 
end

-- Get whether the stack in the selected slot is equivalent to the item in the specified slot (have shared OreDictionary IDs).
function inventory_controller.isEquivalentTo(otherSlot)
	-- otherSlot:number

	-- return boolean 
end

-- Store an item stack description in the specified slot of the database with the specified address.
function inventory_controller.store(side, slot, dbAddress, dbSlot)
	-- side:number
	-- slot:number
	-- dbAddress:string
	-- dbSlot:number

	-- return boolean 
end

-- Store an item stack description in the specified slot of the database with the specified address.
function inventory_controller.storeInternal(slot, dbAddress, dbSlot)
	-- slot:number
	-- dbAddress:string
	-- dbSlot:number

	-- return boolean 
end

-- Sucks an item out of the specified slot in the item inventory.
function inventory_controller.suckFromItemInventory(inventorySlot, slot, count)
	-- inventorySlot:number
	-- slot:number
	-- count:number=64

	-- return number 
end

-- Sucks items from the specified slot of an inventory.
function inventory_controller.suckFromSlot(facing, slot, count, fromSide)
	-- facing:number
	-- slot:number
	-- count:number
	-- fromSide:number

	-- return boolean 
end

return inventory_controller
