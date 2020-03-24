//Xanthe, the Siel Vendor of the 'Silken Serenity'
//Alien Caterpillar Domme, for all your Myrellion Clothing, Armor, and Lingerie needs!
//By JimThermic, that guy who writes things.
//Family Expansion by Sen Kanashimi

//Resource Images
// None of these exactly resemble the Siel, but many have certain aspects that have been incorporated into them. The first two pictures were the largest inspiration.
//http://31.media.tumblr.com/6d0d17b86daa8081fc0412c3da30fba2/tumblr_naooxoNR0q1tqn35to1_r1_1280.png - This is the primary inspiration pic for the siel. The hips, legs, and feet are dead on (except for body color). Their body is more caterpillar like and has two more legs.
//https://www.dropbox.com/s/vbb8ln8r9le1iqs/1406507618788.jpg - Siel have this kind of stomach (though not as long) and these kind of prolegs (The hooks), though differently colored (Blackish gray). Thier body is also broken up a bit like this.
//http://i.ytimg.com/vi/Zc2OqegzO6Y/hqdefault.jpg - Xanthe's eyes look like this. Most siel have this kind of 'black rim' that bleeds inwards, and an intense color that bleeds back in the other direction.

//Xanthe And The Silken Serenity (Overview)
// Located in Gildenmere on Myrellion.
// Classy establishment... sort of. Besides the slightly lecherous Siel owner.
/*Full Name: Xanthe O'Anyalicia (Xanthe)

Appearance:
Midnight blue hair and electric blue eyes.
Collarbone or shoulder length wavy hair. 
Dark blue nipples.
Blue-gray skin
Distinctively high cheekbones and full, pouting lips. Womanly features.
Black lacy bra and panties, black stockings with a lacy trim on all eight legs (See first reference pic). Garter belt and garters.
Front siel cock and back siel pussy. Can be changed.
Has a husky, rich voice and mysterious, powerful air about her. Very distinct presence. Smells of fresh rain.

Personality:
Xanthe is very 'vanilla' by siel standards, which is the opposite of what terrans consider vanilla. She's a Domme, loves scantily clad outfits, and wants a harem of pretty boys and girls parading about in her self sewn clothing.
Xanthe is not a 'bitch Domme' but equal parts hard and soft as she needs to be. She loves to tease her partners. More femme-fatale plus maternal than straight up bitch queen.
Xanthe is very easy going for a siel. She prefers to just look and have pretty things. Most of her life is about pretty things and people.
Xanthe is not a mother, though she has mated plenty of times. She takes her contraceptives!
Xanthe is anti-war, because war is too much effort and not very pretty at all. None of her favorites come back. *Frowny face*
Xanthe laments the fact that she's a stereotypical siel girl, but can't bring herself to bend the rules by wearing revealing clothing and engaging in vanilla sex. That said, she wholeheartedly loves being a Domme.
Xanthe, like most siel, is very mod-happy.*/


//The Silken Serenity
//Design of Store
// The Silken Serenity for players consists of a storefront room, a hallway, and a dungeon. 
// The storefront connects to the hallway, then the hallway connects to the BDSM dungeon. 

//Silken Serenity Exterior Description

public function silkenSerenityExteriorShitz():Boolean
{
	//Set up panty shit. Makes sure you have to walk out and come back at least once after becoming her sloot!
	if(xantheIsDommingPC() && !pc.hasKeyItem("Panties - Xanthe's - Lacy, black siel-silk panties."))
	{
		if(!pc.hasStatusEffect("XanthePanties")) pc.createStatusEffect("XanthePanties");
	}
	output("You spot an extravagant looking store with sheek marble pillars alongside the entrance. A crowd of stunningly beautiful beings are gathered out the front in a line. They are modelling various garments, armor, and lingerie. Peering closer, you realize they are holograms.\n\nAbove the store is a glimmering, glitzy sign that reads: “Silken Serenity”. Through the throng of holo-models, you notice the windows are made of mirrored glass.");
	// The last paragraph of the description is randomly picked. Below are the seven random paragraphs. The race in the paragraph is also picked at random.
	var choice:int = rand(7);
	//Message 1
	if(choice == 0) 
	{
		output("\n\nA hologram of a petite and perky ");
		if(rand(4) == 0) output("myr");
		else if(rand(3) == 0) output("human");
		else if(rand(2) == 0) output("ausar");
		else output("kaithrit");
		output(" girl waves to you, cutely showing off her little black dress. It hugs her curves beautifully. <i>“Come on in! We’ve got something for everybody, no matter your tastes!”</i>");
	}
	// Message 2
	else if(choice == 1)
	{
		output("\n\nA hologram of a mouthwateringly buxom ");
		if(rand(4) == 0) output("myr");
		else if(rand(3) == 0) output("human");
		else if(rand(2) == 0) output("ausar");
		else output("kaithrit");
		output(" woman winks at you, showing off a string-tie bikini. She stretches her body, and her cleavage threatens to spill out of her bra. <i>“Come on in, honey. Don’t be shy.”</i>");
	}
	// Message 3
	else if(choice == 2)
	{
		output("\n\nA muscular ");
		if(rand(4) == 0) output("myr");
		else if(rand(3) == 0) output("human");
		else if(rand(2) == 0) output("ausar");
		else output("kaithrit");
		output(" woman grins at you, showing off her ripped biceps. She’s wearing nothing but a furry bra and panties. <i>“Envious? A great body’s no good unless you’ve got the right clothes to flaunt it!”</i>");
	}
	// Message 4
	else if(choice == 3)
	{
		output("\n\nA hologram of a beautiful looking ");
		if(rand(4) == 0) output("myr");
		else if(rand(3) == 0) output("human");
		else if(rand(2) == 0) output("ausar");
		else output("kaithrit");
		output(" maid whistles at you. When you stare her way, she lifts her frilly skirt, and reveals her throbbing cock! <i>“Want to hide your bits? Come inside, we’ve got clothes for every shape and size!”</i>");
	}
	// Message 5
	else if(choice == 4)
	{
		output("\n\nA hologram of a suave looking ");
		if(rand(4) == 0) output("myr");
		else if(rand(3) == 0) output("human");
		else if(rand(2) == 0) output("ausar");
		else output("kaithrit");
		output(" man smiles handsomely at you. He’s standing there, wearing nothing but a pair of silky black boxers and a sports singlet. <i>“Looking for some good kit? You’ve come to the right place...”</i>");
	}
	// Message 6
	else if(choice == 5)
	{
		output("\n\nA hologram of a beefy looking ");
		if(rand(4) == 0) output("myr");
		else if(rand(3) == 0) output("human");
		else if(rand(2) == 0) output("ausar");
		else output("kaithrit");
		output(" grunts at you. He’s wearing military pants and a singlet, looking stern and unimpressed. <i>“If you want clothes, go on in. We’ve got what you need.”</i>");
	}
	// Message 7
	else
	{
		output("\n\nA hologram of a handsome looking ");
		if(rand(4) == 0) output("myr");
		else if(rand(3) == 0) output("human");
		else if(rand(2) == 0) output("ausar");
		else output("kaithrit");
		output(" grins at you. He’s wearing a pair of star-shaped nipple tassels and a zip-pouch jock strap. <i>“A great body’s half the journey. The other half--? Accessorizing.”</i>");
	}
	return false;
}

public function xantheCock():String
{
	var desc:String = "";
	var rollN:Number = 0;
	//Desc - 33%
	if(rand(2) == 0) 
	{
		rollN = rand(5);
		if(rollN == 0) desc += "segmented ";
		else if(rollN <= 1) desc += "lumpy ";
		else if(rollN <= 2) desc += "muscle-ribbed ";
		else if(rollN <= 3) desc += "caterpillar-like ";
		else if(rollN <= 3) desc += "alien ";
	}
	//Nouns! 100%
	rollN = rand(10);
	if (rollN <= 0) desc += "siel-cock";
	else if (rollN <= 1) desc += "prick";
	else if (rollN <= 2) desc += "shaft";
	else if (rollN <= 3) desc += "member";
	else if (rollN <= 4) desc += "prick";
	else if (rollN <= 5) desc += "xeno-dick";
	else if (rollN <= 6) desc += "cock";
	else if (rollN <= 7) desc += "siel-dick";
	else if (rollN <= 8) desc += "tool";
	else desc += "phallus";
	return desc;
}
public function xantheCunt():String
{
	var desc:String = "";
	var rollN:Number = 0;
	//Desc - 33%
	if(rand(2) == 0) 
	{
		rollN = rand(6);
		if(rollN == 0) desc += "Y-lipped ";
		else if(rollN <= 1) desc += "tri-lipped ";
		else if(rollN <= 2) desc += "three-fold ";
		else if(rollN <= 3) desc += "silk-lined ";
		else if(rollN <= 4) desc += "alien ";
		else if(rollN <= 5) desc += "exotic ";
	}
	//Nouns! 100%
	rollN = rand(10);
	if (rollN <= 0) desc += "siel-cunt";
	else if (rollN <= 1) desc += "vagina";
	else if (rollN <= 2) desc += "xeno-pussy";
	else if (rollN <= 3) desc += "slit";
	else if (rollN <= 4) desc += "box";
	else if (rollN <= 5) desc += "cunt";
	else if (rollN <= 6) desc += "siel-vagina";
	else if (rollN <= 8) desc += "pussy";
	else desc += "twat";
	return desc;
}

public function showXanthe(nude:Boolean = false):void
{
	if(flags["MET_XANTHE"] == 1) showName("\nXANTHE");
	else showName("\nTAILOR");
	author("JimThermic");
	if(nude)
	{
		if(xantheHasFrontCock()) showBust("XANTHE_1_NUDE");
		else showBust("XANTHE_NUDE");
	}
	else showBust("XANTHE");
}
public function xantheHasFrontCock():Boolean
{
	if(flags["XANTHE_FRONT_GENITAL"] == 1) return true;
	return false;
}
public function xantheHasFrontCunt():Boolean
{
	if(flags["XANTHE_FRONT_GENITAL"] == 2) return true;
	return false;
}
public function xantheHasBackCock():Boolean
{
	if(flags["XANTHE_BACK_GENITAL"] == 1) return true;
	return false;
}
public function xantheHasBackCunt():Boolean
{
	if(flags["XANTHE_BACK_GENITAL"] == 2) return true;
	return false;
}
public function xantheIsHerm():Boolean
{
	return ((xantheHasFrontCock() || xantheHasBackCock()) && (xantheHasFrontCunt() || xantheHasBackCunt()));
}

public function xantheIsDommingPC():Boolean {
	return (flags["XANTHE_MATED"] != undefined);
}

//Buy
public function buySomethingFromXanthe():void
{
	xantheShopInitialization();
	buyItem();
}
//[Armor] [Clothes] [Uwear, Upper] [Uwear, Lower]

public function sellSomethingToXanthe():void
{
	xantheShopInitialization();
	sellItem();
}
public function xantheShopInitialization():void
{
	if(pc.level >= 7)
	{
		if(!chars["XANTHE"].hasItemByClass(DaedalusThreads)) chars["XANTHE"].inventory.push(new DaedalusThreads());
		if(!chars["XANTHE"].hasItemByClass(EmpusaThreads)) chars["XANTHE"].inventory.push(new EmpusaThreads());
		if(!chars["XANTHE"].hasItemByClass(NemeanThreads)) chars["XANTHE"].inventory.push(new NemeanThreads());
		if(!chars["XANTHE"].hasItemByClass(StrixThreads)) chars["XANTHE"].inventory.push(new StrixThreads());
	}
	else
	{
		chars["XANTHE"].destroyItemByClass(DaedalusThreads, -1);
		chars["XANTHE"].destroyItemByClass(EmpusaThreads, -1);
		chars["XANTHE"].destroyItemByClass(NemeanThreads, -1);
		chars["XANTHE"].destroyItemByClass(StrixThreads, -1);
	}
	shopkeep = chars["XANTHE"];
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	chars["XANTHE"].keeperBuy = "<i>“What kind of clothing were you interested in buying";
	if(xantheIsDommingPC()) chars["XANTHE"].keeperBuy += ", my pet";
	chars["XANTHE"].keeperBuy += "? I’ve got quite the selection.”</i>\n";
	chars["XANTHE"].keeperSell = "<i>“I don’t usually buy garments, but for you, I can make an exception.”</i>\n";
	chars["XANTHE"].keeperGreeting = "THIS SHOULD NEVER DISPRAY. GREAT DISHONOR UPON FAMIRY.";
}

/*
output("\n\nArmor");

output("\n\n<i>“Armor, huh? I’ve only got a few pieces here, but all of them are stellar pieces.”</i>");

output("\n\nBattle Ballgown: (+5 Def, +2 Attack, +2 Evade, 20% Slash/Kinetic/Piercing Resistance) - Base Price: 5000 creds.");
output("\n\nReinforced Bodysuit: (+5 Def, +5 Sexiness, +2 Evade, +10% resist Kinetic/Slash/Pierce) - Base Price: 4000 creds.");
output("\n\nRevealing Male Armor: (+1 Def, +3 Sexiness) - Base Price: 1000 creds.");
output("\n\nRevealing Female Armor: (+1 Def, +3 Sexiness) - Base Price: 1000 creds.");
output("\n\nTransparent Zipsuit: (+5 Def, +10 Sexiness, 10% resist all but lust, -20% Lust resist). 5000 creds.");

output("\n\nClothes");

output("\n\n<i>“Looking for a nice outfit? We’ve got a </i>lot<i> in stock. Feel free to try on any sexy little number that catches your eye.”</i>");

// Costs are w'e you want.

Sleep Shirt (0 Def, +2 Sexiness) - 800 Creds
Top and Skirt (0 Def, +2 Sexiness) - 800 Creds
Business Clothes (0 Def, +2 Sexiness) - 800 Creds
Latex Bodysuit (2 Def, +2 Sexiness) -1000 Creds
China Dress (2 Def, +2 Sexiness) - 1000 Creds
Female Kimono (0 Def, +5 Sexiness, +2 Evade) - 1500 Creds
Male Kimono (+2 Attk, +2 Def) 1500 Creds
Yukata (0 Def, +5 Sexiness) - 1000 Creds
Short Kimono (0 Def, +2 Attk, +5 Sexiness, +2 Evade) - 2000 Creds
Ninja Outfit (0 Def, +2 Attk, +5 Sexiness, +2 Evade) - 2000 Creds
Maid Outfit (0 Def, +5 Sexiness) - 1000 Creds
Butler Outfit (0 Def, +5 Sexiness) - 1000 Creds
Nurse Outfit (0 Def, +5 Sexiness) - 1000 Creds
Male Doctor's Outfit (0 Def, +5 Sexiness) - 1000 Creds
Female Doctor's Outfit (0 Def, +5 Sexiness) - 1000 Creds
Apron (0 Def, +5 Sexiness) - 1000 Creds
Seifuku (0 Def, +5 Sexiness) - 1000 Creds
Gakuran (0 Def, +5 Sexiness) - 1000 Creds
Schoolgirl Outfit (0 Def, +5 Sexiness) - 1000 Creds
Schoolboy Outfit (0 Def, +5 Sexiness) - 1000 Creds
Cheerleader Outfit (0 Def, +5 Sexiness) - 1000 Creds
Waitress Uniform (0 Def, +5 Sexiness) - 1000 Creds
Bunny Outfit (0 Def, +5 Sexiness) - 1000 Creds
Military Outfit (+2 Def, +2 Sexiness) - 1000 Creds
Space Pirate Outfit (+2 Def, +2 Sexiness) - 1000 Creds
Goth-Lolita Outfit (0 Def, +5 Sexiness) - 1000 Creds
Tank-Top and Mini Skirt (0 Def, +2 Attk, +5 Sexiness) - 1500 Creds
Leather Strap Harness (0 Def, +5 Sexiness) - 1000 Creds
Little Black Dress (0 Def, +5 Sexiness) - 1000 Creds.


Uwear, Upper

<i>“Covering up {that/those} [pc.chest] of yours seems like a crime, but there's something to be said for a complimenting piece. Here's what I've got.”</i>

String-Tie Top (+1 Sexiness) - 700 Creds
Frilly Bra (+1 Sexiness) - 700 Creds
Girly Bra (+1 Sexiness) - 700 Creds
White Bra (+1 Sexiness) - 700 Creds
Striped Bra (+1 Sexiness) - 700 Creds
Furry Bra (+1 Sexiness) - 700 Creds
Black Lace Bra (+1 Sexiness) - 700 Creds
Sarashi (+1 Sexiness) - 700 Creds
Muscle Shirt (+1 Sexiness) - 700 Creds
Sports Singlet (+1 Sexiness) - 700 Creds
Mesh Shirt (+1 Sexiness) - 700 Creds
Patriotic Bra (+1 Sexiness) - 700 Creds
Skull Pattern Bra (+1 Sexiness) - 700 Creds

Uwear, Lower

<i>“Something to cover you up down there? I'd recommend trying it on and giving me a look.”</i>

String-Tie Bottoms (+1 Sexiness) - 700 Creds
Frilly Panties (+1 Sexiness) - 700 Creds
Girly Panties (+1 Sexiness) - 700 Creds
White Panties (+1 Sexiness) - 700 Creds
Striped Panties (+1 Sexiness) - 700 Creds
Lowrider Panties (+1 Sexiness) - 700 Creds
Furry Panties (+1 Sexiness) - 700 Creds
Patriotic Boxers (+1 Sexiness) - 700 Creds
Patriotic Panties (+1 Sexiness) - 700 Creds
Skull Pattern Boxers (+1 Sexiness) - 700 Creds
Skull Pattern Panties (+1 Sexiness) - 700 Creds
C-String (+2 Sexiness) - 1000 Creds
Black Lace Panties (+1 Sexiness) - 700 Creds
Black Silk Boxers (+1 Sexiness) - 700 Creds
Red Satin Boxers (+1 Sexiness) - 700 Creds
Male Thong (+1 Sexiness) - 700 Creds
Leather Boy Shorts (+1 Sexiness) - 700 Creds
Zip-Pouch Jock (+2 Sexiness) - 1000 Creds

Nipple Tassels

<i>“These are a specialty of mine, most of them are hand made. Others I bought because I liked the design. Feel free to try them on and give them a whirl.”</i>

Red heart shaped nipple tassels (+2 Sexiness) - 1000 Creds
Skull shaped nipple tassels (+2 Sexiness) - 1000 Creds
Golden nipple tassels (+2 Sexiness) - 1000 Creds
Four leaf clover nipple tassels (+2 Sexiness) - 1000 Creds
Flower shaped nipple tassels (+2 Sexiness) - 1000 Creds
Star shaped nipple tassels (+2 Sexiness) - 1000 Creds
Jeweled nipple tassels (+2 Sexiness) - 1000 Creds
Black nipple tassels (+2 Sexiness) - 1000 Creds
*/

