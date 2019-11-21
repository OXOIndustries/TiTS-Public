//Meeting
//Bonustext
public function ulaBonus():void
{
	if(flags["ULA_CAVE"] == undefined)
	{
		if(rand(5) == 0)
		{
			flags["ULA_CAVE"] = currentLocation;
			rooms[flags["ULA_CAVE"]].addFlag(GLOBAL.NPC);
			generateMap();
		}
	}
	if(flags["ULA_CAVE"] == currentLocation && flags["ULA_SAVED"] == undefined)
	{
		//ULA TEMPORARILY RE-ENABLED
		if(flags["ULA_LEAVE_TIMER"] == undefined || flags["ULA_LEAVE_TIMER"] + 60*24*5 > GetGameTimestamp())
		{
			output("\n\nA shivering figure lurks in shadowy darkness at the rear of the cave, its large, canine ears quivering in distress. Features are difficult to make out without getting any closer, but it is clear from the mop of snow-soaked hair and chattering teeth that whatever is cowering back there is suffering from some serious hypothermia.");
			//Timer not started
			if(flags["ULA_LEAVE_TIMER"] == undefined) { output("\n\n<b>Maybe you could help her out and improve relations with the locals...</b>"); }
			else if(flags["ULA_LEAVE_TIMER"] + 60*24*4 < GetGameTimestamp()) output("\n\n<b>She seems to be gathering her strength for another trip into the wilds. If you mean to help her, do it soon.</b>");
			else if(flags["ULA_LEAVE_TIMER"] + 60*24*3 < GetGameTimestamp()) output("\n\n<b>You doubt the korgonne will stick around too much longer. Delay too long, and you’ll miss your chance to help her out.</b>");
			else if(flags["ULA_LEAVE_TIMER"] + 60*24*2 < GetGameTimestamp()) output("\n\n<b>She hasn’t left, but you’re sure that she’ll have to take off eventually. A cave is a poor substitute for a home. And with her departure, you’ll miss out on any chance to help her or her people out.</b>");
			else
			{
				output("\n\n<b>If you don’t help her out now, she’s probably going to be gone forever in a few days.</b>");
			}
			addButton(0,"Figure",caveMeetUla);
		}
		else
		{
			output("\n\nThe korgonne you met here is long gone. You’ll probably never see her again.");
		}
	}
}

public function ulaApproach(back:Boolean = false):void
{
	clearOutput();
	showUla();
	if(back)
	{
		output("<i>“Wait,”</i> you say.");
		output("\n\nUla stops and tilts her head. <i>“");
		if(!korgiTranslate()) output("Something else wanting");
		else output("You want to do something else");
		output("?”</i>");
	}
	else
	{
		//Post-preg nip-suck
		if(flags["ULA_BIRTH_TIMER"] > 7 && !pc.hasStatusEffect("Ula Kiddo Pets Cooldown"))
		{
			//Approach any time one week after birth. Can only happen once a day.
			output("<i>“[pc.name],”</i> Ula gently coos, so as not to disturb her nursing children. <i>“");
			if(korgiTranslate()) output("Did you see our puppies? They’re so cute, huh?");
			else output("See Ula puppies? Much cute, yes?");
			output("”</i>");
			output("\n\nYou nod warmly.");
			output("\n\n<i>“Go ahead, touch.”</i> She tips her head toward the closest one. <i>“");
			if(!korgiTranslate()) output("Give them a pet.");
			else output("Give pets.");
			output("”</i>");
			var boy:Boolean = (rand(2) == 0);
			output("\n\nYou hesitantly reach out and give your recently born child a scratch between the ears. ");
			if(boy) output("His");
			else output("Her");
			output(" tail wags happily, though he does not slow his suckling in the slightest. ");
			if(boy) output("His");
			else output("Her");
			output(" fur is stunningly soft, almost silken. ou switch to gentle pats and slow strokes, then give your other child a little attention. In short order, they both fall asleep on Ula’s tits.");
			output("\n\nYou smile. <i>“They’re so cute.”</i>");
			output("\n\nUla nods and gently slides them into white cloth slings. <i>“");
			if(!korgiTranslate()) output("One second. Best let sleeping pups lie.");
			else output("One second. Best we let the sleeping pups lie.");
			output("”</i> She rises from bed, carrying the pair of snoring infant aliens, and opens the door to hand them off to a waiting nursemaid. When she returns, a relaxed and hopeful smile is painted on her face. <i>“");
			if(!korgiTranslate()) output("It takes whole tribe for raise korgonne. So glad have best clan </i>and<i> puppy-father.");
			else output("It takes a whole tribe to raise a korgonne. I’m so lucky to have the best clan </i>and<i> mate.");
			output("”</i> Ula’s arms wrap you up in a squeezing hug. <i>“");
			if(!korgiTranslate()) output("You come for talk, or for give Ula more pups?");
			else output("Did you come to talk or to give me more pups?");
			output("”</i> Her recently drained tits still seem a little swollen. <i>“");
			if(!korgiTranslate()) output("Both good!");
			else output("Both are good!");
			output("”</i>");
			pc.createStatusEffect("Ula Kiddo Pets Cooldown", 0, 0, 0, 0, true, "", "", false, 21*60);
		}
		//Normal approach
		else
		{
			output("<i>“Hey there,”</i> you call.");
			output("\n\nUla’s ears perk right up, their piercings rattling. The rest of her follows a second later. <i>“");
			if(!korgiTranslate()) output("[pc.name]! Happying feels!");
			else output("[pc.name]! Good to see you!");
			output("”</i> ");
			if(ulaPregBelly() == 0) output("She rushes forward to hug you tightly.");
			else if(ulaPregBelly() == 1) output("She rushes up to hug you tightly, pressing her slightly-pregnant middle against you.");
			else output("She leans forward and blows you a kiss over her gravid belly.");
			output(" <i>“");
			if(!korgiTranslate()) output("Knew sure-visit.");
			else output("Knew you’d be sure to visit.");
			output("”</i> Wide green eyes stare up at you. <i>“");
			if(!korgiTranslate()) output("Have talks or share warm?");
			else output("Did you want to talk or share some warmth?");
			output("”</i> The final word is underlined with a throaty purr.");
			if(pc.tallness >= 7*12 && ulaPregBelly() < 2) output(" You’re keenly aware that her nose is inches away from your crotch.");
			output("\n\nBy the sound of it, she’s up for anything.");
		}
	}
	ulaMenu();
}

public function ulaMenu():void
{
	clearMenu();
	addButton(0,"Appearance",ulaAppearance);
	addButton(1,"Talk",ulaTalk);
	addButton(2,"Sex",ulaSexApproach);
	//addButton(4,"WARGII TEST",startWargiiQuestOnEnterUlaRoom,undefined,"WARG'II TEST","<b>WARNING:</b> This is a test of in-development content. Saving after playing this could leave data behind that could result in bugs, incorrect tracking of quest decisions, or unplayability. Be careful, and save first!\n\nThanks,\n\tFenoxo");
	if (flags["ULA_HELP_MILO_NOT_NOW"] != undefined) addButton(4, "Help W Milo", steeleTakesUpHerdingBaraCats);
	else if (flags["EITAN_PRISONER_NEGOTIATIONS"] == 5) addButton(4, "Air For Milo", heyUlaCanYouLetTheMilosBreathe);
	else if (flags["EITAN_PRISONER_NEGOTIATIONS"] == 8) addButton(4, "Water", theCatsWantWaterAndUlaIsBewildered);
	else if (flags["EITAN_PRISONER_NEGOTIATIONS"] == 10) addButton(4, "Audience", moreLikeUlaTruceManGeddit);
	//else if (flags["EITAN_PRISONER_NEGOTIATIONS"] == 10) addButton(4, "Audience", theCatsWantWaterAndUlaIsBewildered);
	addButton(14,"Leave",mainGameMenu);
}

public function ulaAppearance():void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	output("Ula appears every bit a typical korgonne at first glance. From her diminutive height of 4’9”</i> to her plush proportions, she would be easy to confuse for a common citizen of the hold. It’s the details that reveal the noble, puppy-princess beneath. An alert, curious mind gazes out from emerald eyes. Proudly upraised ears scoop up your every statement to later reflect upon. Pale blue lips too often harried by nervousness and woe smile happily at the sight of her savior.");
	output("\n\nKorg’ii Hold’s " + (!ulaChief() ? "resident royal daughter":"resident regent") + " is also quite the fan of jewelry, if the plethora of volcanic rock and savicite crystals she currently wears are any indication. Heavy stone piercings dangle from the outer edges of her canine ears. So much of it emits the green glow of savicite radiation that she’s become a one-woman light show in the hold’s darker passages. Even now, the play of light across her more-than-ample E-cup breasts continues to tug your gaze lower.");
	output("\n\nYou give in");
	if(pc.libido() < 50) output(" for just a moment");
	output(" and ogle her assets a moment longer, appreciating the creamy-blue skin of the korgonne girl’s nipples. Those pale puffy mounds almost beg to be licked and suckled, or failing that, snuggled against in bed. Ula blushes shyly when she sees you looking and turns away, inadvertently showing off her arching back and short tail. It wags gleefully, slapping into her squishy-looking ass with enough force to bounce the cheeks apart and give you a glancing look at the tight blue pucker between.");
	output("\n\nA hint of mint wafts into the air as Ula turns back to face you. A full-on mischievous grin has broken out across her kissable-looking lips as she puts on a show of stretching. The motion is anything but innocent, and as she spreads one leg, then the other, her cyan-hued pussy is put on display, its lips slowly opening to reveal a hint of its clingy, silken interior. Her potent pheromones spill out in a nose-tickling torrent, seeming to raise the room’s temperature a dozen degrees in an instant.");
	output("\n\nThe giggling princess finishes up and closes her pillowy thighs with an audible smack. Batting her eyelashes sweetly, she tilts her head impishly, waiting to see what you’ll do. Something tells you she’d be delighted to have you pry those legs apart and dive right in...");
	clearMenu();
	addButton(0,"Next",ulaApproach,true);
}

