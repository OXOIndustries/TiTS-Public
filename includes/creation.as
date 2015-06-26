import classes.Characters.PlayerCharacter;
import flash.events.Event;


public function creationRouter(e:Event = null):void {
	if(chars["PC"].short.length >= 1) {
		this.userInterface.warningText.htmlText = "<b>Are you sure you want to create a new character?</b>";
		this.userInterface.confirmNewCharacter();
	}
	else 
	{
		startCharacterCreation();
	}
}

public function startCharacterCreation(e:Event = null):void 
{
	chars["PC"] = new PlayerCharacter();
	initializeNPCs();
	chars["PC"].short = "uncreated";
	chars["PC"].level = 1;
	chars["PC"].shield = new classes.Items.Protection.BasicShield();
	chars["PC"].shieldsRaw = chars["PC"].shieldsMax();
	hours = 0;
	minutes = 0;
	days = 0;
	this.userInterface.hideTime();
	flags = new Dictionary();
	gameOverEvent = false;

	// Codex entries
	CodexManager.unlockedEntryList = new Array();
	
	// Stat Tracking
	StatTracking.resetStorage();

	this.userInterface.currentPCNotes = undefined;
	//Tag as in creation.
	chars["PC"].createStatusEffect("In Creation",0,0,0,0);
	clearOutput();
	if(stage.contains(this.userInterface.textInput)) this.removeInput();
	setLocation("THE\nPAST","PLANET: TERRA","SYSTEM: SOL");
	output("Victor Steele is one of the richest men in the galaxy. His fortune was gained through years of adventuring during the Thirteenth Great Planet Rush, almost two hundred years ago. Trillions of credits and a massive corporation grew up around him. To this day, Steele Industrial Technologies and Production, or Steele Tech, is one of the most respected names in its field. Unfortunately, the many mutations Victor underwent during his journeys wreaked havoc on his genome. Anti-agathic treatments have been decreasing in effectiveness as of late, and his doctors tell him that after two full centuries of life, he has a measly two decades left. This news is unwelcome, but he’s lived a rich, full life - fuller than most. With twenty years ahead of him, the suddenly old industrialite is looking toward finding a successor... or creating one.");
	output("\n\nThat’s the solution. Victor can sire an heir or heiress to carry on his legacy and to ensure that the Steele name is honored throughout all of history. Perhaps he’ll even manage to raise them wisely enough to avoid the pitfalls he ran into as a youth. The next Planet Rush is a scant nineteen years ahead, so the timing is perfect. The United Galactic Confederacy has already sent out hundreds of warp gates, staggered so that they’ll all go online at the same time. These rushes are performed every century or two, expanding the reach of civilization light years into the stars, resulting in a galactic free-for-all. The concordant economic boom will be the perfect opportunity for Victor’s offspring to rise to greatness. They could become richer and more powerful than he ever was, and perhaps a better person as well.");
	output("\n\nThe real question is, who should the lucky mother be? A lifelong accumulation of lovers has resulted in no shortage of potential mates eager for the opportunity to provide Victor an heir. Should he choose a pure human, like himself, or perhaps a dog-like Ausar, famed for their loyal and friendly dispositions, fluffy tails, and pointed ears? Or would something else be a better choice? Decisions, decisions...");
	hidePCStats();
	this.userInterface.hideMinimap();
	this.userInterface.setGuiPlayerNameText("");
	this.userInterface.resetPCStats();
	this.userInterface.hidePCStats();
	this.userInterface.hideNPCStats();
	this.clearMenu();
	this.addButton(0,"Human",confirmRaceChoice,"human","Human Mother","Victor's child will be born a full-blooded human.");
	this.addButton(1,"Ausar",confirmRaceChoice,"ausar","Ausar Mother","Victor's child will have a dog-like ausar for a mother. Half-ausars will come into the world with anubis-like ears, canine genitalia (if male), additional hair color choices, more eye color choices, and a long, fluffy tail.");
	this.addButton(2,"Kaithrit",confirmRaceChoice,"kaithrit","Kaithrit Mother","Victor's child will have a kaithrit mother, famed for their feline resemblance and doubled tails. Half-kaithrit come into the world with two feline tails, cat ears, additional hair color choices, more eye color choices, and cat genitalia (if male).");
	this.addButton(3,"Leithan",confirmRaceChoice,"leithan","Leithan Mother","Victor's child would have a leithan mother, though that race's unique biology would mandate some very expensive scientific intervention to ensure a successful pregnancy. Leithans are powerfully built, six-legged reptile-taurs. Half-leithans come into the world with thick, prehensile tails; unique bunny-like ears; and a tauric body configuration. They have limited skin and hair color options compared to other races. Half-leithan males are born with large reptilian genitalia, and both sexes have rear-mounted sexual organs.");
	this.addButton(4,"Kui-Tan",confirmRaceChoice,"kui-tan","Kui-Tan Mother","Victor's child would have a kui-tan mother, a race known for its total lack of females and similarities to earth raccoons. Of course, that would make the mother a hermaphrodite - a woman with a vagina and a penis. Half kui-tan usually come into the world as a male or hermaphrodite with one bushy tail, fuzzy ears, and a knotty dick.");
	//addButton(4,"Cheat",chooseHowPCIsRaised);
}

public function confirmRaceChoice(race:String = "human"):void {
	clearOutput();
	if(race == "human") {
		output("A purely human heritage would give Victor's child the body one would expect - two legs, two arms, two eyes, a head of hair, etc.... There's really not much more to say about such a choice.");
	}
	else if(race == "ausar") {
		output("As a half-ausar, Victor's child would start with dog-like ears, a canine tail, and a red, knotted penis if male. The ausar are known for their close bond with humanity and would be a likely pick for the child's mother.");
	}
	else if(race == "kaithrit") {
		output("The kaithrit are a cat-like race with two prehensile, feline tails. They are known for their feminine appearances and exotic colorations, so any child of Victor and kaithrit would have more possible hair colors, a prettier face than normal, and two tails. Also, if the child is a male, it'll have a soft-spined, cat-like penis.");
	}
	else if(race == "leithan")
	{
		output("Leithans are a race visually similar to mythological centaurs, though they trace their origins to reptile-like species and have six clawed legs. They have powerful, prehensile tails as well as a highly acute set of four ears: two tapered ones on the side of their heads, and two large bunny-like ears atop. They are known for their speed and strength, and have a distinct color palette of grays and blacks, with yellow bioluminate areas on their scales. Leithans are also much taller than normal, reaching natural heights up to nine feet tall. If the child is male, it will have a large, bulbous reptilian penis between its rear legs.");
	}
	else if(race == "kui-tan") {
		output("The kui-tan are a raccoon-like race who invariably have a phallus with multiple knots. They are also known to have fuzzy, rounded ears, fluffy tails bigger than many species' adolescent young, and a balls that engorge with seed the longer they go without release.");
	}
	output("\n\nIs this the race Victor chooses?")
	this.clearMenu();
	this.addButton(0,"Yes",chooseStartingRace,race);
	this.addButton(1,"No",startCharacterCreation);
}

public function chooseStartingRace(race:String = "human"):void {
	clearOutput();
	pc.removeCocks();
	pc.removeVaginas();
	setLocation("NAME AND\nRACE","PLANET: TERRA","SYSTEM: SOL");
	output("Yes, " + race + " would be the best choice. A smile breaks across Victor’s face as he recalls some very... useful traits that might be beneficial to a soon-to-be galactic explorer.");
	output("\n\nHe approaches the lady in question, and of course, she agrees. The sex is as mindblowing as anyone could want from a lover who’s about to have her child be the heir to an intergalactic megacorp, and with all the Tamani-brand fertility enhancers they both took, pregnancy is assured. The only thing left to do is for the two lovebirds to go to Victor’s private clinic and make sure that only the best genes take hold in his future heir. He holds hands with his chosen partner, a knowing grin on both their faces as the skycar takes them to their destination. She doesn’t know about his pending mortality. Victor doesn’t want to spoil the mood.");
	output("\n\nVictor’s doctor sits him down while his chosen wife is taken to the medbay, and he tucks his holo-glasses into his coat pocket as he starts to grill Victor on the attributes he’d like the embryo to have, beginning with the sex. Should his heir be ");
	//Set da race!
	if(race == "human") pc.originalRace = race;
	else if(race == "kui-tan") pc.originalRace = "half " + race;
	else pc.originalRace = "half-" + race;
	//Menus vary based on race.
	this.clearMenu();
	if(race == "human") {
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		output("male or female");
		this.addButton(0,"Male",setStartingSex,1);
		this.addButton(1,"Female",setStartingSex,3);
	}
	else if(pc.originalRace == "half-ausar") {
		pc.earType = GLOBAL.TYPE_CANINE;
		pc.tailType = GLOBAL.TYPE_CANINE;
		pc.tailCount = 1;
		pc.addTailFlag(GLOBAL.FLAG_LONG);
		pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		pc.addTailFlag(GLOBAL.FLAG_FURRED);
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		output("male or female");
		this.addButton(0,"Male",setStartingSex,1);
		this.addButton(1,"Female",setStartingSex,3);
		//addButton(2,"Herm.",setStartingSex,2);
	}
	else if(pc.originalRace == "half-kaithrit") {
		pc.earType = GLOBAL.TYPE_FELINE;
		pc.tailType = GLOBAL.TYPE_FELINE;
		pc.tailCount = 2;
		pc.addTailFlag(GLOBAL.FLAG_LONG);
		pc.addTailFlag(GLOBAL.FLAG_FURRED);
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		output("male or female");
		this.addButton(0,"Male",setStartingSex,1);
		this.addButton(1,"Female",setStartingSex,3);
		//addButton(2,"Herm.",setStartingSex,2);
	}
	//Half-leithan Starting Goods
	else if(pc.originalRace == "half-leithan") {
		pc.legCount = 6;
		//Clawed lizardfeet
		pc.legType = GLOBAL.TYPE_LIZAN;
		pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
		pc.addLegFlag(GLOBAL.FLAG_SCALED);
		pc.addLegFlag(GLOBAL.FLAG_PAWS);
		pc.armType = GLOBAL.TYPE_LEITHAN;
		//>Four ears: two elfin ears on the side, two bunny ears on top. Probably need a new ear-type for this.
		pc.earType = GLOBAL.TYPE_LEITHAN;
		//>Reptilian, forked tongues
		pc.tongueType = GLOBAL.TYPE_LEITHAN;
		pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
		pc.addTongueFlag(GLOBAL.FLAG_LONG);
		pc.tailType = GLOBAL.TYPE_LIZAN;
		pc.tailCount = 1;
		pc.addTailFlag(GLOBAL.FLAG_LONG);
		pc.addTailFlag(GLOBAL.FLAG_SCALED);
		pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
		pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
		pc.genitalSpot = 2;
		CodexManager.unlockEntry("Leithan");
		pc.scaleColor = "black";
		this.addButton(0,"Male",setStartingSex,1);
		this.addButton(1,"Female",setStartingSex,3);
	}
	else if(pc.originalRace == "half kui-tan")
	{
		pc.earType = GLOBAL.TYPE_KUITAN;
		pc.tailCount = 1;
		pc.tailType = GLOBAL.TYPE_KUITAN;
		pc.addTailFlag(GLOBAL.FLAG_LONG);
		pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		pc.addTailFlag(GLOBAL.FLAG_FURRED);
		pc.faceType = GLOBAL.TYPE_HUMANMASKED;
		pc.armType = GLOBAL.TYPE_KUITAN;
		output("male or hermaphroditic");
		this.addButton(0,"Male",setStartingSex,1);
		addDisabledButton(1,"Female","Female","Kui-tan cannot be female.")
		this.addButton(2,"Herm",setStartingSex,2);
	}
	output(", and what should the unborn child be named?");
	this.displayInput();
	this.userInterface.textInput.text = "";
	this.userInterface.textInput.maxChars = 12;
}