public function enterTheSilkenSerenityWhyDidWashHaveToDie():Boolean
{
	clearOutput();
	showBust("XANTHE");
	author("JimThermic");
	//First Visit
	if(flags["MET_XANTHE"] == undefined)
	{
		//Initialize Xanthe's butt and fruntcunt
		flags["XANTHE_BACK_GENITAL"] = 2;
		flags["XANTHE_FRONT_GENITAL"] = 1;

		output("You pass through the polished marble pillars and enter the Silken Serenity. The second you enter, you are hit with a wave of cool, fresh air.");
		output("\n\nLooking about, you feel as if you’ve stepped into another realm entirely. Outside it looked like a boutique clothing store, trim and tidy. Inside, however, it is a labyrinth of clothing displays and mannequins.");
		output("\n\nWandering into the maze built entirely from fashion items, you soon lose sight of the entrance. Just when you think you’re going to need to find a map or a signpost, you hear a husky voice speak out from behind you.");
		output("\n\n<i>“Hello, my dear...”</i> The sudden utterance, along with its incredibly close proximity to your back, almost causes you to leap right out of your [pc.skinFurScalesNoun].");
		output("\n\nYou instinctively spin round. Your eyes are immediately met with a pair of electric blues staring straight back at you. They are shaped like exploding stars; pale azure exploding within the black rims of an iris. You take a step back, and they come into perspective.");
		output("\n\nThe eyes, and the voice, belong to a mysterious looking woman with dusky blue-gray skin. Her face is smooth, feminine, and replete with high cheekbones. There is a playful smile on her full, pouting lips. It’s clear that she quite enjoyed sneaking up on you.");
		output("\n\n<i>“Don’t worry. I don’t bite. Much,”</i> she teases. You soak in her appearance. Two antennae are sticking out of her head, and sweep back like insectoid rabbit ears. They’re protruding from a full head of wavy, midnight blue hair that tumbles down to her collarbones. There are slit like gills on either side of her neck.");
		output("\n\nLooking down, you notice her eye-poppingly large breasts are only <i>barely</i> contained by a black lace bra. Teasing you again, she crosses her arms underneath her plump udders. She pushes her arms upwards, and her assets threaten to spill deliciously out of their lacy confines...");
		//[Stare] [Don’t Stare] * Ditz always stares.
		clearMenu();
		if(pc.isBimbo()) addButton(0,"Next",stareAtXantheYaSloot);
		else
		{
			addButton(0,"Stare",stareAtXantheYaSloot);
			addButton(1,"Don’t Stare",dontStareAtZatBitch);
		}
	}
	//Storefront Room Description
	else
	{
		output("Far from easily navigable, the interior of the Silken Serenity is an extravagant and fashionable labyrinth. There are different tiers and isles of clothing everywhere, some even overlapping each other in a multi-tiered mess.");
		output("\n\nAlmost contrary to the chaos, each item has been meticulously constructed to be both fashionable and functional. There’s everything from light combat armor to frilly hand-sewn panties. All of it is chic.");
		if(pc.hasStatusEffect("XanthePanties"))
		{
			getXanthesPantiesSloot();
			return true;
		}
		//if (Xanthe is Domming PC)
		// This occurs through unlocking Mating through the ‘Sex’ discussion in the Talk Menu, clicking Mating, then saying ‘Yes’ to being her sub.
		if(xantheIsDommingPC())
		{
			// Paragraphs 1-4 are randomly displayed if PC is Xanthe’s sub.
			if(rand(4) == 0)
			{
				output("\n\nYour Mistress, Xanthe, is positioned behind the front counter. You move up to her and she wraps her arms around you. You affectionately snuggle into her.");
				output("\n\n<i>“Mmm, you’re back!”</i> she huskily exclaims. <i>“How goes your travels, my dear? I want to hear all about it.”</i>");
			}
			//Random Paragraph 2
			else if(rand(3) == 0)
			{
				output("\n\nYour Mistress, Xanthe, is sitting behind the front counter. You excitedly rush up and she gives you a long kiss to welcome you back.");
				output("\n\n<i>“Hello pet. I hope you’ve been keeping out of trouble...?”</i> she inquires. There is a slightly stern, maternal edge to her voice.");
			}
			//Random Paragraph 3
			else if(rand(2) == 0)
			{
				output("\n\nYou can’t see your Mistress anywhere, and you furrow your brow. You look behind the counter, only to feel a pair of arms wrap around you from behind and a pair of lips press preciously against the back of your neck.");
				output("\n\n<i>“...Hello, my pet. Were you looking for me, perhaps?”</i> You relax back into her arms, and she lavishes your nape with sweet little kisses.");
				output("\n\nYou melt into a [pc.name]-shaped puddle from her kisses. She then cheekily lets go and slips behind the counter, suddenly acting professional. <i>“So - what can I do for you today?”</i>");
			}
			//Random Paragraph 4
			else
			{
				output("\n\nYour Mistress, Xanthe, is positioned behind the front counter. You move up to her and she pets your head affectionately. You feel a fuzzy warmth flowing through you, and the glorious sense of being owned.");
				output("\n\n<i>“How are you doing, my pet? I was just wondering where you’d scurried off to.”</i>");
			}
		}
		// Else (Xanthe is not Domming PC)
		else
		{
			output("\n\nThe siel owner of the Silken Serenity, Xanthe, is positioned behind the front counter. She seems to be enjoying the sight of the " + pc.mf("handsome","beautiful") + " [pc.race] walking around her store.");
		}
		//[Appearance] [Talk] [Buy] [Sell] [Mating]
		//[Hallway]
		xantheMenu();
	}
	return true;
}

public function xantheMenu():void
{
	clearMenu();
	//Run shopkeeper setup
	xantheShopInitialization();
	//[Appearance] [Talk] [Buy] [Sell] [Mating]
	addButton(1,"Talk",xantheTalkUsloot);
	addButton(2,"Buy",buySomethingFromXanthe);
	addButton(3,"Sell",sellSomethingToXanthe);
	if(flags["XANTHE_TALKED_ABOUT_SEX"] != undefined) addButton(4,"Mating",letsDoAlienBondageMating);
	else addDisabledButton(4,"Mating","Mating","You don’t know her nearly well enough for that.");
	//[Hallway]
	addButton(5,"Hallway",tryToGoToHallway);
	addButton(14,"Leave",move,rooms[currentLocation].northExit)
}

// Stare
public function stareAtXantheYaSloot():void 
{
	clearOutput();
	showXanthe();
	output("You shamelessly stare as her deliciously dark blue areolae slip into view. You are thoroughly teased with the sight, until she relaxes her arms and they slip away from you. Drat!");
	stareDontStareEpilogue();
}

// Don’t Stare
public function dontStareAtZatBitch():void
{
	clearOutput();
	showXanthe();
	output("You avert your eyes, turning them downward. It’s hard to get them out of your sight, simply because they’re so damn big!");
	stareDontStareEpilogue();
}

public function stareDontStareEpilogue():void
{
	output("\n\nFrom her voluminous breasts downwards and running down her sides are a bunch of dark, spikey appendages. Each one is jointed and pressed flush to her skin. They resemble tiny armor chunks. She has six fingered hands concealed by dark elbow length gloves.");
	output("\n\nThings become progressively more alien further down. Her thighs and legs are thick, bulky, and completely lack feet. Instead, they end in double-pronged toes. Despite her unconventional build, she still wears a garter belt, sexy lace panties, and a pair of stockings.");
	output("\n\n<i>“My my, am I really that interesting? I feel quite flattered. I’ll let you look a little longer, I suppose.”</i> The half-nude alien woman offers in her rich, husky voice. <i>“...Though I am being rather rude. How can you get a good look when you can’t see all there is to me?”</i>");

	// First time meeting a Siel.
	if(!CodexManager.entryUnlocked("Siel"))
	{
		output("\n\nAll of her...? You suddenly realize there’s more of her body hidden behind the clothes rack, and peer warily past her curvaceous hips. As promised, the Siel pulls it out... and out... and out. Void, how much of her IS there?");
		output("\n\nWhen you finally get a good look at her, you realize she has six more sets of legs - eight in total - all clad in lacy black stockings. They’re attached to a long bulbous body that resembles that of a giant blue caterpillar. She wears a second set of underwear on her hindquarters. A segmented tail with a slit on the end is jutting out from her rump.");
		output("\n\nNoticing your puzzlement, realization dawns on the alien woman. <i>“Oh! It’s your first time meeting a siel. And here I was thinking you were just that interested... what a shame.</i>”");
		output("\n\nThe siel woman then moves past you, making sure to brush against your side. There, right near your ear, she stops for a brief moment and leans in to whisper. <i>“...If you </i>are<i>, though, I’ll just have to do something about that. I really do excel at ‘customer service’.”</i>");
		CodexManager.unlockEntry("Siel");
		output("\n\n<b>(‘Siel’ Codex entry unlocked!)</b>");
	}
	// else (met Siel before
	else
	{
		output("\n\nAll of her...? You suddenly realize there’s more of her body hidden behind the clothes rack, and peer warily past her curvaceous hips. As promised, she pulls it out... and out... and out.... She’s a siel!");
		output("\n\nThe blue-skinned woman notices the glimmer of recognition in your eyes, and quirks an eyebrow. <i>“Oh? Seems you’ve met my kind before. I hope it was a pleasant encounter.”</i>");
		output("\n\nThe siel then moves past you, making sure to brush against your side. There, right near your ear, she stops for a brief moment and leans in to whisper. <i>“If it wasn’t, I’ll have to make things right, you know. By ");
		if(!pc.isNude()) output("stripping off " + (pc.hasArmor() ? "that outfit" : "those undies") + " of yours");
		else output("taking advantage of your nudity");
		output(" and having my way with you.”</i>");
	}
	output("\n\nAs if she hadn’t uttered a single word, the siel slips behind the nearby counter, leaving the smell of fresh rain in her wake. Turning to you, she sweeps back a lock of her hair and flashes you a brilliant smile.");
	output("\n\n<i>“Welcome to the Silken Serenity! My name is Xanthe. Please, check our wares. I’m sure you’ll find something to my tastes.”</i> She coughs, and corrects herself. <i>“...I mean, </i>your<i> tastes.”</i>");
	processTime(3);
	flags["MET_XANTHE"] = 1;
	xantheMenu();
}

