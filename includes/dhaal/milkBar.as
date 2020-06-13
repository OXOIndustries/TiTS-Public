//Coded by: THE 'NOXO, written by the DUBSAN
public function iylaBustString(nude:Boolean = false):String { return "IYLA" + (nude ? "_NUDE":""); }
public function drinkCowBustString(nude:Boolean = false):String { return "DRINK_COW_" + flags["DHAAL_MILKCOW"] + (nude ? "_NUDE":""); }
public function creamCowBustString(nude:Boolean = false):String { return "CREAM_COW_" + flags["DHAAL_CREAMCOW"]; }
public function wallCowBustString(nude:Boolean = false):String { return "WALL_COW"; }

public function showIyla(nude:Boolean = false):void
{
	showName("\nIYLA");
	showBust(iylaBustString(nude));
}
public function showDrinkCow(nude:Boolean = false):void
{
	showName("DRINK\nCOW");
	showBust(drinkCowBustString(nude));
}

public function showCreamCow(nude:Boolean = false):void
{
	showName("CREAM\nCOW");
	showBust(creamCowBustString(nude));
}
public function showWallCowAndIlya(nude:Boolean = false):void
{
	showName("WALL COW\n& IYLA");
	//These only occur together when Iyla is nude. Argument is for Wally-woo.
	showBust(iylaBustString(true),wallCowBustString(nude));
}
public function showWallCow(nude:Boolean = false):void
{
	showName("VIP\nWALL COW");
	showBust(wallCowBustString(nude));
}
public function generateDrinkCow():void
{
	flags["DHAAL_MILKCOW"] = rand(3)+1;
}
public function generateCreamCow():void
{
	flags["DHAAL_CREAMCOW"] = rand(3)+1;
}
public function creamgirlIsVIP():Boolean
{
	return (pc.hasStatusEffect("CreamCowInVIP"));
}
public function milkGirlIsVIP():Boolean
{
	return false; //9999
}
public function creamGalVolume():Number { return 50; }
public function iylaCapacity():Number { return 800; }

//Outside tile descriptor
public function outsideMilkBarBonusText():void
{
	//Remove your once-per-visit cream limit!
	pc.removeStatusEffect("GotCreamFromMilkBar");
	//Setup "entrance" texts!
	if(!pc.hasStatusEffect("CUE_BAR_GREETS"))
	{
		pc.createStatusEffect("CUE_BAR_GREETS");
		pc.setStatusMinutes("CUE_BAR_GREETS",6);
	}
	if(flags["MET_IYLA"] == undefined) output("\n\nThere’s a bright, flashing sign here - several, actually - advertising a “milk bar” named Arovok. Given how often the theme of enormous breasts and voluptuous women appears in the advertising, you’ve got a few good guesses about what transpires within.");
	else output("\n\nThere’s a flourishing cornucopia of neon signage advertising the milk bar here, Arovok. Inside you can find beautiful, big-breasted women offering up their endless bounty: flowing milk laced with all manner of synthetic narcotics, and some extra cream from downstairs if you like.");
}

//Entry
public function enterTheMilkbar():Boolean
{
	if(pc.hasStatusEffect("CUE_BAR_GREETS"))
	{
		clearOutput();
		author("Wsan");
		showIyla();
		pc.removeStatusEffect("CUE_BAR_GREETS");
		if(flags["MET_IYLA"] == undefined) 
		{
			output("You enter the questionably-named bar and find yourself in a dim, downward-curving hallway that leads you ever deeper until the din of the outside world has faded to nothingness. Only then do you emerge into the oddly comfortable ambience of Arovok - a den of indulgence, to be sure. Incredibly busty cowgirls strut from table to table offering milk from their glasses or their barely-concealed tits, administering a half-drugged crowd of colorful natives and spacers alike.");
			if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\nFeels a little like you’re back to being a smuggler. You shake off the temporary illusion and");
			else output("\n\nNow <i>this</i> is a seedy underbelly. Adjusting your clothes you");
			output(" make your way to the bar, where you’re greeted by an impossibly beautiful buxom woman.");
			output("\n\n<i>“Hey there, sexy,”</i> she says, giving you an easy smile. You note a small patch on her shoulder as she crosses her arms in front of her impressive tits, leaning over the bar and giving you an eyeful of her cleavage. <i>“The name’s Iyla. Are you here for a drink, or just to chat me up?”</i>");
			output("\n\n<i>“Maybe a bit of both,”</i> you reply, seating yourself. <i>“What’s on tap?”</i>");
			output("\n\nThe purple-eyed bartender casually sweeps her hand over the surface of the bar and a three dimensional hologram of the offerings pops up, hanging in the air between the two of you while it rotates through the available drinks.");
			output("\n\n<i>“Oh, and if you like your milk with a little... extra cream...”</i> Iyla says, flicking her eyes over to an anxious-looking cowgirl down the end of the bar with her skirt tenting, <i>“all you have to do is ask.”</i>");
			flags["MET_IYLA"] = 1;
		}
		else
		{
			output("The hallway leads you down into the oddly comforting ambience of Arovok, the famed milk bar. Incredibly busty cowgirls strut from table to table offering milk from their glasses or their barely-concealed tits, administering a half-drugged crowd of colorful natives and spacers alike. You approach the bar to find yourself greeted by Iyla, the beautiful barkeep.");
			output("\n\n<i>“Hey, sexy,”</i> she says, giving you a little wave and a warm smile. <i>“Back so soon? Drinks are still the same, and so am I.”</i>");
			output("\n\n<i>“Good to know,”</i> you say, taking a seat.");
		}
		processTime(2);
		milkBarMenu();
		return true;
	}
	else 
	{
		addButton(0,"Iyla",summonIyla,undefined,"Iyla","Call the bartender over.");
		if(pcIsMilkVIP()) addButton(1,"VIP",VIPtalkAskForMilkbruh,undefined,"VIP","Head up to the VIP area.");
	}
	return false;
}
public function summonIyla():void
{
	clearOutput();
	showIyla();
	author("Wsan");
	output("Iyla, the beautiful barkeep, approaches with a little wave and a warm smile. <i>“Hey, sexy. Drinks are still the same, and so am I.”</i>");
	output("\n\n<i>“Good to know,”</i> you say.");
	milkBarMenu();
}

public function milkBarMenu():void
{
	clearMenu();
	//[Xanose] [Vipris] [Cromesc] [Sinthine] [Chat] [VIP] [Leave]
	if(pc.credits >= 25)
	{
		addButton(0,"Xanose",drinkieDrinkieRouter,0,"Xanose","<i>When the going gets hard, extend your pleasure cruise.</i>\n+5 willpower, +15 libido\n\n25 credits.");
		addButton(1,"Vipris",drinkieDrinkieRouter,1,"Vipris","<i>Sharp as a knife.</i>\n+10 reflexes\n\n25 credits.");
		addButton(2,"Sinthine",drinkieDrinkieRouter,2,"Sinthine","<i>Breathe.</i>\n+5 reflexes, +5 intelligence\n\n25 credits.");
		addButton(3,"Cromesc",drinkieDrinkieRouter,3,"Cromesc","<i>Lean into the rush.</i>\n+5 aim, +5 reflexes\n\n25 credits.");
	}
	else
	{
		addDisabledButton(0,"Xanose","Xanose","You can’t afford that!");
		addDisabledButton(1,"Vipris","Vipris","You can’t afford that!");
		addDisabledButton(2,"Sinthine","Sinthine","You can’t afford that!");
		addDisabledButton(3,"Cromesc","Cromesc","You can’t afford that!");
	}
	addButton(4,"Chat",talkToIyla,undefined,"Chat","Talk to Iyla.");
	if(flags["MILKBAR_VIP_UNLOCK"] != undefined) addButton(5,"VIP",VIPtalkAskForMilkbruh,undefined,"VIP",(pcIsMilkVIP() ? "Head up to the VIP area.":"Ask about VIP service."));
	else addDisabledButton(5,"???","???","You don't know enough for this.");
	addButton(14,"Back",mainGameMenu);
}

public function applyIylasMilk():void
{
	if(!pc.hasStatusEffect("Iyla’s Milk")) 
	{
		pc.createStatusEffect("Iyla’s Milk",5,0,0,0,false,"Icon_Milk","Iyla’s milk leaves you feeling extremely sexy!\n\n(+5 Sexiness, +20 Libido)",false,5*60,0xB793C4);
		pc.libidoMod += 20;
	}
	else if(pc.getStatusMinutes("Iyla’s Milk") < 24*60) pc.addStatusMinutes("Iyla’s Milk",5*60);
}


public function applyMilkBarDrugs(drink:int, duration:Number):void
{
	var drinkName:String = "";
	var tooltip:String = "";
	if(drink == 0) 
	{
		drinkName = "Xanose";
		tooltip = "<i>When the going gets hard, extend your pleasure cruise.</i>\n+5 willpower, +15 libido";
		IncrementFlag("MILKBAR_XANOSE");
	}
	else if(drink == 1) 
	{
		drinkName = "Vipris";
		tooltip = "<i>Sharp as a knife.</i>\n+10 reflexes";
		IncrementFlag("MILKBAR_VIPRIS");
	}
	else if(drink == 2) 
	{
		drinkName = "Sinthine";
		tooltip = "<i>Breathe.</i>\n+5 reflexes, +5 intelligence";
		IncrementFlag("MILKBAR_SINTHINE");
	}
	else 
	{
		drinkName = "Cromesc";
		tooltip = "<i>Lean into the rush.</i>\n+5 aim, +5 reflexes";
		IncrementFlag("MILKBAR_CROMESC");
	}
	//statusName: String, value1: Number = 0, value2: Number = 0, value3: Number = 0, value4: Number = 0, hidden: Boolean = true, iconName: String = "", tooltip: String = "", combatOnly: Boolean = false, minutesLeft: Number = 0, iconShade:uint = 0xFFFFFF
	if(!pc.hasStatusEffect(drinkName)) pc.createStatusEffect(drinkName,0,0,0,0,false,"Icon_DizzyDrunk","Tooltip",false,duration);
	else if(pc.getStatusMinutes(drinkName) < duration) pc.setStatusMinutes(drinkName,duration);
	else pc.addStatusMinutes(drinkName,20);
	// add buffs
	switch(drinkName)
	{
		//+5 willpower, +15 libido
		case "Xanose":
			pc.willpowerMod += 5;
			pc.libidoMod += 15;
			break;
		//+10 reflexes
		case "Vipris":
			pc.reflexesMod += 10;
			break;
		//+5 reflexes, +5 intelligence
		case "Sinthine":
			pc.reflexesMod += 5;
			pc.intelligenceMod += 5;
			break;
		//+5 aim, +5 reflexes
		case "Cromesc":
			pc.aimMod += 5;
			pc.reflexesMod += 5;
			break;
	}
}


//regardless of which one you pick, segues into same text for a bit
public function drinkieDrinkieRouter(drink:int):void
{
	clearOutput();
	generateDrinkCow();
	showDrinkCow();
	author("Wsan");
	pc.credits -= 25;
	//Yeah I'm cheating and using this variable for a little more, because fuck making a whole 'nother flag for this throwaway.
	if(flags["MET_IYLA"] == 1)
	{
		flags["MET_IYLA"] = 2;
		output("<i>“Great choice. Take a seat and the drink’ll be brought to you,”</i> Iyla says with a grin. <i>“You can get it either way you like.”</i>");
		output("\n\nYou don’t have to guess to know what that means. You make the trip to a table and take a seat, noting the interesting choice of decor. You’re sitting on a chair shaped exactly like a decidedly fertile woman, the arch of her back creating a cushioned depression for you to relax on.");
		output("\n\nNot ten seconds later a serving girl sashays up to you with a lovely smile, waving as she approaches.");
		output("\n\n<i>“Hey, babe!”</i> she says, leaning in. <i>“Do you want your drink in a glass, or...”</i> she grabs her ripe, full breasts, sinking her fingers into soft flesh just barely covered by fabric. You can see the shirt dampen over her nipples, milk trickling down her smooth skin. <i>“Want it from the tap? Doesn’t cost any extra, you know.”</i>");
		output("\n\n<i>“Really?”</i> you ask. That’s a little surprising, you thought for sure that’s where they’d be making their money.");
		output("\n\n<i>“Oh yeah,”</i> she says, nodding. <i>“Some customers just want to drink and be alone, y’know! But to be honest,”</i> she continues, leaning in and lowering her voice, <i>“I really, <b>really</b> prefer it when they take it from the tap. So!”</i> she finishes, straightening up and flashing you a brilliant smile. <i>“What’ll it be?”</i>");
		processTime(4);
		pc.changeLust(3);
	}
	else
	{
		output("You head over to a table after ordering and relax, leaning back into the woman-shaped furniture while you wait for your drink. Sure enough, a cheerful, big-titted serving girl approaches you within seconds to make you an offer.");
		output("\n\n<i>“Hi babe!”</i> she says, giving you a happy smile and bouncing on her toes. <i>“How do you want your drink?”</i>");
		processTime(1);
	}
	clearMenu();
	addButton(0,"Glass",getSomeGlassMilkedMilk,drink,"Glass","Milk in a tall glass, a classic beverage.");
	addButton(1,"FromTap",drinkieDrinkieFromTheTappipoo,drink,"From Tap","Drink straight from her swaying breasts.");
}

