import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;
import classes.Items.Apparel.SavicitePanties;
import classes.Items.Combat.RuttingPerfume;
import classes.Items.Toys.MitziBionaHole;

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

MITZI_CUM_PRESENTS			cum bubbles given from bubble buddy



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

public var MITZI_INV_SLOT_MAX:int = 55;

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
	showBust(mitziBustString(nude));
}

public function showMitziVD(nude:Boolean = false):void
{
	showName("\nMITZI");
	if(!nude) showBust("MITZI_VALENTINES");
	else showBust(mitziBustString(nude));
}

public function mitziBustString(nude:Boolean = false):String
{
	var dressString:String = "";
	var dress:ItemSlotClass = mitziCurrentDress();
	if(nude) dressString = "_NUDE";
	else if(dress is MitzisDress || !mitziIsCrew()) dressString = "_PINK_DRESS";
	else if(dress is SchoolgirlCostume) dressString = "_SCHOOLGIRL";
	else if(dress is MitzisYogaBikini) dressString = "_YOGAPANTS";
	else if(dress is MitzisLibrarianOutfit) dressString = "_LIBRARIAN";
	else if(dress is TransparentZipsuit) dressString = "_ZIPSUIT";
	else if(dress is MitzisSuccBikini) dressString = "_BIKINI";
	else if(dress is MitziCowFetishCostume) dressString = "_COW";
	else if(dress is MitziNunFetishCostume) dressString = "_NUN";
	else dressString = "_PINK_DRESS";
	return ("MITZI" + dressString);
}

public function mitziAvailable():Boolean
{
	return (!pc.hasStatusEffect("Mitzi Disabled") && !pc.hasStatusEffect("Mitzi_Gushed_Out") && !pc.hasStatusEffect("MITZI_SOAK_SCHLICKING"));
}

//Mitzi first appears in the stellar tether dungeon in an empty square.
public function stellarMitziBonus():Boolean
{
	if(flags["MITZI_RESCUED"] == undefined)
	{
		output("\n\nA naked, cum-covered gabilani technician is tied to a post and drooling, fucked into exhaustion. You could help her escape, if you wanted to.");
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
	return false;
}

//Untie:
public function untieMitzi():void
{
	clearOutput();
	showBust("MITZI_NUDE");
	showName("GRATEFUL\nGABILANI");
	output("You make short work of her bindings, and your presence seems to rouse her somewhat.");
	output("\n\n<i>“No... no more.”</i> She burps groggily and staggers up to her feet with your help. <i>“Oh... not pirate?”</i>");
	output("\n\n<i>“No, I’m not a pirate.”</i> You explain to her that you’re dealing with the pirates and inform her how to get to safety.");
	output("\n\nThe Gabilani tech disgustedly wipes semen from her face and nods. <i>“Thanks. I won’t forget this. I promise.”</i> She runs off in a hurry.");
	flags["MITZI_RESCUED"] = GetGameTimestamp();
	if(rooms[currentLocation].hasFlag(GLOBAL.NPC)) rooms[currentLocation].removeFlag(GLOBAL.NPC);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function mitziOutsideShip():Boolean
{
	//trace("MITZI RESCUED: " + flags["MITZI_RESCUED"] + "\nTimestamp: " + GetGameTimestamp() + "\nDISABLED? " + flags["MITZI_DISABLED"]);
	return ((flags["MITZI_RESCUED"] + 60*24*8 < GetGameTimestamp() && !mitziIsCrew() && flags["MITZI_DISABLED"] == undefined && flags["MITZI_RESCUED"] != undefined && shipLocation == "TAVROS HANGAR") || (mitziRecruited() && !mitziIsCrew() && flags["MITZI_DISABLED"] == undefined));
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
	output("\n\n<i>“Oh, [pc.heShe] helped Mitzi get away from the bad pirates, especially the one with the huge dick that gave Mitzi Dumbfuck.”</i> She pauses and chews her puffy lip bashfully. <i>“Was really mad at first, but then Mitzi figured out fucking was way more fun that programming and engin... engine-ear-wing anyway! So Mitzi thinks, dumb cunt that she is now, that like, maybe [pc.name] could use a fuck-slave. Mitzi’s head is all full of cocks, and pussies, and balls, and tits, and clits, and cum... so much cum.”</i> She pulls herself coser, and breasts a little too large for her frame squeeze against your [pc.legFurScales]. One hand ");
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
	flags["MET_MITZI"] = 1;
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
	output("\n\n");
	if(pc.isBro()) output("<i>“You okay?”</i> you grunt.");
	else if(pc.isBimbo()) output("<i>“Wow! You came so hard, and I like, barely did anything! Are you all right?”</i>");
	else if(pc.isNice()) output("<i>“Mitzi! Are you alright?”</i>");
	else if(pc.isMischievous()) output("Are you... are you okay?”</i>");
	else output("<i>“Is that gonna happen every time we make-out?”</i>");
	output("\n\nA breathless, momentarily satisfied Mitzi beams up at you. <i>“Mitzi wasn’t sure about becoming a fuck-toy...”</i> She staggers up onto her feet and hugs your ");
	if(pc.tallness >= 5*12) output("[pc.leg]");
	else output("waist");
	output(". <i>“But now Mitzi knows how good it feels to be </i>owned<i>. How good it makes her pussy gush to be </i>your toy<i>. Gods!”</i> She whimpers and rubs herself through her dress. <i>“Did Mitzi do good?”</i> Doe-eyed, the gabilani slut looks up for your approval.");
	processTime(12);
	flags["MET_MITZI"] = 1;
	pc.changeLust(5);
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
	output("\n\nWiggling happily, Mitzi cheers, <i>“Yay! Mitzi knew she would be a good slut for [pc.name]. [pc.Master], can Mitzi have room on ship since she’s such a good toy?”</i> She rubs your crotch brazenly, looking up and batting her lashes over pink, heart-shaped eyes.");
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
	output("You turn down the offer. There’s plenty of sex to be had without attaching yourself to a nympho.");
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
	if(pc.isAss()) output("You tell Mitzi to hit the road. You need the space for other crewmates.");
	else output("You ask Mitzi if she can stay somewhere else for a while. You’ve got to make some adjustments to your ship’s crew roster.")
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
//PC can gift her any “armor” class item with a sexiness of 5 or more, and she will wear it.
//PC can dress her up, but only if he strips her down.
//Mitzi got picked up by a drug-dealer on his way through Tarkus and has a ton of “special treats” for her lover, including once-weekly presents of throbb or gush. This is basically a reskin of CoC goblin potions/salves.
//Sometimes wears illegal perfumes like “rutting,” “heat,” “priaprism”, and “adulation”. The first three can induce the relevant statuses... the latter results in the loviest oral pairing scene I can write.

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
	var cname:String = getQualifiedClassName(arg);
	if(getQualifiedClassName(mitzi.armor) == cname) return true;
	for(var x:int = 0; x < mitzi.inventory.length; x++)
	{
		//Found the item in her inventory
		if(getQualifiedClassName(mitzi.inventory[x]) == cname)
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

public function displayMitziInventory():void
{
	output("<u>Mitzi has the following outfits available:</u>");
	
	if(mitzi.inventory.length <= 0)
	{
		output("\n<i>Mitzi currently has no outfits in her wardrobe!</i>");
		return;
	}
	
	output("\n(<b>Worn</b>) " + StringUtil.upperCase(mitzi.armor.description, false));
	for(var x:int = 0; x < mitzi.inventory.length; x++)
	{
		if(x >= MITZI_INV_SLOT_MAX) output("\n<span class='bad'>" + StringUtil.upperCase(mitzi.inventory[x].description, false) + "</span>");
		else if(getQualifiedClassName(mitzi.armor) != getQualifiedClassName(mitzi.inventory[x]))
		{
			output("\n" + StringUtil.upperCase(mitzi.inventory[x].description, false));
		}
	}
}
public function dressMitziUpMenu():void
{
	clearMenu();
	
	addButton(0,"Wear Item",dressMitziUpApproach,undefined,"Wear Item","Have Mitzi wear an item from her wardrobe.");
	
	if(pc.inventory.length > 0) addButton(1,"Give Item",giveMitziANewItem,undefined,"Give Item","Give Mitzi a piece of clothing to wear around. As she typically avoids underwear, it will have to be an armor slot item.");
	else addDisabledButton(1,"Give Item","Give Item","You have nothing in your inventory to give to Mitzi!");
	
	if(pc.inventory.length < pc.inventorySlots()) addButton(2,"Take Item",takeMitziItem,undefined,"Take Item","Take and item from Mitzi’s wardrobe.");
	else addDisabledButton(2,"Take Item","Take Item","Your inventory is too full for this!");
	
	if(mitzi.inventory.length > 0) addButton(3,"Destroy Item",destroyMitziItem,undefined,"Destroy Item","Destroy an item from Mitzi’s wardrobe.");
	
	addButton(14,"Back",approachCrewMitzi,true);
}

public function giveMitziANewItem():void
{
	clearOutput();
	showMitzi();
	var buttons:int = 0;
	var x:int = 0;
	
	output("What would you like to give to Mitzi?");
	clearMenu();
	addButton(14,"Back",dressMitziUpMenu);
	
	for(x = 0; x < pc.inventory.length; x++)
	{
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", dressMitziUpMenu);
			buttons++;
		}
		
		if((pc.inventory[x].type == GLOBAL.ARMOR || pc.inventory[x].type == GLOBAL.CLOTHING))
		{
			var cname:String = getQualifiedClassName(pc.inventory[x]);
			
			if(pc.inventory[x].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) addItemDisabledButton(buttons, pc.inventory[x], null, "You cannot drop this item.");
			else if(pc.inventory[x] is GooArmor) addItemDisabledButton(buttons, pc.inventory[x], null, "Mitzi is unable to wear this!");
			else if(cname == getQualifiedClassName(mitzi.armor)) addItemDisabledButton(buttons, pc.inventory[x], null, "Mitzi is already wearing one of these!");
			else if(mitzi.hasItemByClass(getDefinitionByName(cname) as Class)) addItemDisabledButton(buttons, pc.inventory[x], null, "Mitzi already has one of these.");
			else if(pc.inventory[x].sexiness >= 5) addItemButton(buttons,pc.inventory[x],giveMitziANewItemForReal,x);
			else addItemDisabledButton(buttons, pc.inventory[x], null, "<b>This isn’t sexy enough for Mitzi.</b>");
		}
		else addItemDisabledButton(buttons, pc.inventory[x], null, "<b>Mitzi won’t wear this type of item.</b>");
		buttons++;
		
		if(pc.inventory.length > 14 && (x + 1) == pc.inventory.length)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", dressMitziUpMenu);
		}
	}
}

public function giveMitziANewItemForReal(arg:int):void
{
	clearOutput();
	showMitzi();
	output("You give Mitzi your " + pc.inventory[arg].longName + ".");
	output("\n\n<i>“Holyshitreally?”</i> Mitzi hugs your [pc.leg] crushingly tight. Little bimbo tears streak down her cheeks. <i>“You’re the best, [pc.Master]. Mitzi is going to wear this for you right now!”</i>\n\nUnsurprisingly, she makes it look hot as hell.");
	//Shove that shit in Mitzi's inventory
	mitzi.inventory.push(pc.inventory[arg]);
	//Have her equip it.
	mitziEquip(pc.inventory[arg]);
	pc.inventory.splice(arg,1);
	if(!pc.hasStatusEffect("Mitzi Dressed")) pc.createStatusEffect("Mitzi Dressed");
	pc.setStatusMinutes("Mitzi Dressed",24*60*4);
	clearMenu();
	addButton(0,"Next",approachCrewMitzi,true);
}

public function dressMitziUpApproach():void
{
	clearOutput();
	showMitzi();
	output("You inform Mitzi that you’re going to pick out something for her to wear.");
	output("\n\n<i>“Oooh, really? Mitzi has like, the best [pc.Master]! Who else would care enough to pretty up [pc.hisHer] favorite sex-toy?”</i>");
	output("\n\n");
	displayMitziInventory();
	
	processTime(1);
	
	clearMenu();
	addItemButton(0, mitzi.armor, mitziKeepCurrentOutfit, mitzi.armor);
	
	var buttons:int = 1;
	var x:int = 0;
	var invLimit:int = mitzi.inventory.length;
	if(invLimit >= MITZI_INV_SLOT_MAX) invLimit = MITZI_INV_SLOT_MAX;
	
	for(x = 0; x < invLimit; x++)
	{
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", dressMitziUpMenu);
			buttons++;
		}
		
		if(getQualifiedClassName(mitzi.armor) != getQualifiedClassName(mitzi.inventory[x]))
		{
			addItemButton(buttons, mitzi.inventory[x], mitziPCPickOutfit, mitzi.inventory[x]);
			buttons++;
		}
		
		if(invLimit > 14 && (x + 1) == invLimit)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", dressMitziUpMenu);
		}
	}
	
	output("\n\nWhat will you have her wear?");
	addButton(14,"Back",dressMitziUpMenu);
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
	pc.changeLust(3);
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
	if(pc.libido() >= 60) output(", and you can’t help but give it a quick kiss");
	output(".");
	output(ParseText("\n\nThe bimbo goblin makes a show of peeling out of her [mitzi.armor] and slowly unveiling more and more of her almost perfectly smooth skin. You have to shut down multiple attempts at sex just to keep her simple mind on task, but after the third rejection, she gets the hint and slips into her newly designated slut-wear."));
	mitziEquip(arg);
	output(" <i>“Mmmm, maybe this’ll get you to fuck me. What do you think, [pc.Master]?”</i> Mitzi twirls. <i>“It makes you want to fuck Mitzi to pieces, doesn’t it?”</i>");
	pc.changeLust(5);
	processTime(2);
	showMitzi();
	clearMenu();
	addButton(0,"Next",approachCrewMitzi,true);
}

public function takeMitziItem():void { dropMitziItem(); }
public function destroyMitziItem():void { dropMitziItem(true); }
public function dropMitziItem(destroy:Boolean = false):void
{
	clearOutput();
	showMitzi();
	output("What item do you want to " + (!destroy ? "take back" : "destroy") + "?");
	output("\n\n");
	displayMitziInventory();
	
	clearMenu();
	var buttons:int = 0;
	var x:int = 0;
	var invLimit:int = mitzi.inventory.length;
	if(invLimit >= MITZI_INV_SLOT_MAX) invLimit = MITZI_INV_SLOT_MAX;
	for(x = 0; x < invLimit; x++)
	{
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", dressMitziUpMenu);
			buttons++;
		}
		
		if(destroy && mitzi.inventory[x].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) {
			addItemDisabledButton(buttons, mitzi.inventory[x], null, "You cannot destroy this item.");
		}
		else if( (mitzi.inventory[x] is MitzisDress)
		||	(mitzi.inventory[x] is SchoolgirlCostume)
		||	(mitzi.inventory[x] is MitzisYogaBikini)
		||	(mitzi.inventory[x] is MitzisLibrarianOutfit)
		||	(mitzi.inventory[x] is TransparentZipsuit)
		||	(mitzi.inventory[x] is MitzisSuccBikini)
		||	(mitzi.inventory[x] is MitziCowFetishCostume)
		||	(mitzi.inventory[x] is MitziNunFetishCostume)
		) {
			addItemDisabledButton(buttons, mitzi.inventory[x], null, "Mitzi is not willing to part with this outfit!");
		}
		else addItemButton(buttons, mitzi.inventory[x], mitziPCDropOutfit, [x, destroy]);
		buttons++;
		
		if(invLimit > 14 && (x + 1) == invLimit)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", dressMitziUpMenu);
		}
	}
	
	addButton(14,"Back",dressMitziUpMenu);
}
public function mitziPCDropOutfit(arg:Array):void
{
	var idx:int = arg[0];
	var item:ItemSlotClass = mitzi.inventory[idx];
	var destroy:Boolean = arg[1];
	
	clearOutput();
	author("Jacques00 & Fen");
	
	if(!destroy)
	{
		output("<i>“You want this back already?”</i> Mitzi asks, holding up the chosen outfit. <i>“Like, I was totally going to wear this, like... sometime...”</i>");
		output("\n\nMitzi puts the outfit on an extra hangar and hands it over. <i>“Okay, but Mitzi hopes you’ll dress your little slut-goblin up again!”</i>");
		output("\n\n");
		
		itemCollect([item]);
		mitzi.inventory.splice(idx, 1);
	}
	else
	{
		output("<i>“Aw... you must really hate this one, huh?”</i> Mitzi says, holding up the outfit as her large eyes glisten in the light.");
		output("\n\nThe goblin girl sadly flattens out the piece and drops it into the trash chute. <i>“So like... you must really wanna see Mitzi slutted up in the other stuff!”</i>");
		
		output("\n\n<b>Mitzi removed " + item.description + " from her wardrobe.<\b>");
		mitzi.destroyItemByReference(item);
	}
	
	processTime(2);
	showMitzi();
	clearMenu();
	addButton(0,"Next",dressMitziUpMenu);
}

//Mitzi crew bonus and approach screen is clothing dependent:
public function mitziCrewBonus(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var dress:ItemSlotClass = mitziCurrentDress();
	var buff:String = "";
	
	//SPECIAL MITZI TEXTS:
	if(pc.hasStatusEffect("Mitzi Disabled")) buff += "\n\nMitzi isn’t anywhere to be found." + (amberIsCrew() ? " She’s probably up to something with Amber.":"");
	else if(pc.hasStatusEffect("MITZI_SOAK_SCHLICKING")) buff += "\n\nMitzi is locked in her room, but not even that can stop the scent of soaking-wet pussy from lingering in the hall." + (flags["SOAK_TIMES_USED"] == undefined ? " Just how long does Soak last?":" You know all too well what she’s going through... Maybe you should take the next dose yourself.");
	//Milky Mitzi still recovering
	else if(pc.hasStatusEffect("Mitzi_Gushed_Out"))
	{
		if(rand(2) == 0) buff = "\n\nMitzi is in her bathroom, kneeling in the shower and tugging on her nipples. Soft, emphatic moos can be heard every now and then, accompanied by wet-sounding splats. You put your ear to the door and listen: <i>“Miss Moo is... Miss Moo? Noooo, wrong mooooo. Mmm, milking feels so gooood! [pc.Master] won’t fuck Moo if she doesn’t remember her name... Missy or Mimsy... MOOOO!”</i> You pull away and decide to <b>let her recover from that Gush dose in privacy.</b>";
		//Repeat recovery
		else buff = "\n\nMitzi is in her bedroom, milking her prodigious teats and mooing like a barnyard animal. Every now and then you hear an orgasmic screech and a liquid spattering followed by a high-pitched cry of, <i>“[pc.Master] so good to Moooo!”</i> <b>Mitzi still needs to recover from her recent bout with Gush.</b>";
	}
	else if(pc.hasStatusEffect("Mitzi_Gush_Thankyou")) buff = "\n\n<b>Mitzi has recovered from that dose of Gush!</b> She may be a little more top-heavy now, but she’d really like to see you.";
	
	//NORMAL MITZI TEXTS:
	//Pink dress
	else if(dress is MitzisDress)
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
		buff += "\n\nMitzi crawls around the ship on all fours. Brownish pads designed to resemble hooves guard her knees while pitch-black socks hide everything behind. Shoulder-length white gloves, marked with patchwork black splotches, complement her panties and nursing bra. She’s even painted her spaded tail to resemble a puff of brown fur. Anyone can put together a cow-girl costume, but Mitzi takes it to the next level. Trails of dribbling white mark her path, thanks to ";
		if(flags["MITZI_GUSHED"] != undefined) buff += "the time you gave her Gush";
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
		buff += "\n\nYour self-titled “pet goblin” can be found kneeling in front of your cockpit chair, hands steepled together in something that resembles prayer. Her mouth hangs wide-open in preparation to receive her " + pc.mf("lord’s","mistress’s") + " sexual sacrament. She has chosen to dress herself in the white and black of a nunnery, but like everything Mitzi touches, it’s been tarted up beyond indecency to deep perversion. A plunging neckline filled with cheap, transparent plastic dutifully displays her emerald orbs and the cusps of her dusky nipples. From the waist down, the rest of the garment tapers to a scanty ‘v,’ revealing Mitzi’s plump pussy through the too-thin fabric. Every fold and crease is plain to see, promising a heavenly sanctuary to any who dare enter.";
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
	
	if(pc.hasStatusEffect("Mitzi_Gushed_Out")) addDisabledButton(btnSlot,"Mitzi","Mitzi","Maybe let her recover from that Gush, huh?");
	else if(pc.hasStatusEffect("Mitzi Disabled")) addDisabledButton(btnSlot,"Mitzi","Mitzi","Mitzi’s not around at the moment." + (amberIsCrew() ? " She’s probably getting into trouble with Amber.":""));
	else addButton(btnSlot,"Mitzi",approachCrewMitzi);
	
	return (showBlurb ? buff : "");
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
	if(pc.hasStatusEffect("Mitzi_Gush_Thankyou"))
	{
		pc.removeStatusEffect("Mitzi_Gush_Thankyou");
		IncrementFlag("MITZI_GUSH_THANKED");
		//First time approach
		if(flags["MITZI_GUSH_THANKED"] == 1)
		{
			output("Mitzi smiles dizzily. Her breasts, you note, remain ever so slightly larger than before you gave her gush, but awareness has returned to her eyes. <i>“Thanks for like, giving Mitzi that Gush, [pc.Master].”</i>");
			output("\n\nYou tell her that it was your pleasure.");
			output("\n\nShe blushes from head to toe and nods, <i>“So like, now that Mitzi can remember her name and stuff, did you wanna do it again?”</i> Milk seeps from her nipples");
			if(!mitzi.isChestExposed()) output(" into her [mitzi.armor]");
			output(". <i>“Mitzi promises she’ll be so milky and happy for you. You can do whatever you want with her big, dumb cow-boobs!”</i>");
			output("\n\n<b>It would seem you have a milky goblin now</b>, one who is eager to repeat the experience.");
		}
		//Repeat post-gush approach.
		else
		{
			output("Mitzi pokes a breast. <i>“Mitzi’s titties are getting bigger thanks [pc.Master]. And so milky!”</i> She squeezes a nipple to release a ");
			var milkQ:Number = mitzi.milkQ();
			if(milkQ < 400) output("spray");
			else if(milkQ < 5000) output("gush");
			else output("eruption");
			output(" of creamy goblin milk. <i>“See? Mitzi’s a fuck-toy and a milk-cow now, and she </i>still<i> remembers her name. All because [pc.Master] is so generous.”</i> She shakes her breasts back and forth. <i>“So you can like, make her a stupid fuck-cow as whenever you want, pretty much. Mitzi will love whatever you do to her big, dumb cow-tits. They’re [pc.Master]’s to milk!”</i>");
			output("\n\n<b>");
			if(milkQ < 2000) output("Mitzi is lactating even harder now.");
			else if(milkQ < 5000) output("Mitzi is basically a walking milk-fountain now.");
			else if(milkQ < 30000) output("Mitzi is capable of soaking you in milk at a moment’s notice.");
			else output("Mitzi has reached the absolute limits of milkiness. Any more and she’d break the universe.");
			output("</b> Any time you want to reduce her to a simpering milk-slut, she’s game. Of course she’s going to make a mess even if you don’t now.");
		}
	}
	else
	{
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
				else output(", but [pc.Master] doesn’t give her enough Gush!”</i> Pulling herself up onto her knees, she squeezes her tits, hosing out a wave of milk. <i>“Mitzi wants to be a milky Mitzi-Cow for [pc.Master]! That means drugging and breeding until her brains squirt out of her big sexy cow-tits, right?”</i>\n\nHer vibrator slips out of her now that she’s upright. It buzzes for a second, then powers down.");
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
				output("<i>“Help!”</i> Mitzi calls, grabbing you by the hand. <i>“Mitzi put herself in this super sexy zipsuit, but she can’t get the zipper down to masturbate! Her pussy is like, super wet, but she can’t even finger herself, and it’s getting so wet down there! Could you like, fuck a hole in it, or whatever? You’re so smart, [pc.Master]. You’ll figure out a way to fuck Mitzi, right?”</i>\n\nThe zip mechanism is completely intact and undamaged. Mitzi isn’t even trying to use it; instead she’s busy rubbing her pussy through the plastic hard enough for the squelches to echo down the passage.");
			}
		}
		//Librarian
		else if(dressString is MitzisLibrarianOutfit)
		{
			if(rand(2) == 0)
			{
				output("<i>“Hello [pc.Master],”</i> Mitzi curtly greets you. <i>“Is there some pornography you’d like to watch?”</i> She gestures to her codex with a sticky-fingered hand. <i>“Perhaps a hot, green, bitch you’d like to ");
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
					output("<i>“Hiya [pc.Mister] [pc.Master]! Did you want a copy of these pics? Mitzi got some that make her look totally fuckable.”</i> The brain-drained bimbo holds up the tablet to show you. It’s a smorgasbord of titillation and debauchery, including more than a few pictures of exposed nipples or a soaked pubic mound. <i>“It’s your fault. You’re the one that dressed her up so hot! It’s no wonder you’re getting all ");
					if(pc.hasCock()) output("hard");
					else output("blushy");
					output(" now!");
					if(pc.hasCock()) output("”</i> She sniffs. <i>“She can smell your [pc.cocks] getting hot and bothered.");
					output(" There’s nothing to be ashamed of. Just pick me up and fuck me however you want.”</i>");
				}
			}
		}
	}
	processTime(1);
	pc.changeLust(3);
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
	else addDisabledButton(2,"Sex","Sex","You aren’t turned on enough for this.");
	addButton(3,"Dress Her",dressMitziUpMenu,undefined,"Dress Her","Help Mitzi pick out her wardrobe.");
	if(flags["CREWMEMBER_SLEEP_WITH"] != "MITZI") addButton(5,"Sleep With",sleepWithToggleMitzi,undefined,"Sleep With","Invite Mitzi to share your bed and get you off in the mornings.");
	else addButton(5,"NoSleepWith",sleepWithToggleMitzi,undefined,"No Sleep With","Kick Mitzi out of bed so she won’t wake you up with orgasms in the morning.");
	if(flags["MITZI_FAV_DRUG"] != undefined)
	{
		if(pc.hasItemByClass(Gush)) addButton(6,"Give Gush",giveMitziGush,undefined,"Give Gush","Give Mitzi a dose of Gush. It’ll probably make her milky and sort dumb for a while, going by her stories.");
		else addDisabledButton(6,"Give Gush","Give Gush","You need some Gush in order to do this.");
		if(pc.hasItemByClass(Soak)) addButton(7,"Give Soak",giveMitziSoak,undefined,"Give Soak","Give Mitzi a dose of Soak. The sex should be amazing, right?");
		else addDisabledButton(7,"Give Soak","Give Soak","You need some Soak in order to do this.");
	}
	else
	{
		addDisabledButton(6,"???","???","You need to know Mitzi better to see this option.");
		addDisabledButton(7,"???","???","You need to know Mitzi better to see this option.");
	}
	addButton(8,"Give Bubble",giveMitziACumBubble,undefined,"Give Cum Bubble","Maybe you could give Mitzi some stored-up cum?");
	if(flags["PENNY_CAUGHT_MITZI_JERKIN"] != undefined) addButton(9,"AWOL Panty",mitziPantiesTalk,undefined,"AWOL Panties","Ask Mitzi if she’s missing a pair of panties.");
	addButton(13,"Leave Crew",kickMitziOffCrew,undefined,"Leave Crew","Tell Mitzi that you need to free up some space on the ship.");
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
		output(" The latter are barely contained by her [mitzi.chestCovers]. Mitzi’s outsized chest could make a pair of industrial wheelbarrows creak. It’s a wonder the clothing can hold together at all. Those [mitzi.breastCupSize] knockers beg to be squeezed, and from the way the smirking bimbo keeps them jostling around, she knows.");
		if(mitzi.isChestVisible()) output(" Jutting tit-tips lewdly distend her transparent garment, intent that you know every crease along their pebbly surface.");
	}
	else output("The latter are completely uncovered by her choice of attire, free to wobble and jostle in cleavage defining clashes. Those [mitzi.breastCupSize] knockers seem like two emerald mountains, their summits crowned by sensitive, jutting tips whose perpetual hardness never seems to flag. Mitzi’s outsized chest could be wrapped up in the most chaste blouse, and the mammoth mounds’ libidinous squeezability would shine through as clear as daylight.");
	output(" If you were small enough to squeeze under her 3’6”</i> frame, you could comfortable shelter beneath the physics-defying bosom.");

	output("\n\nNo exploration of the viridian bimbo’s body would be complete without the long moments it takes your view to slide along the outlandishly bubbly expansive of her ass. She cocks her hip the other way when she sees you looking, sending the pillowy buttcheeks rolling.");
	if(mitzi.isAssExposed()) output(" A glimpse between the clapping callipygean orbs reveals a pristine pucker of the same vibrant green as its owner.");
	else if(mitzi.isAssVisible()) output(" While you can see through her choice of transparent clothing, you can’t glimpse the pucker beyond. Those colossal callipygean orbs are too firmly squeezed together to grant a peek between.");
	else
	{
		output(" While you can’t see past her [mitzi.assCover] to view her pucker directly, ");
		if(flags["MITZI_ANALED"] == undefined) output("you can only assume it is as engineered for sex as the rest of its owner.");
		else output("you know all too well that’s flawless and unblemished, almost brighter green than the rest of its owner.");
	}
	output(" A hind-end of such monumental magnitude would look absurd on anyone with normal bone-structure, but Mitzi’s hips are built like a freighter’s back-end, lending her more than ample room to sprout galaxy-class ass.");
	//Crotch exposed
	if(mitzi.isCrotchExposed() || mitzi.isCrotchVisible()) output("\n\nHow fortunate that your fuck-slave’s current clothing does nothing to conceal the sopping treasure between her thighs! When she spreads her breedable thighs apart, Mitzi’s box leaps into view. No matter what time of day, morning, or night, her incessant arousal ensures that her vulva remains plump and puffy. A sheen arousal slicks the inner lips, and the hyper-developed nub of her clitoris consistently peeks out in search of a caress, something Mitzi is all too happy to offer it.");
	//Can’t see, havent fucked it.
	else if(flags["MITZI_FUCKED"] == undefined) output("\n\nWhile you can’t see between your fuck-slave’s thighs thanks to her current outfit, you can only assume that the feminine treasure between is every bit as libidinous and willing as the rest of her.");
	//Can’t see it, have fucked it
	else output("\n\nWhile you can’t see between your fuck-slave’s thighs thanks to her current outfit, you’ve spent too long getting up close and personal with it to simply forget about it. The vulva is eternally plump with lust, slicked by beads of clear arousal at any time of the day or night. Its lusty sheen begs the viewer to lean closer, and a hyper-developed clitoris stands proudly out of its hood in search of a finger or tongue willing to bless its super-charged nerves with the a touch.");
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
	pc.changeLust(5);
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
		else addDisabledButton(0,"Fuck Her","Fuck Her","Stretchy as she is, even Mitzi’s modded body has limits.");
		addButton(2,"Titfuck",goblinTittyfuckoo);
		if(pc.cockThatFits(mitzi.analCapacity()*1.5) >= 0) addButton(4,"Pitch Anal", penisRouter, [mitziTakesItUpTheAssFINALLY,mitzi.analCapacity()*1.5,false,0], "Pitch Anal", "Take the goblin in your favorite celestial body - her black hole." + (flags["MITZI_ANALED"] != undefined ? "\n\n<b>You know from past experience that this is likely to inflict a small amount of taint, but what doesn’t in this day and age?</b>" : ""));
		else addDisabledButton(4,"Pitch Anal","Pitch Anal","Mitzi is more than willing to stretch her body past the limit, and you’re still too big for her.")
	}
	else 
	{
		addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis for this kind of sex.");
		addDisabledButton(2,"Titfuck","Titfuck","You need a penis to titfuck her.");
		addDisabledButton(4,"Pitch Anal","Pitch Anal","You need a penis for this kind of sex.");
	}
	if(pc.hasVagina()) 
	{
		addButton(1,"Get Licked",getLickedByMitzi);
		addButton(3,"Cuntnosis",mitziPussyControl,undefined,"Cuntnosis","Ask Mitzi to please your pussy and let her use some of her drugs to do a little too good of a job.\n\n<b>Contains Mind Control content.</b>\n<b>Known to cause slight amounts of taint. Check your Codex for details.</b>");
		if(InCollection(getPlanetName().toLowerCase(),["tarkus","new texas","myrellion","canadia station"]) && pc.isBimbo() && pc.hasVagina() && pc.biggestTitSize() >= 1) addButton(6,"Publicc Fun",publicMitziFun,undefined,"Public Fun","Throw your clothes to the wind and go to get gangbanged with Mitzi.");
		else addDisabledButton(6,"Public Fun","Public Fun","For going out to have some fun with Mitzi you’ll need to have a pussy, tits, to be on a planet where that’s legal, and have a bubbly attitude towards life.");
	}
	else 
	{
		addDisabledButton(1,"Get Licked","Get Licked","You need a vagina for this.");
		addDisabledButton(3,"Cuntnosis","Cuntnosis","You need to have a vagina in order to engage in this.");
		addDisabledButton(6,"Public Fun","Public Fun","For going out to have some fun with Mitzi you’ll need to have a pussy, tits, to be on a planet where that’s legal, and have a bubbly attitude towards life.");
	}

	if(flags["MITZI_FAV_DRUG"] != undefined)
	{
		if(pc.hasItemByClass(Gush)) addButton(5,"Give Gush",giveMitziGush,undefined,"Give Gush","Give Mitzi a dosage of Gush. It’ll probably make her milky and sort dumb for a while, going by her stories.");
		else addDisabledButton(5,"Give Gush","Give Gush","You need some Gush in order to do this.");
	}
	if(pc.hasBackGenitals()) {
		if(pc.wingCount <= 1) addDisabledButton(7,"TentacleFun","Tentacle Fun","You don’t have enough tentacle-wings for this.");
		else addButton(7,"TentacleFun",mitziTentaCocks,undefined,"Tentacle Fun","Put your shoulder-mounted tentacle-wings to work on the cock-socket of a goblin.");
	}
	else addDisabledButton(7,"TentacleFun","Tentacle Fun","You need tentacle wings for this.");
	addButton(13,"Threesome",mitziThreesomesMenu,undefined,"Threesome","See if there's anyone else on your crew who can play with the goblin.");
	addButton(14,"Back",approachCrewMitzi,true);
}

//Mitzi Wakes You Up
public function mitziMorningSuccOrWhatever():void
{
	clearOutput();
	showMitzi();
	author("Fenoxbro");
	var choices:Array = [];
	if(pc.hasCock()) choices.push(1);
	if(pc.hasVagina()) choices.push(2);
	if(pc.isLactating()) choices.push(3);
	var select:Number = choices[rand(choices.length)];
	if(select == 1)
	{
		output("A slowly fading wave of pleasure accompanies you all the way back to the waking world. As your [pc.hips] slide back down onto the mattress, you blink the sleep from your eyes and look down to discover Mitzi’s lips easing slowly off of your length. She opens wide to show you the [pc.cumGem] lake in her mouth before swallowing");
		var cumQ:Number = pc.cumQ();
		if(cumQ >= 1000) 
		{
			output(", then rubs her");
			if(cumQ >= 4000) output(" massively");
			output(" inflated belly with a happy little sigh");
		}
		output(". <i>“");
		if(rand(5) == 0) output("Yummy! Now you won’t need to waste any cum on dumb alien sluts. If you get too horny, you can just come back here and bang Mitzi to sleep!");
		else if(rand(4) == 0) output("Mmm, thanks for breakfast [pc.Master]! All set to go exploring! Let Mitzi know if you need help filling back up with lots of sperm, okay?");
		else if(rand(3) == 0) 
		{
			output("Ahhh! That hits the spot. You don’t have to like, leave if you don’t want to. Mitzi could fill your ");
			if(pc.balls > 1) output("balls");
			else if(pc.balls == 1) output("ball");
			else output("cock");
			output(" back up with a fresh load if you asked.”</i> She kisses your [pc.sheathOrKnot]. <i>“Just ask.");
		}
		else if(rand(2) == 0) output("Oooh! I think I came a little bit. [pc.Master]’s cummies are always the best! Mitzi thinks your [pc.cockNoun] is falling in love.”</i> She preens. <i>“It always perks up for her.");
		else output("Yum-yum-yummy-in-slut-tummy! Mmmph! That’s like, the best breakfast in the uni...univ...world! Let Mitzi know if the cum might overflow, ‘kay?");
		output("”</i>");
		output("\n\nYou’re a little too tired to do much but nod and send the ");
		if(cumQ >= 4000) output("cum-bubble of a goblin");
		else if(cumQ >= 1000) output("cum-inflated goblin");
		else if(cumQ >= 250) output("cum-stuffed goblin");
		else output("cum-hungry goblin");
		output(" on her way. What a way to start a day!");
		pc.changeLust(100);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Mitzi Wakes Up Girls
	else if(select == 2)
	{
		output("Crests of pleasure, rising and falling, fill whole days worth of dreams. When you finally do manage to climb back to the waking world, it’s on the heels of a slow, rolling climax that makes your [pc.thighs] bonelessly quiver. Your voice hitches in a wordless sigh of pleasure. As your [pc.hips] relax, you look down to discover Mitzi’s tongue slowly sliding free of [pc.oneCunt]. She opens wide to show you all the [pc.girlCum] she’s collected.");
		if(pc.wettestVaginalWetness() < 3) output(" There’s far more than you would have expected. She’s been saving it for a long time.");
		else if(pc.wettestVaginalWetness() < 4) output(" There’s was more than you would have expected, judging by the trickles dried onto the sides of her chin.");
		else if(pc.girlCumQ() < 3000) output(" There was clearly more than she expected, judging by the puddle in the sheets below.");
		else output(" There was clearly more than she could have expected, judging by her pudgy middle.");

		output("\n\n<i>“Morning, [pc.Master]!”</i>");
		output("\n\nYou sit up onto your elbows and greet Mitzi");
		//output(", like always");
		output(". <i>“Morning, ");
		if(pc.isBimbo()) output("hottie!");
		else if(pc.isBro()) output("slut.");
		else if(pc.isNice()) output("cutie.");
		else if(pc.isMischievous()) output("gorgeous.");
		else output("pussy-slut.");
		output("”</i>");

		output("\n\n<i>“Did [pc.Master] have sweet dreams?”</i> Mitzi climbs up next to you");
		if(pc.hasCock()) output(", lapping at all the spilt [pc.cum] she couldn’t get at from down there");
		else output(" with a wink and a smile");
		output(". Her eyes shine with absolute, sublime delight. <i>“");
		if(rand(4) == 0) output("[pc.Master] has the sweetest pussy.");
		else if(rand(3) == 0) output("All ready for adventures now!");
		else if(rand(2) == 0) output("[pc.Master] has such a yummy cunny!");
		else output("[pc.Master]’s pussy is totally falling for Mitzi.”</i> She giggles. <i>“Don’t worry little pussy. Mitzi will lick you again tomorrow. Or now, if [pc.Master] wants.");
		output("”</i>");
		output("\n\nYou’re too tired to do much but smile and let the muff-hungry goblin curl up into bed once you vacate it. Adventure calls!");
		pc.changeLust(100);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Mitzi Drains TiTS Wake-Up:
	else
	{
		output("A sense of pulsating, mounting relief greets your return to the waking world - not from your nethers but from your [pc.nipples]. Mitzi is latched onto one, suckling you dry so gently that you’re surprised you woke at all. Her plush lips make a perfect seal, and her gently bobbing gullet sucks away your [pc.milk] with whisper-quiet efficiency. If you let her, she’d probably suckle you past the point of dryness.");
		output("\n\nYou shift, gently dislodging the slutty tit-milker, and ");
		if(flags["MITZI_MILK_CHOICE"] == 1) output("make ready to start the day.\n\nMitzi helps you gather your things with a hopeful smile that doesn’t go away until you give her a ‘good girl’ head-pat.");
		else output("wonder what you should do about this. You’ll never stop lactating if Mitzi keeps milking you like this, but that might be kind of nice - you could start every morning fresh and light, then stagger home with a heavy load of cream for the goblin to harvest. And if you change your mind later, you can always talk to her about it.");
		pc.milked(100);
		clearMenu();
		if(flags["MITZI_MILK_CHOICE"] == undefined)
		{
			addButton(0,"Good Job",goodJobMilkingMitzi);
			addButton(1,"Not Again",tellMitziNotToKeepMilking);
		}
		else addButton(0,"Next",mainGameMenu);
	}
}

//[Good job]
public function goodJobMilkingMitzi():void
{
	clearOutput();
	showMitzi();
	output("You give Mitzi a gentle head-pat and tell her she did a good job.");
	output("\n\n<i>“Thank you, [pc.Master].”</i> Mitzi beams and wraps you up in a big hug. <i>“That’s all Mitzi wants! To help... and maybe fuck sometimes. A lot.”</i>\n\nYou smile and pat her on the head for her troubles, an action that nearly makes the goblin melt. You’ll have to remember that.");
	flags["MITZI_MILK_CHOICE"] = 1;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Not Again]
public function tellMitziNotToKeepMilking():void
{
	clearOutput();
	showMitzi();
	output("You shake your head sternly at Mitzi and tell her that you don’t want her sucking on your [pc.chest] while you sleep.");
	output("\n\n<i>“But... what about the milkies?”</i> Mitzi seems confounded. <i>“Doesn’t it hurt?”</i>");
	output("\n\nYou explain that you’ll decide if and when anyone gets to drink your [pc.milk], whether it hurts or not. <i>“Got it?”</i>");
	output("\n\nMitzi pouts. <i>“O-okay. If [pc.Master] is sure, Mitzi will try to be good. Sorry she is such a dumb, stupid bitch-cunt.”</i> She runs from the room in a tizzy.\n\nBy the time you’re dressed, you can hear her moaning from elsewhere in the ship, sadness long since exchanged for arousal. At least she’s fairly resilient... but she’d have to be, with what she’s been through.");
	flags["MITZI_MILK_CHOICE"] = -1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function sleepWithToggleMitzi():void
{
	clearOutput();
	showMitzi();
	if(flags["CREWMEMBER_SLEEP_WITH"] == "MITZI")
	{
		output("You tell Mitzi that you’ll need her to sleep somewhere else for a while.");
		//No crew
		if(crew(true) == 1)
		{
			output("\n\nMitzi’s eyes widen. <i>“But... who will make you your morning cummies? [pc.Master] needs lots of cummies or [pc.heShe]’ll lose to lots of aliens!”</i>");
			output("\n\nYou let her know that you’ll take care of yourself in the morning - or come get her if you need her.");
			output("\n\n<i>“You promise?”</i>");
			output("\n\nThat seems like a better option than making the pint-sized fuck-slave cry.");
			output("\n\n<i>“Okies. Mitzi will just be outside, dressing so sexy that you’ll have to fuck her every time you see her.”</i> She prances away, ass swaying hypnotically.");
			output("\n\nPart of you regrets sending her away.");
		}
		else
		{
			output("The goblin’s pink eyes open wide. <i>“Oooooh. [pc.Master] wants to bang some other silly skank in bed!”</i>");
			output("\n\nYou raise your hand to interject, but words are spilling out of Mitzi too rapid-fire to squeeze anything in edgewise.");
			output("\n\n<i>“Mitzi gets it. She’s basically like, a sex-toy, and some people don’t like seeing those laying around in the bed.”</i> She brazenly reaches out to caress your crotch, forcing a blush from you. <i>“But when picky girls aren’t around and you need ");
			if(pc.hasCock()) output("something to squeeze out some dickmilk");
			else if(pc.hasVagina()) output("something to stuff in your pussy");
			else output("something to play with");
			output(", Mitzi will be there, and she’ll be ready.”</i>");
			output("\n\nThat’s... well, at least your mornings won’t be interrupted by goblin shenanigans any longer.");
		}
		flags["CREWMEMBER_SLEEP_WITH"] = undefined;
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output("You ask Mitzi if she’d like to share your bed with you at night.");
		output("\n\n<i>“Really?”</i> the grinning greenskin batts her eyelashes at you. <i>“[pc.Master] wants to snuggle with [pc.his] fuck-toy?”</i> She slowly licks her ");
		if(pc.hasCock() || !pc.hasVagina()) output("dick-sucking lips");
		else output("cunt-kissers");
		output(" and groans, <i>“That’s so... lewd!”</i>");
		//Bimbo
		if(pc.isBimbo()) output("\n\n<i>“I’m like, the lewdest!”</i> You grab Mitzi and plant a hot, wet kiss on those purple puckers before her lil’ brain tries to think too hard. <i>“It’s gonna be sooo fun!”</i>");
		//Bro
		else if(pc.isBro()) output("\n\nYou pick Mitzi up and force her into a soul-searing kiss, obliterating whatever concerns she might have had in the face of your raw, forceful sexuality.");
		//Nice
		else if(pc.isNice()) output("\n\n<i>“Yeah, but I think I can handle a little lewdness in my life.”</i> You pat Mitzi’s head affectionately.");
		//Misch
		else if(pc.isMischievous()) output("\n\n<i>“Yeah, but fortunately for you, I </i>like<i> lewd, don’t I?”</i> You tussle Mitzi’s hair affectionately. <i>“And I don’t think anyone else could keep up with your lewdness but me.”</i>");
		//Ass
		else output("\n\n<i>“Bitch, don’t pretend you aren’t desperate to glued to my crotch.”</i> You tweak one of her nipples roughly. <i>“You’re gonna love it.”</i>");
		//Merge
		output("\n\nA full-body shudder races through the bright-eyed bimbo. <i>“Mitzi’s will be so good for you [pc.Master]. She’ll make you wake-up cummies and everything!”</i>");
		output("\n\nThat’s more like it. Is there anything else you wanted from your emerald fuck-toy?");
		flags["CREWMEMBER_SLEEP_WITH"] = "MITZI";
		processTime(2);
		clearMenu();
		addButton(0,"Next",approachCrewMitzi,true);
	}
}

public function talkToMitzi():void
{
	clearOutput();
	showMitzi();
	output("The little goblin seems more interested in fucking than talking, but if you have question, you’re sure she’ll answer them.");
	clearMenu();
	addButton(0,"Bimboed?",whatHappenedToMitzi);
	if(flags["MITZI_BIMBO_TALK"] == 1) addButton(1,"Your Body?",talkToMitziAboutHerBody);
	else addDisabledButton(1,"Your Body?","Your Body?","Maybe start out with how she turned into a bimbo...");
	if(flags["MITZI_BODY_TALK"] == 1) addButton(2,"Fav.Drug?",favoriteDrugMitzi);
	else addDisabledButton(2,"Fav. Drug?","Favorite Drug?","You don’t know about Mitzi’s drug use yet.");
	if(flags["MITZI_FAV_DRUG"] == 1) addButton(3,"Aphrodisiacs",mitziAphrodisiacTalk);
	else addDisabledButton(3,"Aphrodisiacs","Aphrodisiacs","You’d need to know about Mitzi’s drug usage first.");
	addButton(14,"Back",approachCrewMitzi,true);
}

//What Happened To You?
public function whatHappenedToMitzi():void
{
	clearOutput();
	showMitzi();
	output("You ask Mitzi if she can repeat the story of how she got bimbofied in the first place.");
	output("\n\n<i>“[pc.Master]... you didn’t get all dumb-fucky did you? ‘Cause Mitzi already told you about this! The mean ol’ dick-pirate jabbed her with a needle, an’ then fucked her so hard Mitzi fell asleep. And then when Mitzi woke up, [pc.Master] helped her escape! She didn’t know it was Dumbfuck in the needle though, so when she started masturbating, she didn’t want to stop, and then she sneezed and sneezed... and sneezed. Each time made Mitzi’s slit feel better and better... by the time she stopped, thinking about machines and stuff was just like... bluh! Too hard. But instead she could think about all the best spots to touch her pussy, and like, how to make the orgasm last as long as possible.”</i>");
	output("\n\nYou express your condolences, but Mitzi doesn’t seem to mind.");
	output("\n\n<i>“It’s not your fault! You’re the one person that cared enough to help, even before Mitzi got this fuckable.”</i> The emerald slut grabs her enormous breasts and squeezes them fondly. <i>“Besides, Mitzi found </i>you.<i> Who cares if like, thinking about elecci-trical flux is worse than watching grass grow. Every part of Mitzi feels so good now. Just playing with her nipples is almost as good an entire old-Mitzi fuck. And getting mad is so hard that like, you can pull my pig-tails and I’ll still be smiling and asking for more! Mitzi likes being happy!”</i>");
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
	output("\n\n<i>“Mmmmmmm,”</i> Mitzi shudders in sudden climax. <i>“Sooo hot. Anyway, after like, a bunch of stops at Tavros, Mitzi remembered that she wanted to get off there and left. Peachy and Pauline thought old-master would be super sad, but he totally said he’d drop Mitzi off there forever ago! And then Mitzi found [pc.Master], and even though she can’t get high and eat mouse-pussy all day, everything is awesome. The end!”</i> Licking her fingers clean, the goblin smiles happily at you. <i>“Look at how wet Mitzi’s pussy got!”</i>");
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
	output("\n\nMitzi’s eyes light up. <i>“Mitzi loooves Soak.”</i> She pats her crotch. <i>“So Soak is sorta like Throbb for girls. So instead of getting big, dumb boners, we get super wet and fertile. And when you first take it, your pussy feels really, really weird. Everything gets all puffy and swollen and almost rubbery looking, especially once the drooling starts. You’ll feel it happening, and you just can’t help but get wet enough to ride a tribe of raskvel. Oh! And the drool comes out of your mouth too. Mitzi doesn’t know why, but once you dose a little Soak, juices come out of everywhere!”</i>");
	output("\n\nThat sounds sort of uncomfortable.");
	output("\n\n<i>“Mmmm, it would be,”</i> Mitzi replies, <i>“But you get so sensitive all over that it hurts </i>not<i> to be wet, and it feels so good when something slides against you. Even better when you have some cum to mix in.”</i> She makes a trilling sound of delight in the back of her throat. <i>“Anyway, you sort of get fasci-fascin...obsessed, spreading it around, like your brain can’t handle what’s going on. Instead of panicking or whatever, it just sort of... soaks in it. Lets your pussy do the thinking, so you can slip, and slide, and smear cock-juice onto your face for hours and hours.”</i>");
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

//[DONE] Give Mitzi Gush
//Straightforward. Mitzi gets milky and stupid.
//Req’s favorite drugs talk!
public function giveMitziGush():void
{
	clearOutput();
	showMitzi(true);
	//Cock/NoCock variant.
	output("You toss Mitzi a gush applicator. <i>“");
	if(pc.isBimbo()) output("Wanna like, by my milky moo-goblin for a bit?");
	else if(pc.isBro()) output("Gotcha a present.");
	else if(pc.isNice()) output("I got you a present, since you were telling me how much you liked it.");
	else if(pc.isMischievous()) output("I’ve had a hankering for fresh milk ever since you told me that story.");
	else output("Gabilani milk better taste good.");
	output("”</i>");
	output("\n\n<i>“Is this...”</i> the emerald bimbo’s mouth lags while her overheated brain struggles to keep up, <i>“...Gush?”</i> She looks up with the biggest, happiest grin on her pouty purple lips. <i>“For me?”</i>");
	output("\n\nYou nod. <i>“Go ahead if you want.");
	if(pc.isNice()) output(" I’ll take care of you.");
	output("”</i>");

	//Done this before.
	if(flags["MITZI_GUSHED"] != undefined)
	{
		output("\n\nMitzi beams, <i>“This’ll be even better than last time! Omigod, thank youuuu! Mitzi is so glad you’ll be here to help her out in case she forgets her name or whatever.”</i>");
	}
	//First time
	else
	{
		output("\n\nMitzi beams, <i>“Thank you sooo much! Mitzi will try and stay milky afterward if she can remember. ‘Memberin’ is real hard in cow-space though!”</i>");
	}
	output("\n\nWhile that sounds worrisome, you remind yourself that Mitzi’s quite a resilient girl. If she can bounce back from the hand life dealt her and find her way to you, she can ");
	if(flags["MITZI_GUSHED"] == undefined) output("dabble in a little Gush");
	else output("indulge her Gush addiction");
	output(" just fine.");

	output("\n\n");
	if(!mitzi.isChestExposed()) 
	{
		output("Yanking off her [mitzi.armor] to bare her ");
		if(!mitzi.canLactate()) output("soon-to-be ");
		output("leaky mammaries, Mitzi bounces with glee.");
	}
	else
	{
		output("Squeezing her ");
		if(!mitzi.canLactate()) output("soon-to-be ");
		output("leaky mammaries");
		if(mitzi.canLactate())
		{
			var milkQ:Number = mitzi.milkQ();
			if(milkQ < 400) output(" until a thin stream of milk shoots out");
			else if(milkQ < 2000) output(" until streams of milk spray out");
			else output(" until a river of creamy goblin-milk pours out");
		}
		output(", Mitzi bounces with glee.");
	}
	output(" <i>“Just thinking about it has Mitzi’s titties all perkied up! Look!”</i> Sure enough, those glamorous green ");
	if(mitzi.canLactate()) output("milk-makers");
	else output("jugs");
	output(" are heaving, thrusting big fat nipples in your direction. High beams like that could poke out an eye - or fill flood your mouth with the sweet taste of Mitzi’s milk.");

	output("\n\nYou lick your lips.");
	output("\n\n<i>“Fuuuuck, [pc.Master], you look so </i>hot<i> when you stare at Mitzi’s tits like that, and she didn’t even use your present yet, the stupid cunt!”</i> Your pet goblin purses her lips in thought. <i>“Okay which end does the fun stuff come out of? This one?”</i> Surprisingly, she correctly identifies the drug applicator’s spray-port.");

	//Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Yeppers! That’s it. You’re gonna have so much fun!”</i>");
	//Bro
	else if(pc.isBro()) output("\n\nYou nod.");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“That’s it!”</i> You give her an encouraging thumbs up.");
	//Misch
	else if(pc.isMischievous()) output("\n\n<i>“Why don’t you give it a try, and if you still remember what we’re talking about, you’ll know it’s the wrong end.”</i>");
	//Ass
	else output("\n\n<i>“Yes, that’s it. Honestly I’m not sure you can get any dumber.”</i>");
	//Merge
	output("\n\nMitzi nods with a surprising sense of sobriety. <i>“Before Mitzi’s head gets all milky, she like, wanted to say she loves you.”</i> A trickle of wetness streams down her thighs. <i>“But Mitzi is really horny and is gonna milk herself stupid now!”</i> Waving the spraypen over her blushing tits, the goblin unleashes the entire load of Gush in one concentrated blast. Beads of moisture briefly freckle her heaving, emerald bosom for the moment it takes for the technologically-infused cocktail to penetrate her skin. <i>“Wow, it soaked in fast. [pc.Master] got me the good stuff!”</i>");
	output("\n\nYou ask the horny short-stack if she’s feeling it yet. Her whole body is clearly flushed.");
	output("\n\nAn airheaded giggle bursts out of Mitzi in answer, <i>“Like, not yet, ");
	if(pc.hasCock() && pc.mf("m","") == "m") output("stud");
	else output("[pc.Master]");
	output(". Gush takes a couple sec... mmm... uh...”</i> She stops talking and looks down at her breasts just in time to see them wobble. The sudden growth bounces one into the other, creating a cascade of jiggliness that bounces back and forth from one side to the other. <i>“Like... uh... good. It’s good, [pc.Master]. Mitzi’s getting all gushy!”</i> She grabs hold of one in both hands and offers it up to you, the rich green skin slowly stretching and shining from the effort of containing her swelling milksacks.");
	output("\n\nYou cautiously take Mitzi’s weighty mammary into your hands. The contact seems too much for the silly slut. She bites her lip to stifle a moan and arches her back. A rush of girl-cum vents between her bare thighs to splatter the ground, and her nipple strains forward, reaching out a full inch as it engorges beyond all reasonable biological limits.");
	if(!mitzi.canLactate()) output(" A single bead of white appears on the tip.");
	else output("An abrupt release of white erupts from the tip, cascading down her underbust to join her fragrant pussy-juice on the floor. Repeated dosages clearly make Mitzi a very milky girl.");

	output("\n\nWith all the attention on her breasts, the bimbofied goblin appears to be in heaven. Her eyes are barely open, while her tongue is sliding further and further out of her lax maw. When she sees you looking, she ineffectually tries to suck it in, only to have a lurid moan undo every ounce of progress. <i>“Ma-ma-[pc.master]! Mitzi’s titties are sooo buzzy an’ good,”</i> she slurs. <i>“Gettin’ hot and full- soooo warm!!”</i> ");
	if(!mitzi.canLactate()) output("Ribbons of white leak from her nipples without any effort at all.");
	else output("Both sides erupt again, releasing warm torrents of goblin-cream without any nipple stimulation at all.");
	output(" <i>“Mmmm-ma-mooo!”</i> A brainless giggle follows after the bovine proclamation, <i>“Mitzicow moo!”</i>");
	output("\n\n<i>“Mitzi?”</i> you snap your fingers in front of her face, trying to focus her incredibly limited attention. <i>“You doing okay?”</i>");
	output("\n\n<i>“Mmmhmmm,”</i> the drippy girl all but purrs in sexual delight. <i>“Mitzicow... so...”</i> She looks down at her tits again and stops to smile warmly. Catching milk in her palm, she watches more dribble out and begins to moo all over again. Bovine low after cow-infused moan escapes her, every wordless vocalization accompanied by a slight increase in flow from her distended nipples. Mitzi sips at the milk puddled in her hand, then seems to remember something of your question - or at the very least acknowledges your presence. <i>“Good. Miss Cow moo’s so good.”</i> Shuffling forward, she presses her cream-oozing breasts against your ");
	if(pc.tallness >= 7*12) output("[pc.leg]");
	else if(pc.tallness >= 5*12) output("[pc.thigh]");
	else output("waist");
	output(". <i>“Milkies?”</i>");
	output("\n\nThose luscious, milk-filled pillows are so warm against your [pc.skin]. It’d be a waste <i>not</i> to milk them. The only question is if you’d like to do anything else whilst you play with ‘Miss Cow.’");
	processTime(15);
	pc.destroyItemByClass(Gush);
	clearMenu();
	//[Fuck Her] [Titfuck] [Just Drink]
	if(pc.hasCock() && pc.cockThatFits(mitzi.vaginalCapacity(0)*1.25) >= 0) addButton(0,"Fuck Her",penisRouter,[fuckMitziMilkies,mitzi.vaginalCapacity(0)*1.25,false,1]);
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Her","Fuck Her","You’d never fit inside!");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis for that!");
	if(pc.hasCock()) addButton(1,"Titfuck",mitziMilkTitfuck);
	else addDisabledButton(1,"Titfuck","Titfuck","You need a penis for this.");
	addButton(2,"Just Drink",chastelyDrinkFromMitzi);
}

//Fuck Her
public function fuckMitziMilkies(x:int):void
{
	clearOutput();
	showMitzi(true);
	output("<i>“Yes, Milkies,”</i> you say, ");
	if(!pc.isCrotchExposed()) output("yanking open your [pc.crotchCover] to pull out your [pc.cocks]");
	else output("pointing at your [pc.cocks]");
	output(". <i>“Milked right into your cunt.”</i>");
	output("\n\nMitzi’s eyes go wide and her obscene, purple tongue languidly slides out of her mouth to drool on an expanded tit. She just stares at your crotch with unashamed lust. The hearts in her eyes dilate until you’re looking at a sea of wanton pink. Meanwhile, her hands oafishly grab at her nipples, making half-hearted tugs at the milk while her brain tries to make room for the concept of getting fucked. <i>“If fuck, how will... Moo milk?”</i> the goblin slurs.");
	//Bimbo
	if(pc.isBimbo()) output("\n\nYou giggle. The poor got all shorted out by dick! That’s fine though, you’ll just take charge and give her the hard dicking you know she’s aching for. She can thank you later, if she remembers. <i>“Don’t worry about it. I’ll fuck you real hard, and all the milk will come out just fine!”</i> It’ll probably work.");
	//Bro
	else if(pc.isBro()) output("\n\nYou snort. <i>“You don’t need to talk.”</i> The dumb cunt would be better off presenting to save you the time of posing her, but you suppose it doesn’t matter. You’ll fuck the green-skinned milk-bitch until her cunt is stuffed and her nipples are milked dry. <i>“I got this.”</i>");
	//Nice
	else if(pc.isNice()) output("\n\nYou stroke her head gently. Poor girl is enjoying her tits so much that she’s going to need a lot of help to enjoy her Gush-time to the max. Fortunately, she has you here to take care of her. Knowing Mitzi, she’d whine for days if you didn’t give her a half-dozen milk-squirting orgasms. <i>“Relax, Mitzi-Moo. I’ll take care of all the milking. You just focus on enjoying it.”</i>");
	//Misch
	else if(pc.isMischievous()) output("\n\nShrugging, you tease her by saying, <i>“I don’t know, but I think if I stick my dick inside you, we might just find a way.”</i> The poor girl’s pussy clenches hard enough to send fresh dribbles running down her thighs. <i>“Besides, if you’re Mitzi-Cow, you don’t have to bother thinking. I’ll handle the hard stuff, like making sure you cum super hard.”</i>");
	//Hard
	else output("\n\nOh for the love of... <i>“You dumb cunt.”</i> You slap your palm into your face in frustration. <i>“Don’t worry your little bimbo brain over it. I’m going to fuck you, and you’re going to love and it and squirt milk everywhere.”</i> You pinch one of her nipples, and a spout of milk arcs out. <i>“Just like that.”</i>");
	//Merge
	output("\n\n<i>“Ohhh! Oh... kay!”</i> The dumbed-down goblin nods, leaning closer to your crotch. She takes a sniff at [pc.oneCock] and nuzzles up to it. <i>“Moo loves cock.”</i>");
	output("\n\nYou say, <i>“I bet you do,”</i> and force her down on her knees, then all fours. Mitzi’s pumped-up tits keep her on her fingertips, the pressure on her drugged-up knockers spraying fans of milk between her flushed skin and the floor. She doesn’t have to suffer long. You roll her over onto her back and watch her pornstar-caliber boobs wobble, most of their weight hanging over the sides of her chest to pull them apart, nipples jutting wide.");
	output("\n\nThe goblin’s legs follow suit. <i>“Like this?”</i>");
	output("\n\nClimbing on top of Mitzi, you drop [pc.oneCock] into place on top of her soaking pussy and smile. <i>“Just like that, ");
	if(pc.isBimbo()) output("you sexy slut");
	else if(pc.isBro()) output("sweet little cow");
	else if(pc.isNice()) output("beautiful");
	else if(pc.isMischievous()) output("you sweet minx");
	else output("bitch");
	output(".”</i>");

	output("\n\nThe giggling girl arches her back and sighs delightedly at the pressure on her mons, rocking her hips upward to slide a sinfully slick clit against the underside of your dick. Fresh streams of goblin-cream ooze out of her increasingly distended nipples. Sucking on her finger, Mitzi stifles another bovine vocalization and manages to find her voice. <i>“But the milk...”</i> She reaches for a teat, but the sheer weight and size of her stuff mammary drags the slippery nipple out of her fingers. It takes both hands to wrangle the tit into place and lift it up to you in offering. <i>“Miss Moo needs moo-ilked!”</i>");
	output("\n\nYou wrap your [pc.lipsChaste] around the swollen nub to humor the poor thing and are rewarded with a blast of sweet milk potent enough to stream out of the corners of your mouth and down your chin. There’s no way to sip gently from Mitzi. She’s a living cornucopia of milk, sharing the tremendousness of her bounty with you in one cheek-bulging eruption after another. The only way to ride it out is to abandon any attempt at cleanliness and let the milk fall where it may, coating your body and hers alike.");
	output("\n\nYour [pc.cocks] throb");
	if(pc.cockTotal() == 1) output("s");
	output(" in anticipation while you drink, but your attention is too full of nipple and milk to properly line ");
	if(pc.cockTotal() == 1) output("it");
	else output("one");
	output(" up, too divided between Mitzi’s fecund swells to properly see to the satisfaction of your aching member.");
	//??? output(" Keeping up with your breathing is");

	var cumQ:Number = pc.cumQ();
	output("\n\nFortunately, Mitzi’s sluttified, cock-hungry body is more than capable of seeing to your needs without a single conscious thought. She moos, low and loud, as her hips gyrate, confidently swinging up, angling forward, and pressing hard against your [pc.cockHead " + x + "]. Those lust-gilded goblin lips ");
	if(pc.cockVolume(x) < mitzi.vaginalCapacity(0) * 0.25) output("open right up to swallow your [pc.cock " + x + "] whole, sheathing you in the liquid furnace of her loins. Overactive muscles clamp down to squeeze you in a slutty embrace. Mitzi’s elastic channel may be capable of handling the biggest, baddest cocks on the block, but it feels all too happy to wrap you up and squeeze until the cum can’t help but spurt out of you.");
	else if(pc.cockVolume(x) < mitzi.vaginalCapacity(0) * 0.5) output("gently part to slowly swallow down your [pc.cock " + x + "], enjoying the sensuous friction of being filled by a decent-sized dick, sheathing you in the liquid furnace of Mitzi’s loins. Hidden muscles gently squeeze and stroke, careful not to contract too hard, lest they impede your pleasure. Her pussy is built for sex, able to please any dick - big, small, or the perfect size to curl her toes.");
	else if(pc.cockVolume(x) < mitzi.vaginalCapacity(0) * 0.75) 
	{
		output("momentarily strain before giving way to your [pc.cock " + x + "], allowing themselves to be battered open to make way for your pleasure. Her insides are warm and soaking wet, clutching tightly to your veins as you glide by while gentle muscular contractions massage you better than an oiled-up masseuse. You’re clearly straining her limits. Mitzi’s toes curl as you hilt yourself, her cunt weeping desire");
		if(pc.balls > 0) output(" down your [pc.balls]");
		else if(pc.hasVagina()) output(" [over your [pc.vaginas]");
		else output(" down your [thighs]");
		output(".");
	}
	else
	{
		output("slam hard into your [pc.cock " + x + "] once, twice... and give way to the tunnel of liquid-gold pleasure that is her clutching, straining quim. You can see the outline of your dick bulging her belly; proud and hard and oh so ready to dump ");
		if(cumQ >= 8000) output("gallons of seed into her womb");
		else if(cumQ >= 1000) output("a gallon of seed");
		else output("an enormous cumshot into her womb");
		output(" as it plows forward an inch at a time. Mitzi’s eyes roll back, but her cunt still feebly works you, taut muscles vibrating like overtuned guitar strings around your manhood as they vainly try to squeeze down on a length big enough to split lesser women in half.");
	}
	pc.cockChange();
	output("\n\n<i>“Moooooo!”</i> she squeals, riding high on waves of mind-melting pleasure. <i>“Moo-moooo-moooOOOOOO!”</i> Mitzi’s head slams back and her hips slap messily into yours, splattering you with girlcum as the goblin explodes into climax. Geysers of thick, creamy milk force you offer her nipple and wash down your [pc.chest] and [pc.belly].");
	output("\n\nYou hold onto the squealing goblin-cow’s sopping-wet hips for stability and content yourself with fucking her silly. Without her tits to distract you, you can focus on giving her the furious fucking her augmented body was built to take. Mitzi likes it, the little slut. You can tell in from the way her ");
	if(pc.cockVolume(x) >= mitzi.vaginalCapacity(0) * 0.75) output("straining ");
	output("slit flexes in response, the way the slightly-too-big nubbin of her clit bulges out. When you hit a really good spot, the milk fountains jump a foot higher in the air, and when you draw back to line up the next stroke their pressure drops.");
	output("\n\nThere’s something sexy about seeing Mitzi like this, using her like this, something pure in the way she radiates raw, sluttish desire and a whorish sense of ecstasy in response to each and every action, unencumbered by the barriers of ego and indecision. The lactating bimbo simply does what her body wants, and her body wants to cum around her [pc.Master]’s ");
	if(pc.cockVolume(x) < mitzi.vaginalCapacity(0) * 0.25) output("hard-fucking dick");
	else if(pc.cockVolume(x) < mitzi.vaginalCapacity(0) * 0.5) output("big, beautiful cock");
	else if(pc.cockVolume(x) < mitzi.vaginalCapacity(0) * 0.75) output("bitch-breaking cock");
	else output("cunt-destroying cock");
	output(" for as long as it can.");

	output("\n\n<i>“Moooo-oooh-yeessss!”</i> Mitzi’s voice is raw from screaming out her pleasure already. Her fingers grope her tits hard, uncaring for anything but more stimulation, squeezing still more milk. She’s all but swimming in it, plastering in face in a mask of white. Both pigtails are utterly saturated and dripping. You could hold a cup under one and it’d be full in seconds. <i>“Such-a-milk-sluuuuuut!”</i>");

	output("\n\n<i>“Yeah you are.”</i> You fall into her fantasy, guided by her pussy’s wanton affections. <i>“My little milk-slut.”</i>");
	output("\n\nThat gets a reaction out of Mitzi. She jolts upright, twitching in orgasmic bliss. <i>“Cum in meeee~! Mooooo!”</i> And she flops back down, twitching, eyes rolling back, pussy milking your [pc.cock " + x + "] harder than ever. She might be incapable of properly enunciating it, but she wants your cum. She wants it fired deep into her womb. She wants the thickest, stickiest, most virile batch of baby-batter you can conjure up planted so deeply into her spasming body that her very soul is impregnated with your seed.");
	output("\n\nAs if you could hold out when confronted with that kind of encouragement. Guided by the goblin-cunt’s silken touches, you hilt yourself deep");
	if(pc.hasKnot(x)) output(", knot ballooning to lock you in place,");
	output(" and shoot the first pulse of your load.");
	if(cumQ < 25) output(" It’s relatively weak, all things told, but you give it all you’ve got regardless, spurting dollop after dollop until you feel sore and dizzy. That’ll happen from too many orgasms without rest, yet who could blame you? With a horny goblin slut like Mitzi on tap, you’re surprised you had any [pc.cum] at all in your [pc.balls].");
	else if(cumQ < 250) output(" It feels like her pussy is swallowing up every drop, wicking away your [pc.cum] before you can feel it splash back around your girth. Mitzi’s altered body <i>milks</i> out your seed just as you milked her. Before long, you feel absolutely drained and a little bit dizzy.");
	else 
	{
		output(" It feels incredible, flooding her pussy. At first, Mitzi’s modded uterus seems to devour your offering, but by the end of the first [pc.cum]-spurt, you can feel the slick warmth backwashing back out around your [pc.cockHead " + x + "]. And your successive squirts only make it hotter and wetter, thoroughly creampying the goblin with a load too big for her to handle.");
		if(cumQ >= 6000) output(" She whimpers when her belly rises up, inflated by the sheer size and force of your load, but they aren’t sounds of pain - quite the opposite. Mitzi clearly adores you pumping her middle up with seed. Green-skinned hands slide over the milk-drizzled dome as you stuff her cum-pregnant.");
		if(cumQ >= 15000) output(" When high-pressure jets spray out around your [pc.knot " + x + "], she shudders and blacks out from the bliss. It would seem even bimbos can cum so hard they black out.");
		output(" By the time you run dry, you’re winded and dizzy.");
	}
	output("\n\nFlopping yourself in between her drooling tits for a rest seems like a good idea");
	if(pc.hasKnot(x)) output(", especially since your knotted tool is still held in place, forced by Mitzi’s clenching cunt to continually seep more semen into her channel");
	output(". You can’t imagine a cosier place to take a nap.");
	processTime(30);
	pc.orgasm();
	mitziGushEffects();
	pc.milkInMouth(mitzi);
	clearMenu();
	addButton(0,"Next",mitziGushFuckII,x);
}

public function mitziGushFuckII(x:int):void
{
	clearOutput();
	showMitzi(true);
	output("When you wake, it’s to the feeling of another climax. You wipe the milk from your eyes and push yourself up off of Mitzi’s tits to try and figure out what’s going on.");
	output("\n\nShe’s riding you!");
	output("\n\nNow that the effects of Gush have largely subsided, Mitzi’s chest is a little more reasonable looking, if a little bigger than it once was. <i>“Miss Moo made [pc.Master] cock-milk like... more than twice!”</i>");
	output("\n\nJudging by the soreness in your loins, it was more than twice. <i>“Get off.”</i>");
	output("\n\nMitzi pouts but complies, sliding to the side to let your cock pop out with a messy ‘shluck’ and answering gush of mixed sexual fluids.");
	if(pc.hasKnot(x)) output(" Apparently after hours of non-stop knotting, she stretched out enough to pop right off.");
	output(" <i>“Umm... Moo. No wait... uh... fuck more later?”</i>");
	output("\n\nYou laugh and stagger up onto your [pc.feetOrFoot] on shaky legs. <i>“Sure. I guess. Once you’re recovered.”</i>");
	output("\n\n<i>“Oh.”</i> Mitzi pouts. <i>“Umm, when Milk-girl remembers her name, huh?”</i>");
	output("\n\nThat seems about right. You nod.");
	output("\n\n<i>“Okay. Miss Moo-Milk is gonna play with her pussy for now though, cause it makes her tits suuuper drippy.”</i> The milk-caked goblin is already knuckle deep in herself and smiling, heart-shaped eyes watching you adoringly.");
	output("\n\nIt might take her a while to recover.");
	processTime(120);
	pc.orgasm();
	pc.orgasm();
	pc.milkInMouth(mitzi);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Just Drink
public function chastelyDrinkFromMitzi():void
{
	clearOutput();
	showMitzi(true);
	output("<i>“Yes, Milkies,”</i> you say, pulling the walking milk-tank into your lap. <i>“I’m thirsty.”</i>");
	output("\n\nMitzi grins wide and does her best to lift a tit up for you, but it’s simply too heavy for her to raise it very high. You grab hold of one, fingers sinking deep, spilling milk out in a gooey spray, and heave it upward. The nipple throbs and gleams, beckoning you to take it into your mouth, to suckle it and taste of its bounty.");
	output("\n\nYou do.");
	output("\n\n<i>“M-m-mooo!”</i> Mitzi cries as her milk pours into your maw. It floods the space inside and balloons your cheeks. Trickles stream out of either side of your mouth as you struggle to gulp it down, able to enjoy its sweetness and creamy, palate pleasing flavor in spite of the inhuman quantity she presents. Fortunately, that flood diminishes to a steady pumping as the excitement of the moment passes. Mitzi’s trembling form stills somewhat, and you actually have a moment to attempt a suck.");
	output("\n\nThe elasticized flesh in your mouth balloons the moment you draw in your breath, hot and heavy, then contracts just enough to overwhelm your capacity. It’s a messy process: gulping, sucking, leaking milk everywhere, and then gulping again. Mitzi loves it; she quietly moos when you suckle and sighs when you swallow. Her other breast is making a mess of everything, but she doesn’t seem to care, empty-headed cow that she is - at least at the moment.");
	output("\n\nAt this rate, you won’t be able to handle both breasts’ liquid treasure. You’ll be lucky to drink everything this teat is putting out and still be able to walk! You swallow again, stroking Mitzi’s head affectionately as you try to think of a way to satisfy her. It’s quite relaxing, filling your belly, listening to the sluttified goblin’s animalistic sounds of pleasure and relief, warm juices spilling down your [pc.legOrLegs].");
	output("\n\nWait... it’s not just milk rolling down your leg. You peek around the wall of over-productive mammary to look down, and sure enough, Mitzi has her tail buried deep into her slit. Pussy-juice is flowing out of her near-constantly, like she’s lounging in the midst of an orgasm without beginning or end. Your lap is bathed in it");
	if(pc.hasVagina()) output(", mixing in with your own feminine secretions to perfume you with feminine musk");
	else if(pc.hasCock()) 
	{
		output(", oiling your [pc.cocks] in feminine secretions that make your nose twitch and your dick");
		if(pc.cockTotal() > 1) output("s");
		output(" surge");
	}
	output(". You’d smile if your mouth wasn’t full, glad that she’s having a good time of it.");
	output("\n\nMaybe later something can be done about that leaky hole between her legs.");
	output("\n\nFor now, you’ve got a pair of exceedingly milky goblin-tits to drain, and since you aren’t going to drink Mitzi dry with your mouth, you might as well use your free hand to satisfactorily empty the other.");
	output("\n\nThe spare nipple nearly slips out of your fingers the first time you try to grab it, but you manage to catch it just at the tip. Of course, this sets off a geyser of breast-milk. Mitzi babbles, <i>“Goooood milkies! Moooo! Moo moo moo moo!”</i> You adjust your grip to squeeze higher up. Maintaining proper milking form is difficult without the ability to look at what you’re doing, but you make do.");
	output("\n\nMitzi doesn’t seem to mind. She wriggles slightly to press more of herself against you, her cum still sliding down your [pc.legOrLegs] in and endless stream, widening the pool of milk and sex-juice on the floor. You could look down at her blissed-out eyes and limp, dangling tongue for what feels like forever.");
	output("\n\nThis is... nice.");
	output("\n\nMitzi moos as if in agreeance, to which you respond with a fervent suck. Time passes as your belly fills, but still you continue to drink, egged on by bovine lowing and the occasional whispered word of English. The skin of your [pc.belly] may feel tight and your stomach bloated, but you soldier on for almost a solid hour before you can take no more.");
	processTime(60);
	//boost lac here?
	mitziGushEffects();
	pc.milkInMouth(mitzi);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Next",mitziJustMilkII);
}

public function mitziJustMilkII():void
{
	clearOutput();
	showMitzi(true);
	output("<i>“Moo?”</i> Mitzi groans, blearily blinking her eyes. The tail slides out of her snatch with a wet pop as she comes down. <i>“No... no more milking Miss Moo?”</i>");
	output("\n\nYou pat your milk-burdened belly. <i>“Not for the moment.”</i>");
	output("\n\n<i>“Oh.”</i> The goblin’s brow crinkles for a moment. When she looks back up, she’s smiling as if she’s had the cleverest idea in all the galaxy. <i>“What about now?”</i>");
	output("\n\n<i>“Not now either.”</i>");
	output("\n\nThe look of shock on Mitzi’s face is priceless. She stutters, <i>“B-b-but Mi-mi-miss Moo has milk! See?”</i> She squeezes her breast, delivering a much slower flow of creamy goodness. <i>“Mmm...”</i> Her eyes flutter closed. <i>“Moo-ooooo!”</i>");
	output("\n\nYou pat her on the head, a little concerned that she still seems to have forgotten her name. <i>“I need to sleep off this milk-gut. You’re welcome to milk yourself in the meantime.”</i>");
	output("\n\n<i>“Awww... Miss Moo wants more milk. More milks and moos and sucks!”</i> She pouts. <i>“Maybe later? [pc.Master] make Moo even more milky later?”</i>");
	output("\n\nYou promise that you will, but it’s probably best she wait until she’s recovered from this dose.");
	processTime(30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tit-Milk-Fuck
public function mitziMilkTitfuck():void
{
	clearOutput();
	showMitzi(true);
	var x:int = pc.biggestCockIndex();
	output("<i>“Yes, Milkies,”</i> you say, ");
	if(!pc.isCrotchExposed()) output("pulling open your [pc.crotchCovers] to reveal");
	else if(pc.isErect()) output("stroking your erect [pc.cocksNounSimple]");
	else output("stroking your rapidly-stiffening [pc.cocksNounSimple]");
	output(". <i>“Milkies here.”</i>");

	output("\n\nMitzi’s eyes go as wide as saucers. Her hands drop from her tits, fingers twitching in eagerness while her Gush-melted mind tries to figure out how cock and milk go together. <i>“Miss Cow...”</i> she moos, <i>“...milks here?”</i> She hesitantly reaches out to grab [pc.oneCock]. On contact, the milk-streams from her nipples pulse out heavy flows.");
	if(pc.cocks[x].thickness() > 3.5) output(" Her fingers can’t wrap all the way around the turgid maleness, but she tries all the same, fingernails gently pricking at your sensitive skin.");
	else output(" Her fingers casually wrap around it, gliding up in down an automatic handjob.");

	output("\n\nAfter watching the bimbo willingly devolve herself into a leaking, lactic toy, something as simple as a hand on your dick feels amazing. You groan in delight and nod. <i>“Get it nice and wet so I can fuck your tits.”</i>");
	output("\n\nAgain, this shorts Mitzi right the fuck out. Her eyes cross to stare at your dick while her hand continues to stroke it, bereft of conscious thought. She opens her mouth, then closes it, drools a bit, then gulps it all down and quietly moos. <i>“Titty-milk-fuck?”</i> Her voice is high-pitched and strained with unfiltered excitement. Biting a too-plush lip, she at last lets go of your [pc.cock " + x + "] to heft her tits, one in each hand. <i>“Help moo-me milk?”</i>");
	output("\n\nYou’d like nothing better. Getting your hands on Mitzi’s nipples, you discover that they aren’t just engorged, they’re <i>ripe</i> and firm beyond belief. You can actually feel the liquid coursing through her milk ducts with enough pressure to send gentle vibrations through to your fingers. No wonder Mitzi’s drooling all over herself and speaking in ‘moo.’\n\nYou say, <i>“Easy girl,”</i> as you shift your grip a bit back and squeeze, forcing the milk forward with a gentle nip-ward press.");
	output("\n\nYour milk-minded goblin tries her best to keep it together, but the moment her sweet juices are forcibly squeezed out of her still-inflating milk-bags, her knees knock together and her eyes roll back. She whimpers cutely as you tug down to her nipples, shaking like a leaf. The milk gets everywhere, of course. Her boobs spray like creamy sprinklers, splattering your body from [pc.belly] to [pc.foot]. It hits you like warm, wet cluster munitions, exploding into bursts of delightful warmth on your [pc.thighs]");
	if(pc.balls > 0) output(", your [pc.balls]");
	output(", your crotch, and especially your [pc.cocks]. There’s enough pearly goblin-milk for it drizzle from your [pc.cockHead " + x + "] like sweet-smelling cum.");
	output("\n\n<i>“Mooooo!”</i> Mitzi cries, leaning forward to sloppily kiss the top of your [pc.cock " + x + "], inadvertently making you waste your last few nipple-tugs onto the floor.");
	output("\n\n<i>“Good girl,”</i> you say, letting go of her nipples to give her a friendly pat on the head. She leans into your hand, panting hotly. The goblin-cow’s heart-shaped pupils remain locked on your cock. You ask, <i>“Are you ready to titfuck?”</i>");
	output("\n\nMitzi’s tongue falls out of her mouth, and her tail slips between her legs to rub at a soaking wet gabilani mound. <i>“Moo!”</i> She kisses your cock. <i>“Moo!”</i> She rubs her cheek against it, smearing milk on herself without a care in the world. <i>“Moo want dick!”</i>");
	output("\n\nYou’re going to give it to her. With one hand on her back and the other wrapped possessively around her throat, you bear her to the ground. She lets you do it too. The closest she gets to struggling is accidentally spurting some milk on your [pc.chest] when her titties bounce against one another. Those gorgeous heart-shaped eyes of hers stare up at you longingly, right up until you squat overtop of her and drop your milk-soaked cock into her cleavage with an audible splat.");
	output("\n\nThen Mitzi’s too busy arching her back and crying out in delight to do something as mundane as maintain eye contact. <i>“Oooooh mooooo! Mooooo liiiike!”</i>");
	output("\n\n<i>“Here, let me help,”</i> you say as you put a hand on either side of her enormous tits and press them together. Mitzi’s pillowy flesh squeezes down around your [pc.cock " + x + "] in a vise of cream-coated skin, warm and wet in all the best ways. Better still, the added pressure causes her nipples to go into overdrive, spraying thick arcs into the air while less energetic streams roll down the swells of her tits to soak them in milky shine. You hold that position for a few moments, mashing the Gush-brained goblin’s mountainous mounds around your dick while you try to get used to the intense sensation.");
	output("\n\nMitzi’s body goes limp, and you feel a splatter of feminine fluids against the underside of your [pc.butt]. A second later, her head pops up off the ground, milk-soaked pigtails bouncing, and she smiles at you. <i>“Moo!”</i>");
	output("\n\nUnsure of how to respond, you continue to massage the goblin fuck-toy’s sinfully slick mammaries around your [pc.cock " + x + "], wringing a happy sigh from yourself.");
	output("\n\n<i>“So moo-damned good!”</i> Mitzi bubbles, grabbing hold of her teats to squeeze out more milk. By now, her nipples seem almost comically large compared to her fingers. It’s actually looks sort of like she’s trying to milk a cow, with a more than appropriate liquid result. <i>“I love moooo!”</i> She’s looking you in the eyes while she says it, smiling broadly, if a bit vacantly, and wiggling around so that her tits shift on your [pc.cock " + x + "]. <i>“Fuck-milk now?”</i>");
	output("\n\nEven if the dopey goblin hadn’t asked, her cutely misspoken declaration was more than enough motivation to give her the righteous pounding a woman like her deserves. <i>“Yes,”</i> you announce, sliding your [pc.hips] back to drag your dick back to the [pc.cockHead " + x + "]. <i>“You’re so good, Mitzi.”</i> You thrust back in");
	if(pc.balls > 0) output(", [pc.balls] dragging on her middle");
	output(", cock throbbing, plowing a tunnel between her pillowy tits");
	if(pc.cocks[x].cLength() > 14) 
	{
		output(" until your [pc.cockHead " + x + "] bursts out of the top");
		if(pc.cocks[x].cLength() < 25) output(" and kisses her lips");
		else output(" and slides past her cheek");
	}
	output(". <i>“So goddamn good!”</i>");

	output("\n\nNow that you’ve started, you can’t stop yourself. You’re too worked up, and she’s too hot. Her drug-enhanced breasts are unreal. Nothing should be so big yet so soft and so utterly, completely slick on your skin. Nothing should wring droplets of pre-cum from you so freely or ripple so hotly around your girth. Mitzi is a powerhouse dynamo of breastly sensuality, whether she has the awareness to know it her not.");
	output("\n\nYou hump her tits like a [pc.manWoman] possessed. Your [pc.hips] slap into them hard enough to make them bounce and shake. Mitzi is carried along by their inertia; every stroke shifts her an inch or two up and down, but she’s well past caring. The little minx is coaxing out more milk to lube you up, more to keep you hot and bothered. She’s smiling and cumming and mooing without a care in the world.");
	if(pc.cocks[x].cLength() > 14) 
	{
		if(pc.cocks[x].cLength() < 25) output(" Sometimes she stops to suck your [pc.cockHead " + x + "] for a few seconds but forgets the instant you draw it away.");
		else output(" Sometimes she stops to slobber on your shaft for a few seconds but forgets the instant you draw it away.");
	}
	output("\n\nFrom far away it probably sounds like you’re banging an actual cow. Mitzi is incapable of forming words at this point, either from the pleasure or the drugs. There’s only squelching, slapping, and obvious sexual grunts in the air as you near your peak. Your fingers sink deep into supple emerald skin, unconsciously clenching tighter. Of course, this just releases more milk and makes Mitzi moo that much louder. She’s still looking at you though, and her eyes tell you what her lips cannot: that she wants you to blow the biggest, messiest load ");
	if(pc.cocks[x].cLength() > 14) output("all over her face");
	else output("into her tits");
	output(".");

	var cumQ:Number = pc.cumQ();
	output("\n\nYou cum. How could you not? Pleasure races through your [pc.cocks], ");
	if(cumQ < 100) output("spurting");
	else output("spraying");
	output(" out ");
	if(pc.cocks[x].cLength() <= 14) output("into Mitzi’s milk-glazed mounds");
	else output("onto Mitzi’s whorishly delighted face");
	output(". You fuck your way through it, adding sensation to your orgasm. The second pulse is at least twice as potent as the first");
	if(pc.cocks[x].cLength() > 14)
	{
		if(pc.cocks[x].cLength() < 25) output(", painting the goblin’s face and pig-tails [pc.cumColor]");
		else output(", oozing out of both ends of her cleavage");
	}
	output(", and still, you keep fucking. You fuck Mitzi");
	if(cumQ >= 1000) output(" until she’s more spunk than goblin, your seed splattered in more places than you could ever keep track of");
	else output(" until you run out of spunk and stir it around in her milk with your [pc.cock " + x + "]");
	output(". Her tongue slithers out to collect dabs of it to swallow.");
	output("\n\n<i>“Mooooo,”</i> Mitzi moans after the first mouthful, going back for seconds. <i>“Mmmm good moo.”</i>");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mitziMilkTitfuckII);
}

public function mitziMilkTitfuckII():void
{
	clearOutput();
	showMitzi(true);
	showImage("MitziAhegaoLick");
	output("Satisfied at last, you extricate your milky cock from Mitzi’s milk-dribbling tits and look down at the soaked goblin. <i>“Are you alright?”</i>");
	output("\n\nHer chest is heaving like she’s out of breath, and her legs are absolutely soaked in pussy juice. More concerning is that her nipples are still drooling milk, her hands still there to coax it out. Mitzi’s vacant stare pivots your way. <i>“Miss Moo uh... feels real good.”</i> She licks up a little more milk. <i>“Want more milk-fucks, but milk getting slow!”</i> Sure enough, you note that the milk-flow has receded somewhat. <i>“[pc.Master] make Moo milky again later?”</i>");
	output("\n\nYou promise that you will, but it’s probably best to wait a bit for now.");
	processTime(4);
	mitziGushEffects();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function mitziGushEffects():void
{
	IncrementFlag("MITZI_GUSHED");
	mitzi.breastRows[0].breastRatingRaw += 1 + rand(3);
	pc.createStatusEffect("Mitzi_Gushed_Out");
	pc.setStatusMinutes("Mitzi_Gushed_Out",60*24*3);
	mitzi.milkFullness += 100;
	if(mitzi.milkMultiplier < 100) mitzi.milkMultiplier += 60;
	mitzi.milkStorageMultiplier += 0.25;
	//output("\n\n<b>New Mitzi milkQ: </b>" + mitzi.milkQ());
	if(!pc.hasStatusEffect("Mitzi_Gush_Thankyou")) pc.createStatusEffect("Mitzi_Gush_Thankyou");
}

//[DONE] Give Mitzi Bubbles!
//Give Mitzi a bubble buddy bubble. Mitzi gives back a prize for the first time at a size.
//Savicite-Lace Panties - increases minimum lust to 33.
//<i>“Rutting”</i> perfume - tease damage boost + vuln, infinite uses. Lasts 16 hours.
//Scylla - A bionahole made from her cloned pussy.
//Opal Ring piercing - looted ring from drug dealer. Releases cum/girlCum enhancing drugs in moments of climax

public function giveMitziACumBubble():void
{
	clearOutput();
	showMitzi();
	output("Mitzi would probably enjoy some bubbled cum, if you really want to give it to her.");
	if(flags["BUBBLE_BUDDIED"] == undefined) output(" Now where could you get some of that? Maybe TamaniCorp sells something.");
	
	clearMenu();
	if(pc.hasItemByClass(SmallCumBubble)) addButton(0,"Small Bubble",giveMitziACumBubble4Real,SmallCumBubble);
	else addDisabledButton(0,"Small Bubble","Small Bubble","You don’t have any to give her.");
	if(pc.hasItemByClass(MediumCumBubble)) addButton(1,"Medium Bubble",giveMitziACumBubble4Real,MediumCumBubble);
	else addDisabledButton(1,"Medium Bubble","Medium Bubble","You don’t have any to give her.");
	if(pc.hasItemByClass(LargeCumBubble)) addButton(2,"Large Bubble",giveMitziACumBubble4Real,LargeCumBubble);
	else addDisabledButton(2,"Large Bubble","Large Bubble","You don’t have any to give her.");
	if(pc.hasItemByClass(HugeCumBubble)) addButton(3,"Huge Bubble",giveMitziACumBubble4Real,HugeCumBubble);
	else addDisabledButton(3,"Huge Bubble","Huge Bubble","You don’t have any to give her.");
	
	addButton(14,"Back",approachCrewMitzi,true);
}

public function giveMitziACumBubble4Real(arg:Class):void
{
	clearOutput();
	showMitzi();
	pc.destroyItemByClass(arg);
	//First time any size
	if(flags["MITZI_CUM_PRESENTS"] == undefined)
	{
		output("You pull a ");
		if(arg == SmallCumBubble) output("small, latex-wrapped");
		else if(arg == MediumCumBubble) output("grapefruit-sized");
		else if(arg == LargeCumBubble) output("bowling ball-sized");
		else output("beachball-sized");
		output(" cum bubble out of your pack and ");
		if(!(arg == HugeCumBubble)) output("extend it to");
		else output("roll it toward");
		output(" the horny goblin. <i>“I got you a present.”</i>");

		output("\n\nMitzi gingery ");
		if(!(arg == HugeCumBubble)) output("accepts the gift");
		else output("hugs the goblin-sized gift");
		output(", squeezing it between ");
		if(!(arg == HugeCumBubble)) output("her tiny palms");
		else output("her arms");
		output(" in excitement. <i>“Omigawwwwd! Nobody ever gets Mitzi like, anything!”</i> She shakes it, listening to the sloshing. <i>“...It’s cum right? Please let it be cum.”</i>");
		output("\n\nThe second you signal in the affirmative, Mitzi swoons and moans, <i>“My hero! You’re the best [pc.Master] a girl could get.”</i> She produces a syringe and sticks it into the bubble, casually extracting a sample to spray onto her waiting tongue. <i>“Mmmm, yummy too. Mitzi should really return the favor. Give you something like, just as awesome.”</i> The goblin extracts another hit of seed and swallows it with an enormously satisfied sigh, <i>“Ohhhhh gaaaawwwwwwd. Yeah. Something better than goblin-sex. You have all of that you can want. Back in a dick-suckin’-second!”</i>");
		output("\n\nPitter-pattering feet slap into the deck as the green-skinned cum-addict scampers off with her prize. You fold your arms and tap your foot, but she’s back before you know it, carrying in something gift-wrapped in neon condoms like wrapping paper. <i>“Here, [pc.Master].”</i> Mitzi’s lashes flutter adoringly above her pink, heart-shaped eyes.");
		//Bimbo
		if(pc.isBimbo()) output("\n\nYou’re blown away at such inventive use of condoms. And here you thought they were only good for like, storing snacks. You peel them off one at a time, sharing them with Mitzi in case either of you ever needs to bank up a little boy-batter.");
		//Bro
		else if(pc.isBro()) output("\n\nYou’re not sure what you should have expected. It is sort of impressive the dumb slut could remember that most people wrap presents. You rip off the condoms with a grunt of irritation.");
		//Else
		else output("\n\nYou’re a little thrown off by her decorative choices, all things told, but you suppose that’s what happen when a girl accidentally gets her brain rewritten to focus exclusively on being a fuckable piece of ass. The condoms come off easily enough anyway.");
		//Merge
		awardMitziBubblePrize(arg);
	}
	//First time small
	else if(arg == SmallCumBubble && flags["MITZI_SMALL_CUM_PRESENT"] == undefined)
	{
		output("You pull out a small, latex-wrapped cum-bubble and hand it to the horny goblin. <i>“I got you another one.”</i>");
		output("\n\n<i>“Ooooh,”</i> Mitzi purrs as she accepts it. <i>“It’s like... a baby cum-ball. Fun-sized. Like Mitzi!”</i> She squints at your crotch. <i>“Kinda thought it’d be bigger this time... Maybe [pc.Master] wasn’t turned on enough. Mitzi has just the thing.”</i> She scampers off down a hall, biting into the bubble on the way in order to slurp down the contents.");
		output("\n\nWhen she returns, she’s got another present for you - this one balled up in her hands instead of condom-wrapped.");
		//Use gift texts from first-time.
		awardMitziBubblePrize(arg);
	}
	//First time medium
	else if(arg == MediumCumBubble && flags["MITZI_MEDIUM_CUM_PRESENT"] == undefined)
	{
		output("You present Mitzi with a grapefruit-sized bubble of cum. <i>“Gotcha some more.”</i>");
		output("\n\nMitzi’s heart-shaped eyes seem to light up, almost glowing pink in delight. <i>“More cum for </i>me<i>!”</i> Clapping her hands to her cheeks, the goblin marvels at its size and shape before favoring you with a loving stare. <i>“Umm... Mitzi hardly deserves all this cum. She didn’t milk it out. She didn’t spend hours rubbing balls to make sure the spermies were all woke up and ready to shoot out. How... uh... oh!”</i> She snaps her fingers. <i>“Mitzi has just the thing! It’ll be sooo awesome. Hold on!”</i> She wheels about and hauls ass, off to look for a present to exchange.");
		output("\n\nWhen she returns, she’s moving at such speed that she slams into you and bounces off, cradling against her belly. Thankfully she didn’t waste a billion condoms wrapping it this time.");
		awardMitziBubblePrize(arg);
	}
	//First time bowling bawl
	else if(arg == LargeCumBubble && flags["MITZI_LARGE_CUM_PRESENT"] == undefined)
	{
		output("You present Mitzi with a bowling ball-sized sack of cum. <i>“Gotcha another one!”</i>");
		output("\n\nShe nearly tumbles over from the weight of it. <i>“Ooooh, what a big, virile dick this must have cum from.”</i> Rubbing her cheek against the straining surface, Mitzi marvels, <i>“And you got it all for favorite fuck-toy. Such a generous [pc.Master]!”</i> Happiness-lighted eyes gaze longingly up at you. <i>“Mitzi doesn’t deserve... doesn’t deserve this.”</i> Tears well up at the corners of her eyes. <i>“[pc.Master] is too kind. Oh!”</i> She wipes away the moisture and returns to carefree bimbosity. <i>“There’s this thing Mitzi got. [pc.Master] might like it!”</i>");
		output("\n\nThe goblin darts away in a flash of green, returning a short time later with something tucked out of view between her tits. <i>“Know what Mitzi got you?”</i>");
		output("\n\nYou shake your head in the negative.");
		//Normal reveal
		awardMitziBubblePrize(arg);
	}
	//First time Beach Ball
	else if(arg == HugeCumBubble && flags["MITZI_HUGE_CUM_PRESENT"] == undefined)
	{
		output("You present Mitzi with an enormous, wobbling fluid bubble. <i>“Ever wanted a lifetime supply?”</i>");
		output("\n\nMitzi’s mouth falls open. Her eyes grow wider and wider, heart-shaped pupils dilating until they’re nearly all you can see. <i>“All this is cum?”</i> She runs a hand across the surface, feeling how the taut expanse wobbles with the promise of luscious seed. <i>“You made this... for Mitzi?”</i> She looks up uncertainty.");
		output("\n\nYou nod.");
		output("\n\n<i>“That’s not... not fair. It must have taken so many strokes to squeeze out this much!”</i> Mitzi pouts forlornly. <i>“All that time milking a heavy dick and you didn’t even have any real help. Mitzi should have done it for you. It would have felt so much better.”</i>");
		output("\n\nPatting her head between the pigtails, you assure her that you’re quite happy to give her this present. Besides, this is all the cum she could ever need, right?");
		output("\n\nA snorting giggle interrupts you. <i>“You’re so funny, [pc.Master]! This is like, one good cum-bath, maybe. Mitzi can make it last a long, long time if she needs to, just like you in bed, but there’s always room for more cum. Oh! Mitzi’s such a dumb fucking cunt! Hold on a squirt, k?”</i> She hauls ass down a hallway, leaving you alone with an enormous bubble of spunk.");
		output("\n\nMitzi returns with a tiny box in hand and a proud smile. <i>“Gotcha something! Not as good as cum, but close!”</i>");
		output("\n\n<i>“What is it?”</i>");
		//Generic gift text here!
		awardMitziBubblePrize(arg);
	}
	//Repeat cum gift - already gave her one
	else
	{
		output("You ");
		if(arg == SmallCumBubble) output("toss Mitzi another small, latex bubble.");
		else if(arg == MediumCumBubble) output("gently hand Mitzi a big, latex ball full of liquid.");
		else if(arg == LargeCumBubble) output("carefully hand Mitzi a bowling-ball of latex-sealed fluid.");
		else output("roll an enormous, wobbling latex ball toward Mitzi.");
		output(" <i>“");
		if(pc.isBimbo()) output("I got you the best thing ever - even more cummies!");
		else if(pc.isBro()) output("Hey.");
		else if(pc.isNice()) output("Here’s some more bubbles of... you know. It’s the least I could do.");
		else if(pc.isMischievous()) output("I brought you some happiness in a bubble, if you know what I mean.");
		else output("We both know you love these, you little slut.");
		output("”</i>");
		output("\n\nMitzi greedily accepts your offering and quickly squirrels it away, out of view. <i>“Thank you [pc.Master]! ");
		if(arg == SmallCumBubble) output("Now Mitzi has a snack for later!");
		else if(arg == MediumCumBubble && rand(2) == 0) output("Now Mitzi has more snacks for later!");
		else if(arg == MediumCumBubble) output("Now Mitzi can like, do cum facials and stuff. It’s super good for your skin!");
		else if(arg == LargeCumBubble && rand(2) == 0) output("Now Mitzi can have cum-facials for her skin </i>and<i> use it for lube. Probably even have a snack after!");
		else if(arg == LargeCumBubble) output("Wow! You’re like, the best at cumming, you know that? No wonder Mitzi is your personal cunt-rag! So much to drink and play with...");
		else if(arg == HugeCumBubble && rand(2) == 0) output("There’s like... umm... sooo much of your jizz now. Mitzi’s gonna take a bath in it later. Then see how much she can drink, okay?");
		else output("Umm... Mitzi is going to have to take cummy baths every day to use all this up... and... and... it’s the best thing ever! Mitzi loves you so much, [pc.Master]!");
		output("”</i>");
		output("\n\nThe big-eyed goblin flutters her lashes and squeezes you into a hug, tits and ass spilling everywhere. Her fingertip slides slowly up and down your ");
		if(pc.tallness >= 5*12) output("[pc.leg]");
		else output("spine");
		output(". <i>“So like... how can Mitzi pay you back?”</i> She snuggles up to you");
		if(pc.tallness >= 5*12)
		{
			if(pc.hasCock()) output(", cheek pressed against your [pc.cocks].");
			else if(pc.hasVagina()) output(", cheek pressed against your [pc.multiCunts].");
		}
		else if(pc.tallness >= 4*12+6) output(", cheek nuzzling into your [pc.belly].");
		else output(", cheek nuzzling into your [pc.chest].");
		output(" <i>“[pc.Master] is so perfect...”</i>");
		processTime(10);
		mitziSexMenu();
	}
	IncrementFlag("MITZI_CUM_PRESENTS");
	if(arg == SmallCumBubble) IncrementFlag("MITZI_SMALL_CUM_PRESENT");
	if(arg == MediumCumBubble) IncrementFlag("MITZI_MEDIUM_CUM_PRESENT");
	if(arg == LargeCumBubble) IncrementFlag("MITZI_LARGE_CUM_PRESENT");
	if(arg == HugeCumBubble) IncrementFlag("MITZI_HUGE_CUM_PRESENT");
}

public function awardMitziBubblePrize(arg:Class):void
{
	//Panties
	if(arg == SmallCumBubble)
	{
		output("\n\n<i>“It’s panties!”</i> Mitzi cheers, the picture of radiance. <i>“They’re like, the best panties ever. They’ve got like... savi...savick... uh, some kind horny-making stuff in woven all over the lacing. It’s super strong! I’m like, always wet when I wear them. So I thought, maybe if you ever wanted to fuck a whole-whole-whole-whole lot, you’d really like them.”</i> She hugs your [pc.leg] and kisses your [pc.thigh]. <i>“And they’re crotchless, so you don’t even need to take them off, like ever!”</i>");
		output("\n\nIt is clear the goblin treasures this underwear something fierce. You pat her on the head and slip them into your pack.");
		output("\n\n<i>“So like, do you wanna fuck now?”</i>");
		output("\n\nEver a one-track mind with Mitzi.\n\n");
		processTime(20);
		quickLoot(new SavicitePanties());
		eventQueue.push(mitziCrewSexApproach);
	}
	//"Rutting” perfume - tease damage boost + vuln, infinite uses. Lasts 16 hours.
	else if(arg == MediumCumBubble)
	{
		output("\n\n<i>“It’s Mitzi’s favorite perfume-slash-cologne-slash-smell-good-stuff!”</i> the ditzy bimbo cheers, absolutely radiant. <i>“It even has a sexy name! ‘Rutting’! One spritz has like, more phero...pherom... smelly-moans than an a hellhound in heat! See?”</i> She squeezes the bulb on the end and blasts you in the face with the indescribably woodsy fragrance.");
		output("\n\nIt’s... woah, Mitzi looks awfully sexy when she looks at you like that, especially when she leans in and sniffs. A gift this good almost demands a hard fuck, especially now that you’re feeling so... sexy.");
		output("\n\n<i>“Mitzi knew you’d love it.”</i> The pint-sized fuck-toy says, her hands roaming all over your [pc.thighs]. <i>“Mitzi loves it too.”</i> She sniffs. <i>“She loves you too, and she wants to love you so much more. Ummm... just be careful, cause like... it makes you smell super sexy, but then you kinda get turned on real easy too, see?”</i> Manicured fingernails gently caress your groin, nearly buckling your ");
		if(pc.hasKnees()) output("knees");
		else output("[pc.legOrLegs]");
		output(".");
		output("\n\nYou see what she means. This stuff could come in handy when you’re trying to seduce someone... so long as you don’t wind up spread-eagled and gasping yourself. Best of all, the reservoir bulb is so full that you’re unlikely to run out in the foreseeable future.");
		output("\n\n<i>“So... you wanna fuck or something?”</i>\n\n");
		processTime(20);
		quickLoot(new RuttingPerfume());
		eventQueue.push(mitziCrewSexApproach);
	}
	//Scylla - A bionahole made from her cloned pussy.
	else if(arg == LargeCumBubble)
	{
		output("\n\n<i>“It’s Mitzi’s pussy!”</i> the pint-sized sex-addict purrs. <i>“Some company makes them, so you can like, have your favorite fuck-toy’s cunt as you know, an actual fuck-toy you can have on the go.”</i> She reaches out to fondle your crotch. <i>“Now whenever you’re too far away for Mitzi to take care of, you can play with her clone-pussy. It’s even like, got a mod to release a little bit of aphrodisiac in the juices. They wouldn’t put throbb in it, even after I sucked off the shopkeeper like, ten times, but this is still pretty nice, right? You could probably cum just from eating it out, if you did it long enough.”</i>");
		output("\n\nYou place the cap back on Mitzi’s BionaHole and store it in your pack. She’s right. It might be fun to play with on the road.\n\n");
		processTime(20);
		quickLoot(new MitziBionaHole());
		eventQueue.push(mitziCrewSexApproach);

	}
	//Opal Ring piercing - looted ring from drug dealer. Releases cum/girlCum enhancing drugs in moments of climax
	else
	{
		output("\n\n<i>“It’s jewelry!”</i> the excitedly emerald minx cheers, the picture of radiance. <i>“But not just any jewelry: a piercing! The sluttiest, prettiest, most wonderful kind of jewelry in the galaxy. And this one is special, since you gave Mitzi such a special gift.”</i> She hugs the enormous cum-bubble, wobbling back and forth with it. <i>“So like, the opal in that ring is hollow or something and filled with micro-surgies that’ll go to work on your junk right before you cummy! Mitzi tried it once, and she squirted like, two gallons. It’s gonna be on like, a cock or pussy to work though. If you put it on a nipple or something, it just looks really, really cute.”</i>");
		output("\n\nYou look it over hesitantly. That does sound sort of fun.");
		output("\n\n<i>“So like, you wanna fuck now, or should Mitzi go have a snack?”</i>\n\n");
		processTime(20);
		quickLoot(new OpalRingPiercing());
		eventQueue.push(mitziCrewSexApproach);
	}
}

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
	output(", must be going wild. The only thing keeping her from jumping your dick this very second is her ingrained submissiveness. Her eyes are wide and pleading, backed up by a high-pitch whine from somewhere inside her throat. Mitzi rubs deeper between her legs, instantly soaking her fingers with incredibly liberal secretions. <i>“...yesssss. Please... fuck Mitzi.”</i>");
	output("\n\nYou grab a lock of purple hair and pull the mindbroken goblin’s face against your [pc.cock], smearing her cheek with your pre-cum, leaving her skin glistening with fuck-scent. She doesn’t protest or complain. Instead, she grows more aroused by the second. Flushing hot, her face radiates heat and desire. Her nipples are as thick as pencil erasers, hard against your roving palm. She can’t even stop her pussy from absolutely drizzling. The off-beat spattering of cunt-juice on the floor is music to your ears.");
	output("\n\nMitzi licks her purple-painted lips a few times and opens wide, her bright-pink organ laid out like a landing strip for your pre-oozing sex-engine. You’ve seen some slutty aliens in the wild, but none have managed to look quite so brazenly whorish as this pirate-broken pet. Her mouth looks made for sucking dick, capped with lush angel-bows under a layer of fuck-me paint. Her breasts are huge and shapely without a hint of sag. Even her pussy is primed for fucking, so plush and full that it’d feel like it’s kissing your crotch while you take her.");

	output("\n\nYou lay your pipe across her salivating tongue, but as you’re admiring the sight of it there, backlit by hungry goblin, she pulls it inside, wrapping you in the tight heat of her hungry mouth before you can possibly react. Mitzi’s cheeks hollow from establishing a fevered suction. Her eyes flick up, meeting yours while she gently begins to bob back and forth, establishing a gentle, face-fucking rhythm that soon has you freely dribbling condensed anticipation onto her constantly wiggling tongue.");
	output("\n\nThere wouldn’t be a need for you to move, if you didn’t want to. You could let Mitzi work your [pc.cock] for hours");
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
	output("\n\nKnowing that a girl’s pussy is overflowing is one thing; experiencing the sodden reality is another. Her pumped-up petals kiss your [pc.cockHead], slowly giving as you try to thread yourself between them. Ribbons of wetness run down the underside of your [pc.cock], thickening the longer you’re in contact with the fountaining love-slave. The obscene plushness of her labia majora actually holds you back, but after a certain amount of force, they bow around you, allowing you to slip your first few inches into Mitzi’s silken vice.");
	pc.cockChange();
	output("\n\nWith what she looks like on the outside, falling somewhere between a high class call-girl and a short, stacked succubus, you expected her slit to be equally pleasing. The slippery, heated heaven into which you now sheath yourself is beyond any expectations. She feels molded to you, her entrance designed to welcome cocks deep inside its deepest recesses. Even compared to the sluttiest, most heavily engineered sexbots, Mitzi’s cunt is exceptional. Her silky folds squeeze down on you the further you thrust in, tending to your budding pleasure with excess of slickened sensation.");

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
	output(" There’s no harm in waking up with a sexpot milking every drop from your [pc.cocks]. You’ll be better prepared to deal with the trials and tribulations of new planets that way. Maybe someday you’ll even knock her up, raising up an army of adoring gabilani children to continue your legacy.");
	output("\n\nThe thought of Mitzi, pregnant with a half-dozen of your daughters, riding on your dick in the morning flips your switch. You couldn’t stop yourself from cumming if the entire galaxy was scolding you.");
	if(pc.exhibitionism() >= 66) output(" Actually, that thought’s probably just going to make you blow that much harder. Damn you, exhibitionist fetishes!");
	output("\n\nWith another victorious slap on Mitzi’s ass, you bottom out.");
	if(pc.balls > 1) output(" Your [pc.balls] quake, pulling your [pc.sack] taut against your body as they disgorge their creamy relief.");
	output(" You hold yourself there, pumping incessantly against your chosen cum-dump. Her face radiates absolute bliss. Gabilani must have some kind of sense of when cum is splattering against their cervix, because you’ve never seen Mitzi happier, not even when you saved her, so long ago.");
	output("\n\nPulling out");
	if(pc.hasKnot(0)) output(" with a wet sounding pop after solid knotting");
	output(", satisfied, you grab your ");
	if(!pc.isCrotchExposed()) output("[pc.crotchCover]");
	else output("things");
	output(" and consider your options. Mitzi is still laying there");
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 3000) output(" with a cum-pregnant belly");
	if(cumQ >= 250) output(", spooge dripping down her thighs from her overfilled snatch");
	output(". She’s slowly rousing back to consciousness, but you should probably get on with your day.");
	processTime(27);
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
	output("\n\nMitzi might as well be a creature born of sapphic desire. She doesn’t show any sign of needing to breathe or talk. It’s like her whole world is composed of vaginas, clits, and the fluids within. Her single mindedness is reflected in the motions of her unholy tongue, prowling around every sensitive fold to press on the most sensitive nerves, channeling your ");
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
	output("When your vision clears, Mitzi is sitting on your lap and gently massaging your [pc.chest]. Only a few seconds have passed, but the nearby goblin’s face is somehow cleaned already. You push the slut off and rise up onto your [pc.feet], well and truly sated.");
	output("\n\n<i>“What should Mitzi do now, [pc.Master]?”</i> The harlot with the too-long tongue asks, licking her lips. <i>“Want another cum?”</i>");
	output("\n\nYou don’t have time to join in on the debauchery here, but you doubt this’ll be the last time you make use of her services.\n\n<i>“Whatever you want to do. I should probably get to work.”</i>");
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
	output("your [pc.cocks], explaining that you’d like to see her please your [pc.cock " + x + "] with her tits. After all, she’s responsible for your current, rigid state");
	if(pc.balls > 1) output(" and too-full feeling balls");
	output(" thanks to all her teasing");
	output(". It’s only fitting that she satisfy you.");

	output("\n\nMitzi wastes no time in dropping to her knees and half crawling, half waddling over, her hard, purplish teats dragging on the ground whenever she tips too far forward, making her sweat-oiled breasts jiggle and bounce against one another. She blushes deeper from the stimulation, leaving a trail of fuck-me-juice on the floor behind her. When her nose finally reaches [pc.oneCock], she nuzzles against it, kissing softly against the veins while her nostrils flare excitedly.");

	output("\n\n<i>“Ohhh, it really needs a good cum, doesn’t it?”</i> Mitzi purrs after one particularly slobbery kiss. <i>“Do you want Mitzi to make you squirt fast or slow? She knows you’re in a hurry.”</i> The goblin wraps both her small hands around you and gently strokes. <i>“Please, [pc.Master], tell Mitzi how.”</i>");
	output("\n\nShe thinks she can get you off fast and let you return to hunting for your inheritance but she is also offering to make love to your [pc.cock " + x + "] until the pleasure gradually overwhelms you. Which do you prefer?");
	processTime(5);
	pc.changeLust(10);
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
	output("\n\nMitzi coos delightedly, <i>“Oooh, you’ll be sure to love Mitzi now! Your dick won’t ever forget this!”</i> She kisses your [pc.cock " + x + "] with inflated lips so pillowy you could lie down on them for a nap. Her thick-painted, purple gloss allows them to slide up and down with the briefest nod to friction, planting wet, slobbery kisses across the underside. Your [pc.legOrLegs] go");
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

	output("\n\nGiggling, the viridian vixen collects your pre-cum on her tongue and spreads it across her puffy, purple cocksuckers until they shine like amethyst, glossed over by your own leaking desire. <i>“‘Course Mitzi’d never disobey [pc.Master]’s command.”</i> She kisses the bare flesh above your insistent loins. <i>“Only the best titfucks for [pc.Master].”</i>");

	output("\n\nArching her back, Mitzi drags her oversized bosom");
	if(pc.balls > 0) output(" over your [pc.balls] and");
	output(" up to either side of your [pc.cock " + x + "], swaddling it in flesh that feels a little too cushy to be real. Her manicured fingertips press down from either side, tightening her vise until you feel her heartbeat hammering back against your boner, sending pleasant sensations thundering through the all-too-sensitive organ.");
	if(pc.biggestCockLength() >= 16) output(" You dribble yet more pre-cum onto the sweat-shined swells. Big as they are, they can’t quite ensconce your entire length, letting you watch it happen in lurid detail.");
	else output(" You dribble yet more pre-cum into her swampy cleavage. You can feel it getting slicker and slicker but can’t quite see it happen. You’ve nothing to go on but the feel against your [pc.cockHead " + x + "].");

	output("\n\n<i>“You like that?”</i> a voice somewhere above those two magnificent orbs asks.");
	output("\n\nYour acknowledgement comes out half groan and half sublime sigh. Rocking back your head, you push your [pc.hips] a bit further forward, properly seating you inside the quaking cleavage.");

	output("\n\nMitzi asks, <i>“Do you want this slow or not?”</i> She slowly forces her breasts to bounce in pendulous, alternating motions, sliding and squelching around your drooling fuckstick. <i>“If you hump my tits, it won’t be as good. Promise.”</i> She winks pinching her nipples between her thumbs and index fingers.");

	output("\n\nYou lazily nod and grab a nearby beam for support, trying to hold back before the squeezing tits drive you go over the edge. Mitzi’s look like bigger than they feel, capped with obscene areolae and rigid tips that must be incredibly sensitive. She certainly seems to enjoy them, judging by the way she’s moaning as she massages your [pc.cock " + x + "].");

	output("\n\nLittle by little, the sensations assaulting you are overwhelming you. The feel of Mitzi’s exquisite tits on you could have you spurting in short order by themselves, but they aren’t alone. They’re matched by the goblin’s flawless face. Her plush lips couldn’t possibly be any more inviting, her heart-shaped eyes begging any more honestly for you to spill the hottest, most molten load into her syrupy-slick maw. You see it all; you smell Mitzi’s passion, redolent in the air, pervasively reminding you that the goblin is getting off on this too.\n\nHow could you do anything but cum? How could you do anything but paint Mitzi’s ecstatic features in a thick layer of [pc.cumColor]?");
	//, but you aren’t by yourself. You’re surrounded by cavorting forms of all manner of sensuality: succubi with over-sized jugs and flawless faces, muscular minotaurs with cocks that may as well be baseball bats, incubi so devilishly handsome that a nun would rebuke her faith for a single kiss, and a hundred more. You see them all. You smell their passion, redolent in the air, pervasive and encouraging. How could you do anything but cum? How could you do anything but paint Mitzi’s ecstatic features in a thick layer of white?");
	output("\n\nAnd just like that, the squeezing warmth vanishes, replaced by air that feels a little too cold to be comfortable. Your [pc.cock " + x + "] hangs in the air, exposed and twitching, on the edge of blowing and yet unable to without a hand from the greenskin.");
	output("\n\n<i>“Please,”</i> you gasp, feeling the moment start to pass. <i>“I need to cum!”</i>");
	output("\n\nMitzi chews her bottom lip, still caked with a veneer of your juices. <i>“Nope! You told me to make it slow. Besides, everybody knows that " + pc.mf("masters","mistresses") + " say things they don’t mean when they’re all jizz-crazy! The last time I got someone off early, I didn’t get any dick for a whole day!”</i> She shakes her head. <i>“Just hold on, and you’ll go off like a cannon. I pussy-promise.”</i>");
	output("\n\nPussy-promise? What the hell is that?");
	output("\n\n<i>“Oh, you’re ready for more! Yay!”</i> Mitzi’s plush dick-massagers roll back into place before you can get a word in edgewise, turning your queries into a drawn-out moan. An undercurrent of the electric pleasure you’ve already felt lies beneath this new sensation, enhancing it further. If she gave you a few quick up and down jacks, she could have you frosting her boobs white in seconds, but she doesn’t. She keeps it nice and slow, a gentle massage that slides its way back and forth your entire length.");
	if(pc.biggestCockLength() >= 16) output(" Sometimes she even plants a few more kisses on your [pc.cockHead " + x + "] or just below. Other times she licks you like a lollipop - at least the parts not buried in bust.");
	output("\n\nYour head is swimming. No wonder you keep this goblin around! She’s so good with her breasts that they may as well be infused with black magic, transformed into tanks so overloaded with eroticism that they spark and fizz with it.");
	output("\n\nThe worst (or best) part is that she was right. You’re already feeling better than when you were at your peak. The desire to climax is still there, clawing at the back of your mind, but it’s buried behind a thicker wall of pleasure, numbed by the knowledge that her cutting you off once more might lead to further bliss.");
	output("\n\nMitzi’s dusky eyes flick up at you as she works, favoring you with a smile. <i>“Somebody’s getting into it now, isn’t [pc.heShe]?”</i> She bounces her boobs around a little faster, thrilling you with more excitement than you can handle. <i>“Yeah, you’re so close to blowing it, aren’t you?”</i> She smushes them down on either side, twisting her torso to drag them laterally across your overfull [pc.cockNounSimple " + x + "], surrounding you in a vortex that threatens to wring every drop of cum from your body. <i>“So close to just giving in.”</i>");
	output("\n\nMuscles in your abdomen twitch.");
	if(pc.balls > 1) output(" Your [pc.balls] feel like they’re going to burst, clenching tight beneath your [pc.cocks].");
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
	showImage("mitziTitfuckMessy");
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
	output("\n\nYou sit up, noting that she’s positioned herself so that her lust-engorged quim is stuffed full of fist. She’s humping her hand and crying in absolute delight, cooing about how she has the best [pc.Master] in the whole galaxy. Tears of unfettered joy stream down the goblin’s face as her eyes roll back from raw pleasure. At last, her knees slap together, quivering madly, and Mitzi slumps back, satisfied into unconsciousness.\n\nYou know how she feels.");
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
	output("\n\nMitzi moves to the next stage of her tittyfuck while you’re still trying to come to grips with the way her tongue curls and presses on the sensitive spot below your [pc.cockHead " + x + "]. She expertly drags her jugs down, bouncing them off your crotch in order to slide them back up without a second of downtime. Fuck, this greenskin knows how to make a [pc.guyGirl] blow [pc.hisHer] load!");
	showImage("MitziAhegaoLick");
	output("\n\nYou can feel the pleasure spasms in your gut starting already, and she’s only been touching your [pc.cocks] for thirty seconds or so! Mitzi mischievously meets your gaze and works her breasts faster, wetly slapping them against your [pc.hips] to a regularly building rhythm. By the time you begin to twitch and moan, her voluptuous tits are a blur of green around your [pc.cocks], but when you start to erupt, she slows to match the orgasmic throbs running through your body, milking you for every drop.");
	var cumQ:Number = pc.cumQ();
	//Low cum
	if(cumQ < 100) output("\n\nHer lips never leave your tip; she swallows every drop with the kind of pleased expression that can only come from experiencing something extremely fulfilling.");
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
	if(cumQ >= 100) output("cummy ");
	output("eyelashes at you and pushes a stray droplet of spooge past her puffy cocksuckers, swallowing noisily.");
	processTime(10);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Done] Mitzi Pussy Control~
//Wherin Mitzi applies some drugged lipstick, kisses the PC into hypnotic receptivity, and temporarily causes them to believe that pussy is the only thing they care about, culminating in squirting everywhere from eating Mitzi out.
public function mitziPussyControl():void
{
	clearOutput();
	showMitzi();
	author("Fenoxo");
	if(flags["MITZI_CUNTNOSIS"] == undefined)
	{
		//Bimbo
		if(pc.isBimbo()) output("<i>“Mmm, I could just like, eat you up! But could you maybe do something with this instead?”</i>");
		//Nice
		else if(pc.isNice()) output("<i>“Would you mind taking care of this for me?”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("<i>“Mitzi... I have a problem that needs a goblin’s touch.”</i>");
		//Hard
		else output("<i>“Pleasure this.”</i>");
		//Merge, no new PG.
		if(!pc.isCrotchExposed()) output(" You pull down your obstructing garments to reveal your [pc.multiCunts] to your pet greenskin.");
		else output("You gesture down to your [pc.multiCunts].");
		output(" Exposed skin flushes hotly");
		var wetness:Number = pc.wettestVaginalWetness();
		if(wetness >= 4) output(", and moisture streams down your [pc.legOrLegs]");
		else if(wetness >= 3) output(", and moisture dribbles down your [pc.legOrLegs]");
		else if(wetness >= 2) output(", and moisture slicks your [pc.thighs]");
		else output(", and aroused moisture lends your folds a dewy appearance");
		output(".");

		output("\n\n<i>“Ohhhhh...”</i> the dumbstruck goblin ");
		if(pc.tallness < 5*12) output("drops to her knees before ");
		else output("takes a halting step closer to ");
		if(pc.totalVaginas() == 1) output("it");
		else output("them");
		output(". She gently extends a hand, slender fingers spreading to land on either side of the lustily engorging canal. <i>“Like, ");
		if(pc.totalVaginas() > 1) output("these are super pretty pussies.");
		else output("this is a super pretty pussy.");
		output(" How hard do you want Mitzi to make you cum?”</i>");

		//Bimbo
		if(pc.isBimbo()) output("\n\n<i>“Just as hard as you want to cum!”</i>");
		//Bro
		else if(pc.isBro()) output("\n\n<i>“Fucking hard.”</i>");
		//Else
		else output("\n\nWhat kind of question is that? <i>“Hard.”</i> When you see the goblin’s face turn thoughtful, you append, <i>“Really hard.”</i> No sense in having her hold back.");
		//Merge
		output("\n\nThe hearts within Mitzi’s eyes widen at the suggestion. <i>“Then Mitzi has just the thing!”</i> She produces a bright pink tube of lip gloss from... somewhere and rolls a layer onto her lips. The fingers on your cunt push and slide, smearing your increasingly slick fluids everywhere. <i>“Don’t worry about a thing.”</i> The goblin puckers up, luscious lips parted slowly by their own sluttish volume as she rolls another layer onto them, lacquering on enough glass to make them glitter like mirrors. <i>“There!”</i> She smacks them together a few times to even the coat. <i>“It’s like, super good Mitzi wears so much lipstick!”</i>");
		output("\n\nYou raise an eyebrow.");
		output("\n\n<i>“Oh, this stuff is like a super illegal drug.”</i> She twirls the tube around her fingers and slides it out of view. <i>“Reaaaaaally strong. Mitzi would be so stupid fucked right now if it was able to absorb it through her lips.”</i>");
		output("\n\n<i>“Wait-”</i>");
		output("\n\nMitzi leans into [pc.oneCunt] and plants a wet kiss, halting your protests a simple press of warm, cushiony lips and the resulting smear of tainted lip gloss on your blood-engorged nethers.");
		output("\n\n<i>“Oh.”</i>");
		output("\n\nYour brain takes a few seconds to catch up to the pleasure of the contact, the way it makes your nerves tingle and sing the goblin’s praises. Looking down at her, you see her smiling up around your pussy, heart-shaped eyes crinkled with the delight that can only come from serving her [pc.Master]’s most sensitive places.");
		output("\n\nShe’s gorgeous.");
		processTime(10);
		pc.changeLust(50);
		clearMenu();
		addButton(0,"Next",mitziFirstTimeCuntnosisII);
	}
	else
	{
		//Repeat Pussy Control
		output("<i>“Do my pussy again,”</i> you instruct, immediately moistening at the half-forgotten memory of the last time Mitzi made you chain orgasm after orgasm together.");
		output("\n\n<i>“Yay!”</i> Mitzi applauds, producing a tube of lip gloss from somewhere. <i>“Mitzi’s been like, wondering when you’d want to think with your cunt again.”</i> She rolls the insidious substance across a puckered lower lip with practiced precision. No mirror is necessary for a perfect, even coat. <i>“Mitzi doesn’t know how you do it so much. It’s sooo much easier to giggle and let your pussy tell you what to do.”</i> The top coat goes on smoothly and slowly. Long lashes flutter knowingly across pink, heart-shaped eyes. <i>“What kind of pussy-time does [pc.Master] want this time?”</i> She taps her chin as her sluttified mind goes to work.");
		output("\n\n<i>“It’s so easy to make a cunt wanna breed. Like... that’s what they’re there for, you know?”</i> The gabilani absentmindedly tucks away her special lip gloss. <i>“But it’s just as easy to melt a girl’s brains out through her cunt. It happened to Mitzi by accident, but if like, someone went into it wanting to fuck and suck themselves stupid, it would be so, so easy.”</i> Those mischievous modded eyes flick back up to your face. <i>“Or maybe [pc.Master] wants something else. Maybe [pc.Master] wants to share a little thoughtless cunt-time with another. Maybe [pc.heShe] wants her pussy to fall in love with rubbing against other slippery slits...”</i> Mitzi’s hand presses deep between her thighs.");
		output("\n\nYou consider your answer while the sex-addicted green-skin prowls closer. All the choices seem like they’ll fuck you up a little, but if you haven to choose between-");
		output("\n\nSoft, sticky lips caress your vulva. <i>“Tell Mitzi. What kind of cunt is this?”</i>");
		output("\n\nOh. <i>“It’s a...”</i>");
		processTime(5);
		pc.changeLust(25);
		//[Breeder Cunt] [Dumb Cunt] [Lesbo Cunt]
		clearMenu();
		if(pc.fertility() > 0) addButton(0,"Breeder Cunt",breederCunt);
		else addDisabledButton(0,"Breeder Cunt","Breeder Cunt","You’re not fertile enough tto think about this!");
		addButton(1,"Lesbo Cunt",mitziLesboCuntnosis);
		if(!pc.isBimbo()) addButton(2,"Dumb Cunt",mitziMakesYouABimbo);
		else addDisabledButton(2,"Dumb Cunt","Dumb Cunt","You’re as much of a dumb, jizz-sucking cunt as possible!");
	}
}

//Dumb Cunt
public function mitziMakesYouABimbo():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("<i>“...dumb cunt.”</i>");
	output("\n\nDid you really just say that? Why would- how could... wow, Mitzi’s lips feel nice on your [pc.vaginaNounSimple]. They squeeze down harder in response to your declaration. Smashing her face into your mound, Mitzi snakes her tongue deep inside, smearing her freshly applied gloss into every fold. <i>“Wow.”</i> Your head lolls, and your [pc.vagina] clenches in trembling desire.");
	output("\n\nWith a pussy-pleasing slurp, Mitzi pulls away, her heart-shaped pupils dilating wide as she fumbles with her lip gloss. <i>“Whoopsie! Mitzi got so excited she mighta got some on her tongue.”</i> She licks her lips and shudders. <i>“What a dumbcunt!”</i> Applying a fresh coat, the blushing goblin arcs her spaded tail around to fondle at her own sopping-wet folds. <i>“Guess we’re both gonna be stupid, horny sluts now, huh?”</i> Her lips shine invitingly as she tosses the drug applicator over shoulder. <i>“But Mitzi’s already a dumb, leaky bimbo!”</i>");
	output("\n\nMitzi... yeah, she’s a brainless little cum-dump, that’s for sure.");
	if(!pc.hasCock()) output(" If you had a dick, she’d probably wrap herself around your crotch like boxers, just to be closer to it.");
	else output(" She probably loses a few brain cells every time jizz spurts into her overheating quim.");
	output(" A real stupid slut.");
	output("\n\nWhy’s she smiling so wide?");
	output("\n\n<i>“[pc.Master]’s all spacy now, isn’t [pc.heShe]?”</i>");
	output("\n\nThe purple lips glisten so beautifully that you forget to listen to words spilling out of them. <i>“Huh?”</i>");
	output("\n\n<i>“You’re being all ditzy!”</i> Mitzi exclaims, tapping her fingers to your mound.");
	output("\n\nYour pussy feels ludicrously over-inflated, like if the hand pulled away it would bulge obscenely out of your body. Maybe it’s because you can’t stop thinking about it: how wet it is, the way those cushiony lips compressed against it... No wonder you’re being ditzy! Your head’s all filled filled up with horny cunt! <i>“Yeah. I guess.”</i>");
	output("\n\n<i>“Of course you’re guessing! You know that your pussy does all your thinking, right??”</i> A slick fingertip wriggles between your bloated labia and strokes the simmering cavity between, encouraging ");
	if(pc.wettestVaginalWetness() < 3) output("strings of feminine drool to slide down your [pc.thighs]");
	else if(pc.wettestVaginalWetness() < 5) output("streams of feminine drool to pour down your [pc.thighs]");
	else output("waves of feminine drool to gush down your [pc.thighs]");
	output(".");
	output("\n\nYou nod and moan. <i>“Yessss...”</i>");
	output("\n\nMitzi slides a second in, and you nearly cum. <i>“And we both know that horny people make bad decisions right?”</i>");
	output("\n\nThat sounds right, but you’re so wet, so very wet, that you don’t really think it over. <i>“Oh yeaaah.”</i>");
	output("\n\n<i>“Like, really bad decisions. People get turned on, and they’ll do the dumbest shit for a chance to fuck.”</i> Mitzi kisses your thigh. A shining outline of her lips glows with sensitizing delight on your [pc.skinFurScales]. <i>“Being horny makes you stupid. Fucking stupid. That’s why they call it that, because you get </i>fucking stupid<i>.”</i>");
	output("\n\nYou half-suppress a giggle. It sounds like a joke, but you don’t really have the capacity to think about it on a deep level. The words slip in alongside Mitzi’s gloriously soaked fingers. You mouth ‘fucking stupid,’ then mentally berate yourself for doing something so stupid... until those fingers twist around, and you forget all about it. <i>“Ah-ahhh!”</i>");
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",mitziMakesYouABimboII);
}

public function mitziMakesYouABimboII():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("<i>“Hey, [pc.Master], how horny are you?”</i> The grinning goblin pulls her fingers free and slides them into her canyon-like cleavage, drying them against the insides of her tits. Dusky nipples jut accusingly at you.");
	output("\n\nOh, she’s expecting an answer. You look at Mitzi’s rigid nipples, then at your own, then back at her. Your pussy is so <i>empty</i>, and juicy! Why did she stop fingerfucking you? There’s no room left for whatever she asked. You’re too horny, like your head is as full of girlcum as your pussy. <i>“Please, fuck me, Mitzi. I need it!”</i>");
	output("\n\n<i>“Wow,”</i> the pint-sized pussy-pleaser groans, <i>“Like, you’re real fucking stupid-horny, right now, aren’t you?”</i>");
	output("\n\n<i>“Yeah!”</i> You agree automatically, rocking your [pc.hips] imploringly in the goblin’s direction.");
	output("\n\n<i>“Must be nice to listen to your cunt on such a deep level. You’ve just handed over the reigns to your dumb, slutty pussy. I bet you can’t even tell me what like 2+2 is, can you?”</i>");
	output("\n\nYou wrinkle your brow, determined to listen, understanding on some level that if you want her to touch you again you’ll have to actually answer her question. Right... math is... math isn’t really going to get you fucked. You gasp as your pussy outright rejects the possibility of trying to do addition, but it blessedly allows you to conjure up a number: <i>“7!”</i>");
	output("\n\n<i>“I don’t remember the answer either,”</i> Mitzi confides, mid-giggle. <i>“But that’s like, not it. Gosh you’re already getting all bimbo-ey!”</i>");
	output("\n\nBimbo-ey? You suppose you are. You did just abandon answering the simplest of questions in favor of taking the fastest route to a fuck. Speaking of which, she should be fucking you right now, right?! You reach down and spread your [pc.vaginaNoun] wide, gasping from the raw pleasure of handling your most important parts directly.");
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",mitziMakesYouABimboIII);
}

public function mitziMakesYouABimboIII():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("<i>“Oh right! Sorry... sorry... Mitzi’s a little ditzy too.”</i> The goblin licks her lips, rubbing off some of her painted-on lipstick. <i>“She’s got pussy for brains, just like [pc.Master].”</i> Leaning forward, she open-mouth kisses your weeping cunt, stuffing that tongue cervix-deep in your channel once more. The wet sound of a tail burrowing into an identically soaking wet slit echos from below. <i>“Mmm...”</i>");
	output("\n\n<i>“Yessss,”</i> you hiss through clenched lips, gushing delight onto Mitzi’s tongue. You aren’t cumming yet, but you’re close. That thick, muscled tongue feels like it’s buried deep in your brain, not your dumb, drooling cunt, rubbing pure pleasure over every facet of your personality until it’s as slick and smooth and wet as the unquenchably aroused hole");
	if(pc.legCount > 1) output(" between your legs");
	else output(" down below");
	output(".");
	output("\n\nEqually slippery fingers wind their way inside to displace the tongue. A moment later, a thumb presses on [pc.oneClit] like it’s some kind of on/off button");
	if(pc.clitLength > 3) output(", rubbing up and down its underside with curious intensity");
	output(" - only you’re very much ‘on’ right now, and getting more ‘on’ by the second. Orgasms bursts through your body and ");
	if(pc.isSquirter()) output("splatters");
	else output("slides");
	output(" onto Mitzi, who responds by moaning back and fucking herself on her tail till she squirts.");
	output("\n\nPure, unadulterated ecstasy radiates out from your [pc.vaginas]. You moan, and you cry out, and most importantly of all, you let your cunt");
	if(pc.totalVaginas() > 1) output("s");
	output(" yank on your reins and drive you to whatever positions feel best. Cumming shouldn’t be this good. It should leave you gasping and whining and somehow hungry for more the moment it winds down. Or... maybe it should?");
	output("\n\nYou slump back");
	if(pc.legCount > 1) output(" and spread your [pc.legs]");
	else output(" and idly diddle your slit");
	output(".");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mitziMakesYouABimboIV);
}

//[Next]
public function mitziMakesYouABimboIV():void
{
	clearOutput();
	showMitzi(true);
	output("<i>“Whoah, cumming like, totally knocks loose a few brain cells, doesn’t it?”</i> Mitzi purrs as she climbs up onto you.");
	output("\n\nFuzzy-headed from orgasm and ready for more, you say, <i>“Mmm-hmmm...”</i>");
	output("\n\n<i>“Course you probably got way more to lose. Climax like that was musta been so hot it took all those boring math facts and melted them right out of you.”</i> The giggling goblin stuffs two fingers in your twat and pulls out a stream of [pc.girlCumNoun]. <i>“Bet this was like, some advanced trig-uh... mathanomity!”</i>");

	var statSwap:Number = 0;
	//First tier!
	if(!pc.hasPerk("Easy") || !pc.hasPerk("Inhuman Desire"))
	{
		//Average amount that needs lost/gained:
		statSwap = (pc.intelligence() * 0.2 + pc.willpower() * 0.2)/2;
		pc.intelligence(-statSwap);
		pc.willpower(-statSwap);
		pc.aim(statSwap);
		pc.reflexes(statSwap);
		//Gain Easy and Inhuman Desire v1
		output("\n\nAnswering with an airy giggle seems easier than trying to figure out what word she was talking about.");
		output("\n\n<i>“Gosh it was super easy to get to dumb down and relax a bit, huh [pc.Master].”</i> Mitzi slides her hand back ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("to your dewy center");
		output(", her other vanishing between her own. <i>“Guess your pussy wanted you to be a horny, easy piece of ass like Mitzi! It was probably real dumb to have Mitzi do this, you know?”</i>");
		output("\n\nYeah, it’s really dumb, but it makes you <i>so wet</i>. That delicious soakingly fuckable feeling grows in your cunt’s heart.");
		output("\n\n<i>“You’ll might try to be a normal Rusher after this, but your pussy’ll know better. You’ll get wet like, all the time. You’ll see an alien and your first thought will be ‘how can I fuck it?’ instead of whatever you normally think. Mitzi doesn’t really know because she’s basically a walking pussy with pigtails, and if you keep this up, you will be too. Silly slut!”</i>");
		output("\n\nYou cum again to the knowledge that Mitzi is right. In your core - <i>your hot, wet, sex-starved core</i> - you know that something magical happened today. Your pussy took up residence in part of your brain, and that part of you is always going to be slippery and sticky and happy to wiggle and giggle if it gets you laid.");
		output("\n\n<i>“Edging’s super good when you’re a dumb bimbo though.”</i> The tone of Mitzi’s voice indicates she’s riding the peak. <i>“Like you get so good at being a turned-on piece fuck-meat that you’re better at it than anybody else. Look at Mitzi’s pussy!”</i>");
		output("\n\nYou stare at the goblin’s emerald cunt through bleary eyes, watching it flex and squeeze around the bimbo’s fingers. Rivers of slick lubricant pour out around them. Her clit is obscenely swollen and actually shakes to the beat of the bimbo’s sex-focused heart. <i>“Anybody else woulda cum already, but Mitzi’s holding it back. You can do it too, ya know.”</i>");
		output("\n\nPleasure pumps through your slut-brain, making you drool and shudder. You could cum, if you wanted to. Right now. It’d be easy, but sure enough, you realize you can wait too. You sit on the edge while Mitzi’s fingers take you higher, and higher, and higher. You giggle-gasp-moan. Your eyes cross and ");
		if(pc.biggestTitSize() >= 3) output("your titties bounce in the sexiest way");
		else output("lashes flutter in the sexiest way");
		output(".");
		output("\n\n<i>“Dumb, horny slut-cunt,”</i> Mitzi gasps.");
		output("\n\nExplosive bliss carries you past consciousness. There’s white, and pink, and very, very happy pussy-lips in whatever place your mind goes to.");
	}
	//Gain Inhuman Desire2 and Fuck Sense
	else if((pc.hasPerk("Inhuman Desire") && pc.perkv1("Inhuman Desire") < 30) || !pc.hasPerk("Fuck Sense"))
	{
		//Bigger statswap:
		statSwap = (pc.intelligence() * 0.35 + pc.willpower() * 0.35)/2;
		pc.intelligence(-statSwap);
		pc.willpower(-statSwap);
		pc.aim(statSwap);
		pc.reflexes(statSwap);
		output("\n\nAnswering with a coy smile and a breathy request for more seems easier than puzzling out what she was talking about.");
		output("\n\n<i>“Holy tits, you really wanna be a stupid bimbo huh? Like, you just jizzed out some math, and you’re begging Mitzi to melt some more brainy-wainies out of your head so you can be more dumber!”</i> Mitzi stuffs three fingers straight into your cunt. <i>“Horny slut like you probably doesn’t wanna cum for less than three fingers. Bet you can take so much more, can’t ya?”</i>");
		output("\n\nYou cry out and bounce your [pc.butt] on the deck, humping Mitzi’s hand, grinding your explosively aroused mound into her palm. <i>“So much more!”</i>");
		output("\n\n<i>“We can be slutty, stupid sisters. Think about it: the two of us, flying around the galaxy, sniffing out hard dicks to tease and fuck.”</i> Mitzi slides a fourth finger into your achingly aroused slit, but it may as well burrow into your soul for how many stars it makes you see. <i>“Bet you can think of lots of ways to tease and please, can’t you? Now that you’re really learning how to be a dumb-cunt, there’s lots of empty room up top for you to think about the best ways to get laid.”</i>");
		output("\n\nOh stars, yes! You can see it in your mind’s eye - bending over your ship’s controls and begging to be some spacer’s personal cock-pit, wandering around Tavros Station in sheer latex with plugs in your holes and a sign around your neck that declares your pussy to be public property. You could even wander into the wilderness on almost any Rush-world and exploit all the horny aliens out there. One look and you could probably figure out what would make them hard and ready to go.");
		output("\n\n<i>“Silly bimbo-slut! Guess you’re getting too horny to think, let alone talk.”</i> Mitzi pumps your cunt harder and faster. Pink bubbles pop in your vision, each one an errant thought unrelated to getting fucked stupid with Mitzi. With each vanishing worry, there’s more room for your cunt to assert itself, for your brain to get dumbed down into your sticky, soupy, ready-to-cum crotch.");
		output("\n\nThere’s so many dribbling pinks and cunt-squeezing clenches of ecstasy that you give up on holding onto any of them and cum. You cum so hard that your eyes cross and roll halfway back. Your tongue slides out of your mouth, drooling onto your [pc.chest] as Mitzi punches a fist into your horny twat. Instead of discomfort, there is only relief and satiation, the knowledge that you’ll happily shove more in there if it’ll make you cum harder.");
	}
	//Gain weak willed and Ditz speech fork!	
	else
	{
		//Bigger statswap:
		statSwap = (pc.intelligence() * 0.4 + pc.willpower() * 0.4)/2+1;
		pc.intelligence(-statSwap);
		pc.willpower(-statSwap);
		pc.aim(statSwap);
		pc.reflexes(statSwap);
		output("\n\nWho the hell even cares about math? You’re so fucking pussy-brained that the idea of squirting out the better part of your school years actually seems appealing. <i>“I forgot that stuff like... two cums ago!”</i>");
		output("\n\n<i>“Did it feel nice?”</i> Mitzi’s fingers slide inside you.");
		output("\n\n<i>“Yessss!”</i> It felt so nice, and to feel her stroking you, massaging the most important part of your body while you admit it... It’s the best feeling ever.");
		output("\n\nMitzi leans down to smooch your [pc.belly], leaving it tingling and warm, her fingers pumping fast and hard inside a cunt that feels wetter than a galotian living on an ocean planet. <i>“Sounds to me like you’re already as much of a dumb-cunt as you can be! You’re already thinking with your pussy most of the time, and you cum yourself silly any time you even think about getting dumber. Why don’t you embrace it, [pc.Master]? Be the stupid, giggly bimbo-slut you want to be!”</i>");
		output("\n\nA supernova of bliss goes off in your [pc.vaginas] as Mitzi talks. She’s not really wrong. You spend more time thinking with that hungry hole in your [pc.thighs] than focusing on whatever it is you’re supposed to be doing out there. Your slutty fuck-pet’s fingers make it hard to care, not when they’re so good at stroking you stupid, making you happy and compliantly sexy. It’s wonderfully liberating, to not care about thinking, to be a pair of wet lips that’ll wrap around fingers or dicks or both at the same time.");
		output("\n\nMitzi kisses you again and again, still fucking your slit, sending arcs of [pc.girlCumNoun] squirting over her hyper-sexualized body. <i>“You big dumb bimbo. Hard to talk with fingers in your cunt. Giggle if you wanna cum. Giggle like a stupid, ditzy slut.”</i>");
		output("\n\nBreathy, moaning ‘tee-hee’s and high-pitched squeaks of pleasure intermingle as your drug-fucked pussy-brain tries to orgasm and laugh itself stupid at the same time.");
		output("\n\n<i>“Good enough,”</i> Mitzi coos, sliding down to wrap her obscenely plush, purple puckers around [pc.oneClit]. She hums, tongue stabbing deep, slipping in and out alongside her fingers such that there’s always something thrusting into you. She happily hums as she works, letting the vibrations blast up your sex-drunk channel and into your receptive, fuckable brain. Pink-hued pleasure-bombs detonate one after another, matched by clutching squeezes against the goblin’s intruding digits.");
		output("\n\nYou can’t stop giggling - can’t stop the airy, happy feeling of shutting down your higher thought processes to more intensely wallow in orgasm. Your mind slides through the sexual muck that clogs your channel, wet and vagina-scented - pink and ready to be fucked. Rolling back, your eyes stop supplying you with the sight of your adoring goblin bimbo-sensei, leaving you to do nothing but <i>feel</i> until the pleasure pushes you past the point of consciousness.");
		processTime(20);
		pc.orgasm();
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",mitziBimbosYouEpilogue);
}

public function mitziBimbosYouEpilogue():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	if(!pc.hasPerk("Easy") || !pc.hasPerk("Inhuman Desire"))
	{
		output("When you wake up, Mitzi is snoring soundly, her little hand buried up to the fist in her pussy. Bless her sweet, little heart. You stagger up and stretch, feeling a little soreness by your [pc.thighs]. Being fucked so hard never felt so good.");
		//Easy - 20% extra lust from combat sources. 20% is set in v1. See if that’s used anywhere.
		//Inhuman Desire, v1 stores 15, +15 minlust.
		//Easy Perk
		if(!pc.hasPerk("Easy"))
		{
			output("\n\n(<b>Bimbo Perk Gained: Easy</b> - gain 20% more lust from combat sources.)");
			pc.createPerk("Easy",20,0,0,0,"Gain 20% more lust from combat sources.");
		}
		//Inhuman Desire
		if(!pc.hasPerk("Inhuman Desire"))
		{
			output("\n\n(<b>Bimbo Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 15.)");
			pc.createPerk("Inhuman Desire",15,0,0,0,"Increases maximum lust by 15.");
		}
	}
	else if((pc.hasPerk("Inhuman Desire") && pc.perkv1("Inhuman Desire") < 30) || !pc.hasPerk("Fuck Sense"))
	{
		//Gain Inhuman Desire2 and Fuck Sense
		output("When you wake up, Mitzi’s fist is still in your cunt. You pull it out with a wince and a [pc.knee] buckling surge of pleasure. You’re tempted to put it back in, to bounce up and down on the petite bimbos arm while she slumbers, but you had some other stuff to do. Exactly what you were going to do seems fuzzy and indistinct. You’ll move along, and if you don’t remember, you can always just go find someone sexy to bang.");
		if(!pc.hasPerk("Inhuman Desire"))
		{
			output("\n\n(<b>Bimbo Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 15.)");
			pc.createPerk("Inhuman Desire",15,0,0,0,"Increases maximum lust by 15.");
		}
		if(pc.perkv1("Inhuman Desire") < 30)
		{
			output("\n\n(<b>Bimbo Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 30.)");
			pc.setPerkValue("Inhuman Desire",1,30);
			pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
		}
		//Gain Fuck Sense
		if(!pc.hasPerk("Fuck Sense"))
		{
			output("\n\n(<b>Bimbo Perk Gained: Fuck Sense</b> - The Sense ability now relies on your libido rather than intelligence.)");
			pc.createPerk("Fuck Sense",15,0,0,0,"Allows your sense ability to base success off your libido instead of intelligence.");
		}
	}
	else
	{
		output("You wake up giggling and happy, worry-free. Mitzi’s on the floor next to you with her tail lodged in her cunt and pussy-juice all over her face. Yours by the smell of it. She wouldn’t stop you if you woke her by sitting down her face and demanding another session with her tongue, but there’s so many other hotties in the universe. You should probably like, go look for those probes or whatever. There’ll be all sorts of hotties to bang on the way.");
		if(!pc.hasPerk("Ditz Speech"))
		{
			output("\n\n(<b>Bimbo Perk Gained: Ditz Speech</b> - You will now sound like a total bimbo in scenes that support it.)");
			pc.createPerk("Ditz Speech",0,0,0,0,"Alters dialog in certain scenes.");
			flags["MITZI_BIMBOED_PC"] = 1;
		}
		//Gain weak willed
		if(!pc.hasPerk("Weak Mind"))
		{
			output("\n\n(<b>Bimbo Perk Gained: Weak Mind</b> - You lose willpower twice as fast.)");
			pc.createPerk("Weak Mind",0,0,0,0,"Intelligence and willpower losses doubled.");
		}
	}
	processTime(40);
	pc.orgasm();
	IncrementFlag("MITZI_CUNTNOSIS");
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);	
}
//Breeder Cunt
public function breederCunt():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("<i>“...breeder cunt.”</i>");
	output("\n\nDid you really just say that? Did you really just declare yourself to be some kind of... broodmother? The room got <i>hot</i> all of a sudden. You fan yourself as the idea of getting knocked up rolls around in your mind.");

	//preggo already
	if(pc.isPregnant())
	{
		output("\n\n<i>“Never would have guessed.”</i> Mitzi places a hand against your [pc.belly] and slowly strokes the [pc.skinFurScales], gigging softly. <i>“Betcha just love having a big, heavy belly, all full of young.”</i> She gently kisses the underside, leaving a lip-shaped patch of warm tinglies behind to keep you company. <i>“You must remember what it felt like in the moment, wanting that cum inside you... the heat and the warmth almost boiling out of that </i>empty<i> cunt...”</i>");
	}
	//Not preggo, in heat
	else if(pc.inHeat())
	{
		output("\n\n<i>“Yeah, you are...”</i> Mitzi draws as she slides her fingernails up and down your achingly unfilled belly. <i>“[pc.BoyGirl] like you is always in heat. Could stuff four or... uh, five kiddos in here, and you’d still be craving a rough breeding, wouldn’t ya?”</i> She kisses the place where your stomach meets your loins, leaving a lip-shaped patch of warm tinglies behind to keep you company. <i>“And even though you’re desperate to be swimming in sperm, you’re here instead, begging Mitzi to make your heat burn hotter. Gosh, it’ll be such a struggle not to go cock-mad from how </i>empty<i> your cunt is...”</i>");
	}
	//Not preggo yet
	else
	{
		output("\n\n<i>“Coulda fooled Mitzi!”</i> Mitzi slides her palms up your [pc.belly] and gently kisses the place where it meets your crotch, leaving a lip-shaped patch of warm tinglies behind to keep you company. <i>“A real breeder cunt would’ve already been knocked up, but maybe you just haven’t gotten the right cum-shot yet. Maybe you’re all hot and horny and so horny from being </i>empty<i> for so long...”</i>");
	}
	//Merge
	output("\n\nEmptiness... you remember the emptiness, remember way Mitzi’s kisses make your pussy throb. It’s no different this time. A sense of terrible torridity wells up as your womanhood");
	if(pc.totalVaginas() == 1) output("’s");
	else output("s’");
	output(" internal thermometer leaps four or five degrees higher in an instant.");
	if(pc.inHeat()) output(" Heat be damned, you’re boiling!");
	output(" Sweat beads on your [pc.skin], and moisture pools in your cunt. Gasping, you nod down to the smiling goblin, whining in the back of your throat.");

	output("\n\nThe momentary coolness of Mitzi’s purple-painted lips bathes the space next to [pc.oneClit], sealing your sweat and [pc.girlCum] in with a layer of thick gloss. <i>“Feels nice, doesn’t it? I bet all that heat is making it sooo hard to think, now that your pussy’s taking over.”</i> She kisses the other side, longer and harder. <i>“Bet this hot little pussy’s taking every silly little thought you have and spinning it around until it’s all about getting a cock deep in your cunt.”</i> A heavy smooch drags down the cleft of your sweltering lips. <i>“But that’s what breeder cunts like this one do.”</i> Again, she pauses to peck at your juicing mound. <i>“They let you think your silly little brain is in charge while filling it with nothing but jizzing dicks and the prospects of babies.”</i>");
	output("\n\nA childish impulse to protest the self-assured bimbo rises up from somewhere and pops away into a creamy white cum-bubble. Stars, a little cum would be nice to rub into your [pc.chest] and over the distractingly tingly heat between your ");
	if(pc.hasKnees() && pc.legCount > 1) output("knees");
	else output("[pc.thighs]");
	output(". You could be bent over a table or spread wide in the bed, as long as it ensures you get that blessedly sticky goo sprayed deep onto your quivering cervix.");

	//Not in heat
	if(!pc.inHeat())
	{
		output("\n\n<i>“Ooh, it’s starting, isn’t it? You’re going into heat for real. Even when we’re done here, your cunt’s going to be aching for a baby isn’t it?");
		if(pc.isPregnant()) output(" Who cares if you got one already!");
		output("”</i> Mitzi smears her pillowy lips against your juicing pussy. <i>“You won’t be able to take two steps without your breeding cunt reminding you that it needs stuffed. Dildos might take the edge off for a few minutes, but without real cum, it’ll just get worse.”</i> Mitzi’s exhalations maddeningly wash across your tender cunt, her breaths torturously stoking the flames of your burgeoning heat.");
		output("\n\nYou look down and beg, <i>“Gimme cock! Real cock!”</i> Less than zero thought goes into your sluttish ravings. <i>“Big fat cock!”</i>");
		output("\n\n<i>“You’ll never get knocked up like that.”</i>");
		output("\n\nYour cunt clenches at the thought of being <i>knocked up</i>, expelling a splash of [pc.girlCum] onto your [pc.footOrFeet].");

		output("\n\nMitzi’s fingers slide into your [pc.vagina]");
		if(pc.totalVaginas() > 1)
		{
			output(", pinky slipping deep into ");
			if(pc.totalVaginas() == 2) output("your second");
			else output("a second");
			output(" entrance");
		}
		output(", wiggling around until you’re dripping on the floor. <i>“Be sluttier. Embrace your needs. Show it off. Let them see how wet you are.”</i> She holds her fingers up in front of your eyes, dazzling you with the curtains of feminine lube that cling on. <i>“A good breeding cunt will so brazenly sexual, so delightful wet, that the boys will line up to give you some cum. You can do that, can’t you?”</i>");
		output("\n\nYou begin to moan your assent only to be stifled by a mouthful of your own cunny-goo.");
		output("\n\n<i>“Good breeder. That’s all you are. A hot, wet, fertile cunt whose doing everything she can for some semen. It’s the first thing you think about.”</i> Your mouth is freed to allow Mitzi a chance to rub your other lips. <i>“And the second thing you think about is cumming, because if you can’t get pregnant, you at least want to cum. You soaking-wet, slut.”</i>");
		output("\n\nStreamers of [pc.girlCumGem] slide down your [pc.thighs] as you somehow get wetter.");

		output("\n\n<i>“That’s right. All that wetness is there to make sure that the boys can slide right in. That’s all the consent they need: a wide-open pussy a slippery welcome mat to ease them home.”</i> Nimble goblin fingertips bury themselves deep, pistoning in and out. <i>“You couldn’t keep your cervix closed if you wanted to. A little rub, and it opens right up, all but begs for cum, see?”</i> You feel a digit rub around your innermost entrance, causing the muscles to reflexively relax");
		if(pc.isPregnant()) output(". Fortunately your womb remains stoutly plugged.");
		output(" <i>“You’re going to be such a good breeding cunt.”</i>");
		output("\n\nPride and arousal fill you... and Mitzi’s fist. She pumps it in and out as she continues to prattle on about sucking dick and showing tit, scorching slutty ideas into your soul on the back of pussy-pleasing pleasure. Since there’s no cum to be had from the little goblin, you let her go at it. The words are just words, just silly thoughts that your filthy slut-cunt breeding hole doesn’t care about when it’s nice and full. Some of them sound pretty hot, the syllables stringing together in ways that make you feel like you’re about to cream yourself.");
		output("\n\nYou content yourself with moaning and squirming like a bitch in heat... which, you suppose you are.");
		output("\n\nThen a mouth clamps down on your [pc.clit] and your pussy grabs the rest of you to blast off into breed-space - a land composed entirely of potent cocks and rivers of the creamiest jism, so potent a girl could get pregnant from looking at it. Your pilotless body slumps to the ground, but you exist in a universe of pure pleasure, doing the backstroke in a pearlescent oasis of belly-bulging bliss. White hot jizz imprints itself on your psyche, a flavor you’ll never forget.");
	}
	else
	{
		var wetness:Number = pc.wettestVaginalWetness();
		//heat
		output("<i>“Ooh, it’s happening, isn’t it? The heat’s getting to you! You thought being amped up for breeding made it hard to think, but it’s so much worse now, isn’t it?”</i> Mitzi holds a hand under your ");
		if(wetness >= 5) output("river-like flow of girl-cum");
		else if(wetness >= 4) output("drooling stream of girl-cum");
		else if(wetness >= 3) output("freely drooling girl-cum");
		else output("dripping girl-cum");
		output(" to collect it. A moment later, she smears it over your [pc.belly]. <i>“Your slutty little brain’s given up entirely. All those thinky-bits that you used to use for restraint are too busy helping your womb fill with fertile eggs to both to </i>think<i> about something.”</i>");
		output("\n\nA deep, cunt-scorching kiss makes you shudder and pant. <i>“Mitzi knows how you feel, like... the smarter you are, the more powerfully your brain can fall in line with what your cunt wants.”</i>");
		output("\n\nSweat drips from your brow as you pant for breath, staring into nothing. Hallucinations of cocks of every shape and size swirl in fractic, jizz-bearing patterns through your increasingly feverish vision.");
		output("\n\n<i>Why aren’t they inside you?</i>");
		output("\n\nA mirthful voice sing-songs, <i>“[pc.Name] has cock on the brain! [pc.Name] has cock on the brain!”</i> Mitzi wiggles <i>dick-shaped</i> fingers in front of your mouth.");
		output("\n\nThey taste like cunt and skin, exactly like <i>cock should</i>.");
		output("\n\nThere’s more kisses on your steaming quim as knuckles rub against your [pc.lips], then a cheery voice telling you how useless you are for anything but breeding, how your body was made to pour out pheromones and eggs");
		if(pc.legCount > 1) output(", then spread its [pc.legs]");
		output(". Streamers of [pc.girlCum] slide out of you. You aren’t cumming yet. How could you, without a creamy load to extinguish the fires in your [pc.wombs]? Nevertheless, you’re squirting like a unrepentant slut, smearing everything in the immediate area with proof of your willingness to bear young - including Mitzi.");
		output("\n\nYou can’t wait to get knocked up. You’ll do anything for it: spread your legs in the middle of Tavros station, put up ads on the extranet offering access to your cunt so long as condoms are checked at the door. Stars, condoms are such a stupid invention! Your hand pumps ");
		if(pc.legCount > 1) output(" between your legs ");
		else output("deep ");
		output("as you jill yourself off to the thought of outlawing condoms, ensuring that every healthy individual of breeding age is free to experience the incomparable joy of motherhood.");
		output("\n\n<i>“Look at you, getting deep in there. Those fingers are almost like cocks, aren’t they? Nice and thick, scraping deep nerves, so soaked that you can pretend that they’re just bulging with pre, can’t you?”</i> Mitzi kisses your inner thighs to the tempo of your stroking fingertips: schlick-kiss-schlick-smooch-schlick-kiss. On and on it goes until Mitzi lips only remaining gloss is comprised entirely of [pc.girlCum] and your fingers feel like they’re made of oozy, cream, delightful cum.");
		output("\n\nTwo big fat cocks are sawing into your [pc.vagina] - no wait, three... no, four! There’s four dicks, slipping inside of you, four virile fathers so hard and pumping so fast that they’re dribbling virility directly where you need it, but still, it doesn’t sate you. Quite the opposite, it makes you crave the cum so much more. The sweet voice in your ear whispers you’ll never truly be satisfied no matter how many loads you bathe your eggs in. Even when you’re immobile, you’ll be wishing you could get even more pregnant, that the breeding cunt between your [pc.thighs] could wallow in a pool of virile suitors until your ovaries are spitting out fertile embryos in an endless tide of fecund wonder.");
		output("\n\nSo hot. So much squelching dick. Cum in spraying out with every thrust.");
		if(pc.hasToes()) output(" Your [pc.toes] curl.");
		output(" Your eyes cross. Healthy males, working together to pound you pregnant. Eyes rolling, you slump backward and cum to the thought of that seed pouring into you, flooding you with enough force to pry your cervix wide open and breed you past the point of pregnancy.");
		output("\n\nYour thoughts grow heavy and gravid, like you imagine your belly will soon be. Then, you lose consciousness, the need for semen branded into your brain and cunt alike.");
	}
	processTime(30);
	pc.orgasm();
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",mitziPutsYouInHeat2);
}

public function mitziPutsYouInHeat2():void
{
	clearOutput();
	showMitzi();
	author("Fenoxo");
	if(!pc.inHeat())
	{
		output("You come to feeling horny and <i>empty.</i> The goblin is passed out next to you, snoring sweetly. Her taste is on your lips. You aren’t sure when it got there, but you don’t care. It’s a secondary concern next to the ache gnawing at your [pc.womb].");
		if(pc.isPregnant()) output(" Thankfully that fades a second later, your body finally reminding you that it was pregnant this entire time!");
		else 
		{
			output(" <b>You have gone into heat!</b> You won’t be satisfied until someone - anyone can supply your eggs with the fertilization they need.");
			output("\n\nSurely there’s a horny alien somewhere nearby.");
			//Add the "Heat" status, status duration 1 week or until pregnant in all wombs.
			//Yay, heat!
			//v1 - fertility boon
			//v2 - minimum lust boost
			//v3 - libido boost
			//v4 - tease bonus!
			pc.createStatusEffect("Heat",5,25,10,3,false,"LustUp","Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+25 Minimum Lust\n+10 Libido\n+3 Tease Damage",false,28800,0xB793C4);
		}

	}
	//[Next]
	else
	{
		output("You wake up feeling wet and horny. Mitzi is next to you, snoring softly. Your mouth tastes vaguely of pussy, but you discard that thought and the accompanying slut-goblin immediately. You’re <b>in such a deep heat</b> that you don’t care that you’re soaked in cunt-juice from head to toe - the better to advertise your fertility to the first person you meet with a dick.");
		output("\n\n<i>Mmmm... dick.</i>");
		output("\n\nYou stretch and make ready to set off, fingers idly rubbing away to keep you nice and wet. <b>You might be more permanently libidinous</i> from... whatever sort of heat-induced romp you and Mitzi just had, but that’ll just give you more chances to <i>breed</i>.");
		pc.applyPussyDrenched();
		//Yay, deep heat!
		//v1 - fertility boon
		//v2 - minimum lust boost
		//v3 - libido boost
		//v4 - tease bonus!
		pc.setStatusValue("Heat",1,10);
		pc.setStatusValue("Heat",2,35);
		pc.setStatusValue("Heat",3,25);
		pc.setStatusValue("Heat",4,5);
		pc.setStatusTooltip("Heat","<b>You are in a deep heat!</b> Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+" + pc.statusEffectv1("Heat") * 100 + "% Fertility\n+" + pc.statusEffectv2("Heat") + " Minimum Lust\n+" + pc.statusEffectv3("Heat") + " Libido\n+" + pc.statusEffectv4("Heat") + " Tease Damage");
		pc.extendHeat(10*24*60);
	}
	processTime(25);
	pc.libido(3);
	pc.taint(2);
	pc.orgasm();
	restHeal();
	//increase count of times mitzi hypnoed :3
	IncrementFlag("MITZI_CUNTNOSIS");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function mitziLesboCuntnosis():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("<i>“...lesbo cunt.”</i>");
	output("\n\nDid you really just say that out loud? Did you - oh wow, that kiss felt great. Having Mitzi’s lips on your [pc.vaginaNounSimple] was really, really pleasant. Your [pc.skin] flushes");
	if(pc.hasFur() || pc.hasScales() || pc.hasChitin() || pc.hasFeathers()) output(" beneath your [pc.skinFurScalesNoun]");
	output(", and the room wobbles slightly. Grabbing Mitzi’s shoulder for support, you glance down and find yourself impressed by just how <i>pretty</i> Mitzi is. Her makeup is perfect, her hair playful yet slutty, and her smile looks like it’s inviting you to grind it against your pussylips.");
	output("\n\n<i>“Oh.”</i> Mitzi grabs your [pc.butts] and pulls your [pc.vaginas] toward her face as she leans in, smacking heavy, drug-laced lips onto your vulva. Moisture bubbles inside you in response to her warm, moist breaths. She opens her mouth wide, sliding her plump lips up and down the outside of your cunt until you’re gasping and moaning for her whorish pussy-pleasers, grabbing her by the pigtails and holding on for dear life. Eventually, she breaks away, cheeks coated in [pc.girlCum].");
	output("\n\nThe giggling green fucktoy is the only thing holding you up. She says, <i>“Thinking with your pussy already, aren’t you?”</i>");
	output("\n\n<i>“Uh huh.”</i> You (well, your pussy, but that’s pretty much you) clench from the admission, already ditzy and dizzied by Mitzi’s mind-altering kisses. Thinking’s kind of hard, but cumming is so, so easy. You remember that at least.");
	output("\n\n<i>“That’s because your pussy is training your brain, silly! The more you listen to it... obey it, the more you give in to its slipperiest, most sinful desires, the more you cum... and the more that big dumb brain up there can relax and... coast along.”</i> Mitzi drags a finger through your slit");
	if(pc.totalVaginas() > 1)
	{
		output(", spreading her digits out to caress its sister");
		if(pc.totalVaginas() > 2) output("s");
	}
	output(", extracting a strand of [pc.girlCumVisc] goo. <i>“And right now, it’s drenching itself at the sight of a cute girl, isn’t it?”</i>");
	output("\n\nMitzi is so cute. Staring at her, you moan your assent and wiggle your fingers in her hair, so soft and feminine. <i>“Cute,”</i> you mumble.");
	output("\n\n<i>“Awww, like... thanks!”</i> Mitzi beams and kisses [pc.oneClit]");
	if(pc.clitLength > 3) 
	{
		output(", slowly sliding down its length until her nose presses to your pubic mound");
		if(pc.clitLength > 6) output(", her neck bulging obscenely");
		output(". Her cheeks hollow as she worships at your feminine mast, then eases back up to leave it shining with a coat of vacuum-sealed gloss");
	}
	else if(pc.totalClits() > 1)
	{
		output(", bouncing down ");
		if(pc.totalClits() == 2) output("to the other a moment later");
		else output("to jump from one to another until every pretty clitty has had at least one shining, cunt-sucking smooch");
	}
	output(". <i>“You’re such a sloppy lesbo, [pc.Master]. Mitzi loves that about you. You get all soaked just from looking at Mitzi’s mouth!”</i>");
	output("\n\nYou watch in dazed rapture as Mitzi pouts up at you, her purple pillows gleaming with your [pc.girlCumNoun] and gloss, shaped so that the puffy angel bows crease beneath their own inhuman volume. She puckers them out in a kissing motion that seems to push them deep into your mind, squeezing out everything else in the form of thigh-staining ");
	var wetness:Number = pc.wettestVaginalWetness();
	
	if(wetness < 2) output("trickling");
	else if(wetness < 3) output("dripping");
	else if(wetness < 4) output("flows");
	else if(wetness < 5) output("streams");
	else output("outpourings");
	output(". A flash of thought warns that you shouldn’t react so strongly to your pet goblin’s sexual displays, but the beginnings of a smile tugs at the corners of those purple pillows, melting the intellectual rebellion into a wash of hot, horny pussy-juice.");
	output("\n\n<i>“Omigawsh you mush be </i>such a slut for girls<i> to get turned on so easy. All Mitzi did was make a couple cute faces, and you’re all ready to cum like, super hard, aren’t you?”</i> The grinning goblin lazily fondles your [pc.vagina] while she talks. <i>“Probably because this cunt is going crazy with pussy-hornies. It just wants to get pinned down and rubbed on by some juicy little slit, to feel a hard clit slipping and sliding through the mixed juices. It’s like, the hottest, sexiest thing a cunt-for-brains like you can think of.”</i>");
	output("\n\nYou shudder at the suggestion. Whatever you were going to say, whatever you were thinking... Mitzi’s fingers milk it out of you. Cogent thoughts split apart to reveal oozy, aroused vaginas. Words melt down into fragrant, tangy pussy-juice. Mitzi’s cunt invades your mind’s eye. The gleaming emerald box parts open invitingly, its lips wet with lusty dew. The nub of her clit juts forward, begging you to touch it. You open your eyes but see the smiling goblin’s most tender regions superimposed upon your suggestion-hijacked retinas.");
	output("\n\n<i>“Lay down, [pc.Master],”</i> a beautiful siren’s voice calls. It dances through your cunt-brain’s synapses, making you wish you could fuck it. <i>“It’s easier to eat a girl out on the ground, and you really, really want to eat pussy, doncha?”</i> Slick fingers squeeze at your crotch, and your liquid arousal spatters the deck below. <i>“You wanna smell pussy. You wanna taste pussy. You wanna wake up in the morning and gargle pussy. You’re that much of a slut for girls.”</i>");
	output("\n\n<i>“Hnnng-yessssss...”</i> you hiss, slowly slumping onto your back. Your pelvis thrusts upward, bouncing your [pc.butt] on the deck.");
	output("\n\nFootsteps patter to your left. <i>“Hold still.”</i>");
	output("\n\nLike a marionette with its strings cut, you slacken into immobility, the spasms of your overheating, drooling puss");
	if(pc.totalVaginas() > 1) output("ies");
	else output("y");
	output(" your only remaining motion. <i>“Kay...”</i>");
	output("\n\nA leg falls over one of your shoulders, then the other. Naked green skin blocks the light, and with it, the scent of <i>cunt</i> filters down to your nostrils. You salivate unthinkingly, licking your lips as Mitzi shifts position to bring that viridian treasure closer. The details reveal themselves now that your eyes have adjusted to the reduced light: two puffy outer lips that nearly complete conceal the goblin’s creamy inner folds. Her clit is bulging and heavy, a single droplet hanging from it. You desperately want to lick it, but you’re <i>hold</i>ing <i>still</i>.");
	output("\n\nNothing stops you from smelling, though. Inhaling deeply, you savor Mitzi’s womanly aroma, filling yourself with her ardor in vapor form, wishing you could breathe in forever so that the moment could go on into infinity. The longer the seconds drag on, the wetter your [pc.vaginaNounSimple] gets. The moment you get a chance, you’re going to get a sample of your own flavor. You adore the scent of cunt.");
	processTime(25);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",mitziRepeatCuntnosisExtraInterval);
}

public function mitziRepeatCuntnosisExtraInterval():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("<i>“Omigod, you’re a pussy addict!”</i> that sweet sweet voice declares. <i>“I bet I could give you a wet pair of panties and you could cum, just from sniffing them.”</i>");

	output("\n\nThe image of Mitzi’s panties, soaked from arousal and wrapped around your face, is so potently erotic that you feel a clench deep in your belly. [pc.EachVagina] flexes and squeezes in response. You feel strangely euphoric, unable to touch or taste that which you desire above all else, but it’s so painfully aroused that your [pc.vaginas] ");
	if(pc.totalVaginas() == 1) output("is");
	else output("are");
	output(" trembling on the cusp of an orgasm.");
	output("\n\nA single gasp and deep breath pushes you over the edge; your crotch tightens supremely to the sight and smell of Mitzi’s mouth-wateringly juicy cunt. Blissful spasms rub your folds together unassisted.");
	if(pc.isSquirter()) output(" [pc.GirlCum] sprays out in a fountain.");
	else output(" [pc.GirlCum] leaks out in a pulsating flow.");
	output(" Your eyes roll back, but the sight of Mitzi’s pussy is engraved too deeply on your putty-like mind to fade.");
	output("\n\n<i>“Awww, you’re such a lesbo that you got off just thinking about panty-sniffing?”</i> Mitzi drops herself down, smothering your moans and pants with her simmeringly hot labia. Gabilani juices pour into your mouth and roll down your cheeks. Your tongue thrusts out on its own, commanded by your zealously climaxing cunt to share the feeling with the thick-thighed goblin. <i>“Ah-ah! You really can’t help yourself?!”</i> Mitzi’s tits slap down onto your [pc.belly] as the pleasure doubles her over. <i>“You’ll just lick and lick and lick until your tongue doesn’t work anymore!”</i>");
	output("\n\nWell... yeah. As you come down from your climactic high, you find yourself able to focus on eating pussy properly, whipping your tongue around to satisfy every surface");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", spearing inhumanly deep to curl around in search of sensitive recesses");
	output(". You really could do this forever. At the very least, you could eat this sopping-wet treat until you pass out from exhaustion. It’d be worth it, just to spend a few extra hours completely subsumed in pussy-scent and taste.");
	output("\n\nA happy sigh slips from your throat when you find an especially dense concentration of Mitzi’s juices.");
	output("\n\n<i>“Ah! You’re insatiable!”</i> Mitzi kisses you again and again and again. Every thrust of your tongue earns another soft press of her lips. Your heart hammers in your ears. Your [pc.vaginas] burn");
	if(pc.totalVaginas() == 1) output("s");
	output(". <i>“You’re the perfect...”</i> A long kiss hits your belly button. <i>“...lesbo-slut.”</i> Fawning smooches trace around your side toward your hip. <i>“Juicing yourself over the taste of pussy. Cumming from the scent.”</i> Slut-thick lips pamper you with affection. <i>“And you cum so easy...”</i>");
	output("\n\nYou’re getting close again already. There’s lightning between your legs, and with every pussy-swabbing stroke of your tongue, it crackles across your hypersensitive nerves. You thrust deep and bury ");
	if(pc.hasMuzzle()) output("your muzzle deep into Mitzi’s pussy, letting her snatch become your world");
	else output("your nose up to her clit");
	output(". A rolling wave of crackling, white-hot bliss starts between your [pc.thighs] and crashes into your brain with a thunderclap of sapphic ecstasy.");
	output("\n\n<i>“Ahh! Poor [pc.Master], so devoted to cunt that your pussy’ll never let you think about anything else.”</i> The goblin’s torrid gash gushes for you, but she keeps talking, <i>“Betcha you wanna spend the rest of your life between my lil’ legs, right?”</i>");
	output("\n\n<i>“Riggt,”</i> you mumble into her sublime slit.");
	output("\n\n<i>“You’re almost as good a slut as Mitzi,”</i> she purrs. <i>“Just keep licking there... Fuck you’re so hot like this, so fucking sexy.”</i>");
	output("\n\nYou devote yourself to satisfying her folds, sucking and licking in a frenzy. A puddle of girlish juices has formed around you, but it just makes it hotter. You’d be slick from head to toe in Mitzi’s fruits if you could. If you keep licking, maybe it’ll even happen.");
	output("\n\nThe little minx screams, <i>“CUM!”</i> midway through an exceptionally deep exploration of her depths, scissoring your incredibly strong muscles down on either side of your wiggling muscle. The command cuts through the fog of confusing arousal like a plasma blade through warm butter.");
	output("\n\nYou orgasm with your tongue trapped deep in Mitzi’s gushing box. Your mouth floods, overfilling before you can possibly swallow the womanly release. Crying from joy and pleasure, you realize that you love pussy above all else - not just Mitzi’s, but vaginas in general. The concept of a wet cunt fills you with overwhelming lust and affection. As you swallow the tangy juices that stream into your mouth, you acknowledge that you’re kind of a pussy-slut, but then your orgasm strengthens from knee-knocking to consciousness-eroding.");
	output("\n\nThe only thought that persists: the taste and shape of Mitzi’s cunt.");
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mitziLesboCuntnosisII);
}

public function mitziLesboCuntnosisII():void
{
	clearOutput();
	showName("\nPUSSY <3 <3");
	author("Fenoxo");
	output("You wake to an ambrosial taste on your [pc.lipsChaste]. With a happy sigh, you run your tongue over them, slowly savoring the flavor. You blink your eyes open and try to remember how you got here. First, the goblin was talking to you, and you wanted her to kiss your pussy. Then you really, really wanted to eat her out. You remember the features of her cunt in excruciating detail. Every crease and fold is accounted for.");
	output("\n\nYou flush and stretch, sitting up, realizing that it’s Mitzi-cunt you taste on your [pc.lipsChaste]. You moan in delight. <b>That was some good pussy.</b> You might even be getting addicted to vaginas, because your <b>libido feels stronger than ever.</b> The little slut has certainly stoked a fire in your twat; that’s for sure.");
	if(pc.hasCock()) 
	{
		if(pc.cockTotal() == 1) output(" You could almost forget you even had a dick, if it wasn’t for all the [pc.cumNoun] plastered everywhere.");
		else output(" You could almost forget you had dicks, if it wasn’t for all the [pc.cumNoun] plastered everywhere.");
	}
	output("\n\nAs for the goblin herself, she must have scampered off somewhere while you were knocked out. It’s just as well. If she was still here, you’d probably crawl right back between her legs.");
	processTime(40);
	pc.orgasm();
	pc.libido(4);
	pc.taint(2);
	pc.applyPussyDrenched();
	if(pc.hasCock()) pc.applyCumSoaked();
	IncrementFlag("MITZI_CUNTNOSIS");
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function mitziFirstTimeCuntnosisII():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("<i>“Oh,”</i> you mumble again, one of your hands falling onto the back of Mitzi’s head. <i>“You’re really cute like that.”</i> Your concerns melt away under the warmth of the goblin’s luscious, drug-painted lips. <i>“Umm... I was worried about...”</i> She kisses [pc.oneClit], leaving a veneer of artificial shine behind. <i>“Wow that’s nice.”</i> The goblin is mind-blowingly pretty. You can scarcely believe that you lucked into earning the services of such an adoring beauty.");
	output("\n\n<i>“Oh?”</i> Mitzi begins to apply another coat of lip gloss. She smacks those purple pillows together beams up at you. <i>“Did you really want me to wait, or should I like, keep going?”</i>");
	output("\n\nThere’s so much heat between your [pc.thighs], flush and hot. You feel weak and silly, unsure of why exactly you wanted her to wait before. Was it... something about her lip-gloss? Yes! That’s it! <i>“Your gloss!”</i> You point accusingly at the tube.");
	output("\n\nMitzi pouts, <i>“You wanted to watch Mitzi put on some more?”</i> The emerald slut pouts. <i>“If you really want. Do you really want Mitzi to roll more on? Paint these pussy-pleasing lips thick with shine until you get all silly and cummy?”</i>");
	output("\n\nThe distracting heat boiling below keeps interrupting your thoughts, twisting them around when you to focus. Mitzi’s face is there through it all, smiling and beautiful, the picture of wantonness. You can’t see any problems with her gleaming mouth, still moist from your [pc.vaginas], but that must have been it. <i>“Yeah... that sounds right.”</i>");
	output("\n\n<i>“Okay! Mitzi will put this one on super-dooper thick just for your [pc.Master]!”</i> She uncaps the tube once more, twirling dial at the bottom to push more jellied makeup out. Pink, heart-shaped eyes stare seductively up at you as Mitzi languidly presses the gloss against her lower lip and slowly begins to roll it across the taut, reflective surface. She blinks, layering it on nice and heavy, just like you asked. The way she flips it around to bring it to bear on her upper lip is almost hypnotic, and the application of her enchanting mouth-polish leaves you shudderingly, gaspingly aroused. <i>“There!”</i>");
	output("\n\n<i>“Please, my puss");
	if(pc.totalVaginas() == 1) output("y");
	else output("ies");
	output(".”</i> You grab her by the pigtail, more for something to hold onto than with any intent of forcing her. Satisfying your budding desire by yourself seems a foreign concept.");
	output("\n\n<i>“Mitzi will,”</i> the pretty bimbo purrs. <i>“You trust her, right? You trust Mitzi.”</i>");
	output("\n\nOf course you trust Mitzi! That’s why you’re here begging her to make you cum! <i>“Uh huh...”</i> Putting that trust to words is hard, but the idea seems to communicate well enough.");
	output("\n\n<i>“Good,”</i> Mitzi kisses just to the left of your cunt, leaving a gleaming patch of tingling warmth in her wake. <i>“And like, Mitzi makes you super horny, right?”</i>");
	output("\n\nYou nod.");
	output("\n\nThe giggling goblin smooches down on the other side, leaving an identical patch of sinfully tingly happiness behind. <i>“Like, so horny it’s hard to think right?”</i> One of her hands disappears into her soaking-wet cunt. <i>“That’s how horny you make Mitzi. So horny that your pussy just kinda tells you what to do.”</i>");
	output("\n\nNow that she puts word to it, that’s <i>exactly</i> how you feel. You feel almost feverishly aroused, and Mitzi is so, so beautiful that looking at her is like staring at a star. Her erotic radiance leaves you dumbfounded and soaking wet, like a barely-sapient puddle. <i>“Oh-f-f-fuck yes!”</i>");
	output("\n\n<i>“Good.”</i> Mitzi grabs your ass and pulls you close, landing peck after peck in a slowly spinning spiral around your deliriously soupy puss. <i>“Pussy is amazing, isn’t it?”</i> She leans back to show you hers. From the luscious folds to the sheen of her leaking arousal, it’s awe-inspiring. Her silken interior glimmers with a stunning amount of erotic promise. <i>“It’s so powerful. So wonderful.”</i> She slides a finger through her slit. <i>“One cunt could bring down a government. Two cunts? Two cunts could addle a [pc.boyGirl]’s mind, just by existing.");
	if(pc.totalVaginas() > 1) output(" More? More could make the universe fade away into irrelevance.");
	output(" Couldn’t they?”</i>");
	output("\n\nThe words are background noise next to the beautiful texture of Mitzi’s feminine jewel. Your mouth and [pc.vaginas] water together in perfect sync, every part of you wanting to press against the juicy mound, just to be closer to it. To rub against it would be divine. To taste or grind against it, mind-melting. <i>“Mmmhmmm.”</i>");
	output("\n\nMitzi grabs your hand and brings it to her mouth, sucking you in to the knuckle. Her tongue flicks at the tip teasingly, and then she’s sliding back, heavy lips smearing your digit in enough gloss to make it shine brightly. Her purple mouth seems matte by comparison. <i>“Pussies deserve fingers, dear. I know it’s so hard to think when you’re this wet, all hot and fluttery.”</i> She turns your hand around, pushing the finger toward the sopping cleft between your [pc.thighs]. <i>“But you should really do what your pussy wants... and fill it.”</i>");
	output("\n\nThat shining finger slides in all on its own. You don’t have to think. You don’t have to decide to move the muscles in your arm. Your [pc.vagina] does all that for you, guiding that spit-and-gloss-slicked digit into the molten heat that burns between your [pc.thighs]. The tip brushes the underside of [pc.oneClit] on its way in, exactly the way you need it to, and then it’s spreading your lips wide, leaving the residue from Mitzi’s lips smeared over the exterior as it plunges in deep - so deep that you’re moaning as the knuckle wiggles inside.");
	output("\n\n<i>“Atta girl. Look at us - just two soaking wet cunts who are finally getting what we need.”</i> Mitzi sighs in delight as her manicured fingertips plunder her emerald jewel, the lips so exquisitely plush and inviting that they all but demand something slap against them, violate them in whatever degrading way will make them cum the hardest. <i>“Look at these cunts. Look at how wet they are.”</i> The goblin groans stuffs a second finger into her box, spreading them a second later to expose the hypnotically glistening flesh. <i>“Cunts this wet must cum, like super easy, right?”</i>");
	output("\n\nThe ");
	if(pc.balls > 0 && pc.ballDiameter() > 1 || pc.hasCock())
	{
		output("fact that ");
		if(pc.balls > 0 && pc.ballDiameter() > 1) output("a [pc.sack] blocks");
		else if(pc.cockTotal() == 1) output("a [pc.cock] blocks");
		else output("[pc.cocks] block");
		output(" your view stymies you the six long seconds it takes your cunt to remind you that you can ");
		if(pc.balls > 0 && pc.ballDiameter() > 1) output("lift it out of the way");
		else 
		{
			output("shift ");
			if(pc.cockTotal() == 1) output("it");
			else output("them");
			output(" to the side");
		}
		output(". Only then do you see your [pc.vaginas] revealed in all ");
		if(pc.totalVaginas() == 1) output("its");
		else output("their");
		output(" glory, so close to the goblin’s. They");
	}
	else if(pc.totalVaginas() == 1) output("two pussies in your view");
	else output(num2Text(pc.totalVaginas()+1) + " pussies in your view");
	output(" bob up and down in your nodding viewpoint. The backdrop is unsubstantial and unimportant next to the glistening honeypots that so dominate your world. There’s only the hot, wet frission of fingers against womanhoods, the pulsating thrum of hammering heartbeats tickling nerves so tenderized that the slightest breeze feels like a tongue’s tender strokes. You could cum at any second. It would be so easy, and your pussy wants it, so-");
	processTime(10);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",mitziFirstTimeCuntnosisIII);
}
public function mitziFirstTimeCuntnosisIII():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("A second finger slides inside, exploding your [pc.vagina] with pleasure. Detonations of mind-shattering bliss chain up your spine, leaving undulating, uncoordinated masses of muscle in their wake. As your body slumps over, [pc.hips] gyrating wildly, an atomic bomb of ecstasy shatters what small part of your consciousness remained into slick, cummy pieces. You moan whorishly as you hump Mitzi’s leg, smearing in her [pc.girlCum]");
	if(pc.isSquirter()) output(", in between fountainous squirts");
	output(". It’s so easy to cum, and you (or your pussy - there’s no divide between the two any longer) want to do it forever.");
	output("\n\n<i>“Cumming’s soooo easy,”</i> Mitzi moans, reaching up to rub [pc.oneClit] alongside her own.");
	output("\n\nA second climax climbs onto the back of the last one’s heels and rides you to the ground. Your eyes roll back, leaving you to dwell on your own insensate moans and the endlessly delightful feeling of slickened digits plowing through a sopping tunnel.");
	output("\n\nThe goblin climbs onto your unresisting form and shifts away from your throbbing clitty to work your wrist, pumping your fingers in and out now that it has become too difficult for you. <i>“Just a hot wet cunt who can’t think of anything but slit-stuffing sex.”</i> [pc.Girlcum] puddles in your thighs. The Mitzi-assisted masturbation sounds so loud in your ears, but not loud enough to stop you from realizing how right she is. <i>“That’s the truth ‘bout pussies, [pc.name]. They’re so... like... mmmmph! So </i>receptive<i>. They’ll do anything you want as long as you make them feel good.”</i>");
	output("\n\nAnother climax steals any attempt at response. Your [pc.legOrLegs] twitch");
	if(pc.legCount == 1) output("es");
	output(" bonelessly on the floor. <i>You’d put anything inside yourself to feel this good again.</i>");
	output("\n\n<i>“You’re a slut, just like Mitzi, aren’t you?”</i> The devilishly grinning goblin releases your wrist now that it’s pumping your cunt on its own and climbs onto your face. Her arousal smells so sweet, so desirable. You thrust your tongue into it and cum, uncaring that you’re <i>sucking pussy like a total slut</i>.");
	output("\n\nDewdrops of gabilani delight dribble into your maw.");
	output("\n\n<i>“Mmmm, but it’s fun to be a slut. Especially when you’ve got a little slut like Mitzi to fuck whenever your cunt gets the least bit horny. And pussies are like, </i>always horny<i>.”</i> Mitzi proves her point by squirming onto your tongue, her thick thighs wrapping around the back of your head with surprising strength.");
	output("\n\nAmbrosial tastes and smell intermingle with the satiny sawing of your masturbating fingers. The bliss of orgasm after orgasm has you so addled that you can scarcely tell where Mitzi’s cunt ends and your own begin");
	if(pc.totalVaginas() == 1) output("s");
	output(". She’s still talking, something about how every time you cum you get better and better at listening to your lusts, but you aren’t really listening anymore.");
	output("\n\nYou’re too much of a slut to care what else happens, as long as you get to keep cumming... and cumming... and cumming.");
	processTime(30);
	for(var x:int = 0; x < 6; x++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",mitziFirstTimeCuntnosisIV);
}

public function mitziFirstTimeCuntnosisIV():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("You wake up... sticky. Mitzi is next to you, snoring peacefully with her hand in her cunt... just like you were a moment ago. You lick the worst of it from your fingertips as you take stock of the situation. Your [pc.thighs] are completed plastered in [pc.girlCum], to say nothing of the puddle beneath. <i>Hot.</i>");
	pc.applyPussyDrenched();
	output("\n\nYou don’t have a very clear memory of exactly all that you got into aside from a faint memory of drugged lipstick and lots and lots of pussy, but you’re definitely feeling a little <b>more libidinous</b> because of your goblin fuckslave’s efforts.");
	pc.taint(2);
	pc.libido(4);
	processTime(30);
	pc.orgasm();
	IncrementFlag("MITZI_CUNTNOSIS");
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Mitzi takes it up the ass
//By QuestyRobo
public function mitziTakesItUpTheAssFINALLY(x:int):void
{
	clearOutput();
	showMitzi(true);
	author("QuestyRobo");
	output("Mitzi bounces in place, ecstatic at the prospect of getting fucked. As she does that you can’t help but keep your eyes on her bounding bubble butt, so wide that it’s visible from the front. You lick your lips as you start to circle the emerald slut.");
	output("\n\n<i>“What’cha doing, [pc.Master]?”</i>");
	output("\n\n<i>“Don’t worry about it. Just look straight ahead and let me work.”</i>");
	output("\n\nMitzi nods and does as you say, staring straight ahead and remaining perfectly still, trying not to move. That leaves you with full access to her bountiful booty. You roughly grab onto her ass, feeling your hands sink into the warm, yielding masses of flesh. Mitzi yelps at your sudden motion, but doesn’t break your command. You keep manhandling her generous globes; pressing into them, bouncing them up and down and side to side, and even giving her a playful bite, just to see if you can get her to choke up.");
	output("\n\nLike the good slut she is she doesn’t move an inch, but your ministrations have obviously had an effect on her. She’s shaking and twitching and babbling under her breath. <i>“M-[pc.Master] loves Mitzi’s booty! Are you g-g-gonna fuck it?”</i> She presses her rear against your hands, trying to force as much of herself into your hands as possible. You give her booty a hearty slap, pushing her back into a neutral posture.");
	output("\n\n<i>“Of course, but on <b>my</b> time!”</i>");
	output("\n\nMitzi nods and holds straight as you ");
	if(!pc.isCrotchExposed()) output("strip off your [pc.crotchCover] and ");
	output("grab hold of your [pc.cock " + x + "]. The green slut gets antsy when she realizes that you’re finally going to bang her brains out. You have to steady her yourself just to be able to line up with her cheeks. Prying open her buttocks, you place your member between them, releasing her ass flesh and letting it cascade over your " + pc.mf("","wo") + "manhood.");
	if(pc.cocks[x].cLength() <= 12) output(" Her massive mounds consume your [pc.cockNounSimple " + x + "], leaving nothing to sight.");
	else if(pc.cocks[x].cLength() <= 20)output(" Your cock is long enough for the tip to peer out the other end of her cheeks.");
	else output("Not even Mitzi’s massive rear mounds are enough to encase your mighty cock, leaving a huge amount of dickmeat hanging out in the open.");

	output("\n\nYou rock your [pc.hips] back and forth, sawing through her rear with ever-increasing force. For her part, Mitzi never even turns her head; she keeps looking dead on forward, just like you told her. You raise a hand up and bring it back down on her booty for a casual slap, drawing a yelp from the purple-haired slut and sending pleasurable vibrations through your member. The sensation is more than you were expecting, momentarily hampering your movements. With a huff you focus in and redouble your thrusts, going in so hard that you lift Mitzi off her feet.");

	output("\n\nShe groans in impotent pleasure as you use her like your personal fuck cushion. <i>“Mitzi loves when [pc.Master] uses her butt! D-do it as hard as you want, Mitzi wants it haaaaaaaarrd!”</i> The braindead gob starts cumming her brains out, soaking her thighs in womanly juices as her legs twitch and her pussy spasms. The wet noises remind you that you’re going to need a good amount of lube for what’s coming up. Luckily your partner just provided you with a fresh source.");
	pc.changeLust(50);
	output("\n\nYou take your [pc.cock " + x + "] out of the crack of her ass and press it between her thighs, up along her boiling pussy. She moans and cums even harder, soaking your member as you glide through her legs. She’s lubed herself up so much already that fucking her fat bimbo thighs almost feels like fucking a pussy! It’s so warm and soft that you’d be happy cumming just from this, but you have other ideas.");

	output("\n\nThat doesn’t stop you from giving her thighs a good workout though. You pound them with the same fervor that you gave her booty. She starts crying out in pleasure, completely unable to hold herself back, especially when you find her oversized clit and make sure to nail it on each thrust. It feels like a monsoon between her legs; the amount of wetness is insane! Part of you wants to get her a glass of water, but the overwhelming majority of you still just wants to fuck her until she passes out.");
	pc.changeLust(50);
	output("\n\nYou feel yourself hurtling toward your limits and decide that it’s time to get on with the main event. Before that, you do take a moment to admire how red and sensitive her inner thighs are. Just a light brush across one sends her into a confused shivering fit. The noises she makes are somewhere between pleasure and pain, signaling her own masochistic enjoyment. Pulling Mitzi’s asscheeks open, you reveal her deceptively tight-looking anus. The burnt-out bimbo gasps as you yank your [pc.cockNounSimple " + x + "] out of her thighs and press your [pc.cockHead " + x + "] against her anal ring.");

	output("\n\n<i>“In Mitzi’s butt? Yes please! Mitzi needs cock!”</i> She pushes her ass back, trying to take you right there and then. You slap her again, wordlessly telling her that you’ll go at this at your own pace. Of course, you weren’t going to wait any longer to dive in, yourself, but it’s still bad manners! ");
	if(pc.cockVolume(x) < mitzi.analCapacity() / 2) output("You press into her anus and find that your [pc.cock " + x + "] is almost immediately devoured by her rear. It’s actually hard to pull out with how hard her bootyhole is gripping you. Several irritated slaps to her ass sends the message loud and clear, and she tries her best to loosen up and let you get into a rhythm.");
	else if(pc.cockVolume(x) <= mitzi.analCapacity()) 
	{
		output("Her anus gives you some resistance, but both of you are determined to get you in there, so it stands no chance. You batter it down and gain entrance to her rear. It takes a bit of working, but Mitzi is eventually able to take all of your sizable member.");
		output("\n\n<i>“S-so much in Mitzi’s butt...”</i> The slut is almost completely out of it by this point, but that doesn’t matter much to you as you start to fuck her right.");
	}
	else 
	{
		output("You wonder if this is even going to be possible as you mentally compare the size of your [pc.cockHead " + x + "] to her entrance. You pull back to think of another way to go about this, only to set off Mitzi.");
		output("\n\n<i>“Noooooo, Mitzi can fit it! Pleeeease!”</i> She reaches back and digs her fingers into her bootyhole, stretching it out as far as she can. You shrug and give it another go, pressing your [pc.cock " + x + "] against her ass once again. There’s still a lot of resistance, even with her assistance, but after a good minute of sweaty pucker-pounding, you pierce her veil and get in. It’s oddly easy to get a good amount of your shaft in after the initial penetration. You can’t get all of it in, obviously, but you can fit enough that you can clearly see the outline in her gut. <i>“S-see? It, ugh, fits...”</i> She’s barely holding together, but that’s not going to stop you from getting into gear.");
		//buttchange mitzi for possible buttstretch xpy?
	}
	pc.cockChange();
	output("\n\nThis would work better if Mitzi were on the ground, you think. You put one hand on the back of her head and the other on her hip as you guide her face down to the ground while keeping her ass up in the air. She doesn’t offer any resistance, only a curt few mumbles as your cock shifts around inside her.");
	output("\n\n<i>“[pc.Master] is smart. Buttfucking is going to be much easier like thiiiiiiiiiiiiiiiiiiiiiiiiis!”</i> You don’t even wait for her to finish before you start up. Despite her best efforts to be accommodating for you, her ass still offers a lot of resistance. Even with as much lube as you got from her, it seems like you’re going to need a bit more. Lucky for you, her slutty slit is within easy reach. You dive four fingers deep into her, pulling out a hearty helping of gobbo cunny juice and slathering it on your member in between thrusts. You repeat this until Mitzi is a drooling heap on the ground, and you’re gliding through her rear end like butter through a waterslide.");
	output("\n\nWith your newfound freedom you up your tempo, really starting to stuff the stocky slut. Her bountiful ass jiggles like two bowls of particularly gelatinous gelatin, making them irresistible targets for your hands to work on while you fuck her. You knead, grab, and slap to your heart’s content, treating her like your personal sex-doll, which she pretty much is. It doesn’t take her long to start cumming again from the treatment. Mitzi’s whole body starts to spasm and shiver as her tailhole crushes in around you. You try and pull out, only to find that her spaded tail has wrapped itself around you, and is keeping you from fully extracting yourself.");
	output("\n\nThe tightness becomes too much for you to handle, and you explode inside Mitzi. ");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 1000) output("You empty your [pc.balls] inside her, feeling every drop being sucked out until you’re completely dry.");
	else if(cumQ < 10000) 
	{
		output("You stuff her backside with a deluge of [pc.cum], watching her belly round out as your [pc.balls] drain");
		if(pc.balls <= 1) output(" completely under the vice-grip of her ass");
		output(".");
	}
	else output("Mitzi screams out as you absolutely stuff her with [pc.cum]. Her belly rounds out in seconds as you can’t help put cram every drop you have into her. It cascades out in waves as even her bimbo gut is unable to hold all of your load.");

	output("\n\nYou curse under your breath at Mitzi getting you off too soon, as you pull out. You’re about to scold her, but she quickly gets up from her fucked-out funk and apologizes.");

	output("\n\n<i>“Mitzi sorry [pc.Master]! Mitzi couldn’t help it, it felt so good!”</i> You cross your arms and stamp your foot, expecting her to do something about your ");
	processTime(20);
	pc.orgasm();

	if(!pc.isErect()) output("wilting member");
	else output("not-quite wilting but still-spent member");
	output(". An idea seems to penetrate her thick skull, and she pulls a tube of her drugged lipstick out of... who knows where. She pops it open and puts on a thin layer. <i>“Just enough to get [pc.Master] ");
	if(!pc.isErect()) output("hard ");
	else output("ready to go ");
	output("again! Does [pc.Master] forgive Mitzi?”</i> Before you can answer, she’s already on your ");
	if(!pc.isErect()) output("softening");
	else output("hyper-sensitive");
	output(" cock, sucking it down her gullet as her lipstick creates jolts all along your shaft.");

	output("\n\n<i>“Y-yes, this is good!”</i> You can’t help but compliment her as your cock ");
	if(!pc.isErect()) output("shoots back to full hardness in seconds");
	else output("miraculously grows even harder");
	output(", ");
	if(pc.balls > 0)
	{
		output("and your [pc.balls] seem");
		if(pc.balls == 1) output("s");
		output(" to ");
	}
	output("ready");
	if(pc.balls > 0) output(" up");

	pc.changeLust(100);

	output(" for another round. You put your hands on the back of her head and put her to work, making her deepthroat your [pc.cock " + x + "] to the point where you nearly forget that you were supposed to be fucking her ass. The pleasure climbs as more of her insidious lipstick soaks into your dickskin. Even that small amount was enough to get your motor working overtime, your shaft rigid and tingling with drug-enhanced, erotic delight.");
	output("\n\nBefore you know it, you’re cumming straight down her throat, filling your emerald slut with ");
	cumQ = pc.cumQ();
	if(cumQ < 100) output("ribbons");
	else if(cumQ < 4000) output("gobs");
	else output("gallons");
	output(" of [pc.cum], again. It doesn’t stop your lusts though, if anything it serves as a delicious warm-up! Invigorated, you hoist Mitzi up and press her against your [pc.chest]. She says nothing, only signaling her approval with a coo and a deep moan as you plant the diminutive slut on your [pc.cock " + x + "], impaling her already well used ass again. Thankfully all your work from earlier paid off, and she’s still more than ready for you.");
	processTime(20);
	pc.orgasm();
	pc.changeLust(100);
	output("\n\nYou let out a low growl as you begin earnestly fucking her once again, making the tiny bitch cry out your name as you use her like the cock-holster she is. Your blood is boiling for more though, and you get the idea to break out into a light jog. It’s very strenuous, but the extra movement feels <i>amazing</i>. If only you had more room; hell, you could run a marathon if fucking this sweet ass more was the incentive! Alas, you’re only able to move in small circles, but that’s enough for now.");
	output("\n\nEventually your [pc.legOrLegs] tire, and you decide it’s time to end this session. You bend her down into doggy style, keeping your frantic pace going until you unload for a third time. Mitzi squeals in joy as your fresh jizz intermingles with the old, but you haven’t slowed down.");
	output("\n\n<i>“R-round four, [pc.Master]? Is Mitzi really that good?”</i> You grunt as the drugs she gave you continue to push you to do more, to fuck her until your pelvises are battered and bruised!");
	processTime(15);
	pc.orgasm();
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",mitziAnalEpi);
}
public function mitziAnalEpi():void
{
	clearOutput();
	showMitzi(true);
	author("QuestyRobo");
	//add sweaty.
	output("That’s exactly what you do for the next hour. By the end of it, Mitzi’s ass is red as a pair of ripe tomatoes, and you can imagine her brain is in the same state, considering she’s completely passed out. You yourself feel like you just ran a marathon, and part of the time, you actually were.");
	output("\n\nWhen you can actually feel your [pc.legOrLegs] again, you decide it’s time to get up and get about your business. Leaning down, you give your hard working slut a little goodbye kiss. She can sleep it off for a while.");
	processTime(60);
	sweatyDebuff(2);
	for(var x:int = 0; x < 9; x++) { pc.orgasm(); }
	pc.taint(1);
	IncrementFlag("MITZI_ANALED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Public fun]
//requires: pc to be a bimbo, to have a pussy, and to have tits and for the pc to be on a planet with a bar and legal nudity.

public function publicMitziFun():void
{
	clearOutput();
	showMitzi();
	author("Doots");
	output("You squeal in delight as a super sexy idea comes to you. " + (!pc.isNude() ? "You pull your clothes off so quickly that you’re not sure if a high-speed camera could catch you in the act. ":"") + "<i>“Mitzi, I got the best idea ever.”</i>");
	output("\n\n<i>“Ooh, what’s that, [pc.Master]?”</i> she asks while bouncing excitedly.");
	output("\n\n<i>“Like, we’re both stupid sluts. And what do stupid sluts need?”</i>");
	output("\n\n<i>“Big, yummy cocks, like, a lot of big, yummy cocks?”</i> she guesses.");
	output("\n\n<i>“Yeah, but like, there aren’t enough around here. So we should go and like get some dick.”</i>");
	output("\n\n<i>“[pc.Master] is so smart,”</i> she gasps. <i>“But Mitzi knows that just strutting your naked butt won’t be enough. Mitzi also knows just how to get the boys all over you.”</i> She grabs a pair of markers from somewhere. <i>“We should let everyone know that we’re both stupid bimbos that think with their pussies, then even the shy boys will come to have some fun.”</i>");
	output("\n\nYou pull the clothing off of the miniature bimbo and then you grab the marker. ‘Slap me’, ‘Cumdump’ and ‘Gobbo slut’ are amongst the things you write on the canvas that is her expansive behind. Her large tits are also fair game, and after a few moments, you’ve written ‘Grab me’, ‘Whore’ on her breasts and ‘Cock warmer’ right above her cleavage. You also write ‘Fuckhole’ and ‘Free’ above her pussy lips. Alongside the lewd terms, you draw cartoony hearts and cumming cocks on her body.");
	output("\n\nAdmiring your artistry, you hand the pen to Mitzi. She too draws cocks and hearts on your body alongside a little target on your ass with the words ‘Slap me’ written around it. You kneel down so that she can write ‘Bimbo’ and ‘Dick lover’ on your boobs. And to wrap it up she writes ‘Cock slot’, ‘Fuck me’ and ‘Free fuck-hole’ above your [pc.pussy]. You’re not exactly sure if Mitzi was intending to write ‘Cock slut’ above your cunny but it works either way.");
	output("\n\n<i>“Yaay, now [pc.Master] and Mitzi are ready to have fun.”</i> The now naked goblin celebrates. As Mitzi jiggles in excitement, a slightly concerning thought crosses your mind.");
	output("\n\n<i>“Umm, Mitzi, are these like, permanent markers?”</i>");
	output("\n\n<i>“Uh, dunno. Mitzi got pussy stupid again.”</i>");
	output("\n\nWell, bugger, you might end up with lewd markings on your body for a long while. The damage is done already, so you decide to worry about it later.");
	processTime(15);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",mitziPublicFun2);
}

public function mitziPublicFun2():void
{
	clearOutput();
	showMitzi(true);
	author("Doots");
	output("You get plenty of lustful looks as you two walk down the street, but no one is taking the initiative despite the extensive advertisement of your combined sexual promiscuity. You jump as you feel someone pinching your behind, but whoever got handsy with your butt has disappeared into the crowd.");
	output("\n\nA gasp of pleasure next to you informs you that Mitzi is having better luck. She’s hanging in the air and leaning against the chest of an amazonian ");
	var race:Number = rand(3);
	if(race == 0) output("kaithrit");
	else if(race == 1) output("gryvain");
	else output("thraggen");
	output(" with her fingers buried knuckles deep in Mitzi’s cunt. As quickly as it started, it’s over. The statuesque woman lets Mitzi down and licks her fingers clean off of her juices before walking away.");
	output("\n\nBoth of you are heated and needy, and now that someone was brave enough to break the ice, you’re forced to bear the barrage of slaps, gropes, and pinches on your behind and breasts.");
	output("\n\nWhen you finally reach the bar, you’re starving for cock and, if the moaning and the whimpering is any indication, Mitzi isn’t faring any better.");
	output("\n\nThe tension in the bar is palpable, and you can hear the murmurs of the patrons as you stride towards the counter. They comment about your [pc.breasts], [pc.vaginas], and [pc.ass]. All the attention on you has your entire body tingling. Your breathing is ragged, and your legs are quivering with lust.");
	output("\n\nYou lean against the counter and slap your ass before calling out to the patrons: <i>“Come on! Surely at least, like, one of you is man enough to come and get some.”</i>");
	output("\n\nSeveral of the bar’s patrons stand up when you speak.");
	race = rand(2);
	if(race == 0)
	{
		output("\n\nA human male is the first in line. The sound of a belt being unbuckled and pants falling against the ground reaches your ears.");
		output("\n\nHe thrusts into your [pc.pussy] with no skill. Working his hips, pumping his cock into you in a steady rhythm. While he lacks finesse he makes up for it in speed, rapidly slapping his hips against your butt. You coo softly and guide his hands to your [pc.breasts]. He’s quick to adapt; you’ll have to give that to him.");
		pc.cuntChange(0,10);
		output("\n\nYou feel his dick pulsing and the pre leaking inside you. With his pace, he isn’t going to last, but you’re not ready for him to cum yet.");
		output("\n\n<i>“Come on, sweety, don’t cum yet,”</i> you whisper while looking at him with smoldering bedroom eyes. He grunts and holds your hips even tighter, but he doesn’t cum just yet. Despite his efforts to hold back, he’s definitely going to cum before you do. You reach for [pc.oneClit] to narrow the gap. Unfortunately, he gasps, and you feel his warm seed flooding your cunny before you start rubbing your clitty.");
		output("\n\nHe wipes his cock clean on your behind, pulls up his pants, and moves out of the way so that the next person in the line can get their turn.");
	}
	else if(race == 1)
	{
		output("\n\nAn ausar is already aligning the tapered tip of his member with your [pc.pussy]. He slides inside without much of an issue. When he’s balls deep in your welcoming cunny, he delivers a harsh spank across your [pc.ass], making you clench around his prick.");
		pc.cuntChange(0,10);
		output("\n\nHe continues to slap your behind while he thrusts deep into your cunt, the constant spanking and pummeling has your thighs quivering and eyes crossing in pleasure. The ausar certainly knows how to please a slut like you. He’s even hitting all of your sweet spots while roughly taking you.");
		output("\n\nYou moan loudly as he keeps pounding you. <i>“That’s it, bitch, cum for me,”</i> he growls while spanking your ass even harder. Clawing at the bar counter, you let out a low whine as your pussy soaks itself around his doggy dong. Spasming and clenching, it tries to milk the ausar’s balls dry.");
		output("\n\n<i>“You want my cum, you slut? Then take it!”</i> he growls while spanking your ass, ramming his inflated knot into your pussy while hot spunk spurts into your womb. Another body-quivering orgasm crashes through your body as the big ausar breeds your pussy.");
		output("\n\nHe wipes a bead of sweat from his forehead. <i>“Fuck, that was quite nice,”</i> he sighs. When he tries to pull out, he notices that the two of you are tied. He holds onto your hips with his strong hands and starts to tug harder. You wince as the large bulb of flesh tries to exit your pussy.");
		output("\n\nAfter a few minutes of pulling, you yelp as the knot exits your worn cunt with an audible pop. He wipes his knotted length clean on your thighs before pulling his pants back up and walking away.");
	}
	output("\n\nAs the next person gets their hands on your ass, you look to your side to check how Mitzi is doing. ");
	if(rand(2) == 0)
	{
		output("The slutty gabilani is standing under a taur, jacking off the impressive equine length with the eagerness you’d expect from her.");
		output("\n\nThere’s no way that she can fit the massive head of the horse-member into her mouth, but that doesn’t stop her from doing her best to please it. She’s stretching her mouth as wide as she can and licking the tip in lengthy lavishing drags of her long tongue.");
		race = rand(2);
		output("\n\nThe taur’s member pulsates in Mitzi’s hands as she wraps her tongue around it, just like a snake would do to its prey. The taur grunts and stomps " + (race == 0 ? "his":"her") + " hooves as " + (race == 0 ? "he":"she") + " gets closer to orgasm. Cum sprays from Mitzi’s nose as her partner pumps cum down the green cocksleeve’s throat. Her stomach begins to swell under the weight of her partner’s cum even though a lot of the jizz ends up on the floor.");
	}
	else
	{
		output("She’s being held upside down by a gryvain who’s thrusting her dragon cock into her mouth. While slurping on the cock, Mitzi is massaging her own breast with one hand and pumping the other wrist-deep into her cunt.");
		output("\n\nWhether she has a hair trigger or if Mitzi is just that good, you don’t know, but nonetheless, she thrusts to the hilt before unloading down the pint-sized slut’s throat. Her already stuffed belly has trouble keeping the cum down, the overtaxed organ letting the dragon’s spunk burst out, flowing freely over Mitzi’s features.");
		output("\n\nWhen the chubby dragon stops cumming, she just thrusts back into Mitzi’s face. Seems like she’s making up for her poor stamina with a non-existent refractory period.");
		output("\n\nYou watch her jizz into the goblin’s throat at least three times before she’s satisfied and lets the now-bloated goblin down. She stifles a burp, licks the gryvain’s cock clean, and waves her a little goodbye as she disappears into the building crowd.");
	}
	output("\n\nA quick slap on your ass turns your attention back to your own business. You turn your head back to see who’s behind you.");
	if(rand(3) == 0) 
	{
		output("\n\nA busty thraggen winks at you and thrusts her lengthy prick into your behind. She holds it there, letting you get used to its size. Her plump balls pulse against your soaked pussy. You swear you feel can them growing bigger and weightier by the second. Once she judges that you’re prepared enough, she pulls out so that only the tip of her cock remains inside you, then rams it back in hard enough to knock the wind out of you.");
		pc.buttChange(100);
		output("\n\nShe pins your face down to the bar as she takes your ass for a ride. You can’t help but to moan and whimper as she ravages your ass with long thrusts, slapping your pussy with her hefty nuts.");
		output("\n\nAfter a short while, you hear a steady flow of begging coming out of somewhere. You realize a while later that it’s coming from your mouth. You’re slightly embarrassed, but you want her to fuck you harder and faster; you want her to pump all of her thick cum into your ass. She laughs and slaps it, commanding you to beg louder so that the entire bar can hear your whorish moans.");
		output("\n\nWhen she’s sure that people outside the bar can hear your moaning, she hilts her cock into you, pinning you against the hardwood. She lets out a loud roar as her warm baby batter splatters inside your ass. Your pussy clenches at nothing but thin air, wishing that the cock was inside it and not your ass.");
		output("\n\nThe big thraggen female collapses over you, still in the throes of her orgasm as her dick continues leaking cum into you. Sweating and panting, she stands up and staggers away without even clothing herself.");
	}
	else
	{
		output("\n\nThe dzaan behind you rolls a condom over her length before aiming it against your welcoming behind.");
		output("\n\nShe thrusts her latex-covered prick into your [pc.asshole], spreading it wide around the thick cock. Her alpha senses must be telling her to fuck you raw and claim you, and not being able to do that must be infuriating for her. Maybe she just tends to fuck people like she hates them.");
		pc.buttChange(55);
		output("\n\nShe grumbles something about wanting to claim you as she wraps her muscular arm around your neck, putting you in a headlock. You can’t breathe as she pummels your poor backside with her hips. You can’t help but to moan and whimper weakly as she brutally takes you from behind.");
		output("\n\nDespite how uncomfortable it is, especially after she pulls your head back so that your spine is twisted in the wrong direction, your pussy is basically a waterfall of [pc.girlCum]. She thrusts her fingers into your pussy, fingerfucking your cunny as roughly as she fucks your ass. You bite your lip, almost hard enough to draw blood as more [pc.girlCumNoun] splashes down your thighs and soaks her hand. You cum hard enough to see stars.");
		output("\n\nSuddenly the condom starts filling up. It grows and grows. At first, it’s the size of a golf ball, then the size of an apple, and it ends up being the size of a basketball. The large cum bubble ‘shlorps’ as it exits your ass. She pulls it off and drops it on your back without even bothering to tie it.");
	}
	output("\n\nYou spare a glance towards Mitzi. She’s being spit-roasted by between a ");
	if(rand(3) == 0) output("kui-tan");
	else if(rand(2) == 0) output("kaithrit");
	else output("human");
	output(" and a ");
	if(rand(2) == 0) output("laquine");
	else output("suula");
	output(". You’re little ashamed that the gablani is out-slutting you.");

	output("\n\nYou crook your finger at the crowd and pat the hardwood you’re leaning against.");

	output("\n\nA kaithrit boy jumps up onto the counter and whips out his dick. Pressing your nose into his balls, you take a deep sniff, getting a good sample of his masculine aroma. His nubby cock is the real prize here, but you don’t want to skip the appetizer.");

	output("\n\nYou take his balls into your mouth and start to swirl your [pc.tongue] around, bathing his balls. Lifting them into your mouth, you find them to be surprisingly heavy for their size. Hopefully they have plenty of cum for you. His balls are soaked in spit, so you let them out of your mouth with a soft pop.");
	output("\n\nThe nubby tip slides easily into your mouth. You start bobbing your head up and down the cat boy’s length. His constant stream of pre helps your descent towards his balls, and soon your chin collides with his heavy orbs. Now that you’re properly deepthroating him, you don’t want to leave his testes without any attention. You grab them and start to softly massage them.");
	output("\n\nYou moan as another cock thrusts itself into your [pc.pussy], pushing you against the dick in your mouth. You feel the oral invader swelling and throbbing. His warm, sticky baby batter fills bathes your tongue, so you commence gulping it down with gusto. Letting the flaccid member out of your mouth, you watch its owner slide down off of the bar, gratefully letting a fresh cock replace it two heartbeats later.");
	processTime(34);

	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ", 1500, 0, 0, 0);
	if(pc.hasVagina())
	{
		for(var vIdx:int = 0; vIdx < pc.vaginas.length; vIdx++)
		{
			pc.cuntChange(vIdx, pp.cockVolume(0));
			pc.loadInCunt(pp, vIdx);
			pc.loadInCunt(pp, vIdx);
			pc.loadInCunt(pp, vIdx);
			pc.loadInCunt(pp, vIdx);
		}
	}
	pc.loadInAss(pp);
	pc.loadInAss(pp);
	pc.loadInAss(pp);
	pc.loadInMouth(pp);
	pc.loadInMouth(pp);
	pc.loadInMouth(pp);
	pc.loadInMouth(pp);
	clearMenu();
	addButton(0,"Next",mitziPublicFun3);
}

public function mitziPublicFun3():void
{
	clearOutput();
	showMitzi(true);
	author("Doots");
	var race:Number = 0;
	output("The two of you are covered in cum from head to toe. Your stomachs are bloated with the seed of countless partners whose names you don’t even know. The last person in line grunts and adds his baby batter to the few gallons already sloshing inside you.");
	pc.applyCumSoaked();
	output("\n\nYou both collapse to the floor, you leaning against the hardwood and Mitzi leaning against you. Looking over the bar, you notice that there’s still someone with their attention on you.");
	if(roamingKiroAvailable()) 
	{
		race = 0;
		output("\n\nIt’s Kiro! And her balls are considerably swollen. Either she just arrived or she wanted the both of you for herself. She stands up and walks over to the two of you, her balls inches away from the ground.");
		output("\n\n<i>“It was fun watching you sluts get gangbanged, but you two also got me worked up, and I think you’re just the pair to take care of it.”</i> She’s not lying. Her equine member is rock hard and leaking pre like a broken tap.");
	}
	else if(rand(2) == 0)
	{
		race = 1;
		output("\n\nAn amazonian kaithrit looks at the two of you with a predatory glint in her eyes. She strides up to the bar with her dripping kitty-cock swaying hypnotically.");
	}
	else
	{
		race = 2;
		output("\n\nA huge thraggen quickly chugs her drink and wipes her lips clean on her wrist before hungrily marching closer to your tired forms.");
	}
	output("\n\nWeakly, you climb up onto the bar and rest your head over the counter. The pent up ");
	if(race == 0) output("kui-tan");
	else if(race == 1) output("kaithrit");
	else output("thraggen");
	output(" starts to align her ");
	if(race == 0) output("flat");
	else if(race == 1) output("pointed");
	else output("round");
	output(" cockhead with your mouth, but when Mitzi sits down on your [pc.breasts], ");
	if(race == 0) output("Kiro");
	else if(race == 1) output("the kaithrit");
	else output("the thraggen");
	output(" gets the idea, and with some difficulty and a couple of barstools, she gets her dick at the perfect height for the goblin’s mouth.");
	output("\n\nSmoothly thrusting her pulsing ");
	if(race == 0) output("equine");
	else if(race == 1) output("feline");
	else output("humanoid");
	output(" dong into the green-skinned slut’s throat, she slides her entire cock into her in one smooth motion. ");
	if(race == 0) output("You wrap your arms around her balls and hug her huge, furry sack like it was a long lost lover.");
	else output("You take a hold of her balls, massage them softly, and press them against your nose.");
	output("\n\nHer smell and taste make your head spin, you could spend an eternity ");
	if(race == 0) output("hugging");
	else output("fondling");
	output(" her balls if you didn’t crave her cum so badly. You try to lick those gorgeous orbs but they withdraw out of your range only to slap back into your face. It’s hard to worship her balls when she’s fucking Mitzi’s face, but you purse your lips so that every time she’s ");
	if(race == 0) output("sheath deep");
	else output("balls deep");
	output(" you also kiss her nuts. Occasionally she holds herself in the gablani’s face-pussy so you lick her sack with long, worshipful drags of your [pc.tongue].");
	output("\n\nHer scent is truly intoxicating. You wonder how you’ll live without it. Suddenly ");
	if(race == 0) output("Kiro’s");
	else if(race == 1) output("the thraggen’s");
	else output("the kaithrit’s");
	output(" cock slides into your open mouth. Your eyes bulge in surprise but soon you’re happily gurgling around her cock. Mitzi sloppily licks the ");
	if(race == 0) output("horse meat");
	else if(race == 1) output("cat cock");
	else output("green meat");
	output(" outside your throat. You can’t help but to moan quietly around the cock as it keeps rubbing inside you. ");
	//pc has taken snake bytes:
	if(flags["USED_SNAKEBYTE"] != undefined) 
	{
		output("Thanks to your throat being an engorgeous zone, having the ");
		if(race == 0) output("kui-tan");
		else if(race == 1) output("kaithrit");
		else output("thraggen");
		output(" facefucking you feels as good as she were inside your pussy.");
	}
	else output("Maybe it’s just how cum-drunk you are, or maybe you’re naturally submissive, but the throat fucking is making you feel incredible.");
	output(" Thigh quivering, hips bucking and pussy spasming, you cum explosively. ");
	if(pc.isSquirter()) output("[pc.GirlCum] jets out of your [pc.pussy], soaking the bar in your feminine fluids.");
	else output("The barkeep’s side of the counter had survived until now. Your juices run down your ass and down to the floor.");

	output("\n\nAs good as her cock tastes, you do still need air so you drunkenly tap her ass. Taking the hint, " + (race == 0 ? "Kiro":"she") + " withdraws and inserts her cock back into Mitzi. Your previous ball worship is nothing compared to the whorish make-out session you engage in with her " + (race == 0 ? "fuzzy ":"") + "sack. You lick every inch that you can get your tongue on and suck on them hard enough to leave a hickey on a normal person.");
	output("\n\n<i>“You sluts ready for a big helping of cum?”</i> she grunts moments before cumming down Mitzi’s throat. Her eyes bulge, and cum shoots out her nose and mouth. Her stomach bloats even more under the heavy assault of ");
	if(race == 0) output("kui-tan");
	else if(race == 1) output("kaithrit");
	else output("thraggen");
	output(" jizz. Not wanting to leave you out, ");
	if(race == 0) output("Kiro");
	else if(race == 1) output("the muscular feline");
	else output("the orc");
	output(" pulls out of the pint-sized slut – giving the two of you a new coating of spunk in the process– and thrusts her cock into your throat, shooting cum straight into your churning, spunk-sodden stomach. You drink down everything she gives you, not wanting to waste a single drop, even still some of it flows out of your mouth and over your face.");
	output("\n\nAs you swallow her cum, things start to go dark. You’re just so tired. The last thing you see is ");
	if(race == 0) output("Kiro");
	else output("your anonymous partner");
	output(" with her ");
	if(race == 0) output("balls back to normal and ");
	output("cock quickly softening. She looks at you worriedly, and then everything goes black.");
	processTime(15);
	//Figure all choices have kiro-sized loads :P
	pc.loadInMouth(kiro);
	if(race == 0) kiro.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mitziPublicFun4,race);
}

public function mitziPublicFun4(race:Number):void
{
	clearOutput();
	showMitzi(true);
	author("Doots");
	output("You wake up in your bed. At first, you think that it was all a dream, but your cum-bloated stomach tells a different tale. You grab your codex and notice that there’s a new message: ");
	if(race == 0) output("\n\t<i>Hi, angel, sorry that I couldn’t stay. I’d love to sleep with you after fucking you even more pregnant with cum but I had to go. Come see me soon. -Kiro <3</i>");
	else output("\n\t<i>‘Hi, the gabilani told me where your ship was, so I dropped the two of you off. Wouldn’t mind seeing you again.’</i>");
	output("\n\nSince your body is spotless, you’re sure ");
	if(race == 0) output("Kiro");
	else if(race == 1) output("the kaithrit");
	else output("the thraggen");
	output(" gave you a rinse before putting you in bed. Thankfully, even the writing has disappeared.");
	output("\n\nYou close your codex and lay down on the bed. That was one hell of a night. If you could have a hangover from cum you’d be having the worst one right about now. Mitzi is sleeping at the foot of the bed with her ass in the air and girlish nectar drooling down her legs and into your sheets.");
	processTime(35);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Intro
//Requirements: Mitzi on board, cockwings.
//Total tentacle dicks should count both cockwings and regular dicks, but not tail-cocks.
public function mitziTentaCocks():void
{
	clearOutput();
	showMitzi(true);
	author("Nonesuch");
	var tCount:int = (pc.wingCount + pc.cockTotal(GLOBAL.TYPE_TENTACLE));
	output("Just being in Mitzi’s presence is an uncomfortably sensual experience. Everything the gabilani does, her every bouncing step and cooing simper, is aimed at drawing your eye to her luscious, soft curves, to her wet lips, to a body crafted for one purpose. Your mind instinctively wanders onto libidinal backroads once your eyes are there... ever more filthy and overgrown the further down them you travel. It’s that which makes the cock tentacles on your back swell; hot, ravening desire giving them license to inflate, reach outwards, remind you of their fibrous, burning potential.");
	output("\n\n<i>“What’s on your mind, [pc.Master]?”</i> the gabilani asks coyly, heart-shaped pupils flicking up to one of your tentacles bobbing slowly in the air behind you, giving her an obscene wave. <i>“Ooooh. Are you thinking of a particularly naughty way of fucking Mitzi?”</i>");
	output("\n\nShe’s over to you before you can say anything, and once her hot hand is wrapped around that tentacle, coiling it lovingly up and down, coaxing more and more pressure and oozing urge into it, there’s no stopping any of what happens next.");
	output("\n\n<i>“Look at these lovely things,”</i> she coos. You murmur as she reaches out and plants a kiss on the head of another, all the while continuing to rub the one in her hand, up and down, up and down. <i>“So thick and tasty and </i>vigorous<i>. They aren’t let loose to have fun anywhere near enough, are they? Poor things! Oh, they deserve to be rammed deep in Mitzi’s holes! ");
	//If five or less tentacle dicks total and/or no other applicable crew available: 
	if(tCount <= 5) output("Wouldn’t you like to do that, [pc.Master]?”</i> She blinks up at you solemnly, one tentacle in each hand now. <i>“Wrap me up in cock and make me take it in every hole? Do it to me that way til all I can think about is how good it is to be your tentacle-worshipping bitch?”</i> Out comes her long, slathering tongue, tracing a long, wet, path of pleasure up one of those veiny, prehensile tools, coaxing a dribble of pre out of the tip.");
	else output("Wouldn’t you like to do that, [pc.Master]?”</i> Her tone turns hushed, conspiratorial and excited as more of your tentacles reach towards her, batting their blunt heads against her soft flesh, drawn like beggars to a feast. <i>“Or maybe you want more. Look at how many of them you have, [pc.Master]! We should bring </i>all<i> of your sluts in here, so that they can </i>all<i> enjoy your lovely, writhey, thickness!”</i> She laughs bashfully, one prehensile cock in each hand, stroking and pulling them. You open your mouth to the bliss of it. <i>“Mitzi got too greedy, looking at all these dicks. She wasn’t thinking about what would be most awesome for [pc.Master] and the rest of [pc.his] toys! You should punish her by trussing her up and have her take it into every hole, make her into your tentacle-worshipping bitch.”</i>");
	// {merge}
	output("\n\nThat’s the other thing about Mitzi. She doesn’t just inspire fucking: she seizes that inspiration and runs with it. Truly, the perfect sex slave.");
	//If else display choice: [Mitzi] [More]
	//Mitzi tooltip: Make Mitzi airtight with your ravening tentacle dicks.
	//More tooltip: Do as many of your on-board harem as possible.
	processTime(10);
	clearMenu();
	if(tCount <= 2) addButton(0,"Next",justMitziTentabang);
	else {
		addButton(0,"Mitzi",justMitziTentabang,undefined,"Mitzi","Make Mitzi airtight with your ravening tentacle dicks.");
		if(celiseIsCrew()) addButton(1,"More",mitziAndMoreTentaNightmareScene,tCount,"More","Do as many of your on-board harem as possible.");
		else addDisabledButton(1,"More","More","You’ll at least need Celise around for this.");
	}
}

//Just Mitzi
public function justMitziTentabang():void
{
	clearOutput();
	showMitzi(true);
	author("Nonesuch");
	var tCount:int = (pc.wingCount + pc.cockTotal(GLOBAL.TYPE_TENTACLE));
	var x:int = pc.cockThatFits(mitzi.analCapacity());
	output("You keep your eyes silently trained on Mitzi’s face, let her see the hungry intent on your features as you flex, feeling for yourself how you can reach your nest of back-tentacles this way and that, grabbing, gripping and seeking with ropey, feverish strength. She has time to inhale excitedly before you rip the ones in her hands away and hook them underneath the fatness of her thighs. Another slithers its way around her neck, then with one hard heave you’ve got the gabilani face up in the air, heaving her towards your bed.");
	output("\n\nAs feral as you are with lust - " + num2Text(tCount) + " cocks filled with leaden arousal all clamouring for a wet, warm hole to claim - you try and do this as carefully as you can. You rarely use your prehensile pricks in this manner, and Mitzi is surprisingly heavy for a squat little thing who looks like she’s made of pillows. And she doesn’t make it easy for you, air-pedalling with glee, squealing, laughing and writhing against your fibrous grip, boobs jiggling merrily.");
	output("\n\nBut your tentacles are strong, and act with a graceful alien instinct to breed that is disquieting. Your mind is itchy with their desire and responsiveness, your nerve endings twitching in uncanny ways to balance Mitzi on the bed, digging their grasp into the wonderful softness of her thighs to draw them open, exposing the parting folds of her plump, wet, ever-ready cunt.");
	output("\n\n<i>“Oooh,”</i> she simpers, dilated hearts fastened on the end of the one coiled around her neck. She reaches and gives it a teasing little lick. <i>“My new best friends. I hope they aren’t too rough with me...”</i>");
	output("\n\nFor a while you simply tease her, enjoying the tactile splendour of your gabilani slave by dragging the sensitive, bulging ends of your tentacles across her smooth, green flesh: sliding over her protuberant nipples, pushing through the deep valley of her behind, caressing her face and tracing her lips, leaving shiny trails of musky pre wherever they travel.");
	output("\n\nShe sighs, wriggling against your prehensile limbs, then moans as you draw one back and swish it backwards and forwards over the silkiness of her pussy, tormenting her sodden clit and folds. You coil another prick around one of her melon-like breasts as you do it, giving it a hard squeeze" + (!mitzi.canLactate() ? ".":", eliciting a squirt of milk into the air."));
	output("\n\n<i>“Oh [pc.Master],”</i> she whines, gazing at you pleadingly as she frustratedly thrusts her pinned thighs towards you, trying to penetrate herself. <i>“Please give that to Mitzi!”</i> She paws at her boobs, squeezing her nipples hard, intensifying her arousal at the same time as crudely egging you on. You frown. Twitching those strange nerve endings reaching out of your back, you curl two tentacles around her elbows and yank her arms away, rendering her helpless at the same time as forcing " + (!mitzi.canLactate() ? "her sizeable tits":"those gigantic, milk-swollen tits you’ve given her") + " outwards. <i>Much</i> better.");
	output("\n\nShe squeals with delight, flexing at the strait-jacket of cock you’ve wrapped her in, delighting in her own helplessness as you finally let the one pressed against her pussy off the leash, thrusting its head beyond its entrance and into the smooth, fervid wetness beyond. You groan, heat rushing to your brow; you always forget what a wonderful cunt she has, plump softness giving way to gloving, clutching wet silk, beckoning more and more of your prehensile prick into her. It makes you want to fuck her all the more, makes you almost drool and instantaneously harden when you catch a sight of it, a tainted, addictive cocksleeve. You grit your teeth and thrust yourself into it hard, your other tentacles reflexively tightening their grip around her.");
	pc.cockChange();
	output("\n\n<i>“Oooooh!”</i> the gabilani bimbo wails, short legs kicking gleefully into the air. <i>“Yes, like that [pc.Master], like th-!”</i>");
	output("\n\nThey’re left to their own impulses now, your thicket of long alien growths swollen taut with their own lusts and urges, and the one nearest to her mouth takes full advantage, silencing her cries by thrusting its smooth head beyond her full, glossy lips into the welcoming warm wetness beyond. She gulps and tenses up for an instant, then her ingrained slut instincts take over, hollowing her cheeks around the hard, prehensile cock, sucking on it powerfully, her lips forming a glossy seal around the tender, inflamed flesh.");
	output("\n\nYour pulse is pounding in your head as you lean forward, hands closing on her ankles as you ");
	if(x >= 0) output("push your [pc.cock " + x + "]");
	else output("push another writhing, excited tentacle");
	output(" past the softness of her buttocks until it’s pressed against the wrinkle of her anus. It’d be so easy to lose yourself completely in the giddying sensation of simultaneously fucking Mitzi’s mouth and cunt... but no. ");
	if(x >= 0) output("You’ve gotta see to number 1 here. Let your old faithful have some of the action here.");
	else output("You set out to make her airtight, and that’s exactly what you intend to do.");
	output("\n\nAlmost reflexively you thrust your " + (x >= 0 ? "[pc.cock " + x + "]":"third prehensile prick") + " into the gabilani’s exposed anus, driven on by the electrifying arousal wracking your frame. She emits muffled squeaks and grunts in response, still sucking dutifully on the cock pistoning in and out of her maw, saliva drooling down her chin - but, once again, her body’s instincts and cravings take over. Her ass opens up in front of your spearing point, practically begging you into her tight, clutching innards, and within a few seconds you’re in there, sawing into that warm clench at the same time as your " + (x < 0 ? "other ":"") + "tentacles claim her mouth and cunt.");
	output("\n\nMitzi shudders and writhes and squeals into the cock gagging her, boobs and ass wobbling wildly, generating delicious shudders into your eagerly thrusting pricks. It’s inhumanely stimulating, fucking three exquisite holes at once, far too much for you to hold back against for more than a minute of undulating, contorting sex. You orgasm in a sudden, shocking gout, groaning and growling as hot [pc.cum] streams up those long, undulating vines and " + (pc.cumQ() < 400 ? "spurts":"hoses") + " gratuitously out the ends.");
	output("\n\nInstinct makes you ram your members into the gabilani as far into her as they will go, ploughing that [pc.cumFlavor] seed into her deep. She utters a startled ‘gak!’ as you thrust into her throat, thickening her neck with it, but she coaxes it in by clamping her lips around its girth, a wet vacuum giving way to the wonderful wet tightness further down.");
	output("\n\nIn a frenzy your unused tentacles thrash at her, painting [pc.cum] all across her soft, lewd body, one of them even briefly winding up in her pointy ear, fucking its silky canal as it throbs in orgasm. Well, why not? Giving her brain a good soaking in cum isn’t going to change much.");
	processTime(15);
	pc.orgasm();
	pc.changeLust((pc.lustMax()-pc.lust())/2);
	mitzi.loadInCunt(pc,0);
	mitzi.loadInAss(pc);
	mitzi.loadInMouth(pc);
	clearMenu();
	addButton(0,"Next",mitziTentapalooza2);
}

public function mitziTentapalooza2():void
{
	clearOutput();
	showMitzi(true);
	author("Nonesuch");
	var tCount:int = (pc.wingCount + pc.cockTotal(GLOBAL.TYPE_TENTACLE));
	var x:int = pc.cockThatFits(mitzi.analCapacity());
	output("Your vine-cock makes a wet ‘pop’ noise as it exits Mitzi’s throat. She keeps her glossy pink cock-pillows on it tight as it slides out of her mouth, ensuring every last drop is suckled off.");
	output("\n\n<i>“Mmm,”</i> she sighs, gazing up at you in soft, sex-baked joy. <i>“[pc.Master] knows </i>exactly<i> how to treat Mitzi.”</i>");
	output("\n\nAlthough your pricks have slipped out of your [pc.cumVisc]-choked holes, you still have her held in their obscene, prehensile grip, still gently tightening and softening your hold on her limbs. You play with your little fuck-pet, enjoying the wonderful softness of her tits, finding the nub of her clit and teasing it until she squeals, feeling the barely-abated arousal continue to thrum through you, animating your restless tentacles.");
	output("\n\n<i>“You’re not done yet are you, [pc.Master]?”</i> the cum-dripping gabilani whispers. She flexes against her ropey, musky bonds, gazing up at you pleadingly. <i>“No... you’re going to bloat Mitzi with yummy cum from those wonderful... thick... beasts...”</i> this last comes at as an utterly wanton, broken moan, a sound which galvanizes you like a shot of adrenaline straight to the heart.");
	output("\n\nWith lithe coils and flexes, you flip her over, dangling her soft weight in the air by the wrists and thighs, her " + (!mitzi.canLactate() ? "large":"huge, milk-dripping") + " breasts dangling down to the sheets. You admire the round, fat hills of her ass, sinking your fingers into it as you send one of your tentacles slowly slithering up her frame like a creeper, drifting over a protuberant nipple, coiling around her neck and finally presenting its oozing blunt head to her mouth.");
	output("\n\n<i>“Mmmmm,”</i> she moans as she opens her lips around it, proving to you once again what a perfectly designed cock-holster that mouth of hers is by drifting her plump, silky pinkness around the head, kissing it longingly, slowly taking it deep so she can lavish the shaft with the wet, shifting carpet of her tongue. You reward her with a fresh squirt of [pc.cum] coaxed out to coat her taste buds, and a good hard slap to the ass, making her squeal and jiggle in her bonds delightfully.");
	output("\n\n" + (x >= 0 ? "You line your [pc.cock] up with her pussy this time, a different tentacle craning around and easing its way between the generous softness of her buttocks until it finds her asshole, rewarding your insatiable appendages with new sensations.":"You line different tentacles up with her pussy and asshole, craning them around and lining them up with her loosened holes, rewarding your insatiable appendages with new sensations."));
	output("\n\nYou exhale sharply as you thrust home each simultaneously, easily pushing inside Mitzi’s [pc.cum]-slickened passages, heat and pleasure coursing up your throbbing shafts. A litany of wet, slutty noises are sent shivering into the tentacle gagging her mouth as you saw in and out of her, packing her squat body utterly with dick.");
	output("\n\nYour lust dissipated from a devouring inferno to a glowing furnace, you’re able to go at your tentacle-bound gabilani slave thoroughly this time, spending long, glorious minutes reaming her from behind slowly but surely as you let her worship the prehensile prick filling her face, tongue rubbing it a foot up its stem as it pushes into her tight throat and suffocates her, enveloping her sex-soaked brain with how you smell, how you taste, how you feel. When you retract and let her heave breath back in, the first thing she does is kiss and lick at the oozing slit pressed against her lips; eyes closed, she’s completely subsumed in tentacle love.");
	processTime(25);
	clearMenu();
	addButton(0,"Next",justMitziTentabang3);
}

public function justMitziTentabang3():void
{
	clearMenu();
	showMitzi(true);
	author("Nonesuch");
	var tCount:int = (pc.wingCount + pc.cockTotal(GLOBAL.TYPE_TENTACLE));
	var x:int = pc.cockThatFits(mitzi.analCapacity());
	output("You don’t know how many times Mitzi orgasms - she does so to the slightest stimulation anyway - but the way her cunt and colon clench up around you, spurting femcum and lubricant around your girth, the way she writhes and wobbles around you, eventually drive your tentacles back into overdrive, constricting and thrashing with feral abandon.");
	output("\n\nSavage sounds are driven from your throat as you cum again, harder this time, [pc.cum] surging up those long, long prehensile members of yours into the gabilani’s delicious holes in juicy, decadent blasts." + (tCount > 6 ? " Your unused tentacles whip around wildly like out-of-control hoses, spraying the entire room in your [pc.cumFlavor] seed.":"") + " Mitzi groans with delight, her body reflexively tightening up around your thrusting cocks, greedily drinking deep of your [pc.cumVisc] cum until her bowels, womb and belly are utterly swollen with it, her holes drooling it outward in great, fat gobbets.");
	output("\n\nThe squat bimbo luxuriates in it when you loosen your grip on her wrists and thighs, your tentacles wilting into aching, gratified retreat, lowering her onto the bed and slithering slowly away. She caresses her swollen body, fingers drifting through the slicks of cum left on her flawless green flesh, splaying her thick thighs for you so you can admire your handiwork: her pussy and asshole both gaped wide open, [pc.cumColor] cum oozing thickly from them.");
	output("\n\n<i>“Mmm,”</i> she sighs, heart pupils throbbing happily away at you as she raises her fingers to her plump lips and sucks them clean. <i>“That was soooooo good, [pc.Master]. So much cum for Mitzi... she can barely move!”</i>");
	output("\n\nShe demonstrates this by rolling on the bed, her tits and swollen belly quivering as they hit the sheets, her short legs virtually the same length as the latter.");
	output("\n\n<i>“You’ll do it to Mitzi again soon, won’t you?”</i> she purrs. <i>“Let those tentacles of yours loose on her again? Hold her and fuck her and fill her with cum until it’s all she can think about?”</i> Facing you, she opens her mouth, closes her eyes and lets her long, wet tongue flop out adoringly, fingering her erect nipples as she does so");
	if(mitzi.canLactate()) output(", milk squirting this way and that");
	output(".");
	output("\n\nVoid... damn. [pc.EachCock] throbs painfully to the sight of that, and your tentacles start thickening again until, with an effort, you summon thoughts of snow, mathematics, your father’s face. Fucking Mitzi is always a delight, but doing it only ever makes you want to do it more.");
	pc.orgasm();
	pc.slowStatGain("libido",2);
	//Drain lust to 0, Slow Libido gain +2
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//More
public function mitziAndMoreTentaNightmareScene(tCount:int):void
{
	clearOutput();
	showMitzi(true);
	author("Nonesuch");
	//For simplicity’s sake, check for availability of Celise, Reaha and Sera in order. So if for instance Celise is on board, Reaha isn’t but Sera is, only Celise should show up. Therefore there are three variants: Celise, Celise and Reaha, Celise, Reaha and Sera.

	//Sera needs to be fully trained before available for this.
	//The final scene should require the PC has done a scene with 1-2 of them first. If the PC chooses [More] when they have all 3 on board, default to the Celise and Reaha scene first.

	//Intro
	output("Yes... bring as many of your pet sluts in here as you can, overwhelm them in your thicket of wild, prehensile cocks, treat yourself to a slathering, squealing banquet of soft, silky flesh and wet, eager holes. That is why you own them, is it not? That is why you grew so many thick, prehensile pricks, is it not? Liquid heat pulses up the lengths of your tentacles, whipping this way and that in a barely contained frenzy, making you light-headed with desire.");
	output("\n\nMitzi giggles nervously, heart pupils drinking in your expression.");
	output("\n\n<i>“You like that idea, don’t you [pc.Master]?”</i> she says, looping her finger on the [pc.skin] of your knee. <i>“If you like, I’ll go g- ooh. Ooooh...”</i> her mouth opens in delighted surprise as one of your thick tentacles slithers its way around and up her wide, soft thigh and butts its blunt head impatiently against her plump, wet, ever-ready cunt. You’re too turned on to let this juicy little cock-socket go anywhere, even for a minute.");
	output("\n\nShe clutches at your [pc.thigh] and cries out with delight, big butt bouncing as you push your thick, deft length into her, groaning quietly as you bathe the end of that burningly erect dick in the sweltering squeeze of gabilani puss. Incensed, your other tentacles lash out at her, wrapping themselves around her waist, tits and neck and bearing her back onto the bed, wriggling in delight.");
	output("\n\nYou collapse back onto the sheets, calling up the holo interface of the ship’s comms with shaking fingers, doing your best to keep ahold of yourself as you ping everyone that comes to mind in your ever-expanding lust. It’s a relief then to let your higher thinking go and busy yourself with the tentacle-bound Mitzi, mauling her " + (!mitzi.canLactate() ? "lovely, sensitive tits":"huge, milk-swollen tits") + " as one thick, writhing vine cock thrusts into the silky depths of her cunt, dripping plentiful pre and oily gabi-cum as it does. She’s intoxicated with it, adoring eyes fixed on you as she thrusts her jiggly form gleefully back onto the obscene phallus, powerful inner muscles squeezing at it.");
	processTime(10);
	pc.changeLust(5);
	clearMenu();
	//Progression. Have to do: Celise -> Celise+Reaha -> Celise+Reaha+Sera
	if(tCount >= 4 && celiseIsCrew() && seraIsCrew() && reahaIsCrew() && flags["SEXED_REAHA"] != undefined && flags["MITZI_CELISE_TENTAFUCK2"] != undefined && seraObedience() >= 80) addButton(0,"Next",celiseReahaAndSeraMitziTentacular);
	else if(tCount >= 3 && celiseIsCrew() && reahaIsCrew() && flags["SEXED_REAHA"] != undefined && flags["MITZI_CELISE_TENTAFUCK"] != undefined) addButton(0,"Next",mitziAndCeliseAndReaha);
	else addButton(0,"Next",moreWithJustCelise);
}

//Just Celise
public function moreWithJustCelise():void
{
	clearOutput();
	showBust(mitziBustString(true),celiseBustDisplay());
	author("Nonesuch");
	showName("MITZI\n& CELISE");
	output("Celise doesn’t need to open the door to your quarters: your pet goo simply exudes herself around the cracks, forming into a somewhat confused, green, booby mass at the foot of your bed.");
	output("\n\n<i>“You wanted to see me, [pc.Master]?”</i> she bubbles, staring at you railing the gabilani stuck in your writhing morass of cock tentacles. <i>“You seem... uh... busy.”</i>");
	output("\n\nYou return her stare greedily, lingering on her large, pert boobs and wet, pouting lips. Galotians are simple creatures at heart, and you know all you have to do is send two phallus vines writhing through the air towards her, stroke their blunt, pre-beading ends against the goo that constitutes her mouth and the cleft of her ass, for her to understand.");
	output("\n\n<i>“Ohh,”</i> she simpers, hungry eyes locking onto the one lingering near her mouth. You shudder in delight as she bestows a long, slurping lick on its sensitive end. <i>“" + (flags["MITZI_CELISE_TENTAFUCK"] == undefined ? "I didn’t know you’d grown these, [pc.Master]! They look tasty!":"Is it snakey fucky snack time again? You’re so wild [pc.Master]! So juicy!") + "”</i>");
	output("\n\nUnable to hold back any longer, you push the tentacle into her mouth, muffling her burbling and replacing it with the sloppy, energetic sounds of a goo girl milking a thick, dripping cock for all it is worth. The other curls around the hill of her ass, squeezing it, herding her onto your bed so you can really reach into her deep, thrusting into her tight, unresisting throat at the same time as the one wrapped around her butt finds her pussy and slips inside, stretching it wide as heavenly sensation courses down its long, throbbing length.");
	output("\n\nMitzi watches in delight, suspended in mid-air as you continue to pulverise her sopping cunt with obdurate thrusts of your feral vine prick as you spitroast Celise at the same time, the fantastic anatomy of the goo girl enabling you to go as deep as you like into her, her goo molding itself around and squeezing vast amounts of your tentacles.");
	output("\n\n<i>“Ohhhh, that’s it [pc.Master],”</i> Mitzi cries out, wrapping her pudgy hands around two of the ropey appendages that have her bound, rubbing them ecstatically. <i>“Give it to that slimy slut! I love watching you do that!”</i>");
	output("\n\nYou grunt, unable to form words in response. The sensation of fucking three wet holes at once, and the movement of Mitzi’s hot, loving hands on two others, throbs up your appendages, inhuman amounts of stimulation. It works the whole lot of them into an even greater frenzy, thrashing this way and that; they’re almost out of control now, fed by their own insatiable desires, though you can still feel everything that they do, rapturously pleasurable.");
	output("\n\nYour shaking hands descend to your [pc.groin], and almost mindlessly you " + (pc.hasCock() ? "jack your [pc.cock]":"schlick your [pc.vagina]") + ", mesmerized by the sensation of piledriving one cock into Mitzi whilst two others pinion Celise, coiling and thrusting into her warm, gooey depths. The wild vibrations work their way into them, and their wet squeals and moans bounce off the walls, femcum drooling then spraying around their stuffed, stretched cunts, orgasming repeatedly to getting fucked witless by your bestial anatomy.");
	processTime(20);
	pc.changeLust(30);
	clearMenu();
	addButton(0,"Next",moreWithJustCelise2);
}

//Just Celise
public function moreWithJustCelise2():void
{
	clearOutput();
	showBust(mitziBustString(true),celiseBustDisplay());
	author("Nonesuch");
	showName("MITZI\n& CELISE");
	var tCount:int = (pc.wingCount + pc.cockTotal(GLOBAL.TYPE_TENTACLE));
	output("You cum - you think. Once the heat in your tentacles reaches boiling point and it’s spurting gratuitously into the girls’ wet, thirsty holes it just becomes a stream, a constant orgasm that throbs up all " + num2Text(tCount) + " of your prehensile dicks, the ones not shoved deep into Mitzi and Celise spraying [pc.cum] all over them, you and the room. You groan in delight, one hand " + (pc.hasCock() ? "jerking your [pc.cock]":"deep in your [pc.vagina]") + ", the other grasping one of Mitzi’s tits, " + (!mitzi.canLactate() ? "squeezing the lovely softness there":"kneading the pressured liquid there and spraying even more sexual fluids all over the place") + ", the nexus to a network of obscene, drooling pleasure.");
	output("\n\nWhen you come down enough to regain some sense of yourself, it’s to find both of your concubines pillowing their soft. [pc.cum]-painted weight against your sides, their pouty lips stretched around the head of a tender, throbbing dick-vine each, coaxing out the last of your [pc.cumVisc]-seed. You groan raggedly as Celise kneads you intently, dragging another streamer of your seed into her mouth.");
	output("\n\n<i>“Mmm,”</i> she sighs, smacking her lips and looking up at you dopily. " + (pc.cumQ() < 25000 ? "She’s definitely bulkier than she was, stuffed with cum that she’s already metabolizing into fresh goo.":"She’s about twice the size she was in she came in her, belly and tits bulging, utterly stuffed with your cum. She’s going to be metabolizing that into fresh goo for days!") + " <i>“That was looooovely, [pc.Master]. ");
	if(flags["GIGACELISE"] == 1) output("Were you inspired?”</i> She titters as she wiggles her own tentacular appendages at you. <i>“");
	output("Are you done for now?”</i> She sighs, gratified, as she looks up at the forest of wilted, drooling cocks around her, and then slumps her cum-swollen bulk to the floor. <i>“I guess I’ll, um... I’ll...”</i> she’s already slipping into a comatose state before she’s entirely pooled onto the floor.");
	output("\n\n<i>“You should " + (!reahaIsCrew() ? "buy more sluts":"get more sluts in on the action") + ", [pc.Master],”</i> Mitzi whispers up at you, heart pupils flashing, stroking her own pet tentacle adoringly. <i>“I mean - if you want to horde these lovely cocks all for Mitzi, I’d be fine with that. Mmm, I would <b>love</b> that. But... don’t you want to fuck more? Stuff a whole room full of slaves with your tentacles? Cream a dozen holes at once?”</i> The cum-soaked, mind-broken gabilani drifts off, mouth open, carried away by this wonderful thought.");
	output("\n\nYou shudder, remembering the height of your libidinal rampage, that sensation of completely losing control of your writhing mass of tentacles. You felt so helpless, so mindless... so wonderful. You pensively consider your sex-soiled room and dozing, cum-soaked concubines, your many dicks throbbing, before reluctantly turning your mind to the clear-up operation." + (pc.cumQ() >= 25000 ? " You aren’t even going to be able to rely on your pet hoover, you stuffed her so full.":""));
	clearMenu();
	if(pc.libido() < 70) pc.libido(1);
	celise.loadInMouth(pc);
	mitzi.loadInMouth(pc);
	IncrementFlag("MITZI_CELISE_TENTAFUCK");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Celise and Reaha
public function mitziAndCeliseAndReaha():void
{
	clearOutput();
	showBust(mitziBustString(true),celiseBustDisplay(),reahaBustDisplay());
	showName("\nTENTA-BANG");
	author("Nonesuch");
	output("Celise doesn’t need to open the door to your quarters: your pet goo simply exudes herself around the cracks, forming into a somewhat confused, green, booby mass at the foot of your bed.");
	output("\n\n<i>“You wanted to see me, [pc.Master]?”</i> she bubbles, staring at you railing the gabilani encased in your writhing morass of cock tentacles. <i>“You seem... uh... busy.”</i>");
	output("\n\nYou return her stare greedily, lingering on her large, pert boobs and wet, pouting lips. Galotians are simple creatures at heart, and all you have to do is send two phallus vines writhing through the air towards her, stroke their blunt, pre-beading ends against the goo that constitutes her mouth and the cleft of her ass, for her to understand.");
	output("\n\n<i>“Ohh,”</i> she simpers, hungry eyes locking onto the one lingering near her mouth. You shudder in delight as she bestows a long, slurping lick on its sensitive end. <i>“" + (flags["MITZI_CELISE_TENTAFUCK"] == undefined ? "I didn’t know you’d grown these, [pc.Master]! They look tasty!":"Are we doing snakey fucky time again? You’re so wild when you’re like this, [pc.Master]! So juicy!") + "”</i>");
	output("\n\nUnable to hold back any longer, you push the tentacle into her mouth, muffling her burbling and replacing it with the sloppy, energetic sounds of a goo girl milking a thick, dripping cock for all it is worth. The other curls around the hill of a gooey buttock, squeezing it, herding her onto your bed so you can really reach into her deep, thrusting into her tight, unresisting throat at the same time as the one wrapped around her butt finds her pussy and slips inside, stretching it wide as heavenly sensation courses down its long, throbbing length.");
	output("\n\nYou’re almost lost in the decadent rhythm of spitroasting Celise, at the same time as you fuck the silky wringer of Mitzi’s pussy, when the door hisses open and Reaha steps in.");
	pc.cockChange();
	output("\n\n<i>“You pinged me, St- oh!”</i> The cow girl starts, mouth agape at the scene in front of her. You can see her blush from here as she ducks her head, laughing in embarrassment. <i>“Oh man. That’s so </i>gross<i>.”</i>");
	output("\n\n<i>“I got [pc.Master]’s tentacles out and once we got going we thought of you, moo-friend!”</i> cries Mitzi happily, little waves of motion carried up her soft body with every thrust of the prehensile dick she’s impaled on. She rolls her eyes up, lets her long tongue flop outwards, lets Reaha see exactly how much she’s enjoying it. <i>“Mmm... come closer. [pc.Master]’s got plenty more for you!”</i>");
	processTime(15);
	pc.changeLust(33);
	clearMenu();
	addButton(0,"Next",mitziAndCeliseAndReaha2);
}

public function mitziAndCeliseAndReaha2():void
{
	clearOutput();
	showBust(mitziBustString(true),reahaBustDisplay(true),celiseBustDisplay());
	showName("\nTENTA-BANG");
	author("Nonesuch");
	var tCount:int = (pc.wingCount + pc.cockTotal(GLOBAL.TYPE_TENTACLE));
	output("It’s not going to take much to get the subby, curvy, over-sensitive little moo to drop her inhibitions, you know. She obeys Mitzi’s instruction with a timid little twist of her face, stepping uncertainly forward until you can reach out with two more vine dicks, lay their smooth, beading heads on the plumpness of her breast and thigh. She sighs, closing her eyes as you bump one over a wide nipple, circling back and forth until it’s moist and erect, as you send the other curling around her wide, fat hip and bury it between her cleft.");
	output("\n\nAs you suspected - her loose, well-used pussy is already slick, wet to the sight of what you’re doing to Mitzi and Celise, widening as you use the lithe cock-limb to play with her, flicking at her clit, brushing over her entrance, growing more and more hungry for it with every second.");
	output("\n\n<i>“Ooh,”</i> she sighs. Face flush, she clambers onto the bed and grasps the thick tentacle brushing at her nipples, giggling a bit as she experimentally pumps it, making you groan lowly in response. <i>“These are, um, kinda fun, aren’t they?”</i>");
	output("\n\nLaughing eyes on you, she aims it downward, feeding it through the cleft of her huge, milky tits. What a <i>good</i> girl. Mitzi and Celise squeal and huff respectively as you pump into them harder, invigorated as Reaha squeezes her breasts together, providing that lucky tentacle with a long, warm, soft sleeve of flesh to fuck.");
	output("\n\nYou pull her into a rough kiss, molding your [pc.lips] and [pc.tongue] around hers as intense sensation pulses down your obscene menagerie of cocks, oiling Celise and Mitzi’s stretched tunnels with plentiful, oozing pre. You exhale into her mouth as, with some effort, you pull the tentacle playing with Reaha’s muff away, direct the femcum-lubricated appendage further up, exploring the generous crevice of the cow-whore’s ass. In your bestial, ravening state of mind, you’re in the mood for a new treat, a new flavor... and anyway, it’s such a delight to make her squeal.");
	output("\n\n<i>“Ohh!”</i> she cries out, breaking from your passionate snog when you push the blunt head of your prehensile dick against the delightful suppleness of her anus. <i>“Not tha-at. It’s sensitiiiive!”</i> Reaha wails, as you spear into the black star, sheerest lust pulsing back up your appendage as you sample her tight innards, sawing into her in tandem with the cock thrusting between the pillowy sponge of her boobs." + (tCount > 6 ? " You send another ravenous tentacle writhing between her thighs, coiling and flicking at her moist pussy, teasing her with penetration, enveloping her senses in pleasure as you penetrate her ass deep.":""));
	output("\n\n<i>“You like that, don’t you silly?”</i> says Mitzi wickedly. She’s fingering her breasts as she watches, " + (mitzi.canLactate() ? "instigating little spurts of milk here and there, ":"") + "suspended in mid-air as you pummel her pussy all the while. She rolls her eyes, drooling as she orgasms richly, that incredible network of muscles inside her squeezing silkily around your cock, forcing a little gout of [pc.cum] into her. <i>“Ohhh, you love that! You love [pc.Master] giving you a nice, hard ass-fucking!”</i>");
	output("\n\n<i>“Moooooooo,”</i> moans Reaha, on her hands and knees, big round butt in the air as you ream her tight black hole deep, the wonderful squeeze and texture of it driving you to titanic heights of lust. You thrust the prehensile cock using her tits even further up, plugging that wet, plush mouth of hers. She closes her eyes and lavishes it with licks and kisses, squeezing her breasts together all the while, deep now in submissive, tentacle-servicing lust.");
	output("\n\nThe sensation of filling so many holes at once - surrounded by soft, gorgeous flesh that squeals and moans and coos and slurps to your every movement - throbs up your appendages, inhuman amounts of stimulation. It works the whole lot of them into an even greater frenzy, thrashing this way and that; they’re out of control now, fed by their own insatiable desires, though you can still feel everything that they do, rapturously pleasurable.");
	output("\n\nYour shaking hands descend to your groin, and almost mindlessly you " + (pc.hasCock() ? "jack your [pc.cock]":"schlick your [pc.vagina]") + ", mesmerized by the sensation of piledriving one cock into Mitzi, whilst two others coil and thrust into the warm, gooey depths of Celise, and " + (tCount > 6 ? "two others busy themselves with Reaha":"three others make Reaha airtight") + ". The wild vibrations work their way into them, and their wet cries and moans bounce off the walls, femcum drooling then spraying around their stuffed, stretched cunts, orgasming repeatedly to getting fucked witless by your bestial anatomy.");
	processTime(30);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",mitziAndCeliseAndReaha3);
}

public function mitziAndCeliseAndReaha3():void
{
	clearOutput();
	showBust(mitziBustString(true),reahaBustDisplay(true),celiseBustDisplay());
	showName("\nTENTA-BANG");
	author("Nonesuch");
	var tCount:int = (pc.wingCount + pc.cockTotal(GLOBAL.TYPE_TENTACLE));
	output("You cum - you think. Once the heat in your tentacles reaches boiling point and it’s spurting gratuitously into the girls’ wet, thirsty holes it just becomes a stream, a constant orgasm that throbs up all " + num2Text(tCount) + " of your prehensile dicks, the ones not shoved deep into Mitzi, Reaha and Celise spraying [pc.cum] all over them, you and the room. You groan in delight, one hand " + (pc.hasCock() ? "jerking your [pc.cock]":"deep in your [pc.vagina]") + ", the other grasping one of Mitzi’s tits, " + (!mitzi.canLactate() ? "squeezing the lovely softness there":"kneading the pressured liquid there and spraying even more sexual fluids all over the place") + ", the nexus to a network of obscene, drooling pleasure.");
	output("\n\nWhen you come down enough to regain some sense of yourself, it’s to find both of your concubines pillowing their soft. [pc.cum]-painted weight against your sides, their pouty lips stretched around the head of a tender, throbbing dick-vine each, coaxing out the last of your [pc.cumVisc]-seed. You groan raggedly as Celise kneads you intently, dragging another streamer of your seed into her mouth.");
	output("\n\n<i>“Mmm,”</i> she sighs, smacking her lips and looking up at you dopily. ");
	if(pc.cumQ() < 25000) output("The galotian definitely bulkier than she was, stuffed with cum that she’s already metabolizing into fresh goo.");
	else output("She’s about twice the size she was in she came in her, belly and tits bulging, utterly stuffed with your cum. She’s going to be metabolizing that into fresh goo for days!");
	output(" <i>“That was looooovely, [pc.Master]. ");
	if(flags["GIGACELISE"] == 1) output("Were you inspired?”</i> She titters as she wiggles her own tentacular appendages at you. <i>“");
	output("Are you done for now?”</i> She sighs, gratified, as she looks up at the forest of wilted, drooling cocks around her, and then slumps her cum-swollen bulk to the floor. <i>“I guess I’ll, um... I’ll...”</i> she’s already slipping into a comatose state before she’s entirely gooped onto the floor.");
	output("\n\n<i>“Why do you love fucking my ass so much?”</i> Reaha asks, dilated pupils turning up to you. <i>“It’s gross.”</i> She waves an exasperated hand at the prehensile dicks oozing the last of their [pc.cumFlavor] loads onto her pale skin and red hair. <i>“<b>You’re</b> gross.”</i> She smiles shyly, rolling over, the vastness of her boobs swaying, thoroughly fucked. <i>“...I like it.”</i>");
	output("\n\n<i>“You should " + ((!seraIsCrew() || seraObedience() < 80) ? "buy more sluts":"get more sluts in on the action") + ", [pc.Master],”</i> Mitzi whispers up at you, heart pupils flashing, stroking her own pet tentacle adoringly. <i>“I mean - if you want to horde these lovely cocks all for Mitzi, I’d be fine with that. Mmm, I would <b>love</b> that. But... don’t you want to fuck more? Stuff a whole room full of slaves with your tentacles? Cream a dozen holes at once?”</i> The cum-soaked, mind-broken gabilani drifts off, mouth open, carried away by this wonderful thought.");
	output("\n\nYou shudder, remembering the height of your libidinal rampage, that sensation of completely losing control of your writhing mass of tentacles. You felt so helpless, so mindless... so wonderful. You pensively consider your sex-soiled room and dozing, cum-soaked concubines, your many dicks throbbing, reluctantly turning your mind to the clear-up operation." + (pc.cumQ() >= 25 ? " You aren’t even going to be able to rely on your pet hoover, you stuffed her so full.":""));
	processTime(35);
	if(pc.libido() < 70) pc.libido(1);
	pc.orgasm();
	// +1 Libido if Libido < 70
	celise.loadInMouth(pc);
	mitzi.loadInMouth(pc);
	reaha.loadInAss(pc);
	IncrementFlag("MITZI_CELISE_TENTAFUCK2");
	//IncrementFlag("MITZI_CELISE_TENTAFUCK");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Celise, Reaha and Sera
//Requirements: PC has done one of the other scenes already, at least 6 tentacle dicks
public function celiseReahaAndSeraMitziTentacular():void
{
	clearOutput();
	showName("\nTENTA-BANG");
	author("Nonesuch");
	showBust(mitziBustString(true),reahaBustDisplay(true),celiseBustDisplay());

	if(flags["MITZI_SERA_TENTASOME"] != undefined) output("You remember the last time you did this - how out of hand it got, how incapable you were of restraining your tentacular lusts once things really got going - but you don’t care. The sinuous, pent-up lust in your prehensile dicks, throbbing right through all of them as you pump one into the delightful, twisting plushness of Mitzi’s twat, conquers all. Let it overwhelm you. Surrendering to the hydra monstrousness of your own form is bliss.\n\n");
	output("As ever, Celise is the first who responds to your summonings, exuding into your room through the cracks. Her eyes light up when she sees what you’re doing.");
	output("\n\n<i>“Yaaaay!”</i> she cheers, boobs bouncing as she claps her hands together, excitedly oozing towards the bed. <i>“Wiggly sexy [pc.Master] meal time!”</i>");
	output("\n\nYou send two dick vines writhing through the air towards her, making her giggle and gasp as they impatiently brush and slap against her slimy cheeks and buttocks. You’re deep inside her, the heavenly sensation of fucking her oozing pussy and pouting mouth simultaneously, when the door hisses open and Reaha steps in.");
	output("\n\n<i>“Oh noooo,”</i> she groans, cheeks turning crimson. <i>“Not this again.”</i>");
	output("\n\n<i>“You love it, moo-moo,”</i> croons Mitzi, little waves of motion carried up her soft body with every thrust of the prehensile dick she’s impaled on. She rolls her eyes up, lets her slathering tongue flop outwards, lets Reaha see exactly how much she’s enjoying it. <i>“Mmm... you know you dooooo, I’ve seen you! Come closer. Let [pc.Master] feel you, let [pc.Master] fill you, it feels sooooo good!”</i>");
	output("\n\nThe curvy cow girl’s arousal is reluctant: the way her large nipples stiffen, the way heat is drawn to her crotch as she watches, it runs against the attitude she wishes to strike against your writhing, oozing tentacle dicks. That just makes it all the more hotter to tease her when she does step a little bit closer. To run those smooth, beading heads over the plumpness of her breasts and thighs and lips, to brush over the ready wetness of her loose cunt, to flick at the nubby little button inside.");
	output("\n\nWithin a few moments she’s on the bed, squeezing her lovely plush boobs together so one prehensile cock can thrust itself between them, whilst another ungulates between her thighs, gently penetrating her sex. When you feel it’s nice and ready, with some effort you pull that one away and upwards between her big, jiggling buttocks, using the femcum it’s slathered in to spear into her deliciously tight asshole.");
	output("\n\n<i>“Uh. Uhh!”</i> the redhead gasps, eyes and teeth clenched shut, fingers digging into the deep softness of her breasts, milk beading at the teats. <i>“Yeah! Fuck my ass! M-make me take it! Mmmmooooo!”</i>");
	output("\n\nGood girl.");
	processTime(25);
	pc.changeLust(150);
	clearMenu();
	addButton(0,"Next",celiseReahaAndSeraMitziTentacular2);
}

public function celiseReahaAndSeraMitziTentacular2():void
{
	clearOutput();
	showName("\nTENTA-BANG");
	author("Nonesuch");
	showBust(mitziBustString(true),seraBustDisplay(true),reahaBustDisplay(true),celiseBustDisplay());
	var tCount:int = (pc.cockTotal(GLOBAL.TYPE_TENTACLE) + pc.wingCount);
	output("It’s a hell of a scene for the final participant to come in and behold. She stands there, hand on hip and almost blank-faced, yellow, reptilian eyes taking in the moaning Mitzi in mid-air, Celise pushed against one [pc.thigh] and Reaha the other, all of them mired in the coiling, writhing mass of thick, seed-swollen cocks emanating from your back.");
	if(flags["MITZI_SERA_TENTASOME"] == undefined) output("\n\n<i>“Huh,”</i> says Sera. <i>“I always wondered if you ever used those things.”</i>");
	else output("\n\n<i>“You really can’t help yourself, can you?”</i> says Sera, with an arch, knowing raise of her eyebrow. <i>“You love it. You love being a disgusting, out-of-control beast.”</i>");
	output("\n\nYou’re incapable of replying. Drenched in sweat, Inhuman amounts of lust pulsing through your livid body, there’s too much sensation and stimulation for you to properly handle. You simply stare at your demon-morph slave, drinking in her delicious curves, her spotless, soft [sera.skinColor] skin, ");
	if(sera.hasCock()) output("her long, thick cock");
	else output("the cleft of her pussy");
	output(". Your tentacles writhe frantically, making the other girls cry out in soaked delight. You - <i>they</i> want more. More!");
	output("\n\nSera smirks as she sashays over to you on her natural high heels. One tentacle cock rears out towards her, acting entirely on its own instincts; casually she catches it, grips it below the blunt, smooth head, strokes it as if it were a wayward pet.");
	output("\n\n<i>“You know,”</i> she purrs, planting her soft round butt down on your [pc.thighs], spade tail flicking against your [pc.feet], <i>“I once thought about modding myself some dick tentacles. Decided against it. There’s lots of stuff on the extranet warning that growing too many makes them get...out of hand. If you get too stimulated.”</i>");
	output("\n\nThe way she’s rubbing the one in her hand... you growl animalistically, and shoot another drooling, ready vine-dick at her. She catches that one, too. Holding two now, swelling and throbbing impatiently in her grasp, Sera grins at you toothily, fluorescent eyes alive with glee.");
	output("\n\n<i>“You haven’t gotten too stimulated, have you?”</i> she asks. You are powerless to stop her, indeed your [pc.thighs] rise automatically to meet her, as she ");
	var cIdx:int = pc.cockThatFits(sera.vaginalCapacity(0));
	if(cIdx >= 0)
	{
		output("takes hold of your [pc.cock " + cIdx + "] and positions it against her mound, slowly pushing it inside her tight, long pussy.");
		pc.cockChange();
	}
	else if(sera.hasCock() && pc.hasVagina()) 
	{
		output("takes hold of her own cock and positions it against your [pc.vagina], making your innards cry out with fresh pleasure as she sinks herself in, filling you up.");
		pc.cuntChange(0,sera.cockVolume(0));
	}
	else output("brings one of the tentacles she’s holding downwards and push it against her mound. Eagerly it slithers through her grasp, pushing inside her tight, long pussy.");
	output(" <i>“[pc.Master]?”</i>");

	output("\n\nThe succubus ");
	if(cIdx < 0 && sera.hasCock() && pc.hasVagina()) output("fucks you firmly with her foot long dick");
	else output("rides you briskly");
	output(", holding your [pc.chest] to her own soft, inhumanly pert breasts, as all the while your tentacles pump themselves wildly into Celise, Mitzi and Reaha. They are totally beyond your control now; they fuck whichever hole that takes their fancy with feral vigor, their shuddering, slithering virility driving the three of them wild, their shouts and squeals and soft, writhing forms only driving your carnality to maddening heights.");
	output("\n\nYou orgasm, a wave of [pc.cum] riding up those long, ropey forms and pounding into pussies, mouths and butts with ecstatic abandon... and the tentacles just go right on fucking them wildly, spraying [pc.cumVisc], [pc.cumColor] everywhere. You whine as Sera’s claws bite into your shoulders, pain to go along with the monstrous pleasure.");
	output("\n\n<i>“Aww, poor [pc.Master],”</i> she sneers, ");
	if(cIdx >= 0) output("wringing your [pc.cock " + cIdx + "]");
	else if(pc.hasVagina() && sera.hasCock()) 
	{
		output("thrusting exuberantly into your [pc.vagina]");
		pc.cuntChange(0,sera.cockVolume(0));
	}
	else output("wringing your tentacle-cock");
	output(" all the while. <i>“Lost in a world of fucking [pc.heShe] always dreamed of! Yet... you’re still not enjoying enjoying your full potential.”</i>");
	output("\n\nShe’s still cradling one of your devilish tentacles, and now she cranes it towards your face. You heave for breath, soaked in sweat, as it bobs through the air towards your [pc.lips] of its own accord. Oh Void, you can <i>feel</i> it grow excited as it senses the wet opening...");
	output("\n\n<i>“Yeeeeesssssss!”</i> squeals Mitzi, somewhere near your ear, getting her ass and pussy penetrated simultaneously as the bodies of the tentacles using her suspend her jiggling form in mid-air. Her breasts pillow around your neck. <i>“Take it, [pc.Master]! You’re so yummy! It’s bliiissssss!”</i>");
	output("\n\nThe blunt, musky tentacle shoves into your mouth, your own groan muffled by its incredibly thick, forceful propulsion, immediately pistoning in and out of your orifice. You can feel both ends of it, the hot, wet silkiness of your [pc.tongue] and [pc.lips] around the smooth, musky bulb stretching you wide open and you don’t care, you <i>don’t care</i>, Void it feels so good to fuck your own face like this awash on a sea of writhing ecstasy, sinking below the waves... the thing fills your throat, and <i>fuck</i> you’re so wonderfully wet and tight in there, you welcome it by hollowing your cheeks around its stern, thick stem, slurping and gasping as it lets you breath only to ooze [pc.cum] all over your [pc.lips] and chin and push powerfully into your throat again.");
	if(tCount >= 9) 
	{
		output("\n\nDimly, you feel another of your rebellious, snake-like members worm its way beneath your quivering form; you know what it’s about, and you couldn’t stop it even if you wanted to. Sera laughs throatily when she sees, and tips you onto your back with a violent shove of her boobies, allowing the thing easy access to your ");
		if(cIdx < 0 && sera.hasCock() && pc.hasVagina())
		{
			output("[pc.asshole].");
		}
		else output("[pc.vagOrAss].");
		output("\n\nYou moan around your gobstopper with unfettered desire as the thing thrusts its blunt, slick head into you, easily parting your " + (!pc.hasVagina() ? "asshole":"lips") + " and filling you with another hot, undulating cock intent on using every inch of you. More! More! <b>They</b> want <b>more!</b>");
		//make sure Sera's not using it too
		if(cIdx < 0 && sera.hasCock() && pc.hasVagina()) pc.buttChange(90);
		else if(pc.hasVagina()) pc.cuntChange(0,90);
		else pc.buttChange(90);
	}
	output("\n\n<i>“Yeah,”</i> snarls Sera, ");
	if(cIdx < 0 && pc.hasVagina() && sera.hasCock()) output("digging into your [pc.vagina] vociferously with her own thick, hot member, soft hips clapping against yours");
	else output("clenching down and jerking your " + (cIdx >= 0 ? ("[pc.cock " + cIdx + "]"):"prehensile dick") + " viciously hard in her demonic twat");
	output(", color high in her cheeks now. <i>“You love that, don’t you? You’re just as much a slave as we are! And you know what you’ve got to do.”</i>");
	output("\n\nYou close your eyes. An orgasm is coming, a multiple one, a quadruple, quintuple, sextuple one, and you wonder if it might not just send you insane with pleasure, blot out all rational thought for good. Sera’s croon washes into your ears as you feel the pressure trembling upwards.");
	output("\n\n<i>“You’re gonna find that fortune of yours, and you’re gonna use it to build yourself a vault, stocked with food and water to last the rest of your life - and all of these sluts, and more besides. And porn, and drugs, and toys like you can’t even imagine. And you’re going to spend all day every day fucking, prisoner to those lovely tentacles that make you feel so good, a room of horny, needy slaves only ever enough to keep you satiated for a few minutes. I’ll rotate ‘em, keep ‘em in line, look after you, don’t worry - because I’ll be recording the whole thing! Think of the viewing figures! I’ll be a fucking millionaire.”</i>");
	output("\n\nYou orgasm, a brilliant fountain of cum shooting out into six different silky, kneading holes at once, one of them straight down your throat, making you taste what you’re delivering to three eager, feminine receptacles. Limbs writhing insensate and emitting a muffled scream to the unbearable ecstasy of it, you black out.");
	processTime(35);
	mitzi.loadInMouth(pc);
	reaha.loadInAss(pc);
	celise.loadInMouth(pc);
	if(cIdx >= 0) sera.loadInCunt(pc,0);
	else if(pc.hasVagina() && sera.hasCock()) 
	{
		pc.loadInCunt(sera,0);
	}
	else if(pc.hasVagina()) pc.loadInCunt(pc,0);
	else pc.loadInAss(pc);
	clearMenu();
	addButton(0,"Next",tooManyTentacles,cIdx);
}

public function tooManyTentacles(cIdx:int):void
{
	clearOutput();
	showName("\nTENTA-BANG");
	author("Nonesuch");
	showBust(mitziBustString(true),seraBustDisplay(true),reahaBustDisplay(true),celiseBustDisplay());
	//Reset lust, +4 hours
	output("You come to very slowly. Your unconsciousness was shot through with pulsing lust and flickering sensation, and you get the impression that the festivities continued long after you were rendered insensate, your horny harem coaxing your irrepressible nest of dick tentacles on to ravish them all the more... so that even when asleep you were trapped in a dreamscape of alien lust. They now lie all around you, Mitzi, Celise and Reaha dozing peacefully, copious amounts of [pc.cum] oozing thickly from between their legs.");
	output("\n\nSera is lying beside you face-on, gently stroking one of your limp, oozing tentacles and cooing gently. It really <i>is</i> her treasured pet. You exhale raggedly as the whole wretched lot of them throb at the same time, feebly rising then sagging again. Fuck, you ache.");
	output("\n\n<i>“Aww. You feeling a little rough, [pc.Master]?”</i> the [sera.skinColor]-skinned succubus asks softly, eyes half-lidded. A memory comes back to you, of " + (cIdx >= 0 ? "how wonderfully tight her pussy felt":"how wonderful her cock felt inside of you") + ", and you close your eyes as another hard, dry ache washes outwards. She places a soft, loving kiss on the dome of her pet tentacle, lasciviously licking away the dripping semen.");
	output("\n\n<i>“Well, don’t worry,”</i> she says, displaying her teeth to you. <i>“You know I’ll look after you, right? Always.”</i>");
	output("\n\nYou watch her leave, butt gently bouncing, tail swishing. ");
	if(flags["MITZI_SERA_TENTASOME"] == undefined) 
	{
		output("The whole experience has left you exhausted and fraught, the rational part of you certain you should never try fucking so many of your harem at once again... but another, deeper part of you remembers how good it was. To let go. To become a depraved, sexual monster.");
		output("\n\nYou push down on it hard, summoning up cool thoughts like how you’re going to clear up this massive mess you’ve created, and where the nearest shower is at.");
	}
	else
	{
		output("\n\nWhy do you keep doing this to yourself? Because it feels wonderful. You love losing all control, letting your bestial anatomy go wild on your lovely collection of sluts. Why not just admit it? You grunt as you imagine doing it all over again. Maybe take on a couple more slaves, invest in half a dozen more tentacles. Even though it smarts now... each time, it becomes a little bit easier to do it some more.");
	}
	//Covered in cum, load in mouth, loud in ass/vag if Sera/tentacle dicked PC, +2-3 Libido
	processTime(4*60+rand(15));
	IncrementFlag("MITZI_SERA_TENTASOME");
	mitzi.loadInMouth(pc);
	reaha.loadInAss(pc);
	celise.loadInMouth(pc);
	if(cIdx >= 0) sera.loadInCunt(pc,0);
	else if(pc.hasVagina() && sera.hasCock()) 
	{
		pc.loadInCunt(sera,0);
	}
	else if(pc.hasVagina()) pc.loadInCunt(pc,0);
	else pc.loadInAss(pc);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Mitzi is wearing a slutted up version of Mercy's "Pink" charity skin from overwatch.
public function mitziVDayFun():void
{
	clearOutput();
	showMitziVD();
	author("Fenoxo");
	output("Mitzi appears from behind a bulkhead with the sort of silent swiftness that you would expect from a non-corporeal life form or highly trained stealth operative. Her pigtails bob wildly, wrapped in an array of pink ribbons - to say nothing of the form-fitting, heart-themed dress she’s purloined from a trashy slutwear shop. In her hands is a marvel of modern toymaking technology: a BERF bow, complete with an oversized pink dart inexpertly shaved down into the shape of a phallus.");
	output("\n\n<i>“Surprise! Mitzi’s gonna like, spread the love! Just like that cutie Cupid guy!”</i>");
	output("\n\nWhen the tarted-up goblin draws the string back, the white foam wings she’s wearing wobble distractingly, throwing her aim off to the side and giving you a moment to take a closer look before she can correct.");
	output("\n\nThe dart she’s aiming at you isn’t just carved to look like it’s a dick - it’s hollowed out such that urethral gap is slotted with a loaded medipin, filled with who knows what kind of outlandish drug. Fortunately for you, Mitzi’s not exactly a crack shot. You can easily ruin whatever Valentine’s day fun she has planned by stepping aside, assuming you don’t want to roll the dice on her party drugs.");
	processTime(3);
	flags["MITZI_VDAY_LAST_YEAR_ENCOUNTERED"] = getRealtimeYear();
	clearMenu();
	addButton(1,"Avoid",avoidMitzisLoveDart);
	addButton(0,"Let Her",takeTheHitMitzi);
}

//Avoid
public function avoidMitzisLoveDart():void
{
	clearOutput();
	showMitziVD();
	author("Fenoxo");
	output("Mitzi’s tongue slips out over one pillowy, gloss-lacquered lip as she tries to aim, closing her left eye, then her right, then finally remembering to open the left one back up and aim down the sights. She giggles to herself a moment before she fires - all the warning you need to step to the side and dodge the clumsy (if relatively high-velocity) dart.");
	output("\n\nPinging rings through the corridors of your ship as the needle-tipped foam-cock breaks itself open on ship-grade titanium, spilling its potent payload into the dart’s porous structure. Nobody’ll be taking that drug anytime soon.");
	output("\n\n<i>“Phooey!”</i> The pouting goblin attempts to shoulder her bow, slamming it into her wing in the process. The cheap costume prop snaps clean in half from the force of the impact, but Mitzi blithely finishes slipping the toy weapon into place across her torso. It comes to rest snugly between her tits. <i>“Nobody escapes Cupid’s love for like... for like forever!”</i> She turns around and sprints toward the closest corner, bare feet slapping on the deck. Her too-plush ass wobbles hypnotically with her footfalls, slamming into the far wall hard enough to ricochet the rest of the way out of sight. One final screech whines, <i>“Scrooge!”</i>");
	output("\n\nDoes she even know what holiday it is? <b>You doubt you’ll see this particular bit of mischievousness again this year.</b>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//TAKE THE HIT, BOI
public function takeTheHitMitzi():void
{
	clearOutput();
	showMitziVD();
	author("Fenoxo");
	output("Instead of dodging, you take the hit square on your chest" + (!pc.isChestExposed() ? ", even going so far as to open your [pc.chestCover] to ensure that her fun little addition will get to deliver its tainted payload":"") + ". There’s no pain, not really. The medipen’s built-in anesthetic does its job - that or the stinging impact masks whatever microscopic irritation the payload could possibly deliver.");
	//notes:
	//"Cupid’s Kiss" drug
	//Lovey-dovey drug. Enhanced tactile response. Reduced orgasm threshold (quick cums), and faster refractory.
	//+30% tease damage taken
	//+300% rare drop chance.
	//Lasts 1 month in game.
	output("\n\nMitzi giggles and drops her bow, clapping in gleeful abandon. <i>“Yaysie! Now we can do like, a buncha lovey dovey love-love stuff, [pc.Master]!”</i> She dances forward, wings and tits bouncing alike, all but throwing herself ");
	if(pc.tallness < 5*12) output("into your arms");
	else if(pc.tallness < 6*12) output("into a [pc.belly]-squeezing hug");
	else output("around your [pc.leg]");
	output(". <i>“Cause the dart had a seeeecreeeet! Mitzi snuck some Cupid’s Kiss in there, cause it’s like... the-themat... uhm. It matches the holiday!”</i>");
	output("\n\nPlacing your hand on the adorable little fuck-slut’s head (right between her ponytails), you push her back so you can look her in the face. You knew something like this was going to happen, but maybe you can get the sweetly smiling goblin to clue you in on just what her little surprise is going to do besides some sort of vague “love-love.” Working your jaw for a second, you" + (pc.tallness >= 5*12 ? " lean down to her eye level":"") + " and open your mouth to say something when you’re distracted by the striking, heart-shaped patterns in Mitzi’s eyes.");
	output("\n\nYou’ve seen her eyes lots of times before (usually when she’s on her knees), so you’re had plenty of time to acclimate yourself to their cosmetically-pleasing shape. Yet... this close, there’s something almost spellbindingly beautiful about gazing into her eyes - the windows to the soul - and being presented with the near-universal shape for affection and intimacy. Mitzi’s smile grows the longer you stare at her, but there’s no reason to look anywhere else. You have a question for her, so you may as well continue to gaze longing...");
	output("\n\n<i>“What’s that stuff gonna do to me?”</i> There! With that said, you can lean a little closer admire her flawless emerald skin, the button shape of her cute little nose, and the expansive, shining curves of her curling lips.");
	output("\n\nMitzi grabs the back of your head and pulls you into a searingly hot kiss. Her pillowy lips part on contact, and yours come along for the ride, unresisting when she guides you into full-on, open-mouth french. Her tongue wiggles and writhes against your own. She shifts and twists to suckle on your lower lip before widening her maw to once more orally entangle you, nearly tying your [pc.tongue] in a knot around her own.");
	output("\n\nYour questions flee in the face of such excitement, and you allow your eyes to drift closed. Grabbing her by the ass, sinking your fingers deep into the greenskin’s bubbly tush, you pull Mitzi tighter. No longer self-conscious about it in the slightest, you simply enjoy the moment, savoring the texture of your pint-sized tramp’s slick, silky lips on your own. You drink in the fragrant, floral aroma of her latest bodyspray with every breath, savoring the raw, musky undercurrent of soaked snatch that permeates everything in a five foot radius around Mitzi.");
	output("\n\nIt’s a surprise how breathless you are when Mitzi breaks away - how breathless ");
	if(pc.isHerm()) output("and ruinously engorged you are. Your crotch is sticky with lust, and absolutely rigid with desire.");
	else if(pc.hasCock()) output("and how hard you are.");
	else output("and how soaked you are.");
	if(!pc.isCrotchExposed()) output(" Equally bizarre is how your clothing removed itself to better bare your trembling genitalia.");
	output(" That surprise fades when you look back at Mitzi - adorable little Mitzi, smiling impishly, and realize that she’s just as horny as you. Her clothes are long gone. Her tits are as creamy and pillowy as ever, the nipples jutting out at you as if to say, <i>“This is what makes me horny. This [pc.guyGirl] over here,”</i> and you appreciate that about them.");
	output("\n\nThe bite-sized strumpet titters while you stare at her tits, wiggling back and forth to lend them a pleasing sort of sway. <i>“So like, don’t worry about it, [pc.Master]! It’s just a drug that makes it really easy to feel love, and share love, and cum super easy. So you can just like, look at Mitzi’s titties if that’s what you want to do.”</i> She bites her lip and arches her back to better present them. <i>“It’s super dooper cute when you do!”</i>");
	output("\n\n<i>“Uh-huh.”</i> You suppose there’s nothing bad about feeling a bit more love, especially while you’ve got a naked gabilani contorting in front of you, swaying a pair of heavenly breasts back and forth entirely for your amusement. Her nipples, slightly crinkled from arousal, shine like two beacons, presented exclusively for your eyes to follow. You wrinkle your brow with the effort of drudging up another concern. It’s quite difficult when you’ve got the galaxy’s sexiest goblin prancing around in front of you, doing everything she can to treat you to a sexy evening. <i>“Gotta be a downside...”</i>");
	output("\n\nLifting your hand, the pleased greenskin places it atop one of her mounds, stunning you with the warmth and supple softness of it. You marvel at how your fingers sink in, at the faint thrumming of her heartbeat through a pair of tits big enough to smother a pornstar to death in. Of course, Mitzi isn’t bothered by your touch at all. She holds you by the wrist and leads you toward the bedroom, the spaded tip of her tail tickling your chin while she talks. <i>“Umm, it lasts a long time or something? And something about taint too. Mitzi remembers that, but she played with her taint when she took it, and like, nothing happened!”</i>");
	processTime(30);
	pc.changeLust(50);
	pc.taint(3);
	clearMenu();
	addButton(0,"Next",mitziVDayFun2);
}

public function mitziVDayFun2():void
{
	clearOutput();
	showMitziVD();
	author("Fenoxo");
	output("You tumble into the bed with Mitzi in your arms. You can deal with the side effects later. If “Cupid’s Kiss” has some sort of nefarious come-down, there’s nothing you can do about it now. You might as well keep playing with the goblin-girl’s luscious tits, stroking and petting her. She’s just so void-damned <b>soft</b>. Mitzi was made to be held, and touch, and... well, fucked. She’s never presented herself as anything else. The squishy little goblin may utterly sex-addicted in all the best and worst ways, but she’s always been honest about it.");
	output("\n\nIn a way, you admire that about her.");
	output("\n\n<i>“What’s [pc.Master] thinking?”</i> Mitzi moans, leaning up to kiss your chin. Her hand slides across your [pc.belly] toward your crotch without quite touching down, fluttering and caressing your inner thighs until you feel ");
	if(pc.hasCock()) output("harder than a capital ship’s armor plating");
	else if(pc.wettestVaginalWetness() < 3) output("like you’re going to leave your sheets reeking of cunt");
	else output("like you’re about to transform the bed into a pool of puddled cunt");
	output(".");
	output("\n\nYou answer with a wave of honesty of your own, too turned for anything besides frank praise - or perhaps too drugged. It doesn’t matter. You let her know about how hard it is to think with her tits in your hands, pausing to assemble a few words that fail to describe how wonderful they feel and how beautiful they look when they’re straining the top of a dress or bra... or anything really. You tell her how you enjoy her straightforward approach to sex, and inform her how delighted you are to discover her prancing around in something new. Most of all, you let her know that you love how she’s always trying her hardest to make you ");
	if(pc.hasCock()) output("hard and happy");
	else output("horny and happy");
	output(".");
	output("\n\n<i>“Really?”</i> Mitzi coos, fingers ");
	if(pc.hasCock()) output("wrapping around " + (pc.hasCocks() ? "one":"your") + " cock");
	else output("sinking into " + (pc.hasVaginas() ? "one":"your") + " slit");
	output(". She leans back to stare at you, captivating your gaze in her wide, earnest eyes. They shine, a little watery with emotion. <i>“Because Mitzi’s been thinking all day about how much she loves you, [pc.Master]. She’s been strumming her dumb, horny cunt thinking about how you saved her, and took her onboard, and put up with her being a broken nympho-slut.”</i> She tilts her head and bats those lengthy eyelashes of hers up and down a few times to blink away newly forming tears. <i>“Mitzi loves you.”</i>");
	output("\n\nYou answer without conscious thought: <i>“I love you too, Mitzi.”</i> There’s no need to examine it or consider your response in the slightest. <i>“" + (silly ? "You’re my favorite little cock-socket on this citadel.":"You’re the best little fuck-slut I could ever hope for.") + " You’re loyal and even though you’ve been through a lot, you’re always trying to help me out, and...”</i> You gasp in sudden sexual pleasure. ");
	if(pc.hasCock()) output("Mitzi’s fingers are happily stroking your prick with long, gentle strokes, her thumb sliding back and forth against the frenulum whenever she nears the tip. <i>“...You give the best fucking handjobs!”</i>");
	else output("Mitzi’s fingers are dancing happily around your clitoral hood in a way that’s making it difficult to string words together. <i>“...You know just how to finger a pussy!”</i>");

	output("\n\n<i>“Oh!”</i> Mitzi blushes in vibrant pleasure, but she never stops seeing to yours. <i>“Thank you, [pc.Master]!”</i> She leans up to kiss you once more, this time in a gentler embrace. It’s all warmth and salivating slickness, the plush pillows of Mitzi’s lips electric against your skin. For once, you’re kissing not out of sexual passion but out of near-romantic ardor, and the pure delight of it all is enough to make your " + (pc.hasCock() ? "[pc.cock] throb harder in your petite lover’s grip":"[pc.vagina] clench in a tighter grip around your petite lover’s fingers") + ". <i>“Mitzi loves you so much, [pc.Master].”</i> She nuzzles into your neck. <i>“That’s why she did this. She wanted you to know... and she wanted to know if [pc.Master]... if [pc.Master] loved her too.”</i>");
	output("\n\nThe friction between your thighs intensifies, and with it your desire for more of the enchanting green girl. You pull her up so that you can kiss at her neck. One of your hands dips down to handle her curvy asscheek and marvel at how it’s every bit as curvaceous and soft as the breast above. You worship Mitzi’s body with your hands while your tongue bathes her skin in licks, and she pays it all back in skillful, " + (pc.hasCock() ? "cock":"cunt") + "-pleasing strokes.");
	output("\n\nYou’re almost surprised when you orgasm for the pretty little " + (pc.hasCock() ? "cock":"cunt") + "-junkie, soaking her fingers in " + (pc.hasCock() ? "[pc.cum]":"[pc.girlCum]"));
	var amount:Number = 0;
	if(pc.hasCock()) amount = pc.cumQ();
	else amount = pc.girlCumQ();
	if(amount > 100) output(", and then the bed");
	if(amount > 10000) output("... and floor");
	output(". She keeps working your " + (pc.hasCock() ? "throbbing length":"blissfully oozing snatch") + " throughout, listening to your cries of pleasure with a pleased smile, and when you finish, she keeps going. You’re surprised to find your spent flesh still tingling with pleasure, all but aching for more.");
	output("\n\n<i>“I love you, [pc.Master],”</i> Mitzi purrs. <i>“Now let’s snuggle up and give you lots more orgasms, kay?”</i> She does something with her pinky that makes your eyes cross.");
	output("\n\n<i>“Kay...”</i> you mumble, sliding the hand you’ve had on her ass around the steaming-hot delta between her legs. Your fingers slide in with almost no resistance, the goblin’s tight little slut-box all but sucking them in.");
	output("\n\nMitzi squeaks and shivers, eyes rolling halfway back.");
	output("\n\nYou know exactly how she feels.");
	processTime(35);
	pc.taint(2);
	pc.orgasm();
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",mitziVDayFun3);
}

public function mitziVDayFun3():void
{
	clearOutput();
	showMitziVD();
	author("Fenoxo");
	output("The next eight hours are a sweaty mess of impassioned declarations of affection and toe-curling bursts of pleasure. The sex and words of appreciation blend together until they almost seem to be one and the same, like you’re getting off from Mitzi’s adoration just as much as the magic things her fingers can do, and you swear that she cums a little every time you whisper that you love her into her ear.");
	processTime(60*8);
	for(var x:int = 0; x < 25; x++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",mitziVDayFun4);
}

public function mitziVDayFun4():void
{
	clearOutput();
	showMitziVD();
	author("Fenoxo");
	output("You wake up next to a sleeping, sex-soaked goblin with a sense of... positivity? Well-being? It’s hard to describe, but when you look down at her, you’re nearly instantly spellbound by the glorious curvature of her breasts. A few minutes pass by while you stare at them, but you eventually muster the strength to pull yourself away. <b>Cupid’s Kiss is still in your system.</b> You’re going to be so much easier to tease until it wears off, but it’s also sort of nice in its own way. <b>You feel lucky</b> to have experienced it.");
	processTime(45);
	if(!pc.hasStatusEffect("Cupid’s Kiss")) pc.createStatusEffect("Cupid’s Kiss",1,0,0,0,false,"Icon_DrugVial","You’re feeling more affectionate that you otherwise would, no doubt the result of Mitzi’s drug.\n\nTake +30% more tease damage.\n+200% XP\n+300% rare drop chance.",false,0,0xB793C4);
	pc.setStatusMinutes("Cupid’s Kiss",60*24*31);
	pc.taint(1);
	IncrementFlag("MITZI_VDAYS");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function giveMitziSoak():void
{
	clearOutput();
	showMitzi();
	author("Fenoxo");
	pc.destroyItemByClass(Soak);
	output("Mitzi’s heart-filled eyes stare innocently up at you as you hand her the not-so-innocent little pill. <i>“Really?”</i> she chirps. <i>“You’re really giving Mitzi some Soak? Like, you’re gonna let her get all sloppy-juicy without even having to find her own source?”</i> She fidgets nervously. <i>“She’ll be so fucking slick in a minute, [pc.Master].”</i> The shortstack steps closer, unashamedly grinding an already-juicy delta against you [pc.leg]. <i>“...so fucking <b>wet</b> for you.”</i> Her voice is distant, far-away in a fantasy of the future.");
	output("\n\nYou almost miss her palming the pill into her mouth. It’s the sound of her hungry gulp that gives her subterfuge away. You aren’t sure why you would expect anything different, but you quirk a questioning eyebrow nonetheless.");
	output("\n\n<i>“Whaaat?”</i> Mitzi drawls, leaning back with a wide smile. <i>“Didn’t [pc.Master] want [pc.hisHer] slut all sloppy and slippery?”</i> She strokes her fingers down the expansive" + (mitzi.canLactate() ? ", milk-seeping":"") + " curves of her chest, eyes going far away at the brush of tiny fingers to sensitive titty-tip. <i>“Ohhhh...”</i> The greenskin girl sucks slurps up a bit of errant drool and chews her lip as she struggles to deal with the slow-building high and her body’s already-enhanced sensation.");
	output("\n\nOf course, she fails.");
	output("\n\nThe fragrant scent of increasingly wet cunt seeps into the air, thicker with every breath.");
	output("\n\nTittering idiotically, Mitzi stumbles back. Her crotch is absolutely soaked. You know there hasn’t been time for the Soak to fully affect her, and yet here she is with rivulets of her fragrant femininity racing down her thighs, advertising just how willing and wet she’s gotten for her doting [pc.Master]. She spins around, shucking clothing as she goes until she’s naked as the day she was born and dripping all over the deck. Her cuntlips are so flushed with excitement that they almost seem to glow. The ripened cherry of her clit bulges obscenely, dotted with droplets of her honeyed dew.");
	output("\n\n<i>“Maaaaaster,”</i> the giggling goblin whines, <i>“Are you gonna stop staring and fuck me already?”</i> She bats her eyelashes while swallowing a heavy load of drool. <i>“Cuz if not, I’m gonna probably like... rub all this around.”</i> Mitzi’s fingers slide down her soft middle, twisting and squirming across her skin until they’re grazing the apex of her flushed mons. <i>“Just... sliding and squeezing and rubbing and squishing....”</i>");
	output("\n\nDo you take her up on the offer, or let the horny lil’ slut enjoy her drugs in peace?");
	IncrementFlag("MITZI_SOAKED");
	processTime(3);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Eat Her Out",eatOutSoakMitzi,undefined,"Eat Her Out","Enjoy the fruits of Mitzi’s favorite drug.");
	var mitziCapacityNew:Number = mitzi.vaginalCapacity(0)*2.5;
	if(pc.hasCock() && pc.cockThatFits(mitziCapacityNew) >= 0) addButton(1,"Fuck Her",penisRouter,[soakySoakyHumpsBySkom,mitziCapacityNew,false,0],"Fuck Her","Use your cock to satiate the Mitzi’s sodden pussy.");
	else if(pc.hasCock()) addDisabledButton(1,"Fuck Her","Fuck Her","Even with her pussy rendered into a girlspunk faucet, there’s no way you would fit.");
	else addDisabledButton(1,"Fuck Her","Fuck Her","This scene uses a penis, but you forgot to bring one.");
	addButton(14,"Leave",leaveSoakedMitzi);
}

//Mitzi's Wet Humping
//by Skom

//Implementation details
//This scene allows for bigger cocks than normal (you decide how big). The new max capacity is used for a check later on.
//Before the scene starts, please check for the biggest cock that fits her new max capacity and store its index as 'x', it will be used to choose which cock to use.

//Button: Wet Humping (or whatever you prefer, if you have a better idea)
//Tooltip: Use your cock to satiate the Mitzi's sodden pussy. (Requires cock.)
public function soakySoakyHumpsBySkom(x:int = 0):void
{
	clearOutput();
	showMitzi(true);
	author("Skom");
	output("You approach Mitzi slowly with a smirk on your face, still not answering her question. The goblin’s pink eyes gaze at you with vacant confusion: <i>“So, where do we fu-uu-”</i> she is interrupted as you place a hand between the shortstack’s melons and give her a casual push.");
	output("\n\nLittle force was employed, but it’s still enough to cause her to stumble a step back and land right on the commander’s seat, falling on her cushiony butt. The leather-clad chair is supposed to be utterly sex-proof; time to put it to test. With a quick command from your Codex, the chair starts reclining with a mechanical whir. After the initial surprise, Mitzi giggles in silly wonder as the seat turns into a makeshift bed under her, though the backrest retains a thirty-degree inclination.");
	output("\n\nThis distraction doesn’t last long, and she turns to you biting her plump lips while a hand slowly makes its way to her pussy and starts playing with the sinfully engorged clit. Aware of your hungry, smoldering gaze, the goblin places two fingers on her cunt and parts it, spreading the swollen lips for you to see just how ready she is. It’s been only a couple minutes since Mitzi took the drug, but her sweet-scented fem lube already flows freely, pooling on the black leather of your command seat.");

	//ship is Sidewinder :
	if(shits["SHIP"] is Sidewinder)
	{
		output("\n\nSuddenly, you recall the hardlight equine dongs that the Sidewinder’s command seat is equipped with, and it occurs that you could make use of this feature. Riding a toy at the same time you pound the goblin’s pussy... you can definitely see the appeal.");
		processTime(3);
		clearMenu();
		addButton(0,"Keep Simple",soakySoakyHumpsBySkom2,[x,0],"Keep Simple","Mitzi is the only toy you need right now.")
		if(pc.hasVagina() && pc.blockedVaginas() < pc.totalVaginas()) addButton(1,"My Pussy",soakySoakyHumpsBySkom2,[x,1],"My Pussy","Hardlight dong goes in the pussy. (Requires non-plugged pussy.)");
		else if(pc.hasVagina()) addDisabledButton(1,"My Pussy","My Pussy","You need an unblocked vagina to do this.");
		else addDisabledButton(1,"My Pussy","My Pussy","You need a vagina for this.");
		addButton(2,"My Butt",soakySoakyHumpsBySkom2,[x,-1],"My Butt","Hardlight dong goes in the butt. (Requires non-plugged butthole.)");
	}
	else soakySoakyHumpsBySkom2([x,-2]);

}

public function soakySoakyHumpsBySkom2(args:Array):void
{
	var x:int = args[0];
	var mitziSidewinder:int = args[1];
	//Used in sidewinder vag stuff
	var z:int = -1;
	if(pc.hasVagina()) z = pc.pickUnblocked();

	//If went through menu, clear screen post button-press.
	if(mitziSidewinder != -2)
	{
		clearOutput();
		showMitzi(true);
		author("Skom");
	}
	//If no menu was displayed, just shift to "keep simple" options.
	else mitziSidewinder = 0;

	if(mitziSidewinder != 0)
	{
		output("\n\nWith another input on your Codex, a hardlight horsecock springs into existence between Mitzi’s thighs. The thing is over a foot in length and has a nice girth to boot! The goblin puts both hands on her cheeks and coos a fascinated <i>Oooohhh!</i> as she gazes at the toy with lascivious desire. In the space of three seconds, Mitzi lifts up her wide hips and prepares to go down on the shiny horsedong, but you order her to stop and explain that <i>you</i> are the one who’s gonna be using that. Her face goes from glee to disappointment - and then back to glee when you say that, since she’s so eager, she can use her pussy to lube it up for you. And put on a show while she’s at it.");
		output("\n\nThe voluptuous shortstack winks, blows you a kiss with her angel-bow lips and, grasping the armrests for support, starts to languidly rub her sodden, swollen pussylips up and down the hardlight shaft. The goblin’s fem-lube glistens from the light emitted by the toy, acquiring a rainbow-like shine that shifts hypnotically as the copious juices trickle down. Mitzi bites her lower lip, face flush with pleasure as her big clit slides over the toy, and you find yourself licking your [pc.lipsChaste] and running a hand over your crotch in anticipation. When she reaches the flare, she makes sure to dedicate time to it, her fat labia moving with a will of their own, almost embracing it.");
	}
	output("\n\nThe sight of Mitzi’s puffy pussylips compressed against her thick thighs is too much, and you find that ");
	if(!pc.isCrotchExposed()) output("the confines of your [pc.crotchCoverUnder] are suddenly too tight for your twitching [pc.multiCocks]. You waste no time in stripping out of your gear and ");
	else output("you can’t hold back your twitching [pc.multiCocks] anymore. You waste no time in ");
	output("advancing on the prone goblin, grabbing her ankles and spreading those thick legs open as you line your [pc.cock " + x + "] with her entrance.");
	output("\n\nIntent on savoring every moment, you apply only a little pressure, but - to your surprise - the [pc.cockHead " + x + "] meets almost no resistance as it parts her folds and plunges all at once into her hot, silken depths. You suck in a deep breath as your shaft unintentionally bottoms out and is assaulted by the sudden caress. <i>“Yessss!”</i> Mitzi coos in delight. And it all happened in less than a second!");
	pc.cockChange();
	output("\n\nAstonished, you pull out and repeat the deed: your cock goes in with a wet, squishy sound, utterly slick with Mitzi’s sweet lube. A devious smile creeps on your face, and you give your slut a predatory look as you " + (pc.legCount > 1 ? "adjust your stance, placing your [pc.legsNoun] at each side of the chair.":"adjust your stance so that the weight of your [pc.leg] is mostly on the footrest.") + " Mitzi returns the hunger in your eyes with her own, and without further ado, you impale her sodden quim in one swift thrust, causing both you and Mitzi moan in unison from the onslaught of sensation." + (pc.hasKnot(x) ? " Even the knot goes in, further spreading her thick, swollen labia as her vagina bulges obscenely with the additional volume.":""));
	var mitziNewSoakiesCapacity:Number = mitzi.vaginalCapacity(0)*2.5;
	if(pc.cockVolume(x) >= mitziNewSoakiesCapacity * 0.65) output("\n\nLooking closely at the goblin, you can even make out the shape of your cock distending her belly, so deep that you are. Mitzi’s eyes follow your gaze, only for her to giggle reassuringly. <i>“[pc.MasterMistress], don’t be silly! It’s totally normal for Mitzi to dis-disti- stretch like this when taking [pc.name]’s big cock,”</i> she winks.");
	if(mitziSidewinder != 0)
	{
		output("\n\nNow there’s only one thing left to do before the real pounding begins.");
		output("\n\nAdjusting your [pc.hips] and using a hand to guide the hardlight horsecock, you lower yourself on the toy, savoring the sensation of the blunted flare parting " + (mitziSidewinder == 1 ? "the entrance of your [pc.vagina " + z + "]":"your [pc.butthole]") + " without much difficulty, owing both to the thorough coating of Mitzi’s fem-lube and your extreme arousal. Being made of hardlight, the shaft itself is superbly smooth, but this doesn’t stop you from enjoying the little bumps and irregularities on its horsecock-themed surface. Inch by inch, you slide down on the shiny dong, bottoming out with a satisfied <i>Aaahhh!</i> Your cock twitches in response, and Mitzi gives you a knowing smile.");
		if(mitziSidewinder == 1) pc.cuntChange(z,750);
		else pc.buttChange(750);
	}

	output("\n\nNot willing to wait even a second longer, you grab the armrests for support and start start pounding the shortstack as fast as you can, fully enjoying the advantages of her incredibly slick pussy. But, in addition to making Mitzi’s cunt even wetter than normal, it’s also made it <i>hot</i> for some reason. The heat seeps into your [pc.cock " + x + "], enhancing sensation and driving you to a strange, feverish kind of lust while you plow her silken love tunnel ruthlessly.");
	if(mitziSidewinder != 0) output(" Every time you pull back, you impale yourself on the hardlight dong, and every time you thrust into Mitzi’s cunt, the toy’s flare travels the reverse route inside your " + (mitziSidewinder == 1 ? "[pc.vagina " + z + "], teasing you":"[pc.ass], massaging your prostate") + " in a most gratifying way.");
	output("\n\nMitzi wraps her legs around you and pulls in tempo with your thrusts, moaning in unbelievable bliss. <i>“Yes! More! Harder!!”</i> are the only words you can make out, and soon enough you find yourself adding your own notes to this symphony of raw, unbridled desire. ");
	//pc.totalCocks() > 1 && pc.cocks[x] != smallest cock
	var y:int = -1;
	if(pc.totalCocks() > 1)
	{
		y = pc.smallestCockIndex();
		if(x == y)
		{
			if(y > 0) y--;
			else y++;
		}
	}
	if(y >= 0) output(" Meanwhile, your [pc.cock " + y + "], rubs the area between her thick thighs, which has become utterly slick from the constant flow of fem-lube that oozes out of the shortstack’s pussy in-between thrusts. Every time your [pc.cockNounSimple " + x + "] bottoms out, your [pc.cock " + y + "] buries itself between her fat ass-cheeks and the chair’s smooth leather. The feel of all those different textures caressing on your shafts is addictive, prompting you to go at it even harder than before.");
	output("\n\nIt doesn’t take even a full minute for the goblin to reach the first orgasm, her moans rising to an utterly debauched pitch, large breasts jiggling beautifully as her body trembles in ecstasy. Meanwhile, Mitzi’s sugary girlcum splashes hotly all over your groin");
	if(pc.balls > 0) output(", [pc.balls],");
	else if(pc.hasVagina()) output(", [pc.vaginasSimple],");
	output(" and [pc.thighs]. You can only imagine what has become of your leather-clad command chair by this point, but the truth is you could hardly care less as you continue to pound Mitzi throughout her orgasm, not slowing down even while her pussy squirms powerfully around your [pc.cock " + x + "]. You can almost hear the sound of her fem-juice dripping on the floor every time you pull back for another thrust.");
	output("\n\nOne of the advantages of her being so slick is that the reduced friction allows you to last longer than you normally would. Your stamina, however, is a different matter. After a couple more minutes of this impulsive, wild fuck and three more of Mitzi’s orgasms, you feel yourself starting to tire out, so you bend down to rest the weight of your torso on the buxom goblin’s body, but leaving your cock inside. Even if you wanted to pull out, Mitzi’s legs remain wrapped around your [pc.hips] with surprising strength, as if trying to forbid you from withdrawing. In contrast, her tongue is lolling out, drooling saliva in obscene quantities over the armrest.");
	if(mitziSidewinder != 0) output(" Meanwhile, the hardlight toy projecting from the chair remains planted inside you.");

	output("\n\nBoth of you are panting from the exertion, but this doesn’t stop the goblin from trying to drive you crazy with pleasure.");
	// pc Tallness >=59 (append, no new paragraph)
	if(pc.tallness >= 59) output(" Taking advantage of her own short stature, Mitzi suddenly wraps her plump, wet mouth around one of your [pc.breasts] and starts suckling with feverish dedication. You suck in a sharp breath as she nibbles on a [pc.nipple] with just the right intensity, a feat only someone who truly knows her [pc.MasterMistress] is capable of." + (pc.isLactating() ? " Spurts of your [pc.milk] soon flood her mouth, and she drinks hungrily, coaxing more and more out. <i>“[pc.MasterMistress] tastes so good!”</i> She giggles during a pause, gazing at you with adoration in her pink eyes.":"") + " Her mouth’s ministrations go on for a long moment before she switches to the other side and does the same, pleasing you expertly.");
	else output(" Taking advantage of your similar heights, she suddenly wraps her arms around your shoulders and presses her plump lips against your [pc.lipsChaste], pulling you in for a long, hot kiss. Her devilishly long tongue intertwines with your [pc.tongue] in a sensuous dance that lasts a good while. When you finally break the kiss, a line of saliva links your mouths, and you can’t help giggling a little with Mitzi. <i>“[pc.MasterMistress] has such a good mouth,”</i> she says, gazing at you with adoration in her pink eyes.");
	// merge
	output("\n\nIn response, you wrap your arms around the shortstack, push your [pc.hips] against her cunt and start undulating, giving her big love button a nice massage while your [pc.cock " + x + "] rubs her slick walls with short movements. <i>“Ooohhh!”</i> Mitzi coos dreamily, her thick legs pulling you with even more force than before. It’s surprising that the goblin still has so much energy in her body - that dose of Soak must be raising her already insane sex drive to truly inhuman levels.");
	output("\n\nYour ministrations are interrupted all of a sudden when you feel Mitzi’s pussy clamping down <i>hard</i> on your [pc.cock " + x + "]. At first, you think she’s having yet another orgasm, but this idea is discarded when you gaze at her grinning face. Just then, her quim starts contracting, twisting and relaxing in a way that only the specialized muscles of a Gabilani vagina are capable of. Mitzi continues to grin at you while her sodden cunt milks your member, drawing gasps of intense pleasure from your throat.");
	output("\n\nDeciding to return the favor, you press the weight of your body against her - delighting in how her huge knockers and hard nipples are squeezed deliciously against your [pc.breasts] - and start moving your [pc.hips] once again. But, by this point, there’s just no way you can hold back anymore: your playful massage quickly turn into uninhibited thrusts. Before you know it, you’re humping like a rutting beast, each of your movements accompanied by a squelching sound as, every time you pull back, drops of sweet-smelling liquid splash out of the goblin’s overflowing pussy. The chair creaks loudly under your combined weights and forceful plowing, but, true to its manufacture, it holds out.");
	if(mitziSidewinder != 0) output(" And, of course, this includes the thick hardlight horse cock inside your " + (mitziSidewinder == 1 ? "[pc.vagina " + z + "]":"[pc.ass]") + ", which is causing even more stimulation under this frantic rhythm.");

	output("\n\nMitzi moans and squeals in pleasure, her face back to that wanton visage of ecstatic bliss, lips parted and drooling, tongue lolling out. The milking contractions of her vagina continue, but you can no longer tell if she’s doing it on purpose, or if it’s just another orgasm in her streak. You lost count at seven. Despite the pressure her tunnel is applying on your [pc.cock " + x + "], its silken, ultra-slick texture allows you to plow unimpeded - it’s a delicious contrast that sends waves of bliss through your shaft.");
	if(y >= 0) output("\n\nJust at this point, your [pc.cock " + y + "], which had been rubbing between the goblin’s slickened thighs and asscheeks, finds its way into her butthole, slipping in with only token resistance, lubricated as it is with her plentiful girlcum. Even lost in her unending orgasm, Mitzi still coos in delight when the extra cock slides in, but to you it’s like a whole new layer of pleasure has been added to the experience. You proceed to plow both of her holes at the same time, delighting in the contrast between her silken cunt and velvety back hole.");

	if(mitziSidewinder != 0) output("\n\nThe Sidewinder’s command seat must have a climax gauging system, because the hardlight toy suddenly springs to life inside your " + (mitziSidewinder == 1 ? "[pc.vagina " + z + "], vibrating in a way that drives your [pc.clits] crazy with pleasure. Before you know it, your pussy is shuddering in orgasm, drenching your thighs and chair with [pc.girlCum].":"[pc.ass], vibrating in a way that drives your prostate crazy with pleasure. You can practically feel it pumping its [pc.cumFlavor] payload into your cum ducts.") + " As if that’s not enough, the shiny horsedong starts squirting some sort of liquid light - a gentle warmth that splashes against your tunnel and seeps in, before the substance ‘evaporates’ into normal light, leaving nothing in its wake except the sensation of other hot, powerful ropes being continuously shot inside of you.");

	output("\n\nYou know you’ve reached your limit when you release a roar of ecstasy that manages to eclipse Mitzi’s whorish moans, a river of [pc.cum] exploding out of your [pc.cockHead " + x + "] and into her shuddering pussy.");
	if(y >= 0) output(" At the same time, your [pc.cockNoun " + y + "] starts twitching and spurting inside her sheathlike ass.");
	output(" But you don’t want to stop, no! Gritting your teeth, you power through your own orgasm and just keep humping until your body is trembling - both from overstimulation and physical exertion.");
	if(pc.cumQ() >= 1000) output(" It doesn’t take long at all for your seed to overflow and start spewing out with squishy sounds even as you continue to plow.");
	else output(" It doesn’t take long for all the mixed juices to overflow and start spewing out with squishy sounds even as you continue to plow, your seed lost within the river of Mitzi’s freely-squirted fluids.")
	output(" With one final thrust, you bottom out and collapse on top of the cushiony goblin, who seems to be in seventh heaven, if the blissful, vacant look on her visage is any indication.");
	output("\n\nBoth of you pass out from exhaustion. You wake up a few minutes later" + (mitziSidewinder != 0 ? ", turn off the shiny horsedong":"") + " and withdraw absent-mindedly, which causes a rivulet of excess [pc.cumNoun] to leak out of Mitzi, mixed with her still-flowing juices. You watch with bemused detachment as it trickles down your fancy chair and pools on the ship’s floor. Now, the chair might be impervious, but you doubt you could say the same about the cracks in the metallic floor - it looks like you’ll have to get used to your bridge smelling like Mitzi’s pussy, unless you want to do some serious cleaning. Hopefully, the ship’s next owner won’t mind it too much.");
	output("\n\nYou briefly consider waking her up, but the peaceful, almost angelic expression on Mitzi’s sleeping face stops you in your tracks, and you merely smile at the voluptuous shortstack, taking a moment to caress her cheek and run a finger over her plush, angel-bow lips. In the end, you decide to grab a meal and come back later to carry Mitzi to her room. Looks like she’ll be out of commission for a while.");
	processTime(55);
	mitzi.loadInCunt(pc,0);
	if(y >= 0) mitzi.loadInAss(pc);
	// orgasm a couple times
	pc.orgasm();
	pc.orgasm();
	// apply pussy-drenched and cum-soaked flags
	pc.applyPussyDrenched();
	// if pc tallness >= 58 && pc is lactating, also do the milk stuff, since she drank some of your milk
	if(pc.tallness >= 59 && pc.isLactating()) pc.milked();
	// maybe: disable Mitzi for 8 hours (time for Soak to wear off)
	// pass time (30 min?)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function leaveSoakedMitzi():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("You smile at Mitzi and let her know that you only intended to give her a gift - there are other matters to attend to before you can fuck the galaxy’s sluttiest shortstack.");
	output("\n\n<i>“Awww,”</i> Mitzi whines, cutting herself off with a squeak of pleasure when her mischievous fingers wiggle a little lower. Fluid spatters the deck, and the goblin cumslut’s mouth falls open, dribbling spit. <i>“Uhgonna... gonna get my... dildos,”</i> she mumbles, stumbling off toward her quarters, a river of slick lubricant trailing behind.");
	output("\n\nYou wonder if you’ll ever get the scent of her pussy out of the deck.");
	processTime(2);
	pc.createStatusEffect("MITZI_SOAK_SCHLICKING");
	pc.setStatusMinutes("MITZI_SOAK_SCHLICKING",480);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Eat Her
public function eatOutSoakMitzi():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("<i>“Fuck you? What a waste.”</i> You advance, nostrils flaring. <i>“All that nectar... Mitzi, my little slut, I’m going to </i>eat<i> you.”</i>");
	output("\n\nThe goblin gives a full-body shudder when you lick your chops. <i>“Oh. Uh... oh-okay.”</i> She gives her cunt a little rub before sticking the fingers deep into her mouth and sucking, trying to talk around the intruding digits, <i>“Here?”</i>");
	//Bitesized
	if(pc.tallness < 5*12)
	{
		output("\n\n<i>“Nah,”</i> you answer, grabbing her hand away from her puss so you can drag her to her bedroom. <i>“Your room.”</i> This seems to please the dopey gabilani, or at least her pussy; it spatters juices all over the floor{ almost as strongly as Anno mid-climax/ like she just got to climax}, but she’s still walking just fine. Sucking on two fingers while she walks, Mitzi flosses her tail through her squelching thighs, sprinkling a fan of wetness across the corridor. It feels like it might be too much to reach down there yourself and tease her well-greased clit, but she just smiles and stumbles obediently behind, a hot, horny mess.");
	}
	//Big&Treated
	else if(pc.isTreated())
	{
		output("\n\nLaughing, you boldly scoop the drippy slattern into your arms and hoist her toward her room. No sense in soiling your own bedspread when Mitzi’s chambers are already perfumed with her pussy’s enticing aroma. You don’t bother to answer her question either. The juicy minx probably doesn’t even remember asking, and besides, it’s more fun to slip a finger between her thighs and rub slow circuits around her clit. With every circle, she’s a little wetter.");
	}
	//Big
	else
	{
		output("\n\n<i>“No,”</i> you answer, scooping her up into your arms. <i>“Your room.”</i>");
		output("\n\nThe drippy wench squirms happily at the suggestion, her cunt-marinated mind apparently still capable of understanding that she’s being carried to a bedroom. You keep her entertained by positioning one hand under her plush heiny, reaching up to make slow circles around her cunt’s sopping jewel. With each circuit, she gets a little wetter, a little slicker, and a little harder to hold on to.");
	}
	//Merge
	output("\n\nThe door ‘wooshes’ closed behind, and you " + (pc.tallness > (5*12) ? "toss Mitzi onto the bed":"push Mitzi onto the bed") + ". She flies heels over tits, bounces twice, then settles into supine, spread-legged anticipation. Her tits still bounce and wobble. The drugged goblin vainly tries to restrain them, an act made near impossible by the curtains of lubricating saliva she’s been drooling, but with great effort, she wrangles her heaving mounds into a drool-worthy stable canyon of cleavage - and drool the slut does, gradually creating a lake of her own saliva.");
	output("\n\nYou dive into bed after her, landing in a patch made damp by her verdant cunt without care. The font of Mitzi’s free-flowing pussy-juice lies before you, and you lean in without hesitation. You press your [pc.lipsChaste] to sopping goblin-cunt and kiss your way from chaste peck to wide-mouthed, sucking french. Your tongue " + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "spools":"thrusts") + " out to scoop up a mouthful of fragrant cunt-juice, and while you swallow, you suckle upon Mitzi’s tender clit. You can feel it bulging in your mouth, swelling a little bigger as the drug takes hold.");
	output("\n\nSoak makes the shortstack’s entire pubic region seem to puff up. Her thick, fuckable cuntlips feel like twin cushions for your cheeks to rest on. Her clit increasingly fills you mouth, blocking you from swallowing all of the goblin’s torrid secretions. With pussy-juice slopping down your chin, you swab your tongue back and forth through her cleft, savoring the taste and the way it makes your emerald prize squirm in equal measure. Mitzi’s voice squeaks and babbles, but you pay it little mind aside from the awareness of her assent. Your focus remains on her fountaining twat, joyously worshipping it.");
	output("\n\nReality demands you stop to breathe, of course, but this too has its advantages. You’re free to cup a palm beneath the goblin’s honeypot to collect her fragrant juices, then smear it across her inner thighs and stomach, glossing the goblin in her own slick love. Still gasping for breath, you repeat the motion. This time you rub it into Mitzi’s ass and score a view of your lusty goblin fuck-pet using her " + (mitzi.canLactate() ? "spit and milky reserves":"saliva") + " to do the same to her tits. They glisten hypnotically enough to tempt you into abandoning your pussy-smearing fun for a bit of huge-titty groping.");
	output("\n\nYou don’t need your hands to suck cunt anyway.");
	output("\n\nDiving back down, you press your mouth to Mitzi’s muff, sucking and licking with wild abandon. Her excitement is contagious. It feels like everything from the firmness of her jutting nipples to the lubricious mess that is her pussy exist solely to arouse. The goblin gal’s sodden slit welcomes your mouth with bursts of fresh, warm goo, and you answer its onslaught with greedy gulps rapid flicks of your tongue" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? ", lashing her oh-so receptive twat a few times before pressing your enhanced length deep enough to do the same against her quivering cervix":"") + ".");
	output("\n\nCunnilingus this intoxicating shouldn’t be possible, but here you are, every breath swimming in Mitzi’s pheromones, soaked in from face to crotch in her pheromones, lying in bed sheets drenched by her distilled, drug-augmented pleasure. You lick and suck with single-minded determination. The goblin, meanwhile, just moans and cums. If it weren’t for her keening wails of pleasure, it would be tough to tell where one climax ends and another begins, so constant is the sputtering, spurting girlcum she exudes.");
	output("\n\nIt’s enough to know that you’re doing this to her - you’re making this squealing slut writhe in insensate pleasure, short-circuiting with ecstasy until she’s more juice than woman. But you want more. With a gentle squeeze of regret, you release Mitzi’s nipples and hook your arms under her thighs, lifting her up to better press her cunt to your face. You mash yourself against her, your nose incidentally grinding against her clit while you devour her cunt with the fervor of a rutting beast. Eyes closed, you focus on the taste, texture, and stars above! - the smell!");
	output("\n\nMitzi’s pussy dominates your thoughts as you continue to work it, swallowing gushes here and there before turning your head to gasp for breath while she squirts against your cheek, spattering girlish goo all over. Then it’s back to licking, back to sucking, back to diving as deeply as your body will allow" + (pc.hasMuzzle() ? ", your narrow muzzle actually stuffing itself inside with the raw <i>thirst</i> of your desire. You fuck her on your face until the goblin’s screams fade into exhausted-yet-satisfied whimpers. Her squirts pour directly down your throat too, making your stomach gurgle uncomfortably. Sealed in like this, there’s nowhere else to go until you finally deign to unplug her cunt.":". You polish her gushing quim until her screams fade into exhausted-yet-satisfied whimpers, and still you press on. You swallow squirting climaxes until your stomach hurts and gurgles with the weight of it."));
	output("\n\nHesitant and horny, you pull away with a sore jaw and look down upon the quivering wreck of your goblin fuck-toy. Every inch of her body glistens with sex-juice" + (mitzi.canLactate() ? ", milk,":"") + " and spit, and her generous curves quiver with the aftershocks rocking her body. She pants and drools, mouthing the words, <i>“Fuck”</i> and <i>“Yes”</i> again and again while haphhazardly smearing slickness across her skin.");
	output("\n\nGasping for breath, you ask Mitzi if she’s okay.");
	output("\n\nHer response, while nonverbal, is quite clear: she grabs your wrist and shoves your entire fist into her cunt, prompting another messy climax on the spot. Supposing that you’re going to be here a while, you lick the lingering flavor from your lips and dive back in, kissing at her clit while she clenches hard on one hand. With your other, you enjoy the rest of her fully-lubed form, teasing nipples with fervent squeezes while the goblin cums.");
	output("\n\n...and cums.");
	output("\n\n...and cums.");
	output("\n\nYou pass out on Mitzi’s puffy pussy, exhausted. Her coos of saccharine delight are your lullaby.");
	processTime(120);
	pc.changeLust(300);
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0,"Next",eatOutSoakMitziEpilogue);
}

//Pass 5 hours, restheal
public function eatOutSoakMitziEpilogue():void
{
	clearOutput();
	showMitzi(true);
	author("Fenoxo");
	output("Raucous snoring interrupts your pussy-scented slumber. Prying your sticky cheek off smooth goblin thigh, you stumble into alertness. Everything comes rushing back: the hours of worshipping Mitzi’s cunt, the supreme, unending tides of wetness that emerged from within, even the delightful way her passage gripped and rippled around your fist when she came. It’s almost a shame that she had to come down from her high and rest herself.");
	output("\n\nYou climb onto your [pc.footOrFeet] and find the nearest, driest blanket" + (!pc.isAss() ? ", then gently lay it across it the snoring Gabilani. She’ll thank you for it in the morning.":" to wipe yourself off with, then toss it over the snoring Gabilani. She’d better thank you for it when she wakes up."));
	output("\n\nShe doesn’t seem to be any juicier now. <b>Mitzi’s probably gotten every permanent effect from the drug already.</b>");
	processTime(5*60+rand(10));
	//Calm down while sleeping... if not in rut.
	if(!pc.inRut()) pc.changeLust(-33);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Invite Mitzi from Kiro menu
public function kiroSexMenuInvitesMitzi():void
{
	clearOutput();
	showBust(kiroBustDisplay(true),mitziBustString(true));
	showName("KIRO\n& MITZI");
	author("Fenoxo");
	output("<i>“Oh, you’re going to love her,”</i> you suggest before tapping the ship’s intercom. <i>“Mitzi, report to the Captain.”</i> A second later, you push the button again, adding, <i>“I hope you’re ready to pull double duty tonight.”</i>");
	output("\n\nNot one minute later, the sluttified goblin prances into the room with hard nipples and the careless air of a freewheeling slut. At the sight of Kiro, her jaw drops and her nostrils flare. <i>“[pc.Master]... ");
	if(flags["KIRO_MET_MITZI"] == undefined) output("that’s a big dicked slut you’ve got there.");
	else output("Kiro’s dick looks even bigger today.");
	output("”</i> She licks her polished purple lips with obvious desire, the heart-shaped pupils of her eyes rapidly dilating. <i>“Mitzi really hopes ");
	if(flags["KIRO_MET_MITZI"] == undefined) output("you’re planning to share");
	else output("she can start sucking right now");
	output(". Really really-really-really hopes!”</i>");

	output("\n\n<i>“");
	if(flags["KIRO_MET_MITZI"] == undefined) output("Oh, aren’t you the most adorable little cock-socket,");
	else output("Oh, I’m no tease, Mitzi,");
	output("”</i> Kiro coos with a confident swagger forward. <i>“");
	if(flags["KIRO_MET_MITZI"] == undefined) output("Go ahead and say hi if you want. After all, we just met - I’m Kiro by the way. [pc.Name] won’t mind if you can’t keep that tongue of yours to yourself.");
	else output("Why don’t you start sucking while [pc.name] and I discuss how to share you?");
	output("”</i> With a one-handed grip just above her sheath, the space-faring tanuki wobbles her twenty-plus-inch pole meaningfully in the sultry greenskin’s direction.");
	output("\n\nAfter a deferential glance your way for permission, Mitzi squats in front of Kiro, all but smashing her face into the horny kui-tan’s churning nutsack. Muffled moans of delight echo out of the fluffy " + (kiro.ballDiameter() >= 16 ? "prison":"pillow") + " while the goblin’s thighs drift wide open, displaying the wantonly drooling inner lips of her clitty’s nearby cavern. Her wetness problem only grows worse as she begins to worship Kiro in earnest, spooling out over nine inches of tongue to run laps around the circumference of the tanuki’s tender sheath.");
	output("\n\n<i>“Ohhhh,”</i> Kiro gasps in delight. <i>“No wonder [pc.name] keeps you on the crew, you tiny little treasure!”</i> She grunts in sudden ecstasy as the bright pink tongue slithers around the circumference of her medial ring. <i>“Keep that up, and we are going to ruin you for the rest of the galaxy, aren’t we, Angel?”</i> Kiro gently rubs the back of Mitzi’s head, encouraging the dick-addicted fuck-toy to continue while she glances up at you for comment. <i>“If you don’t speak up, I’m going to have to give her throat a solo run.”</i>");
	output("\n\nAn excited squeak escapes the spit-slick prison of Kiro’s crotch.");
	output("\n\nWhat do you want to do?");
	if(flags["KIRO_MET_MITZI"] == undefined) flags["KIRO_MET_MITZI"] = 1;
	processTime(4);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(mitzi.vaginalCapacity(0)) >= 0) addButton(0,"Double Team",penisRouter,[doubleTeamMitziWithKiro,mitzi.vaginalCapacity(0),false,0],"Double Team","Pound the goblin from both ends, thanks to Kiro's help.");
		else addDisabledButton(0,"Double Team","Double Team","You need a penis that would fit inside Mitzi for this option.");
	}
	else addDisabledButton(0,"Double Team","Double Team","You need a penis for this.");
	addButton(1,"Nevermind",nevermindKiroAndMitzi,undefined,"Nevermind","");
}

//Mitzi threesome menu
public function mitziThreesomesMenu():void
{
	clearOutput();
	showMitzi(true);
	showName("\nTHREESOMES");
	author("Fenoxo");
	output("Who did you want to invite for a threesome with Mitzi?");
	clearMenu();
	addButton(14,"Back",mitziCrewSexApproach);
	if(kiroIsCrew()) 
	{
		if(crewKiroAvailable()) addButton(0,"Kiro",mitziSexMenuInvitesKiro,undefined,"Kiro","Invite the swaggering pirate slut for some fun with Mitzi.");
		else addDisabledButton(0,"Kiro","Kiro","Kiro is busy right now.");
	}
	else addDisabledButton(0,"???","???","You would need a certain hermaphrodite pirate on your crew for this option.");
}

//Actual select Kiro
public function mitziSexMenuInvitesKiro():void
{
	clearOutput();
	showBust(kiroBustDisplay(true),mitziBustString(true));
	showName("KIRO\n& MITZI");
	author("Fenoxo");
	if(pc.isBro()) output("You lift one finger, gesturing for silence. <i>“Threesome.”</i>");
	else output("<i>“First I have a friend I want to invite. You’ll love her.”</i>");
	output("\n\nThe unflappable green slut bounces on the balls of her feet and claps in complete joy. <i>“Awesome! [pc.Master] has all the best surprises. Who’s it going to be?”</i> She leans " + (pc.tallness > 48 ? "up":"over") + " at you, batting her eyelashes a thousand miles a minute.");
	output("\n\nYou reach out and tap the ship’s intercom. <i>“Kiro, I need some assistance with a small matter in Mitzi’s room.”</i>");
	output("\n\n<i>“Ooooh,”</i> Mitzi drawls. <i>“Sounds serious, but like, I thought we were doing a threesome, not boring ship repairs or whatever.”</i>");
	//First time
	if(flags["KIRO_MET_MITZI"] == undefined) 
	{
		output("\n\nKiro hesitantly leans her head through the doorframe and, upon seeing you with the fuck-hungry microslut, strides the rest of the way in an increasingly confident swagger. <i>“So this is the small matter you needed my help with?”</i> The tanuki’s dick makes itself known, thrusting out from under the hem of her dress to jab powerfully in goblin’s direction. <i>“Did you say her name was Mitzi?”</i>");
		output("\n\n<i>“Yuh huh.”</i> Teetering closer to the exposed horse-cock, the purple-ponytailed shortstack licks her lips with obvious hunger. Somehow, her nipples get even harder. Her nostrils flare, and the pink tip of Mitzi’s tongue varnishes her plump lips in a layer of clear anticipation. <i>“Soz I guess now that we know each other, it’s okay for me to suck your cock, right?”</i> Mitzi glances your way for approval, then practically tumbles between Kiro’s thighs, landing in a deep squat that lines her face up perfectly with the fluffy softness of your pet pirate’s free-swinging ballsack.");
	}
	//Repeat
	else
	{
		output("\n\nKiro jogs through the door with a smile and a fully-engorged erection. Upon seeing the fuck-hungry microslut, she actually starts to dribble on the spot. <i>“Hiya Mitzi. You’re looking fuckable as ever.”</i> The ‘nuki’s gaze winds its way back to you after the sound of pre splattering on the floor rouses the flushed shortstack. <i>“I’m so glad you call me over for these ‘small matters.’ Nothing satisfies quite like stuffing one of these gabilani bitches to the brim. Isn’t that right, Mitzi?”</i>");
		output("\n\n<i>“Yuh huh.”</i> The purple-ponytailed shortstack stumbles closer, zombie-like. She moves as sleepwalking, every synapse of her mind so laser-focused on Kiro’s dick that there’s barely room for simple locomotion. The moment she’s close enough, she drops into a deep, spread-legged squat, proudly displaying her leaky cunt’s puffy inner lips while she smashes her face into the fluffy softness of Kiro’s increasingly taut ballsack.");
	}
	//Merge
	output("\n\nFor a few seconds, nobody tries to talk. Kiro moans in obvious enjoyment, shifting her hips to ");
	if(kiro.ballDiameter() < 16) output("smear her nuts over every inch of the aggressively-licking goblin’s face");
	else output("almost completely bury the aggressively-licking goblin in nut");
	output(". Mitzi counters by unleashing the full length of her tongue, curling it along the sensitive folds of Kiro’s sheath until she’s looped the whole way over the top and slithered back down the other side. She savors the combined flavors of cock, sweat, and pre all at once, slavering over the tanuki like her life depends on it.");
	output("\n\n<i>“Ohhhh,”</i> Kiro blissfully moans. <i>“You angelic little demon! No wonder [pc.name] keeps you around!”</i> She marvels at the things the goblin’s tongue can do while reaching down to caress one of the bobbing ponytails in clear adoration. <i>“If you keep that up, we’re going to ruin you for the rest of the galaxy. Aren’t we, Angel?”</i> Kiro’s face radiates nothing but pleasure and relaxation as she gazes longingly in your direction. <i>“What’s the command Cap’n? Go on. Tell us how you wanna fuck.”</i>");
	output("\n\nWhat do you want to do?");

	if(flags["KIRO_MET_MITZI"] == undefined) flags["KIRO_MET_MITZI"] = 1;
	processTime(4);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(mitzi.vaginalCapacity(0)) >= 0) addButton(0,"Double Team",penisRouter,[doubleTeamMitziWithKiro,mitzi.vaginalCapacity(0),false,0],"Double Team","Pound the goblin from both ends, thanks to Kiro's help.");
		else addDisabledButton(0,"Double Team","Double Team","You need a penis that would fit inside Mitzi for this option.");
	}
	else addDisabledButton(0,"Double Team","Double Team","You need a penis for this.");
	addButton(1,"Nevermind",nevermindKiroAndMitzi,undefined,"Nevermind","");
}

//[Nevermind]
public function nevermindKiroAndMitzi():void
{
	clearOutput();
	showBust(kiroBustDisplay(true),mitziBustString(true));
	showName("KIRO\n& MITZI");
	author("Fenoxo");
	output("<i>“Actually,”</i> you say, glancing from the ball-polishing goblin to the cheshire-grinning kui-tan, <i>“I think I might be needed elsewhere. You guys can take care of yourselves, right?”</i>");
	output("\n\nKiro is quick to present you with two thumbs up.");
	output("\n\n<i>“Mmmhmm,”</i> the goblin gurgles around a mouthful of balls.");
	output("\n\nPerfect. You stride back into the common area of your ship to plan your next move.");
	//disable Mitzi & Kiro for one hour. Make sure both 'gasm.
	if(!pc.hasStatusEffect("Mitzi Disabled")) pc.createStatusEffect("Mitzi Disabled");
	pc.setStatusMinutes("Mitzi Disabled",60);
	flags["KIRO_DISABLED_MINUTES"] = 60;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Mitzi Lewds Commence
//Mitzi sucks Kiro’s balls while you and Kiro haggle over who gets her pussy. Mitzi volunteers her pussy for her master, and you proceed to take her from both ends.
public function doubleTeamMitziWithKiro(x:int):void
{
	clearOutput();
	showBust(kiroBustDisplay(true),mitziBustString(true));
	showName("KIRO\n& MITZI");
	author("Fenoxo");
	//Bro
	if(pc.isBro()) output("Rather than trying to explain what you want to do, you walk up to the goblin and grab her by her squishy haunches, bodily hauling her up until the gleaming delta of her sex is well-aligned with your [pc.cock " + x + "]. You thrust in without a single word, forcing Kiro to stand there and witness the claiming of your emerald toy. Burying yourself in to the hilt earns an approving squeak from the juicy slut, but you’re not done yet. Holding Mitzi at a ninety degree angle, you march forward with steady steps until the goblin’s face is a few inches away from Kiro’s proudly drooling flare.");
	//Not Bro
	else 
	{
		output("<i>“Ever heard of an Eiffel Tower?”</i> you ask while closing in on the entangled pair and helping yourself to two hands of plush, emerald heiny.");
		output("\n\nKiro nods knowingly. Mitzi, predictably, is too busy sucking sack to do anything but wiggle her ass into your palms.");
		output("\n\n<i>“Good,”</i> you declare. Dragging the goblin away from the pirate’s well-polished sheath, you answer her cries of disappointment by dragging her ass up to your [pc.cockHead " + x + "] and spearing your whole length straight into her dribbling quim. She squeaks in rapturous joy, yet you’re far from done. You guide the leaky shortstack forward on the palms of her hands, wheelbarrow-walk-fucking her right up to Kiro’s proudly-drooling flare.");
	}
	//mergies
	pc.cockChange();
	output("\n\nMitzi’s mouth falls open automatically, saliva already dribbling from the corners. Her tongue slithers out like a pink carpet, waiting to guide the phallus home. Perfect.");
	output("\n\nThere is one thing you can always count on Kiro to do: claim a wet and willing hole. The former lawbreaker considers Mitzi’s parted, spit-slopped lips for all of a quarter-second before grabbing the goblin by the pigtails and inexorably shifting forward. You feel Mitzi’s cunt tighten the moment Kiro’s dribbling prick-head pops inside, and as the tanuki plumbs the reaches of your fuck-toy’s unresisting throat, that tightness transforms into a dick-wringing clench.");
	output("\n\n<i>“Ooooh, no gag reflex?”</i> Kiro marvels, <i>“I think I’m in love.”</i> She advances until the goblin’s button nose all but vanishes into the folds of tanuki-sheath.");
	output("\n\nMitzi’s eyes roll back, but she does not struggle. Her hips twitch once, feebly attempting to grind her pearlescent clitty against something, then she settles for wrapping her tail around her own waist like a belt, curling the spaded tip between her thighs for a gentle rub against her neglected nub. That contact is all it takes to put Mitzi on fuck-autopilot. Her hips gyrate and swivel against you. The near-rigid clench to which you had become accustomed shifts into complimentary undulations, rocking your [pc.cock " + x + "] to the same tempo of your emerald slut’s egg-bearing hips.");
	output("\n\nKiro must feel left out. After watching Mitzi milk you for the better part of a minute in stationary silence, she tightens her hair-tugging grip and growls, <i>“I’ll set the rhythm, sluts!”</i> Rocking back slightly, the chocolate-hued herm exposes a few inches of glossy horse-cock before slamming it back into the salivating joy-tube that is Mitzi’s throat. That impact rockets through the shortstack’s body all the way to your crotch, pushing you back a half step before the motion is reversed - exposing some of your own length to air that seems frigid in comparison to the drooling slut’s torrid cunt.");
	output("\n\nInstinct takes over. You slamfuck back in, hilting into Mitzi so forcefully that a fan of feminine lubrication squirts out in almost every direction. In the process, you dislodge Kiro’s sheath-deep slut-fuck and force her to thrust <i>again</i>. Grinning joyfully, Kiro somehow takes control of threesome entirely by how she pounds the greenskin’s mouth. Years upon years of sexual prowess are brazenly displayed in the way she fucks your [pc.cockNoun " + x + "] with the goblin’s gushing pussy. Kiro is a sex maestro of the highest order, and today, Mitzi is her prized instrument.");
	output("\n\nYou’re no slouch yourself - even if you’re too stunned by the slip-sliding, simmering depths to rock the boat just yet. You relish the tight grip of Mitzi’s cunt. She’s the fuck every virgin dreams of, knowing how to squirm and please. Even impaled between rutting");
	if(pc.biggestCockLength() >= 12) output(", big-dicked");
	output(" god" + pc.mf("s","desses") + ", you can tell that she’s working to please you both. No mere human vagina could contort and caress the way hers is, and though you can’t see it, you’re pretty sure her tongue is dancing across every inch of Kiro’s modded genitalia it can reach. She’s half the reason you let Kiro set the pace for so long, but she’s yours to command - not Kiro’s.");
	output("\n\nA firmer grip on the goblin and a quicker, more assertive hump is all it takes to take the lead. Kiro fakes a shocked look for good measure, but it is soon replaced with a wink and a sultry smile. She joins right into your crotch-slapping melody, though none too gently. She ruts against Mitzi’s face with competitive zest. Sloppy gurgles prove it. Excess spit sloughs down her swelling, swaying balls in a seemingly endless tide. It seems Mitzi likes the taste of her pre, or her sweat, or her dick, or even her musky sack. Whatever it is, the goblin has transitioned into a fountain of saliva.");
	output("\n\nYou’d be worried about her if you didn’t hear the occasional violent inhale coming from her nose.");
	output("\n\nKnowing that your living sextoy is alive, well, and having the time of her life makes it easier to stop thinking and just enjoy yourself. You’re free to get rougher, free to jackhammer her plush ass until it’s rippling with the force of your impacts. You can savor the fragrant feminine scent that’s drenching your crotch or admire the constantly erupting flecks of pussy-joy as they sparkle with a thousand reflections of the chamber’s lights. Most importantly, you can revel in the ecstatic delight of your own mounting climax.");
	output("\n\nExcept Kiro cums first.");
	output("\n\nNo longer restrained by a lifetime of desensitization, the kui-tan is free to climax whenever her lusts request her to, and it would seem Mitzi’s pillowy, airtight lips were all the convincing Kiro’s nuts needed to unload. Every gurgling ejaculation has the bimbofied gabilani squeezing tighter and tighter. In a way, it feels almost like Kiro is pressurizing Mitzi, inflating her with so much jism that the cum-drunk toy may as well be an organic vise - only this vise continues to drip and leak and coax your [pc.cockHead " + x + "]" + (pc.cocks[x].cLength() >= 9 ? " against a very open, very excited cervix.":" to nestle as deeply inside as it can."));
	output("\n\nYou orgasm next, right on cue. Kiro may still be squirting, but getting to simultaneously pump in your own [pc.cum] at the same time is a whole other kind of experience. Your jaw drops from pleasure as you baste Mitzi’s wide-open womb ");
	var cummies:Number = pc.cumQ();
	if(cummies < 50) output("in spurt after spurt");
	else if(cummies < 350) output("in gushing spurt after spurt");
	else if(cummies < 2000) output("with individual spurts the size of shot glasses");
	else if(cummies < 10000) output("with goblin-flooding gushes");
	else if(cummies < 50000) output("with enough reproductive juices to drown her");
	else if(cummies < 100000) output("with geyser-like eruptions of reproductive might");
	else 
	{
		output("with eruptions so virile they seem to distort reality itself");
		if(silly) mitzi.createStatusEffect("RealityCummiesNotice");
	}
	output(". No matter how great any given pulse might feel, the next is better. You hang on in spite of your shaky [pc.legOrLegs] and bite your [pc.lip], mustering enough will to look up at Kiro one last time before your eyes roll back.");
	output("\n\nShe’s holding up her hand with a dazed, blissful grin, waiting for you to complete the Eiffel Tower.");
	output("\n\nYou barely manage to slap your hand against hers before doubling over the inflated goblin, " + pc.mf("grunting","squeaking") + " in " + (pc.balls > 0 ? "ball":"dick") + "-draining joy");
	if(pc.tallness < 60) output(", your cheek warm on her sweat-slick skin");
	else output(", Kiro’s " + (kiro.breastRows[0].breastRating() >= 32 ? "breast":"belly") + "fur silky and warm against your cheek");
	output(". Touch dominates your senses as you give in fully to the orgiastic ecstasy, aware of little more than how good it feels to finish climaxing inside Mitzi.");
	pc.applyPussyDrenched();
	processTime(25);
	mitzi.loadInMouth(pc);
	mitzi.loadInCunt(kiro,0);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",finishTheMitziBulgingWivKiro,x);
}

public function finishTheMitziBulgingWivKiro(x:int):void
{
	clearOutput();
	showBust(kiroBustDisplay(true),mitziBustString(true));
	showName("KIRO\n& MITZI");
	author("Fenoxo");
	output("You recover your wits in a bed-bound pile of bodies. Mitzi is, predictably nestled between you and Kiro, yet not as you remember her. She’s obscenely rounded, pumped up like a gorgeous green beach ball. Despite no longer holding your [pc.cock " + x + "], the goblin slut wears a blissful, contented smile as she reaches over to rub your shoulder. Cumstreaks cover her face from brow to chin, where a viscous blob hangs on for dear life. Kiro lies behind her, propped up on one arm and grinning broadly.");
	output("\n\n<i>“Quite the cock-sucker you’ve got there, Angel. I’ll have to borrow her sometime. Or maybe you want go for a second round?”</i>");
	output("\n\n...Maybe after you grab a shower. The lower half of your body is drenched with Mitzi’s orgasmic fluids.	");
	if(mitzi.hasStatusEffect("RealityCummiesNotice"))
	{
		output("\n\n(<b>Achievement Unlocked - Reality Distorting Cumshot!</b>)");
		mitzi.removeStatusEffect("RealityCummiesNotice");
	}
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}