import classes.Characters.Kiona;
import classes.Characters.Lerris;
import classes.Characters.PlayerCharacter;
import classes.Characters.Vahn;
import classes.Creature;
import classes.Items.Transformatives.GaloMax;
import classes.Items.Transformatives.SumaCreamBlack;
import classes.Items.Transformatives.SumaCreamWhite;
import classes.ShittyShip;
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
import classes.Items.Melee.Rock;
import classes.Items.Miscellaneous.EmptySlot;

// Multi page notice.
public function multiButtonPageNote():String
{
	return "(<b>Multiple pages of items are available. Please be aware of the page forward/back buttons in the lower right corner of the user interface when making your selections.</b>)";
}
public function isEquippableItem(item:ItemSlotClass):Boolean
{
	if(item.hasFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT)) return false;
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
	
	if (item.quantity <= 0) 
	{
		clearOutput();
		output("Attempted to use " + item.description + " which had zero quantity.");
		clearMenu();
		if(item.type != GLOBAL.QUEST_ITEM)
		{
			addButton(0, "Remove", deleteItemPrompt, item);
			addButton(14, "Back", useItemFunction);
		}
		else
		{
			item.quantity = 1;
			addButton(0, "Next", useItemFunction);
		}
		return false;
	}
	if (item.isUsable == false)
	{
		//trace("Need to find where the use button for this item was generated and disable it with isUsable == false checks.");
		clearOutput();
		output("Unable to use " + item.description + " at present.");
		return false;
	}
	if (item.hasFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT))
	{
		clearOutput();
		output("Unable to use " + item.description + " because it is categorized as ship equipment.");
		return false;
	}
	if (item.type == GLOBAL.PIERCING)
	{
		useAPiercing(item);	
		return false;
	}
	if (item.type == GLOBAL.COCKWEAR)
	{
		useACocksock(item);
		return false;
	}
	//Equippable items are equipped!
	if (isEquippableItem(item))
	{
		// Preventive measures
		if(!pc.itemSlotUnlocked(item.type))
		{
			itemDisabledMessage(item.type);
			return false;
		}
		if(pc.hasStatusEffect("Disarmed") && !pc.hasCombatStatusEffect("Disarmed") && InCollection(item.type, [GLOBAL.MELEE_WEAPON, GLOBAL.RANGED_WEAPON]))
		{
			clearOutput();
			output("<b>You are unable to equip " + item.description + " due to being disarmed.</b>");
			return false;
		}
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
			// mirrin preg likes food
			if (pc.statusEffectv1("MirrinPregStage") > 1 && item.type == GLOBAL.FOOD) pc.lust(5);
			//if item use returns false, set up a menu.
			if (!item.useFunction(chars["PC"])) 
			{
				clearMenu();
				addButton(0, "Next", useItemFunction);
			}
			if (item.combatUsable == false) output("\n\n");
		}
		//else: Error checking
		else 
		{
			clearOutput();
			output("Error: Attempted to use item but item had no associated function. Tell Fenoxo he is a dirty hobo.");
			clearMenu();
			addButton(0, "Next", useItemFunction);
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
	}
	return true;
}

public function useAPiercing(item:ItemSlotClass):Boolean
{
	clearOutput();
	output("Where would you like to apply the piercing?\n\n<b><u>Potential Locales:</u></b>");
	clearMenu();
	var button:Number = 0;
	var btnName:String = "";
	var btnTitle:String = "";
	var x:int = 0;

	//Ears!
	output("\n\t*(" + (button+1) + ") Ear");
	if(!(pc.earPiercing is EmptySlot)) 
	{
		output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.earPiercing.longName));
	}
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.earPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Ears",(button) + ": Ears","You cannot remove that piercing without outside assistance.");
	else addButton(button++,(button) + ": Ears",actuallyPierceYourself,[item,"ears"]);

	//Eyebrows
	output("\n\t*(" + (button+1) + ") Eyebrows");
	if(!(pc.eyebrowPiercing is EmptySlot)) 
	{
		output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.eyebrowPiercing.longName));
	}
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.eyebrowPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Brows",(button) + ": Eyebrows","You cannot remove that piercing without outside assistance.");
	else addButton(button++,(button) + ": Brows",actuallyPierceYourself,[item,"brows"]);

	//Nose
	output("\n\t*(" + (button+1) + ") Nose");
	if(!(pc.nosePiercing is EmptySlot)) 
	{
		output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.nosePiercing.longName));
	}
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.nosePiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Nose",(button) + ": Nose","You cannot remove that piercing without outside assistance.");
	else addButton(button++,(button) + ": Nose",actuallyPierceYourself,[item,"nose"]);

	//Lip
	output("\n\t*(" + (button+1) + ") Lip");
	if(!(pc.lipPiercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.lipPiercing.longName));
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.lipPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Lip",(button) + ": Lip","You cannot remove that piercing without outside assistance.");
	else addButton(button++,(button) + ": Lip",actuallyPierceYourself,[item,"lip"]);

	//Tongue
	output("\n\t*(" + (button+1) + ") Tongue");
	if(!(pc.tonguePiercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.tonguePiercing.longName));
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.tonguePiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Tongue",(button) + ": Tongue","You cannot remove that piercing without outside assistance.");
	else addButton(button++,(button) + ": Tongue",actuallyPierceYourself,[item,"tongue"]);

	//Bewbs
	for(x = 0; x < pc.bRows(); x++)
	{
		if(pc.bRows() > 1)
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " " + StringUtil.toDisplayCase(pc.nippleNoun(x, true)) + " Row");
			btnName = "NipRow " + (x+1);
			btnTitle = StringUtil.upperCase(num2Ordinal(x+1)) + " " + StringUtil.toDisplayCase(pc.nippleNoun(x, true)) + " Row";
		}
		else
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.toDisplayCase(pc.nipplesNoun(x, true)));
			btnName = "Nipples";
			btnTitle = StringUtil.toDisplayCase(pc.nipplesNoun(x, true));
		}
		if(!(pc.breastRows[x].piercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.breastRows[x].piercing.longName));
		else
		{
			output(" - <b>(EMPTY)</b>");
		}
		if(pc.breastRows[x].piercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You cannot remove that piercing without outside assistance.");
		else addButton(button++,(button) + ": " + btnName,actuallyPierceYourself,[item,"nipples",x]);
	}

	//Belly Buttan
	output("\n\t*(" + (button+1) + ") Belly Button");
	if(!(pc.bellyPiercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.bellyPiercing.longName));
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.bellyPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Belly",(button) + ": Belly","You cannot remove that piercing without outside assistance.");
	else addButton(button++,(button) + ": Belly",actuallyPierceYourself,[item,"belly"]);
	//Dix
	for(x = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cockTotal() > 1)
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " Penis (" + Math.floor(pc.cocks[x].cLength()) + "\", " + StringUtil.toDisplayCase(pc.cocks[x].cockColor) + ", " + GLOBAL.TYPE_NAMES[pc.cocks[x].cType] + ")");
			btnName = "Penis #" + (x+1);
			btnTitle = StringUtil.upperCase(num2Ordinal(x+1)) + " Penis";
		}
		else
		{
			output("\n\t*(" + (button+1) + ") Penis (" + Math.floor(pc.cocks[x].cLength()) + "\", " + StringUtil.toDisplayCase(pc.cocks[x].cockColor) + ", " + GLOBAL.TYPE_NAMES[pc.cocks[x].cType] + ")");
			btnName = "Penis";
			btnTitle = "Penis";
		}
		if(!(pc.cocks[x].piercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.cocks[x].piercing.longName));
		else
		{
			output(" - <b>(EMPTY)</b>");
		}
		if(pc.cocks[x].piercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You cannot remove that piercing without outside assistance.");
		else addButton(button++,(button) + ": " + btnName,actuallyPierceYourself,[item,"cock",x]);
	}
	//Vaginas/Clits
	for(x = 0; x < pc.totalVaginas(); x++)
	{
		//Labia!
		if(pc.totalVaginas() > 1)
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " Vagina (" + StringUtil.toDisplayCase(pc.vaginas[x].vaginaColor) + ", " + GLOBAL.TYPE_NAMES[pc.vaginas[x].type] + ")");
			btnName = "Vagina #" + (x+1);
			btnTitle = StringUtil.upperCase(num2Ordinal(x+1)) + " Vagina";
		}
		else
		{
			output("\n\t*(" + (button+1) + ") Vagina (" + StringUtil.toDisplayCase(pc.vaginas[x].vaginaColor) + ", " + GLOBAL.TYPE_NAMES[pc.vaginas[x].type] + ")");
			btnName = "Vagina";
			btnTitle = "Vagina";
		}
		if(!(pc.vaginas[x].piercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.vaginas[x].piercing.longName));
		else
		{
			output(" - <b>(EMPTY)</b>");
		}
		if(pc.vaginas[x].piercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You cannot remove that piercing without outside assistance.");
		else addButton(button++,(button) + ": " + btnName,actuallyPierceYourself,[item,"vagina",x]);
		//Clits
		if(pc.totalVaginas() > 1)
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " Vagina’s Clit" + (pc.vaginas[x].clits == 1 ? "" : "s"));
			btnName = "Clit" + (pc.vaginas[x].clits == 1 ? "" : "s") + " #" + (x+1);
			btnTitle = StringUtil.upperCase(num2Ordinal(x+1)) + " Vagina’s Clit" + (pc.vaginas[x].clits == 1 ? "" : "s");
		}
		else
		{
			output("\n\t*(" + (button+1) + ") Clit" + (pc.vaginas[x].clits == 1 ? "" : "s"));
			btnName = "Clit" + (pc.vaginas[x].clits == 1 ? "" : "s");
			btnTitle = "Clit" + (pc.vaginas[x].clits == 1 ? "" : "s");
		}
		if(pc.vaginas[x].clits > 1 && !item.hasFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE)) output(" (Max 1x/Vagina)");
		if(!(pc.vaginas[x].clitPiercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.vaginas[x].clitPiercing.longName));
		else
		{
			output(" - <b>(EMPTY)</b>");
		}
		if(pc.vaginas[x].clitPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You cannot remove that piercing without outside assistance.");
		else addButton(button++,(button) + ": " + btnName,actuallyPierceYourself,[item,(pc.vaginas[x].clits == 1 ? "clit" : "clits"),x]);
	}
	
	while((button < 60) && ((button + 1) % 15 != 0)) { button++; }
	
	if(inCombat()) addButton(button++,"Cancel",backToCombatInventory);
	else addButton(button++,"Cancel",itemScreen);
	return false;
}

public function actuallyPierceYourself(args:Array):void
{
	var oldItem:ItemSlotClass = new EmptySlot();
	var item:ItemSlotClass = args[0];
	var slot:String = args[1];
	var x:int = (args.length > 2 ? args[2] : 0);
	
	clearOutput();
	showName("\nPIERCING!");

	//Bank old items then
	switch(slot)
	{
		case "lip":
			oldItem = pc.lipPiercing.makeCopy();
			pc.lipPiercing = item.makeCopy();
			pc.lipPiercing.onEquip(pc, true);
			break;
		case "ears":
			oldItem = pc.earPiercing.makeCopy();
			pc.earPiercing = item.makeCopy();
			pc.earPiercing.onEquip(pc, true);
			break;
		case "brows":
			oldItem = pc.eyebrowPiercing.makeCopy();
			pc.eyebrowPiercing = item.makeCopy();
			pc.eyebrowPiercing.onEquip(pc, true);
			break;
		case "nose":
			oldItem = pc.nosePiercing.makeCopy();
			pc.nosePiercing = item.makeCopy();
			pc.nosePiercing.onEquip(pc, true);
			break;
		case "tongue":
			oldItem = pc.tonguePiercing.makeCopy();
			pc.tonguePiercing = item.makeCopy();
			pc.tonguePiercing.onEquip(pc, true);
			break;
		case "nipples":
			oldItem = pc.breastRows[x].piercing.makeCopy();
			pc.breastRows[x].piercing = item.makeCopy();
			pc.breastRows[x].piercing.onEquip(pc, true);
			break;
		case "belly":
			oldItem = pc.bellyPiercing.makeCopy();
			pc.bellyPiercing = item.makeCopy();
			pc.bellyPiercing.onEquip(pc, true);
			break;
		case "cock":
			oldItem = pc.cocks[x].piercing.makeCopy();
			pc.cocks[x].piercing = item.makeCopy();
			pc.cocks[x].piercing.onEquip(pc, true);
			break;
		case "vagina":
			oldItem = pc.vaginas[x].piercing.makeCopy();
			pc.vaginas[x].piercing = item.makeCopy();
			pc.vaginas[x].piercing.onEquip(pc, true);
			break;
		case "clit":
		case "clits":
			oldItem = pc.vaginas[x].clitPiercing.makeCopy();
			pc.vaginas[x].clitPiercing = item.makeCopy();
			pc.vaginas[x].clitPiercing.onEquip(pc, true);
			break;
		default:
			oldItem = pc.lipPiercing.makeCopy();
			pc.lipPiercing = item.makeCopy();
			pc.lipPiercing.onEquip(pc, true);
			break;
	}
	//Remove the old item and store for looting!
	if(!(oldItem is EmptySlot)) output("You remove " + oldItem.description + " to make room for the new piercing. ");
	//Remove used piercing from inventory
	if (pc.inventory.indexOf(item) != -1) 
	{
		if(!infiniteItems()) pc.inventory.splice(pc.inventory.indexOf(item), 1);
	}
	//Text for it!
	output("A quick pinch is all it takes to pierce yourself. Your upgraded immune system assists your body in sealing the wound and preventing infection. All finished, you can admire the placement of " + item.longName + " on your ");
	if(InCollection(slot, ["nipples", "ears", "brows", "clits"]) && !item.hasFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE))
	{
		if(slot == "nipples") output("nipple");
		else if(slot == "brows") output("eyebrow");
		else if(slot == "clits") output("clit");
		else output("ear");
	}
	else output(slot);
	output(".");

	//If item to loot after!
	if(!(oldItem is EmptySlot)) 
	{
		output("\n\n");
		// Renamed from lootList so I can distinguish old vs new uses
		var unequippedItems:Array = new Array();
		unequippedItems[unequippedItems.length] = oldItem;
		
		itemCollect(unequippedItems);
		if(inCombat()) backToCombatInventory(oldItem);
	}
	else 
	{
		clearMenu();
		if(inCombat()) backToCombatInventory(oldItem);
		else addButton(0, "Next", itemScreen);
	}
}

