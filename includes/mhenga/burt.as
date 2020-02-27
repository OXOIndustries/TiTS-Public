//Burt
//NOTE: I really hate having to scroll through long pages in CoC, so I have broken scenes up in here with the occasional [Next] flag. If you don’t like the placement or breaks, feel free to adjust however you want.
//
// Flags:
// MET_BURT                     : PC Met Burt? Defined if the PC has.
// BURT_COLLECTABLE_SHOP        : PC Asked Burt about his shop. Defined if PC has.
// BURT_DRINKS_BOUGHT           : Number of drinks the PC has purchased from Burt
// BURT_MEAD_HALL_DISCUSSIONS   : Number of times PC has asked burt about his mead hall. Currently undefined -through- 3
// BURT_ZIL_TALK                : Number of times PC has asked burt about the zil. Currently undefined -through- 3
// TIMES_THREE_D_SURPRISE_SEXED : TODO - FIXME

public function burtsBarFunc():Boolean {
	//Add to Jungle Planet Bar Descriptor, Afternoon -> Closing
	if(myrOnMhenga()) output("\n\nYou notice several gold myr now count themselves amongst the mead hall’s patrons, and the smell of honey is thick and rich in the air.");
	if(flags["MET_BURT"] == undefined) addButton(0,"Bar",burtapproach);
	else addButton(0,"Burt",burtapproach);
	if(syriAtBurts())
	{
		if(pc.hasStatusEffect("Fuck Fever") && syriIsAFuckbuddy()) 
		{
			syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET();
			return true;
		}
		syriAtBurtsBonus(2);
	}
	//Syri has left the building
	else if (syriQuestRunning() && flags["SYRIQUEST_STATE"] == undefined) {
		syriQuestBurtsBlubt();
		return true;
	}
	roamingBarEncounter(3);
	
	// yoma can appear either by chance (if the PC fullfills the conditions) or will allways appear if told to wait
	if (pc.hasGenitals() && (yomaWaitingAtBurts() || (hours >= 12 && hours < 17  && yomaCanAppearAtBurts()))) yomaAtBurtsAddendum(4);

	addButton(1,"Watch Screen",stephIrsonBountHunterEpisodeOne,undefined,"Watch Screen","Watch an episode of Steph Irson: Galactic Hunter.");
	if (kaseAtBurts()) kaseAtBurtsAddendum(5);
	if(hours >= 8 && hours < 16) erikaBarAddendum(7);
	else if (biancaAtBar("mhen'ga") && biancaBarBonus(7)) return true; // short-circuiting, boye

	

	return false;
}

public function oilyButt():void
{
	output("\n\n");
	quickLoot(new OmegaOil());
}

public function burtapproach():void {
	if(flags["MET_BURT"] == undefined) {
		approachBurtFirstTime();
		flags["MET_BURT"] = 1;
	}
	else repeatBurtApproach();
}

//First Visit
public function approachBurtFirstTime():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("You approach the bar and get your first good look at the owner and namesake of Burt’s Badass Mead Hall, Burt himself. At first glance one can easily see that the term ‘Badass’ doesn’t just refer to his mead hall, but himself as well. He is every bit the stereotype of a rough and tough spacer on the edge of civilization.");
	output("\n\nHe stands just shy of seven feet tall, and has a frame that speaks of big bones and muscles earned through hard work and not vanity. His head is shaved bald, but his chiseled jaw bears a healthy five-o’clock shadow no matter what time of day it is. He has a healthy tan and a scar over his left ear. His dark brown eyes watch the room, flicking from patron to patron alert for any problems.");
	output("\n\nHe is dressed in a yellow and black checkered flannel, left open over a white tank-top that clings to the muscles of his chest. The pocket of the flannel has an old model Codex in it, as well as a grease pencil, with the Codex having more than a few black greasy marks on it, hinting that the bartender goes for the pencil more often than the technology. He has a bar apron wrapped around his waist, the black cloth having more pockets, one stuffed with an A.B.Curse " + (isAprilFools() ? "dogecoin" : "credit") + " tabulator, and the other holding a variety of bottle openers. Below the apron he wears a pair of combat pants, marked with the gray and tan square patches of various hues that implies that it was intended for urban use. You can’t see his shoes while he stands behind the bar, but the occasional thumps you hear as he moves about imply biker or combat boots.");
	output("\n\nHe glances up at you as he washes a tumbler out with one of the tails of his flannel shirt, raising a brow at you, <i>“Welcome to Burt’s Badass Mead Hall, stranger. I’m Burt, the owner and bartender. Ya need anything to wet your whistle, just let me know.”</i> He sets down the glass and grins at you, half leaning against the bar as he adds, <i>“I’ve got drinks on tap, gossip to share, and a keen interest in certain... collectables.”</i>");
	burtBarMenu();
}

//Repeat
public function repeatBurtApproach():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	//Greet spread
	if(flags["PQ_RESOLUTION"] == 1 && flags["PQ_PEACE_TIMESTAMP"] + 24*60 < GetGameTimestamp())
	{
		output("<i>“Hey [pc.name]!”</i> A grinning Burt strides over to you when you prop yourself up at the bar. <i>“Here to try my new mead cask? Triple filtered, and made from only the finest zil produce!”</i> He gestures at several new draught fonts arrayed behind the counter.");
		if(pc.biggestTitSize() >= 2) output("\n\nHis brown eyes glance down at your chest, taking in your [pc.fullChest] with a fairly lecherous smirk, after which he has to drag his eyes back up to look at your face.");
	}
	else
	{
		output("Burt glances up at you, giving a sidelong grin and asking, <i>“Well [pc.name], what can I do for you today?”</i> He wipes his hands off on his yellow and black check flannel and then leans up against the bar beside you, his grin turning into a smirk as he really seems to enjoy your company.");
		//[if (biggestTitSize < 1)]
		if(pc.biggestTitSize() >= 2) output("\n\nHis brown eyes glance down at your chest, taking in your [pc.fullChest] with a fairly lecherous smirk, after which he has to drag his eyes back up to look at your face.");
		output("\n\nHe spreads his arms to show off the whole of his bar and smiles, <i>“I’ve got mead on tap, gossip to share, and a cot in the back room.”</i> giving you a wink at that last part.");
	}
	burtBarMenu();
}

public function burtBarMenu():void {
	//[Drink]		[Talk]		[Sex]*		[Shop]**	[Leave]
	//* Only appears as an option if the PC has a Lust higher than 20.
	//** Appears as [Collectables?] until the PC first visits the shop menu.
	this.clearMenu();
	this.addButton(0,"Drink",burtDrinkMenu,undefined,"Drink","Check out the drink menu.");
	this.addButton(1,"Talk",talkToDisBurtGuey,undefined,"Talk","Talk to Burt.");
	if(pc.lust() >= 33) this.addButton(2,"Sex",burtSex,undefined,"Sex","See if you can get in the bartender’s pants.");
	else this.addDisabledButton(2,"Sex","Sex","You aren’t turned on enough for sex.");
	if(flags["BURT_COLLECTABLE_SHOP"] == undefined) this.addButton(3,"Collectables?",BurtShopCollectables,undefined,"Collectables?","Ask Burt by what he meant by “collectables.”");
	else this.addButton(3,"Shop",BurtShopCollectables,undefined,"Shop","Look into selling Burt some of the stuff you’ve found out on Mhen’ga.");
	this.addButton(14,"Leave",mainGameMenu);
}

//Drink
public function burtDrinkMenu():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("You tell Burt that you are looking for something to drink and he nods, <i>“You bet, I have the best mead you will find this side of the galactic core. Probably the worst too, but hey, it all depends on how much you are willing to spend on a buzz.”</i>");
	
	output("\n\nCrabbst Blue Ribbon - 1 Credit\nMead - 10 Credits\nX-Zil-rate - 50 Credits");
	
	this.clearMenu();
	if(pc.credits >= 1) this.addButton(0,"Crabbst",crabbstBlueRibbonPurchase,undefined,"Crabbst","Shitty beer.");
	else this.addDisabledButton(0,"Crabbst","Crabbst","You can’t afford this. Damn, you’re poor.");
	if(pc.credits >= 10) this.addButton(1,"Mead",buyMeadFromBurt,undefined,"Mead","Honey-based mead.");
	else this.addDisabledButton(1,"Mead","Mead","You can’t afford this.");
	if(pc.credits >= 50) this.addButton(2,"X-Zil-rate",burtXilErAte,undefined,"X-Zil-rate","Some kind of exotic, expensive brew.");
	else this.addDisabledButton(2,"X-Zil-rate","Z-Zil-rate","You cannot afford this.");
	//[Crabbst Blue Ribbon]		[Mead]		[X-Zil-rate]		[Back]
	this.addButton(14,"Back",burtapproach);
}

//Talk
public function talkToDisBurtGuey():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("Burt smirks, <i>“The best thing about owning a bar, is that everyone wants to dump their worries on me when they come to get hammered. I’ve heard about every piece of bad luck and tragedy on the frontier. What do you want to talk about?”</i>");
	//[pg]
	//[Him]		[Mead Hall]		[Zil]		[Work]		[Back]
	this.clearMenu();
	this.addButton(0,"Him",askBurtAboutHimself);
	this.addButton(1,"Mead Hall",talkToBurtAboutMeadHall);
	this.addButton(2,"Zil",talkToBurtAboutDeseZilGueys);
	this.addButton(3,"Work",talkToBurtAboutWork);
	this.addButton(14,"Back",burtapproach);
}

//Sex
public function burtSex():void {
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	//First Visit
	if(flags["TIMES_FUCKED_BURT"] == undefined)
	{
		clearOutput();
		output("You suggest that maybe Burt might want to take a break in the back room with you and he grins, giving a nod as he says, <i>“I do believe that would be a good use of my time.”</i> He reaches under the bartop and pushes a button on a hidden keypad, causing a panel to flip up atop the bar, exposing a cheap holoprojector. It illuminates the area behind the bar with a flickering golden glow, and a passable image of a busty Zil female wearing only an apron manifests. She seems bouncy and hyper-sexualized in comparison to real Zil females, and might be somewhat offensive to any Zil not disposed to ogle her flickering golden form. Black metal tentacles emerge from beneath the bar top, segmented metal limbs that follow the bee as she moves about, ready to act as real limbs when her illusionary hands move to do anything.");
		output("\n\nBurt smirks at the hologram and says, <i>“Watch the bar for me, Three-Dee, I’m taking a break to... uh... clean the back room.”</i>");
		output("\n\nThe hologram, Three-Dee, gives a digitized giggle and says, <i>“Yes Master.”</i>");
		output("\n\nBurt takes off his apron and hangs it behind the bar, before stepping over to the panel that serves as the gate to separate the front of the bar from the back of the bar. He lifts it and motions you back, guiding you into the back room.");
		this.clearMenu();
		this.addButton(0,"Next",burtFirstTimeSexPartI);
	}
	//Repeat
	else {
		clearOutput();
		userInterface.showBust("BURT_NUDE");
		output("You smirk at Burt and suggest another little visit to the back room.");
		output("\n\nBurt chuckles and turns Three-Dee on, telling the holographic Zil that he will be back in a bit, and then he once again ushers you behind the bar, leading you to his private storage room and office before stripping down and exposing that unique equine cybercock of his. It glistens as it juts up towards you like a spear, and from the look in Burt’s eyes, it is clear that he is eager to sheath his weapon again.");
		output("\n\nHe watches as you ");
		if(pc.isNude()) output("give a sexy, nude twirl");
		else output("strip out of your [pc.gear]");
		output(" and then asks, <i>“So, [pc.name], what are you in the mood for today?”</i>");
		burtSexMenu();
	}
}


//[Next]
public function burtFirstTimeSexPartI():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("The back room of Burt’s Kickass Mead Hall is one of the most cluttered spaces you have seen in a long time. There are barrels and kegs of mead and beer, and other drinks sure to make one tipsy, stacked all over the place, in seeming disarray, as well as a small desk with a computer atop it, buzzing away as it monitors the sales, inventory, and expenses of Burt’s business.");
	output("\n\nBehind a selection of kegs you find a simple army cot, spread with some native blankets made by the Zil. Burt motions to the cot and says, <i>“Get comfortable.”</i>");
	output("\n\nYou nod and smile as you ");
	if(pc.isNude()) output("give a sexy, nude twirl");
	else output("slowly strip out of your [pc.gear]");
	output(", baring your [pc.skinFurScales] to his eager eyes. He watches as you stretch out on the cot and then nods, <i>“Well, I guess it’s my turn.”</i>");
	
	output("\n\nBurt smiles as he pulls his shirt off first, hanging it across one of the barrels before he starts to pull off his tank top. He has a small thatch of hair on his chest, curly and dark, but most of what is exposed are thick muscles beneath tan skin, marked with the occasional scar. His pectoral muscles shift and bounce as he tosses his shirt aside, capped by flat caramel brown nipples. He gives you a smirk and then starts to loosen his belt, finally pushing his pants down and off.");
	output("\n\nWhat you see next is a bit of a surprise, he has the expected hairy scrotum, holding a pair of hen’s egg sized testicles, but in place of the fleshy tan cock one would expect, you are instead greeted by a mass of interlocking chromed metal. As he pushes his pants all the way off and stands up, you are able to see that he has had his cock replaced by a cybernetic shaft, molded in the shape of an equine tool, with a thick medial ring and a flare at the tip. More than the shape, though, it is big enough to belong to a horse as well, being almost as long and thick as the man’s forearm and fist.");
	output("\n\nHe notices your focus on the inorganic member and chuckles softly, <i>“Uh... yah, be careful around Galotians, if they are yellow and bubbly, that means that they are acidic. I didn’t know that, and well, my medical didn’t cover organic replacement. This baby is second hand, but reliable as they come... pardon the pun. This okay with you, [pc.name]?”</i>");
	//[pg]
	this.clearMenu();
	//[Yes]		[No, Sorry]
	this.addButton(0,"Yes",yesIWantYerCrazyHoarseWeinerBurt);
	this.addButton(1,"No, Sorry",noRoboHorseWeinersHere);
}

//Yes
public function yesIWantYerCrazyHoarseWeinerBurt():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("You smile and reassure Burt that you see nothing wrong with his manmade manhood, reaching out to caress it gently with one hand.");
	output("\n\nBurt grins, giving a little shiver at the caress, which shows that he can feel through that metal and plastic phallus well enough. Nearly invisible segmented plates built into the design shift and expand, letting the inorganic organ pulse and bounce like a real erection would. His mechanical length is cool to the touch, and undeniably firm, having no organic give or padding to it at all.");
	output("\n\nBurt grins at you and says, <i>“I’m glad you are taking this all in stride... so, what should we do?”</i>");
	pc.lust(10);
	//[pg]
	burtSexMenu();
}

