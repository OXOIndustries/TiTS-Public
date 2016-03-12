import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.DataManager.Errors.VersionUpgraderError;
import classes.DataManager.Serialization.ItemSaveable;
import classes.GameData.CombatManager;
import classes.ItemSlotClass;
import classes.StorageClass;
import classes.StringUtil;
import classes.TiTS;

public function isEquippableItem(item:ItemSlotClass):Boolean
{
	return	InCollection(item.type, 
		GLOBAL.ARMOR, GLOBAL.SHIELD, GLOBAL.ACCESSORY, 
		GLOBAL.RANGED_WEAPON, GLOBAL.MELEE_WEAPON, 
		GLOBAL.CLOTHING, GLOBAL.UPPER_UNDERGARMENT, GLOBAL.LOWER_UNDERGARMENT
		);
}

public function useItem(item:ItemSlotClass):Boolean {
	if (item.isUsable == false)
	{
		trace("Need to find where the use button for this item was generated and disable it with isUsable == false checks.");
		clearOutput();
		output("Unable to use " + item.description + ".");
		//clearMenu();
		//addButton(14,"Back",useItemFunction);
		return false;
	}
	if (item.quantity == 0) 
	{
		clearOutput();
		output("Attempted to use " + item.description + " which had zero quantity.");
		this.clearMenu();
		this.addButton(14,"Back",useItemFunction);
		return false;
	}
	else 
	{
		//Equippable items are equipped!
		if (isEquippableItem(item))
		{
			// Order of operations band-aid.
			// Item needs to be removed from inventory before being equipped, or it'll exist in two places and fuck up
			// item replacement. The player can have a "full" inventory including the item they've just equipped!
			if (pc.inventory.indexOf(item) != -1) pc.inventory.splice(pc.inventory.indexOf(item), 1);
			equipItem(item);
			return true;
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
				if (item.combatUsable == false) output("\n\n");
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
			if (!infiniteItems() && !item.hasFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT))
			{
				item.quantity--;
				if (item.quantity <= 0 && pc.inventory.indexOf(item) != -1)
				{
					pc.inventory.splice(pc.inventory.indexOf(item), 1);
				}
			}
			
			return false;
		}
	}
}

// A call with just an item will 
public function combatUseItem(item:ItemSlotClass, targetCreature:Creature = null, usingCreature:Creature = null):void
{
	// If we're looking at an equippable item, equip it
	if (isEquippableItem(item))
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
				var targets:Array = CombatManager.getHostileCharacters();
				
				if (targets.length == 1) targetCreature = targets[0];
				else if (CombatManager.enemiesAlive() == 1)
				{
					for (var i:int = 0; i < targets.length; i++)
					{
						if (!targets[i].isDefeated())
						{
							targetCreature = targets[i];
							break;
						}
					}
				}
				
				if (targetCreature == null)
				{
					clearMenu();
					
					var bOff:int = 0;
					for (i = 0; i < targets.length; i++)
					{
						if (!targets[i].isDefeated())
						{
							addButton(bOff, targets[i].buttonText, function(t_item:ItemSlotClass, t_target:Creature, t_user:Creature):Function {
								return function():void
								{
									combatUseItem(t_item, t_target, t_user);
								}
							}(item, targets[i], pc));
						}
					}
					
					return;
				}
			}
		}
		
		if (usingCreature == null)
		{
			usingCreature = pc;
		}
		
		item.useFunction(targetCreature, usingCreature);
		
		if (!infiniteItems() && !item.hasFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT))
		{
			item.quantity--;
			if (item.quantity <= 0)
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
	else CombatManager.processCombat();
}

public var shopkeepBackFunctor:Function = null;