public function useACocksock(item:ItemSlotClass):Boolean
{
	clearOutput();
	clearMenu();
	
	if(!pc.hasCock())
	{
		output("You do not have a penis to use this item on!");
		if(inCombat()) addButton(0,"Next",backToCombatInventory);
		else addButton(0,"Next",itemScreen);
		return false;
	}
	
	if(pc.cockTotal() == 1)
	{
		if(pc.cocks[0].cocksock.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE))
			output("You cannot remove the current cockwear without outside assistance.");
		else if (item.hasFlag(GLOBAL.ITEM_FLAG_SMALL_DICK_ONLY) && !pc.cocks[0].fitsSmallCocksock())
			output("You cannot fit the current cockwear.");
		else 
		{
			actuallyWearCocksock([item,0]);
			return false;
		}
			
		if(inCombat()) addButton(0,"Next",backToCombatInventory);
		else addButton(0,"Next",itemScreen);
		return false;
	}
	
	output("Which cock would you like to wear " + item.description + " on?");
	
	var button:Number = 0;
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " Penis (" + Math.floor(pc.cocks[x].cLength()) + "\", " + StringUtil.toDisplayCase(pc.cocks[x].cockColor) + ", " + GLOBAL.TYPE_NAMES[pc.cocks[x].cType] + ")");
		if(!(pc.cocks[x].cocksock is EmptySlot)) output(" - <b>Wearing:</b> " + StringUtil.toDisplayCase(pc.cocks[x].cocksock.longName));
		else output(" - <b>(EMPTY)</b>");
		
		if(pc.cocks[x].cocksock.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Penis #" + (x+1),StringUtil.upperCase(num2Ordinal(x+1)) + " Penis","You cannot remove that cockwear without outside assistance.");
		else if(item.hasFlag(GLOBAL.ITEM_FLAG_SMALL_DICK_ONLY) && !pc.cocks[x].fitsSmallCocksock()) addDisabledButton(button++,(button) + ": Penis #" + (x+1),StringUtil.upperCase(num2Ordinal(x+1)) + " Penis","You cannot fit that cockwear.");
		else addButton(button++,(button) + ": Penis #" + (x+1),actuallyWearCocksock,[item,x]);
	}
	while((button < 60) && ((button + 1) % 15 != 0)) { button++; }
	
	if(inCombat()) addButton(button++,"Cancel",backToCombatInventory);
	else addButton(button++,"Cancel",itemScreen);
	return false;
}
public function actuallyWearCocksock(args:Array):void
{
	var item:ItemSlotClass = args[0];
	var cIdx:int = args[1];
	var oldItem:ItemSlotClass = new EmptySlot();
	clearOutput();
	showName("\nCOCKWEAR!");
	
	if (pc.inventory.indexOf(item) < 0)
	{
		output("This item must be equipped from the inventory.");
	}
	else
	{
		oldItem = pc.cocks[cIdx].cocksock.makeCopy();
		
		if(!(oldItem is EmptySlot)) output("You remove " + oldItem.description + " to make room for the new cock-wear.");
		if (item is SilkyCockBell) output("You clip the collar of silk around your [pc.cock " + cIdx + "]. It could’ve been made for your prick, and the bell swings beneath it freely. Jingle! Just wearing the thing makes you fill with submissive heat, swelling up beneath the smooth material, and you find that you are constantly sporting a tiny, chubby semi-erection whilst wearing it.");
		else output("You give your [pc.cock " + cIdx + "] a few strokes to get it ready, then dress it. Your [pc.cockNoun " + cIdx + "] is now wearing " + item.description + "!");
		
		pc.cocks[cIdx].cocksock = item.makeCopy();
		pc.cocks[cIdx].cocksock.onEquip(pc, true);

		pc.inventory.splice(pc.inventory.indexOf(item), 1);
	}
	
	if(!(oldItem is EmptySlot))
	{
		output("\n\n");
		var unequippedItems:Array = new Array();
		unequippedItems[unequippedItems.length] = oldItem;
		
		itemCollect(unequippedItems);
		if(inCombat()) backToCombatInventory(oldItem);
	}
	else 
	{
		clearMenu();
		if(inCombat()) backToCombatInventory(oldItem);
		else addButton(0, "Next", itemScreen);
	}
}

public function invalidCocksocksWorn(fix:Boolean = false):Boolean
{
	for (var cIdx:int = 0; cIdx < pc.cocks.length; ++cIdx)
	{
		if (!pc.cocks[cIdx].isCocksockValid())
		{
			if (fix) fixCocksock(cIdx);
			return true;
		}
	}
	return false;
}

//Take it off, bby
public function fixCocksock(cIdx:int):void
{
	clearOutput();
	
	var sock:ItemSlotClass = pc.cocks[cIdx].cocksock;
	pc.cocks[cIdx].cocksock = new EmptySlot();

	if (sock is SilkyCockBell) output("You huff in discomfort. Your recent experiments in dick-morphology have made you too big for the cock bell you’re wearing, the silken loop digging into your flesh. You unclip it and put it with the rest of your gear. You feel an uncertain mixture of pride and malaise at losing this badge of how much of a subby, small-dicked sissy you once were.\n\n");
	else output("The cocksock you used to wear on your [pc.cockNoun " + cIdx + "] no longer fits around it.\n\n");

	sock.onRemove(pc);
	
	quickLoot(sock);
}
    
    
// A call with just an item will 
public function combatUseItem(item:ItemSlotClass, targetCreature:Creature = null, usingCreature:Creature = null):void
{
	//showName("");
	
	// If we're looking at an equippable item, equip it
	if (isEquippableItem(item))
	{
		// Preventive measures
		if(!pc.itemSlotUnlocked(item.type))
		{
			itemDisabledMessage(item.type);
			return;
		}
		if(pc.hasStatusEffect("Disarmed") && !pc.hasCombatStatusEffect("Disarmed") && InCollection(item.type, [GLOBAL.MELEE_WEAPON, GLOBAL.RANGED_WEAPON]))
		{
			clearOutput();
			output("<b>You are unable to equip " + item.description + " due to being disarmed.</b>");
			return;
		}
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
				if(usingCreature.hasPerk("PCs")) targetCreature = usingCreature;
				else targetCreature = pc;
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
							}(item, targets[i], usingCreature));
						}
					}
					
					// Alt character rerouting
					if(usingCreature.hasPerk("PCs")) addButton(14, "Back", CombatManager.showCombatMenu);
					// Normal player character
					else addButton(14, "Back", combatInventoryMenu);
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
	
	if (usingCreature != null && (usingCreature is PlayerCharacter || usingCreature.hasPerk("PCs"))) backToCombatInventory(item);
}

public function backToCombatInventory(item:ItemSlotClass):void
{
	// Ship gadget rerouting
	if(item.hasFlag(GLOBAL.ITEM_FLAG_SHIP_EQUIPMENT))
	{
		CombatManager.processCombat();
	}
	// Quick draw never loses a turn for weapon items
	else if(pc.hasPerk("Quickdraw") && InCollection(item.type, [GLOBAL.RANGED_WEAPON, GLOBAL.MELEE_WEAPON]))
	{
		clearMenu();
		addButton(0, "Next", combatInventoryMenu);
	}
	// Normal return
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

public function buyShipFitItem(newScreen:Boolean = false):void
{
	if(newScreen)
	{
		clearOutput();
		showBust(shopkeep.bustDisplay);
		showName("\n"+shopkeep.short.toUpperCase());
	}
	var ship:ShittyShip = shits["SHIP"];
	output("Buying a module will result in it being immediately installed on your ship. They’re too large to carry or transport in any other way. The cost of installation is included in the price.\n\n");
	output("<b>Unused Upgrade Slots:</b> " + (ship.shipCapacity()-ship.inventory.length));
	output("\n<b>Unused Weapon Hardpoints:</b> " + (ship.shipGunCapacity() - ship.listShipWeapons().length));
	output("\n<b>Current Crew Capacity:</b> " + ship.shipCrewCapacity());
	var temp:Number = 0;
	var canBuy:Boolean = (ship.shipCapacity() > ship.inventory.length);
	var hasGunRoom:Boolean = (ship.shipWeaponCapacity() > ship.listShipWeapons().length);
	if(!hasGunRoom) output("\n\n<b>Warning:</b> Your ship has no more hardpoints to equip weapons to.");
	output("\n\n<b><u>Modules For Sale & Fit:</u></b>");
	clearMenu();
	for(var i:int = 0; i < shopkeep.inventory.length; i++)
	{
		temp = getBuyPrice(shopkeep,shopkeep.inventory[i].basePrice);
		if(temp > pc.credits) output("\n<b>(Too Expensive)</b> ");
		else if(!canBuy) output("\n<b>(No Room)</b> ");
		else if(shopkeep.inventory[i].type == GLOBAL.RANGED_WEAPON && !hasGunRoom) output("\n<b>(Weapons Full)</b> ");
		else if(shopkeep.inventory[i].shields > 0 && !ship.hasShieldGenerator(true)) output("\n<b>(Needs Shield Generator)</b> ");
		else output("\n");
		output(StringUtil.upperCase(shopkeep.inventory[i].description, false) + " - " + temp + " credits.");
		if(temp <= pc.credits) 
		{
			if(canBuy) 
			{
				if(shopkeep.inventory[i].type == GLOBAL.RANGED_WEAPON && !hasGunRoom) addItemDisabledButton(i, shopkeep.inventory[i], null, null, shopkeep, pc);
				else addItemButton(i, shopkeep.inventory[i], buyShipFitItemForReal, shopkeep.inventory[i], null, null, shopkeep, pc);
			}
			else addItemDisabledButton(i, shopkeep.inventory[i], null, null, shopkeep, pc);
		}
		else addItemDisabledButton(i, shopkeep.inventory[i], null, null, shopkeep, pc);
	}
	addButton(14, "Back", shop, shopkeep);
}

public function buyShipFitItemForReal(arg:ItemSlotClass):void
{
	clearOutput();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	var price:Number = getBuyPrice(shopkeep,arg.basePrice);
	var ship:ShittyShip = shits["SHIP"];
	
	if(shopkeep is Dockmaster)
	{
		output("The dockmaster looks over her worklist before giving you an easy smile.");
		output("\n\n<i>“Take a seat, I can have this all fitted in about half an hour.”</i> She waves you towards a stack of boxes, fetching some more modestly-sized tools instead of the ship-breaking beast rest in her muscular arm.");
		output("\n\nYou’re left watching a violet blur get to work, and at some point a little pink-scaled raskvel mech-head handed you a plastic mug full of tea. By the time you’re finished, so is the dockmaster. She gives you an easy grin and a swat on the ass on the way past, mechanical tail clicking around her idly.");
		processTime(30);
	}
	else
	{
		output("You purchase " + arg.description + " for " + num2Text(price) + " credits, and it is installed in your " + ship.short + " within the hour.");
		processTime(60);
	}
	pc.credits -= price;
	
	//So much easier than PC looting, lol.
	ship.inventory.push(arg.makeCopy());
	// Max out shields?
	if(!inCombat() && arg.shields != 0 && ship.hasShields()) ship.shieldsRaw = ship.shieldsMax();
	
	output("\n\n");

	clearMenu();
	addButton(0, "Next", buyShipFitItem,true);
}

public function unfitShipItem(newScreen:Boolean = false):void
{
	if(newScreen)
	{
		clearOutput();
		showBust(shopkeep.bustDisplay);
		showName("\n"+shopkeep.short.toUpperCase());
	}
	var ship:ShittyShip = shits["SHIP"];
	output("Ship modules are too large for you to conveniently store. If you want to remove a fitted module, you’ll have to sell it.\n\n");
	output("<b>Unused Upgrade Slots:</b> " + (ship.shipCapacity()-ship.inventory.length));
	output("\n<b>Unused Weapon Hardpoints:</b> " + (ship.shipGunCapacity() - ship.listShipWeapons().length));
	output("\n<b>Current Crew Capacity:</b> " + ship.shipCrewCapacity());
	output("\n\n<b><u>Currently Fitted Modules:</u></b>");
	if(!(ship.rangedWeapon is EmptySlot)) output("\n\\\[<b>Integrated</b>\\\] " + StringUtil.upperCase(ship.rangedWeapon.longName));
	if(!(ship.meleeWeapon is EmptySlot)) output("\n\\\[<b>Integrated</b>\\\] " + StringUtil.upperCase(ship.meleeWeapon.longName));
	if(!(ship.accessory is EmptySlot)) output("\n\\\[<b>Integrated</b>\\\] " + StringUtil.upperCase(ship.accessory.longName));
	clearMenu();
	var buttonMod:Number = 0;
	for(var i:int = 0; i < ship.inventory.length; i++)
	{
		if(i == 14) buttonMod++;
		output("\n\\\[Modular\\\] " + StringUtil.upperCase(ship.inventory[i].longName) + " (" + getSellPrice(shopkeep,ship.inventory[i].basePrice) + " credits)");

		addItemButton((i+buttonMod), ship.inventory[i], unfitShipItemForReal, i, null, null, pc, shopkeep);
	}
	if(ship.inventory.length == 0) output("\nNo modules fitted.");
	addButton(14, "Back", shop, shopkeep);
}

public function unfitShipItemForReal(i:Number):void
{
	var ship:ShittyShip = shits["SHIP"];
	clearOutput();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());

	var item:ItemSlotClass = ship.inventory[i];
	if(shopkeep is Dockmaster)
	{
		output("The dockmaster gives you a satisfied nod, hefting her mighty wrench with one muscular arm and stalking toward your ship. <i>“It’ll be about half an hour. Have a drink, sit and relax!”</i> Comes the call over her shoulder.");
		output("\n\nYou find a set of boxes to perch on, and a little pink-scaled raskvel brings you a cup of tea. You’re just barely finishing it by the time she’s finished, hefting herself out from beneath your baby and wiping oil from her hands. She pauses only to check that no oil marrs her shiny, chrome legs before nodding with satisfaction. <i>“Done! Quick as you like. And might I suggest getting some parts fitted? Unless you were strapped for cash, empty space is just waste.”</i>");
		processTime(30);
	}
	else
	{
		output("The " + item.longName + " is painstakingly removed over the course of an hour, leaving you with room for a crew member, weapon system, or upgrade. (+" + getSellPrice(shopkeep,item.basePrice) + " credits.)");
		processTime(60);
	}
	pc.credits += getSellPrice(shopkeep,item.basePrice);
	//Remove one item
	ship.inventory.splice(i,1);
	// Max out shields?
	if(!inCombat() && item.shields != 0 && ship.hasShields()) ship.shieldsRaw = ship.shieldsMax();
	
	clearMenu();
	addButton(0,"Next",unfitShipItem,true);
}

