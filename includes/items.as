import classes.StringUtil;

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
	output("<b>Melee Weapon:</b> " + StringUtil.toTitleCase(pc.meleeWeapon.description) + "\n");
	output("<b>Ranged Weapon:</b> " + StringUtil.toTitleCase(pc.rangedWeapon.description) + "\n");
	output("<b>Armor:</b> " + StringUtil.toTitleCase(pc.armor.description) + "\n");
	output("<b>Shield:</b> " + StringUtil.toTitleCase(pc.shield.description) + "\n");
	output("<b>Accessory:</b> " + StringUtil.toTitleCase(pc.accessory.description) + "\n");
	output("<b>Underwear Bottom:</b> " + StringUtil.toTitleCase(pc.lowerUndergarment.description) + "\n");
	output("<b>Underwear Top:</b> " + StringUtil.toTitleCase(pc.upperUndergarment.description) + "\n\n");
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


//Zil Rations - Zil TF
//Tooltip: These are dried rations appear to be made from local fruits and plant nectars. There's a good chance that something in it would make you sick if you didn't have a microsurgeon-boosted immune system. In your case, you'll probably just undergo a mutation or two.
function zilRation(target:Creature):void {
	var changes:int = 0;
	var changeLimit:int = 1;
	var x:int = 0;
	var y:int = 0;
	var choices:Array;
	if(rand(3) == 0) changeLimit++;
	if(rand(3) == 0) changeLimit++;
	clearOutput();
	//Consume:
	output("You unwrap the dried fruits and find them to be surprisingly tasty. They're both sweet and a touch spicy to your tongue at the some time. Some of the rations even have a nectar glaze applied to them to make them even more delicious. Before you know it, they're gone.");

	//Masculine Focused Changes
	if(pc.hasCock()) {
		//Gain zilcock!
		if(pc.cockTotal(GLOBAL.BEE) < pc.cockTotal() && changes < changeLimit && rand(3) == 0) {
			x = 0;
			choices = new Array();
			//Make a list of all the non-zil dicks
			while(x < pc.cockTotal())
			{
				if(pc.cocks[x].cType != GLOBAL.BEE) choices[choices.length] = x;
				x++;
			}
			//Pick a random dick out of the list
			x = choices[rand(choices.length)];
			output("\n\nYour [pc.cock " + x + "] suddenly trembles, getting hard in fitful throbs and spurts of engorgement");
			if(pc.totalCocks() > 1) 
			{ 
				output(" until it stands out from ");
				if(pc.cockTotal() == 2) output("your other flaccid dick");
				else output("the rest of your [pc.cocks]");
			}
			output(". You look down, wide-eyed at the tumescent penis. You didn't do anything particularly arousing. Is it swelling up from an allergic reaction? Before you can posit any other theories, the changes start. ");
			if(pc.hasSheath(x)) {
				output(" Your sheath expands out, flowing over your length with the inevitability of a wave. You fumble to try and hold it back, but it's so sensitive that you lose your grip almost immediately.");
				if(pc.hasKnot(x)) output(" It quickly envelops your knot. The rounded distention flattens almost as soon as its covered.");
				output(" Watching it happen, you realize that the skin isn't expanding so much stretching out, lengthening to give your entire penis a sensitive shroud. It's soon wrapped around your [pc.cockHead " + x + "]");
				if(pc.hasCockFlag(GLOBAL.BLUNT) || pc.hasCockFlag(GLOBAL.FLARED) || pc.hasCockFlag(GLOBAL.TAPERED)) output(", rounding it out into a rather human-like shape under its new wrapping");
				output(".");
			}
			//"No Sheath:
			else 
			{
				output(" The skin of your [pc.cock " + x + "] is thickening perceptibly.");
				if(pc.hasKnot(x)) output(" It's definitely worst on your knot, which is shrinking away before your eyes. Soon your familiar bulge is reduced to just another part of your smoothing shaft. Higher,");
				else output("Up");
				output(" at the [pc.cockHead " + x+ "], the skin separates into two layers, an inner and outer layer. You're growing a long, stretchy foreskin");
				if(pc.hasCockFlag(GLOBAL.BLUNT) || pc.hasCockFlag(GLOBAL.FLARED) || pc.hasCockFlag(GLOBAL.TAPERED)) 
					output(", moulding your phallus into a more human-like shape as it develops");
				output("! All traces of its old appearance long gone, <b>you find yourself with a gently-wilting zil-cock</b> packed with enough foreskin to stay covered - even when hard.");
			}
			pc.shiftCock(x,GLOBAL.BEE);
			changes++;
		}
		//Honeycum!
		if(pc.totalCocks(GLOBAL.BEE) > 0 && changes < changeLimit && rand(3) == 0) 
		{
			output("\n\nThere is a sudden pinch in your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("middle");
			output(" that's painful enough to make you jump! It leaves behind a very, very intense soreness. ");
			if(pc.balls > 0) output("You cradle your [pc.sack] in your hand, regarding the poor thing warily as you try to find the source of the hurt. Then, you notice it contract up against you tightly, like it does when you cum. Only, there is no blissful release here.");
			else output("You give yourself a thorough once-over but can't find the source of the hurt. Then, you feel your abdominal muscles clenching, like when you orgasm, but there is no accompanying pleasure.");
			output(" [pc.Cum] starts drizzling out of your [pc.cocks]. This strange, pleasureless release continues on much longer than a normal orgasm, and it doesn't stop until you feel… well, emptied. The last few drops are chased out by sticky strands of honey-like goo. It's clear to you that <b>your [pc.cum] has been replaced by honey.</b> The codex verifies that there are still sperm in the new fluid, so you haven't lost your ability to knock someone up.");
			pc.cumType = GLOBAL.HONEY;
			changes++;
		}
		//Dick shrinkage - shrink down to 8" max
		if(pc.longestCockLength() > 8 && changes < changeLimit && rand(2) == 0) {
			x = 0;
			choices = new Array();
			//Make a list of all the big
			while(x < pc.cockTotal())
			{
				if(pc.cocks[x].cLength > 8) choices[choices.length] = x;
				x++;
			}
			//Pick a random dick out of the list
			x = choices[rand(choices.length)];
			output("\n\nA tightness in your package is the only warning your get before your [pc.cock " + x + "] starts shrinking.");
			y = pc.cocks[x].cLength - 8;
			y = Math.round((rand(y/4*10)/10 + y/4 + 1)*10)/10;
			if(y > 11) y = 11;

			if(y >= 9) output(" An inch at a time, it shortens until you've lost the better part of a foot.");
			else if(y >= 2) output(" It recedes until you've lost " + num2Text(Math.round(y)) + " from your length.");
			else if(y >= 1.1) output(" Gradually, you lose well over an inch.");
			else output(" Gradually, you lose about an inch.");
			pc.cocks[x].cLength += y;
			if(pc.cocks[x].cLength * .30 > pc.cocks[x].cThickness)
			{
				output(" Your girth thins to match your new proportions more appropriately. It's still pretty thick, all things considered.");
				pc.cocks[x].cThickness = pc.cocks[x].cLength * .30 > pc.cocks[x].cThickness;
			}
			else output(" Amazingly, your thickness remains unchanged, leaving you proportionally girthier than ever before.");
			changes++;
		}
		//Girth booster!
		//Search for dick that needs girthening first!
		x = 0;
		choices = new Array();
		//Make a list of all the girth needing
		while(x < pc.cockTotal())
		{
			if(pc.cocks[x].cLength * .25 < pc.cocks[x].cThickness) choices[choices.length] = x;
			x++;
		}
		//Pick a random dick out of the list
		x = choices[rand(choices.length)];
		if(choices.length == 0) x = -1;
		//If you got a dick that needs thickening, take the chance!
		if(x != -1 && changes < changeLimit && rand(2) == 0) {
			output("\n\nOhhh, something feels nice in your crotch. You reach down to find the source, grabbing your [pc.cock " + x + "] ");
			if(pc.cockTotal() == 1) output("in your hand");
			else if(pc.cockTotal() == 2) output("out from next to its less excited brother");
			else output("out from next to its less excited brethren");
			output(". Almost immediately, you feel it pulsate and thicken, hardening with alarming rapidity. Soon, you're holding a full-sized rager, but it doesn't stop there. The shaft continues to thicken, slowly spreading your fingers wider and wider as it gains about a quarter inch of additional girth.");
			pc.cocks[x].cThickness += .25;
			changes++;
		}
		//Ball shrinkage
		if(pc.balls > 0 && pc.ballSize >= 4 && changes < changeLimit && rand(2) == 0) {
			output("\n\nYour weighty sack weighs less and less on you with each passing moment. You look down to watch, treated to the sight of your [pc.balls] compressing down into a tighter, more compact package.");
			y = pc.ballSize - 3.5;
			y = Math.round((rand(y/4*10)/10 + y/4 + .5)*10)/10;
			if(y > 5) y = 5;
			if(y >= 4) output(" You lost quite a few inches off your testicular diameter!");
			else if(y >= 2) output(" You lost a few inches of testicular diameter!");
			else if(y >= 1.3) output(" You lost over an inch of testicular diameter!");
			else if(y >= .85) output(" You lost around an inch of testicular diameter!");
			else output(" You only lost a little bit of size, all things considered.");
			pc.ballSize -= y;
			changes++;
		}

		//Trappy Smoothpouch! - requires balls small enough
		if(pc.balls > 0 && pc.balls < 4 && !pc.hasStatusEffect("Uniball") && changes < changeLimit && rand(3) == 0) {
			output("\n\nIt starts with a tingle in your crotch to get your attention. ");
			if(!pc.isCrotchGarbed()) {
				output("You pull open your [pc.upperGarment] curiously. ");
			}
			output("Then, every fold, hair, wrinkle, and blemish on your [pc.sack] smooths away, leaving nothing behind by perfect, glossy [pc.skinNoun]. It pulls a little tighter, compacting around your [pc.balls] without actually shrinking them, framing them into an adorable pouch.");
			changes++;
			pc.createStatusEffect("Uniball",0,0,0,0,true,"","",false,0);
		}

		//Facial Hair vanishes!
		//Your [pc.beard] tickles, and when you scratch it, your hand comes away covered in hair. A snow of [haircolor] falls from your chin, leaving it bare and smooth. <b>You no longer have facial hair.</b>

		//Facial hair stops growing!
		//A painful feeling runs through your chin, but nothing changes outwardly. A closer inspection using the sensors on your codex reveals that <b>your facial hair has stopped growing.</b>

		//Grow wings once!
		if(pc.wingType != GLOBAL.BEE && rand(3) == 0 && changes < changeLimit) {
			if(!pc.hasWings()) {
				output("\n\nCramps attack your shoulder blades, forcing you to arch your back and cry out. You drop and roll on the ground to try and keep it together, and before you know, the pain is gone. In its place, there's the pleasant ache of growing muscles and something sliding down your back. You crane your head over your shoulder");
				if(pc.armor.shortName != "") output(" and pull back your [pc.armor.longName]");
				output(" to take a look; <b>there's small, transparent wings pressed against your back</b>. They're too small to allow you to fly, but you're definitely getting more zil-like.");
				pc.wingType = GLOBAL.SMALLBEE;
			}
			//Grow small zil wings to full size!
			else if(pc.wingType == GLOBAL.SMALLBEE) {
				output("\n\nA small cramp tugs at the muscles of your back, but a quick stretch evens it out.");
				if(pc.armor.shortName != "") output(" You pull off the top of your [pc.armor.longName] to get a look, just in case.");
				output(" Those muscles feel like they're getting bigger, bulkier, and your wings are growing bigger to match. A quick flex sends them flapping, kicking up a gust of wind, nearly lifting you off the ground. <b>You have wings just like a male zil, big enough to fly!</b>");
				pc.wingType = GLOBAL.BEE;
			}
			//TF other wings!
			else {
				output("\n\nA cramp ruffles your [pc.wings], making them flutter wildly as they contort and twist. You can feel them changing as they flail around, and with each gasp of air you drag into your lungs, you feel them thinning. They never stop kicking up a hell of a breeze, though. A few seconds later, your body calms, and you're able to look behind you. <b>You've grown transparent, zil-like wings, big enough to fly with!</b>");
				pc.wingType = GLOBAL.BEE;
			}
			changes++;
		}
	}
	//Feminine Focused Changes
	if(pc.hasVagina()) {
		//Zilcunt!
		if(pc.vaginaTotal(GLOBAL.BEE) < pc.vaginaTotal() && changes < changeLimit && rand(3) == 0) {
			x = 0;
			choices = new Array();
			//Make a list of all the nonbeecunts
			while(x < pc.vaginaTotal())
			{
				if(pc.vaginas[x].type != GLOBAL.BEE) choices[choices.length] = x;
				x++;
			}
			x = choices[rand(choices.length)];
			output("\n\nA ticklish feeling in your groin alerts you to a coming change, and you rapidly");
			if(pc.isNude()) output(" bend over to check it out");
			else output(" strip out of your [pc.gear] to see what's going on");
			output(". Your [pc.vagina " + x+ "] is rapidly engorging");
			if(pc.vaginaTotal() == 2) output(", even though your other vagina isn't");
			else output(", even though your other vaginas aren't");
			output(". It starts leaking lubricant as you watch the lips plump and reshape slightly, blotches of yellow and black rolling across your skin as your body adapts to the foreign foods. The shifting hues settle into a shiny, almost lightless black, leaving the exterior of your vagina dusky. You pry it open to find");
			if(pc.vaginas[x].clits > 1) {
				output(" yourself with " + num2Text(pc.vaginas[x].clits - 1) + " less clit");
				if(pc.vaginas[x].clits > 2) output("s");
				output(" than before and");
				output(" the interior a yellow reminiscent of some zil. It seems <b>you have a zil-like pussy, now!</b>");
			}
			pc.vaginas[x].clits = 1;
			pc.vaginas[x].type = GLOBAL.BEE;
			changes++;
		}
		//Clit shrinkage - down to one inch!!
		if(pc.clitLength > 1 && changes < changeLimit && rand(3) == 0) {
			output("\n\nTickles of tingling pleasure race up and down your [pc.clits] until ");
			if(pc.totalClits() == 1) output("it peeks out of its hood");
			else output("they peek out of their hoods");
			output(", growing to a full, rigid size almost immediately. ");
			if(pc.isCrotchGarbed()) output("You pull open your [pc.lowerGarment] to check on the sudden change");
			else output("You bend over to check on the sudden change");
			output(" just in time to see ");
			if(pc.totalClits() == 1) output("it");
			else output("them");
			output(" start shrinking, still fully engorged and sensitive but compacting down to a more reasonable size.");

			y = pc.clitLength - 1;
			y = Math.round((rand(y/4*10)/10 + y/4 + .2)*10)/10;

			if(y >= 3) output(" You wind up losing a few inches of clitoral length by the time it stabilizes.");
			else if(y >= 1.75) output(" You wind up losing about two inches of clitoral length by the time it stabilizes.");
			else if(y >= 1.1) output(" You wind up losing a little over an inch by the time it stabilizes.");
			else if(y >= .75) output(" You wind up losing around an inch by the time it stabilizes.");
			else output(" You wind up losing a fraction of an inch of your overall clitoral length by the time it stabilizes.");
			pc.clitLength -= y;
			changes++;
		}
		//HONEY GIRLCUM! - Req's appropriate wetness of 2 first.
		x = 0;
		y = 1;
		while (x < pc.totalVaginas()) {
			if(pc.wetness(x) < 2) {
				y = 0;
			}
			x++;
		}
		if(pc.girlCumType != GLOBAL.HONEY && y == 1 && changes < changeLimit && rand(3) == 0) {
			output("\n\nYou stumble as an unexpected wetness builds ");
			if(pc.legCount > 1) output("between your [pc.legs]");
			else output("at the joint between your [pc.leg] and your [pc.hips]");
			output(". Not that it's unwelcome. It feels quite pleasant, but you weren't really planning on dealing with having such ");
			if(pc.vaginaTotal() == 1) output("a wet pussy");
			else output("wet pussies");
			output(". You gingerly touch your folds and shudder with excitement before drawing away. You'll need to get yourself off soon. Catching your nose, a sweet smell lingers on your fingertips. You look closer at the stained digits and realize that <b>your [pc.girlcum] has been replaced by a honey-like substitute!</b>");
			//Raise lust!
			pc.lust(50);
			pc.girlCumType = GLOBAL.HONEY;
			changes++;
		}
		//Wetness to ⅖ - gotta check if pc needs it somewhere
		x = 0;
		choices = new Array();
		while (x < pc.totalVaginas()) {
			if(pc.wetness(x) < 2) {
				choices[choices.length] = x;
			}
			x++;
		}
		x = choices[rand(choices.length)];
		if(pc.wetness(x) < 2 && rand(3) == 0 && changes < changeLimit) {
			//No wetness
			if(pc.wetness(x) == 0) output("\n\nWhile you digest the snack, you become increasingly aware of a slippery feeling down below, much different than the dry emptiness you've become accustomed to. You tentative slip a finger into [pc.oneVagina] and discover that <b>you've started naturally lubricating yourself.</b>");
			//Less than 2 wetness
			else {
				output("\n\nWhile you digest the snack, you become more and more of a burgeoning wetness ");
				if(pc.legCount > 1) output("between your [pc.legs]");
				else output("above your [pc.leg]");
				output(". It's almost as slippery as when you're really, really turned, but you aren't even ");
				if(pc.lust() <= 33) output("thinking about sex right now");
				else if(pc.lust() <= 66) output("that focused on sex right now");
				else output("anticipating getting laid right now");
				output("! You guess that <b>you're just getting more slippery ");
				if(pc.hasCock()) output("female ");
				output("genitals, like a zil woman.</b>");
			}
			pc.vaginas[x].wetness++;
			changes++;
		}
		//Find biggest Tit row!
		x = 0;
		y = 0;
		choices = new Array();
		while (x < pc.bRows()) {
			if(pc.breastRows[x].breastRating > pc.breastRows[y].breastRating) {
				y = x;
			}
			x++;
		}
		//Breast shrink to large EE's
		if(pc.bRating(x) >= 11 && changes < changeLimit && rand(2) == 0) {
			output("\n\nA ripple runs through ");
			if(pc.bRows() == 1) output("your [pc.chest]");
			else if(x == 0) output("your top row of breasts");
			else if(x == 1) output("your second row of breasts");
			else if(x == 2) output("your third row of breasts");
			else output("one of your lower rows of breasts");
			output(". It almost throws you off balance with how generously it shakes the girls around! In its wake, the [pc.skin] covering them starts feeling tight, a little tingly even. You heft your weighty chest with concern, only to feel your [pc.breasts " + x + "] diminishing in your hands. They stabilize a while later at a " + pc.breastCup(x) + ".");
			output(" Your [pc.nipples " + x + "] tighten up right along with your smaller breasts to keep themselves proportional to your reduced bust.");
			y = pc.bRating(x) - 11;
			y = Math.round((rand(y/4*10)/10 + y/4 + 1)*10)/10;
			pc.breastRows[x].breastRating -= y;
			changes++;
		}
		//Breasts grow to C's - top row only
		if(pc.bRating(x) < 3) {
			output("\n\nA tightness builds in your chest until you feel your upper body gaining a little weight.");
			//Flat chest
			if(pc.bRating(x) < 1) {
				output(" Your pecs swell with a slight, feminine curve - <b>you could probably fit into A-cups now!</b>");
			}
			//A cups
			else if(pc.bRating(x) < 2) {
				output(" Your A-cups slowly blossom into a burgeoning pair of B-cups");
				if(pc.bRows() > 1) {
					output(", though the additional ");
					if(pc.bRows() == 2) output("row does't change");
					else output("rows don't change");
					output(" - just the top one");
				}
				output(". Cupping them in your hands, you tentatively hold your newly expanded chest. It's quite sensitive and is just big enough to have a little bit of jiggle.");
			}
			//B cups
			else {
				output(" Your B-cups tingle pleasantly, giving you just enough time to get your hands up to wrap around them. Almost on cue, your breasts swell up into your hands, expanding and jiggling with each passing moment, feeling so warm and wonderful as they expand. <b>You barely suppress a moan as you grow into nicely-rounded C-cups.</b> They still tingly hotly with the pleasant aftershocks of excitement.");
				pc.lust(5);
			}
			pc.breastRows[x].breastRating++;
			changes++;
		}
		//Hips widen to 6
		if(pc.hipRating < 6 && changes < changeLimit && rand(3) == 0) {
			output("\n\nYou adjust idly adjust your posture only to have to do it again a second later. ");
			if(pc.armor.shortName != "") output("Your [pc.armor.longName] creaks ominously. Your [pc.hips] are getting bigger!");
			else output("You look down and watch, and then you spot it: your [pc.hips] are getting bigger!");
			output(" The change is slow enough to you almost missed it, but <b>there's definitely a little extra thickness to your waist.</b>");
			pc.hipRating++;
			changes++;
		}
		//Butt expands to 7
		if(pc.buttRating < 7 && changes < changeLimit && rand(3) == 0) {
			output("\n\nAn odd feeling runs through [pc.butt], earning a small jump of surprise at the abrupt onset of sensation. It reminds you of that pins and needles feeling you get when part of you falls asleep, only on your ass. You reach back massage the feeling away and find yourself with a little bit more cheek in your hand than before. <b>Your [pc.butt] has gotten bigger!</b>");
			pc.buttRating++;
			changes++;
		}
		//Grow zilbutt!
		if(pc.tailType != GLOBAL.BEE && changes < changeLimit && rand(3) == 0) {
			//Has tails!
			if(pc.tailType != GLOBAL.HUMAN && pc.tailCount > 1) {
				output("\n\nYour [pc.tails] twitch, compulsively squeezing together. Beating faster, your heart hammers with sudden excitement, and you can feel it heating warmer and warmer back there. The flesh of your tails feels so hot and so strange. Nerves are firing nonsensically, leaving you confused about what's happening back there. You turn for a look in time to see them moulding together into one bloated lump, vaguely reminiscent of an insectile abdomen. The surface of it turns black and hard, like chitin, and a strange pressure is building near the very tip of it.");
				output("\n\nAn audible 'snick' fills the air as a stinger forces its way out of the very back, full of potent, arousing venom. <b>Your [pc.tails] have been replaced by a fully functional zil tail.</b>");
			}
			//Just one tail
			else if(pc.tailType != GLOBAL.HUMAN && pc.tailCount > 0) {
				output("\n\nYour [pc.tail] twitches, compulsively flexing and contracting down into a knotted ball of pain. Beating faster, your heart accelerates in sudden excitement, and you can feel it getting warmer and warmer back there. It feels so strange. Nerves are firing off-kilter, leaving you confused about just what's happening back there. You turn for a look in time to see that your [pc.tail] has turned into a large lump of flesh, vaguely reminiscent of an insectile abdomen. The surface blackens rapidly, picking up a polished shine as it does, like chitin, and a strange pressure builds near the very tip of it.");
				output("\n\nAn audible 'snick' meets your [pc.ears] as a stinger forces its way out of the back, full of potent, arousing venom. <b>Your [pc.tail] has been replaced by a fully functional zil tail.</b>");
			}
			//No tail!
			else output("\n\nJust at the bottom of your spine, right above your [pc.butt], a knot of heat blooms into existence. At first, it's not much of a bother, but the sensation gets less and less bearable over time. You even seem to be swelling back there! Suddenly, a wave of relief rolls over you, and out of the corner of your eye, you're treated to the sight of an insectile abdomen, black as night and slick with fluid, settling into place above your [butt]. It bobs heavily, stinger in all. <b>It seems you have a fully functional zil tail!</b>");
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.SMOOTH);
			pc.addTailFlag(GLOBAL.STINGER_TIPPED);
			pc.tailType = GLOBAL.BEE;
			pc.tailCount = 1;
			changes++;
		}
	}
	//Gender Neutral TFs
	//Human-style face
	if(pc.faceType != GLOBAL.HUMAN && changes < changeLimit && rand(4) == 0) {
		//Has muzzle
		if(pc.hasFaceFlag(GLOBAL.MUZZLED)) {
			output("\n\nYour snout compresses, your bones flowing like butter, reforming your jaw into a much more compact package. Surprisingly, it doesn't really hurt. It's more disconcerting than anything, making you dizzy as the change completes. You use the camera on your codex to check on the results and discover <b>you have a face shaped much like a human's!</b>");
		}
		//Otherwise
		else output("\n\nA strange numbness spreads out across your face, starting at your lips before penetrating deeper, into your very bones. There's a transient sense of dizziness that leaves you grabbing your head to steady yourself, and when you do, <b>you find that your [pc.face] has shifted into a human-shaped visage!</b>");
		pc.clearFaceFlags();
		pc.faceType = GLOBAL.HUMAN;
		changes++;
	}
	//Removal of fur
	if(pc.skinType == GLOBAL.FUR && changes < changeLimit && rand(3) == 0) {
		outText("\n\nYou idly itch at your [pc.belly]. When you finish, there's a patch of bare [pc.skin] there, and the itch is spreading! You scratch madly, shedding [pc.skinFurScales] everywhere. There's no relief from the itch until you've scrubbed every bit of hair from a particular spot. Needless to say, it takes a solid fifteen minutes to get rid of it and leave you with ");
		pc.skinType == GLOBAL.SKIN;
		pc.clearSkinFlags();
		output("[pc.skin].")
		changes++;
		//Pass 15m
		processTime(15);
	}
	//Arms to chitin-armored.
	if(pc.armType != GLOBAL.BEE && changes < changeLimit && rand(3) == 0) {
		output("\n\nStarting at your fingertips, you feel your [pc.skinFurScales] tightening, slowly shaping into a smooth, black expanse. The inky, chitinous darkness expands to cover the whole of your hand, forming joints to allow the hardening flesh to allow you movement. It doesn't stop there. Your wrists and your forearms are encased in ebony armor, followed shortly after by about half of your upper arms. The border between your [pc.skinFurScales] and the growth fluffs up with a tuft of yellowish fuzz, similar to that of a zil. <b>You have chitin-armored arms now.</b>");
		pc.armType = GLOBAL.BEE;
		changes++;
	}
	//Legs to chitin-armored.
	if(pc.legType != GLOBAL.BEE && changes < changeLimit && rand(3) == 0) {
		//First split single things into multiples!
		if(pc.legCount == 1) output("\n\nYou fall flat on your [pc.butt] as your [pc.leg] begins to writhe, splitting apart into two lengths of rapidly shaping flesh.");
		//First get rid of taurbodies and merge legs
		else if(pc.legCount > 2) {
			output("\n\nStrangely, you find yourself dumped on your ass out of the blue. Your [pc.legs] are thrashing on the ground, the flesh writhing, squirming and reshaping. ");
			if(pc.legCount > 3) output("All but two of your [pc.legs] begin to dwindle");
			else output("Your extra [pc.leg] begins to dwindle");
			output(", and the supporting muscles diminish along with it. The longer it goes on, the faster the transformation goes. Before you know it, you're down to two [pc.legs], and they're changing even further.");
		}
		//Else intro
		else output("\n\nYou're dumped on your ass when your [pc.legs] turn to jelly, going numb as they start to change.");
		//Not plantigrade!
		if(!pc.hasLegFlag(GLOBAL.PLANTIGRADE)) output(" They quickly form into a plantigrade shape and resolve further into a very humanoid look, complete with five toes.");
		output(" A black encasement forms around the tip, then divides an armored incasement for your toes. Each tiny digit gleams shiny black, covered in chitinous armor.  Maneuverable joints appear wherever you would need to bend or flex. Then, the blackness travels up like a wave slippery oil. Every inch of your body below the thigh is swiftly encased in the gleaming, ebony armor, and there, the transformation stops. While you take a few experimental steps to get used to <b>your new zil-like legs</b>, a tuft of yellow fluff grows out into a soft border between you and your new legs.");
		pc.clearLegFlags();
		pc.addLegFlag(GLOBAL.PLANTIGRADE);
		pc.addLegFlag(GLOBAL.SMOOTH);
		pc.legType = GLOBAL.BEE;
		pc.legCount = 2;
		changes++;
	}
	if(changes == 0) {
		output("\n\nNothing special happened, though you do feel a bit fuller.")
	}
}