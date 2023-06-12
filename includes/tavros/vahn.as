import classes.ShittyShips.ShittyShipGear.Guns.*;
import classes.ShittyShips.ShittyShipGear.Gadgets.*;
import classes.ShittyShips.KihaCorpSpearheadSS;
import classes.ShittyShips.ColtXLR;
import classes.ShittyShips.OvaLEK;
import classes.ShittyShips.MoondastGruss;
import classes.Characters.Vahn;

//Vahn, Your Friendly Ship Mechanic
//By JimT

//Concept
//Vahn Desai is one of the technician that work on your ship. He's a blonde half-Ausar with brown ears, a bushy canine tail (also blonde) and a (slightly modded) phallus. He's lean but muscular, fairly tall, and bisexual. He's often working up a light sweat, and he lives and works on Tavros station.
//Vahn has a fascination for ships, and loves junkers because they break down often.
//He's a switch, fairly easy, and attracted to the PC.
//His cock is terran except for his knot and how long he cums for. This is the result of some slight gene modding.

//Vahn
//Dialogue Menu

// Positioned somewhere in the starting Hanger. 
public function fuckedVahn():Boolean
{
	return (flags["SEXED_VAHN"] != undefined);
}
public function showVahn(nude:Boolean = false):void
{
	showName("\nVAHN");
	if(nude) showBust("VAHN_NUDE");
	else showBust("VAHN");
	author("JimThermic");
}

public function vahnTavrosBonus(btnSlot:int = 0):void 
{
	if(flags["MET_VAHN"] == undefined) {
		if(shits["SHIP"].HP() < shits["SHIP"].HPMax())
		{
			output("\n\nThe blonde, half-ausar technician lets you know that <b>he’ll get to work fixing the damage to your ship’s armor</b>.");
		}
		else output("\n\nYou spot a blonde, half-ausar technician standing next to your ship, looking down at a datapad.");
		addButton(btnSlot, "Tech", VahnTheMechanic);
	}
	else
	{
		if(shits["SHIP"].HP() < shits["SHIP"].HPMax())
		{
			output("\n\nVahn lets you know that <b>he’ll get to work fixing the damage to your ship’s armor</b>.");
		}
		else output("\n\nVahn’s around here somewhere, if you want to look for him.");
		addButton(btnSlot, "Vahn", VahnTheMechanic);
	}
}
public function VahnTheMechanic():void 
{
	clearOutput();
	showVahn();
	shopkeep = chars["VAHN"];
	shopkeep.inventory = [];
	//First Time:
	if(flags["MET_VAHN"] == undefined)
	{
		output("Feeling a bit curious, you walk up to chat to him. When you get close, his brown canine ears perk and he looks up with a brilliant smile. His sandy tail is swishing back and forth.");
		output("\n\n<i>“Hi there, Captain Steele! Nice ship you’ve got here,”</i> the technician cheerfully tells you. He stretches out a hand and you shake it. <i>“I’m Vahn, one of the ground crew assigned to your ship.”</i>");
		output("\n\nYou’ve never heard anyone call your ship ‘nice’. Really, it’s an old clunker. You ask him why he thinks it’s so amazing.");
		output("\n\n<i>“W-well, I guess it’s not from a pilot’s perspective. But for me, your old Casstech Z14 is like a big puzzlebox, always breaking down and a real brain-teaser to fix. Pretty obvious why I became a mechanic, right? It’s really challenging to keep your old clunker going. Sometimes it even stumps the boss, and that’s saying something!”</i>");
		output("\n\nHe deactivates and tucks the pad away, turning his full attention to you. <i>“...So, was there something you want, or just checking up on your ship? Don’t worry, the repair costs are footed by Steele Industries - anything extra, though, and we’d have to charge.”</i>");
		flags["MET_VAHN"] = 1;
		processTime(2);
	}
	//Repeat:
	else
	{
		output("You walk up to Vahn. He’s standing in the hangar next to your ship, checking over its condition. When you walk up, he stops what he’s doing and shoots you a cheery smile. His canine ears are perked and his tail is swishing side to side.");
		output("\n\n<i>“Hey there, ");
		if(fuckedVahn()) output(pc.mf("handsome","beautiful"));
		else output("Captain Steele");
		output("! What can I do you for?”</i>");
		processTime(1);
	}
	//[Appearance] [Talk] [Sex]
	clearMenu();
	addButton(0,"Appearance",appearanceForVahn);
	addButton(1,"Talk",talkToVahn,undefined,"Talk","Talk to the guy.");
	if(pc.lust() >= 33) addButton(2,"Sex",vahnSexMenu,undefined,"Sex","See if this guy is up for a roll in the hay.");
	else addDisabledButton(2,"Sex","Sex","You aren’t aroused enough for sex.");
	addButton(4,"BuyUniforms",buyUniformsFromVahn,undefined,"Buy Uniforms","As a SteeleTech employee, Vahn can probably hook you up with one of the corporate jumpsuits, assuming you want one.");
	addButton(5,"Ship Guns",vahnShipGunsShop,undefined,"Ship Guns","Purchase new weaponry to fit into your ship’s upgrade slots.");
	addButton(6,"Ship Gadgets",vahnShipGadgetShop,undefined,"Ship Gadgets","Purchase new gadgets ");
	addButton(7,"Uninstall",vahnShipUninstall,undefined,"Uninstall","Uninstall and sell one of your currently installed upgrades/weapons.");
	if(!shits["SHIP"].hasPerk("No Rename")) addButton(8,"Name Ship",vahnNamesShips,undefined,"Name Ship","Rename your ship.");
	else addDisabledButton(8,"Name Ship","Name Ship","You lack the legal authority to name this vessel.");
	addButton(10,"Buy Ship",vahnSellsShips,undefined,"Buy Ship","Buy a ship the local selection.");
	if(shipStorageRoom() < shipStorageLimit()) addButton(11,"Stored Ships",storageShipsMenu,undefined,"Stored Ships","Examine your stored ships. You may swap out your current ship for one in storage at your leisure.");
	else addDisabledButton(11,"Stored Ships","Stored Ships","You have no ships in storage right now.");
	addButton(12,"Sell A Ship",sellAShipToVahn,undefined,"Sell A Ship","Sell a ship to Vahn.");
	addButton(14,"Leave",mainGameMenu);
}

public function buyUniformsFromVahn():void
{
	clearOutput();
	showVahn();
	author("Fenoxo");
	shopkeep = chars["VAHN"];
	var suity:ItemSlotClass = new SteeleTechSuit();
	suity.basePrice = 4500;
	shopkeep.inventory = [new SteeleTechSuit()];

	shopkeep.keeperBuy = "You ask Vahn if she can sell you any SteeleTech uniforms.";
	output("\n\n<i>“Of course! Be my guest.”</i>\n");
	buyItem();
}


public function sellAShipToVahn():void
{
	clearOutput();
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	output("What ship would you like to sell?");
	
	clearMenu();
	var btnSlot:int = 0;
	var storageLimit:int = shipStorageLimit();
	
	output("\n\n<b><u>Owned Vessels</u>:</b>");
	output("\n\\\[Cannot Sell\\\] " + shits["SHIP"].short);
	addDisabledButton(btnSlot++,shits["SHIP"].short,shits["SHIP"].short,"You can’t sell your ship without first lining up a replacement.");
	
	for(var i:int = 0; i < storageLimit; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", VahnTheMechanic);
			btnSlot++;
		}
		if(btnSlot >= 60) break;
		
		var shipID:String = String("SHIP_" + (i+2));
		buildVahnsSellButtonsAndText(btnSlot,shipID);
		btnSlot++;
		
		if(storageLimit > 14 && (i + 1) == storageLimit)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", VahnTheMechanic);
		}
	}

	addButton(14,"Back",VahnTheMechanic);
}
public function vahnShipSellPrice(ship:ShittyShip):Number
{
	return Math.round(ship.shipCost()/2);
}
public function buildVahnsSellButtonsAndText(button:int,arg:String):void
{
	if(shits[arg] == undefined) 
	{
		output("\n\\\[0 Credits\\\] Empty Storage - 0");
		addDisabledButton(button,"Empty","Empty","You need something here to sell.");
	}
	else if(shits[arg] is Casstech)
	{
		output("\n\\\[Cannot Sell\\\] " + shits[arg].short);
		addDisabledButton(button,shits[arg].short,shits[arg].short,"You can’t sell Dad’s old Casstech!");
	}
	else if(!canAbandonShip(shits[arg]))
	{
		output("\n\\\[Cannot Sell\\\] " + shits[arg].short);
		addDisabledButton(button,shits[arg].short,shits[arg].short,"You cannot sell that vessel!");
	}
	else
	{
		var price:Number = vahnShipSellPrice(shits[arg]);
		output("\n\\\[" + price + " Credits\\\] " + shits[arg].short);
		addShipCompareButton(button,shits["SHIP"],shits[arg],shits[arg].short,sellAShipToVahnCheck,arg,shits[arg].short,"Sell this ship for " + price + " credits.");
	}
}

public function sellAShipToVahnCheck(slot:String):void
{
	if(!kGAMECLASS.gameOptions.vendorToggle) return sellAShipToVahnGo(slot);
	
	clearOutput();

	output("Are you sure you want to sell " + shits[slot].a + shits[slot].short + " for " + vahnShipSellPrice(shits[slot]) + " credits?");
	output("\n\n" + shipCompareString(shits["SHIP"], shits[slot]));
	output("\n\n");
	
	clearMenu();
	addButton(0,"Yes",sellAShipToVahnGo,slot);
	addButton(1,"No",sellAShipToVahn);
}
public function sellAShipToVahnGo(slot:String):void
{
	clearOutput();
	//showBust(shopkeep.bustDisplay);
	//showName("\n"+shopkeep.short.toUpperCase());

	showBust(shits[slot].bustDisplay);
	showName("\n"+shits[slot].short.toUpperCase());
	
	var price:Number = vahnShipSellPrice(shits[slot]);
	output("You sell your " + shits[slot].short + " for " + price + " credits.");
	pc.credits += price;
	shits[slot] = undefined;
	clearMenu();
	addButton(0,"Next",sellAShipToVahn);
}

public function vahnShipGunsShop():void
{
	clearOutput();
	showVahn();
	shopkeep = chars["VAHN"];
	shopkeep.inventory = [];
	shopkeep.inventory.push(new MGun());
	shopkeep.inventory.push(new EMCannon());
	shopkeep.inventory.push(new LCannon());
	shopkeep.inventory.push(new ThermalProjector());
	buyShipFitItem();
}
public function vahnShipGadgetShop():void
{
	clearOutput();
	showVahn();
	shopkeep = chars["VAHN"];
	shopkeep.inventory = [];
	shopkeep.inventory.push(new RepairModule());
	shopkeep.inventory.push(new ShieldBoosterForShips());
	shopkeep.inventory.push(new ShieldDisruptor());
	buyShipFitItem();
}
public function vahnShipUninstall():void
{
	clearOutput();
	showVahn();
	shopkeep = chars["VAHN"];
	shopkeep.inventory = [];
	unfitShipItem();
}

public function vahnNamesShips(back:Boolean = false):void
{
	clearOutput();
	showVahn();
	if(!back)
	{
		output("You ask Vahn if he can register a custom ship name for you.");
		output("\n\nVahn swings up his codex and nods. <i>“You bet. There’s a 300 credit registration fee, but if you can afford that, you can call whatever your heart desires, and everyone else will have to too.”</i>");
	}
	else
	{
		output("What else do you want to rename your ship as?");
		output("\n\nRemember, there is a 300 credit registration fee if you continue with the new name.");
	}
	displayInput();
	userInterface.textInput.text = String(shits["SHIP"].short);
	clearMenu();
	if(pc.credits >= 300) addButton(0,"Rename",renameYourShip,undefined,"Rename","Rename your ship.\n\n300 credit cost.");
	else addDisabledButton(0,"Rename","Rename","You can’t afford that.\n\n300 credit cost.");
	addButton(14,"Back",backToVahnFromNaming);
}
public function backToVahnFromNaming():void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	VahnTheMechanic();
}