public function buyItem(quantity:int=1):void {
	if(shopkeep is Geoff)
	{
		(shopkeep as Geoff).bustUpdate(false);
	}
	
	clearOutput();
	if(stage.contains(userInterface.textInput)) removeInput();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	output(shopkeep.keeperBuy);
	if(shopkeep.inventory.length > 10) output("\n" + multiButtonPageNote() + "\n");

	//Build menu
	clearMenu();
	var buyOptions:Boolean = kGAMECLASS.gameOptions.vendorToggle;
	var temp:Number = 0;
	var btnSlot:int = -5;
	var i:int = 0;
	while (true)
	{
		if (i % 10 == 0 && (i < shopkeep.inventory.length || !i))
		{
			btnSlot += 5;
			addButton(btnSlot + 14, "Back", shop, shopkeep);
			
			//Quantity buttons
			if (quantity == 1) {
				addDisabledButton(btnSlot + 10, "x1", "x1", "You are already buying 1 item at a time.");
			}
			else {
				addButton(btnSlot + 10, "x1", buyItem, 1, "x1", "Buy 1 item at a time.");
			}
			
			if (quantity == 2) {
				addDisabledButton(btnSlot + 11, "x2", "x2", "You are already buying 2 items at a time.");
			}
			else {
				addButton(btnSlot + 11, "x2", buyItem, 2, "x2", "Buy 2 items at a time.");
			}
			
			if (quantity == 5) {
				addDisabledButton(btnSlot + 12, "x5", "x5", "You are already buying 5 items at a time.");
			}
			else {
				addButton(btnSlot + 12, "x5", buyItem, 5, "x5", "Buy 5 items at a time.");
			}

			//Custom quantity
			addButton(btnSlot + 13, "xCustom", buyItemMultiCustom, undefined, "Custom", "Choose a custom quantity.");
		}
		
		if (i == shopkeep.inventory.length) break;
		
		trace("GOING THROUGH SHOPKEEP INVENTORY.");
		//If slot has something in it.
		if(shopkeep.inventory[i].quantity > 0) {
			output("\n");
			temp = getBuyPrice(shopkeep,shopkeep.inventory[i].basePrice*shopkeep.inventory[i].quantity);
			
			// Coupons (only affects buy price--not sell price.)
			var couponName:String = "Coupon - " + shopkeep.inventory[i].shortName;
			if(pc.hasKeyItem(couponName))
			{
				temp = Math.round(temp * pc.keyItemv1(couponName)) + temp * (quantity-1);
			}
			else if(shopkeep is Lerris && pc.hasKeyItem("Coupon - TamaniCorp"))
			{
				temp = Math.round(temp * pc.keyItemv1("Coupon - TamaniCorp")) + temp * (quantity-1);
			}
			else if(shopkeep is Ceria && pc.hasKeyItem("Coupon - Shear Beauty"))
			{
				temp = Math.round(temp * pc.keyItemv1("Coupon - Shear Beauty")) + temp * (quantity-1);
			}
			else if (shopkeep is Kiona && kionaCreditOwed() > 0)
			{
				temp = (temp * quantity) - kionaCreditOwed();
				if (temp < 0) temp = 0;
			}
			else
			{
				temp = temp * quantity;
			}

			// Listing inventory exceptions
			if(shopkeep is VendingMachine)
			{
				switch(shopkeep.originalRace)
				{
					case "Amazona": output(amazonaIcedTeaList(shopkeep.inventory[i], quantity)); break;
					default :
						if(temp > pc.credits) output("<b>(Too Expensive)</b> ");
						output(StringUtil.upperCase(shopkeep.inventory[i].description, false) + " (x" + (quantity) + ") - " + temp + " credits.");
					break;
				}
			}
			// Default listing
			else
			{
				//Issue checking
				if (temp > pc.credits) output("<b>(Too Expensive)</b> ");
				if (shopkeepLimitedStock(shopkeep.inventory[i]) && quantity > shopkeepLimitedStockQuantity(shopkeep.inventory[i])) output("<b>(" + shopkeep.short + " only has " + shopkeepLimitedStockQuantity(shopkeep.inventory[i]) + " of these.)</b> ");
				//Price listing
				output(StringUtil.upperCase(shopkeep.inventory[i].description, false) + " (x" + (quantity) + ") - " + temp + " credits.");
			}
			trace("DISPLAYING SHIT");
			//Add buttons if the player has enough credits and the shopkeep has enough stock
			if(temp <= pc.credits && shopkeepLimitedStockQuantity(shopkeep.inventory[i]) >= quantity) {
				trace("SHOWAN BUTANS: " + i);
				if(buyOptions)
				{
					addItemButton(btnSlot, shopkeep.inventory[i], buyItemOK, [shopkeep.inventory[i], quantity], null, null, shopkeep, pc);
				}
				else
				{
					addItemButton(btnSlot, shopkeep.inventory[i], buyItemGo, [shopkeep.inventory[i], quantity], null, null, shopkeep, pc);
				}
			}
			//Disabled button if one or both of the above criteria aren't met.
			else {
				trace("SHOWAN HIDE BUTTONS");
				addItemDisabledButton(btnSlot, shopkeep.inventory[i], null, null, shopkeep, pc);
			}
		}
		
		btnSlot++;
		i++;
	}
}

//Input a custom quantity
public function buyItemMultiCustom():void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	clearOutput();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	
	output("How many items would you like to buy at once?");
	output("\n");
	displayInput();
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", buyItemMultiCustomOK);
	addButton(14, "Back", buyItem);
}

//Error check the custom quantity
public function buyItemMultiCustomOK():void
{
	if(isNaN(Number(userInterface.textInput.text))) {
		buyItemMultiCustomOK();
		output("Choose a quantity that is a positive integer, please.");
		return;
	}
	else if(Number(userInterface.textInput.text) < 1) {
		buyItemMultiCustom();
		output("Choose a quantity that is 1 or more, please.");
		return;
	}
	var buyNumber:int = Math.floor(Number(userInterface.textInput.text));
	buyItem(buyNumber);
}

//Check to see if there are limited quantities of an item
public function shopkeepLimitedStock(arg:ItemSlotClass):Boolean
{
	//Dummy code in case of future changes. Currently there are no items where one shopkeep has a limited quantity and a different one doesn't.
	//if (shopkeep is [name]) { }

	switch (true)
	{
		case arg is GaloMax:
		case arg is GooArmor:
		case arg is HorseCock:
		case arg is MindwashVisor:
		case arg is SiegwulfeItem:
		case arg is TarkusJokeBook:
			return true;
			break;
		default:
			return false;
			break;
	}
}

//Check what the quantity is for limited items
public function shopkeepLimitedStockQuantity(arg:ItemSlotClass):int
{
	//Dummy code in case of future changes. Currently there are no limited quantity items where anyone has more than 1.
	//if (shopkeep is [name]) {}

	switch (true)
	{
		case arg is GaloMax:
		case arg is GooArmor:
		case arg is HorseCock:
		case arg is MindwashVisor:
		case arg is SiegwulfeItem:
		case arg is TarkusJokeBook:
			return 1;
			break;
		default:
			return 9999;
			break;
	}
}

//arg[0] ItemSlotClasss, arg[1] Quantity
public function buyItemOK(arg:Array):void
{
	clearOutput();
	clearMenu();

	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	
	var price:Number = getBuyPrice(shopkeep, arg[0].basePrice);
	
	//Coupon stuff
	var hasCoupon:Boolean = false;
	var couponName:String = "Coupon - " + arg[0].shortName;
	if(pc.hasKeyItem(couponName))
	{
		price = Math.round(price * pc.keyItemv1(couponName)) + price * (arg[1]-1);
		hasCoupon = true;
	}
	else if(shopkeep is Lerris && pc.hasKeyItem("Coupon - TamaniCorp"))
	{
		price = Math.round(price * pc.keyItemv1("Coupon - TamaniCorp")) + price * (arg[1]-1);
		hasCoupon = true;
	}
	else if(shopkeep is Ceria && pc.hasKeyItem("Coupon - Shear Beauty"))
	{
		price = Math.round(price * pc.keyItemv1("Coupon - Shear Beauty")) + price * (arg[1]-1);
		hasCoupon = true;
	}
	//No coupon price
	else
	{
		price = price * arg[1];
	}
	
	output("Are you sure you want to buy " + arg[0].description + " (x" + arg[1] +") for");
	if (hasCoupon)	output(" a discounted price of");
	output(" " + price + " credits?");
	
	addButton(0, "Yes", buyItemGo, [arg[0], arg[1]]);
	addButton(1, "No", buyItem);
}