public function burtSexMenu():void {
	this.clearMenu();
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	//[Give a BJ]	[Get Oral]		[Anal]		[Vaginal]*	[Back]
	this.addButton(0,"Give BJ",giveBurtABJ,undefined,"Give BJ","Give Burt a blowjob.");
	if(pc.hasVagina() || pc.hasCock()) this.addButton(1,"ReceiveOral",getOralFromBurt,undefined,"ReceiveOral","Have Burt perform oral on you.");
	else this.addDisabledButton(1,"ReceiveOral","ReceiveOral","How can Burt give you oral if you don’t have a dick or a pussy?");
	this.addButton(2,"Anal",burtsWeinerInYourButt,undefined,"Anal","Let Burt fuck your asshole.");
	if(pc.hasVagina()) this.addButton(3,"Vagina",burtSticksItInThePCsVajayjay,undefined,"Vagina","Let Burt fuck your vagina.");
	else this.addDisabledButton(3,"Vagina","Vagina","You need a vagina in order for Burt to fuck it.");
	//[Handjob]	[Rimjob]		[Titfuck]**	[Tailfuck]*
	this.addButton(4,"Handjob",giveBurtAHandyYouSlooooooooooot,undefined,"Handjob","Give Burt a handjob.");
	this.addButton(5,"Rimjob",lickBurtsAssholeYouFilthyButtlicker,undefined,"Rimjob","Give Burt a rimjob.");
	if(pc.biggestTitSize() >= 7) this.addButton(6,"Titfuck",titFuckBurtBecauseYoureAFilthyFatChestedHo,undefined,"Titfuck","Titfuck Burt.");
	else addDisabledButton(7,"Titfuck","Titfuck","You need some big tits to titfuck Burt with.");
	if(pc.hasCuntTail()) this.addButton(7,"Tailfuck",tailFuckBurtBecauseWhyNot,undefined,"Tailfuck","Use your tail-mounted vagina on Burt’s dick.");
	else addDisabledButton(7,"Tailfuck","Tailfuck","You need a tail-mounted vagina in order to fuck Burt with it.");
	this.addButton(14,"Back",burtapproach);
	//* Requires requisite part, vagina or tailpussy.
	//** Requires C cup or bigger
}


//No, Sorry
public function noRoboHorseWeinersHere():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("You shake your head, that kind of thing is just a bit much for you. You gather your things and with a blush and an apology, you exit the back room, getting dressed as you go and trying to ignore the looks of the other patrons.");
	//[pg]
	//[Next] (Move to just outside the Mead Hall.) 
	currentLocation = "NORTH ESBETH 2";
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Shop
public function BurtShopCollectables():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	if(flags["PQ_RESOLUTION"] == 1 && flags["PQ_PEACE_TIMESTAMP"] + 24*60 < GetGameTimestamp())
	{
		output("<i>“Oh no, I don’t really need any of that type of stuff from you anymore.”</i> The big human drums his fingers on the counter with an air of cheery industry. <i>“A tribe of zil are selling honey, their plates, anything they’re willing to give directly to us now. Barter, anyway - they got a real thing against credits for some reason. But it’s great! I’ve got vats of different honeys fermenting in the back now, people back in the core interested in the samples I’ve been sending out. I think we could really make a go of things here now!”</i>");
		clearMenu();
		addButton(0,"Next",burtapproach);
		return;
	}
	//First Visit
	else if(flags["BURT_COLLECTABLE_SHOP"] == undefined) 
	{
		flags["BURT_COLLECTABLE_SHOP"] = 0;
		output("You ask Burt what he meant about collectables.");
		output("\n\nA look of intense pleasure seems to twinkle in his dark brown eyes as the bartender leans across the bar top and motions you closer, <i>“You ever hear of the Zil? They are this race of giant wasps... or bees. </i>Honey bees!<i> They have this chitinous skin that is hard as light body armor, and shed plates can be worked into really expensive custom clothes. And their honey... it’s to die for.”</i>");
		output("\n\nBurt rests back a bit, spending a moment washing down the bar between himself and you, before he continues, <i>“The girls are beautiful, perfect hourglass figures, real ‘waspish’ if you will pardon my joke. Even the guys are kinda hot. I spent a few weeks with a tribe of them, seducing the ladies out of their honey, but then there was this misunderstanding that happened, and well... I’ve been banned from ever going back.”</i> He grumbles something about a female chief’s babies having brown eyes and grits his teeth.");
		output("\n\n<i>“Anyways, if you ever find any of their artifacts, any of their plates, or especially any of their honey, bring it to me. I guarantee I can beat the price of any blackmarket junk dealer out there. So, you got anything for me?”</i> He gives you a hopeful grin.");
		//[pg]
	}
	//Repeat
	else
	{
		output("Burt’s eyes light up as you mention his offer to buy Zil items from you. <i>“Hey, [pc.name], I’m still interested, if you have the stuff. But don’t go trying to pawn off any regular old honey or some old chunk of shredded plastic. I know what’s really theirs. I’m an expert.”</i> He clearly meant his warning in good humor and faith. <i>“So, you got anything for me?”</i> He gives you a hopeful grin.");
		//[pg]
	}
	clearMenu();
	
 	var buttons:int = 0;
	var x:int = 0;
	//Zil purchase menu!
	while (x < pc.inventory.length)
 	{	
		//[Back]
		if (buttons % 15 == 0)
		{
			addButton(buttons+14, "Back", burtapproach);
			buttons++;
		}
		
		if (x == pc.inventory.length) break;
		
		if(!pc.inventory[x].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) addItemButton(buttons-1, pc.inventory[x], burtPurchase, x);
		else addDisabledButton(buttons-1, pc.inventory[x].shortName + " x" + pc.inventory[x].quantity, StringUtil.toDisplayCase(pc.inventory[x].longName), "You cannot drop this item.");
		buttons++;
		
		x++;
 	}
	if(pc.inventory.length <= 0) output("\nOh right... You don’t have anything to give him.");
	addButton(14,"Back",burtapproach);
}

public function burtPurchase(arg:int = 0):void {
	if(!InCollection(pc.inventory[arg].shortName, ["ZilRation", "ZilHoney", "Z.Spear", "ZilBow"])) burtRefusesYourItemYouHobo(arg);
	else burtMakesAPurchase(arg);
}

//Purchase
public function burtMakesAPurchase(arg:int = 0):void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	var credits:int = 50;
	switch(pc.inventory[arg].shortName)
	{
		case "ZilRation": credits = 50; break;
		case "ZilHoney": credits = 100; break;
		case "Z.Spear":
		case "ZilBow": credits = (pc.inventory[arg].basePrice * 1.5); break;
	}
	pc.inventory[arg].quantity--;
	pc.credits += credits;
	
	output("Burt takes a moment to look the " + pc.inventory[arg].longName + " over, making sure that it is what you say it is, finally giving a nod as he tucks it behind the bar out of sight and sends over " + num2Text(credits) + " credits. <i>“There you go, pleasure doing business with you, [pc.name].”</i>");
	//EAT ZE STACK!
	if(pc.inventory[arg].quantity <= 0) pc.inventory.splice(arg,1);
	//[pg]
	this.clearMenu();
	this.addButton(0,"Next",BurtShopCollectables);
}

//Refuse
public function burtRefusesYourItemYouHobo(arg:int = 0):void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("Burt glances at the " + pc.inventory[arg].longName + " and sighs, <i>“Look, [pc.name], I don’t know if you are just confused or not, but this isn’t even remotely related to the Zil. I can’t buy this. Take this over to the Junk Hut if you want to get rid of it, I’m just not interested in buying it.”</i>");
	//[Next]
	this.clearMenu();
	this.addButton(0,"Next",BurtShopCollectables);
}

//Leave
public function leaveBurt():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("You nod to Burt and turn, taking your attentions from the bartender to the rest of the Mead Hall. You can hear Burt behind you say, <i>“Take care, and come back to me if you get thirsty. And don’t forget, if you come across any Zil gear, think of me.”</i> He then starts humming some random holovid show tune as he returns to cleaning.");
	//[pg]
	processTime(1);
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Drinks--------------------------------------------------------------------------------------------------------------------
//Crabbst Blue Ribbon
//Tooltip
//This machine rendered brew comes in a black can with a pair of white crossed crab claws over a blue prize ribbon on the label. It’s hard to find something cheaper than Crabbst Blue Ribbon Mead, this stuff will fuck you up.

//Scene
public function crabbstBlueRibbonPurchase():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("Burt chuckles, <i>“Uh... wow, you must be really hard up for credits. Okay.”</i> He reaches under the bar and pulls out a black aluminum can with the crossed crab claw Jolly Roger on the front. He jerks on the pull tab and a strange hiss escapes the can. <i>“So, uh... do you want me to put this in a dirty glass then, it might cut the flavor a bit.”</i>");
	output("\n\nHe pours the urine colored fluid into a glass and pushes it across the bar to you. It smells like dirty gym socks dipped in honey, and when you toss the glass back, you find that it kind of tastes like it too.");
	output("\n\nThe drink settles in your guts like a lead weight, and makes it a little hard to focus, forcing you to blink your eyes several times before you are looking at just a single Burt again, instead of handsome twins.");
	//[pg]
	//[+5 Physique, -5 Reflexes, -5 Coordination, -5 Intelligence, -5 Willpower, +5 Lust per action; for the next 5 hours.]
	if(pc.hasStatusEffect("Crabbst")) {
		if(pc.statusEffectv2("Crabbst") < 5) {
			pc.addStatusValue("Crabbst",2,1);
			pc.physiqueMod++;
			pc.reflexesMod--;
			pc.aimMod--;
			pc.intelligenceMod--;
			pc.willpowerMod--;
			pc.lust(5);
		}
		else output("\n\nYou’ve gotten everything from Crabbst you’re going to get.");
	}
	else {
		pc.createStatusEffect("Crabbst",0,1,0,0,false,"Icon_DizzyDrunk","Makes you stronger but at what cost?",false,180);
		pc.physiqueMod++;
		pc.reflexesMod--;
		pc.aimMod--;
		pc.intelligenceMod--;
		pc.willpowerMod--;
		pc.lust(5);
	}
	if(flags["BURT_DRINKS_BOUGHT"] == undefined) flags["BURT_DRINKS_BOUGHT"] = 1;
	else flags["BURT_DRINKS_BOUGHT"]++;
	pc.imbibeAlcohol(7);
	pc.credits--;
	processTime(8);
	this.clearMenu();
	this.addButton(0,"Next",burtDrinkMenu);
}
	
//Mead
//Tooltip
//This pale yellow alcohol is made by fermenting watered down honey. It’s good, but not great. 
public function buyMeadFromBurt():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("Burt nods, <i>“Coming right up.”</i> He turns and grabs a bottle off the shelf behind him, opening it with one of his myriad of bottle openers before he pulls out a highball glass and pours enough of the amber fluid within to fill it half way. He then smiles and slides the glass across the bar top to you.");
	output("\n\nThe drink smells of honey, with only the barest of hints of the alcoholic nature stinging your nostrils. It is a delightful aroma, and when you sip from the glass you are treated with a rich and floral flavor that really is quite enjoyable.");
	output("\n\nYou spend a little time enjoying your drink, savoring the flavor and complexity while you make small talk with Burt. All told, it is a rather pleasant experience.");
	
	//[pg]
	//[+7 Physique, -2 Reflexes, -2 Coordination, -2 Intelligence, -2 Willpower, +1 Lust per action; for the next 5 hours.]
	if(pc.hasStatusEffect("Mead")) {
		if(pc.statusEffectv2("Mead") < 7) {
			pc.addStatusValue("Mead",2,1);
			pc.physiqueMod++;
			pc.aimMod-= .5;
			pc.reflexesMod-= .5;
			pc.intelligenceMod-= .5;
			pc.willpowerMod-= .5;
			pc.lust(5);
		}
		else output("\n\nYou’ve gotten as much from the mead as you’re going to get.");
	}
	else {
		pc.createStatusEffect("Mead",0,1,0,0,false,"Icon_DizzyDrunk","Alcohol isn’t good for you, but you do feel a little stronger and more confident.",false,180);
		pc.physiqueMod++;
		pc.reflexesMod-= .5;
		pc.aimMod-= .5;
		pc.intelligenceMod-= .5;
		pc.willpowerMod-= .5;
		pc.lust(5);
	}
	pc.imbibeAlcohol(10);
	if(flags["BURT_DRINKS_BOUGHT"] == undefined) flags["BURT_DRINKS_BOUGHT"] = 1;
	else flags["BURT_DRINKS_BOUGHT"]++;
	pc.credits -= 10;
	processTime(10);
	this.clearMenu();
	this.addButton(0,"Next",burtDrinkMenu);
}

//X-Zil-rate
//Tooltip
//This gold bottle is quite possibly the best mead in the known universe, made from the lactated honey and extruded venom of the Zil, and carefully brewed by Burt himself. It has been known to have adverse affects on Galotians.
public function burtXilErAte():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("Burt grins at you and says softly, <i>“Ah, a connoisseur. This stuff is the finest mead you can buy.”</i> He turns from you and grabs a gold bottle from the top shelf behind the bar, bringing it over and drawing the cork before letting you smell the pungent and rich flavors that have gathered on the plug during the time the bottle has been on the shelf.");
	output("\n\nBurt reaches under the counter and brings up a fluted wine glass before pouring it half full of the crystal clear golden wine, filling the usually stale and smoky air of the bar around you with the scent of wildflowers in full bloom and rich notes of honey and sex. He sets the glass down before you and says, <i>“Do enjoy, [pc.name].”</i>");
	output("\n\nThis clearly isn’t the kind of drink you can just slam down, so you relax at the bar as you slowly roll the drink around in the glass and take the occasional sip from it, savoring every drop of the majestic alcohol. It is honestly hard to imagine why this drink isn’t far more expensive than it is, but it lets you get a taste of what it must be like to be a CEO with money to burn on life’s finest things.");
	//[pg]
	//+10 Physique, +1 Lust per action, for the next 5 hours; Galotian PCs become Acidic*.
	if(pc.hasStatusEffect("X-Zil-rate")) {
		if(pc.statusEffectv2("X-Zil-rate") < 10) {
			pc.addStatusValue("X-Zil-rate",2,5);
			pc.physiqueMod+=5;
			pc.lust(5);
		}
		else output("\n\nYou’re as hopped up on X-Zil-rate as you’re going to get.");
	}
	else {
		pc.createStatusEffect("X-Zil-rate",0,5,0,0,false,"Icon_DizzyDrunk","This top-shelf booze makes you feel strong... and horny.",false,180);
		pc.physiqueMod+=5;
		pc.lust(5);
	}
	if(flags["BURT_DRINKS_BOUGHT"] == undefined) flags["BURT_DRINKS_BOUGHT"] = 1;
	else flags["BURT_DRINKS_BOUGHT"]++;
	pc.imbibeAlcohol(15);
	pc.credits -= 50;
	processTime(10);
	this.clearMenu();
	this.addButton(0,"Next",burtDrinkMenu);
}

