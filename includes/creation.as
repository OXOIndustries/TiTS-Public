import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.GameData.CombatManager;
import flash.events.Event;
import classes.GameData.MailManager;
import classes.Cheats;


// Illegal character input check
public function hasIllegalInput(sText:String = ""):Boolean
{
	//var r:RegExp = /[^\w .!?,;:@#$&()*-+=]/g; // Match anything that isn't a word or a space (\w == [A-z0-9])
	
	if(sText.indexOf(" ") == 0) return true;
	var illegalChar:Array = ["<", ">", "[", "]", "\\", "\/"];
	for(var i:int = 0; i < illegalChar.length; i++)
	{
		if(sText.indexOf(illegalChar[i]) != -1) return true;
	}
	
	// Cheat codes check
	if(chars["PC"].short.length >= 1)
	{
		hasCheatInput(sText);
	}
	
	//return r.test(sText);
	return false;
}
public function hasCheatInput(sText:String = ""):Boolean
{
	var cheatFunc:Function = null;
	switch(sText)
	{
		// Gameplay/Debug
		case "clowncar": cheatFunc = Cheats.infiniteCrewSpace; break;
		case "urta": cheatFunc = Cheats.infiniteItemUse; break;
		case "idclev": cheatFunc = Cheats.RoomTeleport; break;
		case "marcopolo": cheatFunc = Cheats.exploreUnlock; break;
		case "motherlode": cheatFunc = Cheats.XPToLevel; break;
		case "poison": cheatFunc = Cheats.SJWMode; break;
		case "mitzi": cheatFunc = Cheats.MitziUnlock; break;
		case "88mph": cheatFunc = Cheats.TimeSkip; break;
		case "tistheseason": cheatFunc = Cheats.toggleSeasons; break;
		case "anofferyoucantrefuse": cheatFunc = Cheats.YakuzaUnlock; break;
		case "healthdelivery": cheatFunc = Cheats.BringMeAFox; break;
		case "beshineforever": cheatFunc = Cheats.BoobSiliconePlease; break;
		case "laplove": cheatFunc = Cheats.ClassicLapinara; break;
		case "doll": cheatFunc = Cheats.SexdollEncounter; break;
		case "ardiaschoice": cheatFunc = Cheats.ArdiaLetsYouChoose; break;
		
		// Treatment
		case "treatment": cheatFunc = Cheats.TryTreatmentHaxDefault; break;
		case "bimbo": cheatFunc = Cheats.TryTreatmentHaxCowGirl; break;
		case "bull": cheatFunc = Cheats.TryTreatmentHaxBull; break;
		case "cumcow": cheatFunc = Cheats.TryTreatmentHaxCumCow; break;
		case "amazon": cheatFunc = Cheats.TryTreatmentHaxAmazon; break;
		case "fauxcow": cheatFunc = Cheats.TryTreatmentHaxFauxCow; break;
	}
	if(cheatFunc != null)
	{
		//if(eventQueue.indexOf(cheatFunc) == -1)
		eventQueue.push(cheatFunc);
		return true;
	}
	
	return false;
}

public function creationRouter(e:Event = null):void {
	if(chars["PC"].short.length >= 1) {
		userInterface.warningText.htmlText = "<b>Are you sure you want to create a new character?</b>";
		userInterface.confirmNewCharacter();
	}
	else 
	{
		startCharacterCreation();
	}
}

