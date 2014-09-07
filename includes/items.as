import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.ItemSlotClass;
import classes.StorageClass;
import classes.StringUtil;
import classes.TiTS;

function useItem(item:ItemSlotClass):void {
	if (item.isUsable == false)
	{
		trace("Need to find where the use button for this item was generated and disable it with isUsable == false checks.");
		return;
	}
	if (item.quantity == 0) 
	{
		clearOutput();
		output("Attempted to use " + item.longName + " which had zero quantity.");
		this.clearMenu();
		this.addButton(14,"Back",useItemFunction);
		return;
	}
	else 
	{
		//Equippable items are equipped!
		if (item.type == GLOBAL.ARMOR || item.type == GLOBAL.CLOTHING || item.type == GLOBAL.SHIELD || item.type == GLOBAL.ACCESSORY || item.type == GLOBAL.UPPER_UNDERGARMENT 
			|| item.type == GLOBAL.LOWER_UNDERGARMENT || item.type == GLOBAL.RANGED_WEAPON || item.type == GLOBAL.MELEE_WEAPON)
		{
			// Order of operations band-aid.
			// Item needs to be removed from inventory before being equipped, or it'll exist in two places and fuck up
			// item replacement. The player can have a "full" inventory including the item they've just equipped!
			if (pc.inventory.indexOf(item) != -1) pc.inventory.splice(pc.inventory.indexOf(item), 1);
			equipItem(item);
		}
		//Else try to use a stored function!
		else 
		{
			//If has a special global function set
			if (item.useFunction != null)
			{
				//if item use returns false, set up a menu.
				if (!item.useFunction(chars["PC"])) 
				{
					clearMenu();
					addButton(0,"Next",useItemFunction);
				}
			}
			//else: Error checking
			else 
			{
				clearOutput();
				output("Error: Attempted to use item but item had no associated function. Tell Fenoxo he is a dirty hobo.");
				this.clearMenu();
				this.addButton(0,"Next",useItemFunction);
			}
			
			// Consume an item from the stack
			if (!debug)
			{
				item.quantity--;
				if (item.quantity <= 0)
				{
					pc.inventory.splice(pc.inventory.indexOf(item), 1);
				}
			}
		}
	}
}

// A call with just an item will 
function combatUseItem(item:ItemSlotClass, targetCreature:Creature = null, usingCreature:Creature = null):void
{
	// If we're looking at an equippable item, equip it
	if (item.type == GLOBAL.ARMOR || item.type == GLOBAL.CLOTHING || item.type == GLOBAL.SHIELD || item.type == GLOBAL.ACCESSORY || item.type == GLOBAL.UPPER_UNDERGARMENT 
		|| item.type == GLOBAL.LOWER_UNDERGARMENT || item.type == GLOBAL.RANGED_WEAPON || item.type == GLOBAL.MELEE_WEAPON)
	{
		if (pc.inventory.indexOf(item) != -1) pc.inventory.splice(pc.inventory.indexOf(item), 1);
		equipItem(item);
	}
	else
	{
		// This is kinda bullshit. To save cheesing args for the function when called via a button,
		// we're gonna rebuild sensible defaults if the args are absent. No args = assume the player
		// pressed a button to invoke the call
		if (targetCreature == null)
		{
			if (item.targetsSelf == true)
			{
				targetCreature = pc;
			}
			else
			{
				// TODO: Show target selection interface
				// Invoke menu, early return, call back to self
				targetCreature = foes[0];
			}
		}
		
		if (usingCreature == null)
		{
			usingCreature = pc;
		}
		
		item.useFunction(targetCreature, usingCreature);
		
		if (!debug)
		{
			item.quantity--;
			if (item.quantity <= 0 && usingCreature.hasItem(item))
			{
				usingCreature.inventory.splice(usingCreature.inventory.indexOf(item), 1);
			}
		}
	}
	if(pc.hasPerk("Quickdraw") && (item.type == GLOBAL.RANGED_WEAPON || item.type == GLOBAL.MELEE_WEAPON))
	{
		clearMenu();
		addButton(0,"Next",combatInventoryMenu);
	}
	else processCombat();
}

