//Cannot be beaten with lust.
//Both gain lust passively, at the same rate.
//Teasing one gives the same amount of lust build-up to both.
//When lust is maxed, both will enter a Frenzy state, regaining health (and also getting one back up if they've been knocked down) and gaining new attacks.
public function showKQTwins(nude:Boolean = false):void
{
	showName("TWIN\nSEXBOTS");
	//Don't actually know if there's gonna be a nude variant or not
	showBust("KQ_TWINS" + (nude ? "_NUDE":""));
}
public function twinSexdollEncounter(VR:Boolean = false):Boolean
{
	if(VR) 
	{
		clearOutput();
		author("QuestyRobo");
		showKQTwins();
		output("You load the program and smile as you are shuffled to an artificial reality on a current of perfectly programmed electrons. You find yourself back in time, trying to rescue Kiro, coming upon two over-endowed, overly lusty dolls...");
		if(!pc.hasStatusEffect("VR_DOLLS")) pc.createStatusEffect("VR_DOLLS");
		output("\n\nThe two ausar “twins” that you defeated earlier are still here, still mindlessly rutting against each other. You could take them for a roll in the... floor if you wanted to.");
		clearMenu();
		addButton(0, "Twins", twinsRepeatEncounter);
		return false;
	}
	//Maaaybe shouldn't be able to fuck dolls as you're running away with your new crewmate
	if (flags["KQ_RESCUED"] != undefined)
	{
		if (flags["KQ_TWINS_DOWNED"] != undefined)
		{
			output("\n\nThe two ausar “twins” that you defeated earlier are no longer here.");
		}
		KQKiroFollowBonusTexts();
		return false;
	}
	else if (flags["KQ_TWINS_DOWNED"] != undefined)
	{
		output("\n\nThe two ausar “twins” that you defeated earlier are still here, still mindlessly rutting against each other. You could take them for a roll in the... floor if you wanted to.");
		if (flags["KQ_POSTER_LOOT"] != undefined) addButton(0, "Twins", twinsRepeatEncounter);
		else addButton(1,"Twins",twinsRepeatEncounter);
		return false;
	}
	else 
	{
		flags["KQ_STEP"] = undefined;
		author("QuestyRobo");
		showKQTwins();

		output("\n\nAs you’re traversing the halls of the mad doctor’s facility, you hear the sound of a heavy door opening in the distance. You raise your [pc.weapon] and get ready for any incoming security, only to jump when you hear a message from the loudspeaker.");
		output("\n\n<i>“Security clearance accepted. Welcome; experiment 17, experiment 18”</i>");
		output("\n\nAs soon as the message ends, the voice of the good doctor starts coming in over your codex. <i>“Apologies for that commotion. It’s just The Twins breaking out of their cell again.”</i>");
		output("\n\n<i>“The-”</i> Your question is interrupted by the lights dimming and two figures approaching you from down the darkened hall. You can’t quite make them out, but you can already tell they’re going to be trouble.");
		output("\n\n<i>“So this is the intruder,”</i> a feminine, synthesized voice bellows out. The other figure grunts in response, in a way that tells you that their mouth is obscured in some way. The faint glow of their eyes grows brighter and brighter until you can almost feel them on you.");
		output("\n\nThe first thing that comes into the light isn’t their faces or bodies, but rather pairs of gigantic, heaving breasts. The four mammoth orbs are covered in layers of latex so thin that it’s almost see-through. They’re both pitch black and shiny, with the only difference being the obvious size advantage one has, and the designations ‘Model 17’ printed on the smaller one and ‘Model 18’ on the larger. Written on each is things like ‘Storage Tank’, ‘1000 liter capacity’, and other designations that work to dehumanize the two.");
		output("\n\nThe next thing you see is a pair of utterly obscene bulges, once again covered so thinly that every detail down to the veins on their members is plainly visible. The bustier one is also clearly the more well-endowed, though neither of them could be called small, even by the pickiest size-queen. Just by eyeing it, you can tell that the smaller one is packing over three feet, with the other having easily a foot over her, and both packing sacks that could give their own mammoth breasts a run for their money.");
		output("\n\nFinally, they come into full view. The text-laden latex gives way to various metal harnesses, collars, wires, and plugs that give the girls the impression of being androids, but the sheer amount of exposed, if obviously augmented, skin tells you that they were once fully biological. Their faces are mostly covered, but the dog-like ears on their heads tell you that they began as ausar - or similar canids. The smaller one’s face is completely covered with a heavy-duty gas mask that completely obscures her eyes and would look more at home on heavy infantry, while the other’s is shaped into an animalistic skull, complete with massive fangs. The punk look of the larger of the pair is further completed by a series of studs and spikes decorating her suit.");
		output("\n\nThe smaller one grunts again, eliciting a response from her companion, who seems to be able to understand her in some way. <i>“I know, sister. I like [pc.himHer] too! So rare to see someone new, someone so... unmoulded... Oh, the ideas I have for [pc.himHer]!”</i>");
		output("\n\nThe smaller sister grunts again. <i>“Oh my, such debauchery, sister! I don’t know how I’ll contain myself until we’ve beaten [pc.himHer] into submission!”</i> Her cock bulges in its latex confines but remains well-contained by the sturdy material. A thick spray of pre fires out the end, seemingly unimpeded by the coverings. Her sister follows suit, just as aroused despite her silence. <i>“Guuuuh! Do you see how horny we are? Wouldn’t it just be so nice to come be our personal fuck-toy? Mother won’t give us another after we broke the last one!”</i>");
		output("\n\nThe two start moving toward you, a feral, dangerous hunger in the eyes that you can actually see. You didn’t come here to be made into a fuck-doll by a pair of lab rats! You draw your [pc.weapon] and get ready to fight.");
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(new KQTwinA, new KQTwinB);
		CombatManager.encounterTextGenerator(twinBotEncText);
		CombatManager.victoryScene(beatUpTheOverAugmentedTwins);
		CombatManager.lossScene(loseToTwinsAndFaceTheConsequences);
		CombatManager.displayLocation("TWIN SEXBOTS");
		clearMenu();
		addButton(0,"Next",CombatManager.beginCombat);
		return true;
	}
}
public function twinBotEncText():String
{
	{
		var s:String = "The two augmented sluts loom before you with an almost oppressive hunger about them.";

		var en:Array = CombatManager.getHostileActors();
		
		var bot17:KQTwinA;
		var bot18:KQTwinB;

		for (var i:int = 0; i < en.length; i++)
		{
			if (en[i] is KQTwinA) bot17 = en[i];
			else bot18 = en[i];
		}
		
		if (bot17.isDefeated()) s += "\n\n‘17’ is down for the count, reduced to a writhing, panting mess on the floor.";
		else 
		{
			s += "\n\nThe one labeled ‘17’ is the smaller of the two. Her face is covered in a military-grade gas mask and visor, completely obscuring her face, including her eyes. Two, black ausar ears poke out from the top of her head. While she is the smaller of the pair, her own wobbling, immense tits are still substantial. Two gargantuan tits hang heavily from her chest, sloshing around almost completely unimpeded by the near-non-existent material covering them. The patches of fully exposed flesh reveal tan skin.\n\nBetween her cow-like thighs are her mammoth cock and balls. ";
			// Low Lust
			if (bot17.lustQ() <= 33) s += "Her dick is already mostly hard and flexing on its own, drooling out a constant stream of thick pre that seems to go straight through her suit.";
			// Medium Lust
			else if (bot17.lustQ() <= 66) s += "Her dick looks hard enough that it should be bursting through its confines, but it that glossy material is stronger than it looks. The amount of pre leaking through it is ridiculous! You’d better be careful not to trip on any of the growing puddles she’s leaving behind.";
			//High Lust
			else if (!bot17.hasStatusEffect("Frenzy")) s += "Her dick has gotten so hard that her suit has actually started to mold around it, allowing the over-sized pole to stand at its full glory while it drools dense pre like a broken spigot.";
			//Frenzy
			else s += "Her dick is harder than you thought was possible. It’s a good inch thicker and even longer than it was before, with a network of pulsating veins, most of which you’re <i>sure</i> weren’t there before. The two massive spheres below quake visibly as they pump what seems like gallons of augmented seed up the pipeline of her cock. Either she’s orgasming <i>constantly</i> or the increased flood of chemicals has driven her production to levels her body can’t possibly contain!";
		}
		if (bot18.isDefeated()) s += "\n\n‘18’ is down on the ground, desperately seeking satisfaction. Despite that, her eyes never seem to look away from you.";
		else
		{
			s += "\n\n‘18’ is the larger of the pair. Like her ‘sister’, she’s wearing a gas mask, only hers is shaped into the form of an animal skull, complete with modeled fangs, and lacking the eye-covering visor, letting you see her augmented red eyes. Like ‘17’, her dog-like ears poke out the top of her head, only hers are blonde, giving you some doubt as to their actual relation. Her breasts are so large that they seem to wobble under their own weight. Like her ‘sister’, the material clings to every small detail of her huge tits and big, meaty nipples, almost looking like a second layer of skin. Her flesh in tan, much like her supposed sibling.\n\nHer stallion-shaming member sits between her broodmotherly hips. It’s wrapped in a film-thin layer of latex that still keeps all the details visible. ";
			if (bot18.lustQ() <= 33) s += "Her massive cock throbs ominously against its casing, looking like it’s going to burst out at any moment. Wads of pre drool out the tip constantly, soaking straight through the thin material.";
			// Medium Lust
			else if (bot18.lustQ() <= 66) s += "Her mammoth-sized dick is straining against its tight prison, the thumb-thick veins throbbing ominously as they send obscene amounts of filling into her already-overstuffed sausage. Dense pre pours out the tip like water from a heavily leaking tap.";
			//High Lust
			else if (!bot18.hasStatusEffect("Frenzy")) s += "Her absurdly tumescent bitch-breaker is so ragingly hard that it’s deforming the latex casing around it to allow it to stand higher. Molasses-thick pre pours out like a lewd waterfall, soaking the ground with deep pools of seed.";
			//Frenzy
			else s += "The latex around 18’s cock has morphed to allow it to stand completely unimpeded. The monolithic mass writhes and strains mid-air as it goes even further beyond hard, and reaches a new level of near-godly tumescence, gaining another two or three inches in the process. Her balls are also throbbing painfully hard, gaining a slight amount of mass as they work overtime to pump out an absurd amount of her ultra-virile seed. Said seed is firing out of her cumslit like the discharge from an out of control firehose in a decadent display of just how productive her mods have made her.";
		}
		if (bot17.hasStatusEffect("Gonna Gangbang")) s += "\n\n<b>17 is flanking you. Whatever she’s planning back there can’t be good. You should focus on her!</b>";
		return s;
	}
}
public function twinsRepeatEncounter():void
{
	clearOutput();
	author("QuestyRobo");
	showKQTwins(true);
	output("Very little, if anything, has changed with these two since you last saw them. They’re still rolling on the floor, groping and thrusting into each other with the ferocity and precision of wild dogs. Yet you still feel a pointed desire radiating off of them, inviting you to join in with them.");
	output("\n\nDo you really have time to spend fucking these two? <b>You’d best keep in mind how tainted these girls are and who made them. You’re not likely to get away with fucking them without something weird happening to you.</b>");
	clearMenu();
	var enemy:Creature = new KQTwinA();
	//I could base it off of enemy capacity, but since it's a hyper-focused scene, might as well let hypers enjoy
	//Also didn't do penis router cause the scene is focused on biggest dick anyway
	if (pc.hasCock()) addButton(0,"Run Train",penisRouter,[runATrainOfHyperSluts,80085,false,0],"Run Train","Be at the back and rail one sister while she fucks the other.");
	else addDisabledButton(0,"Run Train","Run Train", "You need a phallus for this!");
	addButton(1,"Lead Train",vaginaRouter,[leadChooChooSlutTrain,enemy.cockVolume(0),1,0,false],"Lead Train","Be at the front and take one of them while they get fucked by the other.");
	if (pc.hasCock()) addButton(2,"Get Service(P)",penisRouter,[twinsServiceYaDick,80085,false,0],"Get Service(P)","You’re not sure if their mouths are an option, but you’re sure they’ll manage.");
	else addDisabledButton(2,"Get Service(P)","Get Service(P)","You need a phallus for this!")
	if (pc.hasVagina()) addButton(3,"Get Service(V)",twinsServiceYaPussPuss,undefined,"Get Service(V)","You’re not sure if their mouths are an option, but you’re sure they’ll manage.");
	else addDisabledButton(2,"Get Service(V)","Get Service(V)","You need a vagina for this!")
	addButton(4,"Give Oral",suckDemTwinDicks,undefined,"Give Oral","Give the girls a little treat.");
	if(pc.hasStatusEffect("VR_DOLLS")) addButton(14,"Leave",vrLeave);
	else addButton(14,"Leave",mainGameMenu);
}