public function showPCBust():void
{
	showBust(chars["PC"].bustDisplay);
}
public function creationHeader(sName:String = ""):void
{
	showLocationName();
	showName(sName);
}
public function startCharacterCreation(e:Event = null):void 
{
	initializeNPCs();
	shits["SHIP"] = new Casstech();
	pc.short = "uncreated";
	pc.level = 1;
	pc.shield = new classes.Items.Protection.BasicShield();
	pc.shieldsRaw = pc.shieldsMax();
	MailManager.resetMails();
	ChildManager.resetChildren();
	userInterface.mailsDisplayButton.Deactivate();
	CombatManager.TerminateCombat();
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	userInterface.resetPCStats();
	shipDb.NewGame();
	hours = 0;
	minutes = 0;
	days = 0;
	userInterface.hideTime();
	flags = new Dictionary();
	
	// Purge event buffer
	eventQueue = new Array();
	timestampedEventBuffer = [];
	gameOverEvent = false;

	// Codex entries
	CodexManager.unlockedEntryList = new Array();
	CodexManager.viewedEntryList = new Array();
	
	// Stat Tracking
	StatTracking.resetStorage();

	userInterface.currentPCNotes = undefined;
	//Tag as in creation.
	pc.createStatusEffect("In Creation",0,0,0,0);
	clearOutput();
	if(stage.contains(userInterface.textInput)) removeInput();
	setLocation("THE\nPAST","PLANET: TERRA","SYSTEM: SOL");
	currentLocation = "CREATION";
	shipLocation = "CREATION";
	creationHeader("THE\nPAST");
	
	//OLD
	/*
	output("Victor Steele is one of the richest men in the galaxy. His fortune was gained through years of adventuring during the Thirteenth Great Planet Rush, almost two hundred years ago. Trillions of credits and a massive corporation grew up around him. To this day, Steele Industrial Technologies and Production, or Steele Tech, is one of the most respected names in its field. Unfortunately, the many mutations Victor underwent during his journeys wreaked havoc on his genome. Anti-agathic treatments have been decreasing in effectiveness as of late, and his doctors tell him that after two full centuries of life, he has a measly two decades left. This news is unwelcome, but he’s lived a rich, full life - fuller than most. With twenty years ahead of him, the suddenly old industrialite is looking toward finding a successor... or creating one.");
	output("\n\nThat’s the solution. Victor can sire an heir or heiress to carry on his legacy and to ensure that the Steele name is honored throughout all of history. Perhaps he’ll even manage to raise them wisely enough to avoid the pitfalls he ran into as a youth. The next Planet Rush is a scant nineteen years ahead, so the timing is perfect. The United Galactic Confederacy has already sent out hundreds of warp gates, staggered so that they’ll all go online at the same time. These rushes are performed every century or two, expanding the reach of civilization light years into the stars, resulting in a galactic free-for-all. The concordant economic boom will be the perfect opportunity for Victor’s offspring to rise to greatness. They could become richer and more powerful than he ever was, and perhaps a better person as well.");
	output("\n\nThe real question is, who should the lucky mother be? A lifelong accumulation of lovers has resulted in no shortage of potential mates eager for the opportunity to provide Victor an heir. Should he choose a pure human, like himself, or perhaps a dog-like Ausar, famed for their loyal and friendly dispositions, fluffy tails, and pointed ears? Or would something else be a better choice? Decisions, decisions...");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// This part was written in a very messy fashion in the original and came in big chunks. Not the best first impression for readers. I've broken it up and ordered information in a certain way to emphasise Victor is a temporary character. The original text doesn't really portray this and leaves the reader temporarily confused as to what they're reading. It starts with 'Twenty years ago' for emphasis. I've tried to keep as much of the original text as possible, keeping the flavor and feel you intended. Notice that the page ends with 'What species would you like your character to be', emphasizing that you, the player, are now in character selection from the get go rather than guessing this via context. This is repeated through the rest of the intro, as the ending sentences were all inconsistently styled.
	output("<i>... Approximately Twenty Years Ago ...</i>");
	output("\n\nVictor Steele is one of the richest men in the galaxy. His fortune was gained through years of adventuring during the Thirteenth Great Planet Rush, almost two hundred years ago. His trillion dollar company, Steele Industrial Technologies and Production, or Steele Tech, is one of the most respected names in its field.");
	output("\n\nUnfortunately, during his adventures, Victor underwent many mutations that wreaked havoc on his genome. After two centuries of life due to longevity treatments, the mining magnate’s doctors have told him he has a measly two decades left.");
	output("\n\nThe news is unwelcome. Still, he’s lived a rich, full life - fuller than most. With twenty years ahead of him, the suddenly old industrialite looks toward siring a successor; an heir or heiress to carry on his legacy and to ensure that the Steele name is honored throughout all of history.");
	output("\n\nWith the next Planet Rush a scant 23 years ahead, the timing is ideal. Just as his offspring reaches adulthood, the United Galactic Confederacy will be expanding its borders, turning on the hundreds of warp gates it has shot out into unexplored space. The rushes - performed every century or so - always result in a galactic free-for-all.");
	output("\n\nIt’s perfect, Victor thinks. His child could rise to greatness, becoming richer and more powerful than he ever was. And perhaps, with a bit of luck, a better person as well.");
	output("\n\nThe real question is, who should the mother be? Many lovers spring to mind, both human and alien. After all, he has no shortage of them. Should his offspring be a pure human, like himself, or perhaps something a little more exotic? Decisions, decisions...");
	output("\n\n<b>What species would you like your character to be?</b>");
	
	userInterface.hideMinimap();
	userInterface.setGuiPlayerNameText("");
	userInterface.resetPCStats();
	userInterface.hidePCStats();
	userInterface.hideNPCStats();
	clearMenu();
	
	var btnSlot:int = 0;
	for(var i:int = 0; i < pcMotherRaces.length; i++)
	{
		var race:String = pcMotherRaces[i];
		var raceName:String = StringUtil.toDisplayCase(race);
		var momDesc:String = "";
		
		switch(race)
		{
			case "human":
				momDesc = "Victor’s child will be born a full-blooded human.";
				break;
			case "ausar":
				momDesc = "Victor’s child will have a dog-like ausar for a mother. Half-ausars will come into the world with anubis-like ears, canine genitalia (if male), additional hair color choices, more eye color choices, and a long, fluffy tail.";
				break;
			case "gryvain":
				momDesc = "Victor’s child would have a gryvain mother. The gryvain are a technologically advanced race of winged hermaphrodites: a halfbreed child would have scaled legs and human-style arms, a fleshy upper body, a pair of draconic wings, and a lengthy tail. Gryvain also have monochrome gold eyes and frilled ears which their children inherit, though most children with human fathers lack horns. Halfbreed gryvain can be born female or as hermaphrodites, and both sexes tend to have voluptuous figures and high sexual sensitivity.";
				break;
			case "kaithrit":
				momDesc = "Victor’s child will have a kaithrit mother, famed for their feline resemblance and doubled tails. Half-kaithrit come into the world with two feline tails, cat ears, additional hair color choices, more eye color choices, and cat genitalia (if male).";
				break;
			case "kui-tan":
				momDesc = "Victor’s child would have a kui-tan mother, a race known for its total lack of females and similarities to earth raccoons. Of course, that would make the mother a hermaphrodite - a woman with a vagina and a penis. Half kui-tan usually come into the world as a male or hermaphrodite with one bushy tail, fuzzy ears, and a knotty dick.";
				break;
			case "leithan":
				momDesc = "Victor’s child would have a leithan mother, though that race’s unique biology would mandate some very expensive scientific intervention to ensure a successful pregnancy. Leithans are powerfully built, six-legged reptile-taurs. Half-leithans come into the world with thick, prehensile tails; unique bunny-like ears; and a tauric body configuration. They have limited skin and hair color options compared to other races. Half-leithan males are born with large reptilian genitalia, and both sexes have rear-mounted sexual organs.";
				break;
			case "suula":
				momDesc = "Victor’s child would have a suula mother. Suula are a race of large, winged aliens with a distinctly shark-like appearance. A halfbreed child would have a partially-scaled body, feathery hair, and a powerful shark’s tail. Suula are a colorful race and, regardless of sex, tend to be fairly feminine and voluptuous in figure. Half-suula can be male or female.";
				break;
		}
		addButton(btnSlot, raceName, confirmRaceChoice, race, (raceName + " Mother"), momDesc);
		btnSlot++;
	}
	if (GENERATED_CHARACTER["disabled"] == undefined)
	{
		addButton(btnSlot, "Engineered", testCharGenSelection, undefined, "Engineered Race", "A wholly custom genetically engineered child. A designer babby.");
	}
}
public var pcMotherRaces:Array = ["human", "ausar", "kaithrit", "leithan", "kui-tan", "gryvain", "suula"];

public function testCharGenSelection():void
{
	clearOutput();
	output("This is just some test stuff to prove the system works at a base level.");
	
	for (var prop:String in GENERATED_CHARACTER)
	{
		output("\n\n<b>" + prop + ":</b> " + GENERATED_CHARACTER[prop]);
	}
}

public function confirmRaceChoice(race:String = "human"):void {
	clearOutput();
	switch(race)
	{
		case "human":
			output("A purely human heritage would give Victor’s child the body one would expect - two legs, two arms, two eyes, a head of hair, etc.... There’s really not much more to say about such a choice.");
			break;
		case "ausar":
			output("As a half-ausar, Victor’s child would start with dog-like ears, a canine tail, and a red, knotted penis if male. The ausar are known for their close bond with humanity and would be a likely pick for the child’s mother.");
			break;
		case "kaithrit":
			output("The kaithrit are a cat-like race with two prehensile, feline tails. They are known for their feminine appearances and exotic colorations, so any child of Victor and kaithrit would have more possible hair colors, a prettier face than normal, and two tails. Also, if the child is a male, it’ll have a soft-spined, cat-like penis.");
			break;
		case "leithan":
			output("Leithans are a race visually similar to mythological centaurs, though they trace their origins to reptile-like species and have six clawed legs. They have powerful, prehensile tails as well as a highly acute set of four ears: two tapered ones on the side of their heads, and two large bunny-like ears atop. They are known for their speed and strength, and have a distinct color palette of grays and blacks, with yellow bioluminate areas on their scales. Leithans are also much taller than normal, reaching natural heights up to nine feet tall. If the child is male, it will have a large, bulbous reptilian penis between its rear legs.");
			break;
		case "kui-tan":
			output("The kui-tan are a raccoon-like race who invariably have a phallus with multiple knots. They are also known to have fuzzy, rounded ears, fluffy tails bigger than many species’ adolescent young, and balls that engorge with seed the longer they go without release.");
			break;
		case "gryvain":
			output("Gryvain are a highly advanced race of winged hermaphrodites, blending mammalian and reptilian biology. They have darkly scaled limbs, fleshy upper bodies, prehensile tails, curling horns, and frilled ears. Their eyes are dark gold and vertically slitted. All gryvain are feminine in appearance, and most have voluptuous figures: broad egg-laying hips and large breasts. They have bulbous, reptilian phalluses with internal testes, mounted over vaginas that have rings of internal, nub-like secondary clitorises inside, which makes birth and sex extraordinarily pleasurable.");
			break;
		case "suula":
			output("The suula are large, predatory humanoid sharks. They’re considered a race of beautiful amazons, standing taller and more powerfully-built than humans, with sharp teeth and muscular wings and tails. They have shark-like scales over their body, colorfully-feathered wings and arms, and muzzles full of sharp teeth. Though anyone can see the average suula is quite voluptuous, more intimate encounters reveal that their sexual organs are full of venomous stingers that impart powerful aphrodisiacs to themselves and their partners.\n\nSuula-human hybrids typically favor their human parent, appearing as amazonian individuals with feathery hair and smoothly-scaled forelimbs. Males tend to be smaller than females, but quite well endowed.");
			break;
	}

	output("\n\nIs this the race Victor chooses?")
	clearMenu();
	addButton(0,"Yes",chooseStartingRace,race);
	addButton(1,"No",startCharacterCreation);
}

public function chooseStartingRace(race:String = "human"):void {
	clearOutput();
	pc.removeCocks();
	pc.removeVaginas();
	creationHeader("NAME AND\nRACE");
	
	//OLD
	/*
	output("Yes, " + race + " would be the best choice. A smile breaks across Victor’s face as he recalls some very... useful traits that might be beneficial to a soon-to-be galactic explorer.");
	output("\n\nHe approaches the lady in question, and of course, she agrees. The sex is as mindblowing as anyone could want from a lover who’s about to have her child be the heir to an intergalactic megacorp, and with all the Tamani-brand fertility enhancers they both took, pregnancy is assured. The only thing left to do is for the two lovebirds to go to Victor’s private clinic and make sure that only the best genes take hold in his future heir. He holds hands with his chosen partner, a knowing grin on both their faces as the skycar takes them to their destination. She doesn’t know about his pending mortality. Victor doesn’t want to spoil the mood.");
	output("\n\nVictor’s doctor sits him down while his chosen wife is taken to the medbay, and he tucks his holo-glasses into his coat pocket as he starts to grill Victor on the attributes he’d like the embryo to have, beginning with the sex. Should his heir be ");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	showBust("CREATION_DOCTOR");
	showName("CHOOSE\nNAME/SEX");
	// Removed the part where Victor is thinking about death and gloriously happy at the same time, it was a mixed focus. I've just neatened things up and spaced things out.
	output("Victor approaches the paramour in question. Without hesitation, she agrees, quite flattered to deepen her relationship with him and be the mother of his child and heir. The sex is amazing, and with the use of special TamaniCorp-brand fertility agents, pregnancy is assured.");
	output("\n\nOnly wanting the best for their future child, the two lovebirds head to Victor’s private clinic, eager to make sure only the best genes take hold in his future heir. On route, the mining magnate holds hands with the mother of his child, a knowing grin on both their faces.");
	output("\n\nWhen they arrive, Victor’s doctor sits him down, while his chosen wife is taken to the medbay. He tucks his holo-glasses into his coat pocket, looking at the expectant father with a warm smile.");
	output("\n\n<i>“So, Victor, what sex did you want the child to be?”</i> the doctor asks, <i>“Given that grin, I bet you and the lucky girl even have a name picked out.”</i>");
	output("\n\n<b>What name and sex would you like your character to have?</b>");
	
	//Set da race!
	pc.originalRace = raceToOriginalRace(race);
	//Menus vary based on race.
	clearMenu();
	switch(pc.originalRace)
	{
		case "human":
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			addButton(0,"Male",setStartingSex,1);
			addButton(1,"Female",setStartingSex,3);
			break;
		case "half-ausar":
			pc.earType = GLOBAL.TYPE_CANINE;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_FURRED);
			pc.addEarFlag(GLOBAL.FLAG_TAPERED);
			pc.tailType = GLOBAL.TYPE_CANINE;
			pc.tailCount = 1;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			addButton(0,"Male",setStartingSex,1);
			addButton(1,"Female",setStartingSex,3);
			//addButton(2,"Herm.",setStartingSex,2);
			break;
		case "half-kaithrit":
			pc.earType = GLOBAL.TYPE_FELINE;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_FURRED);
			pc.addEarFlag(GLOBAL.FLAG_TAPERED);
			pc.tailType = GLOBAL.TYPE_FELINE;
			pc.tailCount = 2;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			addButton(0,"Male",setStartingSex,1);
			addButton(1,"Female",setStartingSex,3);
			//addButton(2,"Herm.",setStartingSex,2);
			break;
		case "half-leithan":
			pc.legCount = 6;
			pc.genitalSpot = 2;
			//Clawed lizardfeet
			pc.legType = GLOBAL.TYPE_LIZAN;
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SCALED);
			pc.addLegFlag(GLOBAL.FLAG_PAWS);
			//Non-chitinous leithan arms
			pc.armType = GLOBAL.TYPE_LEITHAN;
			//>Four ears: two elfin ears on the side, two bunny ears on top. Probably need a new ear-type for this.
			pc.earType = GLOBAL.TYPE_LEITHAN;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_TAPERED);
			pc.addEarFlag(GLOBAL.FLAG_LONG);
			pc.earLength = 3;
			//>Reptilian, forked tongues
			pc.tongueType = GLOBAL.TYPE_LEITHAN;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.tailType = GLOBAL.TYPE_LIZAN;
			pc.tailCount = 1;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_SCALED);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
			pc.clearSkinFlags();
			pc.scaleColor = "black";
			CodexManager.unlockEntry("Leithans");
			addButton(0,"Male",setStartingSex,1);
			addButton(1,"Female",setStartingSex,3);
			break;
		case "half kui-tan":
			pc.earType = GLOBAL.TYPE_KUITAN;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_FURRED);
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_KUITAN;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.faceType = GLOBAL.TYPE_HUMANMASKED;
			pc.clearFaceFlags();
			pc.armType = GLOBAL.TYPE_KUITAN;
			pc.addArmFlag(GLOBAL.FLAG_FURRED);
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			CodexManager.unlockEntry("Kui-Tan");
			addButton(0,"Male",setStartingSex,1);
			addDisabledButton(1,"Female","Female","Kui-tan cannot be female.");
			addButton(2,"Herm",setStartingSex,2);
			break;
		case "half-gryvain":
			pc.legType = GLOBAL.TYPE_GRYVAIN;
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SCALED);
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_GRYVAIN;
			pc.addTailFlag(GLOBAL.FLAG_SCALED);
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_TAPERED);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.earType = GLOBAL.TYPE_GRYVAIN;
			pc.clearEarFlags();
			pc.earLength = 3;
			pc.wingType = GLOBAL.TYPE_GRYVAIN;
			pc.wingCount = 2;
			pc.eyeType = GLOBAL.TYPE_GRYVAIN;
			CodexManager.unlockEntry("Gryvain");
			addButton(0, "Female", setStartingSex, 3);
			addButton(1, "Herm", setStartingSex, 2);
			break;
		case "half-suula":
			pc.faceType = GLOBAL.TYPE_SIREN;
			pc.clearFaceFlags();
			pc.earType = GLOBAL.TYPE_SIREN;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_LONG);
			pc.earLength = 4;
			pc.hairType = GLOBAL.HAIR_TYPE_FEATHERS;
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_SIREN;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_SCALED);
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.lipColor = "black";
			pc.eyeType = GLOBAL.TYPE_SIREN;
			pc.armType = GLOBAL.TYPE_SIREN;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_FEATHERED);
			pc.legType = GLOBAL.TYPE_SIREN;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SCALED);
			CodexManager.unlockEntry("Suulas");
			addButton(0,"Male",setStartingSex,1);
			addButton(1,"Female",setStartingSex,3);
			break;
	}

	displayInput();
	userInterface.textInput.text = "";
	userInterface.textInput.maxChars = 33;
	output("\n\n\n");
}

public function setStartingSex(sex:int = 1):void {
	var race:String = "human";
	if(pc.originalRace != "human") race = pc.originalRace.substring(5);
	if(userInterface.textInput.text == "") {
		chooseStartingRace(race);
		output("<b>You must input a name.</b>");
		return;
	}
	
	if (userInterface.textInput.text.toLowerCase() == "robert'); drop table students;--")
	{
		userInterface.textInput.text = "Lil Bobby Tables";
	}
	
	// Illegal characters check. Just in case...
	if(hasIllegalInput(userInterface.textInput.text)) {
		chooseStartingRace(race);
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if(userInterface.textInput.length > 16) {
		chooseStartingRace(race);
		output("<b>Please select a name no more than sixteen characters long.</b>");
		return;
	}
	
	//Male or herm? Dick stuff.
	if (sex == 1 || sex == 2) {
		pc.createCock();
		pc.balls = 2;
		pc.ballSizeRaw = 1.5;
		switch(pc.originalRace)
		{
			case "half-ausar":
				pc.shiftCock(0,GLOBAL.TYPE_CANINE);
				pc.cocks[0].delFlag(GLOBAL.FLAG_SHEATHED); // Get rid of sheath for reasons
				break;
			case "half-kaithrit":
				pc.shiftCock(0,GLOBAL.TYPE_FELINE);
				pc.cocks[0].delFlag(GLOBAL.FLAG_SHEATHED); // 'cause kaithrits are not cool enough to have real kitty peckers
				pc.cocks[0].delFlag(GLOBAL.FLAG_TAPERED);
				break;
			case "half-leithan":
				pc.shiftCock(0,GLOBAL.TYPE_NAGA);
				pc.ballSizeRaw = 3;
				break;
			case "half kui-tan":
				pc.shiftCock(0,GLOBAL.TYPE_KUITAN);
				pc.ballSizeRaw = 5;
				pc.createPerk("'Nuki Drunk",0,0,0,0,"Get drunk twice as slow and sober up four times slower.");
				pc.createPerk("'Nuki Nuts",0,0,0,0,"Allows gonads to swell with excess seed.");
				break;
			case "half-gryvain":
				pc.shiftCock(0, GLOBAL.TYPE_GRYVAIN);
				pc.ballSizeRaw = 5;
				break;
			case "half-suula":
				//pc.shiftCock(0,GLOBAL.TYPE_SIREN);
				//pc.cocks[0].cockColor = "blue";
				pc.ballSizeRaw = 6;
				break;
		}
		//MALE!
		if(sex == 1)
		{
			pc.femininity = 30;
			pc.hipRatingRaw = 1;
			pc.buttRatingRaw = 2;
			pc.tone = 65;
			pc.hairLength = 1;
			switch(pc.originalRace)
			{
				case "half-kaithrit":
					pc.femininity = 50;
					pc.hipRatingRaw = 6;
					break;
				case "half-suula":
					pc.femininity = 49;
					pc.hipRatingRaw = 6;
					pc.buttRatingRaw = 6;
					break;
			}
		}
		//HERM!
		else
		{
			pc.femininity = 65;
			pc.hipRatingRaw = 6;
			pc.buttRatingRaw = 3;
			pc.tone = 45;
			pc.breastRows[0].breastRatingRaw = 3;
			pc.hairLength = 6;
			switch(pc.originalRace)
			{
				case "half-kaithrit":
				case "half-gryvain":
					pc.femininity = 75;
					pc.hipRatingRaw = 7;
					pc.buttRatingRaw = 5;
					break;
			}
		}
	}
	//Girls or herms? Cunt stuff
	if (sex >= 2) {
		pc.createVagina();
		switch(pc.originalRace)
		{
			case "half-ausar":
				pc.vaginas[0].wetnessRaw = 2;
				pc.vaginas[0].bonusCapacity = 20;
				pc.elasticity = 1.25;
				break;
			case "half-leithan":
				pc.shiftVagina(0,GLOBAL.TYPE_LEITHAN);
				pc.vaginas[0].wetnessRaw = 2;
				pc.vaginas[0].bonusCapacity += 20;
				break;
			case "half kui-tan":
				pc.shiftVagina(0,GLOBAL.TYPE_KUITAN);
				//pc.vaginas[0].wetnessRaw = 1;
				break;
			case "half-gryvain":
				pc.shiftVagina(0, GLOBAL.TYPE_GRYVAIN);
				pc.vaginas[0].wetnessRaw = 2;
				pc.elasticity = 1.25;
				pc.vaginas[0].bonusCapacity += 30;
				pc.vaginas[0].clits = 6;
				break;
			case "half-suula":
				//pc.shiftVagina(0,GLOBAL.TYPE_SIREN);
				//pc.vaginas[0].vaginaColor = "blue";
				pc.femininity = 85;
				pc.hipRatingRaw = 5;
				pc.buttRatingRaw = 10;
				break;
		}
		if(sex == 3)
		{
			pc.femininity = 75;
			pc.hipRatingRaw = 6;
			pc.buttRatingRaw = 3;
			pc.tone = 45;
			pc.breastRows[0].breastRatingRaw = 3;
			pc.hairLength = 10;
			switch(pc.originalRace)
			{
				case "half-kaithrit":
					pc.femininity = 85;
					pc.hipRatingRaw = 7;
					pc.buttRatingRaw = 5;
					break;
			}
		}
	}
	pc.short = userInterface.textInput.text;
	userInterface.setGuiPlayerNameText(pc.short);
	chooseHeight();
}

//Choose Height:
public function chooseHeight():void {
	clearOutput();
	creationHeader("CHOOSING\nHEIGHT");
	
	//OLD
	/*
	output("The doctor asks <i>“So, you’re going to have a </i>");
	if(pc.hasCock()) {
		if(pc.hasVagina()) output("<i>herm</i>");
		else output("<i>male</i>");
	}
	else output("<i>female</i>");
	output("<i> child, then? Very well. How tall should " + pc.mf("he","she") + " grow up to be? Please, give it in Imperial inches.”</i></i>");
	output("\n\nVictor raises an eyebrow and quips, <i>“Seriously? Inches? What is this, the 20th century?”</i></i>");
	output("\n\n<i>“Victor, I’ve known you for eighty years. We both know you’re a sucker for the classics. Don’t pretend you don’t use that archaic system just to screw with your acquaintances.”</i> The doctor smiles and continues, <i>“Now, the height?”</i></i>\n\n<b>Please give your height in inches.</b> For reference, six feet tall is 72 inches.");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	showBust("CREATION_DOCTOR");
	showName("SELECT\nHEIGHT");
	// This is just neatened up and spaced better.
	output("The doctor asks <i>“So, you’re going to have a </i>");
	if(pc.hasCock())
	{
		if(pc.hasVagina()) output("<i>herm</i>");
		else output("<i>male</i>");
	}
	else output("<i>female</i>");
	output("<i> child, then? Very well. How tall should [pc.heShe] grow up to be? Please, give it in Imperial inches.”</i>");
	output("\n\nVictor raises an eyebrow and quips, <i>“Seriously? Inches? What is this, the 20th century?”</i>");
	output("\n\n<i>“Victor, I’ve known you for eighty years. We both know you’re a sucker for the classics. Don’t pretend you don’t use that archaic system just to screw with your acquaintances.”</i> The doctor smiles and continues, <i>“Now, the height?”</i>");
	output("\n\n<b>Please give your character’s height in inches. For reference, 72 inches is about six feet tall or 182 centimeters.</b>");
	
	displayInput();
	userInterface.textInput.text = String(averageHeight());
	output("\n\n\n");
	//[Height Box]
	clearMenu();
	addButton(0,"Next",applyHeight);
	addButton(14,"Back",startCharacterCreation);
}

public function averageHeight():Number
{
	var heightMin:Number = raceHeightMin(pc.originalRace);
	var heightMax:Number = raceHeightMax(pc.originalRace);
	var heightResult:Number = (((heightMin + heightMax)/2) + 2);
	if(pc.originalRace == "half-kaithrit") heightResult -= 6;
	if(pc.originalRace == "half-leithan") heightResult += 4;
	if(pc.originalRace == "half kui-tan") heightResult -= 2;
	if(pc.originalRace == "half-gryvain") heightResult += 4;
	if(pc.hasCock()) heightResult += 5;
	//Add a little randomness:
	heightResult -= rand(3);
	heightResult += rand(3);
	// Clamp to limits
	if(heightResult < heightMin) heightResult = heightMin;
	if(heightResult > heightMax) heightResult = heightMax;
	return Math.round(heightResult);
}
public function raceHeightMin(race:String):Number
{
	var nHeight:Number = 48;
	
	switch(race)
	{
		case "half-suula":
			nHeight = ((5*12) + 10);
			if(pc.hasVagina()) nHeight += 2;
			break;
	}
	
	return nHeight;
}
public function raceHeightMax(race:String):Number
{
	var nHeight:Number = 84;
	
	switch(race)
	{
		case "half-leithan": nHeight = 108; break;
		case "half-suula":
			nHeight = (7*12);
			if(pc.hasVagina()) nHeight += 2;
			break;
	}
	
	return nHeight;
}

public function applyHeight(confirm:Boolean = false):void {
	clearOutput();
	var fail:Boolean = false;
	var heightMin:Number = raceHeightMin(pc.originalRace);
	var heightMax:Number = raceHeightMax(pc.originalRace);
	
	// Non-number and over-limit fails
	if(isNaN(Number(userInterface.textInput.text))) {
		output("Choose a height using numbers only, please. And remember, the value should be given in inches.");
		fail = true;
	}
	else if(Number(userInterface.textInput.text) < heightMin) {
		output("Choose a height at or above " + heightMin + " inches tall, please.");
		fail = true;
	}
	else if(Number(userInterface.textInput.text) > heightMax) {
		output("Choose a height at or below " + heightMax + " inches tall, please.");
		fail = true;
	}
	if(fail) {
		userInterface.textInput.text = "";
		displayInput();
		output("\n\n\n");
		clearMenu();
		addButton(0,"Next",applyHeight);
		addButton(14,"Back",startCharacterCreation);
		return;
	}
	
	if(confirm) {
		pc.tallness = Number(userInterface.textInput.text);
		if(stage.contains(userInterface.textInput)) 
			removeInput();
		chooseThickness();
		return;
	}
	
	var stringInput:String = userInterface.textInput.text;
	var newTallness:Number = Number(stringInput);
	var newFeet:Number = Math.floor(newTallness/12);
	var newInches:Number = (Math.round((newTallness - (newFeet * 12)) * 1000)/1000);
	var newCentimeters:Number = (newTallness * 2.54);
	var newMeters:Number = (newCentimeters)/100;
	
	output("You chose " + newTallness + " inch" + (newTallness == 1 ? "" : "es"));
	if(newTallness >= 12)
	{
		output(" (");
		if(newFeet > 0)
		{
			output(newFeet + " f" + (newFeet == 1 ? "oo" : "ee") + "t");
			if(newInches > 0) output(" and ");
		}
		if(newInches > 0) output(newInches + " inch" + (newInches == 1 ? "" : "es"));
		output(")");
	}
	if(newCentimeters >= 0)
	{
		output(", or " + (Math.round(newCentimeters * 1000)/1000) + " centimeters");
		if(newMeters >= 0)
		{
			output(" (" + (Math.round(newMeters * 1000)/1000) + " meters)");
		}
	}
	output(". Is this correct? If not, input a new value to retry.");
	
	displayInput();
	userInterface.textInput.text = stringInput;
	output("\n\n\n");
	clearMenu();
	addButton(0,"Confirm",applyHeight,true);
	addButton(1,"Retry",applyHeight);
}

public function chooseThickness():void {
	clearOutput();
	showBust("CREATION_DOCTOR");
	creationHeader("CHOOSING\nTHICKNESS");
	
	//OLD
	/*
	output("Marking his pad, he chuckles and clears his throat. The doctor asks, <i>“How thickset should " + pc.mf("he","she") + " be? Please note that I’m not referring to weight so much as the broadness of their overall frame - hips and shoulders, you know.”</i>");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// Just neatened this up and made the description of thickset more clear. The original explanation was a bit roundabout.
	output("The doctor notes that down on his holopad, a light chuckle escaping his lips. <i>“Okay, noted. Glad to see you’ve got this well thought out.”</i>");
	output("\n\n<i>“Alright, let’s eliminate some of the variables. How thickset would you like [pc.himHer] to be? We’re talking broadness of [pc.hisHer] overall frame - hips, shoulders, and so forth - not [pc.hisHer] weight.”</i>");
	output("\n\n<b>How thickset would you like your character to be?</b>");
	
	//[Height Box]
	clearMenu();
	addButton(0,"Very Thin",applyThickness,20);
	addButton(1,"Thin",applyThickness,30);
	addButton(2,"Lithe",applyThickness,40);
	addButton(3,"Normal",applyThickness,50);
	addButton(4,"Husky",applyThickness,60);
	addButton(5,"Thickset",applyThickness,70);
	addButton(14,"Back",chooseHeight);
}

public function applyThickness(arg:Number):void {
	var fail:Boolean = false;
	pc.thickness = arg;
	if(stage.contains(userInterface.textInput)) 
		removeInput();

	if (pc.originalRace != "half-gryvain")
	{
		chooseHairColor();
	}
	else
	{
		chooseGryvainColor();
	}
}
//Hair Color:
public function chooseHairColor():void {
	clearOutput();
	showBust("CREATION_DOCTOR");
	creationHeader("SELECTING HAIR\nPIGMENT");
	
	//OLD
	/*
	output("<i>“Great,”</i> he says absently, entering the information with his stylus. <i>“I thought of asking for " + pc.mf("his","her") + " adult weight in pounds, but knowing you, you would have taken me seriously. Obviously, your kitchen staff will be the ones who control that.”</i> He clears his throat, sombering slightly. <i>“How about hair color? We could do black, like yours was, or any of the other natural colors pretty easily.”</i>");
	*/
	
	if(pc.originalRace == "half-suula")
	{
		author("Savin");
		output("<i>“Next up is coloration,”</i> the doctor says, tapping on a holographic screen. <i>“Suula of course have incredibly vibrant colors across the feathers on their heads and, vestigially, on their forearms as well. What color were you thinking of?”</i>");
		clearMenu();
		//Blue, Red, Green, Purple, Gold, Silver
		addButton(0,"Blue",applyHairColor,"blue");
		addButton(1,"Red",applyHairColor,"red");
		addButton(2,"Green",applyHairColor,"green");
		addButton(3,"Purple",applyHairColor,"purple");
		addButton(4,"Gold",applyHairColor,"gold");
		addButton(5,"Silver",applyHairColor,"silver");
	}
	else
	{
		author("Fenoxo & JimThermic");
		// More neatening and spacing.
		output("<i>“Great,”</i> the doctor nods, entering the information with his stylus. <i>“I thought of asking for the child’s adult weight in pounds, but knowing you, you would have taken me seriously. Your kitchen staff will be the ones who control </i>that<i>.”</i>");
		output("\n\n<i>“Okaaay... what about hair color? We can do black, like yours was, or any other natural colors pretty easily.”</i>");
		output("\n\n<b>What color is your character’s hair?</b>");
		
		//[CoC-like choices with bonus options for certain half-races].
		clearMenu();
		if(pc.originalRace == "half-leithan")
		{
			addButton(0,"Black",applyHairColor,"black");
			addButton(1,"Gray",applyHairColor,"gray");
			addButton(2,"Silver",applyHairColor,"silver");
			addButton(3,"Dark Gold",applyHairColor,"dark gold");
		}
		else if(pc.originalRace == "half kui-tan")
		{
			addButton(0,"Brown",applyHairColor,"brown");
			addButton(1,"Chocolate",applyHairColor,"chocolate");
			addButton(2,"D.Brown",applyHairColor,"dark brown","Dark Brown","Dark brown hair. Pardon the abbreviation.");
			addButton(3,"Black",applyHairColor,"black");
		}
		else
		{
			addButton(0,"Black",applyHairColor,"black");
			addButton(1,"Brown",applyHairColor,"brown");
			addButton(2,"Dirty Blonde",applyHairColor,"dirty blonde");
			addButton(3,"Blonde",applyHairColor,"blonde");
			addButton(4,"Auburn",applyHairColor,"auburn");
			addButton(5,"Red",applyHairColor,"red");
			addButton(6,"Gray",applyHairColor,"gray");
			if (pc.originalRace == "half-kaithrit") {
				addButton(7,"Blue",applyHairColor,"blue");
				addButton(8,"Green",applyHairColor,"green");
				addButton(9,"Purple",applyHairColor,"purple");
			}
			if(pc.originalRace == "half-ausar") {
				addButton(7,"White",applyHairColor,"white");
			}
		}
	}
	addButton(14,"Back",chooseThickness);
}