function shop(keeper:Creature):void {
	if(keeper is Geoff) {
		mainGameMenu();
		return;
	}
	if(keeper is Jade) {
		approachJade();
		return;
	}
	if(keeper is Sera) {
		approachSera();
		return;
	}
	if(keeper is Kelly) {
		kellyOfficeApproach();
		return;
	}
	if(keeper is Anno)
	{
		if (!annoIsCrew()) repeatAnnoApproach();
		else annoFollowerApproach();
		return;
	}
	if(keeper is Ellie)
	{
		ellieMenu();
		return;
	}
	clearOutput();
	output(keeper.keeperGreeting);
	shopkeep = keeper;
	//Menuuuu!
	this.clearMenu();
	this.addButton(0,"Buy Item",buyItem);
	if(keeper.typesBought.length > 0) 
		this.addButton(1,"Sell Item",sellItem);
	this.addButton(14,"Back",mainGameMenu);
}

function buyItem():void {
	clearOutput();
	output(shopkeep.keeperBuy);
	var temp:Number = 0;
	this.clearMenu();
	for(var x:int = 0; x < shopkeep.inventory.length; x++) {
		trace("GOING THROUGH SHOPKEEP INVENTORY.");
		//If slot has something in it.
		if(shopkeep.inventory[x].quantity > 0) {
			output("\n");
			temp = getBuyPrice(shopkeep,shopkeep.inventory[x].basePrice);
			if(temp > pc.credits) output("<b>(Too Expensive)</b> ");
			output(upperCase(shopkeep.inventory[x].description) + " - " + temp + " credits.");
			trace("DISPLAYING SHIT");
			if(temp <= pc.credits) {
				trace("SHOWAN BUTANS: " + x);
				if (x <= 13) addItemButton(x, shopkeep.inventory[x], buyItemGo, shopkeep.inventory[x], null, null, shopkeep, pc);
				if (x > 13) addItemButton(x + 1, shopkeep.inventory[x], buyItemGo, shopkeep.inventory[x], null, null, shopkeep, pc);
			}
			else {
				trace("SHOWAN HIDE BUTTONS");
				if(x <= 13) this.addDisabledButton(x,shopkeep.inventory[x].shortName + " x" + shopkeep.inventory[x].quantity);
				if(x > 13) this.addDisabledButton(x+1,shopkeep.inventory[x].shortName + " x" + shopkeep.inventory[x].quantity);
			}
		}
	}
	this.addButton(14,"Back",shop,shopkeep);
}

function buyItemGo(arg:ItemSlotClass):void {
	clearOutput();
	var price:Number = getBuyPrice(shopkeep,arg.basePrice);
	output("You purchase " + arg.description  + " for " + num2Text(price) + " credits.\n\n");
	
	// Renamed from lootList so I can distinguish old vs new uses
	var purchasedItems:Array = new Array();
	purchasedItems[purchasedItems.length] = arg.makeCopy();
	pc.credits -= price;
	//Set everything to take us back to buyItem!
	itemScreen = buyItem;
	lootScreen = buyItem;
	useItemFunction = buyItem;
	itemCollect(purchasedItems);
}

function sellItem():void {
	clearOutput();
	output(shopkeep.keeperSell);
	this.clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++) {
		//If slot has something in it.
		if(pc.inventory[x].quantity > 0) {
			trace("PC inventory being checked for possible sale.");
			//Does the shopkeep buy this type?
			if(shopkeep.buysType(pc.inventory[x].type)) {
				output("\n" + upperCase(pc.inventory[x].description) + " - " + getSellPrice(shopkeep,pc.inventory[x].basePrice) + " credits.");
				if(x <= 13) this.addItemButton(x, pc.inventory[x], sellItemGo, pc.inventory[x], null, null, pc, shopkeep);
				if (x > 13) this.addItemButton(x + 1, pc.inventory[x], sellItemGo, pc.inventory[x], null, null, pc, shopkeep);
			}
		}
	}
	this.addButton(14,"Back",shop,shopkeep);
}

