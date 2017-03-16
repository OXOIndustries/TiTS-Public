import classes.Characters.Lerris;
import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.DataManager.Errors.VersionUpgraderError;
import classes.DataManager.Serialization.ItemSaveable;
import classes.GameData.CombatManager;
import classes.ItemSlotClass;
import classes.StorageClass;
import classes.StringUtil;
import classes.TiTS;
import classes.Items.Accessories.SiegwulfeItem;
import classes.Items.Armor.Unique.Omnisuit;
import classes.Items.Armor.Unique.OmnisuitCollar;
import classes.Items.Armor.Unique.StrangeCollar;

public function isEquippableItem(item:ItemSlotClass):Boolean
{
	return	InCollection(item.type, 
		GLOBAL.ARMOR, GLOBAL.SHIELD, GLOBAL.ACCESSORY, 
		GLOBAL.RANGED_WEAPON, GLOBAL.MELEE_WEAPON, 
		GLOBAL.CLOTHING, GLOBAL.UPPER_UNDERGARMENT, GLOBAL.LOWER_UNDERGARMENT
		);
}

public function itemConsume(item:ItemSlotClass):void
{
	if(infiniteItems()) return;
	
	item.quantity--;
	//Remove from inventory array!
	if (item.quantity <= 0 && pc.inventory.indexOf(item) != -1)
	{
		pc.inventory.splice(pc.inventory.indexOf(item), 1);
	}
}

public function useItem(item:ItemSlotClass):Boolean
{
	showName("");
	
	if (item.isUsable == false)
	{
		//trace("Need to find where the use button for this item was generated and disable it with isUsable == false checks.");
		clearOutput();
		output("Unable to use " + item.description + " at present.");
		//clearMenu();
		//addButton(14,"Back",useItemFunction);
		return false;
	}
	if (item.quantity == 0) 
	{
		clearOutput();
		output("Attempted to use " + item.description + " which had zero quantity.");
		clearMenu();
		addButton(14,"Back",useItemFunction);
		return false;
	}
	else 
	{
		//Equippable items are equipped!
		if (isEquippableItem(item))
		{
			// Preventive measures
			if(!pc.itemSlotUnlocked(item.type))
			{
				itemDisabledMessage(item.type);
				return false;
			}
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
				clearMenu();
				addButton(0,"Next",useItemFunction);
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
			
			return true;
		}
	}
	return false;
}

// A call with just an item will 
public function combatUseItem(item:ItemSlotClass, targetCreature:Creature = null, usingCreature:Creature = null):void
{
	//showName("");
	
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
		
		if (usingCreature == null)
		{
			usingCreature = pc;
		}
		
		if (targetCreature == null)
		{
			if (item.targetsSelf == true && item.requiresTarget == false)
			{
				targetCreature = pc;
			}
			else if (item.requiresTarget == false)
			{
				//item.useFunction(null, usingCreature);
			}
			else
			{
				// TODO: Show target selection interface
				// Invoke menu, early return, call back to self
				var targets:Array = [];
				if(item.targetsSelf == true) targets = CombatManager.getFriendlyActors();
				else targets = CombatManager.getHostileActors();
				
				if (targets.length == 1) targetCreature = targets[0];
				else if (CombatManager.enemiesAlive() == 1)
				{
					for (var i:int = 0; i < targets.length; i++)
					{
						if (!targets[i].isDefeated() || item.targetsSelf == true)
						{
							targetCreature = targets[i];
							break;
						}
					}
				}
				
				if (targetCreature == null)
				{
					clearOutput();
					output("Who do you wish to use the item on?");
					
					clearMenu();
					
					var bOff:int = 0;
					for (i = 0; i < targets.length; i++)
					{
						if (!targets[i].isDefeated() || item.targetsSelf == true)
						{
							addButton(bOff++, (targets[i] == pc ? "Yourself" : (targets[i].buttonText != null ? targets[i].buttonText : "???")), function(t_item:ItemSlotClass, t_target:Creature, t_user:Creature):Function {
								return function():void
								{
									combatUseItem(t_item, t_target, t_user);
								}
							}(item, targets[i], pc));
						}
					}
					
					addButton(14, "Back", combatInventoryMenu);
					return;
				}
			}
		}
		
		item.useFunction(targetCreature, usingCreature);
		
		if (!infiniteItems() && !item.hasFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT))
		{
			item.quantity--;
			if (item.quantity <= 0 && usingCreature.inventory.indexOf(item) != -1)
			{
				usingCreature.inventory.splice(usingCreature.inventory.indexOf(item), 1);
			}
		}
	}
	
	if (usingCreature is PlayerCharacter) backToCombatInventory(item);
}

public function backToCombatInventory(item:ItemSlotClass):void
{
	if(pc.hasPerk("Quickdraw") && InCollection(item.type, [GLOBAL.RANGED_WEAPON, GLOBAL.MELEE_WEAPON]))
	{
		clearMenu();
		addButton(0,"Next",combatInventoryMenu);
	}
	else
	{
		CombatManager.processCombat();
	}
}

public var shopkeepBackFunctor:Function = null;

public function shop(keeper:Creature):void {
	
	if (shopkeepBackFunctor != null)
	{
		shopkeepBackFunctor();
		shopkeepBackFunctor = null; // Clear it after use so we don't accidently do shit with it later.
		return;
	}
	
	if (keeper)
	{
		keeper.onLeaveBuyMenu();
		return;
	}
	
	clearOutput();
	output(keeper.keeperGreeting);
	shopkeep = keeper;
	//Menuuuu!
	clearMenu();
	addButton(0,"Buy Item",buyItem);
	if(keeper.typesBought.length > 0) 
		addButton(1,"Sell Item",sellItem);
	addButton(14,"Back",mainGameMenu);
}