public function chooseGryvainColor():void
{
	clearOutput();
	creationHeader("SELECTING\nPIGMENT");
	showBust("CREATION_DOCTOR");
	author("Savin");

	output("<i>“Next up is coloration,”</i> the doctor says, tapping on a holographic screen. <i>“Gryvain share a single coloration across much of their bodies: the scales on their limbs, their hair color... more intimate areas. What color were you thinking of?”</i>");

	clearMenu();
	addButton(0, "DarkBlue", applyGryvainColor, "dark blue");
	addButton(1, "DarkGreen", applyGryvainColor, "dark green");
	addButton(2, "Black", applyGryvainColor, "black");
	
	if (pc.short == "Geddy") addButton(3, "Red", applyGryvainColor, "red"); // ;D
	
	addButton(14, "Back", chooseThickness);
}

public function applyHairColor(arg:String = "black"):void {
	pc.hairColor = arg;
	pc.furColor = arg;
	chooseEyeColor();
}

public function applyGryvainColor(col:String = "black"):void
{
	pc.hairColor = col;
	pc.furColor = col;
	pc.scaleColor = col;
	if (pc.cocks.length > 0) pc.cocks[0].cockColor = col;
	if (pc.vaginas.length > 0) pc.vaginas[0].vaginaColor = col;
	pc.nippleColor = col;
	pc.lipColor = col;
	pc.eyeColor = "dark yellow";
	chooseSkinTone();
}

//Eye Color:
public function chooseEyeColor():void {
	clearOutput();
	showBust("CREATION_DOCTOR");
	creationHeader("SELECTING EYE\nPIGMENT");
	
	//OLD
	/*
	output("<i>“I thought you’d choose " + pc.hairColor + ", boss. How about eye color? Got anything in mind?”</i> The doctor glances up from his tablet and awaits Victor’s response.");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// More neatening and spacing.
	output("<i>“I thought you’d choose [pc.hairColor],”</i> the doctor smiles, looking up from his tablet. <i>“Another easy one, eye color. Got anything in mind?”</i>");
	output("\n\n<b>What color are your character’s eyes?</b>");
	
	//[Normal Eye colors + bonus half race ones]
	clearMenu();
	if(pc.originalRace == "half kui-tan")
	{
		addButton(0,"Brown",applyeEyeColor,"brown");
		addButton(1,"Green",applyeEyeColor,"green");
		addButton(2,"Hazel",applyeEyeColor,"hazel");
		addButton(3,"Amber",applyeEyeColor,"amber");
		addButton(4,"Gold",applyeEyeColor,"gold");
		addButton(5,"Copper",applyeEyeColor,"copper");
	}
	else if(pc.originalRace == "half-suula")
	{
		addButton(0,"Gold",applyeEyeColor,"gold");
		addButton(1,"Blue",applyeEyeColor,"blue");
		addButton(2,"Red",applyeEyeColor,"red");
		addButton(3,"Purple",applyeEyeColor,"purple");
	}
	else
	{
		addButton(0,"Blue",applyeEyeColor,"blue");
		addButton(1,"Green",applyeEyeColor,"green");
		addButton(2,"Hazel",applyeEyeColor,"hazel");
		addButton(3,"Brown",applyeEyeColor,"brown");
		if (pc.originalRace == "half-kaithrit") {
			addButton(4,"Amber",applyeEyeColor,"amber");
			addButton(5,"Yellow",applyeEyeColor,"yellow");
			addButton(6,"Orange",applyeEyeColor,"orange");
			addButton(7,"Violet",applyeEyeColor,"violet");
			addButton(8,"Copper",applyeEyeColor,"copper");
		}
		if(pc.originalRace == "half-ausar") {
			addButton(4,"Gold",applyeEyeColor,"gold");
		}
	}
	addButton(14,"Back",chooseHairColor);
}

public function applyeEyeColor(eyeColor:String = "brown"):void {
	pc.eyeColor = eyeColor;
	chooseSkinTone();
}

public function chooseSkinTone():void
{
	clearOutput();
	showBust("CREATION_DOCTOR");
	creationHeader("SELECTING\nSKIN PIGMENT");
	
	output("<i>“Great. How about skin pigmentation?”</i>");
	output("\n\n<b>What color is your character’s skin?</b>");
	clearMenu();
	if (pc.originalRace == "half-gryvain")
	{
		addButton(0, "Pale", applySkinTone, "pale");
		addButton(1, "Tanned", applySkinTone, "tanned");
		addButton(2, "Pink", applySkinTone, "pink");
		addButton(3, "DarkRed", applySkinTone, "dark red");
		addButton(4, "DarkGreen", applySkinTone, "dark green");
		addButton(14, "Back", chooseGryvainColor);
	}
	else
	{
		if(pc.originalRace == "half-leithan")
		{
			addButton(0,"Pale",applySkinTone,"pale");
			addButton(1,"Fair",applySkinTone,"fair");
			addButton(2,"Gray",applySkinTone,"gray");
			addButton(3,"Black",applySkinTone,"black");
		}
		else
		{
			addButton(0,"Pale",applySkinTone,"pale");
			addButton(1,"Fair",applySkinTone,"fair");
			addButton(2,"Tan",applySkinTone,"tan");
			addButton(3,"Olive",applySkinTone,"olive");
			addButton(4,"Dark",applySkinTone,"dark");
			addButton(5,"Ebony",applySkinTone,"ebony");
		}
		addButton(14, "Back", chooseEyeColor);
	}
}
public function applySkinTone(skinTone:String = "pale"):void {
	pc.skinTone = skinTone;
	if(pc.hasCock())
	{
		if(pc.cocks[0].cType == GLOBAL.TYPE_HUMAN)
		{
			if(skinTone == "dark" || skinTone == "ebony")
			{
				pc.cocks[0].cockColor = "ebony";
			}
			else pc.cocks[0].cockColor = "pink";
		}
	}
	if(pc.originalRace == "half-suula")
	{
		if(pc.hasVagina()) 
		{
			if(InCollection(pc.skinTone,["pale","fair","tan"])) 
			{
				pc.vaginas[0].vaginaColor = "amber";
				pc.nippleColor = "amber";
			}
			else if(pc.skinTone == "ebony") 
			{
				pc.vaginas[0].vaginaColor = "sable";
				pc.nippleColor = "sable";
			}
			else 
			{
				pc.vaginas[0].vaginaColor = "blue";
				pc.nippleColor = "blue";
			}
		}
		else
		{
			if(InCollection(pc.skinTone,["pale","fair","tan"])) 
			{
				pc.cocks[0].cockColor = "amber";
				pc.nippleColor = "amber";
			}
			else if(pc.skinTone == "ebony") 
			{
				pc.cocks[0].cockColor = "sable";
				pc.nippleColor = "sable";
			}
			else 
			{
				pc.cocks[0].cockColor = "blue";
				pc.nippleColor = "blue";
			}
		}
	}
	if(InCollection(pc.originalRace, ["half-suula"])) chooseScaleColor();
	else chooseBreastSize();
}

public function chooseScaleColor():void
{
	clearOutput();
	showBust("CREATION_DOCTOR");
	creationHeader("SELECTING\nSCALE PIGMENT");
	
	output("<i>“Nice. Now how about the scale color?”</i>");
	output("\n\n<b>What will your character’s scale color be?</b>");
	
	var colorList:Array = [];
	
	switch(pc.originalRace)
	{
		case "half-suula":
			colorList.push(["Blue", "blue"]);
			colorList.push(["Red", "red"]);
			colorList.push(["Green", "green"]);
			colorList.push(["Purple", "purple"]);
			colorList.push(["Gold", "gold"]);
			colorList.push(["Silver", "silver"]);
			break;
		default:
			colorList.push(["Blue", "blue"]);
			break;
	}
	
	clearMenu();
	var btnSlot:int = 0;
	for(var i:int = 0; i < colorList.length; i++)
	{
		addButton(btnSlot, colorList[i][0], applyScaleColor, colorList[i][1]);
		btnSlot++;
	}
	addButton(14, "Back", chooseSkinTone);
}
public function applyScaleColor(newColor:String = "blue"):void {
	pc.scaleColor = newColor;
	chooseBreastSize();
}

//Boob Size:
public function chooseBreastSize():void {
	clearOutput();
	showBust("CREATION_DOCTOR");
	creationHeader("SELECTING\nBREAST SIZE");
	
	//OLD
	/*
	output("<i>“Breasts?”</i>");
	//If female, pick a cup size!
	//If male, more dialogue
	if(!pc.hasVagina()) {
		output("\n\nVictor folds his arms and raises an eyebrow.");
		output("\n\nThe doctor rubs the bridge of his nose in exasperation. <i>“We both know you’re a sexual deviant. How do I know you don’t want your kid to grow up into the universe’s hottest tranz? Just pick flat if you don’t want them.”</i>");
	}
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// This one was de-creepified and mentions the normality of breast selection by a father in this era of human history. Also neatened.
	output("<i>“Breasts?”</i>");
	output("\n\nVictor folds his arms and raises an eyebrow.");
	output("\n\nThe doctor rubs the bridge of his nose in exasperation. <i>“Look, it’s not that weird a thing for parents to choose these days - it’s practically like hair or eye color.”</i>");
	if(!pc.hasVagina())
	{
		output("\n\n<i>“Plus, how do I know you don’t want your kid to grow up as the universe’s hottest tranz? It is you we’re talking about after all, Victor.”</i>");
		output("\n\n<i>“Remind me why I pay you again?”</i> Victor retorts.");
		output("\n\n<i>“Not for my sense of humor, obviously,”</i> the doctor clears his throat. <i>“Ahem. Well, just pick flat if you don’t want them.”</i>");
	}
	output("\n\n<b>What size would you like your character’s breasts to be?</b>");
	
	clearMenu();
	if(pc.originalRace == "half-suula")
	{
		if(pc.hasVagina())
		{
			addButton(0, "DD", applyBreastSize, 5);
			addButton(1, "E", applyBreastSize, 7);
			addButton(2, "Big EE", applyBreastSize, 10);
			addButton(3, "F", applyBreastSize, 11);
			addButton(4, "Big FF", applyBreastSize, 14);
			addButton(5, "G", applyBreastSize, 15);
			addButton(6, "Big GG", applyBreastSize, 18);
			addButton(13,"Whatever",applyBreastSize,5+rand(14));
		}
		else
		{
			addButton(0,"Flat",applyBreastSize,0);
			addButton(1,"A",applyBreastSize,1);
			addButton(2,"B",applyBreastSize,2);
			addButton(3,"C",applyBreastSize,3);
			addButton(13,"Whatever",applyBreastSize,rand(4));
		}
	}
	else if (pc.originalRace != "half-gryvain")
	{
		addButton(0,"Flat",applyBreastSize,0);
		addButton(1,"A",applyBreastSize,1);
		addButton(2,"B",applyBreastSize,2);
		addButton(3,"C",applyBreastSize,3);
		addButton(13,"Whatever",applyBreastSize,rand(4));
		if(pc.hasVagina()) {
			addButton(4,"D",applyBreastSize,4);
			if(pc.originalRace != "half kui-tan") addButton(5,"DD",applyBreastSize,5);
			if(pc.originalRace == "half-leithan")
			{
				addButton(6,"Big DD",applyBreastSize,6);
				addButton(7,"E",applyBreastSize,7);
			}
			addButton(13,"Whatever",applyBreastSize,rand(6));
		}
		if (pc.originalRace == "half-kaithrit" && pc.hasVagina()) {
			addButton(6,"Big DD",applyBreastSize,6);
			addButton(7,"E",applyBreastSize,7);
			addButton(8,"Big E",applyBreastSize,8);
			addButton(9,"EE",applyBreastSize,9);
			addButton(13,"Whatever",applyBreastSize,rand(10));
		}
	}
	else
	{
		addButton(0, "C", applyBreastSize, 3);
		addButton(1, "D", applyBreastSize, 4);
		addButton(2, "Big DD", applyBreastSize, 6);
		addButton(3, "E", applyBreastSize, 7);
		addButton(4, "Big EE", applyBreastSize, 10);
		addButton(5, "F", applyBreastSize, 11);
		addButton(6, "Big FF", applyBreastSize, 14);
		addButton(7, "G", applyBreastSize, 15);
	}

	addButton(14,"Back",chooseSkinTone);
}

public function applyBreastSize(size:int = 0):void {
	pc.breastRows[0].breastRatingRaw = size;
	if(pc.biggestTitSize() >= 1 && pc.femininity < 60) pc.femininity += 13;
	if(pc.biggestTitSize() >= 2 && pc.femininity < 69) pc.femininity += 13;
	if(pc.biggestTitSize() >= 3 && pc.femininity < 77) pc.femininity += 17;
	if(pc.hasCock()) chooseYourJunkSize();
	else if(pc.hasVagina()) chooseYourVagina();
	else chooseSexualGift();
}

//Junk Size (Males/Futas)
public function chooseYourJunkSize():void {
	clearOutput();
	showBust("CREATION_DOCTOR");
	creationHeader("SETTING PENIS\nLENGTH");
	
	//OLD
	/*
	output("The doctor smiles knowingly and moves on, <i>“All right, now what about the penis? It looks like we could pretty easily have it be anywhere from ");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// Neatened a tiny bit. Nothing major.
	output("<i>“All right. So, what about the penis? It looks like we could pretty easily have it be anywhere from ");
	
	clearMenu();
	
	var i:uint = 0;
	var cLengths:Array = [4, 5, 6, 7, 8];
	
	switch (pc.originalRace)
	{
		case "half-kaithrit": cLengths = [4, 5, 6]; break;
		case "half kui-tan": cLengths = [5, 6, 7, 8, 9, 10]; break;
		case "half-leithan": cLengths = [13, 14, 15, 16, 17, 18, 19, 20]; break;
		case "half-gryvain": cLengths = [5, 6, 7, 8, 9, 10, 11, 12]; break;
		case "half-suula": cLengths = [10, 11, 12, 13, 14]; break;
	}
	
	output(num2Text(cLengths[0]) + " to " + num2Text(cLengths[cLengths.length - 1]));
	
	for (i = 0; i < cLengths.length; i++)
	{
		addButton(i, (String(cLengths[i]) + "\""), applyJunkSize, cLengths[i]);
	}
	addButton(13,"Whatever",applyJunkSize,cLengths[rand(cLengths.length)]);
	
	output(" inches. How long do you want it?”</i>");
	if(cLengths[cLengths.length - 1] >= 9) output(" He rolls his eyes. <i>“You’re gonna make your kid a stallion here, aren’t you? Why do I even ask?”</i>");
	
	//NEW (cont.)
	output("\n\n<b>How long do you want your character’s penis to be?</b>");
	
	addButton(14,"Back",chooseBreastSize);
}

public function applyJunkSize(arg:Number = 0):void {
	pc.cocks[0].cLengthRaw = arg;
	pc.cocks[0].cThicknessRatioRaw = 1;
	if (pc.originalRace == "half-kaithrit") {
		pc.createStatusEffect("Uniball",0,0,0,0);
		pc.ballSizeRaw = .75;
	}

	if (pc.originalRace != "half-gryvain")
	{
		if(pc.hasVagina()) chooseYourVagina();
		else chooseSexualGift();
	}
	else
	{
		chooseGryvainBalls();
	}
}

public function chooseGryvainBalls():void
{
	pc.balls = 2;
	pc.ballSizeRaw = 5;
	
	clearOutput();
	creationHeader("SELECT\nTESTES");
	showBust("CREATION_DOCTOR");
	author("Savin");

	output("<i>“Speaking of sex characteristics, half-gryvain hermaphrodites have some variance in where they produce their seed. I’ve seen both internal and external testes, so the choice is up to you.”</i>");
	//Give choice between [Internal Testes] or [Balls]

	clearMenu();
	addButton(0, "Internal", applyGryvainBalls, false);
	addButton(1, "External", applyGryvainBalls, true);
	addButton(14, "Back", pc.hasCock() ? chooseYourJunkSize : chooseBreastSize);
}

public function applyGryvainBalls(externalBalls:Boolean):void
{
	/*
	if (externalBalls)
	{
		pc.balls = 2;
		pc.ballSizeRaw = 5;
	}
	else
	{
		pc.balls = 0;
		pc.ballSizeRaw = 0;
	}
	*/
	if (!externalBalls) pc.makeBallsInternal();

	if (pc.hasVagina()) chooseYourVagina();
	else chooseSexualGift();
}

