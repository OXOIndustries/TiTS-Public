import classes.Characters.PlayerCharacter;
/**
	 * ...
	 * @author DrunkZombie
	 */
//flags
//["LOCATION_STORAGE_WARDROBE"] array for location max storage
//["LOCATION_STORAGE_EQUIPMENT"] array for location max storage
//["LOCATION_STORAGE_CONSUMABLES"] array for location max storage
//["LOCATION_STORAGE_VALUABLES"] array for location max storage
//["LOCATION_STORAGE_TOYS"] array for location max storage

public function setLocationStorage(idx:int=-1):Boolean
{
	if (idx < 0) return false;
	if (flags["LOCATION_STORAGE_WARDROBE"][idx] == undefined) flags["LOCATION_STORAGE_WARDROBE"][idx] = 30;
	if (flags["LOCATION_STORAGE_EQUIPMENT"][idx] == undefined) flags["LOCATION_STORAGE_EQUIPMENT"][idx] = 30;
	if (flags["LOCATION_STORAGE_CONSUMABLES"][idx] == undefined) flags["LOCATION_STORAGE_CONSUMABLES"][idx] = 30;
	if (flags["LOCATION_STORAGE_VALUABLES"][idx] == undefined) flags["LOCATION_STORAGE_VALUABLES"][idx] = 30;
	if (flags["LOCATION_STORAGE_TOYS"][idx] == undefined) flags["LOCATION_STORAGE_TOYS"][idx] = 30;
	
	return true;
}

private var currentLoc:String = "";
private var currentIdx:int = -1;
public function locationStorageMenuRoot(loc:String = ""):void
{
	clearOutput();
	showBust("");
	showName("PERSONAL\nSTORAGE");
	var idx:int = -1;
	var maxWard:int = 0;
	var maxEquip:int = 0;
	var maxCons:int = 0;
	var maxVal:int = 0;
	var maxToys:int = 0;
	
	currentLoc = loc;
	
	if (pc.LocationStorageInventory[0] == undefined) pc.LocationStorageInventory[0] = [];
	if (flags["LOCATION_STORAGE_WARDROBE"] == undefined) flags["LOCATION_STORAGE_WARDROBE"] = new Array();
	if (flags["LOCATION_STORAGE_EQUIPMENT"] == undefined) flags["LOCATION_STORAGE_EQUIPMENT"] = new Array();
	if (flags["LOCATION_STORAGE_CONSUMABLES"] == undefined) flags["LOCATION_STORAGE_CONSUMABLES"] = new Array();
	if (flags["LOCATION_STORAGE_VALUABLES"] == undefined) flags["LOCATION_STORAGE_VALUABLES"] = new Array();
	if (flags["LOCATION_STORAGE_TOYS"] == undefined) flags["LOCATION_STORAGE_TOYS"] = new Array();
	
	//here is set the index of the 1st level of the array for LocationStorageInventory for each location
	//to add a new location just set the idx here based on loc and you are good to go 
	//to use it simply call this function passing in the loc (ie addButton(2, "Storage", locationStorageMenuRoot, "nursery");)
	if (loc == "nursery") idx = 0;
	else if (loc == "nyrean") idx = 1;

	if (idx >= 0)
	{
		setLocationStorage(idx);
		if (pc.LocationStorageInventory[idx] == undefined) pc.LocationStorageInventory[idx] = [];
		maxWard = flags["LOCATION_STORAGE_WARDROBE"][idx];
		maxEquip = flags["LOCATION_STORAGE_EQUIPMENT"][idx];
		maxCons = flags["LOCATION_STORAGE_CONSUMABLES"][idx];
		maxVal = flags["LOCATION_STORAGE_VALUABLES"][idx];
		maxToys = flags["LOCATION_STORAGE_TOYS"][idx];
	}
	output("You turn to your personal storage.");
	
	clearMenu();
	
	if (maxWard > 0 && idx >= 0) 
	{
		output(" A wardrobe closet lines a section of the wall, reminding you where you keep all your clothes, outfits and armors.");
		addButton(0, "Wardrobe", locationStorageMenuType, ["WARDROBE",idx]);
	}
	else addDisabledButton(0, "Wardrobe");
	
	if (maxEquip > 0 && idx >= 0)
	{
		output(" Various cabinets, shelves and weapon racks designate the equipment area.");
		addButton(1, "Equipment", locationStorageMenuType, ["EQUIPMENT",idx]);
	}
	else addDisabledButton(1, "Equipment");
	
	if (maxCons > 0 && idx >= 0)
	{
		output(" A chest with multiple compartments is located below, meant for storing consumable items.");
		addButton(2, "Consumables", locationStorageMenuType, ["CONSUMABLES",idx]);
	}
	else addDisabledButton(2, "Consumables");
	
	if (maxVal > 0 && idx >= 0)
	{
		output(" Adjacent to that is a small vault used to store valuable or important items.");
		addButton(3, "Valuables", locationStorageMenuType, ["VALUABLES",idx]);
	}
	else addDisabledButton(3, "Valuables");
	
	if (maxToys > 0 && idx >= 0)
	{
		output(" Against one wall, an inconspicuous box with a slide-out compartment is used for storing any lewd toys you may have.");
		addButton(4, "Toys", locationStorageMenuType, ["TOYS",idx]);
	}
	else addDisabledButton(4, "Toys");
	
	addButton(14, "Back", mainGameMenu);
}
private const LOC_STORAGE_MODE_TAKE:uint = 1 << 0;
private const LOC_STORAGE_MODE_STORE:uint = 1 << 1;