//Him
public function askBurtAboutHimself():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	if(flags["BURT_DRINKS_BOUGHT"] == undefined) {
		output("Burt frowns as you ask him about himself, <i>“Yeah, figures you would want to know about me. Everybody wants to know my story. Look [pc.name], you seem like a good kid and all, but there are some things a man just doesn’t like to talk about. Why don’t you at least buy a drink before trying to buddy up to me, huh?”</i>");
	}
	//Scene 2 (Won’t happen until PC has bought a drink.)
	else if(flags["TIMES_FUCKED_BURT"] == undefined)
	{
		output("Burt sighs and pulls out his bar towel, spending a long and silent moment just wiping down the bar top, trying to get some imagined smudge out of the way between himself and you. When he finally talks, his voice is low and quiet, <i>“So I was born a hop, skip and a jump from old Earth herself, back coreward, and I had a pretty good life. I was the kinda guy you would expect from the civilized parts of the galaxy, straight laced and closed-minded. I even joined the T.S.C. military and learned discipline and duty.”</i>");
		output("\n\n<i>“Everything started to go wrong when my mom died. She wasn’t killed or anything, she just died. Old age. She couldn’t afford the age treatments, I mean, who can. I resigned my commission and went to deal with the liquidation of her estate, and after that I started drifting among the core worlds, trying to find direction in life. I thought I had found it too... but, it wasn’t to be. My old life is gone, and I can’t go back, so I ended up out here, tending a bar on the sleaziest backwater on the frontier.”</i>");
		output("\n\nBurt chuckles and tucks his rag back into his apron pocket, <i>“Well [pc.name], if you want to know more than that, you are going to have to get to know me better.”</i> and he gives you a bit of a suggestive wink.");
	}
	//Scene 3 (Won’t happen until PC has had sex with Burt once)
	else if(flags["TIMES_THREE_D_SURPRISE_SEXED"] == undefined) {
		output("Burt pours you a glass of mead, and then pours himself one as well, downing his in a single swig before setting the glass down hard enough that half the bar can hear it. He takes a deep breath and lets the mead calm his nerves. <i>“I like you, [pc.name], you’re a good kid. And I don’t just mean good in bed... not that you aren’t. There are just some things a man isn’t comfortable talking about.”</i>");
		output("\n\nHe sighs, <i>“I owe you something though, so here’s the deal. The Black Void set me up. I’m sure you’ve heard of them. I mean, anyone who has ever rolled dice or bought something they shouldn’t have had has dealt with them at least indirectly. They framed me for something they didn’t want to have on their heads, something bad enough that I can’t ever risk visiting the core again.”</i>");
		//[+7 Physique, -2 Reflexes, -2 Coordination, -2 Intelligence, -2 Willpower, +1 Lust per action; for the next 5 hours.]
		if(pc.hasStatusEffect("Mead")) {
			if(pc.statusEffectv2("Mead") < 7) {
				pc.addStatusValue("Mead",2,1);
				pc.physiqueMod++;
				pc.reflexesMod-= .5;
				pc.aimMod-= .5;
				pc.intelligenceMod-= .5;
				pc.willpowerMod-= .5;
				pc.lust(5);
			}
		}
		else {
			pc.createStatusEffect("Mead",0,1,0,0,false,"Icon_DizzyDrunk","Alcohol isn’t good for you, but you do feel a little stronger and more confident.",false,180);
			pc.physiqueMod++;
			pc.reflexesMod-= .5;
			pc.aimMod-= .5;
			pc.intelligenceMod-= .5;
			pc.willpowerMod-= .5;
			pc.lust(5);
		}
	}
	//Scene 4 (Won’t happen until PC has experienced Three-Dee Rape sex ending)
	else {
		output("Burt mutters, <i>“Damnit... Okay, I’ll tell you everything, but only to make up for Three-Dee going off on you like that. I had a fiancee, a head researcher at Xenogen, she was brilliant and beautiful, the whole package. Henrietta was her name, had a doctorate in xenobiology before she was even out of puberty.</i> He gives a wistful sigh and seems to drift off in his memories for a moment before getting back to his story.");
		output("\n\n“She was researching genetic predispositions towards mental disease and criminal behavior. I doubt you’ve heard of her work, it’s a dead end...”</i> he shakes his head and sighs, <i>“I swear, as long as there have been people who could tell the difference between right and wrong, someone has hoped to cure it. Anyway, she made this drug, called </i>H1d3<i>, that she had hoped would work. It modified the person’s genetic code. It was supposed to make their bodies physically ill at the attempt to commit crimes, but it was never exact enough. Instead it just stripped all the test subjects of any semblance of free will, and jacked their libido through the roof. They would do anything you asked them to do without even putting up a fight. It was horrible. So Xenogen canceled the project.”</i>");
		output("\n\nBurt props his elbows on the bartop and drops his head into his hands, <i>“That should have been the end of it... but somehow, the Black Void got their hands on the serum, and on my fiancee. She wouldn’t tell them how to make it, so they injected her with it, but the sample they had was old, </i>H1d3<i> degrades over time. It left her a near brainless bimbo. She couldn’t tell them how to manufacture it after that.”</i>");
		output("\n\n“So they dumped her in our apartment, and hid the hypo in my kit locker. They called the T.S.C. domestic security and told them that I had been selling lab rats to slavers, and had turned Henrietta into one and was about to sell her off as well. I was working security for Xenogen at the time, so I was an easy target. They had raided my place before I got home, and I saw them bringing her out. I ran, and I never looked back. I’m still on the T.S.C.’s most wanted list, but they don’t have a lot of reach here yet, so....”</i> Burt shrugs, <i>“That’s my story.”</i>");
		//[pg]
	}
	processTime(9+rand(3));
	this.clearMenu();
	this.addButton(0,"Next",talkToDisBurtGuey);
}

//Mead Hall
//Note
//This is a place where authors of other characters in the Badass Mead Hall can have gossip about them listed.
public function talkToBurtAboutMeadHall():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	//Scene1
	if(flags["BURT_MEAD_HALL_DISCUSSIONS"] == undefined || flags["BURT_MEAD_HALL_DISCUSSIONS"] == 3) {
		flags["BURT_MEAD_HALL_DISCUSSIONS"] = 1;
		output("Burt chuckles and tucks his bar rag into a pocket on his apron, <i>“You want to know about Burt’s Badass Mead Hall, huh? Can’t say that I blame ya. Sadly, there isn’t a lot to say about it. I won it in a card game, and the previous owner didn’t really give a lick about it. Had Three-Dee running it, and she’s glitchy as hell.”</i> He shakes his head, <i>“Frankly, I’m surprised I can even keep the place going.”</i>");
		output("\n\nYou inquire about who Three-Dee is.");
		output("\n\nBurt grins, <i>“Three-Dee is a virtual bartender made by KihaCorp. Stands for Digital Drink Dispenser. Basically she’s a series of robotic limbs worked into the underside of the bar, and a cheap holoprojector with a VI just smart enough to make drinks to order and take credits. But when I got here, she had been hacked so many times that she is pretty unpredictable now. I try to only use her when I need a break.”</i>");
	}
	//Scene2
	else if(flags["BURT_MEAD_HALL_DISCUSSIONS"] == 1) {
		flags["BURT_MEAD_HALL_DISCUSSIONS"] = 2;
		output("You mention that you are curious about the patrons of the Mead Hall.");
		output("\n\nBurt considers your question for a moment, before shrugging and saying, <i>“Well, there is this Ausar girl who is in here most nights. If you like hologames, you should definitely seek her out. I’m pretty sure she is the best gamer on the planet. If you plan on challenging her though, two suggestions. First, don’t do it drunk. Second, don’t bet anything to her that you can’t afford to lose.”</i>");
	}
	//Scene3
	else {
		flags["BURT_MEAD_HALL_DISCUSSIONS"] = 3;
		output("You inquire about the employees of the Mead Hall.");
		output("\n\nBurt chuckles, <i>“Ah, well... other than myself and Three-Dee, there are a few other employees, the most popular of whom is probably my waitress Honey.”</i> He nods to the cute flat chested blonde with the full and curvy posterior bouncing between tables and dropping off mugs of mead. <i>“She’s a great waitress, and has some special talents all her own. If you fancy a show, she is a fine dancer... her show usually starts just before closing time. I’d highly recommend catching it... not to mention catching the souvenirs she casts off as she dances.”</i> he says with a chuckle and a waggled eyebrow to highlight the innuendo.");
		output("\n\nBurt watches Honey prance about for a moment, an almost fatherly look on his face as he watches her, before he looks back to you, <i>“If you do catch her show, don’t be an ass about it. No one ends up stuck out in this jungle because their life was perfect in the core.”</i>");
	}
	processTime(4+rand(3));
	this.clearMenu();
	this.addButton(0,"Next",talkToDisBurtGuey);
}

//Zil
//Note
//This is a place where game info regarding the Zil can be offered up in the future.
public function talkToBurtAboutDeseZilGueys():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	//[Zil]
	if(flags["PQ_RESOLUTION"] == 1 && flags["PQ_PEACE_TIMESTAMP"] + 24*60 < GetGameTimestamp())
	{
		output("<i>“So you’re doing business with the zil now?”</i> you ask.");
		output("\n\n<i>“Yeah! This gaggle of ‘em came in from the jungle, wouldn’t leave until they got to talk to Penny and the wobbly U.G.C. gal,”</i> Burt explains, leaning on the bar. <i>“This tribe of ‘em decided they want to trade with us, all of a sudden, and I for one am not saying no to ‘em. What they want is really simple stuff - basic medicine, fabrics, building material - and what they’re selling, well, you can’t get it anywhere else in the galaxy.”</i> He kisses his fingers effusively. <i>“These are golden days, [pc.name]. Golden. Now I’ve got a surplus to work with, I can really start to think about all the things that might be done with that honey, cuz you know it’s amazing stuff. Not just mead, but perfume... therapeutic massages... aphrodisiac... once I send it off to a lab and know all of its properties...”</i>");
		output("\n\n<i>“But they want more than clothes, don’t they?”</i> you interrupt.");
		output("\n\n<i>“Oh yeah,”</i> Burt says, sobering. <i>“They reckon those Snugglé folks took their land when they built their big ass farm, way out there. They want them gone, they’ve made that pretty damn clear.”</i> He sighs, knitting his fingers. <i>“Not gonna lie, that’s a tough ask. Snugglé aren’t some two bit operation you can send a few letters to your system delegate about and expect they’ll pack up tomorrow. And plenty of people are going to </i>want<i> ‘em here, because they mean jobs and security. It’s a tough ask [pc.name], no question about that.”</i>");
		output("\n\n<i>“But...”</i> he gestures expansively. <i>“They haven’t really got started on Mhen’ga yet. The U.G.C. rep seems to think there’s a chance we can persuade ‘em to go elsewhere. And if there’s a chance we can make Esbeth a prosperous lil’ place by itself, rather than as some agri-corp’s soulless space-port, then I’m all for it. I’ll fight for the cute lil’ bee girls ‘n boys, if there’s a chance!”</i>");
	}
	//Scene1
	else if(flags["BURT_ZIL_TALK"] == undefined || flags["BURT_ZIL_TALK"] == 3)
	{
		flags["BURT_ZIL_TALK"] = 1;
		output("Burt grins, <i>“Ah, the Zil, one of my favorite subjects. They are a lot like Terran honey bees, but don’t let that mix you up. They aren’t a hive mind, and any of them are able to have kids. They are more of a tribal kind of people, gathering in small bands and working the jungles they live in for their natural bounties. They are good people, and usually pretty peaceful. They follow that whole ‘make love, not war’ idea, and even if you piss them off, they are more likely to fuck you than kill you. Don’t underestimate them though. They aren’t complete primitives, and they have some nasty surprises.”</i>");
	}
	//Scene 2
	else if(flags["BURT_ZIL_TALK"] == 1)
	{
		flags["BURT_ZIL_TALK"] = 2;
		output("Burt smirks as you bring up his favorite subject, <i>“Yah, so... sex. The Zil are good at it, and open with it, but you have to be careful. They can breed with humans, so");
		//[if (hasVagina = false)]
		if(!pc.hasVagina()) output(" unless you are fixing to settle down and raise some kids, keep it in your pants");
		else
		{
			output(" unless you want a belly full of bees, I’d recommend not");
			if (pc.legCount > 1) output(" spreading your [pc.legs] for them");
			else output(" falling for their charms");
		}
		output(".”</i>");
	}
	//Scene 3
	else if(flags["BURT_ZIL_TALK"] == 2)
	{
		flags["BURT_ZIL_TALK"] = 3;
		output("Burt frowns as he tries to think of anything else to tell you about the Zil, <i>“I don’t know what more I could tell you that isn’t in a standard Codex, though if you plan on hunting or fighting them, I guess the best thing to have with you is something that is cold. They like things hot, and weapons that freeze things tend to hit them hard.”</i>");
	}
	processTime(4+rand(3));
	this.clearMenu();
	this.addButton(0,"Next",talkToDisBurtGuey);
}

//Work
//Note
//This is a place where authors of future sections can list hints about quests and easter eggs in the game, in the form of bar gossip.
public function talkToBurtAboutWork():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT");
	output("Burt rubs his chin as he thinks about any job offers he might have heard about, <i>“Well... I don’t need anyone here at the bar, between me and Three-Dee, we pretty much have everything covered. But I heard that the head of Steele Tech recently left a ship to his kid, and you know that the child of a rich old bastard is going to be too spoiled to know how to do anything for themselves, you might see if they need a crew.”</i>");
	output("\n\nYou frown and explain to Burt that Victor Steele was your father.");
	output("\n\nBurt blinks and blushes a bit in embarrassment, <i>“Well damn, [pc.name], I didn’t realize you were the Steele kid. I just expected if I ever met the " + pc.mfn("son","daughter","child") + " of a corporate CEO, they would be a stuck up asshole who couldn’t even wipe themselves without help. I sure didn’t mean any offense. I was just trying to help.”</i>");
	processTime(5+rand(3));
	this.clearMenu();
	this.addButton(0,"Next",talkToDisBurtGuey);
}

//Sex-----------------------------------------------------------------------------------------------------------------------
//Give a BJ
public function giveBurtABJ():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("Your eyes linger on that pulsing cybernetic erection, and you find that you just can’t help yourself. You lean forward towards it and drag your [pc.tongue] across the cool metal flare. You can feel a tingle shiver through your tongue, like licking a battery, but you can also taste a hint of old musk lingering around his piss hole. Burt lets out a groan of pleasure as you give oral attention to his erection and smiles down at you, his hands reaching out to stroke through your [pc.hair]. You give a few more licks before moving your hands to caress his length, feeling the nearly seamless segments of his length as they shift and adjust to his body’s needs. It is a marvel of technology, almost feeling like flesh save for its completely unyielding surface.");
	output("\n\nBurt groans out, <i>“Oh [pc.name]....”</i> and then without warning his hands grip your [pc.hair] tightly and he pulls forward, forcing your jaw to stretch almost painfully around the nearly five inch thick shaft, but it is clear that his mechanical cock is immune to the scrape of your teeth. Your [pc.tongue] tries to push against the invasion, but that just spurs Burt on further. He shudders in pleasure and pushes slowly deeper into your mouth.");
	output("\n\nHis flare nears in on your gag reflex and you feel tears well in your eyes as you fear he will rip your throat apart, but then you hear a click and hiss, and feel something cold spray down your throat. You can’t taste it, whatever it is, but the effect is almost instant, numbing your throat and relaxing the muscles, as well as killing your gag reflex. He waits the length of a few breaths, moaning in pleasure");
	if(pc.hasHair()) output(", and then he jerks at your hair");
	output(", pulling you down his shaft until your lips kiss his medial ring, sending well over half a foot of equine metal down your throat. You don’t choke, and you don’t feel pain, but you can clearly feel the passage, and your hand drifts to your neck, feeling how your neck bulges and expands to accommodate him.");
	//[Next]
	processTime(10+rand(3));
	pc.lust(3);
	this.clearMenu();
	this.addButton(0,"Next",giveBurtABJPartII);
}