public function setStartingSex(sex:int = 1):void {
	var race:String = "human";
	if(pc.originalRace != "human") race = pc.originalRace.substring(5);
	if(this.userInterface.textInput.text == "") {
		chooseStartingRace(race);
		output("\n\n\n<b>You must input a name.</b>");
		return;
	}
	if(this.userInterface.textInput.length > 14) {
		chooseStartingRace(race);
		output("\n\n\n<b>Please select a name no more than fourteen characters long.</b>");
		return;
	}
	//Male or herm? Dick stuff.
	if (sex == 1 || sex == 2) {
		pc.createCock();
		pc.balls = 2;
		pc.ballSizeRaw = 1.5;

		if(pc.originalRace == "half-leithan")
		{
			pc.shiftCock(0,GLOBAL.TYPE_NAGA);
			pc.ballSizeRaw = 3;
		}
		if (pc.originalRace == "half-ausar") {
			pc.shiftCock(0,GLOBAL.TYPE_CANINE);
			//Get rid of sheath for reasons
			pc.cocks[0].delFlag(GLOBAL.FLAG_SHEATHED);
		}
		if (pc.originalRace ==  "half-kaithrit") {
			pc.shiftCock(0,GLOBAL.TYPE_FELINE);
		}
		if (pc.originalRace == "half kui-tan")
		{
			pc.shiftCock(0,GLOBAL.TYPE_KUITAN);
			pc.ballSizeRaw = 5;
			pc.createPerk("'Nuki Drunk",0,0,0,0,"Get drunk twice as slow and sober up four times slower.");
			pc.createPerk("'Nuki Nuts",0,0,0,0,"Allows gonads to swell with excess seed.");
		}
		//MALE!
		if(sex == 1) {
			pc.femininity = 30;
			pc.hipRatingRaw = 1;
			pc.buttRatingRaw = 2;
			pc.tone = 65;
			pc.hairLength = 1;
			if (pc.originalRace ==  "half-kaithrit") {
				pc.femininity = 50;
				pc.hipRatingRaw = 6;
			}
		}
		//HERM!
		else {
			pc.femininity = 65;
			pc.hipRatingRaw = 6;
			pc.buttRatingRaw = 3;
			pc.tone = 45;
			pc.breastRows[0].breastRatingRaw = 3;
			pc.hairLength = 6;
			if (pc.originalRace ==  "half-kaithrit") {
				pc.femininity = 75;
				pc.hipRatingRaw = 7;
				pc.buttRatingRaw = 5;
			}
		}

	}
	//Girls or herms? Cunt stuff
	if (sex >= 2) {
		pc.createVagina();
		if(pc.originalRace == "half-leithan")
		{
			pc.shiftVagina(0,GLOBAL.TYPE_LEITHAN);
			pc.vaginas[0].wetnessRaw = 2;
			pc.vaginas[0].bonusCapacity += 20;
		}
		if(pc.originalRace == "half-ausar") {
			pc.vaginas[0].wetnessRaw = 2;
			pc.vaginas[0].bonusCapacity = 20;
			pc.elasticity = 1.25;
		}
		if(pc.originalRace == "half kui-tan")
		{
			pc.shiftVagina(0,GLOBAL.TYPE_KUITAN);
			//pc.vaginas[0].wetnessRaw = 1;
		}
		if(sex == 3) {
			pc.femininity = 75;
			pc.hipRatingRaw = 6;
			pc.buttRatingRaw = 3;
			pc.tone = 45;
			pc.breastRows[0].breastRatingRaw = 3;
			pc.hairLength = 10;
			if (pc.originalRace ==  "half-kaithrit") {
				pc.femininity = 85;
				pc.hipRatingRaw = 7;
				pc.buttRatingRaw = 5;
			}
		}
	}
	pc.short = this.userInterface.textInput.text;
	this.userInterface.setGuiPlayerNameText(pc.short);
	chooseHeight();
}

//Choose Height:
public function chooseHeight():void {
	clearOutput();
	setLocation("CHOOSING\nHEIGHT","PLANET: TERRA","SYSTEM: SOL");
	output("The doctor asks <i>“So, you’re going to have a </i>");
	if(pc.hasCock()) {
		if(pc.hasVagina()) output("<i>herm</i>");
		else output("<i>male</i>");
	}
	else output("<i>female</i>");
	output("<i> child, then? Very well. How tall should " + pc.mf("he","she") + " grow up to be? Please, give it in Imperial inches.”</i></i>");
	output("\n\nVictor raises an eyebrow and quips, <i>“Seriously? Inches? What is this, the 20th century?”</i></i>");
	output("\n\n<i>“Victor, I’ve known you for eighty years. We both know you’re a sucker for the classics. Don’t pretend you don’t use that archaic system just to screw with your acquaintances.”</i> The doctor smiles and continues, <i>“Now, the height?”</i></i>\n\n<b>Please give your height in inches.</b> For reference, six feet tall is 72 inches.");

	this.displayInput();
	//[Height Box]
	this.clearMenu();
	this.addButton(0,"Next",applyHeight);
	this.addButton(14,"Back",startCharacterCreation);
}

public function applyHeight():void {
	var fail:Boolean = false;
	if(isNaN(Number(this.userInterface.textInput.text))) {
		clearOutput();
		output("Choose a height using numbers only, please. And remember, the value should be given in inches.");
		fail = true;
	}
	else if(Number(this.userInterface.textInput.text) < 48) {
		clearOutput();
		output("Choose a height above 48 inches tall, please.");
		fail = true;
	}
	else if(Number(this.userInterface.textInput.text) > 84 && pc.originalRace != "half-leithan") {
		clearOutput();
		output("Choose a height below 84 inches tall, please.");
		fail = true;
	}
	else if(Number(this.userInterface.textInput.text) > 108 && pc.originalRace == "half-leithan") {
		clearOutput();
		output("Choose a height below 108 inches tall, please.");
		fail = true;
	}
	if(fail) {
		this.userInterface.textInput.text = "";
		this.displayInput();
		this.clearMenu();
		this.addButton(0,"Next",applyHeight);
		this.addButton(14,"Back",startCharacterCreation);
		return;
	}
	pc.tallness = Number(this.userInterface.textInput.text);
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();
	chooseThickness();
}

public function chooseThickness():void {
	clearOutput();
	setLocation("CHOOSING\nTHICKNESS","PLANET: TERRA","SYSTEM: SOL");
	output("Marking his pad, he chuckles and clears his throat. The doctor asks, <i>“How thickset should " + pc.mf("he","she") + " be? Please note that I’m not referring to weight so much as the broadness of their overall frame - hips and shoulders, you know.”</i>");
	
	//[Height Box]
	this.clearMenu();
	this.addButton(0,"Very Thin",applyThickness,20);
	this.addButton(1,"Thin",applyThickness,30);
	this.addButton(2,"Lithe",applyThickness,40);
	this.addButton(3,"Normal",applyThickness,50);
	this.addButton(4,"Husky",applyThickness,60);
	this.addButton(5,"Thickset",applyThickness,70);
	this.addButton(14,"Back",chooseHeight);
}

public function applyThickness(arg:Number):void {
	var fail:Boolean = false;
	pc.thickness = arg;
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();
	chooseHairColor();
}
//Hair Color:
public function chooseHairColor():void {
	clearOutput();
	setLocation("SELECTING HAIR\nPIGMENT","PLANET: TERRA","SYSTEM: SOL");
	output("<i>“Great,”</i> he says absently, entering the information with his stylus. <i>“I thought of asking for " + pc.mf("his","her") + " adult weight in pounds, but knowing you, you would have taken me seriously. Obviously, your kitchen staff will be the ones who control that.”</i> He clears his throat, sombering slightly. <i>“How about hair color? We could do black, like yours was, or any of the other natural colors pretty easily.”</i>");
	//[CoC-like choices with bonus options for certain half-races].
	this.clearMenu();
	if(pc.originalRace == "half-leithan")
	{
		this.addButton(0,"Black",applyHairColor,"black");
		this.addButton(1,"Gray",applyHairColor,"gray");
		this.addButton(2,"Silver",applyHairColor,"silver");
		this.addButton(3,"Dark Gold",applyHairColor,"dark gold");
	}
	else if(pc.originalRace == "half kui-tan")
	{
		this.addButton(0,"Brown",applyHairColor,"brown");
		this.addButton(1,"Chocolate",applyHairColor,"chocolate");
		this.addButton(2,"D.Brown",applyHairColor,"dark brown","Dark Brown","Dark brown hair. Pardon the abbreviation.");
		this.addButton(3,"Black",applyHairColor,"black");
	}
	else
	{
		this.addButton(0,"Black",applyHairColor,"black");
		this.addButton(1,"Brown",applyHairColor,"brown");
		this.addButton(2,"Dirty Blond",applyHairColor,"dirty blond");
		this.addButton(3,"Blond",applyHairColor,"blond");
		this.addButton(4,"Auburn",applyHairColor,"auburn");
		this.addButton(5,"Red",applyHairColor,"red");
		this.addButton(6,"Gray",applyHairColor,"gray");
		if (pc.originalRace ==  "half-kaithrit") {
			this.addButton(7,"Blue",applyHairColor,"blue");
			this.addButton(8,"Green",applyHairColor,"green");
			this.addButton(9,"Purple",applyHairColor,"purple");
		}
		if(pc.originalRace == "half-ausar") {
			this.addButton(7,"White",applyHairColor,"white");
		}
	}
	this.addButton(14,"Back",chooseThickness);
}

