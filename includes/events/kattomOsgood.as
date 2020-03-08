import classes.Items.Combat.EroGasGrenade;

// Exclusions
public function pattonIsNotSupposedToBeHere():Boolean
{
	if(	rooms[currentLocation].runAfterEnter != null
	||	rooms[currentLocation].hasFlag(GLOBAL.WATERFALL)
	||	rooms[currentLocation].hasFlag(GLOBAL.LIFTUP)
	||	rooms[currentLocation].hasFlag(GLOBAL.LIFTDOWN)
	||	rooms[currentLocation].hasFlag(GLOBAL.PLANT_BULB)
	||	rooms[currentLocation].hasFlag(GLOBAL.SPIDER_WEB)
	||	rooms[currentLocation].hasFlag(GLOBAL.PRIVATE)
	||	InCollection(shipLocation, ["500", "ZS L50", "EW-M23", "KQ N32"])
	||	InCollection(getPlanetName().toLowerCase(), ["n/a", "unknown", "new texas", "zheng shi station", "spatial anomaly"])
	||	disableExploreEvents()
	)
	{
		flags["KATTOM_LOCATION"] = undefined;
		generateMap();
		return true;
	}
	return false;
}

public function pattonIsHere():Boolean
{
	// Set CD so you don't run into him immediately.
	if(flags["KATTOM_MOVE_CD"] == undefined) 
	{
		flags["KATTOM_MOVE_CD"] = GetGameTimestamp();
		flags["KATTOM_LOCATION"] = "SHIP INTERIOR"; //Probably not a real room so please don't go there, kthnx.
	}
	// If in a restricted area, remove immediately.
	if(flags["KATTOM_LOCATION"] == currentLocation)
	{
		if(pattonIsNotSupposedToBeHere()) return false;
	}
	// If 35 hours since his last move, move him.
	if(flags["KATTOM_MOVE_CD"] + 2100 < GetGameTimestamp() && rand(10) == 0)
	{
		// Exclusions
		if(pattonIsNotSupposedToBeHere()) return false;
		
		flags["KATTOM_LOCATION"] = currentLocation;
		generateMap();
		flags["KATTOM_MOVE_CD"] = GetGameTimestamp();
		setKattomsInventory();
		showBust("KATTOM_OSGOOD");
		return true;
	}
	else if(flags["KATTOM_LOCATION"] == currentLocation)
	{
		showBust("KATTOM_OSGOOD");
		return true;
	}
	return false;
}
public function setKattomHere(arg:String = ""):void
{
	if(arg == "") flags["KATTOM_LOCATION"] = currentLocation;
	else flags["KATTOM_LOCATION"] = arg;
	generateMap();
	flags["KATTOM_MOVE_CD"] = GetGameTimestamp();
	setKattomsInventory();
	return;
}

