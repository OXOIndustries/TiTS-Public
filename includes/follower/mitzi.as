/*
Mitzi the CoC/TiTS Goblin Cumslut - By Fenoxo Fenfenfenfenfenfnefnefnefnenfenfnefnwsmlfnsjkfhasdfjkhsbnj
Hybrid TiTS/CoC character (Same Sex Scenes/Personality, but with minor adjustments for setting and a different TiTS intro).
CoC versions rescued off Kinariel's dick in dungeon 3.
TiTS version is girl that got drugged by Kaska with dumbfuck. PC can rescue her at the stellar tether. She shows up afterward all bimboed up and thankful to the PC for trying.

===============================
		FLAGS
===============================
MITZI_GOODBAD				1 = "good" during recruit, -1 = "bad"
MITZI_DISABLED				1 = Mitzi removed from game during initial meeting
MITZI_RESCUED				= the timestamp that she was rescued.



CoC Description/Notes:
Hanging from an impeccably made harness is a goblin, the only splash of color on the soulless abomination before you. She’s positioned against the larger male’s abdomen so that her bare crotch is impaled upon his turgid, writhing demon-dick, and by the looks of her frantic squirming, is doing her best to escape. Perhaps you could free her?
3'+ tongue
Purple lips covered in gloss
Booty big enough to "clap" while twerking
Very liberal pussjuice & Very puffy mound :3
Huge breasts without any sag. Jutting nip-tips.
Speaks in third person when stressed/horny: "Please don't kill Mitzi!"
Spaded tail.
Elfin ears
Super elastic. Belly bulges in cock shape.
TiTS Details:
Latex pink dress
Pink, heart-shaped eyes
TiTS Intro Stuff
*/

public function mitziIsCrew():Boolean
{
	return (flags["MITZI_ONBOARD"] == 1);
}
public function mitziRecruited():Boolean
{
	return (flags["MITZI_RECRUITED"] == 1);
}
public function showMitzi(nude:Boolean = false):void
{
	showName("\nMITZI");
	var dressString:String = "";
	var dress:ItemSlotClass = mitziCurrentDress();
	if(dress is MitzisDress) dressString = "PINK_DRESS";
	else if(dress is SchoolgirlCostume) dressString = "SCHOOLGIRL";
	else if(dress is MitzisYogaBikini) dressString = "YOGAPANTS";
	else if(dress is MitzisLibrarianOutfit) dressString = "LIBRARIAN";
	else if(dress is TransparentZipsuit) dressString = "ZIPSUIT";
	else if(dress is MitzisSuccBikini) dressString = "BIKINI";
	else if(dress is MitziCowFetishCostume) dressString = "COW";
	else if(dress is MitziNunFetishCostume) dressString = "NUN";
	else dressString = "CUSTOM";
	showBust("MITZI" + dressString + (nude ? "_NUDE":""));
}

//Mitzi first appears in the stellar tether dungeon in an empty square.
public function stellarMitziBonus():void
{
	if(flags["MITZI_RESCUED"] == undefined)
	{
		if(!rooms[currentLocation].hasFlag(GLOBAL.NPC)) rooms[currentLocation].addFlag(GLOBAL.NPC);
		output("\n\nA naked, cum-covered gabilani techitian is tied to a post and drooling, fucked into exhaustion. You could help her escape, if you wanted to.");
		//Not Gabilani’ed
		if (!CodexManager.entryUnlocked("Gabilani"))
		{
			output(" Your Codex pings, alerting you that she is one of the Gabilani.");
			output("\n\n<b>New Codex entry unlocked: Gabilani.</b>");
			CodexManager.unlockEntry("Gabilani");
		}
		clearMenu();
		addButton(0,"Untie Gabi.",untieMitzi);
	}
	else if(rooms[currentLocation].hasFlag(GLOBAL.NPC)) rooms[currentLocation].removeFlag(GLOBAL.NPC);
	generateMap();
}