//Vaginal Capabilities
public function chooseYourVagina():void {
	clearOutput();
	creationHeader("SELECT VAGINAL\nTRAITS");
	showBust("CREATION_DOCTOR");
	
	//OLD
	/*
	output("<i>“All right, I can specialize the vagina for capacity, extra lubrication, both, or neither. If we do both, the effects won’t be as pronounced as focusing on a single choice. I know that’s probably not the first thing you want to think about as a dad, but if the kid is gonna be taking after you, it’d be wise to tweak up at least one of those.”</i> The doctor looks at Victor expectantly.");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// De-creepified and given a bit of context as to why anyone would select this for their kid. Also neatening.
	output("<i>“All right, I can specialize the vagina for capacity, extra lubrication, both, or neither,”</i> the doctor explains, tweaking his glasses. <i>“The thing is, if we do both, the effects won’t be as pronounced as just one of those things.”</i>");
	output("\n\n<i>“I know, I know, it’s the last thing you want to think of as a dad. But if she’s going to take after you, it would be wise to tweak at least </i>one<i> of those things. Trust me, it saves on a lot of doctor visits.”</i>");
	output("\n\n<b>Do you want your character’s vagina to have extra capacity or lubrication?</b>");
	
	clearMenu();
	addButton(0,"Capacity",upgradeCapacity);
	addButton(1,"Lubrication",upgradeLubricants);
	addButton(2,"Both",fullyUpgradeCunt);
	addButton(3,"Neither",chooseSexualGift);

	if (pc.originalRace == "half-gryvain")
	{
		addButton(14, "Back", pc.hasCock() ? chooseGryvainBalls : chooseBreastSize);
	}
	else
	{
		if(pc.hasCock()) 
			addButton(14,"Back",chooseYourJunkSize);
		else 
			addButton(14,"Back",chooseBreastSize);
	}
}

public function upgradeCapacity():void {
	pc.vaginas[0].loosenessRaw += 1;
	pc.vaginas[0].bonusCapacity += 20;
	chooseSexualGift();
}
public function upgradeLubricants():void {
	pc.vaginas[0].wetnessRaw += 2;
	chooseSexualGift();
}
public function fullyUpgradeCunt():void {
	pc.vaginas[0].wetnessRaw++;
	pc.vaginas[0].bonusCapacity += 10;
	chooseSexualGift();
}

//Sexual Gift
public function chooseSexualGift():void {
	clearOutput();
	creationHeader("CHOOSING A\nSEXUAL GIFT");
	showBust("CREATION_DOCTOR");
	
	//OLD
	/*
	output("<i>“Great!”</i> Your personal physician notes your choice and says, <i>“This is one of the tougher choices future parents have to make. We can work some tweaks into your successor’s genome that’ll give them a bit of a gift, if you know what I mean - even beyond the choices you’ve made so far. The downside is that we can only safely insert one of these options into your child’s genome.”</i>");
	output("\n\n<i>“I’ll give you the quick rundown of all the choices. ‘Virile’ increases the quality of sperm produced by your offspring, even if she’s a girl that splices on a dick later. ‘Potent’ is similar to virile, but it impacts the quantity produced, rather than quality. This one seems to be pretty popular among those who can afford these kinds of modifications. ‘Elasticity’ allows for bigger insertions with less chance of, uh... stretching.”</i>");
	output("\n\nThe doctor coughs a bit nervously. <i>“‘Fertility’ enhances the chances of becoming pregnant. ‘Milky’ causes lactation to be more easily induced and much harder to stop. ‘Incubator’... well, it makes pregnancies a little faster. ‘Hung’ would enlarge the size of male organs and cause them be more receptive to future splices. Conversely, ‘mini’ would, uh, cause masculine organs to tend towards smallness - as the name implies.”</i>");
	output("\n\nVictor sighs as the doctor drones on, knowing that these could be important but a little tired of the total volume of the information.");
	output("\n\n<i>“‘Bulgy’ would cause an increase in the size of any testes as well as increased receptiveness to gonad enhancement. ‘Extra Ardor’ will cause an increase in sex drive after maturity. I bet your parents gave you that, huh? ‘Ice Cold’ would be the opposite, reducing natural sex drive. It doesn’t have any effect on aphrodisiacs or receptiveness to touch, however.”</i> The doctor touches his fingers as if counting and purses his lips, <i>“Huh, I guess that’s all of them. What’ll it be?”</i>");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// Almost completely rewritten to accommodate for tooltips, future-proof against new traits, and reduce the utter yawn factor from throwing a million descriptions of traits at the PC. Also some lore mentioning of why the PC might get more cool traits later on but for some reason can only get one at birth. Tooltips added.
	output("<i>“Great!”</i> Your personal physician notes the choice, then hands Victor the datapad. <i>“...We’re almost done, but I’ve left the trickiest for last.”</i>");
	output("\n\n<i>“What’s this?”</i> The mining magnate asks, looking downward. <i>“...A list of specialized treatments?”</i>");
	output("\n\n<i>“Sort of,”</i> the doctor explains, <i>“One of the things we can do is work a special tweak into your successor’s genome; something that will give them a special gift, even beyond the choices you’ve made thus far.”</i>");
	output("\n\n<i>“Are they safe?”</i>");
	output("\n\n<i>“Perfectly - so long as only one is inserted into your child’s genome. Any more than that risks instability. Perhaps by the time your child is an adult, we’ll have made more advances in that area. For now, though, one’s the limit.”</i>");
	output("\n\n<b>What special trait would you like your character to have?</b>");
	
	//Make sure there is a none option.
	clearMenu();
	if(pc.hasPerk("Virile"))
	{
		//pc.cumQualityRaw -= 0.15;
		pc.removePerk("Virile");
	}
	if(pc.hasPerk("Potent"))
	{
		//pc.cumMultiplierRaw -= 1;
		pc.refractoryRate -= 1;
		pc.removePerk("Potent");
	}
	if(pc.hasPerk("Elasticity"))
	{
		pc.elasticity -= 0.5;
		pc.removePerk("Elasticity");
	}
	if(pc.hasPerk("Fertility"))
	{
		//pc.fertilityRaw -= 0.15;
		pc.removePerk("Fertility");
	}
	if(pc.hasPerk("Milky"))
	{
		pc.removePerk("Milky");
	}
	if(pc.hasPerk("Incubator"))
	{
		//pc.pregnancyMultiplierRaw -= .5;
		pc.removePerk("Incubator");
	}
	if(pc.hasPerk("Hung"))
	{
		if(pc.hasCock()) {
			pc.cocks[0].cLengthRaw -= 2;
			pc.cocks[0].cThicknessRatioRaw = 1.0;
		}
		pc.removePerk("Hung");
	}
	if(pc.hasPerk("Mini"))
	{
		if(pc.hasCock()) {
			pc.cocks[0].cLengthRaw += 1;
		}
		pc.removePerk("Mini");
	}
	if(pc.hasPerk("Bulgy"))
	{
		pc.ballSizeRaw -= 4;
		if(pc.originalRace == "half kui-tan") pc.ballSizeRaw -= 5;
		pc.ballEfficiency -= 1;
		pc.removePerk("Bulgy");
	}
	if(pc.hasPerk("Extra Ardor"))
	{
		pc.removePerk("Extra Ardor");
	}
	if(pc.hasPerk("Ice Cold"))
	{
		pc.removePerk("Ice Cold");
	}
	if(pc.hasPerk("Infertile"))
	{
		pc.removePerk("Infertile");
	}
	addButton(0,"Virile",applySexualGift,"virile","Virile","Increases the quality, or impregnation chance, of the sperm you produce. <i>This perk also applies if your character is female and gains a penis in the future.</i>");
	addButton(1,"Potent",applySexualGift,"potent","Potent","Increases the quantity - the sheer amount - of sperm you produce. <i>This perk also applies if your character is female and gains a penis in the future.</i>");
	addButton(2,"Elasticity",applySexualGift,"elasticity","Elasticity","Allows you to take larger insertions, both vaginally and anally, with less chance of permanent orifice stretching.");
	addButton(3,"Fertility",applySexualGift,"fertility","Fertility","Increases your chances of getting pregnant. <i>This perk also applies if your character is male and gains a vagina in the future.</i>");
	addButton(4,"Milky",applySexualGift,"milky","Milky","Ensures that your lactation is more easily induced and much harder to stop.");
	addButton(5,"Incubator",applySexualGift,"incubator","Incubator","Shortens your pregnancy time, making pregnancies come to term quicker. <i>This perk applies to both vaginal and anal pregnancies.</i>");
	addButton(6,"Hung",applySexualGift,"hung","Hung","Increases the size of your male organs and causes them to be more receptive to future size-increasing modifications. <i>This perk also applies if your character is female and gains a penis in the future.</i>");
	addButton(7,"Mini",applySexualGift,"mini","Mini","Decreases the size of your male organs and causes them to be more receptive to future size-decreasing modifications. <i>This perk also applies if your character is female and gains a penis in the future.</i>");
	addButton(8,"Bulgy",applySexualGift,"bulgy","Bulgy","Increases the size of your testicles and causes them to be more receptive to future size-increasing modifications. <i>This perk also applies if your character is female and gains testicles in the future.</i>");
	addButton(9,"Extra Ardor",applySexualGift,"extra ardor","Extra Ardor","Ensures that you will have a higher sex drive than normal.");
	addButton(10,"Ice Cold",applySexualGift,"ice cold","Ice Cold","You will have a lower sex drive than normal, but you'll be better at teasing with a low libido than most!");
	addButton(11,"Infertile",applySexualGift,"infertile","Infertile","No matter what changes are made to your virility or fertility levels, you will be unable to produce offspring naturally.");
	addButton(13,"None",applySexualGift,"none","No Sexual Gift","You will not begin with a natural sexual gift.");
	if(pc.hasVagina()) 
		addButton(14,"Back",chooseYourVagina);
	else if(pc.hasCock()) 
		addButton(14,"Back",chooseYourJunkSize);
	else 
		addButton(14,"Back",chooseBreastSize);
}

public function applySexualGift(arg:String = "none"):void {
	switch (arg)
	{
		case "virile":
			pc.createPerk("Virile",1.15,0,0,0,"Increases the quality of your sperm.");
			break;
		case "potent":
			pc.refractoryRate += 1;
			pc.createPerk("Potent",1,0,0,0,"Increases the size of your orgasms and the speed at which you produce ejaculate.");
			break;
		case "elasticity":
			pc.elasticity += 0.5;
			pc.createPerk("Elasticity",0,0,0,0,"Increases the elasticity of your orifices and renders them more resistant to stretching.");
			break;
		case "fertility":
			pc.createPerk("Fertility",1.15,0,0,0,"Increases your odds of getting pregnant.");
			break;
		case "milky":
			pc.createPerk("Milky",0,0,0,0,"Causes lactation to be induced more easily and harder to stop.");
			break;
		case "incubator":
			pc.createPerk("Incubator",1,0,0,0,"Increases the speed at which your pregnancies progress.");
			break;
		case "hung":
			pc.createPerk("Hung",0,0,0,0,"Increases the size of your penis and how fast it grows.");
			if(pc.hasCock()) {
				pc.cocks[0].cLengthRaw += 2;
				if(pc.cocks[0].cThicknessRatioRaw < 1.1) pc.cocks[0].cThicknessRatioRaw = 1.1;
			}
			break;
		case "mini":
			pc.createPerk("Mini",0,0,0,0,"Decreases the size of your penis and how fast it shrinks.");
			if(pc.hasCock()) {
				pc.cocks[0].cLengthRaw -= 1;
			}
			break;
		case "bulgy":
			pc.createPerk("Bulgy",0,0,0,0,"Increase the size of any gonads and the speed at which they are enhanced.");
			pc.ballSizeRaw += 4;
			//HUEG BALLZ
			if(pc.originalRace == "half kui-tan") pc.ballSizeRaw += 5;
			pc.ballEfficiency += 1;
			break;
		case "extra ardor":
			pc.createPerk("Extra Ardor",0,0,0,0,"Increases lust gain over time.");
			break;
		case "ice cold":
			pc.createPerk("Ice Cold",0,0,0,0,"Slows lust gain over time and improves low libido teasing.");
			break;
		case "infertile":
			pc.createPerk("Infertile",0,0,0,0,"You are unable to reproduce offspring naturally.");
			break;
	}
	chooseAPhysicalAffinity();
}

//Pick a Physical Affinity
public function chooseAPhysicalAffinity():void {
	clearOutput();
	creationHeader("CHOOSING AN\nAFFINITY");
	showBust("CREATION_DOCTOR");
	
	//OLD
	/*
	output("<i>“Grrrreat,”</i> the doctor muses as he checks your selection. <i>“Just one more thing: I can slip in affinity for a certain attribute. These are all pretty self explanatory, so I won’t have to bore you overmuch. Suffice to say, your " + pc.mf("son","daughter") + " will be able to increase the chosen attribute more easily. We can do physique, reflexes, aim, intelligence, or willpower. Personally, I recommend intelligence.”</i>");
	output("\n\nThese ability scores are capped at five to start, though certain things like current level, starting race, cybernetic enhancements, and specific mutations can increase the maximum.\n\n<b>Physique</b> is a measurement of a character’s strength and endurance. Its primary usage to land melee strikes and increase the damage of said strikes.\n\n<b>Reflexes</b> are a measurement of piloting aptitude, but they also come in handy when having to avoid a surprise attack or trap.\n\n<b>Aim</b> is a representation of how well one can aim both hand-held and ship-board ranged weaponry.\n\n<b>Intelligence</b> increases the effectiveness of technology-based attacks, primarily those used by tech specialists. It is also useful any time one has to deal with sophisticated machinery.\n\n<b>Willpower</b> is used to counter sexual urges and addictions, resist psionics, and strengthen one’s own psionics, should a person of human descent somehow gain mind powers.\n\n<b>Libido</b>, while not an option the doc is giving, deals with how fast lust increases over time and susceptible to incidental lusts and perversions one is. It is not capped by level and scales from 1 to 100.");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// Neatened and reworded for ease of understanding. Tooltips added.
	output("<i>“Fantastic,”</i> the doctor exclaims as he checks the selection. <i>“Just one more thing: I can slip in affinity for a certain attribute. These are all pretty self explanatory, so I won’t have to bore you overmuch. Suffice to say, your " + pc.mf("son","daughter") + " will be able to increase the chosen attribute more easily. We can do physique, reflexes, aim, intelligence, or willpower. Personally, I recommend intelligence.”</i>");
	output("\n\nThese ability scores are capped at five to start, though certain things like current level, starting race, cybernetic enhancements, and specific mutations can increase the maximum. Libido, while not an option the doc is giving, deals with how fast lust increases over time. It is not capped by level and scales from 1 to 100.");
	output("\n\n<b>What ability score affinity would you like to have?</b>");
	
	clearMenu();
	addButton(0,"Intelligence",applyAffinity,"intelligence","Intelligence","Increases the effectiveness of your technology-based attacks, primarily those used by tech specialists. It is also useful any time you have to deal with sophisticated machinery.");
	addButton(1,"Physique",applyAffinity,"physique","Physique","Increases your strength and endurance. It is especially useful for increasing the damage of any melee strikes you may land on an opponent.");
	addButton(2,"Reflexes",applyAffinity,"reflexes","Reflexes","Increases your reaction time. It is a measurement of your piloting aptitude, but also comes in handy when having to avoid a surprise attack or trap.");
	addButton(3,"Aim",applyAffinity,"aim","Aim","Increases your accuracy and how well you can aim both hand-held and ship-board ranged weaponry.");
	addButton(4,"Willpower",applyAffinity,"willpower","Willpower","Increases your ability to counter sexual urges and addictions, resist psionics, and strengthen your own psionics, should a person of human descent somehow gain mind powers.");
	addButton(13,"None",applyAffinity,"none","No Affinity","You will not have a natural affinity towards any certain attribute.");
	addButton(14,"Back",chooseSexualGift);
}

public function applyAffinity(arg:String = "intelligence"):void {
	pc.affinity = arg;
	chooseHowPCIsRaised();
}
//How is the pc raised?
public function chooseHowPCIsRaised():void {
	clearOutput();
	pc.physiqueRaw = 3;
	pc.reflexesRaw = 3;
	pc.aimRaw = 3;
	pc.intelligenceRaw = 3;
	pc.willpowerRaw = 3;
	pc.libidoRaw = 3;
	pc.credits = 500;
	if(pc.affinity == "intelligence") pc.intelligenceRaw++;
	if(pc.affinity == "physique") pc.physiqueRaw++;
	if(pc.affinity == "reflexes") pc.reflexesRaw++;
	if(pc.affinity == "aim") pc.aimRaw++;
	if(pc.affinity == "willpower") pc.willpowerRaw++;
	creationHeader("CHOOSING\nUPBRINGING");
	
	//OLD
	/*
	output("<b>Some time later...</b>");
	output("\n" + pc.short + " was born without complications, but now Victor is faced with a new quandary. Just how is he going to raise his potential successor? If he pampers " + pc.mf("him","her") + ", " + pc.mf("he","she") + "’ll have a head start on life, but will likely be lacking in willpower. If Victor pushes " + pc.mf("him","her") + " into athletics, " + pc.mf("he","she") + "’ll likely develop " + pc.mf("his","her") + " physical skills over " + pc.mf("his","her") + " mental ones. Of course, the father could push his progeny towards being a bit of a bookworm, as knowledge is power, but " + pc.mf("he","she") + "’d wind up physically weaker. An austere upbringing would result in higher willpower but a little less of a financial, helping hand. The alternative to those options would be a balanced upbringing that favors nothing in particular.");
	*/
	
	//NEW
	author("Fenoxo & JimThermic");
	// This bit was partially re-written to give context to Victor's parenthood choices and his decisions to plan out Steele Jr's life. It also gives some extra description to the impact of this particular choice. Also mandatory neatening. Tooltips added.
	output("<b>... Some time later ...</b>");
	output("\n\nThankfully, [pc.name] was born without complications. But, as any parent knows, the real work has just begun.");
	output("\n\nVictor pondered on just how he would raise his " + pc.mf("son","daughter") + " and future heir. His first instinct was to pamper [pc.himHer] and give [pc.himHer] a head start on life. Still, that could lead to his " + pc.mf("son","daughter") + " lacking willpower, since [pc.heShe] never would have worked for what [pc.heShe] has.");
	output("\n\nThe mining magnate could make his heir work for everything. An austere upbringing would certainly result in a strong will, but less of a financial, helping hand. It would be tough on both of them, but it might just pay off.");
	output("\n\nIf his " + pc.mf("son","daughter") + " spent too much time working or playing, [pc.heShe] would have no time for extracurricular activities. If Victor encouraged [pc.himHer] to nurture [pc.hisHer] physical skills, [pc.heShe] would probably grow up strong and well rounded, but not so book-smart. The opposite was also true - if he pushed his child towards study, [pc.heShe] would come out mentally strong, but perhaps physically weaker.");
	//output("\n\nHowever, he could always encourage his heir to follow in his footsteps more than average, and really get to be intimate with those [pc.heShe] knows. Maybe even a little too intimate.");
	output("\n\nPerhaps the best approach was to practice moderation, and give a little time to everything. Favoring nothing in particular would mean his child wouldn’t specialize in anything, but it would also mean [pc.heShe] wasn’t lacking in anything, either.");
	output("\n\n<b>What kind of upbringing does your character have?</b>");
	
	//[Pampered][Athletic][Bookworm][Austere][Balanced]
	clearMenu();
	addButton(0,"Pampered",applyUpbringing,GLOBAL.UPBRINGING_PAMPERED,"Pampered","You begin with more starting money, but lower willpower.");
	addButton(1,"Athletic",applyUpbringing,GLOBAL.UPBRINGING_ATHLETIC,"Athletic","You begin with higher physical skills but lower mental ones.");
	addButton(2,"Bookworm",applyUpbringing,GLOBAL.UPBRINGING_BOOKWORM,"Bookworm","You begin with higher mental skills but lower physical ones.");
	addButton(3,"Austere",applyUpbringing,GLOBAL.UPBRINGING_AUSTERE,"Austere","You begin with less starting money, but higher willpower.");
	//addButton(4,"Slutty",applyUpbringing,GLOBAL.UPBRINGING_SLUTTY,"Balanced","You begin well rounded, not specialized or lacking in anything.");
	addButton(4,"Balanced",applyUpbringing,GLOBAL.UPBRINGING_BALANCED,"Balanced","You begin well rounded, not specialized or lacking in anything.");
	addButton(14,"Back",chooseAPhysicalAffinity);
}

