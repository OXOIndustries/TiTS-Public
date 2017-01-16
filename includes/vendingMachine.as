// Custom vending machine button
public function vendingMachineButton(btnSlot:int = 0, machine:String = "energy"):Boolean
{
	switch(machine)
	{
		case "energy":
			switch(rooms[currentLocation].planet)
			{
				case "PLANET: MHEN'GA": output("\n\nA vending machine sits next to the door, advertising <i>JoyCo Power-up Potions</i>."); break;
				case "PLANET: TARKUS": output("\n\nA long line of raskvel are crowded around a big, yellow vending machine. A big, in-your-face logo on it advertises <i>JoyCo Power-up Potions</i>."); break;
				case "PLANET: NEW TEXAS": output("\n\nA row of vending machines sit at the back of the gift shop, advertising <i>JoyCo Power-up Potions</i>."); break;
				case "PLANET: MYRELLION": output("\n\nA dinged-up vending machine has been shoved into the corner. A big, in-your-face logo on it advertises <i>JoyCo Power-up Potions</i>."); break;
			}
			addButton(btnSlot, "V.Machine", buyAPowahPotionMenu, undefined, "Vending Machine", "See what these energy drinks are all about.");
			break;
		case "Vesperian":
			output("\n\nA vending machine with a picture of a cute deertaur on the front advertises the latest and greatest transformation products to come out of Vesperia in bold print. If you wanted to look more like the natives, this would be a good place to start.");
			addButton(btnSlot, "V.Machine", approachItemVendingMachine, machine, "Vending Machine", "Check out the Vesperian vending machine.");
			break;
	}
	
	return false;
}

//[Power Potion]
//Get yourself an energy drink. Only 5 credits!
//Restore all Energy
public function buyAPowahPotionMenu():void
{
	clearOutput();
	showBust("JOYCO_VENDING_MACHINE");
	showName("VENDING\nMACHINE");
	output("You walk over to the vending machine and give it a look. The main draw looks to be <i>JoyCo Power-up Potions</i>, guaranteed to double your pep. The small print spells out: <i>Only while cold. JoyCo is not responsible for food poisoning as a result of consuming warm beverages.</i> You might not be able to tote these wherever you go, but at least you can get a quick pick me up whenever you’re feeling down, just five measly credits!");
	processTime(1);
	clearMenu();
	if(pc.credits >= 5) addButton(0,"P.Potion",buyAPowahPotion,undefined,"Power Potion","Get yourself an energy drink. Only 5 credits!");
	else addDisabledButton(0,"P.Potion","Power Potion","You can’t even afford a five credit drink. Any poorer and you’ll be living out of a box.");
	addButton(14,"Back",mainGameMenu);
}
public function buyAPowahPotion():void
{
	clearOutput();
	showBust("JOYCO_VENDING_MACHINE");
	showName("VENDING\nMACHINE");
	author("Savin");
	output("You swipe your Codex over a small scanner on the front. The vending machine beeps happily as it siphons off a few credits from your account and rumbles as the replicator inside it works. After a moment, an ice-cold yellow can pops out of the dispenser at the bottom. You take it and crack the tab open, and are instantly overwhelmed by the too-sweet taste of the sugary drink. The can is small enough to knock back its contents in a matter of moments, leaving a slightly burning aftertaste in your mouth as the <i>“potion”</i> goes down.");
	//if PC had less than 100 ENG:
	if(pc.energy() < pc.energyMax()) output("\n\nTrue to its purpose, you quickly feel reinvigorated, like you could spring a marathon or wrestle a leithan to the ground! Whoo!");
	//if PC had 100+ ENG:
	else output("\n\nYou have to admit, you don’t feel much different. Maybe you should just find a water fountain to wash the taste out... yuck.");
	pc.credits -= 5;
	pc.energy(100);
	processTime(2);
	clearMenu();
	addButton(0,"Next",buyAPowahPotionMenu);
}

// Item vending machine
// Build a vending machine that dispenses/collects items.
public function approachItemVendingMachine(machine:String = "none"):void
{
	showBust("");
	showName("VENDING\nMACHINE");
	processTime(1);
	
	var buy:Boolean = true;
	
	chars["VENDINGMACHINE"].inventory = [];
	chars["VENDINGMACHINE"].typesBought = [];
	
	switch(machine)
	{
		case "Pawn":
			chars["VENDINGMACHINE"].originalRace = "robot";
			chars["VENDINGMACHINE"].keeperBuy = "ERROR\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR\n";
			chars["VENDINGMACHINE"].keeperGreeting = "ERROR\n";
			/*
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.PILL);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.FOOD);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.POTION);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.DRUG);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.SEXTOY);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.UPPER_UNDERGARMENT);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.LOWER_UNDERGARMENT);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.CLOTHING);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.ARMOR);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.MELEE_WEAPON);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.RANGED_WEAPON);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.SHIELD);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.ACCESSORY);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.EXPLOSIVECONSUMABLE);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.GADGET);
			chars["VENDINGMACHINE"].typesBought.push(GLOBAL.GEM);
			*/
			chars["VENDINGMACHINE"].sellMarkup = 0.0;
			chars["VENDINGMACHINE"].buyMarkdown = 0.5;
			buy = false;
			break;
		// Taur vending machine on Canadia Station
		case "Vesperian":
			chars["VENDINGMACHINE"].originalRace = "Vesperian";
			chars["VENDINGMACHINE"].keeperBuy = "The vending machine is clean, its buttons overlaid with bright holo-projections of the various products it offers. Many appear to be out of stock.\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR\n";
			chars["VENDINGMACHINE"].keeperGreeting = "RUH ROH! SOMETHING WENT WRONG.\n";
			
			chars["VENDINGMACHINE"].inventory.push(new TauricoVenidae());
			
			chars["VENDINGMACHINE"].sellMarkup = 1.05;
			chars["VENDINGMACHINE"].buyMarkdown = 0.1;
			break;
	}
	
	vendShopScreen(buy);
}
public function vendShopScreen(buy:Boolean = true):void
{
	shopkeep = chars["VENDINGMACHINE"];
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	if(buy) buyItem();
	else sellItem();
}