public function buyItem():void {
	clearOutput();
	output(shopkeep.keeperBuy);
	var buyOptions:Boolean = kGAMECLASS.gameOptions.vendorToggle;
	var temp:Number = 0;
	var btnSlot:int = 0;
	
	//Multi page notice.
	if(shopkeep.inventory.length >= 15) output("\n(<b>Multiple pages of items are available. Please be aware of the page forward/back buttons in the lower right corner of the user interface when making your purchase.</b>)\n");

	//Build menu
	clearMenu();
	for(var x:int = 0; x < shopkeep.inventory.length; x++) {
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", shop, shopkeep);
			btnSlot++;
		}
		
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
			else if(shopkeep is Lerris && pc.hasKeyItem("Coupon - TamaniCorp"))
			{
				temp = Math.round(temp * pc.keyItemv1("Coupon - TamaniCorp"));
			}
			
			if(temp > pc.credits) output("<b>(Too Expensive)</b> ");
			output(StringUtil.upperCase(shopkeep.inventory[x].description, false) + " - " + temp + " credits.");
			trace("DISPLAYING SHIT");
			if(temp <= pc.credits) {
				trace("SHOWAN BUTANS: " + x);
				if(buyOptions)
				{
					addItemButton(btnSlot, shopkeep.inventory[x], buyItemOK, shopkeep.inventory[x], null, null, shopkeep, pc);
				}
				else
				{
					addItemButton(btnSlot, shopkeep.inventory[x], buyItemGo, shopkeep.inventory[x], null, null, shopkeep, pc);
				}
			}
			else {
				trace("SHOWAN HIDE BUTTONS");
				addDisabledButton(btnSlot, shopkeep.inventory[x].shortName + " x" + shopkeep.inventory[x].quantity);
			}
			btnSlot++;
		}
		
		if(shopkeep.inventory.length > 14 && (x + 1) == shopkeep.inventory.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", shop, shopkeep);
		}
	}
	addButton(14, "Back", shop, shopkeep);
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
	else if(shopkeep is Lerris && pc.hasKeyItem("Coupon - TamaniCorp"))
	{
		price = Math.round(price * pc.keyItemv1("Coupon - TamaniCorp"));
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
	else if(shopkeep is Petr)
	{
		arbetzPetrBuyGo(arg);
		return;
	}
	//Emmy magic!
	else if(shopkeep is Emmy) flags["PURCHASED_FROM_EMS"] = 1;
	else if(shopkeep is Sera) flags["PURCHASED_FROM_SERA"] = 1;
	else if(shopkeep is Ceria) flags["CERIA_BOUGHT"] = 1;
	
	//Suma swap
	if(arg is SumaCream)
	{
		// Buying Suma Cream has a 1 in 20 chance of getting a “Black Cream” pearl instead, due to J’ejune’s lax oversight
		if(rand(20) == 0) arg = new SumaCreamBlack();
		else arg = new SumaCreamWhite();
	}
	
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
	else if(shopkeep is Lerris && pc.hasKeyItem("Coupon - TamaniCorp"))
	{
		price = Math.round(price * pc.keyItemv1("Coupon - TamaniCorp"));
		pc.removeKeyItem(couponName);
		usedCoupon = true;
		output("The coupon saved on your codex is used and instantly changes the final price. ");
		pc.removeKeyItem("Coupon - TamaniCorp");
	}
	
	output("You purchase " + arg.description + " for " + num2Text(price) + " credits.");
	pc.credits -= price;
	
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
		else if(shopkeep is ChrysalisDrone) 
		{
			flags["PURCHASED_SERAS_GALO"] = 1;
			chars["CHRYSALISDRONE"].destroyItem(new GaloMax());
		}
	}
	// Siegwulfe Special
	if(arg is SiegwulfeItem)
	{
		purchasedItems = [];
		output("\n\nThe display model of the droid is much too big and lofty to carry around, especially unpowered. Instead, an order has been placed for a brand-new model and is currently being delivered straight to your ship. <b>Be sure to check your ship’s storage for it!</b>");
		chars["WULFE"].accessory = new SiegwulfeItem();
		shopkeep.destroyItem(new SiegwulfeItem());
		flags["WULFE_ON_SHIP"] = false;
		IncrementFlag("WULFE_PURCHASED");
	}
	output("\n\n");
	//Set everything to take us back to buyItem!
	itemScreen = buyItem;
	lootScreen = buyItem;
	useItemFunction = buyItem;
	if(purchasedItems.length > 0)
	{
		itemCollect(purchasedItems);
	}
	else
	{
		clearMenu();
		addButton(0, "Next", lootScreen);
	}
}

public function sellItem():void
{
	// Inturruptions
	if(shopkeep is Sera)
	{
		if(seraDebtCheck()) return;
	}
	
	clearOutput();
	output(shopkeep.keeperSell);
	var sellOptions:Boolean = kGAMECLASS.gameOptions.vendorToggle;
	var btnSlot:int = 0;
	clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++) {
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", shop, shopkeep);
			btnSlot++;
		}
		
		//If slot has something in it.
		if(pc.inventory[x].quantity > 0) {
			trace("PC inventory being checked for possible sale.");
			//Does the shopkeep buy this type?
			if(pc.inventory[x].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) {
				addDisabledButton(btnSlot, pc.inventory[x].shortName + " x" + pc.inventory[x].quantity, StringUtil.toDisplayCase(pc.inventory[x].longName), "This item is too important to sell.");
			}
			else if(shopkeep.buysType(pc.inventory[x].type)) {
				output("\n" + StringUtil.upperCase(pc.inventory[x].description, false) + " - " + getSellPrice(shopkeep,pc.inventory[x].basePrice) + " credits.");
				if(sellOptions)
				{
					addItemButton(btnSlot, pc.inventory[x], sellItemQuantity, pc.inventory[x], null, null, pc, shopkeep);
				}
				else
				{
					addItemButton(btnSlot, pc.inventory[x], sellItemGo, pc.inventory[x], null, null, pc, shopkeep);
				}
			}
			else {
				addDisabledButton(btnSlot, pc.inventory[x].shortName + " x" + pc.inventory[x].quantity, StringUtil.toDisplayCase(pc.inventory[x].longName), "The vendor is not interested in this item.");
			}
			btnSlot++;
		}
		
		if(pc.inventory.length > 14 && (x + 1) == pc.inventory.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", shop, shopkeep);
		}
	}
	addButton(14, "Back", shop, shopkeep);
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
	if (arg.quantity <= 0 && pc.inventory.indexOf(arg) != -1)
	{
		pc.inventory.splice(pc.inventory.indexOf(arg), 1);
	}
	clearMenu();
	addButton(0,"Next",sellItem);
}