public function vrLeave():void
{
	clearOutput();
	showName("LOGGING\nOUT...");
	output("With the simulation complete, it’s time to return to the real world...");
	pc.removeStatusEffect("VR_DOLLS");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Victory
//All sex scenes give large amounts of taint.
public function beatUpTheOverAugmentedTwins():void
{
	showKQTwins(true)
	author("QuestyRobo");
	flags["KQ_TWINS_DOWNED"] = 1;
	output("After a long, arduous fight, you stand over the two modded ausar bitches as they fall to the ground; panting, beaten, and still insanely horny. They try to pleasure themselves in any way they can (which is a lot of ways, considering how much they have to work with) but it seems like they can’t feel anything through their suits.");
	output("\n\nThe intercom fires up again. <i>“Brilliant job, intruder. Once again, I apologize for the... rambunctiousness of my girls, but it seems you’ve dealt with them quite well. I think you deserve a reward for a job well done...”</i>");
	output("\n\nSuddenly, the twins yell out in pleasure as their suits retract, leaving their implant-dotted skin fully exposed; a fact that they quickly take advantage of by mashing their obscenely over-grown tits and cocks together, mercilessly pleasuring each-other in raw, beast-like motions.");
	output("\n\n<i>“They are yours to do with as you see fit. Don’t worry, they may seem rebellious, but given the right ‘stimulus’ they fall in line easily. Take as much time as you want, as well. Your friend " + (flags["KQ_LAST_HOUR_TF"] < 18 ? "is starting to love":"is loving") + " what I’m doing to her, and I’m sure we both want her to enjoy it for as long as possible!”</i> the doctor chuckles before cutting out, leaving you alone with the two hyper-pumped sluts.");
	output("\n\nDo you really have time to spend fucking these two? <b>You’d best keep in mind how tainted these girls are and who made them. You’re not likely to get away with fucking them without something very weird and very tainted happening to you.</b>\n\n");
	clearMenu();
	//I could base it off of enemy capacity, but since it's a hyper-focused scene, might as well let hypers enjoy
	//Also didn't do penis router cause the scene is focused on biggest dick anyway
	if (pc.hasCock()) addButton(0,"Run Train",penisRouter,[runATrainOfHyperSluts,80085,false,0],"Run Train","Be at the back and rail one sister while she fucks the other.");
	else addDisabledButton(0,"Run Train","Run Train", "You need a phallus for this!");
	addButton(1,"Lead Train",vaginaRouter,[leadChooChooSlutTrain,enemy.cockVolume(0),1,0,false],"Lead Train","Be at the front and take one of them while they get fucked by the other.");
	if (pc.hasCock()) addButton(2,"Get Service(P)",penisRouter,[twinsServiceYaDick,80085,false,0],"Get Service(P)","You’re not sure if their mouths are an option, but you’re sure they’ll manage.");
	else addDisabledButton(2,"Get Service(P)","Get Service(P)","You need a phallus for this!")
	if (pc.hasVagina()) addButton(3,"Get Service(V)",twinsServiceYaPussPuss,undefined,"Get Service(V)","You’re not sure if their mouths are an option, but you’re sure they’ll manage.");
	else addDisabledButton(2,"Get Service(V)","Get Service(V)","You need a vagina for this!")
	addButton(4,"Give Oral",suckDemTwinDicks,undefined,"Give Oral","Give the girls a little treat.");
	addButton(14,"Leave",CombatManager.genericVictory);
}
//10-14 inch gain if “small”, 7-9 if “medium”, 4-6 if “big” or “hyper”,1-3 if “super hyper
public function runATrainOfHyperSluts(x:int):void
{
	clearOutput();
	showKQTwins(true);
	author("QuestyRobo");
	//var x:int = pc.cockThatFits(9000000);
	//if (x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	if(pc.hasCocks())
	{
		if (x == 0) y = 1;
		else y = 0;
	}
	if(!inCombat())
	{
		setEnemy(new KQTwinA());
	}

	output("17 pounces on top of her sister, throwing her ass up into the air for you to see. Her plush, expansive rear wobbles like an overfilled waterbed while her puffy, blushing pussy is throbbing and gushing like a leaking dam. Just the sight of her hyper-exaggerated femininity gets your [pc.cocks] rock hard, and tells you exactly what you’re going to do with these two.");
	output("\n\n<i>“Get up!”</i> you command. The two modded-out sluts immediately stand to attention, visibly panting in inhuman lust, obscene monster-cocks throbbing in eager anticipation for what you have in store. You motion 17 to turn around, watching her bounce as she does. When she gets in place, you roughly start manhandling her with one hand while your other ");
	if (!pc.isCrotchExposed())
	{
		output("fishes your member" + (y >= 0 ? "s":"") + " out of your [pc.crotchCoverUnder] and starts jerking " + (y >= 0 ? "one of them":"it") + " off");
	}
	else
	{
		output("starts jerking " + (y >= 0 ? "one of your members":"your member") + " off.");
	}
	output("\n\nYou motion 18 to move in front of her sister, and she immediately seems to understand what you’re going for. She doesn’t just move up to her sister, she starts <i>ravaging</i> her sister; grabbing her by the cock, tits, whatever she can get her hands on. Watching the two living fertility idols mash their perfectly-crafted bodies sets your lust ablaze until it feels like it’s engulfing you from the inside out.");
	output("\n\nYou slap your [pc.cock " + x + "] between 17’s pillow-sized ass cheeks");
	if (y >= 0)
	{
		output(", letting your other member" + (pc.cockTotal() >= 3 ? "s":"") + " sink into the plush, warm flesh");
	}
	output(". You saw through, assaulting her from the back while her sister takes her from the front, an appropriate prelude for what’s about to happen.");
	output("\n\n<i>“Ready to be the filling, sister? Don’t worry, you’ll be giving <b>me</b> a filling as well!”</i> 18 turns around and starts hot-dogging 17 to your pace. For her part, 17 seems to be holding out rather well, or at least she’s not really vocalizing anything. For all you know she’s already broken since she never speaks in a way you understand. That sort of thing isn’t really your concern; you continue squishing the modded-out pup-slut between you and her sister.");
	output("\n\nFully warmed up and wanting to get on with the real action, you rear back, give her a heavy slap that draws out an audible moan, and press your [pc.cockHeads] against her fat, drooling pussy" + (y >= 0 ? " and yielding pucker":"") + ". 18 notices and makes her own moves, twisting around with a flourish, making sure to give you a nice view, and pressing her sister’s inhuman gut-buster against her own slobbering, cock-addicted fuckpit.");
	output("\n\nYou thrust your [pc.hips] with all your might, stuffing your [pc.cocks] into her as hard as possible. The force is enough to push the ultra-hung bitch-dick into her sister’s eager hole, forcing its own tumescent shape onto her gut as it distends it beyond reason.");
	if(!pc.hasStatusEffect("VR_DOLLS")) pc.cockChange();
	//"Small"
	if (pc.cocks[x].cLength() < 12)
	{
		output("\n\nYou wish you could say you were doing anywhere near the same job stuffing 17. She’s taking you like you’re nothing, almost playing with your comparatively microscopic member while their unreal pillars flop around in all of their impractical, near-unusable glory. Even if you’ve never felt a tinge of jealousy about this in your life, somehow your [pc.cock] is absolutely <i>straining</i> with pangs of it until it feels fit to burst!");
	}
	//"Medium"
	else if (pc.cocks[x].cLength() < 20)
	{
		output("\n\nDespite your best efforts, you couldn’t hope to deliver the same level of stomach-bulging to 17 that she’s delivering to her sister. Sure, if you peek around you can see the outline of your [pc.cockNounComplex " + x + "] in her belly, but just comparing it at a glance to the way 18 is being absolutely ruined tells you just how <i>small</i> you are in comparison! Before, you thought you were plenty big. Now? Now you realize just how much bigger the other sausages in the factory are, and an increasingly large part of you wants to be one of them! The desire is so intense that it almost feels like your dick is actually swelling to try and fulfill it.");
	}
	//"Big"
	else if (pc.cocks[x].cLength() < 40)
	{
		output("\n\nYou do your best recreation, stuffing 17 until her gut is forming into the shape of your [pc.cockNounComplex " + x + "]. You’re still smaller though. Normally you would barely notice or care, but something about seeing just how small your already-inhuman cock is infuriating you in a way that you’ve never felt before. It’s like your dick is alive and it’s just screaming at you to make it bigger, way bigger! You swear you read some fantasy porno about that" + (silly ? " - maybe in that <i>“Corrupted Champions”</i> game":"") + ".");
	}
	//"Hyper"
	else if (pc.cocks[x].cLength() < 60)
	{
		output("\n\nYou give 17 as good as she’s giving, forming her gut to the over-sized shape of your [pc.cockNounComplex " + x + "]. You’re much matching these two in terms of size, and yet it doesn’t feel satisfying. Someone of your caliber shouldn’t <i>just</i> be matching these two, you should be putting them to shame! You should be towering over them, showing these two uptight shrimp-dicks what a real cock looks like! You have no idea where any of this came from, but you can’t stop thinking about it now, especially with how absurdly hard and swollen your member feels right now.");
	}
	//Super Hyper
	else
	{
		output("\n\nYou put 17’s bulging to shame, turning her into a glorified condom for your magnificently-gigantic [pc.cockNounComplex " + x + "], so tightly molded to it that you can see your veins bulging against the inside of her skin. The sense of pride is almost infectious, swelling in your chest before traveling down south into your member, causing it to swell harder than you’ve ever felt it.");
	}
	output("\n\nThere’s a tingling sensation running all the way down your [pc.cocks] as you cram every inch you have into the mod-slut’s extremely accommodating hole" + (y >= 0 ? "s":"") + ". All the while, 18 is shrieking like a madwoman. <i>“YES, SISTER, RAVAGE ME! RUIN ME! Turn me into your cocksleeve while the intruder treats you like the fucktoy you are!”</i>");
	output("\n\nThe encouragement sets you off running, springing your [pc.hips] to action like high powered pistons, building up momentum at an exponential rate. You saw your length" + (y >= 0 ? "s":"") + " in and out of her with almost unreal ease. It feels like her insides are made of some kind of frictionless material.");
	if (flags["KQ_LAST_HOUR_TF"] >= 18) output(" Knowing how Po does things, that might not be far from the truth.");
	output("\n\nEach of your thrusts is mirrored by the double-teamed herm, manipulating her like a perverse marionette in order to propagate her incestuous plunge. The normally-silent pup-slut moans softly under your treatment. Despite her quietness, you somehow feel every moan reverberating into your brain, sharing her own lust with you in almost tantric fashion.");
	//Small or Medium
	if (pc.cocks[x].cLength() < 20)
	{
		output("\n\nThe throbbing of your [pc.cocks] becomes almost painful. It’s almost like your dickskin is tightening up or simply becoming too small to contain you. Despite the discomfort, you keep going, unable to stop even if you wanted to. The tingling and pulsing intensify enough to make it feel like your dick" + (y >= 0 ? "s are":"is") + " alive and trying to wrench " + (y >= 0 ? "themselves":"itself") + " away from you and lodge even further inside the seductive siren" + (silly ? " slut’s sweltering, sultry":"’s") + " space.");
		output("\n\nThe pull becomes more than psychological as you feel yourself slamming deeper and deeper, seeming to pull inches out of thin air. It doesn’t take long to confirm that’s exactly what’s happening. Even at a glance, you can tell your [pc.cocks] " + (y >= 0 ? "have":"has") + " gained a <i>considerable</i> amount of size");
		//the flags that i'm aware of related to dick growth in this quest
		if (flags["KQ_VULPATRA_TAINTS"] != undefined || flags["KQ_VR_LLAERWYN"] == 2) output(", way more than the other experiments here have done to you");
		output("! ");
		//Low-medium taint
		if (pc.taint() <= 66) output("You <i>know</i> you should stop before you take in too much of whatever vile chemicals are in her " + (y >= 0 ? "ass and ":"") + "pussy, but the diabolical concoction has seized control of your muscles!");
		//high-max
		else output("You almost howl in pleasure as the realization hits you. You don’t think you’ve ever felt more fulfilled doing anything than you have fucking this over-pumped skank’s " + (y >= 0 ? "welcoming cock-holsters":"slobbering slut-hole") + ", and if she’s just going to make sure that you can do that job as well as possible than who are you to argue? All you want to do, no, all you <i>need</i> to do is pummel her like a rutting beast while she makes your [pc.cocks] bigger than you could have ever imagined. What’s not to love?");
	}
	//Big
	else if (pc.cocks[x].cLength() < 40)
	{
		output("\n\nYour [pc.cocks] swell with a mix of satisfaction and sheer envy. You know you’re already pretty big, but you’re not <i>big</i> like these two are. You’re stuffing this slut in a way that would ruin most women, but every fiber of your being is telling you how much more she can take, how much more she <i>wants</i> to take! Just as that thought passes, you realize what’s happening to you. You could tell your thrusts were getting heavier but now you see just <i>how much</i> “heavier” you’re getting! Your [pc.cocks] " + (y >= 0 ? "were":"is") + " already something to behold, but now " + (y >= 0 ? "they’re":"it’s") + " simply obscene, and still growing.");
		//Low-medium taint
		if (pc.taint() <= 66) output("\n\nYou strain to try and pull yourself away before her chemical-laden juices, but your body refuses to respond, and your mind is filled with doubt. Don’t you want to be bigger? After all, you already made yourself this big, what’s a few more inches? You <i>know</i> that’s wrong, but it’s becoming increasingly hard to care when it <i>feels</i> so right!");
		//high-max
		else output("\n\nYou welcome the change, and the taint surging into your blood, with open arms. Who are you to say no to " + (y >= 0 ? "bigger dicks":"a bigger dick") + "? You’re already too big for normal women, best to just be the biggest stud you can be the for size-queen sluts who graciously accommodate you!");
	}
	//Hyper
	else if (pc.cocks[x].cLength() < 60)
	{
		output("\n\nYour [pc.cocks] swell" + (y >= 0 ? "":"s") + " with pride along with your ego as you match these two ultra-modded dick-sluts. It’s an intoxicating feeling being so absurdly large that even a professional slut-crafter like Illustria can out-do you! Still, after getting used to being the biggest stud in the room for so long, it’s a little hard to accept being in a tie. Thankfully, you won’t have to for long if her tainted pussy juice has anything to say about it.");
		output("\n\nYour length" + (y >= 0 ? "s":"") + " shudder, drawing your attention down so you can see yourself swelling, stretching out her already-ludicrously-distended pussy " + (y >= 0 ? "and ass":"") + " with your expanding girth.");
		//Low-medium taint
		if (pc.taint() <= 66) output(" You look on with a mixture of shock, fear, and stunned pleasure. You can feel the chemicals seeping into you, boiling your blood with intense taint. You try and hold onto your senses but the infernal concoction has turned your body against you. The beating of your expanding veins weighs heavily on your mind as your blood is diverted, leaving you unable to think about anything other than continuing to fuck the dolled-up siren and absorb more of her blighted essence.");
		//high-max
		else output(" You feel the taint surging into you as it shapes your already-titanic totem" + (y >= 0 ? "s":"") + " into something even greater, and you want <i>more!</i> The rush of growth combined with the tingle of corruption mixing into your blood is more intoxicating and addictive than any drug you can think of. Once this is all over, maybe you can take these two with you so you never have to go without this feeling for too long?");
	}
	//Super Hyper
	else
	{
		output("\n\nYou grow lowly in supreme satisfaction at what’s happening. You never thought you’d find anyone outside of legitimate giants that could take your deity-like size with such ease. Their own monumental dicks look almost puny by comparison. The thought that even someone like Illustria Po can’t even craft a cock that can even hope to match yours swells your ego as much as it does your [pc.cocks].");
		output("\n\nA sublime sensation of growth washes over your member" + (y >= 0 ? "s":"") + ", expanding " + (y >= 0 ? "them":"it") + " to " + (y >= 0 ? "sizes":"a size") + " even further beyond. You don’t care, though" + (pc.taint() <= 66) ? ", despite your better judgement":"" + ". What’re another few inches on top of what you already have? These two seem more than willing to take it.");
	}
	if(!pc.hasStatusEffect("VR_DOLLS"))
	{
		//Sexy sexy cock changes
		//10-14 inch gain if “small”, 7-9 if “medium”, 4-6 if “big” or “hyper”,1-3 if “super hyper”
		var plus:Number = 0;
		var plus2:Number = 0;
		if (pc.cocks[x].cLengthRaw < 12) plus = 10+rand(5);
		else if (pc.cocks[x].cLengthRaw < 20) plus = 7+rand(3);
		else if (pc.cocks[x].cLengthRaw < 60) plus = 4+rand(3);
		else plus = 1+rand(3);
		//These two werent significant enough at the higher growth sizes.
		if (pc.hasPerk("Mini")) 
		{
			plus--;
			if(plus > 5) plus--;
			if(plus > 5) plus--;
		}
		else if (pc.hasPerk("Hung")) 
		{
			plus++;
			if(plus < 5) plus++;
			if(plus < 5) plus++;
		}
		if(plus < 2) plus = 2;
		pc.cocks[x].cLengthRaw += plus;
		//Made it properly size for Y with the same basic formula as X.
		if (y >= 0)
		{
			if (pc.cocks[y].cLengthRaw < 12) plus2 = 10+rand(5);
			else if (pc.cocks[y].cLengthRaw < 20) plus2 = 7+rand(3);
			else if (pc.cocks[y].cLengthRaw < 60) plus2 = 4+rand(3);
			else plus2 = 1+rand(3);
			if (pc.hasPerk("Mini")) 
			{
				plus2--;
				if(plus2 > 5) plus2--;
				if(plus2 > 5) plus2--;
			}
			else if (pc.hasPerk("Hung")) 
			{
				plus2++;
				if(plus2 < 5) plus2++;
				if(plus2 < 5) plus2++;
			}
			if(plus2 < 2) plus2 = 2;
			pc.cocks[y].cLengthRaw += plus2;

		}
		pc.taint(3);
	}

	output("\n\nYou start thrusting faster than you thought you were capable of, spurred on by the fresh injection of cock-pumping chemicals. Your movements feel heavier and heavier with each passing second, yet your body and, increasingly, mind are determined to carry your dick no matter what. Every inch added to your [pc.cocks] adds to the sublime, brain-melting pleasure. The outside world starts to fade as the tight, squelching of her " + (y >= 0 ? "fuck holes":"pussy") + " grows louder and louder to your [pc.ears].");
	output("\n\nWhile you’re slowly losing your mind, 18 continues to take her sister like a pro, even if her pace becomes more and more beastial in response. All the while, she smirks at you with a palpable aura of smugness. <i>“Are you struggling, sister? I can see why with how much you’re pumping [pc.himHer] up. My, my, go easy on [pc.himHer]! We don’t want [pc.himHer] to get addicted now, do we?”</i> she says with a thick veneer of sarcasm.");
	output("\n\nIt’s annoying enough to pierce the fog of brain-melting lust. You’re not quite sure what she said, but you know it’s worth punishing her over! Even better, the best discipline you can think of is to fuck 17 harder. Your [pc.hips] become a blur as you transform into an industrial fuck machine. Your motion sets 17 off, causing the normally mute mutant to finally fully vocalize her pleasure as she cums. Her pussy squeezes down with immense force while it tries to drown your [pc.cock " + x + "] in tainted girl juice" + (y >= 0 ? " and her ass puts your [pc.cock " + y + "] in an almost vice-like squeeze":"") + ". Meanwhile, 18 is getting the filling of a lifetime. Within seconds her belly swells out so much that you can easily see it from behind her, and it looks like she’s not going to stop any time soon.");
	output("\n\nDespite being pounded like a jackhammer and filled like a water balloon attached to a fire hydrant, she still manages to speak. <i>“Yes! YES, INTRUDER! Punish us! Own us! We’re your loving little trophy sluts and we’ll be the best cumsluts for our new " + pc.mf("master","mistress") + "!”</i>");
	output("\n\nHer words merge together with 17’s moans to form into lust-fueling white noise. The burning sensation in your [pc.hips] is becoming overwhelming, yet it feels strangely <i>good</i>! It’s like the sign of a job well done and a " + (y >= 0 ? "duo of holes":"pussy") + " well fucked. You’re throwing every part of yourself, physically and mentally, into this, just as nature intended. You growl out in feral lust as you feel another growth spurt hit your [pc.cocks], shattering what’s left of your restraint as you feel your [pc.balls] tighten up.");
	//Small cummies
	//gives a significant cum production bonus
	var oldCum:Number = pc.maxCum();
	if (pc.cumQ() <= 4000)
	{
		output("\n\nYou squirt into 17’s slutty, gluttonous hole" + (y >= 0 ? "s":"") + ", pumping out as much as you’re capable of. That doesn’t seem to be enough for her, though. A powerful jolt surges into your [pc.balls], sending you barreling into another orgasm, immediately. Your second, chemically induced spurt is <i>far</i> larger than your first, cramming what feels like a few extra quarts of [pc.cum] into the demanding mod-slut. Just when you think it’s over, another surge rushes into you, causing you to moan out as you fire off a third simultaneous orgasm that easily doubles the size of your last one. The diabolical pumping continues for what feels like hours until you’ve given 17 a cum-bloated belly that any size queen could appreciate. <b>The devilish lab-rat has boosted your cum production by an insane amount!</b>");
		output("\n\nAn ethereal voice whispers <i>“That’s better...”</i> but you have no idea where it came from. Could that have been 17?");
		if(!pc.hasStatusEffect("VR_DOLLS"))
		{
			while(pc.maxCum() < 4000 || pc.maxCum() < oldCum*2.5)
			{
				pc.boostCum(10);
			}
		}
	}
	//Medium cummies
	//Gives a big cum production bonus
	else if (pc.cumQ() <= 9000)
	{
		output("\n\nYou unload everything you have into 17’s welcoming hole" + (y >= 0 ? "s":"") + ", firing off your whole reserve at a frantic, almost painful pace. By the time you start to wind down, 17’s belly has bloated out to a pretty impressive degree. Just when you think you’re about to run dry, a surge of energy runs through your [pc.balls] and sets you off all over again. You dump out what feels like a whole second orgasm, and yet it’s still the same one! <b>Your cum production has easily doubled!</b>");
		output("\n\nSomewhere deep in your mind, an etherial voice chuckles at you.");
		if(!pc.hasStatusEffect("VR_DOLLS"))
		{
			while(pc.maxCum() < 9000 || pc.maxCum() < oldCum*2)
			{
				pc.boostCum(10);
			}
		}
	}
	//High Cummies
	else
	{
		output("\n\nYou blast out what feels like gallons of steaming [pc.cum] into the obedient dog-slut’s extra-capacitive hole" + (y >= 0? "s":"") + ". She coos appreciatively as your excessive virility turns her belly into a perverse mirror of her sister’s, even pumping out a few more shots into her in a jealous attempt to outpace you.");
		//Super High Cummies
		if (pc.cumQ() >= 15000) output(" Of course, you have way more to give than that! You pump and pump until 17 looks like she’s about to single-handedly repopulate an entire species and your excess is pouring out in rivers.");
		pc.boostCum(10)
		output("\n\n<i>“Good... very good,”</i> an ethereal voice whispers as you finally calm down.");
	}
	if(!pc.hasStatusEffect("VR_DOLLS"))
	{
		enemy.loadInCunt(pc,0);
		if (y >= 0) enemy.loadInAss(pc);
	}
	//pc can use a dick bigger than enemy capacity in this scene, but should only get down to the knot if they fit
	if (pc.hasKnot(x) && pc.cockVolume(x) <= enemy.vaginalCapacity()) 
	{
		output("\n\nEven after you’ve finished unloading inside of her, your knot" + (pc.hasKnot(y) ? "s remain":" remains") + " firmly inflated and locked in her. She reacts like you’d expect any good dog-slut to react; drooling, yipping, and wagging her tail in pleasure at being so thoroughly tied and bred.");
		output("\n\n<i>“Are you being knotted, sister? Oh, I’m so envious! I haven’t had a good knotting since Mother took ours. Oh, the days when you’d keep me tied down for hours on end...”</i>");
	}
	output("\n\nFinally, you pull out, taking far longer than you normally would thanks to the growth-inducing chemicals she’s pumped into you. Hefting up your [pc.cock " + x + "], you’d estimate that <b>she’s given you about " + num2Text(plus) + " extra inches of dickmeat" + (y >= 0 ? " and that's not even considering the extra volume your second prong gained":"") + "!</b> While you’re examining your expanded inches, the two lab-dogs start ruthlessly rutting again, apparently still not satisfied. It keeps them out of your way, at least; even if you feel a dangerous desire to go back in for another round...");
	output("\n\nYou get your gear back on and head out, the extra size weighing heavily on your mind.");
	output("\n\n");
	//Code note: make sure the parsers BEFORE growth are parsed before growth is applied and the parsers for post-growth are applied after the stat changes are made. It’ll be nicely noticeable if you jump a size category from the enlargement. -Fen
	processTime(45);
	pc.orgasm();
	if(pc.hasStatusEffect("VR_DOLLS")) addButton(0,"Next",vrLeave);
	else if (inCombat()) CombatManager.genericVictory();
	else 
	{
		clearOutput();
		addButton(0, "Next", mainGameMenu);
	}
}
//Lead
//Choice only available if you have a pussy.
//Gives big capacity boost to the hole used. Increases ass size by 3. Increases wetness if using Pussy
public function leadChooChooSlutTrain(hole:int):void
{
	clearOutput();
	showKQTwins(true)
	author("QuestyRobo");
	var x:int = hole
	if(!inCombat())
	{
		setEnemy(new KQTwinB());
	}

	output("Well, no one said you had good ideas. One look at the towering, obscene poles the two are toting and you knew <i>exactly</i> where you wanted this to go! You’re sure they’ll have a way to make it fit. Now, what you’re not sure about is if that way is going to work out well for you or not. ");
	if (pc.isBimbo()) output("Not like that’s something you’ve ever cared about when it came to taking cocks.");
	else output("That’s something to worry about later, against your better judgment.");

	output("\n\nYou put your hands up against the wall and thrust out your [pc.ass], giving it a slap as you beckon them over. Your [pc.vagOrAss " + x + "] clenches" + (x >= 0 ? "and juices up":"") + " as you watch their fleshy pillars bounce, throb, and squirt with every step the two take. 18 takes the lead, stepping up close enough that you can feel the immense heat wafting off of her overgrown crotch. You stifle back a moan when you feel her cock throb so hard that it almost reverberates through the air.");
	output("\n\n<i>“Feeling adventurous, intruder?”</i> Her unusually warm hands start groping all over your [pc.ass], sending strange sparks and pangs of lust seeping into your skin. After having her feel of your assflesh, 18 turns her attention to your [pc.vagOrAss " + x + "], shoving two fingers in and feeling you clench down on her.");
	output("\n\n<i>“Oh, you’re absolutely <b>begging</b> for it, aren’t you? Did you really come here to save your friend or did you just hear that mother makes lots of giant girl-cocks and come running? Don’t worry,”</i> she gives her almost person-sized shaft a long stroke, <i>“I have plenty to satisfy your slutty cravings. Maybe before I’m done, mother will have given your friend one to match so you can take her home and never want for big... throbbing... herm-cock ever again!”</i>");
	if (pc.isBimbo()) output("\n\nYou shudder along with every word. It’s like she’s reading right off of your brain! Now, if only she’d stop yapping and start fucking you!");
	else output("\n\nYou know she’s just trying to rile you up, but you can’t deny it isn’t working! Just her <i>being</i> there is enough to make your [pc.legOrLegs] weak, and you’re not sure how long you’ll last once she actually puts it in!");
	output("\n\n17 creeps up behind her sister and threads her own mammoth pole between the larger ausar doll’s cock-pleasing cheeks. <i>“Don’t be shy, sister. I think our intruder wants the full treatment!”</i> 18 takes her fingers out of your [pc.vagOrAss " + x + "] and slams her battering-ram-sized beast between your [pc.butts], nearly knocking you down with its sheer mass. She starts rhythmically humping you, throbbing, oversized meat drooling a constant stream of boiling hot pre down into the crack of your ass.");
	output("\n\nThe thick, creamy liquid tingles as it contacts with your [pc.skinFurScales]. The sensation almost seeps through you like a poison, spreading out along your veins as it mixes in with your blood. Your whole body starts to twitch in lustful agony as you try to suss out exactly what she’s doing to you. You <i>know</i> she’s pumping aphrodisiac into you. In fact, you’d be shocked if every fluid in her body wasn’t laced with the stuff. But there’s <i>something</i> extra in there that’s making your body freak out!");
	output("\n\n<i>“Feeling strange, intruder? Don’t worry, it’s just one of mother’s special ‘foreplay accelerators’ along with something to... <i>“prime”</i> you for what’s coming. Don’t want you breaking for your victory present!”</i>");
	output("\n\nYour [pc.vagOrAss " + x + "] clenches strangely, almost like it’s stretching itself.");
	if (x >= 0) output(" It’s getting <i>wet</i> too, far more than you usually do" + (pc.wetness(x) >= 3 ? ", and that’s saying something!":".") + "");
	if (pc.isBimbo()) output(" You know that she’s putting <i>something</i> in you and that if you asked some sciency egghead, they’d probably tell you how bad it was or something; but she said it would let you take dicks better, so who cares!");
	else if (pc.taint() <= 66) output(" You recoil slightly at the feeling of <i>something</i> starting to seep into you. It’s obviously something bad but you can’t pull yourself away, not this far in. You’re locked into this, whether you want to be or not.");
	else output(" The familiar tingle of Taint rushes through you faster and faster. You’re no strange to it at this point, though; you welcome the Taint" + (pc.taint() == pc.taintMax() ? ", you <i>love</i> the Taint!":".") + "");
	output("\n\nYour [pc.ass] has also been tingling and shuddering, almost like something’s building just beneath your [pc.skinFurScales]. Before you can focus too much on that, though, 18 decides to make her move. She pulls back and batters against your [pc.vagOrAss " + x + "], not able to fit inside yet thanks to her size.");
	output("\n\n<i>“You must be tired of the endless foreplay, though. You wanted us to fuck you, not just get your ass hotdogged for hours on end. Although, you seem to be enjoying it just fine.”</i> Before you can respond, she batters at you again, slathering your " + (x >= 0 ? "honeypot":"backdoor") + " with her insidious pre-spunk. Your hole quivers and begins to yield, slowly but surely.");
	output("\n\nThe ‘slowly’ part gets obliterated in a second as she suddenly batters through with all the subtlety of a drunk bull with a five-foot erection in a china shop. 18 screams out in pleasure as well over a foot of her member sinks into your [pc.vagOrAss " + x + "]. You look back and see that 17 seems to have grown impatient and decided to start stuffing her sister silly, forcing her forward and causing her eyes to screw up into her head.");
	output("\n\nWhile you’re looking back there, you notice something extra in your peripheral vision. Was your ass always that big? ");
	if (pc.buttRating() >= 6)
	{
		output("Yeah, it was ");
		if (pc.buttRating() < 8) output("big");
		else if (pc.buttRating() < 16) output("huge");
		else output("gigantic");
	 	output(" before, but there’s no denying how much it’s grown, and that it’s still growing!");
	}
	else output("With how unremarkable it was before, the change is very obvious and doesn’t seem to be stopping.");
	output(" Your [pc.ass] quivers and shudders as it slowly grows with each passing second, surely spurred on by one of the countless chemicals her fluids have been infused with.");
	output("\n\nBefore you can " + (pc.isBimbo() ? "admire":"dwell on") + " your expanding posterior, 18 slams her surprisingly strong hands onto your [pc.hips] and grabs on tight. <i>“Nggh! S-sister’s growing impatient, intruder! I’m going to get started before she gets <b>upset</b>.”</i>");
	output("\n\nBefore you can even open your mouth, another several inches of log-like cock ram into your [pc.vagOrAss " + x + "], sapping the strength from your limbs as you’re stuffed " + (pc.isGoo() ? "near the limits of what your gelatinous body can take":"beyond what any non-goo should be able to take") + ". Before she can go any further, though, she’s suddenly pulled back.");
	output("\n\n<i>“M-my, sister, you’re very excited today aren’t yoOOOUGHH!”</i> Without any warning, 17 spears both her sister on her cock and you on 18’s, stuffing your " + (x >= 0 ? "gaping, desperate cock-holster":"obscenely stretched bootyhole") + " with a good two feet of modded lady-cock. You and 18 groan out in unison as 17 seems to rip the reigns out from under to the two of you.");
	if(!pc.hasStatusEffect("VR_DOLLS")) pc.holeChange(x,enemy.cockVolume(0));
	output("\n\n<i>“S-see? Now she’s upsEEEEET!”</i> 17 continues hammering her sister, and you in the process. Each forceful thrust brings you a few inches closer to bottoming out on her; the constant stream of body-and-mind-bending sex juices coming from her cumvein slowly molding your " + (x >= 0 ? "drenched pussy":"anal") + " passage to the shape of her fleshy battering ram of a cock. She’s not even thrusting consciously, she’s far too out of it to do anything more than ride the momentum of her sister’s hip-shattering swings. 18 moans and babbles like a whore, in your ear, desperately trying to vocalize something but totally unable to form words.");
	output("\n\nYou’re not sure if it’s your own force of will or the obscene amount of aphrodisiacs in your body, but you manage to keep your composure inspite of being slowly turned into a living hyper-cock holster. ");
	if (pc.isBimbo()) output("Despite the sheer volume of tasty, super huge cock going in and out of your [pc.vagOrAss " + x + "], you still want more out of 18. As soon as you’re able to summon up the strength, you thrust your [pc.hips] back into the super stud as soon as her equally-yummy sister drags her out of you.");
	else output("Part of you realizes that the smart thing to do now would be to yank yourself off and escape before this can get any worse. Unfortunately, smart decisions haven’t been your strong suit since you decided to let a horny, hyper-hung mutant have her way with you. As soon as you feel her yank out of your [pc.vagOrAss " + x + "], you thrust back, following her back.");
	output("\n\n18 screams out with a piercing roar as you and 17 sandwich her between a cock and a hard slut! A faint voice whispers in your ear, seeming to slow time as you and the smaller sister ravage 18. Most of it is impossible to make out, but a few words keep coming through; <i>“Harder”</i>, <i>“Do it”</i>, <i>“Break her”</i>, <i>“Cock-slut”</i>. The words sink deeper into your mind, looping over and over until they become like commands to your malleable mind.");
	output("\n\n17 thrusts forward again, pushing 18 forward while you move almost perfectly in sync to keep as much cock inside of you as possible. Then <i>you</i> thrust back into 18 with enough force to knock her back and hilt her on her sister’s rod. The cycle continues as you and 17 get into almost perfect sync. You <i>know</i> she’s doing some kind of psionic" + (pc.isBimbo()) ? ".. thingie":" meddling" + " to make you do this, but it feels so good that you don’t even care!");
	output("\n\n18 is totally overwhelmed, going near limp as you and her mischevious sister turn her into a double-sided, living sex toy. She can’t even moan loudly anymore as the last ounces of strength in her body focus on keeping her cock hard, with only a scant amount keeping her hands locked onto your still-expanding [pc.ass]. You look down at your cartoonishly-bulging gut with ");
	if (pc.isBimbo()) output("sheer, overwhelming pride and pleasure");
	else output("a mix of fear, pride, and undeniable lust");
	output(". Despite her having pumped what feels like half a gallon of drugged pre into you already, her sheer girth and size is still plainly visible, from the multitude, thumb-thick veins to the constant pulsing of her overworked cumvein.");
	output("\n\nHer hefty sack bounces between your " + (pc.balls > 0 ? "own [pc.balls]":"[pc.ass]") + " and her sister’s own pendulous balls. Every impact lets you feel them <i>throb</i> and <i>bulge</i> with how <b>full</b> they are. Her pre is flowing faster and faster, already taking on a dense, creamy consistency that feels thicker than most lesser men’s full orgasms.");
	if (x >= 0)
	{
		//pussy,preg
		if (pc.isPregnant(x)) output(" It’s a good thing you’re already pregnant!");
		//non-preg, non-sterile
		else if (!pc.isPregnant(x) && pc.fertility() > 0) output (" You hope that Po got these girls sterilized");
	}
	output("\n\nMore words project themselves into your mind; <i>“Almost there”</i>, <i>“So close”</i>, <i>“So full”</i>, <i>“Take it”</i>, <i>“Cum”</i>. You and 17 pick up the pace, sharing in a psionically-linked desire to get 18 off. She bounces back and forth limply, like a doll being argued over by two energetic children.");
	output("\n\nThe well-used and near-insensate hyper herm summons up enough strength to speak. <i>“G-gonna... g-g... c-cum!”</i>");
	output("\n\nYou and 17 both slam into her when she says that, you burying her as deep inside your [pc.vagOrAss " + x + "] as possible while 17 rams every inch of her obscene body-breaker into her sister’s generous and desperate pussy. 18’s already-obscene dick bloats inside of you, gaining a few inches of girth as her pipeline-like cumvein swells with her oncoming flood. Before she can finish blowing off, though, 17 beats her to the punch, stuffing the larger futa bitch full with her gargantuan load.");
	output("\n\nHer orgasm reverberates into you through the mental link she forced on you. You fly over the edge in spectacular fashion, [pc.vagOrAss " + x + "] clenching down on her immense girth with all your might");
	if (x >= 0)
	{
		output(" while you absolutely soak her legs and gravid, unloading balls in ");
		if (pc.wetness() >= 5) output("flood-like amounts of ");
		else if (pc.wetness() >= 4) output("ridiculous amounts of ");
		else if (pc.wetness() >= 3) output("copious amounts of ");
		output("[pc.girlCum]");
	}
	output(".");
	if (pc.hasCock())
	{
		output("Meanwhile, your [pc.cocks] " + (pc.cockTotal() >= 2 ? "are":"is") + " busy unloading your seed onto the cold, lab floor below, creating ");
		if (pc.cumQ() <= 100) output("streaks");
		else if (pc.cumQ() <= 1000) output("small puddles");
		else if (pc.cumQ() <= 5000) output("a deep puddle");
		else if (pc.cumQ() <= 10000) output("a small lake");
		else output("a torrential flood");
		output(" of [pc.cumColor] just below you.");
	}
	output("\n\nJust as your first orgasm winds down and you take notice of 18’s bloated out belly resting against your back as it continues to steadily fill, her load finally finishes its long journey and explodes out of her widened cumslit. Your [pc.belly] explodes out as gallons of tainted seed rushes into your " + (x >= 0 ? "womb":"gut") + ". The sudden fluid injection sets you off again, forcing your eyes to screw up into your head as you join 18 in being turned into living cum balloons.");
	output("\n\nYou swell up more and more with her seed. Her oversized balls must have been working overtime while you were fucking her to produce as much seed as physically possible. Each ejaculation is more vigorous and copious than the last, rounding you out " + (pc.isGoo() ? "past the limits of what your goo-like body can take":"to a point you didn’t think was possible") + ". The only explanation you can come up with is that it’s another chemical in her cum making your body flexible enough to contain as much of their copious cum as possible.");
	output("\n\nBy the time it’s finally over, your belly is so distended that it reaches past " + (pc.hasKnees() ? "your knees":"where your knees would be") + " while you’re bent over. Looking over your shoulder, you see 18 in a very similar position, her own stomach so swollen that it’s resting on your significantly cushier [pc.ass].");
	output("\n\nJust when you start to wind down, you see an evil glint in 17’s eyes, glaring at you from behind her sister. A single, overriding word enters your mind: <i>“More!”</i> Suddenly your [pc.hips] start moving on their own, pulling you to the tip of 18’s monster cock in a direct mirror of 17.");
	output("\n\n18 speaks up for a moment, <i>“Sister, a-are you... GUUH!”</i> before being interrupted as you and 17 simultaneously slam into her again, then again, and again, and again. 17’s gone into a rut and she’s determined to take you with her!");
	clearMenu();
	processTime(60);
	pc.orgasm();
	if(!pc.hasStatusEffect("VR_DOLLS"))
	{
		pc.taint(6);
		if (x >= 0)
		{
			pc.vaginas[x].bonusCapacity += 50;
			pc.vaginas[x].wetness(1);
			pc.loadInCunt(enemy,x);
		}
		else
		{
			pc.ass.bonusCapacity += 50;
			pc.ass.wetness(1);
			pc.loadInAss(enemy);
		}
		pc.buttRating(5);
	}
	addButton(0,"Next",leadChooChooSlutTrainEpilogue,x);
}
public function leadChooChooSlutTrainEpilogue(x:int):void
{
	clearOutput();
	showKQTwins(true);
	author("QuestyRobo");
	output("<b>An hour later</b>");
	output("\n\nYou fall to the floor, limp, your body swelled to unthinkable heights. 18 joins you, her form a near-mirror of your own. 17 is still standing but seems out of it, somehow. It takes a bit, but eventually, the strength returns to your body and you’re able to stand. You waddle up to 17, ready to punish her for what she did, only to find her sleeping while standing.");
	output("\n\n18 weakly raises herself up before she begins to speak. <i>“The poor dear starts rutting if you tease her for too long. Apologies for her taking over you like that but she gets so hard to control when she’s like that. And then she overdoes it and passes out. She’ll be fine in a little bit if you’re concerned.”</i>");
	output("\n\nYou just shake your head and start getting ready to set off again, but not before taking stock of what’s changed. You reach back and squeeze your rear. <b>Even just from feeling it, you can tell your [pc.ass] has grown tremendously!</b> The sheer amount of cum flowing out of you makes anything in-depth difficult, <b>but even just trying to stretch your [pc.vagOrAss " + x + "] tells you just how much easier it is to do.</b> Not the worst set of changes, especially considering the kind of person that runs this place.");
	output("\n\nYou finally finish gearing back up and start heading out; something much easier said than done with how much cum you’re carrying around. 18 lets out a noise that’s somewhere between a laugh and a moan as she mockingly strokes her still-cum-spewing ogre cock at you. You ");
	if (pc.isBimbo()) output("resist the urge for another round");
	else output("ignore her as best you can");
	output(", you have a " + (flags["KIRO_BF_TALK"] == 1 ? "girl":"") + "friend to save after all!\n\n");
	processTime(1);
	if(pc.hasStatusEffect("VR_DOLLS")) addButton(0,"Next",vrLeave);
	else if (inCombat()) CombatManager.genericVictory();
	else 
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
//Dick
//Big cum production and refactory period boost, double if two cocks
public function twinsServiceYaDick(x:int):void
{
	clearOutput();
	showKQTwins(true);
	author("QuestyRobo");

	if(!inCombat())
	{
		setEnemy(new KQTwinA());
	}

	output("You " + (!pc.isCrotchExposed() ? "fish out your maleness and ":"") + "present your [pc.cocks] to the two modded-out sluts. Their reaction is immediate; they sit up like obedient little pups begging for treats from their master. The sight of their obscenely titanic tits bouncing freely, fully ready to wrap around your pole" + (pc.cockTotal() >= 2 ? "s":"") + " gets your engines firing up.");
	if (pc.lust() <= 33) output(" You get fully hard in record time, surprising even yourself as you close the gap between yourself and the Twins.");
	output("\n\n<i>“Oh my, just what are you going to do with " + (pc.cockTotal() >= 2 ? "those":"that") + ", intruder?”</i>");
	output("\n\nYou answer by slapping your cock into her cleavage");
	if (pc.cockTotal() >= 2)
	{
		output(" and your other dick into 17’s");
		if (pc.cockTotal() == 3) output(" with the extra one" + (pc.cockTotal()  >= 4 ? "s":"") + " flying free between them");
	}
	output(". You push back a groan as you come in contact with " + (pc.cockTotal() >= 2 ? "their":"her") + " perfect boobflesh. It’s so soft that your member" + (pc.cockTotal() >= 2 ? "s":"") + " sink into it without any extra force, and so warm and flawless that it’s hard to tell if it’s real or not.");
	output("\n\n<i>“Mother does such good work on skin. I wonder if your friend’s fur will be this soft after she’s done?”</i> You ignore her taunting and start hefting her exceptional bosom with all the effort you can muster. It’s no small feat given the sheer immensity of them, but the powerful urge to fuck this busty skank fills you with a sudden rush of vim, vigor, and " + (pc.cumQ() >= 1000 ? "fuck loads of ":"") + "spunk! At this point, you’re so desperate for some action that you’d become a modern-day Sisyphus if it meant you got your dick sucked on the way up.");
	output("\n\nYou bite your lip and shudder as you finally get them up and ready to drop. 18 chuckles, <i>“Did that little taste get you this excited? Why you haven’t even put them around that beautiful [pc.cock " + x + "] of yours and you already look fit to bursting! Are other women’s breasts made of sandpaper or are you just that much of a tit-obsessed little [pc.raceCute]?”</i>");
	output("\n\nYou ignore her chiding, take a deep breath, and drop the breasts. They flow and form around your [pc.cocks] like heavy, warm waterfalls. You groan out as the hot, perfect flesh smothers your shaft in its mesmerizing embrace. ");
	if (pc.cockTotal() >= 2) output("Her breasts touch down and begin jiggling on your crotch almost hypnotically. Your mind reels for a moment before you reach out to grab 17’s breasts in order to satisfy your other member" + (pc.cockTotal() >= 3 ? "s":"") + ". She doesn’t resist, letting you cram her pendulous tits beside her sister’s on your already-crowded crotch.");
	else output("Her breasts start swaying in an almost hypnotic fashion as they crash down around you. Your mind reels as the twin, perfect peaks rise high above your crotch, giving 17 a chance to move into position. 18 slides over, letting her sister squeeze in on your already over-crowded crotch, smothering your [pc.cock " + x + "] in immense pounds of boobflesh.");
	output("\n\nYou groan out shamelessly as the two ultra-busty skanks overwhelm you, barely needing to move their massive mammaries in order to make it feel like your [pc.cocksNounIsAre] buried deep inside the galaxy’s most luxurious vibrating onahole. You’re trapped, too mentally paralyzed by lust to form a coherent thought and too physically weighed down by the sheer amount of boobflesh on your crotch to even thrust.");
	output("\n\nYou feel yourself hurtling toward the edge when suddenly the pressure lifts as the two pull away from you. <i>“Well this is dull. Did you really want us to just sit there and let you cum into our breasts?”</i>");
	output("\n\nThat’s not an option you’d be entirely opposed to, but what other options do you really have?");
	output("\n\nDespite not saying that out loud, 18 responds. <i>“Oh, of course, the masks. I suppose it’s not obvious that we can open them.”</i> A faint, hydraulic hiss sounds out before the girls’ masks spring open. Your eyes go wide when the hatches fully pull back. Huge, glossy black lips spill out and wobble like tits breaking out of too-small bras. The expansive surfaces glisten like oiled latex, coated in thin layers of sweat. Their breath is hot and heavy as they finally taste the open air after Stars know how long being confined.");
	output("\n\n<i>“Mmhmmm, it feels so good to be free again. Oh, I can practically <b>taste</b> your [pc.cocksLight] from here!”</i> Her voice has an almost hypnotic huskiness now that you’re sure wasn’t there before. Your member" + (pc.cockTotal() >= 2 ? "s feel":" feels") + " absurdly hard, even considering you were just on the verge of cumming! Your eyes hone in on their puffy puckers and stick like glue. If you try and pull away from one, all that happens is that you hook on to the other.");
	output("\n\nYou find yourself meticulously cataloging every movement of their mouths, no matter how small. Your dick " + (pc.cockTotal() >= 2 ? "s twitch and flex":"twitches and flexes") + " as if the lewd lip motions were physically acting on " + (pc.cockTotal() >= 2 ? "them":"it") + ". Their movements become slower yet more exaggerated and deliberate. They’re playing you like a goddamn fiddle and they know it! Is that a bad thing, though? After all, you did want them to pleasure you. You can’t say the level of influence they have on you isn’t unnerving.");
	output("\n\nYou don’t have the patience to worry about that, though. Right now your [pc.cocks] " + (pc.cockTotal() >= 2 ? "are":"is") + " <i>screaming</i> at you to get a taste of those lips! ");
	if (pc.cockTotal() == 1) output("You decide to go for 17 first. Not much comes out of her mouth, so you might as well put it to work filling it up!  You grab her her head and yank her in, pressing her fat fuckhole onto your [pc.cockHead " + x + "]. The over-inflated skank immediately clamps down like a vice, sealing you in the soft prison of her mouth.");
	else output("Good thing you have " + (pc.cockTotal() >= 3 ? "more than ":"") + "enough cocks for both of them! You put a hand on each of their heads and drag them toward your " + (pc.cockTotal() >= 3 ? "multitudinous":"duo of") + " members. You move them effortlessly until they reach your [pc.cockHeads], planing them on your tips");
	output("\n\nThere’s an almost electric tingle when " + (pc.cockTotal() >= 2 ? "their":"her") + " lips meet your skin. Pleasure surges through your dick up to your brain, rattling your mind as though your head suddenly turned into a tumble dryer. The skin on " + (pc.cockTotal() >= 2 ? "their":"her") + " lips is so plush and warm that it’s almost unreal! You start comparing it to other things, in your head; from pussies to expensive sex toys. But each time you do it starts to feel better and better, almost as if they’re adapting to make sure you never want to stick your dick in anything else! All of this and " + (pc.cockTotal() >= 2 ? "she hasn’t":"they haven’t") + " even moved yet!");
	output("\n\nWithout thinking you start pushing " + (pc.cockTotal() >= 2 ? "them":"her") + " down on your [pc.cocks]. Despite the tightness, " + (pc.cockTotal() >= 2 ? "they":"she") + " glide down your pole" + (pc.cockTotal() >= 2 ? "s":"") + " with ease, bringing you into the deepest depths of " + (pc.cockTotal() >= 2 ? "their":"her") + " boiling hot, chemical-laced hole" + (pc.cockTotal() >= 2 ? "s":"") + ". Every inch " + (pc.cockTotal() >= 2 ? "they":"she") + " advance seems to slow time as your eyes stay honed in on the way " + (pc.cockTotal() >= 2 ? "both of their":"17’s") + " lips deform around your girth" + (pc.cockTotal() >= 2 ? "s":"") + " The slick, seemingly always shining surface gleams directly into your eyes. You follow them like a kitten follows a toy.");
	output("\n\nThe wet smack of " + (pc.cockTotal() >= 2 ? "their":"her") + " lips gliding up and down your shaft" + (pc.cockTotal() >= 2 ? "s":"") + " with almost friction ease slowly overwhelms every other noise, even your own heartbeat. You start pushing them faster, harder, demanding more contact with their immaculate, succulent lips. Every motion builds up some kind of lusty charge, pumping you up to almost painful hardness.");
	if (pc.cockTotal() >= 3) output(" Your other member" + (pc.cockTotal() >= 4 ? "s throb":" throbs") + " jealously as " + (pc.cockTotal() >= 4 ? "their":" its") + " brothers get the blowjob of a lifetime!");
	output("\n\nIt feels so good and yet you’re too transfixed to even moan in response. All you can think to do is get more of the object" + (pc.cockTotal() >= 2 ? "s":"") + " of your desire. You cum without even thinking about it, stuffing " + (pc.cockTotal() >= 2 ? "both of their":"17’s") + " slutty, siren fuckholes. ");
	if (pc.cumQ() <= 100) output("Shot glasses");
	else if (pc.cumQ() <= 1500) output("Liters");
	else if (pc.cumQ() <= 5000) output("Gallons");
	else if (pc.cumQ() <= 10000) output("Rivers");
	else output("Oceans");
	output (" of [pc.cum] fire out of your [pc.cocks] at a feverish pace. Your [pc.balls] work" + (pc.balls >= 2 ? "":"s") + " overtime to feed your over-stimulated loads into the dog slut" + (pc.cockTotal() >= 2 ? "s’ mouths":"’s mouth") + ". Even once you reach the point where you’d normally run dry, you keep going. Somehow you summon up vast reserves of extra seed out of thin air, your production spiking in order to further feed " + (pc.cockTotal() >= 2 ? "their sinful mouths":"her sinful mouth") + ".");
	if (pc.cockTotal() >= 2) output(" The jump in your sperm making becomes palpably heavy. Having two mouths to feed is driving your baby-batter factories to their absolute limits!");
	if (pc.cockTotal() >= 3) output(" Your other member" + (pc.cockTotal() >= 4 ? "s":"") + " fire off onto the pair, making sure they’re marked inside and out.");
	output("\n\nYou finish cumming and pull off, trying to find a moment to calm down and clear your head. Unfortunately for you, the two lippy sex bombs aren’t going to let that happen. ");
	if (pc.cockTotal() == 1)
	{
		output("17 sits there, licking her perfect puckers to make sure she’s swallowed every bit of your essence, meanwhile 18 is giving you the sultriest look she can, all the while breathing heavily in an exaggerated manner. Your [pc.cock " + x + "] stays absolutely rigid at the sight and you feel your [pc.balls] flooding with a renewed load.");
		output("\n\nWithout hesitation, you jump 18 and ram yourself " + (pc.biggestCockVolume() > 9000000 ? "as far as you can go":"to the hilt") + " in her magnificent mouth. How could you think of going soft when one of your gloriously lippy mistresses hasn’t pleasured herself on your cock yet? 17 isn’t done yet either; ");
		if (pc.balls >= 1) output("she cozzies up to your sack and starts planting kisses along the surface. ");
		else output("she cozzies up to your [pc.ass] and starts kissing around your rear entrance. ");
		output("Somehow her tongue feels just as good as when she was sucking your dick! How did you ever think of fucking anything else when these fucking lips are so good!?");
		output("\n\nYou ram 18’s throat like a mad " + pc.mf("","wo") + "man, going so fast that you hardly even feel the brief moments when you leave her wonderful wonderful maw. You cum again in short order, not even slowing down your thrusts as you do. Even while you’re emptying your [pc.balls] down her gullet, you feel it fill right back up quicker than you can let it out. It doesn’t seem like you’ll ever run dry as long as these two have you!");
	}
	else
	{
		output("The two lick their beautiful, perfect lips in order to get every last drop of your seed and musk down their throats. Despite the fact that you just finished filling them, you can tell that they already want <i>more</i>! Your [pc.cocks] remain painfully rigid and your [pc.balls] suddenly fill" + (pc.balls >= 2 ? "":"s") + " back up in record time. With the subtlety and self-control of a rutting animal, you grab the pair and ram yourself back in" + (pc.cockVolume(x) > 9000000 ? "":" to the hilt") + ".");
		output("\n\nYour mind swims as the rest of the blood from your brain travels southward. The last thoughts you have stamped onto your brain are all about their lips; how beautiful and big they are, how good they feel wrapped around your [pc.cocks], and how stupid you’ve been for thinking that you’ve ever truly experienced pleasure before this moment!");
		output("\n\nYou thrust until you cum, and no matter how much you cum you don’t slow down, you can’t slow down. You’re a machine now, made and molded only to shove your multiple masts into your mistresses’ luscious lips, indulging both of your rampant lusts as you lose sight of what you even came here for.");
	}
	processTime(10);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if(!pc.hasStatusEffect("VR_DOLLS"))
	{
		enemy.loadInMouth(pc);
		pc.applyCumSoaked();
	}
	clearMenu();
	addButton(0,"Next",twinsServicedYaDickNowEpilogue);
}
public function twinsServicedYaDickNowEpilogue():void
{
	clearOutput();
	showKQTwins(true);
	author("QuestyRobo");
	output("You spend the next hour falling deeper into The Twin’s lip-fueled trance. You fuck and thrust like a living sex toy" + (pc.cockTotal() >= 2 ? ", double-stuffing both girls until your muscles are sore and burning!":", only switching girls when they make you do so.") + "");
	output("\n\nYou’re not sure what happened but at some point, you blink and seemingly leap forward in time. You’re standing over the two, sore as you’ve ever been while the two are on the ground, passed out and swollen with your seed. How much did they make you cum?");
	output("\n\nYou stare down at the two and immediately begin being drawn to their lips again. You pull away, not wanting to get dragged into another round, not when you have a " + (flags["KIRO_BF_TALK"] == 1 ? "girl":"") + "friend to save! You get yourself ready again and set off, the thought of glossy black lips still in the back of your mind.");
	if(!pc.hasStatusEffect("VR_DOLLS"))
	{
		if (pc.cockTotal() >= 2)
		{
			pc.boostCum(10);
			pc.refractoryRate += 2.5;
		}
		pc.boostCum(10);
		output("\n\n<b>Your orgasms seem like they're going to be messier in the foreseeable future...</b>");
		pc.refractoryRate += 2.5;
		pc.taint(3);
		soreChange(1);
	}
	for(var y:int = 0; y < 5 ; y++) { pc.orgasm(); }
	processTime(50);
	output("\n\n");
	if(pc.hasStatusEffect("VR_DOLLS")) addButton(0,"Next",vrLeave);
	else if (inCombat()) CombatManager.genericVictory();
	else 
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
//Pussy
//increases wetness and acts as a use of the Pussy Pump, if still possible.
public function twinsServiceYaPussPuss():void
{
	clearOutput();
	showKQTwins(true);
	author("QuestyRobo");
	if(!inCombat())
	{
		setEnemy(new KQTwinA());
	}

	output("You’re not sure how exactly this is going to work, but you’re too horny right now to care! ");
	if (!pc.isNude()) output("You strip off your gear in a flash ");
	else output("You reach down to your already-bare pussy ");
	output("and start spreading them for the two over-sized sluts. They immediately drop what they’re doing and focus on you, gigantic cocks jutting straight at you. You shake your head and point to the twin monoliths, immediately shooting down the idea that you’ll be doing <i>that</i>.");
	output("\n\n<i>“Ah, I see,”</i> 18 says before you hear a soft hissing and their masks suddenly open up, revealing two pairs of almost-latex-looking, plump, black lips. <i>“You want more... sensual service,”</i> she punctuates her statement by licking along the considerable surface of her lips and then stretching her tongue out a good foot in order to show off. <i>“I assure you, we’re not blind to <b>those</b> just because of our... abundant male halves.”</i>");
	output("\n\nThe two top-heavy tramps close in on you, tongues lolling out as they descend on your [pc.vaginas] with hunger in their eyes. They plant their heavy frames just a hair away from your honeypot" + (pc.hasVaginas() ? "s":"") + ", letting their heavy, hot breath wash over your outer lips. Their extensive appendages dance just out of reach, only occasionally dipping in to lightly brush along your sensitive skin. Your [pc.thighs] close in on them instinctively, trying to push them into your flower" + (pc.hasVaginas() ? "s":"") + ", but they refuse to move.");
	output("\n\nYou reach out to push them down only to reel back in shock when their tongues dart straight into your [pc.vaginas]. You nearly fall over and cum on the spot as the twin organs drill their way into your moist depths, stretching your cavit" + (pc.hasVaginas() ? "ies to their limits":"y to its limit") + ". With how big and hot their tongues are and how pronounced every bump and ridge feels, it’s almost better than getting fucked by a real cock! And you don’t even have to worry about getting pregnant");
	if (pc.isFullyWombPregnant() || pc.fertility() <= 0) output(", not like you had to anyway.");
	else output(", at least you hope not.");
	output("\n\nThey dig deeper and deeper, fishing out inch after inch of their increasingly long oral organs so they can bottom out as fast as possible. Their muscle control is immaculate, twisting and contorting their tongues in order to optimally pleasure you. Your [pc.vaginas] convulse" + (pc.hasVaginas() ? " and squirt":"s and squirts") + " in response, lashing out against the invaders with waves of [pc.girlCum]. More and more of your essence floods out, far more than you’ve ever put out before. Every lap of their tongues fishes out more and more juice from reserves you didn’t know you had!");
	if (pc.vaginaTotal() == 1)
	{
		output("\n\nSuddenly, they stop. You look down at the pair and see 17 muscling out her sister in order to get sole custody over your puss. <i>“Hmph, so insistent, sister! Oh well, I suppose one of us had to do it. You’re in for a treat, intruder. ");
		if (flags["KQ_TWINS_PUSSY_SUCK"] == undefined) output("I can’t imagine you’ve had this done by a real woman before.”</i> What is she planning?");
		else output("You seemed to enjoy it quite a bit last time.”</i> You can’t wait.");
		output("\n\nShe latches onto your [pc.vagina] with her mouth, latching on like a lamprey before darting her tongue back inside you. You groan out loud in pleasure, although you’re not sure if it’s from the penetration or the suction. Your hands instinctively dart down to the back of her head to keep her down, but you know that with the near-vacuum seal she’s formed that she wasn’t going anywhere.");
		output("\n\nYou feel your pussy lips plump up in the iron lip-grip of the ausur-turned-sex-toy, all the while she ravages your passage like a wild beast. It’s like someone crossed a pussy pump and the world’s most proactive dildo and then stuck them onto a world champion pussy eater! Even when you start to buck uncontrollably from the sensation she doesn’t budge at all. The determined slut remains locked tight on your [pc.vagina], eating and sucking like a starving woman at a buffet.");
	}
	else
	{
		output("\n\nThey suddenly stop dead and yank their tongues out of your twin sexes. You look down to see what’s happening only to meet 18’s gaze as she stares up at you. <i>“You’re in a very unique position, intruder. Sister and I have never had someone we could both please at once like this. I wonder how you’ll fare" + (flags["KQ_TWINS_PUSSY_SUCK"] == undefined ? "":" this time") + ".”</i>");
		output("\n\nThe two take simultaneous deep breaths before slamming their faces into your twin sexes. You reel for a second, wondering what the hell they’re thinking before you finally feel it. Suction. They start sucking at your [pc.vaginas], creating a vacuum-like seal around your honeypots. You feel blood rushing down, inflating your lower lips far passed their normal size. It’s like someone slapped two luxury pussy pumps onto you!");
		output("\n\nThat’s just the start though. As soon as they’ve formed near-perfect seals, they reignite their hungry tonguing, diving deep into your twin depths. Despite also having to focus on keeping your lips contained, they still manage to eat you out like champions! Even when you start bucking and shuddering they don’t slow down or miss a single beat.");
	}
	output("\n\nSo much blood rushes to your lower lips that you actually start getting light-headed. Not like you could think much right now if you wanted to. The only thing you can consider doing right now is enjoying your new oral slut" + (pc.hasVaginas() ? "s":"") + "! You relax your muscles and let it happen, let " + (pc.hasVaginas() ? "her have her":"them have their") + " way with you.");
	output("\n\nYou feel so bloated down there. There’s so much blood pooling in your pussy lips that they feel pounds heavier, each. It becomes harder and harder to stand as the " + (pc.hasVaginas() ? "two thirsty succubuses continue":"thirsty succubus continues") + " to drain your strength. You cum, <i>hard</i>! so hard that you feel your [pc.footOrFeet] start to slip out from under you. ");
	if (pc.hasVaginas()) output("The two grab you and ease you down to the ground, not missing a beat in the process.");
	else output("18 catches you and eases you down to the ground until you’re resting on her crotch, her obscene cock and gigantic nuts throbbing against your back");
	output("\n\nYour back arches as you’re left prone and helplessly horny. Your first orgasm was merely the prelude to the oncoming storm. There’s no way to repair the dam once it’s burst. You hurdle from orgasm to orgasm, firing out [pc.girlCum] straight into " + (pc.hasVaginas() ? "the sisters’ hungry maws":"17’s hungry maw") + ". Every successive cum is bigger and juicer, giving more and more to try and sate the expansive thirst of the modded pup-slut" + (pc.hasVaginas() ? "s":"") + ". Your mouth is starting to go dry with how much of your body’s fluids are being converted into doggy-skank treats.");
	output("\n\nThe Twins start getting off almost as much as you are");
	if (pc.hasVaginas()) output(" all just from sucking on your cunts");
	else output(", 17 from sucking on you and 18 seemingly just from watching");
	output(". The musky, pervasive scent of their cum becomes more and more pervasive as they passively leak out liters of the stuff. There’s something more <i>intense</i> about it than before, something <i>primal</i>. The thought of your thickening, willing, and inhumanly wet [pc.vaginas] must be driving their baser, breeding instincts wild, jacking up their pheromones to even higher concentrations.");
	output("\n\nYou cum harder, nearly throwing yourself into the air as you imagine getting railed and bred by the two immense studs. The physical and sensual stimulation is turning you into an addict. You’re not sure if you’ll be able to live without something in your [pc.vaginas] constantly! Tongues, toys, cocks, it doesn’t matter, you <i>need</i> it!");
	output("\n\nYou thrash around, knowing that the two are laughing at how much you’re losing yourself, but frankly you don’t care! Your orgasms are becoming more and more intense, to the point where it feels like a small bomb is going off in your crotch every few seconds. Stars start dancing in your eyes and the world around you begins to fade before the biggest pussy-gasm you’ve ever had knocks you out cold.");
	processTime(60);
	enemy.girlCumInMouth(pc);
	for(var y:int = 0; y < 10 ; y++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",twinsNurseYouAfterEatingYourPuss);
}
public function twinsNurseYouAfterEatingYourPuss():void
{
	clearOutput();
	showKQTwins(true);
	author("QuestyRobo");
	output("You wake up a bit later, nearly panicking when you realize something is blocking out your vision and there’s something in your mouth. You squirm away when you realize it’s 18 nursing you.");
	output("\n\n<i>“You were so dehydrated, intruder. We needed to nourish you otherwise you wouldn’t have woken up.”</i> There’s a knowing snideness to her words. You know her milk is laced with <i>something</i>. It’s already making you horny again and you don’t have time for that (or do you?). Still, you grumble out an irritated <i>“thanks”</i> before starting to get your gear back on.");
	output("\n\nThe Twins’ mouths are still exposed and they’re trying to tempt you into another round, but you manage to resist and get moving again, ready to save Kiro!");
	if(!pc.hasStatusEffect("VR_DOLLS")) pc.taint(3);
	processTime(15);

	if(!pc.hasStatusEffect("VR_DOLLS"))
	{
		var puffNotice:Boolean = false;
		var wetNotice:Boolean = false;
		if(pc.vaginalPuffiness(0) < 3)
		{
			output("\n\n<b>This would be easier if you weren't feeling puffy and well, ripe between your thighs</b>.");
			puffNotice = true;
			pc.inflateVagina(0);
		}
		if(pc.vaginas[0].wetness() < 5)
		{
			pc.vaginas[0].wetness(2);
			if(!puffNotice) output("\n\n<b>This would be easier if you weren't feeling discernably moister below the waist...</b>");
			else output(" <b>You're wetter down there too, like, all the time.</b>");
			wetNotice = true;
		}	
		if(pc.hasVaginas())
		{
			if(pc.vaginas[1].wetness() < 5)
			{
				if(!wetNotice)
				{
					if(!puffNotice) output("\n\n<b>This would be easier if you weren't feeling discernably moister below the waist...</b>");
					else output(" <b>You're wetter down there too, like, all the time.</b>");
					wetNotice = true;
				}
				pc.vaginas[1].wetness(2);
			}
			if(pc.vaginalPuffiness(1) < 3)
			{
				if(!puffNotice)
				{
					if(!wetNotice) output("\n\n<b>This would be easier if you weren't feeling puffy and well, ripe between your thighs</b>.");
					else output(" <b>And your feminine genitalia is puffier too!</b>");
					puffNotice = true;
				}
				pc.inflateVagina(1);
			}
		}
		pc.boostGirlCum(10);
	}

	output("\n\n");
	if(pc.hasStatusEffect("VR_DOLLS")) addButton(0,"Next",vrLeave);
	else if (inCombat()) CombatManager.genericVictory();
	else 
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
//Give Oral
//Gives flexible jaw, like Snakebyte, if you don’t have it. Massive extra taint gain if that happens.

public function suckDemTwinDicks():void
{
	clearOutput();
	showKQTwins(true);
	author("QuestyRobo");

	output("The sight of the girl’s massive, visibly throbbing bitchbreakers and immense, over-stuffed sacks swaying brazenly in the open-air flips a switch in your brain. You start tracing along their thumb-thick veins with your eyes, watching them throb continuously as they feed the Twins’ immense pythons. The only time you look away is to watch their balls throb, brewing up their pool-filling loads at a super-human rate.");
	if (pc.isBimbo()) output("\n\nYour mouth is totally watering and you don’t even care! Just the sight of huge, horny cocks getting all <i>hard</i> and <i>heavy</i> drives you wild, especially when they have super gigantic, yummy balls swinging just under them! The thought of draining both pairs of delicious sperm tanks is almost enough to make you light-headed.");
	else output("\n\nYou try and get it out of your head, but no matter how much you try and get your head straight you get a whiff of their pheromones and your brain fills with images of gigantic cocks that you just can’t shake! You sigh and just resign yourself to it. You wanted to fuck anyway, and at least this way you’re not worrying about trying to shove those monsters where they shouldn’t be going.");
	output("\n\nThey know you’re watching, it’d be obvious even if you couldn’t see them looking back at you. Their mouths are covered but their grins are so obvious that you can almost <i>feel</i> them through the masks. They start thrusting their junk harder, sending their genitals thrusting and crashing into each other, with painful-looking force.");
	output("\n\n<i>“Are you enjoying the show?”</i> 18 asks sarcastically. <i>“I imagine bodies like ours aren’t common out there. It must be so enticing for you.”</i> The two stop thrusting, stand up and start strutting towards you, their enormous cocks still rock hard and jutting straight at you. They close in until they’re practically breathing on you, their immense members well within grabbing range... <i>“You can do more than look, you know.”</i>");
	output("\n\nBefore your brain can even process her words, your body is already acting on her invitation. Your hands dart to each member, totally unable to encircle even half of their immense girths. You stroke them off regardless, enjoying how their hot skin throbs constantly under your palms. ");
	if (pc.isBimbo()) output("Before you can start to steady yourself and take control of the situation, your body betrays you. Your traitorous hands simultaneously stroke up to the Twins’ tips, coating themselves in the seemingly-endless run-off. You take your hands away to collect yourself, only to ‘accidentally’ smear their juices all across your face. The potent pheromones knock the senses out of you, reducing all of your thoughts down to ‘get more cum!’");
	else output("You continue jerking off the two lovely studs, working them over until they’re nice and drooly for you. You dip over to their cumslits and shudder when you feel the sheer amout they’re already letting out. You take a break from them to smear their essence all over your face. You breathe it in deep, feeling your [pc.legs] starting to shudder from the pleasure.");
	output("\n\nYou fall to your kness" + (pc.isGoo() ? ", or at least the closest thing your gooey body has to them":"") +", fully submitting yourself to the two. They jump on the opportunity, closing the gap with you until you’re sandwiched between their pendulous sacks.");
	output("\n\n <i>“How about you get us warmed up? It’s going to be a <b>long</b> session, and I’m sure you want <i>everything</i> we have to offer, don’t you, slut?”</i> ");
	if (pc.isBimbo()) output("Damn right you do! ");
	else output("Didn’t you win, how’d you get into this mess? Too late to back out now, you suppose. ");
	output("Your mouth falls open by itself and you start to lick and kiss along the surface of 17’s sack. Her testes pulse against your mouth as you endeavor to stimulate as much of her immense balls as you can. Looking at how much you have to go makes covering all of it seem like an impossible task, and she’s the smaller of the two!");
	output("\n\nThe whole time you’re buried in 17’s obscenely swollen sack 18’s even bigger balls sit just behind you, full to bursting and throbbing so hard that you can feel it without even touching them. The sheer <i>need</i> radiating off the two girls is infectious, and you soon find your own loins equally as enflamed.");
	if (pc.isHerm())
	{
		output(" Both of your hands dart down to your own twin sexes, one wrapping around your [pc.biggestCock]");
		if (pc.cockTotal() >= 2) output(", occasionally making an indecisive swap to " + (pc.cockTotal() >= 3 ? "one of your other members":"your other member") + "");
		output(" while the other rams a few fingers into your [pc.pussy].");
	}
	else if (pc.hasCock()) output(" Both of your hands dart down to your [pc.cocks], stroking off your maleness while you practically worship theirs.");
	else if (pc.hasVagina()) output(" Both of your hands rush down to [pc.oneVagina], one cramming as many fingers as possible inside while the other works your clit.");
	output(" You feel yourself on the verge of orgasm by the time you’ve finished with <i>one</i> of 17’s testes! Before you can switch to the other, 18 grabs you and impatiently pulls you over to her.");
	output("\n\nYou practically drown in the dense ball musk. It’s almost so thick that you have to choke it down just to breathe. Despite how oppressive it all is, you love it! Being between these two obscenely virile masses gives you such an alien thrill that you can’t help but enjoy it. Before you’re even done with 18’s sack she decides you’re done down there and yanks you back up. You’re brought back face-to-face with the two visibly-panting herms, the effects of your foreplay painfully obvious as a veritable river of molasses-thick pre-spunk flows out.");
	output("\n\n<i>“Time to put that lovely mouth of yours to better use!”</i> 18 grabs her sister’s cock along with your head and forces her tip against your mouth. <i>“How about you start off ‘easy’?”</i> Despite her forceful movement before, she lays off as soon as she finishes talking, leaving you to your own devices with 17’s tip in your mouth. ");
	if (pc.isBimbo()) output("Was there ever any question that you’d dive right into this? Big dicks are, like, totally your thing, and they’re serving some of the biggest you’ve ever seen to you on a silver plate! You start sucking your way down, propelling yourself forward by the sheer strength of your mouth muscles.");
	else
	{
		output("You have a moment to consider if you should really be doing this, even while a steady stream of drugged cock-milk floods your mouth. Is this a mistake? Should you really be wasting time destroying your throat when you should be saving Kiro? ");
		if (pc.taint() <= 66) output("You know the answer should be no, but every time you think of just backing away now some part of you resists, telling you how pointless it would be to stop right now. After all, you’re <i>so</i> horny right now that you’d be easy pickings so why not see it through? Before you can really consider the logic of that, you feel your neck move forward on its own, making your decision for you.");
		else output("Of course you should! What, you’re going to go this far with dick this good and then just back out? Kiro will be fine; maybe a little scatter-brained, maybe a little sexier, but isn’t that just a win-win? You push ahead, calling on your inner cock sucker to give you strength!");
	}
	if (flags["USED_SNAKEBYTE"] == undefined)
	{
		output("\n\nYou feel like you’re trying to swallow a whole watermelon! You’re barely passed her head and already feel yourself hitting your limit.");
		if (pc.isBimbo()) output(" Not having a dumb gag reflex thingie makes it easier, but that doesn’t make your mouth any bigger.");
		output(" You run out of breath just before you crest her head, forcing you to pull back and take a short break.");
		output("\n\nAs you take your time to stretch your jaw for another round, you find that you can move it a lot easier and even a good bit further. You chalk it up to either being your imagination or just your muscles relaxing. Then you hear a familiar chuckle behind you, <i>“don’t say we didn’t try to help.”</i>");
		output("\n\nWhat?");
		output("\n\nYou shake it off and dive in for another round. To your surprise, this time her whole head sinks in with little resistance. You hold there in surprise for a second, the quiet letting you hear an uncharacteristic moan from 17. An odd warmth spreads through your whole mouth. It’s soft and numbing, making your jaw feel like some kind of fleshy rubber. You push further before you can really examine it, expecting it to be a painful journey down but instead finding that it’s surprisingly easy.");
		output("\n\nYou unthinkingly suck down more and more until, once again, you run out of breath and come up for air. When you do, you go wide-eyed in surprise when you see just how much you were able to get down; it must have been at least a third of the way down! You wonder how you managed that until you start stretching your jaw again and realize just how far it goes now. <b>You can almost unhinge it like a snake now! Whatever she’s done to you, it’s made your jaw inhumanly flexible!</b>");
		output("\n\nYou feel your body tense at the revelation, simultaneously reacting in shock and uncontrollable pleasure. You feel your orgasm rushing up to meet you, but stopping suddenly as if it were waiting for something. A palpable <i>need</i> washes over you and you know exactly how to sate it!");
	}
	else
	{
		output("\n\nLucky for you, your mouth was <i>made</i> for taking cocks like this! You loosen up your mouth and dive in, taking her immense tip and several of her ridiculous inches in one, smooth motion. Even your inhuman flexibility won’t let you take all of her in one go, it’s just too much. You come up for air before slamming yourself back down, getting a few more inches of thick cockmeat down.");
		output("\n\nYour whole body tingles with a lusty excitement that seems to magnify with each added inch you take in. It flows down to your crotch, joining the whirlpool of sensation that your dedicated hands have swirled your whole lower half into.  It drives you to go faster, to swallow until you nearly pass out from lack of oxygen, anything to get further down!");
		output("\n\nYou feel your orgasm rush at you with the subtlety of a charging bull, and yet you feel something holding it back.  You <i>can’t</i> cum yet, your body won’t let you! There’s one last thing you <i>need</i> to do first, and you know exactly what it is.");
	}
	output("\n\nYou take a deep breath, relax your super-flexible jaw as much as you can, pray to any gods you can think of, and dive in. It’s an immense task even for your " + (flags["USED_SNAKEBYTE"] == undefined ? "new-found":"exquisite") + " flexibility. You choke down inch after unnaturally thick, hole destroying inch, ignoring any discomfort and trying not to think about where it’s all fitting as you determinedly fling yourself towards her base. 17 groans while 18 simultaneously laughs and moans while she jerks off to you deepthroating her sister. You pass the mid-way point, already feeling like more cock than [pc.manWoman]!");
	output("\n\nYou soldier on ahead with feverish determination. Your goal is so close that you can’t imagine backing out now. Every inch feels like a triumph, flooding your brain with endorphins and sending surges of pleasure through your body. You feel rewarded each time you take another bit of her member, your orgasm coming closer and closer in pace with your progress.");
	output("\n\nYour body tenses when you start nearing the bottom. You start counting down the inches you have to go, ten... nine... eight...  It’s like an old shuttle launch only the thing blasting off is your [pc.crotch]! Five... four... three... two... Stars dance in your vision when you finally feel your [pc.lips] touch down on her base. You cum, <i>hard</i> and 17 follow! Your whole body shutters and vibrates while 17 pumps you full of seed and you’re utterly overwhelmed with pride and pleasure. So overwhelmed that you forget the part where you can’t breathe.");
	output("\n\nBy the time you gather up enough sense to realize what’s happening, you’re already on the verge of passing out. You try to pull off on your own, but you don’t have enough strength left to do it fast enough. It’s all over, you think to yourself until you feel a hand grab you and yank you off.");
	output("\n\n17 sprays your whole front down while you gasp for breath, occasionally coughing up a wad of her seed. You spend a good minute just resting" + (flags["USED_SNAKEBYTE"] == undefined ? " and checking out your newly-enhanced jaw":"") + ". It’s not until 17 finishes cumming that 18 decides to chime in.");
	output("\n\nShe coughs to get your attention, <i>“excellent work, dear intruder! It’s been a while since I’ve seen sister cum that hard. I do hope you don’t intend to leave your job half-finished though...”</i> she jostles her own mammoth totem at you, not-so-subtly implying what she wants.");
	if (pc.isBimbo()) output("\n\nWell, duh, of course you weren’t going to leave her hanging! You loosen up that wonderful mouth of yours and dive right in.");
	else output("\n\nYou roll your eyes. Of course, you saw this coming and have already basically resigned yourself to it. Without a word, you grab her ogre cock, open your mouth, line it up, and slam down.");
	output(" It’s <i>far</i> easier to get her down than 17, even despite the considerable size difference. Half of it goes down in one quick stroke and you quickly find yourself bottoming out, all while remembering to breathe this time!");
	output("\n\n18 loses it almost immediately, cumming straight down your extremely flexible maw while you deepthroat her. You cum along with her, still getting off on just sucking cock" + (pc.isBimbo() ? ", as usual":"") + ". You give her the throatfucking of a lifetime, now that you’re plenty used to taking , monsters of their size. It doesn’t take long until you’ve subdued her and even given 17 another round or seven.");
	output("\n\nYou stand triumphantly over the two as they lay on the ground, weakly moaning while their well-spent cocks leak uselessly into the vast pools that they’ve made on the floor. With a belly full of cum," + (flags["USED_SNAKEBYTE"] == undefined ? " a new trick to pull out at parties,":"") + " about a dozen orgasms under your belt, and a twinkle in your eye, you get yourself ready to head out again, ready to face whatever Po has to throw at you!");
	output("\n\n");
	processTime(30);
	if(!pc.hasStatusEffect("VR_DOLLS")) 
	{
		pc.taint(7);
		pc.loadInMouth(enemy);
		pc.applyCumSoaked();
		flags["USED_SNAKEBYTE"] = 1;
	}
	for(var y:int = 0; y < 12 ; y++) { pc.orgasm(); }
	if(pc.hasStatusEffect("VR_DOLLS")) addButton(0, "Next", vrLeave);
	else if (inCombat()) CombatManager.genericVictory();
	else 
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
//Loss
public function loseToTwinsAndFaceTheConsequences():void
{
	//Herms have a 50% chance of either end triggering
	if (pc.isHerm() && rand(2) == 0) twinSlutBotsMaleBadEnd();
	else if (pc.hasCock()) twinSlutBotsMaleBadEnd();
	else twinSlutBotsFemaleBadEnd();
}
//Female
public function twinSlutBotsFemaleBadEnd():void
{
	showKQTwins(true);
	author("QuestyRobo");
	pc.lust(pc.lustMax());
	output("You fall to the ground, beaten and teased to the last of your resistance. The two modded futa-dolls loom over you, blocking out the light above you with the sheer mass of their genitals. 18 reaches down and pulls you to your knees, putting you at face-level with their crotches.");
	output("\n\nAs soon as 18’s obscene, twitching bulge fully dominates your sight, the loudspeaker hisses to life, and a familiar, taunting voice makes itself known. <i>“Oh my, it seems my girls were too much for you to handle. It’s a shame your naive heroics didn’t have the skill to back them up. Don’t worry, though, your friend is in good hands. As for you, you belong to my girls now. Even if they were willing to hand you over, I’d be remiss to deny them a plaything after so long. Don’t worry, their methods are not as refined as mine, but their aptitude for doll making is quite impressive. I look forward to reviewing their work after you’re done!”</i> You hear the maniacal doctor chuckling to herself before the feed cuts out.");
	output("\n\nThere’s a moment of eerie silence after Po’s mocking voice leaves you. Even the two looming sex dolls pause, almost as if they’re waiting for something to happen. The quiet is broken by a faint, hydraulic hiss from both behind you and in front of you. The Twins let out a combined moan as their suits suddenly retract into some unseen devices. Without the tight suit to contain them, the built-up musk from what could be weeks or even months of confinement flows free with the force of a smoke bomb.");
	output("\n\nThe surprise is enough to make you reel back, only to land in 17’s immense sack, resting against the musky spheres like an oversized pillow. The two’s pheromones flow off of them like raging waterfalls, and you just happen to be standing right under them! Blood rockets to your crotch as her pheromones swim up into your brain, waterlogging it in a thick, lusty miasma that makes your vision blur as your resistance wanes.");
	output("\n\nWhile you’re stewing away in 17’s pouch, the two sisters take advantage of their newfound freedom by pawing relentlessly at their overbloated totems. Pre-cum spills out of their tips in fountainous gouts that flow down like lava from an erupting mountain. It slowly but surely reaches you, flowing over you gallons at a time. You try and lift yourself off only to be pinned in place when 18 moves in and mashes her cock and balls against her sister’s, crushing you between the two obscene masses.");
	output("\n\n<i>“Mhmmm, Mother is so generous! We get you all to ourselves <i>and</i> we get to enjoy you without those damn suits! It’s like a dream come true, right sister?”</i>");
	output("\n\n17 only responds with a heavy, lust-laden breath as she jostles her sack and cock against 18’s, shaking you around like a child with a new doll. You do your best to struggle but you can’t even work up the strength to shift the larger sister’s sack. Not that doing so would be easy even if you were at full strength. All you end up doing is pawing at the hot, dense, and throbbing skin of the ausar mod-slut’s overgrown testes.");
	output("\n\n<i>“Good, good. Get me nice and warmed up for you. Doesn’t look like you need much foreplay, do you, sister?”</i> 17’s breath is ragged and heavy, her whole body shudders as her balls audibly slosh and fill. <i>“So eager, sister. Does the idea of fucking this impudent skank into ground while we form [pc.himHer] into a perfect little fuck-toy turn you on that much?”</i> 17 responds to her sister’s mocking question by pulling you up from between their sacks, dragging you all the way up their extreme lengths, across every inch of their thick, musky, cum-drenched rods.");
	output("\n\nBy the time you come out the other end, you’re a babbling, soaked mess that can barely focus on anything but the incessant throbbing of your loins. 17 doesn’t waste any time planting you on her cock, spearing just the tip of her obscene girth into your [pc.anus] while spreading " + (pc.isSexless() ? "it even further":"your [pc.biggestVagina]") + " as an invitation for her sister.");
	output("\n\n<i>“Alright, alright, alright, sister! There’s no need to rush through this.”</i> 18 aims the tip of her member into your " + (pc.isSexless() ? "already-stretched anus":"honeypot") + ", squeezing in the first few inches into you slowly. You let out a howling moan as the two start pinning you. You <i>know</i> this means the end of your life as anything other than these two’s personal slut doll ");
	if (pc.isBimbo()) output("but is that really a bad thing?");
	else output("but an increasingly sizable part of you doesn’t seem to mind that idea.");
	output(" <i>“After all, we have all the time in the world with this slut!”</i> 18 screams out as her and 17 thrust into you simultaneously.");
	pc.buttChange(enemy.cockVolume(0));
	if (!pc.isSexless()) pc.cuntChange(pc.biggestVaginaIndex(), enemy.cockVolume(0));
	output("\n\nYour world shatters as your body is filled with more cock than most living beings should be expected to handle. The fact that your body is able to take all of it is either a miracle or, more likely, the result of the cocktail of chemicals laced in with likely every fluid in these stud’s bodies. The two moan out in sublime pleasure as they sheath themselves into you. As soon as they hit your limits with their first thrust, they pull out and then immediately slam themselves back in. These girls have <i>zero</i> regard for you in all of this!");
	output("\n\n18 groans and screeches like a wild woman while she rails you, meanwhile 17 has gone eerily quiet. At the same time, your head starts to feel strange, like something’s squeezing down on it. The loud squelching of your hole" + (pc.isSexless() ? "":"s") + " being stretched wildly over and over again slowly gets drown out by an encroaching static-like noise. It gets louder and louder until it becomes the only thing you can hear.");
	output("\n\nYour head feels light from the constant onslaught of noise. You feel like you’re about to pass out before a faint voice cuts through the static. <i>“Submit,”</i> is the first word that comes through clearly enough to make out. <i>“Submit,”</i> <i>“Slut,”</i> <i>“Cocksleeve,”</i> <i>“Cum junkie,”</i>. More and more words come out, printing themselves onto your brain as your body is reduced to nothing more than a living onahole. The only explanation you can come up with is that one or both of these girls is psionic.");
	output("\n\nThe psychically-implanted words burn themselves onto your mind until they’re stuck there, repeating constantly even as the static fades and the world comes back into focus. 18 is still dominating your vision, starring down at you with wickedness in her eyes. <i>“Doing mental conditioning before we even start the physical tuning? You’re truly impatient.”</i> Her words go in one ear and out the other. Your only focus right now is just how <i>good</i> you feel!");
	output("\n\nYou look down at the two siege weapons these girls call cocks, the way they form your slutty body to their obscene shape as they dive deeper, going faster and faster with each thrust. ");
	if (pc.isBimbo()) output("Y");
	else output("Some part of you is still resisting all of this, but every time it speaks up it’s quickly silenced. There’s no helping it, y");
	output("ou love being treated like this! Being stuffed until you’re stretched out like a ball of rubber ");
	if (pc.isBimbo()) output("is just the best feeling in the world!");
	else output("sounded like a kind of torture before, but now you never want to stop it!");
	output(" You start cumming your brains out, hole" + (pc.isSexless() ? "":"s") + " squeezing down on a futile attempt to keep them still. The feeling of their excessive pre-seed stuffing you even further, forcing your body to accommodate more and more of your mistress’s cocks is... Wait... did you just say mistress’s? ... Of course you did, what else would you call them?");
	output("\n\n<i>“Look at [pc.himHer], sister, [pc.heShe]’s already broken in! You work fast. It honestly kind of takes the fun out of it.”</i> She pauses for a second, <i>“I suppose you’re right. We still have the physical molding to do, so we should get the breaking-in over with already!”</i> You don’t really care what they’re saying at this point, although even you can appreciate how they can carry on a conversation while they fuck.");
	output("\n\nThe two lovely studs ram themselves to the hilt inside of you, able to fit a ludicrous amount of themselves inside of your now absurdly flexible body. Their absurdly large cocks engorge inside of you, urethra’s bulging out as they fill with modified puppy cream. What’s left of your mind shatters as your" + (pc.isSexless() ? "":" womb and") + " bowels are flooded to an almost unbelievable degree. You scream out in mind-broken pleasure as you watch your body fill up like a balloon.");
	output("\n\nBefore they’re even done stuffing you, they hoist you up and off of their members, letting the force of their remaining orgasm paints you almost pure white. You mindlessly lick off as much as your [pc.tongue] can reach, your [pc.arms] having long since gone totally limp.");
	output("\n\n<i>“Look at that, perfectly primed and malleable for molding! I think Experimentation Chamber Five is still free.”</i> 17 humps impatiently at your [pc.ass], <i>“relax, we can fuck [pc.himHer] while [pc.heShe]’s cooking!”</i> Your mind swims and your vision fades as you’re hauled off.");
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.taint(100);
	pc.loadInMouth(enemy);
	if (!pc.isSexless()) pc.loadInCunt(enemy,0);
	pc.loadInAss(enemy);
	pc.lust(pc.lustMax());
	processTime(5*60);
	clearMenu();
	addButton(0,"Next",twinSlutBotsFemaleBadEnd2);
}
public function twinSlutBotsFemaleBadEnd2():void
{
	clearOutput();
	showBust("KQ_TWINS","ILLUSTRIA_PO",kiroBustDisplay(true));
	showName("TWIN\nSEXBOTS");
	author("QuestyRobo");
	pc.lust(100);
	output("You spend the next... however long fading in and out of consciousness. Usually, you wake up to some strange device injecting something into you while one or both of your mistress’s plows you like the dirty slut you are. Each time it feels better. Each time your body grows larger, rounder, more slutty and perfect for your loving mistresses. The whole time you’re in the same room, being changed and tinkered with like a living science experiment.");
	output("\n\nEventually, you wake up without any devices or restraints. You get up and wander around the room, trying to get your head together, maybe even remember what happened before you got here. More likely, though, you’ll just end up dropping to your knees and sucking off one of your mistresses again.");
	output("\n\nSpeaking of which, your two amazing studs saunter in, cocks rock hard and ready for you. They’re not alone, though. Some robot lady and an oddly familiar kui-tan walk in after them.");
	output("\n\n<i>“I’m impressed, girls! A near-perfect transformation. Now, ");
	if (pc.hasCock()) output("I would have left the cock, perhaps made it much larger, like I did for 65 here,");
	else output("I would have added a nice, big cock like 65’s,");
	output(" but I suppose we won’t be selling this one.”</i>");
	output("\n\n<i>“Thank you, mother!”</i> the two say in unison.");
	output("\n\n<i>“Keep up the good work. Now, 65, dear.”</i>");
	output("\n\nThe dollified kui-tan perks up, her mammoth horse cock standing at attention. <i>“Yes, Mistress Po?”</i>");
	output("\n\n<i>“Be a dear and help the twins break in their new toy. I believe you’re... familiar with [pc.himHer].”</i>");
	output("\n\nThe bimboed ‘nuki looks at you with vacant eyes, like she’s trying to remember something she’d forgotten years ago. She tries for a surprisingly long time before she just shakes her head and grabs her cock. <i>“I guess I’m helping you out now! Which hole should I take?”</i>");
	output("\n\n<i>“You can have her ass. Sister called dibs on the mouth.”</i>");
	output("\n\nPo chimes in one last time before she leaves, <i>“if you need me, I’ll be laying out the traps for our next guest. A cute little redhead kaithrit-ausar hybrid. She probably thinks she’s all clean after operating legitimately for a few years, but Black Void ties don’t wash off that easy.”</i>");
	output("\n\nWith that, she walks off, closing the door shut and leaving you at the mercy of your new masters, as well as a familiar, yet twisted face.");
	processTime(10*60);
	pc.orgasm();
	pc.lust(pc.lustMax());
	badEnd();
}
//Male
public function twinSlutBotsMaleBadEnd():void
{
	showKQTwins(true);
	author("QuestyRobo");
	pc.lust(pc.lustMax());
	output("The last of your strength fails and you fall to the ground, fully submitting to the two as they loom over you. You feel their attention immediately turn to your [pc.cocks] as ");
	if (pc.isCrotchExposed()) output("" + (pc.cockTotal() >= 2 ? "they swing":"it swings") + " brazenly in the open air");
	else output("" + (pc.cockTotal() >= 2 ? "they tent":"it tents") + " your [pc.crotchCover]");
	output(". They giggle and lean down onto you, planting their immense, wobbling tits just above your submissive body.");
	output("\n\n<i>“Are you thinking what I’m thinking, sister?”</i>");
	output("\n\n17 gives a deep breath in response.");
	output("\n\n<i>“Yeeeeess, that sounds exquisite! We haven’t had a new ‘feminine’ toy in ages.”</i> You start mulling over what that could possibly mean until you’re interrupted by the Twins shifting position. 17 moves over to your crotch, turns around and squats down, ");
	if (pc.isCrotchExposed()) output("rubbing her pussy against the very tip of your [pc.cockHeadBiggest] in order to sinfully tease you.");
	else output("rubbing her pussy against your currently-contained member" + (pc.cockTotal() >= 2 ? "s":"") + " before tearing your clothes to shreds in order to reveal " + (pc.cockTotal() >= 2 ? "them":"it") + ".");
	output(" 18 moves up and squats down on your face, her bare, drooling pussy sitting just a few inches above your mouth while her fat balls sit monolithically just in front of your head.");
	//"Small" cock, below 24
	if (pc.biggestCockLength() <= 24)
	{
		output("\n\n17 grunts in irritation as she grinds into your [pc.cockBiggest], seemingly very unsatisfied.");
		output("\n\n<i>“Yes, yes, I know [pc.heShe]’s too small. We can fix that <b>very</b> easily, though!”</i>");
	}
	//"Medium" cock, 24-40
	if (pc.biggestCockLength() <= 40)
	{
		output("\n\n17 seems oddly quiet, even for her, as she runs along your tip, almost like she’s dissatisfied with you.");
		output("\n\n<i>“I know, sister, I know. I’m sure this is considered ‘large’ for the uncultured prudes out there, but [pc.heShe]’ll need to be <b>far</b> larger to be up to our standards!”</i>");
	}
	//"Big" cock, 41+
	else
	{
		output("\n\n17 moans as she stretches herself out on just your tip. Yet, there’s an underlying hunger in her exhalations as if even your immense cock is just scratching the surface of her ultra-size queen desires.");
		output("\n\n<i>“Oh yes, [pc.heShe] is <b>impressive</b>! " + (pc.biggestCockLength() < 48 ? "Almost as large as":"Even larger than") + " us, dear sister. You are right, though, why settle for this when [pc.heShe] could be <b>so</b> much bigger!”</i>");
	}
	pc.cockChange();
	output(" 18 slams down onto your face, her soaking, puffy pussy lodging itself into your mouth while her immense ass and balls block any light from reaching you. Her juices leak into your throat unobstructed, the ultra-modded pup-skank’s lower lips so swollen and plump that they’re keeping your mouth pried wide open.");
	output("\n\nThere’s an earthy-yet-sweet taste to it, almost like salted caramel. You suck it down like an infant at [pc.hisHer] mom’s teat. Each drop fills your body with a kind of sublime, alien warmth that crawls through your body and starts to pool in your crotch. The heat builds until it feels like there’s a pool of magma between your legs with a hot rod of molten iron sticking out. You groan into her muff as your body spasms and shocks run up and down your [pc.cocks].");
	output("\n\nSuddenly you hear 17 roaring out in pleasure and feel a harsh tightness descend on your [pc.biggestCock]. <i>“Ooooh, it’s amaaaaazing!”</i> a ghostly voice rings in your ear, <i>“sister, let [pc.himHer] see!”</i>");
	output("\n\n<i>“Oh, you’re letting [pc.himHer] hear already?”</i>");
	output("\n\n<i>“[pc.HeShe]’ll be ours very soon. [pc.HeShe] should know the voices of <b>both</b> her masters!”</i>");
	output("\n\n<i>“I <b>love</b> when you get this into it!”</i> 18 says before lifting her fat lips out of your mouth with an audible pop, leaving a pool of her juices behind in your mouth. You blink heavily as your eyes readjust to the light. You look down, barely able to see anything except the faint outline of 17 bouncing up and down. When your focus returns, your eyes immediately go wide when you realize what it is she’s bouncing on. It’s your [pc.biggestCock], except it’s absolutely <i>immense</i> and still growing!");
	output("\n\nInches of swelling dick meat visibly pour out of your crotch and into the mod-sluts infinitely-welcoming pussy. The sight and feeling cause you to swallow the reservoir of chemical girl cum in your mouth, sending a shockwave of sensation to your crotch that immediately rockets you to orgasm. You cum like a smashed fire hydrant, filling 17 until she looks like a [pc.cum]-filled blimp. She gets off after a moment, leaving you free to watch every detail of what’s happening.");
	output("\n\nYour member continues to grow as it belches out a pool’s worth of cum every second. Half a dozen more absurdly thick, vein-covered inches pile on between each spray, going on until it’s almost as big as your whole body and then defiantly continuing! ");
	if (pc.cockTotal() >= 2) output("Your other dick" + (pc.cockTotal() >= 3 ? "s keep":" keeps") + " pace, growing in tandem with " + (pc.cockTotal() >= 3 ? "their":" its") + " brother in order to make you more cock than [pc.raceShort]! ");
	output("Beneath your monstrous member" + (pc.cockTotal() >= 2 ? "s":"") + ", ");
	if (pc.hasBalls()) output("your [pc.balls] seem to be sharing in the same growth-inducing bliss as your [pc.cocks]");
	else output("you’ve grown a pair of balls which seem to be sharing in the same growth-inducing bliss as your [pc.cocks]");
	output(". Your sack is so fat and full that you’re sure you’ll never be able to walk normally again, and that your orgasms will never be any less than mind-breaking!");
	output("\n\nAs soon as you’re done cumming, you hear the familiar, spectral voice of what must be 17, <i>“Damn it, [pc.heShe]’s going soft on us!”</i>");
	output("\n\n<i>“Fear not, we’ll get rid of that annoying refactory period in the ‘fine-tuning stage’. I believe mother isn’t using chamber 3 at the moment, it’ll be perfect for our needs.”</i> You feel yourself being lifted up into the air. You try and struggle but all of your blood and strength is pooled in your ridiculously-expanded crotch. Even lifted at least a foot above the ground, your immense dong" + (pc.cockTotal() >= 2 ? "s are":" is") + " still long enough to drag on the ground, while your absurdly-swollen testes pendulously swing, your next monstrous load audibly sloshing.");
	output("\n\nAll you can do is pathetically struggle and groan while they drag you into one of the lab chambers. 18 stands you on a strange, metal plate while 17 types something into one of the computers. Suddenly your limbs are seized and restrained by thick, metal tendrils while several smaller ones begin stocking up on various syringes. One even sticks a heavy visor over your eyes.");
	output("\n\n<i>“There, perfect! Now, I believe it’s my turn to take [pc.himHer] for a spin!”</i>");
	output("\n\n17 grumbles but 18 doesn’t care. She struts up in front of you and bends over, giving you a full view of her truly immense ass and fat, drooling and ready pussy. Your newly-immense cock rises slowly, still not used to its’ new weight. That is, until one of the tendrils jabs your base with one of the needles. Lust flows through your body as your cock surges to full hardness. The visor stars to flash brightly and repeatedly, showing words like <i>“Fuck”</i>, <i>“Breed”</i>, <i>“Rut”</i>.");
	output("\n\nYou’re being programmed into a walking dildo! All the while more unknown chemicals are being constantly injected into your body, warping you from the inside out. Suddenly the restraints release, leaving you free to move on your own. You get one last urge to escape, to somehow drag yourself back to your ship and be free again. That thought immediately shrivels and dies when you lay your eyes on 18’s ass again. The word ‘mistress’ flashes in the visor over and over again, reminding you just who that amazing cock of yours belongs to.");
	output("\n\nA strand of drool forms at the edge of your mouth. You start going on pure instinct as the last of your mind unravels. Your now-freed hands dig into the soft flesh of your mistress’ hyper-sized ass. Without any hesitation you thrust in, burying your perfectly-molded member into the hole it was designed for. 18 groans out loud, her pleasure sending an almost drug-like rush of endorphins through your brain. It’s hard to move so much cock meat at first, but as the chemicals keep coming it becomes easier and easier.");
	output("\n\nYour body is getting stronger, not in the sense that you could beat anyone in a fight (you obviously couldn’t considering where you are now), but in the way that you can fuck like a hurricane! You start plowing 18 like a rutting beast, feeling your ultra-virile balls already squeezing out a few quarts of your hyper-dense seed into her, just like she wants you to.");
	output("\n\nBy the time you cum into 18’s welcoming pussy for the first time, the tendrils have finished their round of chems and have moved on to dressing you for your new role. Your crotch is left completely uncovered, naturally, but the rest of you is slowly covered in latex and implants to match with your mistresses. You’re even given your own mask, complete with the same sort of visor you’ve been wearing, constantly reminding you of your role in life. How nice!");
	output("\n\n17 comes and pushes her sister out of the way, demanding the next round with you. You don’t complain; you can’t complain. All you can do is rail your mistresses as long and as hard as they want you to.");
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.taint(100);
	pc.lust(pc.lustMax());
	processTime(5*60);
	clearMenu();
	addButton(0,"Next",twinSlutBotsMaleBadEnd2);
}
public function twinSlutBotsMaleBadEnd2():void
{
	clearOutput();
	showBust("KQ_TWINS","ILLUSTRIA_PO",kiroBustDisplay(true));
	showName("TWIN\nSEXBOTS");
	author("QuestyRobo");
	output("<i>Several days later</i>");
	output("\n\nYou don’t know how long today’s session went; you stopped caring about that sort of thing a long time ago. All you know is that even after draining a river’s worth of cum into your mistresses, your cock is still raging hard and brimming with a fresh load to deposit.");
	output("\n\nSuddenly the door to your chambers opens and the person on the other end isn’t one of your mistresses but instead a strange, blue woman.");
	output("\n\n<i>“My, my, dears, you’ve certainly done quite a job here! And you say you did it within a day?”</i>");
	output("\n\n<i>“Yes, mother,”</i> 18 walks into view, causing you to squirt a massive gout of seed in excitement.");
	output("\n\n<i>“So well trained too! I’m very proud of you two. Perhaps in the future, I can call on you to handle some dollifications during the busier months?”</i>");
	output("\n\n<i>“W-we’d love to, mother! Thank you so much!”</i>");
	output("\n\nThe blue lady nods and then pulls on a leash she’s been carrying. <i>“Come along, 65, we have a new subject to ‘orientate’. Say goodbye to your friend in there, if you wish.”</i>");
	output("\n\nAs she leaves, you see a <i>very</i> busty, bimbo tanuki woman step into view. She stares at you for a second, eyes blank and vacant of any thought or feeling. You return with the same coldness, having no idea who she is, with the only thought in your head being a question of if she could take your cock or not. That doesn’t matter now, though. Your mistresses strut back into the room, smelling like the kind of pure, feminine <i>need</i> that makes you forget about anything else.");
	output("\n\nYou pounce on them and become lost once more in the endless rut that is now your life.");
	processTime(10*60);
	pc.orgasm();
	pc.lust(pc.lustMax());
	badEnd();
}