public function setKattomsInventory():void
{
	var patty:Creature = chars["KATTON"];
	patty.inventory = [];
	switch(getPlanetName().toLowerCase())
	{
		case "mhen'ga":
			//Cryropistol (Cold)
			if(rand(2) == 0) patty.inventory.push(new CryroPistol());
			//Flamethrower (Hot)
			else patty.inventory.push(new Flamethrower());
			//Spitter (Cor)
			patty.inventory.push(new SpitterPistol());
			//Venom Pistol (Pois)
			patty.inventory.push(new VenomPistol());
			break;
		case "tarkus":
			//*Acid Sprayer (Cor)
			if(rand(2) == 0) patty.inventory.push(new AcidThrower());
			//*Acid Rifle (Cor)
			else patty.inventory.push(new AcidRifle());
			//*Avenger SMG (K)
			if(rand(2) == 0) patty.inventory.push(new AvengerSMG());
			//*AutoShotgun (K)
			else patty.inventory.push(new AutoShotgun());
			//Blizzard Cryrothrower (Cold)
			if(rand(2) == 0) patty.inventory.push(new BlizzardCryrothrower());
			//Chironex scourge (Pois)
			else patty.inventory.push(new ChironexScourge());
			//Cryrorifle (Cold)
			if(rand(2) == 0) patty.inventory.push(new CryroRifle());
			//Flamer (Fire)
			else patty.inventory.push(new FlamethrowerII());
			//Warden Shield (Kin)
			patty.inventory.push(new WardenShield());
			break;
		case "myrellion":
			//Acid Launcher
			if(rand(2) == 0) patty.inventory.push(new AcidLauncher());
			//Chaingun
			else patty.inventory.push(new Chaingun());
			//Cryrolizer(R)
			if(rand(2) == 0) patty.inventory.push(new Cryrolizer());
			//ElectricLauncher (R)
			else patty.inventory.push(new ElectroLauncher());
			//Hardlight Rifle (R)
			if(rand(2) == 0) patty.inventory.push(new HardlightRifle());
			//MyrGasser
			else patty.inventory.push(new MyrVenomThrower());
			break;
		case "uveto vii":
			//Hirudo (Cor) (R)
			if(rand(2) == 0) patty.inventory.push(new Hirudo());
			//NanDeconstructor (Cor)
			else patty.inventory.push(new NANDeconstructor());
			//Entropy (Cold)
			patty.inventory.push(new Entropy());
			//Apollo Plasma Rifle (R)
			if(rand(2) == 0) patty.inventory.push(new ApolloPlasmaRifle());
			//Gatling Laser
			else patty.inventory.push(new Chainlaser());
			//Crucifer (Pois) (R)
			if(rand(2) == 0) patty.inventory.push(new Crucifer());
			//Vanquisher
			else patty.inventory.push(new Vanquisher());
			//Stormbull
			patty.inventory.push(new Stormbull());
			break;
		case "dhaal":
			patty.inventory.push(new EroGasGrenade());
			patty.inventory.push(new Rouser());
			patty.inventory.push(new GlacialAuger());
			patty.inventory.push(new IceCappers());
			patty.inventory.push(new StreetSweeper());
			break;
		default:
			patty.inventory.push(new Savicite());
			break;
	}
}

public function showKattom():void
{
	showName("KATTOM\nOSGOOD");
	showBust("KATTOM_OSGOOD");
}

//First time appearance blurb.
public function pattonAppearance():void
{
	// Button check (reset if row is full)
	var btnSlot:int = Math.max(0, (userInterface.lastButton() + 1));
	if(btnSlot >= 5)
	{
		flags["KATTOM_MOVE_CD"] = (GetGameTimestamp() - 2100);
		flags["KATTOM_LOCATION"] = "SHIP INTERIOR";
		generateMap();
		return;
	}
	
	if(flags["MET_KATTOM"] == undefined)
	{
		output("\n\nA short-statured kaithrit has set up shop all alone in the untamed wilderness. If the roly poly cat-man is bothered by the dangerous surroundings, he makes no show of it. You wager the dozen heavily armed sentry drones buzzing around him have something to do with that.");
		addButton(btnSlot,"Kaithrit",approachKattom);
	}
	//Repeat Inroom :3
	else
	{
		output("\n\nKattom Osgood, the kaithrit weapon vendor is here with his cadre of defensive guns, peddling implements of violence to locals and rushers alike.");
		addButton(btnSlot,"Kattom",approachKattom);
	}
}