//arg[0] ItemSlotClass, arg[1] Quantity
public function buyItemGo(arg:Array):void {
	clearOutput();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	var price:Number = getBuyPrice(shopkeep,arg[0].basePrice);
	
	//Special Vendor/Item Overrides
	if(shopkeep is Colenso && arg[0] is TarkusJokeBook)
	{
		pc.credits -= price;
		output("Colenso hands you the card, which you scan into your codex. It beeps.\n\n<b>A new codex entry under Fiction is available!</b>");
		CodexManager.unlockEntry("Diverting Jokes");
		//’Next’ button can either return to shop menu or go directly to the codex entry, you choose
		clearMenu();
		addButton(0,"Next",colensoBuyMenu);
		return;
	}
	else if(shopkeep is Petr)
	{
		arbetzPetrBuyGo(arg[0], arg[1]);
		return;
	}
	else if(shopkeep is VendingMachine)
	{
		switch(shopkeep.originalRace)
		{
			case "J'ejune": jejuneMachineBuyGo(arg[0], arg[1]); break;
			case "XXX": xxxMachineBuyGo(arg[0], arg[1]); break;
			case "Amazona": amazonaIcedTeaBuyGo(arg[0], arg[1]); break;
		}
	}
	//Emmy magic!
	else if(shopkeep is Emmy) flags["PURCHASED_FROM_EMS"] = 1;
	else if(shopkeep is Sera) flags["PURCHASED_FROM_SERA"] = 1;
	else if(shopkeep is Ceria) flags["CERIA_BOUGHT"] = 1;
	else if(shopkeep is Mabbs) flags["MABBS_PURCHASES"] = 1;
	else if(shopkeep is Zea) shopkeep.sellMarkup = 1;
	else if(shopkeep is Bianca) pc.createStatusEffect("Bought From Bianca");
	
	// Apply and destroy coupons!
	var usedCoupon:Boolean = false;
	var couponName:String = "Coupon - " + arg[0].shortName;
	if(pc.hasKeyItem(couponName))
	{
		price = Math.round(price * pc.keyItemv1(couponName)) + price * (arg[1]-1);
		pc.removeKeyItem(couponName);
		usedCoupon = true;
	}
	else if(shopkeep is Lerris && pc.hasKeyItem("Coupon - TamaniCorp"))
	{
		price = Math.round(price * pc.keyItemv1("Coupon - TamaniCorp")) + price * (arg[1]-1);
		pc.removeKeyItem("Coupon - TamaniCorp");
		usedCoupon = true;
	}
	else if(shopkeep is Ceria && pc.hasKeyItem("Coupon - Shear Beauty"))
	{
		price = Math.round(price * pc.keyItemv1("Coupon - Shear Beauty")) + price * (arg[1]-1);
		pc.removeKeyItem("Coupon - Shear Beauty");
		usedCoupon = true;
	}
	else
	{
		price = price * arg[1];
	}
	if(usedCoupon) output("The coupon saved on your codex is used and instantly changes the final price. ");
	
	if (shopkeep is Kiona) kionaBuyUsingStoreCredit(arg[0].description, price);
	
	else
	{
	  output("You purchase " + arg[0].description + " (x" + arg[1] + ") for " + num2Text(price) + " credits.");
	  pc.credits -= price;
	}

	// Renamed from lootList so I can distinguish old vs new uses
	var purchasedItems:Array = new Array();
	var stackSize:Number = arg[0].stackSize;
	var quantity:Number = arg[1];
	var i:Number = 0;
	
	//Suma swap
	if(arg[0] is SumaCream)
	{		
		var blackCream:int = 0;
		for (i = arg[1]; i > 0; i--){
			// Buying Suma Cream has a 1 in 20 chance of getting a “Black Cream” pearl instead, due to J’ejune’s lax oversight
			if (rand(20) == 0) blackCream++;
		}
		quantity -= blackCream;

		//White cream
		while (quantity > 0)
		{
			if (quantity > stackSize)
			{
				purchasedItems[i] = new SumaCreamWhite();
				purchasedItems[i].quantity += stackSize - 1;
				quantity -= stackSize;
				i++
			}
			else
			{
				purchasedItems[i] = new SumaCreamWhite();
				purchasedItems[i].quantity += quantity - 1;
				quantity = 0;
				i++;
			}
		}
		
		//Black cream
		while (blackCream > 0)
		{
			if (blackCream > stackSize)
			{
				purchasedItems[i] = new SumaCreamBlack();
				purchasedItems[i].quantity += stackSize - 1;
				blackCream -= stackSize;
				i++
			}
			else
			{
				purchasedItems[i] = new SumaCreamBlack();
				purchasedItems[i].quantity += blackCream - 1;
				blackCream = 0;
			}
		}
	}
	
	//Properly load up the array for looting
	else
	{
		while (quantity > 0)
		{
			if (quantity > stackSize)
			{
				purchasedItems[i] = arg[0].makeCopy();
				purchasedItems[i].quantity += stackSize - 1;
				quantity -= stackSize;
				i++
			}
			else
			{
				purchasedItems[i] = arg[0].makeCopy();
				purchasedItems[i].quantity += quantity - 1;
				quantity = 0;
			}
		}
	}
	
	//Cheese shit for GaloMax
	if(arg[0] is GaloMax)
	{
		if(shopkeep is Gene) flags["PURCHASED_GENES_GALO"] = 1;
		if(shopkeep is Sera) flags["PURCHASED_SERAS_GALO"] = 1;
		if(shopkeep is ChrysalisDrone) flags["PURCHASED_SERAS_GALO"] = 1;
		shopkeep.inventory.splice(shopkeep.inventory.indexOf(arg[0]), 1);
	}
	// Siegwulfe Special
	if(arg[0] is SiegwulfeItem)
	{
		purchasedItems.length = 0;
		output("\n\nThe display model of the droid is much too big and lofty to carry around, especially unpowered. Instead, an order has been placed for a brand-new model and is currently being delivered straight to your ship. <b>Be sure to check your ship’s storage for it!</b>");
		chars["WULFE"].accessory = arg[0];
		shopkeep.inventory.splice(shopkeep.inventory.indexOf(arg[0]), 1);
		flags["WULFE_ON_SHIP"] = false;
		IncrementFlag("WULFE_PURCHASED");
	}
	// Goo Special
	if(arg[0] is GooArmor)
	{
		output("\n\n" + gooArmorInventoryBlurb(arg[0], "buy"));
		shopkeep.inventory.splice(shopkeep.inventory.indexOf(arg[0]), 1);
	}
	if(arg[0] is HorseCock)
	{
		//Gotta count these fuckers
		IncrementFlag("SYNTHSHEATH_TWO_FOUND");
		if(!synthSheathAvailable(arg[0].quantity))
		{
			if(shopkeep is Shekka) shopkeep.inventory.splice(shopkeep.inventory.indexOf(arg[0]), 1);
		}
	}
	if(arg[0] is MindwashVisor)
	{
		shopkeep.inventory.splice(shopkeep.inventory.indexOf(arg[0]), 1);
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

public function buyShopkeepLimitedStock():void
{
	
}

public function sellItem():void
{
	// Inturruptions
	if(shopkeep is Sera)
	{
		if(seraDebtCheck()) return;
	}
	if(shopkeep is Geoff)
	{
		(shopkeep as Geoff).bustUpdate(true);
	}
	
	clearOutput();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());

	output(shopkeep.keeperSell);
	if(pc.inventory.length > 10) output("\n" + multiButtonPageNote() + "\n");
	
	clearMenu();
	var sellOptions:Boolean = kGAMECLASS.gameOptions.vendorToggle;
	var btnSlot:int = -5;
	var i:int = 0;
	while (true)
	{
		if (i % 10 == 0 && (i < pc.inventory.length || !i))
		{
			btnSlot += 5;
			addButton(btnSlot+14, "Back", shop, shopkeep);
		}
		
		if (i == pc.inventory.length || pc.inventory[i] == null) break;
		
		//If slot has something in it.
		if(pc.inventory[i].quantity > 0) {
			trace("PC inventory being checked for possible sale.");
			//Does the shopkeep buy this type?
			if(pc.inventory[i].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) {
				addDisabledButton(btnSlot, pc.inventory[i].shortName + " x" + pc.inventory[i].quantity, StringUtil.toDisplayCase(pc.inventory[i].longName), "This item is too important to sell.");
			}
			else if(shopkeep.buysType(pc.inventory[i].type)) {
				output("\n" + StringUtil.upperCase(pc.inventory[i].description, false) + " - " + getSellPrice(shopkeep,pc.inventory[i].basePrice) + " credits.");
				if(sellOptions)
				{
					addItemButton(btnSlot, pc.inventory[i], sellItemQuantity, pc.inventory[i], null, null, pc, shopkeep);
				}
				else
				{
					addItemButton(btnSlot, pc.inventory[i], sellItemGo, pc.inventory[i], null, null, pc, shopkeep);
				}
			}
			else {
				addItemDisabledButton(btnSlot, pc.inventory[i], null, "<i>The vendor is not interested in this item.</i>", pc, shopkeep);
			}
		}
		btnSlot++;
		i++;
	}
}

public function sellItemQuantity(arg:ItemSlotClass):void
{
	clearOutput();
	clearMenu();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	
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
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	
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
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	
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
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	
	var soldItem:ItemSlotClass = arg[0];
	var soldNumber:int = arg[1];
	var soldPrice:Number = (getSellPrice(shopkeep,soldItem.basePrice) * soldNumber);
	
	sellItemBonus(soldItem, soldPrice);
	
	if (shopkeep is Kiona) kionaSellUsingStoreCredit(soldItem.description,soldPrice,soldNumber);
	else
	{
		pc.credits += soldPrice;	
		output("You sell " + soldItem.description + " (x" + soldNumber + ") for " + num2Text(soldPrice) + " credits.");
	}
	
	// Special Events
	if(soldItem is GooArmor) output("\n\n" + gooArmorInventoryBlurb(soldItem, "sell"));
	if(soldItem is HorseCock) {
		if(flags["SYNTHSHEATH_LOST"] == undefined) flags["SYNTHSHEATH_LOST"] = 0;
		flags["SYNTHSHEATH_LOST"] += soldNumber;
	}
	if(soldItem is DamagedVIChip && flags["NYM-FOE_REPAIR_QUEST"] == 2) flags["NYM-FOE_REPAIR_QUEST"] = -1;
	soldItem.quantity -= soldNumber;
	if (soldItem.quantity == 0) pc.inventory.splice(pc.inventory.indexOf(soldItem), 1);
	
	clearMenu();
	addButton(0,"Next",sellItem);
}

public function sellItemGo(arg:ItemSlotClass):void {
	clearOutput();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());

	var price:Number = getSellPrice(shopkeep,arg.basePrice);
	
	sellItemBonus(arg, price);
	
	if (shopkeep is Kiona) kionaSellUsingStoreCredit(arg.description, price);
	else
	{
		pc.credits += price;
		output("You sell " + arg.description + " for " + num2Text(price) + " credits.");
	}
	
	// Special Events
	if(arg is GooArmor) output("\n\n" + gooArmorInventoryBlurb(arg, "sell"));
	if(arg is HorseCock) IncrementFlag("SYNTHSHEATH_LOST");
	if(arg is StrangeEgg) IncrementFlag("STRANGE_EGG_SOLD");
	if(arg is DamagedVIChip && flags["NYM-FOE_REPAIR_QUEST"] == 2) flags["NYM-FOE_REPAIR_QUEST"] = -1;
	if(shopkeep is Vulriks) flags["VULRIKS_SOLD"] = (flags["VULRIKS_SOLD"] != undefined ? flags["VULRIKS_SOLD"] + price : price);
	
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
	clearMenu();
	
	if(pc.inventory.length <= 0)
	{
		output("You do not have any items to drop.\n");
		addButton(14, "Back", inventory);
		return;
	}
	
	output("What item would you like to drop?");
	if(pc.inventory.length > 10) output("\n\n" + multiButtonPageNote());
	output("\n\n");
	output("<b><u>Inventory:</u></b>");
	var dropOptions:Boolean = kGAMECLASS.gameOptions.vendorToggle;
	var btnSlot:int = -5;
	var i:int = 0;
	while (true)
	{
		if (i % 10 == 0 && (i < pc.inventory.length || !i))
		{
			btnSlot += 5;
			addButton(btnSlot+14, "Back", inventory);
		}
		
		if (i == pc.inventory.length || pc.inventory[i] == null) break;
		
		if(!pc.inventory[i].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) {
			output("\n");
			if(pc.inventory[i].stackSize > 1) output(pc.inventory[i].quantity + "x ");
			output(StringUtil.toDisplayCase(pc.inventory[i].longName) + " - " + pc.inventory[i].basePrice + " credits.");
			if(dropOptions)
			{
				addItemButton(btnSlot, pc.inventory[i], dropItemQuantity, pc.inventory[i], null, null, pc, null);
			}
			else
			{
				addItemButton(btnSlot, pc.inventory[i], dropItemGo, pc.inventory[i], null, null, pc, null);
			}
		}
		else {
			output("\n");
			if(pc.inventory[i].stackSize > 1) output(pc.inventory[i].quantity + "x ");
			output(StringUtil.toDisplayCase(pc.inventory[i].longName) + " - <i>Not droppable</i>.");
			addItemDisabledButton(btnSlot, pc.inventory[i], null, "<i>You cannot drop this item.</i>", pc, null);
		}
		btnSlot++;
		i++;
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
	
	// Special Events
	if(dumpItem is GooArmor) output("\n\n" + gooArmorInventoryBlurb(dumpItem, "drop"));
	if(dumpItem is HorseCock) {
		if(flags["SYNTHSHEATH_LOST"] == undefined) flags["SYNTHSHEATH_LOST"] = 0;
		flags["SYNTHSHEATH_LOST"] += dumpNumber;
	}
	dumpItem.quantity -= dumpNumber;
	if(dumpItem is DamagedVIChip && flags["NYM-FOE_REPAIR_QUEST"] == 2) flags["NYM-FOE_REPAIR_QUEST"] = -2;
	if (dumpItem.quantity == 0) pc.inventory.splice(pc.inventory.indexOf(dumpItem), 1);
	
	clearMenu();
	addButton(0, "Next", dropItem);
}

public function dropItemGo(arg:ItemSlotClass):void {
	clearOutput();
	
	output("You drop " + arg.description + ".");
	
	// Special Events
	if(arg is GooArmor) output("\n\n" + gooArmorInventoryBlurb(arg, "drop"));
	if(arg is HorseCock) IncrementFlag("SYNTHSHEATH_LOST");
	if(arg is DamagedVIChip && flags["NYM-FOE_REPAIR_QUEST"] == 2) flags["NYM-FOE_REPAIR_QUEST"] = -2;
	
	arg.quantity--;
	if (arg.quantity <= 0 && pc.inventory.indexOf(arg) != -1)
	{
		pc.inventory.splice(pc.inventory.indexOf(arg), 1);
	}
	clearMenu();
	addButton(0, "Next", dropItem);
}

public function deleteItemPrompt(arg:ItemSlotClass):void
{
	clearOutput();
	output("Are you sure you want to remove " + arg.description + "?");
	output("\n\n<i>Note that removing the item will purge it from your inventory and cannot be reclaimed.</i>\n\n");
	
	clearMenu();
	addButton(0, "Yes", deleteItemGo, arg);
	addButton(1, "No", useItemFunction);
}
public function deleteItemGo(arg:ItemSlotClass):void {
	clearOutput();
	
	output("You remove " + arg.description + " from your inventory.");
	
	pc.inventory.splice(pc.inventory.indexOf(arg), 1);
	
	clearMenu();
	addButton(0, "Next", useItemFunction);
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
		else addOverrideItemButton(0, pc.upperUndergarment, "U.Top Off", unequip, pc.upperUndergarment);
	}
	else addDisabledButton(0, "Undertop", "Undertop", "You are not wearing anything in this slot.");

	if (pc.shield.shortName != "")
	{
		addOverrideItemButton(1, pc.shield, "Shield Off", unequip, pc.shield);
	}
	else addDisabledButton(1, "Shield", "Shield Generator", "You do not have a shield generator equipped.");
	
	if (pc.lowerUndergarment.shortName != "")
	{
		if(inCombat) addDisabledButton(5, "U.Wear Off", StringUtil.toDisplayCase(pc.lowerUndergarment.longName), "Cannot be unequipped in combat.");
		else addOverrideItemButton(5, pc.lowerUndergarment, "U.Wear Off", unequip, pc.lowerUndergarment);
	}
	else addDisabledButton(5, "Underwear", "Underwear", "You are not wearing anything in this slot.");
	
	if (pc.meleeWeapon.shortName != "" && pc.meleeWeapon.shortName != "Rock")
	{
		addOverrideItemButton(2, pc.meleeWeapon, "Melee Off", unequip, pc.meleeWeapon);
	}
	else addDisabledButton(2, "Melee", "Melee Weapon", "You do not have a melee weapon equipped.");
	
	if (pc.armor.shortName != "")
	{
		if(inCombat) addDisabledButton(6, "Armor Off", StringUtil.toDisplayCase(pc.armor.longName), "Cannot be unequipped in combat.");
		else addOverrideItemButton(6, pc.armor, "Armor Off", unequip, pc.armor);
	}
	else addDisabledButton(6, "Armor", "Armor", "You are not wearing anything in this slot.");
	
	if (pc.rangedWeapon.shortName != "" && pc.rangedWeapon.shortName != "Rock")
	{
		addOverrideItemButton(7, pc.rangedWeapon, "Ranged Off", unequip, pc.rangedWeapon);
	}
	else addDisabledButton(7, "Ranged", "Ranged Weapon", "You do not have a ranged weapon equipped.");
	
	if (pc.accessory.shortName != "")
	{
		addOverrideItemButton(3, pc.accessory, "Acc. Off", unequip, pc.accessory);
	}
	else addDisabledButton(3, "Accessory", "Accessory", "You do not have an accessory equipped.");
	
	if(pc.hasPiercing())
	{
		if(inCombat) addDisabledButton(8, "Piercing", "Piercing", "Cannot be unequipped in combat.");
		else addButton(8,"Piercing",removeAPiercingMenu);
	}
	else addDisabledButton(8, "Piercing", "Piercing", "You are not wearing any piercings.");
	
	if(pc.hasCock())
	{
		if(pc.hasCocksock())
		{
			if(inCombat) addDisabledButton(10, "Cockwear", "Cockwear", "Cannot be unequipped in combat.");
			else addButton(10,"Cockwear",removeACocksockMenu);
		}
		else addDisabledButton(10, "Cockwear", "Cockwear", "You are not wearing any cockwear.");
	}
	
	//Set user and target.
	itemUser = pc;
	addButton(14, "Back", inventory);
}