public function ulaTalk():void
{
	clearOutput();
	showUla();
	//Bimbo
	if(pc.isBimbo()) output("<i>“We can talk a bunch, cutie!”</i>");
	//Bro
	else if(pc.isBro()) output("<i>“Talks.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“I can talk.”</i>");
	//Misch
	else if(pc.isMischievous()) output("<i>“I can talk those big old ears of yours off.”</i>");
	//Hard
	else output("<i>“Talk is fine.”</i>");
	//Merge
	output("\n\nGrabbing you by the hand, the chubby korgonne leads you to the bed, tail wagging hard enough to whap you a half-dozen times on the way. She sits down and pats the place next to her. <i>“Alien stories amazing. Such strangeness and magic! Talking craftboxes! Ships of stars!”</i> She smiles a little shyly at you as you sit down next to her. <i>“Korg stories boring. Fish-journeys or metalfinds. Hunt slaying not bad, but best hunts with alien bang-bows. Elders no let Ula have any.”</i> She leans happily against you");
	if(pc.tallness >= 66) output(", looking up with wide eyes");
	else output(", looking over with wide eyes");
	output(". <i>“What want talk?”</i>");
	processTime(2);

	ulaTalkMenu();
}

public function ulaTalkMenu():void
{
	clearMenu();
	addButton(0,"Stars/Space",stayAndStarsTell,true);
	addButton(1,"Mining",ulaMiningTalk,undefined,"Mining","Ask Ula about the korgonne’s own mining.");
	addButton(2,"Ula’s Role",ulasRoleInTheClan,undefined,"Ula’s Role","Ask Ula about her role in her clan.");
	addButton(3,"Other Tribes",otherTribesTalkarydooda,undefined,"Other Tribes","Ask Ula about other korgonne tribes.");
	addButton(4,"Explain:Guns",talkAboutGunsWithUla,undefined,"Explain: Guns","Explain guns to Ula.");
	addButton(5,"Exp:Electricity",explainElectricityToUla,undefined,"Explain: Electricity","Explain electricity to Ula.");
	addButton(6,"Exp:Savicite",talkAboutSavicite,undefined,"Explain: Savicite","Explain Savicite to Ula.");
	addButton(7,"Exp:Credits",ulaCreditsTalk,undefined,"Explain: Credits","Explain the universal galactic currency to Ula.");
	addButton(14,"Back",ulaApproach,true);
}

//Sex menu:
public function ulaSexApproach():void
{
	clearOutput();
	showUla();
	if(ulaPregBelly() <= 1)
	{
		output("<i>“Warm,”</i> you say with authority, dipping your hand between her legs to feel for pussy hidden between.");
		output("\n\nThe fluffy " + (ulaChief() ? "chieftess":"princess") + " shudders at your touch, hips haltingly pressing back until your digits slip into a suddenly slick slit. She pants, <i>“Naughty alien,”</i> but her hips don’t stop their sensuous grinding. Ula’s folds cling to your [pc.skinFurScales] as she drives you deeper, your thumb grazing the hood of a rapidly firming clit. <i>“");
		if(!korgiTranslate()) output("Elders truthspeak: aliens sex-love more than korg matron. Naughty tease-[pc.boyGirl]!");
		else output("The elders told the truth: aliens love sex more than a korg matron. Naughty... teasing [pc.boyGirl]!");
		output("”</i>");
		output("\n\n");
		showImage("UlaDildo");
		output("You tilt your head, <i>“Are you asking me to stop?”</i>");
		output("\n\n<i>“No,”</i> Ula pants, tongue refusing to retreat entirely within her mouth. She clutches tight, short-clawed fingers digging deep. You can feel her dripping into your hand, and the familiar scent of her minty lust creeps into the air. <i>“Want more!”</i> She jerks away, dragging your slick digits from her juicy muff. A visible blush has spread across her exposed skin, darkening her nipples and lips. She grabs you by the wrist and pulls your pussy-soaked hand between you. <i>“");
		if(!korgiTranslate()) output("Want you horny like Ula.");
		else output("Want you as horny as I am.");
		output("”</i> She extends her tongue and laps at her own juices. <i>“");
		if(!korgiTranslate()) output("Want [pc.name] eyes big-desiring.");
		else output("I want your eyes round with desire.");
		output("”</i> Dropping your hand, she ");
		if(pc.tallness >= 6*12) output("hops up, legs around your waist, and ");
		output("kisses you, thrusting her tongue into your mouth. <i>“");
		if(!korgiTranslate()) output("Want love-mate bond.");
		else output("I want that loving, mated bond.");
		output("”</i>");
		output("\n\n");
		output("You swoon when she breaks away, breathing hard. The near-naked native prances to nearby bin, retrieving a dildo. She drags and back and forth across her steamy slit, watching you all the while. A slow smile spreads across her features. <i>“");
		if(!korgiTranslate()) output("Go on. Tell what want.");
		else output("Go on. Tell me what you want.");
		output("”</i> Her pussy drips. <i>“");
		if(!korgiTranslate()) output("Tell how Ula make happy.");
		else output("Tell me how I can make you happy.");
		output("”</i>");
		clearMenu();
		addButton(14,"Back",ulaApproach,true);
		if(pc.hasCock()) addButton(0,"Breed Her",breedWithUla);
		else addDisabledButton(0,"Breed Her","Breed Her","You need a penis for this.");
		if(pc.hasVagina() && pc.blockedVaginas() == 0) addButton(1,"Lez Out",ulaPussyFuck,undefined,"Lez Out","You both have pussies. Use ‘em!");
		else if(pc.blockedVaginas() > 0) addDisabledButton(1,"Lez Out","Lez Out","Maybe you should take care of your vaginal obstruction first?");
		else addDisabledButton(1,"Lez Out","Lez Out","You’ll need a vagina for this!");
		addButton(2,"Watch",watchUlaFapturbate);

		if(pc.isTaur())
		{
			if(pc.tallness < (5*12+6) && pc.hasCock()) addDisabledButton(3,"TaurBreeding","TaurBreeding","You need to be a decently large ‘tauric creature in order to do this - at least five and a half feet tall.");
			else if(pc.hasCock())
			{
				var canFit:Boolean = false;
				for(var i:int = 0; i < pc.cockTotal(); i++)
				{
					if(pc.cockVolume(i) >= 30) canFit = true;
				}
				if(canFit) addButton(3,"TaurBreeding",penisRouter,[centaurServiceForUla,9969997997,false,30],"Taur Breeding","Show Ula how centaurs breed.");
				else addDisabledButton(3,"TaurBreeding","TaurBreeding","You need to be a decently hung ‘tauric creature in order to do this.");
			}
			else addDisabledButton(3,"TaurBreeding","TaurBreeding","You need to be a decently large ‘tauric creature in order to do this - at least five and a half feet tall with a decent-sized dick.");
		}
		else addDisabledButton(3,"TaurBreeding","TaurBreeding","You need to be a decently large ‘tauric creature in order to do this - at least five and a half feet tall with a decent-sized dick.");

		if(flags["ULA_DEFLOWERED"] != undefined)
		{
			if(pc.hasParasiteTail() && pc.hasCockTail()) addButton(4,"Tentatail",tentatailFuckUla,undefined,"Tentatail","Give Ula a ride on your tentacle tail.");
			else addDisabledButton(4,"Tentatail","Tentatail","You need a tail-mounted, parasitic penis in order to do this.");
		}
		else
		{
			addDisabledButton(4,"Tentatail","Tentatail","Ula needs to lose her virginity before trying this.");
		}
		if(!pc.hasGenitals() || (pc.totalVaginas() <= pc.blockedVaginas() && !pc.hasCock())) addDisabledButton(5,"Roleplay","Roleplay","You need genitals for this.");
		else addButton(5,"Roleplay",roleplayWithUla,undefined,"Roleplay","Roleplay your first meeting with Ula - and the potentially hot sex that came with it."); 
	}
	else
	{
		output("<i>“Warm,”</i> you say with authority, dipping your hand between her legs to feel for pussy hidden between.");
		output("\n\nThe fluffy " + (ulaChief() ? "chieftess":"princess") + " shudders at your touch, hips haltingly pressing back until your digits slip into a suddenly slick slit. She pants, <i>“");

		if(!korgiTranslate()) output("Medicine korg says no good sex. No big thickness or roughness. Tongue or small dildo if need rubbed.");
		else output("The medicine korg says we can’t have sex. Nothing strenuous or large, just a tongue, finger, or small dildo if I need to get off.");
		output("”</i> She flops back, panting. <i>“");
		if(!korgiTranslate()) output("Licking much is only sex till babies come. Ula sorry.");
		else output("Lots of licking is all I can do until the babies come. I’m sorry.");
		output("”</i>\n\nWhat will do?");
		clearMenu();
		addButton(14,"Back",ulaApproach,true);
		addButton(0,"Eat Her Out",eatOutPregnantUla,undefined,"Eat Her Out","Eat out the pregnant korgonne, as requested.");
	}
}