function sellItemGo(arg:ItemSlotClass):void {
	clearOutput();
	var price:Number = getSellPrice(shopkeep,arg.basePrice);
	pc.credits += price;
	output("You sell " + arg.description  + " for " + num2Text(price) + " credits.");
	arg.quantity--;
	if (arg.quantity == 0) pc.inventory.splice(pc.inventory.indexOf(arg), 1);
	this.clearMenu();
	this.addButton(0,"Next",sellItem);
}

function getSellPrice(keeper:Creature,basePrice:Number):Number {
	var sellPrice:Number = basePrice * keeper.buyMarkdown * pc.sellMarkup;
	if(pc.hasPerk("Supply And Demand")) sellPrice *= 1.1;
	sellPrice = Math.round(sellPrice);
	return sellPrice;
}
function getBuyPrice(keeper:Creature,basePrice:Number):Number {
	var buyPrice:Number = basePrice * keeper.sellMarkup * pc.buyMarkdown;
	if(pc.hasPerk("Supply And Demand")) buyPrice *= .95;
	buyPrice = Math.round(buyPrice);
	return buyPrice;
}

function generalInventoryMenu():void
{
	clearOutput();
	var x:int = 0;
	itemScreen = inventory;
	useItemFunction = inventory;
	output("<b><u>Currently Worn Equipment:</u></b>\n");
	output("<b>Melee Weapon:</b> " + StringUtil.toTitleCase(pc.meleeWeapon.description) + "\n");
	output("<b>Ranged Weapon:</b> " + StringUtil.toTitleCase(pc.rangedWeapon.description) + "\n");
	output("<b>Armor:</b> " + StringUtil.toTitleCase(pc.armor.description) + "\n");
	output("<b>Shield:</b> " + StringUtil.toTitleCase(pc.shield.description) + "\n");
	output("<b>Accessory:</b> " + StringUtil.toTitleCase(pc.accessory.description) + "\n");
	output("<b>Underwear Bottom:</b> " + StringUtil.toTitleCase(pc.lowerUndergarment.description) + "\n");
	output("<b>Underwear Top:</b> " + StringUtil.toTitleCase(pc.upperUndergarment.description) + "\n\n");
	output("<b><u>Key Items:</u></b>\n");
	if(pc.keyItems.length > 0) 
	{
		for(x = 0; x < pc.keyItems.length; x++) 
		{
			var pItem:StorageClass = pc.keyItems[x];
			
			if (pItem.tooltip != null && pItem.tooltip.length > 0)
			{
				output(pItem.storageName + " - " + pItem.tooltip + "\n");
			}
			else
			{
				output(pItem.storageName + "\n");
			}
			
		}
		output("\n");
	}
	else output("None\n\n");
	output("What item would you like to use?");
	this.clearMenu();
	var adjustment:int = 0;
	for(x = 0; x < pc.inventory.length || x < 14; x++) {
		//5 = bra
		if(x+adjustment == 5) {
			if (pc.upperUndergarment.shortName != "") 
			{
				this.addOverrideItemButton(x + adjustment, pc.upperUndergarment, "UndertopOff", unequip, "bra");
			}
			else this.addDisabledButton(x+adjustment,"UndertopOff");
			adjustment++;
		}
		//6 = shield
		if(x+adjustment == 6)
		{
			if (pc.shield.shortName != "") 
			{
				this.addOverrideItemButton(x + adjustment, pc.shield, "Shield Off", unequip, "shield");
			}
			else this.addDisabledButton(x+adjustment,"Shield Off");
			adjustment++;
		}
		//7 = panties
		if(x+adjustment == 7)
		{
			if (pc.lowerUndergarment.shortName != "")
			{
				this.addOverrideItemButton(x + adjustment, pc.lowerUndergarment, "UnderwearOff", unequip, "underwear");
			}
			else this.addDisabledButton(x+adjustment,"UnderwearOff");
			adjustment++;
		}
		//10 = melee
		if(x+adjustment == 10) {
			if (pc.meleeWeapon.shortName != "Rock") 
			{
				this.addOverrideItemButton(x + adjustment, pc.meleeWeapon, "Melee Off", unequip, "mWeapon");
			}
			else this.addDisabledButton(x+adjustment,"Melee Off");
			adjustment++;
		}
		//11 = armor
		if(x+adjustment == 11) {
			if (pc.armor.shortName != "") 
			{
				this.addOverrideItemButton(x + adjustment, pc.armor, "Armor Off", unequip, "armor");
			}
			else this.addDisabledButton(x+adjustment,"Armor Off");
			adjustment++;
		}
		//12 = ranged
		if(x+adjustment == 12) {
			if (pc.rangedWeapon.shortName != "Rock")
			{
				this.addOverrideItemButton(x + adjustment, pc.rangedWeapon, "Ranged Off", unequip, "rWeapon");
			}
			else this.addDisabledButton(x+adjustment,"Ranged Off");
			adjustment++;
		}
		//13 = accessory!
		if(x+adjustment == 13) {
			if (pc.accessory.shortName != "") 
			{
				this.addOverrideItemButton(x + adjustment, pc.accessory, "Acc. Off", unequip, "accessory");
			}
			else this.addDisabledButton(x+adjustment,"Acc. Off");
			adjustment++;
		}
		//normal inventory
		if(x < pc.inventory.length) {
			if (pc.inventory[x].quantity > 0) {
				
				var tarSlot:int = x + adjustment;
				if (tarSlot >= 14) tarSlot++;

				(this as TiTS).addItemButton(tarSlot, pc.inventory[x], useItem, pc.inventory[x]);
				
			}
		}
	}
	
	//Set user and target.
	itemUser = pc;
	this.addButton(14,"Back",mainGameMenu);
}