public function shop(keeper:Creature):void {
	
	if (shopkeepBackFunctor != null)
	{
		shopkeepBackFunctor();
		shopkeepBackFunctor = null; // Clear it after use so we don't accidently do shit with it later.
		return;
	}
	
	if(keeper is Geoff) {
		mainGameMenu();
		return;
	}
	else if(keeper is Jade) {
		approachJade();
		return;
	}
	else if(keeper is Sera) {
		approachSera();
		return;
	}
	else if(keeper is Kelly) {
		kellyOfficeApproach();
		return;
	}
	else if(keeper is Anno)
	{
		if (!annoIsCrew()) repeatAnnoApproach();
		else annoFollowerApproach();
		return;
	}
	else if(keeper is Ellie)
	{
		ellieMenu();
		return;
	}
	else if(keeper is Renvra)
	{
		approachRenvra();
		return;
	}
	else if(keeper is Xanthe)
	{
		enterTheSilkenSerenityWhyDidWashHaveToDie();
		return;
	}
	else if(keeper is MerchantQueen) {
		introductionToMerchantQueenSloot();
		return;
	}
	else if(keeper is Seifyn)
	{
		repeatSeifynMeeting();
		return;
	}
	else if(keeper is Ceria)
	{
		ceriaMenu();
		return;
	}
	else if(keeper is Gene)
	{
		genesModsGenericScene();
		return;
	}
	else if(keeper is Emmy)
	{
		backToEmmyMain();
		return;
	}
	else if(keeper is Inessa)
	{
		approachIness();
		return;
	}
	else if(keeper is CrystalShopkeep)
	{
		visitCrystalGooShop();
		return;
	}
	else if(keeper is Vi)
	{
		approachVi();
		return;
	}
	else if(keeper is DoctorLash)
	{
		mainGameMenu();
		return;
	}
	else if(keeper is VKo)
	{
		approachVKo();
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

public function buyItem():void {
	clearOutput();
	output(shopkeep.keeperBuy);
	var buyOptions:Boolean = kGAMECLASS.gameOptions.vendorToggle;
	var temp:Number = 0;
	clearMenu();
	for(var x:int = 0; x < shopkeep.inventory.length; x++) {
		trace("GOING THROUGH SHOPKEEP INVENTORY.");
		//If slot has something in it.
		if(shopkeep.inventory[x].quantity > 0) {
			output("\n");
			temp = getBuyPrice(shopkeep,shopkeep.inventory[x].basePrice);
			
			// Coupons (only affects buy price--not sell price.)
			var couponName:String = "Coupon - " + shopkeep.inventory[x].shortName;
			if(pc.hasKeyItem(couponName))
			{
				temp = Math.round(temp * pc.keyItemv1(couponName));
			}
			
			if(temp > pc.credits) output("<b>(Too Expensive)</b> ");
			output(StringUtil.upperCase(shopkeep.inventory[x].description, false) + " - " + temp + " credits.");
			trace("DISPLAYING SHIT");
			if(temp <= pc.credits) {
				trace("SHOWAN BUTANS: " + x);
				if(buyOptions)
				{
					if (x <= 13) addItemButton(x, shopkeep.inventory[x], buyItemOK, shopkeep.inventory[x], null, null, shopkeep, pc);
					if (x > 13) addItemButton(x + 1, shopkeep.inventory[x], buyItemOK, shopkeep.inventory[x], null, null, shopkeep, pc);
				}
				else
				{
					if (x <= 13) addItemButton(x, shopkeep.inventory[x], buyItemGo, shopkeep.inventory[x], null, null, shopkeep, pc);
					if (x > 13) addItemButton(x + 1, shopkeep.inventory[x], buyItemGo, shopkeep.inventory[x], null, null, shopkeep, pc);
				}
			}
			else {
				trace("SHOWAN HIDE BUTTONS");
				if(x <= 13) addDisabledButton(x, shopkeep.inventory[x].shortName + " x" + shopkeep.inventory[x].quantity);
				if(x > 13) addDisabledButton(x + 1, shopkeep.inventory[x].shortName + " x" + shopkeep.inventory[x].quantity);
			}
		}
	}
	addButton(14,"Back",shop,shopkeep);
}

public function buyItemOK(arg:ItemSlotClass):void
{
	clearOutput();
	clearMenu();
	
	var price:Number = getBuyPrice(shopkeep,arg.basePrice);
	var hasCoupon:Boolean = false;
	var couponName:String = "Coupon - " + arg.shortName;
	if(pc.hasKeyItem(couponName))
	{
		price = Math.round(price * pc.keyItemv1(couponName));
		hasCoupon = true;
	}
	
	output("Are you sure you want to buy " + arg.description + " for");
	if(hasCoupon) output(" a discounted price of");
	output(" " + price + " credits?");
	
	addButton(0, "Yes", buyItemGo, arg);
	addButton(1, "No", buyItem);
}

public function buyItemGo(arg:ItemSlotClass):void {
	clearOutput();
	var price:Number = getBuyPrice(shopkeep,arg.basePrice);
	
	// Apply and destroy coupons!
	var usedCoupon:Boolean = false;
	var couponName:String = "Coupon - " + arg.shortName;
	if(pc.hasKeyItem(couponName))
	{
		price = Math.round(price * pc.keyItemv1(couponName));
		pc.removeKeyItem(couponName);
		usedCoupon = true;
	}
	if(usedCoupon) output("The coupon saved on your codex is used and instantly changes the final price. ");
	
	output("You purchase " + arg.description + " for " + num2Text(price) + " credits.\n\n");

	pc.credits -= price;
	
	//Special Vendor/Item Overrides
	if(shopkeep is Colenso && arg is TarkusJokeBook)
	{
		output("Colenso hands you the card, which you scan into your codex. It beeps.\n\n<b>A new codex entry under Fiction is available!</b>");
		CodexManager.unlockEntry("Diverting Jokes");
		//’Next’ button can either return to shop menu or go directly to the codex entry, you choose
		clearMenu();
		addButton(0,"Next",colensoBuyMenu);
		return;
	}
	//Emmy magic!
	else if(shopkeep is Emmy) flags["PURCHASED_FROM_EMS"] = 1;
	else if(shopkeep is Sera) flags["PURCHASED_FROM_SERA"] = 1;
	// Renamed from lootList so I can distinguish old vs new uses
	var purchasedItems:Array = new Array();
	purchasedItems[purchasedItems.length] = arg.makeCopy();
	//Cheese shit for GaloMax
	if(arg is GaloMax)
	{
		if(shopkeep is Gene) 
		{
			flags["PURCHASED_GENES_GALO"] = 1;
			chars["GENE"].destroyItem(new GaloMax());
		}
		else if(shopkeep is Sera) 
		{
			flags["PURCHASED_SERAS_GALO"] = 1;
			chars["SERA"].destroyItem(new GaloMax());
		}
	}
	//Set everything to take us back to buyItem!
	itemScreen = buyItem;
	lootScreen = buyItem;
	useItemFunction = buyItem;
	itemCollect(purchasedItems);
}

public function sellItem():void {
	clearOutput();
	output(shopkeep.keeperSell);
	var sellOptions:Boolean = kGAMECLASS.gameOptions.vendorToggle;
	clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++) {
		//If slot has something in it.
		if(pc.inventory[x].quantity > 0) {
			trace("PC inventory being checked for possible sale.");
			//Does the shopkeep buy this type?
			if(shopkeep.buysType(pc.inventory[x].type)) {
				output("\n" + StringUtil.upperCase(pc.inventory[x].description, false) + " - " + getSellPrice(shopkeep,pc.inventory[x].basePrice) + " credits.");
				if(sellOptions)
				{
					if (x <= 13) addItemButton(x, pc.inventory[x], sellItemQuantity, pc.inventory[x], null, null, pc, shopkeep);
					if (x > 13) addItemButton(x + 1, pc.inventory[x], sellItemQuantity, pc.inventory[x], null, null, pc, shopkeep);
				}
				else
				{
					if (x <= 13) addItemButton(x, pc.inventory[x], sellItemGo, pc.inventory[x], null, null, pc, shopkeep);
					if (x > 13) addItemButton(x + 1, pc.inventory[x], sellItemGo, pc.inventory[x], null, null, pc, shopkeep);
				}
			}
			else {
				if(x <= 13) addDisabledButton(x, pc.inventory[x].shortName + " x" + pc.inventory[x].quantity, StringUtil.toDisplayCase(pc.inventory[x].longName), "The vendor is not interested in this item.");
				if(x > 13) addDisabledButton(x + 1, pc.inventory[x].shortName + " x" + pc.inventory[x].quantity, StringUtil.toDisplayCase(pc.inventory[x].longName), "The vendor is not interested in this item.");
			}
		}
	}
	addButton(14,"Back",shop,shopkeep);
}

public function sellItemQuantity(arg:ItemSlotClass):void
{
	clearOutput();
	clearMenu();
	
	var price:Number = getSellPrice(shopkeep,arg.basePrice);
	
	if(arg.quantity > 1)
	{
		output("How many of your " + arg.longName + " do you want to sell?");
		
		if(arg.quantity >= 1) addButton(0, "x1", sellItemMultiOK, [arg, 1]);
		if(arg.quantity >= 2) addButton(1, "x2", sellItemMultiOK, [arg, 2]);
		if(arg.quantity >= 3) addButton(2, "x3", sellItemMultiOK, [arg, 3]);
		if(arg.quantity >= 4) addButton(3, "x4", sellItemMultiOK, [arg, 4]);
		if(arg.quantity >= 5) addButton(4, "x5", sellItemMultiOK, [arg, 5]);
		
		if(arg.quantity >= 10) addButton(5, "x10", sellItemMultiOK, [arg, 10]);
		if(arg.quantity >= 20) addButton(6, "x20", sellItemMultiOK, [arg, 20]);
		if(arg.quantity >= 30) addButton(7, "x30", sellItemMultiOK, [arg, 30]);
		if(arg.quantity >= 40) addButton(8, "x40", sellItemMultiOK, [arg, 40]);
		if(arg.quantity >= 50) addButton(9, "x50", sellItemMultiOK, [arg, 50]);
		
		addButton(12, "Custom", sellItemMultiCustom, arg);
		addButton(13, "All (x" + arg.quantity + ")", sellItemMultiOK, [arg, arg.quantity]);
		addButton(14, "Cancel", sellItem);
	}
	else
	{
		output("Are you sure you want to sell " + arg.description + " for " + price + " credits?");
		
		addButton(0, "Yes", sellItemGo, arg);
		addButton(1, "No", sellItem);
	}
}
public function sellItemMultiCustom(arg:ItemSlotClass):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	clearOutput();
	
	output("How many of your " + arg.longName + " do you want to sell? (x" + arg.quantity + " maximum.)");
	output("\n");
	displayInput();
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", sellItemMultiCustomOK, arg);
	addButton(14, "Back", sellItemMultiCustomNo, arg);
}
public function sellItemMultiCustomOK(arg:ItemSlotClass):void
{
	if(isNaN(Number(userInterface.textInput.text))) {
		sellItemMultiCustom(arg);
		output("Choose a quantity that is a positive integer, please.");
		return;
	}
	else if(Number(userInterface.textInput.text) < 1) {
		sellItemMultiCustom(arg);
		output("Choose a quantity that is 1 or more, please.");
		return;
	}
	else if(Number(userInterface.textInput.text) > arg.quantity) {
		sellItemMultiCustom(arg);
		output("Choose a quantity that is " + arg.quantity + " or below, please.");
		return;
	}
	var soldNumber:int = Math.floor(Number(userInterface.textInput.text));
	sellItemMultiCustomGo([arg, soldNumber]);
}
public function sellItemMultiCustomNo(arg:ItemSlotClass):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	sellItemQuantity(arg);
}
public function sellItemMultiCustomGo(arg:Array):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	sellItemMultiOK(arg);
}
public function sellItemMultiOK(arg:Array):void
{
	clearOutput();
	
	var soldItem:ItemSlotClass = arg[0];
	var soldNumber:int = arg[1];
	var soldPrice:Number = (getSellPrice(shopkeep,soldItem.basePrice) * soldNumber);
	
	output("Are you sure you want to sell " + soldItem.description + " (x" + soldNumber + ") for " + num2Text(soldPrice) + " credits?");
	
	clearMenu();
	addButton(0, "Yes", sellItemMulti, [soldItem, soldNumber]);
	addButton(1, "No", sellItemQuantity, soldItem);
}
public function sellItemMulti(arg:Array):void
{
	clearOutput();
	
	var soldItem:ItemSlotClass = arg[0];
	var soldNumber:int = arg[1];
	var soldPrice:Number = (getSellPrice(shopkeep,soldItem.basePrice) * soldNumber);
	
	sellItemBonus(soldItem, soldPrice);
	
	pc.credits += soldPrice;
	
	output("You sell " + soldItem.description + " (x" + soldNumber + ") for " + num2Text(soldPrice) + " credits.");
	
	soldItem.quantity -= soldNumber;
	if (soldItem.quantity == 0) pc.inventory.splice(pc.inventory.indexOf(soldItem), 1);
	
	clearMenu();
	addButton(0,"Next",sellItem);
}

