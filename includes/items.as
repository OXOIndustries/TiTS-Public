function useItem(item:ItemSlotClass):void {
	if(item.quantity == 0) {
		clearOutput();
		output("Attempted to use " + item.longName + " which had zero quantity.");
		this.userInterface.clearMenu();
		this.userInterface.addButton(14,"Back",useItemFunction);
		return;
	}
	else {
		//Equippable items are equipped!
		if(item.type == GLOBAL.ARMOR || item.type == GLOBAL.CLOTHING || item.type == GLOBAL.SHIELD || item.type == GLOBAL.ACCESSORY || item.type == GLOBAL.UPPER_UNDERGARMENT || item.type == GLOBAL.LOWER_UNDERGARMENT || item.type == GLOBAL.RANGED_WEAPON || item.type == GLOBAL.MELEE_WEAPON)
			equipItem(item);
		//Else try to use a stored function!
		else {
			if(item.useFunction != undefined) item.useFunction();
			else {
				clearOutput();
				output("Error: Attempted to use item but item had no associated function. Tell Fenoxo he is a dirty hobo.");
				this.userInterface.clearMenu();
				this.userInterface.addButton(0,"Next",useItemFunction);
			}
		}
		item.quantity--;
		if(item.quantity < 0) {
			item.quantity = 0;
			item.shortName = "";
		}
	}
}

function shop(keeper:Creature):void {
	if(keeper.short == "Geoff") {
		mainGameMenu();
		return;
	}
	clearOutput();
	output(keeper.keeperGreeting);
	shopkeep = keeper;
	//Menuuuu!
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Buy Item",buyItem);
	if(keeper.typesBought.length > 0) 
		this.userInterface.addButton(1,"Sell Item",sellItem);
	this.userInterface.addButton(14,"Back",mainGameMenu);
}

function buyItem():void {
	clearOutput();
	output(shopkeep.keeperBuy);
	var temp:Number = 0;
	this.userInterface.clearMenu();
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
				if(x <= 13) this.userInterface.addButton(x,shopkeep.inventory[x].shortName + "x" + shopkeep.inventory[x].quantity,buyItemGo,shopkeep.inventory[x]);
				if(x > 13) this.userInterface.addButton(x+1,shopkeep.inventory[x].shortName + "x" + shopkeep.inventory[x].quantity,buyItemGo,shopkeep.inventory[x]);
			}
			else {
				trace("SHOWAN HIDE BUTTONS");
				if(x <= 13) this.userInterface.addDisabledButton(x,shopkeep.inventory[x].shortName + "x" + shopkeep.inventory[x].quantity);
				if(x > 13) this.userInterface.addDisabledButton(x+1,shopkeep.inventory[x].shortName + "x" + shopkeep.inventory[x].quantity);
			}
		}
	}
	this.userInterface.addButton(14,"Back",shop,shopkeep);
}

function buyItemGo(arg:ItemSlotClass):void {
	clearOutput();
	var price:Number = getBuyPrice(shopkeep,arg.basePrice);
	output("You purchase " + arg.description  + " for " + num2Text(price) + " credits.\n\n");
	lootList[lootList.length] = clone(arg);
	pc.credits -= price;
	//Set everything to take us back to buyItem!
	itemScreen = buyItem;
	lootScreen = buyItem;
	useItemFunction = buyItem;
	itemCollect();
}

function sellItem():void {
	clearOutput();
	output(shopkeep.keeperSell);
	this.userInterface.clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++) {
		//If slot has something in it.
		if(pc.inventory[x].quantity > 0) {
			trace("PC inventory being checked for possible sale.");
			//Does the shopkeep buy this type?
			if(shopkeep.buysType(pc.inventory[x].type)) {
				output("\n" + upperCase(pc.inventory[x].description) + " - " + getSellPrice(shopkeep,pc.inventory[x].basePrice) + " credits.");
				if(x <= 13) this.userInterface.addButton(x,pc.inventory[x].shortName + "x" + pc.inventory[x].quantity,sellItemGo,pc.inventory[x]);
				if(x > 13) this.userInterface.addButton(x+1,pc.inventory[x].shortName,sellItemGo,pc.inventory[x]);
			}
		}
	}
	this.userInterface.addButton(14,"Back",shop,shopkeep);
}

function sellItemGo(arg:ItemSlotClass):void {
	clearOutput();
	var price:Number = getSellPrice(shopkeep,arg.basePrice);
	pc.credits += price;
	output("You sell " + arg.description  + " for " + num2Text(price) + " credits.");
	arg.quantity--;
	if(arg.quantity == 0) arg.shortName = "";
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",sellItem);
}

function getSellPrice(keeper:Creature,basePrice:Number):Number {
	return Math.round(basePrice * keeper.buyMarkdown * pc.sellMarkup);
}
function getBuyPrice(keeper:Creature,basePrice:Number):Number {
	return Math.round(basePrice * keeper.sellMarkup * pc.buyMarkdown);
}