public function approachKattom(back:Boolean = false):void
{
	clearOutput();
	showKattom();
	if(back)
	{
		output("<i>“I hope you’ve found your shopping experience as pleasant as my company,”</i> Kattom glibly says, <i>“but such high standards are ever so difficult to meet!”</i>");
	}
	//First time approach
	else if(flags["MET_KATTOM"] == undefined) 
	{
		output("<i>“Greetings!”</i> the kaithrit sweeps his arms wide, casting a bright red duster wide and smiling ingratiatingly. Dozens of guns hang across his rotund middle. <i>“A fine day, is it not?”</i>");
		//Bimb
		if(pc.isBimbo()) output("\n\nYou bounce up and down, nodding happily. He’s like, super nice!");
		//Bro
		else if(pc.isBro()) output("\n\nYou nod curtly.");
		//Nice
		else if(pc.isNice()) output("\n\n<i>“It is,”</i> you answer with your friendliest smile.");
		//Misch
		else if(pc.isMischievous()) output("\n\n<i>“It would be finer if I was back in a bar with a cool drink to wet my lips and a warm body to heat my bed.”</i> After a moment’s consideration, you admit. <i>“It’s not too bad.”</i>");
		//Hard
		else output("\n\n<i>“It’s all right.”</i> You cast your eyes uncaringly across the exotic locale.");
		//Merge
		output("\n\n<i>“Glorious, glorious! It’s not too often one finds himself in the company of upstanding galactic citizens out here in the boonies! Ruffians, primitives, and outlaws are my usual company, so you’ll have to excuse my effusive manner. Conversing in common tongues is such a relief. No matter how good the auto-translators are, I find them cumbersome. Don’t you, [pc.Mister] Steele?”</i> He waddles up, extending a thick-fingered hand in greeting. <i>“Kattom Osgood, of Kattom Osgood’s Curious Cannons and Rarified Rifles.”</i>");
		output("\n\nHow did he know your name? You’re a bit taken aback, but you manage to mouth, <i>“How did you know?”</i>");
		output("\n\n<i>“In this day of faster-than-light communiques and quantum resolution scanning, I would be a fool not to avail myself of every detail of my future clients.”</i> Kattom snaps a small clip onto the collar of his shirt, and a holographic tie springs into focus. <i>“Now, I can see from your attire, location, and the extranet scans provided by my lovely digital assistants that you’re a fellow Rusher, and Rushers need guns.”</i> His left eye flickers with an internal glow - probably high-end cybernetic. <i>“So, which weapons can I provide you with today, and how many would you like?”</i>");
		output("\n\nWell, a travelling weapon vendor. You could check out his stock.");
		processTime(4);
		flags["MET_KATTOM"] = 1;
	}
	else
	{
		//Repeat approach
		if(rand(5) == 0) output("Kattom smiles when you step his way. <i>“Welcome back, [pc.name]. How fortuitous that our paths would cross once more. I trust you’ve replenished your supply of credits for further dealings?”</i>");
		else if(rand(4) == 0) output("Kattom nods politely at your approach. <i>“Doing well for yourself, Steele? I certainly am. After all, guns are a girl’s best friend... pretty much anyone’s best friend, really.”</i>");
		else if(rand(3) == 0) output("Smiling broadly, Kattom snaps a clip onto his collar, and the familiar holographic tie springs into place. <i>“I trust your travels are treating you well, [pc.name]. If it isn’t, I’m sure that something in my stock will persuade them to behave.”</i>");
		else if(rand(2) == 0) output("Kattom’s eye glitters briefly as you approach, scanning you for who-knows-what. <i>“I see you’ve been busy, [pc.name]. How about a purchase from Kattom Osgood’s Discount Derringers and Magnificent Missiles to fatten your personal armory?”</i>");
		else output("Kattom hastily straightens his hair only to have one ear flick a lock out of place at the last second. <i>“Welcome back, [pc.name]! I’m pleased to let you know that Kattom Osgood’s Glorious Guns and Fusillade Farm is open for business! Stars, I love that name!”</i>");
		processTime(1);
	}
	pattonMenu();
}

public function pattonMenu():void
{
	clearMenu();
	addButton(0,"Buy Weapon",buyFromKattom);
	addButton(1,"Sell",sellToKattom);
	addButton(2,"Why Here?",askKattomWhyOutHere);
	addButton(3,"Flirt",pattonSexAttempt);
	addButton(14,"Leave",mainGameMenu);
}