private var _locationStorageMode:uint = LOC_STORAGE_MODE_TAKE;

public function locationStorageMenuType(args:Array):void
{
	clearOutput();
	
	var type:String = args[0];
	var idx:int = args[1];
	if (idx >= 0) currentIdx = idx;
	
	var items:Array = outputLocationStorageListForType(type, idx);
	
	clearMenu();
	
	if (_locationStorageMode == LOC_STORAGE_MODE_STORE)
	{
		items = getListOfType(pc.inventory, type);
	}
	
	populateLocationTakeMenu(items, type);
}

public function outputLocationStorageListForType(type:String, idx:int):Array
{
	var items:Array = getListOfType(pc.LocationStorageInventory[idx], type);
	
	output("<b>" + StringUtil.toDisplayCase(type.toLowerCase()) + " Storage:</b>\n");
	
	if (items.length == 0) output("\nNothing stored!");
	else
	{
		for (var i:int = 0; i < items.length; i++)
		{
			var item:ItemSlotClass = items[i];
			
			output("\n");
			if (item.stackSize > 1) output(item.quantity + "x ");
			output(StringUtil.toDisplayCase(item.longName));
		}
	}
	
	output("\n\n<b>You have " + String(Math.max(0, flags["LOCATION_STORAGE_" + type][idx] - items.length)) + " of " + flags["LOCATION_STORAGE_" + type][idx] + " storage slots free.</b>");
	if (items.length > 10) output("\n\n" + multiButtonPageNote());

	return items;
}
public function populateLocationTakeMenu(items:Array, type:String, func:Function = null):void
{
	var maxPerPage:int = 10;
	var pgIdx:int = 0;
	
	if (func == null)
	{
		if (_locationStorageMode == LOC_STORAGE_MODE_TAKE) func = takeLocationItem;
		if (_locationStorageMode == LOC_STORAGE_MODE_STORE) func = storeLocationItem;
	}
	
	for (var i:int = 0; i < items.length; i++)
	{
		var btnIdx:int = i % maxPerPage;
		pgIdx = i / maxPerPage;
		var pgOset:int = 15 * pgIdx;
		
		addItemButton((btnIdx + pgOset), items[i], func, [items[i], type]);
	}
	
	var menuInserts:int = 0;
	
	do
	{
		if (_locationStorageMode != LOC_STORAGE_MODE_TAKE) addButton((menuInserts * 15) + 10, "Take", locationStorageMode, [LOC_STORAGE_MODE_TAKE, type], "Take from Personal Storage", "Take items from storage and place them in your inventory.");
		else
		{
			addDisabledButton((menuInserts * 15) + 10, "Take");
		}
		if (_locationStorageMode != LOC_STORAGE_MODE_STORE) addButton((menuInserts * 15) + 11, "Store", locationStorageMode, [LOC_STORAGE_MODE_STORE, type], "Take from Inventory", "Take items from your inventory and place them in your ship’s storage.");
		else
		{
			addDisabledButton((menuInserts * 15) + 11, "Store");
		}
		
		addButton((menuInserts * 15) + 14, "Back", locationStorageMenuRoot,currentLoc);
		menuInserts++;
	} while (menuInserts <= pgIdx);
}
public function locationStorageMode(args:Array):void
{
	_locationStorageMode = args[0];
	locationStorageMenuType([args[1],currentIdx])
}