public function applyUpbringing(arg:int = 0):void {
	flags["PC_UPBRINGING"] = arg;
	switch(arg)
	{
		//Pampered
		case GLOBAL.UPBRINGING_PAMPERED:
			pc.willpowerRaw--;
			pc.credits += 2000;
			break;
		//Athletic
		case GLOBAL.UPBRINGING_ATHLETIC:
			pc.physiqueRaw++;
			pc.reflexesRaw++;
			pc.aimRaw++;
			pc.intelligenceRaw--;
			pc.willpowerRaw--;
			pc.libidoRaw++;
			break;
		//Bookworm
		case GLOBAL.UPBRINGING_BOOKWORM:
			pc.physiqueRaw--;
			pc.reflexesRaw--;
			pc.intelligenceRaw += 2;
			break;
		//Austere
		case GLOBAL.UPBRINGING_AUSTERE:
			pc.willpowerRaw++;
			pc.credits -= 250;
			break;
		//Slutty
		/*case GLOBAL.UPBRINGING_SLUTTY:
			pc.reflexesRaw++;
			pc.intelligenceRaw--;
			pc.libidoRaw += 5;
			pc.credits += 500;
			break;*/
		//Balanced
		case GLOBAL.UPBRINGING_BALANCED:
			break;
	}

	chooseAlignment();
}

public function chooseAlignment():void {
	clearOutput();
	//Neutral neutral. Filthy neutrals.
	creationHeader("SELECT\nA NATURE");
	
	//OLD
	/*
	output("<b>You are " + pc.short + "</b> now, but the question remains, what kind of person will you be?");
	output("\n\n(This choice will affect how your character reacts to the challenges and situations " + pc.mf("he","she") + " finds " + pc.mf("him","her") + "self in. Ultimately choice will still remain with you, the player, but the way [pc.name] goes through those choices may vary with personality.)");
	*/
	
	//NEW
	author("JimThermic");
	// This was pretty much written from scratch. It gives a common vision and resource for players and writers to draw upon regarding the PC's upbringing, making them able to identify with them from the get-go, rather than 'I was born and now I'm 20 and at my dad's funeral'. Tooltips added.
	output("<b>... Some time later ...</b>");
	output("\n\nAs you, [pc.name], grow up, you");
	switch(flags["PC_UPBRINGING"])
	{
		case GLOBAL.UPBRINGING_PAMPERED:
			output(" live in the lap of luxury. Things are quite easy for you, but at the same time, you feel the warmth of being provided for by your trillionare father.");
			break;
		case GLOBAL.UPBRINGING_ATHLETIC:
			output("’re gently encouraged to take part in physical activity. Taking to it like a duck to water, you spend much of your youth sweating and putting your body to work.");
			break;
		case GLOBAL.UPBRINGING_BOOKWORM:
			output("’re gently encouraged to take up more mental pursuits. Taking to it like a duck to water, you spend most of your time reading or expanding your thinking. Your test scores are the envy of your academy.");
			break;
		case GLOBAL.UPBRINGING_AUSTERE:
			output(" don’t experience the luxuries one might expect from the heir to Steele Tech. Just like your father, you work for everything you have. Forged from adversity, you learn to value what you’ve earned, rather than expecting it to be given to you for free.");
			break;
		/*case GLOBAL.UPBRINGING_SLUTTY:
			output("’re always sleeping around, indulging in the pleasures of life. Your suitors greatly enjoyed your abilities in the bedroom, and you found yourself heavily compensated for your work.");
			break;*/
		case GLOBAL.UPBRINGING_BALANCED:
			output("’re always trying a bit of everything and anything. In the end, you come out quite balanced for it, just as your father had hoped you would.");
			break;
		default:
			output(" live your life as an enimga. There is nothing particularly worth mentioning about your early upbringing in life whatsoever...");
			break;
	}
	output("\n\nStill, the one thing a parent can never choose is exactly what kind of person their children will be. <b>When your friends talk about you, what word do they use to describe your personality?</b>");
	output("\n\n<i>(This choice will affect how your character reacts to the challenges and situations [pc.heShe] finds [pc.himHer]self in. Ultimately, the choice will still remain with you, the player, but the way [pc.name] goes through those choices may vary with personality.)</i>");
	
	clearMenu();
	addButton(0,"Kind",alignConfirm,17,"Kind","You react to most things in a kind manner, favoring compassion.");
	addButton(1,"Mischievous",alignConfirm,50,"Mischievous","You’re a light-hearted sort, neither too kind or too hard.");
	addButton(2,"Hard",alignConfirm,85,"Hard","Let’s face it, you’re a bit, no, a lot of an ass. Not that you care.");
	addButton(14,"Back",chooseHowPCIsRaised);
}

public function alignConfirm(arg:int):void {
	pc.personality = arg;
	resetBabyValues();
	chooseClass();
	//chooseGenderIdentity();
}

public function chooseGenderIdentity():void 
{
	pc.removeStatusEffect("Force Male Gender");
	pc.removeStatusEffect("Force Fem Gender");
	clearOutput();
	creationHeader("SELECT\nA GENDER");
	
	author("JimThermic");
	// Figured it'd be nice to give people this option straight up from the tutorial, instead of having to find it later via the appearance screen.
	output("<b>... And what gender do you identify as?</b>");
	output("\n\n<i>(This choice determines your character’s preferred gender and can be changed at any time in the <b>Character Appearance</b> menu.)</i>");
	
	clearMenu();
	addButton(0,"Female",genderConfirm,"female","Female","No matter your masculinity level, genitalia presence, or any other contributing factors, you will be considered female, where possible.");
	addButton(1,"Male",genderConfirm,"male","Male","No matter your femininity level, genitalia presence, or any other contributing factors, you will be considered male, where possible.");
	addButton(2,"Auto",genderConfirm,"auto","Automatic","Pronouns used to address you will be based on contributions from a number of your personal appearance properties, switching between male and female pronouns as appropriate.");
	addButton(14,"Back",chooseAlignment);
}

public function genderConfirm(pref:String):void
{
	switch(pref)
	{
		case "auto":
			pc.removeStatusEffect("Force Male Gender");
			pc.removeStatusEffect("Force Fem Gender");
			break;
		case "male":
			pc.removeStatusEffect("Force Fem Gender");
			pc.createStatusEffect("Force Male Gender");
			break;
		case "female":
			pc.removeStatusEffect("Force Male Gender");
			pc.createStatusEffect("Force Fem Gender");
			break;
	}
	
	chooseClass();
}

public function chooseClass():void {
	clearOutput();
	pc.maxOutHP();
	pc.maxOutEnergy();
	creationHeader("SELECT\nA CLASS");
		
	// Modify In Creation to know we now DO want to show stats
	(pc as Creature).addStatusValue("In Creation", 1, 1);
	
	//OLD
	/*
	output("You’re all grown up and finished with your schooling. Dad pushed you hard, which makes sense. He accomplished a lot and wants you to follow in his footsteps, but for whatever reason, he insisted you take on an occupation, and an odd one at that.");
	*/
	
	//NEW
	author("JimThermic");
	// Given a kinder spin on your dad's hands on upbringing. Also made the choice of your career yours rather than your dad's, since you're old enough by this point. Pretty much written from scratch.
	output("You let out a long sigh. Now that you’ve finished your schooling, your whole life is ahead of you. Memories of your dad pushing you forward spring to mind. After all, you’ve got a whole mega-corp to take over one day.");
	output("\n\nStill, before you take over the reins, it seems he wants you to take up a profession. He’s got some suggestions - your dad <i>always</i> does - and they’re pretty odd ones at that.");
	output("\n\nYou stare at the list. Smuggler, Mercenary, Tech Specialist? As intriguing as these choices are, are they really okay job prospects for a future CEO?");
	output("\n\n<b>What kind of class would you like your character to be?</b>");
	
	clearMenu();
	addButton(0,"Smuggler",classConfirm,GLOBAL.CLASS_SMUGGLER);
	addButton(1,"Mercenary",classConfirm,GLOBAL.CLASS_MERCENARY);
	addButton(2,"TechSpecialist",classConfirm,GLOBAL.CLASS_ENGINEER);
	addButton(14,"Back",chooseAlignment);
}
public function classConfirm(arg:int = 0):void {
	clearOutput();
	creationHeader("SELECT\nA CLASS");
	
	switch(arg)
	{
		case GLOBAL.CLASS_SMUGGLER:
			output("<b><u>Smuggler</u></b>:\nAs a smuggler, your abilities would rely heavily on having good reflexes and either aim or physique, depending on your method of attack. You’d learn to be pretty sneaky, fly well, and hit your foes where they least expect it, all while making your living in the underbelly of the United Galactic Confederacy, or U.G.C. The life of a smuggler is one of profit through luck and skill.");
			break;
		case GLOBAL.CLASS_MERCENARY:
			output("<b><u>Mercenary</u></b>:\nAs a mercenary, you’d depend on raw physique or aim for your attacks, focusing more on a good battle plan and tough armor than anything else. You’d learn to overpower your foes with sheer strength and determination, defend yourself with all manner of weapons and equipment, and fly a ship when the situation calls for it. The life of a mercenary is one of profit through violence.");
			break;
		case GLOBAL.CLASS_ENGINEER:
			output("<b><u>Tech Specialist</u></b>:\nAs a tech specialist, your abilities would rely heavily on your intelligence and aim. You’d learn to work with all kinds of technologies, perhaps even make your own robotic defense turrets! Your intellect would be your greatest weapon, though you wouldn’t shy away from tweaking your own high-tech ranged weaponry. The life of a tech specialist is one of profit through smart decisions and superior technology.");
			break;
	}
	output("\n\nIs this the career you’d like to pursue?");
	
	clearMenu();
	addButton(0,"Yes",setClass,arg);
	addButton(1,"No",chooseClass);
}

public function setClass(arg:int = 0):void {
	pc.characterClass = arg;
	switch(arg)
	{
		case GLOBAL.CLASS_SMUGGLER:
			pc.rangedWeapon = new HoldOutPistol();
			break;
		case GLOBAL.CLASS_MERCENARY:
			pc.rangedWeapon = new EagleHandgun();
			break;
		case GLOBAL.CLASS_ENGINEER:
			pc.rangedWeapon = new ScopedPistol();
			pc.rangedWeapon.shortName = "S.Pistol*";
			pc.rangedWeapon.tooltip = "This compact laser pistol is equipped with a rather impressive scope and energy cell of your own manufacture. It is quite accurate but relatively low-powered.";
			TooltipManager.addFullName(pc.rangedWeapon.shortName, StringUtil.toTitleCase(pc.rangedWeapon.longName));
			TooltipManager.addTooltip(pc.rangedWeapon.shortName, pc.rangedWeapon.tooltip);
			pc.rangedWeapon.hasUniqueName = true;
			pc.rangedWeapon.hasRandomProperties = true;
			pc.shield = new classes.Items.Protection.DecentShield();
			break;
	}
	pc.meleeWeapon = new Knife();
	pc.armor = new DressClothes();
	pc.shieldsRaw = pc.shieldsMax();
	if(!pc.hasVagina()) 
		pc.lowerUndergarment = new PlainBriefs() // (items["9"]);
	else 
		pc.lowerUndergarment = new PlainPanties() // (items["8"]);
	if(pc.biggestTitSize() < 1) 
		pc.upperUndergarment = new PlainUndershirt() // (items["11"]);
	else 
		pc.upperUndergarment = new PlainBra() // (items["10"]);
	if(customPCCheck(false)) 
	{
		nameOfDestinyChoice();
	}
	else
	{
		tutorialSkipOption();
		pc.maxOutHP();
	}
}

//Tutorial Skip Option
public function tutorialSkipOption():void {
	clearOutput();
	
	currentLocation = "TAVROS HANGAR";
	shipLocation = "TAVROS HANGAR";
	creationHeader("TUTORIAL\nSKIP");
	
	output("Would you like to play through the story and tutorial or skip to gameplay?");
	
	//[Tutorial] [Skip]
	clearMenu();
	if (pc.hasVagina() || pc.hasCock()) addButton(0, "Tutorial", tutorialIntro);
	else addDisabledButton(0, "Tutorial", "Do Tutorial", "You must have genitals available in order to play through the tutorial fight.");
	addButton(1, "Skip", skipCeliseOption, undefined, "Skip Fight", "Skip the tutorial fight.");
}

//Death of a Great Man
public function tutorialIntro():void {
	clearOutput();
	creationHeader("PRESENT\nDAY");
	showBust("");
	
	pc.removeStatusEffect("In Creation");
	output("Your dad’s health had been declining throughout your years of education, but you never really worried too much about it. He was super rich, able to afford his own private doctors, so the thought that one day he could disappear never entered your mind. When you started your career, he was there to see you off, smiling gregariously, but your job made it difficult to stay in touch. Most communications were done via written messages, until even those became scarce. You had assumed it to be a consequence of your different schedules and busy work lives, then...");
	output("\n\nThe news of his death arrived in a brief missive, containing an invitation to a funeral as well as a travel voucher to get you there. You quit your job on the spot. The way Dad talked, you’re sure he would have wanted you to take over the family business. What could have killed him? He always seemed so big and imposing. Even when his back was bent by age, he still had vital energy about him, seeming as busy as a man a tenth of his age. You don’t know why anti-agathic treatments stopped working on him. Worse, he aged far more rapidly than he should have, losing his youth in a short decade.");
	output("\n\nYou shake your head to chase away the unwelcome thoughts and focus on packing. The trip is boring, leaving you with nothing to think about except life without your father and the uncertain future ahead. Hopefully the old man was lucky enough to go out in a dignified way.");
	output("\n\nYour transport pulls up to Tavros Station, where the service is being held. Adjusting your finest clothes, you walk through the airlock and up some old-fashioned steps towards the theater Dad’s money bought him, trying to keep your eyes clear as you breeze past a surprisingly low amount of paparazzi. They must have gotten decent security this time.");
	output("\n\nYou push open the doors and step inside...");
	clearMenu();
	addButton(0,"Next",tutorialIntro2);
}

public function tutorialIntro2():void {
	clearOutput();
	creationHeader("THE\nFUNERAL");
	showBust("MAKI");
	
	output("The funeral is closed casket with no viewing, which is expected given the shape Dad was in the last time you saw him. His body was riddled with the lines of age and marked with liver spots and pre-cancerous lumps, and he didn’t want to be remembered that way. Thankfully, the ceremony is swift and fairly small. There are only family and friends here, though you wager a large amount of the ‘family’ is distant relations hoping to catch some of the inheritance.");
	output("\n\nMuch of the wake passes in a daze, with you swarmed by distant relations and well wishers, forced to shake hands and share hugs with people you don’t know while they offer barely-felt, useless platitudes that do nothing to assuage your loss.");
	output("\n\nYou’re on your way over to your father’s real friends, people you’ve actually seen around his mansion growing up, when his lawyer intercepts you and pulls you aside.");
	output("\n\n<i>“Come, we must talk...”</i>");
	//[Next]
	clearMenu();
	addButton(0,"Next",tutorialIntro3);
}

public function tutorialIntro3():void {
	clearOutput();
	creationHeader("THE\nWILL");
	showBust("MAKI");
	
	output("You follow the lawyer’s brisk stride with a bit of difficulty. He’s a samarin; long-limbed, yellow-skinned, and not overly inclined to slow his walk for your comfort. He also talks the entire way.");
	output("\n\n<i>“Your father’s will was a bit unconventional. He’s lucky my firm has had such wonderful dealings with him over the years, or I would not have been willing to undertake such a... complicated executorship.”</i>");
	output("\n\nYou shrug, figuring your dad had a lot of wealth to distribute.");
	output("\n\nThe lawyer’s quills bristle at your noncommittal response, but he carries on. <i>“Regardless of the headache my best client’s death has caused me, I’m pleased to officiate this bit of business. Victor spoke rather highly of you, and he didn’t say that about just anyone, I assure you.”</i>");
	output("\n\nThe lawyer turns to regard you with a smile as he waits for you to catch up, clapping you on the back when you’re in reach. <i>“My name is Maki. We’ve never been formally introduced, I suppose.”</i> He extends a coarse, dry hand and you shake it");
	if(pc.isNice()) output(".");
	else if(pc.isMischievous()) output(", commenting that he already has your name.");
	else output(", waiting for him to finish.");
	output(" He continues, <i>“To be brief, your dad rented out most of the hangars on this station for you. He also had a state of the art, xeno-compatible daycare facility built here to house any future offspring you create. I have to give him credit, he planned ahead. Construction has been going on here for the past four years at his behest.”</i>");
	
	output("\n\nGrinning at your surprise, the tawny alien opens a door to the side and steps inside, still talking. <i>“Victor knew he’d be dying around this time since before your birth. I suppose he didn’t want the knowledge weighing over you. Medical science is amazing, but your father underwent so many mutations in his life that he was barely considered human by the time he finished carving out his fortune. Sure, he looked fine when he came home, but he only managed that by taking on the most humanesque mutations from the various races he encountered. I shudder to imagine how long that took him, or how expensive it was to purchase specific splices.”</i>");
	
	output("\n\nWell, that explains the melancholy tone some of his missives took whenever you had been making plans to visit him in the future. A plain metal chair creaks as the lawyer takes his seat behind a similarly austere desk, smoothing his quills into a semblance of slicked-back hair. He opens a drawer and drops two items on the table: a simple injector and a rectangular, leather-wrapped object. The injector is filled with a silvery, viscous fluid. The other object has the leather wrapped around one side of it, leaving polished metal sides exposed.");
	
	output("\n\n<i>“Take them, they’re yours. Both custom work. Both very, very powerful pieces of technology.”</i>");
	
	output("\n\nYou heft the tablet, wondering how it could be that expensive, even with the Earth-leather binding and quality materials used in its construction. Once you pull back the cover, you expose a high resolution tablet running a custom operating system.");
	output("\n\n<i>“Greetings, " + pc.short + ". I am the Codex. You may address me as Codex. I am a simple virtual intelligence, or V.I. in common parlance, programmed to assist you in cataloging new life, resources, and technologies. I am equipped with long-range extranet transmitters and receivers, allowing for communication and data access in most locations. There is a short-range life sensor embedded in me that allows me to warn you of impending danger. Upon detecting a new species, I will collate all extranet-available data on the species for you to peruse within a minute or two. I have haptic feedback on my screen and do accept voice commands, " + pc.mf("Master","Mistress") + " " + pc.short + ".”</i>");
	
	output("\n\nYou fold the sophisticated computer’s cover closed and find that its supple case comes complete with a connector that allows it to be easily hung from a belt. Snapping it on, you look closer at the injector and ask, <i>“So what’s this then?”</i>");
	output("\n\nThe lawyer steeples his fingers and says, <i>“Microsurgeon immune boosters. Top of the line. Your dad will tell you more.”</i> He gestures towards a second door set into the wall beside you. <i>“Go on through.”</i>");
	output("\n\nYou take the injector and open the door, unsure just how much weirder this can get...");
	//[Next]
	clearMenu();
	addButton(0,"Next",tutorialIntro4);
}