public function giveBurtABJPartII():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("You are forced to hold your breath, with your mouth and throat stretched beyond taut around his member, but he doesn’t hold his position long. Burt draws back, dragging that flare back up your neck, against the swallowing grip of your throat muscles. He draws away until his flare escapes into your mouth, letting you grab a quick breath through your nose before he slams back in");
	if(pc.hasHair()) output(", pulling your hair again as he drives back");
	output(" deep into your throat. It is a slow pace, but intense, as he draws back and then slams back in, stretching your mouth and throat a little more each time.");
	output("\n\nHis medial ring clacks against your teeth again and again with his thrusts, and finally he gives a firm shove, spearing deeper into your throat and pushing his ring past your teeth and into your throat as he starts to fuck your face in earnest. His hips drive forward hard and fast as the muscles of his toned ass cheeks clench and relax again and again. Your hands move to his hips to steady yourself, but it does nothing to slow his pace.");
	output("\n\nYou can feel his flare and ring overstretching your throat and jaws again and again as he pounds away, and before long his hairy human balls are slapping your chin with each thrust, your nose hitting his belly as he well and truly fucks your face.");
	output("\n\nYour lungs burn as he thrusts down your throat again and again, only drawing back enough to let you catch a breath on occasion. It is intense, and leaves you feeling deeply submissive as he uses you with only the barest concern for your safety required. Your view of the world blurs through tears and shortness of breath, the whole of your existence narrowing to the hands jerking at your [pc.hair], the crotch growing closer and farther in rapid thrusts, and the cock sinking into your body again and again and again.");
	output("\n\nHe finally slams against your face one last time, groaning as his balls draw up against the base of his cybernetic organ, and his body starts to twitch and spasm with pleasure. You can’t feel his cock surge or pulse, but you can feel a spreading heat within your stomach as he cums directly down your throat. After a few strong pulses, he lets go of your [pc.hair] and pulls back, gasping in pleasure as he plasters the last few shots of his cum into your mouth and across your face.");
	output("\n\nYou gasp for breath as you recover from his orgasm, feeling breathless, used, and disturbingly turned on by the event.");
	pc.loadInMouth(chars["BURT"]);
	//[pg]
	//[Next] (-1 Will, +5 Lust, Random Sex Exit)
	pc.lust(5);
	processTime(10+rand(3));
	this.clearMenu();
	this.addButton(0,"Next",randomBurtSexExit);
}

//Get a Oral
public function getOralFromBurt():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	//if (naga = true)
	if(pc.isNaga() || pc.legCount <= 1) 
	{
		output("You mention that you would enjoy getting a little attention yourself and Burt grins, pushing you back over the cot. Your [pc.legOrLegs] shift to wrap around the powerful man and drag him down to your loins.");
		if(pc.hasVagina()) output(" He lets his breath wash over [pc.eachVagina], inhaling your musky scent and smirking as he begins to place soft kisses around your [pc.vagina].");
		//if (hasCock = true)
		else if(pc.hasCock()) output(" He lets his lips press in teasing kisses across [pc.eachCock], smirking up at you as he teases your senses.");
		//[if (gender = neuter) 
		else output(" Burt chuckles for a moment at the general lack of things to use his mouth on, kissing at your vacant groin for a moment before letting his tongue lathe across it.");
		
		//[if (gender = female)]
		if(pc.hasVagina() && pc.hasCock())
		{
			output("\n\nBurt raises one hand to tease through your tender folds, spreading [pc.eachVagina] open to his view, before he leans in to kiss and nibble at your most intimate of flesh. He takes his time, wanting to really inflame your passion and pleasure before his tongue begins to dig into you, the stubble of his five o’clock shadow scratching at your belly and [pc.asshole] as he works. He clearly has had a great deal of practice with pleasuring his lovers like this, and soon enough he has your insides churning in blissful need as he pushes you towards the edge of climax. He doesn’t try to drag it out or tease you, instead he pushes you right over that edge, ");
			//if (isSquirter = true)
			if(pc.isSquirter()) output("gasping as you hit your climax and your juices surge from within you, splashing across his face and your [pc.legOrLegs] in a hot and musky mess.");
			else output("grinning as your body bucks and lurches in bliss beneath him in the throes of your orgasm.");
		}
		//[if (gender = male)]
		else if(pc.hasCock() && !pc.hasVagina()) {
			//if (cocks = 1)
			if(pc.cockTotal() == 1) output("\n\nBurt lets his hand stroke along your [pc.cock] gently as he moves to kiss and lick at your tip, urging out musky beads of your precum and licking them away.");
			//[if (cocks > 1)]
			else output("\n\nBurt lets his attention focus on your [pc.cockBiggest], wrapping his hand around it gently and stroking it softly as he moves to kiss and lick at the tip, urging out musky beads of your precum and licking them away while his free hand closes around your [pc.cockSmallest] and tugs it to the side somewhat to casually jerk off.");
			output(" He lifts his head and smirks at you, saying, <i>“I don’t often play with boys like this, so forgive my inexperience.”</i> He keeps teasing and caressing [pc.eachCock], slowly working you to the edge of climax. When it looks like you are about to blow, he backs his head away and aims [pc.eachCock] up towards your face. He grins at you as your orgasm rips through your body, and watches as ");
			if(pc.cumQ() <= 25) {
				output("[pc.eachCock] twitches in his hands, splashing your belly with your [pc.cum].");
			}
			else if(pc.cumQ() <= 75) output("[pc.eachCock] pulses in his hands, splashing your belly and [pc.fullChest] with your ample [pc.cum].");
			//[if (cumHigh = true)]
			else if(pc.cumQ() <= 150) output("[pc.eachCock] jerks in his grip, sending pulse after pulse of your [pc.cum] splashing across your [pc.fullChest] and face.");
			else if(pc.cumQ() <= 500) output("[pc.eachCock] jerks in his grip, hosing your [pc.fullChest] and face with your [pc.cum].");
			else output("[pc.eachCock] bursts like an overtaxed dam, drenching you in a thick [pc.cumColor] paste as you pump out enough [pc.cum] that it pools in his cot, leaving him laughing at your plight.");
			output(" He catches his breath and smirks at you, asking, <i>“Was it good for you?”</i>");
		}
		//[if (gender = herm)] 
		else if(pc.hasCock() && pc.hasVagina()) 
		{
			output("\n\nBurt smiles up at you as his hands caress your [pc.legOrLegs], letting one wrap around your [pc.cockBiggest] and the other tease across [pc.eachVagina] gently. It is clear what his focus is though, as he lowers his head to [pc.eachVagina] and begins to kiss and lick across those feminine folds while his hand slowly strokes and teases your dick. His tongue explores your most intimate of flesh, digging into you and spiraling around as deep as he can reach, while the stubble of his five o’clock shadow scratches at your belly and [pc.asshole]. He wants you to cum, and cum hard, and does his best to bring you to that edge, showing great skill with his practiced tongue. When you start to hunch and undulate with your pending orgasm, he starts to stroke your cock harder");
			if(pc.hasClit()) output(", catching [pc.oneClit] in his mouth and sucking hard at it");
			output(".");
			if(pc.isSquirter()) output(" He gasps around your pleasure bud as you hit your climax and your juices surge from within you, splashing across his face and your [pc.legOrLegs] in a hot and musky mess.");
			else output(" He gasps around your pleasure bud as your body bucks and lurches in bliss beneath him in the throes of your orgasm.");
			output(" He keeps your maleness pointed up towards you, watching ");
			//if (cumNormal = true) 
			if(pc.cumQ() <= 25) output("your [pc.cockBiggest] twitches in his hand, splashing your belly with your [pc.cum].");
			else if(pc.cumQ() <= 75) output("your [pc.cockBiggest] pulse in his hand, splashing your belly and [pc.fullChest] with your ample [pc.cum].");
			else if(pc.cumQ() <= 150) output("your [pc.cockBiggest] jerk in his grip, sending pulse after pulse of your [pc.cum] splashing across your [pc.fullChest] and face.");
			else if(pc.cumQ() <= 500) output("your [pc.cockBiggest] jerk in his grip, hosing your [pc.fullChest] and face with your [pc.cum].");
			else output("your [pc.cockBiggest] burst like an overtaxed dam, drenching you in a thick [pc.cumColor] paste as you pump out enough [pc.cum] that it pools in his cot, leaving him laughing at your plight.");
			output(" Burt sighs as the afterglow settles into you and asks, <i>“Feeling better now, [pc.name]?”<i/>");
		}
		//[if (gender = neuter)]
		else {
			output("\n\nBurt smiles and admits sheepishly, <i>“I’m not really sure what to do with you down here.”</i> Still, he isn’t against trying. He continues to lick gently at the featureless patch of [pc.skinFurScales] where your genitals would normally exist. He slips a finger into your [pc.asshole] and starts to slowly finger you as though it were a pussy, trying to find some way to bring you to an orgasmic release. He is content to spend the whole of his break trying to get you off, licking and kissing your body and fingering your ass. By the time his tongue and fingers are exhausted, he looks up at you and asks with honest confused curiosity, <i>“So, uh... was it good for you at all?”</i> a look of relief crossing his face when you assure him that it was.");
		}
	}
	//[if (taur = true)]
	else if(pc.isTaur())
	{
		output("\n\nYou mention that you would enjoy getting a little attention yourself and Burt grins, motioning for you to turn around before he goes down to his knees behind your rear [pc.legs], his hands caressing your flanks gently. ");
		//[if (hasVagina = true)]
		if(pc.hasVagina()) output("He lets his breath wash over [pc.eachVagina], inhaling your musky scent and smirking as he begins to place soft kisses around your [pc.vagina].");
		else if(pc.hasCock()) output("His hand reaches between your hind legs to draw [pc.eachCock] down, starting to kiss teasingly across the underside of your exposed flesh.");
		else output("Burt chuckles for a moment at the general lack of things to use his mouth on, kissing at your vacant groin for a moment before letting his tongue lathe across it.");
		
		//[if (gender = female)]
		if(pc.hasVagina() && !pc.hasCock()) {
			//if (tail > 0)
			if(pc.tailCount > 0) output("\n\nHis arm shifts to brush your [pc.tails] out of the way gently, allowing him to see everything that rests between your hind legs.");
			else output("\n\nHe takes a moment to look you over, smiling as he admires the view of everything between your hind legs.");
			output(" Burt raises one hand to tease through your tender folds, spreading [pc.eachVagina] open to his view, before he leans in to kiss and nibble at your most intimate of flesh. He takes his time, wanting to really inflame your passion and pleasure before his tongue begins to dig into you. He clearly has had a great deal of practice with pleasuring his lovers like this, and soon enough he has your insides churning in blissful need as he pushes you towards the edge of climax. He doesn’t try to drag it out or tease you, instead he pushes you right over that edge, ");
			//if (isSquirter = true)
			if(pc.isSquirter()) output("gasping as you hit your climax and your juices surge from within you, splashing across his face and chest in a hot and musky mess.");
			else output("grinning as your body bucks and lurches in bliss before him in the throes of your orgasm.");
		}
		//[if (gender = male)]
		else if(pc.hasCock() && !pc.hasVagina()) {
			//[if (tail > 0)]
			if(pc.tailCount > 0) output("\n\nHis arm shifts to brush your [pc.tails] out of the way gently, allowing him to see everything that rests between your hind legs.");
			else output("\n\nHe takes a moment to look you over, smiling as he admires the view of everything between your hind legs.");
			if(pc.cockTotal() == 1) output(" Burt lets his hand stroke along your [pc.cock] gently.");
			//if (cocks > 1)
			else output(" Burt lets his attention focus on your [pc.cockBiggest], wrapping his hand around it gently and stroking it softly his other hand closes around your [pc.cockSmallest] and tugs it to the side somewhat to casually jerk off.");
			//if (hasBalls = true)
			if(pc.balls > 0) {
				output("He licks and kisses over your [pc.balls] gently, tasting the musk on your [pc.skin] as his hands pump at [pc.eachCock].");
			}
			else output("He licks across the base of [pc.eachCock], tasting the musk on your [pc.skin] as his hands pump your sensitive flesh.");
			output(" He smirks as he looks at your flanks, saying, <i>“I don’t often play with boys like this, so forgive my inexperience.”</i> He keeps teasing and caressing [pc.eachCock], slowly working you to the edge of climax. When it looks like you are about to blow, he backs his head away and aims [pc.eachCock] at the floor as though milking a cow. He grins at you as your orgasm rips through your body, and watches as ");
			//[if (cumNormal = true)]
			if (pc.cumQ() <= 25)
			{
				output("[pc.eachCock] twitch");
				if (pc.cocks.length == 1) output("es");
				output(" in his hands, splashing the floor with your [pc.cum].");
			}
			else if (pc.cumQ() <= 75)
			{
				output("[pc.eachCock] pulse");
				if (pc.cocks.length == 1) output("s");
				output(" in his hands, splashing the floor and his cot with your ample [pc.cum].");
			}
			else if (pc.cumQ() <= 150)
			{
				output("[pc.eachCock] jerk");
				if (pc.cocks.length == 1) output("s");
				output(" in his grip, sending pulse after pulse of your [pc.cum] splashing across the floor and his cot.");
			}
			else if (pc.cumQ() <= 500) 
			{
				output("[pc.eachCock] jerk");
				if (pc.cocks.length == 1) output("s");
				output(" in his grip, hosing the floor and his cot with your [pc.cum].");
			}
			else 
			{
				output("[pc.eachCock] bursts like an overtaxed dam, drenching his cot in a thick [pc.cumColor] puddle as you pump out enough [pc.cum] that it could have filled a mead barrel.");
			}
			output(" He catches his breath and smirks, asking, <i>“Was it good for you?”</i>");
		}
		//[if (gender = herm)]
		else if(pc.hasCock() && pc.hasVagina()) {
			//if (tail > 0)
			if(pc.tailCount > 0) output("\n\nHis arm shifts to brush your [pc.tails] out of the way gently, allowing him to see everything that rests between your hind [pc.legs].");
			else output("\n\nHe takes a moment to look you over, smiling as he admires the view of everything between your hind legs.");
			output(" Burt smiles up at you as his hands caress your flanks, letting one reach beneath you to wrap around your [pc.cockBiggest] and the other tease across [pc.eachVagina] gently. It is clear what his focus is though, as he lifts his head to [pc.eachVagina] and begins to kiss and lick across those feminine folds while his hand slowly strokes and teases your dick. His tongue explores your most intimate of flesh, digging into you and spiraling around as deep as he can reach. He wants you to cum, and cum hard, and does his best to bring you to that edge, showing great skill with his practiced tongue. When you start to hunch and undulate with your pending orgasm, he starts to stroke your cock harder");
			if(pc.hasClit()) output(", catching your [pc.clit] in his mouth and sucking hard at it");
			output(". ");
			if(pc.isSquirter()) output("He gasps around your pleasure bud as you hit your climax and your juices surge from within you, splashing across his face and chest in a hot and musky mess.");
			else output("He gasps around your pleasure bud as your body bucks and lurches in bliss before him in the throes of your orgasm.");
			output(" He keeps your maleness pointed straight, unable to watch as ");
			//[if (cumNormal = true)
			if(pc.cumQ() <= 25) output("your [pc.cockBiggest] twitches in his hand, splashing your [pc.cum] across the floor.");
			else if(pc.cumQ() <= 75) output("your [pc.cockBiggest] pulse in his hand, splashing the floor with your ample [pc.cum].");
			else if(pc.cumQ() <= 150) output("your [pc.cockBiggest] jerk in his grip, sending pulse after pulse of your [pc.cum] splashing across the floor and his cot.");
			else if(pc.cumQ() <= 500) output("your [pc.cockBiggest] jerk in his grip, hosing the floor and his cot with your [pc.cum].");
			else output("your [pc.cockBiggest] burst like an overtaxed dam, drenching his cot in a thick [pc.cumColor] puddle as you pump out enough [pc.cum] that it could have filled a mead barrel.");
			output(" Burt pats your [pc.butt] softly and asks, <i>“Feeling better now, [pc.name]?”<i/>");
		}
		//[if (gender = neuter)]
		else {
			//[if (tail > 0)
			if(pc.tailCount > 0) output("\n\nHis arm shifts to brush your [pc.tails] out of the way gently, allowing him to see the genderless expanse between your hind [pc.legs].");
			else output("\n\nHe takes a moment to look you over, frowning as he looks over the genderless expanse between your hind legs.");
			output(" Burt smiles and admits sheepishly, <i>“I’m not really sure what to do with you down here.”</i> Still, he isn’t against trying. He continues to lick gently at the featureless patch of [pc.skin] between your [pc.legs]. He slips a finger into your [pc.asshole] and starts to slowly finger you as though it were a pussy, trying to find some way to bring you to an orgasmic release. He is content to spend the whole of his break trying to get you off, licking and kissing your genderless loins and fingering your ass. By the time his tongue and fingers are exhausted, he looks up at you and asks with honest confused curiosity, <i>“So, uh... was it good for you at all?”</i> a look of relief crossing his face when you assure him that it was.");
		}
	}
	//[if (biped = true)]
	else {
		output("You mention that you would enjoy getting a little attention yourself and Burt grins, easing you down onto the cot. You spread your [pc.legs] wide and expose your loins to his attention, smiling eagerly. ");
		if(pc.hasVagina()) output("He lets his breath wash over [pc.eachVagina], inhaling your musky scent and smirking as he begins to place soft kisses around your [pc.vagina].");
		else if(pc.hasCock()) output("He lets his lips press in teasing kisses across [pc.eachCock], smirking up at you as he teases your senses.");
		else output("Burt chuckles for a moment at the general lack of things to use his mouth on, kissing at your vacant groin for a moment before letting his tongue lathe across it.");
		
		//if (gender = female)
		if(pc.hasVagina() && !pc.hasCock()) {
			output("\n\nBurt raises one hand to tease through your tender folds, spreading [pc.eachVagina] open to his view, before he leans in to kiss and nibble at your most intimate of flesh. He takes his time, wanting to really inflame your passion and pleasure before his tongue begins to dig into you, the stubble of his five o’clock shadow scratching at your inner thighs and [pc.ass] as he works. He clearly has had a great deal of practice with pleasuring his lovers like this, and soon enough he has your insides churning in blissful need as he pushes you towards the edge of climax. He doesn’t try to drag it out or tease you, instead he pushes you right over that edge, ");
			if(pc.isSquirter()) output("gasping as you hit your climax and your juices surge from within you, splashing across his face and chest in a hot and musky mess.");
			else output("grinning as your body bucks and lurches in bliss beneath him in the throes of your orgasm.");
		}
		//[if (gender = male)]
		else if(pc.hasCock() && !pc.hasVagina()) {
			//if (cocks = 1)
			if(pc.cockTotal() == 1) output("\n\nBurt lets his hand stroke along your [pc.cock] gently as he moves to kiss and lick at your tip, urging out musky beads of your precum and licking them away.");
			//[if (cocks > 1)]
			else output("\n\nBurt lets his attention focus on your [pc.cockBiggest], wrapping his hand around it gently and stroking it softly as he moves to kiss and lick at the tip, urging out musky beads of your precum and licking them away while his free hand closes around your [pc.cockSmallest] and tugs it to the side somewhat to casually jerk off.");
			output(" He lifts his head and smirks at you, saying, <i>“I don’t often play with boys like this, so forgive my inexperience.”</i> He keeps teasing and caressing [pc.eachCock], slowly working you to the edge of climax. When it looks like you are about to blow, he backs his head away and aims [pc.eachCock] up towards your face. He grins at you as your orgasm rips through your body, and watches as ");
			//[if (cumNormal = true)
			if(pc.cumQ() <= 25) output("[pc.eachCock] twitches in his hands, splashing your belly with your [pc.cum].");
			//if (cumMedium = true) 
			else if(pc.cumQ() <= 50) output("[pc.eachCock] pulses in his hands, splashing your belly and [pc.fullChest] with your ample [pc.cum].");
			//if (cumHigh = true)
			else if(pc.cumQ() <= 150) output("[pc.eachCock] jerks in his grip, sending pulse after pulse of your [pc.cum] splashing across your [pc.fullChest] and face.");
			else if(pc.cumQ() <= 500) output("[pc.eachCock] jerks in his grip, hosing your [pc.fullChest] and face with your [pc.cum].");
			else output("[pc.eachCock] bursts like an overtaxed dam, drenching you in a thick [pc.cumColor] paste as you pump out enough [pc.cum] that it pools in his cot, leaving him laughing at your plight.");
			output(" He catches his breath and smirks, asking, <i>“Was it good for you?”</i>");
		}
		//[if (gender = herm)]
		else if(pc.hasCock() && pc.hasVagina()) {
			output("\n\nBurt smiles up at you as his hands caress your [pc.legs], letting one wrap around your [pc.cockBiggest] and the other tease across [pc.eachVagina] gently. It is clear what his focus is though, as he lowers his head to [pc.eachVagina] and begins to kiss and lick across those feminine folds while his hand slowly strokes and teases your dick. His tongue explores your most intimate of flesh, digging into you and spiraling around as deep as he can reach, while the stubble of his five o’clock shadow scratches at your inner thighs and [pc.butt]. He wants you to cum, and cum hard, and does his best to bring you to that edge, showing great skill with his practiced tongue. When you start to hunch and undulate with your pending orgasm, he starts to stroke your cock harder");
			if(pc.hasClit()) output(", catching [pc.oneClit] in his mouth and sucking hard at it");
			output(".");
			if(pc.isSquirter()) output(" He gasps around your pleasure bud as you hit your climax and your juices surge from within you, splashing across his face and chest in a hot and musky mess.");
			else output(" He gasps around your pleasure bud as your body bucks and lurches in bliss beneath him in the throes of your orgasm.");
			output(" He keeps your maleness pointed up towards you, watching ");
			//if (cumNormal = true)
			if(pc.cumQ() < 25) output("your [pc.cockBiggest] twitches in his hand, splashing your belly with your [pc.cum].");
			else if(pc.cumQ() < 50) output("your [pc.cockBiggest] pulse in his hand, splashing your belly and [pc.fullChest] with your ample [pc.cum].");
			else if(pc.cumQ() < 150) output("your [pc.cockBiggest] jerk in his grip, sending pulse after pulse of your [pc.cum] splashing across your [pc.fullChest] and face.");
			else if(pc.cumQ() < 500) output("your [pc.cockBiggest] jerk in his grip, hosing your [pc.fullChest] and face with your [pc.cum].");
			else output("your [pc.cockBiggest] burst like an overtaxed dam, drenching you in a thick [pc.cumColor] paste as you pump out enough [pc.cum] that it pools in his cot, leaving him laughing at your plight.");
			output(" Burt sighs as the afterglow settles into you and asks, <i>“Feeling better now, [pc.name]?”<i/>");
		}
		//if (gender = neuter)
		else {
			output("\n\nBurt smiles and admits sheepishly, <i>“I’m not really sure what to do with you down here.”</i> Still, he isn’t against trying. He continues to lick gently at the featureless patch of [pc.skinFurScales] between your thighs. He slips a finger into your [pc.asshole] and starts to slowly finger you as though it were a pussy, trying to find some way to bring you to an orgasmic release. He is content to spend the whole of his break trying to get you off, licking and kissing your genderless loins and fingering your ass. By the time his tongue and fingers are exhausted, he looks up at you and asks with honest confused curiosity, <i>“So, uh... was it good for you at all?”</i> a look of relief crossing his face when you assure him that it was.");
		}
	}
	processTime(20+rand(5));
	pc.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",randomBurtSexExit);
}