public function roleplayWithUla():void
{
	clearOutput();
	showCaveUla(true);
	if(flags["ULA_RPED"] == undefined)
	{
		output("<i>“Roleplay,”</i> you answer.");
		output("\n\nUla seems confused by this. <i>“");
		if(!korgiTranslate()) output("Rolling play? Ula not seeing how this make warm-feel-share.");
		else output("Role playing? I don’t see how playing will help us share our warmth.");
		output("”</i>");
		output("\n\nYou take a little bit of time to explain the concept, telling her that you’d like to re-enact meeting with her, pretending to share an intimate moment with the shivering princess in her lonely cave.");
		output("\n\nThe pudgy korgonne giggles at this. <i>“");
		if(!korgiTranslate()) output("Alien make breed-times many complexities. Korgonne way simple.");
		else output("Aliens make sex so complicated. The korgonne way is simpler.");
		output("”</i> Her eyes twinkle as she leans closer. <i>“");
		if(!korgiTranslate()) output("I try alien way for [pc.name].");
		else output("I’ll try the alien way for you.");
		output("”</i> She pretends to shiver. <i>“");
		if(!korgiTranslate()) output("Am losting in cave! Big strong alien make warm?");
		else output("Am losting in cave! Big strong alien make warm?”</i> After a second, Ula giggles, <i>“I must have sounded so silly to you back then, but you sounded pretty stupid too!");
		output("”</i>");
		output("\n\nYou grin, imagining that the room’s backdrop is the chill, empty interior of a cave and a beckoning, horny korgonne princess, her scent overwhelming your senses.");
	}
	else
	{
		output("<i>“Let’s roleplay again,”</i> you answer.");
		output("\n\nUla smirks. <i>“");
		if(!korgiTranslate()) output("[pc.name] like saving-warm-shares muching.”</i> She smiles broadly. <i>“But Ula liking too.");
		else output("You like fucking damsels in distress quite a lot.”</i> She smiles broadly. <i>“Almost as much as this damsel enjoys it.");
		output("”</i> Her eyes twinkle as she leans closer, moaning");
		if(korgiTranslate()) output(" theatrically");
		output(", <i>“So horny! Need big alien for sex-making!”</i> Her hips wriggle, and the scent of her arousal floods the air. <i>“Suuuuch wet!”</i>");
	}
	IncrementFlag("ULA_RPED");
	clearMenu();
	addButton(0,"Next",ulaFuckRouter);
}

//[Figure]
public function caveMeetUla():void
{
	clearOutput();
	showCaveUla();
	if(flags["ULA_LEAVE_TIMER"] == undefined) flags["ULA_LEAVE_TIMER"] = GetGameTimestamp();
	output("You cautiously approach the mysterious stranger, hand on your [pc.weapon].");
	output("\n\n<i>“H-help?”</i> an almost inaudible voice squeaks. Watery green eyes peek at you from over a bangle-clad wrist. Ice shards trace trails of misery down the girl’s soft-furred cheeks where she was crying. Icy blue lips, plump with feminine appeal, quiver in misery. <i>“C-c-cold.”</i> She points");

	if(pc.hasItemByClass(HeatBelt) || pc.hasItemByClass(ArcticWarfareBelt) || pc.hasItemByClass(InsulatedCoat))
	{
		output(" to your ");
		if(pc.hasItemByClass(HeatBelt) || pc.hasItemByClass(ArcticWarfareBelt)) output("belt");
		else output("cloak");
	}
	output(". <i>“Share w-w-arm?”</i>");

	//CODEX UNLOCK
	if(!CodexManager.entryUnlocked("Korgonne"))
	{
		output("\n\nYour codex beeps. <i>“Korgonne identified. Tribal species native to Uveto VII that is frequently hostile to outsiders. Females are sexually aggressive and will use force and genital pheromones to entice mating. Use caution when traversing government-recognized korgonne lands.”</i>");
		CodexManager.unlockEntry("Korgonne");
		output(" <b>(New Codex entry unlocked: Korgonne.)</b>");
	}
	//Merge
	output("\n\nThis close, you can see the poor puppy-girl is ill-dressed for the icy weather outside.");
	if(flags["MET_FEMKORGONNE"] != undefined) output(" Other Korgonne you have encountered have come warmly dressed in furs, some with heat belts. She has neither.");
	else output(" Venturing out in anything less than a dozen pieces of thickly-padded clothing seems like an idiot idea, unless you have a heat belt. She does not.");
	output(" A diaphanous cloak is her only garment. Meant for ornamentation, it does little more than highlight its wearer’s lack of modesty and awareness of Uveto’s dangers.");
	output("\n\nWill you help the foolish dog-girl?");

	processTime(10);
	clearMenu();
	addButton(4,"Nope",noHeatForYouUla);
	addButton(0,"Fuck",shareHeatWithKorgi);
	if(pc.hasItemByClass(ArcticWarfareBelt) || pc.shield is ArcticWarfareBelt) addButton(1,"Give AWBelt",giveUlaBelt);
	else if(pc.hasItemByClass(HeatBelt) || pc.shield is HeatBelt) addButton(1,"GiveHeatBelt",giveUlaBelt);
	else addDisabledButton(1,"Give Belt","Give Belt","You don’t have a belt to give her.");
	if(pc.hasItemByClass(InsulatedCoat) || pc.armor is InsulatedCoat) addButton(2,"Give Coat",giveUlaCoat);
	else addDisabledButton(2,"Give Coat","Give Coat","You don’t have a suitable coat.");
	//[Share Heat] [Give Belt] [Give Coat] [Nope]
}