public function tutorialIntro4():void {
	clearOutput();
	creationHeader("THE\nWILL");
	showBust("");
	
	output("The next room is empty, save for a comfy looking, leather recliner. You actually recognize it as one of your father’s favorites. The arm rests are only a little more worn than you remember. A holo projector protrudes from the ceiling, aimed at the empty space in front of the chair. With nothing else to do, you seat yourself. The projector kicks on and your Dad’s face appears.");
	output("\n\n<i>“Hey there, " + pc.mf("sport","princess") + ". If you’re seeing this, then my wrinkled old ass has finally kicked the bucket. I hope you aren’t too torn up over it; I’ve lived a long full life, longer than most people are lucky enough to live. Do me a favor and knock back a whiskey for me after this,”</i> the phantom image of your father says. A hand clips in front of his face as he rubs at his age-silvered goatee. <i>“Unfortunately, while I am seeing that your mother is taken care of, I’m not just handing the company over to you. Not yet, anyway.”</i>");
	output("\n\nYou glance down at the Codex and the vial in your hand. What did the old coot plan for you?");
	output("\n\n<i>“I know you’ve probably been too busy to keep up on the news, with the work I’ve pushed you into, but the fourteenth planet rush ought to be starting about now.”</i> A note appears over the recording, indicating the planet rush started almost two months ago, though most gates have only started going online in the past few weeks. <i>“I have to make sure you’ve grown into a " + pc.mf("man","woman") + " worthy of running the business, " + pc.short + ", so I’m putting you through what I went through, after a fashion. If you want to take over the company, you’re going on the planet rush!”</i>");
	output("\n\nHuh. Well, you suppose the careers he pushed you towards make a bit more sense in light of that. Your father made his fortune during the thirteenth planet rush, and he obviously intends for you to prove your mettle in the same way.");
	output("\n\n<i>“Maki should have given you the Codex and immune boosters by now. I’m sure the V.I. inside it has already explained what it can do for you, but to summarize: it’s going to be your best friend. You can use it to stake claims on untapped minerals and resources that the boys back home will run through the legal system. We’ll deliver you a stipend on each usable discovery.”</i>");
	output("\n\nVictor coughs repeatedly, holding a rag up in front of himself that darkens with what you assume to be flecks of blood in the monochromatic recording. You’d think he could have sprung for a color hologram. His coughs clear up and he continues, <i>“Sorry, health isn’t what it used to be.”</i> He laughs after that, realizing that for you, he’s dead. <i>“Anyhow, the immune boosters. Those micro-scale bots will reproduce in your body and safeguard it from some of the worst the universe can throw at you. They aren’t perfect, and more benign infections might slip through, but they’ll keep you from catching rot lung from a Trinerian. A word of caution: they’ll help you digest things that would normally be impossible for a human, but they’ll splice you to do it. You eat the wrong native foods, and you’ll wind up looking like a native. You might even start to feel like one, mentally. I’m told it’s like forced, convergent evolution. Point is, it isn’t perfect. Relying on it too often will build up too much <b>Taint</b> in your system, and you’re better off avoiding that.”</i> Victor’s features fall at the mention. <i>“Read up on it in your Codex if you haven’t already. I don’t want you winding up like me. You’re a good kid, and if you play your cards right, you’ll get to live three times as long.”</i> His eyes are watery. <i>“Take care, kiddo.”</i>");
	output("\n\nYou turn the microsurgeon immune boosters over in your hand, debating whether to use them.");
	output("\n\n<i>“This recording is set up to repeat until you do it, " + pc.mf("son",pc.short) + ".”</i>");
	output("\n\nSighing, you press the injector port to the inside of your arm.");
	output("\n\n<i>“This recording is set up to rep-”</i>");
	output("\n\nThe injector hisses as it pricks your skin, pouring its payload into your veins. There’s a bit of burning pain, but nothing as bad ");
	switch(pc.characterClass)
	{
		case GLOBAL.CLASS_SMUGGLER: output("as the time you dropped your cargo on your foot, breaking more than a few toes in the process"); break;
		case GLOBAL.CLASS_MERCENARY: output("as the time you took a slug in the leg"); break;
		case GLOBAL.CLASS_ENGINEER: output("as the time you shocked yourself on an arc spanner"); break;
	}
	output(". You grow a little flushed for a moment as the tiny machines settle into you. It passes swiftly. All things considered, you feel... the same.");
	output("\n\n<i>“Atta " + pc.mf("boy","girl") + ". I had something like that made for me after a particularly rough infection, though it wound up mutating me from exotic species’ sexual fluids as well.”</i>");
	output("\n\nA fucking horndog until the end. Of course.");
	output("\n\nThe recording smiles wistfully for a moment before resuming, <i>“I suppose that might have contributed to my demise, but damn, it was worth it. You’ll see for yourself once you get out there.”</i>");
	output("\n\nSure, whatever.");
	output("\n\n<i>“I’ve arranged to have a few dozen probes sent through the gates once they open. Each one is military grade, hardened and keyed to only open for one of our family, so don’t lose too much of yourself. They all have clues pointing towards other probes secreted inside them, except for one. One has my personal, encrypted key. With that, you can open my deposit box in the bank I own on this station and take control of my company,”</i> Even projected through the soulless holoprojector, your dad’s spirit shines through his tear-misted eyes. <i>“I’m sure you’ll make me proud out there.”</i>");
	output("\n\nThe projection of your father tilts its head, gesturing towards another door behind it. <i>“Through the door behind, you’ll find a hangar with the ship I started my journey on, repaired to usable condition and outfitted with standard, modernized technology. It’s a good starting point, but you should see if you can jump up to something better, particularly if you pick up the number of crewmates I did. That little junker can only hold a few people.”</i>");
	output("\n\nYou rise to progress, but Dad keeps talking. <i>“One more thing... there’s a Galotian in the next room, right next to the ship’s key. If you want to do this, you’ve gotta subdue her. Galotians are voracious protein hunters, but they’re not truly dangerous. She’s still a tough little foe, though. I’ve set up some recordings to assist you in learning how to handle creatures like this during your adventures.”</i> Dad winks. <i>“Good luck!”</i>");
	//[Open Door]
	clearMenu();
	addButton(0,"Open Door",openDoorToTutorialCombat);
}
//The Introduction of Celise (Goo Girl)
public function openDoorToTutorialCombat():void {
	clearOutput();
	showCelise();
	creationHeader("YOUR\nINHERITANCE");
	
	output("You open the doorway and step through a little hesitantly, your hands on your " + pc.rangedWeapon.longName + " and " + pc.meleeWeapon.longName + " in case you need them. Visible light slowly increases as the systems dial up in response to your presence, illuminating an amorphous green blob that huddles in the corner. The semi-transparent, emerald mass bulges out at the base and turns to regard you. You aren’t sure how you can make such an assessment when it has no visible face or eyes, but it definitely seems to be reacting to you and you alone. Lurching violently, a bubbling mass erupts from the top of it, sparkling as it builds higher and higher, the cylindrical distention reforming into a more familiar, humanoid shape.");
	output("\n\n");
	showImage("CeliseGreeting");
	output("\n\nDense insets reveal themselves to be eyes. Darker hued bulges resolve into shapely lips. Excess material drapes down the back of the growing creature into a mane of unkempt, wild hair. The alien makes a sound that resembles a sigh of relief as arms separate from the sides of what must be its torso, while strings of fluid hang between the newborn appendages and the rest of her, reminding you just how gooey this thing is. Finally, the front of the chest bulges out into a pair of pert breasts. At least, they seemed that way at first. More and more liquid flows from seemingly endless reservoirs inside the thing, bloating the improvised mammaries bigger, fuller, and rounder with each passing second. The goo-girl doesn’t stop them until they obscure the bulk of her torso, reminding you of some of the racier porn-stars out there on the extranet.");
	output("\n\nWith her bust jiggling and wobbling in such a titanic manner that you feel it might separate from her chest, the gelatinous gal runs her hands over and through the new, bulgy boobs, giggling as your eyes follow her motions. She chirps, <i>“Hiya! You look like you taste pretty good! I think I’ll drain you dry...”</i>");
	output("\n\nShe lurches forward, and for a second, you fear you’ll be engulfed before you can react. A blue flash interrupts her pell-mell undulations, and your Dad’s face appears between you, suspended in the air. He explains, <i>“Celise here is a fairly simple girl with simple needs. Unfortunately, she doesn’t respect anyone until she feels they’ve earned it. You’re going to have to fight her if you want to get the keys to your new ship.”</i>");
	output("\n\nDamnit, Dad!\n\n<b>It’s a fight!</b>");
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(celise);
	// These are configured by default, but can be overriden after a call to newGroundCombat^
	// CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	// CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(defeatCelise);
	CombatManager.lossScene(function():void { } ); // The loss scene MUST be set, this is just an end-run for celise.
	CombatManager.displayLocation("CELISE");
		
	addButton(0, "Next", CombatManager.beginCombat);
}

//Win
public function defeatCelise():void
{
	clearOutput();
	showCelise();
	creationHeader("\nCELISE");
	
	output("Celise groans, <i>“Come on, fuck me! Please? Don’t just... leave me like this! I need your juiiiiice!”</i> The last word comes out as a high-pitched, nearly orgasmic whine. Her masturbation gets faster and more lewd with every passing second.");
	output("\n\nVictor’s hologram faces you and explains, <i>“If you’re seeing this, you learned how to disable Celise. Good work. The key is on the shelf next to the exit.”</i> He sighs and continues, <i>“Most things you run into won’t be nearly as easy to deal with. You’ll want to make sure to master the skills of your vocation and use them to the best of your ability. As you develop your abilities, you’ll find that many of them can be chained together to be more effective. Make sure you do that, or you’ll have a hard time beating some of the galaxy’s worst.”</i>");
	output("\n\nYou put away your weapons and go to grab your key when a barely cohesive hand wraps around your " + pc.foot() + ". There isn’t enough force behind it to immobilize you, but it does catch your attention. Celise is looking up at you with pleading eyes that would make an Earth puppy proud.");
	output("\n\n<i>“If you give Celise what she wants now, you’ll probably earn her loyalty. That choice is up to you; I can’t make it for you. Galotians are a fiercely loyal people once they choose to follow someone, and though she has few marketable skills, it might be good to have a companion out there in the void. Whatever you choose, I’m sure you’ll do me proud.”</i> Victor smiles dryly. <i>“After all, I bet my legacy on it.”</i>");
	output("\n\nThe recording winks off.");
	output("\n\nWhat do you do with Celise? Ignore her, or feed her and take her on your crew?");
	output("\n\n(Note that choosing to ignore Celise will remove her from the game.)");
	
	CombatManager.genericVictory();
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	
	clearMenu();
	addButton(0,"Ignore Her",ignoreCelise);
	addButton(1,"Feed Celise",takeCelise);
}

public function skipCeliseOption():void
{
	clearOutput();
	creationHeader("TUTORIAL\nSKIP");
	
	showCelise();
	chars["PC"].removeStatusEffect("In Creation");
	output("What do you do with Celise? Ignore her, or take her on your crew?");
	output("\n\n(Note that choosing to ignore Celise will remove her from the game.)");
	
	clearMenu();
	addButton(0, "Ignore Her", ignoreCeliseSkip);
	addButton(1, "Take Her", takeCeliseSkip);
}

public function ignoreCeliseSkip():void
{
	jackJillSkip();
}
public function takeCeliseSkip():void
{
	flags["RECRUITED_CELISE"] = 1;
	flags["CELISE_ONBOARD"] = 1;
	jackJillSkip();
}

//Ignore Celise
public function ignoreCelise():void {
	clearOutput();
	creationHeader("\nKEYS");
	
	output("You ignore the hand and pull free, grabbing the keys as you step out to inspect your ship.");
	//[Next]
	clearMenu();
	addButton(0,"Next",checkOutYourShip);
}
//Feed Celise [Male]
public function takeCelise():void {
	pc.removeStatusEffect("Round"); // Uh, this was removed in the previous function. Duplicate?
	clearOutput();
	showCelise();
	creationHeader("\nCELISE");
	
	//Feed Celise [Male]
	if(pc.hasCock()) {
		var x:int = pc.biggestCockIndex();
		output("Smiling a little lustily, you strip out of your gear and toss it up on the shelf, next to the key. Celise smiles beatifically up at you, her eyes practically humping every bit of exposed " + pc.skinFurScales() + " as you reveal yourself. As soon as your " + pc.cocksDescript());
		if(pc.cockTotal() == 1) output(" is");
		else output(" are");
		output(" out, she gasps in delight, pulling her hand away from her frenzied self-pleasure to stretch towards you, extending far longer than you would have thought possible given the size of her limb. Her palm immediately envelops " + pc.oneCock() + " with sticky goo, not grasping you with fingers but completely taking you into her moist, slippery insides.");
		output("\n\nYour " + pc.legOrLegs() + " wobble");
		if(pc.legCount == 1) output("s");
		output(" from the sensation assaulting you, and you grab hold of the shelf for support, watching the emerald blob slide across the floor until it squishes up against you. Celise gushes, <i>“Ohh, look at it! It’s nice and hard and veiny and it tastes so good inside me! Thank you for deigning to feed me... " + pc.short + ", was it?”</i>");
		output("\n\nYou nod and try to stay upright. Fluid weight roils around your " + pc.cockDescript(x) + " with slow, gentle undulations, tickling every square inch of its surface with perfect pressure. Somehow, despite its glorious slipperiness, there’s just enough friction for your body to make your nerves fire one after the other, forcing your internal muscles to flutter and squeeze fat drops of pre-cum into the goo-girl’s wrist. She arches her back to raise her titanic breasts into her arm, absorbing her own elbow, forearm, and then wrist, drawing your dick deep into her swollen teat. You gasp and drip a bit more freely in response.");
		output("\n\n<i>“Yum! Even your pre-cum is tasty. Can I just keep milking that out of you, or would you rather I get you off? Unless you can cum hard enough to make my tit turn white, I think I’d prefer the former,”</i> Celise giggles as her arm exits out the bottom of her tit, appearing to hold it up, though it’s made of the same material as the jiggling, gelatinous mammary. Her free hand is buried to the wrist in her gooey undercarriage, pumping low and slow into a massive, over-engorged honeypot.");
		output("\n\nYou grunt in pleasure and pain as your ardor builds to an unmanageable boil, aching to burst out, to explode deep into Celise’s gooey, delicious tit. Her controlled motions seem intent on holding you there forever. She teases you to the precipice and backs off again and again, devouring the hot, liquid pleasure that " + pc.eachCock() + " releases whenever you get particularly close. You can’t take it anymore!");
		output("\n\nLetting go of the shelf, you grab hold of her massive tit in both hands");
		if(pc.cockTotal() > 1) output(", jamming your second cock into the squishy teat without pause");
		output(", savagely pushing in to the hilt");
		if(pc.balls > 0) output(", slapping into her so hard that your " + pc.ballsDescript() + " slip inside as well");
		output(". She mewls in response, which would worry you if it wasn’t for the way her pussy is literally gushing, geyser-like around her fist. You draw back and slam it home again, causing a jiggle to ripple across her entire body. Globs of green separate from her as she loses some of her cohesion in pleasure, allowing your fingers to sink partway into her cushy interior.");
		output("\n\nCelise wails, <i>“Fuck me harder " + pc.short + "! Harder!”</i> She pulls her hand out of her cunt and grabs onto your arm as she pleads, <i>“Use me like I’m one big, cum-hungry cunny!”</i> Trickles of liquified goo run down and soak into your " + pc.skinFurScales() + ", and a puddle of shining jade spreads around you both.");
		output("\n\nYou’re too turned on to slow your pace, and you fuck faster and harder, the hot, wet slaps echoing in the metal-encased room as you do your damnedest to bring yourself off in the liquefying goo-girl. The texture inside grows sloppier and wetter, but her swirling caresses move faster and more forcefully, battering your dick");
		if(pc.cockTotal() > 1) output("s");
		output(" with soaking-wet pleasure. You groan as you feel a tongue slide across your belly. Celise has pressed her face into you and is licking everything she can get to while you pump her tit.");
		output("\n\nIn a violent lunge, Celise stretches up to your shoulders, wrapping her arms around them to suspend herself there. Your hands and dick");
		if(pc.cockTotal() > 1) output("s");
		output(" slide through her body down into the sopping, lube-leaking flower perched atop the goo mound, and her squeezing ripples grow more powerful. The goo-girl whimpers, <i>“Please, cum in me. I need it sooo bad!”</i> before mashing her lips against your own, the ball-like support beneath her rolling back and forth to slap wetly against you.");
		output("\n\n");
		if(pc.hasCock(GLOBAL.TYPE_EQUINE) || pc.cocks[0].hasFlag(GLOBAL.FLAG_BLUNT)) showImage("CeliseFuckHorse");
		else if(pc.hasCock(GLOBAL.TYPE_CANINE) || pc.hasAKnot()) showImage("CeliseFuckDog");
		else if(pc.hasCock(GLOBAL.TYPE_FELINE)) showImage("CeliseFuckCat");
		else showImage("CeliseFuckHuman");
		output("Vacuum-like suction pulls on your dick");
		if(pc.cockTotal() > 1) output("s");
		output(" as she twists and twirls all around you, and you realize you can hold back no longer. Her tongue is sweet on yours, swirling around your mouth as you throw your head back and cum, pumping a thick batch of protein straight into her dick-suckling snatch. The quivering slit tugs harder on your boner");
		if(pc.cockTotal() > 1) output("s");
		output(", eagerly pulling more fresh ejaculations inside where they dilute her green into an opaque " + pc.cumColor() + ". Your " + pc.hipsDescript() + " jerk and shake while your " + pc.cockDescript(x) + " flexes inside its gooey prison, throwing long ropes of suppressed lust for what feels like ages. Whenever you think it’s about to end, the tugging starts again, and you whimper as the endless orgasm renews itself.");
		output("\n\nAt some point");
		if(pc.balls > 0) output(", your " + pc.ballsDescript() + " start to hurt. Not long after");
		output(", the juicy pleasure-flow dries up, and Celise allows your orgasm to finish. She’s shuddering herself as she detaches, so wracked by pleasure that one of her arms liqueifies, dropping to the floor for a moment until it slithers over to rejoin the rest of her. Her hair is melting, her tits are sagging, and her whole body shudders from time to time, shaking with post-orgasm spasms. She burbles, <i>“That was great! You’re gonna take me on your ship now, right?”</i>");
		output("\n\nYou give her a stern but exhausted look.");
		output("\n\n<i>“I can get by on protein paste and water. I promise I won’t try to forcefully milk you again!”</i> Celise nibbles on her lip, letting it grow bigger and poutier as she does. <i>“Besides, I kind of owe you for being nice enough to feed me. And think of all the ways you can use me whenever meaner aliens get you too turned on to think! I’m a perfect sperm-receptacle!”</i> Her giggling, proud tone makes it clear she has no idea that a ‘sperm-receptacle’ is usually not a good thing.");
	}
	//Feed Celise [Female]
	else {
		output("Smiling a little lustily, you strip out of your gear and toss it up on the shelf, next to the key. Celise smiles beatifically up at you, her eyes practically humping your " + pc.skinFurScales() + " as you reveal yourself. When " + pc.eachVagina() + " is exposed, she visibly licks her lips and ceases her masturbation, using her jade secretions to oil her heavy tits, teasing tiny nubs that bloom into big, suckable nipples in a matter of moments. You sensually swivel your hips and ask, <i>“");
		if(pc.isNice()) output("What’s the best way to feed you?");
		else if(pc.isMischievous()) output("So, is this your first time or what?");
		else output("Here’s my cunt. Why aren’t you licking it yet? I thought that’s what you wanted!");
		output("”</i>");
		output("\n\nThe glittering, hungry slut composes herself enough to surge towards you, ignoring your question completely. Instead, she rolls at you like a wave, if a wave could be capped with bloating bimbo lips and a slithering tongue that could put a snake to shame. You let her crash into you, knowing that she doesn’t pose any real threat at this point, and simply enjoy the sensation of her warm body sliding around your " + pc.legOrLegs() + ". In a way, it’s like slipping into a nice bath, only the bath is a bit thicker and strokes you everywhere, like an army of phantasmal tongues, all worshipping you at once.");
		output("\n\nThe real tongue comes into contact with " + pc.oneVagina() + " a moment before two plush pillows compress against your mons, smothering your labia in sloppy-wet kisses. The tongue slithers over the folded flesh, drawing gasps and moans from you as your pussy goes ten kinds of juicy. Your " + pc.clitDescript() + " engorges and peeks out from its hood in response, hard and sensitive against the slippery, gooey mouth. You grab hold of the shelf to try remain upright, briefly fearing that you’ll fall inside her and drown as the pleasure takes you, but the way Celise’s eyes look up at you while she tends to your " + pc.vaginaDescript() + " leaves no doubt in your mind: she’d never let that happen. She’s far too busy worshipping you orally, sucking down your juices even as hers turn your exterior genitalia into a swampy, green mess.");
		output("\n\nYou give up your grip even as your " + pc.legOrLegs() + " give");
		if(pc.legCount == 1) output("s out, lewdly wriggling inside its gelatinous prison");
		else output(" out, lewdly splaying wide inside their gelatinous prisons");
		output(". Instead, your hands secure themselves on the back of Celise’s head, pushing her harder and more urgently into your " + pc.vaginaDescript() + ". A muffled cry of excitement vibrates through your vulvae as the goo-girl finds herself between a rock-hard grip and a wet place. Her tongue wriggles and writhes unguided at first, then it draws back, suddenly controlled. As you hump the moist fuck-pillows perched on your oozing quim, the wiggling probe pierces through your sensitive curtains, ");
		if(pc.vaginas[0].hymen) output("sliding past your hymen without tearing it and thickening on the other side");
		else output("flooding your unprotected channel with gradually increasing thickness");
		output(". The tendril rolls in wet little circles inside you, smashing into one nerve-cluster after another, relentlessly searching for your G-spot.");
		output("\n\nLong pseudopods appear out of the insubstantial mass behind Celise’s head and arch towards your " + pc.nipplesDescript() + ". They smack wetly against your " + pc.chestDesc() + " as they attach and begin to tug. They’re thin enough that they appear as transparent, emerald stalks that trickle similarly colored lubricants around the edges of your areolae. Rhythmic suckles slowly pull on you, causing your " + pc.nipplesDescript() + " to engorge");
		if(pc.hasNippleCocks()) output("; eventually your " + pc.nippleCocksDescript() + " slip free and slide into the hungry slime");
		else if(pc.hasFuckableNipples()) output("; eventually bits of lubricant drip from your nipple-pussies");
		else if(pc.isLactating()) output("; eventually flows of " + pc.milkDescript() + " leak into the hungry slime");
		output(". You’re in ecstasy, tended to above and below by soft, forgiving slickness.");
		output("\n\nA mouth forms on Celise’s shoulder while she guzzles your secretions, asking, <i>“How am I doing?”</i>");
		output("\n\nYour only reaction is to grind your " + pc.hipsDescript() + " more forcefully into her face, whimpering as " + pc.eachVagina() + " begins to spasm. You’re so very close to orgasm that it’s getting hard to control your movements. You jerk and shake whenever Celise’s tongue finds your G-spot, something she does with increasing regularity, and you’re glad to be supported by her as she pushes and rubs against it, increasing the pressure.");
		output("\n\nMind-numbing explosions of bliss erupt from the cunt-shattering orgasm that wracks your body; you arch your back so violently that you almost crack your head on the shelf above. Luckily, Celise’s arms pop out to grab you around the waist, steadying your lusty thrashing. She gleefully swallows, her throat bobbing as she drinks down your juices. A reverse imprint of your pussy forms on her lips, caressing your entire mound with perfect green synchronicity while her tongue swells wider inside you. As it expands, there’s a sudden shift inside you along with the sensation of something draining away, almost like she’s turned her busy pseudopod into a quim-sucking straw, ensuring that her feeding continues uninterrupted while you’re brought to new heights of climax. The pleasure continues with no end in sight. Your genitals ache, tender after an eternity of stimulation. Whenever you think relief is at hand, the inverse hood around the tip of your " + pc.clitDescript() + " vibrates and sets you off in a blaze of fresh orgasm all over again.");
		output("\n\nBy the time you piece your consciousness back together, you find yourself babbling incoherently in the midst of a continuous, mind-shattering orgasm. Once Celise has her fill, you’re an incoherent mess. Aftershocks of pleasure quake through your still-twitching body as she detaches. She slowly separates from you, shuddering a little bit herself as you’re pulled out of her gooey embrace. The sucking holes holding your " + pc.legOrLegs() + " close up, but not before you get a glimpse of vaginal lips topped with soaked nubs. This goo-girl was fucking herself on your " + pc.legOrLegs() + " as she ate you out! The whole of your lower body is soaked and dripping with her jade moisture, particularly your " + pc.feet() + ". Your " + pc.buttDescript() + " touches the cold, metal floor as she daintily wipes her mouth on the back of a juicy palm, allowing you a moment to recover.");
		output("\n\n<i>“That was great, and your cunny was super tasty, too! Can I come on your ship? Like Vik said, I’m super thankful you stopped to feed me!”</i> Celise bubbles.");
		output("\n\nDespite your exhaustion, you manage to give her a stern look.");
		output("\n\n<i>“I promise not to try and force myself on you or nothing! ‘Sides, you know just how to make me melt anyhow! I can get by on water and protein paste, but if a mean ol’ alien ever gets you all wet and juicy...”</i> Celise nibbles on her lower lip, and with every tiny bite, it grows puffier and poutier, looking softer by the minute. <i>“...I’ll be the perfect little lesbian, girlspunk-dump. Or, if you grow a dick I’ll be totally happy to suck on that,”</i> she adds, nodding enthusiastically. <i>“You’ll be yummy either way!”</i>");
	}
	output("\n\nDo you take Celise on as your first crew member?");
	output("\n\n(Note that choosing to ignore Celise will remove her from the game.)");
	//Orgasm, edit stats
	pc.orgasm();
	clearMenu();
	addButton(0,"Take Her",takeCeliseAsACrewMember);
	addButton(1,"Don’t",ignoreCelise);
}