public function applyHairColor(arg:String = "black"):void {
	pc.hairColor = arg;
	pc.furColor = arg;
	chooseEyeColor();
}

//Eye Color:
public function chooseEyeColor():void {
	clearOutput();
	setLocation("SELECTING EYE\nPIGMENT","PLANET: TERRA","SYSTEM: SOL");
	output("<i>“I thought you’d choose " + pc.hairColor + ", boss. How about eye color? Got anything in mind?”</i> The doctor glances up from his tablet and awaits Victor’s response.");
	//[Normal Eye colors + bonus half race ones]
	this.clearMenu();
	if(pc.originalRace == "half kui-tan")
	{
		addButton(0,"Brown",applyeEyeColor,"brown");
		addButton(1,"Green",applyeEyeColor,"green");
		addButton(2,"Hazel",applyeEyeColor,"hazel");
		addButton(3,"Amber",applyeEyeColor,"amber");
		addButton(4,"Gold",applyeEyeColor,"gold");
		addButton(5,"Copper",applyeEyeColor,"copper");
	}
	else
	{
		this.addButton(0,"Blue",applyeEyeColor,"blue");
		this.addButton(1,"Green",applyeEyeColor,"green");
		this.addButton(2,"Hazel",applyeEyeColor,"hazel");
		this.addButton(3,"Brown",applyeEyeColor,"brown");
		if (pc.originalRace ==  "half-kaithrit") {
			this.addButton(4,"Amber",applyeEyeColor,"amber");
			this.addButton(5,"Yellow",applyeEyeColor,"yellow");
			this.addButton(6,"Orange",applyeEyeColor,"orange");
			this.addButton(7,"Violet",applyeEyeColor,"violet");
			this.addButton(8,"Copper",applyeEyeColor,"copper");
		}
		if(pc.originalRace == "half-ausar") {
			this.addButton(4,"Gold",applyeEyeColor,"gold");
		}
	}
	this.addButton(14,"Back",chooseHairColor);
}

public function applyeEyeColor(eyeColor:String = "brown"):void {
	pc.eyeColor = eyeColor;
	chooseSkinTone();
}

public function chooseSkinTone():void
{
	clearOutput();
	setLocation("SELECTING\nSKIN PIGMENT","PLANET: TERRA","SYSTEM: SOL");
	output("<i>“Great. How about skin pigmentation?”</i>");
	this.clearMenu();
	if(pc.originalRace == "half-leithan")
	{
		this.addButton(0,"Pale",applySkinTone,"pale");
		this.addButton(1,"Fair",applySkinTone,"fair");
		this.addButton(2,"Gray",applySkinTone,"gray");
		this.addButton(3,"Black",applySkinTone,"black");
	}
	else
	{
		this.addButton(0,"Pale",applySkinTone,"pale");
		this.addButton(1,"Fair",applySkinTone,"fair");
		this.addButton(2,"Tan",applySkinTone,"tan");
		this.addButton(3,"Olive",applySkinTone,"olive");
		this.addButton(3,"Dark",applySkinTone,"dark");
		this.addButton(4,"Ebony",applySkinTone,"ebony");
	}
	this.addButton(14,"Back",chooseEyeColor);
}
public function applySkinTone(skinTone:String = "pale"):void {
	pc.skinTone = skinTone;
	if(pc.hasCock())
	{
		if(pc.cocks[x].cType == GLOBAL.TYPE_HUMAN)
		{
			if(skinTone == "dark" || skinTone == "ebony")
			{
				pc.cocks[0].cockColor = "ebony";
			}
			else pc.cocks[0].cockColor = "pink";
		}
	}
	chooseBreastSize();	
}

//Boob Size:
public function chooseBreastSize():void {
	clearOutput();
	setLocation("SELECTING\nBREAST SIZE","PLANET: TERRA","SYSTEM: SOL");
	output("<i>“Breasts?”</i>");
	//{If female, pick a cup size!}
	//{If male, more dialogue}
	if(!pc.hasVagina()) {
		output("\n\nVictor folds his arms and raises an eyebrow.");
		output("\n\nThe doctor rubs the bridge of his nose in exasperation. <i>“We both know you’re a sexual deviant. How do I know you don’t want your kid to grow up into the universe’s hottest tranz? Just pick flat if you don’t want them.”</i>");
	}
	this.clearMenu();
	this.addButton(0,"Flat",applyBreastSize,0);
	this.addButton(1,"A",applyBreastSize,1);
	this.addButton(2,"B",applyBreastSize,2);
	this.addButton(3,"C",applyBreastSize,3);
	if(pc.hasVagina()) {
		this.addButton(4,"D",applyBreastSize,4);
		if(pc.originalRace != "half kui-tan") this.addButton(5,"DD",applyBreastSize,5);
		if(pc.originalRace == "half-leithan")
		{
			this.addButton(6,"Big DD",applyBreastSize,6);
			this.addButton(7,"E",applyBreastSize,7);
		}
	}
	if (pc.originalRace ==  "half-kaithrit" && pc.hasVagina()) {
		this.addButton(6,"Big DD",applyBreastSize,6);
		this.addButton(7,"E",applyBreastSize,7);
		this.addButton(8,"Big E",applyBreastSize,8);
		this.addButton(9,"EE",applyBreastSize,9);
	}
	this.addButton(14,"Back",chooseSkinTone);
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
	setLocation("SETTING PENIS\nLENGTH","PLANET: TERRA","SYSTEM: SOL");
	output("The doctor smiles knowingly and moves on, <i>“All right, now what about the penis? It looks like we could pretty easily have it be anywhere from ");
	
	clearMenu();
	
	switch (pc.originalRace)
	{
		case "half-leithan":
			output("thirteen to twenty ");
			
			for (var i:uint = 0; i <= 7; i++)
			{
				addButton(i, String(13 + i) + "”", applyJunkSize, 13 + i);
			}
			
			break;
			
		case "half kui-tan":
			output("five to ten ");
			
			for (i = 0; i <= 5; i++)
			{
				addButton(i, String(5 + i) + "”", applyJunkSize, 5 + i);
			}
			
			break;
		
		case "half-kaithrit":
			output("four to six ");
			
			for (i = 0; i <= 2; i++)
			{
				addButton(i, String(4 + i) + "”", applyJunkSize, 4 + i);
			}
			
			break;
			
		default:
			output("four to eight ");
			
			for (i = 0; i <= 4; i++)
			{
				addButton(i, String(4 + i) + "”", applyJunkSize, 4 + i);
			}
			
			break;
			
	}

	output("inches. How long do you want it?”</i> He rolls his eyes. <i>“You’re gonna make your kid a stallion here, aren’t you? Why do I even ask?”</i>");
	
	this.addButton(14,"Back",chooseBreastSize);
}

public function applyJunkSize(arg:int = 0):void {
	pc.cocks[0].cLengthRaw = arg;
	pc.cocks[0].cThicknessRatioRaw = 1;
	if (pc.originalRace ==  "half-kaithrit") {
		pc.createStatusEffect("Uniball",0,0,0,0);
		pc.ballSizeRaw = .75;
	}
	if(pc.hasVagina()) chooseYourVagina();
	
	else chooseSexualGift();
}

//Vaginal Capabilities
public function chooseYourVagina():void {
	clearOutput();
	setLocation("SELECT VAGINAL\nTRAITS","PLANET: TERRA","SYSTEM: SOL");
	output("<i>“All right, I can specialize the vagina for capacity, extra lubrication, both, or neither. If we do both, the effects won’t be as pronounced as focusing on a single choice. I know that’s probably not the first thing you want to think about as a dad, but if the kid is gonna be taking after you, it’d be wise to tweak up at least one of those.”</i> The doctor looks at Victor expectantly.");
	this.clearMenu();
	this.addButton(0,"Capacity",upgradeCapacity);
	this.addButton(1,"Lubrication",upgradeLubricants);
	this.addButton(2,"Both",fullyUpgradeCunt);
	this.addButton(3,"Neither",chooseSexualGift);
	if(pc.hasCock()) 
		this.addButton(14,"Back",chooseYourJunkSize);
	else 
		this.addButton(14,"Back",chooseBreastSize);
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
	setLocation("CHOOSING A\nSEXUAL GIFT","PLANET: TERRA","SYSTEM: SOL");
	output("<i>“Great!”</i> Your personal physician notes your choice and says, <i>“This is one of the tougher choices future parents have to make. We can work some tweaks into your successor’s genome that’ll give them a bit of a gift, if you know what I mean - even beyond the choices you’ve made so far. The downside is that we can only safely insert one of these options into your child's genome.”</i>");
	output("\n\n<i>“I’ll give you the quick rundown of all the choices. ‘Virile’ increases the quality of sperm produced by your offspring, even if she’s a girl that splices on a dick later. ‘Potent’ is similar to virile, but it impacts the quantity produced, rather than quality. This one seems to be pretty popular among those who can afford these kinds of modifications. ‘Elasticity’ allows for bigger insertions with less chance of, uh... stretching.”</i>");
	output("\n\nThe doctor coughs a bit nervously. <i>“‘Fertility’ enhances the chances of becoming pregnant. ‘Milky’ causes lactation to be more easily induced and much harder to stop. ‘Incubator’... well, it makes pregnancies a little faster. ‘Hung’ would enlarge the size of male organs and cause them be more receptive to future splices. Conversely, ‘mini’ would, uh, cause masculine organs to tend towards smallness - as the name implies.”</i>");
	output("\n\nVictor sighs as the doctor drones on, knowing that these could be important but a little tired of the total volume of the information.");
	output("\n\n<i>“‘Bulgy’ would cause an increase in the size of any testes as well as increased receptiveness to gonad enhancement. ‘Extra Ardor’ will cause an increase in sex drive after maturity. I bet your parents gave you that, huh? ‘Ice Cold’ would be the opposite, reducing natural sex drive. It doesn’t have any effect on aphrodisiacs or receptiveness to touch, however.”</i> The doctor touches his fingers as if counting and purses his lips, <i>“Huh, I guess that’s all of them. What’ll it be?”</i>");
	//Make sure there is a none option.
	this.clearMenu();
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
		pc.elasticity -= .5;
		pc.removePerk("Elasticity");
	}
	if(pc.hasPerk("Fertility"))
	{
		pc.fertilityRaw -= 0.15;
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
	this.addButton(0,"Virile",applySexualGift,"virile");
	this.addButton(1,"Potent",applySexualGift,"potent");
	this.addButton(2,"Elasticity",applySexualGift,"elasticity");
	this.addButton(3,"Fertility",applySexualGift,"fertility");
	this.addButton(4,"Milky",applySexualGift,"milky");
	this.addButton(5,"Incubator",applySexualGift,"incubator");
	this.addButton(6,"Hung",applySexualGift,"hung");
	this.addButton(7,"Mini",applySexualGift,"mini");
	this.addButton(8,"Bulgy",applySexualGift,"bulgy");
	this.addButton(9,"Extra Ardor",applySexualGift,"extra ardor");
	this.addButton(10,"Ice Cold",applySexualGift,"ice cold");
	this.addButton(11,"None",applySexualGift,"none");
	if(pc.hasVagina()) 
		this.addButton(14,"Back",chooseYourVagina);
	else if(pc.hasCock()) 
		this.addButton(14,"Back",chooseYourJunkSize);
	else 
		this.addButton(14,"Back",chooseBreastSize);
	
}