//[Glass]
//tt:Milk in a tall glass, a classic beverage.
public function getSomeGlassMilkedMilk(drink:int):void
{
	clearOutput();
	showDrinkCow();
	author("Wsan");
	output("<i>“Just in a glass for today, thanks,”</i> you say.");
	output("\n\n<i>“Aw, okay,”</i> she says, placing a glass on the table and lifting her shirt to expose a very ripe breast, milk already trickling from her jutting nipples. <i>“Let me fill this up for you, then.”</i>");
	output("\n\nShe bends over and lets out a little moan of pleasure as she grasps her breast and squeezes, tugging her erect nipple until pure white milk begins to flow from her areola, dripping into your glass.");
	output("\n\n<i>“Ooohh, yes,”</i> she whispers, her eyelids fluttering. <i>“Mmmmh. Mm!”</i>");
	output("\n\nYou watch as she slowly raises herself, straightening her back and yet somehow still guiding the stream straight from her nipple into the glass, generating just a few minor spatters of excess milk across the table’s polished surface.");
	IncrementFlag("MILKBAR_GLASSES");
	if(flags["MILKBAR_GLASSES"] == 1) output(" You can’t lie - you’re impressed");
	else output(" You’ve seen it before, but it’s still impressive");
	output(". She manages to top off your drink with barely a few droplets of spillage.");
	output("\n\n<i>“There, do you like my little trick?”</i> she purrs, giving you a wink. <i>“Enjoy, babe.”</i>");

	output("\n\nShe struts away and leaves you with your glass of ");
	if(drink == 0) output("Xanose");
	else if(drink == 1) output("Vipris");
	else if(drink == 3) output("Cromesc");
	else output("Sinthine");
	output(". ");
	//Xanose
	if(drink == 0) output("At first the contents appear to be little more than milk with a swirl of creamier rose running through it but as you watch they begin to coalesce into a soft, glowing scarlet, the entire process taking several seconds until you have a glowing red glass. That’s cute" + (flags["MILKBAR_XANOSE"] == undefined ? ", hopefully it tastes as good as it looks":", and you know it tastes <i>at least</i> as good as it looks") + ".");
	else if(drink == 1) output("What’s inside doesn’t look much like milk at all, closer to something like an opaque light beer with a distinct yellow sheen." + (flags["MILKBAR_VIPRIS"] == undefined ? " It smells like it tastes good, at least":" At least you know it tastes good") + ".");
	else if(drink == 2) output("Well, it’s not too hard to see where the name comes from. It looks pretty similar to regular absinthe, though" + (flags["MILKBAR_SINTHINE"] == undefined ? " the milkiness is where you suppose the difference is supposed to shine through":" you know the milkiness really does make a big difference in the taste") + ".");
	else output("The contents shine like teal radiation - this is pretty slick for something a milk bar, actually. It’s hard not to be impressed, " + (flags["MILKBAR_CROMESC"] == undefined ? "though you’ll reserve that for after you taste it":"especially given how good it tastes") + ".");

	if(drink == 0) output("\n\nYou take a sip, then a swallow, and within moments you’re upending the glass. Everything feels a little easier, like you could do whatever you set your mind too - though right now, all you can seem to think about is how sexy the big titty bitches strutting around are. The aftertaste of cherry lingers in your mouth.");
	else if(drink == 1) output("\n\nAs soon as you take a sip of the milk you can feel it taking effect, little jitters running down your arms. You shake it off and keep drinking, draining the glass and going to place it back on the table - only to accidentally drop it as your arm shakes. Before it’s even travelled a few inches, though, you snatch it out of the air so fast you could swear you did it without conscious thought and put it back down in front of you. The taste of the concoction still lingers on your tongue.");
	else if(drink == 2) output("\n\nThe moment you take a sip the world seems to warp and widen before you, colors growing brighter and your vision shifting, almost as if you’ve taken a step back without moving. It’s like your eyes can take in more of the world and your brain is processing it all faster. The milk goes down your throat like nothing else, and soon enough you’ve swilled the whole glass.");
	else output("\n\nYou take a sip of your drink and take a moment to reflect on what exactly it is they do here. How can a glass of milk make you feel so in control? You feel like you’ve taken combat-enhancing drugs, and the aftertaste...");
	output("\n\nDamn, that’s good. Maybe you should get another.");
	processTime(10);
	//apply drugs
	applyMilkBarDrugs(drink, 5*60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	getCreamButton(1);
}

//[FromTap]
//tt:Drink straight from her swaying breasts.
public function drinkieDrinkieFromTheTappipoo(drink:int):void
{
	clearOutput();
	showDrinkCow(true);
	author("Wsan");
	output("<i>“From the tap,”</i> you respond, beckoning her closer.");

	output("<i>“Oooh, I’m falling in love already,”</i> she coos, lifting her top off above her head and baring her enormous, milk-filled breasts. Her nipples look so stiff they could cut glass. <i>“Here, babe...”</i>");
	output("\n\nThe buxom cowgirl sits down next to you, daping herself over your lap and smiling as she thrusts her chest out, leaning against you for easy access.");
	output("\n\n<i>“Oohhh, baaaabe,”</i> she groans as you take a jutting nipple between your teeth and begin to suck, setting her trembling in your arms. <i>“Yes, yes, yes...”</i>");
	output("\n\nThe milk itself tastes amazing, ");
	if(drink == 0) output("like sweet cherry");
	else if(drink == 1) output("as if little knives made of mint were dancing");
	else if(drink == 2) output("like an icy sharpness");
	else output("like blueberries dipped in honey");
	output(" across your tongue, and the serving girl’s moans only further the experience. In fact, the deeper you drink of her the louder she gets, and before you’ve taken more than a few mouthfuls of her bust’s burden she lets out a loud, erotically charged moan and arches her back.");
	output("\n\n<i>“I’m cumming,”</i> she announces breathlessly, shivering as gooseflesh stands up all over her flawless skin. <i>“Nhhh- hhh!”</i>");
	output("\n\nThe moment you feel her thighs tighten up and flex the flavor of her milk changes, growing so sweet it’s like someone poured a sachet of sugar into your mouth. She grabs your head and holds you against her, tilting her head back and moaning as if she’s having the best fuck of her life, a rivulet of milk running from her unattended breast. It doesn’t seem like she was kidding about preferring it this way.");
	output("\n\n<i>“Oohhhh, goooddd! Don’t stop!”</i> she begs you, trembling in your lap and grasping at your [pc.chest].");
	output("\n\nYou’ve had about a glassful, but there’s no reason you couldn’t indulge a little...");
	processTime(10);
	pc.changeLust(8);
	var tempCow:Creature = new Creature();
	tempCow.createPerk("Fixed MilkQ",500);
	pc.milkInMouth(tempCow);
	//apply drugs, longer duration than glass.
	applyMilkBarDrugs(drink, 7*60);
	clearMenu();
	addButton(0,"Stop There",oneSippySipIsEnoughThankeeKindCow,drink,"Stop There","All things in moderation.");
	addButton(1,"KeepDrinking",keepDrinkieDrinkingFromDatCow,drink,"Keep Drinking","Including moderation.");
}

//[StopThere]
//tt:All things in moderation.
public function oneSippySipIsEnoughThankeeKindCow(drink:int):void
{
	clearOutput();
	showDrinkCow(true);
	author("Wsan");
	output("<i>“I’m good,”</i> you inform her, pulling back as a fresh flow of milk spurts down her tummy.");
	output("\n\n<i>“Ohohohh, god...”</i> she pants, getting her breath back as she slowly gets to her shaky feet. <i>“Thank you, let- let me just clean up a little...”</i>");
	output("\n\nThe serving girl wipes off your table and chair, bending over and giving you an excellent look at how dripping wet her panties and thighs are. It looks like she had multiple orgasms as you drank or she’s a squirter - or both, for all you know. Either way, the post-sex smile and murmured thanks she gives you before she walks away stick in your mind like a dart in a board.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	getCreamButton(1);
}

//[KeepDrinking]
//tt:Including moderation.
public function keepDrinkieDrinkingFromDatCow(drink:int):void
{
	clearOutput();
	showDrinkCow(true);
	author("Wsan");
	output("You lean in and grab her shoulder, keeping her in place against you.");
	output("\n\n<i>“Yes,”</i> she gasps upon realizing you’re going to keep drinking. <i>“Yes, yes, yes!”</i>");
	output("\n\nShe slips her arm around your neck and rests against you, thrusting her considerable chest out so as to better allow you access to her delectable nectar. Impulse possesses you, compelling you to slide one hand down into her panties, and she responds more positively than you could have imagined. Biting her lower lip she squirts all over your probing fingers while you drink of her, rubbing her spasming slit as her plump thighs shake against the furniture.");
	output("\n\nWhat’s more, she doesn’t seem to be able to <i>stop</i> cumming as long as you’re drinking her milk. Her lips part and her legs spread as her back takes on an extreme arch, breath coming in short, stuttering gasps while her vaginal walls haphazardly clench around two briskly inserted fingers. She bucks her hips violently once, twice, and by then she hardly seems capable of more.");
	output("\n\n<i>“Oohhhgooddd I’m cumminnnngghhh,”</i> she pants, her eyes threatening to roll upwards while you fingerfuck her. <i>“Uuuuhhhnnhh!”</i>");
	output("\n\nThe longer you keep her going, the more insensate she gets. Soon you have this woman cumming her fucking brains out, legs spread so wide she’s almost doing the splits around your fingers, and every little rub you give the inside of her walls prompts a massive, shuddering tightening of every muscle below her belly button along with a fresh drip of her juices. She’s going off the rails, and you’re more than happy to help her along.");
	output("\n\n<i>“Nnngghhh! Hnnnnnnh-”</i> she strains, the color fading from her face as she cums over and over, unable to resist the pleasure. <i>“Mmmmmhhhhh!”</i>");
	output("\n\nAt last, after some more desperate squirting and moaning, the inevitable comes to pass. Her eyes roll back and she passes out in your arms, her cunt still twitching and flexing hard as aftershocks rock her nervous system. As far as drinks go, that one was quite the experience...");
	output("\n\nYou withdraw your fingers and lightly rub them across her protruding tongue, leaving her with the sensation of herself lingering on her taste buds before another girl comes by and gives you a wink as she collects her coworker, carrying her into a backroom. That’s nice and efficient.");
	//intensify drink effects for this. Raises lust, too
	applyMilkBarDrugs(drink, 10*60);
	var tempCow:Creature = new Creature();
	tempCow.createPerk("Fixed MilkQ",1500);
	pc.milkInMouth(tempCow);
	processTime(10);
	pc.changeLust(33);
	//ramp up the status duration.
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	getCreamButton(1);
}

public function getCreamButton(button:int):void
{
	if(pc.hasStatusEffect("GotCreamFromMilkBar")) addDisabledButton(button,"Get Cream","But Cream","You already got your cream for this visit. Maybe next time?");
	else addButton(button,"Get Cream",getSomeCream,undefined,"Get Cream","Some cream with your milk might be nice...");
}

//After you get your first drink that visit (regardless of finishing it or not), you can ask for cream.
//[Get Cream]
//The [Get Cream] button is replaced by the [More Cream] and [More Cream!] buttons when clicked.
//tt:Some cream with your milk might be nice...
public function getSomeCream():void
{
	clearOutput();
	generateCreamCow();
	showCreamCow();
	pc.createStatusEffect("GotCreamFromMilkBar");
	author("Wsan");
	output("You catch the attention of a scantily-clad serving girl and ask for some cream, and she nods.");
	output("\n\n<i>“I’ll get you some,”</i> she promises with a smile.");
	output("\n\nNot twenty seconds later a busty cowgirl approaches you, a fat cock poking out of her skirt.");
	output("\n\n<i>“Hi, d-did you order the cream?”</i> she asks, looking a little anxious.");
	output("\n\n<i>“That’s me,”</i> you say, smiling at her.");
	output("\n\n<i>“Okay,”</i> she says, nodding. <i>“Okay, good - can you shift the glass a little closer, please?”</i>");
	output("\n\n<i>“Sure,”</i> you reply, sliding it near her thighs. <i>“That good?”</i>");
	output("\n\n<i>“Thank you!”</i> she says happily, pulling her underwear down and letting her dick swing upwards to slap her in the tummy. Wow, she is <i>stiff</i>. <i>“Okay, here we go...”</i>");
	output("\n\nWith a soft grunt, she begins to masturbate herself. It seems like she was already on edge because it doesn’t take much longer than a few seconds before her thighs start to shake, the quiet moans she was making cutting off as she grits her teeth with the effort.");
	output("\n\nShe wasn’t kidding about it being cream. A long, drawn-out groan of ecstasy spills from the masturbating woman’s lips as she squeezes her throbbing shaft, a sticky, pearly droplet emerging from her cockslit. It takes her several agonizingly long seconds to work out the rope of spunk, shaking and sweating, her eyes rolling in her head as she endeavors to deliver you your cream. When she finally manages to get it all out, she collapses back against the wall, panting.");
	output("\n\n<i>“Y-your cre- creeaaam,”</i> she announces breathlessly. <i>“Please, enjoy...”</i>");
	output("\n\nYou nod to her and note her stealing furtive glances back at you as you take a sip from your glass - stars, this is some of the best <i>cream</i> you’ve ever tasted. It’s amazing what they’ve accomplished here, even if the serving girl is very obviously touching herself behind the bar while she stares in envy at you draining your glass, her lips parted in passion. Maybe you should ask her for more.");
	processTime(5);
	pc.changeLust(3);
	var tempCow:Creature = new Creature();
	tempCow.createCock();
	tempCow.createPerk("Fixed CumQ",50);
	pc.loadInMouth(tempCow);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	addButton(1,"More Cream",getMoreCreamFromYaBooooi,undefined,"More Cream","See about getting some more cream.");
}

//[More Cream]
//tt:See about getting some more cream.
public function getMoreCreamFromYaBooooi():void
{
	clearOutput();
	showCreamCow();
	author("Wsan");
	output("You wave the cream serving girl over and ask for a refill, glancing at her furiously erect cock.");
	output("\n\n<i>“O-oh, you want more?”</i> she says, breathing a little erratically. <i>“S-sure, just a moment...”</i>");
	output("\n\nYou place your glass on the table and watch as she begins to stroke herself two-handedly, working her pulsing shaft until her cumvein starts to swell. You’re half-amazed and half-turned on that you can see the bulge of her creamy payload working its way down her shaft, ready to be poured.");
	output("\n\n<i>“Oh, <b>god</b>,”</i> she moans, tilting her hips downward to angle herself into your glass. Thick, heavy cream begins to slowly pump from her flexing cock. <i>“Nnngh! Hnnnngh! Mmmm! Hhhaaahh!”</i>");
	output("\n\nYou’re treated to the sight of her emptying herself down the side of your glass, spunk pooling at the bottom until it looks half-full.");
	output("\n\n<i>“Thank you,”</i> you murmur as she pulls back, wiping her forehead.");
	output("\n\n<i>“Oh, y-you’re welcome,”</i> she pants, smiling wide. <i>“Juh, just ask if you need more.”</i>");
	output("\n\nThe cream-dispensing girl walks back to the bar gripping her dick, casting furtive glances behind her while you grip your glass. You can just hear a faint moan of horniness as you take a drink and swallow, savoring the taste. Damn, she’s good.");
	processTime(5);
	var tempCow:Creature = new Creature();
	tempCow.createPerk("Fixed CumQ",300);
	pc.loadInMouth(tempCow);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	addButton(1,"More Cream",moreCreamPleaseBartender,undefined,"More Cream","This isn’t nearly enough cream. You want to watch this girl fill your cup with it.");
}

//[More Cream!]
//tt:This isn’t nearly enough cream. You want to watch this girl fill your cup with it.
public function moreCreamPleaseBartender():void
{
	clearOutput();
	showCreamCow();
	author("Wsan");
	output("You wave the sweaty serving girl over and make your request, her veiny cock throbbing with powerful need as she listens eagerly.");
	output("\n\n<i>“You- you want me to fill the entire cup?”</i> she whispers, her eyes wide as she glances down at your mug. <i>“I, I’d love to... give me a moment, please.”</i>");
	output("\n\nShe places your glass on the edge of the table and begins to slowly stroke herself, caressing her bulging cumvein with careful but passionate strokes.");
	output("\n\n<i>“This- this is going to take a while,”</i> she huffs, looking down at her engorged cock. <i>“Nnnngghhh...”</i>");
	output("\n\n<i>“Take your time,”</i> you say, sitting back in your chair.");
	output("\n\n<i>“T-thank you,”</i> she groans. <i>“Oooohhhh, here it comes... mmmnnnh!”</i>");
	output("\n\nShe swipes the glass and puts it right under her throbbing cockhead as she squeezes herself one-handedly, wringing the thick, heavy cream from the end of her swollen penis. Her hand is so shaky you reach out and grab the glass yourself right before she drops it, holding it in place while she blows her load into the bottom.");
	output("\n\n<i>“Th-tha-nnnghk! You!”</i> she grunts through grit teeth. <i>“Rrrrgh! Nnnhh! It- it’s just that! I-I’m cumming so hard I, I- nnngggh!”</i>");
	output("\n\n<i>“Good girl,”</i> you murmur comfortingly. <i>“Get it all out into my glass.”</i>");
	output("\n\n<i>“Hhaaahh! Hhaah!”</i> she pants, gripping the table with her free hand and furiously pumping her prick, wads of cream gradually dripping from her slit. <i>“Uuuhhh! Hhuuhh!”</i>");
	output("\n\nTo her credit, the last half of the cup fills up very fast. With a little scream of delight she almost doubles over while her thighs shake, feet turning inward and knees pulling together as she explosively ejaculates all over your cup and fingers until the rim is overflowing. It takes her a few seconds to register that her job is done but her cock is still pumping, dripping to the floor.");
	output("\n\nShe looks to you with some hope in her eyes, opening her mouth to speak, but Iyla happens to appear right at that very moment.");
	output("\n\n<i>“Well done,”</i> the barkeep purrs in her ear, running a hand over the cream girl’s stomach. <i>“You remember the rule, don’t you?”</i>");
	output("\n\n<i>“Yeees,”</i> the girl says dejectedly. <i>“No blowjobs. Sorry, Iyla...”</i>");
	output("\n\n<i>“It’s okay,”</i> Iyla says, patting the girl on the butt. <i>“Go get yourself cleaned up and prep for the next customer, okay?”</i> She gives you a wink as the dickgirl departs, heading towards the bar. <i>“Enjoy your drink, darling. She certainly did.”</i>");
	output("\n\nYou drain your glass over the next few minutes, marvelling at how good that girl’s cream tastes.");
	//know truth from calling a creamgirl into vip room:
	if(flags["VIP_CREAM_COWS_CALLED"] != undefined) output(" Amazing what’s possible with a little bit of ingenuity.");
	else output(" How <i>does</i> she do it?");
	processTime(10);
	var tempCow:Creature = new Creature();
	tempCow.createPerk("Fixed CumQ",500);
	pc.loadInMouth(tempCow);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Chat]
//tt:Talk to Iyla.
public function talkToIyla():void
{
	clearOutput();
	showIyla();
	author("Wsan");
	output("<i>“Want to chat for a bit?”</i> you say, nodding at her. <i>“Pretty new to Dhaal, trying to get my bearings a bit.”</i>");
	output("\n\n<i>“It’s a heck of a place, isn’t it?”</i> Iyla says, grinning. <i>“Hated it when I was growing up, too busy and bustling. But I learned to love the place and the people. Whatcha wanna know?”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"ServingStaff",servingStaffTalkWithIyla,undefined,"Serving Staff","You’ve noticed something about all the serving staff.");
	addButton(1,"Herself",askIylaAboutHerself,undefined,"Herself","Ask Iyla about herself.");
	addButton(2,"Clientele",askAboutTheMilkyClientele,undefined,"Clientele","The crowd here is pretty varied.");
	addButton(3,"Dhaal",dhaalAskiesWootliedootlie,undefined,"Dhaal","Ask about the planet itself.");
	addButton(14,"Back",summonIyla);
}

//[ServingStaff]
//tt:You’ve noticed something about all the serving staff.
public function servingStaffTalkWithIyla():void
{
	clearOutput();
	showIyla();
	author("Wsan");
	output("<i>“You don’t actually employ any natives here, do you?”</i> you say, glancing around. Beautiful, busty cowgirls, as far as the eye can see. <i>“Everyone here’s all an offworlder, from what I can tell.”</i>");
	output("\n\n<i>“Keen eye,”</i> Iyla says, giving you a nod of approval. <i>“Yup, you’re spot on. Every one of our girls is from New Texas ‘cept me. Wouldn’t be very authentic otherwise, right?”</i>");
	output("\n\nIt’s true that when you think milk from cowgirls, you think NT. Their export industry is pretty well-known the galaxy over. You don’t know how they’re sourcing the women, but" + (pc.IQ() >= 75 ? " given the pleasure patches on every one of their arms - including Iyla’s - it’s not hard to guess it’s not above-ground.":"...\n\nYou glance at Iyla, the smiling, guileless barkeep.\n\nWell, she probably doesn’t have the answers - or if she did, wouldn’t be inclined to share them."));
	IncrementFlag("IYLA_TALKS");
	processTime(5);
	setButtonDisabled(0);
}

//[Herself]
//tt:Ask Iyla about herself.
//note: everything she tells you about herself and the bar is untrue. In actuality, the entire thing was seed-funded and is run by Bright Water, of which Iyla herself is a low-level employee.
public function askIylaAboutHerself():void
{
	clearOutput();
	showIyla();
	author("Wsan");
	output("<i>“How about you?”</i> you ask, nodding at Iyla. <i>“Any special story?”</i>");
	output("\n\n<i>“Ha! Not really,”</i> she says, grinning at you. <i>“I was born here, never really knew my parents. I was a serving girl in a few of the many bars we’ve got around and kind of enjoyed the industry. Ended up deciding to run my own bar and, well, here we are.”</i> She spreads her arms. <i>“I got a loan from a local service to start it up, but that’s been paid off for a while now.”</i>");
	output("\n\n<i>“Really?”</i> you ask, raising an eyebrow. <i>“Maybe I’ve been unfairly prejudiced. I would’ve thought any loan you get here would be a trap.”</i>");
	output("\n\n<i>“Haha!”</i> Iyla laughs, shifting her feet. <i>“No, you’re actually totally right to fear the loan companies. They’re all shell corporations representing the big guns, and they disappear or change names every week.”</i> Her smile fades a little - just for a second, but enough for you to catch it. <i>“The zaibatsu have their fingers in every pie.”</i>");
	if(pc.IQ() >= 75)
	{
		output("\n\nYou’re not too certain she’s telling the truth about the origin of her bar - it seems very convenient for a place as hostile and mercenary as Dhaal, as far as you know it. Plus, if the megacorps really do have their fingers in every pie, it seems more likely this place was built out of an interest. Still, though, it’s not like you’re here as a detective. There’s nothing to really be gained by harassing the owner of a bar and demanding what might be the truth.");
	}
	output("\n\nBesides that, you’re more concerned about something plainly obvious; Iyla is a cowgirl but you’d thought the only natives on Dhaal were the zaika. The planet was only rediscovered three months ago... how did she get here, then? She clearly didn’t drop in and set up shop recently.");
	output("\n\n<i>“All the cowgirls here are from New Texas, right?”</i> you ask.");
	output("\n\n<i>“Yup. ‘Cept me,”</i> Iyla affirms. <i>“I grew up here.”</i>");
	output("\n\nHmm.");
	IncrementFlag("IYLA_TALKS");
	processTime(10);
	setButtonDisabled(1);
}

//[Clientele]
//tt:The crowd here is pretty varied.
public function askAboutTheMilkyClientele():void
{
	clearOutput();
	showIyla();
	author("Wsan");
	output("<i>“There’s a lot of different faces here,”</i> you note, looking out at the crowd being tended to. <i>“Both natives and not.”</i>");
	output("\n\n<i>“Oh, yeah,”</i> Iyla says, nodding vigorously. <i>“Whole reason I picked this place for the bar. Right near the port, see? I mean, we’re a bit of a novelty. People hear about us offworld sometimes and want to come - and, well, Dhaal tends to swallow unprepared spacers whole. So... best to be near an entrance, outside the slums.”</i>");
	output("\n\n<i>“So your best clients are from offworld?”</i> you ask.");
	output("\n\n<i>“Oh, no,”</i> she says with a smile. <i>“Our <b>best</b> clients are the ones using the VIP rooms upstairs. Those tend to be natives, or at least people who live here. They keep us afloat.”</i>");
	output("\n\n<i>“VIP rooms, huh?”</i> you muse.");
	output("\n\n<i>“Yup. Interested?”</i> Iyla says, grinning. <i>“I can get you into the program. I’ll warn you now, though. It’s very expensive, though you look like you’re good for it.”</i>");
	output("\n\n<i>“You’ve got my attention,”</i> you murmur. <i>“What goes on in the VIP rooms?”</i>");
	output("\n\nIyla leans in, her eyes flashing as she smiles wide and whispers in your [pc.ear]. <i>“Anything you want.”</i>");
	output("\n\nShe straightens up and leans on the bar, gazing down the length of it at a cowgirl getting her teat sucked before turning her attention back to you with a casual smirk.");
	output("\n\nWell, that’s intriguing.");
	flags["MILKBAR_VIP_UNLOCK"] = 1;
	IncrementFlag("IYLA_TALKS");
	//unlocks [VIP] option
	processTime(6);
	setButtonDisabled(2);
}

//[Dhaal]
//tt:Ask about the planet itself.
public function dhaalAskiesWootliedootlie():void
{
	clearOutput();
	showIyla();
	author("Wsan");
	output("<i>“Tell me about Dhaal,”</i> you say. <i>“I really only just got here, so it’d be nice to hear about it from someone who was born here.”</i>");
	output("\n\n<i>“Fresh off the boat, huh?”</i> Iyla quips. <i>“It’s certainly unique. The sun and the planet orbit at exactly the same rate, so half of it is constantly lit up - and I do mean <b>lit up</b>, it’s uninhabitable - and the other half is a cold, frozen hellhole. We’re parked right in the middle, down The Strip.”</i> She grins. <i>“Lucky us.”</i>");
	output("\n\n<i>“So the entire planet lives on the inhabitable band? The Strip, you called it?”</i> you ask.");
	output("\n\n<i>“Yup. Not even the zaibatsu are crazy enough to make a go of it out in either of the extreme biomes,”</i> she confirms. <i>“There’s one gigantic megacity that spans the entire planet, built right over the oceans and everything. Pretty cool, right? Well, so I’m told.”</i> She shrugs. <i>“I grew up here, so it’s all I really know.”</i>");
	output("\n\n<i>“And the city itself has no central governance, right?”</i> you continue.");
	output("\n\n<i>“Ha! The zaibatsu would never allow for that,”</i> Iyla laughs, a harsh bark. <i>“Towering corporations with an iron grip. They run Dhaal from top all the way to the very bottom, and don’t trust anyone who tells you otherwise. There’s plenty of them, and they’ve all got an angle. Of course, they all <b>want</b> to be ‘the one’, but, well,”</i> she says, cracking a grin. <i>“It’s never that easy, is it?”</i>");
	output("\n\nThat sure hits a little close to home.");
	IncrementFlag("IYLA_TALKS");
	processTime(4);
	setButtonDisabled(3);
}

public function pcIsMilkVIP():Boolean
{
	return pc.hasKeyItem("VIP Pass - Arovok Milk Bar");
}
//[VIP]
//unlocked by [Clientele] option.
//costs 50k.
//tt:{not VIP:Ask about VIP service./VIP:Head up to the VIP area.}
public function VIPtalkAskForMilkbruh():void
{
	//Not VIP
	if(!pcIsMilkVIP()) 
	{
		clearOutput();
		showIyla();
		author("Wsan");
		output("<i>“So, about the VIP program...”</i> you say.");
		output("\n\nIyla smiles. <i>“It’s usually seventy five thousand but I’ll make it fifty, just for you.”</i>");
		//[50,000] [No thanks]
		clearMenu();
		if(pc.credits >= 50000) addButton(0,"50,000",actualMilkBarVIPBuy,undefined,"50,000","Pony up the creds for what promises to be an unforgettable experience.\n\n(<b>Costs 50,000 credits!</b>)");
		else addDisabledButton(0,"50,000","50,000","You don’t have the money to be signing up to a milk bar’s VIP program.");
		addButton(1,"No Thanks",summonIyla);
	}
	else enterTheVIPRoom();
}

//[50,000]
//tt:Pony up the creds for what promises to be an unforgettable experience.
//invalid:You don’t have the money to be signing up to a milk bar’s VIP program.
public function actualMilkBarVIPBuy():void
{
	clearOutput();
	showIyla();
	author("Wsan");
	pc.credits -= 50000;
	output("<i>“Well, then,”</i> Iyla murmurs, putting the data slate away after the transaction goes through. She gives you a warm smile. <i>“Allow me to show you what goes on upstairs.”</i>");
	output("\n\nShe walks out from behind the bar and you slip off the stool to follow, the buxom woman guiding you towards the back of the building where she places a hand against a seemingly indistinct section of the wall. After a moment a separation appears against the smooth background, and a door silently shifts into a recess in the wall, leaving open a dark pathway that leads upstairs. Iyla steps through and you follow, the lighting slowly flaring to life as the door slides shut behind you.");
	output("\n\nNow that you’re following her, you’re <i>really</i> paying attention to the way Iyla’s ass moves in time with her wide, swaying hips. This woman is every bit as sexy as the girls she employs, if not more so. Now you’re wondering if she’s a package deal...");
	output("\n\nYou arrive in what looks to be a very long hallway with carpet running down the length of it, lit only by a cold blue ambience that seems to come out of the walls themselves. There are no doors or any markings whatsoever on their surface, but you gather that kind of minimalism is the norm here.");
	output("\n\n<i>“This will be your room,”</i> Iyla announces, gesturing at a specific location on the wall. <i>“Place your hand on it, if you will, please.”</i>");
	output("\n\nYou hold your hand out and lightly press your palm to the wall, a series of concentric rings rippling outwards, slowly fading from red to green until a faint chime rings out.");
	output("\n\n<i>“That’s it, you’re registered,”</i> she says, smiling and indicating the door that suddenly makes itself visible. The edges are glowing. <i>“Each room is registered to one individual, and <b>only</b> one. You should be able to see the door now?”</i>");
	output("\n\nYou nod. <i>“It has a faint green outline.”</i>");
	output("\n\n<i>“That’s right,”</i> Iyla confirms. <i>“You’re the only one who can see it, and open it. You can either use a verbal command, or a gesture. Just swipe your pointer finger from left to right.”</i>");
	processTime(15);
	//VIP Pass Buy
	pc.createKeyItem("VIP Pass - Arovok Milk Bar");
	output("\n\n(<b>Gained Key Item: VIP Pass - Arovok Milk Bar</b>.)");
	clearMenu();
	addButton(0,"Open",enterVIPRoomFirstTime,undefined,"Open","Open your VIP room.");
}

//[Open]
//tt:Open your VIP room.
public function enterVIPRoomFirstTime():void
{
	clearOutput();
	showWallCowAndIlya();
	author("Wsan");
	pc.createStatusEffect("IylaInVIP");
	output("The moment you open your room, several things become readily apparent.");
	output("\n\nThe first is that this is <i>not</i> Iyla’s bar. This kind of extravagant excess could only have been born of corporate desire and besides - the responsible party is right there on the opposite wall, imprinted in bold. Brightwater LLC.");
	output("\n\nThe next is that the woman in the wall has the most enormous breasts you have ever seen in your life. Her gargantuan titties extend across the floor, several feet of soft milk-filled flesh, easily big enough for you to recline on which is no doubt the intent. Though she’s wearing a ring gag, she seems happy enough - she gives you a friendly wave and her eyes crinkle at the edges, suggesting a smile.");
	output("\n\nThe third is that although you’ve seen a number of people in your journeys beset by monetary woes you haven’t really had to grapple with yourself - none have been quite so... stark as the situation here. How much was that 50k you just paid really worth?");
	output("\n\nAnd at last, you realize the signs outside were right. If you have the money and the power on Dhaal, anything is possible. <i>Anything</i>.");
	if(pc.isBimbo())
	{
		output("\n\n<i>“Wow, awesome!”</i> you cry, hopping over to the girl in the wall and bending down. <i>“Hi babe!”</i>");
		output("\n\nYou close your eyes and give her a big, affectionate kiss, thrusting your [pc.tongue] into her mouth and revelling in the way she wraps her own around yours. Oooh, she’s <i>kinky</i>! And the way she groans from deep in her throat when you step on her titties... aw yeah, she’s into it.");
		output("\n\n<i>“Hehe! I might just park my butt against your face sometimes, cutie. Hope you’re ready!”</i> you warn her good-naturedly, winking at the overburdened cowgirl before looking back at Iyla. <i>“Wanna join in?”</i>");
		output("\n\n<i>“We like to take care of our VIPs at Brightwater,”</i> Iyla says, smiling at you. <i>“So if you’ll have me...”</i> she murmurs, unfastening something at her back and stepping out of her uniform entirely, leaving her naked save for her high heels, <i>“I would be delighted.”</i>");
		output("\n\nShit, Iyla is <b>hot!</b> This place rocks!");
	}
	else if(pc.isNice())
	{
		output("\n\n<i>“This is pretty extreme,”</i> you say, glancing at Iyla.");
		output("\n\n<i>“The seating, or the situation?”</i> she replies, smiling at you. <i>“Don’t worry. I’ll hang around and get you oriented. We take care of our VIPs at Brightwater.”</i>");
		output("\n\nWithout another word, Iyla unfastens something behind her back and steps out of her uniform with complete confidence, leaving her stark naked save for her high heels. Her body is flawless.");
	}
	else if(pc.isMischievous()) 
	{
		output("\n\n<i>“Welcome to Dhaal, huh?”</i> you say, chuckling to yourself. <i>“What a place.”</i>");
		output("\n\n<i>“Haha, I’ve come to like it,”</i> Iyla says, smiling at you. <i>“It’s a place of opportunity, I’ve found. It’s refreshing to have an offworlder here, actually. I’ll show you that we like to take care of our VIPs at Brightwater.”</i>");
		output("\n\nWithout another word, Iyla unfastens something behind her back and steps out of her uniform with complete confidence, leaving her stark naked save for her high heels. Her body is flawless.");
		output("\n\n<i>“No kidding,”</i> you murmur, eyeing her.");
	}
	else
	{
		output("\n\n<i>“Nice place,”</i> you remark, striding over and seating yourself on the offered couch of breasts.");
		output("\n\n<i>“Ooohhhh,”</i> the cowgirl moans through her gag, drooling down her front. <i>“’Ankh uu...”</i>");
		output("\n\nShit, this is <i>nice</i>. Like a water bed, but more practical. She’s full of milk and gives you hot little moans whenever you shift positions or rub her skin, throwing her head back whenever you tease her a little.");
		output("\n\n<i>“Having fun?”</i> Iyla says, smiling at you. <i>“We like to take care of our VIPs at Brightwater.”</i>");
		output("\n\n<i>“I am,”</i> you confirm. <i>“Gonna join us?”</i>");
		output("\n\n<i>“If you’ll have me...”</i> Iyla says, unfastening something behind her back before her uniform peels off her skin and falls to the ground, leaving her stark naked save for her heels and a deep, decadent grin. <i>“I would be delighted.”</i>");
		output("\n\nDamn, this bitch is fucking hot. Off to a good start, Brightwater...");
	}
	processTime(10);
	VIPMilkBarMenu();
}

//Leave
//tt:Time to get something done.
public function leaveTheWallCowMenu():void
{
	clearOutput();
	showWallCowAndIlya();
	author("Wsan");
	output("<i>“I’m going to head back out,”</i> you say, nodding to Iyla. <i>“See you again, Iyla.”</i>");
	output("\n\n<i>“Come back soon,”</i> she says, smiling at you.");
	output("\n\nYou [pc.walk] back up the curving hallway and reacquaint yourself with the droning roar ");
	//fen note replaced: of life on Dhaal as it washes across your ears, emerging onto the smoky surface of the megacity.
	output("of the milk bar's downstairs.");
	clearVIPStuff();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function clearVIPStuff():void
{
	pc.removeStatusEffect("IylaInVIP");
	pc.removeStatusEffect("CreamCowInVIP");
}

//The VIP room
//The PC’s sin room. Can call for amenities, fuck whoever, generally be a debauched and debased disaster as befitting a real CEO. If Iyla is present, can talk to her and get some real answers about the building and Dhaal itself. After you’ve paid the 50k, you can just walk back here from the map.
public function enterTheVIPRoom():void
{
	clearOutput();
	showWallCow();
	author("Wsan");
	if(pc.isBimbo()) output("This is fun! You can make the lights change color and the girl in the wall might not be good with words but she sure is talkative when she wants to be! Lying back on her enormous, milk-filled titties, you sigh and relax in your VIP room. Hey, this might be a good opportunity to learn stuff about the planet!");
	else if(pc.isNice()) output("The VIP room isn’t exactly to your tastes, but this might prove invaluable to finding out exactly what’s happening on Dhaal. They say information is power and on this planet it’s beginning to look like you’re going to need all the power you can <i>get</i> lest you end up like one of these working girls. Besides, this is probably one of the safest places on the planet - or at least one of the most private.");
	else if(pc.isMischievous()) output("Your VIP room is an interesting place, that’s for sure. Having seen the streets already, you can’t imagine most people afford this level of ‘care’, though maybe not every indulgence is to your taste. Still, it’s private - and given how valuable information seems on Dhaal, that’s worth a lot on its own. The amenities are alright, too.");
	else output("Seated on your cowgirl’s massive teats, you lounge in your VIP room and take it all in. From what you can tell, Dhaal must have a big case of the haves versus the have nots. Now that you’re here, it’s just a case of <i>staying</i> in that former category - and any information you can glean is only going to help. Good thing you signed up.");

	if(pc.hasStatusEffect("IylaInVIP"))
	{
		showWallCowAndIlya();
		output("\n\nIyla watches you attentively, waiting for your direction.");
	}
	else output("\n\nIyla isn’t here, but you could call her up.");
	if(creamgirlIsVIP()) output("\n\nThe cream-dispenser girl stands with her legs spread, glancing nervously between you and her <i>very</i> erect cock while sweat runs down her nubile body.");
	if(milkGirlIsVIP()) output("\n\nThe milk girl sits atop her bosom-burdened compatriot’s massive boobs, smiling at you.");

	processTime(5);
	//[Call Iyla/Iyla] [Wall-girl] {Cream-girl} [Sleep]
	VIPMilkBarMenu();
}

public function VIPMilkBarMenu():void
{
	clearMenu();
	//[Call Iyla/Iyla] [Wall-girl] {Cream-girl} [Sleep]
	addButton(0,(pc.hasStatusEffect("IylaInVIP") ? "Iyla":"Call Iyla"),VIPIylaCall,undefined,(pc.hasStatusEffect("IylaInVIP") ? "Iyla":"Call Iyla"),(pc.hasStatusEffect("IylaInVIP") ? "The barkeep of this ‘reputable’ establishment. What does she know that she wouldn’t have told non-VIPs?":"Call Iyla up to the room."))
	addButton(14,"Leave",leaveTheWallCowMenu,undefined,"Leave","Time to get something done.");
}

//[Call Iyla/Iyla]
//Iyla present://tt:The barkeep of this ‘reputable’ establishment. What does she know that she wouldn’t have told non-VIPs?
//Iyla not present://tt:Call Iyla up to the room.
public function VIPIylaCall():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");

	if(pc.hasStatusEffect("IylaInVIP"))
	{
		output("<i>“Iyla,”</i> you say, nodding at her.");
		output("\n\n<i>“Yes?”</i> Iyla says, smiling. <i>“Do you need anything?”</i>");
		processTime(1);
	}
	else
	{
		pc.createStatusEffect("IylaInVIP");
		output("<i>“Get Iyla,”</i> you say out loud to the room, trusting it’ll know how to interpret that.");
		output("\n\nNot even a minute later you hear a faint announcement that your guest has arrived, and you command the doors to open. There stands Iyla, smiling as she steps through the boundary and sheds her clothing.");
		output("\n\n<i>“Hello again,”</i> she says, sitting down on your milk-filled couch. <i>“Anything I can help with, or did you call me for some fun?”</i>");
		processTime(2);
	}
	//[Appearance] [Talk] [Fuck] [Drink] [CallGirlsUp] [OilMassage]
	iylaVIPMenu();
}

public function iylaVIPMenu():void
{
	clearMenu();
	addButton(0,"Appearance",iylaAppearanceVIP,undefined,"Appearance","Check Iyla out.");
	addButton(1,"Talk",talkToVIPIyla,undefined,"Talk","Get some real info out of her.");
	if(pc.hasGenitals()) addButton(2,"Fuck",fuckIyla,undefined,"Fuck","Take Iyla.");
	else addDisabledButton(2,"Fuck","Fuck","Iyla doesn't mess around with non-gendered folks.");
	addButton(3,"Drink",drinkFromIylaTiddies,undefined,"Drink","Have Iyla sit in your lap and give you a drink straight from her breasts.");
	addButton(4,"CallCreamCow",callCreamGirl,undefined,"Call Cream Cow","Get Iyla to call a cream girl up. They seem fun.");
	addButton(14,"Back",enterTheVIPRoom);
}

//[Appearance]
//tt:Check Iyla out.
public function iylaAppearanceVIP():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("Watching you observe her, Iyla closes her purple eyes, flips onto her side, and stretches out in all her nakedness for your benefit. Your eyes are naturally drawn to her glorious breasts as they bounce and wobble, but you do your best to take her all in.");
	output("\n\nHer ears stick out from the sides of her head just like a cow’s, and the nubby little horns add to the effect. She’s very much a natural beauty, her long white hair falling down her pale skin - you don’t imagine the inhabitants of Dhaal see much sunlight what with the smog, now that you think about it. Iyla purses her lush lips and utters a whispered ‘moo’, winking and giggling silently.");
	output("\n\n<i>“Can’t take your eyes off me, hmm?”</i> she suggests.");
	output("\n\n<i>“There’s a lot to take in,”</i> you say, grinning.");
	output("\n\n<i>“Mmm. So there is,”</i> Iyla sighs contentedly, cupping one of her enormous breasts and jiggling it gently. <i>“Best to be thorough.”</i>");
	output("\n\nHer beautiful rack is really a sight to behold. Shapely and curved, her tits are bouncy enough to be distracting whenever she moves or even breathes, and she knows it. Light pink areola surround her jutting nipples, each one large and round enough to be pinched or rolled between your fingers - or sucked, if you’re so inclined. Being a cowgirl, she’s more than amenable to the offer.");
	output("\n\nHer waspish waist gives way to a very curvy set of hips and a nice cushioned butt, her thick thighs almost obscuring the delicate pink slit between them. With a breathy moan she stretches one of her long legs back, moving it out of the way and giving you an eyeful of her pretty sex. Your gaze lingers just long enough to note she’s dripping wet, translucent arousal slowly rolling down her thigh before she sweeps her leg back and brushes it into her skin with a demure smile.");
	output("\n\n<i>“Would you like to sample my goods?”</i> she asks innocently, fanning herself. <i>“I have to admit, the attention is getting to me a bit...”</i>");
	output("\n\nMaybe you will.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",VIPIylaCall);
}

//[Talk]
//tt:Get some real info out of her.
public function talkToVIPIyla():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	//first time & talked to her:
	if(flags["IYLA_TALKS"] != undefined && flags["IYLA_VIP_TALKS"] == undefined) 
	{
		output("<i>“You weren’t being one hundred percent truthful with me at the bar, were you?”</i> you ask, smirking a little.");
		output("\n\n<i>“I wasn’t, and I apologize,”</i> Iyla says, nodding. <i>“As a member of the elite, you no doubt already know that some information can’t be afforded to the masses. Well, not that any of them have the time to make use of it.”</i>");
		output("\n\n<i>“Wouldn’t want any uprisings, after all,”</i> you mutter.");
		output("\n\n<i>“Uprisings?”</i> Iyla says with a hint of confusion. <i>“Oh, like armed takeovers. Those are only ever between zaibatsu, though it’s true they sometimes employ random citizenry as part of the operation.”</i>");
		output("\n\nYou consider that for a moment before shaking your head. <i>“I mean rebellion, like when the masses rise up against a perceived common foe. I’m guessing that doesn’t happen often on Dhaal.”</i>");
		output("\n\n<i>“Oh,”</i> she says, realization striking her. <i>“No... no. Not in my lifetime, anyway. I’m not great with history, sorry.”</i>");
		output("\n\n<i>“Lying to me again?”</i> you say, smiling.");
		output("\n\n<i>“Ha!”</i> Iyla says with a grin. <i>“If you don’t want to forgive me, it’s okay. I can make it up to you in other ways, if you like.”</i>");
		processTime(3);
		IncrementFlag("IYLA_VIP_TALKS");
		if(pc.hasGenitals()) addButton(0,"Make It Up",makeItUpSlashServiceMe,undefined,"Make It Up","Get Iyla to make herself useful twice over.");
		else addDisabledButton(0,"Make It Up","Make It Up","Without a set of genitals, Iyla would have nothing to service!");
		addButton(1,"Just Talk",justTalkToIyla,undefined,"Just Talk","All you need right now is words.");
	}
	else
	{
		output("<i>“Let’s chat a bit,”</i> you say.");
		output("\n\n<i>“Of course,”</i> Iyla purrs. <i>“And do you want me between your thighs while we do?”</i>");
		processTime(1);
		if(pc.hasGenitals()) addButton(0,"Service Me",makeItUpSlashServiceMe,undefined,"Service Me","Get Iyla to make herself useful twice over.");
		else addDisabledButton(0,"Make It Up","Make It Up","Without a set of genitals, Iyla would have nothing to service!");
		addButton(1,"Just Talk",justTalkToIyla,undefined,"Just Talk","All you need right now is words.");
	}
	//first time&talked to her: button says MakeItUp, else or subsequent times say ServiceMe. Neuters can only pick JustTalk.
	//[MakeItUp/ServiceMe] [JustTalk]
}

//[MakeItUp/ServiceMe]
//tt:Get Iyla to make herself useful twice over.
//invalid:Without a set of genitals, Iyla would have nothing to service!
public function makeItUpSlashServiceMe():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("You beckon her over and she sets to her task immediately, sinking to her knees between your [pc.thighs] and giving you a nice look at her impressive rack jiggling" + (!pc.isNude() ? " as she removes your clothing":"") + ". Settling back in your chair, you reflect on the decisions that have led you to the point of getting");
	if(pc.isHerm()) output(" your [pc.cockBiggest] sucked while Iyla deftly rubs your [pc.clit], sending little spasms up your spine as you lay atop a mountain of quaking breastflesh.");
	else if(pc.hasCocks()) output(" your [pc.cockBiggest] sucked by Iyla while she jacks off your [pc.cockSmallest], sending little spasms up your spine as you lay atop a mountain of quaking breastflesh.");
	else if(pc.hasCock()) output(" your [pc.cock] sucked by Iyla while you lie atop a mountain of quaking breastflesh" + (pc.balls > 0 ? ", her deft little hands fondling your [pc.balls] lovingly.":""));
	else if(pc.hasVaginas()) output(" a long, warm tongue up one of your cunts and " + (pc.totalVaginas() == 2 ? "expert fingers stroking the ceiling of your other":"expert fingers thrusting into two others") + " while you lay atop a mountain of quaking breastflesh.");
	else output(" your [pc.clit] sucked by Iyla, her fingers deftly probing between your labia while you lie atop a mountain of quaking breastflesh.");
	output(" Now <i>this</i> is VIP treatment...");
	processTime(10);

	//[Bar] [Zaibatsu] [Girls] [Cum]
	clearMenu();
	addButton(0,"Bar",VIPIylaBarTalkLewd,undefined,"Bar","What’s <i>really</i> up with the bar?");
	addButton(1,"Zaibatsu",VIPIylaZaibatsuTalkLewd,undefined,"Zaibatsu","The driving forces of Dhaal. What are they up to?");
	addButton(2,"Girls",VIPIylaGirlsTalkLewd,undefined,"Girls","What about the girls?");
	addButton(3,"Cum",cumForVIPIylaTalks,undefined,"Cum","Hold Iyla in place and focus on the pleasure.");
}

//[Bar]
//tt:What’s <i>really</i> up with the bar?
public function VIPIylaBarTalkLewd():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“Tell me about the bar,”</i> you grunt.");
	output("\n\n<i>“Mmm-”</i> Iyla murmurs, ");
	if(pc.hasCock()) output("sliding up off your cock and grinning as she begins jerking you instead");
	else output("sliding her tongue out of your dripping cunt and grinning up at you");
	output(". <i>“Sure. To be honest... I don’t really know that much about it.”</i> Glancing down and planting a kiss on your " + (pc.hasCock() ? "[pc.cockHeadBiggest]":"engorged clitoris") + ", she continues. <i>“It’s managed by Brightwater. All the financials, serving girls, VIP management... I don’t know anything about it. They keep me in the dark.”</i>");
	output("\n\n<i>“A-and you?”</i> you manage, trying to focus. Fuck, she is <b>good</b> at this.");
	output("\n\n<i>“I’m a low-level employee of the zaibatsu,”</i> she says, " + (pc.hasCock() ? "side-eyeing your bulging dick while she rubs her cheek against it":"wiggling her tongue against your inflamed lips") + ". <i>“I’m above the serving girls, at least. They don’t have a clue about any of this stuff.”</i>");
	output("\n\nYour eyes are drawn to the patch on her shoulder as she resumes " + (pc.hasCock() ? "blowing you":"tonguing your [pc.pussy]") + " as if her life depended on it. She might think herself above the cowgirls, but you have to wonder by how much, really...");
	processTime(6);
	IncrementFlag("IYLA_VIP_TALKS");
	pc.changeLust(10);
	setButtonDisabled(0);
}