// Special seller/item handling
public function sellItemBonus(arg:ItemSlotClass, price:Number = 0):void
{
	if((shopkeep is Sera) && seraInDebt())
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

public function dropItem():void {
	clearOutput();
	var dropOptions:Boolean = kGAMECLASS.gameOptions.vendorToggle;
	var btnSlot:int = 0;
	clearMenu();
	addButton(14, "Back", inventory);
	
	if(pc.inventory.length <= 0)
	{
		output("You do not have any items to drop.\n");
		return;
	}
	
	output("What item would you like to drop?");
	output("\n\n");
	output("<b><u>Inventory:</u></b>");
	for(var x:int = 0; x < pc.inventory.length; x++) {
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", inventory);
			btnSlot++;
		}
		
		if(pc.inventory[x].quantity > 0) {
			if(!pc.inventory[x].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) {
				output("\n");
				if(pc.inventory[x].stackSize > 1) output(pc.inventory[x].quantity + "x ");
				output(StringUtil.toDisplayCase(pc.inventory[x].longName) + " - " + pc.inventory[x].basePrice + " credits.");
				if(dropOptions)
				{
					addItemButton(btnSlot, pc.inventory[x], dropItemQuantity, pc.inventory[x], null, null, pc, null);
				}
				else
				{
					addItemButton(btnSlot, pc.inventory[x], dropItemGo, pc.inventory[x], null, null, pc, null);
				}
			}
			else {
				output("\n");
				if(pc.inventory[x].stackSize > 1) output(pc.inventory[x].quantity + "x ");
				output(StringUtil.toDisplayCase(pc.inventory[x].longName) + " - <i>Not droppable</i>.");
				addDisabledButton(btnSlot, pc.inventory[x].shortName + " x" + pc.inventory[x].quantity, StringUtil.toDisplayCase(pc.inventory[x].longName), "You cannot drop this item.");
			}
			btnSlot++;
		}
		
		if(pc.inventory.length > 14 && (x + 1) == pc.inventory.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", inventory);
		}
	}
	output("\n\n<i>Note that dropping the item will remove it from your inventory and cannot be reclaimed.</i>\n\n");
}

public function dropItemQuantity(arg:ItemSlotClass):void
{
	clearOutput();
	clearMenu();
	
	if(arg.quantity > 1)
	{
		output("How many of your " + arg.longName + " do you want to drop?");
		
		if(arg.quantity >= 1) addButton(0, "x1", dropItemMultiOK, [arg, 1]);
		if(arg.quantity >= 2) addButton(1, "x2", dropItemMultiOK, [arg, 2]);
		if(arg.quantity >= 3) addButton(2, "x3", dropItemMultiOK, [arg, 3]);
		if(arg.quantity >= 4) addButton(3, "x4", dropItemMultiOK, [arg, 4]);
		if(arg.quantity >= 5) addButton(4, "x5", dropItemMultiOK, [arg, 5]);
		
		if(arg.quantity >= 10) addButton(5, "x10", dropItemMultiOK, [arg, 10]);
		if(arg.quantity >= 20) addButton(6, "x20", dropItemMultiOK, [arg, 20]);
		if(arg.quantity >= 30) addButton(7, "x30", dropItemMultiOK, [arg, 30]);
		if(arg.quantity >= 40) addButton(8, "x40", dropItemMultiOK, [arg, 40]);
		if(arg.quantity >= 50) addButton(9, "x50", dropItemMultiOK, [arg, 50]);
		
		addButton(12, "Custom", dropItemMultiCustom, arg);
		addButton(13, "All (x" + arg.quantity + ")", dropItemMultiOK, [arg, arg.quantity]);
		addButton(14, "Cancel", dropItem);
	}
	else
	{
		output("Are you sure you want to drop " + arg.description + "?");
		output("\n\n<i>Note that dropping the item will remove it from your inventory and cannot be reclaimed.</i>\n\n");
		
		addButton(0, "Yes", dropItemGo, arg);
		addButton(1, "No", dropItem);
	}
}
public function dropItemMultiCustom(arg:ItemSlotClass):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	clearOutput();
	
	output("How many of your " + arg.longName + " do you want to drop? (x" + arg.quantity + " maximum.)");
	output("\n");
	displayInput();
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", dropItemMultiCustomOK, arg);
	addButton(14, "Back", dropItemMultiCustomNo, arg);
}
public function dropItemMultiCustomOK(arg:ItemSlotClass):void
{
	if(isNaN(Number(userInterface.textInput.text))) {
		dropItemMultiCustom(arg);
		output("Choose a quantity that is a positive integer, please.");
		return;
	}
	else if(Number(userInterface.textInput.text) < 1) {
		dropItemMultiCustom(arg);
		output("Choose a quantity that is 1 or more, please.");
		return;
	}
	else if(Number(userInterface.textInput.text) > arg.quantity) {
		dropItemMultiCustom(arg);
		output("Choose a quantity that is " + arg.quantity + " or below, please.");
		return;
	}
	var soldNumber:int = Math.floor(Number(userInterface.textInput.text));
	dropItemMultiCustomGo([arg, soldNumber]);
}
public function dropItemMultiCustomNo(arg:ItemSlotClass):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	dropItemQuantity(arg);
}
public function dropItemMultiCustomGo(arg:Array):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	dropItemMultiOK(arg);
}
public function dropItemMultiOK(arg:Array):void
{
	clearOutput();
	
	var dumpItem:ItemSlotClass = arg[0];
	var dumpNumber:int = arg[1];
	
	output("Are you sure you want to drop " + dumpItem.description + " (x" + dumpNumber + ")?");
	output("\n\n<i>Note that dropping the item will remove it from your inventory and cannot be reclaimed.</i>\n\n");
	
	clearMenu();
	addButton(0, "Yes", dropItemMulti, [dumpItem, dumpNumber]);
	addButton(1, "No", dropItemQuantity, dumpItem);
}
public function dropItemMulti(arg:Array):void
{
	clearOutput();
	
	var dumpItem:ItemSlotClass = arg[0];
	var dumpNumber:int = arg[1];
	
	output("You drop " + dumpItem.description + " (x" + dumpNumber + ").");
	
	dumpItem.quantity -= dumpNumber;
	if (dumpItem.quantity == 0) pc.inventory.splice(pc.inventory.indexOf(dumpItem), 1);
	
	clearMenu();
	addButton(0, "Next", dropItem);
}