//Anal
public function burtsWeinerInYourButt():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("You mention that you wouldn’t mind trying to take Burt’s monstrous shaft, and he nods, considering it before saying, <i>“I would be willing to oblige, but I want a piece of ass right now.”</i> ");
	if(pc.willpower() > 29) output("You blush and swallow, but agree, nodding silently.");
	else output("You eagerly agree, your [pc.asshole] giving a twitch in anticipation. You grin wide as you press against him and lick your lips.");
	
	//[if (naga = true)] 
	if(pc.isNaga() || pc.legCount <= 1) {
		output("\n\nBurt grins at you and puts weight against your abdomen, pushing you gently back onto the cot as he slips a hand down to tease along your [pc.legOrLegs], finding your [pc.asshole] and teasing a finger around it. He lowers his head and spits onto the puckered hole before moving to line up his cybernetic erection, the horse tipped flare pushing against your back door bluntly.");
		//if (analCapacity = tight) 
		if(pc.ass.looseness() <= 2) output("\n\nBurt isn’t gentle as he drives forward into your back door, his broad flare making you cry out in a mix of pain and pleasure as it forces your [pc.asshole] to stretch vulgarly around him. That cybernetic horsecock drives in deep, sliding smoothly into your tight rectum until his medial ring pops into your body.");
		else if(pc.ass.looseness() <= 3.5) output("\n\nBurt isn’t gentle as he drives forward into your back door, his broad flare slipping into your well trained ass and feeling just perfect as your [pc.asshole] stretches around him. That cybernetic horsecock drives in deep, slipping in until his medial ring pops into your body, fitting into your rectum like a hand in a glove.");
		else output("\n\nBurt isn’t gentle as he shoves forward into your back door, letting out a gasp of surprise as his cock just slides right into your [pc.asshole], his cybernetic horsecock less than a challenge for your well trained hole, causing Burt to chuckle out something about throwing a sausage down a hallway.");
		output(" He takes hold of your hips and grins at you as he starts to draw back, only to thrust deep into you again, soon enough slapping his crotch to yours with every thrust. His medial ring provides delicious stimulation for you as it bumps past your [pc.asshole] again and again, and that flare plunges into your guts over and over.");
		pc.buttChange(burt.cockVolume(0));
		
		output("\n\nThere is skill behind his movements, but he doesn’t focus on it, instead he relies on his stamina and power as he fucks you hard and fast. He is relentless, tireless, the endurance of well trained muscles and an artificial cock letting him threaten to fuck you raw.");
		//[if (biggestTitSize > 0)]
		if(pc.biggestTitSize() > 1) 
		{
			output(" Your [pc.fullChest] bounce");
			if(pc.bRows() == 1) output("s");
			output(" wildly with each hilting, drawing his eyes and urging a grin out of the man.");
		}
		output(" You can see a bulge rise in the [pc.skin] of your belly with each hilting, as he forces your body to distort to accept his length. You let your hand brush over that pulsing bulge, feeling how deep inside you he gets with every thrust.");
		output("\n\nIt is intense, sure, but at the same time, there is no denying that a part of you loves the feeling of getting fucked so hard and so deep by the grim faced and groaning man above you, smelling his sweat and watching the way he focuses so single mindedly on fucking you.");
	}
	//[if (taur = true)]
	else if(pc.isTaur())
	{
		output("\n\nBurt smirks, motioning for you to turn around as he caresses your flanks, spreading the cheeks of your [pc.butt] to look at your [pc.asshole]. He settles up behind you and spits against that crinkled ring, before lining his blunt flared equine erection up against your back passage and giving a gentle push.");
		
		//[if (analCapacity = tight)
		if(pc.ass.looseness() <= 2) output("\n\nBurt isn’t gentle as he drives forward into your back door, his broad flare making you cry out in a mix of pain and pleasure as it forces your [pc.asshole] to stretch vulgarly around him. That cybernetic horsecock drives in deep, sliding smoothly into your tight rectum until his medial ring pops into your body.");
		//[if (analCapacity = medium)]
		else if(pc.ass.looseness() <= 3.5) output("\n\nBurt isn’t gentle as he drives forward into your back door, his broad flare slipping into your well trained ass and feeling just perfect as your [pc.asshole] stretches around him. That cybernetic horsecock drives in deep, slipping in until his medial ring pops into your body, fitting into your rectum like a hand in a glove.");
		//[if (analCapacity = loose)]
		else output("\n\nBurt isn’t gentle as he shoves forward into your back door, letting out a gasp of surprise as his cock just slides right into your [pc.asshole], his cybernetic horsecock less than a challenge for your well trained hole, causing Burt to chuckle out something about throwing a sausage down a hallway.");
		output(" He takes hold of your flanks and grins at you as he starts to draw back, only to thrust deep into you again, soon enough slapping his crotch your [pc.butt] with every thrust. His medial ring provides delicious stimulation for you as it bumps past your [pc.asshole] again and again, and that flare plunges into your guts over and over.");
		pc.buttChange(burt.cockVolume(0));
		output("\n\nThere is skill behind his movements, but he doesn’t focus on it, instead he relies on his stamina and power as he fucks you hard and fast. He is relentless, tireless, the endurance of well trained muscles and an artificial cock letting him threaten to fuck you raw. It is intense, sure, but at the same time, there is no denying that a part of you loves the feeling of getting fucked so hard and so deep by the grim faced and groaning man above you, smelling his sweat and watching the way he focuses so single mindedly on fucking you.");
	}
	//[if (biped = true)]
	else {
		output("\n\nBurt grins at you and spins you around abruptly, pushing against the small of your back to send you over one of the Mead barrels, his hand sliding down across your [pc.butt] and his fingers pushing in against your [pc.asshole], spreading your cheeks apart before spitting on the crinkled pit to help lubricate it. He then stands up and presses his cybernetic erection against your anal bud, the broad flare pressing against you bluntly.");
		//if (analCapacity = tight) 
		if(pc.ass.looseness() <= 2) output("\n\nBurt isn’t gentle as he drives forward into your back door, his broad flare making you cry out in a mix of pain and pleasure as it forces your [pc.asshole] to stretch vulgarly around him. That cybernetic horsecock drives in deep, sliding smoothly into your tight rectum until his medial ring pops into your body.");
		//[if (analCapacity = medium)]
		else if(pc.ass.looseness() <= 3.5) output("\n\nBurt isn’t gentle as he drives forward into your back door, his broad flare slipping into your well trained ass and feeling just perfect as your [pc.asshole] stretches around him. That cybernetic horsecock drives in deep, slipping in until his medial ring pops into your body, fitting into your rectum like a hand in a glove.");
		//[if (analCapacity = loose)]
		else output("\n\nBurt isn’t gentle as he shoves forward into your back door, letting out a gasp of surprise as his cock just slides right into your [pc.asshole], his cybernetic horsecock less than a challenge for your well trained hole, causing Burt to chuckle out something about throwing a sausage down a hallway.");
		output(" He takes hold of your hips and grins at you as he starts to draw back, only to thrust deep into you again, soon enough slapping his crotch your [pc.butt] with every thrust. His medial ring provides delicious stimulation for you as it bumps past your [pc.asshole] again and again, and that flare plunges into your guts over and over.");
		pc.buttChange(burt.cockVolume(0));
		
		output("\n\nThere is skill behind his movements, but he doesn’t focus on it, instead he relies on his stamina and power as he fucks you hard and fast. He is relentless, tireless, the endurance of well trained muscles and an artificial cock letting him threaten to fuck you raw. ");
		if(pc.biggestTitSize() >= 1) {
			output("Your [pc.fullChest] flatten");
			output(" against the mead barrel with each thrust deep into you, pushing you forward. ");
		}
		output("You can feel a bulge rise in the [pc.skinFurScales] of your [pc.belly] with each hilting, as he forces your body to distort to accept his length. You let your hand brush over that pulsing bulge, feeling how deep inside you he gets with every thrust.");
		output("\n\nIt is intense, sure, but at the same time, there is no denying that a part of you loves the feeling of getting fucked so hard and so deep by the grim faced and groaning man above you, smelling his sweat and watching the way he focuses so single mindedly on fucking you.");
	}
	//MERGE:
	output("\n\nBurt clearly doesn’t care if you cum or not, but with how long he pounds away at you, it doesn’t matter, you feel yourself explode in bliss again and again before he is done, the man slamming hard against you one last time as his mouth goes slack and his cybernetic crown flares within you wide, letting pulse after pulse of his hot cum splash into your intestines. It takes him a few minutes after that to pull away, his still erect member popping free of your [pc.asshole] as he catches his breath and grins at you, <i>“Thanks, [pc.name], I needed that.”</i>");
	//[Next] (-All Lust, Random Sex Exit)
	processTime(25+rand(10));
	pc.orgasm();
	pc.loadInAss(chars["BURT"]);
	this.clearMenu();
	this.addButton(0,"Next",randomBurtSexExit);
}