public function sellItemGo(arg:ItemSlotClass):void {
	clearOutput();
	var price:Number = getSellPrice(shopkeep,arg.basePrice);
	
	sellItemBonus(arg, price);
	
	pc.credits += price;
	output("You sell " + arg.description + " for " + num2Text(price) + " credits.");
	arg.quantity--;
	if (arg.quantity == 0) pc.inventory.splice(pc.inventory.indexOf(arg), 1);
	this.clearMenu();
	this.addButton(0,"Next",sellItem);
}

// Special seller/item handling
public function sellItemBonus(arg:ItemSlotClass, price:Number = 0):void
{
	if(shopkeep is Sera)
	{
		pc.createStatusEffect("Sera Credit Debt", 0, 0, 0, 0, true, "", "", false, (7 * 24 * 60));
		pc.addStatusValue("Sera Credit Debt", 1, price);
	}
}

public function getSellPrice(keeper:Creature,basePrice:Number):Number {
	var sellPrice:Number = basePrice * keeper.buyMarkdown * pc.sellMarkup;
	if(pc.hasPerk("Supply And Demand")) sellPrice *= 1.1;
	sellPrice = Math.round(sellPrice);
	return sellPrice;
}
public function getBuyPrice(keeper:Creature,basePrice:Number):Number {
	var buyPrice:Number = basePrice * keeper.sellMarkup * pc.buyMarkdown;
	if(pc.hasPerk("Supply And Demand")) buyPrice *= .95;
	buyPrice = Math.round(buyPrice);
	return buyPrice;
}