//Untie:
public function untieMitzi():void
{
	clearOutput();
	showName("GRATEFUL\nGABILANI");
	output("You make short work of her bindings, and your presence seems to rouse her somewhat.");
	output("\n\n<i>“No... no more.”</i> She burps groggily and staggers up to her feet with your help. <i>“Oh... not pirate?”</i>");
	output("\n\n<i>“No, I’m not a pirate.”</i> You explain to her that you’re dealing with the pirates and inform her how to get to make it safety.");
	output("\n\nThe Gabilani tech disgustedly wipes semen from her face and nods. <i>“Thanks. I won’t forget this. I promise.”</i> She runs off in a hurry.");
	flags["MITZI_RESCUED"] = GetGameTimestamp();
	if(rooms[currentLocation].hasFlag(GLOBAL.NPC)) rooms[currentLocation].removeFlag(GLOBAL.NPC);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function mitziOutsideShip():Boolean
{
	//trace("MITZI RESCUED: " + flags["MITZI_RESCUED"] + "\nTimestamp: " + GetGameTimestamp() + "\nDISABLED? " + flags["MITZI_DISABLED"]);
	return (flags["MITZI_RESCUED"] + 60*24*8 < GetGameTimestamp() && !mitziIsCrew() && flags["MITZI_DISABLED"] == undefined && flags["MITZI_RESCUED"] != undefined && shipLocation == "TAVROS HANGAR");
}

//Try to enter ship while she’s leaning.
public function mitziFirstShipApproach():void
{
	clearOutput();
	showMitzi();
	showName("GABILANI\nSLUT");
	output("A green arm grabs hold of your [pc.leg], stopping you in your tracks. Looking down, you’re confronted with the wide-eyed gaze of the Gabilani you spotted leaning on your ship.");
	output("\n\n<i>“Hiya.”</i> She bounces. For several seconds after, her breasts continue to bounce, seemingly unrestrained by the skin-tight latex hugging her considerable curves. <i>“You’re like, that [pc.name] [pc.guyGirl], right?”</i>");
	output("\n\nYou have a hunch that if you give her your name, you’re going to have a hard time getting rid of her. You could probably just <b>lie to her, and never have to deal with her again.</b>");
	processTime(2);
	clearMenu();
	addButton(0,"Yep",yepImPCNameMitz);
	addButton(1,"Lie",goOnTheInternetAndTellLies);
}

//[Yep]
public function yepImPCNameMitz():void
{
	clearOutput();
	showMitzi();
	output("<i>“Yep. What brings you my way?”</i>");
	output("\n\nThe gabilani’s grin vanishes. <i>“Uh... you saved Mitzi. At the big laser suuuuper deep in Tarkus.”</i> She squeezes her outsized tits and purrs, <i>“Mitzi didn’t have big, fuckable tits back then, and thought about boring stuff, like machines and numbers! Now the only numbers Mitzi worries about are how many cummies she can have in a row.”</i> Leaning closer, she brags, <i>“It’s the one after eight.”</i>");
	output("\n\nResisting her brazen sexuality for now, you ask what happened to her.");
	output("\n\n<i>“Dumbfuck.”</i> Mitzi sighs. <i>“Big-dick pirate-slut dosed Mitzi with it, but Mitzi didn’t know what it was until too late. Mitzi just knew she was horny, so she played with herself again and again until she didn’t want to stop playing with herself.”</i> Fondling her breasts, she moans happily. <i>“Life is so much easier when you only think about cumming and making other people cum!”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nUnable to hold back a giggle of your own, you agree wholeheartedly. Fucking your way through life is the true path to happiness.");
	else output("\n\nYou offer her your deepest sympathies, but Mitzi doesn’t truly seem to appreciate them.");
	//Merge
	output("\n\nThe gabilani rambles on, <i>“But Mitzi had one last, big, good thought before her brains got all mushy and pink: she could pay back [pc.name]’s kindness in sex. Lots of sex.”</i> She strokes your crotch fondly. <i>“If you are </i>actually<i> [pc.name].”</i> The effort maintaining her disbelief seems to be straining her faculties. Her naturally pouty lips have drifted open invitingly, unable to resist looking fuckable more than a few seconds, and her button nose wrinkles adorably. <i>“Are you?”</i>");
	output("\n\nFor the second time today, you tell her who you are. This time, you use your full name.");
	mitziMeetsPCNameForRealRealMergy();
}

//[Lie]
public function goOnTheInternetAndTellLies():void
{
	clearOutput();
	showMitzi();
	output("<i>“Nope. I think I saw [pc.himHer] leave an hour or two ago.”</i>");
	//Asshole points +5
	pc.addHard(5);
	output("\n\n<i>“Nuts!”</i> The tiny tramp stamps her feet and pouts a purple lip so hard that you feel a little bad. She seems truly put out. <i>“Mitzi’s like, not super smart anymore, but she totally remembers [pc.name] was super nice. Mitzi owes [pc.himHer] so much!”</i>");
	output("\n\nNow you’ve got to know what you did for her. You don’t remember assisting any gabilani that looked this slutty. You ask.");
	output("\n\n<i>“Oh, [pc.heShe] helped Mitzi get away from the bad pirates, especially the one with the huge dick that gave Mitzi dumbfuck.”</i> She pauses and chews her puffy lip bashfully. <i>“Was really mad at first, but then Mitzi figured out fucking was way more fun that programming and engin... engine-ear-wing anyway! So Mitzi thinks, dumb cunt that she is now, that like, maybe [pc.name] could use a fuck-slave. Mitzi’s head is all full of cocks, and pussies, and balls, and tits, and clits, and cum... so much cum.”</i> She pulls herself coser, and breasts a little too large for her frame squeeze against your [pc.legFurScales]. One hand ");
	if(!pc.isCrotchExposed()) output("slides under your [pc.crotchCover]");
	else output("slides up");
	output(" to caress your ");
	if(pc.hasCock()) output("bulge");
	else if(pc.hasVagina()) output("slit");
	else output("bare loins");
	output(". It’s with deep-seeming regret that she pulls it away after a long, lingering moment.");
	output("\n\nThat’s quite a story! Do you want to let her know who you really are, now that you’ve heard her sob story? She’ll probably wind up making some other Rusher really happy if you don’t.");
	processTime(4);
	clearMenu();
	//[Let Her Go] [Tell Truth]
	addButton(0,"Let Her Go",letMitziGoAwayForever);
	addButton(1,"Tell Truth",tellMitziTheTruth);
}

//[Let Her Go]
public function letMitziGoAwayForever():void
{
	clearOutput();
	showMitzi();
	output("<i>“No problem.”</i> You wave Mitzi away.");
	output("\n\nMitzi giggles and blows you a kiss. <i>“Thanks, cutie! If I wasn’t so busy looking for [pc.name], I toooootally would’ve fucked you! Maybe next time!”</i> She prances off, tits threatening to bound out of her top with every step.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	pc.removeStatusEffect("SeenMitzi");
	flags["MITZI_DISABLED"] = 1;
}

//[Tell Truth]
public function tellMitziTheTruth():void
{
	clearOutput();
	showMitzi();
	output("<i>“Oh.”</i> You grab her shoulder before she can run off. <i>“I’m actually [pc.name].”</i>");
	output("\n\nMitzi’s eyes go as wide as dinner plates. <i>“Whaaaaaaaat? Are you sure?”</i> She leans closer and squints. After a second, she takes a tentative sniff. <i>“You do smell like [pc.himHer]. Are you sure?”</i> Her attempt to appear discerning is almost comical... and somehow still sexy. Her button nose wrinkles adorably, and her naturally pouty lips have drifted open invitingly, unable to resist looking fuckable more than a few seconds.");
	output("\n\nYou inform her that you’re quite sure.");
	output("\n\nThe resulting squeal of delight is so shrill that you come within a hairsbreadth of clapping your palms over your ears.");
	mitziMeetsPCNameForRealRealMergy();
}

//Merge
public function mitziMeetsPCNameForRealRealMergy():void
{
	output("\n\n<i>“It’s reeeaaaally yooouuuuuuu!”</i> Mitzi leaps up off the ground and into your arms, her short legs wrapping ");
	if(pc.thickness < 80 && pc.bellyRating() < 30) output("around you");
	else output("as far around you as they can reach");
	output(", squeezing you so tightly that you can feel her breasts squishing against ");
	if(pc.biggestTitSize() >= 1) output("your own");
	else output("your chest");
	output(". A hail of kisses rain down on your lips, starting with quick pecks that rapidly ramp up into forceful smooches before transitioning into full-on making out. She’s unexpectedly talented in the oral arts; you find yourself leaning into them almost immediately, savoring the texture of her plush lips as they slide against your own. Sometimes she pulls back to talk, offering you your only chances to gasp for air.");
	output("\n\n<i>“Mitzi almost gave up hope!”</i> The next kiss is more tongue than lip, revealing seemingly endless inches of muscle to wrap your tongue up in. <i>“But now she found you.”</i> Small hands ");
	if(pc.hasHair()) output("rake through your [pc.hair]");
	else output("passionately stroke the back of your bald head");
	output(". <i>“Mitzi’s new [pc.Master].”</i> Her nipples are quite hard by this point. <i>“Are you going to fuck Mitzi?”</i> She kisses you again before you can respond, bouncing off your mouth to hungrily lick along your jawline. <i>“Are you going to use her?”</i> Her shiny, skin-tight dress audibly squeaks against itself as she grinds her crotch into you. <i>“");
	if(pc.hasCock()) output("Are you to fill her up with cum ‘til she can’t move?");
	else output("Are you going to stick her head between your legs so she can lick until she passes out?");
	output("”</i>");

	//Bro
	if(pc.isBro()) output("\n\nYou answer her by reaching under her skirt to press your thumb into her slit. It slides right in with barely any effort at all. The chatty little slut’s wetter than a Treated kaithrit in heat.");
	//Bimbo
	else if(pc.isBimbo()) output("\n\nYou answer her by lifting her up and lowering her dress over your face. The smell of feminine arousal is thick and cloying beneath the plasticy fabric, but it only makes your mouth water for what is coming. The chatty little slut’s cunt soon presses against your mouth in a sinful, sapphic kiss. She’s wet. Wet enough to tempt you to go for more, but there’ll be plenty of time to fuck her later, on your ship... for your entire next flight. When you lift her up, Mitzi is groaning and rubbing her tits.");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“Yes.”</i> What else could you say? The poor girl could needs someone to look after her. Better it’s you than someone else.");
	//Misch
	else if(pc.isMischievous()) 
	{
		output("\n\n<i>“Like my personal hover-bike,”</i> you answer.");
		output("\n\nThat brings Mitzi’s kisses to a screeching halt. She looks confused, then starts sucking a finger for a moment as she tries to comprehend your statement. Ten seconds later, she’s knuckle-deep and considering adding a second.");
		output("\n\n<i>“It means I’m going to ride you a lot.”</i>");
		output("\n\n<i>“Ohhhhh!”</i> Spit hangs between her lips and fingers.");
	}
	//Hard
	else output("\n\n<i>“Yeah, you’re my fuck-pet now.”</i>");
	//Merge
	output("\n\nMitzi appears pleased by the ");
	if(pc.isBro()) output("non-verbal ");
	output("declaration, so pleased, in fact, that she whimpers, thighs twitching. Her hips quiver, dragging her latex-covered crotch back and forth your body in fanatical jerking motions until she hits her peak and wails in sublime pleasure, <i>“Yesss! Mitzi can be fuck-toooyyyyyy!!!”</i> Eyes rolling back and pigtails twitching, Mitzi shudders through an orgasm so powerful that halfway through she loses her grip on you and slides down to the ground. Clear girl-cum leaks out from between her thighs as her upper half wobbles.");
	output("\n\n<i>“");
	if(pc.isBro()) output("You okay?”</i> you grunt.");
	else if(pc.isBimbo()) output("Wow! You came so hard, and I like, barely did anything! Are you all right?”</i>");
	else if(pc.isNice()) output("Mitzi! Are you alright?”</i>");
	else if(pc.isMischievous()) output("Are you... are you okay?”</i>");
	else output("Is that gonna happen every time we make-out?”</i>");
	output("\n\nA breathless, momentarily satisfied Mitzi beams up at you. <i>“Mitzi wasn’t sure about becoming a fuck-toy...”</i> She staggers up onto her feet and hugs your ");
	if(pc.tallness >= 5*12) output("[pc.leg]");
	else output("waist");
	output(". <i>“But now Mitzi knows how good it feels to be </i>owned<i>. How good it makes her pussy gush to be </i>your toy<i>. Gods!”</i> She whimpers and rubs herself through her dress. <i>“Did Mitzi do good?”</i> Doe-eyed, the gabilani slut looks up for your approval.");
	processTime(12);
	pc.lust(5);
	clearMenu();
	//[Yes] [No]
	addButton(0,"Yes",yesMitziYoureAGoodFuckslave);
	addButton(1,"No",noMitziYoureAShitFuckslave);
}

//[Yes] Mitzi did good
public function yesMitziYoureAGoodFuckslave():void
{
	clearOutput();
	showMitzi();
	output("You pat her head between her pigtails and assure her that she’s very good.");
	output("\n\nWiggling happily, Mitzi cheers, <i>“Yay! Mitzi knew she would be good slut for [pc.name]. [pc.Master], can Mitzi have room on ship since she’s such a good toy?”</i> She rubs your crotch brazenly, looking up and batting her lashes over pink, heart-shaped eyes.");
	flags["MITZI_GOODBAD"] = 1;
	mitziRecruitmentChoice();
}

//[No] Mitzi did not do good
public function noMitziYoureAShitFuckslave():void
{
	clearOutput();
	showMitzi();
	output("<i>“No.”</i> It’s a stern answer but a truthful one.");
	if(pc.isBro()) output(" A simple finger pointed at your crotch makes the message clear: toys are for satisfying their owner, not themselves.");
	else if(pc.isBimbo()) output(" <i>“You like, didn’t try to make me cum with you! Don’t worry though, I’ll teach you everything I know. It’ll be super fun!”</i>");
	else if(pc.isNice()) output(" <i>“You were so into your own pleasure that you didn’t even think about mine.”</i>");
	else if(pc.isMischievous()) output(" <i>“You were a terrible toy. Luckily you’re more of a voluntary slave than a toy.”</i> You grin impishly. <i>“But if you were my sex-slave, I’d expect you to get me off too.”</i>");
	else output(" <i>“All you did is slobber on me while you dry-humped like an animal. If you want to be a sex-toy, you should at least be useful for making me cum.”</i>");
	output("\n\nTears well up in the corners of Mitzi’s pink, heart-shaped eyes. <i>“Wa... umm... Mitzi will do better next time. She promises.”</i> She clutches your hands and looks up at you, batting her considerable lashes cutely. <i>“Pleeeeaaase let Mitzi have a place on your ship. Mitzi will be like, super good at making you cum and never get in your way... unless you want her to get in your way and get spanked like a bad girl.”</i>");
	flags["MITZI_GOODBAD"] = -1;
	mitziRecruitmentChoice();
}

//Merge:
public function mitziRecruitmentChoice():void
{
	output("\n\nDo you take Mitzi onboard as a crew member?");
	pc.removeStatusEffect("SeenMitzi");
	processTime(2);
	clearMenu();
	//[Yes] [No]
	addButton(0,"Yes",takeMitziAsCrewmember);
	addButton(1,"No",noMitziNotCrewYettt);
}

//[No] - No Mitzi Crewmember
public function noMitziNotCrewYettt():void
{
	clearOutput();
	showMitzi();
	output("You decline her offer.");
	output("\n\nMitzi stumbles back, flabbergasted and tearful. She makes several attempts at sputtering out incoherent pleas that go nowhere. Shoulders sagging heavily, she at last accepts that you won’t need an empty cock-socket prowling around on your ship.");
	output("\n\n<i>“Mitzi will... will wait for [pc.Master].”</i> The green-skin nods to herself. <i>“When [pc.Master] wants a fuck-toy, Mitzi will be ready to fuck, or lick, or suck. Anything [pc.Master] needs.”</i> She brings her shoulders back, exposing a massive valley of cleavage. <i>“Any time. Any thing. Mitzi will do for you.”</i>");
	output("\n\nYou’ll be sure to leave that in mind.");
	flags["MET_MITZI"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Yes] - Mitzi crew member
public function takeMitziAsCrewmember():void
{
	clearOutput();
	showMitzi();
	output("You accept her offer.");
	output("\n\n<i>“Yesyesyes! Yes! You won’t regret this, [pc.Master],”</i> Mitzi says, dropping to her knees and kissing your [pc.foot]. <i>“Mitzi will make you like, so sat-satis...happy!”</i> Her tongue slithers across your [pc.legFurScales] before sliding back into her hungry little mouth. When she stands, her dress shows no sign of wear from her time on the ground. It clings to her as prettily as the moment you saw her. <i>“Thank you. [pc.Master] is so smart, keeping a goblin fuck-pet like Mitzi...”</i> She sashays up the boarding ramp, rump wiggling in an exaggerated figure eight that you could watch for hours.");
	output("\n\n(<b>Mitzi has joined your crew!</b>)");
	flags["MITZI_RECRUITED"] = 1;
	flags["MITZI_ONBOARD"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Crew removal or repeat pickup:
//Approach kicked off Mitzi
public function mitziLurkingApproach():void
{
	clearOutput();
	showMitzi();
	output("You clear your throat to get Mitzi’s attention.");
	output("\n\n<i>“Oh! It’s you, [pc.name]! Gods, look at you now - even sexier than last time! Did you want to take me back onto your ship and bang my brains out?”</i> She thrusts her massive tits in your direction, straining her hot pink dress to the breaking point. <i>“Or grab Mitzi by her ponytail and ride her face until your crotch goes numb? That’d be fun.”</i> She roughly gropes her tits and bounces them around, smiling when your eyes follow their path. <i>“Just give me the word, and you can have Mitzi be your personal... giggling... goblin fuck-pet.”</i>");
	processTime(2);
	//[Yes] [No]
	clearMenu();
	addButton(0,"Yes",retakeMitziOnCrew);
	addButton(1,"No",dontRetakeMitziOnboard);
}

public function retakeMitziOnCrew():void
{
	clearOutput();
	showMitzi();
	output("You gesture to the ship invitingly.");
	output("\n\n<i>“Yesyesyes! Yes! You won’t regret this, [pc.Master],”</i> Mitzi says, dropping to her knees and kissing your [pc.foot]. <i>“Mitzi will make you like, so sat-satis...happy!”</i> Her tongue slithers across your [pc.legFurScales] before sliding back into her hungry little mouth. When she stands, her dress shows no sign of wear from her time on the ground. It clings to her as prettily as the moment you saw her. <i>“Thank you. [pc.Master] is so smart, keeping a goblin fuck-pet like Mitzi...”</i> She sashays up the boarding ramp, rump wiggling in an exaggerated figure eight that you could watch for hours.");
	output("\n\n(<b>Mitzi has joined your crew!</b>)");
	flags["MITZI_ONBOARD"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function dontRetakeMitziOnboard():void
{
	clearOutput();
	showMitzi();
	output("You turn down the offer. There's plenty of sex to be had without attaching yourself to a nympho.");
	output("\n\n<i>“Awww, really? Mitzi got all hopeful and wet and-and... uh. Phoey.”</i> The goblin pouts and sighs. <i>“Well, like, Mitzi will be here if you change your mind or whatever.”</i>");
	output("\n\nYou sigh heavily.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Kick Mitzi off crew
public function kickMitziOffCrew():void
{
	clearOutput();
	showMitzi();
	output("You tell Mitzi to hit the road. You need the space for other crewmates.");
	output("\n\n<i>“Oh...”</i> Mitzi frowns momentarily, then perks back up. <i>“But it’s like, not forever, right? You’ll take Mitzi back and fuck her stupid slutty brains out over and over again?”</i>");
	output("\n\nYou agree for now. The alternative would be listening to her bawling her eyes out, you’re sure.");
	output("\n\n<i>“Yay!”</i>");
	flags["MITZI_ONBOARD"] = undefined;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//TiTS-Specific Mitzi Crew Stuff
//Ideas:
//Rotating cast of fetish costumes: Latex pink dress, latex school-girl outfit, yoga pants and bikini top, succubus, cow-girl, transparent zipsuit, slutty librarian, & nun!
//PC can gift  her any <i>“armor”</i> class item with a sexiness of 5 or more, and she will wear it.
//PC can dress her up, but only if he strips her down.
//Mitzi got picked up by a drug-dealer on his way through Tarkus and has a ton of <i>“special treats”</i> for her lover, including once-weekly presents of throbb or gush. This is basically a reskin of CoC goblin potions/salves.
//Sometimes wears illegal perfumes like <i>“rutting,”</i> <i>“heat,”</i> <i>“priaprism”</i>, and <i>“adulation”</i>. The first three can induce the relevant statuses... the latter results in the loviest oral pairing scene I can write.

public function mitziCurrentDress():ItemSlotClass
{
	/*Quick fix for my testing save. delete this for release
	if(!mitzi.hasItemByClass(SchoolgirlCostume))
	{
		mitzi.inventory.push(new SchoolgirlCostume());
		mitzi.inventory.push(new MitzisYogaBikini());
		mitzi.inventory.push(new MitzisLibrarianOutfit());
		mitzi.inventory.push(new TransparentZipsuit());
		mitzi.inventory.push(new MitzisSuccBikini());
		mitzi.inventory.push(new MitziCowFetishCostume());
		mitzi.inventory.push(new MitziNunFetishCostume());
	}*/
	if(!pc.hasStatusEffect("Mitzi Dressed"))
	{
		pc.createStatusEffect("Mitzi Dressed");
		pc.setStatusMinutes("Mitzi Dressed",120);
		mitziEquip(mitzi.inventory[rand(mitzi.inventory.length)]);
		/*
		var clothselector:Number = rand(10);
		if(clothselector <= 1) flags["MITZI_CLOTHING"] = "PINK_DRESS";
		else if(clothselector == 2) flags["MITZI_CLOTHING"] = "SCHOOLGIRL";
		else if(clothselector == 3) flags["MITZI_CLOTHING"] = "YOGAPANTS";
		else if(clothselector == 4) flags["MITZI_CLOTHING"] = "BIKINI";
		else if(clothselector == 5) flags["MITZI_CLOTHING"] = "COW";
		else if(clothselector == 6) flags["MITZI_CLOTHING"] = "ZIPSUIT";
		else if(clothselector == 7) flags["MITZI_CLOTHING"] = "LIBRARIAN";
		else if(clothselector == 8) flags["MITZI_CLOTHING"] = "NUN";
		//else if(clothselector == 8) flags["MITZI_CLOTHING"] = "CUSTOM";
		*/
	}
	return mitzi.armor;
}

public function mitziEquip(arg:ItemSlotClass):Boolean
{
	if(mitzi.armor.longName == arg.longName) return true;
	for(var x:int = 0; x < mitzi.inventory.length; x++)
	{
		//Found the item in her inventory
		if(mitzi.inventory[x].longName == arg.longName)
		{
			//Add armor to inventory.
			mitzi.inventory.push(mitzi.armor);
			//Set armor to new item:
			mitzi.armor = mitzi.inventory[x];
			//Remove equipped item from inventory.
			mitzi.inventory.splice(x, 1);
			return true;
		}
	}
	return false;
}

public function dressMitziUpApproach():void
{
	clearOutput();
	showMitzi();
	output("You inform Mitzi that you’re going to pick out something for her to wear.");
	output("\n\n<i>“Oooh, really? Mitzi has like, the best [pc.Master]! Who else would care enough to pretty up [pc.hisHer] favorite sex-toy?”</i>");
	output("\n\n<u>Mitzi has the following outfits available:</u>");
	output("\n(<b>Worn</b>) " + StringUtil.upperCase(mitzi.armor.description));
	processTime(1);
	clearMenu();
	addItemButton(0, mitzi.armor, mitziKeepCurrentOutfit, mitzi.armor);
	for(var x:int = 0; x < mitzi.inventory.length; x++)
	{
		output("\n" + StringUtil.upperCase(mitzi.inventory[x].description));
		addItemButton(x+1, mitzi.inventory[x], mitziPCPickOutfit, mitzi.inventory[x]);
	}
	output("\n\nWhat will you have her wear?");
	addButton(14,"Back",approachCrewMitzi,true);
}

public function mitziKeepCurrentOutfit(arg:ItemSlotClass):void
{
	clearOutput();
	if(!pc.hasStatusEffect("Mitzi Dressed")) pc.createStatusEffect("Mitzi Dressed");
	pc.setStatusMinutes("Mitzi Dressed",24*60*7);
	showMitzi();
	output("You let Mitzi know that she should keep wearing around her [mitzi.armor]. It’s the sexiest outfit she owns.");
	output("\n\n<i>“Omigosh? Really? Okay, [pc.Master], Mitzi will wear it for like... a week! Unless it gets too cummy. Then she’ll lick it clean and wear it again.”</i>");
	output("\n\nThat’s certainly... ");
	if(pc.isBimbo()) output("a sexy");
	else output("an");
	output(" answer.");
	processTime(2);
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",approachCrewMitzi,true);
}
public function mitziPCPickOutfit(arg:ItemSlotClass):void
{
	clearOutput();
	if(!pc.hasStatusEffect("Mitzi Dressed")) pc.createStatusEffect("Mitzi Dressed");
	pc.setStatusMinutes("Mitzi Dressed",24*60*3);
	output("You make your selection.");
	output("\n\n<i>“Ooooh, Mitzi has a lot of fun with that one. She’ll wear it around for days, [pc.Master], all for you.”</i> Her tail affectionately caresses your cheek");
	if(pc.libido() >= 60) output(", and you can't help but give it a quick kiss");
	output(".");
	output(ParseText("\n\nThe bimbo goblin makes a show of peeling out of her [mitzi.armor] and slowly unveiling more and more of her almost perfectly smooth skin. You have to shut down multiple attempts at sex just to keep her simple mind on task, but after the third rejection, she gets the hint and slips into her newly designated slut-wear."));
	mitziEquip(arg);
	output(" <i>“Mmmm, maybe this’ll get you to fuck me. What do you think, [pc.Master]?”</i> Mitzi twirls. <i>“It makes you want to fuck Mitzi to pieces, doesn’t it?”</i>");
	pc.lust(5);
	processTime(2);
	showMitzi();
	clearMenu();
	addButton(0,"Next",approachCrewMitzi,true);
}

//Mitzi crew bonus and approach screen is clothing dependant:
public function mitziCrewBonus():String
{
	var dress:ItemSlotClass = mitziCurrentDress();
	var buff:String = "";
	//Pink dress
	if(dress is MitzisDress)
	{
		buff += "\n\nMitzi is brushing her pigtails, clad in the same pink, latex dress she wore when you met her. It seems to enhance her curves rather than hide them, displaying the highlights of her nipples in shimmering neon. At the sight of you, she puts down the brush and puckers her lips, rolling a layer of heavy, purple gloss across them with deliberate slowness.";
	}
	//Schoolgirl
	else if(dress is SchoolgirlCostume)
	{
		buff += "\n\nMitzi spends her time patrolling the ship in a hyper-sexualized parody of a schoolgirl’s outfit, blowing bubbles and taking selfies. The skirt doesn’t even cover the bottom halves of her quaking buttcheeks, though it happily obscures her perpetually moist slit... most of the time. Her top is a low-cut, white blouse that’s too transparent to hide her braless state. An improperly applied tie and neatly done-up pigtails complete the goblin bimbo’s look.";
	}
	//Yoga pants & microbikini
	else if(dress is MitzisYogaBikini)
	{
		buff += "\n\nMitzi has apparently decided to start doing yoga - and decided the best place to run through her routine of stretches is your ship’s busiest corridor. The green-skinned slut somehow blocks the entire passage with her routine, shifting to lift her ass, just barely shrink-wrapped in too-small yoga pants, in your direction. Her top is a white micro-bikini top that may as well be glued to her stiff nipples. Pink hearts adorn the teeny weeny cloth patches.";
	}
	//Crotchless black bikini
	else if(dress is MitzisSuccBikini)
	{
		buff += "\n\nMitzi casually leans against a bulkhead. Instead of her usual slutwear, she’s opted for a black, crotchless bikini with leather straps. Purple gemstones line the bands, glittering darkly as the emerald curves beneath twist and writhe in apparent ecstasy. Her spaded tail emerges from between her legs, dripping slowly as Mitzi regards you with hungry eyes. You notice the tiny horns on her forehead just then, held in place by a near-transparent band to complete her succubus costume.";
	}
	//Cow
	else if(dress is MitziCowFetishCostume)
	{
		buff += "\n\nMitzi crawls around the ship on all fours. Brownish pads designed to resemble hooves guard her knees while pitch-black socks hide everything behind. Shoulder-length white gloves, marked with patchwork black splotches, compliment her panties and nursing bra. She’s even painted her spaded tail to resemble a puff of brown fur. Anyone can put together a cow-girl costume, but Mitzi takes it to the next level. Trails of dribbling white mark her path, thanks to ";
		if(9999 == 0) buff += "the time you gave her Gush";
		else
		{
			buff += "a ";
			if(CodexManager.entryUnlocked("Gush")) buff += "recent dose of gush";
			else buff += "some sort of lactation drug";
			buff += ". The flow is rapidly slowing";
		}
		buff += ", and every time you hear her moo, the humming of a concealed vibrator cranks up a notch.";
	}
	//Zipsuit
	else if(dress is TransparentZipsuit)
	{
		buff += "\n\nA goblin in a full-body, translucent jumpsuit prowls the confines of your ship, parading her shrink-wrapped body around with nothing but a purr and a smile. When Mitzi sees you, or anyone else, for that matter, her tail slithers around her upper thigh, the spaded tip drawing the eye to feast upon her perpetually aroused nethers. Sometimes she’ll fold her arms under her chest and bounce around blind corners, hoping to slam tit-first the nearest warm body.";
	}
	//Librarian
	else if(dress is MitzisLibrarianOutfit)
	{
		buff += "\n\nYour airheaded gabilani crewmate has taken to spending her time lounging about in the mess, reading something from a banged-up tablet. A pair of wide-rimmed, circular glasses nearly counter Mitzi’s typical vacant stare, and she’s chosen to match them with a laughably undersized vest and skimpy, ink-black skirt. The skirt does nothing to impede one of her hands from climbing up underneath it, and at second glance, you note that the screen is showing hardcore pornography. You wager she’s aiming for the sexy librarian look.";
	}
	//Nun!
	else if(dress is MitziNunFetishCostume)
	{
		buff += "\n\nYour self-titled \"pet goblin\”</i> can be found kneeling in front of your cockpit chair, hands steepled together in something that resembles prayer. Her mouth hangs wide-open in preparation to receive her " + pc.mf("lord’s","mistress’s") + " sexual sacrament. She has chosen to dress herself in the white and black of a nunnery, but like everything Mitzi touches, it’s been tarted up beyond indecency to deep perversion. A plunging neckline filled with cheap, transparent plastic dutifully displays her emerald orbs and the cusps of her dusky nipples. From the waist down, the rest of the garment tapers to a scanty ‘v,’ revealing Mitzi’s plump pussy through the too-thin fabric. Every fold and crease is plain to see, promising a heavenly sanctuary to any who dare enter.";
	}
	//Custom dresses~!
	else
	{
		if(rand(2) == 0)
		{
			buff += "\n\nMitzi is posing in front of a mirror, wearing the [mitzi.armor] you gave her. ";
			if(mitzi.isChestExposed()) buff += "She delights in exposing her enormous mammaries, twisting about and smushing them together with her arms to create an endless line of cleavage. With no fabric in the way, she’s free to rub her nipples whenever the urge strikes her - which is most of the time.";
			else buff += "She leans this way and that, strutting and adjusting to maximize the display of her pendulous breasts, even if her new garments keep her sensitive nipples tucked away.";
			if(mitzi.isAssExposed()) buff += " There’s not a single stitch to obscure her callipygian ass, nor her roving tail. The spaded tip slaps one cheek then the other, drawing gasps of delight from its lazily grinning host.";
			else buff += " No amount of clothing could completely conceal her callipygian ass, something Mitzi’s tail seems quite pleased by. It alternates slapping at her cheeks, drawing gasps of delight from its lazily grinning host.";
			buff += " The green-skinned strumpet smiles at her reflection and runs her fingertips along the [mitzi.armor], proud to wear your gift.";
		}
		else
		{
			buff += "\n\nMitzi is putting on an impromptu fashion shoot in her quarters. Time and time again, she picks up her banged-up tablet and poses, pressing her lips together for best effect before snapping a selfie. In each and every shot, she’s doing her best to display the [mitzi.armor] you gave her, whether by wiggling her juicy ass at the camera or leaning down to heighten the apparent size of her ";
			if(silly) buff += "magnum mounds";
			else buff += "pillowy tits";
			buff += ". When she’s not snapping the pictures, she’s inspecting them, applying filters and weeding any unsuitable to for later mailing to her [pc.master].";
		}
	}
	return buff;
}

public function approachCrewMitzi(back:Boolean = false):void
{
	clearOutput();
	showMitzi();
	if(back)
	{
		output("Mitzi watches you adoringly. <i>“So, you wanna fuck now or something?”</i>");
		mitziCrewMenu();
		return;
	}
	var dressString:ItemSlotClass = mitziCurrentDress();
	//Pink dress
	if(dressString is MitzisDress)
	{
		if(rand(2) == 0) output("<i>“Heya, [pc.Master],”</i> Mitzi chirps before you can so much as say ‘hi.’ <i>“Didja get bored, being all noble an’ heroic, and want to just bang Mitzi brainless for a few hours?”</i> She clutches at the hem of her dress excitedly and wiggles her hips.");
		else output("<i>“Hi there, [pc.MisterMiss] Awesome!”</i> Mitzi shimmies up to press herself against you, one hand stroking the small of your back while the other winds toward your loins. <i>“Mitzi missed you...”</i> She squirms, rubbing her thighs together. <i>“Want to fuck? Just a quickie. Mitzi knowwws how busy her [pc.Master] is. She’ll make it quick.”</i> In a panic, she adds, <i>“But-it’ll-still-feel-supergood!”</i>");
	}
	//Schoolgirl
	else if(dressString is SchoolgirlCostume)
	{
		if(rand(2) == 0) output("<i>“Mmmm,”</i> Mitzi coos, sucking a lollipop into her mouth. She pops it out a second later, stripped bare to the stalk. <i>“You wanna go fuck behind the drive core?”</i> She fans herself momentarily. <i>“Just bend me over and flip up my skirt. Nobody will see.”</i> She pops a beat-up codex out of... somewhere. <i>“Except for you, when you fuck Mitzi while we watch the holo.”</i>");

		else output("<i>“Hey there, hot stuff.”</i> Mitzi jumps into your arms, scissoring her legs around your waist so that the jiggly globes of her ass are resting against your groin. <i>“Knew you couldn’t stay away. You’re like... a-dick-ted to little ol’ Mitzi, aren’t you?”</i> She kisses you, grinding her bare ass into your crotch for a long moment. When she finally lets you go, you feel dizzy and horny. <i>“Why don’t you take me right here, where the ship cams can see?”</i>");
	}
	//Yoga pants & microbikini
	else if(dressString is MitzisYogaBikini)
	{
		if(rand(2) == 0) 
		{
			output("The limbered-up greenskin is on her feet and in your face before you can so much as call her name. <i>“Hiya, [pc.Mister] [pc.Master]! You wanna see how flexible I’ve gotten?”</i>\n\nHer tone leaves no doubt in your mind that she’s going to show you regardless. <i>“Sure.”</i>\n\n<i>“Watch thiiiis!”</i> Mitzi lifts one leg, balancing expertly, and grabs hold of it behind the ankle. With seeming ease, she raises it over her head until she’s doing a standing split");
			if(pc.tallness >= 6*12) output(" and wiggling her toes against your groin.");
			else if(pc.tallness >= 5*12) output(" and blowing kisses toward your groin.");
			else output(" and gently fondling your groin with her free hand.");
			output(" <i>“Just imagine how you can bend me around in the bedroom.”</i>");
		}
		else 
		{
			output("<i>“Hey!”</i> Mitzi calls at you before you can come a step closer. <i>“Are you like, peeping on Mitzi’s workout routine.”</i> She stomps up, arms waving in hilariously over-acted anger until she bumps her top hard enough to dislodge a bikini cup. <i>“Oopsie! Now my boob’s fallen out... and I’m sooo tired from all that yoga. Since it’s your fault, do you think you could help Mitzi?”</i> She shrugs her shoulders, making the unsupported breast bounce all the harder.\n\nYou play along and ");
			if(pc.isBimbo() || pc.isBro() || pc.taint() >= 66) output("make sure to rub her nipple until it gets and fat... then tuck it away under her bikini.");
			else 
			{
				output("assist her in slipping her nips away");
				if(pc.isMischievous() || pc.libido() >= 70) output(", getting a nice grope in for your efforts.");
				output("\n\n<i>“Ahhh~! Thanks, [pc.Master]. Now, if you wanted to watch Mitzi, you could have like, just asked!”</i>");
			}
		}
	}
	//Crotchless black bikini
	else if(dressString is MitzisSuccBikini)
	{
		if(rand(2) == 0) output("<i>“What a yummy looking morsel we have here,”</i> Mitzi throatily purrs the moment you give her the smallest inkling of attention. She stalks forward, soaked tail waving menacingly behind her. <i>“I’ve been so hungry without you, so aching and empty.”</i> The pretend succubus strokes her curvaceous body. <i>“Mitzi needs your sin. Just a little.”</i> She nibbles at a sensuously thick lip and gazes up at you imploringly. <i>“It’ll feel sooo good.”</i>\n\nShe really takes these outfits seriously...");
		else 
		{
			output("<i>“[pc.Master]!”</i> Mitzi calls. <i>“Isn’t this outfit, like the best?”</i> She twirls, spaded tail flinging droplets of pussyjuice everywhere. <i>“Mitzi’s body is already made for sex. She should dress the part, don’t you think?”</i> She prances forward to lean against your thigh, one hand unashamedly sliding across your [pc.skinFurScales]. <i>“She’s just like a succubus. She’s so </i>hot<i> that you get ");
			if(pc.hasCock()) output("all hard");
			else if(pc.hasVagina()) output("all wet");
			else output("all dizzy");
			output(" around her, and she needs fucking </i>all the time<i>.”</i> An impish smile spreads over her inhuman features. <i>“So why don’t you... feed your pet succubus.”</i>");
		}
	}
	//Cow
	else if(dressString is MitziCowFetishCostume)
	{
		if(rand(2) == 0)
		{
			output("<i>“Moo!”</i> the cow-disguised goblin proudly declares.\n\nYou tilt your head in confusion, not quite getting what she’s supposed to be communicating.");
			if(pc.bovineScore() >= 3)
			{
				output(" You suppose it would be kind of offensive");
				if(pc.isTreated()) output(" if you didn’t moo fairly often yourself.");
				else output(" if she wasn’t too dumb to know any better.");
			}
			output("\n\n<i>“Mitzi’s a cow-girl!”</i> the debased bimbo explains as if you were too dumb to understand her outfit. <i>“She’s been so good and so moo-milky");

			if(!mitzi.canLactate()) output(", but [pc.Master] still didn’t fuck her enough!”</i> Pulling herself up onto her knees, she squeezes her tits. Thin trails of creamy gabilani milk sputter out onto the deck for a moment before drizzling to a stop. <i>“And now Mitzi’s all out of ma-moo-milk! That means it’s time to breed the cow, right?”</i>\n\nHer vibrator slips out of her now that she’s upright. It buzzes for a second, then powers down.");
			else output(", but [pc.Master] doesn't give her enough Gush!”</i> Pulling herself up onto her knees, she squeezes her tits, hosing out a wave of milk. <i>“Mitzi wants to be a milky Mitzi-Cow for [pc.Master]! That means drugging and breeding until her brains squirt out of her big sexy cow-tits, right?”</i>\n\nHer vibrator slips out of her now that she’s upright. It buzzes for a second, then powers down.");
		}
		else
		{
			output("Mitzi moos in distress and climbs up onto her knees. <i>“Oh nooo! Mitzi’s all out of ma-moo-milk!”</i> Sure enough, her steadily drizzling teets wind down to a slow, creamy trickle. <i>“But that means it’s time to breed the cow, doesn’t it, [pc.Master]?”</i> She rounds on you, her knee-pads making clopping sounds as she wobbles up. <i>“When a dumb cow like Mitzi runs out of milk, she gets to fuck and fuck until she makes more, right?”</i>\n\nYou fumble for an answer.\n\n<i>“Or did you want to do something else do dumb-cow Mitzi-slut? Mitzi’s such a good girl. She’ll do anything.”</i> She pulls the vibrator out of her pussy and sucks the cunt-juice off of it. <i>“Anything.”</i>");
		}
	}
	//Zipsuit
	else if(dressString is TransparentZipsuit)
	{
		if(rand(2) == 0)
		{
			output("<i>“Hiiii, [pc.Master],”</i> Mitzi titters. <i>“See anything you like on your travels?”</i> She laces her fingers behind her back, thrusting her bosom forward, and wiggles in place. <i>“Anything at all?”</i> Green nipples jut accusingly at you from plastic-encased mounds of jiggling jello.\n\nYou’re certainly seeing something...\n\n<i>“Mitzi’s been all over this ship, and she’s found something very interesting.”</i> Sidling forward with an impish smile, the perky goblin fuck-toy presses herself adoringly against you. <i>“And she wants to play with it...”</i>");
		}
		else
		{
			output("<i>“Help!”</i> Mitzi calls, grabbing you by the hand. <i>“Mitzi put herself in this super sexy zipsuit, but she can’t get the zipper down to masturbate! Her pussy is like, super wet, but she can’t even finger herself, and it’s getting so wet down there! Could you like, fuck a hole in it, or whatever? You’re so smart, [pc.Master]. You’ll figure out a way to fuck Mitzi, right?”</i>\n\nThe zip mechanism is completely intact and undamaged.  Mitzi isn’t even trying to use it; instead she’s busy rubbing her pussy through the plastic hard enough for the squelches to echo down the passage.");
		}
	}
	//Librarian
	else if(dressString is MitzisLibrarianOutfit)
	{
		if(rand(2) == 0)
		{
			output("<i>“Hello [pc.Master],”</i> Mitzi curtly greets you. <i>“Is there some pornography you’d like to watch?”</i> She gestures to her codex with a sticky-fingered hand. <i>“Perhaps a hot, green, bitch you’d like  to ");
			if(pc.hasCock()) output("fuck ten times past pregnant");
			else if(pc.hasVagina()) output("pin to the deck with your pussy");
			else output("watch masturbate entirely for your amusement");
			output("? These glasses would totally look amazing buried under a nice, thick layer of cum, doncha think?”</i> She taps at the cosmetic frames and licks her lips. <i>“Or maybe you’re more interested the selection Mitzi has out back?”</i> She lifts the back of her skirt and spreads her cheeks, giving you a clear view of her clenching asshole.");
		}
		else
		{
			output("Mitzi doesn’t notice your approach until you’re standing right behind her. On her screen is a recording of you naked and masturbating.\n\n<i>“Where’d you get that?”</i>\n\nNearly jumping out of her seat, the goblin feverishly closes the app, paying for her haste by leaving half a dozen pussy-scented smudges on the screen. <i>“Mmm? Just researching s’all! Mitzi needs to know how to please her [pc.Master] better than anyone else - even [pc.himHer]! Turns out Mitzi’s still pretty good with cummy-puters for pornostuff! You wanna make a holo? Mitzi’ll study it suuuper hard after.”</i>");
		}
	}
	//Nun!
	else if(dressString is MitziNunFetishCostume)
	{
		if(rand(2) == 0)
		{
			output("<i>“Welcome, holy [pc.Master], savior of dumb goblin sluts, bringer of orgasms. Sexy is thy name.”</i> Mitzi opens her eyes and smiles radiantly, lips still ");
			if(pc.hasCock()) output("pursed in readiness for a deep dicking");
			else if(pc.hasVagina()) output("pursed and ready to press against a slit at a moment’s notice");
			else output("pursed and pretty");
			output(". <i>“Have a seat,”</i> she says with a gesture to your chair. <i>“What troubles you today, [pc.Master]? Is it lust? Impure thoughts?”</i> She squirms. <i>“Mitzi will absorb all your naughty sins, with her mouth, or pussy, or ass... or titties. Oooh, she’d look so hot getting banged in this costume!”</i> The green skinned trollop slips out of character the moment she starts fantasizing about all the ways you can bang her.");
		}
		else
		{
			output("Revealed by her slowly lifting eyelids, Mitzi’s heart-shaped eyes widen in delight at the sight of you. <i>“[pc.Master]! You came! Mitzi knew that if she prayed long and hard enough, you’d bless her with your presence. Did you... did you want to use Mitzi’s mouth?”</i> She runs her tongue around the circumference of her lips with deliberate slowness, heart-shaped pupils staring up adoringly.");
		}
	}
	//Custom dresses~!
	else
	{
		if(rand(2) == 0)
		{
			if(rand(2) == 0) output("Spotting you in the mirror, Mitzi pivots and waves. <i>“Hiya, [pc.Master]! Mitzi was just looking in the mirror and wanted to tell you just how much she loooved your present!”</i> Prancing forward with the grace of a fleet-footed deer, she stops just short of bouncing into your [pc.legs] and does a little spin-and-twirl. <i>“Whenever Mitzi looks in the mirror, she can’t help but just be like, so goddamn happy to be your fuck-bait, because you actually cared enough to dress her up pretty!”</i>");
			else output("Mitzi starts at your sudden appearance. <i>“Oh! Hiya! Mitzi was just like, admiring the pretty clothing you gave her! Did you like dressing her up like this? Treating her like a pretty, slutty little doll? You could undress her too, you know. Or show her off to the whole extranet.”</i> Her tail swishes playfully behind. <i>“Just let her know.”</i>");
		}
		else
		{
			if(rand(2) == 0) output("Mitzi spins around and puckers, snapping a half-dozen pictures of herself with you in frame over her shoulder. <i>“Mmm... we look good together, [pc.Master], but we’d look even better tangled up in bed.”</i> She giggles vapidly. <i>“You wanna make a holo or somethin’?”</i>");
			else 
			{
				output("<i>“Hiya [pc.Mister] [pc.Master]! Did you want a copy of these pics? Mitzi got some that make her look totally fuckable.”</i> The brain-drained bimbo holds up the tablet to show you. It’s a smorgasbord of titillation and debaucher, including more than a few pictures of exposed nipples or a soaked pubic mound. <i>“It’s your fault. You’re the one that dressed her up so hot! It’s no wonder you’re getting all ");
				if(pc.hasCock()) output("hard");
				else output("blushy");
				output(" now!");
				if(pc.hasCock()) output("”</i> She sniffs. <i>“She can smell your [pc.cocks] getting hot and bothered.");
				output(" There’s nothing to be ashamed of. Just pick me up and fuck me however you want.”</i>");
			}
		}
	}
	processTime(1);
	pc.lust(3);
	mitziCrewMenu();
}

public function mitziCrewMenu():void
{
	clearMenu();
	//Reset Mitzi's clothing change timer so long as the PC is interacting with her~
	if(!pc.hasStatusEffect("Mitzi Dressed")) pc.createStatusEffect("Mitzi Dressed");
	if(pc.getStatusMinutes("Mitzi Dressed") < 120) pc.setStatusMinutes("Mitzi Dressed",120);
	addButton(0,"Appearance",mitziAppearance);
	addButton(1,"Talk",talkToMitzi);
	if(pc.lust() >= 33) addButton(2,"Sex",mitziCrewSexApproach);
	else addDisabledButton(2,"Sex","Sex","You aren't turned on enough for this.");
	addButton(3,"Dress Her",dressMitziUpApproach,undefined,"Dress Her","Help Mitzi pick out her wardrobe.");
	addButton(14,"Back",crew);
}

//Appearance Screen
public function mitziAppearance():void
{
	clearOutput();
	showMitzi();
	author("Fenoxo");
	output("Mitzi rarely stands still unless it is to pose provocatively. Fortunately when the curvaceous cutie realizes that she is squarely fixed in your gaze, she does just that, cocking a hip and favoring you with a smoldering smile. To call the green-skinned gabilani over-sexualized would be an understatement. From her long, heavy lashes to her plush, angel-bow lips she radiates the kind of crass sensuality that high class prostitutes strive to embody. Bright pink, heart-shaped pupils stare back at you imploringly, begging you to finish your ocular exploration and ravish her for real.");
	output("\n\nShifting slightly, the self-described goblin sets her purple pigtails, and her tits, bouncing.");
	if(!mitzi.isChestExposed()) 
	{
		output(" The latter are barely contained by her [mitzi.chestCovers]. Mitzi’s outsized chest could make a pair of industrial wheelbarrows creak. It’s a wonder the clothing can hold together at all. Those K-cup knockers beg to be squeezed, and from the way the smirking bimbo keeps them jostling around, she knows.");
		if(mitzi.isChestVisible()) output(" Jutting tit-tips lewdly distend her transparent garment, intent that you know every crease along their pebbly surface.");
	}
	else output("The latter are completely uncovered by her choice of attire, free to wobble and jostle in cleavage defining clashes. Those K-cup knockers seem like two emerald mountains, their summits crowned by sensitive, jutting tips whose perpetual hardness never seems to flag. Mitzi’s outsized chest could be wrapped up in the most chaste blouse, and the mammoth mounds’ libidinous squeezability would shine through as clear as daylight.");
	output(" If you were small enough to squeeze under her 3’6”</i> frame, you could comfortable shelter beneath the physics-defying bosom.");

	output("\n\nNo exploration of the viridian bimbo’s body would be complete without the long moments it takes your view to slide along the outlandishly bubbly expansive of her ass. She cocks her hip the other way when she sees you looking, sending the pillowy buttcheeks rolling.");
	if(!mitzi.isAssExposed()) output(" A glimpse between the clapping callipygean orbs reveals a pristine pucker of the same vibrant green as its owner.");
	else if(mitzi.isAssVisible()) output(" While you can see through her choice of transparent clothing, you can't glimpse the pucker beyond. Those colossal callipygean orbs are too firmly squeezed together to grant a peek between.");
	else
	{
		output(" While you can’t see past her [pc.assCover] to view her pucker directly, ");
		if(flags["9999"] != "anal") output("you can only assume it is as engineered for sex as the rest of its owner.");
		else output("you know all too well that’s flawless and unblemished, almost brighter green than the rest of its owner.");
	}
	output(" A hind-end of such monumental magnitude would look absurd on anyone with normal bone-structure, but Mitzi’s hips are built like a freighter’s back-end, lending her more than ample room to sprout galaxy-class ass.");
	//Crotch exposed
	if(mitzi.isCrotchExposed() || mitzi.isCrotchVisible()) output("\n\nHow fortunate that your fuck-slave’s current clothing does nothing to conceal the sopping treasure between her thighs! When she spreads her breedable thighs apart, Mitzi’s box leaps into view. No matter what time of day, morning, or night, her incessant arousal ensures that her vulva remains plump and puffy. A sheen arousal slicks the inner lips, and the hyper-developed nub of her clitoris consistently peeks out in search of a caress, something Mitzi is all too happy to offer it.");
	//Can’t see, havent fucked it.
	else if(flags["MITZI_FUCKED"] == undefined) output("\n\nWhile you can’t see between your fuck-slave’s thighs thanks to her current outfit, you can only assume that the feminine treasure between is every bit as libidinous and willing as the rest of her.");
	//Can’t see it, have fucked it
	else output("\n\nWhile you can’t see between your fuck-slave’s thighs thanks to her current outfit, you’ve spent too long up close and personal with it to forget about it. The vulva is eternally plump with lust, slicked by beads of clear arousal at any time of the day or night. Its lusty sheen begs the viewer to lean closer, and a hyper-developed clitoris stands proudly out of its hood in search of a finger or tongue willing to bless its super-charged nerves with the a touch.");
	//Merge
	output("\n\nA spaded tail whips out to press against your chest");
	if(!pc.isChestExposed())
	{
		if(pc.biggestTitSize() >= 3) output(", sliding meaningfully up your cleavage");
		else output(", sliding meaningfully across your [pc.skinFurScalesNoun]");
	}
	else output(", sliding meaningfully across your still-dressed chest");
	output(". From this angle, it looks almost heart-shaped, an idea reinforced by Mitzi’s skin brightening to pink at it’s edge. The affectionate attachment slithers up your neck to gently caress your chin. You can feel her heart excitedly beating through the soft skin as it slides higher still, only to yank away before it brushes your lips.");
	output("\n\n<i>“Are you like, done looking now [pc.Master]? All this staring is getting Mitzi so horny!”</i>");
	if(mitzi.armor is MitzisSuccBikini) output(" The giggling goblin points at the petite horns that jut from her forehead.");
	else output(" The giggling goblin gestures to her chest. Horny indeed.");
	pc.lust(5);
	processTime(2);
	clearMenu();
	addButton(0,"Next",approachCrewMitzi,true);
}

public function mitziCrewSexApproach():void
{
	clearOutput();
	showMitzi();
	output("You signal that you’d like to make use of the goblin’s talents.");
	output("\n\n<i>“Really? You’re gonna fuck Mitzi?”</i> She quivers like a wound spring. <i>“You’re gonna play with Mitzi until she passes out between her [pc.Master]’s crotch? How? How are you gonna do it? Are you going to-”</i> Mitzi bites her lips and stifles a moan. <i>“Just do it. Me. Fuck.”</i>");
	mitziSexMenu();
}

public function mitziSexMenu():void
{
	clearMenu();
	if(pc.hasCock()) 
	{
		if(pc.cockThatFits(mitzi.vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",fuckMitziJustLikeInCoC);
		else addDisabledButton(0,"Fuck Her","Fuck Her","Stretchy as she is, even Mitzi's modded body has limits.");
		addButton(2,"Titfuck",goblinTittyfuckoo);
	}
	else 
	{
		addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis for this kind of sex.");
		addDisabledButton(2,"Titfuck","Titfuck","You need a penis to titfuck her.");
	}
	if(pc.hasVagina()) addButton(1,"Get Licked",getLickedByMitzi);
	else addDisabledButton(1,"Get Licked","Get Licked","You need a vagina for this.");

	addButton(14,"Back",approachCrewMitzi,true);
}
/*output("\n\nMitzi Wakes You Up");
output("\n\nA slowly fading wave of pleasure accompanies you all the way back to the waking world. As your [pc.hips] slide back down onto the mattress, you blink the sleep from your eyes and look down to discover Mitzi’s lips easing slowly off of your length. She opens wide to show you the [pc.cumGem] lake in her mouth before swallowing{, then rubs {massively }inflated belly with a happy little sigh}. <i>“{Yummy! Now you won’t need to waste any cum on dumb alien sluts. If you get too horny, you can just come back here and bang Mitzi to sleep!/Mmm, thanks for breakfast [pc.Master]! All set to go exploring! Let Mitzi know if you need help filling back up with lots of sperm, okay?/Ahhh! That hits the spot. You don’t have to like, leave if you don’t want to. Mitzi could fill your {balls/cock} back up with a fresh load if you asked.”</i> She kisses your [pc.sheathOrKnot]. <i>“Just ask./Oooh! I think I came a little bit. [pc.Master]’s cummies are always the best! Mitzi thinks your [pc.cockNoun] is falling in love.”</i> She preens. <i>“It always perks up for her./Yum-yum-yummy-in-slut-tummy! Mmmph! That’s like, the best breakfast in the uni...univ...world! Let Mitzi know if the cum might overflow, ‘kay?}”</i>");
output("\n\nYou’re a little too tired to do much but nod and send the {cum-bubble of a goblin/cum-inflated goblin/cum-stuffed goblin/cum-hungry goblin} on her way. What a way to start a day!");
output("\n\nMitzi Wakes Up Girls");
output("\n\nCrests of pleasure, rising and falling, fill whole days worth of dreams. When you finally do manage to climb back to the waking world, it’s on the heels of a slow, rolling climax that makes your [pc.thighs] bonelessly quiver. Your voice hitches in a wordless sigh of pleasure. As your [pc.hips] relax, you look down to discover Mitzi’s tongue slowly sliding free of [pc.oneCunt]. She opens wide to show you all the [pc.girlCum] she’s collected.{ There’s far more than you would have expected. She’s been saving it for a long time./ There’s was more than you would have expected, judging by the trickles dried onto the sides of her chin./ There was clearly more than she expected, judging by the puddle in the sheets below./ There was clearly more than she could have expected, judging by her pudgy middle.}");
output("\n\n<i>“Morning, [pc.Master]!”</i>");
output("\n\nYou sit up onto your elbows and greet Mitzi{, like always}. <i>“Morning, {hottie!/slut./cutie./gorgeous/pussy-slut.}”</i>");
output("\n\n<i>“Did [pc.Master] have sweet dreams?”</i> Mitzi climbs up next to you{, lapping at all the spilt [pc.cum] she couldn’t get at from down there/ with a wink and a smile}. Her eyes shine with absolute, sublime delight. <i>“{[pc.Master] has the sweetest pussy./All ready for adventures now!/[pc.Master] has such a yummy cunny!/[pc.Master]’s pussy is totally falling for Mitzi.”</i> She giggles. <i>“Don’t worry little pussy. Mitzi will lick you again tomorrow. Or now, if Mistress wants.}”</i>");
output("\n\nYou’re too tired to do much but smile and let the muff-hungry goblin curl up into bed once you vacate it. Adventure calls!");
output("\n\nMitzi Drains TiTS Wake-Up:");
output("\n\nA sense of pulsating, mounting relief greets your return to the waking world - not from your nethers but from your [pc.nipples]. Mitzi is latched onto one, suckling you dry so gently that you’re surprised you woke at all. Her plush lips make a perfect seal, and her gently bobbing gullet sucks away your [pc.milk] with whisper-quiet efficiency. If you let her, she’d probably suckle you past the point of dryness.");
output("\n\nYou shift, gently dislodging the slutty tit-milker, and {make ready to start the day.\n\nMitzi helps you gather your things with a hopeful smile that doesn’t go away until you give her a ‘good girl’ head-pat./wonder what you should do about this. You’ll never stop lactating if Mitzi keeps milking you like this, but that might be kind of nice - you could start every morning fresh and light, then stagger home with a heavy load of cream for the goblin to harvest. And if you change your mind later, you can always talk to her about it.}");

output("\n\n[Good job]");
output("\n\nYou give Mitzi a gentle head-pat and tell her she did a good job.");
output("\n\n<i>“Thank you, [pc.Master].”</i> Mitzi beams and wraps you up in a big hug. <i>“That’s all Mitzi wants! To help... and maybe fuck sometimes. A lot."\n\nYou smile and pat her on the head for her troubles, an action that nearly makes the goblin melt. You’ll have to remember that.");

output("\n\n[Not Again]");
output("\n\nYou shake your head sternly at Mitzi and tell her that you don’t want her sucking on your [pc.chest] while you sleep.");
output("\n\n<i>“But... what about the milkies?”</i> Mitzi seems confounded. <i>“Doesn’t it hurt?”</i>");
output("\n\nYou explain that you’ll decide if and when anyone gets to drink your [pc.milk], whether it hurts or not. <i>“Got it?”</i>");
output("\n\nMitzi pouts. <i>“O-okay. If [pc.Master] is sure, Mitzi will try to be good. Sorry she is such a dumb, stupid bitch-cunt.”</i> She runs from the room in a tizzy.\n\nBy the time you’re dressed, you can hear her moaning from elsewhere in the ship, sadness long since exchanged for arousal. At least she’s fairly resilient... but she’d have to be, with what she’s been through.");
*/

public function talkToMitzi():void
{
	clearOutput();
	showMitzi();
	output("The little goblin seems more interested in talking than fucking, but if you have question, you’re sure she’ll answer them.");
	clearMenu();
	addButton(0,"Bimboed?",whatHappenedToMitzi);
	if(flags["MITZI_BIMBO_TALK"] == 1) addButton(1,"Your Body?",talkToMitziAboutHerBody);
	else addDisabledButton(1,"Your Body?","Your Body?","Maybe start out with how she turned into a bimbo...");
	if(flags["MITZI_BODY_TALK"] == 1) addButton(2,"Fav.Drug?",favoriteDrugMitzi);
	else addDisabledButton(2,"Fav. Drug?","Favorite Drug?","You don't know about Mitzi's drug use yet.");
	if(flags["MITZI_FAV_DRUG"]  == 1) addButton(3,"Aphrodisiacs",mitziAphrodisiacTalk);
	else addDisabledButton(3,"Aphrodisiacs","Aphrodisiacs","You'd need to know about Mitzi's drug usage first.");
	addButton(14,"Back",approachCrewMitzi,true);
}

//What Happened To You?
public function whatHappenedToMitzi():void
{
	clearOutput();
	showMitzi();
	output("You ask Mitzi if she can repeat the story of how she got bimbofied in the first place.");
	output("\n\n<i>“[pc.Master]... you didn’t get all dumb-fucky did you? ‘Cause Mitzi already told you about this! The mean ol’ dick-pirate jabbed her with a needle, an’ then fucked her so hard Mitzi fell asleep. And then when Mitzi woke up, [pc.Master] helped her escape! She didn’t know it was dumbfuck in the needle though, so when she started masturbating, she didn’t want to stop, and then she sneezed and sneezed... and sneezed. Each time made Mitzi’s slit feel better and better... by the time she stopped, thinking about machines and stuff was just like... bluh! Too hard. But instead she could think about all the best spots to touch her pussy, and like, how to make the orgasm last as long as possible.”</i>");
	output("\n\nYou express your condolences, but Mitzi doesn’t seem to mind.");
	output("\n\n<i>“It’s not your fault! You’re the one person that cared enough to help, even before Mitzi got this fuckable.”</i> The emerald slut grabs her enormous breasts and squeezes them fondly. <i>“Besides, Mitzi found </i>you.<i> Who cares if like, thinking about elecci-trical flux is worse than watching grass grow. Every part of Mitzi feels so good now. Just playing with her nipples is almost as good an entire old-Mitzi fuck. And getting mad is so hard that like, you can pull my pig-tails and I'll still be smiling and asking for more! Mitzi likes being happy!”</i>");
	output("\n\nWell, that’s good to know. The way she spoke seemed to indicate that her ‘getting all sexy’ came separately from the mental transformation. She’d probably tell you if you asked.");
	flags["MITZI_BIMBO_TALK"] = 1;
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToMitzi);
}

//Your Body?
public function talkToMitziAboutHerBody():void
{
	clearOutput();
	showMitzi();
	output("You ask Mitzi what happened to her body. She wasn’t stacked like that when you originally saw her.");
	output("\n\n<i>“Oooh, somebody wants to know the secret to Mitzi’s mega-tits?”</i> The big-breasted goblin ");
	if(!mitzi.isChestExposed()) output("slides her hands under her top and ");
	output("tugs at her teats, moaning for your benefit. <i>“So like... Mitzi’s mind was a raging super-slut, but she had a boring gabi...goblin body. But that’s fine! There was a really cool ausar that stopped at Novahome, and after Mitzi sucked his dick four or five times, he agreed to let her ride with him around a while.”</i>");
	output("\n\nYou pointedly point out that she still hasn’t said anything about her body.");
	output("\n\n<i>“Patience, [pc.Master]. Good girls cum for those who wait!”</i> Mitzi tugs her nipples harder, making her pinkish eyes roll halfway back before remembering to talk. <i>“Right, so Yarlowe’s other fuck-sluts were all cute mouse-girls with enormous titties and the cutest, longest tongues, and after they finished teaching Mitzi the best ways to suck his cock, they helped Mitzi with some mods from old-master’s stash. He had so many fun drugs to try... Mitzi might have broke her brain a little with some of them, but a lot of them were like, great for growing big tits and getting a fuckable mouth.”</i>");
	output("\n\nYou raise an eyebrow. <i>“You hitched a ride with a drug dealer?”</i>");
	output("\n\n<i>“Uhhh...”</i> Mitzi shrugs. <i>“Probably? Mitzi mostly just hung around the cargo fucking Peachy and Pauline when old-master left the ship. Sometimes old-master would make Mitzi try drugs nobody tried yet, then fuck her while her boobies grew and her pussy clenched. It was amazing. Gush is so much fun, ohmygod.”</i> Mitzi moans, hands sliding down her middle to disappear into her sex. <i>“Some of the stuff made Mitzi’s eyes look super pretty. And sometimes Mitzi forgot how to walk for a while, but then she got a sexy tail and a tongue long enough to clean [pc.Master]’s tonsils.”</i>");
	output("\n\n<i>“Wow.”</i>");
	output("\n\n<i>“Mmmmmmm,”</i> Mitzi shudders in sudden climax. <i>“Sooo hot. Anyway, after like, a bunch of stops at Tavros, Mitzi remembered that she wanted to get off there and left. Peachy and Pauline thought old-master would be super sad, but he totally said he’d drop Mitzi off there forever ago! And then Mitzi found [pc.Master], and even though she can’t get high and eat mouse-pussy all day, everything is awesome. The end!”</i> Licking her fingers clean, the goblin smiles happily at you. <i>“Lookat how wet Mitzi’s pussy got!”</i>");
	output("\n\nJudging by the moisture running down her wrist, she got very wet indeed.");
	processTime(6);
	flags["MITZI_BODY_TALK"] = 1;
	clearMenu();
	addButton(0,"Next",talkToMitzi);
}

//Fav Drug?
public function favoriteDrugMitzi():void
{
	clearOutput();
	showMitzi();
	output("You ask Mitzi if she had a favorite drug.");
	output("\n\n<i>“Umm... Gush, prolly. Maybe Soak. Mitzi gets real stupid on both of ‘em.”</i> She nods so vigorously that you have to wonder if she can think at all on either. <i>“With Gush, my boobs start getting all hot and tingly, like they’re so sensitive and so turned-on that all Mitzi can think about is her sweet tits and how great they feel. Then it’s like this warm, slow buzz that squeezes out all of Mitzi’s thoughts whenever the milk starts to dribble.”</i> Mitzi leans close and whispers, <i>“A good milking makes her an empty-headed goblin-moo. She totally forgot her name once, and it wasn’t until she stopped laccy-tating that she remembered her name wasn’t Booby-Bitch.”</i>");
	output("\n\n");
	if(pc.isBimbo() || pc.isBro()) output("Fuuuuck, that’s hot as hell. You know you should feel a little bad for her, but there’s something to be said for a girl who can milk herself into sub-sapiance.");
	else output("You aren’t sure whether to be horrified or aroused by such a story.");
	output(" Still, your curiosity has been piqued. <i>“What about Soak?”</i>");
	output("\n\nMitzi’s eyes light up. <i>“Mitzi loooves Soak.”</i> She pats her crotch. <i>“So Soak is sorta like Throbb for girls. So instead of getting big, dumb boners, we get super wet and fertile. And when you first take it, your pussy feel really, really weird. Everything gets all puffy and swollen and almost rubbery looking, especially once the drooling starts. You’ll feel it happening, and you just can’t help but get wet enough to ride a tribe of raskvel. Oh! And the drool comes out of your mouth too. Mitzi doesn’t know why, but once you dose a little Soak, juices come out of everywhere!”</i>");
	output("\n\nThat sounds sort of uncomfortable.");
	output("\n\n<i>“Mmmm, it would be,”</i> Mitzi replies, <i>“But you get so sensitive all over that it hurts </i>not<i> to be wet, and it feels so good when something slides against you. Even better when you have some cum to mix in.”</i> She makes a trilling sound of delight in the back of her throat. <i>“Anyway, you sort of get fasci-fascin...obsessed , spreading it around, like your brain can’t handle what’s going on. Instead of panicking or whatever, it just sort of... soaks in it. Lets your pussy do the thinking, so you can slip, and slide, and smear cock-juice onto your face for hours and hours.”</i>");
	output("\n\nA dreamy sigh escapes the goblin’s lips. <i>“Mitzi will show [pc.Master] if he can get her some. She should’ve taken Yarlowe’s with the other stuff.”</i>");
	flags["MITZI_FAV_DRUG"] = 1;
	processTime(7);
	clearMenu();
	addButton(0,"Next",talkToMitzi);
}

//Aphrodisiacs
public function mitziAphrodisiacTalk():void
{
	clearOutput();
	showMitzi();
	output("You ask Mitzi about her stockpile of mutagens and aphrodisiacs.");
	output("\n\n<i>“Stole from Yarlowe!”</i> Mitzi beams. <i>“Old-master had lots and lots and lots of drugs, so Mitzi filled up a big bag with ones she thought [pc.name] would like to play with. Stuff that wouldn’t like, fuck [pc.name] as hard as Mitzi. Why? Does [pc.Master] need a pick-me-up?”</i>");
	output("\n\n<i>“Not right now, no.”</i>");
	output("\n\n<i>“Okay, good.”</i> Mitzi pats your leg affectionately. <i>“Mostly got rich-boy party-stuff like ‘Breed-Plus’ and ‘Swell-Nite’ and ‘Relaxxx.’”</i> The way she says it makes it clear there’s three ‘X’s in the name. <i>“Anything to help Mitzi be [pc.Master]’s favorite fuck-toy, you know?”</i> She stretches up to hug as much of you as she can, her titanic breasts wobbling against you. <i>“She just wants you to keep being the best Rusher and like, get to play with prize-pussy every time you come home!”</i>");
	output("\n\nYou hug her back, glad that under all the tart is a genuine affection for you.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToMitzi);
}

/*
output("\n\n[DONE] Give Mitzi Gush");
output("\n\n//Straightforward. Mitzi gets milky and stupid.");
output("\n\n//Req’s favorite drugs talk!");
output("\n\n//Cock/NoCock variant.");
output("\n\nYou toss Mitzi a gush applicator. <i>“{Wanna like, by my milky moo-goblin for a bit?/Gotcha a present./I got you a present, since you were telling me how much you liked it./I’ve had a hankering for fresh milk ever since you told me that story./Gabilani milk better taste good.}”</i>");
output("\n\n<i>“Is this...”</i> the emerald bimbo’s mouth lags while her overheated brain struggles to keep up, <i>“...Gush?”</i> She looks up with the biggest, happiest grin on her pouty purple lips. <i>“For me?”</i>");
output("\n\nYou nod. <i>“Go ahead if you want.{ I’ll take care of you.}”</i>");
output("\n\n//Done this before.");
output("\n\nMitzi beams, <i>“This’ll be even better than last time! Omigod, thank youuuu! Mitzi is so glad you’ll be here to help her out in case she forgets her name or whatever.”</i>");
output("\n\n//First time");
output("\n\nMitzi beams, <i>“Thank you sooo much! Mitzi will try and stay milky afterward if she can remember. ‘Memberin’ is real hard in cow-space though!”</i>");
output("\n\nWhile that sounds worrisome, you remind yourself that Mitzi’s quite a resilient girl. If she can bounce back from the hand life dealt her and find her way to you, she can {dabble in a little Gush/indulge her Gush addiction} just fine.");
output("\n\n{Yanking off her [mitzi.armor] to bare her {soon-to-be }leaky mammaries, Mitzi bounces with glee./Squeezing her {soon-to-be }leaky mammaries{ until a thin stream of milk shoots out/ until streams of milk spray out/ until a river of creamy goblin-milk pours out}, Mitzi bounces with glee.} <i>“Just thinking about it has Mitzi’s titties all perkied up! Look!”</i> Sure enough, those glamorous green {milk-makers/jugs} are heaving, thrusting big fat nipples in your direction. High beams like that could poke out an eye - or fill flood your mouth with the sweet taste of Mitzi’s milk.");
output("\n\nYou lick your lips.");
output("\n\n<i>“Fuuuuck, [pc.Master], you look so </i>hot<i> when you stare at Mitzi’s tits like that, and she didn’t even use your present yet, the stupid cunt!”</i> Your pet goblin purses her lips in thought.{ <i>“Guess Mitzi should get these out of the way before she forgets how.”</i> She tosses off her [pc.armor].} <i>“Okay which end does the fun stuff come out of? This one?”</i> Surprisingly, she correctly identifies the drug applicator’s spray-port.");
output("\n\n//Bimbo");
output("\n\n<i>“Yeppers! That’s it. You’re gonna have so much fun!”</i>");
output("\n\n//Bro");
output("\n\nYou nod.");
output("\n\n//Nice");
output("\n\n<i>“That’s it!”</i> You give her an encouraging thumbs up.");
output("\n\n//Misch");
output("\n\n<i>“Why don’t you give it a try, and if you still remember what we’re talking about, you’ll know it’s the wrong end.”</i>");
output("\n\n//Ass");
output("\n\n<i>“Yes, that’s it. Honestly I’m not sure you can get any dumber.”</i>");
output("\n\n//Merge");
output("\n\nMitzi nods with a surprising sense of sobriety. <i>“Before Mitzi’s head gets all milky, she like, wanted to say she loves you.”</i> A trickle of wetness streams down her thighs. <i>“But Mitzi is really horny and is gonna milk herself stupid now!”</i> Waving the spraypen over her blushing tits, the goblin unleashes the entire load of Gush in one concentrated blast. Beads of moisture briefly freckle her heaving, emerald bosom for the moment it takes for the technologically-infused cocktail to penetrate her skin. <i>“Wow, it soaked in fast. [pc.Master] got me the good stuff!”</i>");
output("\n\nYou ask the horny short-stack if she’s feeling it yet. Her whole body is clearly flushed.");
output("\n\nAn airheaded giggle bursts out of Mitzi in answer, <i>“Like, not yet, {stud/[pc.Master]}. Gush takes a couple sec... mmm... uh...”</i> She stops talking and looks down at her breasts just in time to see them wobble. The sudden growth bounces one into the other, creating a cascade of jiggliness that bounces back and forth from one side to the other. <i>“Like... uh... good. It’s good, [pc.Master]. Mitzi’s getting all gushy!”</i> She grabs hold of one in both hands and offers it up to you, the rich green skin slowly stretching and shining from the effort of containing her swelling milk-sacks.");
output("\n\nYou cautiously take Mitzi’s weighty mammary into your hands. The contact seems too much for the silly slut. She bites her lip to stifle a moan and arches her back. A gush of girl-cum vents between her bare thighs to splatter the ground, and her nipple strains forward, reaching out a full inch as it engorges beyond all reasonable biological limits. {A single bead of white appears on the tip./An abrupt release of white erupts from the tip, cascading down her underbust to  join her fragrant pussy-juice on the floor. Repeated dosages clearly make Mitzi a very milky girl.}");
output("\n\nWith all the attention on her breasts, the bimbofied goblin appears to be in heaven. Her eyes are barely open, while her tongue is sliding further and further out of her lax maw. When she sees you looking, she ineffectually tries to suck it in, only to have a lurid moan undo every ounce of progress. <i>“Ma-ma-[pc.master]! Mitzi’s titties are sooo buzzy an’ good,”</i> she slurs. <i>“Gettin’ hot and full- soooo warm!!”</i> {Ribbons of white leak from her nipples without any effort at all./Both sides erupt again, release warm torrents of goblin-cream without any nipple stimulation at all.} <i>“Mmmm-ma-mooo!”</i> A brainless giggle follows after the bovine proclamation, <i>“Mitzicow moo!”</i>");
output("\n\n<i>“Mitzi?”</i> you snap your fingers in front of her face, trying to focus her incredibly limited attention. <i>“You doing okay?”</i>");
output("\n\n<i>“Mmmhmmm,”</i> the drippy girl all but purrs in sexual delight. <i>“Mitzicow... so...”</i> She looks down at her tits again and stops to smile warmly. Catching milk in her palm, she watches more dribble out and begins to moo all over again. Bovine low after cow-infused moan escapes her, every wordless vocalization accompanied by a slight increase in flow from her distended nipples. Mitzi sips at the milk puddled in her hand, then seems to remember something of your question - or at the very least acknowledges your presence.  <i>“Good. Miss Cow moo’s so good.”</i> Shuffling forward, she presses her cream-oozing breasts against your {[pc.leg]/[pc.thigh]/waist}. <i>“Milkies?”</i>");
output("\n\nThose luscious, milk-filled pillows are so warm against your [pc.skin]. It’d be a waste <i>not</i> to milk them. The only question is if you’d like to do anything else whilst you play with ‘Miss Cow.’");
output("\n\n[Fuck Her] [Titfuck] [Just Drink]");

output("\n\nFuck Her");
output("\n\n<i>“Yes, Milkies,”</i> you say, {yanking open your [pc.crotchCover] to pull out your [pc.cocks]/pointing at your [pc.cocks]}. <i>“Milked right into your cunt.”</i>");
output("\n\nMitzi’s eyes go wide and her languidly slides out of her mouth to drool on her expanded tit. She just stares at your crotch with unashamed lust. The hearts in her eyes dilate until you’re looking at a sea of wanton pink. Meanwhile, her hands oafishly grab at her nipples, making half-hearted tugs at the milk while her brain tries to make room for the concept of getting fucked. <i>“If fuck, how will... Moo milk?”</i> the goblin slurs.");
output("\n\n//Bimbo");
output("\n\nYou giggle. The poor got all shorted out by dick! That’s fine though, you’ll just take charge and give her the hard dicking you know she’s aching for. She can thank you later, if she remembers. <i>“Don’t worry about it. I’ll fuck you real hard, and all the milk will come out just fine!”</i> It’ll probably work.");
output("\n\n//Bro");
output("\n\nYou snort. <i>“You don’t need to talk.”</i> The dumb cunt would be better off presenting to save you the time of posing her, but you suppose it doesn’t matter. You’ll fuck the green-skinned milk-bitch until her cunt is stuffed and her nipples are milked dry. <i>“I got this.”</i>");
output("\n\n//Nice");
output("\n\nYou stroke her head gently. Poor girl is enjoying her tits so much that she’s going to need a lot of help to enjoy her Gush-time to the max. Fortunately, she has you here to take care of her. Knowing Mitzi, she’d whine for days if you didn’t give her a half-dozen milk-squirting orgasms. <i>“Relax, Mitzi-Moo. I’ll take care of all the milking. You just focus on enjoying it.”</i>");
output("\n\n//Misch");
output("\n\nShrugging, you tease her by saying, <i>“I don’t know, but I think if I stick my dick inside you, we might just find a way.”</i> The poor girl’s pussy clenches hard enough to send fresh dribbles running down her thighs. <i>“Besides, if you’re Mitzi-Cow, you don’t have to bother thinking. I’ll handle the hard stuff, like making sure you cum super hard.”</i>");
output("\n\n//Hard");
output("\n\nOh for the love of... <i>“You dumb cunt.”</i> You slap your palm into your face in frustration. <i>“Don’t worry your little bimbo brain over it. I’m going to fuck you, and you’re going to love and it and squirt milk everywhere.”</i> You pinch one of her nipples, and a spout of milk arcs out. <i>“Just like that.”</i>");
output("\n\n//Merge");
output("\n\n<i>“Ohhh! Oh... kay!”</i> The dumbed-down goblin nods, leaning closer to your crotch. She takes a sniff at [pc.oneCock] and nuzzles up to it. <i>“Moo loves cock.”</i>");
output("\n\nYou say, <i>“I bet you do,”</i> and force her down on her knees, then all fours. Mitzi’s pumped-up tits keep her on her fingertips, the pressure on her drugged-up knockers spraying fans of milk between her flushed skin and the floor. She doesn’t have to suffer long. You roll her over onto her back and watch her pornstar-caliber boobs wobble, most of their weight hanging over the sides of her chest to pull them apart, nipples jutting wide.");
output("\n\nThe goblin’s legs follow suit. <i>“Like this?”</i>");
output("\n\nClimbing on top of Mitzi, you drop [pc.oneCock] into place on top of her soaking pussy and smile. <i>“Just like that, {you sexy slut/sweet little cow/beautiful/you sweet mynx/bitch}.”</i>");
output("\n\nThe giggling girl arches her back and sighs delightedly at the pressure on her mons, rocking her hips upward to slide a sinfully slick clit against the underside of your dick. Fresh streams of goblin-cream ooze out of her increasingly distended nipples. Sucking on her finger, Mitzi stifles another bovine vocalization and manages to find her voice. <i>“But the milk...”</i> She reaches for a teat, but the sheer weight and size of her stuff mammary drags the slippery nipple out of her fingers. It takes both hands to wrangle the tit into place and lift it up to you in offering. <i>“Miss Moo needs moo-ilked!”</i>");
output("\n\nYou wrap your [pc.lipsChaste] around the swollen nub to humor the poor thing and are rewarded with a blast of sweat milk potent enough to stream out of the corners of your mouth and down your chin. There’s no way to sip gently from Mitzi. She’s a living cornucopia of milk, sharing the tremendousness of her bounty with you in one cheek-bulging eruption after another. The only way to ride it out is to abandon any attempt at cleanliness and let the milk fall where it may, coating your body and hers alike.");
output("\n\nYour [pc.cocks] throb{s} in anticipation while you drink, but your attention is too full of nipple and milk to properly line {it/one} up, too divided between Mitzi’s fecund swells to properly see to the satisfaction of your aching member. Keeping up with your breathing is");
output("\n\nFortunately, Mitzi’s sluttified, cock-hungry body is more than capable of seeing to your needs without a single conscious thought. She moos, low and loud, as her hips gyrate, confidently swinging up, angling forward, and pressing hard against your [pc.cockHead]. Those lust-gilded goblin lips {open right up to swallow your [pc.cock] whole, sheathing you in the liquid furnace of her loins. Overactive muscles clamp down to squeeze you in a slutty embrace. Mitzi’s elastic channel may be capable of handling the biggest, baddest cocks on the block, but it feels all too happy to wrap you up and squeeze until the cum can’t help but spurt out of you./gently part to slowly swallow down your [pc.cock], enjoying the sensuous friction of being filled by a decent-sized dick, sheathing you in the liquid furnace of Mitzi’s loins. Hidden muscles gently squeeze and stroke, careful not to contract too hard, lest they impede your pleasure. Her pussy is built for sex, able to please any dick - big, small, or the perfect size to curl her toes./momentarily strain before giving way to your [pc.cock], allowing themselves to be battered open to make way for your pleasure. Her insides are warm and soaking wet, clutching tightly to your veins as you glide by while gentle muscular contractions massage you better than an oiled-up masseuse. You’re clearly straining her limits. Mitzi’s toes curl as you hilt yourself, her cunt weeping desire{ down your [pc.balls]/ [over your [pc.vaginas]/ down your [thighs]}./slam hard into your [pc.cock] once, twice... and give way to the tunnel of liquid-gold pleasure that is her clutching, straining quim. You can see the outline of your dick bulging her belly; proud and hard and oh so ready to dump {gallons of seed into her womb/a gallon of seed/an enormous cumshot into her womb} as it plows forward an inch at a time. Mitzi’s eyes roll back, but her cunt still feebly works you, taut muscles vibrating like overtuned guitar strings around your manhood as they vainly try to squeeze down on a length big enough to split lesser women in half.}");
output("\n\n<i>“Moooooo!”</i> she squeals, riding high on waves of mind-melting pleasure. <i>“Moo-moooo-moooOOOOOO!”</i> Mitzi’s head slams back and her hips slap messily into yours, splattering you with girlcum as the goblin explodes into climax. Geysers of thick, creamy milk force you offer her nipple and wash down your [pc.chest] and [pc.belly].");
output("\n\nYou hold onto the squealing goblin-cow’s sopping-wet hips for stability and content yourself with fucking her silly. Without her tits to distract you, you can focus on giving her the furious fucking her augmented body was built to take. Mitzi likes it, the little slut. You can tell in from the way her {straining }slit flexes in response, the way the slightly-too-big nubbin of her clit bulges out. When you hit a really good spot, the milk fountains jump a foot higher in the air, and when you you draw back to line up the next stroke their pressure drops.");
output("\n\nThere’s something sexy about seeing Mitzi like this, using her like this, something pure in the way she radiates raw, sluttish desire and a whorish sense of ecstasy in response to each and every action, unencumbered by the barriers of ego and indecision. The lactating bimbo simply does what her body wants, and her body wants to cum around her [pc.Master]’s {hard-fucking dick/big, beautiful cock/bitch-breaking cock/cunt-destroying cock} for as long as it can.");
output("\n\n<i>“Moooo-oooh-yeessss!”</i> Mitzi’s voice is raw from screaming out her pleasure already. Her fingers grope her tits hard, uncaring for anything but more stimulation, squeezing still more milk. She’s all but swimming in it, plastering in face in a mask of white. Both pigtails are utterly saturated and dripping. You could hold a cup under one and it’d be full in seconds. <i>“Such-a-milk-sluuuuuut!”</i>");
output("\n\n<i>“Yeah you are.”</i> You fall into her fantasy, guided by her pussy’s wanton affections. <i>“My little milk-slut.”</i>");
output("\n\nThat gets a reaction out of Mitzi. She jolts upright, twitching in orgasmic bliss. <i>“Cum in meeee~! Mooooo!”</i> And she flops back down, twitching, eyes rolling back, pussy milking your [pc.cock] harder than ever. She might be incapable of saying it, but she wants your cum. She wants it fired deep into her womb. She wants the thickest, stickiest, virilest batch of baby-batter you can conjure up planted so deeply into her spasming body that her very soul is impregnated with your seed.");
output("\n\nAs if you could hold out when confronted with that kind of encouragement. Guided by the goblin-cunt’s silken touches, you hilt yourself deep{, knot ballooning to lock you in place,} and shoot the first pulse of your load.{ It’s relatively weak, all things told, but you give it all you’ve got regardless, spurting dollop after dollop until you feel sore and dizzy. That’ll happen from too many orgasms without rest, yet who could blame you? With a horny goblin slut like Mitzi on tap, you’re surprised you had any [pc.cum] at all in your [pc.balls]./ It feels like her pussy is swallowing up every drop, wicking away your [pc.cum] before you can feel it splash back around your girth. Mitzi’s altered body <i>milks</i> out your seed just as you milked her. Before long, you feel absolutely drained and a little bit dizzy./ It feels incredible, flooding her pussy. At first, Mitzi’s modded uterus seems to devour your offering, but by the end of the first [pc.cum]-spurt, you can feel the slick warmth backwashing back out around your [pc.cockHead]. And your successive squirts only make it hotter and wetter, thoroughly creampying the goblin with a load too big for her to handle.{ She whimpers when her belly rises up, inflated by the sheer size and force of your load, but they aren’t sounds of pain - quite the opposite. Mitzi clearly adores you pumping her middle up with seed. Green-skinned hands slide over the milk-drizzled dome as you stuff her cum-pregnant.{ When high-pressure jets spray out around your [pc.knot], she shudders and blacks out from the bliss. It would seem even bimbos can cum so hard they black out.}} By the time you run dry, you’re winded and dizzy.}");
output("\n\nFlopping yourself inbetween her drooling tits for a rest seems like a good idea{, especially since your knotted tool is still held in place, forced by Mitzi’s clenching cunt to continually seep more semen into her channel}. You can’t imagine a cosier place to take a nap.");
output("\n\n[Next]");
output("\n\nWhen you wake, it’s to the feeling of another climax. You wipe the milk from your eyes and push yourself up off of Mitzi’s tits to try and figure out what’s going on.");
output("\n\nShe’s riding you!");
output("\n\nNow that the effects of Gush have largely subsided, Mitzi’s chest is a little more reasonable looking, if a little bigger than it once was. <i>“Miss Moo made [pc.Master] cock-milk like... more than twice!”</i>");
output("\n\nJudging by the soreness in your loins, it was more than twice. <i>“Get off.”</i>");
output("\n\nMitzi pouts but complies, sliding to the side to let your cock pop out with a messy ‘shluck’ and answering gush of mixed sexual fluids.{ Apparently after hours of non-stop knotting, she stretched out enough to pop right off.} <i>“Umm... Moo. No wait... uh... fuck more later?”</i>");
output("\n\nYou laugh and stagger up onto your [pc.feetOrFoot] on shaky legs. <i>“Sure. I guess. Once you’re recovered.”</i>");
output("\n\n<i>“Oh.”</i> Mitzi pouts. <i>“Umm, when Milk-girl remembers her name, huh?”</i>");
output("\n\nThat seems about right. You nod.");
output("\n\n<i>“Okay. Miss Moo-Milk is gonna play with her pussy for now though, cause it makes her tits suuuper drippy.”</i> The milk-caked goblin is already knuckle deep in herself and smiling, heart-shaped eyes watching you adoringly.");
output("\n\nIt might take her a while to recover.");

output("\n\nJust Drink");
output("\n\n<i>“Yes, Milkies,”</i> you say, pulling the walking milk-tank into your lap. <i>“I’m thirsty.”</i>");
output("\n\nMitzi grins wide and does her best to lift a tit up for you, but it’s simply too heavy for her to raise it very high. You grab hold of one, fingers sinking deep, spilling milk out in a gooey spray, and heave it upward. The nipple throbs and gleams, beckoning you to take it into your mouth, to suckle it and taste of its bounty.");
output("\n\nYou do.");
output("\n\n<i>“M-m-mooo!”</i> Mitzi cries as her milk pours into your maw. It floods the space inside and balloons your cheeks. Trickles stream out of either side of your mouth as you struggle to gulp it down, able to enjoy its sweetness and creamy, palate pleasing flavor in spite of the inhuman quantity she presents. Fortunately, that flood diminishes to a steady pumping as the excitement of the moment passes. Mitzi’s trembling form stills somewhat, and you actually have a moment to attempt a suck.");
output("\n\nThe elasticized flesh in your mouth balloons the moment you draw in your breath, hot and heavy, then contracts just enough to overwhelm your capacity. It’s a messy process: gulping, sucking, leaking milk everywhere, and then gulping again. Mitzi loves it; she quietly moos when you suckle and sighs when you swallow. Her other breast is making a mess of everything, but she doesn’t seem to care, empty-headed cow that she is - at least at the moment.");
output("\n\nAt this rate, you won’t be able to handle both breasts’ liquid treasure. You’ll be lucky to drink everything this teat is putting out and still be able to walk! You swallow again, stroking Mitzi’s head affectionately as you try to think of a way to satisfy her. It’s quite relaxing, filling your belly, listening to the sluttified goblin’s animalistic sounds of pleasure and relief, warm juices spilling down your [pc.legs].");
output("\n\nWait... it’s not just milk rolling down your leg. You peek around the wall of over-productive mammary to look down, and sure enough, Mitzi has her tail buried deep into her slit. Pussy-juice is flowing out of her near-constantly, like she’s lounging in the midst of an orgasm without beginning or end. Your lap is bathed in it{, mixing in with your own feminine secretions to perfume you with feminine musk/, oiling your [pc.cocks] in feminine secretions that make your nose twitch and your dick{s} surge}. You’d smile if your mouth wasn’t full, glad that she’s having a good time of it.");
output("\n\nMaybe later something can be done about that leaky hole between her legs.");
output("\n\nFor now, you’ve got a pair of exceedingly milky goblin-tits to drain, and since you aren’t going to drink Mitzi dry with your mouth, you might as well use your free hand to satisfactorily empty the other.");
output("\n\nThe spare nipple nearly slips out of your fingers the first time you try to grab it, but you manage to catch it just at the tip. Of course, this sets off a geyser of breast-milk. Mitzi babbles, <i>“Goooood milkies! Moooo! Moo moo moo moo!”</i> You adjust your grip to squeeze higher up. Maintaining proper milking form is difficult without the ability to look at what you’re doing, but you make do.");

output("\n\nMitzi doesn’t seem to mind. She wriggles slightly to press more of herself against you, her cum still sliding down your [pc.legOrLegs] in and endless stream, widening the pool of milk and sex-juice on the floor. You could look down at her blissed-out eyes and limp, dangling tongue for what feels like forever.");
output("\n\nThis is... nice.");
output("\n\nMitzi moos as if in agreeance, to which you respond with a fervent suck. Time passes as your belly fills, but still you continue to drink, egged on by bovine lowing and the occassional whispered word of english. The skin of your [pc.belly] may feel tight and your stomach bloated, but you soldier on for almost a solid hour before you can take no more.");
output("\n\n[Next]");
output("\n\n<i>“Moo?”</i> Mitzi groans, blearily blinking her eyes. The tail slides out of her snatch with a wet pop as she comes down. <i>“No... no more milking Miss Moo?”</i>");
output("\n\nYou pat your milk-burdened belly. <i>“Not for the moment.”</i>");
output("\n\n<i>“Oh.”</i> The goblin’s brow crinkles for a moment. When she looks back up, she’s smiling as if she’s had the cleverest idea in all the galaxy. <i>“What about now?”</i>");
output("\n\n<i>“Not now either.”</i>");
output("\n\nThe look of shock on Mitzi’s face is priceless. She stutters, <i>“B-b-but Mi-mi-miss Moo has milk! See?”</i> She squeezes her breast, delivering a much slower flow of creamy goodness. <i>“Mmm...”</i> Her eyes flutter closed. <i>“Moo-ooooo!”</i>");
output("\n\nYou pat her on the head, a little concerned that she still seems to have forgotten her name. <i>“I need to sleep off this milk-gut. You’re welcome to milk yourself in the meantime.”</i>");
output("\n\n<i>“Awww... Miss Moo wants more milk. More milks and moos and sucks!”</i> She pouts. <i>“Maybe later? [pc.Master] make Moo even more milky later?”</i>");
output("\n\nYou promise that you will, but it’s probably best she wait until she’s recovered from this dose.");
output("\n\n//end");
output("\n\nTit-Milk-Fuck");
output("\n\n<i>“Yes, Milkies,”</i> you say, {pulling open your [pc.crotchCovers] to reveal/stroking your erect [pc.cocksNounSimple]/stroking your rapidly-stiffening [pc.cocksNounSimple]}. <i>“Milkies here.”</i>");
output("\n\nMitzi’s eyes go as wide as saucers. Her hands drop from her tits, fingers twitching in eagerness while her Gush-melted mind tries to figure out how cock and milk go together. <i>“Miss Cow...”</i> she moos, <i>“...milks here?”</i> She hesitantly reaches out to grab [pc.oneCock]. On contact, the milk-streams from her nipples pulse out heavy flows.{ Her fingers can’t wrap all  the way around the turgid maleness, but she tries all the same, fingernails gently pricking at your sensitive skin./ Her fingers casually wrap around it, gliding up in down an automatic handjob.}");
output("\n\nAfter watching the bimbo willingly devolve herself into a leaking, lactic toy, something as simple as a hand on your dick feels amazing. You groan in delight and nod. <i>“Get it nice and wet so I can fuck your tits.”</i>");
output("\n\nAgain, this shorts Mitzi right the fuck out. Her eyes cross to stare at your dick while her hand continues to stroke it, bereft of conscious thought. She opens her mouth, then closes it, drools a bit, then gulps it all down and quietly moos. <i>“Titty-milk-fuck?”</i> Her voice is high-pitched and strained with unfiltered excitement. Biting a too-plush lip, she at last lets go of your [pc.cock] to heft her tits, one in each hand. <i>“Help moo-me milk?”</i>");
output("\n\nYou’d like nothing better. Getting your hands on Mitzi’s nipples, you discover that they aren’t just engorged, they’re <i>ripe</i> and firm beyond belief. You can actually feel the liquid coursing through her milk ducts with enough pressure to send gentle vibrations through to your fingers. No wonder Mitzi’s drooling all over herself and speaking in ‘moo.’ You say, <i>“Easy girl,”</i> as you shift your grip a bit back and squeeze, forcing the milk forward with a gentle nip-ward press.");
output("\n\nYour milk-minded goblin tries her best to keep it together, but the moment her sweet juices are forcibly squeezed out of her still-inflating milk-bags, her knees knock together and her eyes roll back. She whimpers cutely as you tug down to her nipples, shaking like a leaf. The milk gets everywhere, of course. Her boobs spray like creamy sprinklers, splattering your body from [pc.belly] to [pc.foot]. It hits you like warm, wet cluster munitions, exploding into bursts of delightful warmth on your  [pc.thighs]{, your [pc.balls]}, your crotch, and especially your [pc.cocks]. There’s enough pearly goblin-milk for it drizzle from your [pc.cockHead] like sweet-smelling cum.");
output("\n\n<i>“Mooooo!”</i> Mitzi cries, leaning forward to sloppily kiss the top of your [pc.cock], inadvertently making you waste your last few nipple-tugs onto the floor.");
output("\n\n<i>“Good girl,”</i> you say, letting go of her nipples to give her a friendly pat on the head. She leans into your hand, panting hotly. The goblin-cow’s heart-shaped pupils remain locked on your cock. <i>“Are you ready to titfuck?”</i>");
output("\n\nMitzi’s tongue falls out of her mouth, and her tail slips between her legs to rub at a soaking wet gabilani mound. <i>“Moo!”</i> She kisses your cock. <i>“Moo!”</i> She rubs her cheek against it, smearing milk on herself without a care in the world. <i>“Moo want dick!”</i>");
output("\n\nYou’re going to give it to her. With one hand on her back and the other wrapped possessively around her throat, you bear her to the ground. She lets you do it too. The closest she gets to struggling is accidentally spurting some milk on your [pc.chest] when her titties bounce against one another. Those gorgeous heart-shaped eyes of hers stare up at you longingly, right up until you squat overtop of her and drop your milk-soaked cock into her cleavage with an audible splat.");
output("\n\nThen Mitzi’s too busy arching her back and crying out in delight to do something as mundane as maintain eye contact. <i>“Oooooh mooooo! Mooooo liiiike!”</i>");
output("\n\n<i>“Here, let me help,”</i> you say as you put a hand on either side of her enormous tits and press them together. Mitzi’s pillowy flesh squeezes down around your [pc.cock] in a vise of cream-coated skin, warm and wet in all the best ways. Better still, the added pressure causes her nipples to go into overdrive, spraying thick arcs into the air while less energetic streams roll down the swells of her tits to soak them in milky shine. You hold that position for a few moments, mashing the Gush-brained goblin’s mountainous mounds around your dick while you try to get used to the intense sensation.");
output("\n\nMitzi’s body goes limp, and you feel a splatter of feminine fluids against the underside of your [pc.butt]. A second later, her head pops up off the ground, milk-soaked pigtails bouncing, and she smiles at you. <i>“Moo!”</i>");
output("\n\nUnsure of how to respond, you continue to massage the goblin fuck-toy’s sinfully slick mammaries around your [pc.cock], wringing a happy sigh from yourself.");
output("\n\n<i>“So moo-damned good!”</i> Mitzi bubbles, grabbing hold of her teats to squeeze out more milk. By now, her nipples seem almost comically large compared to her fingers. It’s actually looks sort  of like she’s trying to milk a cow, with a more than appropriate liquid result. <i>“I love moooo!”</i> She’s looking you in the eyes while she says it, smiling broadly, if a bit vacantly, and wiggling around so that her tits shift on your [pc.cock]. <i>“Fuck-milk now?”</i>");
output("\n\nEven if the dopey goblin hadn’t asked, her cutely misspoken declaration was more than enough motivation to give her the righteous pounding a woman like her deserves. <i>“Yes,”</i> you announce, sliding your [pc.hips] back to drag your dick back to the [pc.cockHead]. <i>“You’re so good, Mitzi.”</i> You thrust back in{, [pc.balls] dragging on her middle}, cock throbbing, plowing a tunnel between her pillowy tits{ until your [pc.cockHead] bursts out of the top{ and kisses her lips/ and slides past her cheek}}. <i>“So goddamn good!”</i>");
output("\n\nNow that you’ve started, you can’t stop yourself. You’re too worked up, and she’s too hot. Her drug-enhanced breasts are unreal. Nothing should be so big yet so soft and so utterly, completely slick on your skin. Nothing should wring droplets of pre-cum from you so freely or ripple so hotly around your girth. Mitzi is a powerhouse dynamo of breastly sensuality, whether she has the awareness to know it her not.");
output("\n\nYou hump her tits like a [pc.manWoman] possessed. Your [pc.hips] slap into them hard enough to make them bounce and shake. Mitzi is carried along by their inertia; every stroke shifts her an inch or two up and down, but she’s well past caring. The little mynx is coaxing out more milk to lube you up, more to keep you hot and bothered. She’s smiling and cumming and mooing without a care in the world.{ Sometimes she stops to suck your [pc.cockHead] for a few seconds but forgets the instant you draw it away./ Sometimes she stops to slobber on your shaft for a few seconds but forgets the instant you draw it away.}");
output("\n\nFrom far away it probably sounds like you’re banging an actual cow. Mitzi seems incapable of forming words at this point, either from the pleasure or the drugs. There’s only squelching, slapping, and obvious sexual grunts in the air as you near your peak. Your fingers sink deep into supple emerald skin, unconsciously clenching tighter. Of course, this just releases more milk and makes Mitzi moo that much louder. She’s still looking at you though, and her eyes tell you what her lips cannot: that she wants you to blow the biggest, messiest load {all over her face/into her tits}.");
output("\n\nYou cum. How could you not? Pleasure races through your [pc.cocks], {spurting/spraying} out {into Mitzi’s milk-glazed mounds/onto Mitzi’s whorishly delighted face}. You fuck your way through it, adding sensation to your orgasm. The second pulse is at least twice as potent as the first{, painting the goblin’s face and pig-tails [pc.cumColor]/, oozing out of both ends of her cleavage}, and still, you keep fucking. You fuck Mitzi{ until she’s more spunk than goblin, your seed splattered in more places than you could ever keep track of/ until you run out of spunk and stir it around in her milk with your [pc.cock]}. Her tongue slithers out to collect dabs of it to swallow.");
output("\n\n<i>“Mooooo,”</i> Mitzi moans after the first mouthful, going back for seconds. <i>“Mmmm good moo.”</i>");
output("\n\n[next]");
output("\n\nSatisfied at last, you extricate your milky cock from Mitzi’s milk-dribbling tits and look down at the soaked goblin. <i>“Are you alright?”</i>");
output("\n\nHer chest is heaving like she’s out of breath, and her legs are absolutely soaked in pussy juice. More concerning is that her nipples are still drooling milk, her hands still there to coax it out. Mitzi’s vacant stare pivots your way. <i>“Miss Moo uh... feels real good.”</i> She licks up a little more milk. <i>“Want more milk-fucks, but milk getting slow!”</i> Sure enough, you note that the milk-flow has receded somewhat. <i>“[pc.Master] make Moo milky again later?”</i>");
output("\n\nYou promise that you will, but it’s probably best to wait a bit for now.");

output("\n\n//Milky Mitzi still recovering");
output("\n\nMitzi is in her bathroom, kneeling and the shower and tugging on her nipples. Soft, emphatic moos can be heard every now and then, accompanied by wet-sounding splats. You put your ear to the door and listen: <i>“Miss Moo is... Miss Moo? Noooo, wrong mooooo. Mmm, milking feels so gooood! [pc.Master] won’t fuck Moo if she doesn’t remember her name... Missy or Mimsy... MOOOO!”</i> You pull away and decide to let her recover in privacy.");
output("\n\n//Repeat recovery");
output("\n\nMitzi is in her bedroom, milking her prodigious teats and mooing like a barnyard animal. Every now and then you hear an orgasmic screech and a liquid spattering followed by a high-pitched cry of, <i>“[pc.Master] so good to Moooo!”</i>");

output("\n\n//First time approach");
output("\n\nMitzi smiles dizzily. Her breasts, you note, remain ever so slightly larger than before you gave her gush, but awareness has returned to her eyes. <i>“Thanks for like, giving Mitzi that Gush, [pc.Master].”</i>");
output("\n\nYou tell her that it was your pleasure.");
output("\n\nShe blushes from head to toe and nods, <i>“So like, now that Mitzi can remember her name and stuff, did you wanna do it again?”</i> Milk seeps from her nipples{ into her [mitzi.armor]}. <i>“Mitzi promises she’ll be so milky and happy for you. You can do whatever you want with her big, dumb cow-boobs!”</i>");
output("\n\n<b>It would seem you have a milky goblin now</b>, one who is eager to repeat the experience.");

output("\n\n//Repeat post-gush approach.");
output("\n\nMitzi pokes a breast. <i>“Mitzi’s titties are getting bigger thanks [pc.Master]. And so milky!”</i> She squeezes a nipple to release a {spray/gush/eruption} of creamy goblin milk. <i>“See? Mitzi’s a fuck-toy and a milk-cow now, and she </i>still<i> remembers her name. All because [pc.Master] is so generous.”</i> She shakes her breasts back and forth.  <i>“So you can like, make her a stupid fuck-cow as whenever you want, pretty much. Mitzi will love whatever you do to her big, dumb cow-tits. They’re [pc.Master]’s to milk!”</i>");
output("\n\n<b>{Mitzi is lactating even harder now./Mitzi is basically a walking milk-fountain now./Mitzi is capable of soaking you in milk at a moment’s notice./Mitzi has reached the absolute limits of milkiness. Any more and she’d break the universe.}</b> Any time you want to reduce her to a simpering milk-slut, she’s game. Of course she’s going to make a mess even if you don’t now.");
output("\n\n[DONE] Give Mitzi Bubbles!");
output("\n\n//Give Mitzi a bubble buddy bubble. Mitzi gives back a prize for the first time at a size.");
output("\n\nSavicite-Lace Panties - increases minimum lust to 33.");
output("\n\n<i>“Rutting”</i> perfume - tease damage boost + vuln, infinite uses. Lasts 16 hours.");
output("\n\nScylla - A bionahole made from her cloned pussy.");
output("\n\nOpal Ring piercing - looted ring from drug dealer. Releases cum/girlCum enhancing drugs in moments of climax");

output("\n\n//Repeat cum gift - already gave her one");
output("\n\nYou {toss Mitzi another small, latex bubble./gently hand Mitzi a big, latex ball full of liquid./carefully hand Mitzi a bowling-ball of latex-sealed fluid./roll an enormous, wobbling latex ball toward Mitzi.} <i>“{I got you the best thing ever - even more cummies!/Hey./Here’s some more bubbles of... you know. It’s the least I could do./I brought you some happiness in a bubble, if you know what I mean./We both know you love these, you little slut.}”</i>");
output("\n\nMitzi greedily accepts your offering and quickly squirrels it away, out of view. <i>“Thank you [pc.Master]! {Now Mitzi has a snack for later!/Now Mitzi has more snacks for later!/Now Mitzi can like, do cum facials and stuff. It’s super good for your skin!/Now Mitzi can have cum-facials for her skin </i>and<i> use it for lube. Probably even have a snack after!/ Wow! You’re like, the best at cumming, you know that? No wonder Mitzi is your personal cunt-rag! So much to drink and play with.../There’s like... umm... sooo much of your jizz now. Mitzi’s gonna take a bath in it later. Then see how much she can drink, okay?/Umm... Mitzi is going to have to take cummy baths every day to use all this up... and... and... it’s the best thing ever! Mitzi loves you so much, [pc.Master]!}”</i>");
output("\n\nThe big-eyed goblin flutters her lashes and squeezes you into a hug, tits and ass spilling everywhere. Her fingertip slides slowly up and down your {[pc.leg]/spine}. <i>“So like... how can Mitzi pay you back?”</i> She snuggles up to you{, cheek pressed against your [pc.cocks]./, cheek pressed against your [pc.multiCunts]./, cheek nuzzling into your [pc.belly]./, cheek nuzzling int o your [pc.chest].} <i>“[pc.Master] is so perfect...”</i>");

output("\n\n//First time small");
output("\n\nYou pull out a small, latex-wrapped cum-bubble and hand it to the horny goblin. <i>“I got you another one.”</i>");
output("\n\n<i>“Ooooh,”</i> Mitzi purrs as she accepts it. <i>“It’s like... a baby cum-ball. Fun-sized. Like Mitzi!”</i> She squints at your crotch. <i>“Kinda thought it’d be bigger this time... Maybe [pc.Master] wasn’t turned on enough. Mitzi has just the thing.”</i> She scampers off down a hall, biting into the bubble on the way in order to slurp down the contents.");
output("\n\nWhen she returns, she’s got another present for you - this one balled up in her hands instead of condom-wrapped.");
output("\n\n//Use gift texts from first-time.");

output("\n\n//First time medium");
output("\n\nYou present Mitzi with a grapefruit-sized bubble of cum. <i>“Gotcha some more.”</i>");
output("\n\nMitzi’s heart-shaped eyes seem to light up, almost glowing pink in delight. <i>“More cum for </i>me<i>!”</i> Clapping her hands to her cheeks, the goblin marvels at its size and shape before favoring you with a loving stare. <i>“Umm... Mitzi hardly deserves all this cum. She didn’t milk it out. She didn’t spend hours rubbing balls to make sure the spermies were all woke up and ready to shoot out. How... uh... oh!”</i> She snaps her fingers. <i>“Mitzi has just the thing! It’ll be sooo awesome. Hold on!”</i> She wheels about and hauls ass, off to look for a present to exchange.");
output("\n\nWhen she returns, she’s moving at such speed that she slams into you and bounces off, cradling against her belly.  Thankfully she didn’t waste a billion condoms wrapping it this time.");

output("\n\n//First time bowling bawl");
output("\n\nYou present Mitzi with a bowling ball-sized sack of cum. <i>“Gotcha another one!”</i>");
output("\n\nShe nearly tumbles over from the weight of it. <i>“Ooooh, what a big, virile dick this must have cum from.”</i> Rubbing her cheek against the straining surface, Mitzi marvels, <i>“And you got it all for favorite fuck-toy. Such a generous [pc.Master]!”</i> Happiness-lighted eyes gaze longingly up at you. <i>“Mitzi doesn’t deserve... doesn’t deserve this.”</i> Tears well up at the corners of her eyes. <i>“[pc.Master] is too kind. Oh!”</i> She wipes away the moisture and returns to carefree bimbosity. <i>“There’s this thing Mitzi got. [pc.Master] might like it!”</i>");
output("\n\nThe goblin darts away in a flash of green, returning a short time later with something tucked out of view between her tits. <i>“Know what Mitzi got you?”</i>");
output("\n\nYou shake your head in the negative.");
output("\n\n//Normal reveal");

output("\n\n//First time Beach Ball");
output("\n\nYou present Mitzi with an enormous, wobbling fluid bubble. <i>“Ever wanted a lifetime supply?”</i>");
output("\n\nMitzi’s mouth falls open. Her eyes grow wider and wider, heart-shaped pupils dilating until they’re nearly all you can see. <i>“All this is cum?”</i> She runs a hand across the surface, feeling how the taut expanse wobbles with the promise of luscious seed. <i>“You made this... for Mitzi?”</i> She looks up uncertainty.");
output("\n\nYou nod.");
output("\n\n<i>“That’s not... not fair. It must have taken so many strokes to squeeze out this much!”</i> Mitzi pouts forlornly. <i>“All that time milking a heavy dick and you didn’t even have any real help. Mitzi should have done it for you. It would have felt so much better.”</i>");
output("\n\nPatting her head between the pigtails, you assure her that you’re quite happy to give her this present. Besides, this is all the cum she could ever need, right?");
output("\n\nA snorting giggle interrupts you. <i>“You’re so funny, [pc.Master]! This is like, one good cum-bath, maybe. Mitzi can make it last a long, long time if she needs to, just like you in bed, but there’s always room for more cum. Oh! Mitzi’s such a dumb fucking cunt! Hold on a squirt, k?”</i> She hauls ass down a hallway, leaving you alone with an enormous bubble of spunk.");
output("\n\nMitzi returns with a tiny box in hand and a proud smile. <i>“Gotcha something! Not as good as cum, but close!”</i>");
output("\n\n<i>“What is it?”</i>");
output("\n\n//Generic gift text here!");

output("\n\n//First time any size");
output("\n\nYou pull a {small, latex-wrapped/grapefruit-sized/bowling ball-sized/beachball-sized} cum bubble out of your pack and {extend it to/roll it toward} the horny goblin. <i>“I got you a present.”</i>");
output("\n\nMitzi gingery {accepts the gift/hugs the goblin-sized gift}, squeezing it between {her tiny palms/her arms} in excitement. <i>“Omigawwwwd! Nobody ever gets Mitzi like, anything!”</i> She shakes it, listening to the sloshing. <i>“...It’s cum right? Please let it be cum.”</i>");
output("\n\nThe second you signal in the affirmative, Mitzi swoons and moans, <i>“My hero! You’re the best [pc.Master] a girl could get.”</i> She produces a syringe and sticks it into the bubble, casually extracting a sample to spray onto her waiting tongue. <i>“Mmmm, yummy too. Mitzi should really return the favor. Give you something like, just as awesome.”</i> The goblin extra another hit of seed and swallows it with an enormously satisfied sigh, <i>“Ohhhhh gaaaawwwwwwd. Yeah. Something better than goblin-sex. You have all of that you can want. Back in a dick-suckin’-second!”</i>");
output("\n\nPitter-pattering feet slap into the deck as the green-skinned cum-addict scampers off with her prize. You fold your arms and tap your foot, but she’s back before you know it, carrying in something gift-wrapped in neon condoms like wrapping paper. <i>“Here, [pc.Master].”</i> Mitzi’s lashes flutter adoringly above her pink, heart-shaped eyes.");
output("\n\n//Bimbo");
output("\n\nYou’re blown away at such inventive use of condoms. And here you thought they were  only good for like, storing snacks. You peel them off one at a time, sharing them with Mitzi in case either of you ever needs to bank up a little boy-batter.");
output("\n\n//Bro");
output("\n\nYou’re not sure what you should have expected. It is sort of impressive the dumb slut could remember that most people wrap presents. You rip off the condoms with a grunt of irritation.");
output("\n\n//Else");
output("\n\nYou’re a little thrown off by her decorative choices, all things told, but you suppose that’s what happen when a girl accidentally gets her brain rewritten to focus exclusively on being a fuckable piece of ass. The condoms come off easily enough anyway.");
output("\n\n//Merge");
output("\n\n//Panties");
output("\n\n<i>“It’s panties!”</i> Mitzi cheers, the picture of radiance. <i>“They’re like, the best panties ever. They’ve got like... savi...savick... uh, some kind horny-making stuff in woven all over the lacing. It’s super strong! I’m like, always wet when I wear them. So I thought, maybe if you ever wanted to fuck a whole-whole-whole-whole lot, you’d really like them.”</i> She hugs your [pc.leg] and kisses your [pc.thigh]. <i>“And they’re crotchless, so you don’t even need to take them off, like ever!”</i>");
output("\n\nIt is clear the goblin treasures this underwear something fierce. You pat her on the head and slip them into your pack.");
output("\n\n<i>“So like, do you wanna fuck now?”</i>");
output("\n\nEver a one-track mind with Mitzi.");
output("\n\n//"Rutting”</i> perfume - tease damage boost + vuln, infinite uses. Lasts 16 hours.");
output("\n\n<i>“It’s Mitzi’s favorite perfume-slash-cologne-slash-smell-good-stuff!”</i> the ditzy bimbo cheers, absolutely radiant. <i>“It even has a sexy name! ‘Rutting’! One spritz has like, more phero...pherom... smelly-moans than an a hellhound in heat! See?”</i> She squeezes the bulb on the end and blasts you in the face with the indescribably woodsy fragrance.");
output("\n\nIt’s... woah, Mitzi looks awfully sexy when she looks at you like that, especially when she leans in and sniffs. A gift this good almost demands a hard fuck, especially now that you’re feeling so... sexy.");
output("\n\n<i>“Mitzi knew you’d love it.”</i> The pint-sized fuck-toy says, her hands roaming all over your [pc.thighs]. <i>“Mitzi loves it too.”</i> She sniffs. <i>“She loves you too, and she wants to love you so much more. Ummm... just be careful, cause like... it makes you smell super sexy, but then you kinda get turned on real easy too, see?”</i> Manicured fingernails gently caress your groin, nearly buckling your {knees/[pc.legOrLegs]}.");
output("\n\nYou see what she means. This stuff could come in handy when you’re trying to seduce someone... so long as you don’t wind up spread-eagled and gasping yourself. Best of all, the reservoir bulb is so full that you’re unlikely to run out in the foreseeable future.");
output("\n\n<i>“So... you wanna fuck or something?”</i>");

output("\n\n//Scylla - A bionahole made from her cloned pussy.");
output("\n\n<i>“It’s Mitzi’s pussy!”</i> the pint-sized sex-addict purrs. <i>“Some company makes them, so you can like, have your favorite fuck-toy’s cunt as you know, an actual fuck-toy you can have on the go.”</i> She reaches out to fondle your crotch. <i>“Now whenever you’re too far away for Mitzi to take care of, you can play with her clone-pussy. It’s even like, got a mod to release a little bit of aphrodisiac in the juices. They wouldn’t put throbb in it, even after I sucked off the shopkeeper like, ten times, but this is still pretty nice, right? You could probably cum just from eating it out, if you did it long enough.”</i>");
output("\n\nYou place the cap back on Mitzi’s BionaHole and store it in your pack. She’s right. It might be fun to play with on the road.");

output("\n\n//Opal Ring piercing - looted ring from drug dealer. Releases cum/girlCum enhancing drugs in moments of climax");
output("\n\n<i>“It’s jewelry!”</i> the excitedly emerald minx cheers, the picture of radiance. <i>“But not just any jewelry: a piercing! The sluttiest, prettiest, most wonderful kind of jewelry in the galaxy. And this one is special, since you gave Mitzi such a special gift.”</i> She hugs the enormous cum-bubble, wobbling back and forth with it. <i>“So like, the opal in that ring is hollow or something and filled with micro-surgies that’ll go to work on your junk right before you cummy! Mitzi tried it once, and she squirted like, two gallons. It’s gonna be on like, a cock or pussy to work though. If you put it on a nipple or something, it just looks really, really cute.”</i>");
output("\n\nYou look it over hesitantly. That does sound sort of fun.");
output("\n\n<i>“So like, you wanna fuck now, or should Mitzi go have a snack?”</i>");
output("\n\nRepeat Pussy Control");
output("\n\n<i>“Do my pussy again,”</i> you instruct, immediately moistening at the half-forgotten memory of the last time Mitzi made you chain orgasm after orgasm together.");
output("\n\n<i>“Yay!”</i> Mitzi applauds, producing a tube of lip gloss from somewhere. <i>“Mitzi’s been like, wondering when you’d wanna go again.”</i>");
output("\n\n[Done] Mitzi Pussy Control~");
output("\n\n//Wherin Mitzi applies some drugged lipstick, kisses the PC into hypnotic receptivity, and temporarily causes them to believe that pussy is the only thing they care about, culminating in squirting everywhere from eating Mitzi out.");

output("\n\n//Bimbo");
output("\n\n<i>“Mmm, I could just like, eat you up! But could you maybe do something with this instead?”</i>");
output("\n\n//Nice");
output("\n\n<i>“Would you mind taking care of this for me?”</i>");
output("\n\n//Mischievous");
output("\n\n<i>“Mitzi... I have a problem that needs a goblin’s touch.”</i>");
output("\n\n//Hard");
output("\n\n<i>“Pleasure this.”</i>");
output("\n\n//Merge, no new PG.");
output("\n\n{You pull down your obstructing garments to reveal your [pc.multiCunts] to your pet greenskin./You gesture down to your [pc.multiCunts].} Exposed skin flushed hotly{, and moisture streams down your [pc.legOrLegs]/, and moisture dribbles down your [pc.legOrLegs]/, and moisture slicks your [pc.thighs]/, and aroused moisture lends your folds a dewy appearance}.");
output("\n\n<i>“Ohhhhh...”</i> the dumbstruck goblin {drops to her knees before /takes a halting step closer to }{it/them}. She gently extends a hand, slender fingers spreading to land on either side of the lustily engorging canal. <i>“Like, {these are super pretty pussies./this is a super pretty pussy.} How hard do you want Mitzi to make you cum?”</i>");
output("\n\n//Bimbo");
output("\n\n<i>“Just as hard as you want to cum!”</i>");
output("\n\n//Bro");
output("\n\n<i>“Fucking hard.”</i>");
output("\n\n//Else");
output("\n\nWhat kind of question is that? <i>“Hard.”</i> When you see the goblin’s face turn thoughtful, you append, <i>“Really hard.”</i> No sense in having her hold back.");
output("\n\n//Merge");
output("\n\nThe hearts within Mitzi’s eyes widen at the suggestion. <i>“Then Mitzi has just the thing!”</i> She produces a bright pink tube of lip gloss from... somewhere and rolls a layer onto her lips. The fingers on your cunt push and slide, smearing your increasingly slick fluids everywhere. <i>“Don’t worry about a thing.”</i> The goblin puckers up, luscious lips parted slowly by their own sluttish volume as she rolls another layer onto them, lacquering on enough glass to make them glitter like mirrors. <i>“There!”</i> She smacks them together a few times to even the coat. <i>“It’s like, super good Mitzi wears so much lipstick!”</i>");
output("\n\nYou raise an eyebrow.");
output("\n\n<i>“Oh, this stuff is like a super illegal drug.”</i> She twirls the tube around her fingers and slides it out of view. <i>“Reaaaaaally strong. Mitzi would be so stupid fucked right now if it was able to absorb it through her lips.”</i>");
output("\n\n<i>“Wait-”</i>");
output("\n\nMitzi leans into [pc.oneCunt] and plants a wet kiss, halting your protests a simple press of warm, cushiony lips and the resulting smear of tainted lip gloss on your blood-engorged nethers.");
output("\n\n<i>“Oh.”</i>");
output("\n\nYour brain takes a few seconds to catch up to the pleasure of the contact, the way it makes your nerves tingle and sing the goblin’s praises. Looking down at her, you see her smiling up around your pussy, heart-shaped eyes crinkled with the delight that can only come from serving her [pc.Master]’s most sensitive places.");
output("\n\nShe’s gorgeous.");
output("\n\n<i>“Oh,”</i> you mumble again, one of your hands falling onto the back of Mitzi’s head. <i>“You’re really cute like that.”</i> Your concerns melt away under the warmth of the goblin’s luscious, drug-painted lips. <i>“Umm... I was worried about...”</i> She kisses [pc.oneClit], leaving a veneer of artificial shine behind. <i>“Wow that’s nice.”</i> The goblin is mind-blowingly pretty. You can scarcely believe that you lucked into earning the services of such an adoring beauty.");
output("\n\n<i>“Oh?”</i> Mitzi begins to apply another coat of lip gloss. She smacks those purple pillows together beams up at you. <i>“Did you really want me to wait, or should I like, keep going?”</i>");
output("\n\nThere’s so much heat between your [pc.thighs], flush and hot. You feel weak and silly, unsure of why exactly you wanted her to wait before. Was it... something about her lipsgloss? Yes! That’s it! <i>“Your gloss!”</i> You point accusingly at the tube.");
output("\n\nMitzi pouts, <i>“You wanted to watch Mitzi put on some more?”</i> The emerald slut puts, <i>“If you really want. Do you really want Mitzi to roll more on? Paint these pussy-pleasing lips thich with shine until you get all silly and cummy?”</i>");
output("\n\nThe distracting heat boiling below keeps interrupting your thoughts, twisting them around when you to focus. Mitzi’s face is there through it all, smiling and beautiful, the picture of wantonness. You can’t see any problems with her gleaming mouth, still moist from your [pc.vaginas], but that must have been it. <i>“Yeah... that sounds right.”</i>");
output("\n\n<i>“Okay! Mitzi will put this one on super-dooper thick just for you [pc.Master]!”</i> She uncaps the tube once more, twirling dial at the bottom to push more jellied makeup out. Pink, heart-shaped eyes stare seductively up at you as Mitzi languidly presses the gloss against her lower lip and slowly begins to roll it across the taut, reflective surface. She blinks, layering it on nice and heavy, just like you asked. The way she flips it around to bring it to bear on her upper lip is almost hypnotic, and the application of her enchanting mouth-polish leaves you shudderingly, gaspingly aroused. <i>“There!”</i>");
output("\n\n<i>“Please, my puss{y/ies}.”</i> You grab her by the pigtail, more for something to hold onto than with any intent of forcing her. Satisfying your budding desire by yourself seems a foreign concept.");
output("\n\n<i>“Mitzi will,”</i> the pretty bimbo purrs. <i>“You trust her, right? You trust Mitzi.”</i>");
output("\n\nOf course you trust Mitzi! That’s why you’re here begging her to make you cum! <i>“Uh huh...”</i> Putting that trust to words is hard, but the idea seems to communicate well enough.");
output("\n\n<i>“Good,”</i> Mitzi kisses just to the left of your cunt, leaving a gleaming patch of tingling warmth in her wake. <i>“And like, Mitzi makes you super horny, right?”</i>");
output("\n\nYou nod.");
output("\n\nThe giggling goblin smooches down on the other side, leaving an identical patch of sinfully tingly happiness behind. <i>“Like, so horny it’s hard to think right?”</i> One of her hands disappears into her soaking-wet cunt. <i>“That’s how horny you make Mitzi. So horny that your pussy just kinda tells you what to do.”</i>");
output("\n\nNow that she puts word to it, that’s <i>exactly</i> how you feel. You feel almost feverishly aroused, and Mitzi is so, so beautiful that looking at her is like staring at a star. Her erotic radiance leaves you dumbfounded and soaking wet, like a barely-sapient puddle. <i>“Oh-f-f-fuck yes!”</i>");
output("\n\n<i>“Good.”</i> Mitzi grabs your ass and pulls you close, landing peck after peck in a slowly spinning spiral around your deliriously soupy puss. <i>“Pussy is amazing, isn’t it?”</i> She leans back to show you hers. From the luscious folds to the sheen of her leaking arousal, it’s awe-inspiring. Her silken interior glimmers with a stunning amount of erotic promise. <i>“It’s so powerful. So wonderful.”</i> She slides a finger through her slit. <i>“One cunt could bring down a government. Two cunts? Two cunts could addle a [pc.boyGirl]’s mind, just by existing.{ More? More could make  the universe fade away into irrelevance.} Couldn’t they?”</i>");
output("\n\nThe words are background noise next to the beautiful texture of Mitzi’s feminine jewel. Your mouth and [pc.vaginas] water together in perfect sync, every part of you wanting to press against the juicy mound, just to be closer to it. To rub against it would be divine. To taste or grind against it, mind-melting. <i>“Mmmhmmm.”</i>");
output("\n\nMitzi grabs your hand and brings it to her mouth, sucking you in to the knuckle. Her tongue flicks at the tip teasingly, and then she’s sliding back, heavy lips smearing your digit in enough gloss to make it shine brightly. Her purple mouth seems matte by comparison. <i>“Pussies deserve fingers, dear. I know it’s so hard to think when you’re this wet, all hot and fluttery.”</i> She turns your hand around, pushing the finger toward the sopping cleft between your [pc.thighs]. <i>“But you should really do what your pussy wants... and fill it.”</i>");
output("\n\nThat shining finger slides in all on its own. You don’t have to think. You don’t have to decide to move the muscles in your arm. Your [pc.vagina] does all that for you, guiding that spit-and-gloss-slicked digit into the molten heat that burns between your [pc.thighs]. The tip brushes the underside of [pc.oneClit] on its way in, exactly the way you need it to, and then it’s spreading your lips wide, leaving the residue from Mitzi’s lips smeared over the exterior as it plunges in deep - so deep that you’re moaning as the knuckle wiggles inside.");
output("\n\n<i>“Atta girl. Look at us - just two soaking wet cunts who are finally getting what we need.”</i> Mitzi sighs in delight as her manicured fingertips plunder her emerald jewel, the lips so exquisitely plush and inviting that they all but demand something slap against them, violate them in whatever degrading way will make them cum the hardest. <i>“Look at these cunts. Look at how wet they are.”</i> The goblin groans stuffs a second finger into her box, spreading them a second later to expose the hypnotically glistening flesh. <i>“Cunts this wet must cum, like super easy, right?”</i>");
output("\n\nThe {two pussies in your view/{NUMBER} pussies in your view/fact that {a [pc.sack] blocks/a [pc.cock] blocks/[pc.cocks] block} your view stymies you the six long seconds it takes your cunt to remind you that you can {lift it out of the way/shift {it/them} to the side}. Only then do you see your [pc.vaginas] revealed in all {its/their} glory, so close to the goblin’s. They} bob up and down in your nodding viewpoint. The backdrop is unsubstantial and unimportant next to the glistening honeypots that so dominate your world. There’s only the hot, wet frission of fingers against womanhoods, the pulsating thrum of hammering heartbeats tickling nerves so tenderized that the slightest breeze feels like a tongue’s tender strokes. You could cum at any second. It would be so easy, and your pussy wants it, so-");
output("\n\nA second finger slides inside, exploding your [pc.vagina] with pleasure. Detonations of mind-shattering bliss chain up your spine, leaving undulating, uncoordinated masses of muscle in their wake. As your body slumps over, [pc.hips] gyrating wildly, an atomic bomb of ecstasy shatters what small part of your consciousness remained into slick, cummy pieces. You moan whorishly as you hump Mitzi’s leg, smearing in her [pc.girlCum]{, in between fountainous squirts}. It’s so easy to cum, and you (or your pussy - there’s no divide between the two any longer) want to do it forever.");
output("\n\n<i>“Cumming’s soooo easy,”</i> Mitzi moans, reaching up to rub [pc.oneClit] alongside her  own.");
output("\n\nA second climax climbs onto the back of the last one’s heels and rides you to the ground. Your eyes roll back, leaving you to dwell on your own insensate moans and the endlessly delightful feeling of slickened digits plowing through a sopping tunnel.");
output("\n\nThe goblin climbs onto your unresisting form and shifts away from your throbbing clitty to work your wrist, pumping your fingers in and out now that it has become too difficult for you. <i>“Just a hot wet cunt who can’t think of anything but slit-stuffing sex.”</i> [pc.Girlcum] puddles in your thighs. The Mitzi-assisted masturbation sounds so loud in your ears, but not loud enough to stop you from realizing how right she is. <i>“That’s the truth ‘bout pussies, [pc.name]. They’re so... like... mmmmph! So </i>receptive<i>. They’ll do anything you want as long as you make them feel good.”</i>");
output("\n\nAnother climax steals any attempt at response. Your [pc.legOrLegs] twitch{es} bonelessly on the floor. <i>You’d put anything inside yourself to feel this good again.</i>");
output("\n\n<i>“You’re a slut, just like Mitzi, aren’t you?”</i> The devilishly grinning goblin releases your wrist now that it’s pumping your cunt on its own and climbs onto your face. Her arousal smells so sweet, so desirable. You thrust your tongue into it and cum, uncaring that you’re <i>sucking pussy like a total slut</i>.");
output("\n\nDewdrops of gabilani delight dribble into your maw.");
output("\n\n<i>“Mmmm, but it’s fun to be a slut. Especially when you’ve got a little slut like Mitzi to fuck whenever your cunt gets the least bit horny. And pussies are like, </i>always horny<i>.”</i> Mitzi proves her point by squirming onto your tongue, her thick thighs wrapping around the back of your head with surprising strength.");
output("\n\nAmbrosial tastes and smell intermingle with the satiny sawing of your masturbating fingers. The bliss of orgasm after orgasm has you so addled that you can scarcely tell where Mitzi’s cunt ends and your own begin{s}. She’s still talking, something about how every time you cum you get better and better at listening to your lusts, but you aren’t really listening anymore.");
output("\n\nYou’re too much of a slut to care what else happens, as long as you get to keep cumming... and cumming... and cumming.");
output("\n\n[Next]");
output("\n\nYou wake up... sticky. Mitzi is next to you, snoring peacefully with her hand in her cunt... just like you were a moment ago. You lick the worst of it from your fingertips as you take stock of the situation. Your [pc.thighs] are completed plastered in [pc.girlCum], to say nothing of the puddle beneath. <i>Hot.</i>");
output("\n\nYou don’t have a very clear memory of exactly what all you got into aside from a faint memory of drugged lipstick and lots and lots of pussy, but you’re definitely feeling a little more libidinous your goblin fuckslave’s efforts.");
*/



//Archived CoC Scenes, to be repurposed:
//Fuck Mitzi
//Something something dicked PCs.
public function fuckMitziJustLikeInCoC():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	//You shrug and start stripping out of your [armor] while you have the chance. Demons aren’t exactly known for their trustworthiness, but she’s doing this as a show of strength. Resorting to trickery to beat a simple mortal might lower her subordinates’ opinions of her. If there’s one thing you’ve learned to count on with demons{ and smut writers}, it’s hubris.
	//Mitzi gapes at the sight of your [cock] springing free. Her master looks on, stroking his own with a forlorn look in his eyes, unable to stop jacking it even when you’re about to claim his playtoy as your own.

	//PC dressed:
	if(!pc.isCrotchExposed())
	{
		output("You shrug and start stripping out of your [pc.crotchCovers] at the goblin’s behest. If she wants a taste of your dick, who are you to keep it from her?");
		output("\n\nMitzi gapes at the sight of your [pc.cock] springing free. One hand slides south, stroking the feminine treasure below, unable to resist a little self-play when presented with a prime piece of penis.");
	}
	//Undressed
	else
	{
		output("You shrug and smile at the goblin’s incessent requests. If she wants a taste of your dick, who are you to keep it from her?");

		output("\n\nMitzi gapes as ");
		if(pc.isErect()) output("you offer her your hard [pc.cockNounSimple]");
		else output("your [pc.cockNoun] grows hard at the sight of her");
		output(". One of her hands slides south, stroking the feminine treasure below, unable to resist a little self-play when presented with a prime piece of penis.");
	}
	output("\n\n<i>“You like that?”</i> you ask the goblin, pivoting to swing your [pc.cock] under her nose.");
	if(pc.cockTotal() > 1)
	{
		output(" <i>“Or maybe this one?”</i> You grab your ");
		if(pc.cockTotal() > 2) output("second");
		else output("smallest");
		output(" dick and shake it at her.");
	}
	output("\n\nThe green-skinned girl shivers. Her knees audibly knock together from the rich, musky scent your maleness");
	if(pc.cockTotal() > 1) output("es");
	output(" exude");
	if(pc.cockTotal() == 1) output("s");
	output(". Biting her lower lip, she meekly nods. Her breeding instincts, augmented by ");
	//demonic magics
	output("endless bimbofying drugs");
	output(", must be going wild. The only thing keeping her from jumping your dick this very second is her ingrained submissiveness. Her eyes are wide and pleading, backed up by a high-pitch whine from somewhere inside her throat. Mitzi rubs deeper between her legs, instantly soaking her fingers with incredibly liberal secretions. <i>“...yesssss. Please... fuck mitzi.”</i>");
	output("\n\nYou grab a lock of purple hair and pull the mindbroken goblin’s face against your [pc.cock], smearing her cheek with your pre-cum, leaving her skin glistening with fuckscent. She doesn’t protest or complain. Instead, she grows more aroused by the second. Flushing hot, her face radiates heat and desire. Her nipples are as thick as pencil erasers and hard against your roving palm. She can’t even stop her pussy from absolutely drizzling. The off-beat spattering of cunt-juice on the floor is music to your ears.");
	output("\n\nMitzi licks her purple-painted lips a few times and opens wide, her bright-pink organ laid out like a landing strip for your pre-oozing sex-engine. You’ve seen some slutty aliens in the wild, but none have managed to look quite so brazenly whorish as this pirate-broken pet. Her mouth looks made for sucking dick, capped with lush angel-bows under a layer of fuck-me paint. Her breasts are huge and shapely without a hint of sag. Even her pussy is primed for fucking, so plush and full that it’d feel like it’s kissing your crotch while you take her.");

	output("\n\nYou lay your pipe across her salivating tongue, but as you’re admiring the sight of it there, backlit by hungry goblin, she pulls it inside, wrapping you in the tight heat of her hungry mouth before you can possibly react. Mitzi’s cheeks hollow from establishing a fevered suction. Her eyes flick up, meeting yours while she gently begins to bob back and forth, establishing a gentle, face-fucking rhythm that soon has you freely dribbling condensed anticipation onto her constantly wiggling tongue.");
	output("\n\nThere wouldn’t be a need for you to move, if you didn’t want to. You could let mitzi work your [pc.cock] for hours");
	if(pc.cocks[0].cLength() > 14) output(", her throat bulging with its unholy size");
	output(", polishing your knob perfectly. You’ve no doubt she could bring you off quicker if she wanted to, but the little sex slave is treating this blowjob like a job application; she wants to make you last. She wants to make you wallow in pleasure until it becomes so overwhelming that you would fountain even without the back-and-forth bobbing of her head.");

	//output("\n\nYou don’t have the time to let her treat your cock like an oral gymnasium, and you certainly didn’t want to make do with a blowjob when the real deal is on the menu. Grabbing her by the scruff of the neck, you pull the gasping creature off your [cock]. A purple ring is evident on the bottom third of your prick, rubbed off by the immaculate seal her puffy cockpillows left behind.");

	output("\n\nTempting as it may be to let her treat your cock like an oral gymnasium, you don’t want to make do with a blowjob when the real deal is on the menu. Grabbing her by the scruff of the neck, you pull the gasping creature of your [pc.cock]. A purple ring is evident on the bottom third of your prick, rubbed off by the immaculate seal her puffy cockpillows made.");
	output("\n\n<i>“D-did Mitzi do bad?”</i> The goblin looks like she could cry. The girl must really, really love cock.");
	output("\n\n<i>“No,”</i> you answer. <i>“I’d just rather fuck you right now.”</i> You guide her down onto her hands and knees. A spaded tail flicks back and forth above her full moon. She’s definitely had some work done - or found an illegal, booty-thickening mod.");

	output("\n\nMitzi’s elfin ears perk right up at your words, and she even ");
	if(pc.balls > 0) output("wraps her tail around your [pc.sack], giving eager little tugs");
	else output("wraps her tail around your [pc.leg], giving you eager little tugs");
	output(". She doesn’t need to pull you in - you can handle that all on your own. Grabbing her petite waist one handed, you pull her down onto your [pc.cock] using your free hand to keep your aim true.");
	output("\n\nKnowing that a girl’s pussy is overflowing is one thing; experiencing the sodden reality is another. Her pumped-up petals kiss your [pc.cockHead], slowly giving as you try to thread yourself between them. Ribbons of wetness run down the underside of your [pc.cock], thickening the longer you’re in contact with the fountaining love-slave. The obscene plushness of her labia majora actually holds you back, but at a certain amount of force, they bow around you, allowing you to slip your first few inches into Mitzi’s silken vice.");
	pc.cockChange();
	output("\n\nWith what she looks like on the outside, falling somewhere between high class call-girl and short, stacked succubus, you expected her slit to be equally pleasing. The slippery, heated heaven into which you now sheath yourself is beyond any expectations. She feels molded to you, her entrance designed to welcome cocks deep inside its deepest recesses. Even compared to the sluttiest, most heavily engineered sexbots, Mitzi’s cunt is exceptional. Her silky folds squeeze down on you the further you thrust in, tending to your budding pleasure with excess of slickened sensation.");

	//Hugedix
	if(pc.cockVolume(0) > 500) output("\n\nThe best part is that she doesn’t seem to care about how enormous the cock you’re forcing into her is. Her belly is bulging out, displaying an imprint of your [pc.cock]’s shape, and all she does is moan harder. The muscles of her girlcum-drizzling slit never stop squeezing you encouragingly, demanding that you bury the whole thing inside.");
	//Back to errybody
	output("\n\n");
	if(pc.cockVolume(0) <= mitzi.vaginalCapacity(0)) output("Bottoming out");
	else output("Filling her with as much as she can take");
	output(" is too much for little Mitzi. Her slender arms buckle, dropping her onto her tits. Her head lays sideways against the floor, her exquisitely long tongue hanging out, drooling. She’s not really talking anymore, just kind of idly grunting with every movement you make. Her brain cells are either too busy controlling the fluttering muscles in her cunt or routing pleasure signals to form cogent thoughts.");
	output("\n\nYou don’t see any point in giving her any warning. Grabbing hold of her plump ass with both hands, you pull yourself back until she’s almost entirely empty. A disappointed little mewl escapes her lips. Then, you thrust back in, letting your veiny mass revel in its slick back-and-forth journey. Your [pc.cock] twitches happily within the living dicksheath, dumping a few hot globs of pre-seed into her furthest recesses with every pump.");
	//output("\n\nThe demons in the area have either gone back to their own hedonistic pleasures or started masturbating to the show you and Mitzi are giving. Kinarial isn’t even visible any more. There’s only a puddle of cum amongst a few discarded webs where you left him. You’ve missed your chance to deal with him permanently, but who cares? Lethice isn’t too far away, and you’re getting the fuck of a lifetime.");
	output("\n\nJust looking at the goblin’s smiling face as you smear it back and forth through puddles of girl-cum has you almost ready to go off. You swat her cushy heiny in between rapid-fire thrusts, wondering how you got so lucky while your orgasm rises up like a slumbering beast.");
	//Continue from both forks, no new PG
	output("There’s no harm in waking up with a sexpot milking every drop from your [pc.cocks]. You’ll be better prepared to deal with the trials and tribulations of new planets that way. Maybe someday you'll even knock her up, raise up an army of adoring gabilani children to continue your legacy.");
	output("\n\nThe thought of Mitzi, pregnant with a half-dozen of your daughters, riding on your dick in the morning flips your switch. You couldn’t stop yourself from cumming if the entire galaxy was scolding you.");
	if(pc.exhibitionism() >= 66) output(" Actually, that thought’s probably just going to make you blow that much harder. Damn you, exhibitionist fetishes!");
	output("\n\nWith another victorious slap on Mitzi’s ass, you bottom out.");
	if(pc.balls > 1) output(" Your [pc.balls] quake, pulling your [sack] taut against your body as they disgorge their creamy relief.");
	output(" You hold yourself there, pumping incessantly against your chosen cum-dump. Her face radiates absolute bliss. Goblins must have some kind of sense of when cum is splattering against their cervix, because you’ve never seen Mitzi happier, not even when you saved her, so long ago.");
	output("\n\nPulling out");
	if(pc.hasKnot(0)) output(" with a wet sounding pop after solid knotting");
	output(", satisfied, you grab your ");
	if(!pc.isCrotchExposed()) output("[pc.crotchCover]");
	else output("things");
	output(" and consider your options. Mitzi is still laying there");
	if(pc.cumQ() >= 3000) output(" with a cum-pregnant belly");
	if(pc.cumQ() >= 250) output(", spooge dripping down her thighs from her overfilled snatch");
	output(". She’s slowly rousing back to consciousness, but you should probably get on with your day.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("MITZI_FUCKED");
}

//Get Licked
//Something something Mitzi puts that 3’ tongue to use.
//Something something Mitzi puts that 3’ tongue to use on female PC
public function getLickedByMitzi():void
{
	clearOutput();
	showMitzi(true);
	author("Kinathis/Fenoxo");
	//You shrug and start stripping out of your [armor] while you have the chance. Demons aren’t exactly known for their trustworthiness, but she’s doing this as a show of strength. Resorting to trickery to beat a simple mortal might lower her subordinates’ opinions of her. If there’s one thing you’ve learned to count on with demons, it’s hubris.
	if(!pc.isCrotchExposed()) output("You start stripping out of your obstructing garments with a coy smile.");
	else 
	{
		output("You wiggle your hips with a coy smile");
		if(pc.balls > 0) output(", lifting your [pc.balls] away to reveal your [pc.vagina]");
		output(".");
	}
	output("\n\nThis goblin, like most of her kind, is obsessed with cock,");
	if(pc.hasCock()) output(" and, while you do have one for her to lavish her attention upon");
	else output(" and, while you may lack such bulgy organs");
	output(", that tongue you saw is just too much to pass up. You ");
	if(pc.legCount > 1)
	{
		output("spread your [pc.legs]");
		if(pc.balls > 0 && !pc.isCrotchExposed()) output(" and lift your [pc.sack]");
	}
	else output("lean back");
	output(", stretching your cunny with a pair of fingers. <i>“Get over here and put that tongue of yours to work. Prove to me you were worth bringing onboard.”</i>");
	output("\n\n<i>“Mitzi is the best slave, you’ll see.”</i> The little love-slave crawls her way to you, her eyes locked on your [pc.vaginas]. Her tongue slithers from her plump lips down... and down to her pillowy tits, wrapping around one sinfully thick nipple. The extensive organ flicks to the other, repeating the action before retreating into her smiling mouth. Mitzi’s small hands slide up your [pc.hips] as she leans in to plant small kisses up your inner thighs. Her eyes look up at you, mesmerized by the sight of your horny slit as only a sex-addled slut can be.");
	output("\n\nThe little greenskin tart worshipfully licks and kisses her way up your body, inching closer and closer to the nexus of your sexuality. You grin down at her and run your hands over her head, your fingers threading through her purple hair as you guide her closer and closer. Just another inch, so close you can feel her breath against your [pc.vagina]. You bite your lower lip in anticipation as you pull her in the final distance and press her pillowy lips against your nethers.");
	output("\n\nThe simple contact of flesh is the final straw for the barely restrained goblin, her lips seal against your cunt in a lewd kiss, her tongue lashing out to lick along your oozing entrance before darting inside like a serpentine tentacle. The sudden penetration brings a moan of pleasure to your lips as your nerves light up with delicious fire. You grip your playmate’s head tighter and pull her against your crotch. The goblin’s lips mash against your cunt, her tongue making love to the horny hole as her hands clutch at your hips. She delves deep within you, her writhing tongue slithering back and forth, sliding incessantly against every surface it can get at.");
	output("\n\nEager to please you, Mitzi lets out a whorish moan, her plump lips pressing harder against your entrance as she plunges her tongue into your body, thrusting the thick oral tentacle like a rutting lover. The tip teases your cervix, ticking the entrance to your womb at the apex of each deep, ecstatic plunge. Your legs quiver under the pressure of your sexual need. Your lips part in throaty moan; your own tongue darts out to lick your parched lips as you hold your little lover against you, forcing her to please your feminine sex.");
	output("\n\nMitzi might as well be a creature born of sapphic desire. She doesn’t show any sign of needing to breath or talk. It’s like her whole world is composed of vaginas, clits, and the fluids within. Her single mindedness is reflected in the motions of her unholy tongue, prowling around every sensitive fold to press on the most sensitive nerves, channeling your ");
	if(pc.vaginas[0].wetness() >= 4) output("copious ");
	output("lubrication down the crease in the middle of pussy-pleaser to collect in her mouth.");
	output("\n\nShe swallows noisily, making sure you can hear the sound of her gulp.");

	output("\n\nIt’s too much. You drop down to the ground");
	if(pc.legCount > 1) output(", [pc.legs] spread");
	output(", never letting go of the enthusiastic goblin’s hair on your way down. Her own tits cushion the fall just as your tingling netherlips muffle her sounds of surprise. If anything, the change in locale makes her even more determined in the motions of her tongue. She flexes the whiplike organ in ways that make your eyes cross and your [pc.nipples] ache.");
	output("\n\nYour fingers slowly drift from her hair as the pleasure mounts, finding their way to your unmolested chest. There, they do their damnedest to augment the ecstasy radiating out from your core, supplementing it with none-too-gentle tugs on your [pc.nipples]");
	if(pc.hasFuckableNipples()) output(" and eager fingering");
	output(". You moan again, whorishly declaring your love for the emerald slut’s tongue for anyone who’s listening to hear. Her twinkling eyes watch you excitedly while her tongue shifts its frenzied licking, bending up and out to encircle [pc.oneClit].");
	output("\n\nYou melt against your body’s own lava-hot sensations, incapable of controlling your own motions, aware that you’re [pc.hips] twist and thrust against Mitzi’s oral onslaught but unable to do anything but ride it like a ship caught in a tsunami. Somehow, the pleasure continues to grow inside you, stoked by the perpetual slithering of the goblin’s tongue, fed to the blissful beast now possessing your form. Your sweating body writhes like so many nearby demons, gradually going limper and limper until you can only manage a few exhausted twitches.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mitziLesboTongueFuckII);
}

public function mitziLesboTongueFuckII():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("When your vision clears, Mitzi is sitting on your lap and gently massaging your [pc.chest]. Only a few seconds have passed, but the nearby goblin's face is somehow cleaned already. You push the slut off and rise up onto your [pc.feet], well and truly sated.");
	output("\n\n<i>“What should Mitzi do now, [Master]?”</i> The harlot with the too-long tongue asks, licking her lips. <i>“Want another cum?”</i>");
	output("\n\nYou don’t have time to join in on the debauchery here, but you doubt this'll be the last time you make use of her services.\n\n<i>“Whatever you want to do. I should probably get to work.”</i>");
	output("\n\nMitzi’s lips puff out in a whorish pout. <i>“Oookay. Mitzi’s gonna go like, eat herself out now. [pc.Master]’s gotten her hooked on pussy!”</i>");
	processTime(1);
	IncrementFlag("MITZI_CUNTLICKED_PC");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Goblin Titfuck
//She’s got some big ol’ tiddies. Use ‘em!
public function goblinTittyfuckoo():void
{
	clearOutput();
	showMitzi(true);
	var x:int = pc.biggestCockIndex();
	output("You grin at the goblin and ");
	if(!pc.isCrotchExposed()) output("push your [pc.crotchCover] out of the way to expose ");
	else output("point at ");
	output("your [pc.cocks], explaining that you’d like to see her please your [pc.cock " + x + "] with her tits. After all, she's responsible for your current, rigid state");
	if(pc.balls > 1) output(" and too-full feeling balls");
	output(" thanks to all her teasing");
	output(". It’s only fitting that she satisfy you.");

	output("\n\nMitzi wastes no time in dropping to her knees and half crawling, half waddling over, her hard, purplish teats dragging on the ground whenever she tips too far forward, making her sweat-oiled breasts jiggle and bounce against one another. She blushes deeper from the stimulation, leaving a trail of fuck-me-juice on the floor behind her. When her nose finally reaches [pc.oneCock], she nuzzles against it, kissing softly against the veins while her nostrils flare excitedly.");

	output("\n\n<i>“Ohhh, it really needs a good cum, doesn’t it?”</i> Mitzi purrs after one particularly slobbery kiss. <i>“Do you want Mitzi to make you squirt fast or slow? She knows you’re in a hurry.”</i> The goblin wraps both her small hands around you and gently strokes. <i>“Please, [pc.Master], tell Mitzi how.”</i>");
	output("\n\nShe thinks she can get you off fast and let you return to hunting for your inheritance but is also offering to make love to your [pc.cock " + x + "] until the pleasure gradually overwhelms you. Which do you prefer?");
	processTime(5);
	pc.lust(10);
	//[Quick][Slow]
	clearMenu();
	addButton(0,"Quick",quickieTittyGobbotitfuck);
	addButton(1,"Slow",mitziSlowTitfuck);
}

//Slow
public function mitziSlowTitfuck():void
{
	clearOutput();
	showMitzi(true);
	var x:int = pc.biggestCockIndex();
	output("<i>“Nice and slow, please.”</i> You grab her by her mane of purple hair and press her face more firmly into your dick. <i>“Milk out every drop. There can’t be a single squirt left to distract me.”</i>");
	output("\n\nMitzi coos delightedly, <i>“Oooh, you’ll be sure to love Mitzi now! Your dick won't ever forget this!”</i> She kisses your [pc.cock " + x + "] with inflated lips so pillowy you could lie down on them for a nap. Her thick-painted, purple gloss allows them to slide up and down with the briefest nod to friction, planting wet, slobbery kisses across the underside. Your [pc.legOrLegs] go");
	if(pc.legCount == 1) output("es");
	output(" weak, to say nothing of your grip on her hair. She slides out of your nerveless fingers as you try to stay upright, giving her full range to please your phallus. Her tongue uncoils to coat the trunk in enough spit to dilute a galotian.");
	output("\n\nYou moan. There’s no point in holding it in, not here, in the confines of your ship. Even if you wanted to, you doubt you could resist the sheer carnality of your dick-obssessed bimbo-goblin, her every facet radiating pure sex. Looking her in the eyes is like gazing into a realm of drizzling slits and turgid, cum-hosing boners.");
	output("\n\n<i>“Don’t cum, [pc.Master],”</i> the greenskin slut pleads, <i>“You have to cum slowly. Mitzi promised.”</i> She deftly wraps a hand around your base to steady your quivering");
	if(pc.biggestCockLength() < 6) output(", tiny");
	output(" tower of meat");
	if(pc.biggestCockLength() < 6) output(", nearly obscuring the whole thing");
	else if(pc.biggestCockLength() >= 20) output(", barely able to support it");
	output(".");
	if(pc.cockTotal() > 1)
	{
		output(" She keeps the other");
		if(pc.cockTotal() > 2) output("s");
		output(" angled out of the way, though from time to time she favors ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" with a gentle, encouraging stroke. Her attention remains fixated squarely on the largest.");
	}
	output(" <i>“Though she’s never made someone come with kisses before...”</i> Mitzi brushes purple-dyed hair from her eyes and bends down press her lips against your [pc.cock " + x + "].");

	output("\n\nThe kiss is slow yet searing, a declaration of the kind of sinful dicklust that can only come from someone who had one too many orgasms under the influence of Dumbfuck, one whose desire for spunk has been augmented past any modicum of reason by countless hours of drug-fueled face-fucks. Mitzi’s lips make love to your [pc.cock " + x + "]. They worship it, smacking wetly from her repeated oral forays. Her tongue sometimes slides back and forth across your still-sealed urethra. Other times it roams out on lusty excursions to locate and lick every available vein.");

	output("\n\nGiggling, the viridian vixen collects your pre-cum on her tongue and spreads it across her puffy, purple cocksuckers until they shine like amethyst, glossed over by your own leaking desire. <i>“‘Course Mitzi’d never disobey [pc.Master]'s' command.”</i> She kisses the bare flesh above your insistent loins. <i>“Only the best titfucks for [pc.Master].”</i>");

	output("\n\nArching her back, Mitzi drags her oversized bosom");
	if(pc.balls > 0) output(" over your [pc.balls] and");
	output(" up to either side of your [pc.cock " + x + "], swaddling it in flesh that feels a little too cushy to be real. Her manicured fingertips press down from either side, tightening her vise until you feel her heartbeat hammering back against your boner, sending pleasant sensations thundering through the all-too-sensitive organ.");
	if(pc.biggestCockLength() >= 16) output(" You dribble yet more pre-cum onto the sweat-shined swells. Big as they are, they can’t quite ensconce your entire length, letting you watch it happen in lurid detail.");
	else output(" You dribble yet more pre-cum into her swampy cleavage. You can feel it getting slicker and slicker but can’t quite see it happen. You’ve nothing to go on but the feel against your [pc.cockHead " + x + "].");

	output("\n\n<i>“You like that?”</i> a voice somewhere above those two magnificent orbs asks.");
	output("\n\nYour acknowledgement comes out as half a groan and half a sublime sigh. Rocking back your head, you push your [pc.hips] a bit further forward, properly seating you inside the quaking cleavage.");

	output("\n\nMitzi asks, <i>“Do you want this slow or not?”</i> She slowly forces her breasts to bounce in pendulous, alternating motions, sliding and squelching around your drooling fuckstick. <i>“If you hump my tits, it won’t be as good. Promise.”</i> She winks pinching her nipples between her thumbs and index fingers.");

	output("\n\nYou lazily nod and grab a nearby beam for support, trying to hold back before the squeezing tits drive you go over the edge. Mitzi’s look like bigger than they feel, capped with obscene areolae and rigid tips that must be incredibly sensitive. She certainly seems to enjoy them, judging by the way she’s moaning as she massages your [pc.cock " + x + "].");

	output("\n\nLittle by little, the sensations assaulting you are overwhelming you. The feel of Mitzi’s exquisite tits on you could have you spurting in short order by themselves, but they aren't alone. They're matched by the goblin's flawless face. Her plush lips couldn't possibly be any more inviting, her heart-shaped eyes begging any more honestly for you to spill the hottest, most molten load into her syrupy-slick maw. You see it all; you smell Mitzi's passion, redolent in the air, pervasively reminding you that the goblin is getting off on this too.\n\nHow could you do anything but cum? How could you do anything but paint Mitzi's ecstatic features in a thick layer of [pc.cumColor]?");
	//, but you aren’t by yourself. You’re surrounded by cavorting forms of all manner of sensuality: succubi with over-sized jugs and flawless faces, muscular minotaurs with cocks that may as well be baseball bats, incubi so devilishly handsome that a nun would rebuke her faith for a single kiss, and a hundred more. You see them all. You smell their passion, redolent in the air, pervasive and encouraging. How could you do anything but cum? How could you do anything but paint Mitzi’s ecstatic features in a thick layer of white?");
	output("\n\nAnd just like that, the squeezing warmth vanishes, replaced by air that feels a little too cold to be comfortable. Your [pc.cock " + x + "] hangs in the air, exposed and twitching, on the edge of blowing and yet unable to without a hand from the greenskin.");
	output("\n\n<i>“Please,”</i> you gasp, feeling the moment start to pass. <i>“I need to cum!”</i>");
	output("\n\nMitzi chews her bottom lip, still caked with a veneer of your juices. <i>“Nope! You told me to make slow. Besides, everybody knows that " + pc.mf("masters","mistresses") + " say things they don’t mean when they’re all jizz-crazy! The last time I got someone off early, I didn’t get any dick for a whole day!”</i> She shakes her head. <i>“Just hold on, and you’ll go off like a cannon. I pussy-promise.”</i>");
	output("\n\nPussy-promise? What the hell is that?");
	output("\n\n<i>“Oh, you’re ready for more! Yay!”</i> Mitzi’s plush dick-massagers roll back into place before you can get a word in edgewise, turning your queries into a drawn-out moan. An undercurrent of the electric pleasure you’ve already felt lies beneath this new sensation, enhancing it further. If she gave you a few quick up and down jacks, she could have you frosting her boobs white in seconds, but she doesn’t. She keeps it nice and slow, a gentle massage that slides its way back and forth your entire length.");
	if(pc.biggestCockLength() >= 16) output(" Sometimes she even plants a few more kisses on your [pc.cockHead " + x + "] or just below. Other times she licks you like a lollipop - at least the parts not buried in bust.");
	output("\n\nYour head is swimming. No wonder you keep this goblin around! She’s so good with her breasts that they may as well be infused with black magic, transformed into tanks so overloaded with eroticism that they spark and fizz with it.");
	output("\n\nThe worst (or best) part is that she was right. You’re already feeling better than when you were at your peak. The desire to climax is still there, clawing at the back of your mind, but it’s buried behind a thicker wall of pleasure, numbed by the knowledge that her cutting you off once more might lead to further bliss.");
	output("\n\nMitzi’s dusky eyes flick up at you as she works, favoring you with a smile. <i>“Somebody’s getting into it now, isn’t [pc.heShe]?”</i> She bounces her boobs around a little faster, thrilling you with more excitement than you can handle. <i>“Yeah, you’re so close to blowing it, aren’t you?”</i> She smushes them down on either side, twisting her torso to drag them laterally across your overfull [pc.cockNounSimple " + x + "], surrounding you in a vortex that threatens to wring every drop of cum from your body. <i>“So close to just giving in.”</i>");
	output("\n\nMuscles in your abdomen twitch.");
	if(pc.balls > 1) output(" Your [pc.balls] feel like they’re going to burst, clenching tight beneath your [cocks].");
	output(" The edge is right there. You could go over now - just one hard thrust, and you could do it.");
	output("\n\nOnce again, Mitzi pulls back before you can get there, leaving your angry shaft there to quiver impotently in the air, still webbed to her strings of pre-cum that never seems to run out. Her tits are glossy and wet with a mixture of it and her sweat. She extends one finger, glistening with sweat or girlcum or something else entirely, and gently taps your [pc.cock " + x + "].");

	output("\n\n<i>“No.”</i> She taps it again. <i>“No cummies yet!”</i> The purple-haired tart squats in a puddle of her own pussy juices and repeats, <i>“No cumming for either of us.”</i> Her tongue licks her lips. <i>“It’ll be so good when we both get off, though won’t it?”</i> She almost moans the last half of it, rocking her hips back and forth across her heel. A seriously engorged clit bumps and grinds with each pass, threatening to detonate and set off an explosion of bliss in the poor goblin’s brain.");

	output("\n\nGradually, the involuntary contractions running through your frame fade, leaving you still hard, still unsatisfied, and still standing there with your dick out in front of the sluttiest creature you’ve seen. Even the breezes feel good on your dick.");

	output("\n\nThen her breasts are compressing about you once more, wringing more ecstasy from your [pc.cock " + x + "] than you knew it could give short of an orgasm. Echoes of your past almost-gasms combine with the swelteringly slick embrace enfolding you, making it difficult to do anything but moan for the miniature slut. Part of you wonders what her pussy must feel like if her tits can wring this much excitement from you.");
	output("\n\n<i>“Ohh, someone’s quivering!”</i> Mitzi announces with delight. <i>“All hot and sticky in momma Mitzi’s titties!”</i> She jogs her jugs up and down a little quicker. Your [pc.cockHead " + x + "] balloons between them, threatening to go off. It’s so much more sensitive than normal, so achingly hard and ready to go. <i>“It’s building up again, isn’t it?”</i>");
	output("\n\nIf it wasn’t before, it is now. You can feel your climax crawling through the haze of overwhelming pleasure, your body pushing your spunk closer and closer to the bursting point. If Mitzi pulled off right now, you’d probably still wind up dripping ribbons of the white stuff.");
	output("\n\n<i>“Are you going to do it this time?”</i> Mitzi moans. <i>“It feels like you might.”</i> Her skin feels so hot against yours, blushing dark from her toes to the tips of her hair. Her eyes are luminous and searching, like she’s as ready to cum as you are. <i>“Do you think you can hold another in?”</i> She gives you a quick pump and backs off once more, exposing your pre-oiled length to the air - and her lusty gaze.");
	output("\n\nIt’s twitching powerfully");
	if(pc.cockTotal() > 1)
	{
		output(" - they ");
		if(pc.cockTotal() == 2) output("both");
		else output("all");
		output(" are, even the one");
		if(pc.cockTotal() > 2) output("s");
		output(" not getting much of her attention");
	}
	else output(", flinging ropes of pre against your belly and Mitzi’s face");
	output(". You’re so close; you can feel it, can feel that hot load bubbling up your urethra");
	if(pc.cockTotal() > 1) output("s");
	output(", on the cusp of firing everywhere. Mitzi’s licking her lips and tugging on her ardor-distended nipples, her jaw open so that you can admire the ridiculously plushness of her lower lip and just how good it would look coated in a layer of virile love.");
	output("\n\n<i>“Mmmm,”</i> the green slut moans. Gingerly, she extends that same wet digit in your direction. It smells heavily of feminine arousal. At some point, she must have found time to rub it around inside her gushing box. Slowly - too slowly - she presses her soft fingertip against the underside of your [pc.cockHead " + x + "]. <i>“You’re ready, finally. I could take you over the edge just by blowing on you, couldn’t I?”</i>");
	output("\n\nGods, she’s right. Your eyes roll back as you nod, the feeling of a single digit against your pulsating shaft taking you to the teetering edge of explosive orgasm.");
	output("\n\nMitzi husks, <i>“Good. Now let Mitzi give it to you.”</i> She drags her fingertip down your flexing urethra, closer and closer to where the cum is bubbling within you, setting off explosions of heat and lust within your mind. A yawning, infinite abyss of ejaculation and relief stares back at you, and can do naught but fall into it. Powerful contractions wrack your body, increasing your desire and pleasure exponentially. You couldn’t stop yourself if you wanted to.");
	output("\n\nGiggling, Mitzi slips you right back into her dick-slicked tits, wrapping one arm around them to pin your [pc.cockHead " + x + "] deep inside, buried in so much boob that your ");
	if(pc.legCount > 1) output("[pc.legs] nearly give out");
	else output("[pc.leg] nearly gives out");
	output(" from the wondrous sensation. Her other hand briefly reaches down, then diverts upward to fondle a nipple, the feeling of grinding her weeping slit against her own foot enough to bring her off unaided.");
	output("\n\nJizz bubbles out of your [pc.cock " + x + "] in fits and starts, turning the slippery cleavage into a sordid swamp. Bubbles of the white stuff spurt up out the top while runnels of spunk gild the goblin’s middle, pooling in her belly-button. Your [pc.hips] jerk and spasm, forcing you to hump her on instinct, breeding her boobs like a [pc.manWoman] possessed, equal parts amazed and determined to fill them to overflowing.");

	//High cum!
	if(pc.cumQ() >= 9000)
	{
		output("\n\nLittle does Mitzi know just how capable a breeder you are. You fill the space between her tits with a sea of thick goo long before you finish jizzing. Her thighs and dusky slit are drenched soon after, painted in a sheen of [pc.cumColor]. The quivering greenskin recovers from her own pleasure long before you even finish, staring in confusion and delirious desire at the ever-greater quantities of jism you produce. Sliding her [pc.cumNoun]-slick melons down, she pops your [pc.cockHead " + x + "] out to drench her face and hair with the last of your issue, greedily catching fragrant globs on her too-long tongue.");
	}
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mitziSlowTitfuckPostgasm);
}

public function mitziSlowTitfuckPostgasm():void
{
	clearOutput();
	showMitzi(true);
	output("When you finally exhaust yourself, your [pc.legOrLegs] give");
	if(pc.legCount == 1) output("s");
	output(" out, and you collapse, sliding your still-hard shaft from betwixt those heavenly globes one last time. Mitzi falls away from you in the other direction, breathing heavily and idly masturbating herself with your [pc.cumNoun] as her lube. Her high-pitched voice moans, <i>“Oooh, [pc.Master]!”</i> or some variation of it again and again.");
	output("\n\nYou sit up, noting that she’s positioned herself so that her lust-engorged quim is stuffed full of fist. She's humping her hand and crying in absolute delight, cooing about how she has the best [pc.Master] in the whole galaxy. Tears of unfettered joy stream down the goblin's face as her eyes roll back from raw pleasure. At last, her knees slap together, quivering madly, and Mitzi slumps back, satisfied into unconsciousness.\n\nYou know how she feels.");
	//output("\n\nBut... you’ve got a demon queen to face down. If you want to have the goblin as your own, all you have to do is tell her to wait for you outside... Do you keep her?");
	processTime(5);
	IncrementFlag("MITZI_TITFUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Quick
public function quickieTittyGobbotitfuck():void
{
	clearOutput();
	showMitzi(true);
	output("<i>“Do it quick, if you really can,”</i> you answer the petite green slut.");
	var x:int = pc.biggestCockIndex();
	output("\n\nMitzi presses your [pc.cock " + x + "] against the side of her face and looks up at you, her eyes wide and excitement and lust. <i>“You’re going to love this [pc.Master]. You won’t be able to resist taking Mitzi home with you after.”</i>");
	output("\n\nThe confident slut rises up, arching her back to bring her pendulous breasts up against your [pc.cocks]");
	if(pc.balls > 0) output(", her nipples dragging over the skin of your [pc.sack]");
	output(". Matter of factly, she grabs her own tits and pulls them apart, revealing an expanse of green flesh made slippery by her own sweat. [pc.EachCock] sinks right into the welcoming valley a second before she brings her girls back to close around you, enveloping your length");
	if(pc.cockTotal() > 1) output("s");
	output(" in slick, soft boobflesh. Her chest feels almost molded to your [pc.cocks], designed to press evenly on every sensitive place. You can’t help but give a little throb of excitement.");
	output("\n\nThe keen little slut picks up on it and flashes you another knowing smile, following it up by dropping to her knees and sliding [pc.eachCock] through her love-pillows until the tip");
	if(pc.cockTotal() > 1) output("s are");
	else output(" is");
	output(" exposed to her purple-painted lips and drooling tongue. She gobbles [pc.oneCock] up in a hurry, easily wrapping her spit-soaked tongue around its circumference while her cheeks hollow from her near-constant sucking.");
	output("\n\nYou tremble a little bit. You didn’t expect she’d have your [pc.cocks] so hard so fast, and you certainly didn’t expect she’d have your hips quivering and ready to thrust.");
	output("\n\nMitzi moves to the next stage of her tittyfuck while you’re still trying to come to grips with the way her tongue curls and presses on the sensitive spot below your [pc.cockHead " + x + "]. She expertly drags her jugs down, bouncing them off your crotch in order to slide them back up without a second of downtime. Fuck, this greenskin knows how to make a [pc.guyGirl] blow his load!");
	output("\n\nYou can feel the pleasure spasms in your gut starting already, and she’s only been touching your [pc.cocks] for thirty seconds or so! Mitzi mischievously meets your gaze and works her breasts faster, wetly slapping them against your [pc.hips] to a regularly building rhythm. By the time you begin to twitch and moan, her voluptuous tits are a blur of green around your [pc.cocks], but when you start to erupt, she slows to match the orgasmic throbs running through your body, milking you for every drop.");
	//Low cum
	if(pc.cumQ() < 100) output("\n\nHer lips never leave your tip; she swallows every drop with the kind of pleased expression that can only come from experiencing something extremely fulfilling.");
	//High cum
	else output("\n\nShe tries to keep her lips glued to your tip, her throat gulping noisily in an attempt to swallow every drop of your gushing cum, but she just can’t keep up. The volume of spermy fluid pushes her off your [pc.cockBiggest], throwing a tremendously thick rope across her face. She dazedly drools spunk from her purple-painted lips while you coat her hair and face in a mask. Somehow, she looks extremely fulfilled.");
	//Multidick, no new PG
	if(pc.cockTotal() > 1)
	{
		output(" She only has one mouth, so the rest of your load spills across her bouncing tits, building to a milky froth between the quivering, dick-milking mounds. One of her hands starts smearing it around before you’ve even finished.");
	}
	//Merge
	output("\n\nThe cock-hungry goblin never completely stops either, attacking your oversensitive member");
	if(pc.cockTotal() > 1) output("s");
	output(" with the kind of reckless abandon that could only come from a goblin fuckslave. Your [pc.legOrLegs] wobble");
	if(pc.legCount == 1) output("s");
	output(" and [pc.eachCock] bulges obscenely, unsure if it should wilt or start shooting a whole ‘nother load.");

	output("\n\nLucky for you, you manage to stumble back before she has you ready to go again. Mitzi bats her ");
	if(pc.cumQ() >= 100) output("cummy ");
	output("eyelashes at you and pushes a stray droplet of spooge past her puffy cocksuckers, swallowing noisily.");
	processTime(10);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}