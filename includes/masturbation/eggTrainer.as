import classes.Characters.PlayerCharacter;
import classes.Items.Toys.EggTrainer;

//TamaniCorp Egg Trainer
//By Savin

/*Notes
Bought from some kinda sextoy store -- same place you'd get BionaHoles, I guess??? 

Anyway. It's a bright pink box with a TamaniCorp logo stamped on the side. On one of its top edges in a big, fat plastic tube covered with nubs all along the length. This is basically a mechanical tentacle-cock that will oviposit you. The rest of the box's top slides off, revealing a pool of perpetually warm cleaning gel that the eggs rest in when not in use. You can squat on the edge, get tenta-egged, then pull the tube out and squirt your eggy load right back into the pool without really moving. Convenient! 

Has three settings: Lay Training, Carry Training, or Faux Preg. 

Lay Training has the tube oviposit you with eggs and a shit-ton of sex-lube, making the insertion and oviposition easy. Once it's done, the tube slides out of you, and you're able to squeeze the lil' plastic eggs back out in the cleaning pool. Plop plop. Depending on how elastic you are, you'll get more eggs.

Carry Training's a bit more complex. The machine fucks you full of as many eggs as you can possibly carry, and then seals them into your womb with a sealant lube. You can then walk around with a belly-stretching gut of eggs for about a week until the sealant wears off, and then you give "birth." 

Faux Preg is the real deal, though. The tentacle oviposits you with a single egg, and then seals it in there like with Carry Training. This time, though, the egg starts growing. And growing. And growing. Over the course of a few weeks, it expands until you look nine+ months pregnant, and then just STAYS THERE. Basically meaning you get to have a nice, plump preg-belly forever. Until you go back to the Egg Trainer and hit the extract button, which will have the tentacle go in and "deflate" the egg for you. 

IMPORTANT
This introduces an "Egg Trained" score for the PC. The more ET you have, the more eggs that the machine will shove up yer butt. Rated from 0-5.

0: Random 6-12 eggs. Can't use Carry Training or Faux Preg Egg options.
1: Random 10-25 eggs. Carry Training unlocked. 
2: Random 20-40 eggs. Huge, permanent looseness and wetness bonus. 
3: Random 35-70 eggs. Faux Preg Egg unlocked. 
4: Random 50-80 eggs. Moderate raw Bonus Capacity for all holes.
5: Random 75-100 eggs. Huge, permanent looseness bonus. 

You lose 1 level of Egg Trained each week you go without either using the machine or having some kind of egg in your hole. 
*/

//Getting the Egg-Trainer

//Bought in any sex-shop of your choosing. Like the Dong Designer, it slows you down until you install it (cuz it's xbawksheug and heavy). 
//Cost: 7,500C

//Shop Tooltip: A bright pink box about a yard long, emblazoned with the TamaniCorp logo on either side. The Egg Trainer advertises itself as your one-stop-shop for your oviposition needs. The trainer, as its name suggests, induces artificial pregnancy via inserted eggs that swell to huge sizes, or helps to train your body to take gargantuan loads of alien eggs. Satisfaction guaranteed with every use!

//Ship Tooltip: Your bright pink Egg Trainer is sitting in the corner, rumbling slightly as the heating and cleaning processes inside it percolate. {if PC has a belly full of eggs: You run a hand across your swollen belly, vaguely wishing you could squat the current load out... only to get another mind-melting orgasm from the next batch going in! //if PC has a faux-preg egg: You run a hand across your [pc.belly]. You could get your Faux Preg Egg out at any time with the device, if you wanted to.}

//Installing it in the Ship
//Inventory -> Egg Trainer. Sets it up in the Cargo hold, just like a Dong Designer. 
public function eggTrainerInstallation():Boolean
{
	clearOutput();
	showBust("EGG_TRAINER");
	author("Savin");

	if(InShipInterior())
	{
		showName("\nINSTALLING...");
		output("You heft the giant pink box down onto the deck of your cargo hold and take a deep breath, happy to have the extra weight off you. Though something tells you that if you end up actually using this thing, you’ll just end up with a whole new chunk of extra weight... For the moment, though, you distract yourself from wandering thoughts by hooking the Egg Trainer up to a power outlet nearby. The moment you do, it thrums to life with a mechanical shudder and a cheery digital tune played from a small speaker under a flickering holographic display.");
		output("\n\nThe readout shows the Tamani Corp logo for a moment before resolving into a product registration screen, prompting you for your email address. You give it somewhat reluctantly - there doesn’t seem to be any way to skip the screen - and watch as the screen fades out and into a main menu of sorts, indicating a button labeled <i>“Tutorial”</i>. You click it.");
		output("\n\nA cute, hand-drawn-looking doodle of the machine dances around underneath the option buttons, cavorting its way to the center of the screen. After a moment, a facsimile of a person appears on the menu, sitting down on the saddle-like seat on the far side of the box, straddling it like an animal - or a lover - with spread legs. The image of the training box cuts away, showing a tube-like tentacle rising from within, lurching up through the bottom of the saddle-seat and into the box’s owner. The view then shifts to a tub of eggs floating in a bubbling liquid, which start to get sucked up through one end of the tube like a vacuum, pumping into the cartoon human.");
		output("\n\nYou watch with wide eyes as the tentacle pumps its rider full of eggs, one after another, until his belly is swollen to bursting with them, looking as gravid as a woman nine months pregnant. A cartoon boner appears between his legs as the eggs flood in, erupting in a white geyser just as the final one pops into his ass. The tentacle then withdraws, leaving the rider agape... and letting the eggs fall out, one after the other, causing the animated figure to climax messily as his belly shrinks back down and the pool refills with its eggs.");
		output("\n\nWell, that doesn’t leave much to the imagination... You turn your attention to the buttons appearing on the screen, showing you what this lascivious device is offering.");
		output("\n\n<b>You’ve installed a TamaniCorp Egg Trainer in your ship! You can access it from the storage menu.</b>");
		processTime(4);
		flags["EGG_TRAINER_INSTALLED"] = 1;
		//Consume the item
		pc.destroyItemByClass(EggTrainer);
		//Display egg trainer options here.
		eggTrainerMenu();
		
		return true;
	}
	
	showName("EGG\nTRAINER");
	output("You must be onboard your ship in order to install the Egg Trainer.");
	
	return false;
}
public function eggTrainerUninstallation():void
{
	clearOutput();
	showBust("EGG_TRAINER");
	showName("\nUNINSTALLING...");
	
	output("You take some time to uninstall the dedicated egg-implanting device.");
	output("\n\n<b>You no longer have the TamaniCorp Egg Trainer installed!</b>");
	
	processTime(8);
	flags["EGG_TRAINER_INSTALLED"] = undefined;
	
	//clearMenu();
	//addButton(0, "Next", mainGameMenu);
	output("\n\n");
	quickLoot(new EggTrainer());
}

//Approach the Box
//Repeat. Storage -> Egg Trainer
public function installedEggTrainerBonus(btnSlot:int = 0):void
{
	output("\n\nYour bright pink Egg Trainer is sitting in the corner, rumbling slightly as the heating and cleaning processes inside it percolate.");
	//if PC has a belly full of eggs:
	if(pc.hasPregnancyOfType("EggTrainerCarryTraining")) output(" You run a hand across your swollen belly, vaguely wishing you could squat the current load out... only to get another mind-melting orgasm from the next batch going in!");
	//if PC has a faux-preg egg: 
	else if(pc.hasPregnancyOfType("EggTrainerFauxPreg")) output(" You run a hand across your [pc.belly]. You could get your Faux Preg Egg out at any time with the device, if you wanted to.");
	
	addButton(btnSlot,"EggTrainer",repeatEggTrainerApproach,undefined,"Egg Trainer","Put your Egg Trainer to use.");
}
public function repeatEggTrainerApproach():void
{
	clearOutput();
	showBust("EGG_TRAINER");
	showName("EGG\nTRAINER");
	author("Savin");
	output("You find yourself drawn back to the bubblegum-pink Tamani Corp box sitting in your hold. The Egg Trainer is humming ever so faintly, thrumming as its internal mechanisms slosh around and heat the dozens and dozens of eggs inside it. It smells faintly of lilacs and lube. The saddle-seat atop it beckons you, inviting you to take a seat and take a load in.");
	if(pc.lust() >= 75 || pc.libido() >= 75) output(" You’re already shuddering with anticipation....");
	output("\n\nThe holo-screen on the front of the box presents you with several options....");
	
	output("\n\n<b><u>Statistics</u></b>");
	output("\n<b>* Egg Trainer Level:</b> " + (flags["EGG_TRAINING"] != undefined ? flags["EGG_TRAINING"] : "<i>Untrained</i>"));
	if(pc.hasStatusEffect("Ovalasting"))
	{
		output("\n<b>* Ovalasting Level:</b> " + (flags["EGG_TRAINING_OVALASTING_LEVEL"] != undefined ? flags["EGG_TRAINING_OVALASTING_LEVEL"] : "<i>Untrained</i>"));
		if(pc.statusEffectv1("Ovalasting") > 0)
		{
			output("\n<b>* Ovalasting Implant," + (pc.vaginas.length > 1 ? " First" : "") + " Vagina:</b> Active");
			if(pc.hasStatusEffect("Ovalasting Big Egg " + 0) > 0) output(", Fertilized");
		}
		if(pc.statusEffectv2("Ovalasting") > 0)
		{
			output("\n<b>* Ovalasting Implant, Second Vagina:</b> Active");
			if(pc.hasStatusEffect("Ovalasting Big Egg " + 1) > 0) output(", Fertilized");
		}
		if(pc.statusEffectv3("Ovalasting") > 0)
		{
			output("\n<b>* Ovalasting Implant, Third Vagina:</b> Active");
			if(pc.hasStatusEffect("Ovalasting Big Egg " + 2) > 0) output(", Fertilized");
		}
		if(pc.statusEffectv4("Ovalasting") > 0)
		{
			output("\n<b>* Ovalasting Implant, Anus:</b> Active");
			if(pc.hasStatusEffect("Ovalasting Big Egg " + 3) > 0) output(", Fertilized");
		}
	}
	output("\n\n");
	
	processTime(1);
	eggTrainerMenu();
}

//Egg Trainer Options
public function eggTrainerMenu():void
{
	clearMenu();
	//[Raw Tentacle] [Egg Training] [Carry Training] [Faux Preg] [Leave]
	addButton(0,"Raw Tentacle",rawTentacleGogogo,undefined,"Raw Tentacle","No eggs this time. You just want to feel that slippery tentacle slithering inside you...");
	if(pc.findEmptyPregnancySlot(0) != -1)
	{
		var isExperienced:Boolean = false;
		if(flags["EGG_TRAINING"] >= 4) isExperienced = true;
		
		addButton(1,"Egg Trainer",eggTrainingMachineTime,undefined,"Egg Training","Have the machine fill you with eggs and lube, then lay them right back into the cleaning pool. Something tells you between a tentacle fucking and a two-way oviposition, you’d be in for a wild ride.");
		
		if(flags["EGG_TRAINING"] == undefined) addDisabledButton(2,"Carry Train","Carry Train","You aren’t experienced enough with this machine to try this.");
		else addButton(2,"Carry Train",carryTrainingWithEggMachine,undefined,"Carry Train","Have the tentacle-device fill you with eggs. This option advertises TamaniCorp brand Lock-Lube, made to ensure that your eggs are lodged inside you for a good long while... You’ll be carrying so many eggs that you’ll look positively pregnant for about a week, it tells you.");
		
		if(isExperienced) addButton(3,"Faux Preg",fauxPregImplantation,undefined,"Faux Preg","This special “service” causes the tentacle to fuck a single, unique egg into you - what the screen labels a “faux-preg egg.” This special egg lodges inside you and grows, grows, grows inside you until your belly is completely gravid. And there’s no way it’s coming out once it goes in without some medical intervention, or the help of the Egg Trainer machine. All the joys of being perpetually, gravidly pregnant without the inevitable childbirth.");
		else addDisabledButton(3,"Faux Preg","Faux Preg","You are not yet experienced enough for this. You’ll have to work up to it.");
		
		var ovaTooltip:String = "Get yourself sorted with a single, spooge-sponging, self-replicating egg.";
		if(flags["EGG_TRAINING_OVALASTING"] == undefined) ovaTooltip = "This button is dull. It looks like you need to try some of the other options first before the machine will activate something that’s obviously for experienced users only.";
		else if(flags["EGG_TRAINING_OVALASTING"] == 0) ovaTooltip = "Some sort of permanent egging procedure?";
		if(isExperienced) addButton(4, "Ovalasting", eggTrainerOvalastingMenu, undefined, "Ovalasting", ovaTooltip);
		else addDisabledButton(4, "Ovalasting", "Ovalasting", "You are not yet experienced enough for this. You’ll have to work up to it.");
	}
	else
	{
		addDisabledButton(1,"Egg Training","Egg Training","You have no room for eggs.");
		addDisabledButton(2,"Carry Train","Carry Train","You have no room for eggs.");
		addDisabledButton(3,"Faux Preg","Faux Preg","You have no room for eggs.");
		addDisabledButton(4, "Ovalasting", "Ovalasting", "All holes are occupied.");
	}
	if(pc.hasPregnancyOfType("EggTrainerFauxPreg")) addButton(3,"Remove Egg",eggTrainerPreggoRemoval,undefined,"Remove Egg","Have the Egg Trainer remove your Faux Preg Egg... somehow?");
	// Remove OL Egg
	// Only possible if OL egg is not currently fertilized
	// Prioritizes most recently implanted if multiple
	var ovaEffect:StorageClass = pc.getStatusEffect("Ovalasting");
	if(ovaEffect != null)
	{
		if(pc.hasPregnancyOfType("OvalastingEggPregnancy")) addDisabledButton(9, "Rem. OL Egg", "Remove Ovalasting Egg", "The interface flashes ‘IN PROGRESS’ in red when you press this. Looks like you’re going to have to see the whole incubation through before the machine is willing to reverse the procedure!");
		else
		{
			var ovas:int = 0;
			if(ovaEffect.value1 != 0) ovas++;
			if(ovaEffect.value2 != 0) ovas++;
			if(ovaEffect.value3 != 0) ovas++;
			if(ovaEffect.value4 != 0) ovas++;
			if(ovas + pc.totalPregnancies() >= 4) addDisabledButton(4, "Ovalasting", "Ovalasting", "All holes are occupied.");
			addButton(9, "Rem. OL Egg", eggTrainerOvalastingRemovalMenu, undefined, "Remove Ovalasting Egg", ("Get " + (ovas == 1 ? "the Ovalasting Egg" : "one of the Ovalasting Eggs") + " out of you."));
		}
	}
	
	if(pc.hasPregnancyOfType("EggTrainerFauxPreg") || pc.hasPregnancyOfType("OvalastingEggPregnancy")) addDisabledButton(13, "Uninstall", "Uninstall Device", "It might not be a good idea to uninstall the device while still implanted with eggs.");
	else addButton(13, "Uninstall", eggTrainerUninstallation, undefined, "Uninstall Device", "Unplug the machine and put it in your inventory.");
	
	addButton(14,"Leave",leaveEggMachine);
}