//[Zaibatsu]
//tt:The driving forces of Dhaal. What are they up to?
public function VIPIylaZaibatsuTalkLewd():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“The zaibatsu,”</i> you huff. <i>“What exactly <b>are</b> they?”</i>");
	output("\n\n" + (pc.hasCock() ? "<i>“Mmghbl- hhk,”</i> Iyla gurgles, slipping your dick from the inside of her soft cheek to answer. <i>“They’re the lifeblood of Dhaal.”</i> With a heated look on her face, she closes her eyes and lightly slaps your cockhead against her cheek a few times.":"<i>“Nnnn-”</i> Iyla says, slurping up the dripping juices from her tongue as she sucks it back into her mouth. <i>“They’re the lifeblood of Dhaal.”</i> With a heated look on her face, she lifts a finger to her lips and licks it clean.") + " <i>“Mmm... if you don’t belong to one, you’re a nobody. Just a dreg.”</i> She sighs wistfully. <i>“But you’ll be taken in by one eventually... one way or another.”</i>");
	output("\n\n<i>“Is that what happened to you?”</i> you ask.");
	output("\n\n<i>“Ha, no,”</i> she says, smirking up at you. <i>“I sought this out. I don’t know how it looks from the outside, but...”</i> she trails off, bending down to smooch " + (pc.hasCock() ? "the base of your cock":"the lips of your cunny") + ". <i>“The situation I have here is like an insulated dreamworld compared to what it’s like on the streets.”</i>");
	output("\n\nYou elect to keep your thoughts on that to yourself, and instead grunt through grit teeth as another wave of ecstasy washes over you.");
	output("\n\n<i>“Which are- are the most important?”</i> you ask, determined to keep down this line of questioning.");
	output("\n\n<i>“Hmmmmm,”</i> Iyla decides at length, keeping you torturously close to orgasm with her skillful tongue. <i>“Utopian Skies handles people. Hotels, brothels, virtual reality setups, the whole gamut. Sex slaves, art installations, garden decorations... you name it, they’ll convince someone to do it for you. Stay away from them if you can. Paragon Inc has an iron grip on food, implants, and weaponry. Typical thuggish gunrunners. Then there’s us! Brightwater.”</i> She smiles up at you. <i>“Good thing you came here. We’ve got a lot to offer. Liquor, pharmaceuticals, medicine... all the fun stuff.”</i>");
	output("\n\n<i>“That’s all?”</i> you ask, somewhat surprised. <i>“I thought there’d be tons.”</i>");
	output("\n\n<i>“Well... there were,”</i> Iyla laughs a little, reaching up to brush her hair out of her face. <i>“Over time, they were swallowed up until there was nothing left.”</i> She grins. " + (pc.hasCock() ? "<i>“Kinda like what I’m planning to do to your cum.”</i>":"<i>“Kinda like what I’m doing with your pussy.”</i>"));
	output("\n\nFuuuck...");
	processTime(6);
	pc.changeLust(10);
	IncrementFlag("IYLA_VIP_TALKS");
	setButtonDisabled(1);
}

//[Girls]
//tt:What about the girls?
public function VIPIylaGirlsTalkLewd():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“How about the girls?”</i> you strain, trying not to moan. <i>“Fuck, Iyla...”</i>");
	output("\n\n<i>“Haha, you like me?”</i> Iyla teases, grinning up at you with cheeks flushed. <i>“The girls are from Utopian Skies. Well, most of them. Some are just New Texans we picked up off the streets. They get paid very handsomely to do what they do, which is why so many spring at the chance. After all,”</i> she says, winking as she reaches down to squeeze a nipple, <i>“letting people drink from your tits is pretty rewarding all on its own.”</i>");
	output("\n\nYou watch as a little cascade of milky mixed drink spurts down her front, dribbling down her stomach. So she’s a serving girl as well... perfect.");
	output("\n\n<i>“Guess I don’t need to call up another girl, then,”</i> you note.");
	output("\n\n<i>“You sure don’t,”</i> she says with some pride, sticking her considerable chest out. <i>“Oh, unless you want some cream. I can show you some cool tricks with <b>those</b> girls - they’re all sorts of special.”</i>");
	output("\n\nYour mind goes blank again as she resumes " + (pc.hasCock() ? "bobbing on your cock, gurgling enthusiastically around your sensitive flesh":"tongue-fucking your pulsing slit, forcing you closer to orgasm") + ".");
	processTime(5);
	pc.changeLust(10);
	IncrementFlag("IYLA_VIP_TALKS");
	setButtonDisabled(2);
}

//[Cum]
//takes you back to the main Iyla menu after a [next]. Disables [makeitup/serviceme] for x minutes depending on your refractory period, i guess.
//tt:Hold Iyla in place and focus on the pleasure.
public function cumForVIPIylaTalks():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“Stars, don’t stop,”</i> you pant, grabbing Iyla’s head. <i>“Keep going!”</i>");
	output("\n\nFuck, she’s nothing if not incredibly dedicated. You groan in bliss as she ");
	if(pc.isHerm()) 
	{
		output("slams herself down to the base of your cock with her lips wrapped tightly around its length, hollowing her cheeks and sucking while she pumps your slickened, flexing cunt with her fingers and strokes your clit with her thumb. You cum with the force of a starship, screaming wordlessly as you thrust up into her mouth and hover there with your [pc.hips] shaking.");
		output("\n\n<i>“God, FUCK! Uh! Uuuhhh!”</i> you strain, screwing up your face and gritting your teeth. <i>“Rrrrggh! Iylaaaaa!”</i>");
		output("\n\nIyla gracefully swallows down your seed, ");
		if(pc.cumQ() < 2000) 
		{
			output("letting the ropes splatter down her throat and hang there before she forces them into her stomach to settle there. Right before you finish she pulls back and works out the very last strand onto her own face, branding herself with your spunk while she continues fingering your convulsing pussy. You hang in the air panting like a stallion until the strength fades from your [pc.legOrLegs] and you fall back to your seat, drawing a loud moan of pleasure from the cowgirl stuck in the wall.");
			output("\n\n<i>“I trust you’re happy with my services,”</i> Iyla says, smiling sweetly.");
			output("\n\nYou don’t bother to reply, leaning back into the chair and closing your eyes for a moment. The pleasurable little ache emanating from your fluttering loins is all you need for company right now.");
		}
		else if(pc.cumQ() < 5000)
		{
			output("gulping hard to ensure every last spurt ends up in her stomach to settle. Right before you finish she pulls back and jacks the last few ropes onto her own face, covering herself in your spunk while she continues fingering your convulsing pussy. You hang in the air panting like a stallion until the strength fades from your [pc.legOrLegs] and you fall back to your seat, drawing a loud moan of pleasure from the cowgirl stuck in the wall.");
			output("\n\n<i>“I trust you’re happy with my services,”</i> Iyla says, smiling sweetly.");
			output("\n\nYou don’t bother to reply, leaning back into the chair and closing your eyes for a moment. The pleasurable little ache emanating from your fluttering loins is all you need for company right now.");
		}
		else if(pc.cumQ() < 10000) 
		{
			output("gulping with increasing speed until it becomes obvious she can’t outpace your ejaculations. Instead she throws herself down your throbbing shaft and drives you so deep into her throat you blow your massive load right into her stomach, listening to her quiet choking and gagging as an accompaniment to her utter debasement. When she senses you’re close to finishing she slowly drags herself up and jacks you off onto her face, splattering her pretty visage with your seed.");
			output("\n\n<i>“Huuhh,”</i> she breathes, thrusting her neck out as she swallows, trying to keep all of your sperm down. She places a hand on her swollen stomach as if for comfort, looking to you. <i>“H-happy with my service, I hope...”</i>");
			output("\n\nYou don’t bother to reply, leaning back into the chair and closing your eyes for a moment. The pleasurable little ache emanating from your fluttering loins is all you need for company right now.");
		}
		else
		{
			output("or at least she tries. She handles the first few gulps well enough, but she’s just a little too slow to dive down your cock to let you cum right down her throat and instead her eyes go wide as spunk jets from her nose, filling her nasal cavity and jetting down her throat. To her credit, though, she doesn’t give up.");
			output("\n\nWith a long, gagging gurgle that feels like heaven around your throbbing shaft, she gets you as deep as she can while her eyes begin to roll back in her head. Load after load of thick, hot spunk pumps into her swelling belly and pours from her dripping nose until you’ve had enough and drag her off, jacking off onto her face and covering her front in jizz until she comes back to real consciousness.");
			output("\n\n<i>“O-oh-ghhk,”</i> she chokes, gritting her teeth and swallowing back your sperm. <i>“Hhh- hk. H-hope you, you enjoyed me...”</i>");
			output("\n\n<i>“Sure did,”</i> you sigh, lying back and closing your eyes for a spell. <i>“Clean yourself up a bit, girl.”</i>");
			output("\n\nShe stumbles against the wall cradling her bloated stomach and manages to fall through, right into what sounds like a shower. That’s cool.");
			output("\n\nIyla returns a few minutes later, looking a lot less bedraggled than she was and wearing her patented smile.");
		}
	}
	else if(pc.hasCocks())
	{
		output("slams herself down to the base of your cock with her lips wrapped tightly around its length, hollowing her cheeks and sucking while she pumps " + (pc.cockTotal() == 2 ? "your other dick like a piston":"her hands up and down another two like pistons") + ". The orgasm that strikes you is so strong you lift your [pc.hips] into the air, gritting your teeth so hard your voice comes out as little more than a choked garble.");
		output("\n\n<i>“Fffhhhkkk,”</i> you grunt, drool running from the corner of your lips. <i>“Nngh! Nnh! Nnnnfffh!”</i>");
		output("\n\nIyla sucks you off effortlessly and expertly, juggling her hands and her mouth with such incredible skill it feels like you’re getting " + (pc.cockTotal() == 2 ? "both":"all") + " of your pulsing cocks sucked at once. She swallows down your cum with grace, catching it with her tongue and in her cheeks and letting it gush down the back of her throat until she’s splattered with it both inside and outside. With a heavy sigh you collapse back to your chair, letting your head loll back as the cowgirl lets out a long, loud moo of pleasure.");
		output("\n\n<i>“Mmm... I hope you’re happy with my services,”</i> Iyla says, giggling. <i>“That was fun.”</i>");
		output("\n\nYou’re more than happy with that, but for now you just want to relax and let that pleasurable little ache in your groin wear away...");
	}
	else if(pc.hasCock())
	{
		output("slams herself down to the base of your cock with her lips wrapped tightly around its length, hollowing her cheeks and sucking you as hard as she possibly can. You cum with the force of a starship, screaming wordlessly as you thrust up into her mouth and hover there with your [pc.hips] shaking.");
		output("\n\n<i>“God, FUCK! Uh! Uuuhhh!”</i> you strain, screwing up your face and gritting your teeth. <i>“Rrrrggh! Iylaaaaa!”</i>");
		output("\n\nIyla gracefully swallows down your seed, ");
		if(pc.cumQ() < 2000) 
		{
			output("letting the ropes splatter down her throat and hang there before she forces them into her stomach to settle there. Right before you finish she pulls back and works out the very last strand onto her own face, branding herself with your spunk with a soft giggle of enjoyment. You hang in the air panting like a stallion until the strength fades from your [pc.legOrLegs] and you fall back to your seat, drawing a loud moan of pleasure from the cowgirl stuck in the wall.");
			output("\n\n<i>“I trust you’re happy with my services,”</i> Iyla says, smiling sweetly.");
			output("\n\nYou don’t bother to reply, leaning back into the chair and closing your eyes for a moment. The pleasurable little ache emanating from your fluttering loins is all you need for company right now.");
		}
		else if(pc.cumQ() < 5000) 
		{
			output("gulping hard to ensure every last spurt ends up in her stomach to settle. Right before you finish she pulls back and jacks the last few ropes onto her own face, covering herself in your spunk while giggling softly. You hang in the air panting like a stallion until the strength fades from your [pc.legOrLegs] and you fall back to your seat, drawing a loud moan of pleasure from the cowgirl stuck in the wall.");
			output("\n\n<i>“I trust you’re happy with my services,”</i> Iyla says, smiling sweetly.");
			output("\n\nYou don’t bother to reply, leaning back into the chair and closing your eyes for a moment. The pleasurable little ache emanating from your fluttering loins is all you need for company right now.");
		}
		else if(pc.cumQ() < 10000)
		{
			output("gulping with increasing speed until it becomes obvious she can’t outpace your ejaculations. Instead she throws herself down your throbbing shaft and drives you so deep into her throat you blow your massive load right into her stomach, listening to her quiet choking and gagging as an accompaniment to her utter debasement. When she senses you’re close to finishing she slowly drags herself up and jacks you off onto her face, splattering her pretty visage with your seed.");
			output("\n\n<i>“Huuhh,”</i> she breathes, thrusting her neck out as she swallows, trying to keep all of your sperm down. She places a hand on her swollen stomach as if for comfort, looking to you. <i>“H-happy with my service, I hope...”</i>");
			output("\n\nYou don’t bother to reply, leaning back into the chair and closing your eyes for a moment. The pleasurable little ache emanating from your fluttering loins is all you need for company right now.");
		}
		else
		{
			output("or at least she tries. She handles the first few gulps well enough, but she’s just a little too slow to dive down your cock to let you cum right down her throat and instead her eyes go wide as spunk jets from her nose, filling her nasal cavity and jetting down her throat. To her credit, though, she doesn’t give up.");
			output("\n\nWith a long, gagging gurgle that feels like heaven around your throbbing shaft, she gets you as deep as she can while her eyes begin to roll back in her head. Load after load of thick, hot spunk pumps into her swelling belly and pours from her dripping nose until you’ve had enough and drag her off, jacking off onto her face and covering her front in jizz until she comes back to real consciousness.");
			output("\n\n<i>“O-oh-ghhk,”</i> she chokes, gritting her teeth and swallowing back your sperm. <i>“Hhh- hk. H-hope you, you enjoyed me...”</i>");
			output("\n\n<i>“Sure did,”</i> you sigh, lying back and closing your eyes for a spell. <i>“Clean yourself up a bit, girl.”</i>");
			output("\n\nShe stumbles against the wall cradling her bloated stomach and manages to fall through, right into what sounds like a shower. That’s cool.");
			output("\n\nIyla returns a few minutes later, looking a lot less bedraggled than she was and wearing her patented smile.");
		}
	}
	else if(pc.hasVaginas())
	{
		output("presses her tongue upwards into your tightening cunny and suddenly, the knot that’s been balling up in your abdomen comes loose all at once. With a strained, grit-teeth moan, you cum in Iyla’s mouth so hard your calves almost cramp.");
		output("\n\n<i>“Hhhggghh- ffhhhk!”</i> you grunt through your teeth, throwing your head back as spasms rock your body, lightning dancing up your spine and forcing you to lift your [pc.hips]. Iyla’s right there with you, pressing down on your clits and tonguing your slit so well you forget your own name. <i>“Nnnuuuhhhhggh! Guh! Uh! Mmmhhh!”</i>");
		output("\n\nGod <i>fucking</i> damn it, this bitch is <i>amazing</i> - biting down on your lip, you swear right then and there to visit her every time you’re on Dhaal just to get another taste of this kind of pampering. It’s like she’s pulling the orgasm out of you with her tongue, drawing you further and further out of your convulsing body until your very soul is exposed to her. Then, and only then does she finally let you collapse back onto your chair, sweaty and shaking, your [pc.thighs] so loose you’d swear you can’t even feel your hips.");
		output("\n\nYou don’t even hear her speak, the words travelling right through your dazed, empty skull and out the other side while you try to regain your grip on the world, [pc.girlCum] dripping from your slits. It feels like a fucking firework went off in your head, and that <i>beautiful</i> ache of satisfaction from your very well taken-care of pussies... there’s nothing else like it.");
		output("\n\n<i>“You played me like an instrument,”</i> you manage, gripping the cowgirl teats beneath you. <i>“Stars...”</i>");
		output("\n\n<i>“Glad to hear you enjoyed my services after all,”</i> Iyla says, smiling.");
	}
	else
	{
		output("presses her tongue upwards into your tightening cunny and suddenly, the knot that’s been balling up in your abdomen comes loose all at once. With a strained, grit-teeth moan, you cum in Iyla’s mouth so hard your calves almost cramp.");
		output("\n\n<i>“Hhhggghh- ffhhhk!”</i> you grunt through your teeth, throwing your head back as spasms rock your body, lightning dancing up your spine and forcing you to lift your [pc.hips]. Iyla’s right there with you, pressing down on your clit and tonguing your slit so well you forget your own name. <i>“Nnnuuuhhhhggh! Guh! Uh! Mmmhhh!”</i>");
		output("\n\nGod <i>fucking</i> damn it, this bitch is <i>amazing</i> - biting down on your lip, you swear right then and there to visit her every time you’re on Dhaal just to get another taste of this kind of pampering. It’s like she’s pulling the orgasm out of you with her tongue, drawing you further and further out of your convulsing body until your very soul is exposed to her. " + (pc.isSquirter() ? "[pc.GirlCum] squirts from your slit, splashing down her chin":"[pc.GirlCum] drips down her chin") + " while you cry out in utter rapture, your vision going white.Then, and only then does she finally let you collapse back onto your chair, sweaty and shaking, your [pc.thighs] so loose you’d swear you can’t even feel your hips.");
		output("\n\nYou don’t even hear her speak, the words travelling right through your dazed, empty skull and out the other side while you try to regain your grip on the world, [pc.girlCum] dripping from your slits. It feels like a fucking firework went off in your head, and that <i>beautiful</i> ache of satisfaction from your very well taken-care of pussy... there’s nothing else like it.");
		output("\n\n<i>“You played me like an instrument,”</i> you manage, gripping the cowgirl teats beneath you. <i>“Stars...”</i>");
		output("\n\n<i>“Glad to hear you enjoyed my services after all,”</i> Iyla says, smiling.");
	}
	processTime(10);
	//Good enough stand-in, IMO.
	new ZaikaMilkThief().loadInMouth(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",VIPIylaCall);
}

//[JustTalk]
//tt:All you need right now is words.
public function justTalkToIyla():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“No, thanks,”</i> you say, waving her off. <i>“Not in the mood.”</i>");
	output("\n\n<i>“Sure,”</i> Iyla says easily, lounging back across the cowgirl’s tits.");
	processTime(1);
	clearMenu();
	//[Bar] [Zaibatsu] [Girls] [Herself] [???]
	addButton(0,"Bar",talkToIylaBar,undefined,"Bar","What’s <i>really</i> up with the bar?");
	addButton(1,"Zaibatsu",talkToIylaZaibatsu,undefined,"Zaibatsu","The driving forces of Dhaal. What are they up to?");
	addButton(2,"Girls",talkToIylaAboutGirls,undefined,"Girls","What about the girls?");
	addButton(3,"Herself",talkToIylaAboutHerself,undefined,"Herself","The barkeep herself. What’s Iyla’s deal?");
	if(flags["IYLA_PEER_TALK_UNLOCK"] != undefined) addButton(4,"Peers?",talkToIylaAboutPeers,undefined,"Peers?","Peers?");
	else addDisabledButton(4,"???","???","You don't enough to ask this.");
	addButton(14,"Back",VIPIylaCall);
}

//[Bar]
//tt:What’s <i>really</i> up with the bar?
public function talkToIylaBar():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“Tell me about the bar,”</i> you say, pointing at the door.");
	output("\n\n<i>“Owned by Brightwater, run by Brightwater,”</i> Iyla replies, smiling. <i>“I’m a low level employee here. But past that, I honestly couldn’t tell you much. Higher-ups handle things like procuring the girls. I just train them and tend the bar. They’re very good learners, at least. Nothing like a pleasure patch to reward someone for doing what they’re told - and besides, they <b>love</b> being told what to do.”</i>");
	output("\n\nYou can’t help but note she has a pleasure patch on her shoulder herself... ‘low level’ employee indeed, by the looks of it.");
	processTime(3);
	IncrementFlag("IYLA_VIP_TALKS");
	setButtonDisabled(0);
}

//[Zaibatsu]
//tt:The driving forces of Dhaal. What are they up to?
public function talkToIylaZaibatsu():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“What about the zaibatsu?”</i> you ask. <i>“What are they, really?”</i>");
	output("\n\n<i>“Conglomerates, basically,”</i> Iyla says, shrugging. <i>“It wouldn’t be a lie to say the zaibatsu <b>are</b> Dhaal. Everything runs through them, nothing escapes their notice. If you’re anyone, you belong to a zaibatsu. And if you don’t, well... you will, sooner or later, in one capacity or another.”</i>");
	output("\n\n<i>“How’d you wind up being involved?”</i> you say. It doesn’t seem like she was exactly snatched off the street.");
	output("\n\n<i>“I worked for this,”</i> she says with a smirk. <i>“It’s better than being out there, on the streets... never knowing what the day was going to bring. My life with Brightwater has honestly been nothing but bliss. I don’t regret it for a second.”</i>");
	output("\n\n<i>“Which zaibatsu are the most important, then?”</i> you say.");
	output("\n\n<i>“There’s three of them, shouldn’t be too hard to keep track of,”</i> Iyla says, smiling.");
	output("\n\n<i>“Three?”</i> you ask, confused. <i>“I thought there was meant to be tons.”</i>");
	output("\n\n<i>“Sounds like outdated info,”</i> she says, shaking her head. <i>“In the past, there were plenty, and they were pretty much just gangs. But when corporate money comes down from on high and asks you to jump, you jump. Eventually all of them came under one of three umbrellas. Utopian Skies, Paragon Inc, and us, Brightwater LLC.");
	output("\n\nUtopian Skies are the ‘people-handlers’. Hotels and brothels that cater to anyone, even Peers. Well, so I’ve heard, anyway. Virtual reality experiences. For the right price, you can buy a person to be anything you want from them.”</i> She shudders a little. <i>“The girls here have it great in comparison to some of the others. Trust me, you have to see it to believe it.”</i>");
	output("\n\n<i>“Then there’s Paragon Inc,”</i> Iyla continues. <i>“Mercenaries, gunrunners, smugglers - the whole lot. They make their money on food and implants as well as weaponry. Bunch of low-brow thugs, really. All fights are good fights when you’re the one supplying the guns, if you catch my drift.”</i>");
	output("\n\n<i>“And then there’s Brightwater,”</i> you say, nodding at her.");
	output("\n\n<i>“Yup,”</i> she says, nodding. <i>“We’ve got the good stuff on lockdown. Pharmaceuticals, medicine, and liquor. Not exactly a secret that that’s what makes this whole operation possible,”</i> she says, gesturing at the bar in general. <i>“That kind of research is furthering what we can do with ourselves. Well, and you can get drunk.”</i> Iyla grins. <i>“That’s fun too.”</i>");
	output("\n\n<i>“So the zaibatsu work together, I imagine,”</i> you say, mulling it over in your head. <i>“Are there singular leaders?”</i>");
	output("\n\n<i>“Nope,”</i> she says, shaking her head. <i>“At least in Brightwater, we have Sectors. There are Sector Chiefs who report upwards, but there’s no leader, as far as I know. Just various councils and that kind of thing.”</i> She shrugs. <i>“Honestly, that’s above my pay grade.”</i>");
	processTime(11);
	IncrementFlag("IYLA_VIP_TALKS");
	if(flags["IYLA_PEER_TALK_UNLOCK"] == undefined)
	{
		flags["IYLA_PEER_TALK_UNLOCK"] = 1;
		addButton(4,"Peers?",talkToIylaAboutPeers,undefined,"Peers?","Peers?");
	}
	setButtonDisabled(1);
}

//[Girls]
//tt:What about the girls?
public function talkToIylaAboutGirls():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“Tell me a bit about the girls here,”</i> you say. <i>“Like, say, the one we’re sitting on.”</i>");
	output("\n\n<i>“The wall-girl?”</i> Iyla says, smiling. <i>“She’s a babe. Whenever one of the girls responds <b>really</b> well to breast enlargement, we offer them the opportunity to be a wall-girl. I’m pretty sure she gets paid more than I do, you know! It’s a nice gig.”</i>");
	output("\n\n<i>“She does seem to enjoy it,”</i> you note.");
	output("\n\n<i>“Oh, yeah,”</i> Iyla nods. <i>“That’s because every time you sit on her or move around she gets flooded with endorphins. If you could see her back half you’d see she’s constantly cumming her brains out - you and her are best friends, as far as she’s concerned.”</i>");
	output("\n\nThat explains the deep, lusty moans every time you move. <i>“How about the serving girls?”</i>");
	output("\n\n<i>“All New Texans, and all modified to serve the best we have to offer,”</i> Iyla says proudly. <i>“The larger their breasts are, the easier it is to modify them. Well, I think. That’s what I was told when I got mine done.”</i>");
	output("\n\n<i>“Yours? You’re a serving girl too?”</i> you ask.");
	output("\n\n<i>“Sure am,”</i> she says, smiling brightly. <i>“Here, squeeze my nipples.”</i>");
	output("\n\nYou reach out and oblige, eliciting a low, sexual moan from Iyla’s quivering lips as milky goodness begins to trickle down her chest.");
	output("\n\n<i>“Aa-ah...”</i> she whispers, nipples now standing stiffly erect. <i>“Mm- sorry, I lose myself a little when you do that... anyway, I don’t serve our regular clientele. Otherwise there’d be no order in the bar.”</i>");
	output("\n\nShe’s blushing a little now. Call it a gut feeling, but you think she likes the serving a <i>lot</i> more than she wants to let on. There’s time enough for that later, though. <i>“How about the cream girls, then?");
	//had a cream girl to completion before:
	if(flags["VIP_CREAM_COWS_CALLED"] != undefined) output(" You mentioned a no-blowjob rule.");
	output("”</i>");
	output("\n\n<i>“Ohooo, yeah,”</i> Iyla says, grinning fiercely. <i>“It’d be easier to just show you. Tell me and I’ll call a girl up for you.”</i>");
	processTime(7);
	IncrementFlag("IYLA_VIP_TALKS");
	pc.changeLust(3);
	setButtonDisabled(2);
}

//[Herself]
//tt:The barkeep herself. What’s Iyla’s deal?
public function talkToIylaAboutHerself():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“So, tell me then,”</i> you say, nodding at her. <i>“What’s your life on Dhaal <b>really</b> been like?”</i>");
	output("\n\n<i>“All over the place,”</i> Iyla says, shrugging. <i>“I was just a drifter like my parents until I got recruited by Brightwater. It’s not much of a life out there, you know. I mean... well, just walk outside and you’ll see. Go look at the common muck - then come back and take a long shower.”</i>");
	output("\n\n<i>“When’d you join up?”</i>");
	output("\n\n<i>“Four years back,”</i> she says. <i>“They asked if I wanted to work with a bunch of other women and I jumped at the chance. Honestly, I would have settled for being a serving girl... really, any way out is better than the alternative.”</i> She shudders. <i>“I don’t want to end up a cumtank. I mean, there’s worse things, but that one kinda sticks out to me.”</i>");
	output("\n\n<i>“A what?”</i> you ask, confused. Did she mean that literally?");
	output("\n\n<i>“Oh, a cumtank,”</i> she says, seeing your confusion. <i>“Food and water are pretty big ongoing costs, right? So... you can get yourself modified to live off semen. The operation doesn’t cost much in terms of money, but it’s really obvious when someone’s got it done... it’s uh, a little undignified. Also irreversible.”</i> She shakes her head. <i>“It’s mostly for the desperate.”</i>");
	output("\n\n<i>“Huh,”</i> you mutter, eyebrows raised.");
	output("\n\nYou decide not to ask about what happened to her parents. Still, though, there’s something bothering you...");
	output("\n\n<i>“Iyla, you’re a cowgirl. Right?”</i> you ask.");
	output("\n\n<i>“As far as I know,”</i> she says, smiling as she reaches up and touches her flitting ears. <i>“Shouldn’t be too hard to tell.”</i>");
	output("\n\n<i>“And you grew up here,”</i> you continue.");
	output("\n\n<i>“Uh huh. It wasn’t easy, either,”</i> Iyla sighs. <i>“Dhaal’s a dangerous place.”</i>");
	output("\n\n<i>“But the only natives are zaika,”</i> you prod, eyeing her. <i>“Dhaal was only rediscovered recently.”</i>");
	output("\n\n<i>“Huh?”</i> she says, confused. <i>“So?”</i>");
	output("\n\n<i>“So... how did you get here?”</i> you prompt her.");
	output("\n\n<i>“I...”</i> Iyla stutters, tilting her head slightly. She blinks a couple of times, creases of concern lining her face, then shakes her head and laughs. <i>“Jeez, I don’t know. The planet’s probably just not as secret as everyone thought. All the other girls came from New Texas... except me.”</i>");
	output("\n\n<i>“Right,”</i> you murmur.");
	processTime(10);
	IncrementFlag("IYLA_VIP_TALKS");
	setButtonDisabled(3);
}

//flags["IYLA_PEER_TALK_UNLOCK"]
//[???/Peers?]
//only unlocks after talking about Zaibatsus when not getting sucked off/tongued.
public function talkToIylaAboutPeers():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“Earlier on, you mentioned something about ‘Peers’, like they were some kind of important being. What’s a Peer, exactly?”</i> you ask.");
	output("\n\n<i>“Hmm... how do I explain this?”</i> Iyla sighs, leaning back and looking up at the ceiling. <i>“A Peer... has everything. They can do anything, whenever they want, and the rules don’t apply. To be honest, anything I tell you about them is going to sound like exaggerated rumors - because they are.”</i> She raises her head and shrugs. <i>“I’ve never met one, and I doubt I ever will. They don’t exactly fraternize with people like me.”</i>");
	output("\n\n<i>“Sounds like they live on another world entirely,”</i> you say.");
	output("\n\n<i>“You’d know more about that than me,”</i> she says, smiling. <i>“Actually, you might end up meeting one sometime if you’re a bigshot. You’ll have to come back and tell me about it.”</i>");
	processTime(6);
	IncrementFlag("IYLA_VIP_TALKS");
	setButtonDisabled(4);
}

//[Fuck]
//not for neuts
//tt:Take Iyla.
//invalid tt:You’d need genitals for that.
public function fuckIyla():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("You beckon Iyla over and she comes, slipping out of her heels and draping herself across you with a smile. A hand at her breast is all it takes to make her take a sharp breath, arching her back as you tease her nipple, squeezing her just enough to make Arovok’s specialty start dripping down her perky bosom.");
	output("\n\n<i>“Mmmh,”</i> she murmurs, nuzzling against you and wrapping her arms around your waist as she gets comfortable. <i>“You know how to treat me.”</i>");
	processTime(2);
	pc.changeLust(5);
	clearMenu();
	//[Cowgirl] [69] [Titfuck] [Threesome]
	var capacity:Number = iylaCapacity();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(capacity) >= 0) addButton(0,"Cowgirl",penisRouter,[cowgirlWithVIPIyla,capacity,false,0],"Cowgirl","Have Iyla ride your dick" + (pc.hasCocks() ? "s":"") + " while you lie down.");
		else addDisabledButton(0,"Cowgirl","Cowgirl","Ilya may be a stretchy girl, but even she has limits.");
		addButton(2,"Titfuck",penisRouter,[tittyFuckIylasTiddies,80085,false,0],"Titfuck","Fuck Iyla’s milky titties.");
	}
	else
	{
		addDisabledButton(0,"Cowgirl","Cowgirl","You need a penis for this.");
		addDisabledButton(2,"Titfuck","Titfuck","You need a penis for this.");
	}
	if(pc.hasGenitals()) 
	{
		if(pc.isHerm()) addButton(1,"69",Ilya69VIP,undefined,"69","Turn Iyla around and suck her clit while she pleases you.");
		else if(pc.hasCocks()) addButton(1,"69",Ilya69VIP,undefined,"69","Turn Iyla around and suck her clit while she pleases your dicks.");
		else if(pc.hasCock()) addButton(1,"69",Ilya69VIP,undefined,"69","Turn Iyla around and suck her clit while she blows you.");
		else if(pc.hasVaginas()) addButton(1,"69",Ilya69VIP,undefined,"69","Turn Iyla around and suck her clit while she tongues your cunts.");
		else addButton(1,"69",Ilya69VIP,undefined,"69","Turn Iyla around and suck her clit while she tonguefucks your slit.");
		if(creamgirlIsVIP()) addButton(3,"Threesome",creamyDreamyThreesomeGirl,undefined,"Threesome","Get the cream-girl involved for a threesome.");
		else addDisabledButton(3,"Threesome","Threesome","You’d need to call a cream-girl up for this.");
	}
	else 
	{
		addDisabledButton(1,"69","69","You need genitals for this.");
		addDisabledButton(3,"Threesome","Threesome","You need genitals for this.");
	}
}