public function applySexualGift(arg:String = "none"):void {
	if(arg == "virile") {
		pc.createPerk("Virile",1.15,0,0,0,"Increases the quality of your sperm.");
	}
	else if(arg == "potent") {
		//pc.cumMultiplierRaw += 1;
		pc.refractoryRate += 1;
		pc.createPerk("Potent",1,0,0,0,"Increases the size of your orgasms and the speed at which you produce ejaculate.");
	}
	else if(arg == "elasticity") {
		pc.createPerk("Elasticity",0,0,0,0,"Increases the elasticity of your orifices and renders them more resistant to stretching.");
		pc.elasticity += .5;
	}
	else if(arg == "fertility") {
		pc.fertilityRaw += 0.15;
		pc.createPerk("Fertility",0,0,0,0,"Increases your odds of getting pregnant.");
	}
	else if(arg == "milky") {
		pc.createPerk("Milky",0,0,0,0,"Causes lactation to be induced more easily and harder to stop.");
	}
	else if(arg == "incubator") {
		//(pc as PlayerCharacter).pregnancyIncubationBonusMotherRaw += 0.5;
		pc.createPerk("Incubator",1,0,0,0,"Increases the speed at which your pregnancies progress.");
	}
	else if(arg == "hung") {
		pc.createPerk("Hung",0,0,0,0,"Increases the size of your penis and how fast it grows.");
		if(pc.hasCock()) {
			pc.cocks[0].cLengthRaw += 2;
			if(pc.cocks[0].cThicknessRatioRaw < 1.1) pc.cocks[0].cThicknessRatioRaw = 1.1;
		}
	}
	else if(arg == "mini") {
		pc.createPerk("Mini",0,0,0,0,"Decreases the size of your penis and how fast it shrinks.");
		if(pc.hasCock()) {
			pc.cocks[0].cLengthRaw -= 1;
		}
	}
	else if(arg == "bulgy") {
		pc.createPerk("Bulgy",0,0,0,0,"Increase the size of any gonads and the speed at which they are enhanced.");
		pc.ballSizeRaw += 4;
		//HUEG BALLZ
		if(pc.originalRace == "half kui-tan") pc.ballSizeRaw += 5;
		pc.ballEfficiency += 1;
	}
	else if(arg == "extra ardor") {
		pc.createPerk("Extra Ardor",0,0,0,0,"Increases lust gain over time.");
	}
	else if(arg == "ice cold") {
		pc.createPerk("Ice Cold",0,0,0,0,"Slows lust gain over time.");
	}
	chooseAPhysicalAffinity();
}

//Pick a Physical Affinity
public function chooseAPhysicalAffinity():void {
	clearOutput();
	setLocation("CHOOSING AN\nAFFINITY","PLANET: TERRA","SYSTEM: SOL");
	output("<i>“Grrrreat,”</i> the doctor muses as he checks your selection. <i>“Just one more thing: I can slip in affinity for a certain attribute. These are all pretty self explanatory, so I won’t have to bore you overmuch. Suffice to say, your " + pc.mf("son","daughter") + " will be able to increase the chosen attribute more easily. We can do physique, reflexes, aim, intelligence, or willpower. Personally, I recommend intelligence.”</i>");
	output("\n\nThese ability scores are capped at five to start, though certain things like current level, starting race, cybernetic enhancements, and specific mutations can increase the maximum.\n\n<b>Physique</b> is a measurement of a character's strength and endurance. Its primary usage to land melee strikes and increase the damage of said strikes.\n\n<b>Reflexes</b> are a measurement of piloting aptitude, but they also come in handy when having to avoid a surprise attack or trap.\n\n<b>Aim</b> is a representation of how well one can aim both hand-held and ship-board ranged weaponry.\n\n<b>Intelligence</b> increases the effectiveness of technology-based attacks, primarily those used by tech specialists. It is also useful any time one has to deal with sophisticated machinery.\n\n<b>Willpower</b> is used to counter sexual urges and addictions, resist psionics, and strengthen one's own psionics, should a person of human descent somehow gain mind powers.\n\n<b>Libido</b>, while not an option the doc is giving, deals with how fast lust increases over time and susceptible to incidental lusts and perversions one is. It is not capped by level and scales from 1 to 100.");
	this.clearMenu();
	this.addButton(0,"Intelligence",applyAffinity,"intelligence");
	this.addButton(1,"Physique",applyAffinity,"physique");
	this.addButton(2,"Reflexes",applyAffinity,"reflexes");
	this.addButton(3,"Aim",applyAffinity,"aim");
	this.addButton(4,"Willpower",applyAffinity,"willpower");
	this.addButton(14,"Back",chooseSexualGift);
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
	setLocation("CHOOSING\nUPBRINGING","PLANET: TERRA","SYSTEM: SOL");
	output("<b>Some time later...</b>");
	output("\n" + pc.short + " was born without complications, but now Victor is faced with a new quandary. Just how is he going to raise his potential successor? If he pampers " + pc.mf("him","her") + ", " + pc.mf("he","she") + "’ll have a head start on life, but will likely be lacking in willpower. If Victor pushes " + pc.mf("him","her") + " into athletics, " + pc.mf("he","she") + "’ll likely develop " + pc.mf("his","her") + " physical skills over " + pc.mf("his","her") + " mental ones. Of course, the father could push his progeny towards being a bit of a bookworm, as knowledge is power, but " + pc.mf("he","she") + "’d wind up physically weaker. An austere upbringing would result in higher willpower but a little less of a financial, helping hand. The alternative to those options would be a balanced upbringing that favors nothing in particular.");
	//[Pampered][Athletic][Bookworm][Austere][Balanced]
	this.clearMenu();
	this.addButton(0,"Pampered",applyUpbringing,0);
	this.addButton(1,"Athletic",applyUpbringing,1);
	this.addButton(2,"Bookworm",applyUpbringing,2);
	this.addButton(3,"Austere",applyUpbringing,3);
	this.addButton(4,"Balanced",applyUpbringing,4);
	this.addButton(14,"Back",chooseAPhysicalAffinity);
}

public function applyUpbringing(arg:int = 0):void {
	//Pampered
	if(arg == 0) {
		pc.willpowerRaw--;
		pc.credits += 1000;
	}
	//Athletic
	else if(arg == 1) {
		pc.physiqueRaw++;
		pc.reflexesRaw++;
		pc.aimRaw++;
		pc.intelligenceRaw--;
		pc.willpowerRaw--;
		pc.libidoRaw++;
	}
	//Bookworm
	else if(arg == 2) {
		pc.physiqueRaw--;
		pc.reflexesRaw--;
		pc.intelligenceRaw+=2;
	}
	//Austere
	else if(arg == 3) {
		pc.willpowerRaw++;
		pc.credits -= 250;
	}
	//Balanced
	else if(arg == 4) {
		
	}

	chooseAlignment();
}

public function chooseAlignment():void {
	clearOutput();
	//Neutral neutral. Filthy neutrals.
	setLocation("SELECT\nA NATURE","PLANET: TERRA","SYSTEM: SOL");
	output("<b>You are " + pc.short + "</b> now, but the question remains, what kind of person will you be?");
	output("\n\n(This choice will affect how your character reacts to the challenges and situations " + pc.mf("he","she") + " finds " + pc.mf("him","her") + "self in. Ultimately choice will still remain with you, the player, but the way [pc.name] goes through those choices may vary with personality.)");
	this.clearMenu();
	this.addButton(0,"Kind",alignConfirm,17);
	this.addButton(1,"Mischievous",alignConfirm,50);
	this.addButton(2,"Hard",alignConfirm,85);
	this.addButton(14,"Back",chooseHowPCIsRaised);
}

public function alignConfirm(arg:int):void {
	pc.personality = arg;
	chooseClass();
}
	
public function chooseClass():void {
	clearOutput();
	showPCStats();
	pc.maxOutHP();
	pc.maxOutEnergy();
	updatePCStats();
	setLocation("SELECT\nA CLASS","PLANET: TERRA","SYSTEM: SOL");
	output("You're all grown up and finished with your schooling. Dad pushed you hard, which makes sense. He accomplished a lot and wants you to follow in his footsteps, but for whatever reason, he insisted you take on an occupation, and an odd one at that.");
	this.clearMenu();
	this.addButton(0,"Smuggler",classConfirm,GLOBAL.CLASS_SMUGGLER);
	this.addButton(1,"Mercenary",classConfirm,GLOBAL.CLASS_MERCENARY);
	this.addButton(2,"TechSpecialist",classConfirm,GLOBAL.CLASS_ENGINEER);
	this.addButton(14,"Back",chooseAlignment);
}
public function classConfirm(arg:int = 0):void {
	clearOutput();
	setLocation("SELECT\nA CLASS","PLANET: TERRA","SYSTEM: SOL");
	if(arg == GLOBAL.CLASS_SMUGGLER) output("<b><u>Smuggler</u></b>:\nAs a smuggler, your abilities would rely heavily on having good reflexes and either aim or physique, depending on your method of attack. You’d learn to be pretty sneaky, fly well, and hit your foes where they least expect it, all while making your living in the underbelly of the United Galactic Confederacy, or U.G.C. The life of a smuggler is one of profit through luck and skill.");
	else if(arg == GLOBAL.CLASS_MERCENARY) output("<b><u>Mercenary</u></b>:\nAs a mercenary, you’d depend on raw physique or aim for your attacks, focusing more on a good battle plan and tough armor than anything else. You’d learn to overpower your foes with sheer strength and determination, defend yourself with all manner of weapons and equipment, and fly a ship when the situation calls for it. The life of a mercenary is one of profit through violence.");
	else if(arg == GLOBAL.CLASS_ENGINEER) output("<b><u>Tech Specialist</u></b>:\nAs a tech specialist, your abilities would rely heavily on your intelligence and aim. You’d learn to work with all kinds of technologies, perhaps even make your own robotic defense turrets! Your intellect would be your greatest weapon, though you wouldn’t shy away from tweaking your own high-tech ranged weaponry. The life of a tech specialist is one of profit through smart decisions and superior technology.");
	output("\n\nIs this the career you’d like to pursue?");
	this.clearMenu();
	this.addButton(0,"Yes",setClass,arg);
	this.addButton(1,"No",chooseClass);
}