public function dropItemGo(arg:ItemSlotClass):void {
	clearOutput();
	
	output("You drop " + arg.description + ".");
	arg.quantity--;
	if (arg.quantity <= 0 && pc.inventory.indexOf(arg) != -1)
	{
		pc.inventory.splice(pc.inventory.indexOf(arg), 1);
	}
	clearMenu();
	addButton(0, "Next", dropItem);
}

public function unequipMenu(inCombat:Boolean = false):void
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
		if(inCombat) addDisabledButton(0, "U.Top Off", StringUtil.toDisplayCase(pc.upperUndergarment.longName), "Cannot be unequipped in combat.");
		else addOverrideItemButton(0, pc.upperUndergarment, "U.Top Off", unequip, "bra");
	}
	else addDisabledButton(0, "Undertop", "Undertop", "You are not wearing anything in this slot.");

	if (pc.shield.shortName != "")
	{
		addOverrideItemButton(1, pc.shield, "Shield Off", unequip, "shield");
	}
	else addDisabledButton(1, "Shield", "Shield Generator", "You do not have a shield generator equipped.");
	
	if (pc.lowerUndergarment.shortName != "")
	{
		if(inCombat) addDisabledButton(5, "U.Wear Off", StringUtil.toDisplayCase(pc.lowerUndergarment.longName), "Cannot be unequipped in combat.");
		else addOverrideItemButton(5, pc.lowerUndergarment, "U.Wear Off", unequip, "underwear");
	}
	else addDisabledButton(5, "Underwear", "Underwear", "You are not wearing anything in this slot.");
	
	if (pc.meleeWeapon.shortName != "Rock")
	{
		addOverrideItemButton(2, pc.meleeWeapon, "Melee Off", unequip, "mWeapon");
	}
	else addDisabledButton(2, "Melee", "Melee Weapon", "You do not have a melee weapon equipped.");
	
	if (pc.armor.shortName != "")
	{
		if(inCombat) addDisabledButton(6, "Armor Off", StringUtil.toDisplayCase(pc.armor.longName), "Cannot be unequipped in combat.");
		else addOverrideItemButton(6, pc.armor, "Armor Off", unequip, "armor");
	}
	else addDisabledButton(6, "Armor", "Armor", "You are not wearing anything in this slot.");
	
	if (pc.rangedWeapon.shortName != "Rock")
	{
		addOverrideItemButton(7, pc.rangedWeapon, "Ranged Off", unequip, "rWeapon");
	}
	else addDisabledButton(7, "Ranged", "Ranged Weapon", "You do not have a ranged weapon equipped.");
	
	if (pc.accessory.shortName != "")
	{
		addOverrideItemButton(3, pc.accessory, "Acc. Off", unequip, "accessory");
	}
	else addDisabledButton(3, "Accessory", "Accessory", "You do not have an accessory equipped.");
	
	//Set user and target.
	itemUser = pc;
	addButton(14, "Back", inventory);
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
	showBust("");
	showName("\nINVENTORY");
	var x:int = 0;
	itemScreen = inventory;
	useItemFunction = inventory;
	
	output("What item would you like to use?");
	if(pc.inventory.length >= 11) output("\n(<b>Multiple pages of items are available. Please be aware of the page forward/back buttons in the lower right corner of the user interface when making your selections.</b>)");
	output("\n\n");
	inventoryDisplay();
	clearMenu();
	var btnSlot:int = 0;
	for (var i:int = 0; i < pc.inventory.length; i++)
	{
		//special slot 1
		if(btnSlot >= 10 && (btnSlot + 5) % 15 == 0)
		{
			addButton(btnSlot, "Drop", dropItem, undefined, "Drop Item", "Drop an item to make room in your inventory.");
			btnSlot++;
		}
		//interaction menu
		if(btnSlot >= 11 && (btnSlot + 4) % 15 == 0)
		{
			addButton(btnSlot, "Interact", itemInteractMenu, undefined, "Interact", "Interact with some of your items.");
			btnSlot++;
		}
		//key item menu
		if(btnSlot >= 12 && (btnSlot + 3) % 15 == 0)
		{
			addButton(btnSlot, "Key Item", keyItemDisplay, undefined, "Key Items", "View your list of key items.");
			btnSlot++;
		}
		//unequip menu
		if(btnSlot >= 13 && (btnSlot + 2) % 15 == 0)
		{
			addButton(btnSlot, "Unequip", unequipMenu, undefined, "Unequip", "Unequip an item.");
			btnSlot++;
		}
		//back
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", mainGameMenu);
			btnSlot++;
		}
		
		//normal inventory
		if (pc.inventory[i].quantity > 0)
		{
			addItemButton(btnSlot, pc.inventory[i], useItem, pc.inventory[i]);
		}
		btnSlot++;
		
		if(pc.inventory.length > 10 && (i + 1) == pc.inventory.length)
		{
			while((btnSlot + 5) % 15 != 0) { btnSlot++; }
			addButton(btnSlot + 0, "Drop", dropItem, undefined, "Drop Item", "Drop an item to make room in your inventory.");
			addButton(btnSlot + 1, "Interact", itemInteractMenu, undefined, "Interact", "Interact with some of your items.");
			addButton(btnSlot + 2, "Key Item", keyItemDisplay, undefined, "Key Items", "View your list of key items.");
			addButton(btnSlot + 3, "Unequip", unequipMenu, undefined, "Unequip", "Unequip an item.");
			addButton(btnSlot + 4, "Back", mainGameMenu);
		}
	}
	
	//Set user and target.
	itemUser = pc;
	addButton(10, "Drop", dropItem, undefined, "Drop Item", "Drop an item to make room in your inventory.");
	addButton(11, "Interact", itemInteractMenu, undefined, "Interact", "Interact with some of your items.");
	addButton(12, "Key Item", keyItemDisplay, undefined, "Key Items", "View your list of key items.");
	addButton(13, "Unequip", unequipMenu, undefined, "Unequip", "Unequip an item.");
	addButton(14, "Back", mainGameMenu);
}