function inventory():void {
	clearOutput();
	itemScreen = inventory;
	useItemFunction = inventory;
	output("<b><u>Currently Worm Equipment:</u></b>\n");
	output("<b>Melee Weapon:</b> " + pc.meleeWeapon.description + "\n");
	output("<b>Ranged Weapon:</b> " + pc.rangedWeapon.description + "\n");
	output("<b>Armor:</b> " + pc.armor.description + "\n");
	output("<b>Shield:</b> " + pc.shield.description + "\n");
	output("<b>Accessory:</b> " + pc.accessory.description + "\n");
	output("<b>Underwear Bottom:</b> " + pc.lowerUndergarment.description + "\n");
	output("<b>Underwear Top:</b> " + pc.upperUndergarment.description + "\n\n");
	output("What item would you like to use?");
	this.userInterface.clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++) {
		if(pc.inventory[x].quantity > 0) {
			if(x <= 13) this.userInterface.addButton(x,pc.inventory[x].shortName + "x" + pc.inventory[x].quantity,useItem,pc.inventory[x]);
			if(x > 13) this.userInterface.addButton(x+1,pc.inventory[x].shortName,useItem,pc.inventory[x]);
		}
	}
	var button:int = -1;
	for(x = 0; x < 30; x++) {
		if(this.userInterface.buttonData[x].caption.text != "") {
			button = x;
		}
	}
	button++;
	
	if(pc.meleeWeapon.shortName != "Rock") {
		this.userInterface.addButton(button,"Melee Off",unequip,"mWeapon");
		button++;
	}
	if(pc.rangedWeapon.shortName != "Rock") {
		this.userInterface.addButton(button,"Ranged Off",unequip,"rWeapon");
		button++;
	}
	if(pc.armor.shortName != "") {
		this.userInterface.addButton(button,"Armor Off",unequip,"armor");
		button++;
	}
	if(pc.shield.shortName != "") {
		this.userInterface.addButton(button,"Shield Off",unequip,"shield");
		button++;
	}
	if(pc.accessory.shortName != "") {
		this.userInterface.addButton(button,"Acc. Off",unequip,"accessory");
		button++;
	}
	if(pc.lowerUndergarment.shortName != "") {
		this.userInterface.addButton(button,"UnderwearOff",unequip,"underwear");
		button++;
	}
	if(pc.upperUndergarment.shortName != "") {
		this.userInterface.addButton(button,"UndertopOff",unequip,"bra");
		button++;
	}
	//Set user and target.
	itemUser = pc;
	this.userInterface.addButton(14,"Back",mainGameMenu);
}


// Uh, all the items are either 
function unequip(arg:String, next:Boolean = true):void {
	if(arg == "bra") {
		lootList[lootList.length] = clone(pc.upperUndergarment);
		pc.upperUndergarment = new classes.Items.Miscellaneous.Empty();
	}
	else if(arg == "underwear") {
		lootList[lootList.length] = clone(pc.lowerUndergarment);
		pc.lowerUndergarment = new classes.Items.Miscellaneous.Empty();
	}
	else if(arg == "shield") {
		lootList[lootList.length] = clone(pc.shield);
		pc.shield = new classes.Items.Miscellaneous.Empty();
	}
	else if(arg == "accessory") {
		lootList[lootList.length] = clone(pc.accessory);
		pc.accessory = new classes.Items.Miscellaneous.Empty();
	}
	else if(arg == "armor") {
		lootList[lootList.length] = clone(pc.armor);
		pc.armor = new classes.Items.Miscellaneous.Empty();
	}
	else if(arg == "mWeapon") {
		lootList[lootList.length] = clone(pc.meleeWeapon);
		pc.meleeWeapon = new classes.Items.Melee.Rock();
	}
	else if(arg == "rWeapon") {
		lootList[lootList.length] = clone(pc.rangedWeapon);
		pc.rangedWeapon = new classes.Items.Melee.Rock();
	}
	clearOutput();
	itemCollect();
}

function equipItem(arg:ItemSlotClass):void {
	var holding:int = arg.quantity;
	var targetItem:ItemSlotClass;
	var holdingItem:ItemSlotClass;

	clearOutput();
	output("You equip your " + arg.longName + ".");
	//Set the quantity to 1 for the equipping, then set it back to holding - 1 for inventory!
	arg.quantity = 1;
	if(arg.type == GLOBAL.ARMOR || arg.type == GLOBAL.CLOTHING) {
		holdingItem = clone(pc.armor);
		pc.armor = clone(arg);
	}
	else if(arg.type == GLOBAL.MELEE_WEAPON) {
		holdingItem = clone(pc.meleeWeapon);
		pc.meleeWeapon = clone(arg);
	}
	else if(arg.type == GLOBAL.RANGED_WEAPON) {
		holdingItem = clone(pc.rangedWeapon);
		pc.rangedWeapon = clone(arg);
	}
	else if(arg.type == GLOBAL.SHIELD) {
		holdingItem = clone(pc.shield);
		pc.shield = clone(arg);
	}
	else if(arg.type == GLOBAL.ACCESSORY) {
		holdingItem = clone(pc.accessory);
		pc.accessory = clone(arg);
	}
	else if(arg.type == GLOBAL.LOWER_UNDERGARMENT) {
		holdingItem = clone(pc.lowerUndergarment);
		pc.lowerUndergarment = clone(arg);
	}
	else if(arg.type == GLOBAL.LOWER_UNDERGARMENT) {
		holdingItem = clone(pc.upperUndergarment);
		pc.upperUndergarment = clone(arg);
	}
	else output("  <b>AN ERROR HAS OCCURRED: Equipped invalid item type. Item: " + arg.longName + "</b>  ");
	
	//Fix itemslot quantity.
	arg.quantity = holding - 1;
	if(arg.quantity == 0) arg.shortName = "";
	
	//If item to loot after!
	if(holdingItem.shortName != "Rock" && holdingItem.shortName != "" && holdingItem.quantity > 0) {
		output(" ");
		lootList[lootList.length] = holdingItem;
		itemCollect();
	}
	else {
		this.userInterface.clearMenu();
		this.userInterface.addButton(0,"Next",itemScreen);
	}
}