public function unequipMenu():void
{
	clearOutput();
	var x:int = 0;
	itemScreen = inventory;
	useItemFunction = inventory;
	var adjustment:int = 0;
	output("What would you like to unequip?");
	output("\n\n");
	equipmentDisplay();

	clearMenu();
	if (pc.upperUndergarment.shortName != "") 
	{
		this.addOverrideItemButton(0, pc.upperUndergarment, "U.Top Off", unequip, "bra");
	}
	else this.addDisabledButton(0,"Undertop");

	if (pc.shield.shortName != "") 
	{
		this.addOverrideItemButton(1, pc.shield, "Shield Off", unequip, "shield");
	}
	else this.addDisabledButton(1,"Shield");
	
	if (pc.lowerUndergarment.shortName != "")
	{
		this.addOverrideItemButton(5, pc.lowerUndergarment, "U.Wear Off", unequip, "underwear");
	}
	else this.addDisabledButton(5,"Underwear");
	
	if (pc.meleeWeapon.shortName != "Rock") 
	{
		this.addOverrideItemButton(2, pc.meleeWeapon, "Melee Off", unequip, "mWeapon");
	}
	else this.addDisabledButton(2,"Melee");
	
	if (pc.armor.shortName != "") 
	{
		this.addOverrideItemButton(6, pc.armor, "Armor Off", unequip, "armor");
	}
	else this.addDisabledButton(6,"Armor");
	
	if (pc.rangedWeapon.shortName != "Rock")
	{
		this.addOverrideItemButton(7, pc.rangedWeapon, "Ranged Off", unequip, "rWeapon");
	}
	else this.addDisabledButton(7,"Ranged");
	
	if (pc.accessory.shortName != "") 
	{
		this.addOverrideItemButton(3, pc.accessory, "Acc. Off", unequip, "accessory");
	}
	else this.addDisabledButton(3,"Accessory");
	
	//Set user and target.
	itemUser = pc;
	addButton(14,"Back",generalInventoryMenu);
}