//[Cowgirl]
//requires at least 1 dick.
//tt:Have Iyla ride your dick{s} while you lie down.
public function cowgirlWithVIPIyla(x:int):void
{
	clearOutput();
	showIyla(true);
	var y:int = -1;
	if(pc.hasCocks())
	{
		y = pc.cockThatFits(iylaCapacity());
		if(y == x) y = pc.cockThatFits2(iylaCapacity());
	}
	output("Ever receptive to your needs, Iyla picks up on your desire before you have to voice it. Eyeing your [pc.cocks], she giggles and reaches down.");
	IncrementFlag("IYLA_COWGALED");
	if(y >= 0) 
	{
		output("\n\n<i>“Well, aren’t <b>these</b> impressive?”</i> Iyla coos in an appreciative tone, stroking your " + (pc.cockTotal() == 2 ? "twin prides":"largest dicks") + " and running her fingers over their tips. <i>“Enough to make a girl fancy taking both.”</i>");
		if(flags["IYLA_COWGALED"] == 1)
		{
			output("\n\n<i>“Can you?”</i> you challenge her, grinning.");
			output("\n\n<i>“Oh, I don’t know!”</i> she purrs, gently squeezing your [pc.cockHead " + x + "]. <i>“We’ll just have to find out!”</i>");
			output("\n\nDespite her confidence, you almost protest when she doesn’t lube her behind at all - only to find that when another of your apexes is pressing against her tight little asshole that she’s not going to need it. Her pussy is so wet she’s dripping down her underside, but even that doesn’t explain how perfectly receptive her butt is - she’s clearly modded.");
		}
		else
		{
			output("\n\n<i>“I know you can take it,”</i> you say with a grin.");
			output("\n\n<i>“I am at least a little proud of my abilities,”</i> she says, smiling back.");
			output("\n\nYour [pc.cockHead " + y + "] presses against her plush little asshole, as tight as it is receptive, and she shuffles a little to get your other dick aligned with her pussy. Her labia part around your cocktip and a trickle of warmth runs down your shaft as she moans quietly, savoring the contact.}");
		}
	}
	//single cock
	else
	{
		if(pc.cocks[x].cLength() < 6) output("\n\n<i>“I like this, it’s cute,”</i> Iyla coos, holding you in her palm and rubbing your underside with her fingertips. <i>“I can’t wait to make it pop.”</i>");
		else if(pc.cocks[x].cLength() < 10) output("\n\n<i>“The perfect size,”</i> Iyla murmurs, stroking you with care. <i>“Oh, I can hardly wait...”</i>");
		else if(pc.cocks[x].cLength() < 20) output("\n\n<i>“Nice and thick and hard,”</i> Iyla murmurs, stroking your impressive length from tip to base, running her fingers along your cumvein. <i>“You’re going to stretch me out... my favorite feeling.”</i>");
		else output("\n\n<i>“Oh, you are <b>big</b>,”</i> Iyla murmurs, stroking your massive length and rubbing your cumvein. <i>“It might not fit all the way in, but I promise I’ll do my very best for you.”</i>");
		output("\n\nShe mounts you and presses your [pc.cockHead " + x + "] against her pussy, rubbing her wetness against your hardened length and shivering in anticipation.");
		output("\n\n<i>“Come on...”</i> she whispers.");
	}
	output("\n\nStars, she’s <i>warm</i> - you can feel the heat of her already, emanating from inside her as she sits up and wiggles her abundant hips, riding the high of having ");
	if(y >= 0)
	{
		output("two ");
		if(pc.cocks[x].cLength() < 8 || pc.cocks[x].cLength() < 8) {}
		else if(pc.cocks[x].cLength() < 13 && pc.cocks[y].cLength() < 13) output("big, hard ");
		else if(pc.cocks[x].cLength() < 17 && pc.cocks[y].cLength() < 17) output("massive ");
		else output("enormous thick ");
		output("cocks pushing against her twitching orifices");
	}
	else
	{
		output("your ");
		if(pc.cocks[x].cLength() < 6) output("hard");
		else if(pc.cocks[x].cLength() < 10) output("thick, hard");
		else if(pc.cocks[x].cLength() < 20) output("giant");
		else output("enormous");
		output(" cock pushing against her twitching vagina");
	}
	output(". Taking a deep breath, Iyla steels herself and slowly - <i>very</i> slowly - sits down, letting out a needy moan as you stretch her apart. You’re treated to the sight of her lower lips spreading wide around your stiff length, juices dripping along your cumvein");
	if(y >= 0) output(" even as her asshole caves inward in submission to your second dick");
	output(", and it doesn’t take long for her to decide she wants more.");

	output("\n\n<i>“Nnnh- mmmmhhgh!”</i> Iyla groans, hands pressing into your [pc.stomach] as she slips your cock" + (y >= 0 ? "s":"") + " a few inches inside you and immediately curls up, digging her fingertips into your [pc.skinFurScales] as she clenches around your flexing dicks. <i>“Nnnh! God!”</i>");
	output("\n\n<i>“I just came a little,”</i> she admits to you after a few seconds of shuddering, red-faced and breathing a little hard. <i>“Sorry, I’ll- nnhgh- get used to it...”</i>");
	output("\n\nIyla lets out a breathy, fluttering moan when she begins to sink you deeper inside her, your arms crossed behind your head as you watch the big-breasted bitch impale herself and struggle not to cum. She bites her lip, grunting under her breath, her squeezing cunt spurting ever more of her juices");
	if(pc.balls > 0) output(" across your [pc.balls]");
	output(" while she continues her difficult descent. Content to let her figure it out on her own, you lie back and relax, focusing on the feeling of her quivering insides caressing your");
	if(y >= 0)
	{
		if(pc.cocks[x].cLength() < 8 || pc.cocks[x].cLength() < 8) {}
		else if(pc.cocks[x].cLength() < 13 && pc.cocks[y].cLength() < 13) output(" meaty");
		else if(pc.cocks[x].cLength() < 17 && pc.cocks[y].cLength() < 17) output(" colossal");
		else output(" gigantic");
	}
	else
	{
		if(pc.cocks[x].cLength() < 8) {}
		else if(pc.cocks[x].cLength() < 13) output(" meaty");
		else if(pc.cocks[x].cLength() < 17) output(" colossal");
		else output(" gigantic");
	}
	output(" cock" + (y >= 0 ? "s":"") + ".");

	output("\n\nWhen at last she ");
	if(pc.cocks[x].cLength() >= 21) output("bottoms out with you pressed firmly against her womb");
	else output("manages to take you to the hilt");
	output(", Iyla gives a ragged groan and lets it all go. As if stoked into production by her orgasm, breastmilk begins to dribble and spray in thin streams from her areolae as she breaks out into full-bodied shivers, arching her spine and running her hands up your [pc.chest], caressing your ");
	if(pc.biggestTitSize() >= 1) output("tits");
	else output("[pc.skinFurScales]");
	output(".");
	pc.cockChange();

	output("\n\n<i>“You okay there?”</i> you tease, looking up at her huffing and sweating. <i>“Need a break after all that work?”</i>");
	output("\n\n<i>“N-no, it, it’s okay,”</i> she insists, weakly gripping your [pc.hips]. <i>“I’ve... got a handle on you.”</i>");
	processTime(7);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Ok Then",okayThenCowgirlIylaRiding,[x,y],"Ok Then","Sit back, relax, and watch this woman fuck herself senseless on your cock" + (y >= 0 ? "s":"") + ".");
	addButton(1,"Do You Now?",doYouNowIylaCowgal,[x,y],"Do You Now?","Prove to Iyla that having a handle on the situation isn’t always as easy as it seems.");
}

//[Ok then]
//tt:Sit back, relax, and watch this woman fuck herself senseless on your cock{s}.
public function okayThenCowgirlIylaRiding(args:Array):void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	var x:int = args[0];
	var y:int = args[1];
	output("<i>“If you say so,”</i> you murmur, watching her raise her hips.");
	output("\n\n<i>“Ooohhh gooood,”</i> Iyla mutters, her pussylips gripping your dick so tight you can feel every inch of her slippery inner walls stretching on the outstroke. She comes back down with a high-pitched moan, grinding to a halt at the bottom of her arc. <i>“Aaahn!”</i>");
	output("\n\nTo her credit, she <i>does</i> seem to be getting the hang of this - just a little slowly, and with great, squirting orgasms in between her desperate efforts. Rising a few inches off your groin she presses forward and clenches her cheeks while she grinds herself into you, panting with eagerness as fresh milk flows down her shaking breasts. Biting her lower lip, she groans deep in her throat as she begins to keep something resembling a steady rhythm going with her riding, bucking back and forth as you grunt in pleasure.");
	output("\n\n<i>“Oh, <b>yeah</b>,”</i> she pants enthusiastically, throwing her hips back hard enough to make her ass slap against your thighs. <i>“Oh, god!”</i>");
	output("\n\nYou curse under your breath and grit your teeth as Iyla takes herself to town on your ");
	if(y >= 0) output("twin lengths");
	else output("pulsing length");
	output(", building her strength up until she’s pounding your " + (y >= 0 ? "hardened cocks into her hot, clenching holes":"stiffened cock into her hot, clenching slit") + ", gasping for breath while sweat runs down her face. Her spasming quim’s tightness around your dick is unbelievable" + (y >= 0 ? " and the way her slick asshole grips you no less so":", barely leaving any room for her arousal to drip") + ", her voluptuous bosom bouncing up and down with every rough downward thrust a sight for sore eyes. What gets you the most, though, is Iyla’s expression.");
	output("\n\nShe looks so happy to be getting dicked as hard as she can, her lips stretching out in a continual O of pleasure, the gap between her massive orgasms diminishing until she’s cumming so hard she never seems to stop. Iyla arches her back and you can <i>feel</i> the shiver of ecstasy travel down her body until it makes her wet little holes clamp down on you, her thighs pulling inward and squeezing your waist while she continues bouncing without a care in the world.");
	output("\n\n<i>“Ah! Aah! Yes!”</i> Iyla moans happily, sweeping her head to the side to get the hair out of her face so she can gaze at your face. <i>“Oh, god! Ah!”</i>");
	output("\n\n<i>“Fuck,”</i> you grunt, balling your hands into fists and flexing your forearms as the pleasure rushes through your body. <i>“Nngh!”</i>");
	output("\n\n<i>“Ooohhh yesss,”</i> she groans, gyrating her hips in your lap. <i>“<b>Please</b> cum inside me! Mm!”</i>");
	output("\n\nNot like you can resist the prospect at this point - grabbing her hips hard enough to make Iyla squeal in delight, you drag and press her into your groin as your orgasm hits, groaning in bliss.");
	
	output("\n\n[pc.Cum] pumps into her pussy" + (y >= 0 ? " and ass, each of her stuffed-full holes squeezing and milking you for your twin payloads":", her stuffed-full hole squeezing and milking you for your payload") + ", the excess dripping back out of her and running down her shaking thighs. Collapsing onto your chest with a dizzy moan, Iyla runs her hands up to your shoulders and snuggles into you while the last few remnants of your jizz splatter her womb" + (y >= 0 ? " and bowels":"") + ".");
	if(flags["IYLA_COWGALED"] == 1) 
	{
		output("\n\n<i>“That... was the best sex of my life,”</i> she admits, sighing contentedly and stretching her legs out, toes pointed.");
		output("\n\n<i>“Looked like you were having fun,”</i> you say, smiling down at her.");
	}
	else 
	{
		output("\n\n<i>“Nnnh... I’ve never cum so many times and so hard. I’m going to be sore tomorrow... was it good for you too?”</i>");
		output("\n\n<i>“It was great,”</i> you say, smiling down at her. <i>“You looked like you were having so much fun I didn’t wanna interfere.”</i>");
	}
	output("\n\n<i>“Hehe, I was,”</i> Iyla says, grinning impishly. <i>“Now... nnnh... let’s see about getting you cleaned up.”</i>");
	output("\n\nShe slowly drags herself off your spent cock" + (y >= 0 ? "s":"") + ", groaning and wincing as " + (y >= 0 ? "they slip":"it slips") + " free, leaving her cum-slick cunny" + (y >= 0 ? " and asshole":"") + " dripping with spunk as she pulls herself into a standing position with some effort.");
	output("\n\n<i>“Haah,”</i> she sighs, swinging her head to get her hair back behind her back and stretching out, showing off her flawless, sweaty body. <i>“Would you like to shower together?”</i>");
	output("\n\n<i>“Sure,”</i> you agree, getting to your [pc.footOrFeet].");

	if(flags["IYLA_COWGALED"] == 1)
	{
		output("\n\n<i>“Great. Oh, I should have told you about this when we first arrived,”</i> she says, clicking her tongue. <i>“The shower’s just through here.”</i>");
		output("\n\nShe indicates a blank-looking part of the wall and, sure enough, when you press your hand to the section it silently withdraws into side partitions and before you is an expansive bathroom. The shower itself is huge, and there’s even a fancy bath to the side.");
	}
	output("\n\n<i>“Hmm,”</i> Iyla says, eyeing your body with an appreciative smile. <i>“I’ll wash you off myself, if you’d like.”</i>");
	output("\n\nSounds great, actually.");
	processTime(30);
	var Iyla:Creature = new ZaikaMilkThief();
	Iyla.loadInCunt(pc,0);
	if(y >= 0) Iyla.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",iylaCowgirlOutros);
}

//[DoYouNow?]
//tt:Prove to Iyla that having a handle on the situation isn’t always as easy as it seems.
public function doYouNowIylaCowgal(args:Array):void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	var x:int = args[0];
	var y:int = args[1];

	output("<i>“Oh?”</i> you say, thrusting from below hard enough to make her gasp and double over, clutching you as her jiggling butt smacks against your [pc.thighs]. <i>“Hmm. You don’t look very in control to me.”</i>");
	output("\n\n<i>“I-I,”</i> Iyla struggles, fingers falling away from your waist. You start to roll your hips, grinding up into her groin, and she gives up at once. <i>“Oh! Oh, <b>god</b>-”</i>");
	output("\n\nYou give her a grit-teeth orgasm as you lower your hips once more, her body following you down to the buoyant bed as violent shudders running down her back make her thighs quake. Panting, she tries to gather herself but you’ve already taken ahold of her waist and started gently thrusting, her knees instinctively coming together but to no avail.");
	output("\n\n<i>“What’s the matter?”</i> you tease, smiling up at her. <i>“I thought you had a handle on me.”</i>");
	output("\n\n<i>“Ah! I- ah! Mmmh!”</i> she groans, balling her hands into fists. <i>“It’s- nh! It’s too much,”</i> she gasps at last, her head slumping." + (y >= 0 ? " <i>“I j-just can’t deal with both of your cocks!”</i>":" <i>“I j-just can’t deal with your cock!”</i>"));

	output("\n\n<i>“Hmm. Well, keep trying,”</i> you grunt as you slide up into her quivering snatch, stretching her apart around your rigid length. <i>“Let me know how it turns out.”</i>");
	output("\n\nThere’s still a bit of fight left in her - despite her moaning, Iyla braces herself and clamps down on you so hard you have to gasp, her inner walls wrapping around your [pc.cockHead " + x + "] and squeezing like her life depends on it. The effort seems to take a lot more out of her than it does out of you if the way she groans and shudders is any indication, but that’s okay. She feels fucking incredible.");
	output("\n\n<i>“You- tyrant,”</i> Iyla half-laughs, half-pants, throwing her hair back with a sweep of her head that sends droplets of sweat flying. <i>“Picking on a lowly b-bar- oh! Barkeep!”</i>");

	if(pc.isNice()) output("\n\n<i>“I can’t help it,”</i> you say, smiling up at her while you pump her pussy. <i>“You just made me want to tease you a little.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“You just sounded so bullyable,”</i> you say, grinning up at her while you pump her pussy. <i>“Can’t blame me for it.”</i>");
	else output("\n\n<i>“You had it coming,”</i> you say, grinning up at her while you pump her pussy. <i>“Don’t worry, I’ll make it up to you.”</i>");

	output("\n\n<i>“Uh! Nhgh!”</i> she grunts, biting her lower lip while she rides your rolling hips. <i>“<b>Oh</b> god, that’s just right-”</i>");

	output("\n\nA couple of seconds of tortured silence is all Iyla gives you as she strains before she squirts all over your groin, splattering your " + (pc.balls > 0 ? "[pc.balls]":"groin") + " with sticky girlcum while you’re hilted. Stars, the way she’s <i>clenching</i> - the feeling is every bit as erotic as the sight of her pretty face twisted in orgasmic delight, teeth set against each other and lips drawn back in a grimace of ecstasy. You hold her there and she begins to buck, jerking her hips forward in misguided instinctiveness that leaves her gasping for breath.");
	output("\n\nIt doesn’t seem like she can stop cumming, and the longer it goes on the more it feels like Iyla’s entire body is wrapped around your [pc.cockType " + x + "] cock, stroking and slathering it in wet, sloppy kisses from every direction, rubbing your glans up and down. At some point you don’t <i>want</i> to hold out on her any more, and with a grunt you draw back and slam yourself back home" + (pc.cocks[x].cLength() >= 21 ? " right up against her womb":"") + " before you cum, giving her spasming cunt exactly what it needs.");
	output("\n\n<i>“Ooohhhhh!”</i> Iyla groans, pulling her thighs inward and forcing herself down onto your throbbing shaft as [pc.cum] spurts up into her womb. <i>“Oh, god, " + (pc.cumQ() < 2000 ? "it’s so warm...":"there’s so much!") + "”</i>");

	output("\n\nShe grips your [pc.hips] and arches her back, leaning backwards and leaving her enormous titties right in your face, moaning as you sink your fingers into her skin and squeeze hard enough to make her start trickling milk. Her vaginal walls caress and milk you for the remainder of your seed, encouraging you to let it all out into her heated depths, exhorting you to unload your burden. By the time you’re done " + (pc.cumQ() < 2000 ? "Iyla has spunk dripping from her slick, quivering slit, running down her soft inner thighs to spatter against the floor":"Iyla has spunk squirting from her slick, quivering slit, and her tummy has swollen outwards such is the enormity of the thick load she’s carrying in her depths") + ".");
	output("\n\n<i>“Oh, fuck,”</i> she mutters, idly rubbing her stomach. <i>“You really gave it to me...”</i>");
	output("\n\n<i>“You asked for it,”</i> you say, smiling up at her.");
	output("\n\n<i>“I suppose I did,”</i> Iyla replies, grinning. <i>“And I don’t regret it even a little. Want to take a shower?{havent heard about shower: It’s just through there.”</i>");
	output("\n\nShe indicates a blank-looking part of the wall and, sure enough, when you extricate yourself from Iyla’s embrace and press your hand to the section it silently withdraws into side partitions and before you is an expansive bathroom. The shower itself is huge, and there’s even a fancy bath to the side./else: I’ll wash you up myself if you do the same.”</i>}");
	output("\n\n<i>“Sounds like a plan,”</i> you say, escorting her inside.");
	//both options lead to...
	processTime(30);
	var Iyla:Creature = new ZaikaMilkThief();
	Iyla.loadInCunt(pc,0);
	if(y >= 0) Iyla.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",iylaCowgirlOutros);
}

public function iylaCowgirlOutros():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("Iyla gets you soaped up and hums a soft tune as she rubs the warm gel into you, taking special care to work it into your [pc.skinScalesFur].");

	output("\n\n");
	if(pc.hasFur()) 
	{
		output("<i>“Wow, your fur is so nice,”</i> she murmurs, running her hands through it and leaving furrows of soap trailing down. <i>“I could be in here all night just rubbing up against you if I’m not careful.”</i>");
		output("\n\n<i>“Mmmm... I wouldn’t mind too much,”</i> you sigh happily, luxuriating in the sensation of being stroked.");
	}
	else if(pc.hasScales())
	{
		output("<i>“I like your scales,”</i> she murmurs, running her hands over your body. <i>“They feel nice to stroke.”</i>");
		output("\n\n<i>“Feels nice to have you stroking them,”</i> you say, lifting an arm so she can continue. <i>“Mmh.”</i>");
	}
	else
	{
		output("<i>“You have such nice skin,”</i> she murmurs, gently stroking your [pc.thigh]. <i>“You must have amazing genetics.”</i>");
		output("\n\n<i>“Haha, something like that,”</i> you reply, lifting an arm so she can continue.");
	}
	output("\n\nHalfway through washing you pull her in against you and flip her around, running your hands up her front until you reach the soft, silky skin of her mountainous breasts and gently massage her with soap suds.");
	output("\n\n<i>“Aaaahh,”</i> she moans quietly, leaning back into you and relaxing. <i>“That’s nice, thank you...”</i>");
	output("\n\nThough they’re really more than handfuls, it’s plenty of fun to take ahold of them and give her a soft squeeze, sending trickles of milk running down her tummy and into the drain below. You clean her off thoroughly, watching her twinge, bite her lip and curl her toes whenever you brush against her nipples or her clit, and by the time you exit the shower her face is a little more flushed than it should be.");
	output("\n\n<i>“Sooo,”</i> Iyla says as you take your seats on the wall-girl’s breasts once more, inducing a series of breathy gasps from behind you, <i>“did you want to talk... or maybe continue..?”</i>");
	processTime(25);
	clearMenu();
	addButton(0,"Next",VIPIylaCall);
}

//[69]
//tt:Turn Iyla around and suck her clit while she{herm: pleases you/multicock: pleases your dicks/single cock: blows you/multicunt: tongues your cunts/single cunt: tonguefucks your slit}.
public function Ilya69VIP():void
{
	clearOutput();
	showIyla(true);
	var x:int = pc.biggestCockIndex();
	author("Wsan");
	output("<i>“Let’s get turned around,”</i> you say, squeezing Iyla’s curvy breast. <i>“I want to get my face between those sexy thighs.”</i>");
	output("\n\n<i>“Ooh,”</i> Iyla purrs. <i>“That’s the hottest thing anyone’s said to me in a while. Alright, let me lie down for you...”</i>");
	output("\n\nIyla wastes no time at all once she’s laid out on top of you with her face in your crotch.");
	if(pc.isHerm()) 
	{
		output(" With one hand rubbing between the lips of your [pc.pussy] and another gripping your [pc.cock " + x + "], she bends down and laps at your [pc.clit] before slipping a fingertip into your wet cunt to rub your sensitive walls.");
		output("\n\n<i>“Ah,”</i> you murmur, shivering in delight.");
	}
	else if(pc.hasCocks())
	{
		if(pc.cockTotal() >= 3) output(" She grabs two convenient dongs, placing her soft lips over the head of your biggest to run her warm tongue up and down your sensitive slit.");
		else output("She grabs your [pc.cock " + x + "] with both hands and wraps her lips around your [pc.cockSmallest], sucking on its [pc.cockHeadSmallest].");
		output("\n\n<i>“Unh,”</i> you grunt, closing your eyes momentarily.");
	}
	else if(pc.hasCock()) 
	{
		output(" Wrapping a hand around the base of your [pc.cock " + x + "] she plants her soft lips on the head and kisses you, slowly enveloping your [pc.cockHead " + x + "] in her mouth and pulling you into her cheeks.");
		output("\n\n<i>“Unh,”</i> you grunt, closing your eyes momentarily.");
	}
	else if(pc.hasVaginas()) 
	{
		if(pc.totalVaginas() >= 3) output(" She murmurs in delight as she slides two long, dainty fingers right up your [pc.pussies] and laps at your [pc.clits], licking and sucking at each of them in turn.");
		else output(" She murmurs in delight as she slides two long, dainty fingers right up your [pc.pussies] and begins to alternate between sucking and licking both of your [pc.clits].");
		output("\n\n<i>“Guh,”</i> you groan, feeling a shiver run up your spine.");
	}
	else
	{
		output(" She murmurs in delight as she slides two long, dainty fingers right up your [pc.pussy] and begins to lap and suck at your [pc.clit], running her warm tongue over it.");
		output("\n\n<i>“Uuh,”</i> you groan, feeling a shudder run up your spine.");
	}
	output("\n\nPart of you wants to lay back and delight in Iyla’s oral treatment but your hands are already wrapped around her plush butt and her drooling slit is bare before your eyes, tempting you with the sight of it. Her little clit is protruding from its hood and that’s just too delicious to pass up - leaning in, you plant a long, sucking kiss right on it with your [pc.tongue] laid against the soft rosebud. Loud and colorful, the string of moaned curses that spills from Iyla’s lips against your " + (pc.hasCock() ? "bulging cock":"dripping pussy") + " feel a lot like your praises being sung.");

	output("\n\nNow you <i>have</i> to give her more. You lay into her with eager aplomb, enjoying the way her spine arches and her legs tremble while she desperately tries to stay focused on pleasuring you, more juices spilling from her clenching cunny with every passing second. It takes less than a minute for you to bring her to a groaning, squeezing orgasm, and you get a faceful of her spattered arousal for your efforts.");
	output("\n\n<i>“Oh g-guhhhd,”</i> Iyla mumbles under her breath, shaking as she squirts down your chin. <i>“Nnnuuhh!”</i>");
	output("\n\nPerhaps frustrated or invigorated by the fact she hasn’t been able to give it back to you Iyla throws herself into her task with the eagerness of a whore, ");
	if(pc.isHerm()) output("fingering your slippery cunt while she jacks your pulsing cock off into her mouth, licking at the underside of your glans and stroking your cumvein. Grunting, you soon come to empathize with her - it’s <i>hard</i> to return the favor when someone gets a head start like that! You shakily return to pleasing her and you’re rewarded with quiet, sighing moans while she sucks your [pc.cockType " + x + "] cock, but it’s still all too soon before you’re letting loose and cumming explosively into her throat.");
	else if(pc.hasCocks()) output("noisily blowing your pulsing cock while she jacks the other off, licking at the underside of your glans and stroking your cumvein with the tip of her tongue. Grunting, you soon come to empathize with her - it’s <i>hard</i> to return the favor when someone gets a head start like that! You shakily return to pleasing her and you’re rewarded with quiet, sighing moans while she sucks your [pc.cockType " + x + "] dick, but it’s still all too soon before you’re letting loose and cumming explosively into her throat.");
	else if(pc.hasCock()) output("noisily blowing your pulsing cock, licking at the underside of your glans and stroking your cumvein with the tip of her tongue while she hollows her cheeks and sucks. Grunting, you soon come to empathize with her - it’s <i>hard</i> to return the favor when someone gets a head start like that! You shakily return to pleasing her and you’re rewarded with quiet, sighing moans while she slurps at your [pc.cockType " + x + "] dick, but it’s still all too soon before you’re letting loose and cumming explosively into her throat.");
	else if(pc.hasVaginas()) output("fingering your slippery cunts while she works your third pussy with her tongue, licking and sucking at your clit. Grunting, you soon come to empathize with her - it’s <i>hard</i> to return the favor when someone gets a head start like that! You shakily return to pleasing her and you’re rewarded with quiet, sighing moans while she noisily kisses your rosebud, but it’s still all too soon before you’re letting loose and cumming with a banshee’s wail.");
	else output("fingering your slippery cunt while she works your buzzing clit with her tongue, licking and sucking with a greedy hunger. Grunting, you soon come to empathize with her - it’s <i>hard</i> to return the favor when someone gets a head start like that! You shakily return to pleasing her and you’re rewarded with quiet, sighing moans while she noisily kisses your rosebud, but it’s still all too soon before you’re letting loose and cumming with a banshee’s wail.");

	if(pc.hasCock()) output("\n\n<i>“Mmf!”</i> she gurgles, trying to deepthroat your orgasming length as best she can while you paint her tonsils [pc.cumColor]. <i>“Ogh, fhhk!”</i>");
	else output("<i>“Oh, babe,”</i> she murmurs huskily, sticking her tongue out into " + (pc.hasVaginas() ? "one of your spasming cunts":"your spasming cunt") + " while juices drip and spurt. <i>“Mmmm!”</i>");

	output("\n\n");
	if(pc.isHerm()) output("She has her fingers so deep in your clenching pussy you can’t concentrate on anything but the feeling of bracing yourself around them, gasping and arching your back as they rub against your G-spot and make your legs kick out" + (pc.hasToes() ? ", your toes curling":"") + ". Cum drips from Iyla’s lips as she swallows and sucks, running her tongue along the length of your underside while she works you with her fingers, and at last you let out a scream of rapturous ecstasy that ceases only when your lungs are empty.");
	else if(pc.hasCocks()) output("She works you so steadily you can’t concentrate on anything but the feeling of the insides of her cheeks sliding against your throbbing cockhead over and over, her" + (pc.cockTotal() >= 3 ? " hands pounding your erect dicks":" hand pounding your other dick") + " hard enough that ropes of [pc.cum] shoot several feet, your groans going unheard. Cum drips from Iyla’s lips as she swallows and sucks, running her tongue along the length of your underside while you unload in her mouth, and you can’t bite back a roar of complete ecstasy.");
	else if(pc.hasCock()) output("She works you so steadily you can’t concentrate on anything but the feeling of the insides of her cheeks sliding against your throbbing cockhead over and over, her hands planted on your [pc.thighs] while she violently bobs her head up and down. Cum drips from Iyla’s lips as she swallows and sucks, running her tongue along the length of your underside while you unload in her mouth, and you can’t bite back a roar of complete ecstasy.");
	else if(pc.hasVaginas()) output("She has her fingers so deep in your clenching pussies you can’t concentrate on anything but the feeling of bracing yourself around them, gasping and arching your back as they rub against your G-spot and make your legs kick out" + (pc.hasToes() ? ", your toes curling":"") + ". Her tongue invades your quims over and over while she works you with her fingers, and at last you let out a scream of rapturous ecstasy that ceases only when your lungs are empty.");
	else output("She has her fingers so deep in your clenching pussy you can’t concentrate on anything but the feeling of bracing yourself around them, gasping and arching your back as they rub against your G-spot and make your legs kick out" + (pc.hasToes() ? ", your toes curling":"") + ". Her tongue lashes against your clit over and over while she works you with her fingers, and at last you let out a scream of rapturous ecstasy that ceases only when your lungs are empty.");
	output("\n\nTaking a desperate, rasping breath, you shove your face back into Iyla’s steamy cunt and tongue her deep enough to feel her entire body shudder. Stars, that feels good - she’s still lovingly taking care of you in the aftermath, but you haven’t had enough just yet. Iyla starts to groan the longer you keep your oral attention focused on her, occasionally pulling back to kiss and suck at her swollen clit.");

	output("\n\nThe two of you rock and thrust as one, your [pc.hips] moving in time with Iyla’s, her ");
	if(pc.isHerm()) output("lips sealed tight around your turgid cock while she fingerfucks you to another thunderous orgasm, your voice coming out as little more than a muffled yell between the labia of her clenching cunt. You come off the ground with her in your arms, [pc.cum] shooting from her nostrils as you both strain to let it all go");
	else if(pc.hasCocks()) output("lips sealed tight around your turgid cock while she jerks you to another thunderous orgasm, your voice coming out as little more than a muffled yell between the labia of her clenching cunt. You come off the ground with her in your arms, [pc.cum] shooting from her nostrils as you both strain to let it all go");
	else if(pc.hasCock()) output("lips sealed tight around your turgid cock while she sucks you off to another thunderous orgasm, your voice coming out as little more than a muffled yell between the labia of her clenching cunt. You come off the ground with her in your arms, [pc.cum] shooting from her nostrils as you both strain to let it all go");
	else if(pc.hasVaginas()) output("lips pressed to your clits while she fingerfucks you to another thunderous orgasm, your voice coming out as little more than a muffled yell between the labia of her clenching cunt. You come off the ground with her in your arms, [pc.Girlcum] shooting down her chin as you both strain to let it all go");
	else output("lips pressed to your clit while she fingerfucks you to another thunderous orgasm, your voice coming out as little more than a muffled yell between the labia of her clenching cunt. You come off the ground with her in your arms, [pc.Girlcum] shooting down her chin as you both strain to let it all go");
	output(", and when you finally collapse she falls with you. Panting for breath, Iyla lays her cheek against your groin and lets out a long, shaky sigh.");
	output("\n\n<i>“That was amazing,”</i> she says, then she starts as you lean in and plant a smooch on her twitching clit. <i>“Nnnghhsensitive!”</i>");
	output("\n\nShe rubs your " + (pc.hasCock() ? "cockhead":"[pc.clit]") + " and you flinch, and soon the two of you are all but wrestling each other before you end up in a tangle of limbs and decide to call it a match. Getting to your [pc.footOrFeet] and joining Iyla in the shower, you wash off the sweat of exertion while she soaps herself up and rinses down with your help. Returning to your room, you seat yourselves on the couch of breastflesh and lean back into it, sighing in contentment.");
	output("\n\n<i>“So, up for more?”</i> Iyla says, grinning. <i>“Or would you just like to chat?”</i>");
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	pc.girlCumInMouth(new ZaikaMilkThief());
	clearMenu();
	addButton(0,"Next",VIPIylaCall);
}