//Vaginal
public function burtSticksItInThePCsVajayjay():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("You smirk and tell Burt that you definitely know where he can put that tool of his, and he chuckles his agreement.");
	var x:int = pc.cuntThatFits(burt.cockVolume(0));
	if(x < 0) x = 0;
	//if (naga = true)
	if(pc.isNaga() || pc.legCount <= 1)
	{
		output("\n\nHe gently lays you on your belly on the cot, his hands stroking your [pc.hips] tenderly before he gives your [pc.butt] a teasing slap. He lifts your [pc.legOrLegs] over his shoulder and lets you coil around him as he exposes your [pc.vagina " + x + "] to his cybernetic equine manhood.");
		//if (vagCapacity = tight)
		if(pc.vaginas[x].looseness() <= 2) output("\n\nYou grit your teeth as Burt starts to press his hips forward, slowly forcing your [pc.vagina " + x + "] to spread open for his broad flare, stretching you vulgarly as he slowly sinks that tool into you.");
		//[if (vagCapacity = medium)
		else if(pc.vaginas[x].looseness() <= 3.5) output("\n\nYou moan with pleasure as Burt starts to slide his equine erection into your [pc.vagina " + x + "], stretching you just perfectly as he sinks that tool deep into you.");
		else output("\n\nYou shiver with excitement as Burt slides his equine erection effortlessly into your [pc.vagina " + x + "], hilting his tool within your well stretched hole without any difficulty.");
		output(" He gives a gasp of pleasure and begins to thrust in and out of you, his pace starting slow and even, but slowly building until he is slamming into you with a pace that jostles your whole body, his hips threatening to bruise yours as they slam against you again and again with sharp slaps.");
		pc.cuntChange(x,burt.cockVolume(0),true,true,false);
		
		output("\n\n");
		//if (biggestTitSize > 0)
		if(pc.biggestTitSize() >= 1) {
			output("Your [pc.fullChest] flatten");
			if(pc.bRows() == 1) output("s");
			output(" against the cot’s rough bedding with each thrust deep into your sex, pushing you forward roughly. ");
		}
		//if (cock > 0) 
		if(pc.cockTotal() > 1) {
			output("[pc.EachCock] swells with the pleasure of his deep drives into your body, dragging against the cot in vain echo of his own thrusts.");
		}
		//if (isSquirter = true)
		if(pc.isSquirter()) output(" The pleasure of being fucked so completely builds in the pit of your stomach like an ever tightening knot of need, and when it finally snaps, it does so with a surge. Your juices flare out of your pussy in hot pulsing waves, splashing across Burt’s belly and thighs and filling the air with your musk.");
		//[if (isSquirter = false)
		else output(" The pleasure of being fucked so completely builds in the pit of your stomach like an ever tightening knot of need, and when it finally snaps, you feel your body shudder with wracking spasms of bliss.");
	}
	//[if (taur = true)]
	else if(pc.isTaur())
	{
		output("\n\nHe steps around behind you, stroking a hand across your second back, delivering a sharp and teasing slap to your [pc.butt] as he settles between your hind legs. ");
		if(pc.tailCount > 0) output("He takes hold of your [pc.tails], lifting it out of the way and also gripping it like a handle");
		else output("He rubs his hands over your flanks, before taking hold of the thighs of your hind legs");
		output(", levering his cybernetic stallionhood’s flare against the entrance to your [pc.vagina " + x + "].");
		
		//if (vagCapacity = tight)
		if(pc.vaginas[x].looseness() <= 2) output("\n\nYou grit your teeth as Burt starts to press his hips forward, slowly forcing your [pc.vagina " + x + "] to spread open for his broad flare, stretching you vulgarly as he slowly sinks that tool into you.");
		//if (vagCapacity = medium)
		else if(pc.vaginas[x].looseness() <= 3.5) output("\n\nYou moan with pleasure as Burt starts to slide his equine erection into your [pc.vagina " + x + "], stretching you just perfectly as he sinks that tool deep into you.");
		else output("\n\nYou shiver with excitement as Burt slides his equine erection effortlessly into your [pc.vagina " + x + "], hilting his tool within your well stretched hole without any difficulty.");
		output(" He gives a gasp of pleasure and begins to thrust in and out of you, his pace starting slow and even, but slowly building until he is slamming into you with a pace that jostles your whole body, his hips bouncing off your [pc.butt] again and again with sharp slaps.");
		pc.cuntChange(x,burt.cockVolume(0),true,true,false);
		output("\n\n");
		//if (cock > 0)
		if(pc.cockTotal() > 1) output("[pc.EachCock] bounces beneath you, erect and aching as Burt pounds into your feminine core. ");
		//if (isSquirter = true)
		if(pc.isSquirter()) output("The pleasure of being fucked so completely builds in the pit of your stomach like an ever tightening knot of need, and when it finally snaps, it does so with a surge. Your juices flare out of your pussy in hot pulsing waves, splashing across Burt’s belly and thighs and filling the air with your musk.");
		else output("The pleasure of being fucked so completely builds in the pit of your stomach like an ever tightening knot of need, and when it finally snaps, you feel your body shudder with wracking spasms of bliss.");
	}
	//[if (biped = true)]
	else {
		output("\n\nHe gently lays you back on the cot, his hands caressing your [pc.hips] as he looks your body over. He lifts your [pc.legs] up over his shoulders to give him better access to your [pc.vagina " + x + "], easing the flare of his cybernetic manhood to your entrance.");
		//if (vagCapacity = tight)
		if(pc.vaginas[x].looseness() <= 2) output(" You grit your teeth as Burt starts to press his hips forward, slowly forcing your [pc.vagina " + x + "] to spread open for his broad flare, stretching you vulgarly as he slowly sinks that tool into you.");
		//if (vagCapacity = medium)
		else if(pc.vaginas[x].looseness() <= 3.5) output(" You moan with pleasure as Burt starts to slide his equine erection into your [pc.vagina " + x + "], stretching you just perfectly as he sinks that tool deep into you.");
		//if (vagCapacity = loose)
		else output(" You shiver with excitement as Burt slides his equine erection effortlessly into your [pc.vagina " + x + "], hilting his tool within your well stretched hole without any difficulty.");
		output(" He gives a gasp of pleasure and begins to thrust in and out of you, his pace starting slow and even, but slowly building until he is slamming into you with a pace that jostles your whole body, his hips threatening to bruise yours as they slam against you again and again with sharp slaps.");
		pc.cuntChange(x,burt.cockVolume(0),true,true,false);
		
		output("\n\n");
		//if (biggestTitSize > 0)
		if(pc.biggestTitSize() > 0) 
		{
			output("Your [pc.fullChest] bounce");
			if(pc.totalBreasts() == 1) output("s");
			output(" wildly with each hilting thrust, drawing his eyes to them and urging a grin out of the man. ");
		}
		//if (cock > 0)
		if(pc.cockTotal() > 0) output("[pc.EachCock] swells with your growing pleasure, rising proudly with your growing bliss between the two of you. ");
		//[if (isSquirter = true)
		if(pc.isSquirter()) output("The pleasure of being fucked so completely builds in the pit of your stomach like an ever tightening knot of need, and when it finally snaps, it does so with a surge. Your juices flare out of your pussy in hot pulsing waves, splashing across Burt’s belly and thighs and filling the air with your musk.");
		else output("The pleasure of being fucked so completely builds in the pit of your stomach like an ever tightening knot of need, and when it finally snaps, you feel your body shudder with wracking spasms of bliss.");
	}
	
	output("\n\nHe doesn’t finish when you do. His own orgasm is far from ready to spill over. He grins at you and slows his pace until you come down from it before resuming his earlier pace, fucking you long and hard. Your second orgasm hits you before long, with a third and a fourth on its tails as Burt keeps slamming against your body hard enough that you know you will be bruised in the morning, but for now the bliss of being fucked pushes it from your mind.");
	
	output("\n\nIt isn’t until your sixth explosive climax that he finally empties himself into you, his equine flare expanding to lock within you as he begins painting your womb with pulse after hot pulse of his virile seed. It makes the possibility of bearing this backwater bartender’s babies a very real thing, which only adds to the pleasure of your final orgasm. He starts to fall back, exhausted and spent, his still swollen chrome flare popping with a lewd wet sound from your [pc.vagina " + x + "] as some of his seed oozes out of you in a slow trickle.");
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	processTime(30+rand(15));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.loadInCunt(chars["BURT"], x);
	this.clearMenu();
	this.addButton(0,"Next",randomBurtSexExit);
}

//Handjob
public function giveBurtAHandyYouSlooooooooooot():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("You reach out with your hands and wrap them around the base of his artificial erection, feeling the metal that is smooth and perfect, and as warm as Burt’s own flesh. He’s a big guy, and his cock is even bigger, so wide that you need both hands just to get all the way around it. ");
	if(pc.intelligence() > 75) output("Up close, you can see how the interlocking metal and plastic plates grant the illusion of give without actually having any real flexibility. Plastic veins run the length of his rod, hiding thermal and moisture gauges, and friction gauges beneath the plates allow him to feel drag and pressure. ");
	output("He groans in pleasure as you caress his artificial flesh, reaching his hands down to stroke lovingly through your [pc.hair].");
	
	output("\n\nAs smooth as the metal and plastic plates are on that horse-like cock, it is easy to slide your hands up and down, and you can hear the soft exhales of pleasure from Burt as you do so, rewarding your actions. The chromed metal flare of his erection expands slightly, exposing thin cracks between the plates that are filled by angled plastic to keep him smooth and safe, and a bead of precum forms like a pearl in the divot of his urethral vent. It smells human enough, and when you lean in to lick at it, it tastes human as well.");
	
	output("\n\nHe shudders at the lick and smiles down at you, encouraging you with soft groans and grunts of pleasure.");
	
	output("\n\nTaking the encouragement for what it is, you begin to slide your hands up and down his length, able to forget that it is metal and plastic with how naturally it shifts and moves as though made of flesh and blood. You can feel the rise of the medial ring in the center of his cock, like a speedbump for your hands as you work to jerk him off, and each time your grip passes over it he lets out the most adorable groan. Brushing your hands over his flare makes him shiver and arch his hips out towards you, almost thrusting against your grip.");
	//[pg]
	pc.lust(5);
	this.clearMenu();
	this.addButton(0,"Next",burtHandyPartDeux);
}

public function burtHandyPartDeux():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("Listening to the sounds Burt makes, and the way he moves, you figure out his ideal speed, your hands driving up and down that hard equine length over and over, in an almost exhausting pace. The smell of aroused male fills your nostrils and you can see Burt’s toned abdomen flex and bounce with his quickened breaths.");
	//if (hasVagina = true)
	if(pc.hasVagina())
	{
		output(" You can feel your pussy flush with heat, thoughts of taking Burt’s intimidating tool internally rushing through your head. A trickle of moisture begins to drool out of your [pc.vaginas] and a tingle of pleasure teases");
		if(pc.hasClit()) output(" through your [pc.clits]");
		else output(" your nethers");
		output(".");
	}
	//if (hasCock = true) 
	if(pc.hasCock()) output(" Giving the intimate massage to Burt’s erection causes a sympathetic reaction in your own loins, as [pc.eachCock] swells erect and pulses with need.");
	
	output("\n\nYou keep pumping your hands up and down Burt’s length, looking right into the eye of his flared cockhead, seeing your own reflection distorted in the chrome. You let your [pc.tongue] tease across that crown, licking up the now steady drool of precum that leakes from his flare. He gives little gasps and bucks against your mouth as you lick at him, hinting that he is close.");
	
	//if (will < 20)
	if(pc.willpower() < 20) output("\n\nYou close your eyes and open your mouth, shivering in anticipation of the powerful man’s coming climax. You hear him grunt out, <i>“Oh fuck, [pc.name]....”</i> and then the first surge of his cum splashes across the right side of your face. You shift your head and your grip on his cock, trying to aim him at your mouth, and take the second blast right in the nose, plastering both your eyes shut and filling your nostrils with the scent of cum and musk. The third and fourth pulses of seed reach your mouth though, letting you taste him and savor the hot slimy seed before swallowing and grinning up at him.");
	else output("\n\nYou grab one of Burt’s bar rags, shivering in anticipation of the powerful man’s coming climax. You hear him grunt out, <i>“Oh fuck, [pc.name]....”</i> and press the rag to the top of his flare as you continue to jerk him off, feeling it grow hot and wet as the first surge of his cum flows into it. You smile up at Burt as you catch each pulse in that now sticky and wet rag, polishing his flare with it at the end to leave him clean.");
	//[pg]
	processTime(15);
	pc.lust(5);
	this.clearMenu();
	this.addButton(0,"Next",randomBurtSexExit);
}