function combatInventoryMenu():void
{
	clearOutput2();
	clearGhostMenu();
	itemScreen = inventory;
	useItemFunction = inventory;
	
	output2("What item would you like to use?");
	
	for (var i:int = 0; i < pc.inventory.length; i++)
	{
		(this as TiTS).addItemButton((i < 14) ? i : i + 1, pc.inventory[i], combatUseItem, pc.inventory[i]);
	}
	
	addButton(14, "Back", combatMainMenu);
}

function inventory():void 
{
	if (!inCombat())
	{
		generalInventoryMenu();
	}
	else
	{
		combatInventoryMenu();
	}
}


function unequip(arg:String, next:Boolean = true):void 
{
	// Renamed from lootList so I can distinguish old vs new uses
	var unequippedItems:Array = new Array();

	if(arg == "bra") {
		unequippedItems[unequippedItems.length] = pc.upperUndergarment;
		pc.upperUndergarment = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "underwear") {
		unequippedItems[unequippedItems.length] = pc.lowerUndergarment;
		pc.lowerUndergarment = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "shield") {
		unequippedItems[unequippedItems.length] = pc.shield;
		pc.shield = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "accessory") {
		unequippedItems[unequippedItems.length] = pc.accessory;
		pc.accessory = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "armor") {
		unequippedItems[unequippedItems.length] = pc.armor;
		pc.armor = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "mWeapon") {
		unequippedItems[unequippedItems.length] = pc.meleeWeapon;
		pc.meleeWeapon = new classes.Items.Melee.Rock();
	}
	else if(arg == "rWeapon") {
		unequippedItems[unequippedItems.length] = pc.rangedWeapon;
		pc.rangedWeapon = new classes.Items.Melee.Rock();
	}
	clearOutput();
	itemCollect(unequippedItems);
}