public function storeLocationItem(args:Array):void
{
	clearOutput();
	
	var item:ItemSlotClass = args[0];
	var type:String = args[1];
	
	// See if we can merge it into a stack
	if (item.stackSize > 1)
	{
		for (var i:int = 0; i < pc.LocationStorageInventory[currentIdx].length; i++)
		{
			var sItem:ItemSlotClass = pc.LocationStorageInventory[currentIdx][i] as ItemSlotClass;
			if (isSameItem(sItem, item) && sItem.quantity < sItem.stackSize)
			{
				if (sItem.quantity + item.quantity <= sItem.stackSize)
				{
					sItem.quantity += item.quantity;
					item.quantity = 0;
					pc.inventory.splice(pc.inventory.indexOf(item), 1);
				}
				else
				{
					var diff:int = sItem.stackSize - sItem.quantity;
					sItem.quantity = sItem.stackSize;
					item.quantity -= diff;
				}
			}
		}
	}
	
	// If we're this far in, we couldn't fit everything into an existing stack.
	// See if we can place a new stack in the inventory
	if (getNumberOfStoredType(pc.LocationStorageInventory[currentIdx], type) < flags["LOCATION_STORAGE_" + type][currentIdx] && item.quantity > 0)
	{
		pc.LocationStorageInventory[currentIdx].push(item);
		pc.inventory.splice(pc.inventory.indexOf(item), 1);
	}
	else if (item.quantity > 0)
	{
		// If we're THIS far in, we couldn't fit the item in at all.
		output("There isn’t enough room to store your item.");
		
		clearMenu();
		addButton(0, "Switch", replaceInLocationStorage, [item, type], "Switch Items", "Switch an item in your ship’s storage with one in your inventory.");
		addButton(14, "Back", shipStorageMenuType, type);
		return;
	}
	
	locationStorageMenuType([type,currentIdx]);
	
	// Special Events
	if(item is GooArmor) output("\n\n" + gooArmorInStorageBlurb());
	
	return;
}
public function replaceInLocationStorage(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var type:String = args[1];
	
	var items:Array = getListOfType(pc.LocationStorageInventory[currentIdx], type);
	
	clearOutput();
	if(items.length <= 0) output("You do not have another item of the same type to switch with.");
	else
	{
		output("What would you like to switch the item with?");
		if(items.length > 10) output("\n\n" + multiButtonPageNote());
	}
	
	clearMenu();
	var btnSlot:int = -5;
	var i:int = 0;
	while (true)
	{
		if (i % 10 == 0 && (i < items.length || !i))
		{
			btnSlot += 5;
			addButton(btnSlot+14, "Back", storeLocationItem, args);
		}
		
		if (i == items.length) break;
		
		addItemButton(btnSlot, items[i], doLocationStorageReplace, [invItem, items[i], type]);
		btnSlot++;
		i++;
	}
}

public function doLocationStorageReplace(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var tarItem:ItemSlotClass = args[1];
	var type:String = args[2];
	
	pc.inventory.splice(pc.inventory.indexOf(invItem), 1);
	pc.LocationStorageInventory[currentIdx].push(invItem);
	
	pc.LocationStorageInventory[currentIdx].splice(pc.LocationStorageInventory[currentIdx].indexOf(tarItem), 1);
	pc.inventory.push(tarItem);
	
	locationStorageMenuType([type,currentIdx]);
	
	// Special Events
	if(invItem is GooArmor) output("\n\n" + gooArmorInStorageBlurb());
	if(tarItem is GooArmor) output("\n\n" + gooArmorInStorageBlurb(false));
}
public function takeLocationItem(args:Array):void
{
	clearOutput();
	
	var item:ItemSlotClass = args[0];
	var type:String = args[1];
	
	// See if we can merge it into a stack
	if (item.stackSize > 1)
	{
		for (var i:int = 0; i < pc.inventory.length; i++)
		{
			var sItem:ItemSlotClass = pc.inventory[i] as ItemSlotClass;
			//if (sItem.shortName == item.shortName && sItem.quantity < sItem.stackSize)
			if (isSameItem(sItem, item) && sItem.quantity < sItem.stackSize)
			{
				if (sItem.quantity + item.quantity <= sItem.stackSize)
				{
					sItem.quantity += item.quantity;
					item.quantity = 0;
					pc.LocationStorageInventory[currentIdx].splice(pc.LocationStorageInventory[currentIdx].indexOf(item), 1);
				}
				else
				{
					var diff:int = sItem.stackSize - sItem.quantity;
					sItem.quantity = sItem.stackSize;
					item.quantity -= diff;
				}
			}
		}
	}
	
	// If we're this far in, we couldn't fit everything into an existing stack.
	// See if we can place a new stack in the inventory
	if (pc.inventory.length < pc.inventorySlots() && item.quantity > 0)
	{
		pc.inventory.push(item);
		pc.LocationStorageInventory[currentIdx].splice(pc.LocationStorageInventory[currentIdx].indexOf(item), 1);
	}
	else if (item.quantity > 0)
	{
		// If we're THIS far in, we couldn't fit the item in at all.
		output("There isn’t enough room to take your item.");
		
		clearMenu();
		addButton(0, "Switch", replaceInInventoryLocation, [item, type], "Switch Items", "Switch an item in your inventory with one in your ship’s storage.");
		addButton(14, "Back", locationStorageMenuType, [type,currentIdx]);
		return;
	}
	
	locationStorageMenuType([type,currentIdx]);
	
	// Special Events
	if(item is GooArmor) output("\n\n" + gooArmorInStorageBlurb(false));
}
public function replaceInInventoryLocation(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var type:String = args[1];
	
	var items:Array = getListOfType(pc.inventory, type);
	
	clearOutput();
	if(items.length <= 0) output("You do not have another item of the same type to switch with.");
	else
	{
		output("What would you like to switch the item with?");
		if(items.length > 10) output("\n\n" + multiButtonPageNote());
	}
	
	clearMenu();
	var btnSlot:int = -5;
	var i:int = 0;
	while (true)
	{
		if (i % 10 == 0 && (i < items.length || !i))
		{
			btnSlot += 5;
			addButton(btnSlot+14, "Back", takeLocationItem, args);
		}
		
		if (i == items.length) break;
		
		addItemButton(btnSlot, items[i], doInventoryReplaceLocation, [invItem, items[i], type]);
		btnSlot++;
		i++;
	}
}