//Rimjob
public function lickBurtsAssholeYouFilthyButtlicker():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	//if (will > 29)
	if(pc.willpower() > 29) output("You look up at Burt’s naked body, blushing as you consider what you want to do. You catch a sweet scent in the air around him, mixed in with the heady musk of his masculinity, and you find yourself drawn to it, licking your lips as you look around behind Burt at his tight and toned ass. He chuckles as he looks back at you and asks, <i>“What, wanting a taste?”</i> You find yourself nodding despite yourself.");
	//[if (will < 30)]
	else output("You lick your lips as you smile up at Burt past his naked body, your hands reaching out to caress his hips. You turn him around and inhale deeply, enjoying the sweet flavor that mixes with his musk as you look at that toned and firm ass of his. You lick your lips and push in to kiss his ass full on the cheek. He chuckles and looks back at you, asking, <i>“Wanting a taste?”</i> You nod eagerly and kiss his other cheek with a soft moan of pleasure.");
	
	output("\n\nBurt leans against one of the mead barrels to better expose his ass to you. You push Burt’s toned cheeks apart and look in at the rosy crinkled star of his anus, and you can quickly find that it is the source of the sweet scent in the air. His anus glistens with a golden moisture that smells strongly of Zil honey. You find yourself unable to resist leaning in to take a quick lick across the puckered skin, tasting the rich sugary delight. You can feel more of the honey bead up and leak across your tongue as you drag it in lick after lick.");
	
	output("\n\nBurt moans softly and says, <i>“So it turns out that some female Zil secrete a chemical that is designed to make sure that their eggs get the proper nourishment... after my time out there, well... It seems to have become permanent--just, uh, don’t ask about how it got up there....”</i>");
	
	output("\n\nYou find yourself laughing softly at the thought of Burt having a literal honeypot, and you go back in for a few more licks, enjoying the rich flavor that is left sticky and sweet on your tongue. You decide that you have to have more, and push your face firmly into the crack of his ass, your cheeks trapped between his as you dig your tongue into his musky and sweet anal pit.");
	//[if (tongue = super long)]
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output("\n\nYour [pc.tongue] teases around the tight crinkle of Burt’s tight anus and slowly pushes into his honey lubricated hole, digging in and twisting around in search of more of that delicious musky sugar. You can hear him moan and shift before you as your insanely long tongue teases at his sensitive entrance and seeks out the soft knot of his prostate before delving in deeper, snaking through his honey filled rectum until you reach the sphincter of his colon, teasing him there for a few long moments before digging deep into his intestines. Burt gasps as he feels your tongue writhe and probe through his abdomen, his hands going to his belly as your lengthy tongue threatens to French kiss him in reverse, the man gasping out, <i>“Oh fuck... wow...”</i>");
	//[if (tongue = long)]
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nYour [pc.tongue] teases around the tight crinkle of Burt’s tight anus and slowly pushes into his honey lubricated hole, digging in and twisting around in search of more of that delicious musky sugar. You can hear him moan and shift before you as your long tongue teases at his sensitive entrance and seeks out the soft knot of his prostate before delving in deeper, snaking through his honey filled rectum until you reach the sphincter of his colon and threaten to tease at the very bottom of his intestines.");
	//[if (tongue = normal)]
	else output("\n\nYour [pc.tongue] teases around the tight crinkle of Burt’s tight anus and slowly pushes into his honey lubricated hole, digging in and twisting around in search of more of that delicious musky sugar. You can hear him moan and shift before you as your tongue teases at his sensitive entrance and seeks out the soft knot of his prostate.");
	
	output("\n\nYour tongue deep in Burt’s ass, tasting that oozing honey, it is easy enough to feel him clench as his climax hits him. He groans and his cybernetic horse cock paints pulse after pulse of his creamy spend across the barrel before him, showing that he enjoyed your ministrations greatly.");
	if(pc.hasCock() && !pc.hasVagina()) output(" You feel [pc.eachCock] pulse erect, eager for attention, proving that you liked that more than you might have wished.");
	else if(pc.hasVagina() && !pc.hasCock()) output(" You can feel your juices oozing from [pc.eachVagina] as you try to catch your breath, proving that you liked doing that a lot more than you thought you would.");
	else if(pc.hasVagina() && pc.hasCock()) output(" You feel [pc.eachCock] pulse erect and eager for attention, and a trickle of hot lust oozes down your thigh from your [pc.eachVagina], proving that you enjoyed that a lot more than you thought you would.");
	
	//[Next] (-1 Will, +5 Lust, Random Sex Exit)
	processTime(20+rand(6));
	pc.lust(5);
	this.clearMenu();
	this.addButton(0,"Next",randomBurtSexExit);
}

//Titfuck
public function titFuckBurtBecauseYoureAFilthyFatChestedHo():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("You move your hands to your [pc.fullChest], lifting and pressing your pillows together, giving Burt a teasing wink, and he grins as he gets the idea. He pushes his equine shaft between the curves of your ample breasts and starts to gently saw up and down, letting you lick and kiss at his flared tip whenever his thrusts are at their highest. He groans as your breasts caress and slide along his metal and plastic length, his hands stroking through your [pc.hair] gently.");
	//[if (lipples = true)]
	if(pc.hasLipples()) 
	{
		output("\n\nHe looks down at your [pc.nipples] and smirks as an idea comes to his mind, his hands leaving your head to begin fingering your juicy teat holes in time with the thrusting of his cock between your fleshy orbs. He traces the kissable bow lips, tracing the sensitive mouths decorating your breasts between deep thrusts of his fingers into your supple titflesh.");
		output("\n\nHe doesn’t seem interested in fucking your [pc.nipples] however, keeping his eyes on your [pc.face] as he continues to hunch and thrust against your [pc.chest], that swollen cybernetic flare bumping your chin with every forward thrust, eager for your kisses and licks. He fucks your breasts with a singular focus, his hips driving at a steady pace focused on his pleasure and not yours. Between thrusts, he grunts out, <i>“You deserve a gift, [pc.name]... how about a pearl necklace?”</i>");
	}
	//[if (nipplecunts = true)]
	else if(pc.hasFuckableNipples()) {
		output("\n\nHe looks down at your [pc.nipples] and smirks as an idea comes to his mind, his hands leaving your head to begin fingering your juicy teat holes in time with the thrusting of his cock between your fleshy orbs. He smears your juices around, occasionally squeezing or tweaking your sensitive nipples between deep thrusts of his fingers into your titflesh.");
		output("\n\nHe doesn’t seem interested in fucking your [pc.nipples] however, keeping his eyes on your [pc.face] as he continues to hunch and thrust against your [pc.chest], that swollen cybernetic flare bumping your chin with every forward thrust, eager for your kisses and licks. He fucks your breasts with a singular focus, his hips driving at a steady pace focused on his pleasure and not yours. Between thrusts, he grunts out, <i>“You deserve a gift, [pc.name]... how about a pearl necklace?”</i>");
	}
	//if (any other nipple = true)
	else {
		output("\n\nHis hands eventually leave your [pc.hair] and slide down across your [pc.chest], teasing gently at your [pc.nipples] as he thrusts into your supple curves over and over. His fingers trace circles around your areola and give your [pc.nipples] the occasional pinch or tug, teasing at the sensitive flesh as he pleasures himself with your body.");
		output("\n\nHe keeps his eyes on your [pc.face] as he continues to hunch and thrust against your [pc.chest], that swollen cybernetic flare bumping your chin with every forward thrust, eager for your kisses and licks. He fucks your breasts with a singular focus, his hips driving at a steady pace focused on his pleasure and not yours. Between thrusts, he grunts out, <i>“You deserve a gift, [pc.name]... how about a pearl necklace?”</i>");
	}
	
	output("\n\nHis pace begins to quicken, powering through the cleft between your breasts hard and fast, forcing you to pull your head back to keep from being knocked unconscious by a hard blow of his flare to the chin.");
	output("\n\nHis hands return to your [pc.hair] as you pull your head back, grinning down at you as he grips firmly to keep you still, pounding and thrusting like the stallion his cybernetic organ is modeled after. He grits his teeth and looks you straight in the eyes, his pace becoming erratic for the last few thrusts, before his hot cum begins to surge from his tip in hot and musky pulses. Pearly white beads of hot cum splatter across your [pc.skinFurScales], leaving your shoulders, neck, chin and chest nicely decorated with Burt’s hot seed.");
	output("\n\nHe groans and gives your cheek a soft caress before drawing his cock out from between your tits, panting as he works to catch his breath.");
	//[Next] (+5 Lust, Random Sex Exit)
	processTime(10+rand(4));
	pc.lust(5);
	this.clearMenu();
	this.addButton(0,"Next",randomBurtSexExit);
}

//Tailfuck - Req's cunttail
public function tailFuckBurtBecauseWhyNot():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("You grin at Burt and let your [pc.tail] slither in a loose spiral around his mechanical cock, and watch as he shivers in pleasure, looking down at that prehensile appendage curiously and spotting your [pc.tailCunt]. He smirks a bit and says, <i>“Oh, this should be interesting.”</i>");
	output("\n\nYou nod and press in, kissing him on the lips as your tail continues to entice and stimulate his artificial equine member. Your [pc.tailCunt] drags across the chromed surface, leaving a slimy trail of slick girlcum as your tail searches out the full length of his shaft as it rests trapped between your body and his.");
	output("\n\nWhen you reach the broad flared apex of his shaft with your heated and pulsing folds, you feel him exhale in a moan into the kiss. You tell him to just relax and let you pleasure him for a change. He nods and leans back against one of the mead barrels, looking down at your tail as it begins to stretch around his cockhead and begin the slow process of swallowing him in rippling gulps. Inch after slow inch of metal cock slides into your [pc.tailCunt], forcing it to stretch to accommodate him.");
	output("\n\nYou let out your own gasp of pleasure as you feel the lips of your [pc.tailCunt] kiss his belly, and then you begin to draw off of him, only to slam back down with as much force as your tail can manage. You hit Burt with the dual assault of your slithering tail and the swallowing grip of your caudal cunt, your hot juices flowing down his shaft as you pump over him.");
	output("\n\nYou watch as his scrotum tightens beneath that equine spear, and then you feel it. Pulse after pulse of his hot seed, flowing into your tail’s greedy cuntal throat. Your tail swallows it all down as your orgasm hits you hard, almost knocking you to your [pc.knees].");
	output("\n\nYour tail slowly draws free of his still twitching and erect shaft, feeling the afterglow settling in your belly, only to have Burt ruin it by chuckling out, <i>“Now that’s what I call getting some tail.”</i> Like you haven’t heard that one before....");
	processTime(14+rand(8));
	pc.orgasm();
	pc.loadInCuntTail(chars["BURT"]);
	this.clearMenu();
	this.addButton(0,"Next",randomBurtSexExit);
}


//Random Sex Exit------------------------------------------------------------------------------------------------------
//NOTE: If you think the Three-Dee rape scene is too intense, and it is possible to have it only happen once, that might be the best way to go about it.
public function randomBurtSexExit():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	if(flags["TIMES_FUCKED_BURT"] == undefined) flags["TIMES_FUCKED_BURT"] = 1;
	else flags["TIMES_FUCKED_BURT"]++;
	var choice:int = rand(4);
	if(choice == 0)
	{
		output("The act of sex over with, Burt pulls you into his arms and sighs happily, closing his eyes as he just holds you and catches his breath. <i>“Thanks, [pc.name], I really needed that. Most people in the post here think my cock is too freakish to give me any attention. They prefer something more natural. It’s nice to have someone who can look past that and just enjoy some good hard fucking.”</i>");
		output("\n\nYou spend the next hour just laying in each other’s arms, and afterwards, Burt helps clean you off and help you put your equipment back on, giving you a slap on your [pc.butt], sending you out into the bar again and leaving him to clean up the back room before returning to his post.");
		//[Next] (Return to Mead Hall main room)
		processTime(1);
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
	}
	//Honey
	else if(choice == 1)
	{
		output("The act of sex over with, Burt pulls you into his arms and sighs happily, closing his eyes as he just holds you and catches his breath. <i>“Thanks, [pc.name], I really needed that. Most people in the post here think my cock is too freakish to give me any attention. They prefer something more natural. It’s nice to have someone who can look past that and just enjoy some good hard fucking.”</i>");
		output("\n\nBefore you can clean up, the waitress, Honey, pokes her head back into the backroom, saying, <i>“Hey Boss, we’re running low on... oh my...”</i> she blushes deeply as she sees you and Burt, naked and clearly just finished with a carnal act. The blonde swallows nervously and stammers out, <i>“...I’ll just... um... come back later.”</i> she then bolts from the back room, slamming the door behind her.");
		output("\n\nYou laugh softly and let Burt go talk with Honey as you slip your gear back on and leave for the main room of the Mead Hall.");
		processTime(1);
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
	}
	//Barfight
	else if(choice == 2) {
		output("Not two minutes after finishing the act with Burt, you both hear a ruckus coming from the bar area. Burt curses and grabs his apron, rushing to the door and throwing it open, still completely in the buff.");
		output("\n\nLooking through the door, you can see and hear the sounds of a good old fashioned bar fight, as the various natives, settlers and explorers throw around fists, bar stools and mugs, laying into each other with little concern for the damage caused. Burt gives a furious shout of, <i>“Damnit, calm the fuck down!”</i> which it appears that no one listens to.");
		output("\n\nYou can see his jaw tense as he grits his teeth and then he thrusts his cock forward, and the equine flare seems to split into four even quadrants, pulling back to reveal a central barrel, which discharges with a tremendous boom. In an instant the bar goes silent, everyone staring at naked Burt and his apparently literal cannon of a cock. Some plaster falls from the ceiling where buckshot chipped it away. Burt begins to lecture the brawlers, who all seem too stunned to continue their roughhousing.");
		output("\n\nYou didn’t know that Burt’s cock could do that... man, it’s a good thing he didn’t do that when he was fucking you.");
		output("\n\nYou stand and pull your gear back on, and slip out of the back room, past the still naked and lecturing Burt. Fortunately, the stunned patrons of the bar are a little too distracted to notice your walk of shame.");
		processTime(2);
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
	}
	//Three-Dee Rape
	else {
		output("A scream from the bar ends any thoughts of a chance to snuggle or enjoy the afterglow with Burt. He looks up and starts towards the door, muttering, <i>“What the hell was that?”</i>");
		output("\n\nYour well trained reflexes prove faster than Burt’s as you snatch your " + pc.rangedWeapon.longName + " from the pile of your clothes on the ground, rushing past the man and into the main room of the Mead Hall, looking for the source of the scream.");
		output("\n\nYou can see the hologram of Three-Dee, flickering with static as she looks at a female Ausar, hoist into the air by one of Three-Dee’s bar mounted black tentacles, coiled tightly around the bitch’s neck.");
		output("\n\nYou raise your " + pc.rangedWeapon.longName + " and aim at the tentacle, pulling the trigger and severing the tendril, letting the Ausar drop and scrabble for the safety of the exit with the rest of the patrons. Meanwhile the hologram turns her full attention on you.");
		output("\n\n<b>It looks like it’s a fight!</b>");
		//[Next]
		processTime(1);
		this.clearMenu();
		this.addButton(0,"Next",threeDSurprise);
	}
}