//Raw Tentacle
//No eggs this time. You just want to feel that slippery tentacle slithering inside you...
//Significantly increase looseness of hole fucked.
public function rawTentacleGogogo():void
{
	clearOutput();
	showBust("EGG_TRAINER");
	showName("EGG\nTRAINER");
	var x:int = pc.findEmptyPregnancySlot(0);
	//If all holes full, pick a vagina.
	if(x == -1) 
	{
		if(pc.hasVagina()) x = rand(pc.totalVaginas());
	}
	if(x == 3) x = -1;

	output("You press the cheerful blue <i>“Tentacle Training”</i> button, which somehow seems to be the <i>least</i> invasive of the options presented. The holo-screen instructs you to disrobe and take a seat on the saddle. The device will take care of the rest... though a second pop-up helpfully mentions that you might want to hold on to something. You gulp and do as it commands, setting aside your [pc.gear] and ");
	if(pc.isTaur()) output("awkwardly moving to position your lower body over the entire box, angling your [pc.vagOrAss " + x + "] towards the saddle.");
	//if naga: 
	else if(pc.isNaga()) output("coil yourself around the box, angling your [pc.vagOrAss " + x + "] into the fuck-saddle as best you can.");
	else if(pc.isGoo()) output("squirm around the box, all but enveloping the entire box and wiggling your behind into the saddle.");
	else output("swing a leg awkwardly over the edge of the box, plopping down in the seat of the saddle.");
	output(" The moment you’re seated, the holoscreen on the front of the box swivels around to face you, and a pair of metal bars slide out from the sides of the box: handlebars.");

	output("\n\nNothing happens for a moment, until you lean forward over the box and take hold of the metal bars. You feel a faint heat in the metal, and a vibration as the machine ");
	if(pc.legCount <= 1) output("under you ");
	else output("between your [pc.legs] ");
	output("hums to life. The saddle shifts underneath you, and you feel something slide right beneath your rump: a hole opening up under your butt.");
	if(pc.balls > 0)
	{
		if(pc.balls > 1) output(" Your [pc.balls] immediately flop");
		else output(" Your [pc.ball] immediately flops");
		output(" into the hole, dangling into the black depths of the bubble-gum pink fuck machine.");
	}
	output(" The holo-screen beeps and displays a cartoonish red <i>“HANG ON!”</i> in huge capital letters, and you feel the ever-present rumbling in the machine intensify.");

	output("\n\nSomething moves violently underneath you, and you feel a sudden rush of wet heat splatter against your [pc.vagOrAss " + x + "]. You gasp as heated lube squirts through your crack");
	if(x >= 0) output(" and all over your groin");
	output(", and the stuff keeps coming and coming, like a sexified bidet. The holo-screen tells you to relax, breathe deep, and relax your body: your role is entirely passive in this. A ragged breath escapes your lips, which tremble with wet pleasure. You’re not sure if this lube-geyser has some kind of aphrodisiac mixed in, or if the constant squirt of hot, sticky, wetness against your hole is really just <i>that</i> pleasurable. Whatever the answer is, it’s only a prologue for what’s to come.");

	output("\n\nWhich comes right about now, as it happens. You feel something thick and wriggling moving up through the stream of lube battering your backside, followed by a plasticy sensation against your [pc.vagOrAss " + x + "]. Your whole body clenches as a pressure begins to build, insistent but gentle, pressing in amidst the sea of lube coating your hole until you start to feel your body stretch. The tip of the tendril is nice and rounded, smooth and latexy like a proper dildo, though you instantly feel that something’s not quite human about it: the head seems hollow, like a crater caving in to reveal the long tube leading into the depths of the device it’s attached to. Even this inner passage is squirting lube into you, blazing its own trail through your ");
	if(x >= 0) output("pussy’s clenching walls");
	else output("bowels");
	output(" as it starts to worm its way into you.");
	if(x >= 0) pc.cuntChange(x, pc.vaginalCapacity(x));
	else pc.buttChange(pc.analCapacity());

	output("\n\nThe tentacle doesn’t get an inch in before you feel something <i>else</i> coming with it. A ring of short, stubby nubs ring the tube, grinding into your [pc.vagOrAss " + x + "] on a bed of hot lube. You groan, eyes wide and knuckles going white on the handlebars. Instinctively, your body tries to fight back, to push the invading thing out of you, but it’s so slick and so strong that your defenses simply cave to the incessant pressure the machine puts on you. All that’s left to do is feel the thing squirming inside you, writhing about inside your ");
	if(x >= 0) output("twat");
	else output("ass");
	output(" with mounting speed. More and more of the little nubs snake into you, rubbing pleasurably against your ");
	if(x >= 0) output("pussy’s walls");
	else if(!pc.hasCock()) output("anal walls");
	else output("prostate");
	output(".");

	output("\n\nWhat feels like the better part of a foot lodges in you before the tentacle seems to think it’s done its job. At least, the prologue. The tentacle goes completely rigid for the span of a heartbeat, making sure you’re nice and stretched out around its thick girth, before it starts to thrust. It moves fast and furious, pounding into you with its nub-ringed shaft.");
	if(pc.hasCock())
	{
		output(" Your [pc.cock] bounces, half hard and leaking pre all across your thighs. Pleasure hammers through your cock like it’s ready to spurt already.");

	}
	if(pc.biggestTitSize() >= 1) 
	{
		output(" Your hands are drawn from the handlebars and onto your [pc.breasts], cupping and squeezing your tits");
		if(pc.isLactating()) output(" until milk drizzles down around your fingers");
		output(".");
	}
	output(" Biting your lip and clenching your fingers tight, you find yourself bucking your [pc.hips] against the curve of the saddle.");

	output("\n\nThe tentacle squirts even more lube into you, letting itself fuck you harder. You moan like a bitch in heat, riding the writhing cock like a cow" + pc.mf("boy","girl") + " until the pleasure’s just too much to bear. ");
	if(pc.hasCock()) output("Your cock cums first, geysering spooge across the top of the box and the deck of your cargo hold. ");
	output("A scream of pleasure tears through your throat, arching your back, demanding you squeeze hard around the spasming, lube-spraying device.");

	output("\n\nThe fucking couldn’t have lasted more than a minute, but as suddenly as it started, the tendril goes rigid once more... and the begins to withdraw. You give one last orgasmic shudder as the rounded ovipositor pops free of your [pc.vagOrAss " + x + "] and slinks like a snake back into the embrace of the rumbling machine.");

	output("\n\nYou flop forward onto your [pc.belly] with a contented moan, breathing hard as what feels like gallons of lube drools back into the hole in the saddle, pouring out of your hard-fucked hole. The holo-screen, now inches from your face, displays <i>“Hope you enjoyed, sugar~!”</i>");
	output("\n\nYou let a few minutes of air-drying pass you by before you grab your gear and stagger off to the shower.");
	
	processTime(22);
	pc.orgasm();
	pc.shower();
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Increment Egg Training level
public function eggTrainerTrained(x:int):void
{
	if(flags["EGG_TRAINING"] != 5) IncrementFlag("EGG_TRAINING");
	if(pc.hasStatusEffect("Ovalasting"))
	{
		if(flags["EGG_TRAINING_OVALASTING_LEVEL"] != 10) IncrementFlag("EGG_TRAINING_OVALASTING_LEVEL");
		if(flags["EGG_TRAINING_OVALASTING_LEVEL_MAX"] == undefined || flags["EGG_TRAINING_OVALASTING_LEVEL_MAX"] < flags["EGG_TRAINING_OVALASTING_LEVEL"]) flags["EGG_TRAINING_OVALASTING_LEVEL_MAX"] = flags["EGG_TRAINING_OVALASTING_LEVEL"];
	}
}

//Egg Training
//Have the machine fill you with eggs and lube, then lay them right back into the cleaning pool. Something tells you between a tentacle fucking and a two-way oviposition, you’d be in for a wild ride.
//Significantly increase looseness of hole fucked.
public function eggTrainingMachineTime():void
{
	clearOutput();
	showBust("EGG_TRAINER");
	showName("EGG\nTRAINER");
	author("Savin");

	var x:int = pc.findEmptyPregnancySlot(0);
	//If all holes full, pick a vagina.
	if(x == -1) 
	{
		if(pc.hasVagina()) x = rand(pc.totalVaginas());
	}
	if(x == 3) x = -1;

	output("You press the bright pink <i>“Egg Training”</i> button, ");
	//lf first time: 
	if(flags["EGG_TRAINING_TIMES"] == undefined) output("ready to see what this machine’s really about");
	else output("eager to train your body to take bigger and bigger loads of eggs - with the promise of more and more mind-melting orgasms as reward");
	output(". The screen dings cheerfully, instructing you to disrobe and take a seat on the saddle. It further recommends you use this option on an empty stomach. Your belly is in for quite the strain, you ");
	if(flags["EGG_TRAINING_TIMES"] == undefined) output("imagine. You warily set your gear aside, wondering just what this device has in store for you.");
	else output("know all too well. You wiggle out of your [pc.gear], heart already hammering with anticipation.");
	output(" Following the screen’s instructions, you ");
	if(pc.isTaur()) output("awkwardly move to position your lower body over the entire box, angling your [pc.vagOrAss " + x + "] towards the saddle.");
	else if(pc.isNaga()) output("coil yourself around the box, angling your [pc.vagOrAss " + x + "] into the fuck-saddle as best you can.");
	//if goo:
	else if(pc.isGoo()) output("squirm around the box, all but enveloping the entire box and wiggling your behind into the saddle.");
	else output("swing a leg awkwardly over the edge of the box, plopping down in the seat of the saddle.");
	output(" The moment you’re seated, the holoscreen on the front of the box swivels around to face you, and a pair of metal bars slide out from the sides of the box, giving you something to hold onto. Between them, the metal top of the box slides back underneath the saddle, revealing a tub of sloshing off-green liquid bubbling inside it. What looks like hundreds of small, yellow plastic eggs slosh around in the pool, piling up against a single hole on the wall right under the saddle. Doesn’t take a genius to figure out where that leads...");
	output("\n\nNothing happens for a moment, though, until you lean forward over the box and take hold of the metal bars. A faint heat starts rising from the metal, and you feel a shuddering vibration as the machine ");
	if(pc.legCount <= 1) output("under you ");
	else output("between your [pc.legs] ");
	output("hums to life. The sea of liquid inside the box starts heating up, bubbling and sloshing like a washing machine on high - and the box you’re leaning on heats up, as hot as a lover’s body. The saddle shifts underneath you, and you feel something slide right beneath your rump: a hole opening up under your butt.");
	if(pc.balls > 0)
	{
		if(pc.balls > 1) output(" Your [pc.balls] immediately flop");
		else output(" Your [pc.ball] immediately flops");
		output(" into the hole, dangling into the black depths of the bubble-gum pink fuck machine.");
	}
	output(" The holo-screen beeps and displays a cartoonish red <i>“HANG ON!”</i> in huge capital letters, and you feel the ever-present rumbling in the machine intensify.");

	output("\n\nSomething moves violently underneath you, and you feel a sudden rush of wet heat splatter against your [pc.vagOrAss " + x + "]. You gasp as heated lube squirts through your crack");
	if(x >= 0) output(" and all over your groin");
	output(", and the stuff keeps coming and coming, like a sexified bidet. The holo-screen tells you to relax, breathe deep, and relax your body: your role is entirely passive in this. <i>“A good incubator lies back with spread legs and a smile for his or her ovipositor,”</i> the screen tells you. A ragged breath escapes your lips, which tremble with wet pleasure. You’re not sure if this lube-geyser has some kind of aphrodisiac mixed in, or if the constant squirt of hot, sticky, wetness against your hole is really just <i>that</i> pleasurable. Whatever the answer is, it’s only a prologue for what’s to come.");

	output("\n\nWhich comes right about now, as it happens. You feel something thick and wriggling moving up through the stream of lube battering your backside, followed by a plasticy sensation against your [pc.vagOrAss " + x + "]. Your whole body clenches as a pressure begins to build, insistent but gentle, pressing in amidst the sea of lube coating your hole until you start to feel your body stretch. The tip of the tendril is nice and rounded, smooth and latexy like a proper dildo, though you instantly feel that something’s not quite human about it: the head seems hollow, like a crater caving in to reveal the long tube leading into the depths of the device it’s attached to. Even this inner passage is squirting lube into you, blazing its own trail through your ");
	if(x >= 0) output("pussy’s clenching walls");
	else output("bowels");
	output(" as it starts to worm its way into you.");
	if(x >= 0) pc.cuntChange(x, pc.vaginalCapacity(x));
	else pc.buttChange(pc.analCapacity());

	output("\n\nThe tentacle doesn’t get an inch in before you feel something <i>else</i> coming with it. A ring of short, stubby nubs ring the tube, grinding into your [pc.vagOrAss " + x + "] on a bed of hot lube. You groan, eyes wide and knuckles going white on the handlebars. Instinctively, your body tries to fight back, to push the invading thing out of you, but it’s so slick and so strong that your body simply gives in to the incessant pressure the machine puts on you. All that’s left to do is feel the thing squirming inside you, writhing about inside your ");
	if(x >= 0) output("twat");
	else output("ass");
	output(", faster and faster. More of the little nubs snake in with the shaft, rubbing pleasurably against your ");
	if(x >= 0) output("pussy’s walls");
	else if(!pc.hasCock()) output("anal walls");
	else output("prostate");
	output(". This is just a taste of the pleasure your Egg Trainer is promising, though.");

	output("\n\nWhat feels like the better part of a foot lodges in you before the tentacle seems to think it’s deep enough to start <i>really</i> working. The tentacle goes completely rigid for the span of a heartbeat, making sure you’re nice and stretched out around its thick girth, before it starts to swell and shudder, and you feel something moving <i>inside</i> it. Your eyes go wide as the tentacle hilted in your [pc.vagOrAss " + x + "] stretches out, passing the first thick knot of plastic through your ");
	if(x >= 0) output("pussy lips");
	else output("sphincter");
	output(". A much stronger geyser of lube squirts out of the tentacle-dildo’s crown before the latex cockhead engorges wetly, and you feel something thick and round and sloppy-wet shoot into your ");
	if(x < 0) output("bowels");
	else output("womb");
	output(".");

	output("\n\nPleasure rocks your world as the first egg lodges inside you. Your hips rock forward, bucking on the thick member in your [pc.vagOrAss " + x + "] and gasping for breath.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] bounce");
		if(pc.cockTotal() == 1) output("s");
		output(", half hard and leaking pre all across your thighs. Pleasure hammers through your cock like it’s ready to spurt already.");
	}
	if(pc.biggestTitSize() >= 1)
	{
		output(" Your hands are drawn from the handlebars and onto your [pc.breasts], cupping and squeezing your tits");
		if(pc.isLactating()) output(" until milk drizzles down around your fingers");
		output(".");
	}
	output(" Moaning like a bitch in heat, you ride the writhing cock like a cow" + pc.mf("boy","girl") + " until the pleasure’s just too much to bear.");
	if(pc.hasCock()) output(" Your cock cums first, geysering spooge across the top of the box and the deck of your cargo hold.");
	output(" A scream of pleasure tears through your throat, arching your back, demanding you squeeze hard around the spasming, lube-spraying device.");

	output("\n\nAnd that was just the first egg. Another thick engorgement wriggles its way up through the tube, making it push out on your lubed-up walls, rubbing its dozens and dozens of rounded nubs against you. The orgasmic pleasure tearing through you refuses to abate, especially with that kind of handling - and with another thick, heavy bulb plopping into your body, followed by another... and another. You watch with bulging eyes as egg after egg slurps out of the see-through tub and vanishes into the throbbing tube beneath you. Your [pc.butt] bounces on the fuck-saddle, riding that plastic shaft as it thoroughly breeds your [pc.vagOrAss " + x + "] with its eggy load.");

	// @eggTraining: eggTrained pc
	// That’s a new stat to see how many eggs you can take!
	if(flags["EGG_TRAINING"] == 1)
	{
		output("\n\nThe tentacle squirts and thrusts, laying a belly-straining load of tumbling spheres inside you. You lose count after six big, orgasmic pops that bloat your ");
		if(x >= 0) output("womb");
		else output("gut");
		output(". By the time the wriggling tentacle finishes, you’re a swollen and sordidly wet mess, drooling hot lube like a waterfall from your well-fucked hole. As the tentacle starts to withdraw, one of your hands slips down to your belly, feeling a distinct set of uneven bulges pushing against your [pc.skin] from within.");
	}
	else if(flags["EGG_TRAINING"] <= 3 && flags["EGG_TRAINING"] > 1)
	{
		output("\n\nThe tentacle just keeps on fucking you, ceaselessly filling your belly with its artificial get. Egg after egg squeezes through its bloated head and into your ");
		if(x >= 0) output("womb");
		else output("ass");
		output(" on a constant bed of heated sex lube until you’re positively stuffed with them. There’s well over a dozen inside you, maybe two - your belly is bloated by the mass of eggs, and you can feel the added weight of them hanging heavily in front of you, making you lean forward and rest your pregnant gut on the top of the machine. Your skin bulges and shifts unevenly, and your whole body feels incredibly wet - even as lube absolutely pours out of your gaping hole.");
	}
	else if(flags["EGG_TRAINING_TIMES"] > 3)
	{
		output("\n\nThe familiar, wonderful pleasure of the tentacle hammers through you, burrowing deep inside to discharge its belly-filling load. Eggs come flooding easily out of its engorged cockhead, blasting into your ");
		if(x >= 0) output("womb");
		else output("bowels");
		output(" in a flood of hot lube and smooth plastic. Dozens and dozens of eggs pump into your well-trained body, swelling you up just the way you like it. You cum again - if you really stopped at all in the first place - and let yourself go completely with screams of pleasure that echo across the cargo hold. Your hands clench around your belly, feeling your skin stretch around the growing load of eggs: you look ");
		if(pc.isPregnant() && pc.bellyRating() >= 50) output("an extra ");
		output("nine months pregnant by the time the machine’s decided you’ve had enough, filled with almost a hundred eggs that churn wetly ");
		if(x < 0) output("up your ass");
		else output("in your swollen womb");
		output(". The sensation is wonderful, comforting... you find yourself wrapping your arms around yourself, basking in the artificial sense of motherhood and the very real, all-encompassing sense of fullness.");
	}
	output("\n\nThe turgid, slimy tentacle stretching your [pc.vagOrAss " + x + "] out has finally finished its job, and slowly starts to soften inside you. You give a little moan, rocking your hips in the saddle as the machine begins withdrawing, slithering back out. It leaves you gaping open, teasing your walls with its nubby texture and serpent-like motions until its curved crown finally pops out.");

	//[Next]
	//Update pc.belly until the end of the scene, with gravidity based on Egg Training/eggs rolled.
	pc.changeLust(200);
	processTime(20);
	clearMenu();
	addButton(0,"Next",layingTrainingTwo);
}