public function keyItemDisplay():void
{
	clearOutput();
	var x:int = 0;
	
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
	else output("<i>None</i>\n\n");
	clearMenu();
	addButton(14,"Back",inventory);
}
public function equipmentDisplay():void
{
	output("<b><u>Equipment:</u></b>\n");
	output("<b>Melee Weapon:</b> " + StringUtil.toTitleCase(pc.meleeWeapon.description) + "\n");
	output("<b>Ranged Weapon:</b> " + StringUtil.toTitleCase(pc.rangedWeapon.description) + "\n");
	output("<b>Armor:</b> " + StringUtil.toTitleCase(pc.armor.description) + "\n");
	output("<b>Shield:</b> " + StringUtil.toTitleCase(pc.shield.description) + "\n");
	output("<b>Accessory:</b> " + StringUtil.toTitleCase(pc.accessory.description) + "\n");
	output("<b>Underwear Bottom:</b> " + StringUtil.toTitleCase(pc.lowerUndergarment.description) + "\n");
	output("<b>Underwear Top:</b> " + StringUtil.toTitleCase(pc.upperUndergarment.description) + "\n\n");
	
	output("<b><u>Equipment Stats:</u></b>\n");
	output("<b>" + StringUtil.toDisplayCase(pc.meleeWeapon.longName) + "</b>\n");
	output(pc.meleeWeapon.compareTo(new EmptySlot(), null, null, true));
	
	output("\n<b>" + StringUtil.toDisplayCase(pc.rangedWeapon.longName) + "</b>\n");
	output(pc.rangedWeapon.compareTo(new EmptySlot(), null, null, true));

	output("\n<b>" + StringUtil.toDisplayCase(pc.armor.longName) + "</b>\n");
	output(pc.armor.compareTo(new EmptySlot(), null, null, true));

	output("\n<b>" + StringUtil.toDisplayCase(pc.shield.longName) + "</b>\n");
	output(pc.shield.compareTo(new EmptySlot(), null, null, true));

	output("\n<b>" + StringUtil.toDisplayCase(pc.accessory.longName) + "</b>\n");
	output(pc.accessory.compareTo(new EmptySlot(), null, null, true));

	output("\n<b>" + StringUtil.toDisplayCase(pc.upperUndergarment.longName) + "</b>\n");
	output(pc.upperUndergarment.compareTo(new EmptySlot(), null, null, true));

	output("\n<b>" + StringUtil.toDisplayCase(pc.lowerUndergarment.longName) + "</b>\n");
	output(pc.lowerUndergarment.compareTo(new EmptySlot(), null, null, true));
	
	output("\n");
}
public function inventoryDisplay():void
{
	var x:int = 0;
	output("<b><u>Inventory:</u></b>");
	if(pc.inventory.length > 0)
	{
		for(x = 0; x < pc.inventory.length; x++)
		{
			var item:ItemSlotClass = pc.inventory[x];
			output("\n");
			if (item.stackSize > 1) output(item.quantity + "x ");
			output(StringUtil.toDisplayCase(item.longName));
		}
	}
	else output("\n<i>Empty</i>");
	output("\n\n");
}