public function removeAPiercingMenu():void
{
	clearOutput();
	showName("\nPIERCINGS");
	output("You look yourself over for piercings.\n");

	clearMenu();
	var button:Number = 0;
	var btnName:String = "";
	var btnTitle:String = "";
	var x:int = 0;
	
	//Ears!
	output("\n\t*(" + (button+1) + ") Ear");
	if(!(pc.earPiercing is EmptySlot)) 
	{
		output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.earPiercing.longName));
	}
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.earPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Ears",(button) + ": Ears","You cannot remove that piercing without outside assistance.");
	else if(pc.earPiercing is EmptySlot) addDisabledButton(button++,(button) + ": Ears",(button) + ": Ears","You have no piercing there!");
	else addButton(button++,(button) + ": Ears",actuallyRemoveAPiercing,["ears"]);
	
	//Eyebrows
	output("\n\t*(" + (button+1) + ") Eyebrows");
	if(!(pc.eyebrowPiercing is EmptySlot)) 
	{
		output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.eyebrowPiercing.longName));
	}
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.eyebrowPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Brows",(button) + ": Eyebrows","You cannot remove that piercing without outside assistance.");
	else if(pc.eyebrowPiercing is EmptySlot) addDisabledButton(button++,(button) + ": Brows",(button) + ": Eyebrows","You have no piercing there!");
	else addButton(button++,(button) + ": Brows",actuallyRemoveAPiercing,["brows"]);

	//Nose
	output("\n\t*(" + (button+1) + ") Nose");
	if(!(pc.nosePiercing is EmptySlot)) 
	{
		output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.nosePiercing.longName));
	}
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.nosePiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Nose",(button) + ": Nose","You cannot remove that piercing without outside assistance.");
	else if(pc.nosePiercing is EmptySlot) addDisabledButton(button++,(button) + ": Nose",(button) + ": Nose","You have no piercing there!");
	else addButton(button++,(button) + ": Nose",actuallyRemoveAPiercing,["nose"]);

	//Lip
	output("\n\t*(" + (button+1) + ") Lip");
	if(!(pc.lipPiercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.lipPiercing.longName));
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.lipPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Lip",(button) + ": Lip","You cannot remove that piercing without outside assistance.");
	else if(pc.lipPiercing is EmptySlot) addDisabledButton(button++,(button) + ": Lip",(button) + ": Lip","You have no piercing there!");
	else addButton(button++,(button) + ": Lip",actuallyRemoveAPiercing,["lip"]);

	//Tongue
	output("\n\t*(" + (button+1) + ") Tongue");
	if(!(pc.tonguePiercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.tonguePiercing.longName));
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.tonguePiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Tongue",(button) + ": Tongue","You cannot remove that piercing without outside assistance.");
	else if(pc.tonguePiercing is EmptySlot) addDisabledButton(button++,(button) + ": Tongue",(button) + ": Tongue","You have no piercing there!");
	else addButton(button++,(button) + ": Tongue",actuallyRemoveAPiercing,["tongue"]);

	//Bewbs
	for(x = 0; x < pc.bRows(); x++)
	{
		if(pc.bRows() > 1)
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " " + StringUtil.toDisplayCase(pc.nippleNoun(x, true)) + " Row");
			btnName = "NipRow #" + (x+1);
			btnTitle = StringUtil.upperCase(num2Ordinal(x+1)) + " " + StringUtil.toDisplayCase(pc.nippleNoun(x, true)) + " Row";
		}
		else
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.toDisplayCase(pc.nipplesNoun(x, true)));
			btnName = "Nipples";
			btnTitle = StringUtil.toDisplayCase(pc.nipplesNoun(x, true));
		}
		if(!(pc.breastRows[x].piercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.breastRows[x].piercing.longName));
		else
		{
			output(" - <b>(EMPTY)</b>");
		}
		if(pc.breastRows[x].piercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You cannot remove that piercing without outside assistance.");
		else if(pc.breastRows[x].piercing is EmptySlot) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You have no piercing there!");
		else addButton(button++,(button) + ": " + btnName,actuallyRemoveAPiercing,["nipples", x]);
	}

	//Belly Buttan
	output("\n\t*(" + (button+1) + ") Belly Button");
	if(!(pc.bellyPiercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.bellyPiercing.longName));
	else
	{
		output(" - <b>(EMPTY)</b>");
	}
	if(pc.bellyPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Belly",(button) + ": Belly","You cannot remove that piercing without outside assistance.");
	else if(pc.bellyPiercing is EmptySlot) addDisabledButton(button++,(button) + ": Belly",(button) + ": Belly","You have no piercing there!");
	else addButton(button++,(button) + ": Belly",actuallyRemoveAPiercing,["belly"]);
	//Dix
	for(x = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cockTotal() > 1)
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " Penis (" + Math.floor(pc.cocks[x].cLength()) + "\", " + StringUtil.toDisplayCase(pc.cocks[x].cockColor) + ", " + GLOBAL.TYPE_NAMES[pc.cocks[x].cType] + ")");
			btnName = "Penis #" + (x+1);
			btnTitle = StringUtil.upperCase(num2Ordinal(x+1)) + " Penis";
		}
		else
		{
			output("\n\t*(" + (button+1) + ") Penis (" + Math.floor(pc.cocks[x].cLength()) + "\", " + StringUtil.toDisplayCase(pc.cocks[x].cockColor) + ", " + GLOBAL.TYPE_NAMES[pc.cocks[x].cType] + ")");
			btnName = "Penis";
			btnTitle = "Penis";
		}
		if(!(pc.cocks[x].piercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.cocks[x].piercing.longName));
		else
		{
			output(" - <b>(EMPTY)</b>");
		}
		if(pc.cocks[x].piercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You cannot remove that piercing without outside assistance.");
		else if(pc.cocks[x].piercing is EmptySlot) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You have no piercing there!");
		else addButton(button++,(button) + ": " + btnName,actuallyRemoveAPiercing,["cock", x]);
	}
	//Vaginas/Clits
	for(x = 0; x < pc.totalVaginas(); x++)
	{
		//Labia!
		if(pc.totalVaginas() > 1)
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " Vagina (" + StringUtil.toDisplayCase(pc.vaginas[x].vaginaColor) + ", " + GLOBAL.TYPE_NAMES[pc.vaginas[x].type] + ")");
			btnName = "Vagina #" + (x+1);
			btnTitle = StringUtil.upperCase(num2Ordinal(x+1)) + " Vagina";
		}
		else
		{
			output("\n\t*(" + (button+1) + ") Vagina (" + StringUtil.toDisplayCase(pc.vaginas[x].vaginaColor) + ", " + GLOBAL.TYPE_NAMES[pc.vaginas[x].type] + ")");
			btnName = "Vagina";
			btnTitle = "Vagina";
		}
		if(!(pc.vaginas[x].piercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.vaginas[x].piercing.longName));
		else
		{
			output(" - <b>(EMPTY)</b>");
		}
		if(pc.vaginas[x].piercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You cannot remove that piercing without outside assistance.");
		else if(pc.vaginas[x].piercing is EmptySlot) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You have no piercing there!");
		else addButton(button++,(button) + ": " + btnName,actuallyRemoveAPiercing,["vagina", x]);
		//Clits
		if(pc.totalVaginas() > 1)
		{
			output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " Vagina’s Clit");
			btnName = "Clit #" + (x+1);
			btnTitle = StringUtil.upperCase(num2Ordinal(x+1)) + " Vagina’s Clit";
		}
		else
		{
			output("\n\t*(" + (button+1) + ") Clit");
			btnName = "Clit";
			btnTitle = "Clit";
		}
		if(pc.vaginas[x].clits > 1 && !pc.vaginas[x].piercing.hasFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE)) output(" (Max 1x/Vagina)");
		if(!(pc.vaginas[x].clitPiercing is EmptySlot)) output(" - <b>Pierced:</b> " + StringUtil.toDisplayCase(pc.vaginas[x].clitPiercing.longName));
		else
		{
			output(" - <b>(EMPTY)</b>");
		}
		if(pc.vaginas[x].clitPiercing.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You cannot remove that piercing without outside assistance.");
		else if(pc.vaginas[x].clitPiercing is EmptySlot) addDisabledButton(button++,(button) + ": " + btnName,btnTitle,"You have no piercing there!");
		else addButton(button++,(button) + ": " + btnName,actuallyRemoveAPiercing,["clit", x]);
	}
	
	while((button < 60) && ((button + 1) % 15 != 0)) { button++; }
	
	if(inCombat()) addButton(button++,"Cancel",unequipMenu,true);
	else addButton(button++,"Cancel",unequipMenu,false);
}

public function actuallyRemoveAPiercing(args:Array):void
{
	clearOutput();
	showName("PIERCING\nREMOVAL");
	output("You gingerly remove your the piercing in question.\n\n");
	
	var slot:String = args[0];
	var x:int = (args.length > 1 ? args[1] : 0);
	
	var item:ItemSlotClass = new EmptySlot();
	switch(slot)
	{
		case "lip":
			item = pc.lipPiercing;
			pc.lipPiercing.onRemove(pc, true);
			pc.lipPiercing = new EmptySlot();
			break;
		case "ears":
			item = pc.earPiercing;
			pc.earPiercing.onRemove(pc, true);
			pc.earPiercing = new EmptySlot();
			break;
		case "brows":
			item = pc.eyebrowPiercing;
			pc.eyebrowPiercing.onRemove(pc, true);
			pc.eyebrowPiercing = new EmptySlot();
			break;
		case "nose":
			item = pc.nosePiercing;
			pc.nosePiercing.onRemove(pc, true);
			pc.nosePiercing = new EmptySlot();
			break;
		case "tongue":
			item = pc.tonguePiercing;
			pc.tonguePiercing.onRemove(pc, true);
			pc.tonguePiercing = new EmptySlot();
			break;
		case "nipples":
			item = pc.breastRows[x].piercing;
			pc.breastRows[x].piercing.onRemove(pc, true);
			pc.breastRows[x].piercing = new EmptySlot();
			break;
		case "belly":
			item = pc.bellyPiercing;
			pc.bellyPiercing.onRemove(pc, true);
			pc.bellyPiercing = new EmptySlot();
			break;
		case "cock":
			item = pc.cocks[x].piercing;
			pc.cocks[x].piercing.onRemove(pc, true);
			pc.cocks[x].piercing = new EmptySlot();
			break;
		case "vagina":
			item = pc.vaginas[x].piercing;
			pc.vaginas[x].piercing.onRemove(pc, true);
			pc.vaginas[x].piercing = new EmptySlot();
			break;
		case "clit":
			item = pc.vaginas[x].clitPiercing;
			pc.vaginas[x].clitPiercing.onRemove(pc, true);
			pc.vaginas[x].clitPiercing = new EmptySlot();
			break;
		default:
			item = pc.lipPiercing;
			pc.lipPiercing.onRemove(pc, true);
			pc.lipPiercing = new EmptySlot();
			break;
	}
	var unequippedItems:Array = [];
	unequippedItems.push(item);
	itemCollect(unequippedItems);
	if(inCombat()) backToCombatInventory(item);
}