public function layingTrainingTwo():void
{
	clearOutput();
	showBust("EGG_TRAINER");
	showName("EGG\nTRAINER");
	author("Savin");
	var x:int = pc.findEmptyPregnancySlot(0);
	//If all holes full, pick a vagina.
	if(x == -1) 
	{
		if(pc.hasVagina()) x = rand(pc.totalVaginas());
	}
	if(x == 3) x = -1;

	output("Like a cork, the tentacle slipping out lets loose a flood of hot lube. Your eyes widen as the floodgates open, and your hands leap towards the handlebars, gripping them with white knuckles as a whole different type of pleasure hits you. Without the thick, plastic plug to keep them in, your ovi-load is starting to shift downwards!");

	output("\n\nBefore anything can happen, though, the see-through panel atop the machine slides aside. A rush of humid heat rushes up to greet you, billowing across your [pc.skinFurScales].");
	//if not Egg Trained 5:
	if(flags["EGG_TRAINING"] != undefined) output(" The remaining eggs inside roll listlessly about in the sea of viscous lube.");
	output(" The holo-screen on the Egg Trainer’s front beeps at you, instructing you to move in the saddle so that your hole is aimed at the tub. With a groan, you manage to shift your [pc.butt] around in the slicked-up saddle to comply with the machine’s commands. Even a moment’s movement leaves you reeling, your belly shifting with the weight of ");
	if(flags["EGG_TRAINING"] == undefined || flags["EGG_TRAINING"] == 1) output("several");
	else if(flags["EGG_TRAINING"] <= 3) output("more than a dozen");
	else output("dozens of");
	output(" eggs.");

	output("\n\nYour hands run across your bare, swollen belly, feeling the eggs shift inside you, tumbling towards your gaping opening. A shockwave of pleasure hammers through your [pc.vagOrAss " + x + "], forcing you to clench down around the flood of lube and growing pressure inside you. The holoscreen urges you to relax: <i>“You don’t want to hurt your eggs, do you? Relax that cute little hole of yours and push!”</i>");

	output("\n\nSeems like a contradiction in terms from where you’re sitting, but you try your best. Your [pc.legs] squeeze around the sides of the box, steadying you as the first egg starts to crown. Looking down, you watch with wide eyes as the firm, sloping head of the egg peeks out. You push, as hard as you can with gritted teeth and white knuckles until with a wet squirt the first <b><i>pops</i></b> out of you, plopping into the lube-tank inside the machine. More of the hot, thick liquid splashes up onto your thighs, as if to pave the way for the next egg... and the next. Each egg you pass is an explosion of pleasure that drowns out all thought, all other sensation. You cum again");
	if(pc.hasCock())
	{
		output(", your ");
		if(pc.cockTotal() == 1) output("cock blasting a thick rope of semen");
		else output("cocks blasting thick ropes of semen");
		output(" into the lube-pool, coating the eggs with even more of your erotic juices");
	}
	output(", and your [pc.vagOrAss " + x + "] clenches and squeezes uncontrollably. Your body is entirely on auto-pilot now, laying and cumming");
	if(x >= 0 || pc.hasCock()) output(", drooling sex-juice and lube all over");
	output(". The coating of lube every egg is slathered in makes their passage as easy as what feels like fist-sized lumps of plastic can go.");
	//if gaping: 
	var gaped:Boolean = false;
	if(x >= 0)
	{
		if(pc.vaginas[x].looseness() >= 4) gaped = true;
	}
	else if(pc.ass.looseness() >= 4) gaped = true;
	if(gaped) output(" At least you’re already stretched out pretty well, making this a little easier!");
	else output(" You can only imagine how gaped you’re going to be after this...");

	output("\n\nFinally");
	if(flags["EGG_TRAINING"] >= 4 && flags["EGG_TRAINING"] != undefined) output(", after what seems like hours of orgasm after orgasm across dozens of eggs");
	output(", the last egg crowns from your gaping, drooling hole. One final push, one last scream of ecstasy, and you squirt the last of your artificial progeny into the bath of warm lubricant. A ragged, gasping sigh escapes your lips, and you flop back onto the rumbling top of the Egg Trainer.");
	if(x >= 0) pc.cuntChange(x, pc.vaginalCapacity(x));
	else pc.buttChange(pc.analCapacity());

	output("\n\nThe holo-screen bleeps at you: <i>“A good egg-slut makes sure their eggs are safe and secure after laying, then presents themselves to the egg’s layer for a second load... keep your belly nice and full!”</i>");
	output("\n\nYou shudder at the thought, and let your eyes flutter closed for a few minutes of air-drying before you grab your gear and stagger off to the shower.");

	if(flags["EGG_TRAINING"] == 1 || flags["EGG_TRAINING"] == undefined) processTime(15);
	else if(flags["EGG_TRAINING"] == 2) processTime(25);
	else if(flags["EGG_TRAINING"] == 3) processTime(39);
	else if(flags["EGG_TRAINING"] == 4) processTime(55);
	else processTime(80);

	eggTrainerTrained(x);
	IncrementFlag("EGG_TRAINING_TIMES");
	pc.orgasm();
	pc.shower();
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Carry Training
//Have the tentacle-device fill your {womb / bowels} with eggs. This option advertises TamaniCorp brand Lock-Lube, made to ensure that your eggs are lodged inside you for a good long while... You’ll be carrying so many eggs that you’ll look positively pregnant for about a week, it tells you.
//Increase looseness & wetness of hole.
public function carryTrainingWithEggMachine():void
{
	clearOutput();
	author("Savin");
	showBust("EGG_TRAINER");
	showName("EGG\nTRAINER");

	var x:int = pc.findEmptyPregnancySlot(0);
	//If all holes full, pick a vagina.
	if(x == -1) 
	{
		if(pc.hasVagina()) x = rand(pc.totalVaginas());
	}
	//If butt select, convert to lazyman butts for vagOrAss
	if(x == 3) x = -1;

	if(flags["CARRY_TRAINING_TIMES"] == undefined) output("Having experimented to your heart’s content with the lesser option on the ovi-obsessed machine, you decide it’s time to step up your egg-game. You brush your fingers lovingly across the holo-screen, as if it were a lover’s cheek, and tap the <i>“Carry Training”</i> button.");
	else output("Your body feels so empty without a swollen belly, without the familiar shift and tumble of eggs filling you day in and day out. You can’t help but miss the fullness, the never ending pleasure... you push the <i>“Carry Training”</i> button without hesitation.");
	output(" You don’t have to wait for the screen to tell you to disrobe, tossing your [pc.gear] aside with an eager grin spreading across your face.");

	output("\n\nAs always, you ");
	if(pc.isTaur()) output("awkwardly move to position your lower body over the entire box, angling your [pc.vagOrAss " + x + "] towards the saddle.");
	else if(pc.isNaga()) output("coil yourself around the box, angling your [pc.vagOrAss " + x + "] into the fuck-saddle as best you can.");
	else if(pc.isGoo()) output("squirm around the box, all but enveloping the entire box and wiggling your behind into the saddle.");
	else output("swing a leg awkwardly over the edge of the box, plopping down in the seat of the saddle.");
	output(" The moment you’re seated, the holoscreen on the front of the box swivels around to face you, and a pair of metal bars slide out from the sides of the box, giving you something to hold onto. Between them, the metal top of the box slides back underneath the saddle, revealing a tub of sloshing off-green liquid bubbling inside it. What looks like hundreds of small, yellow plastic eggs slosh around in the pool, piling up against a single hole on the wall right under the saddle. Doesn’t take a genius to figure out where that leads...");

	output("\n\nNothing happens for a moment, though, until you lean forward over the box and take hold of the metal bars. A faint heat starts rising from the metal, and you feel a shuddering vibration as the machine ");
	if(pc.legCount <= 1) output("under you");
	else output("between your [pc.legs]");
	output(" hums to life. The sea of liquid inside the box starts heating up, bubbling and sloshing like a washing machine on high - and the box you’re leaning on heats up, as hot as a lover’s body. The saddle shifts underneath you, and you feel something slide right beneath your rump: a hole opening up under your butt.");
	if(pc.balls > 0)
	{
		if(pc.balls > 1) output(" Your [pc.balls] immediately flop");
		else output(" Your [pc.ball] immediately flops");
		output(" into the hole, dangling into the black depths of the bubble-gum pink fuck machine.");
	}
	output(" The holo-screen beeps and displays a cartoonish red <i>“HANG ON!”</i> in huge capital letters, and you feel the ever-present rumbling in the machine intensify.");

	output("\n\nSomething moves violently underneath you, and you feel a sudden rush of wet heat splatter against your [pc.vagOrAss " + x + "]. You gasp as heated lube squirts through your crack");
	if(x >= 0) output(" and all over your groin");
	output(", and the stuff keeps coming and coming, like a sexified bidet. The holo-screen tells you to relax, breathe deep, and relax your body: your role is entirely passive in this. <i>“A good incubator lies back with spread legs and a smile for his or her ovipositor,”</i> the screen tells you. A ragged breath escapes your lips, which tremble with wet pleasure. You’re not sure if this lube-geyser has some kind of aphrodisiac mixed in, or if the constant squirt of hot, sticky, wetness against your hole is really just <i>that</i> pleasurable. Whatever the answer is, it’s only a prologue for what’s to come.");
	output("\n\nWhich comes right about now, as it happens. You feel something thick and wriggling moving up through the stream of lube battering your backside, followed by a plasticy sensation against your [pc.vagOrAss " + x + "]. Your whole body clenches as a pressure begins to build, insistent but gentle, pressing in amidst the sea of lube coating your hole until you start to feel your body stretch. The tip of the tendril is nice and rounded, smooth and latexy like a proper dildo, though you instantly feel that something’s not quite human about it: the head seems hollow, like a crater caving in to reveal the long tube leading into the depths of the device it’s attached to. Even this inner passage is squirting lube into you, blazing its own trail through your ");
	if(x >= 0) output("pussy’s clenching walls");
	else output("bowels");
	output(" as it starts to worm its way into you.");
	if(x >= 0) pc.cuntChange(x, pc.vaginalCapacity(x));
	else pc.buttChange(pc.analCapacity());

	output("\n\nThe tentacle doesn’t get an inch in before you feel something <i>else</i> coming with it. A ring of short, stubby nubs ring the tube, grinding into your [pc.vagOrAss " + x + "] on a bed of hot lube. You groan, eyes wide and knuckles going white on the handlebars. Instinctively, your body tries to fight back, to push the invading thing out of you, but it’s so slick and so strong that your body simply gives in to the incessant pressure the machine puts on you. All that’s left to do is feel the thing squirming inside you, writhing about inside your ");
	if(x >= 0) output("twat");
	else output("ass");
	output(", faster and faster. More of the little nubs snake in with the shaft, rubbing pleasurably against your ");
	if(x >= 0) output("pussy’s walls");
	else if(!pc.hasCock()) output("anal walls");
	else output("prostate");
	output(". This is just a taste of the pleasure your Egg Trainer is promising, though.");

	output("\n\nWhat feels like the better part of a foot lodges in you before the tentacle seems to think it’s deep enough to start <i>really</i> working. The tentacle goes completely rigid for the span of a heartbeat, making sure you’re nice and stretched out around its thick girth, before it starts to swell and shudder, and you feel something moving <i>inside</i> it. Your eyes go wide as the tentacle hilted in your [pc.vagOrAss " + x + "] stretches out, passing the first thick knot of plastic through your ");
	if(x >= 0) output("pussy lips");
	else output("sphincter");
	output(". A much stronger geyser of lube squirts out of the tentacle-dildo’s crown before the latex cockhead engorges wetly, and you feel something thick and round and sloppy-wet shoot into your ");
	if(x < 0) output("bowels");
	else output("womb");
	output(".");

	output("\n\nPleasure rocks your world as the first egg lodges inside you. Your hips rock forward, bucking on the thick member in your [pc.vagOrAss " + x + "] and gasping for breath.");
	if(pc.hasCock()) output(" Your [pc.cock] bounces, half hard and leaking pre all across your thighs. Pleasure hammers through your cock like it’s ready to spurt already.");
	if(pc.biggestTitSize() >= 1) 
	{
		output(" Your hands are drawn from the handlebars and onto your [pc.breasts], cupping and squeezing your tits");
		if(pc.isLactating()) output(" until milk drizzles down around your fingers");
		output(".");
	}
	output(" Moaning like a bitch in heat, you ride the writhing cock like a cow[pc.boyGirl] until the pleasure’s just too much to bear.");
	if(pc.hasCock()) output(" Your cock cums first, geysering spooge across the top of the box and the deck of your cargo hold.");
	output(" A scream of pleasure tears through your throat, arching your back and squeeze hard around the spasming, lube-spraying device.");

	output("\n\nAnd that was just the first egg. Another thick engorgement wriggles its way up through the tube, making it push out on your lubed-up walls, rubbing its dozens and dozens of rounded nubs against you. The orgasmic pleasure tearing through you refuses to abate, especially with that kind of handling - and with another thick, heavy bulb plopping into your body, followed by another... and another. You watch with bulging eyes as egg after egg slurps out of the see-through tub and vanishes into the throbbing tube beneath you. Your [pc.butt] bounces on the fuck-saddle, riding that plastic shaft as it thoroughly breeds your [pc.vagOrAss " + x + "] with its eggy load.");

	// @eggTraining: eggTrained pc
	// That’s a new stat to see how many eggs you can take!
	// == 1
	if(flags["EGG_TRAINING"] == 1) 
	{
		output("\n\nThe tentacle squirts and thrusts, laying a belly-straining load of tumbling spheres inside you. You lose count after six big, orgasmic pops that bloat your ");
		if(x >= 0) output("womb");
		else output("gut");
		output(". By the time the wriggling tentacle finishes, you’re a swollen and sordidly wet mess, drooling hot lube like a waterfall from your well-fucked hole. One of your hands slips down to your [pc.belly], feeling a distinct set of uneven bulges pushing against your [pc.skin] from within.");
	}
	// >3 more words here.
	else if(flags["EGG_TRAINING"] > 3)
	{
		output("\n\nThe familiar, wonderful pleasure of the tentacle hammers through you, burrowing deep inside to discharge its belly-filling load. Eggs come flooding easily out of its engorged cockhead, blasting into your ");
		if(x >= 0) output("womb");
		else output("bowels");
		output(" in a flood of hot lube and smooth plastic. Dozens and dozens of eggs pump into your well-trained body, swelling you up just like you like it. You cum again - if you really stopped at all in the first place - and let yourself go completely with screams of pleasure that echo across the cargo hold. Your hands clench around your belly, feeling your skin stretch around the growing load of eggs: you look ");
		if(pc.isPregnant() && pc.bellyRating() >= 50) output("an extra ");
		output("nine months pregnant by the time the machine’s decided you’ve had enough, filled with almost a hundred eggs that churn wetly ");
		if(x < 0) output("up your ass");
		else output("in your swollen womb");
		output(". The sensation is wonderful, comforting... you find yourself wrapping your arms around yourself, basking in the artificial sense of motherhood and the very real, all-encompassing sense of fullness.");
	}
	// != 0
	else if(flags["EGG_TRAINING"] != 0) 
	{
		output("\n\nThe tentacle just keeps on fucking you, ceaselessly filling your belly with its artificial get. Egg after egg squeezes through its bloated head and into your ");
		if(x >= 0) output("womb");
		else output("ass");
		output(" on a constant bed of heated sex lube until you’re positively stuffed with them. There’s well over a dozen inside you, maybe two - your belly is bloated by the mass of eggs, and you can feel the added weight of them hanging heavily in front of you, making you lean forward and rest your pregnant gut on the top of the machine. Your skin bulges and shifts unevenly, and your whole body feels incredibly wet - even as lube absolutely pours out of your gaping hole.");
	}
	output("\n\nThe turgid, slimy tentacle stretching your [pc.vagOrAss " + x + "] out has finally finished its job, but instead of softening and sliding out, the tendril stiffens inside you, engorging from base to tip. The holo-screen tells you to hold still and enjoy TamaniCorp’s patented Lock-Lube, guaranteed to keep those eggs nestled deep (but harmlessly) inside you for a good week before it finally gives way, and you’ll give birth like a real egg-slut.");

	output("\n\nThe tentacle throbs, and you feel another surge of hot, sticky wetness flooding your ");
	if(x >= 0) output("womb");
	else output("bowels");
	output(", basting the eggs in Lock-Lube. The gallon or so of lube already sloshing around inside you comes blasting back out, pushed out around the tendril by the hose-like lube enema you’re getting. But that only lasts a moment, before you feel a clenching sensation shudder through you, though it’s certainly not your muscles at work. Your [pc.vagOrAss " + x + "] feels like it’s being squeezed from the inside, the sodden feeling of lube slowly fading into a firm plug for all the eggs in your gut.");

	output("\n\nThe tendril pops out of you with a wet squelch, letting the last trickles of lube pour out of your abused hole and back into the machine. You thought you were full before, but this is something new altogether: a total, swollen fullness that refuses to abate, stretching your [pc.skin] around your faux-baby bulge.");

	output("\n\n<i>“Take good care of ‘em, sugar!”</i> the holo-screen tells you, and the tentacle gives you a resounding slap on the ass before wriggling back into its hole. You groan, running your hands across your lumpy belly as the machine shuts down, leaving you to recover - and to enjoy your wonderfully pregnant belly before you eventually get up and stagger towards the shower, slowly adjusting to your new weight.");

	pc.changeLust(50+rand(10));
	pc.shower();
	processTime(25);

	// Preggos!
	var ppCarryTraining:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppCarryTraining.impregnationType = "EggTrainerCarryTraining";
	//Actually put the impregnationshit in.
	if(x >= 0) pc.loadInCunt(ppCarryTraining, x);
	else pc.loadInAss(ppCarryTraining);

	eggTrainerTrained(x);
	IncrementFlag("CARRY_TRAINING_TIMES");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function eggTrainingEggCount():Number
{
	if(flags["EGG_TRAINING"] == undefined) return (6 + rand(7));
	else if(flags["EGG_TRAINING"] == 1) return (10 + rand(16));
	else if(flags["EGG_TRAINING"] == 2) return (20 + rand(21));
	else if(flags["EGG_TRAINING"] == 3) return (35 + rand(36));
	else if(flags["EGG_TRAINING"] == 4) return (50 + rand(31));
	else if(flags["EGG_TRAINING"] == 5) return (75 + rand(26));
	else return 9002;
}

public function eggTrainerCarryTrainingEnds(pregSlot:int, pregEggs:int):void
{
	clearOutput();
	showName("\nEGGS!");
	author("Gardeford");
	
	// (eggs here now)
	output("The contraction knocks you right off your [pc.feet]. The eggs are coming out now and nothing is going to stop them. You");
	if (pc.hasLegs())
	{
		if (!pc.isCrotchExposed()) output(" pull off your [pc.lowerGarments] as best you can, spreading your [pc.legs] so the eggs can exit more easily");
		else output(" spread your [pc.legs] so the eggs can get out more easily, you wouldn’t want any of them to break");
	}
	else 
	{
		if(pregSlot == 3) output(" lie down so that your [pc.asshole] is at a good angle for laying eggs");
		else output(" lie down so that your [pc.vagina " + pregSlot + "] is at a good angle for laying eggs");
	}
	output(".");
	output("\n\nYou feel the contractions quickening and prepare to push the eggs out. Steeling yourself for the coming eggs, you prepare to push, expecting it to be a bit tough. Contrary to your beliefs, as soon as you push a torrent of eggs slip through your passage. The suddenness of it causes your muscles to tense, [pc.legs] splaying out in the air. Before you can recover your wits a few more eggs slide out of you and into the pile.");
	
	// (normal)
	output("\n\nYou can’t resist any longer as the final eggs leave your body, cumming as the last of them are pushed out. Spasms rock your body, pumping out two or three eggs at a time until your ");
	if(pregSlot == 3) output("ass");
	else output("womb");
	output(" is empty. You lie on the ground, resting for a moment until you’ve recovered enough to get up. A small probe emblazoned with the Steele logo appears seemingly out of nowhere, picking up all but one of the eggs with a couple beeps. You assume it’s taking the eggs somewhere to deal with, but since these eggs aren’t of the hatching variety you aren’t completely sure.");
		
	output("\n\nAfter all that, <b>you count having laid " + num2Text(pregEggs) + " eggs!</b>");
	
	pc.energy(-1 * pregEggs);
	processTime(20 + rand(11));
	
	//Do stuff
	bonusEggTrainingLayEffects(pregSlot, pregEggs);
	
	//Yay
	clearMenu();
	addButton(0,"Next",finalEggTCleanup, pregEggs);
}

//Cleans up status effects and boots back to mainGameMenu
public function finalEggTCleanup(pregEggs:int):void
{
	if (!pc.hasStatusEffect("Eggy Belly"))
	{
		mainGameMenu();
		return;
	}
	
	// Egg check
	var numEggs:int = 0;
	for (var i:int = 0; i < pc.pregnancyData.length; i++)
	{
		var pData:PregnancyData = pc.pregnancyData[i];
		if (pData.pregnancyType == "EggTrainerCarryTraining") 
		{
			pData.pregnancyQuantity += numEggs;
		}
	}
	pc.addStatusValue("Eggy Belly", 3, (-1 * pregEggs));
	if(pc.statusEffectv3("Eggy Belly") != numEggs) pc.setStatusValue("Eggy Belly", 3, numEggs);
	if(pc.statusEffectv3("Eggy Belly") <= 0) pc.removeStatusEffect("Eggy Belly");
	
	mainGameMenu();
}

public function bonusEggTrainingLayEffects(pregSlot:int, pregEggs:int, doOut:Boolean = true):void
{
	var effect:Boolean = false;
	//0: Random 6-12 eggs. Can't use Carry Training or Faux Preg Egg options.
	//1: Random 10-25 eggs. Carry Training unlocked. 
	if(pregSlot != 3) pc.cuntChange(pregSlot, 200, doOut);
	else pc.buttChange(200, doOut);
	//2: Random 20-40 eggs. Huge, permanent looseness and wetness bonus. 
	//Raise minimum gape one step to 3.
	if(flags["EGG_TRAINING"] >= 2 && pregEggs > 30)
	{
		if(pregSlot != 3)
		{
			if(pc.vaginas[pregSlot].bonusCapacity < 50)
			{
				pc.vaginas[pregSlot].bonusCapacity += 10;
				if (doOut) output("\n\n<b>You’re pretty sure you’ve gotten a little stretchier down there from the experience.");
				effect = true;
			}
		}
		else
		{
			if(pc.ass.bonusCapacity < 50)
			{
				pc.ass.bonusCapacity += 10;
				if (doOut) output("\n\n<b>You’re pretty sure you’ve gotten a little stretchier down there from the experience.");
				effect = true;
			}
		}
	}
	//3: Random 35-70 eggs. Faux Preg Egg unlocked. 
	//4: Random 50-80 eggs. Moderate raw Bonus Capacity for all holes.
	if(flags["EGG_TRAINING"] >= 4 && pregEggs > 50 && !effect)
	{
		if(pregSlot != 3)
		{
			if(pc.vaginas[pregSlot].bonusCapacity < 200)
			{
				pc.vaginas[pregSlot].bonusCapacity += 25;
				if (doOut) output("\n\n<b>You’re pretty sure you’ve gotten a good bit stretchier down there from the experience.");
				effect = true;
			}
		}
		else
		{
			if(pc.ass.bonusCapacity < 200)
			{
				pc.ass.bonusCapacity += 25;
				if (doOut) output("\n\n<b>You’re pretty sure you’ve gotten a good bit stretchier down there from the experience.");
				effect = true;
			}
		}
	}
	//5: Random 75-100 eggs. Huge, permanent looseness bonus.
	if(flags["EGG_TRAINING"] >= 5 && pregEggs > 75 && !effect)
	{
		if(pregSlot != 3)
		{
			if(pc.vaginas[pregSlot].bonusCapacity < 300)
			{
				pc.vaginas[pregSlot].bonusCapacity += 50;
				if (doOut) output("\n\n<b>You’re pretty sure you’ve gotten a lot stretchier down there from the experience.");
				effect = true;
			}
		}
		else
		{
			if(pc.ass.bonusCapacity < 300)
			{
				pc.ass.bonusCapacity += 50;
				if (doOut) output("\n\n<b>You’re pretty sure you’ve gotten a lot stretchier down there from the experience.");
				effect = true;
			}
		}
	}
}

//Faux Preg
//Replace with “Remove Egg” if already has Faux Preg Egg installed in body.
//This special “service” causes the tentacle to fuck a single, unique egg into you - what the screen labels a “faux-preg egg.” This special egg lodges inside you and grows, grows, grows in your {womb / bowels} until your belly is completely gravid. And there’s no way it’s coming out once it goes in without some medical intervention, or the help of the Egg Trainer machine. All the joys of being perpetually, gravidly pregnant without the inevitable childbirth.

public function fauxPregImplantation():void
{
	clearOutput();
	showBust("EGG_TRAINER");
	showName("EGG\nTRAINER");
	author("Savin");
	var x:int = pc.findEmptyPregnancySlot(0);
	//If all holes full, pick a vagina.
	if(x == -1) 
	{
		if(pc.hasVagina()) x = rand(pc.totalVaginas());
	}
	//If butt select, convert to lazyman butts for vagOrAss
	if(x == 3) x = -1;
	output("Having thoroughly enjoyed the other services your lewd little egg-trainer has to offer, you wistfully contemplate the <i>“faux preg egg”</i> option ");
	if(flags["FAUXPREG_TIMES"] == undefined) output("wondering what it does, exactly");
	else output("already yearing for the wonderfully, impossibly full sensation inside you at all times");
	output(". You press the button, and are treated to another of the brief holographic demonstrations. This time, the device cheerily advertises TamaniCorp’s latest and greatest scientific breakthrough: an egg that will actually grow inside you like a child, swelling your womb over weeks and months like a real pregnancy... without the inevitable letdown of birth. You could stay forever gravid if you wanted, perhaps even ever expanding. The video fails to mention if there’s an upper limit on just how swollen this one little egg can get, but judging from some of the promotional pictures it uses - displaying Tamani herself reclining on a couch, nude and with legs splayed to show off a belly that looks far, far larger than what you’d expect from a human pregnancy... you’re not convinced the lascivious executive’s company was too concerned about limitations.");
	output("\n\nThe holographic Tamani on-screen gives you a wink, rubbing her tremendous belly, and text on-screen tells you simply <i>“Good luck, slut!”</i>");
	output("\n\nNot sure how you feel about getting called a slut by a sophisticated deep-fryer, you nevertheless do as you always do. Your body shivers with anticipation, even knowing that though this time you’re not in for the sudden, orgasmic swelling of a dozen... or ten dozen... eggs being pumped inside you one after the other. This is going to be a slow, steady build-up, a change in lifestyle to let you enjoy the fruits of your ");
	//nocunt:
	if(x < 0) output("wanna-be ");
	output("womb. Following the screen’s familiar instructions, you");
	if(pc.isTaur()) output(" awkwardly move to position your lower body over the entire box, angling your [pc.vagOrAss " + x + "] towards the saddle.");
	else if(pc.isNaga()) output(" coil yourself around the box, angling your [pc.vagOrAss " + x + "] into the fuck-saddle as best you can.");
	else if(pc.isGoo()) output(" squirm around the box, all but enveloping the entire box and wiggling your behind into the saddle.");
	else output(" swing a leg awkwardly over the edge of the box, plopping down in the seat of the saddle.");
	output(" The moment you’re seated, the holoscreen on the front of the box swivels around to face you, and a pair of metal bars slide out from the sides of the box, giving you something to hold onto.");

	output("\n\nThis time, though, the top of the heat-and-clean tub inside doesn’t come sliding off. Instead, the screen blinks a reminder that you’re not going to be able to get the faux-pre egg out on your own... ever... without serious medical intervention, or the use of the machine again since it can flood your hole with a special deflation agent. At least you can remove it any time you want if you just come back to the egg trainer.");

	output("\n\nNothing actually happens for a long moment, though, until you lean forward over the box and take hold of the metal bars. A faint heat starts rising from the metal, and you feel a shuddering vibration as the machine ");
	if(pc.legCount <= 1) output("under you ");
	else output("between your [pc.legs] ");
	output("hums to life. You squeeze your eyes shut and hold on tight as a thick, tapered tentacle wriggles up from the machine and presses its pointed crown against your [pc.vagOrAss " + x + "]. It gives you a squirt of lube, painting your thighs and ass indiscriminately before forging again. There’s a moment of pressure as it aligns itself, and then the familiar, wonderful pleasure that presages the real treat; the tentacle slithers inside you, stretching your hole ever wider as it grows thicker, and inch after inch of smooth tube is fed into your [pc.vagOrAss " + x + "].");
	output("\n\nYou moan out your enjoyment, bucking your [pc.hips] back against the steadily thrusting artificial member. The familiar sensation still sends a thrill through you no matter how many times you get to enjoy it. Your knuckles turn white, squeezing down around the handle bars and letting the tentacle fuck you. It’s more vigorous and more thorough in its business than it strictly needs to be, you well know by now, but you can hardly complain as it ");
	if(x < 0 && pc.hasCock()) output("milks your prostate ");
	else if(x < 0) output("pounds your ass ");
	else output("pounds your pussy ");
	output("to orgasm.");
	if(pc.hasCock()) output(" Your [pc.cock] sprays its load all over the top of the box, throbbing and squirting in wondrous ways even without a single bit of direct stimulation.");
	if(x >= 0) pc.cuntChange(x, pc.vaginalCapacity(x));
	else pc.buttChange(pc.analCapacity());

	output("\n\nWith a soft moan, you slump forward against the grip of the trainer box. You can feel the tentacle pumping lube into your [pc.vagOrAss " + x + "] like a cock blowing its load, making sure that your insides are completely soaked and ready for anything. After a moment, the holoscreen blinks the message, <i>“Egg implanted! Be sure to feed your baby with lots of cum!”</i>");
	output("\n\nThe tentacle slips out of you without a moment’s more notice, leaving you feeling a little gaped, and a little more full. But you didn’t even feel the egg go inside you! You huff, feeling cheated by the lack of sensation... then again, when your body’s been trained to take dozens and dozens of eggs all at once, what’s a lone little egg to you?");
	output("\n\nYou sigh, hoping the egg doesn’t fall out of your loose hole as you grab your gear back and stagger to the washroom to clean up.");
	//[Next]

	processTime(25);
	pc.orgasm();

	// Preggos!
	var ppCarryTraining:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppCarryTraining.impregnationType = "EggTrainerFauxPreg";
	//Actually put the impregnationshit in.
	if(x >= 0) pc.loadInCunt(ppCarryTraining, x);
	else pc.loadInAss(ppCarryTraining);

	eggTrainerTrained(x);
	IncrementFlag("FAUXPREG_TIMES");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Remove Egg
//Have the Egg Trainer remove your Faux Preg Egg... somehow?
public function eggTrainerPreggoRemoval():void
{
	clearOutput();
	author("Savin");
	showBust("EGG_TRAINER");
	showName("EGG\nTRAINER");

	var slot:int = pc.findPregnancyOfType("EggTrainerFauxPreg");
	var x:int = slot;
	var pData:PregnancyData = pc.pregnancyData[slot] as PregnancyData;
	if(x == 3) x = -1;
	
	output("As enjoyable as it’s been, you’ve decided it’s time to let go of your faux-preg egg. ");
	if(x >= 0) output("If anything, having it has made you crave a real baby - or just a belly full of alien eggs - more than ever! ");
	output("You run a hand over your [pc.belly], feeling an odd connection to the synthetic pregnancy that’s been growing inside you. It’s been fun.");

	output("\n\nWith a sigh, you tap the egg-trainer’s holoscreen and select the removal option. As usual, it tells you to disrobe and relax in the saddle, assuring you that it’ll take care of everything. You do as it says, settling down in the fuck-saddle and angling your pregnant hole with the slit under your [pc.butt]. You don’t even need to be told to grab the handlebars and relax, familiar with the device’s modus operandi as you are. Still, it goes through the usual motions of facing the screen towards you and telling you that, depending on how gravid you’ve let yourself get, this might be a hell of a ride.");

	output("\n\nLooks like the <i>“faux pregnancy”</i> even includes birth. You shudder with anticipation, feeling your excitement mount. The tentacle’s bay opens under you, and the familiar, wriggling crown quickly presses against your [pc.vagOrAss " + x + "], spraying your ass and thighs indiscriminately with hot, slick lube. A little moan escapes your lips, forced out by a slow but insistent insertion that spreads your hole open wider and wider.");
	if(pc.hasCock())
	{
		if(pc.cocks.length == 1) output(" Your [pc.cock] is soon as hard as diamonds, begging for attention you don’t want to give it");
		else output(" Your [pc.cocks] are soon as hard as diamonds, begging for attention you don’t want to give them");
		output("; letting the tentacle milk all the cum out of you is so much sweeter than giving in and using your hands!");
	}

	output("\n\nYou rock your hips back against the tentacle, taking it as deep as you can. It fills you with lube, squirting the stuff into your ");
	if(x == -1) output("bowels");
	else output("womb");
	output(" and making sure that every blessed inch of your insides is absolutely drenched. After a few minutes of its usual, pleasant fucking, though... something changes. The tentacle goes completely still and rigid inside you, not budging an inch even against your grinding hips - the way it’s buried in your [pc.vagOrAss " + x + "], you can’t move at all!");

	output("\n\nWith a grunt of displeasure, you try and squirm off the tentacle, but it holds you firm for a long moment. During the still second, you realize that the tentacle isn’t entirely frozen: it’s swelling, ever so slightly, but definitely growing thicker inside you. You gulp, feeling the slow and steady sensation of being stretched out by the inflating pseudo-phallus. When it finishes, you’re almost painfully stretched, groaning constantly from the intense pressure in your loins - and the fire of arousal burning in you, desperate for more.");

	if(x >= 0) pc.cuntChange(x, pc.vaginalCapacity(x));
	else pc.buttChange(pc.analCapacity());

	output("\n\nSomething ice-cold and sticky sprays from the tentacle’s tapered tip, blasting the bottom of the egg inside you. You yelp in surprise, almost orgasming from the shock... and finish as the tentacle decides it’s done, and slides right out of you. Gasping and crying out, you buck in the saddle and drench yourself and your trainer machine in ");
	if(pc.hasVagina() && pc.hasCock()) output("both masculine and feminine cum");
	else if(pc.hasGenitals()) output("cum");
	else output("artificial lubricants");
	output(". The unexpected climax leaves you slumping against the machine, knuckles white from how hard you’re gripping the handlebars and leaking lube from your pregnant hole.");

	output("\n\nWhatever the tendril shot into your ");
	if(x >= 0) output("womb");
	else output("gut");
	output(" seems to have affected your egg. The synthetic orb shifts restlessly inside you");

	//if gravid or bigger: 
	if(pData.pregnancyBellyRatingContribution >= 50) output(" and, thankfully, seems to lose some of its mass. A waterfall of sexual fluids release from the pent-up ball, flooding out of you the same way the trainer-box’s lube does. As the ball drains, your belly ever so slowly deflates, down to a slightly more manageable size. You’re no longer nearly so overwhelmingly gravid now, but when the flood abates, you’re still left with a big, prominent baby bump.");
	else if(pData.pregnancyBellyRatingContribution >= 20) output(". A small waterfall of pent-up sexual fluids cascades out of you as the ball of synthetic egg deflates somewhat, shrinking down with agonizingly pleasurable slowness until it’s just a big, firm baby bump bloating your belly out.");
	else output(". Your gut gurgles uneasily as the egg dislodges and shrinks a bit, getting properly aligned for what’s to come.");

	output("\n\nThe holoscreen helpfully tells you to please face your rump into the lube-tank. The lid slides off, revealing the sloshing tank of hot, steamy lube for you to give <i>“birth”</i> into. You swing your [pc.legs] forward, grabbing your belly to steady yourself as you feel the egg start to drop. A big, bold, pink word appears on screen: <i>“<b>PUSH</b>.”</i>");

	//Small egg fork:
	if(pData.pregnancyBellyRatingContribution < 30)
	{
		output("\n\nYou grit your teeth and push as hard as you can, bracing against the box for a little extra leverage.");
		output("\n\nThe egg inside you might not have grown very much, but it’s still bigger than what would normally pass through you - and bigger than the average TamaniCorp egg. Whatever the tentacle pumped into you ");
		if(x >= 0) output("has relaxed your womb, making it open up and regurgitate its unwanted occupant");
		else output("is make your ass spasm, finally flushing the thick bundle of synthetic substance that’s been nesting inside you for ages");
		output(". You grunt and push, and nearly orgasm again thanks to how well-trained to pump out eggs your body has become.");

		output("\n\nIt doesn’t take long for your trained muscles long to work the egg out, right up to your ");
		if(x == -1) output("anal ring");
		else output("pussy-lips");
		output(" and then, with a climactic burst of effort, it pops out and goes sailing into the lube-bath, splashing into the tank with its friends. The breath goes out of you with a ragged gasp of pleasure, and you all but collapse backwards. A feeling of utter, absolute contentment spreads slowly through you. After that, you feel like you could drift off to sleep.");

		output("\n\nThe machine beeps something at you, but you’re way too worn out to get up and read it. Smiling to yourself, you glance into the tub, and see a black ball of what looks like plastic about twice the size of the other eggs resting atop the trainer’s payload, slowly submerging in the heated lube. A pang of... regret? Longing? Some emotion you can’t quite put words to tugs at your heartstrings for a moment as the lid slides closed, and you’re left to recover.");
	}
	//Bigger Egg Fork:
	else
	{
		output("\n\nYou know oviposition is just another part of the process, but isn’t this a little big? The egg inside you is still absolutely huge, probably bigger around than an actual baby. Lucky you, the tentacle’s lube has relaxed your [pc.vagOrAss " + x + "], making your hole open wide of its own accord. You moan, shuddering as a heavy, heavy weight shifts downwards in your [pc.belly], starting to make its descent.");
		output("\n\nAll you can do is push as hard as you can! The egg moves slowly down, coaxed by your well-trained muscles, but the sheer size of it drives you wild with pleasure and strain. Your hole is stretched wider and wider open, forced to bear the immense pressure of the egg’s descent through your body. The sensation is overwhelming, making you scream with orgasmic ecstasy, echoing your voice from the bulkheads all throughout the deck.");
		output("\n\nAfter several minutes of pushing until your knuckles are white and your [pc.vagOrAss " + x + "] is radiating with agonizing pleasure, you can feel the egg starting to crown. Your hole stretches even wider than before, straining to its absolute limit to accommodate the slick, smooth bulk of the artificial egg. The holoscreen urgently flashes its command to push again, giving you the only guidance you’re going to get. So you keep pushing, throwing every ounce of will and force you’ve got into getting the over-sized egg out of you. You can actually feel your belly deflating, getting smaller as the massive weight that’s been stretching it out finally departs.");
		output("\n\nWith one last, climactic push, you feel the sweet release as the egg hurtles out of your [pc.vagOrAss " + x + "] on a bed of lube and cum. Orgasm hits you again when you finally lay your faux-preg egg, rocking your body with unbearable pleasure. Though you hear a splash of it tumbling into the lube-bath inside the box, you can’t muster the strength to sit up and look. The trainer machine bleeps something at you and shuts off, leaving you to slowly recover.");
		output("\n\nWhen you’ve finally caught your breath, you manage to stagger up and glance into the lube bath. The egg is sitting at the top, deflating. Already, it’s barely any bigger than the normal eggs inside, a big ball of black synthetic material about the size of your fist. Your heart throbs with familiar yearning, remembering the time you were so intimately connected.");
		output("\n\nSighing to yourself, you close the lube bath and stagger off to clean up.");
	}
	//Clear dat shit, yo.
	bonusFauxEggEffects(slot);
	pc.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
	pData.reset();
	pc.removeStatusEffect("Egg Addled 3");
	pc.removeStatusEffect("Egg Addled 2");
	pc.removeStatusEffect("Egg Addled 1");
	processTime(35);
	pc.orgasm();
	pc.energy(-10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function bonusFauxEggEffects(pregSlot:int):void
{
	var pData:PregnancyData = pc.pregnancyData[pregSlot] as PregnancyData;
	var effect:Boolean = false;
	
	if(pregSlot != 3) pc.cuntChange(pregSlot, pData.pregnancyBellyRatingContribution * 20);
	else pc.buttChange(pData.pregnancyBellyRatingContribution * 20);
	
	if(flags["EGG_TRAINING"] >= 5 && pData.pregnancyBellyRatingContribution >= 55)
	{
		if(pregSlot != 3) 
		{
			if(pc.vaginas[pregSlot].minLooseness < 5) 
			{
				pc.vaginas[pregSlot].minLooseness++;
				output("\n\n<b>After all that stretching, you’re pretty sure your vagina is going to have a tough time tightening back up... if it can at all.</b>");
				effect = true;
			}
		}
		else
		{
			if(pc.ass.minLooseness < 5)
			{
				pc.ass.minLooseness++;
				output("\n\n<b>After all that stretching, you’re pretty sure your ass is going to have a tough time tightening back up... if it can at all.</b>");
				effect = true;
			}
		}
	}
	//Raise minimum gape one step to 3.
	else if(pData.pregnancyBellyRatingContribution >= 25)
	{
		if(pregSlot != 3) 
		{
			if(pc.vaginas[pregSlot].minLooseness < 3) 
			{
				pc.vaginas[pregSlot].minLooseness++;
				output("\n\n<b>After all that stretching, you’re pretty sure your vagina is going to have a tough time tightening back up... if it can at all.</b>");
				effect = true;
			}
		}
		else
		{
			if(pc.ass.minLooseness < 3)
			{
				pc.ass.minLooseness++;
				output("\n\n<b>After all that stretching, you’re pretty sure your ass is going to have a tough time tightening back up... if it can at all.</b>");
				effect = true;
			}
		}
	}
}

//Leave
public function leaveEggMachine():void
{
	clearOutput();
	author("Savin");
	output("You decide against using the egg trainer, and put it on standby for the time being. The screen flickers off, and the burbling noises you occasionally hear inside it fade to a low murmur.");
	clearMenu();
	if(InShipInterior()) addButton(0,"Next",shipStorageMenuRoot);
	else addButton(0,"Next",mainGameMenu);
}


// Egg Trainer: Ovalasting
// Has the same unlock requirements as Faux-preg option. [Remove] option needs to be separate rather than replacing, since PC can Ovalast as many holes as they own. Vaginas prioritized, ass elseif
public function eggTrainerOvalastingMenu():void
{
	clearOutput();
	showBust("EGG_TRAINER");
	showName("\nOVALASTING");
	author("Nonesuch");
	
	output("You study the final button on your ovipositing machine. “Ovalasting”? It’s not exactly self-explanatory. You push it, and watch as the holo display once again lights up.");
	output("\n\nThe doodle of the machine runs onto the screen, followed by the featureless human, who duly saddles himself up. <i>“OVALASTING: BECAUSE THERE’S NO SUCH THING AS INCOMPATIBLE!”</i> The letters squeeze themselves together around the conjoined cartoon.");
	output("\n\nThis time, when the cartoon segues to a cut away, there’s only a single egg in the machine - bright pink but standard-sized. It pumps it into the human and then melts away, replaced in the next instant by a many-breasted, insect-legged thing several times the size of the human. The two hold hands (the human takes hold of two fronds, anyway) and cartoon hearts appear above them. The alien sticks... well, something up the human, and injects the chamber the egg is in full of white fluid. It pats the human on the head with a frond and then disappears with a poof.");
	output("\n\nThe cartoon zeroes in on the human’s midriff. A stopwatch appears in the corner; as it advances the white fluid disappears, at the same time as the egg multiplies with little ‘pop’ sounds, until the fluid is all gone and the man is left with an entire belly full of pink eggs. The stopwatch ‘ding’s and the eggs dance their way out of him... all but one, which remains snugly inside. <i>“OVALASTING: BECOME A PERMANENT INCUBATOR!”</i> read the letters that appear around him this time. The human looks up at the outline of the alien thing bending back into frame, hearts above its head.");
	output("\n\nIt looks like the sequence is going to keep repeating until you press a button...");
	
	if(flags["EGG_TRAINING_OVALASTING"] == undefined) flags["EGG_TRAINING_OVALASTING"] = 0;
	
	clearMenu();
	var ovaEffect:StorageClass = pc.getStatusEffect("Ovalasting");
	var btnSlot:int = 0;
	if(pc.hasVagina())
	{
		if(pc.vaginas.length == 1)
		{
			if(ovaEffect != null && ovaEffect.value1 != 0) addDisabledButton(btnSlot++, "Vagina", "Ovalasting: Vagina", "Your womb already has an Ovalasting egg.");
			else if(pc.isPregnant(0)) addDisabledButton(btnSlot++, "Vagina", "Ovalasting: Vagina", "Your [pc.vagina] is already occupied!");
			else addButton(btnSlot++, "Vagina", eggTrainerOvalastingGo, 0, "Ovalasting: Vagina", "Use Ovalasting with your [pc.vagina].");
		}
		else
		{
			if(ovaEffect != null && ovaEffect.value1 != 0) addDisabledButton(btnSlot++, "Vagina #1", "Ovalasting: Vagina No.1", "Your first womb already has an Ovalasting egg.");
			else if(pc.isPregnant(0)) addDisabledButton(btnSlot++, "Vagina #1", "Ovalasting: Vagina No.1", "Your [pc.vagina 0] is already occupied!");
			else addButton(btnSlot++, "Vagina #1", eggTrainerOvalastingGo, 0, "Ovalasting: Vagina No.1", "Use Ovalasting with your [pc.vagina 0].");
			if(ovaEffect != null && ovaEffect.value2 != 0) addDisabledButton(btnSlot++, "Vagina #2", "Ovalasting: Vagina No.2", "Your second womb already has an Ovalasting egg.");
			else if(pc.isPregnant(1)) addDisabledButton(btnSlot++, "Vagina #2", "Ovalasting: Vagina No.2", "Your [pc.vagina 1] is already occupied!");
			else addButton(btnSlot++, "Vagina #2", eggTrainerOvalastingGo, 1, "Ovalasting: Vagina No.2", "Use Ovalasting with your [pc.vagina 1].");
			if(pc.vaginas.length >= 3)
			{
				if(ovaEffect != null && ovaEffect.value3 != 0) addDisabledButton(btnSlot++, "Vagina #3", "Ovalasting: Vagina No.3", "Your third womb already has an Ovalasting egg.");
				else if(pc.isPregnant(2)) addDisabledButton(btnSlot++, "Vagina #3", "Ovalasting: Vagina No.3", "Your [pc.vagina 2] is already occupied!");
				else addButton(btnSlot++, "Vagina #3", eggTrainerOvalastingGo, 2, "Ovalasting: Vagina No.3", "Use Ovalasting with your [pc.vagina 2].");
			}
		}
		if(ovaEffect != null && ovaEffect.value4 != 0) addDisabledButton(btnSlot++, "Asshole", "Ovalasting: Asshole", "Your ass already has an Ovalasting egg.");
		else if(pc.isPregnant(3)) addDisabledButton(btnSlot++, "Asshole", "Ovalasting: Asshole", "Your ass is already occupied!");
		else addButton(btnSlot++, "Asshole", eggTrainerOvalastingGo, -1, "Ovalasting: Asshole", "Use Ovalasting with your [pc.asshole].");
	}
	else addButton(0, "Ovalasting", eggTrainerOvalastingGo);
	
	if(ovaEffect == null && flags["EGG_TRAINING_OVALASTING_LEVEL_MAX"] != undefined)
	{
		output("\n\nBecause you had prior training with the implant, it looks like you are able to pre-set a desired Ovalasting egg level before starting the procedure.");
		
		addButton(13, ("Level: " + (flags["EGG_TRAINING_OVALASTING_LEVEL"] == undefined ? 0 : flags["EGG_TRAINING_OVALASTING_LEVEL"])), eggTrainerOvalastingSetLevel, 0, "Modify Ovalasting Level", "Adjust the level you want the Ovalasting implant to start with before implantation.");
	}
	addButton(14, "Cancel", repeatEggTrainerApproach);
}
public function eggTrainerOvalastingSetLevel(numAdd:int):void
{
	clearOutput();
	showName("\nOVALASTING");
	showBust("EGG_TRAINER");
	author("Jacques00");
	
	output("Set the Ovalasting level to the value you wish the implant to start at.");
	
	if(numAdd != 0)
	{
		if(flags["EGG_TRAINING_OVALASTING_LEVEL"] == undefined) flags["EGG_TRAINING_OVALASTING_LEVEL"] = 0;
		flags["EGG_TRAINING_OVALASTING_LEVEL"] += numAdd;
	}
	
	output("\n\n<b>Current Ovalasting Level:</b> " + flags["EGG_TRAINING_OVALASTING_LEVEL"]);
	output("\n\n");
	
	clearMenu();
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] != undefined && flags["EGG_TRAINING_OVALASTING_LEVEL"] >= flags["EGG_TRAINING_OVALASTING_LEVEL_MAX"]) addDisabledButton(0, "+ Level");
	else addButton(0, "+ Level", eggTrainerOvalastingSetLevel, 1);
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] == undefined || flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 0) addDisabledButton(1, "- Level");
	else addButton(1, "- Level", eggTrainerOvalastingSetLevel, -1);
	
	addButton(14, "Back", eggTrainerOvalastingMenu);
}
// [Ovalasting]
public function eggTrainerOvalastingGo(oIdx:int = -1):void
{
	clearOutput();
	showName("\nOVALASTING");
	showBust("EGG_TRAINER");
	author("Nonesuch");
	
	var ovas:int = 0;
	var ovaEffect:StorageClass = pc.getStatusEffect("Ovalasting");
	if(ovaEffect != null)
	{
		if(ovaEffect.value1 != 0) ovas++;
		if(ovaEffect.value2 != 0) ovas++;
		if(ovaEffect.value3 != 0) ovas++;
		if(ovaEffect.value4 != 0) ovas++;
	}
	
	// No holes OL’d:
	if(ovas == 0) output("So, an artificial egg that multiplies when it comes into contact with sexual fluids, and is a permanent fixture? Shiver-inducing ideas parade through your head... of getting held down and reamed hard by some irresistible xeno-breeder, then feeling your belly swell slowly with the absorbent eggs, then having to lay them... all in the knowledge that you’d have to do it again, if you let someone else take your " + (oIdx < 0 ? "ass pussy" : "cunt") + ".");
	// Holes OL’d:
	else output("You rub your [pc.belly], lost in pleasure-stuffed memory. Insert another Ovilasting egg up you? Is that really wise? To fill as many holes as possible with cum-thirsty sponge-eggs so you become utterly bloated with them, helplessly gorged on pregnant bliss?");
	output("You realize that in a daze you have already");
	if(!pc.isCrotchExposed()) output(" taken off your [pc.lowerGarments] and");
	output(" plunked yourself down on the Egg Trainer’s saddle, presenting your [pc.vagOrAss " + oIdx + "] to it, before you’ve even given it careful thought.");
	output("\n\nThe screen flipping around and revealing its handlebars gives you time, though. As does the warning that flashes up on the holographic screen, informing you that the implanting of an Ovalasting egg is permanent unless you use the machine to take the original back out of you, and that you are going to be carrying and laying a lot of eggs if you engage in sexual activity with it in place. You hesitate for a moment - and then press the OK button and take hold of the bars. What the hell. Let’s go.");
	output("\n\nA faint heat starts rising from the metal, and you feel a shuddering vibration as the machine " + (!pc.hasLegs() ? "under you" : "between your [pc.legs]") + " hums to life. You squeeze your eyes shut and hold on tight as a thick, tapered tentacle wriggles up from the machine and presses its pointed crown against your [pc.vagOrAss " + oIdx + "]. It gives you a squirt of lube, painting your thighs and ass indiscriminately before forging ahead. There’s a moment of pressure as it aligns itself, and then the familiar, wonderful pleasure that presages the real treat; the tentacle slithers inside you, stretching your hole ever wider as it grows thicker, and inch after inch of smooth tube is fed into your [pc.vagOrAss " + oIdx + "].");
	
	if(oIdx < 0) pc.buttChange(200);
	else pc.cuntChange(oIdx, 200);
	
	output("\n\nYou moan out your enjoyment, bucking your [pc.hips] back against the steadily thrusting artificial member. The familiar sensation still sends a thrill through you no matter how many times you get to enjoy it. Your knuckles turn white, squeezing down around the handle bars and letting the tentacle fuck you. It’s more vigorous and more thorough in its business than it strictly needs to be, you well know by now, but you can hardly complain as it " + (oIdx < 0 ? (pc.hasCock() ? "milks your prostate" : "rails your rectum") : "pounds your pussy") + " to orgasm.");
	if(pc.hasCock()) output(" Your [pc.cocks] spray" + (pc.cocks.length == 1 ? "s its" : " their") + " load all over the top of the box, throbbing and squirting in wondrous ways even without a single bit of direct stimulation.");
	output("\n\nWith a soft moan, you slump forward against the grip of the trainer box. You can feel the tentacle pumping lube into your [pc.vagOrAss " + oIdx + "] like a cock blowing its load, making sure that your insides are completely soaked and ready for anything. Weight blossoms in your " + (oIdx < 0 ? "gut" : "womb") + "; nothing like as substantial as some of the egg-loads you’ve taken in the past, but a sure, dense presence nonetheless. After a moment, the holoscreen blinks the message, <i>“Egg implanted! Be sure to feed your baby with lots of cum!”</i>");
	if(StatTracking.getStat("pregnancy/ovalasting eggs laid") <= 0) output("\n\nThe tentacle slithers out of you without a moment’s more notice, leaving you feeling a little gaped, and a little more full. What it implanted feels barely there, particularly to well-broken-in you. Your belly hasn’t even gained a bump, and you feel vaguely cheated by the lack of sensation. Still... you were expressly told not to expect anything until you’ve taken a load from some forceful, fertile someone first.");
	else output("\n\nThe tentacle slithers out of you without a moment’s more notice, leaving you feeling a little gaped, and a little more full. What it implanted feels barely there, particularly to well-broken-in you. But you know with a bit of help from a friendly, sexy someone, this orifice of yours will soon be packed to the gills to with round, ever-swelling love. You practically purr at the thought, rubbing your [pc.hip] and [pc.chest] in rich anticipation.");
	output("\n\nDoing your best to clench up so the egg doesn’t fall out of your loosened hole, you grab your gear and stagger to the washroom to clean up.");
	
	processTime(4);
	
	// Ovalasting Status Effect
	// v1: Timestamp of Vagina 1
	// v2: Timestamp of Vagina 2
	// v3: Timestamp of Vagina 3
	// v4: Timestamp of Asshole
	pc.createStatusEffect("Ovalasting", 0, 0, 0, 0, false, "Icon_Belly_Pregnant", "You are under the effects of Ovalasting.", false, 0, 0xB793C4);
	ovaEffect = pc.getStatusEffect("Ovalasting");
	
	var pregSlot:int = (oIdx < 0 ? 3 : oIdx);
	switch(pregSlot)
	{
		case 0: ovaEffect.value1 = kGAMECLASS.GetGameTimestamp(); break;
		case 1: ovaEffect.value2 = kGAMECLASS.GetGameTimestamp(); break;
		case 2: ovaEffect.value3 = kGAMECLASS.GetGameTimestamp(); break;
		case 3: ovaEffect.value4 = kGAMECLASS.GetGameTimestamp(); break;
	}
	ovaEffect.tooltip = ovalastingTooltip(ovaEffect);
	
	IncrementFlag("EGG_TRAINING_OVALASTING");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function ovalastingTooltip(ovaEffect:StorageClass):String
{
	var tooltip:String = "You are under the effects of Ovalasting.";
	if(ovaEffect != null)
	{
		var eggSlots:Array = new Array();
		
		if(ovaEffect.value1 != 0) eggSlots.push(pc.vaginas.length == 1 ? "womb" : "first womb");
		if(ovaEffect.value2 != 0) eggSlots.push("second womb");
		if(ovaEffect.value3 != 0) eggSlots.push("third womb");
		if(ovaEffect.value4 != 0) eggSlots.push("ass");
		
		if(eggSlots.length == 1) tooltip += "\n\nYou currently have an egg in your " + eggSlots[0] + ".";
		else if(eggSlots.length > 0) tooltip += "\n\nYou currently have eggs in your " + CompressToList(eggSlots) + ".";
	}
	return tooltip;
}

// Mechanics
/*
Any type of sexual fluid ejaculated into OL’d hole will cause it to activate - e.g. stuff like rahn eggs will also work. OL’d hole should be considered taken for large egg layers, e.g. bothrioc and nyrea should not attempt to lay in it.
 
Once in active state, OL egg spends a week growing into a clutch before forcing birth. How many develop is dependent upon ET level:
 
Egg Training Level	No. of Eggs Developed
0	4-10
1	8-14
2	14-20
3	20-26
4	28-34
5	38-46

If the PC takes a second ejaculation in an already active OL hole AND is at level 3 or above, eggs become large.
*/

public function ovalastingEggCount(mother:Creature, pregSlot:int = -1):Number
{
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] == undefined) return 4;
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 0) return (4 + rand(7));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 1) return (8 + rand(7));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 2) return (14 + rand(7));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 3) return (20 + rand(7));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 4) return (28 + rand(7));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 5) return (38 + rand(9));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 6) return (48 + rand(9));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 7) return (60 + rand(9));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 8) return (72 + rand(9));
	if(flags["EGG_TRAINING_OVALASTING_LEVEL"] <= 9) return (86 + rand(11));
	return 120;
}