//[Titfuck]
//requires 1+ donger(s)
//tt:Fuck Iyla’s milky titties.
public function tittyFuckIylasTiddies(x:int):void
{
	clearOutput();
	showIyla(true);
	author("Wsan");

	output("<i>“Wrap those titties around my dick{s},”</i> you tell Iyla, and she responds with a wide smile.");
	output("\n\n<i>“That sounds like fun,”</i> she says innocently. <i>“What should I do then?”</i>");
	output("\n\n<i>“Rub until I pop in your mouth,”</i> you say, laying back and reclining a little as you spread your [pc.thighs].");
	output("\n\n<i>“Ooh,”</i> Iyla purrs, grasping her enormous breasts and sinking her fingers into them, pale skin giving way beneath her lusty hands. <i>“That sounds like fun.”</i>");
	output("\n\nIyla pushes in between your [pc.thighs] and nuzzles up against your [pc.cocks], pressing her squishy tits into your thighs while she idly laps at your [pc.cockHead " + x + "]. The moment she earns a bit of your pre-cum she gets a whole lot more enthusiastic, wrapping her plump lips around the head and sucking <i>hard</i>, pulling herself off with an emphatic pop of her mouth before");
	if(pc.hasCocks()) output(" giving the same treatment to your other dick" + (pc.cockTotal() >= 3 ? "s":"") + ".");
	else output("repeating the process.");

	output("\n\n<i>“Good start,”</i> you grunt, reaching down to rub the energetic cowgirl’s ears.");
	output("\n\n<i>“Mmm,”</i> she moans, tongue lolling against your rigid shaft, brushing up and down your cumvein. <i>“Mh ears- shenshitive...”</i>");

	output("\n\n<i>“Oh, I know,”</i> you say, grinning. <i>“Do your best.”</i>");
	output("\n\nIyla seems to interpret that as a challenge because all of a sudden she’s doing her best to ignore the constant stimulation of her ears being scritched to press her jiggling titties into your groin, pushing them together and creating an immense valley of cleavage.");
	if(pc.cocks[x].cLength() < 10) output(" Your stiffened dick" + (pc.hasCocks() ? "s disappear":" disappears") + " entirely into her gorgeous breasts, swallowed up by her soft, warm flesh as she massages you.");
	else if(pc.cocks[x].cLength() < 14) output(" The tip" + (pc.hasCocks() ? "s":"") + " of your stiffened dick" + (pc.hasCocks() ? "s":"") + " just barely poke" + (!pc.hasCocks() ? "s":"") + " out between her gorgeous breasts, the base swallowed up her soft, warm flesh as she massages you.");
	else output(" The tip" + (pc.hasCocks() ? "s":"") + " of your giant dick" + (pc.hasCocks() ? "s are":" is") + " poking her in the chin while the base" + (pc.hasCocks() ? "s are":" is") + " swallowed up by her warm, soft flesh as she massages you.");
	output("\n\nWhen she begins to arch her back and move her hips to rub you up and down it’s pretty close to instant bliss - Iyla really knows what she’s doing, and the way she’s stimulating your cockhead" + (pc.hasCocks() ? "s":"") + " is something you could really get used to. You should playfully provoke her more often. Leaning back, you relax and groan as the cowgirl dutifully works her massive breasts up and down your [pc.cockType " + x + "] dick.");

	output("\n\n<i>“You’re good at this,”</i> you tell her, stroking her lustrous hair.");
	output("\n\n<i>“Hmmh,”</i> Iyla murmurs, lapping at the head" + (pc.hasCocks() ? "s":"") + " of your cock" + (pc.hasCocks() ? "s":"") + ". <i>“Your pre-cum tastes nice.”</i>");

	output("\n\nYeah, you could already tell she thought that what with the teeth-grittingly pleasurable way she keeps running her soft, warm tongue up and down your glans. It’s only a matter of time until you pop now, the slutty cowgirl displaying every little skill she has hand in hand with her prodigious endowments - if there was ever a woman born to titfuck, it might be Iyla.");
	output("\n\n<i>“Oh, fuck,”</i> you groan, " + pc.mf("setting your jaw","biting your lip") + ". <i>“Iyla!”</i>");

	output("\n\nShe leans into you and kisses your crown, bouncing her jiggling tits up and down your cock");
	if(pc.hasCocks()) output("s while she tries to get " + (pc.cockTotal() == 2 ? "both":"all") + " of them in her open mouth");
	else output(" as she sucks you off");
	output(". You can feel the tingle of incoming orgasm and grab her head, sliding her down your throbbing length" + (pc.hasCocks() ? "s":"") + " just in time for her to catch it in the back of her throat.");

	output("\n\n<i>“FUCK!”</i> you roar, your entire core tensing as [pc.cum] begins");
	if(pc.cumQ() < 2000) output(" spurting down Iyla’s open gullet, trailing down her insides. She takes it as it comes, closing her eyes and gently bobbing her head under your dominant hand as " + (pc.balls > 0 ? "your [pc.balls]":"you") + " pump every last drop into her stomach.");
	else if(pc.cumQ() < 4000) 
	{
		output(" jetting down Iyla’s open gullet, spurting into her stomach. She ");
		if(pc.balls > 0) output("fondles your [pc.balls] all the while");
		else if(pc.hasVagina()) output("rubs your [pc.clit] all throughout, coaxing you to cum harder");
		else output("stays down there with her plush lips pressed to your groin and allows your spunk to flow freely");
		output(", taking in every last drop until she’s drained you dry.");
	}
	else if(pc.cumQ() < 8000) 
	{
		output(" gushing down Iyla’s open gullet, filling her throat with spunk " + (pc.balls > 0 ? "while she lovingly massages your [pc.balls]":"as she does her best to take it all") + ". Even when her stomach begins to swell outwards she doesn’t attempt to lift herself off your length" + (pc.hasCocks() ? "s":"") + ", instead running her tongue across your bulging cumvein and all but coaxing the jizz straight from your shaft" + (pc.hasCocks() ? "s":"") + ".");
		output("\n\nBy the time you finish cumming, her stomach is sagging so low it’s touching her thighs and her thighs are so wet it’s obvious she came more than once. She has to fight from keep her eyes rolling back as she swallows down the very last of you, having drained you completely dry.");
	}
	else 
	{
		output(" gushing down Iyla’s open gullet, filling her throat with spunk " + (pc.balls > 0 ? "while she lovingly massages your [pc.balls]":"as she does her best to take it all") + ". Even when she can’t keep up and your jizz begins to spurt, run, and then pump from her nostrils she doesn’t give up, staying down with her plush lips pressed to your groin and one hand cupping her bulging stomach as it begins to sag.");
		output("\n\nThe voluptuous cowgirl even ");
		if(pc.balls > 0) output("massages your [pc.balls]");
		else if(pc.hasVagina()) output("rubs your [pc.clit]");
		else output("swishes her tongue along your bulging cumvein");
		output(" as your jizz drips from her chin, spattering her heaving tits until you’ve covered them in a sticky sheen. By the time you finish cumming she’s absolutely soaked, her eyes rolling back as the last few ropes shoot down her overtaxed throat.");
	}
	output(" God damn, what a relief...");
	output("\n\n<i>“Good work,”</i> you say, running your hand through Iyla’s hair as she slowly - <i>very</i> slowly - drags herself off the end of your cock" + (pc.hasCocks() ? "s":"") + ", sucking you as hard as she can still manage. <i>“Ngh!”</i>");
	output("\n\nIyla comes free with a wet slurp and closes her mouth, placing her fingers over it and swallowing hard to ensure not a drop spills loose, gasping for air in the wake of her violation.");
	output("\n\n<i>“Oh,”</i> she pants, putting her hands on the seat to steady herself. <i>“God.”</i>");
	output("\n\n<i>“Want to shower?”</i> you offer.");

	if(pc.cumQ() < 2000) output("\n\n<i>“Please,”</i> she says, getting to her feet. <i>“I’ll rub you down.”</i>");
	else output("\n\n<i>“Y-yes,”</i> she huffs, getting unsteadily to her feet with one hand on her stomach. <i>“Oh, wow...”</i>");
	output("\n\nYou help her into the shower and spend some time having fun, washing her up and getting hands-on with her incredible body. By the time you exit, you’re both sparkling clean and ready for another round.");

	processTime(35);
	new ZaikaMilkThief().loadInMouth(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",VIPIylaCall);
}

//[Threesome]
//requires the creamgirl to have been called up
//invalid tt:You’d need to call a cream-girl up for this.
//tt:Get the cream-girl involved for a threesome.
public function creamyDreamyThreesomeGirl():void
{
	clearOutput();
	showBust(creamCowBustString(true),iylaBustString(true));
	showName("IYLA &\nCREAM COW");
	author("Wsan");
	output("<i>“Hey,”</i> you say, calling out to the creamgirl that’s been keenly watching you and Iyla play. Her cock is hard and throbbing already. <i>“Wanna join in?”</i>");
	output("\n\n<i>“I- uh-”</i> she fumbles, eyes going wide as she rapidly glances between the two of you. <i>“I-is... is that okay? Can I?”</i>");
	output("\n\n<i>“You can,”</i> you assure her, waving her over. <i>“C’mere.”</i>");
	output("\n\nShe walks unsteadily over, the motion of her hips setting her engorged cock waving hypnotically from side to side until it’s almost in Iyla’s face. Neither girl looks like they mind.");
	output("\n\n<i>“Um, where do you- I mean, what do you want me- I mean...”</i> the creamgirl stutters.");
	output("\n\nWhere should she put that big, hard cock of hers?");
	processTime(3);
	pc.changeLust(5);
	clearMenu();
	
	addButton(0,"In You",vaginaRouter,[takeCreamLoadInYou,creamGalVolume(),1,0],"In You","Have the creamgirl hilt herself in you.");
	addButton(1,"In Iyla",creamGirlFuckIylaPuss,undefined,"In Iyla","Get her to fuck Iyla’s pussy.");
}

//[In you]
//tt:Have the creamgirl hilt herself in your{pc has pussy: vagina/else: ass}.
public function takeCreamLoadInYou(x:int):void
{
	clearOutput();
	showBust(creamCowBustString(true),iylaBustString(true));
	showName("IYLA &\nCREAM COW");
	author("Wsan");
	output("<i>“I want you in me,”</i> you purr, placing your palm over the cream-girl’s swollen red glans. <i>“Can you handle that?”</i>");
	output("\n\n<i>“U-um! I’m, I’m not very good at fucking!”</i> she squeaks, hands on her face as she watches you grope her oversized cock.");
	output("\n\n<i>“Oh, don’t worry about that part,”</i> you say, smiling. <i>“Just do what comes naturally and we’ll handle the rest.”</i>");
	output("\n\n<i>“I- well, okay,”</i> she murmurs, worries momentarily assuaged.");
	output("\n\n<i>“Iyla, could you warm me up?”</i> you say, giving the cream-girl’s dick a quick, passionate kiss on the crown before lying back.");
	output("\n\n<i>“I sure can,”</i> Iyla says, grinning as she places her hands on your [pc.thighs] and leans in. <i>“You look delicious...”</i>");
	output("\n\nShe runs her soft, wet tongue over your [pc.vagOrAss] and you groan, relaxing into her grip and allowing her to thrust it into you, wetting your insides until your " + (x >= 0 ? "horny slit":"quivering pucker") + " is dripping with her saliva. Mimicking you, she plants a big, wet sloppy kiss right on your " + (x >= 0 ? "pussy":"asshole") + " before withdrawing, grinning down at you.");
	output("\n\n<i>“You’re all ready,”</i> she says.");
	output("\n\n<i>“Mmf, thanks,”</i> you sigh, reaching up to rub her ears. <i>“I bet you could have gotten me off just as hard if you’d stayed down there. Good girl. Now...”</i> you continue, looking up at the creamgirl with a smile. <i>“Come over here and kneel down.”</i>");
	output("\n\nYou catch her attention by raising your [pc.hips] a little and pulling your ");
	if(x >= 0)
	{
		output("pussylips apart, strands of wetness snapping and drooling down your sensitive skin.");
		output("\n\n<i>“See that hole down there?”</i> you whisper to her, watching her iron-stiff cock twitch throb and drool as she gazes rapt at your sex. <i>“That’s my vagina. I want you to take that big, juicy cock of yours and <b>slide</b> it in aaaall the way to the hilt. Slowly,”</i>");
	}
	else
	{
		output("asscheeks apart, stretching your butt out for her to see.");
		output("\n\n<i>“See my asshole?”</i> you whisper to her, watching her iron-stiff cock twitch throb and drool as she gazes rapt. <i>“I want you to take that big, juicy cock of yours and <b>slide</b> it in aaaall the way to the hilt. Slowly,”</i>");
	}
	output(" you caution her, gently squeezing her forearm for comfort. <i>“I want to feel every second of your sexy dick entering me.”</i>");
	output("\n\n<i>“Oh... okay,”</i> she breathes, her nipples standing out on her chest like diamond studs. <i>“I- I’ll do my best...”</i>");
	output("\n\n<i>“Good girl,”</i> you murmur.");
	output("\n\nShe uncertainly places her hands around your waist, laying her gigantic cock against your ");
	if(x >= 0) output("eager cunt");
	else if(pc.balls > 0) output("[pc.balls]");
	else output("own");
	output(" while she adjusts herself and tries not to pant, sweat dripping from her forehead. You put a hand on the back of her neck and lean up, kissing the surprised girl on the head before lying back down and smiling up at her.");
	output("\n\n<i>“Just go at your own pace,”</i> you say, eyeing the head of her swollen penis. It’s already beginning to bubble and drip with her creamy spunk. <i>“Remember - slide it in <b>slowly</b>.”</i>");
	output("\n\n<i>“Right, slowly, okay,”</i> she says breathlessly, doing her best to wrap her fingers around the middle of her shaft and align herself with your " + (x >= 0 ? "slippery entrance":"sensitive ring") + ". The head begins to push into you, and she lets out a low groan of joy. <i>“Oooohhh...”</i>");
	output("\n\n<i>“Just like that,”</i> you whisper, stroking her cheek. <i>“Good girl, you’re doing great.”</i>");
	output("\n\nHer fat, dribbling cockhead teases you apart and gently slides in, drawing out a pleasured moan from the back of your throat. Oh, the way it brushes against your " + (x >= 0 ? "inner walls":"insides") + " is <i>just</i> right - she’s even lubricating her own path, the slow, inexorable pulsing of her rod smearing cream all across " + (x >= 0 ? "the inside of your vagina":"your intestinal walls") + ". A little part of you regrets not being able to taste it but fuck if this isn’t pretty amazing in its own right...");
	if(x >= 0) pc.cuntChange(x,creamGalVolume());
	else pc.buttChange(creamGalVolume());

	output("\n\nThe creamgirl begins to pant harder the further in she gets, gently stretching you out while Iyla watches, wholly bound by the fascination of her worker’s giant cock disappearing into your " + (x >= 0 ? "squelching cunny":"precum-dripping ass") + ". Soft moans escape your lips as your back arches, " + (x >= 0 ? "the head of your lover’s cock rubbing against your g-spot":"sensitive nerve clusters lighting up") + " as she sinks it deeper inside. Your fondness for this girl grows by the second as you admire her restraint - she wants nothing more than to give in to her instincts and violently pound you senseless, but she’s so good at following your orders it’s turning you on a little. You’re sure if you told her not to cum at all she’d try her hardest.");
	output("\n\n<i>“Mmm... that’s enough,”</i> you say, breathing in deep and letting it out in a sigh of satisfaction. She’s several inches inside you and harder than a fucking pole - just clenching around her for long enough would bring you to orgasm.");
	output("\n\n<i>“What?”</i> she gasps, dismayed. <i>“Should I stop?”</i>");
	output("\n\n<i>“No, <b>don’t</b> stop,”</i> you say, grabbing her arms. <i>“You can start fucking me now. Just sw-swing your h-hoohh-”</i>");
	output("\n\nOh, stars, <i>yes!</i> You groan in ecstasy as the creamgirl begins to fuck your " + (x >= 0 ? "pussy":"ass") + " in earnest, shifting her hips back and forth to get herself in deeper while she figures it all out. She’s getting incrementally further inside with every thrust, working the angles to see what feels best for her, and you’re <i>more</i> than happy to go along with her selfish exploration. This is perfect.");
	output("\n\n<i>“I- I’m s-starting!”</i> she moans, squeezing her eyes shut. <i>“G-gonna cum! Gonna cum!”</i>");
	output("\n\nYou let out a little scream as she thrusts her entire length all the way into the{pussy: wet confines of your warm, squeezing cunt, pressing her soft, bulging cockhead right up against your cervix before she lets loose a thick load of creamy spunk ");
	if(x >= 0) output((pc.isPregnant(x) ? "that squirts back out of your stretched-out slit":"right into your waiting womb") + ".");
	else output("lubed-up confines of your warm, squeezing asshole, her soft, bulging cockhead expelling a massive load into your bowels.");
	output(" Each rope is hot enough that the sensation of her coloring your insides white sticks in your head, renewing itself with every forceful ejaculation.");
	output("\n\n<i>“Oohhh god, I can feel it...”</i> you moan, tilting your head back. <i>“Yeeesss...”</i>");
	output("\n\n<i>“Nnnhhhgh! Mmmm!”</i> the cream-girl strains, biting her lower lip as she struggles to hilt herself deeper even with her groin pressed right up against your " + (x >= 0 ? "pussy lips":"[pc.ass]") + ". <i>“Unnngh!”</i>");
	output("\n\n<i>“Look at her go,”</i> Iyla murmurs, putting her head over the groaning creamgirl’s shoulder and resting against her back. <i>“She’s going to fill you like a condom, you know.”</i>");
	output("\n\n<i>“I’m- oh, god- I’m more than ready for thuh! Unh! That,”</i> you pant, gritting your teeth as she grinds into you, ");
	if(x >= 0) output("momentarily stimulating your clit");
	else output("stimulating your " + (pc.hasCock() ? "prostate":"entrance"));
	output(". <i>“Uuhhh!”</i>");
	output("\n\n<i>“Reaaally?”</i> Iyla says, smirking. <i>“Well then.”</i>");
	output("\n\nThe creamgirl’s shuddering breath catches in her throat as her mouth gapes open, her eyes wide open staring down at you and her cheeks flushing scarlet. A second goes by before her grip on you starts getting weaker, her voice finally catching up to herself and her meaty cock throbbing harder than you’ve ever felt it before.");
	output("\n\n<i>“Oohhhh fuuuuck,”</i> she groans, drool running from the corner of her mouth. <i>“Uuunnnhhh...”</i>");
	output("\n\nShe’s cumming <i>buckets</i> all of a sudden, pumping load after load of creamy goodness into your depths, her hips shaking and jerking as she seeks to rid herself of her burden. Hanging her head, it’s clear that this is all she can do in the wake of such immense pleasure.");
	output("\n\n<i>“Y-you! H-have a finger up h-her ah! Ass, don’t you?”</i> you gasp, reaching out to all but hold the sagging creamgirl up. <i>“Mm! Mmmhh!”</i>");
	output("\n\n<i>“<b>Right</b> on her prostate,”</i> Iyla purrs. <i>“And now for the finishing touch.”</i>");
	output("\n\nShe reaches around " + (x >= 0 ? "and begins to rub your excited clit":"to grip your [pc.cockBiggest] and begins to rub") + ", instantly bringing you that much closer to an orgasm of your own, your back arching up to press your");
	if(pc.biggestTitSize() >= 1) output(" breasts into the creamgirl’s. Truth be told, she hardly notices. She’s too busy mindlessly drooling and shaking her hips as she dumps enormous loads between your " + (x >= 0 ? "tightening walls":"clenching cheeks") + " to pay any heed to what you’re doing, spunk gushing up into your ");
	if(x >= 0) output("cervix and " + (pc.isPregnant(x) ? "filling the recesses of your folds":"swelling your womb"));
	else output("guts to fill you out");
	output(".");

	output("\n\nIyla’s ");
	if(x >= 0) output("fingertips on your buzzing clitty are seriously distracting - you’re biting your lip already, and the way she’s swirling them into your stuffed-full pussy is enough to make you buck your [pc.hips] into the creamgirl.");
	else output("hand around your hardening dick is seriously distracting - you’re biting your lip already, and the way she’s jerking you off is enough to make you want to buck your [pc.hips].");
	output(" Stars, it feels like you’ve only just coaxed her into fucking you and she’s already about to make you cum! Each time her giant cock throbs your " + (x >= 0 ? "snatch":"butt") + " clamps down on its rigid length, squeezing the cum straight out of her, and the more Iyla fingerfucks her asshole the harder she throbs.");
	output("\n\n<i>“I-I’m gonna cum,”</i> you grunt, gritting your teeth as the familiar sensation begins to gather in your abdomen. <i>“Ooohh, fuuuck, I’m cumming!”</i>");

	output("\n\nYou and the creamgirl moan in unison, singing a lusty duet while " + (x >= 0 ? "your spasming cunt":"your stretched-out asshole") + " drinks in her creamy jism. Iyla doesn’t stop there, though she’s a lot gentler with you than she is her employee - her");
	if(x >= 0) output(" fingers come to rest atop your erect clit and stroke you with the softness of a feather");
	else output(" fingers softly squeeze and caress your pulsing length");
	output(", but the way she’s working her arm out of sight you can tell how hard she’s giving it to the creamgirl. Fine by you; she’s cumming so hard you don’t think she’s about to stop.");
	output("\n\n<i>“O-oh, god,”</i> you moan, putting a hand to your stomach, feeling the outline of the creamgirl’s penis through your skin. <i>“I’m so <b>full</b>...”</i>");
	output("\n\n<i>“She’s like a little pump, isn’t she?”</i> Iyla purrs, putting her hand over yours and touching the creamgirl’s throbbing cock beneath. <i>“Well, maybe not so little. Okay, you’ve had your fun. Come on.”</i>");
	output("\n\nShe tugs the girl back but keeps her fingers inside, roughly working her asshole as streams of cream bubble forth and run down her underside as she’s slowly dislodged from your " + (x >= 0 ? "stretching slit":"gaping ass") + ". Spunk sprays up your swollen stomach before Iyla directs the creamgirl’s cock away, pointing it upwards and rubbing her fingertips into her underling’s prostate as she pants and paints herself white. Only after a good minute or two of forcing the orgasms out of her does the taller cowgirl relent, a satisfied smile on her face.");
	output("\n\n<i>“I think we should take a shower together,”</i> she suggests, rubbing your tummy. <i>“Does that sound good?”</i>");
	output("\n\nIt does.");
	output("\n\nYou wash up together, Iyla’s fingers never far from dipping into your " + (x >= 0 ? "pussy":"asshole") + " as well as sliding up the gasping creamgirl’s butt. Stars, she is good at what she does. After a particularly lengthy shower, you wind up sitting down with her again.");
	processTime(60);
	var tempCow:Creature = new Creature();
	tempCow.createCock();
	tempCow.createPerk("Fixed CumQ",7000);
	pc.loadInCunt(tempCow,x);
	pc.shower();
	clearMenu();
	addButton(0,"Next",VIPIylaCall);
}

//[In Iyla]
//tt:Get her to fuck Iyla’s pussy.
public function creamGirlFuckIylaPuss():void
{
	clearOutput();
	showBust(creamCowBustString(true),iylaBustString(true));
	showName("IYLA &\nCREAM COW");
	author("Wsan");
	output("<i>“I think Iyla might appreciate getting some attention,”</i> you say, smiling as you tap her thigh. <i>“Right?”</i>");
	output("\n\n<i>“If you’re offering, I’m definitely saying yes,”</i> Iyla says with a grin. <i>“C’mon, girl. Don’t you want to fuck your boss, to let loose and vent all those little frustrations?”</i>");
	output("\n\n<i>“I- I- am I g-gonna be punished?”</i> the creamgirl says, gulping nervously as her turgid cock wobbles and throbs, her gaze stuck to Iyla’s exposed pussy as she spreads her thighs. <i>“I don’t w-want to do anything bad...”</i>");
	output("\n\n<i>“Of course not, silly,”</i> Iyla admonishes her. <i>“In fact, I’ll punish you if you <b>don’t</b> fuck me as hard as you can.”</i>");
	output("\n\nPoor girl. You can tell her head is spinning before she even falls to her knees in front of Iyla, transfixed by the dripping slit between her legs.");
	output("\n\n<i>“Okay...”</i> she murmurs, placing her hands on the larger cowgirl’s thighs and displaying some uncharacteristic forwardness. <i>“I’ll do it.”</i>");
	output("\n\nIyla gasps in pleasure and, you think, some surprise when the creamgirl leans in and runs her tongue up the length of Iyla’s vagina, lapping at the juices between her lips before concentrating her effort on sucking the clit just barely hidden under its soft, wet hood. The longer the creamgirl spends down there, kissing and licking Iyla until she’s panting and squeezing her thighs together on either side of her lover’s head, the more obvious it becomes: what she’s been repressing is <i>not</i> frustration.");
	output("\n\nThe creamgirl is so wrapped up in paying such extravagant attention to her gasping, shuddering boss that it’s not until you slip around behind her that she even registers your presence again - but she’s <b>definitely</b> paying attention to you after you grab her tits and squeeze.");
	output("\n\n<i>“Aah,”</i> she moans, lifting her head and glancing back at you with a blush.");
	output("\n\n<i>“Can’t you see she’s ready for you?”</i> you say, smiling. <i>“Just look at her.”</i>");
	output("\n\nThe creamgirl follows the direction of your gaze. Iyla lies before her, covered in a slight sheen of sweat as her voluptuous breasts slowly rise and fall with her unsteady breath and her quivering legs spread while a strand of wetness drools from her cunt. Seeing the two of you watch her, she lifts a hand to her flushed cheek and smiles slightly, beckoning the creamgirl closer. Even <i>you</i> get a little");
	if(pc.isHerm()) output("harder and wetter");
	else if(pc.hasCock()) output("harder");
	else output("wetter");
	output(" seeing that display.");
	output("\n\n<i>“Come on,”</i> Iyla whispers.");
	output("\n\n<i>“O-oh,”</i> the creamgirl moans as you gently tweak her nipples, each one so hard you could use her to cut glass. <i>“Mmmokay...”</i>");
	output("\n\nYou watch from over her shoulder as the trembling cowgirl aligns herself with Iyla’s pussy, pressing her swollen cockhead into the warm wetness and moaning under her breath when the pleasure of another’s acceptance washes over her.");
	output("\n\n<i>“Push it in,”</i> Iyla says huskily, lifting her wide hips a little to make it easier. <i>“I want you deep.”</i>");
	output("\n\nThey both groan as the creamgirl endeavors to do just that, shakily wrapping her hands around Iyla’s narrow waist to pull herself in while you give her a little help from behind. Presented with such a situation, who could help themselves? You nudge your [pc.hips] forward and the creamgirl cries out as she sinks several inches of meaty cock deep into Iyla’s tight little cunny, driving herself deep enough to make Iyla arch her back.");
	output("\n\n<i>“O-oh!”</i> Iyla grunts, squeezing her eyes shut. <i>“Keep going!”</i>");
	output("\n\nYou let the creamgirl weakly withdraw herself, but it’s a struggle for both of you. Unused to the desire and unfamiliar with how to move herself, it’s blatantly apparent she doesn’t <i>want</i> to pull out - she probably wants to shove that fat, juicy cockhead of hers right up against Iyla’s fertile womb and fill her with gallons of thick, creamy spunk. You grin. Hard to blame her.");
	output("\n\n<i>“That’s no good,”</i> you murmur in her ear, cupping her breasts and rolling your hips against her, rubbing your " + (pc.hasCock() ? "erect dick":"groin") + " against her back. <i>“You’ll never give Iyla what she needs like this. Here, why don’t I show you...”</i>");
	output("\n\n<i>“Ah! A-ah!”</i> Iyla moans, balling her hands into fists as you start to time your delegated thrusts into her with a steady rhythm. <i>“Oohhh, you’re stretching me out! Deeper!”</i>");
	output("\n\nYou watch Iyla’s labia cave inwards as you push the creamgirl’s hips forward, driving her incredibly thick length into the deepest parts of the shuddering cowgirl’s cunt. Juices squirt from around it, spurting across the floor in a small puddle with every push. Iyla’s labored panting takes on a high-pitched note, her abdominal muscles flexing desperately, and you can only guess how hard her vaginal walls are squeezing down on that massive penis inside her.");
	output("\n\n<i>“U-ugh,”</i> the creamgirl grunts, tightening her grip on Iyla’s waist. <i>“C-cuh-mminnngghh-”</i>");
	output("\n\nAt least her instincts are serving her well now. With a violent shiver and a depraved, slutty moan, she shoves herself forward and sinks her throbbing dick to the hilt inside Iyla’s needy pussy. You give her nipples a gentle, titillating squeeze between your thumbs and forefingers while she groans in bliss, no doubt emptying what must be an incredibly gratifying load through Iyla’s cervix. Now to give Iyla a little taste of the creamgirl’s aptitude for cumming.");
	output("\n\n<i>“Nnnghhh!”</i> the creamgirl cries out in surprise, your finger sliding into her ass and brushing against her buzzing prostate - it seems like the vibe inside her hums that little bit harder when she’s having an orgasm. How convenient. <i>“Oohh-oooohhhh, goood!”</i>");
	output("\n\n<i>“Unnh!”</i> Iyla groans, putting her hands on her lower stomach. <i>“Oh, <b>wow</b>...”</i>");
	output("\n\nYou grin like a wolf as the creamgirl shudders around you, your finger incessantly stroking her oversized prostate while her back arches. Unable to stop herself from cumming under such intense stimulation, she moans and whines as she helplessly unloads gigantic helpings of cream into Iyla’s womb. Now that you think of it, there might be a market for this...");
	processTime(20);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Drink It",drinkTheCreampieCowardYOUWONT,undefined,"Drink It","Put your lips to Iyla’s cunt and drink what the creamgirl’s left inside her.");
	addButton(1,"Don't",dontStealSnatchSpunk,undefined,"Don't","Leave all that spunk where it belongs.");
}

//[Drink it]
//tt:Put your lips to Iyla’s cunt and drink what the creamgirl’s left inside her.
public function drinkTheCreampieCowardYOUWONT():void
{
	clearOutput();
	author("Wsan");
	showBust(creamCowBustString(true),iylaBustString(true));
	showName("IYLA &\nCREAM COW");
	output("Of all the indulgences to make, this one’s pretty high up on the list of debauchery - exactly what the VIP room is for, according to Iyla. You fingerfuck the squirming creamgirl until Iyla’s womb is positively <i>swollen</i> with her thick, sticky seed, the two of them sweaty and gasping for air until at last you drag the creamgirl’s cock out of her. Ropes of spunk fly across Iyla’s stomach and up the creamgirl’s chest as her continual orgasming winds down, and she collapses backwards into a panting heap while you grab Iyla’s hips.");
	output("\n\n<i>“Thanks for holding my gift,”</i> you growl, smiling up at her before you lay into her.");
	output("\n\n<i>“Oh- <b>oh</b>,”</i> Iyla groans, " + (pc.hasHair() ? "gripping your [pc.hair]":"laying a hand on your head") + " as you stick your tongue inside her still-quivering cunny and begin to drink the mixture of her juices and the creamgirl’s sweet-flavored jizz. <i>“Oh, my <b>god!</b> Nnnf!”</i>");
	output("\n\nIt’s fucking delicious. You can’t get enough of this, and locking your arms around Iyla’s shaking thighs ensures she’s going to be stuck there giving it to you. She lets out a high-pitched squeal as your [pc.nose] brushes against her engorged clit, and you’re more than happy to rub it against her while you drink in every squirting drop of her spunk cocktail.");
	output("\n\nIyla arches her back and grunts as she suffers another orgasm, her calves shaking as she stands on her tiptoes. She’d be thrusting her hips into the air like a slut if you weren’t holding her down and greedily sucking on her juicy cunt, swallowing down the expended loads in great throatfuls. You could get used to this.");
	output("\n\n<i>“G-god,”</i> Iyla pants when you finally withdraw from between her shaking legs, staring at the ceiling with her mouth hanging open. <i>“I- I don’t think I can cum any harder...”</i>");
	output("\n\n<i>“Well, she’s still here,”</i> you say, glancing over at the half-conscious creamgirl as she tries to regain her bearings. <i>“We can always find out.”</i>");
	output("\n\n<i>“Yeah...”</i> Iyla groans as she sits up, looking down at her tummy. <i>“At least I’m not all bloated with her cum this time.”</i>");
	output("\n\nYou rouse the creamgirl to wakefulness and sit down, resting for a while with Iyla laid against you. That was fun.");
	processTime(10);
	pc.changeLust(5);
	var tempCow:Creature = new Creature();
	tempCow.createCock();
	tempCow.createPerk("Fixed CumQ",800);
	pc.loadInMouth(tempCow);
	clearMenu();
	addButton(0,"Next",VIPIylaCall);
}

//[Don’t]
//tt:Leave all that spunk where it belongs.
public function dontStealSnatchSpunk():void
{
	clearOutput();
	author("Wsan");
	output("You fingerfuck the creamgirl to one continuous completion, watching her swell Iyla’s womb with seed until her tummy is bulging, and gently drag her out of the cowgirl’s clenching pussy. They’re both utterly covered in sweat and gasping for breath, and the sight of the creamgirl collapsed across Iyla’s tummy with her face in the larger cowgirl’s tits is pretty cute.");
	output("\n\n<i>“Good work,”</i> you murmur in the half-unconscious girl’s ear.");
	output("\n\nIt takes a while for the two of them to return to proper wakefulness, and Iyla reluctantly drags herself to the shower to clean herself out. You decide on a whim to join her and bring the creamgirl, nudging her in between the two of you until her nervous erection is slapping against Iyla’s thighs no matter how she turns. By the time you emerge and reseat yourselves while the creamgirl stands in attendance, she looks every bit as sweaty as usual.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",VIPIylaCall);
}

//[Drink]
//tt:Have Iyla sit in your lap and give you a drink straight from her breasts.
//drink gives +3 all stats (or more) or something for a bunch of hours. Use it to fight street gangers I guess. Also gives you +20 libido because of course the girl who services VIPs should get them horny so they can fuck her.
public function drinkFromIylaTiddies():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“I’d like a drink,”</i> you say.");
	output("\n\n<i>“Ooh,”</i> Iyla purrs, smiling wide. ");
	if(flags["IYLA_DRINKS"] == undefined) output("<i>“I’d be happy to give you one... or two.”</i>");
	else output("<i>“I love it when you tell me that.”</i>");
	output("\n\nShe settles in against you and lifts her big, curvy breasts, propping them up with her hands and giving you a grin.");

	output("\n\n");
	if(flags["IYLA_DRINKS"] == undefined) output("<i>“Just so you know, I’m a little different from the other girls,”</i> she whispers. <i>“My brand’s a little more... upscale.”</i>");
	else output("<i>“Care for a drink, " + pc.mf("monsieur","madam") + "?”</i>");

	output("\n\nShe adjusts herself as you lean in, thrusting her considerable chest forward and letting out a light moan of anticipation as you plant your [pc.lips] around her stiff, jutting nipple. Running your [pc.tongue] across it, you’ve barely applied any suction at all before a delicious, creamy concoction spills across your tastebuds.");
	if(flags["IYLA_DRINKS"] == undefined) output(" Damn, she wasn’t lying - her breastmilk really <i>is</i> good.");
	else output(" Her breastmilk is every bit as good as it was the first time.");

	output("\n\n<i>“Ooohhhh, yes,”</i> Iyla breathes in your ear, shuddering against your{high tone: muscled} body. She might be the barkeep slash manager but it’s easy to tell - she’s getting off on this every bit as much as her girls do. <i>“Oh, k-keep going... please!”</i>");
	output("\n\nYou’re happy to oblige. Iyla’s pumping milk tastes like a very well-done cream liqueur, and the high-pitched moans of encouragement are helping too. She grips your shoulder with one hand and gasps, tensing up in your hands and arching her back.");
	output("\n\n<i>“S-sorry, I’m go- going to cummmm,”</i> she stutters, squeezing her juicy thighs together around your [pc.legOrLegs]. <i>“A-ah! Ahh! Mnnhhh!”</i>");
	output("\n\nBiting her lip and shuddering against you, Iyla looks almost like she’s about to cry from the pleasure as you continue sucking from her breast, working her budding nipple with your tongue and teeth. She tenses her stomach and suddenly your upper legs are soaked in the warmth of her juices, her upper body contorting like a wave as she desperately tries to strike a balance between celebrating the pleasure of her orgasm and keeping her teat in your mouth. Luckily for her, you have just the idea.");

	processTime(10);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Push Her Down",pushThatSlutDown,undefined,"Push Her Down","Push Iyla down and hold her there, drinking from her until you’ve had your fill.");
	addButton(1,"Pull On Top",pullOnTopIylaMIlkDrank,undefined,"Pull On Top","Pull Iyla on top of you and wrap your body around hers, keeping her cumming and pumping.");
}