public function itemInteractMenu(counter:Boolean = false):Number
{
	if(!counter) {
		clearOutput();
		clearMenu();
	}
	
	var itemMessages:String = "";
	var count:int = 0;
	
	// Goo Armor Customization!
	if (hasGooArmorOnSelf())
	{
		count++;
		if (!counter)
		{
			itemMessages += gooArmorOnSelfBonus((count - 1), false);
		}
	}
	// Siegwulfe stuff!
	if (hasSiegwulfeOnSelf())
	{
		count++;
		if (!counter)
		{
			itemMessages += siegwulfeOnShipBonus((count - 1), true);
		}
	}
	// Latex reconfigure
	if (pc.armor is Omnisuit && pc.hasStatusEffect("Rubber Wrapped"))
	{
		count++
		if (!counter)
		{
			itemMessages += omnisuitMenuBonus(count - 1);
		}
	}
	
	if(!counter) {
		clearBust();
		showName("\nINTERACT");
		if(count > 0) output("What do you wish to interact with?" + itemMessages);
		else output("You don’t have anything from your inventory to interact with!");
		addButton(14, "Back", inventory);
	}
	
	return count;
}

public function combatInventoryMenu():void
{
	clearOutput();
	showName("\nINVENTORY");
	clearMenu();
	itemScreen = inventory;
	useItemFunction = inventory;
	
	output("What item would you like to use?");
	output("\n\n");
	inventoryDisplay();
	equipmentDisplay();
	var btnSlot:int = 0;
	for (var i:int = 0; i < pc.inventory.length; i++)
	{
		if(btnSlot >= 10 && (btnSlot + 5) % 15 == 0)
		{
			btnSlot++;
		}
		if(btnSlot >= 11 && (btnSlot + 4) % 15 == 0)
		{
			btnSlot++;
		}
		if(btnSlot >= 12 && (btnSlot + 3) % 15 == 0)
		{
			btnSlot++;
		}
		if(btnSlot >= 13 && (btnSlot + 2) % 15 == 0)
		{
			addButton(btnSlot, "Unequip", unequipMenu, true, "Unequip", "Unequip an item.");
			btnSlot++;
		}
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", CombatManager.showCombatMenu);
			btnSlot++;
		}
		
		var tItem:ItemSlotClass = pc.inventory[i];
		if (tItem.type == GLOBAL.MELEE_WEAPON || tItem.type == GLOBAL.RANGED_WEAPON || tItem.combatUsable == true)
		{
			addItemButton(btnSlot, pc.inventory[i], combatUseItem, pc.inventory[i]);
		}
		else
		{
			addDisabledButton(btnSlot, pc.inventory[i].shortName + " x" + pc.inventory[i].quantity, StringUtil.toDisplayCase(pc.inventory[i].longName), "Cannot be used in combat.");
		}
		btnSlot++;
		
		if(pc.inventory.length > 10 && (i + 1) == pc.inventory.length)
		{
			while((btnSlot + 5) % 15 != 0) { btnSlot++; }
			//addButton(btnSlot + 0, "", null, undefined, "", "");
			//addButton(btnSlot + 1, "", null, undefined, "", "");
			//addButton(btnSlot + 2, "", null, undefined, "", "");
			addButton(btnSlot + 3, "Unequip", unequipMenu, true, "Unequip", "Unequip an item.");
			addButton(btnSlot + 4, "Back", CombatManager.showCombatMenu);
		}
	}
	
	//addButton(10, "", null, undefined, "", "");
	//addButton(11, "", null, undefined, "", "");
	//addButton(12, "", null, undefined, "", "");
	addButton(13, "Unequip", unequipMenu, true, "Unequip", "Unequip an item.");
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