// Check for Ovalasting eggs in respective preg slot
public function hasOvalastingEgg(mother:Creature, pregSlot:int = -1):Boolean
{
	if(pregSlot < 0 || pregSlot > 3) return false;
	
	var ovaEffect:StorageClass = mother.getStatusEffect("Ovalasting");
	if(ovaEffect == null) return false;
	
	var ovaEgg:Boolean = false;
	switch(pregSlot)
	{
		case 0:
			if(ovaEffect.value1 != 0) ovaEgg = true;
			break;
		case 1:
			if(ovaEffect.value2 != 0) ovaEgg = true;
			break;
		case 2:
			if(ovaEffect.value3 != 0) ovaEgg = true;
			break;
		case 3:
			if(ovaEffect.value4 != 0) ovaEgg = true;
			break;
	}
	return ovaEgg;
}
// PC takes a load in inactive OL hole
public function ovalastingPregnancySwap(cumFrom:Creature, mother:Creature, pregSlot:int = -1):Creature
{
	var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
	// Big egg if already has pregnancy
	if(pData.pregnancyType == "OvalastingEggPregnancy")
	{
		// PC takes second load in already fertilized OLhole
		mother.createStatusEffect("Ovalasting Message", (pregSlot == 3 ? -1 : pregSlot), 0, 0, 0, true, "", "", false, 10);
		if(flags["EGG_TRAINING_OVALASTING_LEVEL"] >= 3) mother.createStatusEffect("Ovalasting Big Egg " + pregSlot);
	}
	// Change pregnancy type if occupied by Ovalasting egg.
	else
	{
		var ppOvalasting:PregnancyPlaceholder = new PregnancyPlaceholder();
		ppOvalasting.impregnationType = "OvalastingEggPregnancy";
		cumFrom = ppOvalasting;
	}
	
	return cumFrom;
}

