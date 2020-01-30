//Coded by: THE 'NOXO, written by the DUBSAN
public function showIyla(nude:Boolean = false):void
{
	showName("\nIYLA");
	showBust("IYLA" + (nude ? "_NUDE":""));
}
public function showDrinkCow(nude:Boolean = false):void
{
	showName("DRINK\nCOW");
	showBust("DRINK_COW_" + flags["DHAAL_MILKCOW"] + (nude ? "_NUDE":""));
}

public function showCreamCow(nude:Boolean = false):void
{
	showName("CREAM\nCOW");
	showBust("CREAM_COW" + (nude ? "_NUDE":""));
}
public function generateDrinkCow():void
{
	flags["DHAAL_MILKCOW"] = rand(3)+1;
}
public function milkThief():void
{
	var tEnemy:ZaikaMilkThief = new ZaikaMilkThief();
	setEnemy(tEnemy);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(winVsBoredJumper);
	CombatManager.lossScene(loseToBoredJumperRouting);
	CombatManager.displayLocation("MILK THIEF");
	CombatManager.beginCombat();
}

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
	else addButton(0,"Iyla",summonIyla,undefined,"Iyla","Call the bartender over.");
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
	addButton(14,"Back",mainGameMenu);
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
		pc.lust(3);
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
	pc.lust(8);
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
	pc.lust(33);
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
	pc.lust(3);
	var tempCow:Creature = new Creature();
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
	pc.lust(5);
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
	if(9999) output(" Amazing what’s possible with a little bit of ingenuity.");
	else output(" How <i>does</i> she do it?");
	processTime(10);
	var tempCow:Creature = new Creature();
	tempCow.createPerk("Fixed CumQ",500);
	pc.loadInMouth(tempCow);
	pc.lust(10);
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
	processTime(4);
	setButtonDisabled(3);
}