public function itemDisabledMessage(slot:Number, clearScreen:Boolean = true):void 
{
	if(clearScreen) clearOutput();
	else output("\n\n");
	
	var msg:String = "";
	
	switch(slot)
	{
		case GLOBAL.CLOTHING:
		case GLOBAL.ARMOR:
			msg = pc.getStatusTooltip("Armor Slot Disabled");
			break;
		case GLOBAL.MELEE_WEAPON:
			msg = pc.getStatusTooltip("Melee Weapon Slot Disabled");
			break;
		case GLOBAL.RANGED_WEAPON:
			msg = pc.getStatusTooltip("Ranged Weapon Slot Disabled");
			break;
		case GLOBAL.SHIELD:
			msg = pc.getStatusTooltip("Shield Slot Disabled");
			break;
		case GLOBAL.ACCESSORY:
			msg = pc.getStatusTooltip("Accessory Slot Disabled");
			break;
		case GLOBAL.LOWER_UNDERGARMENT:
			msg = pc.getStatusTooltip("Lower Garment Slot Disabled");
			break;
		case GLOBAL.UPPER_UNDERGARMENT:
			msg = pc.getStatusTooltip("Upper Garment Slot Disabled");
			break;
	}
	
	if(msg == "") msg = "<b>The item slot for this item has been disabled!</b>";
	output(msg);
	
	if(clearScreen)
	{
		clearMenu();
		addButton(0, "Next", itemScreen);
	}
}
public function unequip(arg:String, next:Boolean = true):void 
{
	clearOutput();
	
	if(inCombat())
	{
		if(!InCollection(arg, ["mWeapon", "rWeapon"]))
		{
			output("You’re in combat--you can’t possibly unequip this item right now!");
			return;
		}
		else if(pc.inventory.length >= pc.inventorySlots())
		{
			output("You’re in combat and your inventory is too full to unequip an item now!");
			return;
		}
	}
	
	// Renamed from lootList so I can distinguish old vs new uses
	var unequippedItems:Array = new Array();
	
	if(arg == "bra") {
		if(!pc.itemSlotUnlocked(GLOBAL.UPPER_UNDERGARMENT))
		{
			itemDisabledMessage(GLOBAL.UPPER_UNDERGARMENT);
			return;
		}
		unequippedItems[unequippedItems.length] = pc.upperUndergarment;
		pc.upperUndergarment = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "underwear") {
		if(!pc.itemSlotUnlocked(GLOBAL.LOWER_UNDERGARMENT))
		{
			itemDisabledMessage(GLOBAL.LOWER_UNDERGARMENT);
			return;
		}
		unequippedItems[unequippedItems.length] = pc.lowerUndergarment;
		pc.lowerUndergarment = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "shield") {
		if(!pc.itemSlotUnlocked(GLOBAL.SHIELD))
		{
			itemDisabledMessage(GLOBAL.SHIELD);
			return;
		}
		unequippedItems[unequippedItems.length] = pc.shield;
		pc.shield = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "accessory") {
		if(!pc.itemSlotUnlocked(GLOBAL.ACCESSORY))
		{
			itemDisabledMessage(GLOBAL.ACCESSORY);
			return;
		}
		if(pc.accessory is SiegwulfeItem)
		{
			SiegwulfeUnequip();
		}
		unequippedItems[unequippedItems.length] = pc.accessory;
		pc.accessory = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "armor") {
		if(!pc.itemSlotUnlocked(GLOBAL.ARMOR))
		{
			itemDisabledMessage(GLOBAL.ARMOR);
			return;
		}
		if(pc.armor is Omnisuit) 
		{
			output("Touching a small stud on the collar, you command the Omnisuit to retract. It does so at once, making you shiver and shudder as it disengages from your [pc.skinFurScales]. The crawling latex tickles at first, but with each blob that flows up into the collar, the sensations deaden. Once you’re completely uncovered, the collar hisses and snaps open, falling into a numbed palm. Your sense of touch is vastly diminished without the suit, leading you to wonder if it wouldn’t be better to just put it back on.\n\n");
			unequippedItems[unequippedItems.length] = new OmnisuitCollar();
			pc.removeStatusEffect("Rubber Wrapped");
		}
		else unequippedItems[unequippedItems.length] = pc.armor;
		pc.armor = new classes.Items.Miscellaneous.EmptySlot();
	}
	else if(arg == "mWeapon") {
		if(!pc.itemSlotUnlocked(GLOBAL.MELEE_WEAPON))
		{
			itemDisabledMessage(GLOBAL.MELEE_WEAPON);
			return;
		}
		unequippedItems[unequippedItems.length] = pc.meleeWeapon;
		pc.meleeWeapon = new classes.Items.Melee.Rock();
	}
	else if(arg == "rWeapon") {
		if(!pc.itemSlotUnlocked(GLOBAL.RANGED_WEAPON))
		{
			itemDisabledMessage(GLOBAL.RANGED_WEAPON);
			return;
		}
		unequippedItems[unequippedItems.length] = pc.rangedWeapon;
		pc.rangedWeapon = new classes.Items.Melee.Rock();
	}
	
	unequippedItems[unequippedItems.length - 1].onRemove(pc);
	
	itemCollect(unequippedItems);
	if(inCombat()) backToCombatInventory(unequippedItems[unequippedItems.length - 1]);
}