// 7 days (birth)
public function ovalastingPregnancyEnds(pregSlot:int, pregEggs:int, totalEggs:int):void
{
	clearOutput();
	showBust("");
	showName("\nEGGS!");
	author("Nonesuch");
	
	var bigEgg:Boolean = (pc.statusEffectv1("Ovalasting Big Egg " + pregSlot) > 0);
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	output("There’s a rumbling in your [pc.belly], followed by a distinct pulling, liquefying sensation. The eggs in your Ovalasted " + (pregSlot == 3 ? "ass" : "pussy") + " are coming!");
	output("\n\nIn a slight panic, you waddle");
	if(inShip) output(" to your bedroom");
	else if(inPublic) output(" to a nearby bathroom");
	else output(" to a secluded spot");
	output(". Biological imperative makes you squat and, as the feeling intensifies dramatically, bear down mightily with your hips. Sweat standing out on your brow, you cry out as the first egg stretches your " + (pregSlot == 3 ? "sphincter" : "pussy lips") + " wide.");
	if(bigEgg) output(" Oh fucking Void, it’s so big! What were you thinking, letting them absorb so much cum? Lube gushes liberally around it, and you scream as the sheer pressure from the egg-train above forces it through, pushing you straight into delirious orgasm, the pulses of pleasure seizing up your " + (pregSlot == 3 ? "colon" : "twat") + " only making the grapefruit-sized ovals come faster. And that was just the first...");
	else output(" It’s intense, so intense that stars float in your eyes as it slides through, coming free in a great gush of lube. You moan, feeling pressure build inexorably as the next egg pushes its broad mass against your sensitive hole, and you squeal in orgasm as you push it to freedom, squirting " + (pregSlot == 3 ? "[pc.femcum]" : "[pc.cum]") + " in dazed clenches.");
	output("\n\nThey just keep coming, one after the other sliding down " + (pregSlot == 3 ? "your back passage" : "the tunnel of your twat") + " and stretching you wide, requiring huffing, hefty pushes of your [pc.hips] to come free and land in the oozing, ever-growing pile. Another orgasm follows swiftly upon the heels of the last, blowing away all thought as you lay yet another " + (!bigEgg ? "cute, pink oval" : "huge, pink, ostrich-like egg") + ", the pressure put on your " + (pregSlot == 3 ? (pc.hasCock() ? "prostate" : "rectum") : "sensitive pussy lips") + "; you lose yourself utterly in the process, nothing more than a helpless, egg-producing machine, squatting and birthing the wonderful, hefty brood that you grew within you.");
	output("\n\nEventually you fall to one side, numbed, dazed and thoroughly gaped, your [pc.groin] and thighs utterly coated in");
	if(pc.hasGenitals())
	{
		if(pc.hasCock()) output(" [pc.cum]");
		if(pc.isHerm()) output(",");
		if(pc.hasVagina()) output(" [pc.femcum]");
		output(" and");
	}
	output(" clear egg-lube. You blearily consider the " + num2Text(pregEggs) + " eggs that you’ve birthed,");
	if(pregEggs <= 36) output(" a small but still considerable pile");
	else output(" a vast, cairn-like pile that is testament to your dedication to being a dutiful egg slut");
	output(".");
	if(flags["OVALASTING_EGGS_SOLD"] == undefined) output("What are you going to do with them? Presumably the egg trainer machine doesn’t need them. Perhaps if you cleaned them up, you could try and sell them to someone...?");
	else output(" Once you’ve cleaned them up, they should fetch a nice price. Or you could sit your [pc.ass] down on them, keep them nice and warm...? You push that deep, enticing vaguery away.");
	output("\n\nYou");
	if(inShip) output(" wash them in the bathroom");
	else if(inPublic) output(" wash them in the sink");
	else output(" rub them off as best you can");
	output(" before cleaning yourself up. Now that the overwhelming sensation of birthing has faded, you realize there’s still a small, warm glow emanating from your gut - the original Ovalasting egg, still lodged within your " + (pregSlot == 3 ? "ass" : "womb") + ", awaiting another bath of fertile fluids to kick-start the whole process again. You shiver slightly at the thought as you continue what you were doing. Slowly. You’re going to be walking rather gingerly for a little while.");
	
	pc.energy((!bigEgg ? -1 : -2) * pregEggs);
	processTime(20 + rand(11));
	
	// Loot egg!
	output("\n\n");
	ovalastingEggReward(bigEgg, pregEggs);
}

