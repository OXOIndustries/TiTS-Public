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
			addButton(btnSlot, "V.Machine", buyAPowahPotionMachine, undefined, "Vending Machine", "See what these energy drinks are all about.");
			break;
		case "Vesperian":
			output("\n\nA vending machine with a picture of a cute deertaur on the front advertises the latest and greatest transformation products to come out of Vesperia in bold print. If you wanted to look more like the natives, this would be a good place to start.");
			addButton(btnSlot, "V.Machine", approachItemVendingMachine, machine, "Vending Machine", "Check out the Vesperian vending machine.");
			break;
		case "J'ejune":
			output("\n\nA vending machine sits along the nearby wall, its pastel colors trying just a bit too hard to be cheery. A big red sticker on the upper-right proudly declares that the products within are “As Seen On Holovid”.");
			addButton(btnSlot, "V.Machine", approachItemVendingMachine, machine, "Vending Machine", "Check out the J’ejune vending machine.");
			break;
		case "XXX":
			output("\n\nThere’s a stereotypical adult convenience dispenser placed in a shaded spot. It’s black, headlined with an ‘XXX’ rating written in red neon lights, but pretty much bland in design otherwise. If nothing else, it’s sure to cover most of your needs for a heated night.");
			addButton(btnSlot, "V.Machine", approachItemVendingMachine, machine, "Vending Machine", "Check out the adult-only vending machine.");
			break;
	}
	
	return false;
}