public function renameYourShip():void
{
	clearOutput();
	showVahn();
	if(userInterface.textInput.text == "" || userInterface.textInput.text.toLowerCase() == shits["SHIP"].a)
	{
		output("<b>You must enter <i>something</i>.</b>");

		displayInput();
		userInterface.textInput.text = String(shits["SHIP"].short);
		return;
	}
	if(stage.contains(userInterface.textInput)) removeInput();
	var shipName:String = userInterface.textInput.text;
	// Smartly crop out double articles, if possible
	if(shits["SHIP"].a != "" && (shipName.toLowerCase()).indexOf(shits["SHIP"].a) == 0)
	{
		shipName = shipName.slice(shits["SHIP"].a.length, shipName.length);
		userInterface.textInput.text = shipName;
	}
	output("Your ship’s new name will be: <i>" + shits["SHIP"].capitalA + userInterface.textInput.text + "</i>");
	output("\n\nAre you sure you want to register it with this name?");
	clearMenu();
	addButton(0,"Yes",renameYourShipGo);
	addButton(1,"No",vahnNamesShips,true);
}
public function renameYourShipGo():void
{
	clearOutput();
	showVahn();
	output("After transferring the neccessary 300 credits to Vahn, the ausar mechanic fiddles with his Codex and registers your vessel’s new name.");
	shits["SHIP"].short = userInterface.textInput.text;
	output("\n\n<b>Your ship’s name is now <i>" + shits["SHIP"].capitalA + shits["SHIP"].short + "</i>.</b>");
	if(stage.contains(userInterface.textInput)) removeInput();
	pc.credits -= 300;
	clearMenu();
	addButton(0,"Next",VahnTheMechanic);
}

public function vahnSellsShips(back:Boolean = false):void
{
	clearOutput();
	showVahn();
	shopkeep = chars["VAHN"];
	shopkeep.inventory = [];
	author("Fenoxo");
	if(!back)
	{
		if(flags["VAHN_SHIP_SALES"] == undefined)
		{
			output("You ask Vahn if he can sell you a whole new ship.");

			output("\n\n<i>“Of course. I can sell you a whole hangar’s worth, if you like.”</i> Vahn spreads his arms wide. <i>“Your dad rented out enough space for you to park your own little squadron here, if you like.”</i>");
			if(shits["SHIP"] is Casstech) 
			{
				output(" He glances back at the venerable Casstech. <i>“It’ll be a shame to put the old bird in storage. Oh, yeah - I can’t buy her off you. Boss’s orders.”</i>");
				output("\n\nYou nod along. Of course Dad wouldn’t want you selling such a sentimental piece.");
			}
			output("\n\nVahn taps a few buttons, and your Codex springs to life, displaying a catalog of local spacecraft. <i>“Take your pick.”</i>");
		}
		else
		{
			output("You tell Vahn you’d like to go ship-shopping again.");
			output("\n\n<i>“Not a problem,”</i> the mechanic says, stretching out to tap a few buttons and transmit the local catelog to your Codex. <i>“Take your pick.”</i>");
		}
	}
	else
	{
		output("What ship are you interested in buying?");
	}
	clearMenu();
	//Initialize all ships, pass to tooltip generating func.
	var ships:Array = [];
	ships.push(["Ova’LEK", "Ova’LEK", new OvaLEK()]);
	ships.push(["Colt XLR", "Colt XLR", new ColtXLR()]);
	ships.push(["Spearhead SS", "Spearhead SS", new KihaCorpSpearheadSS()]);
	for(var i:int = 0; i < ships.length; i++)
	{
		addShipCompareButton(i,shits["SHIP"],ships[i][2],ships[i][0],shipBuyScreen,ships[i][2],ships[i][1]);
	}
	addButton(13,"Current Ship",shipStatistics,vahnSellsShipsBack,"Current Ship Stats","Look over your ship and its equipped modules.");
	addButton(14,"Back",VahnTheMechanic);
}
public function vahnSellsShipsBack():void { return vahnSellsShips(true); }

public function shipTradeInPrice(ship:ShittyShip):Number
{
	return Math.round(ship.shipCost()/2);
}
public function canAbandonShip(ship:ShittyShip):Boolean
{
	if(ship.hasPerk("No Sell")) return false;
	if(olympiaIsCrew() && ship is Sidewinder) return false;
	return true;
}
public function shipBuyScreen(arg:ShittyShip):void
{
	clearOutput();
	showBust(arg.bustDisplay);
	showName("\n"+arg.short.toUpperCase());
	
	var ship:ShittyShip = shits["SHIP"];

	output("Your Codex prompts you to review the information on this ship thoroughly before attempting a selection.\n\n" + shipCompareString(ship, arg));
	output("\n\n");
	
	clearMenu();
	
	if(shopkeep is Dockmaster) addDisabledButton(0,"Buy","Buy","Since there isn’t any storage available for your ships in Novahome, you’ll have to make your purchase with a trade-in.");
	else if(shopkeep is Focalor) addDisabledButton(0,"Buy","Buy","Since there isn’t any storage available for your ships in Myrellion, you’ll have to make your purchase with a trade-in.");
	else if(shipStorageRoom() > 0)
	{
		if(pc.credits >= arg.shipCost()) addButton(0,"Buy",buyAShipYouGo,arg,"Buy","Buy " + arg.a + arg.short + ".\n\n<b><u>Price</u>:</b> " + arg.shipCost() + " credits");
		else addDisabledButton(0,"Buy","Buy","You can’t afford that!");
	}
	else addDisabledButton(0,"Buy","Buy","You don’t have room to place your current ship in storage. You’ll have to sell one of your stored ships (or trade this one in with the purchase).");
	
	var tradeInPrice:Number = shipTradeInPrice(shits["SHIP"]);
	var totalCost:Number = (arg.shipCost()-tradeInPrice);
	if(shits["SHIP"] is Casstech && shopkeep is Vahn) addDisabledButton(1,"Buy+Trade","Buy and Trade","You cannot trade in your Casstech. Vahn won’t take it.");
	else if(!canAbandonShip(ship)) addDisabledButton(1,"Buy+Trade","Buy and Trade","You cannot trade this ship.");
	else if(pc.credits >= totalCost) addButton(1,"Buy+Trade",buyAShipAndTradeIn,arg,"Buy and Trade","Trade in your current ship to help you pay for the new one.\n\n<b><u>Trade-In Price</u>:</b> " + totalCost + " credits");
	else addDisabledButton(1,"Buy+Trade","Buy and Trade","You still can’t afford the ship this way.\n\n<b><u>Trade-In Price</u>:</b> " + totalCost + " credits");

	//else addButton(1,"Buy+Trade",);
	if(shopkeep is Vahn) addButton(14,"Back",vahnSellsShips);
	else if(shopkeep is Focalor) addButton(14,"Back",focalorApproach);
	else if(shopkeep is Dockmaster) addButton(14,"Back",buyAShipFromTrashRat);
	else addButton(14,"Back",mainGameMenu);
}

public function buyAShipAndTradeIn(arg:ShittyShip):void
{
	clearOutput();
	showBust(arg.bustDisplay);
	showName("\n"+arg.short.toUpperCase());
	output("Once you fully commit, " + shopkeep.short + " informs you that your stored personal items will be moved to the new ship. Installed upgrades will not, though their value will be counted into your trade-in.");
	var tradeInPrice:Number = shipTradeInPrice(shits["SHIP"]);
	var totalCost:Number = (arg.shipCost()-tradeInPrice);
	output("\n\n<b>New Ship Cost: </b>" + arg.shipCost() + " Credits\n<b>Old Ship Value: </b>" + tradeInPrice + " Credits\n<b>Total Cost: </b>" + totalCost +" Credits\n\nDo you trade it in? (<b>Warning:</b> This cannot be reversed.)");
	clearMenu();
	addButton(0,"Trade In",buyAShipAndTradeInGo,arg,"Trade In","Get you a new ship!");
	addButton(14,"Back",shipBuyScreen,arg);
}
public function buyAShipAndTradeInGo(arg:ShittyShip):void
{
	clearOutput();
	showBust(arg.bustDisplay);
	showName("\n"+arg.short.toUpperCase());
	var cost:Number = (arg.shipCost()-shipTradeInPrice(shits["SHIP"]));
	if(cost < 0) output("<b>You make a profit of " + Math.abs(cost) + " off of the trade-in, receiving a new " + arg.short + ".");
	else if(cost == 0) output("<b>You pay nothing for your new ship</b>, covering the cost by trading in your old vessel.");
	else output("<b>You pay " + cost + " credits for " + arg.a + arg.short + "</b> after selling your " + shits["SHIP"].short + "!");
	pc.credits -= cost;
	shits["SHIP"] = arg;
	arg.HP(arg.HPMax());
	processTime(25);
	clearMenu();
	if(shopkeep is Dockmaster) addButton(0,"Next",raskvelDockmaster,true);
	else if(shopkeep is Focalor) addButton(14,"Back",focalorApproach);
	else addButton(0,"Next",VahnTheMechanic);
}

public function buyAShipYouGo(arg:ShittyShip):void
{
	clearOutput();
	showBust(arg.bustDisplay);
	showName("\n"+arg.short.toUpperCase());
	output("Once you fully commit, Vahn informs you that it’s station policy to ensure that inactivated ships have their storage completely emptied out. Ever since the entire deck got infested with grubthakks a few years back, it’s been something of a sore spot. <i>“Don’t worry too hard about it. Bolted-in upgrades are fine, and I’ll have your smaller things delivered to the new ship.”</i>");
	output("\n\n<b>You pay " + arg.shipCost() + " credits for " + arg.a + arg.short + "!</b>");
	pc.credits -= arg.shipCost();
	storeYourShip();
	shits["SHIP"] = arg;
	arg.HP(arg.HPMax());
	processTime(25);
	clearMenu();
	addButton(0,"Next",VahnTheMechanic);
}

public function storageShipsMenu():void
{
	clearOutput();
	shopkeep = chars["VAHN"];
	shopkeep.inventory = [];
	showBust(shopkeep.bustDisplay);
	showName("\n"+shopkeep.short.toUpperCase());
	showName("SHIP\nSTORAGE");
	var storageLimit:int = shipStorageLimit();
	output("<b>Available Storage:</b> " + shipStorageRoom() + " / " + storageLimit + ".");
	clearMenu();
	var btnSlot:int = 0;
	var i:int = 0;
	
	/*if(shits["SHIP"] != undefined)
	{
		output("\n\n<b><u>Docked Vessel</u>:</b> " + shits["SHIP"].short);
		addShipCompareButton(btnSlot,shits["SHIP"],shits["SHIP"],shits["SHIP"].short,storageShipsCheck,"SHIP",shits["SHIP"].short);
		btnSlot++;
	}*/
	output("\n\n<b><u>Stored Vessels</u>:</b>");
	for(i = 0; i < storageLimit; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", VahnTheMechanic);
			btnSlot++;
		}
		if(btnSlot >= 60) break;
		
		var shipID:String = String("SHIP_" + (i+2));
		if(shits[shipID] != undefined)
		{
			var shipA:ShittyShip = shits["SHIP"];
			var shipB:ShittyShip = shits[shipID];
			output("\n" + shits[shipID].short);
			addShipCompareButton(btnSlot,shipA,shipB,shipB.short,storageShipsCheck,shipID,shipB.short);
			btnSlot++;
		}
		else
		{
			output("\n\\\[Empty Storage\\\]");
			addDisabledButton(btnSlot,"Empty","Empty","There is no ship stored here.");
			btnSlot++;
		}
		
		if(storageLimit > 14 && (i + 1) == storageLimit)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", VahnTheMechanic);
		}
	}
	
	addButton(14,"Back",VahnTheMechanic);
}
public function storageShipsCheck(arg:String):void
{
	clearOutput();
	showBust(shits[arg].bustDisplay);
	showName("\n"+shits[arg].short.toUpperCase());
	clearMenu();
	
	output(shipCompareString(shits["SHIP"], shits[arg]));
	output("\n\n");
	
	shipEquipmentButtons(shits[arg], storageShipsMenu);
	
	if(arg != "SHIP") addButton(13,"Swap Ships",swapShips,arg,("Swap To "+shits[arg].short),"Swap out your current ship for this one.");
	addButton(14,"Back",storageShipsMenu);
}
public function swapShips(arg:String):void
{
	clearOutput();
	showBust(shits[arg].bustDisplay);
	showName("\n"+shits[arg].short.toUpperCase());
	output("You swap " + shits["SHIP"].a + shits["SHIP"].short + " for " + shits[arg].a + shits[arg].short + ".");
	var tempShip:ShittyShip = shits[arg];
	shits[arg] = shits["SHIP"];
	shits["SHIP"] = tempShip;
	clearMenu();
	addButton(0,"Next",storageShipsMenu);
}