public function removeACocksockMenu():void
{
	clearOutput();
	clearMenu();
	showName("\nCOCKWEAR");
	
	if(!pc.hasCock())
	{
		output("You do not have a penis to remove cockwear from!");
		if(inCombat()) addButton(0,"Next",unequipMenu,true);
		else addButton(0,"Next",unequipMenu,false);
		return;
	}
	
	if(pc.cockTotal() == 1)
	{
		if(pc.cocks[0].cocksock is EmptySlot)
		{
			output("You have no cockwear to remove!");
			if(inCombat()) addButton(0,"Next",unequipMenu,true);
			else addButton(0,"Next",unequipMenu,false);
		}
		else if(pc.cocks[0].cocksock.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE))
		{
			output("You cannot remove the current cockwear without outside assistance.");
			if(inCombat()) addButton(0,"Next",unequipMenu,true);
			else addButton(0,"Next",unequipMenu,false);
		}
		else actuallyRemoveACocksock(0);
		return;
	}
	
	output("You look yourself over for cockwear.\n");
	
	var button:Number = 0;
	for(x = 0; x < pc.cockTotal(); x++)
	{
		output("\n\t*(" + (button+1) + ") " + StringUtil.upperCase(num2Ordinal(x+1)) + " Penis (" + Math.floor(pc.cocks[x].cLength()) + "\", " + StringUtil.toDisplayCase(pc.cocks[x].cockColor) + ", " + GLOBAL.TYPE_NAMES[pc.cocks[x].cType] + ")");
		if(!(pc.cocks[x].cocksock is EmptySlot)) output(" - <b>Wearing:</b> " + StringUtil.toDisplayCase(pc.cocks[x].cocksock.longName));
		else output(" - <b>(EMPTY)</b>");
		
		if(pc.cocks[x].cocksock.hasFlag(GLOBAL.ITEM_FLAG_NO_REMOVE)) addDisabledButton(button++,(button) + ": Penis #" + (x+1),StringUtil.upperCase(num2Ordinal(x+1)) + " Penis","You cannot remove that cockwear without outside assistance.");
		else if(pc.cocks[x].cocksock is EmptySlot) addDisabledButton(button++,(button) + ": Penis #" + (x+1),StringUtil.upperCase(num2Ordinal(x+1)) + " Penis","You have no cockwear there!");
		else addButton(button++,(button) + ": Penis #" + (x+1),actuallyRemoveACocksock,x);
	}
	
	while((button < 60) && ((button + 1) % 15 != 0)) { button++; }
	
	if(inCombat()) addButton(button++,"Cancel",unequipMenu,true);
	else addButton(button++,"Cancel",unequipMenu,false);
}

public function actuallyRemoveACocksock(cIdx:int = 0):void
{
	clearOutput();
	showName("COCKWEAR\nREMOVAL");
	output("You gingerly remove your the cockwear from your [pc.cock " + cIdx + "].\n\n");

	var item:ItemSlotClass = new EmptySlot();
	item = pc.cocks[cIdx].cocksock;
	pc.cocks[cIdx].cocksock.onRemove(pc, true);
	pc.cocks[cIdx].cocksock = new EmptySlot();
	
	var unequippedItems:Array = [];
	unequippedItems.push(item);
	itemCollect(unequippedItems);
	if(inCombat()) backToCombatInventory(item);
}

public function keyItemDisplay(filter:String = ""):void
{
	clearOutput();
	clearMenu();
	
	var x:int = 0;
	var btn:int = 0;
	var desc:Boolean = (flags["KEY_ITEM_DESC_OFF"] ? false : true);
	var hasDesc:Boolean = false;
	var hasKey:Boolean = false;
	var hasCoupon:Boolean = false;
	var hasHolodisk:Boolean = false;
	var hasPanty:Boolean = false;
	var hasCollar:Boolean = false;
	var hasRaskLoot:Boolean = false;
	
	output("<b><u>Key Items:</u></b>\n");
	if(pc.keyItems.length > 0) 
	{
		for(x = 0; x < pc.keyItems.length; x++) 
		{
			var pItem:StorageClass = pc.keyItems[x];
			
			if
			(	filter == ""
			||	(filter == "<KEY>" && (pItem.storageName.indexOf(" Key") != -1 || pItem.storageName.indexOf(" Pass") != -1 || pItem.storageName.indexOf(" Membership") != -1))
			||	(filter == "<RASKLOOT>" && InCollection(pItem.storageName, raskLootItems))
			||	pItem.storageName.indexOf(filter) != -1
			)
			{
				output(pItem.storageName + ((desc && pItem.tooltip.length > 0) ? (" - " + pItem.tooltip) : "") + "\n");
				if(pItem.tooltip.length > 0) hasDesc = true;
			}
			if(!hasKey && (pItem.storageName.indexOf(" Key") != -1 || pItem.storageName.indexOf(" Pass") != -1 || pItem.storageName.indexOf(" Membership") != -1)) hasKey = true;
			if(!hasHolodisk && pItem.storageName.indexOf("Holodisk: ") != -1) hasHolodisk = true;
			if(!hasCoupon && pItem.storageName.indexOf("Coupon - ") != -1) hasCoupon = true;
			if(!hasPanty && pItem.storageName.indexOf("Panties - ") != -1) hasPanty = true;
			if(!hasCollar && pItem.storageName.indexOf(" Collar") != -1) hasCollar = true;
			if(!hasRaskLoot && InCollection(pItem.storageName, raskLootItems)) hasRaskLoot = true;
		}
		output("\n");
		
		if(hasHolodisk || hasCoupon || hasPanty || hasCollar || hasRaskLoot)
		{
			if(filter == "") addDisabledButton(btn++, "All");
			else addButton(btn++, "All", keyItemDisplay, "", "Filter: All", "View all Key Items.");
			
			if(hasKey) {
				if(filter == "<KEY>") addDisabledButton(btn++, "Key");
				else addButton(btn++, "Key", keyItemDisplay, "<KEY>", "Filter: Keys", "View all key-type items.");
			}
			if(hasCoupon) {
				if(filter == "Coupon - ") addDisabledButton(btn++, "Coupon");
				else addButton(btn++, "Coupon", keyItemDisplay, "Coupon - ", "Filter: Coupons", "View all coupon items.");
			}
			if(hasHolodisk) {
				if(filter == "Holodisk: ") addDisabledButton(btn++, "Holodisk");
				else addButton(btn++, "Holodisk", keyItemDisplay, "Holodisk: ", "Filter: Holodisks", "View all holodisk items.");
			}
			if(hasPanty) {
				if(filter == "Panties - ") addDisabledButton(btn++, "Panty");
				else addButton(btn++, "Panty", keyItemDisplay, "Panties - ", "Filter: Panties", "View all panty items.");
			}
			if(hasCollar) {
				if(filter == " Collar") addDisabledButton(btn++, "Collar");
				else addButton(btn++, "Collar", keyItemDisplay, " Collar", "Filter: Collars", "View all collar items.");
			}
			if(hasRaskLoot) {
				if(filter == "<RASKLOOT>")
				{
					addDisabledButton(btn++, "Rask Loot");
					hasDesc = false;
					addButton(13, "Dump Loot", removeRaskLootOption, undefined, "Dump Raskvel Loot", "Throw away your raskvel loot.");
				}
				else addButton(btn++, "Rask Loot", keyItemDisplay, "<RASKLOOT>", "Filter: Raskvel Loot", "View all raskvel loot items.");
			}
		}
		if(hasDesc) addButton(13, ("Desc: " + (desc ? "On" : "Off")), keyItemDisplayToggleDesc, filter, "Descriptions", ("Toggle descriptions " + (desc ? "off" : "on") + "."));
	}
	else output("<i>None</i>\n\n");
	
	addButton(14,"Back",inventory);
}
public function keyItemDisplayToggleDesc(filter:String = ""):void
{
	flags["KEY_ITEM_DESC_OFF"] = (flags["KEY_ITEM_DESC_OFF"] ? undefined : true);
	keyItemDisplay(filter);
}
public function equipmentDisplay():void
{
	output("<b><u>Equipment:</u></b>\n");
	output("<b>Melee Weapon:</b> " + StringUtil.toDisplayCase(pc.meleeWeapon.longName) + "\n");
	output("<b>Ranged Weapon:</b> " + StringUtil.toDisplayCase(pc.rangedWeapon.longName) + "\n");
	output("<b>Armor:</b> " + StringUtil.toDisplayCase(pc.armor.longName) + "\n");
	output("<b>Shield:</b> " + StringUtil.toDisplayCase(pc.shield.longName) + "\n");
	output("<b>Accessory:</b> " + StringUtil.toDisplayCase(pc.accessory.longName) + "\n");
	output("<b>Underwear Bottom:</b> " + StringUtil.toDisplayCase(pc.lowerUndergarment.longName) + "\n");
	output("<b>Underwear Top:</b> " + StringUtil.toDisplayCase(pc.upperUndergarment.longName) + "\n\n");
	
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
	output("<b><u>Equipment:</u></b>\n");
	output("<b>Melee Weapon:</b> " + StringUtil.toDisplayCase(pc.meleeWeapon.longName) + "\n");
	output("<b>Ranged Weapon:</b> " + StringUtil.toDisplayCase(pc.rangedWeapon.longName) + "\n");
	output("<b>Armor:</b> " + StringUtil.toDisplayCase(pc.armor.longName) + "\n");
	output("<b>Shield:</b> " + StringUtil.toDisplayCase(pc.shield.longName) + "\n");
	output("<b>Accessory:</b> " + StringUtil.toDisplayCase(pc.accessory.longName) + "\n");
	output("<b>Underwear Bottom:</b> " + StringUtil.toDisplayCase(pc.lowerUndergarment.longName) + "\n");
	output("<b>Underwear Top:</b> " + StringUtil.toDisplayCase(pc.upperUndergarment.longName) + "\n\n");
	
	output("<b><u>Inventory:</u></b> (" + pc.inventory.length + "/" + pc.inventorySlots() + " slots used.)");
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
	else output("\n<i>Empty</i> (" + pc.inventorySlots() + " slots available.)");
	output("\n\n");
}

public function generalInventoryMenu():void
{
	showBust("");
	showName("\nINVENTORY");
	itemScreen = inventory;
	useItemFunction = inventory;
	
	clearOutput();
	if(infiniteItems()) output("<b>\\\[ <span class='lust'>INFINITE ITEM USES IS ON</span> \\\]</b>\n\n");
	output("What item would you like to use?");
	if(pc.inventory.length > 10) output("\n\n" + multiButtonPageNote());
	output("\n\n");
	inventoryDisplay();
	
	clearMenu();
	var btnSlot:int = -5;
	var i:int = 0;
	while (true)
	{
		if (i % 10 == 0 && (i < pc.inventory.length || !i))
		{
			btnSlot += 5;
			addButton(btnSlot+10, "Drop", dropItem, undefined, "Drop Item", "Drop an item to make room in your inventory.");
			addButton(btnSlot+11, "Interact", itemInteractMenu, undefined, "Interact", "Interact with some of your items.");
			addButton(btnSlot+12, "Key Item", keyItemDisplay, undefined, "Key Items", "View your list of key items.");
			addButton(btnSlot+13, "Unequip", unequipMenu, undefined, "Unequip", "Unequip an item.");
			addButton(btnSlot+14, "Back", mainGameMenu);
		}
		
		if (i == pc.inventory.length || pc.inventory[i] == null) break;
		
		addItemButton(btnSlot, pc.inventory[i], useItem, pc.inventory[i]);
		btnSlot++;
		i++;
	}
	
	//Set user and target.
	itemUser = pc;
}

public function itemInteractMenu(counter:Boolean = false):Number
{
	var itemList:Array = [];
	
	// Goo Armor Customization!
	if (hasGooArmorOnSelf()) itemList.push(gooArmorInteractBonus);
	// Siegwulfe stuff!
	if (hasSiegwulfeOnSelf()) itemList.push(siegwulfeInteractBonus);
	// Latex reconfigure
	if (pc.armor is Omnisuit && pc.hasStatusEffect("Rubber Wrapped")) itemList.push(omnisuitMenuBonus);
	// Hardlight Anti-Grav Thong
	if (isWearingHardlightAGThong()) itemList.push(hardlightAGThongBonus);
	
	if(!counter)
	{
		clearOutput();
		clearBust();
		clearMenu();
		showName("\nINTERACT");
		if(itemList.length > 0)
		{
			output("What do you wish to interact with?");
			if(itemList.length > 10) output("\n\n" + multiButtonPageNote());
			
			var itemMessages:String = "";
			var btnSlot:int = -5;
			var i:int = 0;
			
			while (true)
			{
				if (i % 10 == 0 && (i < itemList.length || !i))
				{
					btnSlot += 5;
					addButton(btnSlot+14, "Back", inventory);
				}
				
				if (i == itemList.length) break;
				
				itemMessages += itemList[i](btnSlot);
				btnSlot++;
				i++;
			}
			output(itemMessages);
		}
		else
		{
			output("You don’t have anything from your inventory to interact with!");
			addButton(14, "Back", inventory);
		}
	}
	
	return itemList.length;
}