//[PushHerDown]
//tt:Push Iyla down and hold her there, drinking from her until you’ve had your fill.
public function pushThatSlutDown():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("You swiftly roll Iyla over and place your weight on top of her, holding her down while she lets out a groan of satisfaction and a renewed flow of milk streams into your mouth. Even from below she pumps so strongly that gravity is a non-concern, and after a couple of seconds she has her hands wrapped around the back of your neck to ensure you don’t leave her hanging.");
	output("\n\n<i>“Ohhoh- oohhh, stars!”</i> Iyla moans, her legs stretching into the air and shaking, toes outstretched. <i>“Oh! Oh! Hhhooohhh, cumming! I’m cumming!”</i>");
	output("\n\nIt’s not hard to tell. She can’t possibly hope to get you off her but oh, how her bucking hips are making an effort of it - she’s like a wildcat beneath you. Translucent femspunk squirts from her slit and rolls down her shaking thighs, her body bouncing up and down on the rolling mass of her employee’s giant tits.");
	output("\n\nYou’ve drunk so much of her and yet still want more, the taste of her awash in your tongue and throat as you let her have a moment’s rest, cupping her other breast. Her long, sighing moan of relieved satisfaction is cut short by her little scream of delight when you begin to drink from her fresh teat, gently teasing her nipple with your tongue and receiving a spray of her milk. Are you just imagining things, or does she taste even <i>better</i> when she’s cumming?");
	output("\n\n<i>“Fffh- fuuhck,”</i> she pants, running her hands " + (pc.hasHair() ? "through your [pc.hair]":"over your scalp") + ". <i>“Uh! You b-beast, I can’t- can’t stop <b>fucking</b> cumming! Nnnh!”</i>");
	output("\n\n<i>“I know,”</i> you murmur in between sucks, eliciting a scream of faux outrage as she savagely arches her back and throws her head back, almost doing the splits underneath you as wetness spurts from between her thighs.");
	output("\n\n<i>“Uh! Nhhhgh!”</i> Iyla strains, drool running from between her teeth as she flexes her entire body. <i>“Nmmm- huuhh!”</i>");
	output("\n\nShe’s panting like a dog, covered in sweat and some quiet sadistic part of you wants to keep her that way until she passes out from the pleasure, but you’re getting pretty full. With one last deep, heady suck of her hefty tits you lift yourself away and let her collapse like jelly, limbs splayed and shaking with sticky juices dripping slowly from her winking cunt.");
	output("\n\n<i>“Not bad,”</i> you say casually, scooping her back up against you.");
	output("\n\n<i>“Th- thank you,”</i> she breathes, stroking your [pc.chest]. <i>“Oh... oh, god...”</i>");
	output("\n\nYou content yourself with running your hands through Iyla’s hair while she calms down, shivering and moaning in your arms until she’s gotten ahold of herself once more. After a quick shower during which you idly wonder how many compartments this room really has, she returns and takes a seat looking a little more refreshed, smiling brightly.");

	processTime(10);
	pc.changeLust(5);
	//milk here.
	applyIylasMilk();
	pc.taint(1);
	clearMenu();
	addButton(0,"Next",enterTheVIPRoom);
}

//[PullOnTop]
//tt:Pull Iyla on top of you and wrap your body around hers, keeping her cumming and pumping.
public function pullOnTopIylaMIlkDrank():void
{
	clearOutput();
	showIyla(true);
	author("Wsan");
	output("<i>“Ah!”</i> Iyla cries out in surprise as you pull her to the floor, her breast in your mouth and spilling milk across your [pc.lips] <i>“Ooohhh!”</i>");
	output("\n\nShe struggles to stay upright on all fours, her arms shaking until you reach around her massive, jiggling tits and hold her sides to support her. Amidst the continual orgasming it takes the moaning cowgirl some time to notice, but eventually she comes around to the calming influence your strong grip has on her.");
	output("\n\n<i>“Oh,”</i> she whispers, closing her eyes and gently arching her back as she reaches down and cups your cheek. <i>“Oh, god.”</i>");
	output("\n\nYou’d swear it tastes even sweeter when she’s cumming. Iyla lets out a long, low moan as you lie there with her nipple squirting milk across your [pc.tongue], stimulating her so intensely she can’t help but squirt on the floor behind her. She gradually gets lower and lower, slipping further downwards until she’s almost laid against you and grinding herself up and down your body.");
	output("\n\n<i>“Oohhohhh, fuuuck,”</i> Iyla groans under her breath, biting her lower lip. <i>“Uuuunnffh.”</i>");
	output("\n\nYour senses awash in the bliss of feeling Iyla shudder against you, it takes a long time for you to feel like you should finish up drinking. By the time you let her soft, pink nipple fall from your lips she’s a quivering wreck atop you, her arms wrapped around your head while she pants.Craning your head upwards a little you plant a kiss on her neck, eliciting a happy moan from the tired cowgirl before she wiggles downwards and kisses you back.");
	output("\n\n<i>“You know, a girl could get used to being treated like this,”</i> she murmurs. <i>“Cumming for minutes and just relaxing... mmm.”</i>");
	output("\n\nShe stretches out, pointing her toes out and shaking her legs before letting out an exhausted sigh. <i>“Want to come shower with me?”</i>");
	output("\n\nYou join Iyla in the shower for a while, gently washing her up while she recovers from the exertion, and by the time you return to the room she’s more than a little frisky. Seems like a sign she’s back to normal.");
	output("\n\n<i>“So,”</i> she says, eyeing you up and down. <i>“Anything else you wanted to do with or to me?”</i>");
	processTime(10);
	pc.changeLust(5);
	//milk here.
	applyIylasMilk();
	pc.taint(1);
	clearMenu();
	addButton(0,"Next",enterTheVIPRoom);
}