// atm, no equippable items have a stacksize > 1, so there is never a possibility that we'd have to split an item stack to equip an item the player holds in their inventory.
public function equipItem(arg:ItemSlotClass):void {
	var targetItem:ItemSlotClass;
	var removedItem:ItemSlotClass;

	if (arg.stackSize > 1) throw new Error("Potential item stacking bug with " + arg.shortName + ". Item has a stacksize > 0 and the equip code cannot currently handle splitting an item stack!");
	
	clearOutput();
	
	if(arg is Omnisuit || arg is OmnisuitCollar || arg is StrangeCollar)
	{
		if(flags["OMNISUITED"] == undefined)
		{
			output("Putting strange objects around your neck probably isn’t the best idea you’ve had, but then again, neither is running around the most dangerous parts of the galaxy trying to claim a fortune. Pressing a button on the shining band, you pop it open and line it up around your neck. It’s a little tight, but it should fit without crushing your throat. Sucking in a nervous breath, you snap the ends together, feeling a hidden mechanism make a satisfying ‘click’. It warms against your [pc.skinFurScales], pulling tighter and tighter until you fear it might start to choke you. It never does. Just when you’re starting to panic, it stops shrinking.");
			output("\n\nProbing around the edge with a fingertip, you realize that it wasn’t just getting tighter - it was changing shape, molding itself to the exact shape of your neck. There isn’t a single gap where your flesh isn’t kissed by the warm, flexible metal. It hugs your [pc.skinFurScales] tightly, firm and constricting and yet forgiving enough not to pinch as you move around.");
			if(pc.isBro()) output(" You bet you look fuckin’ awesome - butch as hell.");
			else if(pc.isBimbo()) output(" You bet you look sexy as fuck. You wonder if there’s a ring to attach a leash to. The boys would love it.\n\n");
			if(eventQueue.indexOf(firstTimeOmniSuitOn) == -1) eventQueue.push(firstTimeOmniSuitOn);
			pc.lockItemSlot(GLOBAL.ARMOR, "You try to replace your new collar but it refuses to unlock. Something is preventing you from removing it...");
		}
		else
		{
			output("You close the Omnisuit’s collar around your neck once more, delighted to feel it molding itself to the shape of your body. After properly adjusting its shape, it hisses, and a wave of oily, latex-like material flows down your body, rapidly coating every inch of your form in clingy tightness. It feels wonderful, being wrapped up in ebony perfection once more, feeling it flowing back into position like the hands of a long lost lover.");
			output("\n\nBest of all, everywhere it goes, sensation is heightened");
			if(!pc.isNude()) output(", so much so that you feel compelled to remove your other garments. They chafe against your sleek new body, not to mention clashing with the flawless visual aesthetic you’ve acquired.");
			else output(", so much so that you can’t help but paw at yourself as you take on a sleek new aesthetic.");
			output(" It’s a shame that the Omnisuit only pleasantly stimulates you as it envelops your body this time. There’s no full-body teasing of every neuron, just the lovely feel of something rubbery and warm cupping and gripping every part of your form.");
			output("\n\n<i>“Thank you for using your Omnisuit! Remember, the Omnisuit is the only clothing that can pander to your every desire, on the streets or in the sheets!”</i> a perky female voice chirps from inside your collar as you inspect the finished product.\n\n");
			if(eventQueue.indexOf(omniSuitRepeatFinisher) == -1) eventQueue.push(omniSuitRepeatFinisher);
			pc.lockItemSlot(GLOBAL.ARMOR, "The Omnisuit collar has just been activated. Perhaps you should let it settle before removing it...");
		}
		arg = new Omnisuit();
	}
	else if(arg is SiegwulfeItem)
	{
		SiegwulfeEquip();
	}
	else
	{
		//No undies with Omnisuit!
		if(pc.armor is Omnisuit && (arg.type == GLOBAL.LOWER_UNDERGARMENT || arg.type == GLOBAL.UPPER_UNDERGARMENT))
		{
			//Attempt to put something else on
			output("The moment the " + arg.longName + " comes in contact with your suit-enclosed form, you realize that this will never work. The new garment grates distractingly on your sensitized nerves. It’s like trying to wear sandpaper after a decade of nothing but the finest silk. Shaking your head, you yank it off in a hurry. You’ll have to ditch the Omnisuit if you’re going to wear anything else with it. Strange that your backpack and other miscellaneous gear don’t generate the same reaction.\n\n");
			//Take the arg off! Ha ha!
			removedItem = arg;
		}
		else if((pc.accessory is SiegwulfeItem) && arg.type == GLOBAL.ACCESSORY)
		{
			SiegwulfeUnequip();
		}
		else
		{
			output("You");
			if(arg.type == GLOBAL.ARMOR) output(" don");
			else if(InCollection(arg.type, GLOBAL.CLOTHING, GLOBAL.UPPER_UNDERGARMENT, GLOBAL.LOWER_UNDERGARMENT)) output(" wear");
			else output(" equip");
			output(" your " + arg.longName + ".");
		}
	}
	
	//A quick check to skip equipping if we've bailed out
	if(removedItem == arg)
	{
		
	}
	else
	{
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
			output("<b> Your new ranged weapon doesn’t suffer from the effects of gunlock!</b>");
			pc.removeStatusEffect("Gunlock");
		}
		//Set the quantity to 1 for the equipping, then set it back to holding - 1 for inventory!
		if(arg.type == GLOBAL.ARMOR || arg.type == GLOBAL.CLOTHING) 
		{
			if(pc.armor is Omnisuit)
			{
				output("\n\nTouching a small stud on the collar, you command the Omnisuit to retract. It does so at once, making you shiver and shudder as it disengages from your [pc.skinFurScales]. The crawling latex tickles at first, but with each blob that flows up into the collar, the sensations deaden. Once you’re completely uncovered, the collar hisses and snaps open, falling into a numbed palm. Your sense of touch is vastly diminished without the suit, leading you to wonder if it wouldn’t be better to just put it back on.\n\n");
				pc.removeStatusEffect("Rubber Wrapped");
			}
			removedItem = pc.armor;
			if(removedItem is Omnisuit) removedItem = new OmnisuitCollar();
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
	}
	
	//If item to loot after!
	if(removedItem.shortName != "Rock" && removedItem.shortName != "" && removedItem.quantity > 0) 
	{
		output(" ");
		// Renamed from lootList so I can distinguish old vs new uses
		var unequippedItems:Array = new Array();
		unequippedItems[unequippedItems.length] = removedItem;
		
		itemCollect(unequippedItems);
		if(inCombat()) backToCombatInventory(arg);
	}
	else 
	{
		clearMenu();
		if(inCombat()) backToCombatInventory(arg);
		else addButton(0, "Next", itemScreen);
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
		clearMenu();
		addButton(0,"Replace", replaceItemPicker, newLootList); // ReplaceItem is a actionscript keyword. Let's not override it, mmkay?
		addButton(1,"Discard", discardItem, newLootList);
		//Hacky fix. If you hit useLoot with stuff that has its own submenus, it'll overwrite the submenu with the loot info for the next item. For instance, if you loot a hand cannon and a spear, then equip the hand cannon, your old ZK rifle will vanish into the ether while the game jumps over it to the spear.
		if ((newLootList.length >= 2)) addDisabledButton(2,"Use","Use","You cannot use an item while there are more items in the loot queue.");
		else if ((newLootList[0] as ItemSlotClass).hasFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT)) addDisabledButton(2,"Use","Use","You cannot use this item with a full inventory.");
		else if ((newLootList[0] as ItemSlotClass).isUsable != true) addDisabledButton(2,"Use","Use","This item is not usable.");
		else addButton(2,"Use", useLoot, newLootList);
	}
	else
	{			
		output(". The new acquisition");
		if(newLootList[0].quantity > 1) output("s stow");
		else output(" stows");
		output(" away quite easily.");
		//Clear the item off the newLootList.
		newLootList.splice(0,1);
		clearMenu();
		if(newLootList.length > 0)
		{
			output("\n");
			addButton(0,"Next",itemCollect,newLootList);
		}
		else addButton(0,"Next",lootScreen);
	}
}

public function discardItem(lootList:Array):void {
	clearOutput();
	output("You discard " + lootList[0].description + " (x" + lootList[0].quantity + ").\n\n");
	lootList.splice(0,1);
	clearMenu();
	if(lootList.length > 0) addButton(0,"Next",itemCollect, lootList);
	else addButton(0,"Next",lootScreen);
}

public function replaceItemPicker(lootList:Array):void {
	clearOutput();
	output("You have " + lootList[0].description + " (x" + lootList[0].quantity + ") but there is no room left in your inventory.\n\n");
	output("What will you replace?");
	clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++) {
		if(pc.inventory[x].shortName != "" && pc.inventory[x].quantity > 0) 
		{
			var butDesc:String = pc.inventory[x].shortName + " x" + pc.inventory[x].quantity
			addButton(x,butDesc,replaceItemGo,[x, lootList]); // HAAACK. We can only pass one arg, so shove the two args into an array
		}
	}
	
	addButton(14, "Back",
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
	clearMenu();
	addButton(0,"Next",lootScreen);
}