//Why out here?
public function askKattomWhyOutHere():void
{
	clearOutput();
	showKattom();
	output("<i>“Why are you all the way out here? Why not set up a shop.”</i>");
	output("\n\nKattom gives his duster a sharp tug to straighten any folds or wrinkles. <i>“The core economy is a stagnant mess, captured by the various megacorporations and their endless greed. Any attempt to compete is snuffed out by legislation written by the very companies I would compete against. Worse still, most of them won’t even deal with the natives of these poor, backwards planets until they’ve been properly integrated into the UGC.”</i> He feigns shock. <i>“Can you imagine these poor people, without </i>guns<i>? Why, we might as well gift-wrap them for slavers and genocidal madmen!”</i>");
	output("\n\nIf your encounters are anything to go by, the natives are quite good at defending themselves.");
	output("\n\nThe bombastic kaithrit wiggles his fingers. <i>“Can you imagine, boogymen coming from the sky, stealing your women and children into the stars, with no way to stop them?”</i> Kattom shakes his head. <i>“Not on my watch! I provide a much-needed service! I give these people the means to exert their alien inalienable rights. Guns are the great equalizer, good " + pc.mf("sir","madam") + ", and I am nothing if not charitable with equality!”</i>");
	output("\n\nYou raise an eyebrow. <i>“So these are free guns?”</i>");
	output("\n\n<i>“Of course not!”</i> Kattom bristles, his twin tails wiggling in consternation. <i>“To do so would be to reduce oneself to little more than a voluntary slave. No, I give them </i>opportunity<i>, a far more precious commodity than any mere handout! They gain protection from a harmful universe, and if they only have incredibly rare materials to offer me in exchange, then we both benefit.”</i> He rubs his hands together, cat-like ears wiggling. <i>“It’s win-win. Now, as a fellow Rusher, I expect you’ll be paying in credits, yes?”</i>");
	processTime(3);
	addDisabledButton(2,"Why Here?","Why Here?","You already asked this.");
}

//Sex
public function pattonSexAttempt():void
{
	clearOutput();
	showKattom();
	output("As soon as you put on your best come-hither face, Kattom steps back, arms upraised in a panic. <i>“None of that please. My services are purely of the mercantile variety. Any sensual interactions would violate the terms of my latest marriages, you see.”</i> He holds up a hand, revealing three fingers with gemstones socketed into the very flesh. <i>“My wives would take me to the cleaners if I violated my vows.”</i> Kattom sighs heavily. <i>“I’m sure any of the locals would jump at the chance for fornication, if you truly need relief of that nature.”</i>");
	processTime(1);
	pc.changeLust(-5);
	addDisabledButton(3,"Flirt","Flirt","You already tried this.");
}

//Buy menu
public function buyFromKattom():void
{
	clearOutput();
	showKattom();
	shopkeep = chars["KATTON"];
	shopkeep.keeperBuy = "The completely reputable and eminently respectable Mister Osgood nods vigorously at the indication that you’d like to browse his wares. <i>“Greta, bring our guest the menu.”</i> He snaps his fingers to one of his drones, which busies itself retracting a very deadly canon to make room for a projector. <i>“I’m always cycling new material into my inventory. If we encounter one another in the future, please avail yourself of my updated stocks.”</i>\n\nA holograms snaps into focus in front of you, displaying a list of Kattom’s eclectic weaponry, attributes, and prices.\n";

	buyItem();
}

//Sell
public function sellToKattom():void
{
	clearOutput();
	showKattom();
	shopkeep = chars["KATTON"];
	shopkeep.keeperSell = "<i>“I’d like to sell something, actually.”</i>\n\nKattom tilts his head and smiles, cheeks dimpling. <i>“An enterprising merchant yourself, are you?”</i> He puts an arm around your ";
	if(pc.tallness < 60) shopkeep.keeperSell += "shoulders";
	else shopkeep.keeperSell += "waist";
	shopkeep.keeperSell += " in a way that would feel endearing if it weren’t so well-practiced. <i>“I’ll make an exception to my standard policy, just for you. Just don’t make a habit out of it, okay? Too much competition will ruin the markups for everyone.”</i>\n";

	sellItem();
}