//[CallCreamGirl]
//tt:Get Iyla to call a cream girl up. They seem fun.
public function callCreamGirl():void
{
	clearOutput();
	generateCreamCow();
	showCreamCow();
	author("Wsan");
	output("<i>“Oh, you will <b>not</b> regret this,”</i> Iyla promises. <i>“Honestly, I love playing with them myself... I know I shouldn’t, but the faces they make...”</i> Iyla bites her lip. <i>“Nnf. Let me go get one for you.”</i>");
	output("\n\nYou open the door to let her out and she returns with a nervous, blushing dickgirl within a couple of minutes, grinning ear-to-ear as she escorts the nubile cream dispenser inside.");
	output("\n\n<i>“Come on, cutie,”</i> Iyla coos, leaning her curvy breasts against the girl’s arm and licking her ear gently. <i>“Say hello.”</i>");
	output("\n\n<i>“Um, hi,”</i> the cream-girl says, flushing furiously. Naked as she can be, there’s no way she can hide her big, throbbing erection. <i>“D-did you want some cream?”</i>");
	output("\n\n<i>“We did,”</i> Iyla purrs, sliding her hand around the girl’s waist and bringing her in for a kiss. You can’t help but notice a droplet of cream immediately beading at the girl’s cockhead, her eyes rolling in her head as Iyla pours on the affection. She pulls away and the creamgirl is practically gasping for air, panting and sweating.");
	output("\n\nStars, you can <i>feel</i> her heating up the room. You’re pretty sure if she doesn’t get to blow a load soon she’s going to wind up fainting out of nervousness.");
	if(flags["VIP_CREAM_COWS_CALLED"] == undefined)
	{
		output("\n\n<i>“Are you always this nervous?”</i> you ask her, smiling.");
		output("\n\n<i>“Oh, they’re all kept on edge with permanent prostate vibes,”</i> Iyla says, a lackadaisical grin on her face. <i>“Combine that with the achingly ever-present oversensitivity and, well... I’ll show you what happens when you turn it up a little.”</i>");
		output("\n\nIyla reaches down and shoves her finger right up the cream-girl’s ass, her eyes going wide while cream begins to spurt and dribble from her cockslit unbidden, her voice coming out in whorish pants and moans as she does her best not to sink to her knees in orgasmic bliss.");
		output("\n\n<i>“The ‘no blowjobs’ rule is because if you stimulate them, they never stop,”</i> Iyla informs you, smiling at the girl creaming herself. <i>“Ever. Of course, there <b>are</b> no rules here, so...”</i>");
		output("\n\nIyla pulls her finger free and her little prey breathes a shuddering sigh of relief, looking imploringly at you as cream dribbles down her rock-hard shaft.");
	}
	IncrementFlag("VIP_CREAM_COWS_CALLED");
	pc.createStatusEffect("CreamCowInVIP");
	clearMenu();
	addButton(0,"Next",enterTheVIPRoom);
}
/*
output("\n\n[OilMassage]");
output("\n\n//tooltip:{first time:Hey, is that massage oil on the counter there?/repeat:You could really do with a massage right now.}");

output("\n\n{first time:"Is that massage oil?”</i> you ask, pointing it out on the counter. <i>“Mind giving me a massage, Iyla?”</i>");

output("\n\n<i>“Of course!”</i> she says, springing to her feet. <i>“I’m actually very good at this, I’m told.”</i>/repeat:"Mind giving me another massage, Iyla?”</i>");

output("\n\n<i>“Sure!”</i> she says, springing to her feet. <i>“I’ll take care of you.”</i>}");

output("\n\nYou strip off your [pc.gear] and lie down across the cushy surface of the wall-girl’s monumental breasts, relaxing into the soft, milk-filled flesh amidst her muted moans. She makes for a very comfortable bed, you have to say...");

output("\n\n<i>“Sorry to keep you waiting!”</i> Iyla sings, stepping over you and kneeling down over your back. <i>“One private massage, coming right up. Sorry if the oil’s a little cold to start.”</i>");

output("\n\n<i>“Mmh,”</i> you sigh as she begins rubbing her oiled up hands into your back. <i>“It’s just right.”</i>");

output("\n\n<i>“That’s good,”</i> she says, spreading her hands wide and squeezing. <i>“Gosh, you must not get much time to relax. Let me work all these knots out.”</i>");

output("\n\nYou pass the time in stately bliss, sighing in satisfaction every time Iyla’s deft, soft hands drain the tension from your body. Stars, she <i>is</i> good at this... you’re about ready to drift to sleep. Your eyelids drift open and you realize with a start you <i>have</i> been napping - the sound of Iyla’s cheerful humming passes in and out of your ears as you slip in and out of consciousness");

output("\n\nYou’re only roused to partial wakefulness when she begins dipping downwards, rubbing your lower back and pressing her thumbs into your [pc.skinFurScales]. You let out a little{pc canine:’awoo’/else: moan} without even intending to and she giggles, leaning over you until you can feel her naked breasts pressed against your upper back.");

output("\n\n<i>“Would you like a little more service with your massage?”</i> Iyla whispers.");

output("\n\n[No thanks] [JerkMeOff] [FingerAss] [EatPussy]");
output("\n\n[No thanks]");
output("\n\n//tooltip:Just the massage is fine.");

output("\n\n<i>“No, I’m okay,”</i> you sigh contentedly, relaxing in her capable hands. <i>“Just keep this up, I think I’m about to turn to putty.”</i>");

output("\n\n<i>“Haha! I did warn you I was good,”</i> Iyla laughs, rubbing deep into your muscles. <i>“You can fall asleep if you want. I might spend a few minutes with our wall-girl friend afterwards.”</i>");

output("\n\n<i>“I think I’ll do exactly that,”</i> you murmur, closing your eyes as warmth suffuses your body. This is bliss...");

output("\n\nYou drift off to sleep with Iyla’s quiet humming accompanying you, her skilled hands lightly dancing across your form. Pleasant dreams pass one by one until you’re gently awoken by the sound of moaning.");

output("\n\n<i>“That’s right, such a good girl,”</i> Iyla whispers from some distance away, and when you glance over she’s knelt over scratching the underside of the wall-girl’s chin. <i>“You love to cum hard from your gigantic titties, don’t you?”</i>");

output("\n\nLots of nodding and moaning. Looks like you just missed the fun. Iyla rises to her feet and sees you’ve awakened, giving you a broad smile as she pads back over to you and takes a seat alongside.");

output("\n\n<i>“Feeling a little more rested?”</i> she asks.");

output("\n\n<i>“I feel great,”</i> you reply, slowly sitting up and stretching your arms out. <i>“Thanks, Iyla.”</i>");

output("\n\n<i>“No problem,”</i> Iyla says, smiling. <i>“I’m here for anything you want.”</i>");

output("\n\n[JerkMeOff]");
output("\n\n//invalid:There’s nothing to jerk!");
output("\n\n//tt:Ask Iyla to reach under you and apply those skilled hands to your cock{s}.");

output("\n\n<i>“If you want to take care of me...”</i> you murmur, raising your [pc.ass] a little to expose your hanging cock{s}.");

output("\n\n<i>“Oh, darling,”</i> Iyla says, reaching forward and grasping your [pc.cockBiggest] with her oiled-up hand. <i>“I can’t wait.”</i>");

output("\n\nShe begins to squeeze you from base all the way to your [pc.cockHeadBiggest], rubbing more oil into her palm as you grow thicker in her caring grip, droplets spattering from your tip to the floor.{pc has balls: She makes an appreciative murmur as she lays her other palm on your [pc.balls],{small: gently groping your petite nuts and running her fingertips over your sack.");

output("\n\n<i>“I don’t know how much you’ve got in these, but I’ll be sure to make you squirt it all out,”</i> she purrs./medium: rolling each teste between her fingers before closing her hand around them.");

output("\n\n<i>“I’m going to make you empty these all over the floor,”</i> she purrs./large: hefting a testicle in her hand before smoothly caressing them.");

output("\n\n<i>“Good god, these are so big... I can’t wait to make you empty them,”</i> Iyla purrs./x-large: momentarily bringing her other hand back to heft just one of them up off the ground and smooch it.");

output("\n\n<i>“My god, these are fucking beautiful,”</i> Iyla purrs. <i>“I can’t wait to make you empty them all over the floor.”</i>/no balls: Rubbing your underside, she makes an appreciative murmur.");

output("\n\n<i>“All internal? You’re just like my creamgirls,”</i> Iyla purrs. <i>“And I can’t tell you how much I love making them empty it all out.”</i>}");

output("\n\nYou grunt as she returns to stroking you off,{equine: gripping your flare and sinking her fingers into its squishy head/else: rubbing her thumb across your cockhead} until precum is oozing over her hand and dribbling down her wrist, mixing in with the oil and smearing across her palm. With your{cocksize small: tiny length fully erect, she shuffles closer and starts jerking you off between her forefinger and thumb/medium: straining dick iron-hard in her hand, she shuffles closer and starts jacking you off/large: massive engorged dick iron-hard in her grip, she shuffles closer and starts jacking you off with both hands} while resting her heavy breasts on your back.");

output("\n\n{small:"You’re a little smaller than I’m used to, but it’s fun watching you shiver and shake,”</i> she teases. <i>“Gonna cum for me?”</i>/medium:"Nice and hard, aren’t you?”</i> she whispers in your ear. <i>“I can feel you shivering.”</i>/large:"Fuck, you are a big [pc.boyGirl],”</i> she pants. <i>“This is going to go off like a rocket, isn’t it?”</i>}");

output("\n\nWhat with the way she’s paying full-bodied attention to your pleasure, it’s hard to shake off the impending orgasm for long. You can feel it rising up from below, your [pc.hips] jerking as Iyla tightens her grip and slides her glistening hands over your cock, moaning quietly in accompaniment to your deepening groans until it becomes too much to bear.");

output("\n\n<i>“Uuugh, god,”</i> you groan, your back curving as you{cumvol <2000: shoot a rope of [pc.cum] across the floor/2000-4000:spray a thick load of [pc.cum] against the floor/4000-8000: ejaculate so hard the ropes of [pc.cum] spatter into the air on impact/8000+: start unloading one massive load after another, [pc.cum] shooting across the floor in giant ropes}. <i>“Fuck!”</i>");

output("\n\n<i>“Good [pc.boyGirl],”</i> Iyla murmurs.");

output("\n\n<i>“Nnngh! Nnnh!”</i> you strain, the woman on your back all but purring as she makes you cum buckets. <i>“F-fuck... ghh!”</i>");

output("\n\nTo her credit, she comes through on running you empty. Your orgasm ends with a{cumvol <2000: puddle on the floor and a rope hanging from your cockhead that she shakes free, running her finger over your slit and squeezing the very last out of you to join the rest/2000-4000: large puddle on the floor and Iyla carefully squeezing the last few spurts out of your sensitive tip, shaking the last rope free and running her finger over your slit/4000-8000: massive puddle of spunk seeping across the floor and Iyla lustily squeezing your pulsing cock to get every last drop out of you, apparently delighting in how much she can make you cum. She shakes the last few drooling ropes free and runs her finger over your slit, letting out a soft moan/8000+: enormous puddle of thick spunk across the floor, slowly seeping into hidden drains while Iyla vigorously pumps your pulsating cock to get the last spurts out of you. You make little grunts as she works you, delighting in your sheer virility, until at last she shakes the last several ropes of dripping spunk free and runs her finger over your slit, moaning like a whore.}");

output("\n\n<i>“That was a lot of fun,”</i> she says, sighing happily. <i>“I hope you enjoyed it as much as I did.”</i>");

output("\n\n<i>“That was pretty good, as massages go,”</i> you admit, rolling back over onto the couch of titflesh. <i>“Might rest it off for a few minutes before I do anything...”</i>");

output("\n\n<i>“Good plan,”</i> Iyla murmurs, eyeing your cum.");


output("\n\n[FingerAss]");
output("\n\n//this scene gives you 3 options if you have a dick and none if you don’t.");
output("\n\n//also if you’re tightness 5+ you get the fisting scene instead, which has a [next]. Gotta be <5 for the variants.");
output("\n\n//tt:Get Iyla’s oiled-up fingers in your ass{have cock: for a loving prostate massage}.");

output("\n\n<i>“I could use some service...”</i> you murmur, raising your [pc.ass].");

output("\n\n<i>“Ooh,”</i> Iyla says, reaching back and planting her hands on your{size 1-2: tight buttcheeks, squeezing them appreciatively/3-4: plump asscheeks, squeezing them tight/5+: wobbling asscheeks, squeezing them before drawing her hand back and giving you a cursory slap that sets you jiggling}. <i>“My favorite...”</i>");

output("\n\nWith the aid of the massage oil her finger slips right in{ass tightness 1-2:, and with a little effort it’s joined by a second/3-4: to be quickly joined by a second and third}. You moan in enjoyment and Iyla gives your ass a comforting squeeze, leaning over your back.");

output("\n\n<i>“Just relax,”</i> she whispers, slowly working herself deeper until she’s got your asshole stretched around the base of her digits. <i>“Breathe deep, darling.”</i>");

output("\n\nYou take a shuddering breath and do your utmost not to tense, allowing Iyla to begin crooking her fingers, rubbing your insides{have cock: and stroking your prostate with such incredible skill you let out a gasp.");

output("\n\n<i>“I’ve spent a lot of time making our creamgirls blow some <b>very</b> big loads,”</i> Iyla murmurs in your ear, sending a shiver down your spine as your cock{s} throb to full hardness, twitching with eagerness. <i>“I’m sure I can get the same from you.”</i>");

output("\n\n<i>“Uhh,”</i> you groan, arching your back as she swirls her fingertips over your sensitive little buzzer, the friction delighting your senses. You can practically feel the excess of spunk building up, a trickle of sticky precum already drooling from the end of your{multicock: swollen cocks/single: [pc.cockHeadBiggest].");

output("\n\n<i>“That’s right,”</i> Iyla continues in a calm tone, rubbing your prostate with small, circular motions that have your{toes: toes curling and} calves flexing, the urge to tense your body growing with every second. Only the smooth, blissful pleasure holds you back and oh, <i>stars</i>, she is good at this. <i>“Good [pc.boyGirl]. You’re going to cum such a big load for me.”</i>");

output("\n\nShe’s right. Biting your lip, you can already feel it all welling up inside you, just waiting to be expelled the moment she applies a little more force - but she isn’t. Running her free hand{hair: through your [pc.hair]/else: over your scalp} she giggles softly and just keeps up that same maddening rhythm, tremors of anticipation running through your body.");

output("\n\n<i>“You’re shuddering,”</i> she notes, leaning in and kissing your neck. <i>“It’s okay. Just think of how amazing this is going to feel when you blow everything you’ve stored up all over the floor.”</i>");

output("\n\nIf you close your eyes and focus entirely on the sensation of having Iyla’s fingers inside you, the entire world fades away. The only thing you can feel is your prostate being stroked and caressed, cajoled into pumping ever more precum from your drooling penis{es} like she has total command over your body. You don’t know how much longer you can last like this!");

output("\n\n<i>“Where do you want to cum?”</i> Iyla whispers.");

output("\n\n[YourFace] [OnMyself] [WallGirlsMouth]");
output("\n\n[YourFace]");
output("\n\n//tt:Spray Iyla with your saved-up spunk.");

output("\n\n<i>“Oh, I like it,”</i> Iyla murmurs approvingly, patting your butt. <i>“Get up on your feet, then.”</i>");

output("\n\nShe keeps her fingers dug all the way into your quivering asshole throughout the entire process, kneeling before you and smiling up from below.");

output("\n\n<i>“Ready?”</i> she asks.");

output("\n\nYou nod.");

output("\n\nShe begins to pump you harder, a grin spreading across her face as you tremble and shake, panting and sweaty while shudders run up your spine and your groin begins to tense.");

output("\n\n<i>“Cuh- cumming,”</i> you gasp, flexing your [pc.thighs]. <i>“Uuunnggh!”</i>");

output("\n\nIyla opens her mouth wide and closes her eyes, roughly fingering your [pc.asshole] as you clench down on her so hard the first rope that comes out shoots over her head entirely, setting her softly giggling until she catches the next one right in the back of her throat. Gulping it down, she sticks her tongue out and gets an entire faceful of [pc.cum], spurting from your throbbing dick{s} in spades. Stars, there’s so much!");

output("\n\n<i>“Ogh. Mmmh,”</i> Iyla moans, spunk dripping from her chin and splattering her tits, her fingers giving you one last gentle brush that sends an enormous rope of seed right across her tongue and into her cheeks. <i>“Mmm...”</i>");

output("\n\nShe slowly withdraws her fingers, using her free hand to wipe herself off a little and dip your spunk between her lips, sucking it down with aplomb. Rising to her feet, she runs a hand along your half-hard cock and smiles in your face.");

output("\n\n<i>“I think we should take a shower,”</i> she suggests.");

output("\n\nYou’re inclined to agree.");

output("\n\nYou walk into the shower with Iyla in tow and wash off, rinsing her hair and getting her face cleaned up. When you reemerge into the VIP room you feel ten pounds lighter, like a great burden’s been lifted from your shoulders. Whew.");

output("\n\n<i>“So,”</i> Iyla says, smiling as she reseats herself. <i>“Care for more?”</i>");

output("\n\n[OnMyself]");
output("\n\n//tt:Have Iyla make you blow a massive load all up your chest.");

output("\n\n<i>“Dirty [pc.boyGirl],”</i> Iyla says, grinning. <i>“Turn over, then. Spread those thighs.”</i>");

output("\n\nYour stiffened cock{s} only grow{s} all the harder as you take up the position for Iyla and she begins to roughly pump your [pc.asshole], forcing you to clench in time with her thrusts, her breath coming fast and hot as she watches you throb. Licking her lips, she leans in and runs her hand up your chest - then pulls back as you begin to arch your back.");

output("\n\n<i>“Go on,”</i> she says, giggling. <i>“Show me just how dirty you can get, pet.”</i>");

output("\n\nWith a loud, wordless groan you tense up and shoot a thick rope of [pc.cum] up your stomach to land on your [pc.chest],{breasts: pasting your heaving tits in spunk/else: soaking your [pc.skinFurScales] in jizz}. Iyla doesn’t let you down for even a moment, her fingers stoking your instincts even as you pump out cum so forcefully it feels like you’re a hose. Streaks of sticky, precum-mixed seed splatter all up your [pc.stomach], covering your front in a basting of semen{high tone: that pools between your abs}.");

output("\n\n<i>“Oh, what a sight,”</i> Iyla murmurs, leaning closer. <i>“Let me indulge just a little...”</i>");

output("\n\nShe dips her tongue into the crevices where your spunk’s collecting, licking it up and swallowing it down until half the fluids across your tummy must be her saliva. Pulling back, she licks her lips and smiles down at you.");

output("\n\n<i>“I think we should shower up for the rest,”</i> she suggests.");

output("\n\nThat sounds like a good idea, actually.");

output("\n\nYou walk into the shower with Iyla in tow and wash off, getting yourself all soaped up and clean with Iyla’s help. When you reemerge into the VIP room you feel ten pounds lighter, like a great burden’s been lifted from your shoulders. Whew.");

output("\n\n<i>“So,”</i> Iyla says, smiling as she reseats herself. <i>“Care for more?”</i>");

output("\n\n[WallGirlsMouth]");
output("\n\n//tt:Have Iyla guide you to the wall-girl and blow your entire load down her throat.");

output("\n\n<i>“Oh?”</i> Iyla asks, her ears perking up with interest. <i>“That’s a good idea. Okay, up. Let’s get walking.”</i>");

output("\n\nShe keeps her fingers firmly dug deep into your [pc.asshole] as you shakily rise and begin walking in front of her, Iyla’s plump breasts pushing into your back as she breathes on your neck and rubs up against you. The wall-girl sees you coming and murmurs in approval , sticking her tongue out from her gag the moment she spies your hardened cock{s}.");

output("\n\n<i>“Good girl,”</i> Iyla murmurs to her before turning her attentions back to you. <i>“Let me handle this.”</i>");

output("\n\nReaching around, she grips your{multicocks: cocks as best she can and lowers them until the heads are just about/single cock:[pc.cockType] prick and gently lowers it until it the head} resting on the tip of the wall-girl’s tongue. Holding you in place Iyla begins to forcefully pump your clenching asshole with her fingers, grunting with the effort, your orgasm rising rapidly within your groin.");

output("\n\n<i>“U-uh! Cumming!”</i> you groan, shaking in Iyla’s hands.");

output("\n\nAn enormous jet of spunk sprays across the panting wall-girl’s eager tongue, splattering the back of her throat before it’s followed up with an almost continuous stream of forced-out seed. She gulps down your [pc.cum], taking it right in her mouth and letting it pool in her throat before she takes a deep swallow, lips stretched out to ensure not a single drop goes astray. Iyla does her best to keep you on-target, and in the end she manages to have you blow your entire massive load right down the wall-girl’s throat.");

output("\n\n<i>“Good <b>[pc.boyGirl]</b>,”</i> she murmurs, rubbing your back as she removes her fingers from your quivering butt. <i>“You did great.”</i>");

output("\n\nLeaning down, she takes the wall-girl’s chin in her hand and tilts her face up just enough to give her a deep, wet, kiss, thrusting her tongue into the stationary cowgirl’s mouth and wrapping it around hers, sucking gently until she withdraws and stands once more. She turns to you with a smile, hands on your [pc.chest].");

output("\n\n<i>“Want to take a shower?”</i> she asks.");

output("\n\nYou nod.");

output("\n\nYou walk into the shower with Iyla in tow and wash off, getting yourself all soaped up and clean with Iyla’s help. When you reemerge into the VIP room you feel ten pounds lighter, like a great burden’s been lifted from your shoulders. Whew.");

output("\n\n<i>“So,”</i> Iyla says, smiling as she reseats herself. <i>“Care for more?”</i>/else: in such a way you can feel your{have pussy: puss{y/ies}/neuter: stomach} clench.");

output("\n\n<i>“A-ah!”</i> you moan, balling your hands into fists. <i>“Mmh! H-how are you <b>doing</b> that?”</i>");

output("\n\n<i>“Just practice, babe,”</i> she says easily, running her fingers along an invisible line that you’d swear makes your{pussy: vaginal walls/neuter: insides} clamp so tight they rub against each other. <i>“Ooh, good [pc.boyGirl].”</i>");

output("\n\n<i>“Hh-huh!”</i> you pant, feeling her slide a little deeper inside you. Oh, that’s <i>good</i>. <i>“Iyla...”</i>");

output("\n\n<i>“Shhh,”</i> she hushes you, running her free hand{hair: through your [pc.hair]/else: over your scalp}. <i>“Breathe out...”</i> she whispers, sliding her fingers out to the tip, <i>“and breathe in.”</i>");

output("\n\nYou take a gulp of air as she sinks herself back inside you, bowing your head and following her command as best you can. It’s hard when your entire body wants to shake, shudder, and thrust itself back at her, but that’s what makes it rewarding - you can feel your entire core tensing and relaxing in time with the thrusts of her fingers, the pleasure gently building up with every passing second. Stars, it feels like you could cum at any second!");

output("\n\n<i>“Hold that thought,”</i> Iyla murmurs comfortingly. <i>“Don’t worry, I’ll make you cum.”</i>");

output("\n\nShe’s doing such an amazing job so far you decide to trust in her words and relax entirely, letting her skillful fingers touch and roam your depths, pressing and rubbing, stroking you almost as if you were a treasured belonging.{pussy: Strands of arousal hang from your [pc.pussies] and you don’t even notice, the warmth of juices slowly rolling down your [pc.thighs]/neuter: Your muscles quiver and you don’t even notice, every little sensation of your body} going wholly ignored in favor of resting in Iyla’s hands. Soon enough you begin to feel a warm, gentle sensation rising somewhere deep in your stomach, and you let out a breathy little moan in recognition.");

output("\n\nYou’re cumming. Iyla is making you cum, and the strangest part is that you don’t want to do anything except let her. A big smile spreads across your slowly flushing face as she works her fingers into your core, pushing you higher and higher, your{pussy: dripping slit{s} quivering uncontrollably/neuter: asshole gently clenching} while you hold yourself still and relaxed.");

output("\n\n<i>“Oh, you’re perfect,”</i> Iyla whispers. <i>“Good [pc.boyGirl]. Just like that.”</i>");

output("\n\nBreathe out, breathe in... the continual orgasms wash through your body like waves, one after another, sweat breaking out across your forehead. You’re beginning to shiver with the exertion of sustaining this - the unfamiliarity makes it difficult - but Iyla’s murmured encouragement keeps you going, her deft fingers keeping you locked in. Long, drawn-out moans begin to leak from your lips as she makes love to you, the orgasms growing stronger and stronger as they begin to cluster together.");

output("\n\n<i>“Oh. Oh,”</i> you moan out loud, trying not to pant. <i>“I- I think-”</i>");

output("\n\nShe already knows, of course. She’s the one guiding you there, and your voice trails off as you start to climb a peak so unimaginable your vision begins to turn white. Closing your eyes to shut out the distraction, you focus entirely on Iyla’s fingertips - and suddenly your [pc.thighs] pull together, pressing against each other with such violent strength you can hardly believe it. Your brow creases as you grit your teeth and grimace in ecstasy, your lips curling until at last the enormous knot of pleasure in your abdomen unwinds.");

output("\n\n<i>“<b>Oh</b>,”</i> you gasp, arching your back and pushing your chest into the air. <i>“Oh! OH! OH <b>STARS!</b>”</i>");

output("\n\nPure bliss unfolds from your groin and resonates throughout your entire body, suffusing your aching muscles as they flex in sympathetic desire, shooting up your spine and setting your skin tingling. You throw your head back and let out a scream of bliss, Iyla’s free hand gently stroking your neck while you strain and cum over and over, almost humping the ground as she keeps her fingers pressed to your spasming walls.");

output("\n\n<i>“Uh! Uh! Mmmhhh!”</i> you pant, biting your bottom lip until Iyla leans in and kisses you, keeping you from drawing blood as she softly sucks your [pc.tongue]. <i>“Mmmh! Mmmmm!”</i>");

output("\n\nShe keeps you locked in her embrace until at last the mindblowing pleasure begins to gradually subside, leaving you shuddering in its absence as you slowly drift back down to earth like a feather. Withdrawing her finger and rolling you over, Iyla wraps her arms around you and grinds her thigh between your legs while kissing you deeply, embroiled in passion. Scarcely able to keep your eyes from rolling back in your head, it’s all you can do to simply clutch at her and reciprocate as enthusiastically as you can manage.");

output("\n\nAfter some time, Iyla pulls back and smiles. <i>“Feeling better?”</i>");

output("\n\n<i>“I am,”</i> you murmur, stroking the back of her neck and gazing up at her. <i>“Thank you.”</i>");

output("\n\n<i>“Would you like to take a shower together?”</i> Iyla offers.{have hair: <i>“I’ll wash your hair.”</i>/else: <i>“I’ll wash you up.”</i>}");

output("\n\nThat sounds great right now, actually. Iyla helps you into the shower - your legs are still a little shaky after that - and cleans you up, leaving you warm on the inside and the outside. You step back out half an hour later and sit down next to her, leaning back into the wall-girl’s tits with a satisfied sigh. That was nice...");

output("\n\n<i>“So, want to chat? I’m guessing you don’t want a repeat of that <b>just</b> yet,”</i> Iyla says, smiling.}/5+: and Iyla makes a sultry coo, pulling it back out.");

output("\n\n<i>“I think you’d prefer something a little bigger than my fingers, wouldn’t you?”</i> she whispers, leaning over your back. The next second you feel all five of them pressing at your [pc.asshole], stretching you apart as she seeks to sink them deeper inside. <i>“Breathe deep, darling...”</i>");

output("\n\n<i>“<b>Oh</b>,”</i> you groan, arching your back as Iyla very slowly works her fist into your slutty ass, stroking your lower back all the while. <i>“G-god, Iyla...”</i>");

output("\n\n<i>“Shhh, shhh,”</i> Iyla hushes you in a sing-song voice, petting your quivering rump. <i>“Just relax and let me work you.”</i>");

output("\n\n<i>“Uuunnnnh,”</i> you moan, doing your utmost best to acquiesce to her command. Holy shit, she’s so <b>deep</b> - you can feel her fingers curling and uncurling somewhere inside you, like she’s in your fucking <i>stomach</i> - but stars, this feels sooo gooood...");

output("\n\n<i>“That’s right, good [pc.boyGirl],”</i> she murmurs approvingly,{have cock: your [pc.cocks] twitching/else pussy: your [pc.pussies] quivering/else neuter: your asshole quivering} at her words. <i>“Nice and relaxed. Who’s my good [pc.boyGirl]?”</i>");

output("\n\n<i>“M-me,”</i> you manage,{toes: your toes curling/else: your calves flexing} as she forms a fist with her hand and drives it a few inches deeper inside you, setting off sparks in your head. <i>“Oo-ohh fuck, I’m your good [pc.boyGirl]!”</i>");

output("\n\n<i>“Yes you are,”</i> Iyla croons, holding her arm still as you desperately clench around her forearm, shuddering and gasping. <i>“And I’ve got you right where you need to be. Brace yourself with your hands, would you darling?”</i>");

output("\n\nReaching out you do your best to steady yourself by clutching at the wall-girl’s massive tits and groan while Iyla slowly pulls herself back, bringing her balled-up fist all the way to your gaping asshole, stretching it obscenely wide as warm oil drips down your underside. Your mind goes white as she tenses her forearm and spreads her fingers against your inner walls, giggling softly as you let out an ear-splitting groan of bliss,{have cock: your flaccid cock{s} spurting and drooling all over the floor/else have pussy: your puss{y/ies} drooling on the floor like a dripping faucet/else neuter: arousal rising within you}.");

output("\n\n<i>“Here we go,”</i> she says, re-clenching her fist. <i>“Sing for me, pet.”</i>");

output("\n\nYou’re not totally sure what she means until she begins to thrust her arm into you, driving you forward and sinking into your core.");

output("\n\n<i>“Oooohhhhh!”</i> you cry out, unable to control yourself. <i>“Uuunnhhh!”</i>");

output("\n\nIn moments Iyla has you face-down while she fistfucks you hard enough to make your entire body shake, sliding her arm into you so deep you can feel your stomach shifting, an imprint of her hand appearing under your skin. The stimulation is so intense you’re shaking, micro-tensing as{non-neuter: you get closer and closer to cumming, the inexorable feeling building up in the depths of your groin until it’s too much to resist.");

output("\n\n<i>“I-I’m gonna cum,”</i> you moan in a shaky voice, sliding back and forth across the couch of flesh with every movement Iyla makes. <i>“Uh! Gonna cum!”</i>");

output("\n\n<i>“Go ahead,”</i> she breathes, pushing further into you than you thought possible. <i>“Cum for me.”</i>");

output("\n\nTeeth grit, you strain and flex your abdominal muscles as best you can and, finally, after a frustrating few seconds of trying to work it out, you hit the peak Iyla’s been driving you towards.");

output("\n\n<i>“Ohhoohoh <b>god</b>-”</i> you gasp, arching your back like a whore. <i>“Aaaaahhh!”</i>");

output("\n\n<i>“Good [pc.boyGirl], clench down on that arm. Good [pc.boyGirl],”</i> Iyla whispers in your ear, leaning closer, gently biting your earlobe and kissing your neck. <i>“Mmm. Just like that.”</i>");

output("\n\n{herm:You cum like a champion in Iyla’s hands, your cock{s} spraying [pc.cum] across the floor in thick, trickling ropes while your puss{y/ies} clench and spray clear-colored juices between your [pc.thighs]./multicocks:You cum like a champion in Iyla’s hands, your half-hard cocks spraying [pc.cum] across the floor in thick, trickling ropes, each shot forced out of your throbbing pricks like they were bottles being squeezed empty./single cock:You cum like a champion in Iyla’s hands, your half-hard cock spraying [pc.cum] across the floor in thick, trickling ropes, each shot forced out of your throbbing prick like it was a bottle being squeezed empty./multicunts:You cum like a champion in Iyla’s hands, your slickened pussies clenching and spraying clear-colored juices between your [pc.thighs]./single cunt:You cum like a champion in Iyla’s hands, your slickened pussy clenching and spraying clear-colored juices between your [pc.thighs].}Your asshole grips her so tight it’s like her arm is a part of you, and the ability to brace your core around it only makes you orgasm even harder. Crying her name, you let Iyla guide you through one of the most intense releases of your entire life.");

output("\n\n<i>“Mmm, that was a big one,”</i> she sighs happily, rubbing you affectionately from the inside before drawing her hand back. <i>“Let’s keep going until one of us is too tired to go on.”</i>");

output("\n\n<i>“Uh,”</i> you groan, feeling your weakened muscles stretch and flex around her. <i>“Oohhh, Iyla...”</i>/neuter: you approach a pseudo-orgasm, an inexorable feeling building up in the depths of your groin until you’re sure you’re <i>just</i> about to cum.");

output("\n\n<i>“Nhhhgh- hhaahh,”</i> you gasp, sliding back and forth across the couch of flesh with every movement Iyla makes. <i>“Oh! Mmh! Uh!”</i>");

output("\n\n<i>“You can’t actually cum, can you?”</i> she muses. <i>“You poor [pc.boyGirl]... don’t worry. I’ll keep you going until one of us too tired to continue.”</i>");

output("\n\nOh, <b>fuck</b>...");

output("\n\nYou grit your teeth in frustrated pleasure and clench around Iyla’s forearm as she begins to thrust in almost to her elbow, delighting in the noises you make whenever she rubs your sensitized insides. Fuck, at this rate you’re going to be squirming under her for a long while.}}");

output("\n\n[Next]");
output("\n\n//route for having ass tightness 5+");

output("\n\nYou collapse onto your stomach panting and covered in sweat, your asshole absolutely gaping in the wake of Iyla’s careful exit. She gives your quivering flanks a couple of hard spanks and bends down to tenderly kiss your cheek, turning you over onto your front.");

output("\n\n<i>“Wow, I came just <b>listening</b> to you sing like that,”</i> Iyla says, sighing in satisfaction as she idly rubs her clit. <i>“Mmmm... let’s go take a shower and get you all cleaned up. I’ll fist you in there too, if you like.”</i>");

output("\n\nYou accept her help and half-walk, half-limp into the shower with her. Not finding any reason to turn her down once you’re in there, she spends another half an hour fistfucking your ass with her other arm so hard that by the time you emerge from the water, you’re both so out of breath you have to lie down and rest.");

output("\n\n<i>“Oohh, shit...”</i> she moans, wiping her forehead. <i>“That was fun. Let me clean the room up a little and we can continue.”</i>");

output("\n\nFine by you...");











output("\n\n[EatPussy]");
output("\n\n//invalid:You’d need a pussy in the first place.");
output("\n\n/tt:Have Iyla worship your pussy with her tongue.");

output("\n\n<i>“Actually, I could use a little taking care of...”</i> you suggest, raising your [pc.ass] a little and spreading your [pc.thighs] to expose your dripping sex{es}, your lips pulling apart ever so slightly.");

output("\n\n<i>“Oh, you look good enough to eat,”</i> Iyla murmurs, taking a firm grip of your asscheeks. <i>“Let me just get a taste of you...”</i>");

output("\n\nYou’re not going to turn <i>that</i> down. Holding yourself out for her, you bite your lip as Iyla runs her soft, warm tongue up the length of your{low wetness: hot little/med wetness: juicy/high wetness: gushing} slit, sliding it inside just to sample your delights before she takes it out, traveling south just to give your [pc.clit] a loving massage.");

output("\n\n<i>“Oh, stars,”</i> you groan, closing your eyes. <i>“You can keep going like that if you want.”</i>");

output("\n\n<i>“You know, I think I will,”</i> she says, reaching up between your [pc.legs] to caress your groin. <i>“Something about the way you shiver... mmmf.”</i>");

output("\n\nYou let out a little moan as she tongues your clit again, then louder as she keeps going. You’re right on the verge of thrusting back into her when at last she leaves your engorged nub alone, a strand of drool hanging from its hood as she focuses her efforts on your lips. Running her tongue up and down each one she laps up your juices before digging in just a little further, inserting the tip of her tongue into your vaginal canal and caressing the top of your walls.");

output("\n\n<i>“Oh,”</i> you whisper, scrunching your eyes shut and focusing on the sensation while your hands clench into fists. <i>“That’s good...”</i>");

output("\n\n<i>“Mhm, I know,”</i> Iyla murmurs. <i>“Just relax and let me handle it, babe.”</i>");

output("\n\nYour breath escapes your mouth in shallow pants and puffs from your nose while Iyla services you, bringing her fingers into play by titillating your needy clit after her tongue’s left it alone for so long. Stars, it feels like embracing an old, familiar lover - a genuine smile breaks out on your face as you let out a high-pitched moan, Iyla’s fanciful tongue technique and measured rubbing pushing you higher still. You’re almost certain she could have made you cum by now but she’s drawing it out, prolonging the fun, and you’re more than happy to let her.");

output("\n\nWhen the pleasure begins to irresistibly well up in your abdomen, though, she’s quick on the uptake. You’ve hardly started shuddering as the leadup to what promises to be an amazing orgasm when she suddenly slides a{tightness <=3: finger/else: couple of fingers} into your slavering cunny and rapidly strokes your G-spot, sending you into an uncontrollable upward spiral of pleasure. The telltale tremors become a violent quake, and you’re powerless to resist.");

output("\n\n<i>“O-oh! Oh, stars!”</i> you gasp, arching your back so savagely your tummy touches the squishy floor. <i>“U-uunnnhh!”</i>");

output("\n\n{squirter:The muscles in your spasming cunt grip Iyla’s finger{tightness >3:s} so tightly you squirt around them hard enough to spray her in the face, her chin catching the brunt of it before she brings her face in closer and sticks out her tongue. You grunt and moan, your [pc.girlCum] spattering across her lips and tongue to be swallowed or drip from her pretty features. F-fuck, she’s <i>really</i> milking this out of you!/else:Your muscles seize Iyla’s finger{tightness >3:s} so tightly your juices don’t even make it out, your rippling walls sucking on her digits as if encouraging her to thrust them deeper, your core straining with the effort. Grunting and moaning you all but force streams of [pc.girlCum] out to run down your underside,{pc has balls: dripping down your [pc.balls] and almost spattering to the floor - but Iyla is faster. She hungrily laps and sucks at your nuts, following the trail/else: dripping down your [pc.thighs] before Iyla gets there. She licks and laps at your shaking legs, following the cumtrail} upwards to her own hand and ensuring not a single drop escapes.");

output("\n\n{have cock:So turned on by all the fun, your{cocks: throbbing cocks unleash massive loads that spurt across the floor and pump forth from your tips like bubbling brooks, [pc.cum] pooling underneath you as your orgasm continues. Fuck, she’s making you cum like a fountain! Her fingers are still stuck fast in your [pc.pussy] and she hasn’t even touched your dicks, but <i>god</i> if this isn’t one of the best feelings ever...}");

output("\n\n<i>“Ooohhh, fuuuuck...”</i> you moan as the shaking begins to subside, your legs sliding apart and your groin coming back down to rest on the ground, your entire body loose and slumping. <i>“I think you might have massaged the muscles right out of me.”</i>");

output("\n\n<i>“I aim to please,”</i> Iyla purrs, leaning over and kissing you right between the shoulderblades. <i>“Let’s just cuddle until you feel up to showering together.”</i>");

output("\n\nThat sounds pretty good, actually.");

output("\n\nYou lie there with Iyla snuggling on top of you until you finally muster the strength in your shaky legs to stand upright, taking her into the shower with you and trading warm, wet kisses under the stream of water until you feel both cleansed and a little horny all over again. When you exit and dry yourself off, you find yourself wondering if you shouldn’t ask for a repeat.");

output("\n\n<i>“So,”</i> Iyla says, sitting down on the couch of breasts and spreading her thighs just enough to expose her pussy - still wet even now, after the towel. She smiles at you. <i>“Care to chat, or would you like another go around?”</i>");

output("\n\n[Wall-girl]");
output("\n\n//tt:She’s not much of a talker, but she sure loves to communicate...");

output("\n\nThe wall-girl gives you a wink as you look at her. Resting on her own massive breasts, she seems to be a very easy-going woman.{have had sex with her: From prior experience, you know she’s up for just about anything she can be/else: You don’t think she’ll mind whatever you get up to with her}.{");

output("\n\nif iyla present:"She gets off very, very hard upon any kind of oral attention,”</i> Iyla says offhandedly. <i>“Just so you know.”</i>}");

output("\n\n[Make Out] [GetSucked] [GetEatenOut]");
output("\n\n[Make Out]");
output("\n\n//tt:Give the cutie some oral attention.");

output("\n\nThe wall-girl tracks you as you approach, rolling her eyes and moaning in pleasure if you happen to step on her teats. By the time you get to her actual face she’s panting a little, drooling from the gag, so it seems like that served as foreplay for her. Works for you.");

output("\n\nBending down, you grip her cheeks and remove the gag, freeing her up - but before she can possibly talk, you seal her lips and take her breath away with a kiss. Whether she was planning on talking to you or not, the way she groans into your mouth and sticks her tongue out for you to wrap your own around it, you don’t think she minds her current predicament at all. In fact, she seems to be enjoying it... a lot.");

output("\n\n<i>“Mmn- hnnh,”</i> the girl moans, huffing through her nose. You suck on her tongue as a little experiment and sure enough... <i>“Mmmmnnhhh!”</i>");

output("\n\nShe shifts in her little hole, straining hard enough to make her titanic breasts jiggle, her eyes threatening to roll back up into her skull. So entranced is she by your kiss that you back off a little, not wanting to knock her out the moment you get started, cradling her head in your hand. Smooching her lightly on her stuck-out tongue, you give her a smile.");

output("\n\n{First time:"You like being kissed?”</i> you say, and the way she stretches her head up towards you says it all.");

output("\n\n<i>“I loooove it,”</i> she moans, eyes still a little distant. <i>“Kiss me s’more, please...”</i>/repeats:"Having fun?”</i> you ask, scruffing her behind the ears. <i>“Good girl.”</i>");

output("\n\n<i>“I’m a good girl,”</i> she moans, smiling happily. <i>“Kiss your good girl s’more, please?”</i>}");

output("\n\nCan’t say no to that. Leaning in, you kiss her once more - slower this time,");







output("\n\n[GetSucked]");

output("\n\n[GetEatenOut]");




output("\n\n[Cream-girl]");
output("\n\n//Requires having had Iyla call a Cream-girl up. Has to be reset every time you enter the VIP room.");
output("\n\n//tt:Have some fun with the cream-loaded dickgirl.");

output("\n\n<i>“You,”</i> you say, nodding at the cream-girl.");

output("\n\n<i>“Y-yes?”</i> she squeaks, eyes going wide.");

output("\n\n[BlowHer] [IylaBlow] [Reacharound]");
output("\n\n[BlowHer]");
output("\n\n//tt:Make this girl cum, and cum, and cum...");

output("\n\n<i>“Come here,”</i> you say, waving her over as you get to your knees. She’s very short - even with her thick, reddened cock standing all the way upright, it’s not hard to get on her level. <i>“Good girl.”</i>");

output("\n\n<i>“P-<b>please</b> make me cum,”</i> she whispers, trembling as you put your hands on her thighs. <i>“Please...”</i>");

output("\n\nHow lucky for her that’s exactly why she’s here. Leaning forward, you close your eyes and plant your [pc.lips] right on the swollen head of her engorged cock and give her a deep, passionate kiss, drawing out an appreciative groan from the depths of her throat. That’s what you like to hear.");

output("\n\nWrapping your [pc.tongue] around her hardened length, you slowly sink a few inches deeper before hollowing your cheeks and sucking on her like a lollipop, dragging yourself all the way back up to her twitching cockhead and coming free with a loud, lurid pop and a moan of enjoyment. Already she’s scrunching her face up, balling her hands into fists and rocking on her toes - she’s just too cute! Reaching between her legs, you gently stroke her smooth, hairless underside and resume blowing her as hard as you can.");

output("\n\n<i>“O-oh,”</i> she grunts, gritting her teeth. <i>“It- it’s coming- I- uh! I- ah!”</i>");

output("\n\nAt last you feel a dollop of cream gradually emerge from her pulsing dickhead, rolling across your tongue and exciting your tastebuds to sensitivity. Damn, that’s the stuff - and there’s even more to come! Drawing back a little, you tickle the soft underside of her prick with the tip of your eager tongue.");

output("\n\n<i>“Oh! Nnngh!”</i> the cream-girl strains, her knuckles going white. <i>“Rrrgh! Nnnnnhhh!”</i>");

output("\n\n<i>“Oh, bay-hbee,”</i> you moan, holding your mouth open under her fat, throbbing cock and jerking her off into your lips. <i>“Mmmhm.”</i>");

output("\n\n<i>“Nnnhhgh! Hhhuuh!”</i> she pants, losing her breath. <i>“Hrrrgh-”</i>");

output("\n\nIt sounds like she’s cumming her fucking brains out, and as far as you can tell, she <i>is</i>. One glance upwards at her flushed, sweaty face tells you all you need to know - this girl is experiencing complete and utter ecstasy. You’re actually a little jealous.");

output("\n\n[KeepBlowing] [Break]");
output("\n\n[KeepBlowing]");
output("\n\n//tt:No such thing as too much of a good thing.");

output("\n\nWatching this girl lose her fucking mind as you drink the cream from her cock is one of the most erotic things you’ve ever experienced. In fact, as you look up at her straining and groaning, desperately trying not to put her hands on your head, you can’t help but marvel at how incredibly beautiful she is when deep in the throes of orgasm. Her thick, veiny cock throbs against your lips and another thick wad of cream washes down your throat, hastened by your eager swallow.");

output("\n\nThen you recall that little trick Iyla pulled. Why not? Reaching up between her pert little asscheeks, you rub her very tight asshole before stretching it apart and sliding your middle finger right into her vulnerable rear. Iyla was telling the truth - there’s a buzzing vibrator lodged right against this girl’s <i>bulging</i> prostate, and the moment you stroke the latter she gets <i>loud</i>.");

output("\n\n<i>“OoohhHHHH! PLEASE!”</i> she screams, her hips shaking back and forth. <i>“OOOHHH GOD!”</i>");

output("\n\nYou choke suddenly, thick, hot ejaculate splattering against the back of your throat and sticking there as you desperately try to swallow it down. Holy shit, she’s cumming buckets! Gurgling as you sink yourself down her shaft, your eyes go wide as you feel her cumvein flex and throb against your lower lip, shooting load after load of warm cream down your gullet.");

output("\n\n<i>“Look what you did,”</i> Iyla’s voice says softly from behind, chiding you. <i>“She’ll be cumming all night if you keep that finger up there.”</i>");

output("\n\nThat sounds fun. You cut the girl’s screams short with a simple rub of your fingertip against her giant prostate, feeling her hips go weak before she instinctively fights to stay standing every time you do so. Soon enough she’s letting out a high-pitched lilting whine, her asscheeks clenching hard around your finger and succeeding only in making herself cum even harder - she’s like a fucking hose into your stomach, filling you with delicious cream.");

output("\n\nIf Iyla is telling the truth, you could keep this shuddering, orgasming girl going for hours on end...");

output("\n\n[Stomachful] [Break]");
output("\n\n[Stomachful]");
output("\n\n//tt:Push this quivering wreck of a girl past her limits and listen to her scream in bliss.");

output("\n\nYou’re in no mood for restraint. Leaning forward and slipping your ring finger in to join its companion, you earn yourself a despairing wail of carnal bliss from the cumming cream-girl. Her meaty, throbbing cock swells and spurts in the depths of your throat, her thickening loads gushing down your esophagus and splattering into your stomach while your lips press at her naked, hairless groin, the smell of her sweat lingering in your nostrils. Then she gives in and pulls you into her, grabbing at your{pc has horns: [pc.horns] and using them as handholds/else has hair: hair and holding it/else: [pc.ears] and holding them tight} while she empties herself down your gullet, standing all the way up on her tiptoes and flexing her calves.");

output("\n\n<i>“Nnhhgh! Hhhnh-”</i> the diminutive girl moans, her bottom lip quivering as she bites down on it. <i>“S-suh-sorry-! J-just- nnnhgh! Uuuhhhhh!”</i>");

output("\n\nShe is <i>not</i> sorry, the little minx. If you glance upwards you can see the debased ecstasy of continual orgasm written all over her face while her cumvein thrums against your flattened tongue, pinned to the floor of your mouth while warm cream pools in your tummy. She’s getting off on this so hard you can’t help but encourage her, fingering her tight behind while it clenches around your knuckles and stroking her prostate to keep her going.");

output("\n\n<i>“Guh!”</i> she grunts, tightening her grip on you and pulling your face against her sweaty, tensing stomach until your [pc.nose] is squished up against her skin. <i>“Nnnnnngh-”</i>");

output("\n\nWow, she’s not slowing down <b>at all</b>. If anything, you think as she lets loose another massive squirt of sweet-tasting cum that wells up in your cheeks and leaks down your outstretched lips, she’s getting more and more feisty. You’re curious about how{first time: this will turn out - and besides, sucking down this girl’s heavenly spunk is all the reward you need to consider just letting her do what she wants./repeats: she even has the energy.}");

output("\n\n<i>“How do you feel? Enjoying being tapped like a keg?”</i> Iyla suddenly murmurs, coming from behind to embrace the cream-girl. <i>“Are you going to pump our VIP until {he/she}’s too full to walk?”</i>");

output("\n\n<i>“I- hhh- I-”</i> the cream-girl stammers, her grip on you fading a little. <i>“Hhnng- nnn...”</i>");

output("\n\n<i>“There you go,”</i> Iyla whispers, stroking the girl’s chest. <i>“It just feels <b>so</b> good to cum, doesn’t it? To let it all out for your customer?”</i>");

output("\n\n<i>“Y-yeah...”</i> she mumbles, swaying on her feet. <i>“Feels... zzhnk-”</i>");

output("\n\n<i>“There she goes,”</i> Iyla says, grinning down at you as you slip your mouth off the end of the girl’s prodigious cock, watching her slip back into Iyla’s hands. <i>“Be proud. You made a girl cum so hard she passed out. She’s not going to forget <b>that</b> any time soon - probably be thinking of it every time she’s dispensing to a customer, now.”</i>");

output("\n\nIyla calls up a couple of staff to collect the unconscious cream-girl and carry her out, back down to the bar so she can recover before returning to her job.");

output("\n\n<i>“Fun, aren’t they?”</i> she asks with a smile. <i>“We’ve got plenty, too. Just let me know if you want another one up here.”</i>");

output("\n\n[Next]");
output("\n\n//back to VIP menu");

output("\n\n[Break]");
output("\n\n//tt:Give the howling girl a reprieve.");

output("\n\nSlowly, teasingly - you slide your finger out of her clenching little asshole and pat her butt, listening to her giddily sigh in relief in between explosive, orgasmic grunts and fierce ejaculations down your throat. In a few minutes you have her tapered back down to a dribble, and at that point you content yourself by gently tickling the head of her tortured cock and lapping the creamy seed away while she pants and wipes her forehead with the back of her hand, twitching and wincing at your touch.");

output("\n\n<i>“Th-thank you,”</i> she huffs, looking down at you uncertainly. <i>“I- that was amazing...”</i>");

output("\n\n<i>“Mmm,”</i> you murmur, planting your lips on her cockslit and sucking hard. She squeaks and throws her head back in momentary bliss, standing up on her toes as you suck the remainder of her cum straight out of her urethra. <i>“I thought so too.”</i>");

output("\n\n<i>“Hhh-aahhh,”</i> she groans, leaning back and almost falling before Iyla catches her. <i>“U-um...”</i> She trails off, glancing at Iyla. <i>“I-I’ll be here if you need me again...”</i>");

output("\n\n<i>“Great,”</i> you say, grinning wolfishly and watching her cock throb back to full hardness at the prospect. <i>“Don’t worry, I’ll put you through your paces.”</i>");

output("\n\n<i>“Thanks,”</i> she whispers, blushing. <i>“It’s- um- I’m not meant to complain-”</i> she says, glancing nervously at Iyla, but the barkeep only nods at her. <i>“Um- it’s the vibrator, it m-mmmakes me really d-d-delicate! I- I really like it when you make me cum really, really hard!”</i>");

output("\n\nRant over, she hangs her head as her cheeks flush furiously. <i>“S-so, thanks...”</i>");

output("\n\n<i>“Don’t worry, cutie,”</i> you murmur, patting her thigh. <i>“You can just leave that to us.”</i>");

output("\n\n<i>“Mm hmm,”</i> Iyla says, smiling wide.");

output("\n\n[Break]");
output("\n\n//tt:You’re full for now.");

output("\n\n<i>“Hhuuhhh,”</i> the cream-girl groans as you drag yourself off the end of her twitching cock, jumping up onto her tiptoes as you jerk her off to get the last ropes of creamspunk out. <i>“Hnnhh!”</i>");

output("\n\n<i>“Very good,”</i> Iyla says, grinning at her. <i>“What a good little dispenser you are, hm?”</i> She pats the girl on her lower tummy, rubbing the skin there. <i>“Stick around for a while.”</i>");

output("\n\n<i>“Y-yes,”</i> she pants, wiping the sweat off her face with the back of her hand. <i>“I-I’ll be here, if-if you need me.”</i>");

output("\n\n<i>“Did you like her?”</i> Iyla asks you with a smile.");

output("\n\n<i>“She tastes good,”</i> you say, nodding and licking your lips. <i>“I could get used to that.”</i>");

output("\n\n<i>“I see,”</i> she replies, smile widening. <i>“Personally, I can’t get enough. Mostly the teasing... but maybe that’s just me. Don’t hesitate to ask for more.”</i>");

output("\n\n[IylaBlow]");
output("\n\n//tt:Tell Iyla to blow her employee.");

output("\n\n<i>“I want to see <b>you</b> blow her,”</i> you say, eyeing Iyla and pointing your thumb at the surprised creamgirl. <i>“Show me your skills, Iyla.”</i>");

output("\n\n<i>“Oh ho hooo,”</i> Iyla says, grinning like a shark as she turns and regards her employee. <i>“Come over here, cutie.”</i>");

output("\n\n<i>“Y-yes, mistress,”</i> the creamgirl murmurs, blushing as she steps forward, her stiff reddened cock all but right in Iyla’s face.");

output("\n\n<i>“She calls you mistress?”</i> you say, a touch amused as you lean back into your private couch.");

output("\n\n<i>“Just sometimes, when we’re alone,”</i> Iyla says, smiling up at the sweaty girl and leaning forward to gently wrap her fingers around the thick, hard cock presented to her. <i>“Isn’t that right, darling?”</i>");

output("\n\n<i>“Mm,”</i> the creamgirl moans, looking down at the proprietor bashfully. <i>“A-ah... oh, god...”</i>");

output("\n\n<i>“Don’t be nervous,”</i> Iyla murmurs comfortingly. <i>“I’ve got you.”</i>");

output("\n\nClosing her eyes the luscious barkeep leans forward and opens her mouth, wrapping her plump lips around the swollen head of her diminutive partner’s cock and moaning softly as she begins to suck.");

output("\n\n<i>“O-oh,”</i> the creamgirl mutters under her breath, a shiver running up her spine as her toes curl and she exhales through her nose. <i>“Nnff!”</i>");

output("\n\nYou see now. Iyla’s planning to take this nice and slow, clearly savoring the delightful reactions she’s getting from the creamgirl. This is something she’s done before, and she’s obviously very good at it. Her warm, wet mouth slowly moves up and down the turgid shaft, drool running down her chin as she winks at you sidelong and runs her tongue along the underside of her partner’s dickhead.");

output("\n\n<i>“Hmmh!”</i> the girl strains, shuddering. <i>“It- it’s starting..!”</i>");

output("\n\nShe lets out a long, tortured groan as Iyla retreats to the very tip of the girl’s penis and simply laps at the sensitive, twitching glans as a very thick white dollop of creamy cum begins to emerge from her slit.");

output("\n\n<i>“Hnnnngh!”</i> the struggling creamgirl grunts, flexing her entire body to try and cum harder, faster, to expel it all from her flexing rod, but to no avail. <i>“Ugh! Unh!”</i>");

output("\n\nIyla’s deliberately keeping this poor girl hungry for more. She greedily licks up the offered blob of cum and swallows it down with little more than an affirmative purr deep in her throat, running the tip of her forefinger up her partner’s impressively enlarged cumvein as it fights to force out more. The domineering woman curls her tongue upwards and smiles while she continues prodding the bouncing prick with the tip of her tongue, earning bubbling drops of incredibly concentrated spunk for her relaxed efforts.");

output("\n\n<i>“Wow, you play her like an instrument,”</i> you murmur, feeling arousal rising within you just watching Iyla toy with the girl. <i>“I’m impressed.”</i>");

output("\n\n<i>“Oh, she’s got <b>so</b> much more to offer,”</i> Iyla purrs, smiling wide, then licking off a smear of sweet cum from her prey’s dickhead. <i>“Let me show you.”</i>");

output("\n\nShe reaches up, running her palm over the creamgirl’s smooth underside and, in one smooth, dominant motion, slides her middle finger right up the smaller girl’s asshole. The effect is immediate.");

output("\n\n<i>“Oohhh!”</i> the girl cries, a stream of spunk shooting from her cockslit, slopping down the underside of her shaft in thick, sticky dribbles. She can’t seem to stop herself, her bubbly buttcheeks clenching around the invading digit as she spurts sweet-scented jizz from her cock. <i>“Nnuuhh!”</i>");

output("\n\n<i>“You love that, don’t you?”</i> she coos, smiling up at the desperately twitching girl. <i>“You’re like my puppet on a string. Now dance.”</i>");

output("\n\nShe begins to wiggle her finger, rubbing back and forth, and you watch as the creamgirl begins to tremble, her teeth gritting and her eyes crossing until at last, she can stand it no more. With a great, desperate moan, she begins to shoot giant ropes of sugary seed straight up into the air, her engorged cock twitching and jumping as she stands on her very tip-toes and bounces.");

output("\n\n<i>“Oh, yes, you <b>finally</b> get to cum,”</i> Iyla says, continuing the motion of her finger. <i>“Go on darling, let it all out for your mistress...”</i>");

output("\n\n<i>“Huh! Haah!”</i> the girl pants, eyes wide and sweat dripping from her face as she pumps out unimaginably heavy loads from her bulging cock, her hands clenched into white-knuckled fists. <i>“Huuuuhhgh!”</i>");

output("\n\nDamn, she’s not stopping at all. You watch enraptured as Iyla grins in satisfaction, cheeks flushed and one hand rubbing at her dripping snatch as she fingerfucks the shaking creamgirl into orgasm after orgasm, each one seeming to paradoxically take more out of her but leave her cumming even harder. She just can’t help herself.");

output("\n\n<i>“I think I’ll help myself now,”</i> Iyla murmurs, nuzzling her cheek against the messy, spurting cock and opening her mouth. <i>“Hmmm-”</i>");

output("\n\nShe puts her mouth over the end of the creamgirl’s cock and closes her eyes, sliding her finger in and out of the cumming girl’s oversensitive asshole to keep her going. In a moment you hear her gulp, swallowing down the fresh cream straight from the source, and she slides her plush lips down the throbbing shaft until they’re pressed firmly up against the shuddering girl’s groin.");

output("\n\n<i>“Hnghh- mmmnnhh,”</i> the creamgirl groans, at last giving in and grabbing Iyla by the hair, digging her fingers into it and curling it up in bunches as she violently cums down her boss’s throat. <i>“Ooohhhhgooood, yyyesss...”</i>");

output("\n\nIyla’s free hand rubs the girl’s thigh comfortingly, perhaps encouraging her to keep going - it’s not like she shows any sign of stopping, despite her slackening expression and the tongue hanging from her mouth. If anything she doesn’t seem to <i>want</i> to stop, too busy indulging in the pleasures of Iyla deepthroating her spurting cock, and you suppose you can’t blame her. It doesn’t seem like she gets to let loose like this very often.");

output("\n\nYou glance at Iyla’s expression and she seems to smile around the turgid cock spasming between her pursed lips, winking slowly as another massive load jets down her throat with an audible splatter. She lifts her hand and points at you, then points at her mouth. You think she’s asking you if you want a turn swallowing all that cream.");

output("\n\n[Sure] [No thanks]");
output("\n\n[Sure]");
output("\n\n//tooltip:A stomachful of jizz sounds great about now.");

output("\n\nYou{clothed upper: take off your [pc.upperGarments] and} move closer, getting up alongside Iyla so she can slide off the end of the ejaculating cock and pass it over to you. The moment she does cum begins to go everywhere, still jetting from the reddened tip of the creamgirl’s swollen cock as enthusiastically as it was when she started.");

output("\n\n<i>“Ghhaahh,”</i> Iyla pants, gasping for air in the wake of her withdrawal and cradling her swollen stomach. <i>“Oh, god, I’m so full. Good luck, babe.”</i>");

output("\n\nYou stare up at the thick, bulging cock from below, its entire length covered in spit and spunk, and open your eager mouth. A few droplets splash across your [pc.tongue] but that little burst of sweetness is <i>nothing</i> in comparison to putting your [pc.lips] on the end of it, grunting in bliss as you begin to suck its payload straight from her pumping cumvein. Iyla guides your hand up between your moaning partner’s legs and you follow her cue to the letter, sliding your middle finger up into the creamgirl’s receptive asshole and feeling her clench fiercely around you.");

output("\n\n<i>“<b>Oh</b>,”</i> she groans from above you, running her fingers{hair: through your [pc.hair]/else: over your head} while you bob on the end of her hard, pulsating length, tonguing her twitching glans and getting heady cheekfuls of delicious spooge in return. <i>“Oohhh, <b>god!</b>”</i>");

output("\n\n<i>“I think she likes you,”</i> Iyla murmurs, rubbing your back comfortingly. <i>“Or she likes what you’re doing with that tongue of yours.”</i>");

output("\n\nEither way you can hardly believe the volume of fresh, creamy spunk she’s blowing across your swishing tongue, sticky ropes of it splattering against the back of your throat while you enjoy her taste. You have to gulp it down every second lest you risk the excess bursting forth from your lips like a dam and running down your chin, and you’d rather that all this delicious liquid warmth stayed inside. To that end, you might as well take her a little deeper.");

output("\n\n<i>“Oh, yes,”</i> the girl pants as you begin to slide down her throbbing length,{hair: gripping your hair tight/else: holding your head tight}. <i>“Yes, yes! Aaannhh!”</i>");

output("\n\nShe pulls you closer and closer in her need, inching you down towards her groin, her overgrown cock twitching and spasming in your mouth with every violent ejaculation. The deeper she gets the harder she seems to cum until she finally grabs you and thrusts into the very depths of your esophagus, letting out an explosive groan of relief as she starts to dump her frothing loads right into your gurgling stomach. Your insistent finger pressing and rubbing against her enlarged prostate, you have her blow a continuous stream of rushing seed down your open throat.");

output("\n\n<i>“Oh, god,”</i> Iyla mutters from beside you, reaching down between her legs. <i>“Mnf! Nhh...”</i>");

output("\n\n{snakebyte:Good idea, but you don’t even need to bother. Having the creamgirl violate your modded throat has you trembling in ecstasy already and it only grows more intense the harder she cums, your insides clamping down and stretching her rigid length out as she cries out in bliss. You begin to suffer several light orgasms, your eyelids fluttering as the pleasure emanates outwards from your throat and meets the urge in your groin,{herm: your [pc.pussies] drooling{clothed lower: into your [pc.lowerGarments]} while your [pc.cocks] spurt and dribble [pc.cum]{unclothed lower: onto the floor}./multicocks: your [pc.cocks] spurting and dribbling [pc.cum]{clothed lower: into your [pc.lowerGarments]/else: onto the floor}./single cock: your [pc.cock] spurting and dribbling [pc.cum]{clothed lower: into your [pc.lowerGarments]/else: onto the floor}./multicunt: your [pc.pussies] drooling arousal{clothed lower: into your [pc.lowerGarments]/else: onto the floor}./single cunt: your [pc.pussy] dripping arousal{clothed lower: into your [pc.lowerGarments]/else: onto the floor}./neuter: your [pc.asshole] clenching in sympathetic impulse.}");

output("\n\nStars, it feels so good to have your face fucked! The desperate grunts and groans of the girl clutching at you and pressing her long, thick penis into your carnal throat are like music to your ears, the sensation of impact as her ejaculate joins the rapidly pooling tide in your tummy akin to an aphrodisiac. You just want more!/else:That’s not a bad idea. With your free hand you reach{have a cock: into your [pc.lowerGarments] and fish your [pc.cockBiggest] free/else: down and grip your [pc.cockBiggest]}, jacking yourself off in time with the creamgirl’s impulsive ejaculations down your gullet. It doesn’t take long for you to begin spurting [pc.cum] between her shaking legs, a display of utter submission./else have a pussy:{clothed lower: into your [pc.lowerGarments]/else: between your [pc.thighs]} and start to touch your [pc.pussy], fingerfucking your slit in time with the creamgirl’s impulsive ejaculations down your gullet. It doesn’t take long for you to begin dripping{squirter: and squirting} [pc.girlCum] onto the floor in a display of utter submission./else neuter: between your [pc.thighs] and begin to finger your [pc.asshole], revelling in the experience of being a frustrated cumdump. Stars, she’s writhing in ecstasy as she fills your tummy - she must be cumming <i>so</i> hard. You slip another finger into your ass and pump in time with her frantic ejaculations, closing your eyes and feeling your throat stretch with every cumshot.}}");

output("\n\nSo focused are you on slurping down the creamgirl’s thickshake of seed you hardly notice her legs giving way until she almost falls on top of you, your eyes going wide as you catch her and hold her in place almost folded over you. She grunts and moans over your back, gripping your waist from behind as she continues to pour hefty loads into your swollen, cum-filled stomach, but it’s clear she’s on the verge of unconsciousness. Even so, it doesn’t seem like she wants to stop.");

output("\n\n[SuckUnconscious] [LetHerGo]");
output("\n\n[SuckUnconscious]");
output("\n\n//tooltip:Who are you to say no?");

output("\n\nHard to resist the prospect of knocking someone out with your dick-sucking skills. You lean up into her crotch and revel in the way her thick, veined cock pulses unstoppably between your lips even as she begins to groan, her taut, flexed muscles gradually relaxing as you suck and swallow down her essence. When she at last relaxes, letting out a long, sighing breath across your back, you bear her to the ground and continue blowing her with aplomb, bobbing your head up and down her incredibly erect dick.");

output("\n\nIt’s amazing how persistent she is. Even now, after being rendered unconscious by the effort of ongoing orgasms, the creamgirl continues to blow enormous loads past your tonsils and down your accepting throat. Iyla watches with a smirk as your slickened lips slide along the iron-hard cock, her fingers thrusting into her dripping slit while she thumbs her clit. Your stomach might be swelling outwards further with every release, but you’re not done quite yet.");

output("\n\n{Snakebyte:You can feel yourself building up to an incredible orgasm, one spurred on by your impressive oral efforts, and there’s no way you’re letting go without knowing what this feels like. You suck her cock with a desperate, burning need, twirling your tongue around her tortured cockhead before diving back to the messy base and letting it shoot the built-up load down your cum-slicked esophagus before repeating the cycle all over again.");

output("\n\nIt doesn’t take long. The muscles in your throat begin to constrict in a way you’ve scarcely ever experienced, undulating and massaging the creamgirl’s dick as your eyes roll back in your head. You have a full-bodied orgasm, your [pc.hips] jerking instinctively as the giant cock in your throat fucks you to release with cumshot after cumshot. Losing control of your limbs, you collapse on top of the creamgirl, her spasming prick still deep inside you.");

output("\n\nYou lie there feeling her pump across your tongue, cumvein still working to expel the perpetually produced seed from the tip of her cock, and gather the energy to lift yourself off.");

output("\n\n<i>“Haaah,”</i> you gasp, feeling your heart hammer in your chest. Stars, you hadn’t realized how long you’d been throating her...");

output("\n\n<i>“She’s impressive, right? Totally potent even when she’s fast asleep,”</i> Iyla says, leaning over your shoulder with a grin and poking the insensate creamgirl in the nose while her dick continues spurting seed all up her sweaty chest. <i>“She’ll be like that for a little while. Don’t worry, I’ll send for another.”</i>");

output("\n\nYou take a quick shower just to clean off - and marvel at the sheer amount of spunk in your belly - and by the time you return, there’s a fresh-faced creamgirl standing with Iyla who waves at you when you re-enter.");

output("\n\n<i>“H-hi,”</i> she says nervously, trying to hide her massive, throbbing erection with her hands.");

output("\n\n<i>“Hey there,”</i> you say, smiling at her. <i>“I think we’re gonna get along pretty well.”</i>");

output("\n\nIyla barks with laughter.");

output("\n\n[LetHerGo]");
output("\n\n//tooltip:A small mercy, really.");

output("\n\nHer grip on you all but limp, you slowly slide off the end of the creamgirl’s still-spurting penis and swallow, licking your lips clean of any remnants of spunk as she almost collapses backwards. Holding her carefully, you place her on the ground and she sprawls out immediately, moaning in near-insensate bliss and stretching out like she’s making a snow angel.");

output("\n\n<i>“I think you sucked the fire out of her,”</i> Iyla comments, grinning as she puts her head over your shoulder. <i>“Nicely done.”</i>");

output("\n\n<i>“That was fun,”</i> you reply, giving Iyla a peck on the cheek. <i>“Thanks, Iyla.”</i>");

output("\n\n<i>“Not a problem!”</i> she says, smiling wide and wrapping her arms around you, peppering kisses over the back of your neck. <i>“Mmm. Let’s go take a shower with her, shall we?”</i>");

output("\n\nThe three of you take a shower together, casually washing each other up and letting the creamgirl recover a little before you return to the room proper.");

output("\n\n[No thanks]");
output("\n\n//tooltip:Pass.");

output("\n\nYou shake your head and Iyla returns to her task, closing her eyes and gently bobbing her head in the grip of her partner as her stomach fills with thick, heavy cream. Only when it begins to gently swell outwards does she abstain, dragging herself off the end of the spurting dick and trying not to gag as it fills her throat with cum.");

output("\n\n<i>“Gghhagh,”</i> she gasps, taking several deep breaths and swallowing hard as she withdraws her finger from the creamgirl’s rear, not that it stops the girl from cumming all over Iyla’s flushed, sweaty face and heaving tits. <i>“Mngh. Oh. God, I am full.”</i>");

output("\n\n<i>“I’m not surprised,”</i> you note drily, looking over at the creamgirl as she falls to her knees and starts jacking off. <i>“You drank more than I thought she could give.”</i>");

output("\n\n<i>“Oh, she never runs dry,”</i> Iyla says, smiling. <i>“Not unless something happens to her. Her body will just keep converting energy to cum until there’s nothing left to give.”</i>");

output("\n\n{kind:That’s... disturbing./misch:That’s a bit off-color./hard:Sounds about right.} <i>“So as long as you keep stimulating her, she keeps cumming?”</i>");

output("\n\n<i>“Oh, yeah,”</i> she replies, nodding. <i>“Even when she’s unconscious or sleeping. Trust me, I know.”</i>");

output("\n\n[GiveReacharound]");
output("\n\n//requires a dick");
output("\n\n//tt:Fuck the cream-girl, see how hard you can make her cream herself.");
output("\n\n//invalid tt:If only you had a dick you could test the cream-girl’s limits.");

output("\n\n<i>“Turn around,”</i> you say motioning to the creamgirl. <i>“And try to loosen up a little.”</i>");

output("\n\n<i>“O-oh, okay,”</i> she responds, doing a swift double-take at your [pc.cockBiggest]{crotch unexposed: as you take your [pc.lowerGarments] off}. <i>“U-um!”</i>");

output("\n\n<i>“Relax,”</i> Iyla says, smiling at the nervously staring girl. <i>“{He/She}’s going to make you cum <b>so</b> hard, after all.”</i>");

output("\n\nOn another planet Iyla would have made a very good administrative assistant, what with the way she aids you - here, though, you’re instead treated to the sight of her murmuring in her employee’s ear until she reaches back over the creamgirl’s shoulders, pushing her employee down at the hips and planting her hands on the girl’s perky little butt while instructing her to put her hands out against the wall.");

output("\n\n{cocksize <8:"She’s going to be a little tight, but I don’t think you’ll mind,”</i>/8-15:"She’s going to be very tight around your dick, but I imagine most of your partners are,”</i>/16+:"She’s going to be torturously tight around that cock of yours, but I imagine most of your partners are,”</i>} Iyla says with a grin. <i>“Let me get that for you...”</i>");

output("\n\nThe creamgirl lets out a little whimpering squeak as Iyla squeezes her asscheeks and pulls, spreading them apart as wide as she can for you, revealing the girl’s pink little pucker, winking and flexing. There’s a sight for sore eyes. She lets out a louder yelp when you let your dick drop between her pert cheeks, rubbing it up her{size <14: lower back a little/else: spine and letting her feel the absurd length of it}.");

output("\n\n<i>“Oh my <b>god</b>,”</i> you hear her moan.");

output("\n\nShe’s definitely breathing faster now. Reaching down you take ahold of her shapely hips and pull her back into you, her tight butt pressing against your [pc.thighs] while she pants. Iyla smiles and brushes against you, kissing your cheek as she passes by.");

output("\n\n<i>“I think you’ve got it from here,”</i> Iyla whispers in your ear.");

output("\n\nYou grin while Iyla takes a seat to the side, leaning back and casually spreading her legs so she can reach down and rub herself. She’s certainly an enthusiastic audience member.");

output("\n\n<i>“And you?”</i> you ask, leaning down to verbally prod the creamgirl. <i>“How badly do you want it?”</i>");

output("\n\n<i>“Oh, please, I wanna cum,”</i> she whines. <i>“Uuu-uuhh! I’m really really close!”</i>");

output("\n\nYou can help with that. Pulling your [pc.hips] back you slowly align your [pc.cockHeadBiggest] with her inviting asshole, pushing into her just hard enough to let her feel the stretch - and then applying just a bit more pressure.");

output("\n\n<i>“Oh,”</i> the creamgirl pants at once, arching her back. <i>“Oh- oh, oh! Nnh!”</i>");

output("\n\n<i>“There you go, just relax,”</i> you murmur, the intense heat of her slippery insides gripping your dick and pulling you deeper. <i>“Good girl.”</i>");

output("\n\n<i>“Ooohhhh,”</i> she moans, shivering in your grip. <i>“Gghhnngh- it- it’s coming out-”</i>");

output("\n\nRight as the head of your [pc.cockType] presses against her oversized prostate, you feel her tense up in your hands. She lets out a cute little grunt before you hear a drip hit the ground, and with every ridiculously strong clench of her ass there’s more. Shit, Iyla was right - she is <i>tight</i>.");

output("\n\nOn top of that, you’d almost forgotten - every creamgirl has a vibe up her ass to constantly stimulate her sensitive prostate and keep her edged, and you’re pretty sure that’s exactly what the pleasurable buzzing you’re feeling against your dickhead is. Shit, poor girl, you can hardly blame her for always being so nervous and sweaty. The least you can do is fuck her hard and give her a taste of a real orgasm.");

output("\n\n<i>“Uuuuhhh,”</i> she whimpers as you withdraw your length, rubbing her sensitized insides on the way out until you’re poised at her entrance, then thrust back in - hard. <i>“Ooohhh!”</i>");

output("\n\nYou grunt as you plow into her hard enough to make her almost lift off the ground, the creamgirl standing on her tiptoes as her eyes go wide and she begins to unceremoniously paint the wall in front of her with her thick, squirting spunk. Now seems like as good a time as any to deliver on the reaching around part of the fun.");

output("\n\n<i>“O-oh- oh my god!”</i> she gasps as you grab her thick, throbbing cock and stroke her, timing it with your thrusts from behind. <i>“Ungh! You- you’re squeezing it out of me! Oohh!”</i>");

output("\n\nStars, she’s not kidding - with every gentle squeeze and encouraging rub of her penis you can feel her cumvein surge as another stream of creamy spunk spurts from her reddened tip, her length so rigid it’s like holding an iron pole. Shuddering and panting like a fevered beast, the girl cums again and again, stuck fast in the cycle of continual orgasm while you pound away at her bouncing rear and push against her buzzing vibe. There’s an <i>incredible</i> puddle between her legs, and it’s only growing with every second you spend slamming her ass.");

output("\n\nGlancing to the side momentarily you spy Iyla fucking herself with glee, juices spurting from the two fingers jammed inside her spasming cunt while she watches you fuck the cum right out of the creamgirl. She throws her head back and squirts all over the floor with a depraved groan, lifting her ass off the ground and grinding her clit into the palm of her other hand. Looks like the barkeep is having every bit as much fun as you and her underling are.");

output("\n\n<i>“I’m gonna cum soon,”</i> you mutter to the girl clenching her ass around your cock, not so much in the throes of passion as she is utterly debasing herself. <i>“Get ready!”</i>");

output("\n\nShe either can’t hear you or can’t respond, her fingers curled into claws and her tongue hanging out as she empties load after load from her pulsing cock. Held securely in your hands all she needs to focus on is cumming, and it seems like that’s suiting her just fine if the groans of ecstasy are any indication. You’ve got some spunk of your own to unleash after managing to hold out through being continually edged by her vibrating orifice, and it’s going to be a lot.");

output("\n\nYou let out a nonverbal grunt and shove her forward, squeezing her tight in your hand as she comes off the ground completely and abruptly slides to the very base of your cock, moaning all the way. [pc.Cum] shoots up into her bowels{balls:, pumping from your [pc.balls] and filling/else: from the end of your cock and fills} her with surging liquid heat. Gritting your teeth, you leave yourself hilted and let the combined motions of her clenching asshole and low-intensity vibe milk out the rest of your jizz.");

output("\n\n<i>“Hmmmmnnhh-”</i> she strains, matching you shot for shot with every ejaculation, shuddering against your [pc.chest] as she reaches back and tries to cling on for some steadiness. <i>“Nnnnhhgh!”</i>");

output("\n\nFor every load you dump into the sweaty, shaking girl she expels another, sticky cream spurting from her swollen cockhead and pasting the wall with her product. By the time you finish with her she’s wet both front and back, cum rolling down the back of her thighs and dripping from her twitching, outstretched toes to join the lewd puddle of fluids on the floor.");

output("\n\n<i>“Oohhhhh, god...”</i> the creamgirl moans, putting her hands back against the wall to steady herself as you lower her back to the floor. <i>“Thank you.”</i>");

output("\n\n<i>“Don’t slip,”</i> you caution her good-naturedly, watching her grope at the wall and reaching out to hold her up. <i>“Here, I’ve got you.”</i>");

output("\n\nYou guide the shaky, panting girl over the pool of her own cum and watch her stretch out, extending her arms all the way over her head and moaning in bliss.");

output("\n\n<i>“Wow, I’ve- I’ve never had sex like that,”</i> she sighs, and you can tell at least some measure of her usual need has abated. <i>“Thank you.”</i>");

output("\n\n<i>“Not a problem,”</i> you say, smiling. So you can fuck a creamgirl hard enough to make them wet the floors and she’ll thank you for your efforts? The VIP room is pretty great. You look down at Iyla, who gives you a satisfied grin. <i>“And you?”</i>");

output("\n\n<i>“Oh, I’m <b>just</b> fine,”</i> Iyla replies, lifting a leg to cross it over her other. The small puddle of the juices squirted from her pussy is plainly visible in front of her before it begins to dissipate, no doubt draining away somewhere. <i>“I had my fun.”</i>");

output("\n\n<i>“I can tell,”</i> you say, amused.");

output("\n\nThe three of you take a shower together, casually washing each other up with some fun before you return to the room proper.");

output("\n\n[Sleep]");
output("\n\n//tt:The wall-girl’s tits are easily plush and warm enough to sleep amongst.");

output("\n\nWell, there’s a big, soft mountain of titflesh for you to spread yourself out on - and the quiet gagged moans of the provider provide a nice accompaniment to the sensation of sinking into her. Shit, this might be more comfortable than your bed in the ship...");

output("\n\nYou drift off, thinking of swimming in a sea of milk while the room’s lighting fades.");

output("\n\n[Next]");
output("\n\n//remove iyla and cream-girl from the room if they’re present.");

output("\n\nYou awaken refreshed, stretching out and grinning as the wall-girl groans in joy, responding to the shift of your weight.{if iyla and a creamgirl were present: Iyla and the cream-girl have departed so as to not disturb your rest, and for that you’re thankful/if just Iyla: Iyla’s left you alone in your room, and for that you’re thankful/Reclining alone on your bed, you reflect on the night}. That was some of the best sleep you’ve had in years. Time to get up and take care of business - or maybe... you glance at the wall-girl’s open, drooling mouth.");

output("\n\nWell, either way, time to get up.");

output("\n\n[No thanks]");
output("\n\n//tt:Bit rich for your blood at the moment.");

output("\n\nYou shake your head and she puts the slate away immediately, polishing a glass.");
output("\n\n[Leave]");
output("\n\n//tt:The VIP room’s comforts grow dull. Time to get something done.");

output("\n\n<i>“I’m going to head back out,”</i> you say, nodding to Iyla. <i>“See you again, Iyla.”</i>");

output("\n\n<i>“Great. Come back soon,”</i> she says, smiling at you. <i>“I’ll be missing you.”</i>");

output("\n\nYou head downstairs and back up the curving hallway, reacquainting yourself with the droning roar of life on Dhaal as it washes across your ears, emerging onto the smoky surface of the megacity.");


output("\n\n//to do");
*/