public function shipStorageLimit():Number { return 5; }
public function shipStorageRoom():Number
{
	var count:Number = 0;
	for(var i:int = 0; i < shipStorageLimit(); i++)
	{
		var shipID:String = String("SHIP_" + (i+2));
		if(shits[shipID] == undefined) count++;
	}
	return (count);
}
public function storeYourShip():void
{
	var shipID:String = "";
	for(var i:int = 0; i < shipStorageLimit(); i++)
	{
		shipID = String("SHIP_" + (i+2));
		if(shits[shipID] == undefined) break;
	}
	var tempShip:ShittyShip = shits["SHIP"];
	output("\n\nYour old vessel, " + tempShip.a + tempShip.short + ", is placed into storage.");
	if(shipID != "") shits[shipID] = tempShip;
}
//this simply adds a ship into storage
public function vahnAddAShip(newShip:ShittyShip = null):void
{
	if (newShip == null) return;
	if (shipStorageRoom() <= 0)
	{
		output("\n\nThere is no room in storage for " + newShip.a + newShip.short + ".");
		return;
	}
	var shipID:String = "";
	for(var i:int = 0; i < shipStorageLimit(); i++)
	{
		shipID = String("SHIP_" + (i+2));
		if(shits[shipID] == undefined) break;
	}
	output("\n\nThe vessel, " + newShip.a + newShip.short + ", is placed into storage.");
	if(shipID != "") shits[shipID] = newShip;
}