// atm, no equippable items have a stacksize > 1, so there is never a possibility that we'd have to split an item stack to equip an item the player holds in their inventory.
function equipItem(arg:ItemSlotClass):void {
	var targetItem:ItemSlotClass;
	var removedItem:ItemSlotClass;

	if (arg.stackSize > 1) throw new Error("Potential item stacking bug with " + arg.shortName + ". Item has a stacksize > 0 and the equip code cannot currently handle splitting an item stack!");
	
	clearOutput();
	output("You equip your " + arg.longName + ".");
	//Clear disarm if appropriate.
	if(pc.hasStatusEffect("Disarmed") && (arg.type == GLOBAL.MELEE_WEAPON || arg.type == GLOBAL.RANGED_WEAPON))
	{
		if(pc.hasCombatStatusEffect("Disarmed"))
		{
			output("<b> You are no longer disarmed!</b>");
			pc.removeStatusEffect("Disarmed");
		}
		else
		{
			output("<b> Once you get your gear back, this will be equipped.</b>");
		}
	}
	//Set the quantity to 1 for the equipping, then set it back to holding - 1 for inventory!
	if(arg.type == GLOBAL.ARMOR || arg.type == GLOBAL.CLOTHING) 
	{
		removedItem = pc.armor;
		pc.armor = arg;
	}
	else if(arg.type == GLOBAL.MELEE_WEAPON) 
	{
		removedItem = pc.meleeWeapon;
		pc.meleeWeapon = arg;
	}
	else if(arg.type == GLOBAL.RANGED_WEAPON) 
	{
		removedItem = pc.rangedWeapon;
		pc.rangedWeapon = arg;
	}
	else if(arg.type == GLOBAL.SHIELD) 
	{
		removedItem = pc.shield;
		pc.shield = arg;
	}
	else if(arg.type == GLOBAL.ACCESSORY) 
	{
		removedItem = pc.accessory;
		pc.accessory = arg;
	}
	else if(arg.type == GLOBAL.LOWER_UNDERGARMENT) 
	{
		removedItem = pc.lowerUndergarment;
		pc.lowerUndergarment = arg;
	}
	else if(arg.type == GLOBAL.UPPER_UNDERGARMENT) 
	{
		removedItem = pc.upperUndergarment;
		pc.upperUndergarment = arg;
	}
	else output("  <b>AN ERROR HAS OCCURRED: Equipped invalid item type. Item: " + arg.longName + "</b>  ");
	
	//If item to loot after!
	if(removedItem.shortName != "Rock" && removedItem.shortName != "" && removedItem.quantity > 0) 
	{
		output(" ");
		// Renamed from lootList so I can distinguish old vs new uses
		var unequippedItems:Array = new Array();
		unequippedItems[unequippedItems.length] = removedItem;
		itemCollect(unequippedItems);
	}
	else 
	{
		this.clearMenu();
		this.addButton(0,"Next",itemScreen);
	}
}

public function itemCollect(newLootList:Array, clearScreen:Boolean = false):void {
	trace("itemCollect", newLootList);
	if(clearScreen) clearOutput();
	var target:PlayerCharacter = pc;
	if(newLootList.length == 0) {
		output("There was an error looting an the item that was looted didn't actually exist.");
		this.clearMenu();
		this.addButton(0,"Next",lootScreen);
	}
	output("You acquire " + newLootList[0].description + " (x" + newLootList[0].quantity + ")");
	if(newLootList.length > 0) {
		//Have room? Slap it in there!
		if (hasRoom(pc, newLootList[0])) {
			
			// If there's no items, just throw a new item into the container
			if (target.inventory.length == 0)
			{
				target.inventory.push(newLootList[0]);
			}
			// Drop what we can into existing slots where possible
			else
			{
				//Combine with half stacks first
				for(var x:int = 0; x < target.inventory.length; x++) 
				{
					//Found a matching stack
					if(target.inventory[x].shortName == newLootList[0].shortName) 
					{
						//That matching stack has room?
						if(target.inventory[x].quantity < target.inventory[x].stackSize) 
						{
							//Add some shit
							while(target.inventory[x].quantity < target.inventory[x].stackSize && newLootList[0].quantity > 0)
							{
								target.inventory[x].quantity++;
								newLootList[0].quantity--;
							}
						}
					}
					if(newLootList[0].quantity <= 0) break;
				}
				
				//Still got more to dump? Find an empty stack
				if(newLootList[0].quantity > 0)
				{
					target.inventory.push(newLootList[0]);
				}
			}
			
			output(". The new acquisition");
			if(newLootList[0].quantity > 1) output("s stow");
			else output(" stows");
			output(" away quite easily.\n");
			//Clear the item off the newLootList.
			newLootList.splice(0,1);
			this.clearMenu();
			if(newLootList.length > 0) this.addButton(0,"Next",itemCollect);
			else this.addButton(0,"Next",lootScreen);
		}
		//No room - replacement screen!
		else 
		{
			output(". There is not room in your inventory for your new acquisition. Do you discard the item or replace a filled item slot?");
			this.clearMenu();
			this.addButton(0,"Replace", replaceItemPicker, newLootList);  // ReplaceItem is a actionscript keyword. Let's not override it, mmkay?
			this.addButton(1,"Discard", discardItem,       newLootList);
			if ((newLootList[0] as ItemSlotClass).isUsable == true) this.addButton(2,"Use",     useLoot,           newLootList);
		}
	}
}