public function doInventoryReplaceLocation(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var tarItem:ItemSlotClass = args[1];
	var type:String = args[2];
	
	pc.LocationStorageInventory[currentIdx].splice(pc.LocationStorageInventory[currentIdx].indexOf(invItem), 1);
	pc.inventory.push(invItem);
	
	pc.inventory.splice(pc.inventory.indexOf(tarItem), 1);
	pc.LocationStorageInventory[currentIdx].push(tarItem);
	
	locationStorageMenuType([type,currentIdx]);
	
	// Special Events
	if(invItem is GooArmor) output("\n\n" + gooArmorInStorageBlurb(false));
	if(tarItem is GooArmor) output("\n\n" + gooArmorInStorageBlurb());
}
public function numberOfItemInLocationStorageByClass(ref:Class,idx:int = -1):int
{
	if (idx < 0) return 0;
	if (ref == null || pc.LocationStorageInventory[idx].length == 0) return 0;
	
	var amt:int = 0;
	
	for (var i:uint = 0; i < pc.LocationStorageInventory[idx].length; i++)
	{
		if (pc.LocationStorageInventory[idx][i] is ref) amt += pc.LocationStorageInventory[idx][i].quantity;
	}
	return amt;
}
public function hasItemInLocationStorageByClass(ref:Class, amount:int = 1, idx:int = -1):Boolean
{
	if (idx < 0) return false;
	if (ref == null || pc.LocationStorageInventory[idx].length == 0) return false;
		
	var amt:int = numberOfItemInLocationStorageByClass(ref,idx);
		
	if (amt >= amount) return true;
	return false;
}
public function destroyItemInLocationStorageByClass(ref:Class, amount:int = 1,idx:int = -1):void
{
	if (idx < 0) return;
	if (ref == null || pc.LocationStorageInventory[idx].length == 0 || amount == 0) return;
			
	var i:int = (pc.LocationStorageInventory[idx].length - 1);
			
	// Remove all!
	if (amount < 0)
	{
		while (i >= 0)
		{
			if (pc.LocationStorageInventory[idx][i] is ref)
			{
				pc.LocationStorageInventory[idx][i].quantity = 0;
				pc.LocationStorageInventory[idx].splice(i, 1);
			}
			i--;
		}
	}
	// Normal
	else
	{
		while (amount > 0 && i >= 0)
		{
		//Item in the slot?
			if (pc.LocationStorageInventory[idx][i] is ref)
			{
				var nFromSlot:int = Math.min(amount, pc.LocationStorageInventory[idx][i].quantity);
				amount -= nFromSlot;
				pc.LocationStorageInventory[idx][i].quantity -= nFromSlot;
				if (pc.LocationStorageInventory[idx][i].quantity == 0)
				{
					pc.LocationStorageInventory[idx].splice(i, 1);
				}
			}
			i--;
		}
		if(amount > 0) output("<b>ERROR - Ship inventory item quantity needed: " + amount + "!</b>");
	}
}