public function setClass(arg:int = 0):void {
	pc.characterClass = arg;
	if(arg == GLOBAL.CLASS_SMUGGLER) {
		pc.rangedWeapon = new classes.Items.Guns.HoldOutPistol();
	}
	if(arg == GLOBAL.CLASS_MERCENARY) {
		pc.rangedWeapon = new classes.Items.Guns.EagleHandgun();
	}
	if(arg == GLOBAL.CLASS_ENGINEER) {
		pc.rangedWeapon = new classes.Items.Guns.ScopedPistol();
		pc.shield = new classes.Items.Protection.DecentShield();
	}
	pc.meleeWeapon =  new classes.Items.Melee.Knife();
	pc.armor = new classes.Items.Apparel.DressClothes();
	pc.shieldsRaw = pc.shieldsMax();
	if(!pc.hasVagina()) 
		pc.lowerUndergarment = new classes.Items.Apparel.PlainBriefs() //   (items["9"]);
	else 
		pc.lowerUndergarment = new classes.Items.Apparel.PlainPanties() //   (items["8"]);
	if(pc.biggestTitSize() < 1) 
		pc.upperUndergarment = new classes.Items.Apparel.PlainUndershirt() //   (items["11"]);
	else 
		pc.upperUndergarment = new classes.Items.Apparel.PlainBra() //   (items["10"]);
	tutorialSkipOption();
	pc.maxOutHP();
}

//Tutorial Skip Option
public function tutorialSkipOption():void {
	clearOutput();
	setLocation("TUTORIAL\nSKIP", "TAVROS STATION", "SYSTEM: KALAS");
	output("Would you like to play through the story and tutorial or skip to gameplay?");
	//[Tutorial] [Skip]
	this.clearMenu();
	if (pc.hasVagina() || pc.hasCock()) addButton(0, "Tutorial", tutorialIntro);
	else addDisabledButton(0, "Tutorial", "Do Tutorial", "You must have genitals available in order to play through the tutorial fight.");
	addButton(1, "Skip", skipCeliseOption, undefined, "Skip Fight", "Skip the tutorial fight.");
}

//Death of a Great Man
public function tutorialIntro():void {
	clearOutput();
	setLocation("PRESENT\nDAY","TAVROS STATION","SYSTEM: KALAS");
	pc.removeStatusEffect("In Creation");
	output("Your dad’s health had been declining throughout your years of education, but you never really worried too much about it. He was super rich, able to afford his own private doctors, so the thought that one day he could disappear never entered your mind. When you started your career, he was there to see you off, smiling gregariously, but your job made it difficult to stay in touch. Most communications were done via written messages, until even those became scarce. You had assumed it to be a consequence of your different schedules and busy work lives, then...");
	output("\n\nThe news of his death arrived in a brief missive, containing an invitation to a funeral as well as a travel voucher to get you there. You quit your job on the spot. The way Dad talked, you’re sure he would have wanted you to take over the family business. What could have killed him? He always seemed so big and imposing. Even when his back was bent by age, he still had vital energy about him, seeming as busy as a man a tenth of his age. You don’t know why anti-agathic treatments stopped working on him. Worse, he aged far more rapidly than he should have, losing his youth in a short decade.");
	output("\n\nYou shake your head to chase away the unwelcome thoughts and focus on packing. The trip is boring, leaving you with nothing to think about except life without your father and the uncertain future ahead. Hopefully the old man was lucky enough to go out in a dignified way.");
	output("\n\nYour transport pulls up to Tavros Station, where the service is being held. Adjusting your finest clothes, you walk through the airlock and up some old-fashioned steps towards the theater Dad's money bought him, trying to keep your eyes clear as you breeze past a surprisingly low amount of paparazzi. They must have gotten decent security this time.");
	output("\n\nYou push open the doors and step inside...");
	this.clearMenu();
	this.addButton(0,"Next",tutorialIntro2);
}

public function tutorialIntro2():void {
	clearOutput();
	setLocation("THE\nFUNERAL","TAVROS STATION","SYSTEM: KALAS");
	output("The funeral is closed casket with no viewing, which is expected given the shape Dad was in the last time you saw him. His body was riddled with the lines of age and marked with liver spots and pre-cancerous lumps, and he didn’t want to be remembered that way. Thankfully, the ceremony is swift and fairly small. There are only family and friends here, though you wager a large amount of the ‘family’ is distant relations hoping to catch some of the inheritance.");
	output("\n\nMuch of the wake passes in a daze, with you swarmed by distant relations and well wishers, forced to shake hands and share hugs with people you don’t know while they offer barely-felt, useless platitudes that do nothing to assuage your loss.");
	output("\n\nYou’re on your way over to your father’s real friends, people you’ve actually seen around his mansion growing up, when his lawyer intercepts you and pulls you aside.");
	output("\n\n<i>“Come, we must talk...”</i>");
	//[Next]
	this.clearMenu();
	this.addButton(0,"Next",tutorialIntro3);
}

public function tutorialIntro3():void {
	clearOutput();
	setLocation("THE\nWILL","TAVROS STATION","SYSTEM: KALAS");
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
	this.clearMenu();
	this.addButton(0,"Next",tutorialIntro4);
}

public function tutorialIntro4():void {
	clearOutput();
	setLocation("THE\nWILL","TAVROS STATION","SYSTEM: KALAS");
	output("The next room is empty, save for a comfy looking, leather recliner. You actually recognize it as one of your father’s favorites. The arm rests are only a little more worn than you remember. A holo projector protrudes from the ceiling, aimed at the empty space in front of the chair. With nothing else to do, you seat yourself. The projector kicks on and your Dad’s face appears.");
	output("\n\n<i>“Hey there, " + pc.mf("sport","princess") + ".  If you’re seeing this, then my wrinkled old ass has finally kicked the bucket. I hope you aren’t too torn up over it; I’ve lived a long full life, longer than most people are lucky enough to live. Do me a favor and knock back a whiskey for me after this,”</i> the phantom image of your father says. A hand clips in front of his face as he rubs at his age-silvered goatee. <i>“Unfortunately, while I am seeing that your mother is taken care of, I’m not just handing the company over to you. Not yet, anyway.”</i>");
	output("\n\nYou glance down at the Codex and the vial in your hand. What did the old coot plan for you?");
	output("\n\n<i>“I know you’ve probably been too busy to keep up on the news, with the work I’ve pushed you into, but the fourteenth planet rush ought to be starting about now.”</i> A note appears over the recording, indicating the planet rush started almost two months ago, though most gates have only started going online in the past few weeks. <i>“I have to make sure you’ve grown into a " + pc.mf("man","woman") + " worthy of running the business, " + pc.short + ", so I’m putting you through what I went through, after a fashion. If you want to take over the company, you’re going on the planet rush!”</i>");
	output("\n\nHuh. Well, you suppose the careers he pushed you towards make a bit more sense in light of that. Your father made his fortune during the thirteenth planet rush, and he obviously intends for you to prove your mettle in the same way.");
	output("\n\n<i>“Maki should have given you the Codex and immune boosters by now. I’m sure the V.I. inside it has already explained what it can do for you, but to summarize: it’s going to be your best friend. You can use it to stake claims on untapped minerals and resources that the boys back home will run through the legal system. We’ll deliver you a stipend on each usable discovery.”</i>");
	output("\n\nVictor coughs repeatedly, holding a rag up in front of himself that darkens with what you assume to be flecks of blood in the monochromatic recording. You’d think he could have sprung for a color hologram. His coughs clear up and he continues, <i>“Sorry, health isn’t what it used to be.”</i> He laughs after that, realizing that for you, he’s dead. <i>“Anyhow, the immune boosters. Those micro-scale bots will reproduce in your body and safeguard it from some of the worst the universe can throw at you. They aren’t perfect, and more benign infections might slip through, but they’ll keep you from catching rot lung from a Trinerian. A word of caution: they’ll help you digest things that would normally be impossible for a human, but they’ll splice you to do it. You eat the wrong native foods, and you’ll wind up looking like a native. You might even start to feel like one, mentally. I’m told it’s like forced, convergent evolution.”</i>");
	output("\n\nYou turn the microsurgeon immune boosters over in your hand, debating whether to use them.");
	output("\n\n<i>“This recording is set up to repeat until you do it, " + pc.mf("son",pc.short) + ".”</i>");
	output("\n\nSighing, you press the injector port to the inside of your arm.");
	output("\n\n<i>“This recording is set up to rep-”</i>");
	output("\n\nThe injector hisses as it pricks your skin, pouring its payload into your veins. There’s a bit of burning pain, but nothing as bad ");
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("as the time you shocked yourself on an arc spanner");
	else if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("as the time you took a slug in the leg");
	else output("as the time you dropped your cargo on your foot, breaking more than a few toes in the process");
	output(". You grow a little flushed for a moment as the tiny machines settle into you. It passes swiftly. All things considered, you feel... the same.");
	output("\n\n<i>“Atta " + pc.mf("boy","girl") + ". I had something like that made for me after a particularly rough infection, though it wound up mutating me from exotic species’ sexual fluids as well.”</i>");
	output("\n\nA fucking horndog until the end. Of course.");
	output("\n\nThe recording smiles wistfully for a moment before resuming, <i>“I suppose that might have contributed to my demise, but damn, it was worth it. You’ll see for yourself once you get out there.”</i>");
	output("\n\nSure, whatever.");
	output("\n\n<i>“I’ve arranged to have a few dozen probes sent through the gates once they open. Each one is military grade hardened and keyed to only open for one of our family, so don’t lose too much of yourself. They all have clues pointing towards other probes secreted inside them, except for one. One has my personal, encrypted key. With that, you can open my deposit box in the bank I own on this station and take control of my company,”</i> Even projected through the soulless holoprojector, your dad’s spirit shines through his tear-misted eyes. <i>“I’m sure you’ll make me proud out there.”</i>");
	output("\n\nThe projection of your father tilts its head, gesturing towards another door behind it. <i>“Through the door behind, you'll find a hangar with the ship I started my journey on, repaired to usable condition and outfitted with standard, modernized technology. It’s a good starting point, but you should see if you can jump up to something better, particularly if you pick up the number of crewmates I did. That little junker can only hold a few people.”</i>");
	output("\n\nYou rise to progress, but Dad keeps talking. <i>“One more thing.... there’s a Galotian in the next room, right next to the ship’s key. If you want to do this, you’ve gotta subdue her. Galotians are voracious protein hunters, but they’re not truly dangerous. She’s still a tough little foe, though. I’ve set up some recordings to assist you in learning how to handle creatures like this during your adventures.”</i> Dad winks. <i>“Good luck!”</i>");
	//[Open Door]
	this.clearMenu();
	this.addButton(0,"Open Door",openDoorToTutorialCombat);
}
//The Introduction of Celise (Goo Girl)
public function openDoorToTutorialCombat():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	this.userInterface.showName("\nCELISE");
	setLocation("YOUR\nINHERITANCE","TAVROS STATION","SYSTEM: KALAS");
	output("You open the doorway and step through a little hesitantly, your hands on your " + pc.rangedWeapon.longName + " and " + pc.meleeWeapon.longName + " in case you need them. Visible light slowly increases as the systems dial up in response to your presence, illuminating an amorphous green blob that huddles in the corner. The semi-transparent, emerald mass bulges out at the base and turns to regard you. You aren’t sure how you can make such an assessment when it has no visible face or eyes, but it definitely seems to be reacting to you and you alone. Lurching violently, a bubbling mass erupts from the top of it, sparkling as it builds higher and higher, the cylindrical distention reforming into a more familiar, humanoid shape.");
	output("\n\nDense insets reveal themselves to be eyes. Darker hued bulges resolve into shapely lips. Excess material drapes down the back of the growing creature into a mane of unkempt, wild hair. The alien makes a sound that resembles a sigh of relief as arms separate from the sides of what must be its torso, while strings of fluid hang between the newborn appendages and the rest of her, reminding you just how gooey this thing is. Finally, the front of the chest bulges out into a pair of pert breasts. At least, they seemed that way at first. More and more liquid flows from seemingly endless reservoirs inside the thing, bloating the improvised mammaries bigger, fuller, and rounder with each passing second. The goo-girl doesn’t stop them until they obscure the bulk of her torso, reminding you of some of the racier porn-stars out there on the extranet.");
	output("\n\nWith her bust jiggling and wobbling in such a titanic manner that you feel it might separate from her chest, the gelatinous gal runs her hands over and through the new, bulgy boobs, giggling as your eyes follow her motions. She chirps, <i>“Hiya! You look like you taste pretty good! I think I’ll drain you dry...”</i>");
	output("\n\nShe lurches forward, and for a second, you fear you’ll be engulfed before you can react. A blue flash interrupts her pell-mell undulations, and your Dad’s face appears between you, suspended in the air. He explains, <i>“Celise here is a fairly simple girl with simple needs. Unfortunately, she doesn’t respect anyone until she feels they’ve earned it. You’re going to have to fight her if you want to get the keys to your new ship.”</i>");
	output("\n\nDamnit, Dad!\n\n<b>It’s a fight!</b>");
	this.clearMenu();
	this.addButton(0,"Next",startCombat,"celise");
}