public function generalInventoryMenu():void
{
	clearOutput();
	var x:int = 0;
	itemScreen = inventory;
	useItemFunction = inventory;
	
	output("What item would you like to use?");
	output("\n\n");
	inventoryDisplay();
	this.clearMenu();
	var adjustment:int = 0;
	for(x = 0; x < pc.inventory.length || x < 14; x++) {
		//key item menu
		if(x+adjustment == 12) {
			addButton(x+adjustment,"Key Item",keyItemDisplay,undefined,"Key Items","View your list of key items.");
			adjustment++;
		}
		//unequip menu
		if(x+adjustment == 13) {
			addButton(x+adjustment,"Unequip",unequipMenu,undefined,"Unequip","Unequip an item.");
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

public function combatInventoryMenu():void
{
	clearOutput();
	clearMenu();
	itemScreen = inventory;
	useItemFunction = inventory;
	
	output("What item would you like to use?");
	output("\n\n");
	inventoryDisplay();
	equipmentDisplay();
	for (var i:int = 0; i < pc.inventory.length; i++)
	{
		var tItem:ItemSlotClass = pc.inventory[i];
		if (tItem.type == GLOBAL.MELEE_WEAPON || tItem.type == GLOBAL.RANGED_WEAPON || tItem.combatUsable == true)
		{
			addItemButton((i < 14) ? i : i + 1, pc.inventory[i], combatUseItem, pc.inventory[i]);
		}
		else
		{
			addDisabledButton((i < 14) ? i : i + 1, pc.inventory[i].shortName + " x" + pc.inventory[i].quantity, StringUtil.toDisplayCase(pc.inventory[i].longName), "Cannot be used in combat.");
		}
	}
	
	addButton(14, "Back", CombatManager.showCombatMenu);
}

public function inventory():void 
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


public function unequip(arg:String, next:Boolean = true):void 
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
	
	unequippedItems[unequippedItems.length - 1].onRemove(pc);
	
	clearOutput();
	itemCollect(unequippedItems);
}

// atm, no equippable items have a stacksize > 1, so there is never a possibility that we'd have to split an item stack to equip an item the player holds in their inventory.
public function equipItem(arg:ItemSlotClass):void {
	var targetItem:ItemSlotClass;
	var removedItem:ItemSlotClass;

	if (arg.stackSize > 1) throw new Error("Potential item stacking bug with " + arg.shortName + ". Item has a stacksize > 0 and the equip code cannot currently handle splitting an item stack!");
	
	clearOutput();
	output("You");
	if(arg.type == GLOBAL.ARMOR) output(" don");
	else if(InCollection(arg.type, GLOBAL.CLOTHING, GLOBAL.UPPER_UNDERGARMENT, GLOBAL.LOWER_UNDERGARMENT)) output(" wear");
	else output(" equip");
	output(" your " + arg.longName + ".");
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
	if(pc.hasStatusEffect("Gunlock") && arg.type == GLOBAL.RANGED_WEAPON)
	{
		output("<b> Your new ranged weapon doesn't suffer from the effects of gunlock!</b>");
		pc.removeStatusEffect("Gunlock");
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
	else output(" <b>AN ERROR HAS OCCURRED: Equipped invalid item type. Item: " + arg.longName + "</b> ");
	
	removedItem.onRemove(pc);
	arg.onEquip(pc);
	
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

public function isSameItem(itemA:ItemSlotClass, itemB:ItemSlotClass):Boolean
{
	if (itemA.hasRandomProperties == false && itemB.hasRandomProperties == false && itemA.shortName == itemB.shortName) return true;
	if (itemA.hasRandomProperties == true || itemB.hasRandomProperties == true)
	{
		// Add any other specific checks here!
		if(itemA.longName == itemB.longName) return true;
	}
	// Nothing matches!
	return false;
}

public function itemCollect(newLootList:Array, clearScreen:Boolean = false):void 
{
	
	if(clearScreen) clearOutput();
	
	var target:PlayerCharacter = pc;
	
	output("You acquire " + newLootList[0].description + " (x" + newLootList[0].quantity + ")");
	
	var tItem:ItemSlotClass = newLootList[0];
	
	// Check to see if we can merge the item into an existing stack.
	for (var i:int = 0; i < target.inventory.length; i++)
	{
		var iSlot:ItemSlotClass = target.inventory[i] as ItemSlotClass;
		
		// Check if same item && space in stack
		//if (iSlot.shortName == tItem.shortName && iSlot.quantity < iSlot.stackSize)
		if (isSameItem(tItem, iSlot) && iSlot.quantity < iSlot.stackSize)
		{
			// Check if 100% merge will go past max stack
			if (iSlot.quantity + tItem.quantity > iSlot.stackSize)
			{
				var mergeNum:int = iSlot.stackSize - iSlot.quantity;
				iSlot.quantity += mergeNum;
				tItem.quantity -= mergeNum;
			}
			// Otherwise merge entire incoming item stack and null the ref
			else
			{
				iSlot.quantity += tItem.quantity;
				tItem = null;
				break;
			}
		}
	}
	
	// Check to see if we can add a new item stack into the players inventory
	if (tItem && target.inventory.length < target.inventorySlots())
	{
		target.inventory.push(tItem);
		tItem = null;
	}
	
	// Fallback; offer an options menu to handle things.
	if (tItem)
	{
		output(". There is no room in your inventory for your new acquisition. Do you discard the item or replace a filled item slot?");
		this.clearMenu();
		this.addButton(0,"Replace", replaceItemPicker, newLootList); // ReplaceItem is a actionscript keyword. Let's not override it, mmkay?
		this.addButton(1,"Discard", discardItem, newLootList);
		//Hacky fix. If you hit useLoot with stuff that has its own submenus, it'll overwrite the submenu with the loot info for the next item. For instance, if you loot a hand cannon and a spear, then equip the hand cannon, your old ZK rifle will vanish into the ether while the game jumps over it to the spear.
		if ((newLootList.length >= 2)) addDisabledButton(2,"Use","Use","You cannot use an item while there are more items in the loot queue.");
		else if ((newLootList[0] as ItemSlotClass).hasFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT)) addDisabledButton(2,"Use","Use","You cannot use this item with a full inventory.");
		else if ((newLootList[0] as ItemSlotClass).isUsable == true) this.addButton(2,"Use", useLoot, newLootList);
	}
	else
	{			
		output(". The new acquisition");
		if(newLootList[0].quantity > 1) output("s stow");
		else output(" stows");
		output(" away quite easily.\n");
		//Clear the item off the newLootList.
		newLootList.splice(0,1);
		this.clearMenu();
		if(newLootList.length > 0) this.addButton(0,"Next",itemCollect,newLootList);
		else this.addButton(0,"Next",lootScreen);
	}
}

public function discardItem(lootList:Array):void {
	clearOutput();
	output("You discard " + lootList[0].description + " (x" + lootList[0].quantity + ").\n\n");
	lootList.splice(0,1);
	this.clearMenu();
	if(lootList.length > 0) this.addButton(0,"Next",itemCollect, lootList);
	else this.addButton(0,"Next",lootScreen);
}

public function replaceItemPicker(lootList:Array):void {
	clearOutput();
	output("You have " + lootList[0].description + " (x" + lootList[0].quantity + ") but there is no room left in your inventory.\n\n");
	output("What will you replace?");
	this.clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++) {
		if(pc.inventory[x].shortName != "" && pc.inventory[x].quantity > 0) 
		{
			var butDesc:String = pc.inventory[x].shortName + " x" + pc.inventory[x].quantity
			this.addButton(x,butDesc,replaceItemGo,[x, lootList]); // HAAACK. We can only pass one arg, so shove the two args into an array
		}
	}
	
	this.addButton(14, "Back",
		(function(c_lootList:Array):Function
		{
			return function():void
			{
				itemCollect(c_lootList, true);
			}
		}(lootList)), undefined);
}

public function useLoot(lootList:Array):void {
	var loot:ItemSlotClass = lootList[0];
	
	// Remove equipped items from the list
	// useLoot returns true during an equip-call
	if (useItem(loot))
	{
		lootList.splice(0, 1);
	}
	else if (loot.quantity <= 0)
	{
		lootList.splice(0,1);
	}
	
	if (lootList.length > 0)
	{
		itemCollect(lootList);
	}
}
public function abandonLoot(lootList:Array):void {
	output("You toss out " + lootList[0].description + ".");
	lootList.splice(0,1);
	this.clearMenu();
	this.addButton(0,"Next",lootScreen);
}

public function replaceItemGo(args:Array):void 
{
	var indice:int = args[0];
	var lootList:Array = args[1];
	clearOutput();
	output("You toss out " + pc.inventory[indice].description + " (x" + pc.inventory[indice].quantity + ") to make room for " + lootList[0].description + " (x" + lootList[0].quantity + ").");
	pc.inventory[indice] = lootList[0];
	lootList.splice(0,1);
	this.clearMenu();
	if(lootList.length > 0) 
	{
		output("\n\n");
		this.addButton(0,"Next",itemCollect, lootList);
	}
	else 
		this.addButton(0,"Next",lootScreen);
}

public function hasShipStorage():Boolean
{
	if (flags["SHIP_STORAGE_WARDROBE"] == undefined) flags["SHIP_STORAGE_WARDROBE"] = 10;
	if (flags["SHIP_STORAGE_EQUIPMENT"] == undefined) flags["SHIP_STORAGE_EQUIPMENT"] = 10;
	if (flags["SHIP_STORAGE_CONSUMABLES"] == undefined) flags["SHIP_STORAGE_CONSUMABLES"] = 10;
	if (flags["SHIP_STORAGE_VALUABLES"] == undefined) flags["SHIP_STORAGE_VALUABLES"] = 10;
	
	return true;
}

public function shipStorageMenuRoot():void
{
	clearOutput();
	output("You turn to your ship's storage.");
	
	clearMenu();
	
	if (flags["SHIP_STORAGE_WARDROBE"] != undefined) 
	{
		 output(" A wardrobe closet lines a section of the wall, reminding you where you keep all your clothes, outfits and armors.");
		 addButton(0, "Wardrobe", shipStorageMenuType, "WARDROBE");
	}
	else addDisabledButton(0, "Wardrobe");
	
	if (flags["SHIP_STORAGE_EQUIPMENT"] != undefined)
	{
		output(" Various cabinets, shelves and weapon racks designate the equipment area.");
		addButton(1, "Equipment", shipStorageMenuType, "EQUIPMENT");
	}
	else addDisabledButton(1, "Equipment");
	
	if (flags["SHIP_STORAGE_CONSUMABLES"] != undefined)
	{
		output(" A chest with multiple compartments is located below, meant for storing consumable items.");
		addButton(2, "Consumables", shipStorageMenuType, "CONSUMABLES");
	}
	else addDisabledButton(2, "Consumables");
	
	if (flags["SHIP_STORAGE_VALUABLES"] != undefined)
	{
		output(" Adjacent to that is a small vault used to store valuable or important items.");
		addButton(3, "Valuables", shipStorageMenuType, "VALUABLES");
	}
	else addDisabledButton(3, "Valuables");
	
	if (kGAMECLASS.flags["DONG_DESIGNER_INSTALLED"] == 1)
	{
		output("\n\nNearby, the TamaniCorp Dong Designer hums with life.");
		addButton(5,"D.Designer",useInstalledDickBox,undefined,"Dong Designer","Use the TamaniCorp Hora Series Dong Designer you found on Tarkus.");
	}
	if(kGAMECLASS.flags["EGG_TRAINER_INSTALLED"] == 1) 
	{
		output("\n\nYour bright pink Egg Trainer is sitting in the corner, rumbling slightly as the heating and cleaning processes inside it percolate.");
		//if PC has a belly full of eggs:
		if(9999 == 0) output(" You run a hand across your swollen belly, vaguely wishing you could squat the current load out... only to get another mind-melting orgasm from the next batch going in!");
		//if PC has a faux-preg egg: 
		else if(9999 == 0) output(" You run a hand across your [pc.belly]. You could get your Faux Preg Egg out at any time with the device, if you wanted to.");
		addButton(6,"EggTrainer",repeatEggTrainerApproach,undefined,"Egg Trainer","Put your Egg Trainer to use.");
	}
	addButton(14, "Back", mainGameMenu);
}

private const STORAGE_MODE_TAKE:uint = 1 << 0;
private const STORAGE_MODE_STORE:uint = 1 << 1;

private var _shipStorageMode:uint = STORAGE_MODE_TAKE;

public function shipStorageMenuType(type:String):void
{
	clearOutput();
	
	var items:Array = outputStorageListForType(type);
	
	clearMenu();
	
	if (_shipStorageMode == STORAGE_MODE_STORE)
	{
		items = getListOfType(pc.inventory, type);
	}
	
	populateTakeMenu(items, type);
}

public function shipStorageMode(args:Array):void
{
	_shipStorageMode = args[0];
	shipStorageMenuType(args[1])
}

public function populateTakeMenu(items:Array, type:String, func:Function = null):void
{
	var maxPerPage:int = 10;
	var pgIdx:int = 0;
	
	if (func == null)
	{
		if (_shipStorageMode == STORAGE_MODE_STORE) func = storeItem;
		if (_shipStorageMode == STORAGE_MODE_TAKE) func = takeItem;
	}
	
	for (var i:int = 0; i < items.length; i++)
	{
		var btnIdx:int = i % maxPerPage;
		pgIdx = i / maxPerPage;
		var pgOset:int = 15 * pgIdx;
		
		addItemButton(btnIdx + pgIdx, items[i], func, [items[i], type]);
	}
	
	var menuInserts:int = 0;
	
	do
	{
		if (_shipStorageMode != STORAGE_MODE_TAKE) addButton((menuInserts * 15) + 10, "Take", shipStorageMode, [STORAGE_MODE_TAKE, type], "Take from Ship Storage", "Take items from storage and place them in your inventory.");
		else
		{
			addDisabledButton((menuInserts * 15) + 10, "Take");
		}
		if (_shipStorageMode != STORAGE_MODE_STORE) addButton((menuInserts * 15) + 11, "Store", shipStorageMode, [STORAGE_MODE_STORE, type], "Take from Inventory", "Take items from your inventory and place them in your ships storage.");
		else
		{
			addDisabledButton((menuInserts * 15) + 11, "Store");
		}
		
		addButton((menuInserts * 15) + 14, "Back", shipStorageMenuRoot);
		menuInserts++;
	} while (menuInserts < pgIdx);
}

public function getListOfType(from:Array, type:String):Array
{
	var items:Array = [];
	
	for (var i:int = 0; i < from.length; i++)
	{
		var item:ItemSlotClass = from[i] as ItemSlotClass;
		
		switch (type)
		{
			case "WARDROBE":
				if (InCollection(item.type, GLOBAL.ARMOR, GLOBAL.UPPER_UNDERGARMENT, GLOBAL.LOWER_UNDERGARMENT, GLOBAL.CLOTHING))
				{
					items.push(item);
				}
				break;
				
			case "EQUIPMENT":
				if (InCollection(item.type, GLOBAL.MELEE_WEAPON, GLOBAL.RANGED_WEAPON, GLOBAL.SHIELD, GLOBAL.ACCESSORY, GLOBAL.GADGET))
				{
					items.push(item);
				}
				break;
				
			case "CONSUMABLES":
				if (InCollection(item.type, GLOBAL.PILL, GLOBAL.FOOD, GLOBAL.POTION, GLOBAL.DRUG, GLOBAL.EXPLOSIVECONSUMABLE))
				{
					items.push(item);
				}
				break;
				
			case "VALUABLES":
				if (InCollection(item.type, GLOBAL.GEM, GLOBAL.QUESTITEM))
				{
					items.push(item);
				}
				break;
				
			default:
				break;
		}
	}
	
	return items;
}

public function getNumberOfStoredType(from:Array, type:String):int
{
	return getListOfType(from, type).length;
}

public function outputStorageListForType(type:String):Array
{
	var items:Array = getListOfType(pc.ShipStorageInventory, type);
	
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
	
	output("\n\n<b>You have " + String(Math.max(0, flags["SHIP_STORAGE_" + type] - items.length)) + " of " + flags["SHIP_STORAGE_" + type] + " storage slots free.</b>");

	return items;
}

public function storeItem(args:Array):void
{
	clearOutput();
	
	var item:ItemSlotClass = args[0];
	var type:String = args[1];
	
	// See if we can merge it into a stack
	if (item.stackSize > 1)
	{
		for (var i:int = 0; i < pc.ShipStorageInventory.length; i++)
		{
			var sItem:ItemSlotClass = pc.ShipStorageInventory[i] as ItemSlotClass;
			//if (sItem.shortName == item.shortName && sItem.quantity < sItem.stackSize)
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
	if (getNumberOfStoredType(pc.ShipStorageInventory, type) < flags["SHIP_STORAGE_" + type] && item.quantity > 0)
	{
		pc.ShipStorageInventory.push(item);
		pc.inventory.splice(pc.inventory.indexOf(item), 1);
	}
	else if (item.quantity > 0)
	{
		// If we're THIS far in, we couldn't fit the item in at all.
		output("There isn't enough room to store your item.");
		
		clearMenu();
		addButton(0, "Switch", replaceInStorage, [item, type], "Switch Items", "Switch an item in your ships storage with one in your inventory.");
		addButton(1, "Back", shipStorageMenuType, type);
		return;
	}
	
	shipStorageMenuType(type);
	return;
}

public function replaceInStorage(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var type:String = args[1];
	
	clearMenu();
	
	var items:Array = getListOfType(pc.ShipStorageInventory, type);
	
	for (var i:int = 0; i < items.length; i++)
	{
		addItemButton(i, items[i], doStorageReplace, [invItem, items[i], type]);
	}
}

public function doStorageReplace(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var tarItem:ItemSlotClass = args[1];
	var type:String = args[2];
	
	pc.inventory.splice(pc.inventory.indexOf(invItem), 1);
	pc.ShipStorageInventory.push(invItem);
	
	pc.ShipStorageInventory.splice(pc.ShipStorageInventory.indexOf(tarItem), 1);
	pc.inventory.push(tarItem);
	
	shipStorageMenuType(type);
}

public function takeItem(args:Array):void
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
			if (isSameItem(sItem, item) &&  sItem.quantity < sItem.stackSize)
			{
				if (sItem.quantity + item.quantity <= sItem.stackSize)
				{
					sItem.quantity += item.quantity;
					item.quantity = 0;
					pc.ShipStorageInventory.splice(pc.ShipStorageInventory.indexOf(item), 1);
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
		pc.ShipStorageInventory.splice(pc.ShipStorageInventory.indexOf(item), 1);
	}
	else if (item.quantity > 0)
	{
		// If we're THIS far in, we couldn't fit the item in at all.
		output("There isn't enough room to take your item.");
		
		clearMenu();
		addButton(0, "Switch", replaceInInventory, [item, type], "Switch Items", "Switch an item in your inventory with one in your ships storage.");
		addButton(1, "Back", shipStorageMenuType, type);
		return;
	}
	
	shipStorageMenuType(type);
}

public function replaceInInventory(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var type:String = args[1];
	
	var items:Array = getListOfType(pc.inventory, type);
	
	clearMenu();
	for (var i:int = 0; i < items.length; i++)
	{
		addItemButton(i, items[i], doInventoryReplace, [invItem, items[i], type]);
	}
}

public function doInventoryReplace(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var tarItem:ItemSlotClass = args[1];
	var type:String = args[2];
	
	pc.ShipStorageInventory.splice(pc.ShipStorageInventory.indexOf(invItem), 1);
	pc.inventory.push(invItem);
	
	pc.inventory.splice(pc.inventory.indexOf(tarItem), 1);
	pc.ShipStorageInventory.push(tarItem);
	
	shipStorageMenuType(type);
}