//[Power Potion]
//Get yourself an energy drink. Only 5 credits!
//Restore all Energy
public function buyAPowahPotionMachine():void
{
	clearOutput();
	showBust("JOYCO_VENDING_MACHINE");
	showName("VENDING\nMACHINE");
	output("You [pc.walk] over to the vending machine and give it a look. The main draw looks to be <i>JoyCo Power-up Potions</i>, guaranteed to double your pep. The small print spells out: <i>Only while cold. JoyCo is not responsible for food poisoning as a result of consuming warm beverages.</i> You might not be able to tote these wherever you go, but at least you can get a quick pick me up whenever you’re feeling down, just five measly credits!");
	if(canVendAmazonaIcedTea()) amazonaIcedTeaBonus();
	processTime(1);
	buyAPowahPotionMenu();
}
public function buyAPowahPotionMenu():void
{
	clearMenu();
	if(pc.credits >= 5) addButton(0, "P.Potion", buyAPowahPotion,undefined, "Power Potion", "Get yourself an energy drink. Only 5 credits!");
	else addDisabledButton(0, "P.Potion", "Power Potion", "You can’t even afford a five " + (isAprilFools() ? "dogecoin" : "credit") + " drink. Any poorer and you’ll be living out of a box.");
	if(canVendAmazonaIcedTea()) addButton(1, "Amazona", approachItemVendingMachine, "Amazona", "Amazona Iced Tea", "Get yourself an Amazona drink.");
	addButton(4, "Other", approachItemVendingMachine, "JoyCo", "Other JoyCo Products", "Browse some other JoyCo-brand products.");
	addButton(14, "Back", mainGameMenu);
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
public function joyCoVendingBack():void
{
	clearOutput();
	showBust("JOYCO_VENDING_MACHINE");
	showName("VENDING\nMACHINE");
	
	output("Maybe you should try something else...");
	
	buyAPowahPotionMenu();
}

// Item vending machine
// Build a vending machine that dispenses/collects items.
public function approachItemVendingMachine(machine:String = "none"):void
{
	showName("VENDING\nMACHINE");
	processTime(1);
	
	var buy:Boolean = true;
	var planet:String = getPlanetName().toLowerCase();
	
	chars["VENDINGMACHINE"].inventory = [];
	chars["VENDINGMACHINE"].typesBought = [];
	
	switch(machine)
	{
		case "Pawn":
			showBust("");
			
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
			showBust("TAURICO_VENDING_MACHINE");
			
			chars["VENDINGMACHINE"].originalRace = "Vesperian";
			chars["VENDINGMACHINE"].keeperBuy = "The vending machine is clean, its buttons overlaid with bright holo-projections of the various products it offers. Many appear to be out of stock.\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR.\n";
			chars["VENDINGMACHINE"].keeperGreeting = "ERROR.\n";
			
			chars["VENDINGMACHINE"].inventory.push(new TauricoVenidae());
			chars["VENDINGMACHINE"].inventory.push(new TauricoVenidaeLight());
			chars["VENDINGMACHINE"].inventory.push(new ChillPill());
			chars["VENDINGMACHINE"].inventory.push(new Cackler());
			
			chars["VENDINGMACHINE"].sellMarkup = 1.05;
			chars["VENDINGMACHINE"].buyMarkdown = 0.1;
			
			shopkeepBackFunctor = null;
			break;
		// Jejune Pharma Vending Machine
		// <i>“Hi, Milly Bayes here!”</i>
		// An As Seen On TV vending machine that sells Jejune Pharmaceutical products and minor items that don’t have an explicit manufacturer. Can be located on Tavros or any other indoor area.
		case "J'ejune":
			showBust("JEJUNE_VENDING_MACHINE");
			author("Couch");
			
			chars["VENDINGMACHINE"].originalRace = "J'ejune";
			chars["VENDINGMACHINE"].keeperBuy = "You peruse the offerings on display behind the machine’s glass case. Every time your eye pauses on an item for more than a few seconds, a holovid display pops up to play whatever infomercial is associated with the product you examine. All of them feature the same bubbly sales girl with a voice that’s impressively booming, showing plenty of energy regardless of whether she’s extolling the virtues of a miracle moisturizing cream or showing off a spray for removing leftover fluids from bedsheets.\n\nYou might need a bottle of that last one for your ship, come to think of it.\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR.\n";
			chars["VENDINGMACHINE"].keeperGreeting = "ERROR.\n";
			
			if(planet != "tavros station" && flags["PLANET_3_UNLOCKED"] != undefined) chars["VENDINGMACHINE"].inventory.push(new FrontRackCream());
			chars["VENDINGMACHINE"].inventory.push(new LemonLoftcake());
			chars["VENDINGMACHINE"].inventory.push(new StrawberryShortcake());
			chars["VENDINGMACHINE"].inventory.push(new ManDown());
			chars["VENDINGMACHINE"].inventory.push(new ChillPill());
			chars["VENDINGMACHINE"].inventory.push(new DrySpell());
			
			chars["VENDINGMACHINE"].sellMarkup = 1.00;
			chars["VENDINGMACHINE"].buyMarkdown = 0.1;
			
			shopkeepBackFunctor = jejuneMachineBack;
			break;
		// A dispenser selling adult goods. Specifically it could be used for items like condensol and omega oil. Things that can unlock scenes or temporary effects for smexing.
		// You’ll find it in any bar/pub in game.
		case "XXX":
			showBust("XXX_VENDING_MACHINE");
			author("Shadefalcon");
			
			chars["VENDINGMACHINE"].originalRace = "XXX";
			chars["VENDINGMACHINE"].keeperBuy = "You [pc.walk] over to the dispenser, " + (pc.exhibitionism() >= 66 ? "a confident stride as you get the occasional looks by the murmuring bystanders" : "trying your best not to feel overly conscious of the occasional looks you get by the murmuring bystanders" ) + ". When you finally reach the black box you firmly press a button on it’s front, opening a holo screen which displays the many adult wares sold by the vending machine.\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR.\n";
			chars["VENDINGMACHINE"].keeperGreeting = "ERROR.\n";
			
			if(planet == "new texas") chars["VENDINGMACHINE"].inventory.push(new Allure());
			if(planet != "tavros station") chars["VENDINGMACHINE"].inventory.push(new BreedersBliss());
			chars["VENDINGMACHINE"].inventory.push(new Condensol());
			chars["VENDINGMACHINE"].inventory.push(new EasyFit());
			if(planet != "canadia station") chars["VENDINGMACHINE"].inventory.push(new FizzyFix());
			chars["VENDINGMACHINE"].inventory.push(new MightyTight());
			chars["VENDINGMACHINE"].inventory.push(new OmegaOil());
			chars["VENDINGMACHINE"].inventory.push(new ReductPro());
			if(!InCollection(planet, ["new texas", "canadia station"])) chars["VENDINGMACHINE"].inventory.push(new SaltyJawBreaker());
			chars["VENDINGMACHINE"].inventory.push(new Sterilex());
			if(planet != "uveto station" || flags["TLAKO_THANKED"] != undefined) chars["VENDINGMACHINE"].inventory.push(new YTRLube());
			
			chars["VENDINGMACHINE"].sellMarkup = 1.25;
			chars["VENDINGMACHINE"].buyMarkdown = 0.1;
			
			shopkeepBackFunctor = null;
			break;
		case "Amazona":
			showBust("JOYCO_VENDING_MACHINE");
			author("QuestyRobo");
			
			chars["VENDINGMACHINE"].originalRace = "Amazona";
			chars["VENDINGMACHINE"].keeperBuy = "You press the button on the machine and a small holoscreen comes out. It seems like you have some options.\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR.\n";
			chars["VENDINGMACHINE"].keeperGreeting = "ERROR.\n";
			
			chars["VENDINGMACHINE"].inventory.push(new AmazonaClassic());
			chars["VENDINGMACHINE"].inventory.push(new AmazonaLite());
			chars["VENDINGMACHINE"].inventory.push(new AmazonaPlus());
			chars["VENDINGMACHINE"].inventory.push(new Futazona());
			
			chars["VENDINGMACHINE"].sellMarkup = 1.0;
			chars["VENDINGMACHINE"].buyMarkdown = 0.1;
			
			shopkeepBackFunctor = joyCoVendingBack;
			break;
		case "JoyCo":
			showBust("JOYCO_VENDING_MACHINE");
			
			chars["VENDINGMACHINE"].originalRace = "JoyCo";
			chars["VENDINGMACHINE"].keeperBuy = "You press the button on the machine and a small holoscreen projects a menu of miscellaneous JoyCo-related products. What do you decide to buy?\n";
			chars["VENDINGMACHINE"].keeperSell = "ERROR.\n";
			chars["VENDINGMACHINE"].keeperGreeting = "ERROR.\n";
			
			chars["VENDINGMACHINE"].inventory.push(new FocusPill());
			chars["VENDINGMACHINE"].inventory.push(new LipTease());
			chars["VENDINGMACHINE"].inventory.push(new ThiccNShake());
			
			chars["VENDINGMACHINE"].sellMarkup = 1.0;
			chars["VENDINGMACHINE"].buyMarkdown = 0.1;
			
			shopkeepBackFunctor = joyCoVendingBack;
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

public function jejuneMachineBuyGo(item:ItemSlotClass, quantity:int):void
{
	showBust("");
	showName("ITEM\nPURCHASED!");
	author("Couch");
	
	output(""+ (quantity > 1? "All the ":"The ") + item.longName + " tumbles unceremoniously out of " + (quantity > 1? "their":"its") + "spot behind the glass to land in the receptacle below, positioned just low enough to make bending over to fish it out an awkward experience. A new " + (quantity > 1? "set":"one") + " has popped into " + (quantity > 1? "their":"its") + "place by the time you stand back up, though you dare not examine "+ (quantity > 1? "them":"it") + " too long lest the infomercial start playing all over again.");
	output("\n\n");
}
public function jejuneMachineBack():void
{
	clearOutput();
	showBust("");
	showName("VENDING\nMACHINE");
	author("Couch");
	
	output("After a few seconds of browsing, you opt to back away from the vending machine. As you [pc.walk] away, you can still hear the infomercials playing just as clearly as if you were still standing right next to them. My, but Milly Bayes has some pipes on her.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function xxxMachineBuyGo(item:ItemSlotClass, quantity:int):void
{
	showBust("");
	showName("ITEM\nPURCHASED!");
	author("Shadefalcon");
	
	output("You select your desired item and swipe your Codex across the dispenser’s scanner. It voices a delighted beep as it charges your account, and soon after the black box begins to hum calmly, the replicator inside it hard at work. " + (quantity > 1? "A moment later you hear a series of audible thumps as the products fall into the bottom of the vending machine":"A moment later you hear an audible thump as the product falls into the bottom of the vending machine.") +" You reach down and take " + (quantity > 1? "all ":"") + "the " + item.longName + " out of the dispenser, pocketing "+ (quantity> 1 ? "them":"it") + " away for later usage.");
	output("\n\n");
}

public function canVendAmazonaIcedTea():Boolean
{
	// Bought at certain JoyCo Vending Machines (Sheriff’s Office on Uveto, Ellie’s Shop on New Texas, The Mess on Tarkus.)
	return (InCollection(getPlanetName().toLowerCase(), ["new texas", "tarkus", "uveto station", "uveto vii"]));
}
public function amazonaIcedTeaBonus():void
{
	// Next paragraph and options are placed after current ones
	output("\n\nA small plaque is bolted onto the front of the machine has the message: <i>“Congratulations! If you are reading this, then your local JoyCo-brand vending machine has been selected for an early trial of our new line of ‘Amazona’ products!”</i>");
	output("\n\nYou see another button on the machine labeled <i>Amazona Iced Tea</i>. A small holo-projection of a muscular woman appears over the button, and starts to speak. <i>“Are you tired of being little? Do you want to unleash the queen of the jungle inside you? Then have an Amazona! Our unique cocktails of mutagens will turn you into the woman you’ve always dreamt of!”</i> It sounds like some kind of transformative. It’s pretty expensive though, <b>3000 credits</b>, sheesh!");
}
public function amazonaIcedTeaList(item:ItemSlotClass, quantity:int):String
{
	var msg:String = "\\\[ " + item.shortName + " \\\](x" + quantity + "): ";
	
	switch(item.shortName)
	{
		case "AmzIT.Clas":
			msg += "A button labeled <i>Amazona Classic</i> with a picture of a large, muscular woman on it. It costs " + (item.basePrice * quantity) + " credits.";
			break;
		case "AmzIT.Lite":
			msg += "A button labeled <i>Amazona Lite</i> with a picture of a tall, slender track star on it. It costs " + (item.basePrice * quantity) + " credits.";
			break;
		case "AmzIT.Plus":
			msg += "A button labeled <i>Amazona Plus</i> with a picture of a ridiculously curvy, yet completely ripped woman on it. It costs " + (item.basePrice * quantity) + " credits.";
			break;
		case "Futazona":
			msg += "A button labeled <i>Futazona</i> with a picture of several large, muscular women with huge cocks, engaged in a small orgy.";
			if(flags["MET_ZEPHYR"] != undefined) msg += " Wait, is that Zephyr? A disclaimer below the picture says that all of the women are paid actresses, and that not all are users of Futazona.";
			msg += " It’s priced higher than the others, at " + (item.basePrice * quantity) + " credits.";
			break;
	}
	
	return msg;
}
public function amazonaIcedTeaBuyGo(item:ItemSlotClass, quantity:int):void
{
	showBust("JOYCO_VENDING_MACHINE");
	showName("ITEM\nPURCHASED!");
	author("QuestyRobo");
	
	output("The machine hums for a second before letting out a loud clang, dispensing your selected " + (quantity > 1? "drinks":"drink") + ".");
	if(flags["PURCHASED_AMAZONA"] == undefined)
	{
		output("\n\nYou reach to grab " + (quantity > 1? "them":"it") + ", but not before a message pops up <i>JoyCo is not responsible for any injury, illness, unwanted mutation, loss of motor function, or spontaneous combustion that may be associated with this product. Please check ingredients list for any potentially allergenic material. JoyCo and associates cannot be held responsible for any damages caused as a result of overuse, please drink responsibly.</i>");
		output("\n\n... Okay then.");
		flags["PURCHASED_AMAZONA"] = 1;
	}
	output("\n\n");
}