public function celiseAI():void {
	//Round 1:
	if(pc.statusEffectv1("Round") == 1) {
		output("Well, that didn’t work! She seems completely immune to normal physical attacks.");
		output("\n\n<i>“Hehe, that tickles!”</i> Celise giggles, <i>“Are you sure you want to listen to that old fuddy duddy instead of letting me </i>");
		if(pc.hasCock()) output("<i>wrap myself around your " + pc.cocksDescript() + "</i>");
		if(pc.hasCock() && pc.hasVagina()) output(" <i>and</i> ");
		if(pc.hasVagina()) output("<i>plunge into your " + pc.vaginasDescript() + "</i>");
		output("<i>?”</i> She pushes her finger into the semipermeable membrane around her breast, allowing you to hear the lewd, sucking noises her body makes around her digit as you watch. <i>“It’ll feeeel gooood!”</i>");
		//Plus lust!
		pc.lustRaw += 10;
	}
	//Round 2:
	else if(pc.statusEffectv1("Round") == 2) {
		output("The goo-girl appears impervious to everything you can throw at her! Just how did Dad expect you to handle something like this?");
		output("\n\nCelise leans down to put her palms flat on the ground, her breasts squishing out around the sides of her arms, actually merging partway into her elbows as she begins to crawl toward you, wiggling her suddenly visible rump and hips at you, now revealed by her altered posture. <i>“I’m gonna suck all the yummiest juices out of you!”</i> Her lips plump bigger after the declaration, almost forcefully reminding you how good they would ");
		if(pc.hasCock()) output("feel around " + pc.oneCock());
		else if(pc.hasVagina()) output("feel on " + pc.oneVagina());
		output(".");
		//Plus lust!
		pc.lustRaw += 10;
	}
	//Round 3:
	else if(pc.statusEffectv1("Round") == 3) {
		output("Whoah, now that’s a reaction! Celise whimpers and starts to vigorously fist herself again and again, not even bothering to make sure her hand goes between her legs. Wherever she shoves her balled fist into, sensitive lips form around it, suckling and oozing with lust around her fast-pumping arm.");
		foes[0].lustRaw = 100;
		pc.lustRaw += 10;
	}
	processCombat();
}

//Win
public function defeatCelise():void {
	pc.removeStatusEffect("Round");
	setLocation("VICTORY OVER\nCELISE","TAVROS STATION","SYSTEM: KALAS");
	this.userInterface.showBust("CELISE");
	this.userInterface.showName("\nCELISE");
	output("Celise groans, <i>“Come on, fuck me! Please? Don’t just... leave me like this! I need your juiiiiice!”</i> The last word comes out as a high-pitched, nearly orgasmic whine. Her masturbation gets faster and more lewd with every passing second.");
	output("\n\nVictor’s hologram faces you and explains, <i>“If you’re seeing this, you learned how to disable Celise. Good work. The key is on the shelf next to the exit.”</i> He sighs and continues, <i>“Most things you run into won’t be nearly as easy to deal with. You’ll want to make sure to master the skills of your vocation and use them to the best of your ability. As you develop your abilities, you’ll find that many of them can be chained together to be more effective. Make sure you do that, or you’ll have a hard time beating some of the galaxy’s worst.”</i>");
	output("\n\nYou put away your weapons and go to grab your key when a barely cohesive hand wraps around your " + pc.foot() + ". There isn’t enough force behind it to immobilize you, but it does catch your attention. Celise is looking up at you with pleading eyes that would make an Earth puppy proud.");
	output("\n\n<i>“If you give Celise what she wants now, you’ll probably earn her loyalty. That choice is up to you; I can’t make it for you. Galotians are a fiercely loyal people once they choose to follow someone, and though she has few marketable skills, it might be good to have a companion out there in the void. Whatever you choose, I’m sure you’ll do me proud.”</i> Victor smiles dryly. <i>“After all, I bet my legacy on it.”</i>");
	output("\n\nThe recording winks off.");
	output("\n\nWhat do you do with Celise? Ignore her, or feed her and take her on your crew?");
	this.clearMenu();
	this.addButton(0,"Ignore Her",ignoreCelise);
	this.addButton(1,"Feed Celise",takeCelise);
}