//Take Celise on As A Crew Member
public function takeCeliseAsACrewMember():void {
	clearOutput();
	showCelise();
	creationHeader("\nCELISE");
	//Nice
	if(pc.isNice()) output("You smile broadly and admit that you’d be happier to have her along; the more the merrier, in fact!");
	//Mischievious
	else if(pc.isMischievous()) output("<i>“Why not? If nothing else, I guess I can use you as a super-soft beanbag chair, when we aren’t fucking.”</i>");
	//Mean
	else output("You shrug and admit you don’t mind her coming along, so long as she stays out of your hair and doesn’t clog the vents with... stray moisture.");
	//merge
	output("\n\nCelise jiggles jubilantly, the accumulated mass of goo below her waist churning with excitement as she applauds. She gulps in a huge breath of air, ballooning herself comically before exhaling it in a quiet <i>“Yayyyy...”</i> You glance at her curiously, and she shyly covers her mouth, whispering, <i>“Sorry.”</i>");
	output("\n\nWhatever, it’s time to get this show on the road! You grab the digikey off the shelf and step through the door.");
	
	output("\n\n(<b>Celise has joined your crew!</b>)");
	
	flags["RECRUITED_CELISE"] = 1;
	flags["CELISE_ONBOARD"] = 1;
	clearMenu();
	addButton(0,"Next",checkOutYourShip);
}

//Check Out Your Ship
public function checkOutYourShip():void {
	clearOutput();
	clearBust(true);
	creationHeader("SHIP\nHANGAR");
	generateMap();
	
	output("A sprawling, brightly lit hangar greets your eyes, empty save for a single ship near the back. Your gaze is pulled away from the distant craft by the sheer size of the enclosure. A hangar like this must have cost your father a veritable fortune to buy out - not much considering how wealthy he was, but no insignificant chunk of change. Magnetically-bounded plasma shields hold in the atmosphere while remaining transparent enough for you to view the nearby warp gate and inky blackness beyond. Perhaps the only thing this place couldn’t hold would be a capital ship, but a number of moorings with connective umbilicals stand by to tether one outside in that extreme scenario.");
	output("\n\nYou chuckle and wonder if you’ll ever need anything that grandiose while you turn your attention back to the light craft in the corner, currently surrounded by techs. Breezing up to them, you get your first good look at your inheritance; in short, it’s a bit of a junker. The hull plating is ancient and rusted in a dozen places where the paint has long since rotted off. Whole pieces of it are still on the floor, being cut into with plasma torches to replace dead tech, and the design of it is a century out of date. You bite back your sigh before it leaves your mouth, noting the newly installed engines and computer systems. Still, new engines don’t make it look any less like a elderly rim-jockey’s heap.");
	output("\n\n<i>“Hello there! You must be the young Captain Steele! A pleasure to meet you,”</i> one of the technicians says once he spots you. <i>“Sorry the ship is in such rough shape. Towing it all the way out here took a little longer than anticipated, so we got a late start. We’re pulling a double shift to get it all done by tonight. Just give us a little more time, maybe get a bite to eat and a place to stay till morning. She’ll look a hundred times better once we finish up, I promise.”</i>");
	output("\n\nYou shake the hangar tech’s hand and nod to him, understanding the enormity of the project before them. The nametag on his jumper lists him as ‘Zeke’. He nods and jovially quips, <i>“Yah, my name’s Zeke, or Z if you really wanna get short with it. Whatever you bring in here, I’ll keep maintained or fix up. Cleaning up other folks’ messes is kinda my business.”</i> Zeke waves you off. <i>“Go on, get something to eat. I’m sure you had a shitty day and don’t wanna spend the rest of it hanging around us while we put this back together.”</i>");
	output("\n\nA clearly marked exit portal dilates as you approach, and you step out into the station’s main thoroughfare. It’s surprisingly quiet and devoid of the shops you’d expect to see. The only place with any grub looks to be an “Anon’s Bar”</i>, though it boasts mention of rooms for rent as well.");
	output("\n\nYou head on in...");
	//[Next]
	clearMenu();
	addButton(0,"Next",getFoodAndDrink);
}
//Go Get Food and a Drink
public function getFoodAndDrink():void {
	//Meet your rival
	clearOutput();
	clearBust(true);
	creationHeader("ANON’S BAR\nAND BOARD");
	generateMapForLocation("ANON'S BAR AND BOARD");
	
	output("Heady alcoholic scents combine with drug-laced smoke and salty food to give this place the unquestionable aroma of a seedy bar. Three-breasted waitresses balancing trays full of drinks one-handed sashay around in short skirts and sheer tops, their gait made awkward by their three legs and small feet. One of them notices you and asks, <i>“A drink for you, hun?”</i>");
	output("\n\nAfter a moment, you decide to order a whiskey. Regardless of your personal feelings, Dad asked you to knock one back for him. You may as well humor the dead codger, even if he did make acquiring your inheritance a trial and a half. At that point, your belly rumbles, and you realize that you haven’t had anything to eat since this morning.");
	output("\n\n<i>“How about I bring out some hot buns with that for you to munch on. You can look over the menu while you snack.”</i> She doesn’t wait around for an answer, moving off to drop a single drink off at a nearby table on her way to the kitchen. The drink is scooped up by a figure obscured by the bar’s dusky atmosphere. It’s difficult to make out much about... the humanoid shape, but its gender and features elude you. There’s nothing else to do, so you ponder the nearby person... just what sex are they?");
	//[Male] [Female]
	clearMenu();
	addButton(0, "Male", function():void { setRivalGender(1); rivalSpillsTheBeans(); } );
	addButton(1, "Female", function():void { setRivalGender(3); rivalSpillsTheBeans(); } );
}

public function jackJillSkip():void
{
	clearOutput();
	clearBust(true);
	creationHeader("ANON’S BAR\nAND BOARD");
	generateMapForLocation("ANON'S BAR AND BOARD");
	
	output("What gender is your rival?");
	
	clearMenu();
	addButton(0, "Male", function():void { setRivalGender(1); ohShitGameStarts(); } );
	addButton(1, "Female", function():void { setRivalGender(3); ohShitGameStarts(); } );
}

public function setRivalGender(sex:int = 0):void
{
	if(sex == 1) {
		chars["RIVAL"].short = "Jack";
		chars["RIVAL"].cockVirgin = false;
		chars["RIVAL"].vaginalVirgin = true;
		chars["RIVAL"].analVirgin = false;
		chars["RIVAL"].createCock();
		chars["RIVAL"].cocks[0].cLengthRaw = 12;
		chars["RIVAL"].cocks[0].cThicknessRatioRaw = 1.5; // Was cLength, I'm assuming this was supposed to be the thickness ratio
		chars["RIVAL"].balls = 2;
		chars["RIVAL"].ballSizeRaw = 2;
		chars["RIVAL"].femininity = 25;
		chars["RIVAL"].hipRatingRaw -= 2;
		chars["RIVAL"].buttRatingRaw -= 2;
		
	}
	else {
		chars["RIVAL"].short = "Jill";
		chars["RIVAL"].cockVirgin = true;
		chars["RIVAL"].vaginalVirgin = false;
		chars["RIVAL"].analVirgin = true;
		chars["RIVAL"].vaginas = new Array();
		chars["RIVAL"].createVagina();
		chars["RIVAL"].vaginas[0].hymen = true;
		chars["RIVAL"].vaginas[0].clits = 1;
		chars["RIVAL"].vaginas[0].wetnessRaw = 1;
		chars["RIVAL"].vaginas[0].loosenessRaw = 1;
		chars["RIVAL"].vaginas[0].bonusCapacity = 0;
		chars["RIVAL"].breastRows[0].breastRatingRaw = 4;
		chars["RIVAL"].femininity = 75;
		chars["RIVAL"].hipRatingRaw += 2;
		chars["RIVAL"].buttRatingRaw += 2;
	}
	flags["RIVALCONFIGURED"] = 1;
}
//Rival Spills the Beans
public function rivalSpillsTheBeans():void {
	clearOutput();
	showRival();
	creationHeader("MEETING\n" + chars["RIVAL"].short.toUpperCase());
	
	output(chars["RIVAL"].mf("He","She") + "’s " + chars["RIVAL"].mf("male","female") + ", surely. Just as you make that conclusion, " + chars["RIVAL"].mf("he","she") + " turns and spots you. You lean back and try to make yourself look as inconspicuous as a bored, leering stranger can, but it must not work out too well. The silhouette gets up and snatches " + chars["RIVAL"].mf("his","her") + " drink, walking towards you with a slow, overly confident gait that betrays its owner’s nimbleness. You ball your fists and hope that you’re not going to get in a fight on a day like today.");
	output("\n\nLuckily, the figure resolves into someone more familiar: " + chars["RIVAL"].short + " Steele, obviously on station for the same reason as you. " + chars["RIVAL"].short + " is your cousin, though in this case, familiarity breeds no affection. " + chars["RIVAL"].mf("His","Her") + " father is Maximilian Steele, your Dad’s brother and all around conniving bastard. Uncle Max made his fortune by following your father and filing time-shifted, forged claims on as many of your father’s finds as he could. The worst part of it is that some of the claims actually held up in court, allowing him to make out nearly as well as Dad with a fraction of the risk.");
	output("\n\n" + chars["RIVAL"].short + " pulls you from your thoughts with a snide greeting, <i>“Hello, cousin.”</i> The last part is enunciated in a sneer. Perhaps " + chars["RIVAL"].mf("he","she") + " was brought up with a similar tale, demonizing your father. You wouldn’t put it past Uncle Max.");
	output("\n\n<i>“Hail, " + chars["RIVAL"].short + ",”</i> ");
	if(pc.isNice()) output("you say with as much friendliness as you can muster");
	else if(pc.isMischievous()) output("you say with less humor than you usually bring to a conversation");
	else output("you say with spite in your voice");
	output(", <i>“What brings you to my table?”</i>");
	output("\n\n" + chars["RIVAL"].short + " smirks and takes a swig of " + chars["RIVAL"].mf("his","her") + " drink. <i>“I just thought I’d let you know that Uncle Vic made a huge mistake. No, a gigantic one.”</i> " + chars["RIVAL"].mf("He","She") + " laughs and continues, <i>“The best part is that neither of you even know it! Let me elucidate for you, simple cousin.”</i> " + chars["RIVAL"].short + " produces a simple touch tablet from " + chars["RIVAL"].mf("his","her") + " pocket and a tiny, chit-sized disk.");
	output("\n\n<i>“This is a pretty standard handheld computer, but this,”</i> " + chars["RIVAL"].mf("he","she") + " says holding the miniature device aloft, <i>“is a sophisticated tracking and eavesdropping device - just like the one in your pocket.”</i>");
	output("\n\nNo.... You reach into your pocket and turn it out, catching an identical device when it falls into your hand. You immediately drop it on the floor and crush it under" + pc.foot() + ", but that merely earns a derisive snort from your unfriendly dinner companion.");
	output("\n\n<i>“The data was already transmitted. I know everything, " + pc.short + ". Best of all, I’m part of the family, so your father’s precious gene-locked probes will handily divulge their secrets to me.”</i> " + chars["RIVAL"].short + " gives an ingratiating smile. <i>“My ship is already good to go, but I think I’d rather depart on a good night’s rest. Besides, why should I need to rush when your clunker is in pieces all over your hangar? Good luck, cuz.”</i>");
	output("\n\n" + chars["RIVAL"].short + " swaggers off with " + chars["RIVAL"].mf("his","her") + " drink and " + chars["RIVAL"].mf("his","her") + " spy machines, leaving you to brood on your thoughts while your order arrives. It tastes bitter in your mouth after such a betrayal, but you swear to yourself that the punk won’t take over Dad’s company. Even the outrageous bustiness of your server won’t cheer you up at this point, nor will the surprisingly delicious wings.");
	output("\n\nYou burp as fatigue sets in and make off to secure quarters for the evening. Tomorrow is going to be a big day, and you intend to hit the galactic rim hard.");
	output("\n\nTomorrow, you join the Planet Rush.");
	clearMenu();
	addButton(0,"Next",ohShitGameStarts);
}
//Wake to Find Rival Left in the Night
public function ohShitGameStarts():void {
	clearOutput();
	showRival();
	creationHeader("THE\nMESSAGE");
	
	output("When you rise, the Codex beeps and says, <i>“Message received.”</i> You flip it open to read the missive, instead getting blasted with your snotty cousin’s voice as " + chars["RIVAL"].mf("he","she") + " says, <i>“Good morning sleepyhead. I just wanted to let you know that I left not long after you went to bed. My ship does have luxurious sleeping quarters for ten, after all. Ta ta!”</i>");
	output("\n\n<i>“Message complete,”</i> the codex blithely states.\n\n<i>Fuck!</i>");
	clearMenu();
	addButton(0,"Next",gameStartOutro);
}