public function replaceItemGo(args:Array):void 
{
	var indice:int = args[0];
	var lootList:Array = args[1];
	clearOutput();
	output("You toss out " + pc.inventory[indice].description + " (x" + pc.inventory[indice].quantity + ") to make room for " + lootList[0].description + " (x" + lootList[0].quantity + ").");
	pc.inventory[indice] = lootList[0];
	lootList.splice(0,1);
	clearMenu();
	if(lootList.length > 0) 
	{
		output("\n\n");
		addButton(0,"Next",itemCollect, lootList);
	}
	else 
		addButton(0,"Next",lootScreen);
}

public function quickLoot(... args):void
{
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	
	itemCollect(args);
}

public function hasShipStorage():Boolean
{
	if (flags["SHIP_STORAGE_WARDROBE"] == undefined) flags["SHIP_STORAGE_WARDROBE"] = 10;
	if (flags["SHIP_STORAGE_EQUIPMENT"] == undefined) flags["SHIP_STORAGE_EQUIPMENT"] = 10;
	if (flags["SHIP_STORAGE_CONSUMABLES"] == undefined) flags["SHIP_STORAGE_CONSUMABLES"] = 10;
	if (flags["SHIP_STORAGE_VALUABLES"] == undefined) flags["SHIP_STORAGE_VALUABLES"] = 10;
	if (flags["SHIP_STORAGE_TOYS"] == undefined) flags["SHIP_STORAGE_TOYS"] = 10;
	
	return true;
}

public function shipStorageMenuRoot():void
{
	// Special Events
	if(seranigansTrigger("storage")) return;
	if(flags["WULFE_ON_SHIP"] == false)
	{
		activateSiegwulfe();
		return;
	}
	
	clearOutput();
	output("You turn to your ship’s storage.");
	
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
	
	if (flags["SHIP_STORAGE_TOYS"] != undefined)
	{
		output(" Against one wall, an inconspicuous box with a slide-out compartment is used for storing any lewd toys you may have.");
		addButton(4, "Toys", shipStorageMenuType, "TOYS");
	}
	else addDisabledButton(4, "Toys");
	
	var btnSlot:int = 5;
	
	if (kGAMECLASS.flags["DONG_DESIGNER_INSTALLED"] == 1)
	{
		output("\n\nNearby, the TamaniCorp Dong Designer hums with life.");
		addButton(btnSlot,"D.Designer",useInstalledDickBox,undefined,"Dong Designer","Use the TamaniCorp Hora Series Dong Designer you found on Tarkus.");
		btnSlot++;
	}
	if(kGAMECLASS.flags["EGG_TRAINER_INSTALLED"] == 1) 
	{
		output("\n\nYour bright pink Egg Trainer is sitting in the corner, rumbling slightly as the heating and cleaning processes inside it percolate.");
		//if PC has a belly full of eggs:
		if(pc.hasPregnancyOfType("EggTrainerCarryTraining")) output(" You run a hand across your swollen belly, vaguely wishing you could squat the current load out... only to get another mind-melting orgasm from the next batch going in!");
		//if PC has a faux-preg egg: 
		else if(pc.hasPregnancyOfType("EggTrainerFauxPreg")) output(" You run a hand across your [pc.belly]. You could get your Faux Preg Egg out at any time with the device, if you wanted to.");
		addButton(btnSlot,"EggTrainer",repeatEggTrainerApproach,undefined,"Egg Trainer","Put your Egg Trainer to use.");
		btnSlot++;
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
				if (InCollection(item.type, GLOBAL.GEM, GLOBAL.QUEST_ITEM))
				{
					items.push(item);
				}
				break;
				
			case "TOYS":
				if (InCollection(item.type, GLOBAL.SEXTOY))
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
		output("There isn’t enough room to store your item.");
		
		clearMenu();
		addButton(0, "Switch", replaceInStorage, [item, type], "Switch Items", "Switch an item in your ships storage with one in your inventory.");
		addButton(14, "Back", shipStorageMenuType, type);
		return;
	}
	
	shipStorageMenuType(type);
	
	// Special Events
	if(item is GooArmor) output("\n\n" + gooArmorInStorageBlurb());
	
	return;
}

public function replaceInStorage(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var type:String = args[1];
	
	var items:Array = getListOfType(pc.ShipStorageInventory, type);
	
	clearOutput();
	if(items.length <= 0) output("You do not have another item of the same type to switch with.");
	else output("What would you like to switch the item with?");
	
	clearMenu();
	
	var btnSlot:int = 0;
	
	for (var i:int = 0; i < items.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", storeItem, args);
			btnSlot++;
		}
		
		addItemButton(btnSlot, items[i], doStorageReplace, [invItem, items[i], type]);
		btnSlot++;
		
		if(items.length > 14 && (i + 1) == items.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", storeItem, args);
		}
	}
	addButton(14, "Back", storeItem, args);
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
	
	// Special Events
	if(invItem is GooArmor) output("\n\n" + gooArmorInStorageBlurb());
	if(tarItem is GooArmor) output("\n\n" + gooArmorInStorageBlurb(false));
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
			if (isSameItem(sItem, item) && sItem.quantity < sItem.stackSize)
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
		output("There isn’t enough room to take your item.");
		
		clearMenu();
		addButton(0, "Switch", replaceInInventory, [item, type], "Switch Items", "Switch an item in your inventory with one in your ships storage.");
		addButton(14, "Back", shipStorageMenuType, type);
		return;
	}
	
	shipStorageMenuType(type);
	
	// Special Events
	if(item is GooArmor) output("\n\n" + gooArmorInStorageBlurb(false));
}

public function replaceInInventory(args:Array):void
{
	var invItem:ItemSlotClass = args[0];
	var type:String = args[1];
	
	var items:Array = getListOfType(pc.inventory, type);
	
	clearOutput();
	if(items.length <= 0) output("You do not have another item of the same type to switch with.");
	else output("What would you like to switch the item with?");
	
	clearMenu();
	
	var btnSlot:int = 0;
	
	for (var i:int = 0; i < items.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", takeItem, args);
			btnSlot++;
		}
		
		addItemButton(btnSlot, items[i], doInventoryReplace, [invItem, items[i], type]);
		btnSlot++;
		
		if(items.length > 14 && (i + 1) == items.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", takeItem, args);
		}
	}
	addButton(14, "Back", takeItem, args);
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