function itemCollect(clearScreen:Boolean = false):void {
	if(clearScreen) clearOutput();
	var target = pc;
	if(lootList.length == 0) {
		output("There was an error looting an the item that was looted didn't actually exist.");
		this.userInterface.clearMenu();
		this.userInterface.addButton(0,"Next",lootScreen);
	}
	output("You acquire " + lootList[0].description + " (x" + lootList[0].quantity + ")");
	if(lootList.length > 0) {
		//Have room? Slap it in there!
		if(hasRoom(pc,lootList[0])) {
			//Combine with half stacks first
			for(var x:int; x < target.inventorySlots(); x++) 
			{
				//Found a matching stack
				if(target.inventory[x].shortName == lootList[0].shortName) 
				{
					//That matching stack has room?
					if(target.inventory[x].quantity < target.inventory[x].stackSize) 
					{
						//Add some shit
						while(target.inventory[x].quantity < target.inventory[x].stackSize && lootList[0].quantity > 0)
						{
							target.inventory[x].quantity++;
							lootList[0].quantity--;
						}
					}
				}
				if(lootList[0].quantity <= 0) break;
			}
			//Still got more to dump? Find an empty stack
			if(lootList[0].quantity > 0)
			{
				for(var y:int; y < target.inventorySlots(); y++) 
				{
					//EMPTY SLOOOT - FILL IT.
					if(target.inventory[y].shortName == "" || target.inventory[y].quantity == 0) 
					{
						target.inventory[y] = clone(lootList[0]);
						break;
					}
				}
			}
			output(". The new acquisition");
			if(lootList[0].quantity > 1) output("s stow");
			else output(" stows");
			output(" away quite easily.");
			//Clear the item off the lootlist.
			lootList.splice(0,1);
			this.userInterface.clearMenu();
			if(lootList.length > 0) this.userInterface.addButton(0,"Next",itemCollect);
			else this.userInterface.addButton(0,"Next",lootScreen);
		}
		//No room - replacement screen!
		else {
			output(". There is not room in your inventory for your new acquisition. Do you discard the item or replace a filled item slot?");
			this.userInterface.clearMenu();
			this.userInterface.addButton(0,"Replace",replaceItem);
			this.userInterface.addButton(1,"Discard",discardItem);
			this.userInterface.addButton(2,"Use",useLoot);
		}
	}
}

function discardItem():void {
	clearOutput();
	output("You discard " + lootList[0].longName + " (x" + lootList[0].quantity + ").");
	lootList.splice(0,1);
	this.userInterface.clearMenu();
	if(lootList.length > 0) this.userInterface.addButton(0,"Next",itemCollect);
	else this.userInterface.addButton(0,"Next",lootScreen);
}

function replaceItem():void {
	clearOutput();
	output("What will you replace?");
	this.userInterface.clearMenu();
	for(var x:int = 0; x < pc.inventorySlots(); x++) {
		if(pc.inventory[x].shortName != "" && pc.inventory[x].quantity > 0) 
			this.userInterface.addButton(x,pc.inventory[x].shortName + "x" + pc.inventory[x].quantity,replaceItemGo,x);
	}
	this.userInterface.addButton(14,"Back",itemCollect,true);
}

function useLoot():void {
	var loot:ItemSlotClass = clone(lootList[0]);
	lootList.splice(0,1);
	useItem(loot);
	
}
function abandonLoot():void {
	output("You toss out " + lootList[0].description + ".");
	lootList.splice(0,1);
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",lootScreen);
}

function replaceItemGo(arg:int):void {
	clearOutput();
	output("You toss out " + pc.inventory[arg].longName + "(x" + pc.inventory[arg].quantity + ") to make room for " + lootList[0].longName + "(x" + lootList[0].quantity + ").");
	pc.inventory[arg] = clone(lootList[0]);
	lootList.splice(0,1);
	this.userInterface.clearMenu();
	if(lootList.length > 0) this.userInterface.addButton(0,"Next",itemCollect);
	else this.userInterface.addButton(0,"Next",lootScreen);
}

function hasRoom(target:Creature,item:ItemSlotClass):Boolean {
	var mergeCounter:int = 0;
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