public function gameStartOutro():void
{
	clearOutput();
	showName("TO\nSPACE!");
	author("Fenoxo");
	output("You hastily don your gear and scramble over to the hangar, hoping it has a replicator capable of making something approximating a decent breakfast. The techs are gone, probably sleeping after a full night’s work. The ship looks completely different all finished up. It’s been painted bright red with silvery stripes. Looking at it again, you realize that you recognize this from some of your father’s holo-pics, at least the ones he’d let you see. This is the same ship that he took out on the Thirteenth Planet Rush, almost two centuries ago.");
	output("\n\n(<b>Ship Acquired: Casstech Z14</b>)\n\nAfter [rival.name]'s headstart, there's no time to waste! You pull up the first set of coordinates - to a planet known as Mhen'ga, and blow through the undocking proceedures as fast as the local authorities will allow. Besides, <b>you can return to Tavros once you have the funds for a shopping spree!</b>");
	minutes = 2;
	hours = 6;
	days = 1;
	userInterface.showTime();
	updateDisplays();
	//[Next] - to station screens!
	clearMenu();
	currentLocation = "TAVROS HANGAR";
	shipLocation = "TAVROS HANGAR";
	generateMap();

	flags["SUPRESS TRAVEL EVENTS"] = 1;
	if (false)//if(demo) 
		addButton(0,"Next",demoOver);
	else 
		addButton(0,"Next",flyTo,"Mhen'ga");
}


/* ORIGINAL RACE CORRECTION */

public function raceToOriginalRace(race:String):String
{
	var originalRace:String = race;
	
	if(race == "human") originalRace = race;
	else if(race == "kui-tan") originalRace = "half " + race;
	else originalRace = "half-" + race;
	
	return originalRace;
}
public function isCorrectOriginalRace():Boolean
{
	var originalRaces:Array = [];
	
	for(var i:int = 0; i < pcMotherRaces.length; i++)
	{
		originalRaces.push(raceToOriginalRace(pcMotherRaces[i]));
	}
	
	return (InCollection(pc.originalRace, originalRaces));
}
public function fixOriginalRaceMenu():void
{
	clearMenu();
	var btnSlot:int = 0;
	var i:int = 0;
	for(i = 0; i < pcMotherRaces.length; i++)
	{
		addButton(btnSlot, StringUtil.toDisplayCase(pcMotherRaces[i]), fixOriginalRaceSelect, pcMotherRaces[i]);
		btnSlot++;
	}
}
public function fixOriginalRaceAlert():void
{
	clearOutput();
	creationHeader("CODEX\nALERT");
	author("Jacques00");
	
	output("Your codex suddenly beeps and vibrates. You quickly flip it into your view only to find that there is an urgent error you must correct.");
	output("\n\n<i>Records indicate a glitch in the system. Your mother’s race data has been corrupted. Please fix this immediately by selecting a valid race from the options below.</i>");
	output("\n\nThere is a list of races for you to choose from. Do you recall which race your mother was?");
	
	fixOriginalRaceMenu();
}
public function fixOriginalRaceSelect(race:String):void
{
	clearOutput();
	creationHeader("CODEX\nALERT");
	author("Jacques00");
	
	output("After selecting an option and a few quick beeps, your records have been updated and your mother’s race has been recorded as “" + StringUtil.toDisplayCase(race) + "”.");
	output("\n\n<i>Thank you for taking the time to correct this matter and apologies for the inconvenience.</i>");
	
	pc.originalRace = raceToOriginalRace(race);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


/* UPBRINGING CORRECTION */

public function fixPcUpbringing():void
{
	clearOutput();
	creationHeader("CODEX\nALERT");
	author("Gedan");
	
	output("Your trusty codex vibrates incessantly, demanding your attention for something. The means are unusual, which piques your interest; you’ve been wearing the thing for long enough now to have most of its features down pat, and whatever it’s doing right now is most certainly out of the ordinary.");
	
	output("\n\nSafely shuffled off to one side, hopefully out of the way - and out of sight - of any one or any thing that might come by, you bring your handy forearm-mounted helper to the fore to see exactly what it’s complaining about....");
	
	output("\n\n<i>DATA CORRUPTION DETECTED</i>");
	
	output("\n\nWell, shit.");
	
	output("\n\n<i>FIX NOW?</i>");
	
	output("\n\n<i>“Fucking computers,”</i> you mutter under your breath, " + indefiniteArticle(pc.finger()) + " already tapping on the key labeled ‘Okay’. The thing chugs away for a second or two, seemingly hard at work repairing itself... you’re about set to move on rather than wind up waiting all day for the Codex to");
	if (!silly) output(" fix itself");
	else output(" do the needful");
	output(" before it’s vibrating away, demanding its masters dutiful attention again.");
	
	output("\n\n<i>UNRECOVERABLE DATA FRAGMENT LOCATED IN FILE: [pc.fullName]</i>");
	output("\n<i>MISSING SEGMENT: SCHOOL HISTORY</i>");
	output("\n<i>PLEASE RE-ENTER VALID DATA...</i>");
	
	output("\n\nThere doesn’t seem to be any way around the prompt other than to give the fucking thing an acceptable answer to devices question...");
	
	clearMenu();
	addButton(0,"Pampered",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_PAMPERED);
	addButton(1,"Athletic",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_ATHLETIC);
	addButton(2,"Bookworm",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_BOOKWORM);
	addButton(3,"Austere",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_AUSTERE);
	//addButton(4,"Slutty",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_SLUTTY);
	addButton(4,"Balanced",fixPcUpbringingSetNew,GLOBAL.UPBRINGING_BALANCED);
}

public function fixPcUpbringingSetNew(upType:uint):void
{
	clearOutput();
	creationHeader("CODEX\nALERT");
	author("Gedan");
	
	flags["PC_UPBRINGING"] = upType;
	
	output("<i>INPUT REGISTERED: " + (GLOBAL.UPBRINGING_NAMES[upType] as String).toUpperCase() + "</i>");
	output("\n<i>THANK YOU FOR YOUR COMPLIANCE.</i>");
	
	output("\n\nLooks like that was all the cheeky little bastard wanted from you. Another ‘Okay’ key tap and you’re back on your travels.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


/* OFFSPRING CORRECTION */

public function resetBabyValues():void
{
	// Initialize all baby values to match player character.
	baby.originalRace = pc.originalRace;
	baby.skinTone = pc.skinTone;
	baby.lipColor = pc.lipColor;
	baby.nippleColor = pc.nippleColor;
	baby.eyeColor = pc.eyeColor;
	baby.hairColor = pc.hairColor;
	baby.scaleColor = pc.scaleColor;
	baby.furColor = pc.furColor;
}

public function clearBabyValues():void
{
	baby.originalRace = "NOT SET";
	baby.skinTone = "NOT SET";
	baby.lipColor = "NOT SET";
	baby.nippleColor = "NOT SET";
	baby.eyeColor = "NOT SET";
	baby.hairColor = "NOT SET";
	baby.scaleColor = "NOT SET";
	baby.furColor = "NOT SET";
}

public function setBabyValuesOptions(response:String = "intro"):void
{
	clearOutput();
	creationHeader("CODEX\nALERT");
	author("MistyBirb");
	clearMenu();
	
	var i:int = 0;
	var colorList:Array = [];
	
	switch(response)
	{
		// Intro:
		case "intro":
			output("Your Codex beeps several times, and you grab it to see a priority message from the U.G.C. Department of Public Health and Wellness. You raise your eyebrows, slightly perturbed, and tap the screen to open it.");
			output("\n\n<i>Attention [pc.fullName]:</i>");
			output("\n\n<i>We have detected an irregularity in your birth records. Please fill out the following form with accurate information to correct this issue. We appreciate your cooperation, and apologize for any inconvenience.</i>");
			output("\n\nAn “irregularity” in your birth records? Well, you didn’t have the most conventional entry into the world, so it’s not terribly surprising. If anyone’s birth records were going to be screwed up, you’re a pretty likely candidate.");
			output("\n\nWith a sigh, you tap your Codex once more, and the message is replaced by a form with several empty fields. You see your name at the top, and a box labeled “Birth Race” with “" + StringUtil.toDisplayCase(pc.originalRace) + "” already filled in. They got that right, at least...");
			
			// [Next] -- Go to Hair Color
			addButton(0, "Next", setBabyValuesOptions, (pc.originalRace != "half-gryvain" ? "hair" : "gryvain"));
			break;
			
		// Restart:
		case "restart":
			output("You clear your current inputs and decide to start over...");
			
			clearBabyValues();
			
			// [Next] -- Go to Hair Color
			addButton(0, "Next", setBabyValuesOptions, (pc.originalRace != "half-gryvain" ? "hair" : "gryvain"));
			break;
		
		// Hair Color:
		case "hair":
			output("The first empty box asks you for the hair and/or fur color you were born with, if applicable.");
			
			// {button list of starting hair/fur/scale colors available to the PC's starting race?} -- Go to Eye Color
			if(pc.originalRace == "half-leithan")
			{
				colorList.push(["Black", "black"]);
				colorList.push(["Gray", "gray"]);
				colorList.push(["Silver", "silver"]);
				colorList.push(["Dark Gold", "dark gold"]);
			}
			else if(pc.originalRace == "half kui-tan")
			{
				colorList.push(["Brown", "brown"]);
				colorList.push(["Chocolate", "chocolate"]);
				colorList.push(["D.Brown", "dark brown"]);
				colorList.push(["Black", "black"]);
			}
			else
			{
				colorList.push(["Black", "black"]);
				colorList.push(["Brown", "brown"]);
				colorList.push(["Dirty Blonde", "dirty blonde"]);
				colorList.push(["Blonde", "blonde"]);
				colorList.push(["Auburn", "auburn"]);
				colorList.push(["Red", "red"]);
				colorList.push(["Gray", "gray"]);
				if (pc.originalRace == "half-kaithrit") {
					colorList.push(["Blue", "blue"]);
					colorList.push(["Green", "green"]);
					colorList.push(["Purple", "purple"]);
				}
				if(pc.originalRace == "half-ausar") {
					colorList.push(["White", "white"]);
				}
			}
			for(i = 0; i < colorList.length; i++)
			{
				addButton(i, colorList[i][0], setBabyHairColor, colorList[i][1], StringUtil.toDisplayCase(colorList[i][1]), ("Your original hair color " + (pc.hairColor == colorList[i][1] ? "is" : "was") + " " + colorList[i][1] + "."));
			}
			break;
		
		// Eye Color:
		case "eyes":
			output("The next box asks you for the eye color you were born with, if applicable.");
			
			// {button list of starting eye colors available to the PC's starting race?} -- Go to Skin Color
			if(pc.originalRace == "half kui-tan")
			{
				colorList.push(["Brown", "brown"]);
				colorList.push(["Green", "green"]);
				colorList.push(["Hazel", "hazel"]);
				colorList.push(["Amber", "amber"]);
				colorList.push(["Gold", "gold"]);
				colorList.push(["Copper", "copper"]);
			}
			else
			{
				colorList.push(["Blue", "blue"]);
				colorList.push(["Green", "green"]);
				colorList.push(["Hazel", "hazel"]);
				colorList.push(["Brown", "brown"]);
				if (pc.originalRace == "half-kaithrit") {
					colorList.push(["Amber", "amber"]);
					colorList.push(["Yellow", "yellow"]);
					colorList.push(["Orange", "orange"]);
					colorList.push(["Violet", "violet"]);
					colorList.push(["Copper", "copper"]);
				}
				if(pc.originalRace == "half-ausar") {
					colorList.push(["Gold", "gold"]);
				}
			}
			for(i = 0; i < colorList.length; i++)
			{
				addButton(i, colorList[i][0], setBabyEyesColor, colorList[i][1], StringUtil.toDisplayCase(colorList[i][1]), ("Your original eye color " + (pc.eyeColor == colorList[i][1] ? "is" : "was") + " " + colorList[i][1] + "."));
			}
			break;
		
		// Gryvain:
		case "gryvain":
			output("The first empty box asks you for the overall color scheme of your body--this includes your hair and scales, if applicable.");
			
			// {button list of starting eye colors available to the PC's starting race?} -- Go to Skin Color
			clearMenu();
			colorList.push(["DarkBlue", "dark blue"]);
			colorList.push(["DarkGreen", "dark green"]);
			colorList.push(["Black", "black"]);
			if(pc.short == "Geddy") colorList.push(["Red", "red"]);
			for(i = 0; i < colorList.length; i++)
			{
				addButton(i, colorList[i][0], setBabyGryvainColor, colorList[i][1], StringUtil.toDisplayCase(colorList[i][1]), ("Your original color scheme " + (pc.scaleColor == colorList[i][1] ? "is" : "was") + " " + colorList[i][1] + " with dark yellow eyes."));
			}
			break;
		
		// Skin Color:
		case "skin":
			output("The final unfilled box asks you for the skin pigmentation you had when you were born, if applicable.");
			
			// {button list of skin pigments available to PC's starting race} -- Go to Finish
			if (pc.originalRace == "half-gryvain")
			{
				colorList.push(["Pale", "pale"]);
				colorList.push(["Tanned", "tanned"]);
				colorList.push(["Pink", "pink"]);
				colorList.push(["DarkRed", "dark red"]);
				colorList.push(["DarkGreen", "dark green"]);
			}
			else
			{
				if(pc.originalRace == "half-leithan")
				{
					colorList.push(["Pale", "pale"]);
					colorList.push(["Fair", "fair"]);
					colorList.push(["Gray", "gray"]);
					colorList.push(["Black", "black"]);
				}
				else
				{
					colorList.push(["Pale", "pale"]);
					colorList.push(["Fair", "fair"]);
					colorList.push(["Tan", "tan"]);
					colorList.push(["Olive", "olive"]);
					colorList.push(["Dark", "dark"]);
					colorList.push(["Ebony", "ebony"]);
				}
			}
			for(i = 0; i < colorList.length; i++)
			{
				addButton(i, colorList[i][0], setBabySkinColor, colorList[i][1], StringUtil.toDisplayCase(colorList[i][1]), ("Your original skin tone " + (pc.skinTone == colorList[i][1] ? "is" : "was") + " " + colorList[i][1] + "."));
			}
			break;
		
		// End:
		case "end":
			output("You have almost reached the end of the form. Are these values correct? If so, feel free to finish and submit the document.");
			
			addButton(0, "Finish", setBabyValuesOptions, "finish", "Finish Survey", "Complete and submit the form.");
			addButton(1, "Restart", setBabyValuesOptions, "restart", "Restart Survey", "Try again from the beginning.");
			break;
		
		// Finish:
		case "finish":
			output("You finish filling in the blanks, then scroll to the bottom of the form and hit “Submit.” Your Codex beeps in affirmation, then sends the data off into the extranet, where it will no doubt be received and reviewed by a bored government clerk on some faraway planet. All things considered, it was a pretty simple process, and you put your Codex away to continue onward.");
			
			baby.originalRace = pc.originalRace;
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
	
	if(!InCollection(response, ["intro", "finish"]))
	{
		output("\n");
		output("\n<b>Birth Race:</b> " + StringUtil.toDisplayCase(pc.originalRace));
		output("\n<b>Hair Color:</b> " + StringUtil.toDisplayCase(baby.hairColor));
		if(InCollection(pc.originalRace, ["half-ausar", "half-kaithrit", "half kui-tan"]))
			output("\n<b>Fur Color:</b> " + StringUtil.toDisplayCase(baby.furColor));
		output("\n<b>Eye Color:</b> " + StringUtil.toDisplayCase(baby.eyeColor));
		if(InCollection(pc.originalRace, ["half-leithan", "half-gryvain"]))
			output("\n<b>Scale Color:</b> " + StringUtil.toDisplayCase(baby.scaleColor));
		//output("\n<b>Nipple Color:</b> " + StringUtil.toDisplayCase(baby.nippleColor));
		//output("\n<b>Lip Color:</b> " + StringUtil.toDisplayCase(baby.lipColor));
		output("\n<b>Skin Tone:</b> " + StringUtil.toDisplayCase(baby.skinTone));
	}
}
public function setBabyHairColor(arg:String = "black"):void
{
	baby.hairColor = arg;
	baby.furColor = arg;
	
	setBabyValuesOptions("eyes");
}
public function setBabyEyesColor(arg:String = ""):void
{
	baby.eyeColor = arg;
	
	setBabyValuesOptions("skin");
}
public function setBabyGryvainColor(arg:String = "black"):void
{
	baby.hairColor = arg;
	baby.furColor = arg;
	baby.scaleColor = arg;
	baby.nippleColor = arg;
	baby.lipColor = arg;
	baby.eyeColor = "dark yellow";
	
	setBabyValuesOptions("skin");
}
public function setBabySkinColor(arg:String = "albino"):void
{
	if(pc.originalRace != "half-gryvain")
	{
		baby.scaleColor = (pc.originalRace == "half-leithan" ? "black" : "blue");
		baby.nippleColor = (InCollection(pc.nippleColor, ["pink", "peach", "tan", "brown", "ebony"]) ? pc.nippleColor : "pink");
		baby.lipColor = (InCollection(pc.lipColor, ["pink", "peach", "tan", "brown", "ebony"]) ? pc.lipColor : "peach");
	}
	baby.skinTone = arg;
	
	setBabyValuesOptions("end");
}


/* DEMO FUNCTIONS */

public function demoOver():void {
	clearOutput();
	setLocation("DEMO\nCOMPLETE","THANKS FOR PLAYING","AND SUPPORTING ME.");
	gameOverEvent = true;
	
	output("This concludes the full TiTS introductory sequence. Keep your eyes peeled for supporter-only releases and the eventual public pre-releases as I get more done.");
	clearMenu();
	addButton(0,"Appearance",appearanceTest);
}

public function appearanceTest():void {
	appearance(pc);
}