// Compares ship and newShip, ttBody text optional for custom tooltip.
public function addShipCompareButton(slot:int, ship:ShittyShip = null, newShip:ShittyShip = null, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
{
	if(!ttBody) ttBody = ((ship && newShip) ? shipCompareDesc(ship, newShip) : null);
	var ttCompare:String = ((ship && newShip) ? shipCompareStat(ship, newShip) : null);
	
	addCompareButton(slot, cap, func, arg, ttHeader, ttBody, ttCompare);
}
public function shipCompareString(ship:ShittyShip, newShip:ShittyShip):String
{
	var shipTooltip:String = "";
	
	shipTooltip += shipCompareDesc(ship, newShip, false);
	shipTooltip += "\n\n";
	shipTooltip += shipCompareStat(ship, newShip, false);
	
	return shipTooltip;
}
public function shipEquipmentButtons(arg:ShittyShip, backFunc:Function, execFunc:Function = null):void
{
	var i:int = 0;
	var btnSlot:int = 0;
	var items:Array = [];
	
	if(!(arg.shield is EmptySlot)) items.push(arg.shield);
	if(!(arg.armor is EmptySlot)) items.push(arg.armor);
	if(!(arg.meleeWeapon is EmptySlot)) items.push(arg.meleeWeapon);
	if(!(arg.rangedWeapon is EmptySlot)) items.push(arg.rangedWeapon);
	if(!(arg.accessory is EmptySlot)) items.push(arg.accessory);
	if(!(arg.lowerUndergarment is EmptySlot)) items.push(arg.lowerUndergarment);
	if(!(arg.upperUndergarment is EmptySlot)) items.push(arg.upperUndergarment);
	for(i = 0; i < arg.inventory.length; i++)
	{
		if(!(arg.inventory[i] is EmptySlot)) items.push(arg.inventory[i]);
	}
	
	for(i = 0; i < items.length; i++)
	{
		if(btnSlot >= 9 && (btnSlot + 5) % 15 == 0)
		{
			btnSlot += 4;
			addButton(btnSlot, "Back", backFunc);
			btnSlot++;
		}
		if(btnSlot >= 60) break;
		
		addItemButton(btnSlot, items[i], execFunc, (execFunc != null ? arg : undefined), null, null, null, pc);
		btnSlot++;
		
		if(items.length > 9 && (i + 1) == items.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", backFunc);
		}
	}
}
public function shipCompareDesc(ship:ShittyShip, newShip:ShittyShip, buttonTooltip:Boolean = true):String
{
	var shipTooltip:String = "";
	var i:int = 0;
	
	//Appearance compare. Might need cut.
	if(!buttonTooltip)
	{
		if(newShip != ship) shipTooltip += "<b>Select Ship:</b> ";
		else shipTooltip += "<b>Your Ship:</b> ";
		shipTooltip += "<i>" + newShip.capitalA + newShip.short + "</i>";
		shipTooltip += "\n" + newShip.long;
	}
	else
	{
		var charCount:int = 128;
		for(i = 0; i < newShip.long.length; i++)
		{
			charCount--;
			if(charCount <= 0 && InCollection(newShip.long.charAt(i), [" ",".",",",";","!","?"]))
			{
				if(i < newShip.long.length) shipTooltip += " \\\[...\\\]";
				break;
			}
			shipTooltip += newShip.long.charAt(i);
		}
	}
	return shipTooltip;
}
public function shipCompareStat(ship:ShittyShip, newShip:ShittyShip, buttonTooltip:Boolean = true):String
{
	var shipTooltip:String = "";
	var i:int = 0;
	
	shipTooltip += "<b>Shields: </b>" + shipStatCompare(newShip.shieldsMax(), ship.shieldsMax());
	shipTooltip += "\n<b>Shield Def: </b>" + shipStatCompare(newShip.shieldDefense(), ship.shieldDefense());
	shipTooltip += "\n<b>Armor: </b>" + shipStatCompare(newShip.HPMax(), ship.HPMax());
	shipTooltip += "\n<b>Armor Def: </b>" + shipStatCompare(newShip.defense(), ship.defense());
	shipTooltip += "\n<b>Max Energy: </b>" + shipStatCompare(newShip.energyMax(), ship.energyMax());
	shipTooltip += "\n<b>Power Generation: </b>" + shipStatCompare(newShip.shipPowerGen(), ship.shipPowerGen());
	
	//Agility
	shipTooltip += "\n\n<b>Agility: </b>" + shipStatCompare(newShip.shipAgility(), ship.shipAgility());
	//Sensors
	shipTooltip += "\n<b>Sensors: </b>" + shipStatCompare(newShip.shipSensors(), ship.shipSensors());
	//Systems
	shipTooltip += "\n<b>Systems: </b>" + shipStatCompare(newShip.shipSystems(), ship.shipSystems());
	//Thrust
	shipTooltip += "\n<b>Thrust: </b>" + shipStatCompare(newShip.shipThrust(), ship.shipThrust());
	
	if(!buttonTooltip)
	{
		//Accuracy
		shipTooltip += "\n\n<b>Accuracy: </b>" + shipStatCompare(newShip.shipAccuracy(), ship.shipAccuracy());
		//Evasion
		shipTooltip += "\n<b>Evasion: </b>" + shipStatCompare(newShip.shipEvasion(), ship.shipEvasion());
	}
	
	if(!buttonTooltip)
	{
		shipTooltip += "\n";
		shipTooltip += "\n<b>Wardrobe Capacity: </b>" + shipStatCompare(newShip.wardrobeSizeRaw, ship.wardrobeSizeRaw);
		shipTooltip += "\n<b>Equipment Capacity: </b>" + shipStatCompare(newShip.equipmentSizeRaw, ship.equipmentSizeRaw);
		shipTooltip += "\n<b>Consumables Capacity: </b>" + shipStatCompare(newShip.consumableSizeRaw, ship.consumableSizeRaw);
		shipTooltip += "\n<b>Valuables Capacity: </b>" + shipStatCompare(newShip.valuablesSizeRaw, ship.valuablesSizeRaw);
		shipTooltip += "\n<b>Toys Capacity: </b>" + shipStatCompare(newShip.toysSizeRaw, ship.toysSizeRaw);
	}
	
	// Slot Status
	if(!buttonTooltip && newShip == ship)
	{
		shipTooltip += "\n";
		shipTooltip += "\n<b>Unused Upgrade Slots: </b>" + (ship.shipCapacity()-ship.inventory.length);
		shipTooltip += "\n<b>Unused Weapon Hardpoints: </b>" + (ship.shipGunCapacity() - ship.listShipWeapons().length);
		shipTooltip += "\n<b>Current Crew Capacity: </b>" + ship.shipCrewCapacity();
	}
	
	//Upgrades/Crew: shipCapacityRaw
	shipTooltip += "\n\n<b>Module/Crew Capacity: </b>" + shipStatCompare(newShip.shipCapacity(), ship.shipCapacity());
	if(newShip.bonusCrewCapacity() > 0 || ship.bonusCrewCapacity() > 0) shipTooltip += "\n<b>Bonus Crew Capacity: </b>" + shipStatCompare(newShip.bonusCrewCapacity(true), ship.bonusCrewCapacity(true));

	//Upgrades Installed
	shipTooltip += "\n<b>Weapon Capacity: </b>" + shipStatCompare(newShip.shipGunCapacity(), ship.shipGunCapacity());
	shipTooltip += "\n\n<b>Modules Installed: </b>";

	for(i = 0; i < newShip.inventory.length; i++)
	{
		if(i > 0) shipTooltip += ", ";
		shipTooltip += StringUtil.toTitleCase(newShip.inventory[i].longName);
	}
	
	if(newShip.inventory.length == 0) shipTooltip += "None.";
	else shipTooltip += ".";

	if(newShip != ship)
	{
		shipTooltip += "\n(<b>Old Ship:</b> ";
		for(i = 0; i < ship.inventory.length; i++)
		{
			if(i > 0) shipTooltip += ", ";
			shipTooltip += StringUtil.toTitleCase(ship.inventory[i].longName);
		}
		if(ship.inventory.length == 0) shipTooltip += "None.)";
		else shipTooltip += ".)";
	}

	//Fixed Equipment
	shipTooltip += "\n\n<b>Fixed Equipment:</b> ";
	var equipment:Array = newShip.getFixedEquipment();
	equipment = removeEmptySlotItems(equipment);
	for(i = 0; i < equipment.length; i++)
	{
		if(i > 0) shipTooltip += ", ";
		shipTooltip += StringUtil.toTitleCase(equipment[i].longName);
	}
	if(equipment.length == 0) shipTooltip += "None.";
	else shipTooltip += ".";
	
	if(newShip != ship)
	{
		equipment = ship.getFixedEquipment();
		equipment = removeEmptySlotItems(equipment);
		shipTooltip += "\n(<b>Old Ship:</b> ";
		for(i = 0; i < equipment.length; i++)
		{
			if(i > 0) shipTooltip += ", ";
			shipTooltip += StringUtil.toTitleCase(equipment[i].longName);
		}
		if(equipment.length == 0) shipTooltip += "None.)";
		else shipTooltip += ".)";
	}
	
	shipTooltip += "\n\n<b><u>Purchase Cost</u>:</b>";
	shipTooltip += " " + shipStatCompare(newShip.shipCost(), ship.shipCost());
	if(!canAbandonShip(newShip) || !canAbandonShip(ship)) shipTooltip += ", <i>Cannot Sell!</i>";
	if(newShip != ship)
	{
		shipTooltip += "\n<b><u>w/Trade In</u>:</b> " + (newShip.shipCost()-shipTradeInPrice(ship));
		if(!canAbandonShip(newShip) || !canAbandonShip(ship)) shipTooltip += ", <i>Cannot Trade!</i>";
	}
	
	if(buttonTooltip) return "<span class='words'><p>" + shipTooltip + "</p></span>";
	return shipTooltip;
}

public function removeEmptySlotItems(arg:Array):Array
{
	for(var i:int = arg.length-1; i >= 0; i--)
	{
		if(arg[i] is EmptySlot) arg.splice(i,1);
	}
	return arg;
}

public function shipStatCompare(newVal:Number,old:Number,lowGood:Boolean = false):String
{
	var texty:String = "";
	texty += newVal;
	var statDiff:Number = (newVal - old);
	
	texty += " (";
	if (statDiff < 0)
	{
		texty += "<span class='bad'><b>" + statDiff + "</b></span>";
	}
	else if (statDiff > 0)
	{
		texty += "<span class='good'><b>+" + statDiff + "</b></span>";
	}
	else if (statDiff == 0)
	{
		texty += "<span class='words'><b>" + statDiff + "</b></span>";
	}
	texty += ")";
	
	return texty;
}

//Appearance
public function appearanceForVahn():void
{
	clearOutput();
	showVahn();
	output("Looking Vahn over from head to toe, he’d definitely qualify as ‘handsome’ under those oil-stained cheeks. The half-ausar male is usually smiling, bright teeth flashing with good humor as he works up a sweat over your rusty spaceship. He has chestnut-hued canine ears and sandy blonde hair, which looks perpetually tousled. His blonde tail swishes behind him.");
	output("\n\nThe hard-working ausar stands six feet tall and has a lean yet muscular build. All those hours of hard labor repairing starships have perfectly tuned his body, as well as your vessel. His eyes are a glimmering green, filled with obvious intelligence - it takes brains to know how to properly calibrate a sublight drive!");
	output("\n\nHe’s wearing a technician’s outfit, which would be plain except he wears it rather well. The otherwise dull fabric hugs his muscles and slim waist, accentuating everything beneath. The one item of note is his tool belt, with different gadgets of importance tacked on.");
	clearMenu();
	addButton(14,"Back",VahnTheMechanic);
}

//Talk
public function talkToVahn():void
{
	clearOutput();
	showVahn();
	output("What would you like to talk to Vahn about?");

	//[Vahn] [Starships] [Hobbies]
	clearMenu();
	addButton(0,"Vahn",talkToVahnAboutVahn);
	addButton(1,"Starships",talkToVahnAboutStarships);
	addButton(2,"Hobbies",talkToVahnAboutHisHobbies);
	addButton(14,"Back",VahnTheMechanic);
}

//Vahn
public function talkToVahnAboutVahn():void
{
	clearOutput();
	showVahn();
	output("You’re interested to hear more about Vahn, so you ask him about himself.");
	output("\n\nThe blonde half ausar crosses his arms, his fluffy tail swishing about. <i>“... Me? I’m not that interesting. I mean, young, strapping half-ausar tech heads like me are a " + (isAprilFools() ? "dogecoin" : "credit") + " a dozen. My story doesn’t even hold a candle to yours, " + pc.mf("Mr.","Ms.") + " heir-to-a-galactic-business-empire.”</i>");
	output("\n\nNot one to let up, you pester Vahn until he caves. <i>“...Oh, all right. Where to start? Uh... I guess with my name - Vahn Arcon Desai. Only fair I give you mine, since everyone knows yours. I work for Steele Tech as a senior ship technician, so I spend a lot of my days fixing up mining vessels that dock at Tavros.”</i>");
	output("\n\nStill, working for Steele Tech as a senior technician is fairly impressive, especially since Vahn looks fairly young. You state as much and he bashfully scratches one of his canine ears.");
	output("\n\n<i>“Well, yeah, I got pretty lucky - scored myself a scholarship to Ausaril Tech funded by your dad’s company. I heard he had an honorary doctorate there? Anyway, I studied Applied Mechanics, since I love tinkering with my hands,”</i> Vahn brushes back his hair, <i>“...When I graduated, I was scooped up immediately by Steele Tech, since, you know, they’re </i>always<i> looking for folks who are good with gadgets.”</i>");
	output("\n\n<i>“That’s pretty much how I wound up here. I’m not sure if that answered your question, though, since I </i>do<i> have a life outside of work!”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToVahn);
}

//Starships
public function talkToVahnAboutStarships():void
{
	clearOutput();
	showVahn();
	output("You ask Vahn how he ended up working on starships, specifically yours.");
	output("\n\n<i>“Only the best technicians for [pc.fullName], I guess?”</i> He playfully grins and slides his hands in his jump suit pockets. <i>“...I love working on ships and Steele Tech has a lot of them. I like yours the most, though, because it’s an exploratory vessel.”</i>");
	output("\n\nWhen you ask why that’s important, Vahn’s eyes come alive with excitement. <i>“Oh, what isn’t to love? I’m working on a ship that’s going where nobody’s ever gone before! You’re going to be roughing it through alien skies, landing on alien worlds - all in the ship I’ve worked on!”</i>");
	output("\n\n<i>“Without a top notch vessel, even the greatest galactic rusher is stuck twiddling their thumbs in a docking bay. Not too different from what you’re doing now, right?”</i> He teasingly winks, bushy tail swishing. <i>“...All my sweat and effort goes into your engines, shields, guns, life support... pretty cool, right?”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToVahn);
}

//Hobbies
public function talkToVahnAboutHisHobbies():void
{
	clearOutput();
	showVahn();
	output("You ask Vahn about his hobbies. The friendly half-ausar seems happy to discuss them with you.");
	output("\n\n<i>“My hobbies? Vehicle restoration’s a biggie; I’ve got two vintage hovercars I bought for a steal and I’m doing them up,”</i> Vahn explains, <i>“One is a Atlas Dynamus, a beautiful old twin-seater with an old quad-levi axel. It was really big during the last rush. The other one is a Lexi Fusion that I’m missing half the parts for; I’m hand machining half of them myself since I can’t find a seller.”</i>");
	output("\n\nThere’s a distinct gleam in the blonde tech’s eyes and his bushy tail is waggling. It’s pretty obvious Vahn loves talking about his toys!");
	output("\n\n<i>“Um, what else? Oh - I also love playing graviball. There’s a court on the station and I play twice a week. We’re not the best team, but we’re in the top three. I play point guard. I’ve started playing back when I was at Ausaril Tech and I’ve kept with it since then.”</i>");
	output("\n\n<i>“Other than that, I usually like going out with the crew, having a few drinks and playing a few rounds of billiards. If I’m lucky, usually the night ends with me sinking one in a nice, tight pocket.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToVahn);
}

//Sex
public function vahnSexMenu():void
{
	clearOutput();
	showVahn();
	//First Time:
	if(fuckedVahn())
	{
		output("You ask if Vahn is interested in servicing something <i>other</i> than your ship, like you, for instance.");
		output("\n\nThe blonde ausar brushes back his hair and grins, <i>“...Well, I’m definitely keen to warm up your engines.”</i> He gives a quick glance over his shoulder, to make sure none of the other crew are watching.");
		output("\n\n<i>“So - what did you have in mind?”</i>");
	}
	//Repeat
	else
	{
		output("...What do you suggest?");
	}
	//[GiveBJ] [GiveAnal]
	processTime(1);
	clearMenu();
	addButton(0,"GiveBJ",giveVahnABJ,undefined,"Give BJ","Give the ausar mechanic a BJ. He deserves it for all his hard work, right?");
	if(pc.hasCock()) 
	{
		if(pc.cockThatFits(550) >= 0) addButton(1,"GiveAnal",giveVahnAnal,undefined,"Give Anal","Give the ausar mechanic a little rump loving.");
		else addDisabledButton(1,"GiveAnal","Give Anal","You’re too big for Vahn.");
	}
	else addDisabledButton(1,"GiveAnal","GiveAnal","You need a dick in order to give him some anal.");
	if(pc.hasVagina())
	{
		addButton(2,"Ride Cowgirl",catchVahnCowgirl,undefined,"Ride Cowgirl","Take Vahn aboard and ride his rocket to the stars.")
		addButton(3,"Pussy Rub",vahnRubsYourPussy,undefined,"Pussy Rub","Have Vahn rub on your muff to get you off.")
	}
	else
	{
		addDisabledButton(2,"Ride Cowgirl","Ride Cowgirl","You need a pussy to take Vahn for a ride like this.")
		addDisabledButton(3,"Pussy Rub","Pussy Rub","You need a pussy to get Vahn to rub on it. Duh.")
	}
	addButton(4,"Catch Anal",vahnFucksYourButt,undefined,"Catch Anal","See if you can get the ausar mechanic to get to work on your backdoor...");
	addButton(5,"Give Handjob",giveVahnAHandy,undefined,"Give Handjob","Bend Vahn over and play with his tasty rocket... and maybe something dirtier...");
	addButton(6,"Dommy Anal",vahnDomsYourButt,undefined,"Dommy Anal","Get Vahn to take the lead and claim your ass for his own!")

	addButton(14,"Back",VahnTheMechanic);
}

//Sex Scenes
//Give BJ
public function giveVahnABJ():void
{
	clearOutput();
	showVahn(true);
	
	output("Looking at Vahn, you’re filled with all kinds of lusty thoughts. You want to tear that jumpsuit off him and just have your way with him. Most of all, you want to suck his half-ausar dick. You want to get him all hot and bothered, to suck on his turgid length and to hear his glorious, pleasured moans.");
	output("\n\nCrooking a finger, you gesture for him to follow you behind a cargo container. It’s semi-private - someone could happen upon you there - but isn’t that half the fun? Vahn gladly follows you, a look of anticipation in his eyes. His bushy brown tail is wagging behind him; he must know he’s in for a ‘treat’.");
	output("\n\nIn the shadowy alcove, you turn to him, ");
	if(!pc.isNude()) output("and begin to strip off your things.");
	else output("and slide your hands down your naked form. Since you’re not wearing a scrap of clothing, everything is already on display, but here in private, he doesn’t have to pretend not to stare...");
	//PC is wearing armor:
	if(!(pc.armor is EmptySlot)) output(" You pull off your [pc.armor], letting your garb fall to the docking floor as he watches on with obvious lust.");
	if(!(pc.upperUndergarment is EmptySlot)) output(" Reaching up, you slip off your [pc.upperGarment], tossing it aside and liberating your [pc.chest].");
	if(!(pc.lowerUndergarment is EmptySlot))
	{
		output(" When you remove your [pc.lowerUndergarment], you take it nice and slow, letting him enjoy the sight of your slowly emerging ");
		if(pc.hasCock()) output("cock");
		if(pc.cockTotal() > 1) output("s");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) 
		{
			output("puss");
			if(pc.totalVaginas() == 1) output("y");
			else output("ies");
		}
		if(!pc.hasVagina() && !pc.hasCock()) output("loins");
		output(".");
	}

	output("\n\nYou feel a rush of pride as a mighty pitch grows in the front of Vahn’s jump suit. You sensuously walk over and tug at the front of his jump suit, pressing your naked [pc.chest] against him, and giving him a long, lusty kiss. When he feverishly kisses you back, you’re both utterly lost in the moment.");
	output("\n\nStripping off his clothes, you pull away from him, and get the measure of his manhood.");
	if(!fuckedVahn()) output(" What you see makes you longingly lick your [pc.lipColor] lips.");
	output(" His dick is long and thick - ten inches of delicious rigidity - and completely terran except for the knot at his base. His low hanging balls look full, ripe, and <i>very</i> fondleable.");

	output("\n\nDropping down ");
	if(pc.hasKnees() && pc.legCount > 1) output("on your [pc.knees]");
	else output("to the ground");
	output(", you soak in every little detail. His musky, manly scent makes your head spin and your mouth");
	if(pc.hasVagina()) output(" - not to mention your [pc.pussies] -");
	output(" wetten. Inching forward, you press your nose against his canine bulge and run it up the underside of his glorious erection, greedily inhaling his dreamy scent. It truly is a top-notch cock!");
	if(pc.hasTail() && pc.tailType == GLOBAL.TYPE_CANINE) 
	{
		output(" Your ");
		if(pc.tailCount > 1) output("tails swish");
		else output("tail swishes");
		output(" like you’re a bitch in heat!");
	}
	else if(pc.hasTail() && pc.tailType == GLOBAL.TYPE_FELINE) 
	{
		output(" Your feline ");
		if(pc.tailCount > 1) output("tails sway");
		else output("tail sways");
		output(" side to side - you feel like you’re in heat!");
	}

	output("\n\n<i>“Like my scent, do you?”</i> Vahn grinds his cock against your nose and [pc.lips]. You shiver with delight as his firm heat presses forcefully against your [pc.face]. An electric shiver runs down your spine. You’re just giving a blowjob. Why does it feel like so much <i>more</i>?");
	output("\n\nWith shivering fingers, you reach out and stroke his muscular thighs, as if to steady yourself. Right. Sucking his cock! You start with a long lick, letting your tastebuds roll over his throbbing dick. There’s a hint of salt and sweat, but it’s definitely not unpleasant. The longer you lick it, the tastier it is, until you’re suckling happily on his knob. Mmmm!");
	output("\n\nYou hear Vahn groaning and there’s a splash of warm slickness against your tongue. It drools down, bathing your palate with his gooey spunk. It’s zesty and delicious! Every thought is clouded, bar one - the desire to have more of his cock cream!");
	output("\n\nWith increased zeal, you take his throbbing man-meat wholly into your mouth. His swollen glans presses and rubs against the back of your tongue, feeling so much <i>bigger</i> than it looked. At the same time, his knotted base plushly presses against your [pc.lips]. Rather than try to strain your jaw around his girth, you wetly lash the underside of his cock with your [pc.tongue], running your tip along the wonderfully distinct grooves of his undercarriage.");
	output("\n\nVahn groans and presses his back against the container. At the same time, his hips rise to meet your suckling mouth. You glance up and the half-ausar’s head is lolling back, his eyes partially closed - he’s definitely enjoying himself!");
	output("\n\nYou reach up and cup his hefty balls, running a finger along the sensitive flesh between his sack and buttocks. With the slightest finger curl, he arches and moans. It’s a weak spot! You utterly abuse this knowledge, teasing his perineum as you bob and suckle his manhood.");
	output("\n\nA thrilling flush runs through your body, tickling your [pc.skin]. You’re butt naked in a cargo bay, sucking off this gorgeous mechanic in the shadows. Anyone could come around the corner and see [pc.fullName] on [pc.hisHer] hands and knees, going down on the ground crew. Your [pc.thighs] tremble with sensual delight at the thought - part of you even <i>wants</i> to get caught!");
	if(pc.hasCock() || pc.hasVagina()) 
	{
		output(" Your");
		if(pc.hasCock()) 
		{
			output(" [pc.cocks]");
			if(pc.cockTotal() == 1) output(" is");
			else output(" are");
			output(" rock hard");
		}
		if(pc.hasVagina() && pc.hasCock()) output(", and your");
		if(pc.hasVagina())
		{
			output(" [pc.vaginas]");
			if(pc.totalVaginas() == 1) output(" is");
			else output(" are");
			output(" sopping wet, making a moist mess down there");
		}
		output(".");
	}
	output("\n\nSpurred on by your utter horniness, you relax your throat and push forward, taking his entire ten-inch shaft into your throat. His crown buries itself deep in your gullet and his muscled knot fills your mouth. Drool dribbles down your chin as you eagerly deep throat his sublime cock and his low hanging balls slap under your chin.");
	output("\n\nYour lusty cock-sucking efforts quickly bring him to the brink of ecstasy. With a very loud groan, Vahn suddenly grabs the back of your head. You’re so worked up that as soon as you feel the first slick splash of his boy-cream on your tongue, you’re cumming yourself, ");
	if(pc.hasCock() && pc.hasVagina()) output("both of you simultaneously shooting your loads and you creaming your [pc.vaginas] as well.");
	else if(pc.hasCock() || pc.hasVagina())
	{
		if(pc.hasCock()) output("both of you simultaneously shooting your loads.");
		else if(pc.hasVagina()) 
		{
			output("creaming your [pc.vaginas]");
			if(pc.isSquirter()) output(" and squirting your [pc.girlCum] all over the place");
		}
		output(".");
	}
	else output("your [pc.thighs] trembling with wave after wave of glorious ecstasy.");

	output("\n\nIn your orgasmic haze, you don’t recognize Vahn’s swelling knot until it’s straining your mouth wide open. Wave after wave of his delectable cream shoots down your gullet... and it just doesn’t stop. It’s forceful, but you don’t care - your oral efforts are rewarded with countless gooey ropes of his baby batter washing down your throat and down into your belly. Your mouth is literally mated with his waist, his balls pressed hard against your [pc.face].");
	output("\n\nWhen he finally deswells and pulls his dripping dick out of your equally wet mouth, you’re both utterly spent. Your belly feels warm and full, and your mouth couldn’t be more filled with his slick, succulent taste. Reaching up, you rub your [pc.lips] and let out a dreamy sigh.");
	output("\n\nVahn helps you up, though you’re a bit wobbly and he’s hardly better. He wraps his arms around you and gives you a long, passionate kiss, pressing you up against the cargo container in the process. You run your hands through his thick sandy hair, your tongue dancing with his, sharing both his taste and yours.");
	output("\n\n<i>“...That was stellar. Any time you want to do that again, I’m free. I’ll make time if I have to,”</i> Vahn breathily tells you, stroking your cheek. You both pull away and put on your things. When you come around the corner, more than a few of the ground crew are raising an eyebrow at you both. It’s not that hard to guess what you two were doing!");
	
	processTime(13+rand(4));
	flags["SEXED_VAHN"] = 1;
	pc.orgasm();
	pc.loadInMouth(chars["VAHN"]);
	pc.loadInMouth(chars["VAHN"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give Doggy
public function giveVahnAnal():void
{
	clearOutput();
	showVahn(true);
	var x:int = pc.cockThatFits(550);
	if(x < 0) x = pc.smallestCockIndex();
	// Req: Pc must have cock
	// Max cocksize: 18 inches long, 5 inches wide.
	output("Looking at Vahn, you’re filled with lusty thoughts of taking the handsome half-ausar. That bushy tail looks so <i>grabbable</i> - you find yourself fantasizing about bending him over and having your way with his perfectly toned butt.");
	output("\n\nPicking up on your body language, Vahn’s tail begins to wag, and he suggestively raises an eyebrow. <i>“You’re... thinking about something. Something good.”</i>");
	output("\n\nYou step forward and whisper in his fluffy canine ear exactly what you’re thinking about doing to him in intimate detail. The moment you utter your sensuous intentions, his breathing becomes hot and heavy.");
	output("\n\nSlipping your arms around his waist, you kiss and suckle on his neck, pressing your hips against his. Vahn lets out a breathy sigh and you feel a stiffening against your [pc.cockNounSimple " + x + "].");
	output("\n\n<i>“I’d... yes, I think I’d like that,”</i> he huskily murmurs. You lead him by the hand up the ramp and into your ship’s cargo bay. There, you tell him to strip for you. Blushing, the blonde haired ausar unzips his jumpsuit and begins to slide it down his muscled yet slender body, exposing his broad chest, well-toned abs, and slender waist.");
	if(fuckedVahn()) output(" His veiny, knotted manhood is already proudly pointing upwards and achingly erect.");

	else output("\n\nYour mouth wettens at the sight of his wonderful manhood. His dick is long and thick - ten inches of deliciously rigidity - and completely terran except for the knot at his base. His low-hanging balls look full and ripe.");

	//Pc is wearing any clothes at all:
	if(!pc.isNude())
	{
		output("\n\nWith a " + pc.mf("cheeky","sultry") + " smile, you decide to give him a little strip tease.");
		if(!(pc.armor is EmptySlot)) output(" Slowly and sensuously, you strip off your [pc.armor] before letting it fall to the floor.");
		if(!(pc.upperUndergarment is EmptySlot)) output(" Reaching up, your [pc.upperGarment] comes off – tossed aside and liberating your [pc.chest].");
		if(!(pc.lowerUndergarment is EmptySlot)) output(" Your [pc.lowerGarment] are slid off inch by inch, exposing your [pc.groin]. Vahn lets out a <i>very</i> appreciative groan at the sight. His bushy blonde tail is wagging madly!");
	}

	output("\n\nYou " + pc.mf("stride up","saunter up") + " and, grabbing his slim hips, turn him around on the spot. Leading him up to one of the cargo crates, you bite his ear and whisper for him to bend over. Obeying your command, the handsome half ausar delightedly gulps and bends forward, lifting his fluffy tail in the air – just like a bitch in heat. As he braces himself against the crate, you grind your [pc.cockNounSimple " + x + "] between his firm butt-cheeks and he excitedly flushes.");

	//FirstTimeAnalWithVahn:
	if(flags["FUCKED_VAHNS_ASS"] == undefined)
	{
		output("\n\n<i>“Is this your first time?”</i> You ask, rubbing your [pc.cockHead " + x + "] against his oh-so-sensitive tail base. His thighs tremble with delight.");
		output("\n\n<i>“N-no, when I was an apprentice, the older guys liked to celebrate a job well done – usually with me,”</i> Vahn moans as you hotdog his hunky ass and his bushy blonde tail waggles happily. <i>“Sometimes they’d bend me over and fuck me while I was working, just like this.”</i>");
		output("\n\n<i>“Now I’m a senior tech, nobody fucks me like that anymore.”</i>");
		output("\n\nWell, you’re definitely going to have to fix <i>that</i>.");
	}
	else output("\n\n<i>“Void, I love the feel of your dick,”</i> Vahn moans.");
	output(" Grabbing your [pc.cockNounSimple " + x + "], you position it between his hard butt-cheeks. You press your [pc.cockHead " + x + "] forward and against his deliciously tight pucker. It strains to accommodate your sensitive crown, slowly slipping around it until your tip is buried inside his delectable butt.");

	output("\n\nWith the slightest flex, his hot tunnel wrings your [pc.cockHead " + x + "], and you let out a low, lusty groan - the half ausar’s butt is mind-numbingly tight! Slick rivulets of [pc.cumNoun] pour out of your urethra and into the bent over beefcake, weaving its way deep into his rippling bowels.");
	pc.cockChange();

	output("\n\n<i>“It’s so hot,”</i> Vahn moans, his butt flexing and clenching around your [pc.cockNounSimple " + x + "]. With his snug passage lubed up with your pre-[pc.cumNoun], you bury your " + pc.mf("manhood","member") + " deep inside of him. His hot flesh constricts around your ");
	if(pc.cocks[x].cLength() < 6) output("little");
	else if(pc.cocks[x].cLength() < 16) output("engorged");
	else output("massive");
	output(" length, eagerly and instinctively wringing it for every [pc.cumVisc] drip.");

	output("\n\n<i>“Who does your ass belong to?”</i> You demand of Vahn, grabbing his fluffy tail in one of your hands. At the same time, you pointedly grind your [pc.hips] against his delectable rump, and the blonde lets out a sinful little cry.");

	//FirstTimeAnal:
	if(flags["FUCKED_VAHNS_ASS"] == undefined)
	{
		output("\n\n<i>“W-what-?”</i> He breathily asks. You pull back until only your [pc.cockHead " + x + "] remains inside of him, awaiting his answer. His parted pucker longingly wrings your glans. He’s clearly missing your [pc.cockNounSimple " + x + "] inside of him! <i>“W-why’d you pull out-? Come onnn...”</i>");
		output("\n\n<i>“Not until you tell me who your ass belongs to,”</i> you insist, rubbing your [pc.cockHead " + x + "] teasingly against his prostate. His taut thighs and bushy tail quiver with pent-up pleasure and he lets out a low, howling whine.");
		output("\n\n<i>“...Y-you... my ass... it’s definitely yours. Please, fuck my naughty ass!”</i> The dirty talk is <i>really</i> turning him on, his half-doggie dick straining and slapping against his belly. His own pre-cum is dribbling down his shaft and balls. When you re-sheathe yourself inside of his ass, the river of spunk flows faster, puddling between his spread legs.");
	}
	//Else notFirstTimeAnal:
	else
	{
		output("\n\n<i>“Y-you, my ass belongs to you-!”</i> Vahn lustily moans. The dirty talk really turns him on, his half-doggie dick straining and slapping against his belly. His own pre-cum dribbles down his shaft and balls, a river of spunk that gushes as you pound his perfectly defined ass.");
	}
	output("\n\nThe air is filled with the lewd sound of your slapping thighs and your shared moans. You fuck him hot and hard against the crate, passionately pressing forward to meet his every backwards thrust. As you feverishly fuck his backside, Vahn groans and needily clenches your [pc.cockNounSimple " + x + "], the half ausar quickly reaching his limit...");
	output("\n\nBoth of you reach that fiery crescendo within moments of each other, letting out sweet, uninhibited cries. As his insides clench and convulse, you grab his hips and bury yourself to the hilt inside of his ass. Climaxing in unison, his butt and insides tremble and he spurts his spunk all over his belly, while you shoot your [pc.cumVisc] hot [pc.cumNoun] inside of the ausar boy’s butt. His tail trembles from tip to base and his pucker deliciously squeezes your base for every last [pc.cumColor] drop.");

	//Pc.hasAKnot:
	if(pc.hasKnot(x))
	{
		output("\n\nYour knot swells as his does, locking inside of Vahn’s ass. With an animalistic cry, the half-ausar whines and rubs his butt against your hips. Some primal calling takes over his mind as you knot with his ass; his furry ears pull back, his tail lifts up, and he begins to lustily pant. His insides ripple around your [pc.cock " + x + "], coaxing each [pc.cumVisc] spurt up to make way for another. Before long his ass is packed full of your [pc.cumNoun], the barest dribble seeping out of his well-stretched star.");
		output("\n\n... Half an hour later...");
		processTime(20 + rand (10));
	}
	output("\n\nWhen you pull out of Vahn’s sexy bottom, you leave his back door gaping. ");
	if(pc.cumQ() >= 10)
	{
		output("A ");
		if(pc.cumQ() < 25) output("thin stream");
		else output("slippery stream");
		output(" of [pc.cumColor] gushes out and sensuously runs down his thighs. ");
	}
	output("His fluffy blonde tail twitches and he lets out a sexy groan. Beneath his furry appendage, his dilated pucker clasps at the empty air.");

	//if pc.doesnothaveknot:
	if(!pc.hasKnot(x))
	{
		output("\n\n<i>“U-um... I’m still c-c-cumming...”</i> Vahn cutely stammers. Thin, intermittent spurts are still jumping out from his swollen cock. Reaching around his waist and down, you suckle on his ear and neck, all the while gently jerking him off.");
		output("\n\nHe moans and trembles as you tease his tender dick, coaxing out each slick spurt. It lewdly batters the cargo bay wall, smearing it in his canine seed. It takes a while for the virile tech to get it all out - he’s got quite a lot to give!");
	}
	output("\n\nTurning Vahn around in your arms, you pull him close and give him a dreamy, post-orgasmic kiss. He moans and slides his arms around your waist. Teasing him a little, you slide one of your fingers into his sloppy butt and he trembles with delight.");
	output("\n\n<i>“...Ahh-! I-If you tease me like t-that, I-I’ll want to go again...”</i> the male tech lightly whines, his blonde doggy ears flattened back. He sucks on your lower lip, nibbling it playfully - he doesn’t seem <i>entirely</i> against the idea...");
	output("\n\nThere’s a shout from outside the ship. One of the ground crew is looking for him! You both hastily get redressed, barely finishing in time as a tech jogs up the ramp.");
	output("\n\nVahn winks to you and walks down the ramp with his co-worker, getting back to work. There’s a slight wobble to his step and his tail is wagging happily.");
	output("\n\nWith a little grin, you wonder how long it will be before the half-ausar notices the dripping trail of cum he’s leaving on the deck floor...?");
	
	processTime(20+rand(10));
	flags["SEXED_VAHN"] = 1;
	flags["FUCKED_VAHNS_ASS"] = 1;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Catch Vaginal in Cowgirl
public function catchVahnCowgirl():void
{
	clearOutput();
	showVahn(true);
	
	var x:int = rand(pc.vaginas.length);
	
	output("You suggest to Vahn that you both retire to your ship for some relaxation time.");
	
	output("\n\n<i>“You don’t have to ask me twice,”</i> Vahn grins, bright eyes shining. He places a hand on your hip. Is that his bushy tail brushing against your side? He must be quite excited!");
	
	output("\n\nEven though he’s got his arm around you, you’re the one to take the lead. You both head up the cargo ramp and into your ship.");
	
	output("\n\nWhen you get to the door to your quarters, you insist that he go first. There’s a glimmer of curiosity in his eyes as he opens the door and walks inside. As he turns to face you, you give his athletic chest a little shove, pushing him back onto the bed. The half-ausar lets out a surprised cry as he <i>whumps</i> down on the sheets. With a mischievous grin, you ");
	if (pc.isNude()) output("straddle his waist.");
	else output("swiftly strip off and then straddle his waist.");
	
	output("\n\n<i>“Taking charge, I take it?”</i> Vahn asks, sucking in a breath as your hands slide over his strapping upper half. You stroke his hard pectorals and feel a pleasurable flutter in your belly: he really is a work of art. The carnal admiration is mutual; you can feel his wide green eyes ogling your ");
	if(pc.biggestTitSize() >= 2) output("naked breasts.");
	else output("own chest.");
	output("His hands slide up your hips and trail up your sides. An electric shiver shoots up your spine: you feel awfully flushed, set astir by his touch. As his hands slide around your front to ");
	if(pc.biggestTitSize() >= 2) output("cup your breasts and ");
	output("pinch your nipples, you bite back a heated moan. The way he’s flicking your stiffening buds has got you all worked up; it’s all you can do not to squirm with delight in his lap!");
	
	output("\n\nBetween your naked thighs and up against your mound, you can feel something hot and hard. It’s barely constricted beneath his jumpsuit, swelling up and towards his belly with every passing second. You moan and rub yourself against it, feeling his throbbing heat even through his jumpsuit. Knowing that you’re getting him this hard – him just playing with your ");
	if(pc.biggestTitSize() >= 2) output("breasts and ");
	output("nipples – is getting you all kinds of hot!");
	if(pc.hasCock())
	{
		output(" Your own [pc.cocks] slap");
		if(pc.cockTotal() == 1) output("s");
		output(" excitedly against your belly and swell with arousal.");
	}
	
	output("\n\nUnwilling to wait a second longer, you reach down and undo the lower half of Vahn’s jumpsuit. The second you do, his ")
	if(pc.hasCock(GLOBAL.TYPE_CANINE) && pc.isAusar()) output("own "); 
	output("half-ausar cock springs out. Preparing him first, you ");
	if(pc.hasCock()) output("lift your own [pc.cocks] out of the way and ");
	output("rub your slick slit against his undershaft, coating his veiny length in your lube-like juices. Your lover moans and rubs up and back against you in carnal rhythm, twitching against your womanhood.");
	
	output("\n\nOnce you’re satisfied that you’re both slickened up enough, you slide forward and line up his swollen crown with your slit. You then ease yourself back and down onto Vahn’s cockhead. The sensation of his aroused flesh slipping inside of you makes you reel with delight. Inch by glorious inch, you sink onto his rigid shaft, rewarded by the sensation of his bulbous crown rubbing up deep inside of you. When at last your pussy is kissing his turgid knot, you feel gloriously full and utterly impaled upon his straining staff. You can feel every pulse from his prick against your inner walls, every little flex of his swollen crown.");
	
	pc.cuntChange(x, chars["VAHN"].cockVolume(0));
	
	output("\n\nLooking down at Vahn, the look of transcendent pleasure on his face is getting you even wetter. The puppy boy is definitely enjoying the feel of your slick pussy wrapped around his prick. Deciding to give him something to <i>really</i> get happy about, you clench and squeeze around his half-doggie dick, coaxing a breathy moan from his lips. Excited and encouraged by his reaction, you rock and gyrate in his lap, swooning as his hardness rubs and grinds deep inside of you.");
	if(pc.hasCock()) output(" Pre-cum drools down your [pc.cocks] and lubricates your grinding loins, making things even hotter and wetter");
	
	output("\n\nYou feel the blonde hunk’s hands reach around and firmly grab your ass. He gives your rump a nice tight squeeze. At the same time he begins slapping upwards, literally bouncing you on his cock. You let out a squeal of delight as you’re enthusiastically pistoned from below. Desperately, you wrap your arms around his neck, holding on as he lewdly slaps up against your ass. Every urgent thrust causes your heart to leap and your thighs to shake. You’re gushing down his length every time he withdraws, and moaning with delight with his cock’s return. Your toes curl up, your eyes roll back, and all you can do is buck needily against him. It’s like your life’s purpose, your raison d’être; there’s nothing else other than grinding up against his dick!");
	
	output("\n\nIt’s not long before the pleasure is just too much. Your world goes white and you give a shuddering cry, climaxing hard on his flexing cock. You shiver and ");
	if(pc.isSquirter()) output("spastically squirt [pc.girlCumNoun] all over his waist, thin streams jumping from between your pussylips and splashing all over his belly.");
	else output("gush [pc.girlCumNoun] down his shaft and balls.");
	if(pc.hasCock()) output(" Your [pc.cock] spasms and you shoot [pc.cumNoun] all over his flexing abs, painting it in [pc.cumVisc] [pc.cumColor].");
	output(" Glorious waves of utter ecstasy sweep through your body and you shudder uncontrollably, wracked by wave after wave of wondrous rapture. It’s a miracle you can keep yourself upright as you convulse and cream yourself all over his cock!");
	
	output("\n\nAs you experience your dizzying release, you instinctively clench around Vahn’s veiny cock, wetly wringing it with utter abandon. Stimulated by your squeezing snatch, his canine knot swells up and presses back against your inner walls. You hear him let out a glorious groan and feel him shooting his warm sperm inside of you, flexing and filling you with spurt after spurt of his thermal seed. Trapped in by his knot, his sticky spunk pools inside of your pussy, filling it up to the brim and then some. Your [pc.cunt " + x + "] happily coaxes out every drop of ausar cum he has to give. No doubt his doggie seed is swimming around your " + stripRace(pc.originalRace, true) + " eggs, eager to fertilize them.");
	
	pc.cuntChange(x, chars["VAHN"].cockVolume(0) + 50);
	
	output("\n\nUtterly spent, you fall forward and onto his chest, legs splayed wide over his. Knotted by his cock, you’re not going anywhere; it’s a perfect chance to snuggle. Vahn grins and strokes your ");
	if(!pc.hasHair()) output("cheek");
	else output("hair");
	output(". Even though you’re absolutely filled with him, you still feel a tiny stream of slickness dribbling down your [pc.legOrLegs]. Your lower belly feels so warm and is pressed up against his toned abs. You lift your head and give him a long, passionate kiss, which is hungrily returned.");
	
	output("\n\nAfter making out and snuggling for a glorious half hour, his knot finally deflates, freeing you from his lap. As you slowly and lazily pull off, his sloppy prick plops from your well-packed pussy. Almost immediately, a slick stream of white spills from between your swollen netherlips. Noticing Vahn is loving the erotic sight, you pointedly part your lower lips with your fingers, ")
	if(pc.hasCock()) output("pushing your own [pc.cocks] out of the way and ");
	output("showing off his messy creampie. His cheeks flush and he slips his fingers into your sodden snatch, stirring them about. You tremble and moan, definitely enjoying the sensation. A few quick rubs of your clit and you’re creaming yourself – or really, creaming out <i>his</i> cream – in gooey spurts.");
	
	output("\n\nNow completely spent, you fall back into the sheets with a contented sigh. Every inch of you is singing, and your inner thighs are wonderfully slick with his cum. Vahn falls down next to you and wraps his arms around your belly. You can feel his fluffy tail brushing up against your leg; a pleasantly soft sensation.");
	
	output("\n\nYou don’t know when you do, but you fall asleep against him, dozing off against each other. It’s only when his com device begins buzzing that you both drag yourself from your delectably dozy nap.");
	
	output("\n\n<i>“My next shift’s about to start. I’ve got to get ready,”</i> Vahn tells you. He punctuates his explanation with a sizzling kiss on your lips, to which you rouse and respond instantly. He’s then dressed and out the door, back to work. You get yourself up and out of bed. How is he still leaking out of you after that nap? He must have shot a <i>lot</i> of cum inside of you!");
	
	processTime(120+rand(10));
	flags["SEXED_VAHN"] = 1;
	pc.orgasm();
	pc.orgasm();
	pc.loadInCunt(chars["VAHN"], x);
	pc.loadInCunt(chars["VAHN"], x);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Vahn Pussy Rubs
public function vahnRubsYourPussy():void
{
	clearOutput();
	showVahn(true);
	
	var x:int = rand(pc.vaginas.length);
	
	output("With a saucy little smile, you grab Vahn’s hand and lead him to a much quieter part of the docking bay. Once you’re sure nobody’s able to see you both, you ");
	if (pc.isNude()) output("strip down and ");
	output("plant your butt on a sleek cargo crate. Then, with a sultry and deliberate slowness, you part your thighs. You feel a rush of exhilaration as you expose your [pc.pussy] to him");
	if(pc.hasCock())
	{
		output(" - pushing your [pc.cocks] ");
		{
			if(pc.balls > 0) output("and [pc.balls] out of the way – and");
			else output("- and")
		}
	}
	else output(", ");
	output(" even going so far as to spread it with your fingers.");
	output("\n\nVahn is utterly spellbound by the sight of your snatch");
	if(pc.totalVaginas() > 1) output("es");
	output(", mouth agape and wide glimmering green eyes fixated on your [pc.pussyColor " + x + "] puss");
	if(pc.totalVaginas() > 1 && pc.vaginasMatch()) output("ies");
	else output("y");
	output(". Your loins tingle with voyeuristic delight, and your own attention travels down to the palpable pitching in his lower jumpsuit.");
	
	output("\n\n<i>“Mmm, you look all pent up down there. We should do something about that,”</i> you murmur, beckoning him closer with a crooked finger. He hurriedly steps forward and you swiftly undo the lower half of his jumpsuit. The moment you do, his fleshy manhood springs out and smacks excitedly against your hand, thumping it with his hardness! You swoon at the sight and musky smell of his swollen crown and gaping cockhole – every groove and veiny ridge of his prick looks absolutely delicious. It makes you just want to wrap your mouth around it and suck him off, to taste his sweaty goodness on your tongue, to utterly lap up the flavor of his dick.");
	output("\n\nAs you soak in the sight of his magnificent manhood, Vahn’s hands wrap around your waist and he pointedly presses it against your needy sex. With a breathy sigh, you wrap your legs around his waist, encouraging his delicious caresses against your nethers. He rubs back and forth against your lips and strokes his firmness against your [pc.clits]. Coiling pleasure begins to mount in your belly, building and building with every grinding movement against your parted pussylips.");
	if(pc.hasCock()) output(" Your [pc.cocks] spring to attention and excitedly slap against your belly, untouched yet fully erect!");
	
	output("\n\nIt’s not long before you’re needily and insistently rocking your hips against his, meeting his bucking thrusts with shuddering gasps and coating his throbbing cock in your slickness. You want him so badly inside of you that you’re whimpering and trying to coax his crown inside of you. Every time it brushes your entryway, he pulls back and presses it against your lovebud instead! The throbbing pleasure from your shared friction shoots up from your loins and shorts out your thoughts. Suddenly, you can’t stop your thighs from shaking about – the pleasure is so overwhelming, you can’t stop yourself!");
	
	output("\n\nWhimpering and grinding up against him, you’re lost to carnal desire, a slave to the wet heat and friction of your shared loins. Then, just when you can’t take it a second longer, you let out a breathy cry and come <i>hard</i> all over his pressing prick, liberally coating it in your gushing girl-juice from shaft to scrotum! ");
	if(pc.hasCock())
	{
		output("Spurts of [pc.cumColor] jump from your [pc.cocks], coating his belly in your [pc.cumVisc] love");
		if(pc.cumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO) output(" goo");
		else output(" spunk");
		output(". ");
	}
	output("Your toes curl in delight and you press the balls your feet against his sculptured ass, coaxing him to press harder against your climaxing cunny.You hear the ausar technician moan and his prick flex, followed by a warm sticky spurt along your ");
	if(pc.hasCock()) output("own belly in turn");
	else output("belly");
	output("; you’re dimly aware he just came ");
	if(pc.hasCock()) output("right back");
	output(" on you! It strengthens your thrumming buzz as you grind against his squirting cock, coaxing out every last gooey burst onto your [pc.skinFurScalesNoun]");
	
	output("\n\nSweaty and satisfied, you both cling to each other, enjoying in the afterglow of your near-simultaneous climaxes. You feel him nibbling on your neck and you shiver with delight. His lips are teasing at your collarbone; every inch of you is electric and sensitive.");
	
	output("\n\n<i>“I thought you were going to slip it inside of me?”</i> You ask, resting your chin against him. The smell of his freshly sweaty body is divine. You suckle off and relish in the taste of his salty sweat. Is he doing the same to you, you wonder?");
	
	output("\n\n<i>“I couldn’t help myself. Just rubbing against your pussy was a delight,”</i> Vahn admits. His cum-covered cock is still pressing against your netherlips and painting your folds with his sticky white seed. Far more of it is warming your belly, coating it in his wonderful warmth.");
	
	output("\n\nAfter you both clean up – or at least as much as you can – ");
	if (pc.isNude()) output("Vahn slips his things back on and you both");
	else output("you both slip your things back on and");
	output(" head back to the main hangar. There’s an utterly satisfied smile on the ausar mechanic’s face and, given the soreness of your cheeks, yours as well!");

	processTime(15+rand(10));
	flags["SEXED_VAHN"] = 1;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Vahn Fucks Your Butt (Of Course Savin Had Something To Do With This)
public function vahnFucksYourButt():void
{
	clearOutput();
	showVahn(true);
	
	output("With a sensuous smile, you grab Vahn’s hand and lead the sandy-haired ausar up your cargo ramp. When you’re finally out of sight, ");
	if (pc.isNude()) output("you turn to him and slide your hands down your naked body");
	else output("you shamelessly strip down in front of him");
	output(". The male tech’s eyes go wide, and there’s a pointed stiffness pitching in his lower overalls – he definitely appreciates the sight!");
	
	output("\n\n<i>“Oh wow...”</i> He murmurs, openly ogling your sexy body. Peeling off his jumpsuit, you’re greeted with the ");
	if (flags["SEXED_VAHN"] == undefined) output("sight of his long, thick cock. Ten inches of delicious rigidity is poking up and pressing against his taut belly – it’s completely terran except for the knot at his base.");
	else output("familiar sight of his ten-inch cock!")
	
	output("\n\nWith a little grin, you bend over a crate and invitingly raise your rump to him. Glancing over your shoulder, you watch with barely concealed delight as he firmly grabs your hips and plants his pecker right between your cheeks!");
	
	output("\n\nAs he caresses his knotty prick back and forth, you shiver with delight, relishing in his throbbing heat raunchily rubbing between your [pc.skinColor] buttocks. You’re giddy with the thought of him going further, putting that oh-so-hard dick deep inside of you. Your flexing star is just inches away, begging for his touch.");
	if(pc.analVirgin) output("It’s your first time, so you have no idea how it will feel... yet you’re filled with this giddy <i>need</i> that you can’t put words to; you’ve never wanted anything more in your life!");
	
	output("\n\nHis entry comes without so much as a warning; just a slight pull back and pressing against your sensitive pucker. You groan as your asshole stretches deliciously around his engorged head... time stands still for a blissful moment as he caresses your hole, inching inside of you. A moment of give later, and your spread-wide pucker is kissing around the base of his crown; his dick-head is totally inside of you.");
	
	if(pc.analVirgin) output("<b>Congratulations; you’ve lost your anal virginity!</b>");
	pc.buttChange(chars["VAHN"].cockVolume(0), false, false, false);
	
	output("\n\nHis delectably thick cock slips further inside of you, stimulating your inner ass. You groan with delight as your whole body from tip to toe thrums with pleasure. Greedy for more, you lift up your rump, eager to get him as deep as he can go. Mentally, you relax your sphincter, and you’re immediately rewarded with three more inches of throbbing man meat inside of you.");
	if(pc.hasCock()) 
	{
		output(" As you breathily gasp and clutch the crate, you can feel his crown deep inside of you and caressing your prostate.");
		output(" Waves of pleasure course through your helpless body; you’re being driven absolutely delirious by his thrusting doggie dick! Your ");
		if(pc.cockTotal() == 1) output("own cock jerks and slaps");
		else output("own cocks jerk and slap");
		output(" excitedly against your belly, untouched but utterly rigid from his rectal entry.");
	}
	if(pc.hasVagina())
	{
		output(" Your ");
		if (pc.totalVaginas() == 1) output("pussy is untouched but is as warm and as slick as it");
		else output("pussies are untouched but are as warm and as slick as they");
		output(" can be, thoroughly aroused by his entry!");
	}
	if(!pc.hasGenitals()) output(" With no sex organs to speak of, you’re loving him using your ass-pussy!");

	output("\n\nJust as you think you can take no more, his already engorged knot begins to swell ");
	if(pc.hasCock())
	{
		if(pc.balls <= 0) output("right against your spongy prostate, plugging");
		else output("and utterly plugs");
	}
	output(" up your poor butt. You’re wracked with sizzling white hot pleasure, losing all self control as your body goes into a spasmic shuddering fit! You cry out in pleasure and your");
	if(pc.hasCock())
	{
		if(pc.cockTotal() == 1) output(" [pc.cocksNoun] jerks and shoot [pc.cum] all over the crate and your belly, jerking and jumping around with nothing to hold it down");
		if(pc.cockTotal() > 1) output(" [pc.cocksNoun] jerk and shoot [pc.cum] all over the crate and your belly, jerking and jumping around with nothing to hold them down");
		if(pc.isHerm()) output(". At the same time, your");
	}
	if(pc.hasVagina()) output(" [pc.cunt] splatters with excitement, the coiled pleasure in your lower belly releasing all at once");
	if(!pc.hasGenitals()) output(" [pc.legOrLegs] quake and you feel a molten release from your quivering rump");
	output(". You can feel Vahn’s doggie cock pulsing and squirting his slick warm seed deep inside of your butt, bathing your insides with his boy-juice and slowly filling you up.");
	
	output("\n\nFor what seems like forever, you’re being pumped full of his ausar spunk. Every time his knot pulses and flexes and his cockhead jumps inside of you, you quiver with delight, unable to keep your [pc.thighs] still. Knotted on his cock, you can’t go anywhere; your ass is literally locked to his twitching dick! His arms wrap around you and he pulls you against his hard chest. He presses his lips against your neck and gives it a suckling kiss, making you shiver right down to your dick-filled rump. The blonde ausar is so <i>inside</i> of you that you feel almost one with him, filled up with him from behind and below. You wouldn’t go anywhere even if you could! His knot flexes again and you let out a enraptured cry, cumming all over again from your puppy-plugged ass!");
	
	pc.buttChange(chars["VAHN"].cockVolume(0) + 50);
	
	output("\n\nAfter half an hour of utter ecstasy, Vahn’s knot finally deflates inside of you, slipping out with a loud and lewd <i>plop</i>. Unable to use your legs any longer, you fall forward onto the crate with a near-delirious groan. You can feel his hot creamy jizz sliding out of your stretched asshole and down your [pc.legs], though so much more is still packed inside your ass. Your belly feels so full with him; how much did he cum, anyway? You rub it with a happy sigh, trying to clench your pucker in a futile attempt to keep all his seed inside of your ass.");
	
	output("\n\n<i>“That was wonderful. </i>You<i> are wonderful,”</i> Vahn breathily exclaims, littering kisses on your lower back. All you can do is moan – words are totally beyond you right now. Even the feel of his fluffy tail caressing against you is enough to make you have a little shivering fit. You’re just too receptive to sensation right now: every inch of you is thrumming!");
	
	output("\n\nWhen you’re finally able to stand, Vahn gives you a long, passionate kiss before slipping back to work. You too pick up your things, still a little unsteady on your feet. If you stay this giddy for the rest of the day, you’re not sure how you’re going to get anything done!");
	
	processTime(40+rand(10));
	flags["SEXED_VAHN"] = 1;
	pc.orgasm();
	pc.orgasm();
	pc.loadInAss(chars["VAHN"]);
	pc.loadInAss(chars["VAHN"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



//Give Vahn a Handjob
public function giveVahnAHandy():void
{
	clearOutput();
	showVahn(true);
	
	output("You glance around. There’s not many ground crew around at all, and they all look far off and busy. With a mischievous grin, you turn to Vahn and gesture towards his loins.");
	
	output("\n\n<i>“Whip out your cock.”</i>");
	
	output("\n\nAfter a nervous look around, Vahn undoes the lower front of his jumpsuit. ");
	if (flags["SEXED_VAHN"] == undefined) output("You’re greeted with the sight of his long, thick cock – at least ten inches long and totally terran except for the canine knot at his base");
	else output("He whips out his creamy ten-inch cock. It dangles out impressively as his cheeks burn.");
	
	output("\n\n<i>“Good boy. Now turn around!”</i> You order him. The half-canine mechanic turns around. His fluffy tail is wagging excitedly as you order him around. Perhaps he liked being called a good boy?");
	
	output("\n\nWell, he’s going to like his next treat. You wrap your arms around his slender waist and slide one of your hands down his hard belly. With your ");
	if(pc.biggestTitSize() >= 2) output("breasts squished");
	else output ("chest pressed");
	output(" up against the resilient muscles of his back, you begin to slowly jerk off his semi-flaccid cock, clasping it softly between your fingers. You nibble on his ear and whisper in it, asking if he likes your hand on his cock.");
	
	output("\n\nVahn groans and nods. He’s stiffening and twitching in your hand, his knot swelling against your pinky finger. You give a satisfied grin and continue to milk his growing puppy erection, delighting in his short little gasps and breathy moans. You rub his sensitive crown with your thumb and feel his strong, lean body shiver in response. His cockhead flexes and flares, pumping out slick pearlescent drops of pre-cum which dribbles down his length. It slides over and warms your fingers, slipping between every gap and grove, producing more lubricant for your milking.");
	
	output("\n\nIt’s not long before he becomes putty in your hand, lustily bucking the air and trying to actively fuck your hand. You grin and switch your hands around, replacing your slick semen-covered digits for a fresh pair. Instead, you take your sticky digits and wiggle them into the tail hole in his jumpsuit, taking advantage of the gap to press them into his unsuspecting pucker. Vahn whines with delight as one of your cum-soaked fingers slide right up and into his rectum, wiggling about and teasing him inside.");
	
	output("\n\n<i>“Oh, so you like it up the ass? You’ve got your own cum in your butthole – you naughty boy,”</i> you tease, nibbling on one of his sensitive canine ears. At the same time you taunt him, you slip another finger in and press it up against his prostate, all the while giving his twitching rod a nice big squeeze.");
	
	output("\n\nVahn cries out with delight as your taunting words push him over the edge. With a shuddering gasp, his thick shaft flexes in your hand and he shoots out a thick, gooey splurt of cum. Sticky ropes of white jump out from his cock and splatter all over the work bench in front of him as he shivers and twitches with transcendent delight. His doggie knot swells to the size of a tennis ball and pulses against your lower hand, locking with it instead of a woman. You grin and milk out his eagerly spurting cum, giving each sticky arc a little more oomph.");
	
	output("\n\n<i>“Theeere’s a good boy. Let it all out,”</i> you whisper in his ear. You milk his bulbous prostate, stroking his spongy flesh and feeling his pucker flex and squeeze your fingers. He lets out another sweet cry and spurts a <i>second</i> time all over the bench, climaxing from your fingers buried knuckle-deep up his butthole. Such a cutie! You work him from front and back until he’s utterly spent, then pull out your fingers with a lewd ‘plop’.");
	
	output("\n\n<i>“Ooh, we made a real mess,”</i> Vahn breathily utters, face burning red. He’s tucking his slick ten-incher back in his pants, trying to hide his sticky shaft from the approaching ground crew. You both quickly beat it behind some crates and sneak up onto your ship, getting out of sight just in time.");
	
	output("\n\n<i>“Hey, who came all over the bench");
	if (flags["HANDIED_VAHN"] != undefined) output("<b> again</b>");
	output("?”</i> A voice calls out, presumably one of the ground crew. You both grin and split up, making sure to stay clear of the scene of the crime for a while!");
	
	processTime(10+rand(10));
	flags["SEXED_VAHN"] = 1;
	flags["HANDIED_VAHN"] = 1;
	pc.changeLust(33);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Vahn Anal Dom
public function vahnDomsYourButt():void
{
	clearOutput();
	showVahn(true);
	author("Gortys");
	
	output("Maybe it’s something about that big ‘ol ausar brain of his, or the way he looks in that sexy little jumpsuit, but you’ve got an itch to scratch and that blonde cutie in front of you feels the most applicable candidate.");
	
	output("\n\nYou give Vahn a pleading look with your [pc.eyes] as you seductively sway your [pc.hips] against his midriff. You nibble on your [pc.lipChaste] when you feel a bulge already beginning to present itself to you. <i>“How about we sneak off and blow off some steam?”</i> You eagerly suggest.");
	
	output("\n\nVahn is more than happy to oblige you in some recreational activities as he eagerly gropes your [pc.ass] before ushering you onboard your own vessel, though you do catch a few suspicious glances being shot toward you and your ausar lover as you enter. You quietly slip into the captain’s quarters of your ship, Vahn following behind.");
	
	output("\n\nYou’re already tearing off your equipment as Vahn makes himself more comfortable and bare behind you. By the time you’ve fully undressed, he’s eagerly groping your [pc.ass]. The sensation of his soft but firm hands on your underside already has you softly moaning into your lover. You crane your head to get Vahn’s attention, <i>“Show me what a big, strong ausar you are - unless, you’re not up to it,”</i> you jokingly tease.");
	
	output("\n\n<i>“How about we give you that bone you so desperately want then?”</i> Vahn growls dominantly into your [pc.ear].");
	
	output("\n\nVahn shoves you firmly onto the bed, grasping your [pc.hips] in his hands to raise your [pc.ass] to a more appreciable position.");
	if(!(pc.lowerUndergarment is EmptySlot)) output(" He delicately wraps his fingers around your [pc.lowerUndergarment] before tugging them down " + ((pc.legCount > 1 && pc.hasFeet()) ? "to rest between your ankles" : "and out of the way") + ".");
	output(" He doesn’t waste time in getting you all lubed up. His tongue slurps wetly on your [pc.ass] as he prepares you for what’s to come.");
	
	output("\n\nSince you’re all properly lubed up and practically <i>begging</i> to get that knot tied inside you; Vahn begins to press his impressive ten-inch canine cock against your [pc.ass]. The initial entry is a bit of a touch and go even with his saliva coating your entrance. Though, with a bit of effort he quickly begins to get into a rhythm of gently pounding into your ass which incites delicious moans from you.");
	
	pc.buttChange(chars["VAHN"].cockVolume(0));
	
	output("\n\nThe techie above you gently goes balls deep into you with each thrust, hands firmly grasping your waist. His knot bumps into your [pc.asshole] occasionally; reminding you of what you’re really after from this cute blonde ausar. You feel his hips begin to pound into you more solidly. His thrusts speed up just a bit as he’s sure you’ve comfortably adjusted to his size.");
	
	output("\n\nWith the romantic sex finding a close Vahn begins to place his upper body over your backside; groaning powerfully into your [pc.ear] whilst he has a tight grip on your shoulders. Once he’s found a proper position over his submissive lover, his hips really get to work as he plows his cock into your [pc.asshole] with vigour. By now, you’re moaning like a bitch in heat underneath him. To be honest, at this point you’d want nothing more than to be just that for your ausar.");
	
	output("\n\nYour enthusiastic lover goes for a firm but delicate reach around on those currently sensitive frontal bits of yours. His rough paws giving you quite the stimulation you need to really get into this hardcore romp between you two. The excitement swelling within from being handled like this gets you back-thrusting onto your lover’s crotch even harder.");
	
	output("\n\nThough you’re far too focused on the satisfying feeling of his large member bottoming out inside you with the oh-so present knot grinding into your [pc.asshole], you occasionally shove your ass back to meet his thrusts in an attempt to get him to knot you.");
	
	output("\n\nVahn catches on rather quick to what you’re planning and begins to increase the velocity of his thrusts. With a constant rough pounding into your [pc.ass], the knot ever so slowly begins to get inside. With a few more jazzed-up thrusts from Vahn his glorious organic butt plug lodges itself inside. The mixture of pain and pleasure from the large insertion has you moaning under the ausar mechanic.");
	
	output("\n\nWith his knot fully enveloped by your [pc.asshole], his thrusts become erratic and you sense what’s coming next. You give one final thrust with your ass into his waist before he goes all the way inside you and unloads rope after rope of that creamy jizz you’ve been after. Nothing goes to waste as the excess is trapped behind his knot. Though, mercifully, he hasn’t forgotten about you in all this bliss.");
	
	pc.buttChange(chars["VAHN"].cockVolume(0) + 50);
	
	output("\n\nHis soft hand is still fondling you, and with the combined pleasure of getting knotted and cummed into whilst your lover pleasures you from the front you finally explode ");
	if(pc.hasCock()) output("with [pc.cumVisc] ropes of [pc.cumNoun]");
	else if (pc.hasVagina()) output("with squirts of femcum that splatter");
	else output("with sexless sensation, leaving you to scream and collapse");
	
	output(" all over the soft sheets of your bed. Once you’ve calmed down, Vahn gently tugs you onto the bed to snuggle with him. The warm embrace of his arms around you as you gently lull to sleep.");
	
	output("\n\nYou awake some time later, Vahn seemingly gone. Semen seems to be freshly leaking out of your ass so you suppose he didn’t get his knot out too long ago. You quickly get yourself up, grab your things and get ready to head out.");
	
	processTime(40+rand(10));
	flags["SEXED_VAHN"] = 1;
	pc.orgasm();
	pc.orgasm();
	pc.loadInAss(chars["VAHN"]);
	pc.loadInAss(chars["VAHN"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