public function combatInventoryMenu():void
{
	showName("\nINVENTORY");
	itemScreen = inventory;
	useItemFunction = inventory;
	
	clearOutput();
	if(infiniteItems()) output("<b>\\\[ <span class='lust'>INFINITE ITEM USES IS ON</span> \\\]</b>\n\n");
	output("What item would you like to use?");
	if(pc.inventory.length > 10) output("\n\n" + multiButtonPageNote());
	output("\n\n");
	inventoryDisplay();
	equipmentDisplay();
	
	clearMenu();
	var btnSlot:int = -5;
	var i:int = 0;
	while (true)
	{
		if (i % 10 == 0 && (i < pc.inventory.length || !i))
		{
			btnSlot += 5;
			addButton(btnSlot+13, "Unequip", unequipMenu, true, "Unequip", "Unequip an item.");
			addButton(btnSlot+14, "Back", CombatManager.showCombatMenu);
		}
		
		if (i == pc.inventory.length || pc.inventory[i] == null) break;
		
		var tItem:ItemSlotClass = pc.inventory[i];
		if (InCollection(tItem.type, [GLOBAL.MELEE_WEAPON, GLOBAL.RANGED_WEAPON]) || tItem.combatUsable == true)
		{
			addItemButton(btnSlot, pc.inventory[i], combatUseItem, pc.inventory[i]);
		}
		else
		{
			addItemDisabledButton(btnSlot, pc.inventory[i], null, "<i>Cannot be used in combat.</i>");
		}
		btnSlot++;
		i++;
	}
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
			if(pc.hasStatusEffect("Body Paint")) msg = "You can’t afford to put anything on without ruining the paint your body is covered in. You’ll have to wash the paint off or wait until it wears off before trying to wear anything on the item slot.";
			else msg = (pc.hasStatusEffect("Armor Slot Disabled") ? pc.getStatusTooltip("Armor Slot Disabled") : "");
			break;
		case GLOBAL.MELEE_WEAPON:
			msg = (pc.hasStatusEffect("Melee Weapon Slot Disabled") ? pc.getStatusTooltip("Melee Weapon Slot Disabled") : "");
			break;
		case GLOBAL.RANGED_WEAPON:
			msg = (pc.hasStatusEffect("Ranged Weapon Slot Disabled") ? pc.getStatusTooltip("Ranged Weapon Slot Disabled") : "");
			break;
		case GLOBAL.SHIELD:
			msg = (pc.hasStatusEffect("Shield Slot Disabled") ? pc.getStatusTooltip("Shield Slot Disabled") : "");
			break;
		case GLOBAL.ACCESSORY:
			msg = (pc.hasStatusEffect("Accessory Slot Disabled") ? pc.getStatusTooltip("Accessory Slot Disabled") : "");
			break;
		case GLOBAL.LOWER_UNDERGARMENT:
			msg = (pc.hasStatusEffect("Lower Garment Slot Disabled") ? pc.getStatusTooltip("Lower Garment Slot Disabled") : "");
			break;
		case GLOBAL.UPPER_UNDERGARMENT:
			msg = (pc.hasStatusEffect("Upper Garment Slot Disabled") ? pc.getStatusTooltip("Upper Garment Slot Disabled") : "");
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
public function unequip(item:ItemSlotClass, override:Boolean = false):void 
{
	clearOutput();
	
	if(inCombat())
	{
		if(!InCollection(item.type, [GLOBAL.MELEE_WEAPON, GLOBAL.RANGED_WEAPON]))
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
	
	if(!override && !pc.itemSlotUnlocked(item.type))
	{
		itemDisabledMessage(item.type);
		return;
	}
	
	// Not enough shield to remove!
	if((pc.armor.shields < 0 || pc.meleeWeapon.shields < 0 || pc.rangedWeapon.shields < 0 || pc.shield.shields < 0 || pc.accessory.shields < 0 || pc.lowerUndergarment.shields < 0 || pc.upperUndergarment.shields < 0) && ((pc.shieldsMax() - item.shields) < 0))
	{
		output("You will not have sufficient shield capacity to handle your other equipment after removing this item. Please unequip the items using up your shields before removing this item!");
		return;
	}
	
	// Renamed from lootList so I can distinguish old vs new uses
	var unequippedItems:Array = new Array();
	
	switch(item.type)
	{
		case GLOBAL.CLOTHING:
		case GLOBAL.ARMOR:
			if(pc.armor is GooArmor) gooArmorCheck();
			if(pc.armor is Omnisuit) 
			{
				output("Touching a small stud on the collar, you command the Omnisuit to retract. It does so at once, making you shiver and shudder as it disengages from your [pc.skinFurScales]. The crawling latex tickles at first, but with each blob that flows up into the collar, the sensations deaden. Once you’re completely uncovered, the collar hisses and snaps open, falling into a numbed palm. Your sense of touch is vastly diminished without the suit, leading you to wonder if it wouldn’t be better to just put it back on.");
				output("\n\n");
				unequippedItems.push(new OmnisuitCollar());
				pc.removeStatusEffect("Rubber Wrapped");
			}
			else unequippedItems.push(pc.armor);
			pc.armor = new EmptySlot();
			break;
		case GLOBAL.MELEE_WEAPON:
			unequippedItems.push(pc.meleeWeapon);
			pc.meleeWeapon = new Rock();
			break;
		case GLOBAL.RANGED_WEAPON:
			unequippedItems.push(pc.rangedWeapon);
			pc.rangedWeapon = new Rock();
			break;
		case GLOBAL.SHIELD:
			unequippedItems.push(pc.shield);
			pc.shield = new EmptySlot();
			break;
		case GLOBAL.ACCESSORY:
			if(pc.accessory is SiegwulfeItem)
			{
				SiegwulfeUnequip();
				output("\n\n");
			}
			unequippedItems.push(pc.accessory);
			pc.accessory = new EmptySlot();
			break;
		case GLOBAL.LOWER_UNDERGARMENT:
			unequippedItems.push(pc.lowerUndergarment);
			pc.lowerUndergarment = new EmptySlot();
			break;
		case GLOBAL.UPPER_UNDERGARMENT:
			unequippedItems.push(pc.upperUndergarment);
			pc.upperUndergarment = new EmptySlot();
			break;
	}
	
	var i:int = 0;
	for(i = 0; i < unequippedItems.length; i++)
	{
		if(unequippedItems[i].fortification != 0) pc.HP(-1 * unequippedItems[i].fortification);
		unequippedItems[i].onRemove(pc, true);
	}
	
	itemCollect(unequippedItems);
	if(inCombat()) backToCombatInventory(item);
}

// atm, no equippable items have a stacksize > 1, so there is never a possibility that we'd have to split an item stack to equip an item the player holds in their inventory.
public function equipItem(arg:ItemSlotClass):void {
	var targetItem:ItemSlotClass;
	var removedItem:ItemSlotClass;

	if (arg.stackSize > 1) throw new Error("Potential item stacking bug with " + arg.shortName + ". Item has a stacksize > 0 and the equip code cannot currently handle splitting an item stack!");
	
	clearOutput();
	
	if(pc.hasCock() && pc.hasStatusEffect("Priapism") && InCollection(arg.type, [GLOBAL.ARMOR, GLOBAL.CLOTHING, GLOBAL.LOWER_UNDERGARMENT]) && (!arg.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !arg.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) && !arg.hasFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT)))
	{
		//Try to put on crotch cover
		output("No matter how you try, you can’t get a good fit.");
		if(pc.biggestCockLength() < 12) output(" It doesn’t matter how small your phall" + (pc.cocks.length == 1 ? "us is" : "i are") + ", contact with anything but another warm body is torture.");
		else output(" Not that you normally could with how you’re hung, but at least your phall" + (pc.cocks.length == 1 ? "us" : "i") + " would pack away with only mild discomfort instead of full-on agony.");
		output(" So long as you have " + (pc.cocks.length == 1 ? "a priapic erection" : "priapic erections") + ", you won’t be able to wear anything concealing.");
		removedItem = arg;
	}
	else if(arg is Omnisuit || arg is OmnisuitCollar || arg is StrangeCollar)
	{
		if(flags["OMNISUITED"] == undefined)
		{
			output("Putting strange objects around your neck probably isn’t the best idea you’ve had, but then again, neither is running around the most dangerous parts of the galaxy trying to claim a fortune. Pressing a button on the shining band, you pop it open and line it up around your neck. It’s a little tight, but it should fit without crushing your throat. Sucking in a nervous breath, you snap the ends together, feeling a hidden mechanism make a satisfying ‘click’. It warms against your [pc.skinFurScales], pulling tighter and tighter until you fear it might start to choke you. It never does. Just when you’re starting to panic, it stops shrinking.");
			output("\n\nProbing around the edge with a fingertip, you realize that it wasn’t just getting tighter - it was changing shape, molding itself to the exact shape of your neck. There isn’t a single gap where your flesh isn’t kissed by the warm, flexible metal. It hugs your [pc.skinFurScales] tightly, firm and constricting and yet forgiving enough not to pinch as you move around.");
			if(pc.isBro()) output(" You bet you look fuckin’ awesome - butch as hell.");
			else if(pc.isBimbo()) output(" You bet you look sexy as fuck. You wonder if there’s a ring to attach a leash to. The boys would love it.");
			output("\n\n");
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
	// Power armor req
	else if(!InCollection(arg.type, [GLOBAL.ARMOR, GLOBAL.CLOTHING]) && arg.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) && !pc.canUsePowerArmorWeapon())
	{
		output("You are not strong enough to equip your " + arg.longName + "!");
		removedItem = arg;
	}
	// Not enough shield to use!
	else if((arg.shields < 0) && ((pc.shieldsMax() + arg.shields) < 0))
	{
		output("You do not have sufficient shield capacity to equip your " + arg.longName + "! Perhaps you should wear a" + (pc.hasShieldGenerator() ? " more powerful" : "") + " shield generator to help power the item?");
		removedItem = arg;
	}
	else
	{
		//No undies with Omnisuit!
		if(pc.armor is Omnisuit && (arg.type == GLOBAL.LOWER_UNDERGARMENT || arg.type == GLOBAL.UPPER_UNDERGARMENT))
		{
			//Attempt to put something else on
			output("The moment the " + arg.longName + " comes in contact with your suit-enclosed form, you realize that this will never work. The new garment grates distractingly on your sensitized nerves. It’s like trying to wear sandpaper after a decade of nothing but the finest silk. Shaking your head, you yank it off in a hurry. You’ll have to ditch the Omnisuit if you’re going to wear anything else with it. Strange that your backpack and other miscellaneous gear don’t generate the same reaction.");
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
				output("\n\n<b>You are no longer disarmed!</b>");
				pc.removeStatusEffect("Disarmed");
			}
			else
			{
				output("\n\n<b>Once you get your gear back, this will be equipped.</b>");
			}
		}
		if(pc.hasStatusEffect("Gunlock") && arg.type == GLOBAL.RANGED_WEAPON)
		{
			output("\n\n<b>Your new ranged weapon doesn’t suffer from the effects of gunlock!</b>");
			pc.removeStatusEffect("Gunlock");
		}
		//Set the quantity to 1 for the equipping, then set it back to holding - 1 for inventory!
		if(arg.type == GLOBAL.ARMOR || arg.type == GLOBAL.CLOTHING) 
		{
			if(pc.armor is Omnisuit)
			{
				output("\n\nTouching a small stud on the collar, you command the Omnisuit to retract. It does so at once, making you shiver and shudder as it disengages from your [pc.skinFurScales]. The crawling latex tickles at first, but with each blob that flows up into the collar, the sensations deaden. Once you’re completely uncovered, the collar hisses and snaps open, falling into a numbed palm. Your sense of touch is vastly diminished without the suit, leading you to wonder if it wouldn’t be better to just put it back on.");
				pc.removeStatusEffect("Rubber Wrapped");
			}
			if(arg is GooArmor) output("\n\n" + gooArmorInventoryBlurb(arg, "wear"));
			
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
		else output("\n\n<b>AN ERROR HAS OCCURRED: Equipped invalid item type. Item: " + arg.longName + "</b> ");
		
		if(removedItem.fortification != 0) pc.HP(-1 * removedItem.fortification);
		if(arg.fortification != 0) pc.HP(arg.fortification);
		if(!inCombat() && arg.shields != 0) pc.shields(pc.shieldsMax());
		
		removedItem.onRemove(pc, true);
		arg.onEquip(pc, true);
		
		// Special post-onEquip events
		var postMsg:String = "";
		if(arg.hasFlag(GLOBAL.ITEM_FLAG_STRETCHY))
		{
			if(postMsg != "") postMsg += "\n\n";
			postMsg += stretchBonusSexiness(pc, arg, true, true);
		}
		if(postMsg != "") output("\n\n" + postMsg);
	}
	
	//If item to loot after!
	if(removedItem.shortName != "Rock" && removedItem.shortName != "" && removedItem.quantity > 0) 
	{
		output("\n\n");
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

public function itemCollectMainMenu(newLootList:Array, clearScreen:Boolean = false):void
{
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	
	itemCollect(newLootList, clearScreen);
}
public function itemCollect(newLootList:Array, clearScreen:Boolean = false):void 
{
	if(clearScreen) clearOutput();
	
	var target:PlayerCharacter = pc;
	
	//Strip out any emptyslots for when stripping PC nakkers.
	for (var ii:int = 0; ii < newLootList.length; ii++)
	{
		if(newLootList[ii] is EmptySlot) 
		{
			newLootList.splice(ii,1);
			//Back it up since we just yanked our current spot out.
			ii--;
		}		
	}
	//Failsafe: Give the PC a rock if you're somehow collecting nothing.
	if(newLootList.length <= 0) newLootList.push(new Rock());

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
		if (newLootList.length >= 2) addDisabledButton(2,"Use","Use","You cannot use an item while there are more items in the loot queue.");
		else if ((newLootList[0] as ItemSlotClass).hasFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT) || InCollection((newLootList[0] as ItemSlotClass).type, [GLOBAL.PIERCING, GLOBAL.COCKWEAR])) addDisabledButton(2,"Use","Use","You cannot use this item with a full inventory.");
		else if ((newLootList[0] as ItemSlotClass).isUsable != true) addDisabledButton(2,"Use","Use","This item is not usable.");
		else addButton(2,"Use", useLoot, newLootList);
	}
	else
	{			
		output(". The new acquisition");
		if(newLootList[0].quantity > 1) output("s stow");
		else output(" stows");
		output(" away quite easily.");
		
		// Special Events
		if(newLootList[0] is GooArmor) output("\n\n" + gooArmorInventoryBlurb(newLootList[0], "collect"));
		
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
	// Failsafe!
	if(lootList.length <= 0)
	{
		clearOutput();
		output("Error: You have nothing to discard!\n\n");
		clearMenu();
		addButton(0,"Next",lootScreen);
		return;
	}
	
	clearOutput();
	output("You discard " + lootList[0].description + " (x" + lootList[0].quantity + ").");
	
	// Special Events
	if(lootList[0] is GooArmor) output("\n\n" + gooArmorInventoryBlurb(lootList[0], "discard"));
	if(lootList[0] is HorseCock) {
		if(flags["SYNTHSHEATH_LOST"] == undefined) flags["SYNTHSHEATH_LOST"] = 0;
		flags["SYNTHSHEATH_LOST"] += lootList[0].quantity;
	}
	if(lootList[0] is DamagedVIChip && flags["NYM-FOE_REPAIR_QUEST"] == 2) flags["NYM-FOE_REPAIR_QUEST"] = -2;
	
	output("\n\n");
	lootList.splice(0,1);
	clearMenu();
	if(lootList.length > 0) addButton(0,"Next",itemCollect, lootList);
	else addButton(0,"Next",lootScreen);
}

public function replaceItemPicker(lootList:Array):void {
	// Failsafe!
	if(lootList.length <= 0)
	{
		clearOutput();
		output("Error: You have nothing to replace!\n\n");
		clearMenu();
		addButton(0,"Next",lootScreen);
		return;
	}
	
	clearOutput();
	output("You have " + lootList[0].description + " (x" + lootList[0].quantity + ") but there is no room left in your inventory.\n\n");
	output("What will you replace?");
	if(pc.inventory.length > 10) output("\n\n" + multiButtonPageNote());
	output("\n\n");
	inventoryDisplay();
	
	clearMenu();
	var btnSlot:int = -5;
	var i:int = 0;
	while (true)
	{
		if (i % 10 == 0 && (i < pc.inventory.length || !i))
		{
			btnSlot += 5;
			addButton(btnSlot+14, "Back", (function(c_lootList:Array):Function
			{
				return function():void
				{
					itemCollect(c_lootList, true);
				}
			}(lootList)), undefined);
		}
		
		if (i == pc.inventory.length || pc.inventory[i] == null) break;
		
		if(pc.inventory[i].shortName != "")
		{
			addItemButton(btnSlot, pc.inventory[i], replaceItemGo, [i, lootList]); // HAAACK. We can only pass one arg, so shove the two args into an array
		}
		btnSlot++;
		i++;
	}
}

public function useLoot(lootList:Array):void {
	// Failsafe!
	if(lootList.length <= 0)
	{
		clearOutput();
		output("Error: You have nothing to use!\n\n");
		clearMenu();
		addButton(0,"Next",lootScreen);
		return;
	}
	
	var loot:ItemSlotClass = lootList[0];
	
	// Remove equipped items from the list
	// useLoot returns true during an equip-call
	if (useItem(loot))
	{
		if(isEquippableItem(loot)) lootList.splice(0, 1);
	}
	if (loot.quantity <= 0)
	{
		lootList.splice(0, 1);
	}
	
	if (lootList.length > 0)
	{
		output("Loot list looped!\n\n");
		itemCollect(lootList);
	}
}
public function abandonLoot(lootList:Array):void {
	// Failsafe!
	if(lootList.length <= 0)
	{
		clearOutput();
		output("Error: You have nothing to toss out!\n\n");
		clearMenu();
		addButton(0,"Next",lootScreen);
		return;
	}
	
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
	
	// Special Events
	if(pc.inventory[indice] is GooArmor) output("\n\n" + gooArmorInventoryBlurb(pc.inventory[indice], "replace"));
	if(pc.inventory[indice] is HorseCock) {
		if(flags["SYNTHSHEATH_LOST"] == undefined) flags["SYNTHSHEATH_LOST"] = 0;
		flags["SYNTHSHEATH_LOST"] += pc.inventory[indice].quantity;
	}
	if(pc.inventory[indice] is DamagedVIChip && flags["NYM-FOE_REPAIR_QUEST"] == 2) flags["NYM-FOE_REPAIR_QUEST"] = -2;
	
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

	if(shits["SHIP"] != null)
	{
		flags["SHIP_STORAGE_WARDROBE"] = shits["SHIP"].wardrobeSize();
		flags["SHIP_STORAGE_EQUIPMENT"] = shits["SHIP"].equipmentSize();
		flags["SHIP_STORAGE_CONSUMABLES"] = shits["SHIP"].consumableSize();
		flags["SHIP_STORAGE_VALUABLES"] = shits["SHIP"].valuablesSize();
		flags["SHIP_STORAGE_TOYS"] = shits["SHIP"].toysSize();
	}
	
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
	showBust("");
	showName("\nSTORAGE");
	
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
	
	// Installed devices
	var btnSlot:int = 5;
	var installedDevices:Array = [];
	
	if(sidewinderCargoholdExtras()) installedDevices.push(sidewinderCargoholdExtrasBonus);
	if(flags["DONG_DESIGNER_INSTALLED"] == 1) installedDevices.push(installedDickBoxBonus);
	if(flags["EGG_TRAINER_INSTALLED"] == 1) installedDevices.push(installedEggTrainerBonus);
	if(flags["MINDWASH_VISOR_INSTALLED"] == 1) installedDevices.push(installedMindwashBonus);
	if(flags["BADGER_SILICONE_TANK_INSTALLED"] == 1) installedDevices.push(drBadgerSiliconeMiniTankBonus);
	if(flags["SLEEP_FAPNEA_INSTALLED"] == 1) installedDevices.push(installedSleepFapneaBonus);
	
	for(var d:int = 0; d < installedDevices.length; d++)
	{
		installedDevices[d](btnSlot);
		btnSlot++;
		if(btnSlot >= 59 || (d == (installedDevices.length - 1))) break;
		if((btnSlot + 5) % 15 == 0)
		{
			btnSlot += 4;
			addButton(btnSlot, "Back", mainGameMenu);
			btnSlot++;
		}
	}
	if(btnSlot > 14)
	{
		while((btnSlot < 59) && ((btnSlot + 1) % 15 != 0)) { btnSlot++; }
		addButton(btnSlot, "Back", mainGameMenu);
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
		
		addItemButton((btnIdx + pgOset), items[i], func, [items[i], type]);
	}
	
	var menuInserts:int = 0;
	
	do
	{
		if (_shipStorageMode != STORAGE_MODE_TAKE) addButton((menuInserts * 15) + 10, "Take", shipStorageMode, [STORAGE_MODE_TAKE, type], "Take from Ship Storage", "Take items from storage and place them in your inventory.");
		else
		{
			addDisabledButton((menuInserts * 15) + 10, "Take");
		}
		if (_shipStorageMode != STORAGE_MODE_STORE) addButton((menuInserts * 15) + 11, "Store", shipStorageMode, [STORAGE_MODE_STORE, type], "Take from Inventory", "Take items from your inventory and place them in your ship’s storage.");
		else
		{
			addDisabledButton((menuInserts * 15) + 11, "Store");
		}
		
		addButton((menuInserts * 15) + 14, "Back", shipStorageMenuRoot);
		menuInserts++;
	} while (menuInserts <= pgIdx);
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
				if (InCollection(item.type, GLOBAL.SEXTOY, GLOBAL.PIERCING, GLOBAL.COCKWEAR))
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

public function shipOverEncumberedByStorage():Boolean
{
	if(getNumberOfStoredType(pc.ShipStorageInventory, "WARDROBE") > flags["SHIP_STORAGE_WARDROBE"]) 
		return true;
	if(getNumberOfStoredType(pc.ShipStorageInventory, "EQUIPMENT") > flags["SHIP_STORAGE_EQUIPMENT"])
		return true;
	if(getNumberOfStoredType(pc.ShipStorageInventory, "CONSUMABLES") > flags["SHIP_STORAGE_CONSUMABLES"])
		return true;
	if(getNumberOfStoredType(pc.ShipStorageInventory, "VALUABLES") > flags["SHIP_STORAGE_VALUABLES"])
		return true;
	if(getNumberOfStoredType(pc.ShipStorageInventory, "TOYS") > flags["SHIP_STORAGE_TOYS"])
		return true;
	return false;
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
	
	output("\n\n<b>You have " + String(Math.max((flags["SHIP_STORAGE_" + type] - items.length), 0)) + " of " + flags["SHIP_STORAGE_" + type] + " storage slots free.</b>");

	if(items.length > flags["SHIP_STORAGE_" + type]) output("\n<b>You cannot fly with this many items!</b> Please remove at least " + ((items.length - flags["SHIP_STORAGE_" + type]) == 1 ? "one item" : (String(items.length - flags["SHIP_STORAGE_" + type]) + " items")) +  " from your storage.");

	if (items.length > 10) output("\n\n" + multiButtonPageNote());

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
		addButton(0, "Switch", replaceInStorage, [item, type], "Switch Items", "Switch an item in your ship’s storage with one in your inventory.");
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
			addButton(btnSlot+14, "Back", storeItem, args);
		}
		
		if (i == items.length) break;
		
		addItemButton(btnSlot, items[i], doStorageReplace, [invItem, items[i], type]);
		btnSlot++;
		i++;
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
		addButton(0, "Switch", replaceInInventory, [item, type], "Switch Items", "Switch an item in your inventory with one in your ship’s storage.");
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
			addButton(btnSlot+14, "Back", takeItem, args);
		}
		
		if (i == items.length) break;
		
		addItemButton(btnSlot, items[i], doInventoryReplace, [invItem, items[i], type]);
		btnSlot++;
		i++;
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
	
	// Special Events
	if(invItem is GooArmor) output("\n\n" + gooArmorInStorageBlurb(false));
	if(tarItem is GooArmor) output("\n\n" + gooArmorInStorageBlurb());
}

/* Hidden storage stuff */
public function displayHiddenInventory():void
{
	showBust("");
	showName("HIDDEN\nSTORAGE");
	
	clearOutput();
	output("<b><u>Equipment:</u></b>\n");
	output("<b>Melee Weapon:</b> " + StringUtil.toDisplayCase(pc.hiddenMeleeWeapon.longName) + "\n");
	output("<b>Ranged Weapon:</b> " + StringUtil.toDisplayCase(pc.hiddenRangedWeapon.longName) + "\n");
	output("<b>Armor:</b> " + StringUtil.toDisplayCase(pc.hiddenArmor.longName) + "\n");
	output("<b>Shield:</b> " + StringUtil.toDisplayCase(pc.hiddenShield.longName) + "\n");
	output("<b>Accessory:</b> " + StringUtil.toDisplayCase(pc.hiddenAccessory.longName) + "\n");
	output("<b>Underwear Bottom:</b> " + StringUtil.toDisplayCase(pc.hiddenLowerUndergarment.longName) + "\n");
	output("<b>Underwear Top:</b> " + StringUtil.toDisplayCase(pc.hiddenUpperUndergarment.longName) + "\n\n");
	
	output("<b><u>Inventory:</u></b>");
	if(pc.hiddenInventory.length > 0)
	{
		for(var i:int = 0; i < pc.hiddenInventory.length; i++)
		{
			var item:ItemSlotClass = pc.hiddenInventory[i];
			output("\n");
			if (item.stackSize > 1) output(item.quantity + "x ");
			output(StringUtil.toDisplayCase(item.longName));
		}
	}
	else output("\n<i>Empty</i>");
	output("\n\n");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// Take all the things (mainly for testing, really)
public function takeAllItems():void 
{
	pc.takeMeleeWeapon();
	pc.takeRangedWeapon();
	pc.takeArmor();
	pc.takeUpperUndergarment();
	pc.takeLowerUndergarment();
	pc.takeAccessory();
	pc.takeShield();
	pc.takeInventory();
}
// Return and requip all stored items, if any.
public function returnAllItems(autoEquip:Boolean = false, clearScreen:Boolean = false):void 
{
	// Silently auto-equip slots, if possible
	if(autoEquip)
	{
		pc.giveMeleeWeapon();
		pc.giveRangedWeapon();
		pc.giveArmor();
		pc.giveUpperUndergarment();
		pc.giveLowerUndergarment();
		pc.giveAccessory();
		pc.giveShield();
	}
	// Dump all slots to inventory to collect
	else
	{
		pc.moveSlotsToInventory();
	}
	
	// If the item list was filled, collect them to the inventory.
	returnInventoryItems(clearScreen);
}
// Actually collect the items, if any
public function returnInventoryItems(clearScreen:Boolean = false):void 
{
	var itemList:Array = pc.returnInventoryItems();
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	
	if(itemList.length > 0)
	{
		itemCollect(itemList, clearScreen);
	}
	else
	{
		clearMenu();
		addButton(0, "Next", lootScreen);
	}
}
// Auto-queue event if necessary
public function queueReturnAllItems(autoEquip:Boolean = false, clearScreen:Boolean = false):void 
{
	// If any of the hidden sluts are filled or thots anything in the hidden inventory, queue function to return all items.
	// Otherwise, nothing happens.
	if(	!(pc.hiddenMeleeWeapon is EmptySlot)
	||	!(pc.hiddenRangedWeapon is EmptySlot)
	||	!(pc.hiddenArmor is EmptySlot)
	||	!(pc.hiddenUpperUndergarment is EmptySlot)
	||	!(pc.hiddenLowerUndergarment is EmptySlot)
	||	!(pc.hiddenAccessory is EmptySlot)
	||	!(pc.hiddenShield is EmptySlot)
	||	pc.hiddenInventory.length > 0
	) {
		eventQueue.push( function():void {
			if(!clearScreen) output("\n\n");
			returnAllItems(autoEquip, clearScreen);
		} );
	}
}