function discardItem(lootList:Array):void {
	clearOutput();
	output("You discard " + lootList[0].longName + " (x" + lootList[0].quantity + ").");
	lootList.splice(0,1);
	this.clearMenu();
	if(lootList.length > 0) this.addButton(0,"Next",itemCollect);
	else this.addButton(0,"Next",lootScreen);
}

function replaceItemPicker(lootList:Array):void {
	clearOutput();
	output("What will you replace?");
	this.clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++) {
		if(pc.inventory[x].shortName != "" && pc.inventory[x].quantity > 0) 
		{
			var butDesc:String = pc.inventory[x].shortName + " x" + pc.inventory[x].quantity
			this.addButton(x,butDesc,replaceItemGo,[x, lootList]);  // HAAACK. We can only pass one arg, so shove the two args into an array
		}
	}
	this.addButton(14,"Back",itemCollect,true);
}

function useLoot(lootList:Array):void {
	var loot:ItemSlotClass = lootList[0];
	lootList.splice(0,1);
	useItem(loot);
}
function abandonLoot(lootList:Array):void {
	output("You toss out " + lootList[0].description + ".");
	lootList.splice(0,1);
	this.clearMenu();
	this.addButton(0,"Next",lootScreen);
}

function replaceItemGo(args:Array):void 
{
	var indice:int = args[0];
	var lootList:Array = args[1];
	clearOutput();
	output("You toss out " + pc.inventory[indice].longName + "(x" + pc.inventory[indice].quantity + ") to make room for " + lootList[0].longName + "(x" + lootList[0].quantity + ").");
	pc.inventory[indice] = lootList[0];
	lootList.splice(0,1);
	this.clearMenu();
	if(lootList.length > 0) 
		this.addButton(0,"Next",itemCollect, lootList);
	else 
		this.addButton(0,"Next",lootScreen);
}

function hasRoom(target:Creature,item:ItemSlotClass):Boolean {
	var mergeCounter:int = 0;
	
	if (target.inventory.length >= 0 && target.inventory.length < target.inventorySlots())
	{
		return true;
	}
	
	//Loop through, lookin' fer room!
	for(var x:int; x < target.inventorySlots(); x++) 
	{
		//If the item in the slot matches the new item
		if(target.inventory[x].shortName == item.shortName) 
		{
			//If there is room for more!
			if(target.inventory[x].stackSize - target.inventory[x].quantity > 0) 
			{
				mergeCounter += target.inventory[x].stackSize - target.inventory[x].quantity;
			}
			//If there is enough room for the shit, return true.
			if(mergeCounter > item.quantity) return true;
		}
		//If the new slot sucks dicks (and by that I mean is empty)
		else if(target.inventory[x].shortName == "")
		{
			return true;
		}
	}
	return false;
}