public function skipCeliseOption():void
{
	clearOutput();
	setLocation("TUTORIAL\nSKIP", "TAVROS STATION", "SYSTEM: KALAS");
	showBust("CELISE");
	showName("\nCELISE");
	chars["PC"].removeStatusEffect("In Creation");
	output("What do you do with Celise? Ignore her, or take her on your crew?");
	
	clearMenu();
	addButton(0, "Ignore Her", jackJillSkip);
	addButton(1, "Take Her", takeCeliseSkip);
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
	setLocation("KEYS","TAVROS STATION","SYSTEM: KALAS");
	output("You ignore the hand and pull free, grabbing the keys as you step out to inspect your ship.");
	//[Next]
	this.clearMenu();
	this.addButton(0,"Next",checkOutYourShip);
}
//Feed Celise [Male]
public function takeCelise():void {
	pc.removeStatusEffect("Round");  // Uh, this was removed in the previous function. Duplicate?
	clearOutput();
	this.userInterface.showBust("CELISE");
	this.userInterface.showName("\nCELISE");
	setLocation("CELISE","TAVROS STATION","SYSTEM: KALAS");
	//Feed Celise [Male]
	if(pc.hasCock()) {
		output("Smiling a little lustily, you strip out of your gear and toss it up on the shelf, next to the key. Celise smiles beatifically up at you, her eyes practically humping every bit of exposed " + pc.skinFurScales() + " as you reveal yourself. As soon as your " + pc.cocksDescript());
		if(pc.cockTotal() == 1) output(" is");
		else output(" are");
		output(" out, she gasps in delight, pulling her hand away from her frenzied self-pleasure to stretch towards you, extending far longer than you would have thought possible given the size of her limb. Her palm immediately envelops " + pc.oneCock() + " with sticky goo, not grasping you with fingers but completely taking you into her moist, slippery insides.");
		output("\n\nYour " + pc.legs() + " wobble from the sensation assaulting you, and you grab hold of the shelf for support, watching the emerald blob slide across the floor until it squishes up against you. Celise gushes, <i>“Ohh, look at it! It’s nice and hard and veiny and it tastes so good inside me! Thank you for deigning to feed me... " + pc.short + ", was it?”</i>");
		output("\n\nYou nod and try to stay upright. Fluid weight roils around your " + pc.cockDescript(pc.biggestCockIndex()) + " with slow, gentle undulations, tickling every square inch of its surface with perfect pressure. Somehow, despite its glorious slipperiness, there’s just enough friction for your body to make your nerves fire one after the other, forcing your internal muscles to flutter and squeeze fat drops of pre-cum into the goo-girl’s wrist. She arches her back to raise her titanic breasts into her arm, absorbing her own elbow, forearm, and then wrist, drawing your dick deep into her swollen teat. You gasp and drip a bit more freely in response.");
		var x:int = pc.biggestCockIndex();
		output("\n\n<i>“Yum! Even your pre-cum is tasty. Can I just keep milking that out of you, or would you rather I get you off? Unless you can cum hard enough to make my tit turn white, I think I’d prefer the former,”</i> Celise giggles as her arm exits out the bottom of her tit, appearing to hold it up, though it’s made of the same material as the jiggling, gelatinous mammary. Her free hand is buried to the wrist in her gooey undercarriage, pumping low and slow into a massive, over-engorged honeypot.");
		output("\n\nYou grunt in pleasure and pain as your ardor builds to an unmanageable boil, aching to burst out, to explode deep into Celise’s gooey, delicious tit. Her controlled motions seem intent on holding you there forever. She teases you to the precipice and backs off again and again, devouring the hot, liquid pleasure that " + pc.eachCock() + " releases whenever you get particularly close. You can’t take it anymore!");
		output("\n\nLetting go of the shelf, you grab hold of her massive tit in both hands");
		if(pc.cockTotal() > 1) output(", jamming your second cock into the squishy teat without pause");
		output(", savagely pushing in to the hilt");
		if(pc.balls > 0) output(", slapping into her so hard that your " + pc.ballsDescript() + " slip inside as well");
		output(". She mewls in response, which would worry you if it wasn’t for the way her pussy is literally gushing, geyser-like around her fist. You draw back and slam it home again, causing a jiggle to ripple across her entire body. Globs of green separate from her as she loses some of her cohesion in pleasure, allowing your fingers to sink partway into her cushy interior.");
		output("\n\nCelise wails, <i>“Fuck me harder " + pc.short + "! Harder!”</i> She pulls her hand out of her cunt and grabs onto your arm as she pleads, <i>“Use me like I’m one big, cum-hungry cunny!”</i> Trickles of liquified goo run soak your " + pc.skinFurScales() + ", and a puddle of shining jade spreads around you both.");
		output("\n\nYou’re too turned on to slow your pace, and you fuck faster and harder, the hot, wet slaps echoing in the metal-encased room as you do your damnedest to bring yourself off in the liquefying goo-girl. The texture inside grows sloppier and wetter, but her swirling caresses move faster and more forcefully, battering your dick");
		if(pc.cockTotal() > 1) output("s");
		output(" with soaking-wet pleasure. You groan as you feel a tongue slide across your belly. Celise has pressed her face into you and is licking everything she can get to while you pump her tit.");
		output("\n\nIn a violent lunge, Celise stretches up to your shoulders, wrapping her arms around your shoulders to suspend herself there. Your hands and dick");
		if(pc.cockTotal() > 1) output("s");
		output(" slide through her body down into the sopping, lube-leaking flower perched atop the goo mound, and her squeezing ripples grow more powerful. The goo-girl whimpers, <i>“Please, cum in me. I need it sooo bad!”</i> before mashing her lips against your own, the ball-like support beneath her rolling back and forth to slap wetly against you.");
		output("\n\nVacuum-like suction pulls on your dick");
		if(pc.cockTotal() > 1) output("s");
		output(" as she twists and twirls all around you, and you realize you can hold back no longer. Her tongue is sweet on yours, swirling around your mouth as you throw your head back and cum, pumping a thick batch of protein straight into her dick-suckling snatch. The quivering slit tugs harder on your boner");
		if(pc.cockTotal() > 1) output("s");
		output(", eagerly pulling more fresh ejaculations inside where they dilute her green into an opaque " + pc.cumColor() + ".  Your " + pc.hipsDescript() + " jerk and shake while your " + pc.cockDescript(x) + " flexes inside its gooey prison, throwing long ropes of suppressed lust for what feels like ages.  Whenever you think it's about to end, the tugging starts again, and you whimper as the endless orgasm renews itself.");
		output("\n\nAt some point");
		if(pc.balls > 0) output(", your " + pc.ballsDescript() + " start to hurt. Not long after");
		output(", the juicy pleasure-flow dries up, and Celise allows your orgasm to finish. She’s shuddering herself as she detaches, so wracked by pleasure that one of her arms liqueifies, dropping to the floor for a moment until it slithers over to rejoin the rest of her. Her hair is melting, her tits are sagging, and her whole body shudders from time to time, shaking with post-orgasm spasms. She burbles, <i>“That was great! You’re gonna take me on your ship now, right?”</i>");
		output("\n\nYou give her a stern but exhausted look.");
		output("\n\n<i>“I can get by on protein paste and water. I promise I won’t try to forcefully milk you again!”</i> Celise nibbles on her lip, letting it grow bigger and poutier as she does. <i>“Besides, I kind of owe you for being nice enough to feed me. And think of all the ways you can use me whenever meaner aliens get you too turned on to think! I’m a perfect sperm-receptacle!”</i> Her giggling, proud tone makes it clear she has no idea that a ‘sperm-receptacle’ is usually not a good thing.");
		output("\n\nDo you take Celise on as your first crew member?");
	}
	//Feed Celise [Female]
	else {
		output("Smiling a little lustily, you strip out of your gear and toss it up on the shelf, next to the key. Celise smiles beatifically up at you, her eyes practically humping your " + pc.skinFurScales() + " as you reveal yourself. When " + pc.eachVagina() + " is exposed, she visibly licks her lips and ceases her masturbation, using her jade secretions to oil her heavy tits, teasing tiny nubs that bloom into big, suckable nipples in a matter of moments. You sensually swivel your hips and ask, <i>“</i>");
		if(pc.isNice()) output("<i>What’s the best way to feed you?</i>");
		else if(pc.isMischievous()) output("<i>So, is this your first time or what?</i>");
		else output("<i>Here’s my cunt. Why aren’t you licking it yet? I thought that’s what you wanted!</i>");
		output("”</i>");
		output("\n\nThe glittering, hungry slut composes herself enough to surge towards you, ignoring your question completely. Instead, she rolls at you like a wave, if a wave could be capped with bloating bimbo lips and a slithering tongue that could put a snake to shame. You let her crash into you, knowing that she doesn’t pose any real threat at this point, and simply enjoy the sensation of her warm body sliding around your " + pc.legs() + ". In a way, it’s like slipping into a nice bath, only the bath is a bit thicker and strokes you everywhere, like an army of phantasmal tongues, all worshipping you at once.");
		output("\n\nThe real tongue comes into contact with " + pc.oneVagina() + " a moment before two plush pillows compress against your mons, smothering your labia in sloppy-wet kisses. The tongue slithers over the folded flesh, drawing gasps and moans from you as your pussy goes ten kinds of juicy. Your " + pc.clitDescript() + " engorges and peeks out from its hood in response, hard and sensitive against the slippery, gooey mouth. You grab hold of the shelf to try remain upright, briefly fearing that you’ll fall inside her and drown as the pleasure takes you, but the way Celise’s eyes look up at you while she tends to your " + pc.vaginaDescript() + " leaves no doubt in your mind: she’d never let that happen. She’s far too busy worshipping you orally, sucking down your juices even as hers turn your exterior genitalia into a swampy, green mess.");
		output("\n\nYou give up your grip even as your " + pc.legs() + " give out, lewdly splaying wide inside their gelatinous prisons. Instead, your hands secure themselves on the back of Celise’s head, pushing her harder and more urgently into your " + pc.vaginaDescript() + ". A muffled cry of excitement vibrates through your vulvae as the goo-girl finds herself between a rock-hard grip and a wet place. Her tongue wriggles and writhes unguided at first, then it draws back, suddenly controlled. As you hump the moist fuck-pillows perched on your oozing quim, the wiggling probe pierces through your sensitive curtains, ");
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
		output("\n\nBy the time you piece your consciousness back together, you find yourself babbling incoherently in the midst of a continuous, mind-shattering orgasm.  Once Celise has her fill, you’re an incoherent mess. Aftershocks of pleasure quake through your still-twitching body as she detaches. She slowly separates from you, shuddering a little bit herself as you’re pulled out of her gooey embrace. The sucking holes holding your " + pc.legs() + " close up, but not before you get a glimpse of vaginal lips topped with soaked nubs. This goo-girl was fucking herself on your " + pc.legs() + " as she ate you out! The whole of your lower body is soaked and dripping with her jade moisture, particularly your " + pc.feet() + ". Your " + pc.buttDescript() + " touches the cold, metal floor as she daintily wipes her mouth on the back of a juicy palm, allowing you a moment to recover..");
		output("\n\n<i>“That was great, and your cunny was super tasty, too! Can I come on your ship? Like Vik said, I’m super thankful you stopped to feed me!”</i> Celes bubbles.");
		output("\n\nDespite your exhaustion, you manage to give her a stern look.");
		output("\n\n<i>“I promise not to try and force myself on you or nothing! ‘Sides, you know just how to make me melt anyhow! I can get by on water and protein paste, but if a mean ol’ alien ever gets you all wet and juicy...”</i> Celise nibbles on her lower lip, and with every tiny bite, it grows puffier and poutier, looking softer by the minute. <i>“...I’ll be the perfect little lesbian, girlspunk-dump. Or, if you grow a dick I’ll be totally happy to suck on that,”</i> she adds, nodding enthusiastically. <i>“You’ll be yummy either way!”</i>");
		output("\n\nDo you take Celise on as your first crew member?");
	}
	//Orgasm, edit stats
	pc.orgasm();
	this.clearMenu();
	this.addButton(0,"Take Her",takeCeliseAsACrewMember);
	this.addButton(1,"Don't",ignoreCelise);
}

//Take Celise on As A Crew Member
public function takeCeliseAsACrewMember():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	this.userInterface.showName("\nCELISE");
	//{Nice}
	if(pc.isNice()) output("You smile broadly and admit that you’d be happier to have her along; the more the merrier, in fact!");
	//{Mischievious}
	else if(pc.isMischievous()) output("<i>“Why not? If nothing else, I guess I can use you as a super-soft beanbag chair, when we aren't fucking.”</i>");
	//{Mean}
	else output("You shrug and admit you don’t mind her coming along, so long as she stays out of your hair and doesn’t clog the vents with... stray moisture.");
	//{merge}
	output("\n\nCelise jiggles jubilantly, the accumulated mass of goo below her waist churning with excitement as she applauds. She gulps in a huge breath of air, ballooning herself comically before exhaling it in a quiet <i>“Yayyyy...”</i> You glance at her curiously, and she shyly covers her mouth, whispering, <i>“Sorry.”</i>");
	output("\n\nWhatever, it’s time to get this show on the road! You grab the digikey off the shelf and step through the door.");
	flags["RECRUITED_CELISE"] = 1;
	flags["CELISE_ONBOARD"] = 1;
	this.clearMenu();
	this.addButton(0,"Next",checkOutYourShip);
}