public function threeDSurprise():void {
	clearOutput();
	author("Danaume");
	userInterface.showName("\nBURT");
	userInterface.showBust("BURT_NUDE");
	output("...or not?");
	output("\n\nYou hear Burt shout a warning to you, but before you can react, tentacles wrap around your [pc.legOrLegs] from behind, hoisting you into the air upside down. Your " + pc.rangedWeapon.longName + " slips out of your grip, landing with a clatter on the floor as Three-Dee’s black tentacles coil around your arms and jerk them out to the sides, rendering you relatively immobile.");
	output("\n\nYou can feel the blood rushing to your head as you are held there, watching as Burt fights through the tentacles, trying to get to the control panel at the bar to turn her off.");
	output("\n\nThere isn’t time, sadly. You can feel her cold black tentacles slithering across your [pc.skinFurScales], exploring you. Her hologram twitches and she stammers out, <i>“Th-this ve-ve-vessel is s-soiled... begin c-cleansing process....”</i>");
	output("\n\nYou don’t have long to think about what that means. The segments of Three-Dee’s tentacles separate, exposing silky soft bristles, like a bottle brush intended for the most fragile of crystal decanters. The bristles begin to spin in alternating directions as she scrubs at your [pc.skin] in ways that make you shiver.");
	//[if (chest > 0)]
	if(pc.biggestTitSize() >= 1) {
		output("\n\nA number of bristle covered tentacles coil around your [pc.fullChest], scrubbing the orbs and bringing your [pc.nipples] fully erect. The tentacles tease and squeeze at your teats, coiled around them tightly.");
		//[if (lipples = true)]
		if(pc.hasLipples()) output(" They tease at the lips of your [pc.nipples], urging them apart and dipping inside to scrub along your breast maws in a disturbingly intimate French kiss.");
		//[if (nippleCunts = true)]
		else if(pc.hasFuckableNipples()) output(" They continue to spiral up to the tips of your musky [pc.nipples] before pulling your fuckable tips open and delving in to plumb your depths as though you were a bottle in need of cleaning instead of a person.");
		//if (dickNipples = true)
		else if(pc.hasDickNipples()) output(" They constrict like cockrings around the base of your titty cocks, squeezing until the flesh darkens with your blood and your precum beads at the tips. They then spiral up the lengths, teasing at your tips and urging out hot blasts of your [pc.cum] across the floor.");
	}
	//if (cock > 0)
	if(pc.cockTotal() > 0)
	{
		output("\n\nThe tentacles find their way to [pc.eachCock], coiling and writhing, scrubbing at your flesh and washing away all traces of musk while also teasing and stimulating you to an achingly erect state.");
		if(pc.balls > 1) output(" Your [pc.balls] are wrapped tight in the coiling metal limbs, brushing them clean and tugging them down from your body somewhat painfully at the same time.");
		output(" The tentacles tease at the entrance to your urethra, probing inwards a short ways as they seek out the source of your leaking precum, before your orgasm rips through you and splatters the tendrils with your [pc.cum].");
	}
	//if (vagina > 0)
	if(pc.hasVagina())
	{
		output("\n\nYour feminine flower doesn’t get overlooked, as tentacles pull the lips of [pc.eachVagina] apart and probe at you in intimate ways.");
		if(pc.hasClit()) output(" [pc.OneClit] is teased and coiled around, and your depths are");
		else output(" Your depths are then");
		output(" filled with numerous spinning tentacles.");
		//[if (pregnant = true)]
		if(pc.isPregnant())
		{
			output(" The tendrils fill [pc.eachVagina] and tease at the knotted muscle of your cervix before pulling away.");
		}
		else output(" The tendrils fill [pc.eachVagina] until they reach the knotted muscle of your cervix, but they aren’t satisfied with that alone, pushing deeper as they seek to clean your womb itself, violating you as deeply as possible before drawing away.");
	}
	output("\n\nOne tentacle finally finds its way to your [pc.asshole], teasing around the entrance slowly before it begins to push into you. You can feel the spinning bristles cleaning your insides as it slowly burrows ever deeper, deeper than anything has ever probed you before, sending tickling sensations and cramps through your bulging abdomen as it flows through every long inch of your gut. Your eyes go wide as you feel something root around in your stomach, followed by the sensation of something going the wrong way through your throat.");
	output("\n\nYou cough several times as you feel that tentacle continue its obscene journey through your body, and finally watch as it bursts forth from between your lips, squirming and coiling in the air in front of your [pc.face].");
	output("\n\nBurt finally gets to the controls, turning Three-Dee off, and you feel a rush of motion as the tentacles retract back the way they came, leaving you feeling empty and spent and sore everywhere as your body is dropped to the ground.");

	//Clear the fluids!
	pc.removeStatusEffect("Anally-Filled");
	pc.removeStatusEffect("Vaginally-Filled");
	pc.removeStatusEffect("Orally-Filled");
	if(flags["TIMES_THREE_D_SURPRISE_SEXED"] == undefined) flags["TIMES_THREE_D_SURPRISE_SEXED"] = 1;
	else flags["TIMES_THREE_D_SURPRISE_SEXED"]++;
	pc.orgasm();
	processTime(5+rand(5));
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

public function stephIrsonBountHunterEpisodeOne():void {
	//[Watch Viewscreen]
	clearOutput();
	stephHeader(1);
	
	flags["STEPH_WATCHED"] = 1;
	
	output("You flop down in a comfy couch near the front of the bar, looking up at a huge Super-HD Viewscreen mounted on the wall. As you sit down, the last commercial break is just coming to an end, telling you to buy Naughty Wyvern brand fibrecondoms before the screen fades to a superimposed logo of <b>Steph Irson: Galactic Huntress</b>, a popular nature show. The camera pans down from a ");
	if(hours < 11) output("bright sunrise ");
	else if(hours < 17) output(" mellow afternoon sun ");
	else if(hours <= 21) output(" dim evening sun ");
	else output(" dark night sky ");
	output("to an athletic young woman in an almost comically skimpy ranger outfit, with khaki hotpants and low-cut shirt rolled up to expose her midriff and ample cleavage both. Her blonde ponytail bounces excitedly as she jogs along through a jungle underbrush, the camera-drone struggling to keep pace with her.");
	
	output("\n\n<i>“We’re here on newly-colonized Mhen’ga, a world of lush jungles and deadly predators,”</i> the host begins in a thick New Brisbane accent, <i>“and we’re on the hunt for the naleen, the apex predator on this planet. Now, imagine a great big lion right out of Africa, a strong, lightning-fast beauty of a huntress, and combine that with the stealth and venom of a deadly adder, and you’ve got the naleen in a nutshell. I’ll have to be so, so careful dealing with these predators, or I’m dead for sure.”</i>");
	
	output("\n\nFor someone supposedly tracking down a lethal hunter, she seems oddly cheerful about it. She crests a hill, tumbles through a thick bush, and eventually comes to a clearing in the jungle, one of the few places where the sun actually gets through to the ground. Resting atop a large boulder in the center is ");
	//if PC's met the naleen:
	if(flags["TIMES_MET_NALEEN"] != undefined) output("a very familiar kitty-naga in the middle of a quick cat-nap");
	else output("what looks like a giant snake coiled around the rocks at first, but as the camera draws in, is clearly half-serpent and half-catgirl, a woman with deliciously large breasts on a feline torso, long orange hair draped around her half-furred body");
	output(".");
	
	output("\n\n<i>“Holy smokes!”</i> Steph whispers to the camera, angling it at the slumbering predator. Insanely, the host approaches, creeping along the ground almost at a crawl. Lazily, the kitty-naga opens a single emerald eye, watching her approach. <i>“Lookit this, a NALEEN! They’re the deadliest predators on this planet, with tails so strong they’d crush me dead in a heartbeat. Lemme see if I can stick mah hand up ‘er cloaca!”</i>");

	output("\n\nIs she insane?");
	
	output("\n\n<i>“W-what are you doing, strange little girl?”</i> the naleen hisses as Steph creeps up. The snake-girl rises off the rock, her feline half looming over the show’s hostess menacingly.");
	
	output("\n\n<i>“Uh-oh, she’s noticed me! If I try to run, she’ll hunt me down in an instant! All I can do is lie perfectly still and hope she backs off! As a predator, the naleen shouldn’t bother me if I’m dead still.”</i>");
	
	output("\n\n<i>“...I can hear you,”</i> the busty monster sighs, cocking an eyebrow at Steph as she lies face-down in the dirt, heart-shaped ass swaying just inches in front of the camera.");
	
	output("\n\n<i>“Crikey! Looks like she’s coming in for the kill! All I can do now is try to overpower her!”</i> Steph shouts, leaping to her feet and tackling the naleen, throwing the two of them over the boulder and into the brush. The camera drone speedily follows the brawl as Steph and the naleen tumble around in the dirt, eventually rolling into a wet mud-pit at the edge of the clearing.");
	
	output("\n\n<i>“W-WHAT ARE YOU DOING!? GET OFF ME!”</i> the naleen howls as Stepth straddles her wide hips victoriously, pinning the huntress down and grabbing her massive tail’s slender tip.");
	
	output("\n\n<i>“There we go, got ‘er by the tail! Now let’s take a look at this beauty! Oh, she’s the real deal: lookit these scales. She’s seen some battles, too, see the dents and scars here?”</i> she says, pointing out the various cuts and old wounds on the naleen’s scales, a history of battle engraved in her body. <i>“Ah, ‘ere we go, see the cloaca engorging? When you hold ‘em, naleen can’t decide if you’re trying to kill ‘em or mate with ‘em! Let’s get a closer look!”</i>");
	
	output("\n\nSome of the bar’s patrons ooh and aah as the camera zooms in on the naleen’s pussy as it visibly engorges, drooling a clear lubricant as Steph pokes a pair of fingers in, stretching the hole several inches wide.");
	
	output("\n\n<i>“D-don’t touch meeeee”</i> the naleen cries, writhing violently under Steph as the show’s host practically shoves her arm into the alien’s sodden box. <i>“...Ooh! Ooohhhh... mmm, yessss, stick your arm riiiiight in, little girl.”</i>");
	
	output("\n\n<i>“There we go!”</i> Steph announces victoriously to the camera, <i>“Elbow-deep in ‘er cloaca. Oh, this is a dream come true! Lookit the way she moves, writhing so gracefully. She’s a real beauty, innit she?”</i>");
	
	output("\n\n<i>“Mmm, you are not so bad yourself,”</i> the naleen coos as Steph’s arm vanishes up to the elbow inside her.");
	
	output("\n\n<i>“One of the most amazing things about these predators is the way they mate. Like some snakes from ol’ Earth, they congregate in huge ‘mating balls,’ just like a great big animal orgy that can last for hours, or even days. I’d give anything to see one of those up close and personal!”</i>");
	
	output("\n\n<i>“Is that so?”</i> the naleen grins, and suddenly her long tail is wrapped around Steph, encircling the hostess from shoulder to toes, leaving nothing but her head visible.");
	
	output("\n\n<i>“Holy smokes! Looks like I forgot the most deadly attack the naleen have: a crushing vice-like grip of the tail. I’ll be dead in seconds if I don’t think of a way out of this; she’ll crush the air right from my lungs.”</i>");
	
	output("\n\n<i>“You are very strange,”</i> the naleen sighs, her feline half rising up to grab Steph’s cheeks, turning her head aside to expose her neck.");
	
	output("\n\n<i>“Uh-oh, looks like I’m a goner! This paralytic venom could spell the end if she bites me!”</i> For someone convinced she’s about to die, Steph’s awfully calm about this.");
	
	output("\n\nThe naleen sighs and bites down, injecting a dose of paralytic venom into the show’s host. Much of the crowd gasps as the host limply falls into the huntress’s waiting arms. Giggling, the naleen tosses Steph over her shoulder and carries her off, slithering into the forest - and the camera drone dutifully follows, tracking the pair of them for several minutes in the brush until they come to a cave mouth. The naleen slithers in, and the camera switches to nightvision as it follows her through a network of caves and into a large, natural pit in the ground.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",stephIrsonEpisodeOnePartTwo);
}
public function stephIrsonEpisodeOnePartTwo():void
{
	clearOutput();
	stephHeader(1, true);
	
	var bSyri:Boolean = (syriAtBurts() && flags["SYRI_TALKS"] != undefined);
	
	output("<i>“Ugh, mah head!”</i> Steph drawls, rubbing her temples as the naleen plants her at the edge of the pit. <i>“Crickey! Looks like she’s dragged me back to her nest! Oh, but look here! Before she eats me, I’m getting to witness the ultimate alien curiosity: the naleen mating ball!”</i> The camera cranes down to the pit, highlighting dozens - hundreds, even - of writhing bodies intertwined, cocks and breasts bouncing everywhere, no hole left unfucked as kitty-nagas bend and twist to accommodate several mates of either sex at once.");

	output("\n\nWith a chuckle, the naleen gives Steph a little push, sending the New Brisbaner tumbling down the slope and into the heart of the pit... and right into the waiting arms of a particularly well-endowed male naleen whose two cocks are still dripping with juices from his last partner. Steph gives a shrill scream as her clothes are torn away, revealing the clean snatch between her long legs and her bouncing breasts, both quickly gripped by the male as she’s bent over the backs of an entwined couple, ass raised in the air for his inspection. He doesn’t waste a moment before lunging in, cocks ramming into her defenseless pussy and ass - and in glorious HD, all over galactic television.");
	
	output("\n\nSteph writhes and cries out as she’s double-penetrated by the twin-cocked naleen, just in time to have her open mouth filled with a juicy pussy. The camera pans up to reveal the busty huntress from before, fingers mashing Steph’s head into her groin as another male slithers behind <i>her</i>, a pair of cocks vanishing into the naleen’s ass. She coos with delight, vocalizations almost masking Steph’s screams as she’s violated. You can’t hide an unmistakable warmth spreading through your body as you watch the hostess getting fucked");
	if(pc.hasCock()) {
		output(", and you try");
		if(pc.legCount == 1) output(" displacing your [pc.leg]");
		else if(pc.isBiped()) output(" crossing your [pc.legs]");
		else output(" shuffling yourself");
		output(" to hide your growing stiff");
		if(pc.cockTotal() == 1) output("y");
		else output("ies");
	}
	output(". With a grunt, the male naleen finishes inside Steph, pulling out just in time for the camera to zoom in on her backside, the NV-mode making the spooge drooling out of her two stretched holes practically glow.");
	output("\n\nA giddy female, less busty that the first but with an almost inhumanly wide set of hips and a jiggling ass, slithers in under Steph’s ass, slender reptilian tongue lapping up the alien spunk dripping from her cunt as another male lines up his shot, sliding in with the last’s cum as lube. Powerful thrusts send Steph’s bubble butt jiggling as the kitty-naga hammers her holes, squirting the last’s cum out with each mighty blow, right onto the waiting face of the female. The bustier huntress gives an orgasmic cry as the male finishes in her ass, pushing Steph’s face as hard into her groin as she can before tumbling aside, pushed down by another horny male who immediately crams his dual cocks into Steph’s fem-cum slathered gob.");
	
	//If Friend!Syri:
	if(bSyri) output("\n\nAs you’re watching the orgy unfold, you feel a pair of familiar hands on your shoulder, and a pair of big, soft tits resting on your head. <i>“Holy shit, Steele, watching a porno in public? Ballsy!”</i> Syri chuckles, hopping over the back of the couch to watch. You try to tell her it’s a nature show, but she just rolls her eyes and shamelessly unzips her pants. <i>“If you do mine, I’ll do yours!”</i> she says with a slight giggle, a hand drifting to your crotch.");
	
	output("\n\nMales and females both takes turns force-fucking the half-conscious hostess, smearing her with gallons of alien spunk until her gaping holes are a constant waterfall of creamy spooge, glowing in the camera’s eye. The show’s runtime is almost up by the time the huge naleen orgy is winding down; a final male has pulled Steph into his lap, both cocks shoved up her ass as the busty naleen that brought her idly fingers the human girl’s pussy, cooing, <i>“Was it everything you hoped it would be, dear?”</i>");
	
	output("\n\nSteph’s head lolls haplessly, her voice breaking as she orgasms for the... hell, you lost count twenty males ago. Blowing his wad, the male pushes her off his rods, letting Steph flop down atop the coils of slumbering naleen. The camera flies down for a final closeup, showing her spunk-slathered body in its full high-definition beauty; where she should be delivering a final monologue about her exploits, Steph only manages to gurgle weakly, cum drooling down her cheeks.");
	
	output("\n\n<i>“This show brought to you by the Xenogen Biotech firm. Xenogen reminds you that galactic exploration is dangerous, and that natural wildlife is not to be approached without assistance from your friendly local rangers. Xenogen is not responsible for any graphic content witnessed on live galactic broadcasts or the safety of its personnel.”</i>");
	
	watchStephEpisodeBroadcast("STEPH_NYAN");
	
	processTime(30);
	if(bSyri) pc.orgasm();
	else pc.lust(33);
	this.clearMenu();
	addButton(0,"Next",mainGameMenu);
}