// If PC tries to go in hallway without being her sub.
public function tryToGoToHallway():void
{
	clearOutput();
	processTime(1);
	if(!xantheIsDommingPC()) //Xanthe intersects you as you attempt to enter the door behind the counter. Clearly that area is off limits.
	{
		showXanthe();
		output("<i>“...While I admire curiosity, that’s my home back there. I’d rather not have you walking about and looking through my things.”</i>");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Hallway Room Description
	else
	{
		showName("\nHALLWAY");
		author("JimThermic");
		output("This elegantly decorated hallway is part of a living space and not part of the store. There are several doors, some of which are locked, leading to rooms and storage spaces.");
		output("\n\nOne door stands out in particular, as it is bolted shut from this side.");
		//[Bolted Door] [Out]
		clearMenu();
		addButton(0,"Bolted Door",undergroundDungeoooon);
		addButton(14,"Back",enterTheSilkenSerenityWhyDidWashHaveToDie);
	}
}

//Underground Dungeon
public function undergroundDungeoooon():void
{
	clearOutput();
	//showXanthe();
	showName("XANTHE’S\nSEX DUNGEON");
	author("JimThermic");
	output("Located below the Silken Serenity, this expansive dungeon is full of almost every kind of bondage furniture imaginable. There are wooden horses, bondage wheels, an X-cross, and countless fixtures for restraint. It’s a veritable bondage paradise.");
	output("\n\nThere is a bondage bed as well as a more traditional bed in the room. Along the wall there are various tools hanging up, including at least a dozen different kinds of whips, floggers, and paddles. There is a wardrobe full of different attire for sceneing.");
	output("\n\nThe door is reinforced and can be bolted shut from the other side.");
	processTime(1);
	clearMenu();
	addButton(14,"Back",tryToGoToHallway);
}

//Xanthe
//Talk
public function xantheTalkUsloot():void
{
	clearOutput();
	showXanthe();
	//First Time
	if(flags["XANTHE_TALK_HAPPENED"] == undefined)
	{
		flags["XANTHE_TALK_HAPPENED"] = 1;
		output("Xanthe seems to be peering at you rather intently, as if she’s trying to figure something out. Those electric blues of hers are even more intense than usual.");
		output("\n\n<i>“...Now where have I seen you before...?”</i> she muses aloud. Suddenly, realization sets in, and her eyebrows shoot up. <i>“Oh, by Zyi! You’re [pc.fullName], aren’t you...?”</i>");
		//normal:
		if(!pc.isBimbo()) output("\n\nYou swiftly look over your shoulder, to make sure nobody heard that. You then ask her <i>how</i> she knows who you are.");
		//ditz:
		else output("\n\nYou blink and wonder how she knows who you are. Peering closer, you don’t <i>think</i> you’ve screwed her before. But your memory is kind of fuzzy, and you sleep around a lot - it’s hard to keep track, right? You don’t like not knowing, so you just ask.");
		output("\n\n<i>“Oh honey, it’s like you’ve never heard of the holonet. " + pc.mf("Son","Daughter") + " of a legendary mining tycoon forced to run across the galaxy looking for " + pc.mf("his","her") + " dad’s fortune in a galactic rat race? How is that </i>not<i> news?”</i>");
		output("\n\n<i>“Or at least, it was news ");
		if(days < 25) output("a whole week");
		else if(days < 50) output("a month or so");
		else if(days < 300) output("a few months");
		else if(days < 600) output("a whole year");
		else output("a few years");
		output(" ago. You know how people are, it’s old if it happened yesterday.”</i> Xanthe runs a finger through her wavy locks, twirling it around. <i>“I remember thinking you needed new clothes.”</i>");
		output("\n\n<i>“And here you are. Kind of like fate, hmm? I’m sure I’ve got </i>something<i> here that says ‘I’m a " + pc.mf("dashing","beautiful") + " young millionaire play" + pc.mf("boy","girl") + " and galactic adventure" + pc.mf("rer","ress") + " - kicking ass and getting laid on the side.”</i>");
		if(!pc.isBimbo()) output("\n\nDamn media. Guess something juicy like that was only going to be a secret for a whole day before it got out. You wonder how many people saw that particular story...?");
		//ditz:
		else output("\n\nOh bother, you think, and then you perk up. If you become famous, people will come flocking to you, and they might be pretty! The idea of sleeping with lots of reporters makes you happy, so you don’t let it get you down. After all, the more the merrier, right?");
		processTime(4);
		xantheTalkMenu();
	}
	// Any other time
	else
	{
		output("As soon as you approach Xanthe to talk, there is a delighted little glint in her brilliant blue eyes.");
		output("\n\n<i>“Hello, " + pc.mf("Mister","Miss") + " Steele. Anything I can help you with today?”</i> she asks.");
		//[Siel] [Xanthe] [The Silken Serenity] [Zyi]
		//[The War] [Her Sex] [Use Mods] [Mating]
		// * Locked until ‘Xanthe’ topic is viewed
		// ** Locked until ‘Her Sex’ topic is viewed.
		xantheTalkMenu();
	}
}

public function xantheTalkMenu():void
{
	clearMenu();
	addButton(0,"Siel",talkAbootSiel);
	addButton(1,"Xanthe",xantheTalksAbootXanthe);
	addButton(2,"SilkenSerenity",askXantheWhyFoxCancelledFirefly);
	if(flags["XANTHE_TALKED_ABOUT_HERSELF"] != undefined) addButton(3,"Zyi",talkToXantheAboutSpaceJesus);
	else addDisabledButton(3,"Zyi","Zyi","You don’t know her well enough to ask about this.");
	//INESSA EXPANSION
	if(flags["MET_INESSA"] == undefined) addDisabledButton(4,"Locked");
	else if(flags["INESSA_BELTED"] == 1 && flags["INESSA_FAMILYED"] == 1 && flags["INESSA_EXP"] == undefined) addButton(4,"Inessa",xanTalkAboutInessa,undefined,"Inessa","Talk to Xanthe about her sister.");
	else if(flags["INESSA_EXP"] >= 1) addDisabledButton(4,"Inessa","Inessa","You’ve already talked about Inessa.");
	else addDisabledButton(4,"Inessa","Inessa","You need to talk to Inessa first.");
	addButton(5,"The War",theWarTalkXanthe);
	// Lock wieners until the Codex entry is read.
	if(CodexManager.entryViewed("Siel")) addButton(6,"Her Sex",askXantheAboutHerDonger);
	else addDisabledButton(6,"Her Sex","Her Sex","You should probably read about the Siel’s sex from the Codex first.");
	// ** Locked until ‘Her Sex’ topic is viewed.
	if(flags["XANTHE_TALKED_ABOUT_HER_SEX"] != undefined) addButton(7,"Use Mods",useModsYouSlut);
	else addDisabledButton(7,"Use Mods","Use Mods","You don’t know her well enough to ask about this.");
	addButton(8,"Mating",sexChatWithXanthe);
	// * Locked until ‘Xanthe’ topic is viewed
	// ** Locked until ‘Her Sex’ topic is viewed.
	//INESSA EXPANSION
	if(flags["MET_INESSA"] == undefined) addDisabledButton(9,"Locked");
	else if(flags["XANTHE_INESSA"] == 1 && flags["INESSA_EXP"] == undefined && flags["INESSA_BEING_DOMMED"] != undefined) addButton(9,"Key",xanTalkAboutKey,undefined,"Key","Talk to Xanthe about Inessa’s belt key.");
	else if(flags["INESSA_EXP"] >= 1) addDisabledButton(9,"Key","Key","You need to give Inessa the message from her sister.");
	else if(flags["INESSA_BEING_DOMMED"] == undefined) addDisabledButton(9,"Key","Key","You have to be domming Inessa for this.");
	else addDisabledButton(9,"Key","Key","You don’t know about the key yet.");
	addButton(14,"Back",enterTheSilkenSerenityWhyDidWashHaveToDie);
}

//Siel
public function talkAbootSiel():void
{
	clearOutput();
	showXanthe();
	//Normal:
	if(!pc.isBimbo()) 
	{
		output("You ask ");
		if(xantheIsDommingPC()) output("your Domme");
		else output("Xanthe");
		output(" about her race, the siel. You have a Codex entry, but you’d like to hear her what she has to say about them.");
	}
	//Ditz:
	else
	{
		output("<i>“So hey, you’re an alien, right? I like aliens. They’re always so much fun to sleep with!”</i> You giggle, then poke her chest. <i>“...Come oooonnn, tell me about your race!”</i>");
	}
	output("\n\nXanthe gives a sensuous little laugh at your declaration of interest. <i>“...I suppose I have a free moment to chat with you. And I do so like rewarding curiosity. Please, have a seat.”</i>");
	output("\n\nThe midnight haired mistress of the Silken Serenity gestures to a nearby ");
	if(!pc.isTaur() && !pc.isNaga()) output("seat");
	else output("spot");
	output(", ushering you to sit down. You do so, since it seems she’s gearing you up for quite the lengthy chat. It seems she’s concerned that your [pc.legOrLegs] might buckle from standing up.");
	output("\n\nOnce you are properly seated, she sits back herself. It looks more like lying down and resting back against her own caterpillar-like body. Apparently, that’s how siel seat themselves.");
	output("\n\n<i>“...My race, the siel, come from a world called Xhixia, located in the Liliaran Nebulae. It’s our birth world and the capital planet of our Empire. It’s also my home planet, which means I’m rather fond of it,”</i> Xanthe explains.");
	output("\n\n<i>“From space, it kind of looks like a red prickly ball with purple seas. There are colorful patches - that’s where the cities are - but the rest are covered in jagged stone spikes that break the cloud layer.”</i>");

	//Normal:
	if(!pc.isBimbo()) output("\n\nYou ask her how they live when the terrain sounds so inhospitable.");
	else output("\n\n<i>“Oh wow, that sounds harsh! How do your people get any screwing done when everywhere’s all rocky and spikey?”</i> you ask. It sounds like no fun at all!");
	output("\n\n<i>“Oh, that’s easy. All our cities and towns are high above the ground. They’re woven out of siel silk; lots and lots of it until it becomes ‘solid’ like mineral rock.”</i>");
	output("\n\nSiel silk? You ask her about that, and she turns her caterpillar-like tail to face forward. From her tail tip, she shoots a thin strand of a white substance and catches it in her hand.");
	output("\n\nIn mere seconds she’s woven it between her fingers to form a set of pretty star formations. <i>“This is siel silk. All siel naturally produce it from their silk spinners located in our... well, our rumps. We can produce lots of it; pretty much as thick, sticky, or malleable as we want.”</i>");
	output("\n\n<i>“Actually, almost all the clothes in the store are made from my silk. There’s artificial coloring of course, and some have a few baubles. Otherwise, most pieces are 100 per cent made from me.”</i>");

	//Norm:
	if(!pc.isBimbo()) output("\n\nYou look around. It’s definitely different to hear someone claim they’ve made almost an entire shop’s worth of stock from their own body. Xanthe makes it sound like it’s the most natural thing in the world.");
	else 
	{
		output("\n\n<i>“Oh wow, so like, all this stuff is made from your butt or whatever? That’s so cool!”</i> you genuinely exclaim. You wish you could make stuff out of your ass. Not that your butt doesn’t make people happy in other ways. You look back at it and let out a giggle.");
		output("\n\n<i>“So does that mean all your cities are kind of, y’know, bouncy? Like boobs?”</i> You imagine it’s kind of like a trampoline, and trampolines are fun. They make boobs bounce even more.");
	}
	output("\n\n<i>“The silk that makes up our cities is different. This stuff is thin, whereas that silk is packed tightly together and interwoven until it’s hard as rock. It’s actually rather beautiful.</i>");
	output("\n\n<i>“I’ve yet to see any non-siel city that is as colorful as those on Xhixia. Gildenmere is lovely, but nowhere near as aesthetically pleasing.”</i>");
	processTime(6);
	//[Sounds Beautiful] [Sounds Flammable] [Sounds Boring] [Can You Build?] [Say Nothing]
	clearMenu();
	addButton(0,"Beautiful",soundsBeautifulXanthe);
	if(!pc.isBro() && !pc.isBimbo()) addButton(1,"Flammable",soundsFlammabale);
	else addDisabledButton(1,"Locked");
	if(xantheIsDommingPC()) addButton(2,"Boring",soundsBoringAsFuckXanthe);
	else addDisabledButton(2,"Locked");
	addButton(3,"DoYouBuild?",canYouBuildXantheSluts);
	addButton(4,"Say Nothing",remainSilentForThisXantheSloot);
}

// Sounds Beautiful
public function soundsBeautifulXanthe():void
{
	clearOutput();
	showXanthe();
	output("<i>“It does sound ");
	if(!pc.isBimbo()) output("very beautiful,");
	else output("pretty!");
	output("”</i> you remark. Maybe you’ll visit it someday when this is all over.");
	output("\n\nXanthe smiles at your words. There’s a distinctive little glitter in her eyes, as if warmed by your kind words. <i>“It is. You wouldn’t think it was all weave, actually, except for all the colors!</i>");
	output("\n\nShe then picks up a brilliantly colored garment, showing it to you. <i>“You can get a lot of fine detail in siel silk; literally thousands of different colored threads in a single meter. Our cities are made like that for hundreds of miles, they’re true works of art.”</i>");
	output("\n\nYou observe that Xanthe sounds quite proud of them, as if she’d been involved herself. She shakes her head and gives a light smile.");
	output("\n\n<i>“No, I just feel their pride as a fellow artisan. A siel who specializes in silk weaving - be it building, architecture, or clothes - is truly expressed through their work. It’s literally woven from our silk sacs, and therefore from our bodies.”</i>");
	output("\n\n<i>“In a sense, our work </i>is<i> part of us, and through it we gain immortality. Our cities are precious things, built from the silk of those who came before.”</i>");
	processTime(4);
	clearMenu();
	addButton(0,"Next",sielCityTalkEpilogue);
}

// Sounds Flammable*
// Cannot pick if Ditz.
public function soundsFlammabale():void
{
	clearOutput();
	showXanthe();
	output("<i>“Sounds kind of... flammable.”</i> You remark. Wouldn’t someone just drop a match and the whole thing go up?");
	output("\n\nXanthe shakes her head and lets out a chastising noise. <i>“Of course not! Even though it can naturally burn, it’s very slow to do so, and often a fire puts itself out. We douse our silk in different fire retardants to preserve it and stop that from happening. A siel city is no more flammable than any other.”</i>");
	output("\n\n<i>“Besides, destruction of property is a </i>terrible<i> crime on Xhixia. It doesn’t even occur to all but the sickest of siel. We’re much stricter on it than most species are.”</i>");
	output("\n\nYou ask exactly why that is. After all, isn’t it <i>easier</i> for siel to repair property? They’ve got silk sacs that naturally produce repair materials.");
	output("\n\n<i>“It’s not about having the materials to replace it. A siel who specializes in silk weaving - be it building, architecture, or clothes - is truly expressed through their work. It’s literally woven from our silk sacs, and therefore from our bodies.”</i> Xanthe explains, grabbing a finely woven piece of cloth and showing it to you.");
	output("\n\n<i>“In a sense, our work </i>is<i> part of us, and through it we gain immortality. Our cities are precious things, built from the silk of those who came before.”</i>");
	processTime(6);
	clearMenu();
	addButton(0,"Next",sielCityTalkEpilogue);
}

// Sounds Boring*
// Cannot choose if PC is Xanthe’s sub.
public function soundsBoringAsFuckXanthe():void
{
	clearOutput();
	showXanthe();
	output("<i>“Sounds ");
	if(!pc.isBimbo()) output("boring");
	else output("booooorrrinnnggg");
	output(",”</i> you bluntly remark. That kind of place is definitely not your style.");

	output("\n\nXanthe huffs and looks at you with narrowed eyes. <i>“It’s not! Didn’t your father hire someone to teach you manners? Or were you born above little things like that? How rude!”</i>");
	output("\n\n<i>“I’ll have you know that because you can weave a lot of detail into silk - thousands of different threads per meter - our cities are literally works of art. Even </i>you<i> couldn’t scoff at them if you actually visited a siel world!”</i>");
	output("\n\nWow, she’s defensive! You ask if Xanthe was involved in building something in Xhixia because she’s getting rather heated over your comment.");
	output("\n\n<i>“No, I just feel their pride as a fellow artisan. A siel who specializes in silk weaving - be it building, architecture, or clothes - is truly expressed through their work. It’s literally woven from our silk sacs, and therefore from our bodies.”</i>");
	output("\n\n<i>“In a sense, our work </i>is<i> part of us, and through it we gain immortality. Our cities are precious things, built from the silk of those who came before.”</i>");
	processTime(4);
	clearMenu();
	addButton(0,"Next",sielCityTalkEpilogue);
}

// Can You Build?
public function canYouBuildXantheSluts():void
{
	clearOutput();
	showXanthe();
	output("<i>“Can you build a building like that? After all, you’ve got a silk sac, right?”</i> You ask her. From what you can tell, the Silken Serenity seems of a similar make to other Gildenmere buildings.");
	output("\n\nXanthe laughs and shakes her head. She seems quite amused by your comment. <i>“No, no. I mean, I’m a trained silk weaver, but I specialize in garments and not construction! I wouldn’t know the first thing about making a building. The designs, the silk you use, what connects to what... I wouldn’t have a clue where to start!”</i>");
	output("\n\n<i>“There are </i>some<i> similarities, though. There’s always a lot of detail in any siel silk weaving - you can literally get thousands of different colored threads in a single meter. Our cities are made like that for hundreds of miles, they’re true works of art.”</i>");
	output("\n\n<i>“All weavers - whether it’s building, architecture, or clothes - are truly expressed through their work. It’s literally woven from our silk sacs, and therefore from our bodies. In a sense, our work </i>is<i> part of us, and through it we gain immortality. Our cities are precious things, built from the silk of those who came before.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",sielCityTalkEpilogue);
}

// Remain Silent
public function remainSilentForThisXantheSloot():void
{
	clearOutput();
	showXanthe();
	output("You remain silent, listening to her talk rather than making a comment.");
	output("\n\nXanthe doesn’t seem to mind, though, and just keeps talking about Xhixia. <i>“You can get a lot of fine detail in siel silk; literally thousands of different colored threads in a single meter. Our cities are made like that for hundreds of miles, they’re true works of art.”</i>");
	output("\n\n<i>“I feel a lot of pride those cities as an artisan. A siel who specializes in silk weaving - be it building, architecture, or clothes - is truly expressed through their work. It’s literally woven from our silk sacs, and therefore from our bodies.”</i>");
	output("\n\n<i>“In a sense, our work </i>is<i> part of us, and through it we gain immortality. Our cities are precious things, built from the silk of those who came before.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",sielCityTalkEpilogue);
}

// MERGE
public function sielCityTalkEpilogue():void
{
	clearOutput();
	showXanthe();
	output("You remark that it must be hard to destroy an old building to make way for a new one, then.");
	output("\n\n<i>“It’s not really done on Xhixia or any siel world, not unless it’s an exceptional circumstance. We’d rather leave an empty building than destroy someone’s work. That is, unless they’re alive to give permission. In some rare cases the family can approve it, but it’s very rarely done and most aren’t thoughtless enough to ask.”</i>");
	if(!pc.isBimbo()) output("\n\nLooking around, you now realize just how much pride Xanthe must take in her clothing. Each one is woven from her own body, and therefore more than just an expression of herself. No wonder she puts so much detail into them.");
	else output("\n\nLooking around, you realize she really takes pride in this stuff! You like the lingerie and tight stuff too. It looks fun to wear! Maybe you can model some for her, and she’ll play with you...?");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Xanthe
// Unlocks ‘Zyi’ topic.
public function xantheTalksAbootXanthe():void
{
	if(!pc.isBimbo()) 
	{
		output("\n\nYou ask Xanthe about herself. You’re interested to hear a bit more about ");
		if(xantheIsDommingPC()) output("your Mistress");
		else output("the mysterious siel woman");
		output(".");
	}
	//Ditz:
	else 
	{
		output("\n\nYou want to know about Xanthe, because she’s pretty and interesting. You don’t need any other reason to ask, right?");
		output("\n\n<i>“Tell me about yourself! I’m really interested,”</i> you look at her with big wide eyes. <i>“Pleaaassseee?”</i>");
	}
	output("\n\nThe husky voiced alien sounds quite flattered at your interest, going so far as to place her gloved fingers on her chest in mock astonishment.");
	output("\n\n<i>“You want to know about little old me? I’m not sure there’s anything to tell. I’m a regular wallflower, really. Nothing special at all.”</i>");
	if(!pc.isBimbo()) output("\n\nYou cough and look at her six fingers pressing against her voluminous blue breasts. Her frilly lingerie and boldly exposed bosom don’t really scream modesty.");
	else output("\n\n<i>“What? You’ve got those wonderful boobs sticking out. You’re not, like, a boring modest person!”</i> You exclaim. Those kind of people are the worst!");
	output("\n\n<i>“Oh, but for a siel, this </i>is<i> modest! From my people’s point of view, wearing too much clothing is considered inappropriate. It’s most of the other species who have things backwards. The gold myr have the right idea, though. They know how to dress respectfully.”</i>");
	//Normal (not ditz)
	if(!pc.isBimbo()) output("\n\nYou realize things have gotten a little off topic, and you say as much. She coughs and nods, fully agreeing with you.");
	output("\n\n<i>“Ah yes, enough about gratuitous concealment! Where to start, really? My full name is Xanthe O’Anyalicia, and I was born in the planet capital of Rhian.”</i>");
	output("\n\n<i>“I’m the sixteenth daughter of a family of twenty four. I’ve got a <i>lot</i> of sisters. My mother is a Xhixian senior senate advisor, and my father is a senate clerk. Needless to say, that’s how they first met.”</i>");
	output("\n\nXanthe seems to take a moment to think about what to add, pressing a fingetip against her chin. <i>“...I’m 82 years old - still pretty young for a siel. Never had a clutch of my own. Graduated from Rhian University with one Masters degree in cloth weaving and another in being a Mistress.”</i>");
	output("\n\nA Mistress? You ask if she means like ‘being the other woman’ in a marriage, or something else?");
	output("\n\nThat question seems to leave the seamstress in stitches, laughing so hard she grabs her side. <i>“No, no, not THAT kind of Mistress! The kind that ties you up and calls you names. I know, I know, my folks are traditional. I really </i>am<i> a model siel girl.”</i> ");
	output("\n\nShe lets out a sigh and twists a lock of hair around a finger. <i>“No rebellious youth of wearing baggy overalls and un-bound sex for me. Guess I missed that particular teen phase, so to speak. I’m even a Zyist, which makes me even </i>more<i> of a straight arrow.”</i>");
	output("\n\n<i>“I don’t regret being perfectly average, though. I’ve always wanted to sew things, tie people up in my silk, make people lick my toes and call me ‘Mistress’. I left Xhixia to stand out a bit more, hence me being here on Myrellion.”</i>");
	output("\n\n<i>“Of course it’s totally my style to pick somewhere where people dress traditionally, not somewhere completely outrageous. Even when I try to rebel and switch things up, I’m still completely tame.”</i>");
	output("\n\n<i>“I mean, I’ve still yet to try sex where I don’t tie someone up and ream them from behind, or something </i>really<i> kinky like missionary style.”</i> She gives a thrilled little shiver. <i>“The good girl in me totally gets off on the idea of being THAT bad, even though I love doing it old school.”</i>");
	output("\n\nXanthe gives a light little shrug, <i>“...I’d say I’m pretty easy going, a bit playful, and I LOVE teasing people. Other than that, I’m just your everyday panty making Domme.”</i>");
	// Unlocks ‘Zyi’ Topic
	processTime(7);
	flags["XANTHE_TALKED_ABOUT_HERSELF"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//The Silken Serenity
public function askXantheWhyFoxCancelledFirefly():void
{
	clearOutput();
	showXanthe();
	if(!pc.isBimbo()) 
	{
		output("You ask ");
		if(xantheIsDommingPC()) output("your Mistress");
		else output("Xanthe");
		output(" about her store The Silken Serenity, and if she’s the owner. After all, she’s clearly an off-worlder.");
	}
	else output("<i>“Are you the store owner? I like all the skimpy things here,”</i> you giggle. The nipple tassels look especially nice!");
	output("\n\nThe lingerie-clad siel woman seems very proud of it, and gives a distinct nod. <i>“Yes, I’m the owner, and everything in here - bar one or two items - is my hand-crafted work. It took me some time to set up, but now it’s probably the most renowned garment store in Gildenmere!”</i>");
	if(!pc.isBimbo()) output("\n\nThat’s a pretty bold claim, though it does have a prime position and a nice look. That said, it’s almost like a labyrinth inside and you haven’t seen swarms of customers.");
	else output("\n\n<i>“Wha... REALLY? That’s amazing.”</i> You stare at her in complete shock. There must be a lot of people like you who like her skimpy stuff!");
	output("\n\n<i>“Ahem, you shouldn’t judge things by appearances. My store is really upscale - not just anyone buys clothes here, you know!”</i> Xanthe huffs and crosses her glove clad arms.");

	output("\n\n<i>“I’ll have you know I’ve woven several sets of undergarments for a few myr queens. My reputation is quite impeccable.”</i>");

	output("\n\n<i>“...Right now, the rulers of Gildenmere - some say Goddesses - are creaming themselves in panties literally woven from my body. Pretty neat, hmm?”</i>");

	if(!pc.isBimbo()) output("\n\nThat’s another bold claim! Sure, there’s no price tags on anything, but everything you’ve asked about has been very affordable. Surely her clothes can’t be <i>that</i> exclusive.");
	else output("\n\nThe thought of a bunch of myr queens creaming themselves in their panties gets you hot and bothered, and you let out a little moan. A second later, you realize something doesn’t add up. <i>“...But, like, your clothes don’t seem that expensive to me. I mean, I can afford them.”</i>");
	output("\n\nWith a conspiratorial gleam in her electric blue colored eyes, Xanthe grins at you. <i>“Oh, but my dear, they ARE expensive. I always give a special ninety per cent discount to the especially cute ones...”</i>");
	output("\n\nShe’s definitely not joking. It seems you’ve been getting a hefty discount on everything in the store on account of how " + pc.mfn("handsome","beautiful","cute") + " she finds you. She must really find you attractive!");

	if(!pc.isBimbo()) output("\n\nYou ask her how she can afford to give stuff away on a whim like that.");
	else output("\n\nThat makes you all happy inside, and you flush. You feel all special! <i>“Oh, thanks! I like looking hot, and looking at hot people. You can look at me all you like, if it makes you happy...”</i>");

	output("\n\nXanthe raises an eyebrow and gestures lightly to the store. <i>“...That’s what I set up the store for, my dear. It’s not a place where you come to buy my clothes. It’s a place where you come to parade around in outfits I’d like to see you in. Getting money from you is just an added perk.”</i>");

	output("\n\n... So in short, the Silken Serenity is her personal perving paradise. You ask her if that means there’s cameras in the changing rooms?");

	output("\n\n<i>“Oh of course not, I’m not like </i>that<i>. I just like seeing pretty people in pretty clothes all day. If I wanted to see you naked, I wouldn’t need to do it on the sly - I’d just upright tell you to strip.”</i> Xanthe confidently states, all the while looking at you through her lashes. <i>“...So, fancy buying anything? I know some things that would look GREAT on you.”</i>");
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Zyi
// Must have viewed ‘Xanthe’ topic.
public function talkToXantheAboutSpaceJesus():void
{
	clearOutput();
	showXanthe();
	output("You ask ");
	if(xantheIsDommingPC()) output("your Mistress");
	else output("Xanthe");
	output(" what a Zyist is, since you heard her mention that earlier. She waves a hand airily in the air, as if the subject is of no great importance.");

	output("\n\n<i>“Just someone who believes in Zyi, and Zyi’s just the creator of the universe. It’s nothing overly important.”</i>Her sultry tone is dead serious, yet the statement hardly makes any sense. Does that mean she’s religious...?");

	output("\n\nYou ask her if Zyi is some sort of god, and Xanthe quirks an eyebrow. <i>“...Well, yes and no. You worship gods, and I don’t worship Zyi. None of the siel do. Zyi just sort of </i>is<i>. I suppose that’s no real explanation, though, so I’ll elaborate.”</i>");

	output("\n\n<i>“Zyi, though you may know them by another name, is the one who created the universe and everything in it.”</i> Xanthe explains, all the while playing with one of her midnight blue locks. <i>“Neither male nor female, Zyi tugs at the strings of all things, making things happen simply because Zyi is Zyi.”</i>");
	output("\n\n<i>“I remember one myr girl asked me why we follow a god who doesn’t care about us. It’s more ‘recognition’ than ‘following’, really. We simply acknowledge the fact there is someone pulling the strings of random occurrence. There doesn’t need to be a rhyme or reason to it.”</i>");

	output("\n\n<i>“We don’t ‘pray’ like many other species do. There’s no way to get in Zyi’s good books, because you can’t manipulate the universe - it’s silly even to try. The best you can hope for is that Zyi decides to do something good for you, though they’re just as likely to do the opposite.”</i>");

	output("\n\nXanthe gives a little shrug and leans back against her long, caterpillar-like body. <i>“In the end, it’s just easier to forget Zyi is about. It’s best not to fret about it.”</i>");
	if(pc.isBimbo()) output("\n\nYour head hurts thinking about it, and you decide not to worry. Sounds like what people with too much free time, and not enough of a sex life think about!");

	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//The War
public function theWarTalkXanthe():void
{
	clearOutput();
	showXanthe();
	output("You ask ");
	if(xantheIsDommingPC()) output("your Mistress");
	else output("Xanthe");
	output(" what she thinks about the situation between the red and gold myr, and the potential of outright war.");

	output("\n\nShe lets out a long sigh and looks around the store, then shrugs. <i>“...Honestly? I think the whole thing is stupid on both sides. They could be spending all that energy screwing each other, and it would be a hell of a lot more enjoyable for both sides.”</i>");
	output("\n\n<i>“If anything, I’m actually rather sad. I have customers on both sides of the line. Some of my favorite cuties have died or got seriously injured. I am VERY unhappy with that. I’m glad the UGC have stepped in, though I’m not sure if it will make enough of a difference.”</i>");
	output("\n\n<i>“I’m not as bad off as some people since I weave my own stock. Even so, the impact on dye trade has been hurting business a little. That, and nobody wants to buy niche goods like mine when conflict is flaring up.”</i>");
	output("\n\n<i>“I’m just hoping the red myr don’t decide to lay siege to Gildenmere, or else I’m going to have to hightail it off Myrellion.”</i> Xanthe states with a noticeable frown.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Her Sex
public function askXantheAboutHerDonger():void
{
	clearOutput();
	showXanthe();
	if(!pc.isBimbo())
	{
		output("From reading the Codex on the siel, you know that they often have two sets of genitals - one at the front, and one at the back.");
		output("\n\nSince they don’t necessarily correspond with her external appearance, you ask ");
		if(xantheIsDommingPC()) output("your Mistress");
		else output("Xanthe");
		output(" what kind she has. Like most siel, she doesn’t seem offended by the question.");
	}
	else
	{
		output("You read the Codex, and it said her species has two kinds of genitals - one at the front, and one at the back. You’re so excited by the idea of <i>two</i> sets instead of one that it’s hard to sit still. Fucking someone like that must be amazing!");
		output("\n\n<i>“So, I hear your kind has two lots of genitals, and they don’t necessarily match how you look. What kind do you have?</i> You breathily ask.");
	}
	output("\n\n<i>“Interested, hmm? I was born with female genitals at the back and nothing at the front. It’s unusual, but does happen. I got a pussy gene modded in the front, but then I changed it to a cock when I got here. These Myr girls go CRAZY for cock, poor things!");
	if(flags["SET_XANTHE_SEX"] == 1) output(" Of course I’ve changed my genitals for you, too.");
	output("”</i>");

	output("\n\n<i>“I love both sets and I do fairly well for myself, so I’ve got a bunch of treatments on hand. My species take to that kind of modding really well, we’re pretty well known for it.”</i>");

	output("\n\nYou ask if that means Xanthe could change her body to have two pussies instead of a front cock and back pussy, or alternatively have two cocks?");

	output("\n\n<i>“Of course! I’m not too fussy about my sex, though it does irk me when people call me a herm, or a trap. People should ask first! I’m a </i>woman<i> regardless what I’m packing down there. One myr girl even called me a boy!”</i> Xanthe huffs.");

	// Unlocks ‘Use Mods’ Topic
	flags["XANTHE_TALKED_ABOUT_HER_SEX"] = 1;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Use Mods
// Must have viewed ‘Her Sex’ Topic
public function useModsYouSlut():void
{
	clearOutput();
	showXanthe();
	output("You ");
	if(xantheIsDommingPC()) output("shyly ask your Mistress");
	else output("ask Xanthe");
	output(" if she’ll consider changing her sex for you.");

	output("\n\nWhile it may be a big decision for some people, it’s definitely not one for Xanthe. Just like most siel, she seems rather mod-happy.");

	output("\n\n<i>“Of course! I mean, you’re paying for a replacement kit. I get them discounted, so it’s 500 per treatment. If you’re willing to foot the bill, I’m happy to switch my sexes around.”</i>");
	processTime(1);
	clearMenu();
	//[Front Cock, Rear Pussy] [Front Pussy, Rear Cock] [Two Pussies] [Two Cocks]
	if(xantheHasFrontCock() && xantheHasBackCunt()) addDisabledButton(0,"Cock/Cunt","Cock/Cunt","Xanthe already has a cock in the front and a pussy in the back.");
	else if(pc.credits < 500) addDisabledButton(0,"Cock/Cunt","Cock/Cunt","You can’t afford this treatment.");
	else addButton(0,"Cock/Cunt",giveDatBitchSomeHams,12,"Cock/Cunt","Pay for her to have a dick up front and a vagina in the back.");

	if(xantheHasFrontCunt() && xantheHasBackCock()) addDisabledButton(1,"Cunt/Cock","Cunt/Cock","Xanthe already has a vagina in the front and a dick in the back.");
	else if(pc.credits < 500) addDisabledButton(1,"Cunt/Cock","Cunt/Cock","You can’t afford this treatment.");
	else addButton(1,"Cunt/Cock",giveDatBitchSomeHams,21,"Cunt/Cock","Pay for her to have a vagina up front and a dick in the back.");
	// Cannot pick what she already has. Starts with Front Cock, Rear Pussy.
	// Costs 500 credits to change each time.
	if(xantheHasFrontCunt() && xantheHasBackCunt()) addDisabledButton(2,"TwoCunts","TwoCunts","Xanthe already has two vaginas.");
	else if(pc.credits < 500) addDisabledButton(2,"TwoCunts","TwoCunts","You can’t afford this treatment.");
	else addButton(2,"TwoCunts",giveDatBitchSomeHams,22,"TwoCunts","Pay for her to have two vaginas.");

	if(xantheHasFrontCock() && xantheHasBackCock()) addDisabledButton(3,"TwoCocks","TwoCocks","Xanthe already has two dicks.");
	else if(pc.credits < 500) addDisabledButton(3,"TwoCocks","TwoCocks","You can’t afford this treatment.");
	else addButton(3,"TwoCocks",giveDatBitchSomeHams,11,"TwoCocks","Pay for her to have two cocks.");
	addButton(14,"Back",enterTheSilkenSerenityWhyDidWashHaveToDie);
}

//Transformation
public function giveDatBitchSomeHams(hamArgs:int = 10):void
{
	clearOutput();
	showXanthe();
	flags["SET_XANTHE_SEX"] = 1;
	output("You transfer the credits over and soon she’s slipping under the counter to grab some canisters, placing them down on the table.");
	output("\n\n<i>“Now no peeking while this happens, okay? I’ll be very cross if you’re looking at me while I’m naked and ogling my new body parts.”</i> Xanthe sultrily warns you, all the while staring at you with those brilliant blue eyes.");
	output("\n\nIt’s quite hard to tell if she’s serious or not as she reaches for the back of her lacy black bra. She looks dead serious, but why would she need to take off her top...?");
	processTime(1);
	pc.credits -= 500;
	//[Close Eyes] [Half Close] [Brazenly Watch]
	clearMenu();
	addButton(0,"Close Eyes",closeEyesForTheTF,hamArgs);
	addButton(1,"Half-Close",halfCloseEyes4Xanthe,hamArgs);
	addButton(2,"Watch",brazenWatchXanth,hamArgs);
}

// Close Eyes
public function closeEyesForTheTF(hamArgs:int = 10):void
{
	clearOutput();
	showXanthe();

	var genitalFront:int = Math.floor(hamArgs/10);
	var genitalBack:int = hamArgs - Math.floor(hamArgs/10) * 10;
	output("You decide to take her at her word, and close your eyes for the process. It might be your imagination, but you swear you hear her make a slightly disappointed noise.");
	output("\n\n<i>“Such a good " + pc.mf("boy","girl") + "! I’ll really have to do something about that...”</i> She purrs out. There’s nothing for a good long while... is she done?");

	output("\n\nUnsure whether to open your eyes, you ask her if she’s ‘done changing?’ You’re answered by feeling ");
	//If change involved getting a new cock: 
	if(genitalFront == 1 || genitalBack == 1) output("an incredibly rigid cock pressing against your waist, and rubbing pointedly against you.");
	else output("her smooth, naked pussy rubbing up pointedly against you.");

	output("\n\n<i>“Oh, I’m done. How does it feel, do you like it’s touch...?”</i> Her new ");
	if(genitalFront == 1 || genitalBack == 1) output("girthy member");
	else output("silky mound");
	output(" is lewdly pressed into your hand. Your fingertips brush her new sex, and intimately stroke her new parts. <i>“You better not be looking.”</i>");

	output("\n\nYour cheeks go a little red as you feel her ");
	if(genitalFront == 1 || genitalBack == 1) output("turgid length");
	else output("pussy heat");
	output(" radiating through your fingers, and you sigh with pleasure. At that moment they are pulled away, and you let out a disappointed noise. It felt so good...!");

	output("\n\n<i>“You can look now, my pet. I’m all dressed.”</i> You open your eyes and notice to your dismay that she is telling the truth. Her genitals don’t look any different, but then, it’s really hard to tell with siel.");
	output("\n\nXanthe seems to notice your forlorn look, and gives you a little wink. <i>“There there, if you </i>really<i> want to see them, I might give you a look later. It would be terrible if you didn’t get a taste of my new ‘merchandise’.”</i>");

	output("\n\n<b>Xanthe now has a ");
	if(genitalFront == 1) output("front cock");
	else output("front pussy");
	output(" and a ");
	if(genitalBack == 1) output("back cock");
	else output("back pussy");
	output("!</b>");

	processTime(4);
	xantheSetGenitals(hamArgs)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	
}

public function xantheSetGenitals(hamArgs:int = 10):void
{
	var genitalFront:int = Math.floor(hamArgs/10);
	var genitalBack:int = hamArgs - Math.floor(hamArgs/10) * 10;
	if(genitalFront == 1) flags["XANTHE_FRONT_GENITAL"] = 1;
	else flags["XANTHE_FRONT_GENITAL"] = 2;
	if(genitalBack == 1) flags["XANTHE_BACK_GENITAL"] = 1;
	else flags["XANTHE_BACK_GENITAL"] = 2;
}

// Half Close
public function halfCloseEyes4Xanthe(hamArgs:int = 10):void
{
	clearOutput();
	//showXanthe();
	output("You pretend to close your eyes, but still peek out through your lashes. This way you can get a look without her noticing. She checks to see if you’re peeking, but seems appropriately fooled.");
	xantheWatchEpilogue(hamArgs, true);
}

// Brazenly Watch
public function brazenWatchXanth(hamArgs:int = 10):void
{
	clearOutput();
	//showXanthe();
	output("You don’t close your eyes, instead simply watching on. Xanthe seems to grin a little at your obvious boldness, going so far as to quirk an eyebrow at you.");
	output("\n\n<i>“Oh, it’s like THAT is it...? I suppose I can give you a little show, since you’re so eager to watch.</i> Xanthe sinfully consents to your gaze, seemingly unphased by having an audience. She doesn’t even bother to shut the store either and simply strips down behind the desk.");
	xantheWatchEpilogue(hamArgs, false);
}

public function xantheWatchEpilogue(hamArgs:int = 10, cheated:Boolean = false):void
{
	var genitalFront:int = Math.floor(hamArgs/10);
	var genitalBack:int = hamArgs - Math.floor(hamArgs/10) * 10;
	output("\n\nYou watch on as she unhooks her black bra and pulls it downwards, letting her glorious blue bosom spill out for you to see. They give a delightful little jiggle as they are finally released from their lacy confines.");
	output("\n\nIt’s hard not to relish in the sight of those hefty alien breasts. There’s just the right amount of gravity to give them a little sag, that nice natural look without losing their full perk. ");
	output("\n\nYou notice her dark blue nipples are slightly crinkled and her puckered buds are becoming stiff before your eyes. You can’t tell if it’s the cold or from stripping in front of you, " + indefiniteArticle(pc.race()) + " she clearly finds attractive");
	if(cheated) output(", whether you’re looking or not");
	output(".");
	output("\n\nThe siel woman tosses the frilly fabric aside, turns around, and rolls onto her back. She then spreads her numerous stocking-clad legs and thighs wide. You relish in the ");
	if(cheated) output("stolen ");
	output("sight - there really can’t be too much of a good thing!");

	output("\n\nShe slips her thumbs underneath the sides of her front pair of panties, and slides them slowly off her bulky thighs - all the while pointing her double pronged toes up in the air. She simultaneously pulls off the back pair with nothing but her tail.");

	output("\n\nWith her legs spread wide, you can clearly see her hairless mounds and bare blue loins. At the front ");
	//front cock && back pussy:
	if(xantheHasFrontCock() && xantheHasBackCunt()) output("is a slender genital slit housing her rippling alien phallus, which is completely hidden from sight. Between her chunky rear thighs is her siel pussy, easily distinguishable by her Y-shaped slit.");
	//front pussy && back cock:
	else if(xantheHasFrontCunt() && xantheHasBackCock()) output("is her siel pussy, easily distinguishable by her Y-shaped slit. Between her chunky rear thighs is a slender genital slit housing her rippling alien phallus, which is completely hidden from sight.");
	//two cocks:
	else if(xantheHasFrontCock() && xantheHasBackCock()) output("and back are a pair of slender genital slits housing her rippling alien phalli. They are currently hidden from sight.");
	//two pussies:
	else output("and back are her pair of siel pussies, easily distinguishable by their Y-shaped slits.");

	output("\n\nNow fully undressed, Xanthe reaches over and grabs the silvery canister from before. She presses one end against her nude rippled belly, and you immediately hear the hissing noise of sudden air release.");

	output("\n\nIt only takes a few seconds before the effects kick in - it seems the siel really do take to gene mods well. Suddenly ");

	var frontChanging:Boolean = (flags["XANTHE_FRONT_GENITAL"] != genitalFront);
	var backChanging:Boolean = (flags["XANTHE_BACK_GENITAL"] != genitalBack);

	trace("XANTH PRETF STATUS. FRONT GENITAL: " + flags["XANTHE_FRONT_GENITAL"] + " BACK GENITAL: " + flags["XANTHE_BACK_GENITAL"] + "\nPOST TF STATUS. FRONT: " + genitalFront + " BACK: " + genitalBack);

	if(frontChanging && !backChanging)
	{
		if(flags["XANTHE_FRONT_GENITAL"] == 2) output("her alien pussy");
		else output("her alien cock slit");
	}
	else if(backChanging && !frontChanging)
	{
		if(flags["XANTHE_BACK_GENITAL"] == 2) output("her alien pussy");
		else output("her alien cock slit");
	}
	else 
	{
		if(flags["XANTHE_BACK_GENITAL"] == flags["XANTHE_FRONT_GENITAL"] && flags["XANTHE_BACK_GENITAL"] == 2) output("her alien pussies");
		else if(flags["XANTHE_BACK_GENITAL"] == flags["XANTHE_FRONT_GENITAL"] && flags["XANTHE_BACK_GENITAL"] == 1) output("her alien cock slits");
	}
	output(" begin");
	var single:Boolean = !(frontChanging && backChanging);
	if(single) output("s")

	output(" to shift and transform, quickly changing ");
	if(single) output("its");
	else output("their");
	output(" shape. <b>Xanthe now has a ");
	if(genitalFront == 1) output("front cock");
	else output("front pussy");
	output(" and a ");
	if(genitalBack == 1) output("back cock");
	else output("back pussy");
	output("!</b>");

	xantheSetGenitals(hamArgs);
	showXanthe(true);
	
	output("\n\nThe transformation is only momentarily underwhelming, as it is soon punctuated by ");
	if(genitalFront == genitalBack && genitalFront == 1) output("her twin cocks emerging from their folds. Within seconds she’s shooting her own silky white cum all over her own buxom tits and stomach. She gives herself her own bukkake shower, all the while frantically stroking and jerking off her frontmost member.");
	else if(genitalFront == genitalBack && genitalFront == 2) output("her twin pussies squirting her silky white girl cum all over the place; basting her blue stomach and thighs. She frantically strokes her frontal folds and quivers and twitches the entire time.");
	else output("her lumpy alien cock emerging from its fold. Within seconds she’s shooting her own silky white cum and girl cum all over her stomach and thighs; giving herself a thorough basting in her own juices.");

	output("\n\nOnce she’s finished thoroughly creaming herself, she pulls herself off the floor. Instead of grabbing her clothing, however, she slides towards you and presses against your chest. She ");
	if(pc.tallness <= 65) output("leans downward");
	else if(pc.tallness <= 80) output("leans forward");
	else output("stands on her tippitoes");
	output(" and gently bites at your ear. You jump in surprise.");

	output("\n\n<i>“...");
	if(cheated) 
	{
		output("I know you watched, you naughty " + pc.mf("boy","girl") + ". Don’t think you can hide ");
		if(pc.hasCock()) output("your erection");
		else output("your trembling [pc.legsNoun] from me.");
	}
	else output("Don’t think you’re getting away with all this brazen behavior of yours, by the way.");
	output("”</i> Xanthe calls you out. One of her hands ");
	if(!pc.isTaur())
	{
		output("is ");
		if(pc.isCrotchGarbed()) output("sliding into your [pc.lowerGarment] and touching");
		else output("moving to touch");
		if(pc.hasCock()) output(" [pc.oneCock]");
		else if(pc.hasVagina()) output(" [pc.oneVagina]");
		else output(" your [pc.ass]");
		output(".");
	}
	//Taur: 
	else output("is teasing your [pc.chest].");

	output("\n\nHer six-fingered hand plays you like an instrument, and soon you’re letting out a low moan and pushing your body against it. Just when things start getting really hot and heavy, she leans forward and whispers something in your ear.");
	output("\n\n<i>“If you want to try out my new parts, you’ll have to ask very nicely. I’m not some tausian girl who can just be winked at and fucked, you know.”</i> Xanthe whispers in your ear. Her hot tickling breath causes a shiver of pleasure to quake down your back.");
	output("\n\nAnd just like that, Xanthe pulls away and leaves you with aching loins and a ");
	if(pc.hasCock()) 
	{
		output("seriously hard ");
		if(pc.cockTotal() > 1) output("set of erections");
		else output("erection");
	}
	else if(pc.hasVagina())
	{
		output("seriously moist");
		if(pc.totalVaginas()) output("snatches");
		else output("snatch");
	}
	else output("flushed face");
	output(". Apparently you really <i>are</i> going to have to ask if you want to play with them!");
	processTime(7);
	pc.changeLust(45);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sex
// Unlocks ‘Mating’ menu
public function sexChatWithXanthe():void
{
	clearOutput();
	showXanthe();
	output("You ask ");
	if(xantheIsDommingPC()) output("your Mistress");
	else output("Xanthe");
	output(" about her species and sex. Do they mate with other species, or is that something the Siel don’t engage in?");

	output("\n\nThe midnight blue haired woman looks at you with a flirtatious smile, though it’s a little bit edgy too. <i>“Oh, why are you asking...? That’s a rather SPECIFIC question, wouldn’t you agree?”</i> She inquires in a husky tone.");

	processTime(1);
	flags["XANTHE_TALKED_ABOUT_SEX"] = 1;
	//[I Want To Mate] [Just Curious]
	clearMenu();
	addButton(0,"WantToMate",IWantToMate);
	addButton(1,"JustCurious",justCuriousAboutItXanthe)
}

//I Want To Mate 
public function IWantToMate():void
{
	clearOutput();
	showXanthe();
	output("You tell ");
	if(xantheIsDommingPC()) output("your Mistress");
	else output("Xanthe");
	if(pc.isNice()) output(" with a slight cough");
	else if(pc.isMischievous()) output(" in a light-hearted fashion");
	else output(" straight up");
	output(" that you are interested in mating with her.");

	output("\n\nAs expected, the Siel woman seems very receptive to the idea. However, despite her previous flirtations, she doesn’t state that she will or won’t just yet. Instead, she gives you a little bit of a warning.");
	output("\n\n<i>“My species, the Siel, mate by tying up our partners and engaging in... I believe humans call it ‘bondage’. Some species are put off by this, since apparently this is not to their tastes.”</i> Xanthe explains, all the while weaving a rather specific sort of rope. <i>“If you’re okay with being tied up and teased, then I don’t see why not.”</i>");
	output("\n\n<i>“The other thing to note is that we siel mate for a lot longer than most species do. If you are truly interested in mating with me, you’re going to have to set aside a lot of time.”</i>");
	output("\n\nYou ask Xanthe exactly how much time you would have to set aside if you two were to do the deed?");
	output("\n\n<i>“About a half day for a quickie. I don’t do anything less. I much prefer going for a full day, and positively adore just setting aside a week to screw. I always get my best works done then.”</i>");
	output("\n\nThat’s a lot of time! You’d better be seriously prepared if you decide to mate with Xanthe, since it sounds like it is going to be quite an intense experience.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Just Curious
public function justCuriousAboutItXanthe():void
{
	clearOutput();
	showXanthe();
	output("You tell ");
	if(xantheIsDommingPC()) output("your Mistress");
	else output("Xanthe");
	output(" that you’re just asking out of curiosity. She seems rather disappointed by your answer.");

	output("\n\n<i>“Oh... that’s far less fun. I suppose I’ll tell you; perhaps it will arouse your sense of adventure?”</i> Xanthe coils a finger around a lock of hair, all the while raising an eyebrow at you.");
	output("\n\n<i>“My species, the Siel, mate by tying up our partners and engaging in... I believe humans call it ‘bondage’. Some species are put off by this, since apparently this is not to their tastes.”</i>");
	output("\n\n<i>“The other thing to note is that we Siel mate for a lot longer than most species do. Our ‘quickies’ generally last a half day. I find a full day, or a week, far more satisfying. I always get my best works done then.”</i>");
	output("\n\nVoid, that’s a long time! If you ask Xanthe to mate, you better be seriously prepared. It sounds like it would be quite an intense experience.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Mating
public function letsDoAlienBondageMating():void
{
	clearOutput();
	showXanthe();
	// First Time
	if(flags["XANTHE_MATED"] == undefined)
	{
		output("After talking and flirting with Xanthe, you feel like it’s the right moment to bring up mating with her. Unfortunately, she beats you to the punch.");
		output("\n\nWhen you least expect it, the blue-skinned Siel woman leans in and strokes your cheek. It catches you completely off guard.");
		output("\n\n<i>“It’s fun flirting with you, my dear, truly wonderful. But I think we both know why you keep hanging around my store, and it has nothing to do with the clothes.”</i> she proclaims, all the while looking at you with those powerful, electric blue eyes.");
		output("\n\n<i>“I’d say it’s because you sense an Alpha female and you’re longing to submit to me. Am I right?</i>");
		processTime(1);
		//[Yes] [No]
		clearMenu();
		addButton(0,"Yes",yesYouCanDomMeXanthe,undefined,"Yes","You want her to be your Mistress and secretly long to submit to the Siel woman.");
		// Yes tooltip: You want her to be your Mistress and secretly long to submit to the Siel woman.
		// No tooltip: While you’re interested in mating with her, you’re not out to be her submissive.
		addButton(1,"No",noImNotIntoThisShit,undefined,"No","While you’re interested in mating with her, you’re not out to be her submissive.");
	}
	//Mating (Domme) Menu
	else
	{
		//if (pc is not a taur && height below 8 ft)
		if(!pc.isTaur() && pc.tallness < 96)
		{
			output("Mistress Xanthe leans back against her own body and hooks up her stocking clad knees as if she’s sitting in a chair. She then looks at you and pats her lap.");
			output("\n\nRealizing she’s giving you an instruction, you rush over and hop into her lap like a good little sub. Wrapping your arms around her neck, you resist the urge to do anything else until ordered to.");
		}
		else
		{
			output("Mistress Xanthe leans back against her own body and hooks up her stocking clad knees as if she’s sitting in a chair. She then looks at you and pats the side of her leg.");
			output("\n\nRealizing she’s giving you an instruction, you rush over and bow by her side a good little sub. You resist the urge to do anything else until ordered to.");
		}
		output("\n\n<i>“Good " + pc.mf("boy","girl") + ".”</i> Xanthe’s husky words of praise cause your heart to soar, especially since they’re followed by a sweet kiss on your [pc.lips].");
		output("\n\nYou spend some time basking in her powerful presence and obeying her commands. Does she get you to do anything - or do anything to you - today...?");
		processTime(3);
		//[Tie and Tease] [Spend Time] [Nothing]
		clearMenu();
		addButton(0,"Tie & Tease",tieAndTeaseWithXanthe);
		addButton(1,"Spend Time",spendTimeWithXantheYouSlut);
		addButton(2,"Nothing",nothingWithXantheTodayBadumTish);
	}
}

//Yes
// Sets Xanthe as Dommy to PC, brings up Mating (Domme) Menu. 
public function yesYouCanDomMeXanthe():void
{
	clearOutput();
	showXanthe();
	output("You can’t deny her words, instead looking at your [pc.feet] with flushing cheeks. Soon you feel a curved finger being slipped underneath your chin, bringing it upwards until you are staring into her eyes.");
	output("\n\n<i>“Submit to me, my " + pc.mf("handsome","beautiful") + " [pc.raceCuteShort], and I will love you and take care of you until the end of days.”</i> A gentle kiss is lavished on your raised jawline and fills you with incredible warmth. <i>“I will fiercely protect you like no other, and others will know that you belong to ME.”</i>");
	output("\n\nHer sudden burst of possessiveness and sweet, caring promises cause");
	if(pc.hasKnees()) output(" your [pc.knees]");
	else output("s you");
	output(" to quake and your heart to swell. It feels as if she is a mother lion, threatening to tear apart those who would so much as scratch your [pc.skinFurScalesNoun].");
	output("\n\nIt’s not even a question of being claimed, as you know in your heart that you already belong to her. You’ve <i>always</i> belonged to her. All that’s left is to say the words that confirm it.");
	output("\n\n<i>“...Yes.”</i> You breathily whisper, letting yourself be swept up in the sweeping force that is Xanthe.");
	processTime(4);
	pc.changeLust(10);
	// Play ‘Tie and Tease’ sex scene
	clearMenu();
	addButton(0,"Next",tieAndTeaseWithXanthe)
}

//No
public function noImNotIntoThisShit():void
{
	clearOutput();
	showXanthe();
	//Was going to do a full on non-domme version, but already over word count. May insert new version of <i>“no”</i> and non-Domme route depending on Xanthe’s reception. 

	output("You tell her that she must be getting some mixed signals. While you are definitely interested in mating with her, you definitely don’t want to be her submissive.");
	output("\n\n<i>“Ah, really? I guess that’s too bad then. I’m not really out for another kind of relationship at the moment. Talk to me if you change your mind.”</i> Xanthe pets your cheek and then heads back to work.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tie and Tease
// All Sexes
public function tieAndTeaseWithXanthe():void
{
	clearOutput();
	showXanthe();
	output("Xanthe gives you a long, tongue filled kiss and you swoon in delight. You melt against her like a living puddle. Her arms slide around your waist and pull you close, ensuring that you don’t fall to your [pc.feet].");
	output("\n\nAfter what feels like forever, your Mistress deprives you of her sweet lips, and grabs your hands in hers. You are led slowly to her dungeon in the back of the store. You’re utterly swept up in the flow, happy to go everywhere and anywhere she may lead.");

	//First time sex scene
	if(flags["XANTHE_MATED"] == undefined)
	{
		output("\n\nWhen you walk into her dungeon you are overwhelmed with how much bondage furniture is everywhere. Wooden horses, a bondage wheel, an X-cross... almost every kind of galactic device designed for restraint and punishment is here. There are various tools hanging up, including at least a dozen different whips, floggers, and paddles.");
	}
	output("\n\nYou’re told to ");
	if(pc.isNude()) output("stand to attention");
	else output("strip off your clothes");
	output(" and you immediately do so, not even registering the instruction before you comply. When she tells you to ");
	if(pc.legCount > 1) output("spread your [pc.legsNoun] and ");
	output("lift your hands, you do so without question.");

	output("\n\nShe could tell you to leap out the window and you would happily do it. You’re simply that confident that she would never ask you to do something that wasn’t for your own good. Xanthe is your Mistress, and she cares for you - why would she harm her own pet?");

	output("\n\nWith bated breath, you watch as your Mistress shoots her gossamer silk directly above you and sticks it to the roof. A single snap of her fingers severs it from her tail, leaving her holding a long roof-bound length.");

	output("\n\nMoments later she’s closing in on you and pressing her awesome breasts against your chest. Her hands are upwards, however, securing your raised hands with the silky twine. She wraps the smooth, silky cord around your wrists.");

	output("\n\nLooking upwards, you marvel at her obvious talent and the care in which she ties you up like a perfectly wrapped present. It’s tight enough for you to feel it every given second, yet in no way does it feel uncomfortable.");

	output("\n\nShe also secures your [pc.legOrLegs] with two lengths of silken twine, each secured your immediate left and right. Tied up like this, you’re unable to do anything but ");
	if(pc.legCount > 1) output("keep your [pc.legsNoun] spread and ");
	output("your arms in the air. It’s like you’re a naked damsel dangling over a pit of doom!");

	output("\n\n<i>“Trussed up like this, I can do anything I want to you... or nothing at all. I could leave you here for days if I so wished, keeping you like my little wrapped up prize.”</i> Xanthe ");
	if(!pc.isTaur()) output("slides her arms around your waist");
	else output("slides her fingers up to your ");
	if(!pc.isTaur()) 
	{
		output(" from behind. One of her six-fingered hands slips down to your ");
	}
	if(pc.hasVagina() && !pc.hasCock()) output("[pc.vaginas]");
	else if(pc.hasCock() && !pc.hasVagina()) output("[pc.cocks]");
	else output("loins");
	output(" and pointedly teases ");
	if(pc.totalGenitals() == 1) output("it");
	//Loins = them
	else output("them");
	output(", showing just how vulnerable you are. She really could do anything she wanted to you like this!");

	output("\n\n<i>“If you beg... nicely beg... I might feel gracious enough to play with you. Otherwise I might just stick a vibrating toy in your [pc.vagOrAss] on low for a couple of days, enough to get you frustrated but not enough to get you off.”</i>");
	output("\n\nYou’re not sure what makes you more panicked - the thought of going without your Mistress’s attentions, or the cruelly delicious punishment looming over your head. Either way you desperately beg her to pay attention to you. It would be a shame not to play with such a nicely wrapped toy like you!");

	pc.changeLust(20);
	processTime(5);
	clearMenu();
	//[She Leaves You!] [Pays Attention] 
	addButton(0,"SheLeaves",getLeftByXantheSlooot);
	addButton(1,"SheStays",shePaysAttentionToYouSlut);
}

// She Leaves You!
public function getLeftByXantheSlooot():void
{
	clearOutput();
	showXanthe(true);
	var x:int = rand(pc.totalVaginas());
	output("You pitifully plead with all your might, begging her not to leave you trussed up like this. You overstep yourself and tell her that <i>“she must”</i> let you go, instantly regretting your words.");
	output("\n\n<i>“So ‘I Must’ let you go, must I? Why ‘Must’ I do that, hmm?”</i> Xanthe looks at you sternly. Her sharp gaze cuts right into your soul, and you flush with shame. <i>“I think you’ve forgotten your place, pet, and you’re in need of some discipline.”</i>");
	output("\n\nDiscipline! You hope that she’s going to spank you, yet instead she creates ");
	if(!pc.hasCock()) output(num2Text(pc.totalNipples()));
	else output("a number of");
	output(" sticky hitch-ended silk strings. She then attaches them to your ");
	if(pc.hasPiercedNipples()) output("[pc.nipplePiercings]");
	else output("[pc.nipples]");
	if(pc.hasCock()) output(" and [pc.cocks]");
	output(", tightening them and waiting for the adhesive substance to set. Once it has, she loops them through a metal ring on the floor and - looking at you - gives them a pointed tug.");

	output("\n\nThe sudden sharp sensation causes you to cry out in pleasured shock. Not only are you butt-naked, arms tied up, and your [pc.legOrLegs] ");
	if(pc.legCount > 1) output("spread and ");
	output("restrained, now your [pc.nipples]");
	if(pc.hasCock()) 
	{
		output(" and [pc.cocksLight]");
	}
	output(" are");
	output(" lewdly pulled out");
	if(!pc.isTaur()) output(" in front of you");
	output(".");

	output("\n\n<i>“Mistress, please, I promise I’ll be good! I’ll...!”</i> Your cries of protest are silenced when she pulls off a pair of her black, lacy underwear and shoves it inside of your mouth.");
	output("\n\n<i>“Bite on it!”</i> Xanthe barks at you, and you immediately do so, holding it long enough for her to get some equally black duct tape. She pulls off a strip and uses it to both silence you and secure her warm unmentionables in your mouth, causing you to flush with embarrassment.");

	
	output("\n\nNow thoroughly silenced, you wait patiently as she retrieves a long, black rippled vibrator and waves it in front of you.");
	// Flag check if done vibrator scene before with butch. This is the only scene currently with butch.
	if(flags["MET_BUTCH"] != undefined) output(" You recognize ‘Butch’ when you see him.");
	else output(" It looks seriously aggressive and has a pointedly large head. She grabs some lubricant and begins to smear the cool, clear gel all over the imposing onyx phallus. You watch the entire process with bated breath.”</i>");

	output("\n\n<i>“");
	if(flags["MET_BUTCH"] == undefined) output("This, my dear, is ‘Butch’.");
	else output("You remember ‘Butch’, don’t you?");
	output(" He’s getting shoved deep inside of your [pc.vagOrAss]. I’m setting him to react to your excitement levels. Specifically, </i>just<i> below that of orgasm.”</i> Xanthe clicks the back of it. Wait, just <i>below</i> orgasm...?");

	output("\n\nYou can’t ask any questions though, what with your mouth stuffed with her freshly worn panties and taped shut. All you can do is stand there, your precious ");
	if(!pc.hasCock()) output("nips");
	else output("bits");
	output(" tugged out");
	if(pc.hasPiercedNipples()) output(" by your piercings");
	if(pc.legCount > 1) output(" and legs spread wide");
	output(", as she slowly inserts Butch into your [pc.vagOrAss " + x + "].");

	output("\n\nThe sensation of cool lube smearing all over your slowly stretching ");
	if(pc.hasVagina()) output("slit");
	else output("pucker");
	output(" causes you to let out a muffled gasp. It’s followed by a stifled cry as your ");
	if(pc.hasVagina()) output("slippery snatch");
	else output("basted butthole");
	output(" is stretched open and Butch is slipped inside.");
	// Virgin: <b>You’ve lost your {anal} virginity!</b>
	if(pc.hasVagina()) pc.cuntChange(x, 500, true, true, false);
	else pc.buttChange(500,true,true,false);

	output("\n\n<i>“Can you feel him deep inside of you?”</i> Your Mistress huskily asks, and you nod in response. You can feel every contour and curve buried deep inside of your [pc.vagOrAss " + x + "]. Almost as if accepting it, your ");
	if(pc.hasVagina()) output("pussy lips and walls");
	else output("anus and sphincter");
	output(" relax and mold around it, perfectly matching Butch’s shape.");

	output("\n\nWith a pleasured sigh you relish in having such a massive tool buried inside your ");
	if(pc.hasVagina()) output("[pc.vagina " + x + "]");
	else output("needy butt");
	output(". Just when you’re beginning to relax it begins to whir and tremble deep inside of you, causing coiled pleasure to build ");
	if(pc.hasVagina()) output("between your thighs");
	else output("deep inside your delightfully defiled ass.");

	output("\n\n<i>“I’ll leave you two lovebirds alone ");
	if(flags["MET_BUTCH"] == undefined) output("to get better acquainted");
	else output("for a while");

	// Set ‘met Butch’.
	flags["MET_BUTCH"] = 1;

	output(".”</i> Xanthe informs you, giving your [pc.butt] a pointed slap. You jolt upwards and in the process tug at your bound [pc.nipplesNoun] and ");
	if(pc.hasCock()) output("[pc.cocks]");
	else output("[pc.chestNoun]");
	output(", forcing a muffled moan from your lips.");
	
	processTime(25);
	pc.changeLust(44);
	clearMenu();
	addButton(0,"Next",getLeftAloneByXanthePartDues,x);
}

public function getLeftAloneByXanthePartDues(x:int = 0):void
{
	clearOutput();
	showXanthe(true);
	output("<b>... Some time passes....</b>");
	output("\n\nLeft tied up and down in the dungeon on your own, every noise and sensation slowly becomes more acute. From the tight constriction around your wrists to that around your [pc.nipplesNoun]");
	if(pc.hasCock()) output(" and loins");
	output(", you acutely feel your captivity.");
	output("\n\nMore than anything, you feel and yearn for the missing company of your Mistress, who you know is somewhere close by. Instead the air is filled with the whirring noise of the black vibrator buried ");
	if(pc.hasVagina()) output("in your slavering snatch");
	else output("between your buttcheeks");
	output(" and the keen sensation of it pressing against your ");
	if(pc.hasVagina()) output("g-spot");
	else output("prostate");
	output(".");

	output("\n\nIt doesn’t take you long to realize there is a full sized mirror mounted on the wall and pointing directly at you, giving you a good look at how lewd you look right now. You stare at the [pc.race] in the mirror with [pc.hisHer] [pc.nipples]");
	if(pc.hasCock()) output(" and [pc.cocks]");
	output(" all bound and pulled downwards, arms upwards and [pc.legOrLegs] bound.");

	output("\n\nAs you look you can see your own [pc.skinColor] cheeks flushing and your bound parts getting pointedly stiffer. Wiggling your bound [pc.legOrLegs], you moan into your Mistress’s panties, getting more and more wound up. You really do look like a naughty " + pc.mf("boy","girl") + "!");

	output("\n\nThinking yourself clever, you tug at the strings attached to your ");
	if(pc.hasCock()) output("loins");
	else if(pc.biggestTitSize() > 1) output("tits");
	else output("chest");
	output(", looking in the mirror all the while in an attempt to get off. Just as the pooled pleasure you’re feeling begins to reach its peak... the black vibrator suddenly slows down and takes your buzz with it. When you’re about to cool off, it starts up and heats you up again.");

	output("\n\nYou cry with sexual frustration into the panties, being brought up to dizzying heights then pulled back from that delectable brink. Your legs tremble and you’re held up by nothing but your smooth silk wrist wrappings, powerless as your ");
	if(pc.hasVagina()) output("pussy");
	else output("pucker");
	output(" is provoked over and over again.");
	
	output("\n\nJust when you think you’re never going to see her again, your Mistress returns, though not to free you. Instead she pulls off the tape and feeds you, telling you not to utter a word. You compliantly do so, then afterwards your mouth is stuffed with a pair of fresh panties and sealed over again.");
	
	processTime(30);
	pc.changeLust(30);
	clearMenu();
	addButton(0,"Next",leftTeasedForEver,x);
}

public function leftTeasedForEver(x:int = 0):void
{
	clearOutput();
	showXanthe(true);
	output("<b>... Even <i>more</i> time passes...</b>");
	output("\n\nYour Mistress periodically visits over the next few days to let you eat, drink, and occasionally unties you for a short bathroom break. She even lets you sleep for a few hours, though she makes you do so in a leather sleepsack and on the ground of the dungeon. You’re woken up and tied up once again to resume your discipline every few hours, allowing your brain the shortest of breaks.");
	output("\n\nBy the third day you’ve forgotten nearly everything that exists outside of the dungeon, short of your Mistress’s visits and the tantalizing pleasure you are constantly subjected to. When she comes in and pulls out Butch from your [pc.vagOrAss " + x + "], you assume it’s for his regular re-lubing.");

	output("\n\n<i>“You’ve been very good, my pet. Don’t think I haven’t noticed you not saying a word. Time for your reward.”</i> Xanthe strokes your [pc.hair] and you let out a muffled cry of joy. Far from seeking release, you’re just happy that your Mistress is happy.");

	//if Xanthe does not have frontcock
	if(flags["XANTHE_FRONT_GENITAL"] != 1)
	{
		output("\n\nYou watch her slip on a black pair of underwear over her legs and then connect the whirring black phallus to the front. As she lubes it up, your heart soars with anticipation. Is she going to fuck you with Butch?");
	}
	else output("\n\nYou watch her slip off her front underwear and then sensuously stroke her cock slit. It’s not long before her rippled alien phallus is emerging, blessing you with that glorious sight. When it’s fully out, she wraps it at the base with her silk and it quickly becomes fully engorged.");

	output("\n\n");
	if(flags["XANTHE_FRONT_GENITAL"] == 1) output("With her " + xantheCock() + " at the ready");
	else output("With her strap on properly equipped");
	output(", your Mistress moves ");
	if(pc.genitalLocation() <= 1) output("up to you");
	else output("behind you");
	output(" and positions herself at your ");
	if(pc.elasticity < 3) output("now gaping");
	output(" entrance. It’s hardly an effort for her to slip inside your ");
	if(pc.elasticity < 3) output("now cavernous ");
	if(pc.hasVagina()) output("cunt");
	else output("chute");
	output(" and sheathe herself in your over-traversed tunnel.");

	output("\n\nAs you are thoroughly claimed by your Mistress, your eyes flutter back and your mouth opens as much as it can. Somehow having ‘Her’ pushing her tip into the deepest parts of your ");
	if(pc.hasVagina()) output("cunny");
	else output("butt");
	output(" feels unbelievably better than just the vibrator, making you feel truly complete.");

	output("\n\nEach powerful thrust of her hips lewdly slaps your ");
	if(pc.genitalLocation() <= 1) output("own");
	else output("[pc.ass]");
	output(" and tugs at your ");
	if(pc.hasPiercedNipples()) output("pierced ");
	else output("bound up ");
	output("nipples ");
	if(!pc.hasCock()) output("and [pc.chestNoun]");
	else output("and [pc.cocksNounSimple]");
	output(", assaulting your body with so many sensations in all the right places. Even with your wrists bound up, you buck and grind instinctively against her, happy for your Mistress to claim what is hers.");

	output("\n\nIt’s not surprising that you quickly reach the brink that you have been literally denied for days, though your orgasm is mind blowingly cataclysmic. Starting at a trembling [pc.foot] and turning into a full body spasm, you clench her ");
	if(flags["XANTHE_FRONT_GENITAL"] == 1) output(xantheCock());
	else output("strap on");
	output(" with your [pc.vagOrAss " + x + "] and let out an intensely muffled scream. Sensing your climax, your Mistress thrusts hard and deep, pushing her cock head hard ");
	if(pc.hasVagina()) output("against the mouth of your womb");
	else output("into your bowels");
	output(", making it rocket right off the richter scale.");

	output("\n\nYou feel as if the universe itself cracks and dissolves as ");
	//herm and male:
	if(pc.hasCock()) 
	{
		output("you mindlessly shoot and cream your genitals, your bound [pc.cocks] shooting ");
		if(pc.cumQ() < 5) output("tiny splatterings");
		else if(pc.cumQ() < 50) output("thick sticky ropes");
		else if(pc.cumQ() < 2500) output("gloriously thick ropes");
		else
		{
			if(pc.cumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO) output("gooey ");
			output("gallons");
		}
		output(" of your [pc.cum] all over the floor");
	}
	if(pc.hasVagina() && pc.hasCock()) output(". Your");
	else if(pc.hasVagina())
	{
		output("your");
	}
	if(pc.hasVagina()) output(" [pc.vaginas] squirt and splatter your [pc.girlCum] all over your [pc.thighs], utterly smearing them with your naughty nectar");
	//neuter:
	if(!pc.hasVagina() && !pc.hasCock()) output("you thoroughly cream yourself, twitching and shivering against her as you experience a dry orgasm");
	output(".");
	if(flags["XANTHE_FRONT_GENITAL"] == 1) 
	{
		output(" At the same time your [pc.vagOrAss " + x + "] squeezes her alien shaft deliciously hard.");
		output("\n\nEverything else in the world is wiped away by exquisite molten release. You feel your Mistress’s " + xantheCock() + " shooting twin streams of her sticky alien seed deep into your");
		if(pc.hasVagina() && !pc.isPregnant(x)) output(" fertile womb");
		else if(pc.hasVagina()) output(" pregnant pussy"); 
		else output(" naughty ass");
		output(". You’re soon filled to the brim with her silky warmth, feeling fulfilled in so many ways.");
	}
	// PC sings ‘let it go’ from Frozen right about here.
	output("\n\nWhen your Mistress finally pulls out of you and lovingly undoes your binds, you’re so enraptured in your subspace that you don’t realize what’s happening. You’re simply floating in your own private bliss-filled universe as you’re slowly laid down in the nearby bed, wrapped in a blanket, and held tight until you finally come back down from your endorphin high.");
	output("\n\nThe first sensation that returns to you is that of your Mistress’s arms tightly wrapped around you and your [pc.hair] being gently stroked. You nuzzle into the warmth and smell of fresh rain that is obviously her. Soon you can feel your body shiver and tremble spasmodically from the following emotional and physical crash.");
	output("\n\n<i>“There there, pet, it’s okay. You’re safe and in my arms.”</i> Her husky, reassuring words fill your heart with an indescribably intense and heart wrenching sense of love. It’s not long before you fall into the most incredibly deep sleep in her arms.");
	
	//days += 3;
	pc.createStatusEffect("Cum Paused");
	pc.createStatusEffect("Milk Paused");
	processTime(30 + (60 * 24 * 3));
	clearMenu();
	addButton(0,"Next",goodGodJimTLetItEndXantheStrappedUp);
}

public function goodGodJimTLetItEndXantheStrappedUp():void
{
	clearOutput();
	//showXanthe();
	showName("XANTHE’S\nSEX DUNGEON");
	author("JimThermic");
	output("<b>...The next day...</b>");
	output("\n\nWhen you wake up, get dressed, and leave the dungeon, you feel like the last four days were some wonderful dream. Your body aches all over, yet you’re filled with an ongoing high and a slight skip in your step.");
	processTime(1320);
	pc.removeStatusEffect("Cum Paused");
	pc.removeStatusEffect("Milk Paused");
	pc.orgasm();
	flags["XANTHE_MATED"] = 1;
	sleepHeal();
	// End Scene.
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].northExit);
}

//Pays Attention
public function shePaysAttentionToYouSlut():void
{
	clearOutput();
	showXanthe();
	output("You beg with all your heart and soul, trying to show her just how much you want her to play with you. Deep down, you know your pleading makes no difference - your Mistress will do what she wants to do with you.");
	output("\n\nStepping back, she walks around and runs her fingers teasingly down your spine. The gentle grazing of your [pc.skinFurScales] causes you to shiver with delight. Even the tiniest of her touches plays you like an instrument.");
	output("\n\n<i>“...I think I’ll turn you into my beautiful living canvas today.”</i> Xanthe leans in and kisses at the side of your neck. She sucks on the nape and then bites it, leaving a pointed kiss-sized bruise. <i>“I’m going to leave my marks on you. That way, when you’re travelling about, everyone will know who you REALLY belong to.”</i>");

	output("\n\nThe thought of being possessively marked makes your [pc.legsNoun] quiver with delight. You want to be claimed, to be totally <i>owned</i> by her. People should know who you belong to, both in body and mind.");

	output("\n\nYou tell your Mistress as much, and she gives you a rewarding little bite on your earlobe. <i>“Indeed, I take care of my pets. Each mark I leave on your [pc.skin] is a sign that I love you, dearest, don’t you forget it.”</i>");
	//if (pc.hasBreasts = true || pc.hasCock = true} or (pc.hasLegs > 1 && pc.hasPussy = true)
	if(pc.biggestTitSize() >= 1 || pc.hasCock() || (pc.legCount > 1 && pc.hasVagina()))
	{
		output("\n\nYour Mistress then begins weaving some of her special silk and forming soft ropes in her multi-fingered hands. You watch on as she makes ample amounts of twine in front of you.");
		output("\n\n<i>“Are you wondering what this is for, my pet?”</i> She asks in her husky voice. There’s a glimmering in her bright blue eyes as she holds you captive and in delicious anticipation.");
		output("\n\nYou nod and she leans in with the thread held in both hands. Draping it over your neck like a medal chain, she tugs it down and gives you a long, passionate kiss. When she pulls away, she tugs it pointedly.");

		//if (pc.hasBreasts = true && pc.hasCock = false)
		if(pc.biggestTitSize() >= 1 && !pc.hasCock())
		{
			output("\n\n<i>“...It’s for binding your [pc.fullChest], and making them especially pretty.”</i> Your Mistress informs you. She then begins meticulously weaving the soft cord around one.");
			output("\n\nIf you weren’t already swooning from her kiss, you’d be doing so at her promise to make you even more pretty. Your Mistress complimented your [pc.breasts], though indirectly. When she pulls it tight, you let out a sharp gasp.");
			output("\n\n<i>“Do you know what happens to your [pc.breastsNoun] when I do this, my love? Blood rushes into them and they become especially sensitive.</i> Xanthe caresses your now ballooned breast, bound tight by her silk rope right against your chest. You can feel it squeezing into your sensitive [pc.skinFurScalesNoun], though not enough to <i>completely</i> cut off circulation.");
			output("\n\nLooking down, you marvel at how <i>round</i> your breast has become. Your [pc.nippleNoun] is jutting out as the blood rushes to it, just as she promised. The slightest caress by her fingers causes you to let out a pleasured whine as you positively melt.");
			output("\n\n<i>“That’s just part of the entree, dear, we haven’t even started the main course.”</i> Xanthe tsks and ");
			output("begins binding up your other breast");
			if(pc.totalBreasts() > 2) output("s");
			output(". By the time she’s finished ");
			if(pc.totalBreasts() == 2) output("both");
			else output("all");
			output(" of them are tightly bound and linked by the silken thread around your neck.");
		}
		//else if (pc.hasCock = true && pc.hasBreasts = false)
		else if(pc.biggestTitSize() < 1 && pc.hasCock())
		{
			output("\n\n<i>“...It’s for binding your [pc.cocksNounSimple] ");
			if(pc.balls > 0) output(" and [pc.ballsNoun]");
			output(", and making ");
			if(pc.balls == 0 && pc.cockTotal() == 1) output("it");
			else output("them");
			output(" especially pretty.”</i> Your Mistress informs you. She then begins meticulously weaving the soft cord around your [pc.cockColor] genitals.");
			output("\n\nYou’re both swooning from her kiss and flushing deeply at her promise to make your soon-to-be-bound junk ‘pretty’. When she loops it around your ");
			if(pc.cocks[0].thickness() < .75) output("tiny");
			else if(pc.cocks[0].thickness() < 1.5) output("modest");
			else output("girthy");
			output(" base and pulls it tight, you let out a sharp gasp.");
			output("\n\n<i>“Do you know what happens to your rod when I do this, my love? Blood rushes into it, and you’ll become incredibly erect and sensitive.”</i> Xanthe caresses your now collared cock. You can feel it squeezing into your sensitive flesh, though not enough to <i>completely</i> cut off circulation.");
			output("\n\nLooking down, you marvel at how <i>big</i> your [pc.cock] has quickly become. It is truly jutting out as the blood rushes to it, just as she promised. The slightest caress by her fingers along your length causes you to let out a pleasured whine.");
			output("\n\n<i>“That’s just part of the entree, dear, we haven’t even started the main course.”</i> Xanthe tsks and begins binding up the rest of your [pc.cocksNounSimple]");
			if(pc.balls > 0) output(" and [pc.ballsNoun]");
			output(". By the time she’s finished ");
			if(pc.cockTotal() == 1 && pc.balls == 0) output("it");
			else output("they");
			output(" are mummified in her tightly constricting silk. It’s connected to a loop around your neck, the slightest tug of which deliciously squeezes your junk.");
		}
		//else //if (pc.hasCock = true && pc.hasBreasts = true)
		else if(pc.hasCock() && pc.biggestTitSize() >= 1)
		{
			output("\n\n<i>“...It’s for binding your [pc.breastsNoun]");
			if(pc.balls > 0) output(", ");
			else output(" and ");
			output("[pc.cocksNounSimple]");
			if(pc.balls > 0) output(", and [pc.ballsNoun]");
			output(", to make them especially pretty.”</i> Your Mistress informs you. She then begins meticulously weaving the soft cord around one breast.");
			output("\n\nIf you weren’t already swooning from her kiss, you’d be doing so at her promise to make you even more pretty. Your Mistress complimented your [pc.breastsNoun], though indirectly. When she pulls it tight, you let out a sharp gasp.");
			output("\n\n<i>“Do you know what happens to your [pc.breastsNoun] when I do this, my love? Blood rushes into them and they become especially sensitive.”</i> Xanthe caresses your now ballooned breast, bound tight by her silk rope right against your chest. You can feel it squeezing into your sensitive [pc.skinFurScalesNoun], though not enough to <i>completely</i> cut off circulation.");
			output("\n\nLooking down, you marvel at how <i>round</i> your breast has become. Your [pc.nippleNoun] is jutting out as the blood rushes to it, just as she promised. The slightest caress by her fingers causes you to let out a pleasured whine as you positively melt.");
			output("\n\n<i>“That’s just part of the entree, dear, we haven’t even started the main course.”</i> Xanthe tsks and once she’s finished wrapping your other breast");
			if(pc.totalBreasts() > 2) output("s");
			output(", begins binding up your [pc.cocksNounSimple]. Doing so makes ");
			if(pc.cockTotal() == 1) output("it");
			else output("them");
			output(" become incredibly hard and jut out, looking just as lewd as your tits.");
			output("\n\nBy the time she’s finished, both your [pc.breasts] and [pc.cocks] are tightly constricted with her silk, with both connected to a loop connected around your neck. The slightest tug of your head backwards causes it to deliciously tug at both your girls and your junk.");
		}
		//if (pc.sex = female && pc.hasBreasts = false && pc.hasLegs !>= 1)
		if(pc.hasVagina() && pc.biggestTitSize() < 1 && pc.legCount > 1)
		{
			output("\n\n<i>“It’s for weaving between your legs and against your cute [pc.pussyColor] pussy. Let me show you.”</i> Your Mistress informs you. She then drapes the silky cord down your belly and between your [pc.thighs].");
			output("\n\nIf you weren’t already swooning from her kiss, you’d be doing so at her complimenting your [pc.pussy]. When she threads it around and gives it a tight tug, the soft cord slides between your pussy lips and you let out a sharp gasp.");
			output("\n\nOnce she’s finished doing you up, the silk rope is tied to your neck, running between your thighs and attached to a hook behind you on the floor.");
			if(pc.hasClit()) output(" Even the slightest head movement causes it to gloriously rub against your [pc.clits] and makes you swoon with pleasure.");
		}
	}
	output("\n\nYou are then robbed of your sight when a silky blindfold is thrown over your eyes. Engulfed in darkness, each and every tactile sensation and noise intensifies. You acutely feel and hear the fabric as it tightens against your [pc.skinFurScales]. A ball gag soon follows, depriving you of speech.");
	output("\n\nThe cold of the dungeon clashes with the heat of your cheeks and ");
	if(pc.hasCock()) output("bound up ");
	output("loins. With your arms and [pc.legOrLegs] restrained and your senses taken from you");
	if(!pc.isNude()) output(" - not to mention your clothes -");
	else output(",");
	output(" you really are at her mercy. That thought gets you all hot and bothered, and you wiggle with delighted pleasure");
	if(pc.biggestTitSize() >= 1 || pc.hasCock())
	{
		output(" - tugging at your tied up ");
		if(pc.biggestTitSize() >= 1 && !pc.hasCock()) output("[pc.breasts]");
		else if(pc.biggestTitSize() < 1 && pc.hasCock()) output("[pc.cocksLight]");
		else if(pc.biggestTitSize() >= 1 && pc.hasCock()) output("[pc.breastsNoun] and [pc.cocksNounSimple]");
	}
	else if(pc.hasClit()) output(" - grinding and stimulating your [pc.clits] in the process");
	output(".");

	output("\n\n<i>“If only people could see you now - [pc.fullName], the young scion of the Steele financial empire, bound and gagged in my dungeon as my submissive little ");
	if(!pc.hasVagina()) output("butt");
	output("slut.”</i> Your Mistress’s husky voice comes from just behind your ear, causing the [pc.skinFurScales] on your back to tingle with delight.");

	pc.changeLust(30);
	processTime(20);
	//[Not A Slut!] [Totally A Slut]
	clearMenu();
	addButton(0,"Not A Slut!",notASlutXanthe);
	addButton(1,"TotallySlut",yesXantheImTotesMyGoatsASlut);
}

// Not A Slut
public function notASlutXanthe():void
{
	clearOutput();
	showXanthe();
	output("You object to her calling you a slut! Making cute grumpy noises through your ball gag, you wiggle about and try to show your displeasure.");
	output("\n\nA loud <i>cracking</i> noise fills the air and soon you feel a delicious stinging sensation spreading through one of your [pc.skinColor] asscheeks. Your Mistress just spanked you!");
	output("\n\n<i>“...You’re </i>not<i> a slut? I guess it must be some </i>other<i> [pc.raceBoyGirlShort] that asked me to strip [pc.himHer] naked, tie [pc.himHer] up, and have my way with [pc.himHer], then.”</i> Xanthe teases you, all the while lavishing another stinging spank on your [pc.butt].");
	output("\n\nEach crack causes your whole body to arch and your head to instinctively loll back");
	if(pc.biggestTitSize() >= 1 && pc.hasCock()) 
	{
		output(", in turn pulling at your ");
		if(pc.hasCock()) 
		{
			output("[pc.cocksNounSimple]");
			if(pc.biggestTitSize() >= 1) output(" and ");
		}
		output("[pc.breastsNoun]");
	}
	else if(pc.legCount > 1 && pc.hasClit()) output(", in turn deliciously rubbing your [pc.clits]");
	else output("in pleasure");
	output(". You let out a raspy moan then immediately flush, knowing it doesn’t help your case.");
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",slutNotASlutEpilogue);
}

// Totally A Slut
public function yesXantheImTotesMyGoatsASlut():void
{
	clearOutput();
	showXanthe();
	output("You shiver with delight at her words. Whatever you thought yourself before, her words cause a brimming happiness to well up from inside of you. You are Xanthe’s subby little ");
	if(!pc.hasVagina()) output("butt ");
	output("slut, aching to be tied up and teased by your beloved Mistress. This is your true calling!");
	output("\n\nYou rapturously moan into your ball gag, aching to be demeaned even more. You stick your [pc.ass] out lewdly, showing her just how much you love her words.");
	output("\n\nA loud <i>cracking</i> noise fills the air and soon you feel a delicious stinging sensation spreading through one of your [pc.skinColor] asscheeks. Your Mistress just spanked you!");
	output("\n\n<i>“...Oh, you </i>like<i> being called a slut? Make sure you remember that you’re</i> my<i> property. Even as you’re sucking down some spacer’s spunk or burying your face in some bitch’s pussy, don’t forget who you </i>really<i> belong to.”</i> Xanthe reminds you, all the while lavishing another stinging spank on your [pc.butt].");
	output("\n\nEach crack causes your whole body to arch and your head to instinctively loll back");
	if(pc.biggestTitSize() >= 1 && pc.hasCock()) output(", in turn pulling at your [pc.cocks] and [pc.chestNoun]");
	else if (pc.legCount > 1 && pc.hasClit()) output(", in turn deliciously rubbing your [pc.clits]");
	else output(" in pleasure");
	output(". You let out a raspy moan, knowing deep down that you are definitely her special property.");
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",slutNotASlutEpilogue);
}

// MERGE
public function slutNotASlutEpilogue():void
{
	clearOutput();
	showXanthe();
	output("Your vulnerable [pc.skinColor] butt is spanked and slapped over and over until it is filled with a tingling, penetrating warmth that fills it up entirely. The most pain you feel is a slight stinging sensation on impact that spreads out across your battered asscheeks, making them tingle with delicious feelings.");
	output("\n\nJust knowing that your [pc.ass] now looks nice and marked due to her attentions causes your ");
	if(pc.hasVagina()) 
	{
		output("[pc.vaginas] to get all wet");
		if(pc.hasCock()) output(" and your ");
	}
	if(pc.hasCock()) output("constrained [pc.cocks] to stiffen");
	if(!pc.hasCock() && !pc.hasVagina()) output("[pc.nipples] to stiffen");
	output(". You moan into the ballgag - being blindfolded and not knowing when she’ll strike makes you that much more excited!");

	output("\n\nJust when your rump is reaching its limit, your Mistress runs her fingernails down your naked back. You tremble with pleasure and arch into her caress as much as you can. She then pulls away, and a few seconds later you feel a lash of a flogger licking at your shoulder blades.");

	output("\n\nAt first you let out a yelp of surprise, followed by a cry of pleasure. Each lash only briefly stings before filling your back with a delicious tingling sensation. Each mark is a sign of your Mistress’s love for you, and you are happy for your [pc.skinFurScales] to be used as her living canvas.");

	output("\n\nThe next half hour your back, buttocks, and ");
	if(pc.biggestTitSize() >= 1) output("bound up breasts");
	else output("chest");
	output(" are assaulted with her soft and hard floggers, paddles, and crops.");
	if(pc.biggestTitSize() >= 1 || pc.hasCock() || pc.hasClit())
	{
		output(" Each crack in turn caresses your captured ");
		if(pc.biggestTitSize() >= 1) output("chest");
		else if(pc.hasCock()) output("[pc.cocksNounSimple]");
		else if(pc.hasClit()) output("[pc.clits]");
		output(" and you reel with dizzying pleasure.");
	}
	output(" Every now and then she stops to tease your back with her fingers or a feather, catching you completely off guard.");

	output("\n\n<i>“I think that’s enough marking, my beautiful pet. Perhaps ONE more to make sure they know you’re mine.”</i> As you brace yourself for one more lash, your neck is deliciously seized in her luscious lips and suckled upon - and she leaves a large hickey just below your [pc.ear]! <i>“...There! How about I finish you off?”</i>");

	output("\n\nIt’s a rhetorical question, though you still feverishly nod, eager to take whatever she has to give you! Meanwhile, your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" quaking so hard that you’re entirely supported by your wrist binds - you’re sure that once she undoes them you’ll simply fall into a gooey mess.");
	output("\n\nYou can hear the squirting of a bottle followed by another strange sound. It’s not long before a cool, lube covered object is being slid between your buttocks and pressed against your [pc.asshole]. <i>“Relax, my love, and let it go inside of you.”</i>");
	output("\n\nOnce you consciously unclench your rectum, you are immediately rewarded with the sensation of what feels like a single slick sphere passing through your pucker and into your butt. You let out a muffled moan as it sweetly slides inside of you, massaging and caressing your back passage in all the right places.");
	output("\n\n<i>“That’s one, we’ve got quite a few more to go.”</i> Your Mistress sinfully promises you, and your penetrated posterior wiggles with delight. One after another, lube-filled orbs penetrate and push deep into your derriere. With the blindfold on, all you can focus on is the texture of those glorious spheres sliding into your rump!");
	pc.buttChange(8);

	output("\n\nYour ");
	if(pc.hasCock()) 
	{
		output("pre-cum liberally drools into her silky bindings and you stain them with your spunk.");
		if(pc.hasVagina()) output(" Meanwhile, your ");
	}
	if(pc.hasVagina()) output(" feminine juices dribble down your [pc.thighs] and coat them in your girlish warmth.");
	if(!pc.hasCock() && !pc.hasVagina()) 
	{
		output("[pc.legOrLegs] quake");
		if(pc.legCount != 1) output("s");
		output(" as you struggle to contain the coiling pleasure within.");
	}
	output(" When they’re all inside of you, you finally relax your keister and let out a pleasured sigh.");

	output("\n\nYour guard is let down too soon, however. There is a noise like a bicycle pump being used, and suddenly the line of balls in your ass begin swelling and expanding!");

	output("\n\n<i>“They’re </i>inflatable<i> anal beads, my dear. I’m going to fill you up until you feel like you’re being fucked by a conga line of Ausar cocks,”</i> your Mistress informs you. You bite down on your gag and let out a sweet cry, feeling as if you’re being knotted by a dozen canine cocks!");
	pc.buttChange(250);

	output("\n\nWith each pumping noise the inside of your [pc.ass] is impossibly swelled out and you whimper with delight. It’s not long before you feel the sensation of floating off, and with the final pump you’re pushed right over the edge. Suddenly you’re cumming impossibly hard and ");
	if(pc.hasCock())
	{
		output("spilling your [pc.cum]");
		if(pc.hasVagina()) output(" and ");
	}
	if(pc.hasVagina())
	{
		if(!pc.hasCock()) output("spilling your ");
		output("[pc.girlCum]");
	}
	if(pc.hasCock() || pc.hasVagina()) output(" everywhere.");
	else output("trembling the entire time in your binds.");
	pc.buttChange(600);

	output("\n\nOrgasming for what seems like forever, you don’t even register as your Mistress cleans you off and undoes your binds. You’re simply floating in your own private bliss-filled universe as you’re slowly laid down in the nearby bed, wrapped in a blanket, and held tight until you finally come back down from your endorphin high.");

	output("\n\nThe first sensation that returns to you is that of your Mistress’s arms tightly wrapped around you and your [pc.hair] being gently stroked. You nuzzle into the warmth and smell of fresh rain that is obviously her. Soon you can feel your body shiver and tremble spasmodically from the following emotional and physical crash.");

	output("\n\n<i>“There there, pet, it’s okay. You’re safe and in my arms.”</i> Her husky, reassuring words fill your heart with an indescribably intense and heart wrenching sense of love. It’s not long before you fall into the most incredibly deep sleep in her arms.");
	pc.createStatusEffect("Cum Paused");
	pc.createStatusEffect("Milk Paused");
	processTime(55);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",epilogueToInflatibleXanthPlugs);
}

public function epilogueToInflatibleXanthPlugs():void
{
	clearOutput();
	//showXanthe();
	showName("XANTHE’S\nSEX DUNGEON");
	author("JimThermic");
	output("<b>The next day...</b>");
	output("\n\nWhen you wake up and get dressed, you take a moment to look in the nearby mirror at your front and back. The marks that your Mistress has left on your body makes your heart skip with delight, not to mention that sweet one right on your neck. You feel well and truly owned!");
	processTime(1335);
	//Rest lust shortly before leaving.
	pc.orgasm();
	processTime(100);
	pc.removeStatusEffect("Cum Paused");
	pc.removeStatusEffect("Milk Paused");
	flags["XANTHE_MATED"] = 1;
	sleepHeal();
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].northExit);
}

//Spend Time
// Pick one of these sentences at random.
public function spendTimeWithXantheYouSlut():void
{
	clearOutput();
	showXanthe();
	output("You spend some time ");
	if(rand(4) == 0) 
	{
		output("worshipping Xanthe’s body, prostrating yourself before her and licking her feet. Afterwards your Mistress tells you that you’ve done a good job, and you feel fulfilled.");
		pc.exhibitionism(1);
	}
	else if(rand(3) == 0) output("snuggled up to Xanthe hearing about her day. You’re glad that your Mistress felt it was worth sharing with you.");
	else if(rand(2) == 0) output("putting stock on the shelves for Xanthe while she sews some new ones. Afterwards, she rewards you with a pat on the head!");
	else 
	{
		output("modelling off Xanthe’s new clothes while customers stare at you. Your Mistress uses you as a living mannequin!");
		pc.exhibitionism(2);
	}

	// Four hours is spent.
	// Only RP benefit, though there may be others in the future depending on if she’s popular or not.
	processTime(244);
	pc.energy(Math.round(pc.energyMax()));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Nothing
public function nothingWithXantheTodayBadumTish():void
{
	clearOutput();
	showXanthe();
	output("Your Mistress doesn’t get you to do anything too hard today, nor does she give you any form of discipline either. She’s so cruel!");
	output("\n\nWalking away frustrated and pent up, you find yourself biting your lip. Surely your Mistress will give you her particular attentions sooner or later?");
	processTime(10);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Xanthe
// An approach. Occurs when Xanthe is Domming PC and they enter the store.
// Conditions: if(xantheIsDommingPC()
//Gifting Scene

public function getXanthesPantiesSloot():void
{
	showXanthe(true);
	author("ASpoopyGhost");
	output("\n\nAs you step into the store, you walk to the counter to find an utterly naked Xanthe standing there. Seeing your Mistress completely naked from head to toe–her full blue bosoms and dark nipples pointing out–and her slit-like sexes nestled between her thick alien thighs is utterly mind-blowing. Not worthy of such an exquisite sight, you get down ");
	if(pc.hasKnees()) output("on your knees");
	else output("on the ground");
	output(" instantly and bow your head, not sure if you should look! Your heart is racing as you still picture the sight of her wonderfully naked form that is now practically burnt into your mind, a treasured gift that she has decided to give to you.");

	output("\n\n<i>“My dear, if I did not want you to see me naked, I would not </i>be<i> naked,”</i> Xanthe sultrily informs you in her rich, husky voice. Step by step–and there’s a lot of steps–she saunters towards you, brazen and naked. It’s so admirable how <i>confident</i> she is naked, like a goddess clad in nothing but her own aura of authority. <i>“I have for you a gift, since you’ve been such a good " + pc.mf("boy","girl") + ". Put out your hands.”</i>");

	output("\n\nObediently and instinctively, you put out your hands, flat with palms up. Since she said you could look, you look upwards, but you’re utterly spellbound by her pendulously large breasts right before your eyes. If your heart wasn’t racing enough, your Mistress said she was going to give you a gift. What in the galaxies could it be?");
	output("\n\nYour Mistress seemingly pulls a small, silky bundle out of nowhere and deposits it in your hands. It feels ultra-smooth; definitely crafted from her own siel silk and hands. You tremble because you already know it’s a very important gift, something she’s made herself. She reaches out and strokes the top of your head. <i>“Open it. Don’t you want to see what it is?”</i>");
	output("\n\nYou definitely do! With a gulp, you unfoil the tiny bundle. You’re riveted when you realize it’s a pair of silky lace panties, but not just <i>any</i> pair. You’ve seen your Mistress often enough to know what she regularly wears, every artifact of clothing right down to her silky stockings. These are <i>her</i> panties, your Mistress’s panties, and she’s giving them to you! You clutch them to your chest, overwhelmed with emotion. You don’t even know what to say.");
	output("\n\nYour Mistress, of course, can read you like a book, stroking your cheek. <i>“Now, dear, understand this. Those panties are for you to masturbate with when you’re away from me. You are not to pleasure yourself from now on without using my panties, understood? It is only your Mistress who gives you pleasure, so only my panties can get you off, because they have touched my skin and nethers. Do you understand?”</i>");
	output("\n\nYou nod feverently. You can’t wait to masturbate with Mistress Xanthe’s panties, which have touched her exquisite sex. It will be the next best thing to having the honor of making love to her and giving her pleasure, and by the sounds of things, knowing that you’re using her panties will give her pleasure as well.");
	output("\n\n<b>You have acquired Mistress Xanthe’s panties!</b>");
	processTime(10);
	pc.changeLust(10);
	pc.createKeyItem("Panties - Xanthe's - Lacy, black siel-silk panties.");
	pc.removeStatusEffect("XanthePanties");
	clearMenu();
	addButton(0,"Next",xantheMenu);
}
/*
New Clothing / Undergarments

// All of these are copy-pasted out of the Ben/Bess file. Figured as a vendor, this would give the PC an opportunity to buy this stuff as well. 

// Was going to refer to Siel silk in all of them, but it came off a little odd so I took it out.
// Some of the anime items may come off as silly, though Xanthe does like this sort of thing. Depending on your level of anime tolerance there may be gagging involved. If it's too much, cut without remorse.

New Clothing / Armor

Armor Items

Battle Ballgown

public function BattleBallgown()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "BattleBallgown";
this.longName = "battle ballgown";
this.description = "a dazzling battle ballgown";
this.tooltip = "This is a 'Battle Ballgown' modelled after those worn by the Knights of The Holy Cups, a fictional order in a TV series. It consists of a resplendent dress with an armored breastplate, skirting, and arms. The armor is made of a lightweight space-age metal making for easy movement. The dress itself is woven from premium siel silk and fracton weave.";
this.basePrice = 5000;
this.attack = 2;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 5;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 0;
this.critBonus = 0;
this.evasion = 2;
this.fortification = 0;
this.bonusResistances = new Array(0.2, 0.2, 0.2, 0, 0, 0, 0, 0);

Battle Maid Outfit
public function BattleMaidOutfit()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "BattleMaidSuit";
this.longName = "battle ready maid outfit";
this.description = "a maid outfit designed for battle";
this.tooltip = "This is a Battle Maid Outfit modelled after those worn by the heroine in "Magika Maid Mayhem", a popular terran anime series. While it looks like a maid outfit with plate armor attached, quite a lot of thought has gone into its design by Xanthe to make it.

Each piece of fabric is made of a meticulously made siel silk and fracton weave, giving it incredible durability. The torso, skirting, shoulders, arms, and leggings are all made of a space-age metal. Perfect for any maid who needs to be tactically inserted into battle.";
this.basePrice = 5000;
this.attack = 2;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 5;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 0;
this.critBonus = 0;
this.evasion = 2;
this.fortification = 0;
this.bonusResistances = new Array(0.2, 0.2, 0.2, 0, 0, 0, 0, 0);

Reinforced Bodysuit
public function ReinforcedBsuit()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "ReinforcedBsuit";
this.longName = "reinforced bodysuit";
this.description = "a shiny silver and black bodysuit";
this.tooltip = "This snug fitting bodysuit is far more protective than it looks. On first glance it looks like silver and black latex skin tight suit, complete with a small leather jacket. In actual fact it is made from a highly dense siel silk and fracton weave.";
this.basePrice = 4000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 5;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 2;
this.fortification = 0;
this.bonusResistances = new Array(0.1, 0.1, 0.1, 0, 0, 0, 0, 0);



Clothing Items


Sleep Shirt
public function SleepShirt()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "SleepShirt";
this.longName = "sleep shirt";
this.description = "a long, comfortable sleep shirt";
this.tooltip = "This is a long, comfortable sleep shirt that has a hem reaching down to the thighs. It is woven from the softest siel silk. Despite its simple design, it is comfortable and sexy to look at.";
this.basePrice = 800;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);


China Dress
public function ChinaDress()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "ChinaDress";
this.longName = "china dress";
this.description = "a body hugging, one-piece Chinese dress";
this.tooltip = "This body hugging, one-piece Chinese dress (also known as a "cheongsam") is made from thinly woven siel silk. With a high collar, short sleeves, and knee length skirt, it is very eye catching - especially the split on either side trailing up the thigh. 
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Female Kimono
public function FemaleKimono()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "FemaleKimono";
this.longName = "kimono";
this.description = "an elegantly designed Japanese kimono";
this.tooltip = "This female kimono is designed of fine silk with brilliant patterns adorning every inch of fabric. It is worn with a specially designed waist sash or "obi". Those who wear this feel oddly spirited, as if channeling their inner geisha.";
this.basePrice = 1500;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 2;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);



Male Kimono
public function MaleKimono()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "MaleKimono";
this.longName = "kimono";
this.description = "a traditional Japanese kimono";
this.tooltip = "This male kimono is designed of tightly woven siel silk and is exquisitely crafted. It's truly indistinguishable from the ones featured in terran samurai movies. Those who wear this feel oddly spirited, as if channeling their inner warrior.";
this.basePrice = 1500;
this.attack = 0;
this.damage = 2;
this.damageType = GLOBAL.PIERCING;
this.defense = 2;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 0;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Yukata
public function Yukata()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "Yukata";
this.longName = "yukata";
this.description = "a vividly colored yukata";
this.tooltip = "This yukata or 'summer kimono' is thin and designed to be worn either in hot weather or around the home. It is woven from the finest siel silk.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Short Kimono
// Useful for those who want a kimono plus some push up skirt & sex action.
public function ShortKimono()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "ShortKimono";
this.longName = "short kimono";
this.description = "a short silk kimono";
this.tooltip = "This is a fetishized kimono made of siel silk that only reaches down to the mid thigh. It is worn with a specially designed waist sash or "obi". Often worn by female ninjas in terran samurai movies. Those who wear this feel as if they channel their inner kunoichi."";
this.basePrice = 2000;
this.attack = 2;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 2;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Ninja Outfit
public function Ninja()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "NinjaOutfit";
this.longName = "ninja outfit";
this.description = "a sexy ninja outfit";
this.tooltip = "This ninja outfit is the perfect mixture of stealth and sex appeal. The upper half consists of a tight mesh shirt and a black jacket with overlapping lapels. The jacket is both bound low and pulled tight with an obi belt, giving proper emphasis to the chest. It has a pair of black hakama pants, protective arm sleeves, and tabi boots. Those who wear this feel as if they channel their inner ninja.";
this.basePrice = 2000;
this.attack = 2;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 2;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);


Miko Outfit

public function Miko()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "MikoOutfit";
this.longName = "miko outfit";
this.description = " a white and red Miko outfit";
this.tooltip = "This is a Japanese Shrine Maiden or "Miko" outfit. It consists of a white haori, red hakama, and white socks with sandals. Made from thinly woven siel silk.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Apron
public function Apron()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "SimpleApron";
this.longName = "simple apron";
this.description = " a simple cooking apron";
this.tooltip = "This is a simple cooking apron. Rather plain when worn with clothes and extremely sexy when worn without them.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Seifuku
public function Seifuku()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "Seifuku";
this.longName = "japanese schoolgirl outfit";
this.description = " a simple cooking apron";
this.tooltip = "This is a japanese school girl outfit or 'seifuku'. It consists of a traditional blouse with a sailor style collar and pleated skirt. There is a ribbon tied just above the chest.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Gakuran
public function Gakuran()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "Gakuran";
this.longName = "male japanese school uniform";
this.description = " a male japanese school uniform";
this.tooltip = "This is a japanese male school uniform or 'gakuran'. It consists of a black long sleeve jacket with buttons, black slacks and polished shoes. The collar is high, and the first button is decorated with a school emblem. Underneath is a tight fitting white shirt. This outfit's sexiness depends on how it is worn.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Goth-Lolita Outfit
public function GothLolita()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ARMOR;
this.shortName = "GothLolita";
this.longName = "goth lolita outfit";
this.description = " a frilly goth lolita outfit";
this.tooltip = " This is a gothic lolita outfit. It consists of a very frilly black dress with white lace woven through the seams. There are lots of ribbons attached. Best worn with lots of makeup.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 5;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);



New Underwear (Top)

String Tie Top

public function StringTieTop()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "String Tie Top";
this.longName = "string-tie bikini top";
this.description = "A skimpy string-tie bikini top";
this.tooltip = "This is a skimpy string-tie bikini top, held in place by a looped knot at the small of the back. Two palm sized pieces of fabric cover the breasts - the rest is just string.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Frilly Bra
public function FrillyBra()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Frilly Bra";
this.longName = "frilly bra";
this.description = "frilly bra";
this.tooltip = "This frilly bra is made of ultra elastic siel silk that breathes well. Perfect for showcasing one's assets.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

White Bra
// Aware that colors are not usually mentioned, but the "white panties" and "black lace underwear" are almost sub-fetishes of underwear fetishism. I know because it's my kink and I'm trying to slip it in here. :) Cuz pure whites/black lace + maid/seifuku = win.
public function WhiteBra()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "White Bra";
this.longName = "white bra";
this.description = "white bra";
this.tooltip = "A nice, plain pure white bra, made of soft form-fitting siel silk. Elegant in its simplicity.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Striped Bra
public function StripedBra()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Striped Bra";
this.longName = "striped bra";
this.description = "striped bra";
this.tooltip = " A striped bramade of soft form-fitting siel silk. The stripes do a lot to enhance the bust.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
Furry Bra
public function FurryBra()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Furry Bra";
this.longName = "furry bra";
this.description = "furry bra";
this.tooltip = " A furry bra made of fake animal hide. It gives a very tribal "cave girl" look when worn. Good for showing off your primal side.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);


Black Lace Bra
// See "White Bra" for comment. 

public function BlackLaceBra()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Black Lace Bra";
this.longName = "black lace bra";
this.description = "a black lace bra";
this.tooltip = "A sexy black lace bra. This kind of underwear has a sensual, mature, and risque feel to it.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);


Sarashi
public function Sarashi()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Sarashi";
this.longName = "sarashi";
this.description = "a sarashi";
this.tooltip = "A chest cloth binding known as a "Sarashi", wrapped around the midsection. For women, it also binds the breasts close to the chest.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Muscle Shirt
public function MuscleShirt()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Muscle Shirt";
this.longName = "muscle shirt";
this.description = "a muscle shirt";
this.tooltip = "This muscle shirt is a tight top designed to hug every curve and contour of the wearer's muscles, showing them off in their adonic glory. It is pointedly snug around the biceps and abs.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Sports Singlet
public function SportsSinglet()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Sports Singlet";
this.longName = "sports singlet";
this.description = "a sports singlet";
this.tooltip = "This sports singlet is loose enough to allow the wearer to play most galactic sports, but tight enough to show off the muscle they gained doing it.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Patriotic Bra
// 'Murica.
public function PatrioticBra()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Patriotic Bra";
this.longName = "patriotic terran flag bra";
this.description = "A patriotic terran flag bra";
this.tooltip = "Those born on a Terran-Space Coalition colony or Earth itself have a lot of pride in the T.S.C flag. This bra is designed for those who always hold thoughts of home close to their heart.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);


Nipple Tassels (Underwear Top Slot)

Heart Shaped Nipple Tassels
public function HeartNippleTassels()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Heart Tassels";
this.longName = "heart-shaped nipple tassels";
this.description = "a set of red heart-shaped nipple tassels";
this.tooltip = "A set of sexy heart nipple tassels to attach to your chest. They barely cover the areolae and can be spun in circles with the right amount of skill.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Skull Nipple Tassels
public function SkullNippleTassels()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "Skull Tassels";
this.longName = "skull-shaped nipple tassels";
this.description = "a set of skull-shaped nipple tassels";
this.tooltip = "A set of sexy skull-shaped nipple tassels to attach to your chest. They barely cover the areolae and can be spun in circles with the right amount of skill.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Golden Nipple Tassels
public function GoldenNippleTassels()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "GoldenTassels";
this.longName = "golden nipple tassels";
this.description = "a set of golden nipple tassels";
this.tooltip = "A set of golden nipple tassels to attach to your chest. These are incredibly ornate, like those worn by a dancer for a sultan.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Clover Nipple Tassels
public function CloverNippleTassels()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "CloverTassels";
this.longName = "four leaf clover nipple tassels";
this.description = "a set of four leaf clover nipple tassels";
this.tooltip = "A set of four leaf clover shaped nipple tassels to attach to your chest. It's somebody's lucky day!";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Flower Nipple Tassels
public function FlowerNippleTassels()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "FlowerTassels";
this.longName = "flower-shaped nipple tassels";
this.description = "a set of flower-shaped nipple tassels";
this.tooltip = "A set of blossoming flower-shaped nipple tassels to attach to your chest. Seems something is definitely budding.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Star Nipple Tassels
public function StarNippleTassels()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "StarTassels";
this.longName = "star-shaped nipple tassels";
this.description = "a set of star-shaped nipple tassels";
this.tooltip = "A set of glittering star-shaped nipple tassels to attach to your chest. Definitely a stellar item.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Jeweled Nipple Tassels
public function JeweledNippleTassels()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "JewledTassels";
this.longName = "jeweled nipple tassels";
this.description = "a set of jeweled nipple tassels";
this.tooltip = "A set of jeweled nipple tassels to attach to your chest. For bringing attention to all the right places.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Black Nipple Tassels
public function BlackNippleTassels()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.UPPER_UNDERGARMENT;
this.shortName = "BlackTassels";
this.longName = "black nipple tassels";
this.description = "a set of round black nipple tassels";
this.tooltip = "A set of round black nipple tassels to attach to your chest. A time honored favorite.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 2;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);





New Underwear (Bottom)

String Tie Bottoms
public function StringTieBottoms()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "String Tie Bottoms";
this.longName = "string-tie bikini bottoms";
this.description = "A pair of skimpy string-tie bikini bottoms";
this.tooltip = "These are skimpy string-tie bikini bottoms, held in place by looped knots on each hip. Pulling them would cause this garment to quickly unravel.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Frilly Panties
public function FrillyPanties()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "Frilly Panties";
this.longName = "frilly panties";
this.description = "A pair of frilly panties";
this.tooltip = "These frilly panties are made of ultra elastic siel silk that breathes well. Very sexy when worn.";.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

White Panties
// See White bra.
public function WhitePanties()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "White Panties";
this.longName = "white panties";
this.description = "A pair of pure white panties";
this.tooltip = "Never underestimate the appeal of a pair of pure white panties. The subject matter of panty shots everywhere.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Striped Panties
public function StripedPanties()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "Striped Panties";
this.longName = "striped panties";
this.description = "A pair of striped panties";
this.tooltip = "A pair of striped panties that cling deliciously to the thigh. The stripes really show off the contours of the wearer's rump.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Lowrider Panties
public function LowriderPanties()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "Lowrider Panties";
this.longName = "lowrider panties";
this.description = "A pair of lowrider panties";
this.tooltip = "A pair of lowrider panties that barely cover the crotch and ass. If they were to slide down even an inch, something would be exposed.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Furry Panties

public function FurryPanties()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "Furry Panties";
this.longName = "furry panties";
this.description = "A pair of furry panties";
this.tooltip = "A pair of panties made of fake animal hide. They give a very tribal "cave girl" look when worn. Good for showing off your primal side.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);


Black Lace Panties
// See "White Bra" for comment. 


public function BlackLacePanties()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "BlackLacePanties";
this.longName = "black lace panties";
this.description = "A pair of black lace panties";
this.tooltip = "A pair of sexy black lace panties. This kind of underwear has a sensual, mature, and risque feel to it.";
this.basePrice = 700;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Patriotic Boxers
// 'Murica.
public function PatrioticBoxers()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "Patriotic Boxers";
this.longName = "patriotic terran flag boxers";
this.description = "A pair of patriotic, terran flag boxers";
this.tooltip = "Those born on a Terran-Space Coalition colony or Earth itself have a lot of pride in the T.S.C flag. These boxers are designed for those who want to fly the flag low as well as high.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Patriotic Panties
// 'Murica.
public function PatrioticPanties()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "Patriotic Panties";
this.longName = "patriotic terran flag panties";
this.description = "A pair of patriotic, terran flag panties";
this.tooltip = "Those born on a Terran-Space Coalition colony or Earth itself have a lot of pride in the T.S.C flag. These panties are designed for those who want to fly the flag low as well as high.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);


Skull Panties
public function SkullPanties()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "Skull Panties";
this.longName = "skull patterned panties";
this.description = "A pair of skull patterned panties";
this.tooltip = "These are the perfect set of panties for when you want to make a statement, but at the same time, you're not wearing any pants. Made of black fabric and littered with white skulls.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Skull Boxers
public function SkullBoxers()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "Skull Boxers";
this.longName = "skull patterned boxers";
this.description = "A pair of skull patterned boxers";
this.tooltip = "These are the perfect set of boxers for when you want to make a statement, but at the same time, you're not wearing any pants. Made of black fabric and littered with white skulls.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Black Silk Boxers
public function BlackSilkBoxers()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "BlackSilkBoxers";
this.longName = "black silk boxers";
this.description = "A pair of black silk boxers";
this.tooltip = "Nice and comfortable without losing its sensual edge. These black boxers look great on members of any sex.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Red Satin Boxers
public function RedSatinBoxers()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "RedSatinBoxers";
this.longName = "red satin boxers";
this.description = "A pair of red satin boxers";
this.tooltip = "This pair of red satin boxers is incredibly smooth and comfortable to wear. Goes great with the right satin bedspread.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);

Leather Boy Shorts
public function LeatherBoyShorts()
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.LOWER_UNDERGARMENT;
this.shortName = "LthrBoyShorts";
this.longName = "leather boy shorts";
this.description = "A pair of tight leather boy shorts";
this.tooltip = "This pair of tight leather boy shorts leaves very little to the imagination. It perfectly sculpts the wearer's ass and brazenly displays their junk, should they have any.";
this.basePrice = 1000;
this.attack = 0;
this.damage = 0;
this.damageType = GLOBAL.PIERCING;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 1;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
//




New Cum / GirlCum Type: Silk

Description: 

Qualities: Appears to have a silken reflective sheen. Fires and collects in thin liquid ropes. 
Color: Whitish silver.
Visc: Very soft feeling to the touch.
Flav: Rich, powerful flavor.

Adjectives: 
Silky
Shimmering
Glossy
Plush
Silken
Sleek
Glazed
Glistening
Gleaming
Polished
Sleek
Smooth
Gossamer

New Pussy Type: Siel Pussy

Colors: Steel Blue / Blue-gray / Dusky Blue.

Adjective List Below:
Y-lipped
Tri lipped
three fold
Siel
silk lined / silky


New Cock Type: Siel Cock

Details: Kept in a blue genital slit. Emerges when erect. Covered almost completely by lumpy, caterpillar like exterior (segmented muscles) with a small pink tip. Two meatus (cock holes) side by side.

Usually covered in siel silk on emergence.

Segmented
Lumpy
Muscle-ribbed
Caterpillar-like
Siel
*/

//INESSA EXPANSION
//Ask about Inessa

public function xanTalkAboutInessa():void
{
	clearOutput();
	author("Sen Kanashimi");
	showXanthe();
	
	output("You nod to Xanthe and rest yourself against the counter in front of the Siel woman, looking up into her electric blue eyes. <i>“I’d like to talk about Inessa.”</i>");
	output("\n\nXanthe’s expression turns from a soft smile to a wide grin in an instant, memories coming back to her. <i>“Ah my little sister, it has been so long since I last saw her... Such a delicate little flower, so sweet and naive, and oh so easy to tease...”</i> Her breasts quiver as a pleasurable shiver runs down the length of her caterpillar-like body.");
	output("\n\nYou find yourself staring for a moment before shaking your head, quirking an eyebrow. You query about their relationship, curious to know why she enjoys her sisters submissive nature.");
	output("\n\n<i>“Oh, Inessa and I are <b>just</b> sisters.”</i> She replies, giving you a coy smile that makes no attempt to hide her sarcasm. <i>“Perhaps from time to time I have... taken advantage of her submissive attitude, some binding, a bit of teasing here and there, but nothing more.”</i>");
	
	output("\n\nA soft chuckle escapes your [pc.lipsChaste] as your mind wanders off on the thought of Xanthe tying and teasing her sister. A prominent cough jogs you back to reality, Xanthe is staring down at you with an amused expression, her blue eyes sparkling in the light of the shopfront. <i>“So you’ve taken an interest in my sister, " + (xantheIsDommingPC() ? "my pet?" : (pc.mf("Mister","Miss") +" Steele?")) + "”</i> the Siel woman asks.");
	output("\n\nYou admit to be here for a reason and inform Xanthe about her sister’s predicament, explaining what Inessa had explained to you in Happy Tails. <i>“She lost the key and hasn’t been able to find it.”</i> You explain, Xanthe wears an amused expression with a near cheshire-grin. <i>“Good.”</i> She remarks.");
	output("\n\nYour [pc.eyes] must give away your confusion as Xanthe lets out an amused sigh, leaning back from the counter as if contemplating something. <i>“It is no surprise to me that Inessa is wearing a chastity belt.”</i> Xanthe says. <i>“Truth is the key is not lost, I have it right here.”</i> She reaches down below the counter to open up a drawer, retrieving a small golden key, the bow is shaped into a stylish curve reminiscent of a lock. <i>“I had it taken by a... Mutual friend, who also ensured the belt was locked.”</i>");
	output("\n\nYou tilt your head slightly and ask why she has the key to her sister’s belt all the way out here, eyeing the golden key with a tinge of want.");
	output("\n\nXanthes expression changes drastically, no longer any trace of her usually teasing demeanor, replaced entirely by a serious stare, her eyes almost piercing. <i>“To protect her, she is so naive that she would throw herself at any Dominant who walked through the door if they so much as whisper her to do so.”</i> She huffs and takes a breath, fiercely protective eyes giving way to a caring glow. <i>“I do not wish her harm, and so I protect her virginity from others until I deem someone worthy.”</i>");
	output("\n\nYou quip that she doesn’t seem to mind the idea of keeping her sister in chastity, to which she lets out a soft chuckle. <i>“This is true, I do so enjoy the teasing aspect, but that is not my main concern with Inessa.”</i> She places the key back into the drawer and straightens herself up against the counter once more.");
	output("\n\nYou thank Xanthe for the discussion and take your leave, a multitude of ideas running through your head by the time you leave the store.");
	
	flags["XANTHE_INESSA"] = 1;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ask about the key

public function xanTalkAboutKey():void
{
	clearOutput();
	author("Sen Kanashimi");
	showXanthe();

	output("You stand there for a few moments with the previous conversation running rampant in your mind before shaking your head, setting it aside for now as you step up to the counter.");
	output("\n\nXanthe must notice your difficulty focusing as the corners of her mouth turn up to a slight smile. <i>“Something on your mind "+ pc.mf("Mister","Miss") +" Steele?”</i> The mocking tone is almost palpable and you scrunch your nose up in response, she knows exactly what’s on your mind.");

	if(xantheIsDommingPC())
	{
		output("\n\n<i>“You said that you were keeping Inessa’s belt key until you found someone worthy.”</i> You recount, thinking back again to the previous conversation. <i>“How would I go about proving myself worthy of taking that key?”</i> Xanthe’s expression turns serious once more, her eyes looking you up and down, causing you to squirm beneath her domineering gaze.");
		output("\n\n<i>“My pet, you wish to become my sisters "+ pc.mf("Master","Mistress") +"? And what makes you think I would allow you to?”</i> You shiver and look up at your Mistress, giving the most pleading eyes you can, channeling your inner terran puppy. It seems to work as Xanthes stare devolves into an amused snicker and she leans forwards, planting a hand upon your head and tousling your [pc.hair].");
		output("\n\n<i>“Very well my dear, I will consider allowing it, on one condition.”</i> Your breath catches in your throat as she leans down closer, her face mere inches from your own. <i>“You must prove yourself capable of caring for my sister, as I do for you, then, and only then, will I give you the key, is that clear?”</i> You nod quickly and resume your breathing pattern, your [pc.skinColor] cheeks a bit more flushed from holding your breath.");
	}
	
	else 
	{
		output("\n\n<i>“You said that you were keeping Inessa’s belt key until you found someone worthy.”</i> You recount, thinking back again to the previous conversation. <i>“How would I go about proving myself worthy of taking that key?”</i> Xanthes expression turns serious once more, her eyes looking you up and down, examining your features.");
		output("\n\n<i>“You wish to become my sisters "+ pc.mf("Master","Mistress") +"? Interesting...”</i> You nod your confirmation and Xanthe ponders for a moment, seemingly mulling over ideas in her head. <i>“Before I decide, tell me something... What do you intend to do with my sister once she is free of her belt?”</i>");
		output("\n\n<i>“As you said before, she’s naive and vulnerable, she needs someone to protect her, and as it is you’re far too busy out here to help her all of the time.”</i>");
		output("\n\nXanthe seems to think over this even harder before raising her eyes to look into your own. <i>“I suppose you are right, although it will come with one catch, you must prove yourself a capable Dominant, and you must prove to me you know how to care for a submissive before I will allow it.”</i> Her tone remains serious, and you nod, prepared for the challenge to which Xanthe replies. <i>“Excellent.”</i>");
	}
	
	output("\n\nXanthe produces a small glob of silk from her silk sac and begins working on it, you turn to leave but a sharp click of her tongue causes you to freeze in place, standing there as she works on the silk, forming it into a thin sheet with a number of indentations, not unlike old earth braille, before bargain cybernetic replacements made it unnecessary. <i>“Give this to Inessa.”</i> Xanthe chimes. <i>“She will understand what it means.”</i> She straightens herself up and smiles. <i>“Is there anything else I can help you with?”</i>");
	output("\n\nYou shake your head and turn to actually leave this time, placing the silk panel in your pouch.");
	
	flags["INESSA_EXP"] = 1;
	pc.createKeyItem("Xanthe's Silk", 0, 0, 0, 0, "You’re supposed to give this to Inessa. She’ll supposedly know what it means.");
	output("\n\n<b>(Key Item Gained: Xanthe's Silk -</b> You’re supposed to give this to Inessa. She’ll supposedly know what it means.<b>)</b>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}