// Premature Birth
// Happens 1 hour after load taken in an inactive OL’d vagina AND actual fertilization takes place. If OL active and dividing, fertilization should not take place.
public function ovalastingPrematureBirth():void
{
	clearOutput();
	showBust("");
	showName("\nUH-OH!");
	author("Nonesuch");
	
	var pregSlot:int = pc.statusEffectv1("Ovalasting Early Clutch Timer");
	if(pregSlot == 3) kGAMECLASS.pc.removeStatusEffect("Anally-Filled");
	else kGAMECLASS.pc.removeStatusEffect("Vaginally-Filled");
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	output("There’s a rumbling in your [pc.belly], followed by a distinct pulling, liquefying sensation. The egg lodged in your [pc.pussy " + pregSlot + "] is coming out!");
	output("\n\nIn a slight panic, you waddle");
	if(inShip) output(" to your bedroom");
	else if(inPublic) output(" to a nearby bathroom");
	else output(" to a secluded spot");
	output(". Biological imperative makes you squat and, as the feeling intensifies dramatically, bear down with your hips. You huff and grunt as your lips are spread wide by the smooth oval, arousal peaking as it planes over your [pc.clit] - and then it’s gone, slipping out of you and landing on the floor with a wet clack.");
	output("\n\nYou frown as you pick it up. Is that supposed to happen?");
	if(StatTracking.getStat("pregnancy/ovalasting eggs laid") <= 0) output(" The Egg Trainer was pretty clear that the thing was going to divide if bathed in cum.");
	else output(" You know from intense experience that the thing usually divides if bathed in cum.");
	output(" Unless it’s programmed somehow to abort itself if the fluids in question actually manage to... you shiver slightly at the thought, hand darting down to your [pc.belly]. Is <i>that</i> it?");
	
	// Switch failed egg off
	var ovaEffect:StorageClass = pc.getStatusEffect("Ovalasting");
	eggTrainerOvalastingCleanup(ovaEffect, pregSlot);
	
	if(pc.statusEffectv1("Ovalasting Big Egg " + pregSlot) > 0) pc.removeStatusEffect("Ovalasting Big Egg " + pregSlot);
	
	pc.removeStatusEffect("Ovalasting Early Clutch Timer");
	
	processTime(10 + rand(11));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function ovalastingNurseryEnds():void
{
	clearOutput();
	showBust("");
	showName("\nEGGS!");
	author("Nonesuch");
	
	// Loot egg!
	var bigEgg:Boolean = false;
	var pregEggs:int = 0;
	for(var i:int = -1; i < pc.pregnancyData.length; i++)
	{
		pregEggs += pc.statusEffectv1("Ovalasting Egg " + i);
		pc.removeStatusEffect("Ovalasting Eggs " + i);
		if(pc.statusEffectv1("Ovalasting Big Egg " + i) > 0) bigEgg = true;
	}
	ovalastingEggReward(bigEgg, pregEggs);
}
private function ovalastingGetEgg(bigEgg:Boolean = false):ItemSlotClass
{
	if (bigEgg) return new OvalastingEggLarge();
	return new OvalastingEggSmall();
}
private function ovalastingEggReward(bigEgg:Boolean = false, pregEggs:int = 4):void
{
	var eggItem:ItemSlotClass = ovalastingGetEgg(bigEgg);
	var eggList:Array = [eggItem];
	
	// Adjust quantity for item stacking.
	var idx:int = 0;
	var iQuantity:int = 0;
	while(pregEggs > 0)
	{
		iQuantity = ((pregEggs < eggList[idx].stackSize) ? pregEggs : eggList[idx].stackSize);
		if(iQuantity > 0)
		{
			eggList[idx].quantity = iQuantity;
			pregEggs -= iQuantity;
			if(pregEggs > 0)
			{
				eggItem = ovalastingGetEgg(bigEgg);
				eggList.push(eggItem);
				idx = (eggList.length - 1);
			}
		}
		else pregEggs = 0;
	}
	
	for(var i:int = -1; i < pc.pregnancyData.length; i++)
	{
		if(pc.statusEffectv1("Ovalasting Big Egg " + i) > 0) pc.removeStatusEffect("Ovalasting Big Egg " + i);
	}
	
	if (eggList.length > 0)
	{
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(eggList);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

// Remove OL Egg
// Only possible if OL egg is not currently fertilized
// Prioritizes most recently implanted if multiple
public function eggTrainerOvalastingRemovalMenu():void
{
	clearOutput();
	showName("\nOVALASTING");
	showBust("EGG_TRAINER");
	author("Nonesuch");
	
	clearMenu();
	var ovas:int = 0;
	var ovaEffect:StorageClass = pc.getStatusEffect("Ovalasting");
	if(ovaEffect != null)
	{
		if(ovaEffect.value1 != 0) ovas++;
		if(ovaEffect.value2 != 0) ovas++;
		if(ovaEffect.value3 != 0) ovas++;
		if(ovaEffect.value4 != 0) ovas++;
	}
	var btnSlot:int = 0;
	if(ovas >= 2 || pc.hasVagina())
	{
		output("Which Ovalasting egg would you like to remove?");
		
		if(pc.vaginas.length == 1)
		{
			if(ovaEffect == null || ovaEffect.value1 == 0) addDisabledButton(btnSlot++, "Vagina", "Ovalasting: Vagina", "Your womb does not have an Ovalasting egg.");
			else if(pc.isPregnant(0)) addDisabledButton(btnSlot++, "Vagina", "Ovalasting: Vagina", "Your [pc.vagina] is currently occupied!");
			else addButton(btnSlot++, "Vagina", eggTrainerOvalastingRemoval, 0, "Ovalasting: Vagina", "Remove the Ovalasting egg from your [pc.vagina].");
		}
		else
		{
			if(ovaEffect == null || ovaEffect.value1 == 0) addDisabledButton(btnSlot++, "Vagina #1", "Ovalasting: Vagina No.1", "Your first womb does not have an Ovalasting egg.");
			else if(pc.isPregnant(0)) addDisabledButton(btnSlot++, "Vagina #1", "Ovalasting: Vagina No.1", "Your [pc.vagina 0] is currently occupied!");
			else addButton(btnSlot++, "Vagina #1", eggTrainerOvalastingRemoval, 0, "Ovalasting: Vagina No.1", "Remove the Ovalasting egg from your [pc.vagina 0].");
			if(ovaEffect == null || ovaEffect.value2 == 0) addDisabledButton(btnSlot++, "Vagina #2", "Ovalasting: Vagina No.2", "Your second womb does not have an Ovalasting egg.");
			else if(pc.isPregnant(1)) addDisabledButton(btnSlot++, "Vagina #2", "Ovalasting: Vagina No.2", "Your [pc.vagina 1] is currently occupied!");
			else addButton(btnSlot++, "Vagina #2", eggTrainerOvalastingRemoval, 1, "Ovalasting: Vagina No.2", "Remove the Ovalasting egg from [pc.vagina 1].");
			if(pc.vaginas.length >= 3)
			{
				if(ovaEffect == null || ovaEffect.value3 == 0) addDisabledButton(btnSlot++, "Vagina #3", "Ovalasting: Vagina No.3", "Your third womb does not have an Ovalasting egg.");
				else if(pc.isPregnant(2)) addDisabledButton(btnSlot++, "Vagina #3", "Ovalasting: Vagina No.3", "Your [pc.vagina 2] is currently occupied!");
				else addButton(btnSlot++, "Vagina #3", eggTrainerOvalastingRemoval, 2, "Ovalasting: Vagina No.3", "Remove the Ovalasting egg from your [pc.vagina 2].");
			}
		}
		if(ovaEffect == null || ovaEffect.value4 == 0) addDisabledButton(btnSlot++, "Asshole", "Ovalasting: Asshole", "Your ass does not have an Ovalasting egg.");
		else if(pc.isPregnant(3)) addDisabledButton(btnSlot++, "Asshole", "Ovalasting: Asshole", "Your ass is currently occupied!");
		else addButton(btnSlot++, "Asshole", eggTrainerOvalastingRemoval, -1, "Ovalasting: Asshole", "Remove the Ovalasting egg from your [pc.asshole].");
		
		if(ovas >= 2) addButton(13, "Latest", eggTrainerOvalastingRemoval, -2, "Ovalasting: Latest", "Remove the most recently implanted Ovalasting egg.");
	}
	else
	{
		output("Are you sure you want to remove the Ovalasting egg inside you?");
		
		addButton(0, "Remove", eggTrainerOvalastingRemoval);
	}
	addButton(14, "Cancel", repeatEggTrainerApproach);
}
public function eggTrainerOvalastingRemoval(oIdx:int = -2):void
{
	clearOutput();
	showName("\nOVALASTING");
	showBust("EGG_TRAINER");
	author("Nonesuch");
	
	var ovaEffect:StorageClass = pc.getStatusEffect("Ovalasting");
	
	if(ovaEffect == null)
	{
		output("<b>ERROR:</b> Ovalasting egg not found!");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	if(pc.findPregnancyOfType("OvalastingEggPregnancy") >= 0)
	{
		output("<b>ERROR:</b> You cannot remove Ovalasting egg while it is <i>IN PROGRESS</i>.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	// For prioritizing the latest one.
	if(oIdx == -2)
	{
		var eggSlots:Array = [ovaEffect.value1, ovaEffect.value2, ovaEffect.value3, ovaEffect.value4];
		oIdx = eggSlots.indexOf(Math.max(ovaEffect.value1, ovaEffect.value2, ovaEffect.value3, ovaEffect.value4));
	}
	
	output("As enjoyable as it’s been, you’ve decided it’s time to get the Ovalasting egg out of you.");
	if(oIdx > 0) output(" If anything, having it has made you crave a real baby -- or just a belly full of alien eggs -- more than ever!");
	output(" You run a hand over your [pc.belly], slightly sad about getting rid of your endlessly productive little toy. It’s been fun.");
	output("\n\nYou tap the egg-trainer’s holoscreen and select the removal option. As usual, it tells you to disrobe and relax in the saddle, assuring you that it’ll take care of everything. You do as it says, settling down in the fuck-saddle and angling your pregnant hole with the slit under your [pc.butt]. You don’t even need to be told to grab the handlebars and relax, familiar with the device’s modus operandi as you are. It still warns you to take hold - this might be a bit of a ride.");
	output("\n\nYou shudder with anticipation, excitement replacing heavy heartedness. The tentacle’s bay opens under you, and the familiar, wriggling crown quickly presses against your [pc.vagOrAss " + oIdx + "], spraying your ass and thighs indiscriminately with hot, slick lube. A little moan escapes your lips, forced out by a slow but insistent insertion that spreads your hole open wider and wider.");
	if(pc.hasCock())
	{
		if(pc.cocks.length == 1) output(" Your [pc.cock] is soon as hard as diamonds, begging for attention you don’t want to give it");
		else output(" Your [pc.cocks] are soon as hard as diamonds, begging for attention you don’t want to give them");
		output("; letting the tentacle milk all the cum out of you is so much sweeter than giving in and using your hands!");
	}
	output("\n\nYou rock your hips back against the tentacle, taking it as deep as you can. It fills you with lube, squirting the stuff into your " + (oIdx < 0 ? "bowels" : "womb") + " and making sure that every blessed inch of your insides is absolutely drenched. After a few minutes of its usual, pleasant fucking, though... something changes. The tentacle goes completely still and rigid inside you, not budging an inch even against your grinding hips -- the way it’s buried in your [pc.vagOrAss " + oIdx + "], you can’t move at all!");
	output("\n\nWith a grunt of displeasure, you try and squirm off the tentacle, but it holds you firm for a long moment. During the still second, you realize that the tentacle isn’t entirely frozen: it’s swelling, ever so slightly, but definitely growing thicker inside you. You gulp, feeling the slow and steady sensation of being stretched out by the inflating pseudo-phallus. When it finishes, you’re almost painfully stretched, groaning constantly from the intense pressure in your loins -- and the fire of arousal burning in you, desperate for more.");
	
	if(oIdx < 0) pc.buttChange(200);
	else pc.cuntChange(oIdx, 200);
	
	output("\n\nSomething ice-cold and sticky sprays from the tentacle’s tapered tip, blasting the bottom of the egg inside you. You yelp in surprise, almost orgasming from the shock... and finish as the tentacle decides it’s done, and slides right out of you. Gasping and crying out, you buck in the saddle and drench yourself and your trainer machine in ");
	if(pc.hasGenitals())
	{
		if(pc.isHerm()) output("both masculine and feminine ");
		else if(pc.hasVagina()) output("fem-");
		output("cum");
	}
	else output("ass lube");
	output(". The unexpected climax leaves you slumping against the machine, knuckles white from how hard you’re gripping the handlebars and leaking lube from your pregnant hole.");
	output("\n\nWhatever the tendril shot into your " + (oIdx < 0 ? "colon" : "womb") + " seems to have affected your egg. The synthetic orb shifts restlessly inside you. Your gut gurgles uneasily as the egg dislodges and shrinks a bit, getting properly aligned for what’s to come.");
	output("\n\nThe holoscreen helpfully tells you to please face your rump into the lube-tank. The lid slides off, revealing the sloshing tank of hot, steamy lube for you to give “birth” into. You swing your [pc.legOrLegs] forward, grabbing your belly to steady yourself as you feel the egg start to drop. A big, bold, pink word appears on screen: “<b>PUSH</b>.”");
	output("\n\nYou grit your teeth and push as hard as you can, bracing against the box for a little extra leverage.");
	output("\n\nHonestly, for a well-broken-in incubator like you, it’s a piece of cake. Almost disappointingly so. Whatever the tentacle pumped into you " + (oIdx < 0 ? "is make your ass spasm, finally flushing the thick bundle of synthetic substance that’s been nesting inside you for ages" : "has relaxed your womb, making it open up and regurgitate its unwanted occupant") + ". You grunt and push, and nearly orgasm again thanks to how well-trained to pump out eggs your body has become.");
	output("\n\nIt doesn’t take long for your seasoned muscles long to work the oval out, right up to your " + (oIdx < 0 ? "anal ring" : "pussy-lips") + " and then, with a climactic burst of effort, it pops out and goes sailing into the lube-bath, splashing into the tank with its friends. The breath goes out of you with a ragged gasp of pleasure, and you all but collapse backwards. A feeling of utter, absolute contentment spreads slowly through you. After that, you feel like you could drift off to sleep.");
	output("\n\nThe machine beeps something at you, but you’re way too worn out to get up and read it. Smiling to yourself, you glance into the tub, and see a pink ball slightly bigger than the other eggs resting atop the trainer’s payload, slowly submerging in the heated lube. A pang of... regret? Longing? Some emotion you can’t quite put words to tugs at your heartstrings for a moment as the lid slides closed, and you’re left to recover.");
	
	var pregSlot:int = (oIdx < 0 ? 3 : oIdx);
	eggTrainerOvalastingCleanup(ovaEffect, pregSlot);
	
	for(var i:int = -1; i < pc.pregnancyData.length; i++)
	{
		if(pc.statusEffectv1("Ovalasting Big Egg " + i) > 0) pc.removeStatusEffect("Ovalasting Big Egg " + i);
	}
	
	processTime(35);
	pc.orgasm();
	pc.energy(-10);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function eggTrainerOvalastingCleanup(ovaEffect:StorageClass, pregSlot:int = -1):void
{
	switch(pregSlot)
	{
		case 0: ovaEffect.value1 = 0; break;
		case 1: ovaEffect.value2 = 0; break;
		case 2: ovaEffect.value3 = 0; break;
		case 3: ovaEffect.value4 = 0; break;
	}
	ovaEffect.tooltip = ovalastingTooltip(ovaEffect);
	
	if(ovaEffect.value1 == 0 && ovaEffect.value2 == 0 && ovaEffect.value3 == 0 && ovaEffect.value4 == 0)
	{
		flags["EGG_TRAINING_OVALASTING_LEVEL"] = undefined;
		pc.removeStatusEffect("Ovalasting");
	}
}

/*

Pink Eggs
 
//Stack to 10 in inventory. If PC birthed them on ship, place any excess in storage. Otherwise they’ll have to chuck ‘em
 
//1 x SPE sell for 5 credits, LPE for 10, at wholesalers.

*/