//Check Out Your Ship
public function checkOutYourShip():void {
	clearOutput();
	setLocation("SHIP\nHANGAR","TAVROS STATION","SYSTEM: KALAS");
	output("A sprawling, brightly lit hangar greets your eyes, empty save for a single ship near the back. Your gaze is pulled away from the distant craft by the sheer size of the enclosure. A hangar like this must have cost your father a veritable fortune to buy out - not much considering how wealthy he was, but no insignificant chunk of change. Magnetically-bounded plasma shields hold in the atmosphere while remaining transparent enough for you to view the nearby warp gate and inky blackness beyond. Perhaps the only thing this place couldn’t hold would be a capital ship, but a number of moorings with connective umbilicals stand by to tether one outside in that extreme scenario.");
	output("\n\nYou chuckle and wonder if you’ll ever need anything that grandiose while you turn your attention back to the light craft in the corner, currently surrounded by techs. Breezing up to them, you get your first good look at your inheritance; in short, it’s a bit of a junker. The hull plating is ancient and rusted in a dozen places where the paint has long since rotted off. Whole pieces of it are still on the floor, being cut into with plasma torches to replace dead tech, and the design of it is a century out of date. You bite back your sigh before it leaves your mouth, noting the newly installed engines and computer systems. Still, new engines don’t make it look any less like a elderly rim-jockey’s heap.");
	output("\n\n<i>“Hello there! You must be the young Captain Steele! A pleasure to meet you,”</i> one of the technicians says once he spots you. <i>“Sorry the ship is in such rough shape. Towing it all the way out here took a little longer than anticipated, so we got a late start. We’re pulling a double shift to get it all done by tonight. Just give us a little more time, maybe get a bite to eat and a place to stay 'til morning. She’ll look a hundred times better once we finish up, I promise.”</i>");
	output("\n\nYou shake the hangar tech’s hand and nod to him, understanding the enormity of the project before them. The nametag on his jumper lists him as ‘Zeke’. He nods and jovially quips, <i>“Yah, my name’s Zeke, or Z if you really wanna get short with it. Whatever you bring in here, I’ll keep maintained or fix up. Cleaning up other folks’ messes is kinda my business.”</i> Zeke waves you off. <i>“Go on, get something to eat. I’m sure you had a shitty day and don’t wanna spend the rest of it hanging around us while we put this back together.”</i>");
	output("\n\nA clearly marked exit portal dilates as you approach, and you step out into the station’s main thoroughfare. It’s surprisingly quiet and devoid of the shops you’d expect to see. The only place with any grub looks to be an “Anon’s Bar”</i>, though it boasts mention of rooms for rent as well.");
	output("\n\nYou head on in...");
	//[Next]
	this.clearMenu();
	this.addButton(0,"Next",getFoodAndDrink);
}
//Go Get Food and a Drink
public function getFoodAndDrink():void {
	//Meet your rival
	clearOutput();
	setLocation("ANON'S\nBAR","TAVROS STATION","SYSTEM: KALAS");
	output("Heady alcoholic scents combine with drug-laced smoke and salty food to give this place the unquestionable aroma of a seedy bar. Three-breasted waitresses balancing trays full of drinks one-handed sashay around in short skirts and sheer tops, their gait made awkward by their three legs and small feet. One of them notices you and asks, <i>“A drink for you, hun?”</i>");
	output("\n\nAfter a moment, you decide to order a whiskey. Regardless of your personal feelings, Dad asked you to knock one back for him. You may as well humor the dead codger, even if he did make acquiring your inheritance a trial and a half. At that point, your belly rumbles, and you realize that you haven’t had anything to eat since this morning.");
	output("\n\n<i>“How about I bring out some hot buns with that for you to munch on. You can look over the menu while you snack.”</i> She doesn’t wait around for an answer, moving off to drop a single drink off at a nearby table on her way to the kitchens. With the lighting as dim as it is, it’s difficult to make out much about the individual. It looks human, but its shape eludes you as you sit down. There’s nothing else to do, so you ponder the nearby person... just what sex are they?");
	//[Male] [Female]
	this.clearMenu();
	this.addButton(0, "Male", function():void { setRivalGender(1); rivalSpillsTheBeans(); });
	this.addButton(1, "Female", function():void { setRivalGender(3); rivalSpillsTheBeans(); } );	
}

public function jackJillSkip():void
{
	clearOutput();
	setLocation("ANON'S\nBAR", "TAVROS STATION", "SYSTEM: KALAS");
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
	
	this.userInterface.showBust(chars["RIVAL"].short.toUpperCase());
	userInterface.showName(chars["RIVAL"].short.toUpperCase());
	
	setLocation("MEETING\n" + chars["RIVAL"].short.toUpperCase(),"TAVROS STATION","SYSTEM: KALAS");
	output(chars["RIVAL"].mf("He","She") + "’s " + chars["RIVAL"].mf("male","female") + ", surely. Just as you make that conclusion, " + chars["RIVAL"].mf("he","she") + " turns and spots you. You lean back and try to make yourself look as inconspicuous as a bored, leering stranger can, but it must not work out too well. The silhouette gets up and snatches " + chars["RIVAL"].mf("his","her") + " drink, walking towards you with a slow, overly confident gait that betrays its owner’s nimbleness. You ball your fists and hope that you’re not going to get in a fight on a day like today.");
	output("\n\nLuckily, the figure resolves into someone more familiar: " + chars["RIVAL"].short + " Steele, obviously on station for the same reason as you. " + chars["RIVAL"].short + " is your cousin, though in this case, familiarity breeds no affection. " + chars["RIVAL"].mf("His","Her") + " father is Maximillian Steele, your Dad’s brother and all around conniving bastard. Uncle Max made his fortune by following your father and filing time-shifted, forged claims on as many of your father’s finds as he could. The worst part of it is that some of the claims actually held up in court, allowing him to make out nearly as well as Dad with a fraction of the risk.");
	output("\n\n" + chars["RIVAL"].short + " pulls you from your thoughts with a snide greeting, <i>“Hello, cousin.”</i> The last part is enunciated in a sneer. Perhaps " + chars["RIVAL"].mf("he","she") + " was brought up with a similar tale, demonizing your father. You wouldn’t put it past Uncle Max.");
	output("\n\n<i>“Hail, " + chars["RIVAL"].short + ",”</i> ");
	if(pc.isNice()) output("you say with as much friendliness as you can muster");
	else if(pc.isMischievous()) output("you say with less humor than you usually bring to a conversation");
	else output("you say with spite in your voice");
	output(", <i>“What brings you to my table?”</i>");
	output("\n\n" + chars["RIVAL"].short + " smirks and takes a swig of " + chars["RIVAL"].mf("his","her") + " drink. <i>“I just thought I’d let you know that Uncle Vic made a huge mistake. No, a gigantic one.”</i> " + chars["RIVAL"].mf("He","She") + "  laughs and continues, <i>“The best part is that neither of you even know it! Let me elucidate for you, simple cousin.”</i> " + chars["RIVAL"].short + " produces a simple touch tablet from " + chars["RIVAL"].mf("his","her") + " pocket and a tiny, chit-sized disk.");
	output("\n\n<i>“This is a pretty standard handheld computer, but this,”</i> " + chars["RIVAL"].mf("he","she") + " says holding the miniature device aloft, <i>“is a sophisticated tracking and eavesdropping device - just like the one in your pocket.”</i>");
	output("\n\nNo.... You reach into your pocket and turn it out, catching an identical device when it falls into your hand. You immediately drop it on the floor and crush it under" + pc.foot() + ", but that merely earns a derisive snort from your unfriendly dinner companion.");
	output("\n\n<i>“The data was already transmitted. I know everything, " + pc.short + ". Best of all, I’m part of the family, so your father’s precious gene-locked probes will handily divulge their secrets to me.</i> " + chars["RIVAL"].short + " gives an ingratiating smile. <i>“My ship is already good to go, but I think I’d rather depart on a good night’s rest. Besides, why should I need to rush when your clunker is in pieces all over your hangar? Good luck, cuz.”</i>");
	output("\n\n" + chars["RIVAL"].short + " swaggers off with " + chars["RIVAL"].mf("his","her") + " drink and " + chars["RIVAL"].mf("his","her") + " spy machines, leaving you to brood on your thoughts while your order arrives. It tastes bitter in your mouth after such a betrayal, but you swear to yourself that the punk won’t take over Dad’s company. Even the outrageous bustiness of your server won’t cheer you up at this point, nor will the surprisingly delicious wings.");
	output("\n\nYou burp as fatigue sets in and make off to secure quarters for the evening. Tomorrow is going to be a big day, and you intend to hit the galactic rim hard.");
	output("\n\nTomorrow, you join the Planet Rush.");
	this.clearMenu();
	this.addButton(0,"Next",ohShitGameStarts);
}
//Wake to Find Rival Left in the Night
public function ohShitGameStarts():void {
	clearOutput();
	this.userInterface.showBust(chars["RIVAL"].short.toUpperCase());
	userInterface.showName(chars["RIVAL"].short.toUpperCase());
	setLocation("THE\nMESSAGE","TAVROS STATION","SYSTEM: KALAS");
	output("When you rise, the Codex beeps and says, <i>“Message received.”</i> You flip it open to read the missive, instead getting blasted with your snotty cousin’s voice as " + chars["RIVAL"].mf("he","she") + " says, <i>“Good morning sleepyhead. I just wanted to let you know that I left not long after you went to bed. My ship does have luxurious sleeping quarters for ten, after all. Ta ta!”</i>");
	output("\n\n<i>“Message complete,”</i> the codex blithely states.");
	output("\n\nYou hastily don your gear and scramble over to the hangar, hoping it has a replicator capable of making something approximating a decent breakfast. The techs are gone, probably sleeping after a full night’s work. The ship looks completely different all finished up. It’s been painted bright red with silvery stripes. Looking at it again, you realize that you recognize this from some of your father’s holo-pics, at least the ones he’d let you see. This is the same ship that he took out on the Thirteenth Planet Rush, almost two centuries ago.");
	output("\n\n(<b>Ship Acquired: Casstech Z14</b>)");
	minutes = 2;
	hours = 6;
	days = 1;
	this.userInterface.showTime();
	//[Next] - to station screens!
	this.clearMenu();
	this.currentLocation = "TAVROS HANGAR";
	this.shipLocation = "TAVROS HANGAR";

	if (false)//if(demo) 
		this.addButton(0,"Next",demoOver);
	else 
		this.addButton(0,"Next",mainGameMenu);
	
}
public function demoOver():void {
	clearOutput();
	setLocation("DEMO\nCOMPLETE","THANKS FOR PLAYING","AND SUPPORTING ME.");
	output("This concludes the full TiTS introductory sequence.  Keep your eyes peeled for supporter-only releases and the eventual public pre-releases as I get more done.");
	this.clearMenu();
	this.addButton(0,"Appearance",appearanceTest);
}

public function appearanceTest():void {
	appearance(pc);
}