//Nope
public function noHeatForYouUla():void
{
	clearOutput();
	showCaveUla();
	output("She’s cold now but safe in the cave. You have no doubt that the typical, plush korgonne fur will be more than enough to get her home once she dries off. <i>“Sorry.”</i>");
	if(pc.isAss()) output(" You don’t mean it.");
	output(" Turning away, you stomp back to the other side of the cave");
	if(!pc.isAss()) output(", feeling more and more like a monster with every step");
	else output(", wishing someone would uplift the lot of them so stupid shit like this would stop happening");
	output(".");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Share heat:
public function shareHeatWithKorgi():void
{
	clearOutput();
	showCaveUla();
	output("<i>“I can warm you up,”</i> you offer, coming closer.");
	output("\n\n<i>“No!”</i> the korgonne reacts violently, scrabbling away to the far side of caves. <i>“Elders tell! Know aliens only take! Never give! Take holds, take coats, take warmings!”</i> She shivers and cries. <i>“Not trusting. You want be good alien, show be good alien!”</i>");
	output("\n\nLooks like if you want to help her out, you’ll need to give her something");
	if(pc.hasCock()) output(" other than a hard dicking.");
	else output(" other than sex.");
	processTime(1);
	//disable option
	addDisabledButton(0,"Fuck","Fuck","You already tried that.");
}

//Give Coat:
public function giveUlaCoat():void
{
	clearOutput();
	showCaveUla();
	//BINGE AND PURGE!
	if(pc.armor is InsulatedCoat)
	{
		pc.armor.onRemove(pc);
		pc.armor = new EmptySlot();
	}
	else pc.destroyItemByClass(InsulatedCoat);

	output("<i>“Here,”</i> you hand her the Korgonne-made garment from your inventory");
	if(pc.isNice()) output(" with an apologetic smile. You really hope she doesn’t ask you how you got it.");
	else if(pc.isMischievous()) output(" with a cheeky grin.");
	else output(" without a care. Beggar’s can’t be choosers.");
	output("\n\nThe sniffling canine snatches it from your hands in desperation, stuffing it onto herself overtop of her soaked cloak in a frenzy of motion. <i>“Nice,”</i> she offers, looking up to you once more. Her shivers slow, then fade as she begin to preen, wiping the crusted tears from her cheeks. <i>“Am having many thanks.”</i> Smiling shyly, the dog-girl crawls closer, still on her knees. A gentle pat to the cave floor invites you to sit with her. <i>“Tell of stars?”</i>");
	flags["ULA_SAVED"] = 2;
	clearMenu();
	addButton(14,"Leave",leaveAfterBelt);
	addButton(0,"Stars",stayAndStarsTell);
}

//Give belt
public function giveUlaBelt():void
{
	clearOutput();
	showCaveUla();
	if(pc.shield is HeatBelt || pc.hasItemByClass(HeatBelt))
	{
		if(pc.shield is HeatBelt) pc.shield = new EmptySlot();
		else pc.destroyItemByClass(HeatBelt);
	}
	else
	{
		if(pc.shield is ArcticWarfareBelt) pc.shield = new EmptySlot();
		else pc.destroyItemByClass(ArcticWarfareBelt);
	}
	output("<i>“Here,”</i> you toss her your heat-belt before you think better of it. The trip back will be cold, but by the look of her, she’s going to need it more.");
	output("\n\nThe sniffling canine snatches it from your hands in desperation, fastening it around her underbust instead of her waist, lifting and squeezing stiff-tipped breasts into an almost fetishistic display of jiggling titflesh. <i>“Nice,”</i> she giggles, her shivers slowing. She wipes the crusted tears from her cheeks and stretches, twisting this way and that. Her tail wags. <i>“Am having many thanks.”</i> Smiling shyly, the dog-girl crawls closer, still on her knees. A gentle pat to the cave floor invites you to sit with her. <i>“Tell of stars?”</i>");

	processTime(2);
	//set save flag
	flags["ULA_SAVED"] = 1;
	//[Stars] [Leave]
	clearMenu();
	addButton(14,"Leave",leaveAfterBelt);
	addButton(0,"Stars",stayAndStarsTell);
}

//[Leave]
public function leaveAfterBelt():void
{
	clearOutput();
	showCaveUla();
	output("You sigh. <i>“I don’t have time.”</i>");
	output("\n\n<i>“Understand.”</i> The Korgonne drops back on her ass, sprawling, hypothermia seemingly forgotten. <i>“You save, though. Maybe...”</i> The faint sound of her tail slapping into the wall drums excitedly. <i>“Maybe come Korg’ii Hold? Talk visit!”</i> She bounds up onto her hindlegs, eyes the size of dinner plates shining in excitement. <i>“Secret code! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her chilly paws and squeezes, pulling it up to kiss the back of it.");
	output("\n\nThe cave suddenly feels a bit warmer...");
	output("\n\n<i>“Remember! Sparklehole! Three from right, topdeck!”</i> Bouncing about, the dog-girl lets you go to pump her fist in the air. <i>“Such kiss! Wow!”</i> She spins and totters out into the snow, suddenly unfazed by the cold.");
	output("\n\nYou’re left alone, secure in the knowledge that you should “awoo” into a specific “sparklehole,” should you encounter one.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Stay]
public function stayAndStarsTell(inVillage:Boolean = false):void
{
	clearOutput();
	showCaveUla();
	if(!inVillage)
	{
		output("<i>“Sure.”</i> You settle in next to the cold Korgonne");
		if(pc.isTaur()) output(", trying not to trample her as you settle your haunches into place");
		else if(pc.isNaga()) output(", careful not to bump her over with a stray coil as you wrap yourself into place");
		else if(pc.isGoo()) output(", carefully not to let your gooey body ooze into her as you spread out for comfort");
		else output(", careful not to slip on the slick floor");
		output(". ");
		if(pc.isBimbo()) output("She’s so cute! You barely stop from pinching her fuzzy little cheeks and kissing her. This is going to be fun! Like talking to a big, fuzzy stuffed animal that also has enormous knockers and super pretty lips!");
		else output("She might resemble a fluffy little stuffed animal, but you can pick up on a whiff of next-level pheromones now that you’re this close. The girl’s got pussy-scent stronger than a New Texan cow-girl. A few moments pass while you breathe heavily, sampling its every flavor.");
	}
	else
	{
		output("<i>“So... the stars, and space...”</i>"); 
	}

	output("\n\nLeaning close, ");
	if(flags["MET_ULA"] != undefined) output("Ula");
	else output("the Korgonne");
	output(" licks her cyan-blue lips and glances toward the entrance, suddenly unsure. After a second of indecision, she straightens her little shoulders and faces you.");

	if(!korgiTranslate())
	{
		output(" <i>“");
		if(inVillage) output("Space");
		else output("Aliens");
		output(" new. Never seen.”</i> A paw gingerly extends toward your [pc.face].");
	}
	else output(" <i>“I don’t understand space. It’s too vast and strange to comprehend.”</i> A paw gingerly extends toward your [pc.face].");

	output("\n\nYou let it. <i>“Really?”</i>");

	output("\n\nA shy nod is the answer. <i>“");
	if(!korgiTranslate()) output("Keep inside. Clan Chief not trust, so run away.");
	else output("We keep inside, away. Besides, the Chief doesn’t trust me to go out on my own, so I have to run away just to see anything new.");
	output("”</i> That gentle touch morphs into a sharp poke at your ribs. <i>“");
	if(!korgiTranslate()) output("You talk! Tell of stars. Promised!");
	else output("Now talk! Tell me about the stars... You promised!");
	output("”</i> The sharp green glare cuts harder than a mining laser.");

	output("\n\n<i>“");
	if(pc.isBimbo()) output("You got it, toots!");
	else if(pc.isBro()) output("Fine.");
	else output("Okay!");
	output("”</i> You lean back, rubbing your chest where her clawed fingertip did its best to prick you. <i>“Where to start...”</i>");
	output("\n\nSettling down, the rambunctious dog-girl grabs your hand and examines it while she waits, working your fingers individually. Sometimes she pokes you, gently this time, not wanting to break your [pc.skinNoun]. The pads on her fingers");
	if(!pc.hasArmFlag(GLOBAL.FLAG_PAWS)) output(" tickle");
	else output(" match up nicely with your own, though hers are thicker, made plush by a life of good food and idleness");
	output(".");

	output("\n\nYou’re tempted to luxuriate in the silent attention, but you suppose a little talking wouldn’t hurt. ");
	if(!korgiTranslate()) output("Maybe you’re the extra translation work that will improve the algorithms a bit. Right now she sounds a bit like a cave-dweller from an old holo.");
	else output("Since upgrading the translator, it’s much easier to understand her. No more cave-man conversations for you two!");
	output(" Clearing your throat, you lead off with a basic explanation of space travel - ships, and how you need one to escape the planet.");
	if(!pc.isBimbo()) output(" Here and there, you stop yourself to clarify points, knowing your listener won’t be familiar with even the most basic terminology.");
	else output(" It’s super complicated, so you explain it in really simple terms. It’s way easier to talk like that anyhow. Easier to keep from stumbling over your words or getting distracted by how your listener’s titties move when she breathes.");

	output("\n\n");
	if(flags["MET_ULA"] != undefined) 
	{
		output("Ula is a fabulous student");
		if(flags["ULA_STARTALK"] != undefined) output(". No matter how many times you have this conversation, she’s always happy to hear your tales");
	}
	else output("The Korgonne is actually a pretty good student");
	output(". While her eyes may be roving <i>everywhere</i>, her ears always pivot to listen to your voice directly. She rarely interrupts, and when she does, it’s with a soft squeeze and quiet voicing of, <i>“");
	if(!korgiTranslate()) output("Question?");
	else output("May I ask a question?");
	output("”</i> After the tenth such query, you notice that she’s getting more handsy. Instead of curiously discovering what an alien feels like, she’s stroking your bicep and forearm, kneading the muscles below in awe");
	if(pc.tone < 20) output(", however petite they may be");
	output(".");

	if(!inVillage)
	{
		if(pc.isTreated()) output("\n\nThe fragrant scent of feminine arousal is building in the air like cloying perfume. You flex for her and sniff, smiling inwardly when the cloud of arousing pheromones thickens perceptively. The little snow-mynx is seriously turned on! So are you... maybe more than normal, but who cares? You’re pretty much always horny.");
		else 
		{
			output("\n\nThe cave is really warming up with two active bodies inside, humid and almost passably warm. ");
			if(flags["MET_FEMKORGONNE"] != undefined) output("The scent of aroused Korgonne tickles your nose, indescribably different from the ones you’ve encountered in the wild");
			else output("An indescribable scent tickles your nose, stronger the closer you get");
			output(". Shoulder to shoulder, she’s easy to smell... and quite pleasant, you admit.");
		}
	}
	output("\n\n<i>“Wow,”</i> ");
	if(flags["MET_ULA"] != undefined) output("Ula");
	else output("the woman’s");
	output(" awestruck voice whispers.");
	output("\n\nWere her thighs always spread so wide?");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Such journeys,");
	else output("You’ve had such incredible journeys,");
	output("”</i> the dog-girl grows, leaning into your arm, ");
	if(!inVillage && flags["ULA_SAVED"] == 2) output("coat-covered");
	else output("fluffy");
	output(" breasts pressed into your arm. She clings on tight. <i>“");
	if(!korgiTranslate()) output("Dangerous. Beautiful.");
	else output("The danger you’ve faced, and the beauty you’ve seen.... Wow.");
	output("”</i> Her tongue hangs out over a an icy bottom lip after the last word, panting quietly.");

	if(!inVillage)
	{	
		if(flags["ULA_SAVED"] != 2) 
		{
			output(" Erect nipples rub against your [pc.skinFurScales].");
		}
		else output(" Firm points rub against you, even through the thick hides of her jacket.");
	}
	output(" <i>“");
	if(!korgiTranslate()) output("You good [pc.manWoman]. Much saving, science-talking.");
	else output("You’re a good [pc.manWoman]. Doing all that, fighting pirates and talking about such strange sciences.");
	output("”</i>");
	if(!inVillage)
	{
		output(" Nosing into your neck, the lusty Korgonne reaches ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("down to your loins");
		output(". <i>“My thanks-having.”</i>");
		output("\n\n<i>“Oh.”</i> You stiffen");
		if(pc.hasCock()) output(" in more than one way");
		output(". <i>“My pleasure.”</i>");
	}

	flags["ULA_STARTALK"] = 1;

	if(!inVillage)
	{
		//Crotchless.
		if(!pc.hasGenitals() || (pc.totalVaginas() <= pc.blockedVaginas() && !pc.hasCock()))
		{
			output("\n\nThose thick fingers wriggle around but find nothing. A few awkward seconds of groping stretch on before the Korgonne girl pulls back, confused. <i>“No funhaving parts?”</i>");
			output("\n\n<i>“Yeah...”</i> you admit.");
			output("\n\n<i>“Huh. You weird. Fun-weird, but fun.”</i> Coy delight spreads across her features. <i>“No tempt. Wow! Such relief.”</i> Her tail waggles playfully. <i>“Come visit, Korg’ii Hold. More talks. Safe. You want secret code?”</i>");
			output("\n\nYou nod.");
			output("\n\n<i>“<b>Find sparklerock, awoo in top sparklehole, third from right.</b> I tell whole village you savior.”</i> She kisses you on the nose. <i>“I tell tale of good alien. Very good, weird alien.”</i> Prancing toward the cave’s entrance, the dog-girl giggles nervously. <i>“So weird-fun! Thanking last time! Farewelled!”</i> She spins and totters out into the snow, suddenly unfazed by the cold.");
			processTime(45);
			pc.lust(33);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		//Genitals
		else
		{
			output("\n\nThose thick fingers ");
			if(!pc.isCrotchExposed()) output("wriggle into your [pc.lowerGarment] and ");
			output("brush your ");
			if(!pc.hasCock()) output("pussylips");
			else output("[pc.cockHeadBiggest]");
			output(" with slight, awestruck motions. Disbelieving gasps warm your neck as the hand slithers ");
			if(!pc.hasCock()) output("lower");
			else output("deeper");
			output(", exploring every inch with rapt attention. The touches are inexpert, questing. You get the impression she’s never done something like this before. It still feels good - better than good, in fact. Maybe it’s the intimateness of the situation, the knowledge that it’s just you and this lone Korgonne, seeking a moment of comfort in a cold and joyless wasteland....");
			output("\n\n...Maybe it’s that scent wafting up from between her legs. If this goes on much longer, you’re going to lose control.");
			processTime(45);
			pc.lust(33);
			clearMenu();
			//[Stop] [Fuck]
			addButton(0,"Stop",stopKorgiPlay);
			addButton(1,"Fuck",ulaFuckRouter);
		}
	}
	else
	{
		output(" Cuddling up next to you, Ula relaxes. <i>“");
		if(!korgiTranslate()) output("Other talks?");
		else output("Wanna talk some more?");
		output("”</i>");
		processTime(20);
		pc.lust(10);
		//ulaTalkMenu();
		addDisabledButton(0,"Stars/Space","Stars/Space","You just told her about this.");
	}
}

//Stop
public function stopKorgiPlay():void
{
	clearOutput();
	showCaveUla();
	output("You gently pull her hand away, breathing hard. <i>“No.”</i>");
	output("\n\nThe Korgonne scampers back, shaking like a leaf. Her thighs are slick with moisture, fur fragrant with that maddening scent. She balefully glares at her palm, fiery emerald eyes threatening to bore straight through. <i>“Sorry. Too excite.”</i> A pitious whimper emerges, followed by a whisper: <i>“Too excite...”</i>");
	output("\n\n<i>“It’s okay,”</i> you nonechalantly explain. <i>“Really. I just ");
	if(pc.isNice()) output("don’t want to take advantage of you.");
	else if(pc.isMischievous()) output("don’t handle cold very well. Wouldn’t want a pretty thing like you to see me all shrunken from the cold.");
	else output("don’t want to be responsible for deflowering you, cute as you are.");
	output("”</i>");
	output("\n\n<i>“Oh.”</i> The Korgonne makes for the door, curled tail drooping. After a moment of thought, she turns back. <i>“Thanks... savinged me.”</i> Hey eyes go wide at the sight of your ");
	if(pc.hasCock()) output("exposed boner, as if seeing it for the first time. It’s still hard. Harder than before actually");
	else output("slippery slit, as if seeing it for the first time. It’s still wet. Wetter than before actually");
	output(", now that you can see her cunt drooling. <i>“Still like?”</i>");

	output("\n\nIt takes every ounce of your willpower to keep from grabbing her and shoving her face into your crotch, but you manage. <i>“Still like.”</i>");
	output("\n\nThe dog-girl blushes so strong her light blue lips and nipples tint purplish in the middle. <i>“Then come Korg’ii Hold. Talk visit.”</i> She wiggles her fingers hopefully. <i>“Maybe touch visit?”</i> Bouncing on her hind legs, the dog-woman bites her lips, and the smell thickens. <i>“Secret code! <b>One awoo in top sparklehole. Third from right.</b>”</i> She squirms in place, undecided. At the last second, she darts forward to plant a kiss on your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else output("[pc.vaginas]");
	output(". <i>“Remember sparklecode! Visit! Share warm!”</i> She spins and totters out into the snow, suddenly unfazed by the cold.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function ulaFuckRouter():void
{
	if(pc.hasCock()) korgiCockFuck();
	else ulaCaveLesbo();
}

//Cave Fuck (Sappho-Doggo)
public function ulaCaveLesbo():void
{
	clearOutput();
	showCaveUla(true);
	output("<i>“More,”</i> you pant, [pc.vaginas] wet enough to melt a cave of your own into the ice.");

	var p:int = pc.pickUnblocked();
	//Treated no new pg:
	if(pc.isTreated()) 
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still, you sniff the air, letting her hyper-powered pheromones grab hold of your brain and drag it between her legs. You ");
		if(pc.wetness(0) < 3) output("moisten her snow-wettened");
		else if(pc.wetness() < 5) output("soak her");
		else output("drench her");
		output(" fingers with [pc.girlCum]. <i>“You smell so good. I want...”</i> You gulp down a mouthful of saliva. <i>“...I want to taste your cunt.”</i> Quivering, you change your mind. <i>“I need to eat your cunt.”</i>");
	}
	//HasMuzzle
	else if(pc.hasMuzzle())
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still you sniff the air. There’s something strange about it the way it reaches into your brain and flips switches you didn’t even know existed. You drench yourself, slipping into a strange kind of heat... only, you don’t want to be bred. You just want pussy. Your own pussy, her pussy, whatever. You want to stuff your snout into a quim and lick until she’s forced to do the same, creating an endless cycle of cunt-obsessed oral. <i>“You smell soooo good!”</i>");
	}
	//Normal
	else output(" Vaguely-minty fuck-scent tickles your sinuses as you sniff the air, savoring the arousal freely leaking from the eager korgonne’s crotch. She’s so deliriously wet that the air itself is humid with pussy. Every breath makes you wetter in response, hotter and hornier, more willing to lean into her crotch and while away the night happily licking. <i>“Your pussy...”</i> You pause to take a deep breath before continuing, juicing all over her fingers. The thought is forgotten. <i>“The pheromones are so strong!”</i>");

	output("\n\nThe dog-girl pulls away, staring at her soggy paw in horror. The added distance from her cloying cunt brings you a small measure of clarity... and a longing for its return. It looks as if she’s about to flee. <i>“Sorry!”</i>");

	output("\n\nYou beckon for her to come back. <i>“Please. Don’t leave.”</i>");

	output("\n\n<i>“But... my breed-scent.”</i> The horny fluffball squirms, thighs pressed together as if she could somehow contain the liquid lust that stains her fur. <i>“Strong.”</i> She hugs herself and looks down. <i>“Only girl who falls for own breed-scent. Others get so wet, keep calm.”</i> She jabs a thumb into her tits");
	if(flags["ULA_SAVED"] == 2) output(", compressing the jacket you gave her");
	output(". <i>“Stupid. Pussy-stupid. Belong alone, in home-room.”</i>");

	output("\n\n<i>“Nooo,”</i> you whine, crawling forward, modesty forgotten");
	if(!pc.isCrotchExposed()) output(", [pc.crotchCovers] left on the ground behind");
	output(". <i>“Look at how horny I am.”</i> You reach out for her thigh and stroke it, feeling the watery-slickness of her arousal slipping through your knuckles on drenched fur. <i>“I... I need your help now.”</i> Shuddering, you lean closer to her crotch, nostrils flaring to drink in her dizzying scent. <i>“I need your pussy so bad.”</i> The pudgy lips flush purple as you breathe on them. The clit visibly swells, glistening, promising to taste as lovely as it smells. <i>“Help.”</i>");
	output("\n\nThe puppy-girl stares down, eyes flicking back in forth in a panic. You note that she doesn’t back away. She doesn’t dare move, not with your [pc.lipsChaste] hovering next to her slit.");
	output("\n\n<i>“Please,”</i> you exhort, digging your fingertips into her thighs to hold her in place. <i>“Please?”</i>");
	output("\n\nThe dog-girl shudders. Strings of clear juices drool from her cyan slit. They smell like heaven. <i>“I... need... too,”</i> she whimpers, stepping forward, pressing her puss against your face, clit bumping your nose. Thick-lipped folds slide over your mouth, spread by pressure to exposed a dripping-wet tunnel. <i>“Want... tongue?”</i> The korgonne looks confused. <i>“Pups normal... but alien tongue. Inside!”</i> Her nose wrinkles. <i>“Pussy too! Pussies good-smell together!”</i>");
	output("\n\n<i>“Yeah,”</i> you mumble into her cunt. <i>“Pussies smell real nice.”</i> Reaching behind her, you grab her by the ass, delighted to discover that it’s as plush and squishable as her tits. Kneading her cheeks, you shove her into your face so hard");
	if(pc.hasMuzzle()) output(" that your muzzle slips inside, stretching her hymen but not quite breaking it");
	output(". A thrust of your tongue makes her whimper and quiver.");
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",korgiCavePussPart2);
}

public function korgiCavePussPart2():void
{
	clearOutput();
	showCaveUla();
	var p:int = pc.pickUnblocked();
	output("<i>“Warmed licks!”</i> the korgonne cries.");
	output("\n\nStrength vanishes from the leaky bitch’s legs, dumping her pussy-first onto your face. Her weight bowls you over onto your back. You barely avoid cracking your head on the floor, but any complaints are swallowed whole by the electric taste of korgo-girl cunt. It makes your head swim and your snatch");
	if(pc.totalVaginas() > 1) output("es");
	if(pc.wettestVaginalWetness() < 3) output(" dribble");
	else if(pc.wettestVaginalWetness() < 4) output(" soak");
	else if(pc.wettestVaginalWetness() < 5) output(" drip puddles onto the floor");
	else output(" gush puddles onto the floor");
	output(". <i>“I love thish tashte!”</i> you cry, muffled by cunt and ambrosial juices.");

	output("\n\nSo enmeshed are you in the act of cunnilingus that you only notice the korgonne moving around by the shifting of her clit. Instead of being high on your face, it rotates down near your chin. A second later, you feel fat, squishy tits pressing down on your [pc.belly] and a shock of virulent pleasure that makes your hungry mouth seize in ecstasy. <i>“Ahhh!”</i>");
	if(pc.hasMuzzle()) output(" Your ecstatic scream stretches her out around your snout, making the korgonne whimper back into your twat in sympathetic lust.");

	output("\n\nWas that an orgasm? It felt so good... so blissfully pleasant... but you still want her cunt. You can’t get enough of it. Right now it’s your favorite thing in the whole universe, a simmering delta of sinfully minty delights. Kissing it, you feel like its quivers are kissing you back, the shaking, climaxing korgonne expressing her shared affection through the sloppy, oozing girl-jizz that floods your maw.");

	//2cunts'
	if(pc.totalVaginas() == 2 && pc.blockedVaginas() == 0) output("\n\nA soaked finger slips into your second slit while the fuzzy alien’s mouth burrows deeper into the first, forcing you to new heights of pleasure. Another finger slips in a second later. Her digits may be short, but they’re delightfully thick, spreading you wide open as they skillfully find [pc.clits] to tease.");
	//3Cunts
	else if(pc.totalVaginas() > 2 && pc.blockedVaginas() == 0) output("\n\nSoaked fingers slip into your other slits while the fuzzy alien’s mouth burrows deeper into the first, forcing you to whole new heights of pleasure. Two more fingers join them a second later. Her digits may be short, but they’re delightfully thick, spreading you wide open as they skillfully find [pc.clits] to tease.");
	//1cunt only
	else output("\n\nThe fuzzy alien’s mouth burrows deeper into your [pc.vagina " + p + "], forcing you to new heights of pleasure. Seconds later, a finger joins it. Her digits may be short, but this one is delightfully thick, spreading you wide open as it pumps in and out alongside her cunt-drunk, canine tongue.");
	//Merge no new PG!
	output(" You can scarcely believe how <i>good</i> it feels, how impossible it makes it to think about anything but keeping your tongue moving, sliding in a feedback loop of endless pleasure...");
	processTime(15);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",korgiCavePussPart3);
}

public function korgiCavePussPart3():void
{
	clearOutput();
	showCaveUla(true);
	output("For the next half-hour, you sixty-nine with the once-chilled alien, sharing warmth and wetness in equal measure. Counting the orgasms is impossible. One bleeds into the next with such suddenness that you feel like you spent more time black-out-blissed than cogent of her pussy’s texture. You’re left with little more than breathless exhaustion and an intimate familiarity with the fucked-out dog-girl’s cunt.");
	output("\n\nStill, you don’t quite feel satisfied. It’s more a sense of being burned-out, like your body got so amped up on her pheromones that it was forced to shut down before your mind broke with desire. The tawny fluffball snuggles against you. She must feel the same, from the exhausted look in her eyes. She’s feels nice, snuggled up against you. For once, you realize she smells more like your cunt than her own. Maybe you smell like her.");
	output("\n\nSmiling weakly, you fall asleep, cuddling tight to the alien.");
	processTime(40);
	for(var x:int = 0; x < 14; x++) { pc.orgasm(); }
	IncrementFlag("ULA_SEXED");
	clearMenu();
	if(flags["ULA_SEXED"] == 1) addButton(0,"Next",korgiCavePussPart4);
	else addButton(0,"Next",mainGameMenu);
}

public function korgiCavePussPart4():void
{
	clearOutput();
	showCaveUla();
	output("You wake to the feeling of the korgonne girl trying to disentangle herself from you. <i>“Hey,”</i> you whisper, smiling happily. <i>“Was it good for you?”</i>");
	output("\n\nThe dog-girl’s blush reaches all the way to her lips and nipples. She licks her lips, eyes flicking to your pussy, then nods rapidly.");
	output("\n\n<i>“Good. I had fun too.”</i>");
	output("\n\nThat sets her off. The busty canine pumps her fist in the air and spins around in pure happiness. When she turns back, she’s smiling wide enough to show off a set of sharp canines. <i>“Alien first girl-warm share! Delights-much filling!”</i> She drops to her knees and kisses your lips, softly nipping your nose after. <i>“First save, then teach sexings. You truly best alien. Elders wrong. Aliens nice! So much know!”</i>");
	output("\n\nYou kiss her back, then struggle up onto your elbows. <i>“Glad to be of service.”</i>");
	output("\n\n<i>“Maybe... you come visit Korg’ii hold? Teach more. Help see nice?”</i> She sniffs her fingers, then shudders. <i>“Share more warms?”</i>");
	output("\n\n<i>“Sure,”</i> you answer, too fucked out to care. Sounds like fun.");
	output("\n\n<i>“Yays!”</i> Bouncing back, the Korgonne hops in the air. <i>“Secret code telling! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her slippery paws and squeezes. <i>“Remember! Sparklehole! Three from right, topdeck!”</i> Still bouncing about, the dog-girl turns away and totters out into the snow, seemingly unfazed by the cold. <i>“Tell all! Alien joy!”</i>");
	output("\n\nYou’re left alone, secure in the knowledge that you should “awoo” into a specific “sparklehole” if you wish to see the friendly korgonne once more. Perhaps her whole tribe is friendly?");
	processTime(35);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cave Fuck (Cock Path)
public function korgiCockFuck():void
{
	clearOutput();
	showCaveUla(true);
	var x:int = pc.cockThatFits(ulaCapacity());
	if(x < 0) x = pc.biggestCockIndex();

	output("<i>“More,”</i> you pant, [pc.cocks] hard enough to pound through solid ice.");

	//Treated no new pg:
	if(pc.isTreated())
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still you sniff the air, letting her hyper-powered pheromones chemically ");
		if(pc.inRut()) output("deepen your");
		else output("trigger an artificial");
		output(" rut. You dribble pre over her gently exploring paws while your chest heaves. <i>“Your pussy smells divine. Such pheromones...”</i> A full-body quake ripples through you, culminating in a throb hard enough to make the dog-girl nearly lose her grip. <i>“I need more than a paw.”</i>");
	}
	//HasMuzzle
	else if(pc.hasMuzzle())
	{
		output(" Vaguely-minty fuck-scent fills your sinuses, and still you sniff the air. There’s something primal about it that compels you to continue, every breath instinctively guiding your nose toward the korgonne’s crotch until you’re fighting to keep yourself from burrowing into her lap. <i>“Your scent...”</i> She couldn’t miss the sound of your bestial snuffling if her ears were packed full of snow. The dog-girl’s cunt has your full attention, mind and cock");
		if(pc.cockTotal() > 1) output("s");
		output(" alike. <i>“...so good. How can you smell so good?”</i>");
	}
	//Normalboi
	else 
	{
		output(" Vaguely-minty fuck-scent tickles your sinuses as you sniff the air, savoring the fuck-scent freely leaking from the eager korgonne’s crotch. Every breath of it is a humid caress across your glans. Every whiff makes the air seem warmer and your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" warmer. <i>“Your pussy....”</i> You pause to take a deep breath before continuing. Pre spills into her paw in response. <i>“...pheromones?”</i>");
	}
	//Merge
	output("\n\nThe dog-girl pulls away, staring at her soggy paw in horror. The added distance from her cloying cunt brings you a small measure of clarity... and longing for its return.");
	if(pc.balls > 0)
	{
		output(" Your [pc.balls] churn");
		if(pc.balls == 1) output("s");
		output(" in anticipation.");
	}
	output(" It looks as if she’s about to flee. <i>“Sorry!”</i>");

	output("\n\nYou beckon for her to come back. <i>“Please. Don’t leave.”</i>");

	output("\n\n<i>“But... my breed-scent.”</i> The horny fluffball squirms, thighs pressed together as if she could somehow contain the liquid lust that stains her fur. <i>“Strong.”</i> She hugs herself and looks down. <i>“Only girl who falls for own breed-scent. Others get so wet, keep calm.”</i> She jabs a thumb into her tits");
	if(flags["ULA_SAVED"] == 2) output(", compressing the jacket you gave her");
	output(". <i>“Stupid. Pussy-stupid. Belong alone, in home-room.”</i>");
	output("\n\nYou look on ");
	if(!pc.isAss()) output("in sympathy. No wonder she started putting the moves on you; as soon as she got a little excited, the pheromones started a feedback loop");
	else output("in fake sympathy. At least that explains why how this shy girl transformed into a simpering puddle of lust");
	output(". You know how she feels, come to think of it. Just looking at her, you can feel the urge rising inside you, begging you to take her. Your nostrils flare as you try to think of what to say. <i>“It’s... not safe to go out like that. Who knows what kind of monster you’d run into?”</i>");
	output("\n\nThe puppy-girl sighs, in resignation, dropping to her knees. One hand goes to her chest, roughly squeezing the fattened orb. The other dips between her legs, crudely rubbing at a blue-lipped entrance. <i>“R-right. But... can’t... want...”</i> She licks her lips, eyes fixated on your cock. <i>“Want pups.”</i> Falling on all fours, she crawls closer, tail curled up and wiggling with her juicy haunches. <i>“Want alien pups. Nice alien’s pups.”</i>");
	output("\n\nYou attempt to hold yourself back. She’s probably a virgin, and she obviously doesn’t know any better. The way she smells right now, she’d get pregnant just from looking at a dick... and she’s staring at yours right now. You subconsciously shift to better present it, body operating on instinct and raw desire without much input at all from your brain. <i>“Wait... uh.”</i>");
	output("\n\nThe furry vixen bends low to drag her tits across the ice, sensuously drawing closer");
	if(flags["ULA_SAVED"] != 2) output(", hard nipples all but digging furrows into the freeze");
	output(". Her eyes are liquid pools of lust, so earnestly wanton that you can see your dick reflected in the moist curve of her corneas.");
	output("\n\n<i>“You should...”</i>");
	output("\n\nA tongue rolls out, long and slick. Drool spatters your thighs.");
	output("\n\n<i>“Should... uh... wa-”</i>");
	output("\n\nWarmth devours you.");
	processTime(20);
	pc.lust(60);
	clearMenu();
	addButton(0,"Next",korgiCockFuck2);
}


public function korgiCockFuck2():void
{
	clearOutput();
	showCaveUla(true);
	var x:int = pc.cockThatFits(ulaCapacity());
	if(x < 0) x = pc.biggestCockIndex();

	var cumQ:Number = pc.cumQ();
	
	output("You slide bonelessly onto your back as the tension is sucked from your body. Frenetic licks and slobbery kisses work their way along [pc.oneCock] unceasingly. Soft paws, wet from cunt, pre-cum, and melted snow join in to explore the space around your [pc.knot " + x + "]. It all began so artlessly, but with each moment spent sealed around your dick, the proud puppy learns new ways to make you gasp. Her tongue curiously ventures over the musky skin, seeking out pockets of virile flavor, coaxing your pre to channel into the curved middle where she can hold and savor it.");
	output("\n\nYou nearly cum to the sound of her lurid gulp.");
	output("\n\nAnd then she swivels around, muzzle suddenly a vortex of pleasure. Furry thighs land to either side of your ");
	if(pc.tallness < 60) output("head");
	else
	{
		output("chest");
		if(pc.biggestTitSize() >= 4) output(", splayed nearly into a split by the width of your jiggling boobs");
	}
	output(". Fat, cyan cuntlips hover above your face, and that minty, deliriously erotic smell washes over you, tainting every breath with korgonne pussy-musk.");
	output("\n\n<i>“Put pups in hole.”</i> The command is spoken around a cheek full of dick.");
	output("\n\n[pc.EachCock] trembles");
	if(pc.cockTotal() > 1) output(", the one in her maw most of all");
	output(", threatening to go off like a geyser. You’re no medical expert, but with her legs splayed so wide, you’re pretty sure you can see the membrane of her alien hymen stretched thin, waiting to be slowly spread by a gentle lover - or broken in half in a frenzy of bestial breeding. <i>“But");
	if(pc.cockVolume(x) > ulaCapacity()) output(" I’m too biiii");
	output("-”</i>");
	output("\n\n<i>“No. Pups in hole.”</i> She silences you by dropping her hips and drowning you in her sodden slit, watery slickness pouring unrestrained into your maw. When she lifts off a minute later, everything reeks of minty quim. Your [pc.face] has been claimed by the lust-lost tribal girl, and every breath you take is swamped in a pheromonal wonderland.");
	if(pc.balls > 1) output(" It feels like your [pc.balls] are going to boil over.");
	output("\n\nYou dive upward to suck greedily upon her clit. You want that cunt more than anything. You need it in your life: on your face, on your dick, filled with seed. Still, you make one last token attempt to moderate her impulses. <i>“Let me eat you out. I’ll suck your clit till you pass out and swallow your cuntjuice till my mouth smells more like pussy than y-”</i> Your tongue stabs out for another lick, unwilling to go without the exotic flavor of korgonne cunt a minute longer.");
	output("\n\nThe warm, wet sheath around your [pc.cock " + x + "] vanishes, leaving you to twitch in cold air. <i>“Nooooooo! Thought you nice alien?”</i> the voice is delirious, and that gorgeous, blue cunt vanishes from view. Your short-stacked lover pops into view a second later, stuffing her nose against the side of your face and licking her flavor from your cheek. <i>“Please,”</i> she pants. <i>“Want you. Nice alien. Strong alien.”</i> Her tits weigh heavily on your ");
	if(pc.biggestTitSize() >= 1) output("own");
	else output("chest");
	output(". <i>“Deserve puppies.”</i> She shudders and squeezes your dick so hard you nearly spurt. <i>“Deserve whole clan of puppies.”</i>");
	output("\n\nStars, that sounds appealing. In this moment, you’d like nothing better than to bust a ");
	if(pc.perkv1("'Nuki Nuts") > 0) output("swollen ");
	else if(pc.ballFullness >= 90) output("backed-up ");
	else if(cumQ >= 9000) output("womb-flooding ");
	output("nut in this bitch. <i>“Yeaaahhh...”</i>");
	output("\n\nNo sooner is the word out of your mouth than the korgonne is shifting on top of you, hips rolling feverishly in an attempt to slide your [pc.cock " + x + "] inside.");

	//2Big
	if(pc.cockVolume(x) > ulaCapacity())
	{
		output("\n\nShe’s definitely a virgin. The first attempt does little more than smash her puffy puss into your [pc.cockHead " + x + "], futilely dragging the lust-engorged lump of her clit past your pre-weeping urethra. The second attempt fares no better. Growling in disatisfaction, she rocks back and forth, straining her tight cunny against your impossibly large cockhead, trying to wedge herself open far enough to take <i>any</i> part of you, even if it’s only the first inch of pole.");
		output("\n\n<i>“Ahp!”</i> the dog-girl gasps as she succeeds in ripping her hymen wide open, sinking a few millimeters in. She’s so tight. It feels like her clenches are going to pinch off your [pc.cockHead " + x + "]. Streamers of korgonne girl-cum stream down your length, but no amount of effusive ejaculate will allow her virginal tunnel to take your obscene tool any further. <i>“Big!”</i>");
		pc.cockChange();
		output("\n\nPleasure forces the deflowered dog-girl to arch her back, leaning so far that her hair touches her tail, thrusting her breasts at your face. They bounce and clap against each other. Drops of fuck-warmed snowmelt rain over your [pc.chest] as the korgonne cums herself silly, hindpaws reaching back to grip you, smearing pussyjuices all the way down to your ");
		if(pc.balls > 0) output("[pc.sack]");
		else output("[pc.sheath " + x + "]");
		output(". <i>“Very stroooong! Many pups!”</i>");
		output("\n\nPuppies? You make an effort to hold yourself back, but she smells so good. Her feet squeeze you so wonderfully, milking you into her, fanning the compelling breed-scent into the air until your body obliges her request for cum with orgasmic clenching. <i>“I’m cumming!”</i> You pride yourself on the warning, futile though it might be.");
		output("\n\n<i>“Happiness! Give puppies.”</i> She grabs your ears and tugs your lips to a tit, hips rolling. <i>“Warm... Good... Motherness!”</i> Eyes closing, her tongues dangles stupidly out of her mouth as her body seizes. The cum-hungry tunnel flutters confusedly, stretched too full yet mostly empty.");
		if(cumQ < 8) output(" Nothing more than dribbles slips out, but she doesn’t seem to mind. She climaxes from the feeble [pc.cumNoun]-drops leaking into her passage, folds fluttering to escort the feeble fluids closer to her aching eggs.");
		else if(cumQ < 250) output(" The [pc.cumNoun]-shots fire in deep. Every lance makes her feel warmer and wetter, squelching and hot. You have no doubt that some is slipping upward into her womb, journeying to those aching eggs.");
		else if(cumQ < 10000) 
		{
			output(" She moans at the feeling of your thick, virile pumps of [pc.cumNoun]. [pc.cumVisc] blobs slip out of her stretched lips");
			if(pc.hasKnot(x)) output(" to shine your straining knot");
			output(". Whole streams of it must be pouring into her womb, ready to baste her aching eggs.");
		}
		else 
		{
			output(" Nothing could prepare her for the near-biblical flood of [pc.cumNoun] pouring into her womb, filling every crack and crevice. Rivers spray out around your [pc.cockHead " + x + "] as her belly bulges obscenely. She already looks like a mother");
			if(cumQ >= 25000)
			{
				output(", and you’ve barely begun to breed.");
				output("\n\n<i>“You asked for it,”</i> you pant, roughly groping a tit, squirting in endless passion. You’ve long since seeded every inch of exposed womb, yet your body is far from done, not with her scent so thick in your nose, grabbing you by the ");
				if(pc.balls > 1) output("balls");
				else output("cock");
				output(" and milking out thicker, heavier flows. You flood her middle until she’s absolutely spunk-pregnant, the once-virgin korgonne so fattened that the force of your shots inflating her belly theatens to roll her to the side");
			}
			output(".");
		}
		output("\n\nPlush lips press against yours as she relaxes, softly this time. The fire has gone out of the fluffy bitch, quenched by");
		if(cumQ >= 10000) output(" a lake of");
		output(" your cum. She nuzzles into you, tired arms on your shoulders");
		if(!pc.hasKnot(x))
		{
			output(" as she slowly drags herself off your dick.");
			if(cumQ >= 10000) output(" A river of spent jizz sprays from her uncorked cunt onto your [pc.belly].");
		}
		output(" <i>“Wow.”</i> She nuzzles your cheek, then licks your nose. <i>“Many cummies. Alien sex hurt-good.”</i> Her eyes twinkle. <i>“Need practice. Make pussy big for alien-cock.”</i>");
		//[Next] -> Same post-gasm as regular variant (though make sure the knotting variant isn’t referenced)
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",korgiCockFuck3);
	}
	//Regular - no new PG
	else
	{
		output("\n\nShe’s definitely a virgin. The first two attempts do little more than cause your hypersensitized cock to slide through her folds and slip to the side. The third time’s the charm. Her devilishly tight cunny strains around your [pc.cockHead " + x + "], hymen flexing. She seems like she’s going to take it slow, right up until she grabs your face and stuffs her tongue into your mouth. Plush cyan lips hold you captive while her tongue savors your exotic taste, intermingled with the ripe flavor of her own heated puss. In that moment, her hips scissor downward, splitting her hymen on the altar of your virile masculinity.");
		pc.cockChange();
		output("\n\n<i>“Ah!”</i> the deflowered dog-woman gasps, drooling webs of spit and vaginal lube. She shudders, her hard nipples begging to be tugged. Further down, her tunnel ripples in mixed agony and ecstasy. The fertile folds feel like they’re milking you for how they clench and flutter, and you realize that you’ve already slipped past the point of no return. Even if you pulled out now, you’d cum from the pheromones clogging your nostrils. If she kissed you, you’d give her every sperm in your body and then some.");
		output("\n\n<i>“I’m cumming!”</i> you warn.");
		output("\n\n<i>“Good. Give puppies.”</i> She grabs your ears and kisses you again, hips rolling. <i>“Warm... Good...”</i> Eyes closing, her tongue goes still in your mouth as her body seizes everywhere except the cum-hungry tunnel still clenching down around your ecstatically spurting [pc.cockNounSimple " + x + "].");
		if(cumQ < 10) output(" Nothing more than dribbles slips out, but she doesn’t seem to mind. She grinds the feeble [pc.cumNoun]-drops throughout her passage, giving your deposit ample opportunity to swim upstream to her aching eggs.");
		else if(cumQ < 250) output(" The [pc.cumNoun]-shots fire in deep. Every lance makes her feel warmer and wetter, squelching and hot. You have no doubt that some is slipping upward into her womb, journeying to those aching eggs.");
		else if(cumQ < 10000) 
		{
			output(" She moans at the feeling of your thick, virile pumps of [pc.cumNoun]. [pc.cumVisc] blobs slip out of her stretched lips");
			if(pc.hasKnot(x)) output(" past your straining knot");
			output(". Whole streams of it must be pouring into her womb, ready to baste her aching eggs.");
		}
		else
		{
			output(" Nothing could prepare her for the near-biblical flood of [pc.cumNoun] pouring into her womb, filling every crack and crevice. Rivers spray out around your [pc.knot " + x + "] as her belly bulges obscenely. She already looks like a mother");
			if(cumQ >= 25000) 
			{
				output(", and you’ve barely begun to breed.");
				output("\n\n<i>“You asked for it,”</i> you pant, grinding against her, thrusting and squirting in endless passion. You’ve long since seeded every inch of exposed womb, yet your body is far from done, not with her scent so thick in your nose, grabbing you by the ");
				if(pc.balls > 1) output("balls");
				else output("cock");
				output(" and milking out thicker, heavier flows. You flood her middle until she’s absolutely spunk-pregnant, the once-virgin korgonne so fattened that the force of your shots inflating her belly theatens to roll her to the side");
			}
			output(".");
		}
		output("\n\nPlush lips press against yours, softly this time. The fire has gone out of the fluffy bitch, quenched by");
		if(cumQ >= 10000) output(" a lake of");
		output(" your cum. She nuzzles into you, tired arms on your shoulders");
		if(!pc.hasKnot(x))
		{
			output(" as she slowly drags herself off your dick.");
			if(cumQ >= 10000) output(" A river of spent jizz sprays from her uncorked cunt onto your [pc.belly].");
		}
		else output(" as she wiggles in place, stuck on your knot while still more [pc.cumNoun] pours in.");
		output(" <i>“Wow.”</i> She nuzzles your cheek, then licks your nose. <i>“Many cummies. You best heat-sharer. Not forget.”</i>");
		processTime(20);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",korgiCockFuck3);
	}
	//If repeated from RP menu, skip epilogue
	if(flags["ULA_SEXED"] != undefined) 
	{
		flags["ULA_DEFLOWERED"] = 1;
		IncrementFlag("ULA_SEXED");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function korgiCockFuck3():void
{
	clearOutput();
	showCaveUla(true);
	var x:int = pc.cockThatFits(ulaCapacity());
	if(x < 0) x = pc.biggestCockIndex();

	output("After a few minutes to rest");
	if(pc.hasKnot(x) && pc.cockVolume(x) <= ulaCapacity()) output(", de-knot,");
	output(" and recover, the beaming ball of fluff stumbles up off of you, rubbing her belly. <i>“Alien gave much good!”</i> [pc.CumNoun] drips from between her legs to splatter the floor. <i>“Warm inside. You visit? Give more pups?”</i> She looks to you hopefully, but between the cloud of pheromones and the energy-sapping orgasm, you’re tapped out.");
	output("\n\n<i>“I guess?”</i>");
	output("\n\n<i>“Yays!”</i> Trotting in a circle");
	if(pc.cumQ() >= 25000) output(", her taut tummy wobbling");
	output(", the Korgonne pumps her fist in the air. <i>“Visit Korg’ii Hold. Secret code telling! <b>One awoo in top sparklehole! Third from right.</b>”</i> She takes your hand in her slippery paws and squeezes. <i>“Remember! Sparklehole! Three from right, topdeck!”</i> Bouncing about, the dog-girl spins away and totters out into the snow, seemingly unfazed by the cold. <i>“Tell stories, and give pups!”</i>");
	output("\n\nYou’re left alone, secure in the knowledge that you should “awoo” into a specific “sparklehole” if you wish to see the friendly korgonne once more. Perhaps her whole tribe is friendly?");
	flags["ULA_DEFLOWERED"] = 1;
	IncrementFlag("ULA_SEXED");
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//First Time Dad/Chief Meeting
public function firstTimeKorgHoldMeeting():void
{
	clearOutput();
	showName("KORG\nMEETING");
	showBust(korgChiefBustString());
	currentLocation = "KORGII R10";
	generateMap();
	output("The guards hustle you through winding tunnels and up a spiral staircase hewn from solid stone. In stark contrast to the frigid exterior, it’s nearly as warm as a sauna inside Korg’ii Hold. By the time you climb to the next level, you’re ");
	if(pc.faceType == GLOBAL.TYPE_CANINE) output("panting and ");
	output("sweating. No wonder the korgs you pass are naked, tongues hanging loose from their canine maws to assist their attempts to vent heat. You wipe moisture from your brow as your escort comes to a stop.");
	output("\n\nIntricately worked script and pictographs crawl across a stone door nearly two korgs tall, its surface polished to a mirror finish. For all the tribal banter and savage behavior, it would seem their clan is home to dedicated craftspeople with skill to rival coreward artisans, however primitive their tools.");
	output("\n\nThe bigger of your two guards raps the butt of his spear against the door, then leans to a hole, identical to the hundreds hiding the Hold’s entrance. <i>“Ula’s alien-friend arriving!”</i>");
	output("\n\n<i>“Come. Waiting such times!”</i> a gruff voice answers.");
	output("\n\nThe big one nods to his shorter compatriot, who twists a handle and pushes, swinging the huge monolithic portal back with surprising ease. From the corner of your eye you can spy a set of heavy hinges, polished to the same sheen as the door’s surface. Light from the chamber beyond dazzles your eyes.");
	output("\n\nOnce you adjust to the change in brightness and uncover your eyes, you’re dazzled by the sheer display of opulence within. Every wall is hewn from whitish stone, the surface worked into carved murals of korgonne heroism. Glowing crystals held aloft by chains of gold cast amber luminance over rocky tapestries, flickering slightly. In one corner, you can see a single armored korg fighting off three frostwyrms single-handedly. In another, a horde of fluffy barbarians riding six-legged bears trample milodans underpaw.");
	output("\n\nFurniture of bone and rock decorates the interior. Fuzzy blankets and plush-looking pillows offer comfort to the otherwise unforgiving furniture. In the center of it all is an enormous throne. It dominates the view, and on it rests the undoubted leader of this tribe of korgonne. The heavyset elder regards you with milky blue eyes and strokes the wispy curls of a beard every bit as white as the rest of his fur. You could sit him down in front of a snow-drift and he’d disappear.");
	output("\n\n<i>“Huh. Thought bigger.”</i> He squints and leans closer. <i>“You alien? You save Ula?”</i>");
	output("\n\nYou nod");
	if(pc.isNice()) output(" and bow. <i>“It was my pleasure.”</i>");
	else if(pc.isMischievous()) output(", puffing up your chest boastfully.");
	else output(". <i>“Indeed.”</i>");

	output("\n\nThe chieftain regards you cautiously. <i>“You thanks having. Many aliens greedy. Cruel.”</i> He gestures to a place on the murals where a small group of Korgonne appear to be fighting with a much larger, better-armed battlegroup. <i>“Kill. Steal. Shatter holds for wall-shines.”</i> He waggles fingers decorated with green gemstones, likely emerald or savicite. <i>“You earn chance.”</i> He nods grimly. <i>“Prove not like others. Show friending, and we friending back.”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("You rush forward to give the big, fluffy dog-guy a hug when the guards grab you by the collar. Well, you’re gonna hug somebody! You round on him and wrap your arms around his straining, muscular back, petting the his head and neck until you hear his tail wagging. <i>“Yay! Friends!”</i>");
	else if(pc.isBro()) output("You extend your hand for a handshake. He stares at it. After a minute solid of waiting, you drop your hand and clear your throat. <i>“Uhh... yeah. Friends.”</i> Why can’t they just get with the program and pick up on normal galactic social cues? Ugh. You snort in irritation.");
	else if(pc.isNice()) output("You nod gravely. <i>“I shall.”</i>");
	else if(pc.isMischievous()) output("You nod, trying to hide a smirk at his crude use of language. <i>“Much friending! Very like! Wow!”</i>");
	else output("You nod severely. <i>“Of course.”</i>");
	output("\n\n<i>“Good.”</i> The white-furred elder staggers up to his feet, back cracking innumerable times. <i>“Sleepings times soon.”</i> He waddles past the chairs and tables toward a curtained-off doorway. <i>“Too old for leading. Go cold soon, am reckoning.”</i> Pausing halfway through the curtain, the old dog turns back to fix a keen eye on you. <i>“Behave self. Treat Ula - any korg - badly, you be wishinged for long cold.”</i> The fabric swishes closed.");
	output("\n\nBehind you, the guards shrug and pad off, quietly discussing your anatomy amongst themselves. It would seem <b>you’re now welcome in Korg’ii Hold!</b>");
	//[Next] -> Normal room descript
	processTime(25);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}