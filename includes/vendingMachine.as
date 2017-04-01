// Custom vending machine buttons
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
				default: output("\n\nA vending machine sits next to a nearby wall, advertising <i>JoyCo Power-up Potions</i>."); break;
			}
			addButton(btnSlot, "V.Machine", buyAPowahPotionMenu, undefined, "Vending Machine", "See what these energy drinks are all about.");
			break;
		case "Vesperian":
			output("\n\nA vending machine with a picture of a cute deertaur on the front advertises the latest and greatest transformation products to come out of Vesperia in bold print. If you wanted to look more like the natives, this would be a good place to start.");
			addButton(btnSlot, "V.Machine", approachItemVendingMachine, machine, "Vending Machine", "Check out the Vesperian vending machine.");
			break;
		case "J'ejune":
			output("\n\nA vending machine sits along the nearby wall, its pastel colors trying just a bit too hard to be cheery. A big red sticker on the upper-right proudly declares that the products within are “As Seen On Holovid”.");
			addButton(btnSlot, "V.Machine", approachItemVendingMachine, machine, "Vending Machine", "Check out the J’ejune vending machine.");
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
	output("You swipe your Codex over a small scanner on the front. The vending machine beeps happily as it siphons off a few credits from your account and rumbles as the replicator inside it works. After a moment, an ice-cold yellow can pops out of the dispenser at the bottom. You take it and crack the tab open, and are instantly overwhelmed by the too-sweet taste of the sugary drink. The can is small enough to knock back its contents in a matter of moments, leaving a slightly burning aftertaste in your mouth as the “potion” goes down.");
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
			
			shopkeepBackFunctor = null;
			buy = false;
			break;
		// Taur vending machine on Canadia Station
		case "Vesperian":
			chars["VENDINGMACHINE"].originalRace = "Vesperian";
			chars["VENDINGMACHINE"].keeperBuy = "The vending machine is clean, its buttons overlaid with bright holo-projections of the various products it offers. Many appear to be out of stock.\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR.\n";
			chars["VENDINGMACHINE"].keeperGreeting = "ERROR.\n";
			
			chars["VENDINGMACHINE"].inventory.push(new TauricoVenidae());
			
			chars["VENDINGMACHINE"].sellMarkup = 1.05;
			chars["VENDINGMACHINE"].buyMarkdown = 0.1;
			
			shopkeepBackFunctor = null;
			break;
		// Jejune Pharma Vending Machine
		// <i>“Hi, Milly Bayes here!”</i>
		// An As Seen On TV vending machine that sells Jejune Pharmaceutical products and minor items that don’t have an explicit manufacturer. Can be located on Tavros or any other indoor area.
		case "J'ejune":
			author("Couch");
			
			chars["VENDINGMACHINE"].originalRace = "J'ejune";
			chars["VENDINGMACHINE"].keeperBuy = "You peruse the offerings on display behind the machine’s glass case. Every time your eye pauses on an item for more than a few seconds, a holovid display pops up to play whatever infomercial is associated with the product you examine. All of them feature the same bubbly sales girl with a voice that’s impressively booming, showing plenty of energy regardless of whether she’s extolling the virtues of a miracle moisturizing cream or showing off a spray for removing leftover fluids from bedsheets.\n\nYou might need a bottle of that last one for your ship, come to think of it.\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR.\n";
			chars["VENDINGMACHINE"].keeperGreeting = "ERROR.\n";
			
			chars["VENDINGMACHINE"].inventory.push(new LemonLoftcake());
			chars["VENDINGMACHINE"].inventory.push(new StrawberryShortcake());
			chars["VENDINGMACHINE"].inventory.push(new FizzyFix());
			
			chars["VENDINGMACHINE"].sellMarkup = 1.00;
			chars["VENDINGMACHINE"].buyMarkdown = 0.1;
			
			shopkeepBackFunctor = jejuneMachineBack;
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

public function jejuneMachineBuyGo(item:ItemSlotClass):void
{
	showBust("");
	showName("ITEM\nPURCHASED!");
	author("Couch");
	
	output("The " + item.longName + " tumbles unceremoniously out of its spot behind the glass to land in the receptacle below, positioned just low enough to make bending over to fish it out an awkward experience. A new one has popped into its place by the time you stand back up, though you dare not examine it too long lest the infomercial start playing all over again.");
	output("\n\n");
}
public function jejuneMachineBack():void
{
	clearOutput();
	showBust("");
	showName("VENDING\nMACHINE");
	author("Couch");
	
	output("After a few seconds of browsing, you opt to back away from the vending machine. As you walk away, you can still hear the infomercials playing just as clearly as if you were still standing right next to them. My, but Milly Bayes has some pipes on her.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

