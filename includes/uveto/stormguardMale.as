/*By Nonesuch:
Ideas/Notes

* Typical cundarian. Doesn't fight if you don't agree to because that wouldn't be particularly honourable (but does rag on you if you refuse). For this reason should be a tough encounter. Talking Lash/Faell tier in second form at least.

* Honor count. Gets more excited about fighting you the higher it climbs. Gets better after a certain point.

* If it gets too low he'll refuse to fight because there's nothing to be gained. He will train you though, for a price (i.e. he gets to put it up your bum).

* Possibly a breeder? Beyond the scope of 10k probably.

* Win scene ideas: Spank him. You better believe that activates his better form next time you meet him. Aggressive BJ, play on discipline ethic. Standard buttfuck probs.

* Loss scenes: Change depending on honor stat.
 

Codex

https://docs.google.com/document/d/1_7pKnX3hveLAqq6NBaVJ_wWTohrPqYpquFett1klt0E/edit

Honor System

PC has three different statuses with Gel Zon that affect their interactions: 1 (Neutral) 2 (Honored) and 0 (ur a scrub lmao). 

PC starts at 0 Honorcount (Neutral)
PC beats him: +1 Honorcount (added at end of current interaction)
PC loses to him: -1 Honorcount (added at end of current interaction)

+3 or +4: Set PC to 2
-2 to +2: Set PC to 1
-3 or -4: Set PC to 0
*/

	//==========================================//
	//	STORMGUARD FLAGS:					  	//
	/*==========================================//
		MET_STORMGUARD  - Encounter him
		MET_GEL_ZON		- Know his name
		STORMGUARD_HONOR- Current honor level
		SG_HONOR_0_MET	- Had Honor 0 repeat meeting
		SG_LAST_ENC		- 1 for sparred
						- 2 for spanked
		SPANKED_SG_COUNT- Times spanked him
		SG_LANCE_SEEN	- Times seen the lance do its thing
		SG_DEFEATED_PC	- Times lost to him (and therefore been plugged!)
		SEXED_SG_MALE	- Times had any kind of intercourse with him
		STORMGUARD_CD	- Cooldown after certain scenes	
						- Status effect, not flag
		SG_CON_WINS		- Consective times PC won
		SG_FEMDOMMED	- How many times PC has done femdom scene
		SG_PREG_SOURCE	- 1 if impregnated by win
						- 2 if impregnated by loss heat sex
						- should reset at end of pregnancy
		SG_PREG_PC_KNOWS- PC knows that pregnancy is Stormguard's
						- should reset at end of pregnancy
		SG_PREG_MET		- PC has met Stormguard while pregnant with this kid
						- should reset at end of pregnancy
		SG_HATCH_TIMER	- keep track of when egg hatches
						- reset after hatched
*/

public function stormguardMaleEncounterAvailabale():Boolean
{
	if(pc.hasStatusEffect("STORMGUARD_CD")) return false;
	if(pc.hasCock() || (pc.hasVagina() && !pc.isChastityBlocked(0))) return true;
	return false;
}

public function showStormguard(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	if(flags["MET_GEL_ZON"] != undefined) showName("\nGEL ZON");
	else showName("STORM\nLANCER");
	showBust("STORMGUARD_MALE"+nudeS);
}
public function stormguardHonor(arg:Number = 0):Number
{
	if(flags["STORMGUARD_HONOR"] == undefined) flags["STORMGUARD_HONOR"] = 1;
	if(flags["STORMGUARD_HONOR"] + arg < 0) flags["STORMGUARD_HONOR"] = 0;
	else if(flags["STORMGUARD_HONOR"] + arg > 2) flags["STORMGUARD_HONOR"] = 2;
	else flags["STORMGUARD_HONOR"] += arg;
	return flags["STORMGUARD_HONOR"];
}
public function sgPregByWin():Boolean
{
	if (flags["SG_PREG_SOURCE"] == 1) return true;
	return false;
}

//Intros
public function stormguardIntro():void 
{
	showStormguard();
	author("Nonesuch");
	if(!CodexManager.entryUnlocked("Cundarians")) CodexManager.unlockEntry("Cundarians");
	//First
	if(flags["MET_STORMGUARD"] == undefined)
	{
		//9999 check with weather code?
		output("\n\nThe snow that ceaselessly whips and flurries down from the repressive skies above removes all features from the land around you, turning it into one vast, glaring reminder of the merciless winter that will never leave this place. The mounds and promontories that you travel past could be anything, really - relics of korgonne civilization, forgotten tech - and you’d never know. Why, that hulking shape to your right looks exactly like a statue fallen on its back...");
		output("\n\n<i>“Magnificent, isn’t it?”</i> says a deep, deliberate voice, and your heart almost jumps out of your mouth. Very slowly, the head of the “statue” turns to regard you with yellow slit eyes, dislodging some of the snow and frost settled on its features. <i>“A world of elemental savagery. Where every moment is a struggle to survive. Here, you find out what it truly means to live.”</i>");
		output("\n\nThick, hard-bitten lips curve into a smile as animation slowly flows down his neck, seeming to bring the rest of this snow-coated form to life. He is a big, bulky, slate-blue creature, half-naked, lying back as if he were relaxing on some sun-kissed beach rather than half-buried in a snowdrift. Small tentacles frame his flat-nosed, high-cheekboned face. Below his armored hips his legs end in two cloven hooves.");
		output("\n\n<i>“Out here, storm lancers battle,”</i> he says, gesturing heavily at the frozen hills. <i>“We struggle. We survive. We live. It is not the test; it is the reward. I would battle you, [pc.race]. If you have made it out this far, you must have worth.”</i> His eyes roam your body, the heat in them burning out from the whiteness they are mired in. <i>“No fleeing and the loser’s body the prize, as honor dictates.”</i> The lips curve into a challenging smirk. <i>“Do you know of honor, [pc.race]?”</i>");
		output("\n\nYour codex beeps; the specifics of what it says are whipped away on the wind, however you think you hear the word “Cundarian”.");
		flags["MET_STORMGUARD"] = 1;
		//[Fight] [No]
		clearMenu();
		addButton(0,"Fight",fightSnowRapeMan);
		addButton(1,"No",noSnowRapeForMeThanks);
	}
	else
	{
		IncrementFlag("MET_STORMGUARD");
		output("\n\nMounds and strange shapes huddle under the snow all around you, features removed by the white freeze. They could be anything, really... but you are prepared, at least a little, when one of them slowly turns its head and gazes at you with brilliant yellow eyes.");	
		//Preg Encounter
		//Must know you are pregnant with Cundarian to trigger
		//Puts Gel Zon on CD for 24h
		if(pc.hasPregnancyOfType("StormguardPregnancy") && flags["SG_PREG_PC_KNOWS"] == 1)
		{
			stormguardPregIntro();
			return;
		}
		//Spanked
		if(flags["SG_LAST_ENC"] == 2)
		{
			flags["SG_LAST_ENC"] = 0;
			output("\n\n<i>“You will not humiliate me this time,”</i> Gel Zon says through gritted teeth. He rises, throwing off his snowy mantle like the statue of some angry God come to life. <i>“I have trained and meditated ever since we last met, so that I will never be at the mercy of a sadist like you again.”</i> He thumps his chest angrily. <i>“Fight me! My honor demands it!”</i>");
			//[Fight] [Refuse]
			clearMenu();
			addButton(0,"Fight",spankedSGFightIntro);
			addButton(1,"Refuse",refuseSpankedSGFight);
		}
		//Honor 1
		else if(stormguardHonor() == 1)
		{
			output("\n\n<i>“You return,”</i> ");
			if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
			else output("the cundarian storm lancer");
			output(" says at length. He gazes up at the sky from where he is, lounging back in his blanket of freezing snow. <i>“The finest arena a warrior could ever hope for. Will you honor it? You know the rules.”</i>");
			//Reset all "last time metrics"
			flags["SG_LAST_ENC"] = 0;
			//[Fight] [Refuse]
			clearMenu();
			addButton(0,"Fight",honor1Fight);
			addButton(1,"Refuse",refuseMoreHonor1);
		}
		//Honor 0
		else if(stormguardHonor() == 0)
		{
			output("\n\n");
			if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
			else output("The cundarian storm lancer");
			output(" gazes at you for a time, a placid smile on his face, before silently going back to gazing at the sky.");

			if(flags["SG_HONOR_0_MET"] == undefined) 
			{
				output("\n\n<i>“You aren’t going to challenge me to fight?”</i> you ask.");
				flags["SG_HONOR_0_MET"] = 1;
			}
			else output("\n\n<i>“Let me guess - I’m not worth your time,”</i> you say.");
			output("\n\n<i>“What’s the point?”</i> he replies, the faintest of shrugs rolling off his bare, mountainous shoulders. <i>“I am not challenged by you.");
			if(flags["SG_DEFEATED_PC"] != undefined) output(" You do not learn from your defeats. Or worse - you want me to defeat you, because that excites you. In either case, there is little honor in fighting such an opponent.");
			output("”</i> He flicks a ridged eyebrow at you. <i>“If you have genuine interest in bettering yourself, I will train you, as I would a vassal. But it has a cost.");
			if(flags["SG_DEFEATED_PC"] != undefined) output(" You know what it is.");
			output("”</i> He shifts against the snow. <i>“Otherwise, leave me to my meditation.”</i>");
			//[Spar] [Challenge] [Leave]
			clearMenu();
			addButton(0,"Spar",sparSGBro0Honor);
			addButton(1,"Challenge",challengeHonor0SG);
			addButton(4,"Leave",honor0LeaveSG);
		}
		//Honor 2
		else if(stormguardHonor() == 2)
		{
			output("\n\n<i>“I have been waiting for you,”</i> rumbles ");
			if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
			else output("the storm lancer");
			output(", grinning fiercely. <i>“Paring my skills to the finest point, meditating upon what you have shown me in battle whilst buried in the purest freeze. All so that I may distinguish myself against the greatest test my reward has yet provided for me.”</i> He rises up from his frosty blanket like a submarine breaking the ice. <i>“Fight me, " + pc.mf("great warrior","impossible valkyrie") + "! My honor calls for it!”</i>");
			//Clear "last time" tracking for things
			flags["SG_LAST_ENC"] = 0;
			clearMenu();
			//[Fight] [Refuse]
			addButton(0,"Fight",honor2FightoRighto);
			addButton(1,"Refuse",honor2Refuse);
		}
	}
}
public function stormguardPregIntro():void
{
	author("Maye");
	//Preg by Win
	if (sgPregByWin())
	{
		output("\n\n<i>“I have been waiting for you,”</i> rumbles Gel Zon, grinning fiercely. <i>“Honing my skills to the finest point, meditating upon what you have shown me in battle whilst buried in the purest freeze. All so that I may distinguish myself against the greatest test my reward has yet provided for me.”</i> He rises up from his frosty blanket like a submarine breaking the ice.");
		output("\n\nGel Zon stops, suddenly noticing your swollen belly.");
		//First meeting each preg:
		if (flags["SG_PREG_MET"] != 1)
		{
			output(" <i>“You are with child,”</i> he states.");
			output("\n\n<i>“It’s yours,”</i> you say.");
			output("\n\nBeyond all expectations, the man blushes.");
			output("\n\nHe stays silent, seemingly in contemplation as his cheeks burn bright red.");
			output("\n\n<i>“It is an honor to have served as stud for such a mighty " + pc.mf("warrior","valkyrie") + ",”</i> he admits. <i>“Our child will be a warrior of legend.”</i>");
			flags["SG_PREG_MET"] = 1;
		}
		output("\n\n<i>“I will not fight the mother who carries my child. Leave, unless you have something to say.”</i>");
		//[Body Worship] [Leave]
		clearMenu();
		addButton(0,"BodyWorship",gelZonWorshipsYouCauseUrBetterThanHim,undefined,"Body Worship","Have him worship your body.");
		addButton(1,"Leave",mainGameMenu);
	}
	else
	{
		//Honor 2
		if (stormguardHonor() == 2)
		{
			output("\n\n<i>“I have been waiting for you,”</i> rumbles");
			if (flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
			else output(" the cudarian storm lancer");
			output(", grinning fiercely. <i>“Honing my skills to the finest point, meditating upon what you have shown me in battle whilst buried in the purest freeze. All so that I may distinguish myself against the greatest test my reward has yet provided for me.”</i> He rises up from his frosty blanket like a submarine breaking the ice.");

			output("\n\n");
			if (flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
			else output("The cudarian storm lancer");
			output(" stops, suddenly noticing your swollen belly.");
			//First meeting each preg:
			if (flags["SG_PREG_MET"] != 1)
			{
				output(" <i>“You are with child,”</i> he grins. <i>“I take it my seed took.”</i>");
				output("\n\n<i>“It’s yours,”</i> you say.");
				output("\n\nBeyond all expectations, the man blushes.");
				output("\n\nHe stays silent, seemingly in contemplation as his cheeks burn bright red.");
				output("\n\n<i>“Hah! It is an honor to have served as stud for such a mighty " + pc.mf("warrior","valkyrie") + ",”</i> he laughs. <i>“Our child will be a warrior of legend.”</i>");
				flags["SG_PREG_MET"] = 1;
			}
		}
		//Honor 1
		else if (stormguardHonor() == 1)
		{
			output("\n\n<i>“You return,”</i> ");
			if (flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
			else output(" the cudarian storm lancer");
			output(" states. Noticing your swollen belly, he grins.");
			//First meeting each preg:
			if (flags["SG_PREG_MET"] != 1)
			{
				output(" <i>“You are with child. I take it my seed took.”</i>");
				output("\n\n<i>“It’s yours,”</i> you say.");
				output("\n\nBeyond all expectations, the man blushes.");
				output("\n\nHe nods. <i>“You are a fine warrior outlander, our child will be strong.”</i>");
				flags["SG_PREG_MET"] = 1;
			}
		}
		//Honor 0
		else if (stormguardHonor() == 0)
		{
		output("\n\n");
		if (flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("The cudarian storm lancer");
		output(" pays you little regard. Only after several minutes does he turn and look at you, finally noticing your swollen belly.");
		//First meeting each preg:
			if (flags["SG_PREG_MET"] != 1)
			{
				output(" <i>“You are with child,”</i> he rumbles. <i>“I take it my seed took.”</i>");
				output("\n\n<i>“It’s yours,”</i> you say.");
				output("\n\n<i>“Finally get what you wanted outlander?”</i> he scoffs. <i>“What a poor excuse for a fighter. It’s almost like you were losing on purpose. Hopefully, my child proves stronger.”</i>");
				flags["SG_PREG_MET"] = 1;
			}
		}
		//Merge
		output("\n\nHe stays silent, seemingly in contemplation.");
		output("\n\n<i>“I will not fight the mother who carries my child. Leave, unless you have something to say.”</i>");
		//[Service Him][Leave]
		clearMenu();
		addButton(0,"Service",worshipStormguardCuzHeBetterThanU,undefined,"Service Him","Service the stud who bred you.");
		addButton(1,"Leave",mainGameMenu);
	}
}

//No
//Tooltip: Refuse his offer of battle.
public function noSnowRapeForMeThanks():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	output("<i>“You do not know of honor, then,”</i> the storm lancer sighs in a long plume of condensation. He stares fixedly out over the hills. <i>“Disappointing. The wait for a true test continues.”</i>");
	output("\n\nSnow and frost has begun to settle on him again by the time you’ve turned your attention back to the path ahead.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fight
//Tooltip: Accept his offer of battle.
public function fightSnowRapeMan():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	if(pc.isBimbo()) output("<i>“So you’re saying there’ll definitely be some snugglings afterward?”</i> you query. <i>“Alright! Heck yeah, I’m honorable!”</i> You put your hands in the air and bounce up and down. <i>“Honor! Woo! Hurray for that thing!”</i>");
	else if(pc.isBro()) output("<i>“Shucks bro, it won’t even be a contest,”</i> you chuckle. <i>“But sure, I’m up for wrastlin’ a bit.”</i>");
	else if(pc.isNice()) output("<i>“Honor?”</i> You brandish your [pc.weapon] with a challenging, confident smile. <i>“I shall show you honor and then some!”</i>");
	else output("<i>“I know how to kick your stony ass,”</i> you reply, with an arch raise of the eyebrow. <i>“They’re the same, right?”</i>");

	output("\n\nThe smile on the storm lancer’s broad lips deepens - but he says nothing as he ponderously rises, powdery snow raining down from his frame. He clicks his tongue, and from out of the drift rises sleek, white armor, which moves into him from behind, clicking sleekly into place. Off its back he takes off a brass plated spear-like device, and a heavy-looking pistol. You can’t help but notice that between where those two weapons were housed is a cylindrical jet pack module.");
	output("\n\n<i>“So then, honorable challenger,”</i> rumbles the cundarian, chest heaving with battle lust beneath the armor that clads him everywhere except his head, <i>“defend yourself!”</i>");
	output("\n\nIt might have been slightly optimistic to think he was going to fight you dressed only in his undies...");

	//Go to fight
	stormguardFightPrep();
}

//Honor 1
//Fight
public function honor1Fight():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	output("You answer his question by silently drawing your [pc.weapon].");
	output("\n\nThe smile on the storm lancer’s broad lips deepens - but he says nothing as he ponderously rises, powdery snow raining down from his frame. He clicks his tongue, and from out of the drift rises sleek, white armor, which moves into him from behind before clicking sleekly into place. Off its back he takes off a brass plated spear-like device, and a heavy-looking pistol. You can’t help but notice that between where those two weapons were housed is a cylindrical jet pack module.");
	output("\n\n<i>“So then, honorable challenger,”</i> rumbles the cundarian, chest heaving with battle lust beneath the armor that clads him everywhere except his head, <i>“defend yourself!”</i>");
	processTime(1);
	stormguardFightPrep();
}

//Refuse
public function refuseMoreHonor1():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	output("<i>“Disappointing,”</i> the storm lancer sighs in a long plume of condensation. He stares fixedly out over the hills. <i>“The wait for a true test continues.”</i>");
	output("\n\nSnow and frost have begun to settle on him again by the time you’ve turned your attention back to the path ahead.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Honor 0;
//Leave
public function honor0LeaveSG():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	output("Snow and frost have already settled on his face by the time you’ve picked out the path ahead.");
	flags["SG_LAST_ENC"] = 0;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Challenge
//Auto-succeeds if PC sparred with him last time. Otherwise high diff roll against Intelligence
public function challengeHonor0SG():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	if(flags["SG_LAST_ENC"] == 1 || pc.intelligence()/2 + rand(20) + 1 > 35)
	{	
		//Spared
		if(flags["SG_LAST_ENC"] == 1)
		{
			output("<i>“I trained with you and did what you asked,”</i> you snap. <i>“The least you could do is let me put it into practice.”</i>");
			output("\n\n<i>“That is fair, I suppose,”</i> the cundarian rumbles. A moment later he ponderously rises, powdery snow raining down from his frame. He clicks his tongue, and from out of the drift rises sleek, white armor, which moves into him from behind before clicking sleekly into place. Off its back he takes off a brass plated spear-like device, and a heavy-looking pistol. Between where those two weapons were housed is a cylindrical jet pack module.");
			output("\n\n<i>“Very well, vassal - show me what you’ve learned!”</i>");
		}
		else
		{
			output("<i>“How many challengers do you even get out here?”</i> you query. <i>“A fight and a fuck’ll be more interesting that just sitting there for another ten hours, if you ask me.”</i>");
			output("\n\n<i>“Solace training does get a bit lonely,”</i> the cundarian admits with a long, cloudy sigh. A moment later he ponderously rises, powdery snow raining down from his frame. He clicks his tongue, and from out of the drift rises sleek, white armor, which moves into him from behind before clicking sleekly into place. Off its back he takes off a brass plated spear-like device, and a heavy-looking pistol. Between where those two weapons were housed is a cylindrical jet pack module.");
			output("\n\n<i>“Very well, challenger - let us fight!”</i>");
		}
		flags["SG_LAST_ENC"] = 0;
		stormguardFightPrep();
		return;
	}
	else
	{
		output("<i>“C’mon you big lunk, fight me!”</i> you say. <i>“What kind of warrior just lies there and lets challengers walk on past?”</i>");
		output("\n\n<i>“The kind that places greater value in meditation and training than in the bleating of " + pc.mf("whelps","whores") + ",”</i> the cundarian replies, unruffled. <i>“Run along.”</i>");
		output("\n\nSnow and frost have already settled on his face by the time you pick out the path ahead.");
		flags["SG_LAST_ENC"] = 0;
	}
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Spar
public function sparSGBro0Honor():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	flags["SG_LAST_ENC"] = 1;
	output("<i>“Very well,”</i> rumbles ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(". Ice cracks and splinters as he lumbers to his hooves like a hunk of the frozen landscape come to life. <i>“We shall train. Be warned, though - I am not a lenient teacher.”</i>");

	output("\n\nHe’s not wrong. First he insists you strip to the waist like him");
	if(!pc.isChestExposedByUpperUndergarment()) output(", your upper body girdled only in your [pc.upperUndergarment]");
	output(", only letting you retain your heat belt on sufferance. Then you spar, him with his brass-plated storm lance and you with your [pc.meleeWeapon], snow whipping into your face as you circle, weapons thumping against each other with numbing force until sweat oils your [pc.arms] and you are heaving handfuls of cold air into your burning lungs.");
	output("\n\nOnly when you are incapable of parrying his spear does the cundarian stop, slouching down into the snow next to you and gruffly giving you instruction; where you should put your [pc.feet], how to position your guard and when best to strike, drawing diagrams in the snow with a finger. As soon as you get your breath back he has you back at it, relentlessly attacking your weakest areas until you are instinctively protecting them.");
	output("\n\nYou do this for an hour or more - until you are feeling utterly exhausted and the freezing cold is more a blessing than a curse. Apparently and disgustingly unaffected by the rigorous training, ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the big cundarian");
	output(" sticks his golden lance into a snow drift, activates the energy bubble, and then vigorously collects his payment.");

	output("\n\nYour hands clutch handfuls of melting ice as fourteen inches of thick ridge dick thrusts its way past your stretched asshole and stuffs your colon with hot mass, muscular thighs and bloated bollocks beating intently on your upraised [pc.ass]. The pressure that massive cock is putting on your ");
	if(pc.hasCock()) output("poor prostate");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("your pussy’s inner soft spots");
	output(" with each rough pump combines with the strain of taking every cubic inch of it, one incredibly intense physical experience piled on top of another.");
	pc.buttChange(chars["STORMGUARD_MALE"].cockVolume(0));

	output("\n\n<i>“This is something vassals must learn to bear as well,”</i> grunts ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(", sweat-plastered six-pack rubbing against your shoulders, fists mired in the drift either side of you. <i>“No better way of wrapping up a tough training session...”</i> He concentrates on ramming his thick girth deep into your [pc.ass] for a while, forcing harsh breath past your [pc.lips], your own heat building inescapably. <i>“...of course, ‘bear’ is such a strong word, isn’t it?”</i> He laughs coarsely, before driving into your tunnel deliberately, his ridges digging deep into those sensitive, buried areas; you moan breathlessly as ");
	if(pc.hasCock()) output("[pc.eachCock] tenses up and flumes [pc.cum] ecstatically");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("[pc.eachVagina] clenches up in wet, radiant orgasm");
	output(".");

	output("\n\n");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" pumps into you all the while, letting you have the thick lever of his dick to wrest out every spark of your wet, nerve-tingling high; you are so frazzled and weary after the last full body clench you barely feel him withdraw out of your disgracefully treated hole and, with throaty groans of his own, fountain heavy dollops of fast-setting cum all over your back and ass.");
	if(pc.hairLength > 0) output(" Your one cogent thought is that at least he doesn’t get any in your [pc.hair].");
	output(" A rough, not unsympathetic hand lands on your shoulder a few moments later.");
	pc.applyCumSoaked();

	output("\n\n<i>“You didn’t do badly, " + pc.mf("whelp","wench") + ",”</i> says the cundarian, shovelling his considerable self back into his briefs. <i>“There is no shame in losing if you work to better yourself - and that is exactly what you’re doing.”</i>");
	output("\n\nBy the time you’ve recovered, removed the whorls of cement-like cum off your skin and put your equipment back on, he is back to lying in his hollow; wide, handsome features setting beneath the frost.");

	//Slow Willpower + Physique gain of 2, reset Lust, - 90 energy
	if(pc.WQ() < 50) pc.slowStatGain("willpower",1);
	if(pc.PQ() < 75) pc.slowStatGain("physique",1);
	pc.orgasm();
	pc.energy(-90);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Honor 2
//Refuse
public function honor2Refuse():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	output("The cundarian’s fists curl up and his face hardens when you turn him down - but he nods curtly.");
	output("\n\n<i>“It is your right to turn down a lesser challenge,”</i> he says, sitting himself down again with a heavy crunch. <i>“I only hope one day, you will let me prove myself to you.”</i>");
	output("\n\nSnow and frost have already settled on his face by the time you leave him behind.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fight
public function honor2FightoRighto():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	if(pc.isNice()) output("<i>“Let’s see what you got then, champ!”</i> you laugh, drawing your [pc.weapon] with a flourish.");
	else if(pc.isMischievous()) output("<i>“It’s always pretty funny watching you embarrass yourself,”</i> you smirk teasingly, twirling your [pc.weapon] artfully.");
	else output("<i>“If you insist,”</i> you say without a flicker of emotion, snapping out your [pc.weapon].");

	// {merge}
	output("\n\nThe smile on the storm lancer’s broad lips deepens. He clicks his tongue, and from out of the drift rises sleek, white armor, which moves into him from behind before clicking sleekly into place. Off its back he takes off his lance and heavy pistol; as ever, you can see the rise of his cylindrical jet pack module on his back.");
	output("\n\n<i>“So then, honored challenger,”</i> rumbles the cundarian, chest heaving with battle lust beneath the armor that clads him everywhere except his head, <i>“defend yourself!”</i>");
	stormguardFightPrep();
}

//Spanked
public function spankedSGFightIntro():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	output("Holding your gaze, he clicks his tongue, and from out of the drift rises sleek, white armor, which moves into him from behind before clicking sleekly into place. Off its back he takes off his lance and heavy pistol; As ever, you can see the rise of his cylindrical jet pack module on his back.");
	output("\n\n<i>“So then, sadistic " + pc.mf("hellion","brute") + ",”</i> rumbles the cundarian, chest heaving with battle lust beneath the armor that clads him everywhere except his head, <i>“defend yourself!”</i>");
	stormguardFightPrep();
}

//Refuse
public function refuseSpankedSGFight():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	output("The cundarian’s fists curl up and his face hardens. You can see it takes every inch of his willpower to not simply fly at you anyway - but he does accept it.");
	output("\n\n<i>“Even sadists retain the right to turn down battle,”</i> he growls. <i>“But mark my words, [pc.race] - I will take back my pride from out of your hide one of these days.”</i>");
	output("\n\nSnow and frost have already settled on his scowling features by the time you leave him behind.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function stormguardFightPrep():void
{
	var stormy:Creature = new StormguardMale();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(stormy);
	CombatManager.victoryScene(pcWinsVsSG);
	CombatManager.lossScene(losesToSG);
	CombatManager.displayLocation(flags["MET_GEL_ZON"] != undefined ? "GEL ZON" : "STORMLANCER");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}
//APPLY SEXUAL LIKES. LIKES TRAPS AND TINY DIX

//PC Wins
public function pcWinsVsSG():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	IncrementFlag("SG_CON_WINS");
	if(!enemy.hasStatusEffect("Flying")) 
	{
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("The storm lancer");
		output(" gasps and almost falls, supporting himself with his spear. Gritting his teeth he tries to stand and charge at you again - and succeeds only in slipping, collapsing with a mighty thump into the muddy snow. You’ve won!");
	}
	else
	{
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("The storm lancer");
		output(" recoils back into the air. Too dazed to properly pilot himself anymore, the blue flame dances around like a mosquito. Sagging in his harness, he brings himself down and collapses with a mighty thump into the muddy snow. You’ve won!");
		
		enemy.clearFlightEffects();
	}
	if(flags["MET_STORMGUARD"] == 1 || stormguardHonor() == 1)
	{
		output("\n\n<i>“Very well fought, challenger,”</i> the cundarian says with a wry grimace, elbowing himself up. Heated yellow eyes roam across your body with grudging admiration. <i>“I shall take the humility earned here today and invest it into bettering myself.”</i> A long plume of condensation rises up from his head. His armor retracts and glides backward, leaving him bare from the waist up. <i>“Do as you will with me.”</i>");
	}
	else if(stormguardHonor() == 2)
	{
		output("\n\n<i>“Blast everything!”</i> the cundarian thumps the ground with an armored fist in frustration. <i>“Even now I cannot defeat you.”</i> He sighs, long and hard, condensation billowing out over his head. <i>“But I am better, yes, much better for having battled you. There is little shame in losing to such an opponent, as long as one learns from it.”</i> He looks up at you with total admiration. His armor retracts and glides backward, leaving him bare from the waist up. <i>“Do as you will with me, honored warrior.”</i>");
	}
	else
	{
		output("\n\n<i>“Hah!”</i> the cundarian barks with laughter as he elbows himself up to look at you. There’s humor and maybe even grudging respect in his heated yellow eyes. <i>“That’s what I get for arrogance. It is good that I inspired you to come back and defeat me, at least.”</i> A long plume of condensation rises up from his head, and his armor retracts and glides backward, leaving him bare from the waist up. <i>“Do as you will with me - you have earned it.”</i>");
	}
	//Display win fuck options
	output("\n\n");
	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(0,"Buttfuck",fuckTheStormguardsButt,undefined,"Buttfuck","His butt. Fuck it.");
	else if(pc.hasCock()) addDisabledButton(0,"Buttfuck","Buttfuck","You need a not gigantically sized dick to do this.");
	else addDisabledButton(0,"Buttfuck","Buttfuck","You need a penis for this.");
	addButton(1,"Spank",spankDatTank,undefined,"Spank","Dole out the standard punishment for being a bad boy.");
	if(pc.hasVagina()) addButton(2,"Cunnilingus",NTWinSceneForStormLancah,undefined,"Cunnilingus","Force him to eat you out.");
	else addDisabledButton(2,"Cunnilingus","Cunnilingus","You need a vagina for this.");
	if(pc.hasCock())
	{
		var canthroatfuck:Boolean = false;
		for(var x:int = 0; x < pc.cockTotal(); x++)
		{
			if(pc.cockVolume(x) >= 25 && pc.cockVolume(x) <= 300) canthroatfuck = true;
		}
		if(canthroatfuck) addButton(3,"Throatfuck",penisRouter,[stormlancerThroatfuck,300,false,25],"Throatfuck","Tear his noisehole a new one!");
		else if(pc.smallestCockVolume() > 300) addDisabledButton(3,"Throatfuck","Throatfuck","Easy there, wanna put him in his place, not tear his jaw off!");
		else addDisabledButton(3,"Throatfuck","Throatfuck","You would, but you don’t think you’re quite large enough for it to really have the effect you want.");
	}
	else addDisabledButton(3,"Throatfuck","Throatfuck","You need a penis for this.");
	if (pc.hasVagina() && pc.totalVaginas() > pc.pluggedVaginas() && flags["MET_GEL_ZON"] != undefined && flags["SG_CON_WINS"] >= 5) addButton(4,"Dominate",vaginaRouter,[femdomSGOhhhhYeeeeaaahhh,enemy.cockVolume(0),0,0,true],"Dominate","Ride his dick until he passes out.");
	else if (!pc.hasVagina() || pc.pluggedVaginas() >= pc.totalVaginas()) addDisabledButton(4,"Dominate","Dominate","You need an unplugged vagina for this.");
	else if (flags["SG_CON_WINS"] < 5) addDisabledButton(4,"Dominate","Dominate","You need to beat him into submission more.");
	else addDisabledButton(4,"Dominate","Dominate","This might be more effective if you know more about him.");

	addButton(14,"Leave",pcWinsVsSGLeave);
}
public function pcWinsVsSGLeave():void
{
	stormguardHonor(1);
	CombatManager.genericVictory();
}

//PC Loses
public function losesToSG():void
{
	clearOutput();
	showStormguard();
	author("Nonesuch");
	flags["SG_CON_WINS"] == undefined;
	output("Overwhelmed, you fall to the cold ground, putting your hands up to signal an end to the battle. There’s a click of weapons being holstered and armor retracting, followed by the heavy crunch of hooves in snow stalking towards you. ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The storm lancer");
	output(" looms over you, bare-chested.");

	if(flags["MET_STORMGUARD"] == 1 || stormguardHonor() == 1) 
	{
		output("\n\n<i>“There’s no shame in agreeing to battle out here and then losing,”</i> he booms, grinning broadly. <i>“So long as you learn from it.”</i> He spends a long moment considering you with molten eyes, biting his upper lip. <i>“But defeat means nothing if there’s no consequence for it.");
		//Clothed:
		if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(" So take it off, sweet stuff.");
		output("”</i>");
	}
	else if(stormguardHonor() == 0)
	{
		output("\n\n<i>“So we battle again, and again I beat you,”</i> he says with an exasperated, irritated snap of his hand. <i>“Because you do not learn. Or worse, because you like it. Is that it? Does me beating you into submission arouse you? I know that is the way, for some of you decadent core-worlders.”</i> He snorts, shaking his head. <i>“But I get nothing out of it except carnal satisfaction. Which you are now going to amply provide.”</i>");
	}
	else
	{
		output("\n\n<i>“YES!”</i> he cries, raising his fists and roaring out his victory to the dour skies above. <i>“A truly worthy opponent, finally defeated and lying at my feet. Heed me, fierce elements. Heed Gel Zon the Mighty!”</i> He drinks it in, beaming broadly, fierce lust dancing in his eyes. <i>“I have longed for this moment, " + pc.mf("hard-fighting warrior","fiery valkyrie") + ". I am going to enjoy every moment of this!”</i>");
		//Set SLKnowName to 1
		flags["MET_GEL_ZON"] = 1;
	}
	//Go to loss fucks
	clearMenu();
	addButton(0,"Next",lossScenesForStormguard);
}

//Win Scenes
//Spank
//Tooltip: Dole out the standard punishment for being a bad boy.
public function spankDatTank():void
{
	clearOutput();
	showStormguard(true);
	author("Nonesuch");
	output("Without letting a flicker of emotion pass across your face, you settle your [pc.legs] down on the snow");
	if(!pc.isGoo() && !pc.isNaga()) output(", splaying out your lap");
	else
	{
		output(", creating a nice little mound of ");
		if(pc.isNaga()) output("leathery scales");
		else output("goo");
		output(" in front of you");
	}
	output(".");
	//First time: 
	if(flags["SPANKED_SG_COUNT"] == undefined) 
	{
		output(" The storm lancer stares at you in total incomprehension. You return his gaze coolly, and pat your [pc.thighs] meaningfully.");
		output("\n\n<i>“You cannot be serious,”</i> he groans, horror loosening his jaw.");
		output("\n\n<i>“Take your pants off, and lay yourself right here,”</i> you reply mercilessly. <i>“It’s for your own good.”</i>");
	}
	else
	{
		output("\n\n<i>“No, come on!”</i> roars the storm lancer, watching you perform the ritual with dawning understanding. <i>“Why do you feel the need to keep humiliating me like this?”</i>");
		output("\n\n<i>“Take your pants off, and lay yourself right here,”</i> you reply mercilessly. <i>“You know it’s for your own good.”</i>");
	}
	output("\n\nThe cundarian grits his teeth and shoots a look across the distant hills. Booking it clearly occurs to him - but ultimately the dishonor of not facing up to his punishment beats the humiliation of it. Tersely he unbuckles his armored shorts and, fourteen inch ridge-dick swinging, stalks across. He glares at you with jutted jaw and brilliant yellow insolence before stretching himself across your ");
	if(pc.legCount > 1) output("splayed [pc.thighs]");
	else output("pseudo-lap");
	output(". You remain placid; as deeply enjoyable as forcing this proud lunk to do this is, you know it’s important to retain a facade of cool authority.");
	output("\n\nHe’s got an ass that speaks of plenty of time spent working those glutes and biceps; long but incredibly beefy with some nice roundness up top, stallion-like. You brush his thick, unwieldy tail to one side and admire all that dense, slate-blue goodness weighed down upon you for a moment, thick, warm cock subserviently pressed against your [pc.legs]. When you brush your hand down one flank he tenses up; you withdraw your hand for one long moment before continuing.");

	if(flags["SPANKED_SG_COUNT"] == undefined)
	{
		output("\n\n<i>“What’s your name, boy?”</i>");
		output("\n\nSilence. Your raise your palm and slam it into one blue buttock, sending the barest of ripples up his muscular back.");
		output("\n\n<i>“Ow! My name is Gel Zon,”</i> he mutters resentfully. Without missing a beat you spank his other cheek with the same amount of force. Tentacles jerk spasmodically.");
		output("\n\n<i>“Louder. What is your name?”</i>");
		output("\n\n<i>“My name is Gel Zon!”</i> he cries out.");
		output("\n\n<i>“Good,”</i> you smirk. <i>“Now then, Gel Zon - why are you being punished?”</i>");
		output("\n\n<i>“Because I lost?”</i> he replies with a mixture of exasperation and tentativeness. Your palm slaps into his brawny buttock.");
		output("\n\n<i>“For messing around outside in the snow for far too long,”</i> you correct. You raise your hand. <i>“Say it!”</i>");
		output("\n\n<i>“For... being outside in the snow for far too long,”</i> comes the grumbling echo.");
		output("\n\nSmack.");
		output("\n\n<i>“For picking fights with " + pc.mf("bigger boys","girls") + ".”</i>");
		output("\n\n<i>“For picking fights with " + pc.mf("bigger boys","girls") + ".”</i>");
		output("\n\nSpank.");
		output("\n\n<i>“And then getting your sorry ass whupped by said " + pc.mf("bigger boy","girl") + ".”</i>");
		output("\n\n<i>“And then... getting my ass beaten by you.”</i>");
		output("\n\nSmack.");
		output("\n\nYou give him a round score of spanks, rhythmically making the brute admit to his “crimes”. You probably could stop sooner, but the process of changing the color of his big, muscular butt from grey to lavender via the flat of your hand is extremely satisfying. And this is your reward, after all!");
		output("\n\nYou give the hot brawn a teasing tap when you’re done.");
		output("\n\n<i>“I’m not going to have to do that again, am I?”</i> you inquire mildly, watching him quickly slither off your ");
		if(pc.legCount <= 1) output("pseudo-");
		output("lap and retrieve his pants.");

		output("\n\n<i>“Oh no,”</i> growls Gel Zon, humiliated anger illuminating his brilliant slit eyes. He pulls on his armored bottoms roughly, wincing slightly as he does. <i>“I assure you, that will never happen again.”</i>");
		output("\n\nYou go on your way with a big grin on your face.");
	}
	else
	{
		output("\n\n<i>“Here we are again, Gel Zon,”</i> you tut with " + pc.mf("p","m") + "aternal disapproval. You raise your hand. <i>“Why are you being punished?”</i>");
		output("\n\n<i>“For... playing around in the snow,”</i> comes the resentful mutter. You smack your palm into one blue buttock, sending the barest of ripples up his muscular back.");
		output("\n\n<i>“Good. And?”</i>");
		output("\n\nThe pause is too long for your liking, so you slap his other brawny butt-cheek harder, making him jerk.");
		output("\n\n<i>“For getting your clothes all muddy. Say it!”</i>");
		output("\n\n<i>“For getting my sacred armor all muddy.”</i>");
		output("\n\nSmack. Slap. Spank. The inherently satisfying sound of a big, muscular butt getting its color changed from slate to lavender is muffled by the snow, but still rings surely around the wintery landscape as you carry on, making the brute admit to his “crimes” and then administering the punishment.");
		output("\n\n<i>“Who’s ass does this belong to?”</i> is your last question.");
		output("\n\n<i>“You. It belongs to you,”</i> comes the woozy reply. You give his well-tanned brawn a teasing tap and let him withdraw.");
		output("\n\n<i>“I’m not going to have to do that again, am I?”</i> you inquire mildly, watching him quickly slither off your ");
		if(pc.legCount <= 1) output("pseudo-");
		output("lap and retrieve his pants.");
		output("\n\n<i>“I assure you,”</i> growls Gel Zon, humiliated anger illuminating his brilliant slit eyes. He pulls on his armored bottoms roughly, wincing slightly as he does. <i>“I will be doing everything in my power to make sure that you don’t.”</i>");
		output("\n\nYou go on your way with a big grin on your face.");
	}
	// +Lust. Storm Lancer set to improved form for next encounter regardless of honor status. Set SLKnowName to 1
	output("\n\n");
	processTime(15);
	pc.changeLust(10);
	flags["MET_GEL_ZON"] = 1;
	IncrementFlag("SPANKED_SG_COUNT");
	//Sort... seen is dick for appearance stuff
	IncrementFlag("SEXED_SG_MALE");
	flags["SG_LAST_ENC"] = 2;
	stormguardHonor(1);
	CombatManager.genericVictory();
}

//Buttfuck
//Tooltip: His butt. Fuck it.
//No can do Tooltip: You need a not gigantically sized dick to do this.
public function fuckTheStormguardsButt():void
{
	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();

	clearOutput();
	showStormguard(true);
	author("Nonesuch");
	if(flags["SG_LANCE_SEEN"] == undefined)
	{
		output("<i>“Can you do anything about...”</i> you gesture at the blizzard, the bleak landscape and all the other elements of Uveto that do not really lend themselves to al fresco sex. After a moment, ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output(" silently plucks the spear from his armor and rams it into the perma-frost. From the pommel it emanates an energy bubble, a thin golden wall which encompasses him and you, filled with the pleasant warmth of a spring day.");
		output("\n\n<i>“Nice!”</i> you remark, admiring the snowflakes melting against the membrane inches away from your [pc.face]. <i>“Now take your pants off, there’s a good boy.”</i>");
	}
	else output("<i>“Do the thing with your lance,”</i> you grin. <i>“And then take your pants off, there’s a good boy.”</i>");
	output("\n\nYour eyes are naturally drawn to his ass as he crunches around in the snow, discarding his shiny whities; big and fleshy under the swish of his thick tail, layered and padded with rigorously trained and tempered muscle, with an understated pertness giving a bit of roundness. Fervent arousal courses down to your [pc.groin] at the thought of getting to plough it deep into that stallion-like backside.");

	if(stormguardHonor() == 2) 
	{
		output("\n\nFrom a single glance at your semi-erect [pc.cockNounSimple " + x + "] the slate-blue tentacled brute knows what is expected of him, and thumps down naked in the snow without a word. He still does it with that air of stoical, stiff-lipped acceptance - although you can’t help but read a certain puppyish eagerness in his heavy movements. However much he might enjoy rolling over for a glorious warrior like you, he still needs that indomitable attitude on some level.");
	}
	else
	{
		output("\n\nThe cesious avatar of pure machismo takes a single glance at your semi-erect [pc.cockNounSimple " + x + "] and ");
		if(pc.cocks[x].cLength() < 7) output("with a small smirk");
		else output("with an apprehensive grimace");
		output(" thumps down naked in the snow without a word from you.");
	}
	output("\n\nHand on his rounded shoulder, you spread his obdurate cheeks and examine his flared, puffy rose. There is no lubricant at hand - the amusing thought of sticking an icicle up there is regretfully discarded - however... you stick two fingers up him, and despite an uneasy murmur vibrating through your digits you find you’re able to pierce him and feel his welcoming, warm tightness with a great deal of ease.");

	if(stormguardHonor() != 2) 
	{
		output("\n\n<i>“You’ve done this before, haven’t you Mr. Noble Warrior?”</i> you laugh quietly. You stick your [pc.cock " + x + "] between his big cheeks, using the delicious, smooth texture to rub bulging lust into it, stroking his back and head-tentacles with mocking fondness. <i>“Go on, tell me - how many other " + pc.mf("guys","futa") + " have gotten to pack your fudge as a result of you biting off more than you could chew? I won’t tell.”</i>");
		output("\n\n<i>“Storm lancers must be ready for... all forms of physical hardship,”</i> comes the grumbling reply. <i>“Get on with it.”</i>");
	}
	else
	{
		output("\n\n<i>“Not exactly a surprise you’re ready to go,”</i> you smirk. You stick your [pc.cock " + x + "] between his big cheeks, using the delicious, smooth texture to rub bulging lust into it, stroking his back and head-tentacles with mocking fondness. <i>“You enjoy this part just as much as the fighting, don’t you?”</i>");
		output("\n\n<i>“If I try my hardest against an honored opponent and fail, getting taken by them afterwards is not so bad,”</i> comes the soft, rumbling reply. <i>“Feels... right.”</i>");
	}
	output("\n\nYou draw your burningly erect length back and then into his opened hole, using gentle sawing motions to get your [pc.cockHead " + x + "] beyond the puffy ring of his anus, clutching his ");
	if(pc.tallness >= 6 * 12) output("shoulders");
	else output("sides");
	output(" for support. The task is aided by the gentle huffs and grunts you draw out of the cundarian, his sweat-glossed back clenching up each time you introduce a little more of your cock into the sweet tightness of his tunnel; your ardour increasing with each gruff sound you manage to coax out of him, you sink yourself further and further into him with escalating bucks of your [pc.hips].");
	output("\n\nFlurries of snow whip angrily at the energy shield that surrounds you all the while your satisfying push into the cundarian’s tough but succulent squeeze goes on, pleasure radiating back down your [pc.cock " + x + "]");
	if(pc.balls > 0) output(" and tightening your [pc.balls] with the anticipation of pulsating orgasm");
	output(".");
	pc.cockChange();

	//Small/average dick
	if(pc.cocks[x].cLength() < 7)
	{
		output("\n\nIt doesn’t take much for you to be mired up to your ");
		if(pc.balls == 0) output("hips");
		else output("[pc.sack]");
		output(" in his solid backside, enjoying how all that training of his makes him a [pc.skin]-tingling clutch all the way down. Beyond some deep exhalations and grunts, ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output(" is fairly silent and still as you begin to clap into his supplicant, naked form fervently, directed by the lust coursing through your prick. You’re pretty much just a buttplug to this oversized barbarian.");
		//Size >5’1”</i>: 
		if(pc.tallness < 5*12+1) output(" Not only that, but you practically have to stand on his hooves in order to reach him. The fact that a " + pc.mf("imp","pixie") + " like you has bested him and is now having a fine time pounding his backside is undoubtedly doubly humiliating for him; it’s a thought that increases the fervency with which you do it.");
		if(pc.cockTotal() == 2) output(" Your other cock rubs");
		else if(pc.cockTotal() > 2) output(" Your other cocks rub");
		if(pc.cockTotal() > 1) output(" against his taint, delicious but frustrating pleasure that leaves you with the dizzy regret that he only has the one hole.");

		output("\n\nYou let your hand swing beneath his thick thighs, give his heavy, ridge-encrusted cock a teasing stroke. He’s semi-erect but hardly bursting at the seams; not surprising, given you’re not exactly stretching him out. But this little tryst is all about your pleasure, isn’t it? You’re the conquering hero here, and reaching over this vainglorious warrior and sinking deep into his warm clench over and over, this big looming winter-beast you’ve tamed with your own hand, is magnificent fun.");

		output("\n\nYou groan as orgasm sweeps over you, tightening your ");
		if(pc.balls > 0) output("[pc.balls] and ");
		output("your frame up until your [pc.cockHead " + x + "] dilates and flumes [pc.cum] deep into his rectum with delightful, clenching pulses.");
		if(pc.cumQ() < 300) output(" You clap your [pc.hips] into his hefty backside until you have worked out every last delightful, juicy drop. You rest against his smooth, pebbly bulk when you are done, enjoying the tingling afterglow.");
		else 
		{
			output(" He murmurs with disquiet and then cries out as your orgasm goes on and on, gushing your [pc.cumFlavor] seed out inside him until it spurts out around your throbbing dick.");
			output("\n\n<i>“Why would someone so small contain such a stupid amount of slime?”</i> he roars. <i>“Decadent core-worlders!”</i>");

			if(flags["SG_DEFEATED_PC"] != undefined) output("\n\n<i>“Really, azul nino?”</i> you grunt, continuing to plough jizz into his thoroughly creamed back passage. <i>“YOU are complaining to ME about MY cum?”</i>");
			output("\n\nYou rest against his smooth, pebbling bulk when you are finally done and [pc.cum] is leaking copiously down both of his goaty legs, enjoying the tingling afterglow.");
		}
		output("\n\n<i>“You have gotten your satisfaction, then?”</i> he rasps. He rises up and fetches his pants, looking at you sidelong with his brilliant yellow eyes, dick and tentacles swinging. <i>“Good. Until next time - ");
		if(stormguardHonor() == 2) output("fabled warrior");
		else if(stormguardHonor() == 1) output("warrior");
		else output(pc.mf("whelp","wench"));
		output(".”</i>");

		output("\n\nHe lets you keep the storm lance and its bubble, settling himself back down into the snow as you fetch your things - it winks out and the howling gale pushes into your face as soon as you click your heat belt back on. Frost has begun to settle back on the storm lancer’s features as you take your leave.\n\n");
		enemy.loadInAss(pc);
		processTime(25);
		pc.orgasm();
		CombatManager.genericVictory();
		stormguardHonor(1);
	}
	//Big dick
	else
	{
		output("\n\nIt takes some time for you to fit your entire length into him; he clutches the snow, groaning and barking gutturally the more you spread his tush with your thick, firm meat. Your ");
		if(pc.balls == 0) output("hips");
		else output("[pc.balls]");
		output(" do eventually rest against his solid backside though, and oh my - you allow yourself a gratified, throaty sigh of your own - doesn’t that feel good, your whole giant fist-like cock mired in hot, muscle-rippled barbarian ass. Slowly you draw out and drive yourself up to the hilt again, and when you’re sure he can take it, pick up a steady gorgeous rhythm, exulting in how you’ve reshaped his insides to act as your very own tight, generous cocksleeve.");

		output("\n\n");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon’s");
		else output("The storm lancer’s");
		output(" breath is coming as hot and heavy as your own, you notice. You let your hand swing beneath his thick thighs, give his heavy, ridge-encrusted cock a teasing stroke, and find that it’s bulgingly erect, becoming hard as knotted oak when you shove yourself inwards to your fullest extent. Your huge dick pressing into his inner sex, and his own self-denial, are evidently having an effect.");
		output("\n\n<i>“You enjoying that, boy?”</i> you " + pc.mf("husk","purr") + ", coiling his dick with flicks of the wrist. <i>“Are you?”</i> You receive nothing but a rumbling, catching groan in response. You exult in your conquest, this vainglorious beast you’ve tamed with your own hand, increasing the fervency with which you pound his big, tough backside. You could have a say over whether he cums his brains out here or not...");

		processTime(5);
		pc.changeLust(10);
		//[Let Him] [Deny]
		clearMenu();
		addButton(0,"Let Him",letSGCum);
		addButton(1,"Deny",denySGOrgasm);
	}
	IncrementFlag("SG_LANCE_SEEN");
	IncrementFlag("SEXED_SG_MALE");
	//Honor changes in sub-scenes for bigdicks
}

public function denySGOrgasm():void
{
	clearOutput();
	showStormguard(true);
	author("Nonesuch");
	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You jerk his hard meat, fingers brushing over his bulbous head, tantalizing him with ecstatic release... and then you pull back and concentrate on reaching your own high, groan as orgasm sweeps over you, tightening your ");
	if(pc.balls > 0) output("[pc.balls] and ");
	output("your frame up until your [pc.cockHead " + x + "] dilates and flumes [pc.cum] deep into his rectum with delightful, clenching pulses. You pump your [pc.cock " + x + "] into him until you have worked out every last delicious drop");
	if(pc.cumQ() >= 300) output(" and [pc.cumColor] fluid is spurting out around your base, you’ve packed that much into him.");

	output("\n\nSlowly you pull back out of him, relishing the slide of his tunnel across your throbbing erection, biting your lip as your [pc.cockHead " + x + "] reluctantly parts company with his ring with a delicious <i>“pop”</i>. Heavy for breath, it takes ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" some time to recover; his own chunky penis, you notice with some satisfaction, is still angrily erect.");

	output("\n\n<i>“...it is good that you did not allow me release,”</i> he manages at last, glaring at you over his shoulder with an expression somewhere between solemnity and furious lust. Every inch of his landslide of a body looks loaded with pent-up arousal. <i>“I did not earn it.”</i> He closes his brilliant eyes and exhales deeply; his dick does, at last, wilt a little. <i>“I shall take that fire and use it as fuel, train myself so that next time we meet, I shall overcome you.”</i> He opens his eyes and looks into yours fixedly. <i>“THEN I shall have my release.”</i>");
	output("\n\nHe lets you keep the storm lance and its bubble, putting his pants back on before settling himself back down into the snow as you fetch your things - it winks out and the howling gale pushes into your face as soon as you click your heat belt back on. Frost has begun to settle back on the storm lancer’s features as you take your leave.\n\n");
	processTime(25);
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
	stormguardHonor(1);
}

//Let Him
public function letSGCum():void
{
	clearOutput();
	showStormguard(true);
	author("Nonesuch");
	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You steadily jerk his hard meat, fingers brushing over his bulbous head... and when your own orgasm overtakes you, you furiously coil him, intent on making him relish the feeling of you cumming deep inside him. The cundarian’s big dick flexes powerfully in your hand, brilliant blue cum pluming over the canvas of wet, white snow, and his rough, ecstatic cries combine with your own groans as ");
	if(pc.balls > 0)
	{
		output("your [pc.balls] and ");
	}
	output("your frame tighten");
	if(pc.balls == 0) output("s");
	output(" up and then release brilliantly, surging [pc.cum] deep into his rectum with delightful, clenching pulses. You pump your [pc.cock " + x + "] into him until you have worked out every last delicious drop");
	if(pc.cumQ() >= 300) output(" and [pc.cumColor] fluid is spurting out around your base, you’ve packed that much into him");
	output(".");

	output("\n\nSlowly you pull back out of him, relishing the slide of his tunnel across your throbbing erection, biting your lip as your [pc.cockHead " + x + "] reluctantly parts company with his ring with a delicious <i>“pop”</i>. Heavy for breath, it takes ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" some time to recover; when he finally rolls over, you can see his cum has formed a generous stalagtite from his slowly-wilting penis.");

	output("\n\n<i>“...you should not have allowed me release,”</i> he growls at last. His tone and expression are cloudy, uncertain; somewhere between resentment and deep, ashamed pleasure, perhaps. Unable to look you in the eye, he stares at the generous streaks of set cum in the snow beneath him. <i>“I had not earned it.”</i>");

	output("\n\n<i>“Well, you know what us decadent core-worlders are like,”</i> you retort affably, giving him a fond pat on the bum. <i>“Wanting to make the other party feel great as well, and other such wicked notions.”</i>");
	output("\n\nHe lets you keep the storm lance and its bubble, putting his pants back on before settling himself back down into the snow as you fetch your things - it winks out and the howling gale pushes into your face as soon as you click your heat belt back on. Frost has begun to settle back on the storm lancer’s features as you take your leave.\n\n");

	processTime(25);
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
	stormguardHonor(1);
}

//Loss Scenes
public function lossScenesForStormguard():void
{
	if(pc.hasVagina() && pc.inHeat()) 
	{
		lossToSGWithHeatPussy();
		return;
	}
	clearOutput();
	showStormguard(true);
	author("Nonesuch");
	if(flags["MET_GEL_ZON"] == undefined) output("The mountainous hoofed creature");
	else output("Gel Zon");
	output(" straightens, heaves the lance from off his back and thrusts it deep into the frozen ground. With an electric hum, the device beams out a bubble of golden energy from its rounded pommel, expanding smoothly until it easily encompasses both of you. Inside the hemisphere of light it feels like a warm summer day; the snow on the ground remains, but is now a strange, chilly contrast to the dry heat of the air. Cold water beads around your hands.");
	// {Sensing the change in temperature, your heat belt winks off with a beep.}

	output("\n\n<i>“In the past, novice lancers who lost their way out here froze to death for their folly,”</i> growls the cundarian, unclasping his briefs and allowing his thick cock with its ridged underbelly to swing ponderously downwards. He stands over you, close enough that you can smell the salty tang of his sweat and earthy musk, pausing meaningfully. ");
	if(!pc.isAssExposed()) output("Blushing slightly, you begin to take off your [pc.gear]. ");
	output("You agreed to the terms; your body is his conquered property, at least until he has gained his satisfaction. Yellow slit eyes watch you, relishing every movement of your hands down your increasingly bare frame.");

	output("\n\n<i>“Now, our lances have these atmospheres projectors built into them, so novices may have a chance of making it back to the temple alive.”</i> He laughs, head tentacles shaking. <i>“Absurd mollycoddling, but it is useful for cold-feeling prizes, no? Touch me.”</i>");

	output("\n\nThe blizzard whips and howls around the golden energy shield, gobbets of snow beating and melting against the thin wall inches away from your naked [pc.skinFurScales]. It lends the space an odd intimacy, like a warm, invisible igloo, a sensation that increases when you clasp the storm lancer’s penis at its base and slowly inch your way upwards, filling the hushed air with his deep sighs and pleased grunts. The ridges along the underside of his thick, fourteen inch sex are blunt and slightly pliable that become more and more defined the more you pull and shift your grip up and down him. Beneath his shaft, four heavy bollocks shift and tighten restlessly. You don’t get any sense of where he’s most sensitive along his shaft; he becomes hotly erect after barely a few seconds under your touch, his round end pointing fervently at your face.");
	output("\n\n<i>“Part of the Stormguard discipline...”</i> he breathes, eyes half-lidded. <i>“Keeping your lust locked away, until you have </i>earned<i> the right for release. No prize is truly satisfying if it were any different.”</i> He bites his broad, weathered lips as he lets his gaze wander down your body.");

	//PC has pussy
	if(pc.totalVaginas() > 0 && pc.totalVaginas() > pc.pluggedVaginas())
	{
		//PC is Masculine
		if(pc.mf("m","") == "m")
		{
			output("\n\n<i>“A conquest with the aspect of a man, but the sex of a woman? How unusual!”</i> The storm lancer suddenly bends downwards, roughly moulding his cracked lips against yours as he presses his bulging, muscular chest against your [pc.chest], the ridges of his hot, club-like penis rubbing against your [pc.belly].");
			if(stormguardHonor() == 2) output(" <i>“Perhaps this is the key to your prowess?”</i> he mutters, pulling away momentarily. <i>“The warrior mind of a man coupled with a woman’s measured instincts? Intriguing... but you are mine now, whatever the case.”</i>");
			else output(" <i>“Confused and ill-suited to the battlefield, evidently.”</i> He pulls away momentarily to consider you with hard, animalistic lust. <i>“Perhaps this will convince you to do away with your masculinity. Embrace what you’re truly made for.”</i>");
		}
		//PC is Andro/Feminine
		else
		{
			if(stormguardHonor() == 2)
			{
				output("\n\n<i>“A true valkyrie, brilliant and assured in battle, tamed after many hard trials. This is what all storm lancers train for and dream of!”</i> He bends downwards, roughly moulding his cracked lips against yours, pressing his bulging, muscular chest against your [pc.chest], the ridges of his hot, club-like penis rubbing against your [pc.belly]. <i>“By the Elements I wish I could breed you,”</i> he growls with hard, animalistic lust.");
			}
			else if(stormguardHonor() == 0)
			{
				output("\n\n<i>“Do you think I enjoy bruising the flesh of such a pretty little thing as you?”</i> the storm lancer asks, with a weary shake of the head. He leans inwards, and with tender conviction moulds his cracked lips against yours. His bulging, muscular chest presses against your [pc.chest], the ridges of his hot, club-like penis rubbing against your [pc.belly]. <i>“It dishonors me. It dishonors all males. How is a face and body like yours having to fight your own fights, having to take the brunt when you inevitably fail? I only hope you eventually see sense, and stay where you’re safe.”</i>");
			}
			else output("\n\n<i>“Warrior women do exist, of course,”</i> he rumbles, lava-like eyes fixed on your [pc.chest], seeming mostly to be talking to himself. <i>“Pretty girls should be treated with the same amount of caution in battle as anyone else. As dishonorable as it feels to beat such a beautiful creature into submission.”</i> He bends downwards, roughly moulding his cracked lips against yours, pressing his bulging, muscular chest against your [pc.chest], the ridges of his hot, club-like penis rubbing against your [pc.belly].");
		}
		// {merge}
		output("\n\nDazed and weakened from the battle, you feel utterly subsumed by the will of this dominant, vigorous beast and cannot summon up protests to his words. The hot, earthy smell of him - cool and rainy yet shot through with musky, sweat-soaked vigor - is high in your nose and throat, and it inarguably feels good to gingerly lie back on the melting snow and let him do as he may. ");
		if(flags["MET_GEL_ZON"] == undefined) output("The cundarian");
		else output("Gel Zon");
		output(" drags his erection down the line of your [pc.vagina], deliberately catching the bulbous head underneath your lips so that when he draws it back up, each ridge bumps against [pc.eachClit], sending sweet sensation tingling through you. He keeps doing it, moving his pleasantly rough dick up and down until ");
		if(pc.totalClits() == 1) output("it");
		else output("they");
		output(" are bulging eagerly out of their hood");
		if(pc.totalClits() > 1) output("s");
		output(" and your pussy is swollen and ");
		if(pc.wetness() < 3) output("oiling");
		else output("leaking");
		output(" frustration onto all that hard goodness rubbing over it, drinking in your expression as he does it. It’s only when you clutch at the rounded sturdiness of his back, opening your mouth to the pleasure being forced upon you, that he pulls his dick back so that its round bulb is parting your labia and shoves his meat home into your wet, sensitive hole.");

		output("\n\nHe molds his bulging, muscular form into you, pushing you down into the wet snow, clutching your [pc.hips] tightly as, with a pleased, rumbling groan he sinks inch after inch of thick dick into your [pc.vagina].");
		if(stormguardHonor() < 2 && pc.vaginas[0].looseness() < 3) 
		{
			output(" The sensation borders on pain, he’s so Void-damned big and there just seems to be more and more of him...");
			output("\n\n<i>“Not used to taking warrior cock, are you?”</i> he laughs, gazing at the tightness of your expression. <i>“Perhaps you should have thought of that before challenging me, princess.”</i> He does slow down the thrusting of his stallion-like hips though, waiting for you to get used to his hot, ridged intrusion before sliding more home until the feeling of housing a dick like this has resolved itself into intense pleasure.");
		}
		else if(pc.vaginas[0].looseness() < 3) 
		{
			output(" The sensation borders on pain, he’s so Void-damned big and there just seems to be more and more of him...");
			output("\n\n<i>“I am one of the first, aren’t I?”</i> he grunts, elation lighting up his blunt, handsome face. <i>“You have fought and guarded it for so long, and it is I that gets to claim it...”</i> Despite his intense excitement it’s obviously just as important to him that you enjoy it as much as he does; he pushes into you with disciplined slowness, mere tremors of his stallion-like hips, waiting for you to get used to his hot, ridged intrusion before sliding more home until the feeling of housing a dick like this has resolved itself into intense pleasure.");
		}
		else
		{
			if(stormguardHonor() == 2) 
			{
				output(" Despite his size though you’re more than capable of taking the cundarian, and your pussy seizes up gladly around his knob, urging him in on.");
				output("\n\n<i>“You’ve bred before, haven’t you?”</i> he grunts, elation lighting up his broad, rugged face. <i>“Of course... one of the battle-mothers I’ve often heard of, harnessing the fierceness of protecting and providing to become a truly fearsome warrior.”</i> His intense excitement translates into the movements of his powerful hips, bucking his hot, ridged dick into you roughly, able to mount you in truly barbarian fashion safe in the knowledge you can take every second of it.");
			}
			else if(stormguardHonor() == 1)
			{
				output(" Despite his size though you’re more than capable of taking the cundarian, and your pussy seizes up gladly around his knob, urging him in on.");
				output("\n\n<i>“Hmm. Been around the block a few times, haven’t we?”</i> he growls softly. He thrust his hips suddenly, jerking his erection deep within you, making you gasp and him laugh. <i>“Like so many girls who come out here fancying themselves, before learning a thing or two.”</i> Certain of your ability to take it, he bucks his powerful hips into you with careless roughness, mounting you in truly barbarian fashion. The artless bestiality of it makes it filthily good, the jerking and pounding of his hot meat against your slick wall sending intense pleasure trembling through you.");
			}
			else
			{
				output(" Despite his size though you’re more than capable of taking the cundarian, and your pussy seizes up gladly around his knob, urging him to fill you up more.");
				output("\n\n<i>“As easy as the clueless whore you clearly are,”</i> he sighs, easily drawing his erection outwards and then ramming almost every last bit of it into your wet hole, making you gasp. <i>“At least you’re good for one thing.”</i> He bucks his powerful hips into you with careless roughness, mounting you in truly barbarian fashion. The artless bestiality of it makes it filthily good, the jerking and pounding of his hot meat against your slick wall sending intense pleasure trembling through you.");
			}
		}
		pc.cuntChange(0,enemy.cockVolume(0));
		output("\n\nYour back and [pc.butt] grow numb against the snow as you are pressed down into it by the heavy, animalistic thrusting of an alien warrior intent on curing a serious case of slate-blue balls. The pebble-like texture of his hard chest rubs over your tender [pc.nipples], making them stand out ");
		if(pc.canMilkSquirt()) output("and leak [pc.milk] ");
		output("while he reaches his bulging maleness into your [pc.vagina] deep, stuffing your increasingly wet and needy hole with what it needs. The way his ridges rub along the underside of your pussy walls is an inescapably wonderful sensation, sending sheer ecstasy sparking up your spine and forcing you to clench up around the relentless, rhythmic texture, digging your [pc.hips] into his wide, muscle-bound torso hard");
		if(pc.isSquirter()) output(" and squirting [pc.girlCum] around his girth freely");
		output(", willing him on.");

		output("\n\nYou almost forget about how cold your backside is, but ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output(" apparently doesn’t; after a long, rigorous session of pumping you deep into the melting drift, he pulls his cock almost all the way out and with strong, brisk movements of his tough hands turns you over and draws you up ");
		if(pc.hasKnees()) output("onto your hands and knees");
		else output("so that you are knelt on your [pc.legs]");
		output(".");

		if(stormguardHonor() == 2) output("\n\nSimmering now in well-fucked pleasure, you give him a look over your shoulder which you hope approximates that of a fierce vixen awaiting the masterful stroke that will finally tame [pc.himHer]. It has the effect you were hoping for; with an exultant grin and exhalation the big tentacled warrior reaches forward to clutch your [pc.chest] and drives himself up to the base into your [pc.vagina], his ridges sending giddy vibrations bumping through you.");
		else output("\n\nFeeling nothing but pure frustration at his withdrawal, you mewl and buck your [pc.thighs], trying to coax him on. The big tentacled warrior rewards you with a hefty slap to the upraised [pc.butt] before driving himself up to the base into [pc.vagina], his ridges sending giddy vibrations bumping through you. Your butt is so numb - and the pleasure coursing through you so intense - that you barely even feel his love tap.");

		output("\n\nYour [pc.eyes] roll as your [pc.vagina] seizes up powerfully around that thick, thrusting obtrusion, milking it in a series of clenches that make you clutch handfuls of snow");
		if(pc.canMilkSquirt()) output(" and dribble copious amounts of [pc.milk] from your [pc.fullChest].");
		output(" With the stamina innate to him, the cundarian claps his hard, full thighs into your [pc.hips] throughout your orgasm heedlessly, driving his fat dick into your sweet spot again and again, making you arch your back and wail with the intensity of it.");

		output("\n\nFinally, he reaches down and molds his fingers into your [pc.chest], holding you hard against him as his long-held-back orgasm tightens up his loins. He groans like a lowing reindeer, rams every inch of his meat into your wet, well-claimed hole so that you can feel his bulging testicles against your puffy labia, and then unloads it all with harsh, ragged cries.");

		output("\n\nYou gasp as the cundarian seed fills you up. It feels bizarre, light but swelling your [pc.belly] outwards, as if he were pumping you full of hot, sweet air. Every ejaculation seems to be a small orgasm in itself for him; he gathers himself and groans with delight with each fresh pump of his hips, inflating your womb with foam-cum. You are utterly swollen by the time he draws himself out, the drag of his ridges down your tender tunnel making you moan hoarsely. He pauses, heaving chest still plastered to your naked [pc.skinFurScales], with only his round head stretching your inner lips.");

		output("\n\n<i>“One... last...”</i> he grunts. <i>“Ahh!”</i> You inhale as he sprays a huge dollop of hot foam into your hole, taking the shape of the gape he’s left behind.");

		output("\n\n<i>“There,”</i> he murmurs. His hands clasp your arms, preventing you from reaching down. <i>“A memento of your loss here.");
		if(stormguardHonor() == 1) output(" Something to mull over, and either sharpen your resolve to best me - or to remind you what folly it was to challenge me in the first place.”</i> He squeezes your [pc.butt] and then, with a satiated, rumbling sigh, rolls off you.");
		else if(stormguardHonor() == 0) 
		{
			output(" Let’s be honest though - this is a reward, more than anything.”</i> He squeezes ");
			if(pc.biggestTitSize() >= 1) output("your tit");
			else output("your [pc.butt]");
			output(" and then, with a satiated, rumbling sigh, rolls off you.");
		}
		else output(" To sharpen your resolve, to make you come back and throw me down for my nerve.”</i> He sighs with pleasure at the thought. <i>“Maybe eventually I will prove myself fully to you, and then... then I shall have you bear the strongest, fiercest children the galaxy has ever known!”</i> With that, he rolls off you.");

		output("\n\nBy the time you get your hands down to it, the cloudy foam has hardened and formed a perfect, blue-colored plug. It stretches your pussy lips, seems to be bigger outside than in, and no matter how you attack it with your fingers, you - can’t - get - it - out. The sensation of being swollen with hot air has dissipated a bit at least, but until you ");
		if(flags["SHOWERED_OUT_PLUG"] != undefined) output("have a shower");
		else output("work out a way to get this thing out of you");
		output(", nothing is getting in or out of your [pc.vagina]. The problem this is going to cause becomes evident as you’re putting your things back on - the solid, smooth cum block rubs your lips and [pc.eachClit] as you move, constantly arousing you and reminding you of your utterly stuffed pussy.");
		output("\n\nThe storm lancer has left his spear stuck in the ground for you, the energy shield it generates still holding. It winks off as you step back into the howling gale. ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("The cundarian");
		output(" has returned to his lying position, hardened back up against the freeze - except now he has a big, pleased grin on his blunt features.");
		output("\n\nPerhaps you could bring a sledgehammer next time.");
		processTime(25);
		pc.loadInCunt(enemy,0);
	}
	else 
	{
		var x:int = 0;
		for(var i:int = 0; i < pc.totalVaginas(); i++)
		{
			if(pc.isPlugged(i)) x = i;
		}
		//Pussy plugged
		if(pc.isPlugged(x))
		{
			output("\n\nThe looming hill of a warrior booms with delighted laughter when his golden eyes land on your [pc.vagina " + x + "], still stoutly plugged with his cork of smooth, solidified cum.");
			output("\n\n<i>“You’re still carrying that around?”</i> he says, casually opening your [pc.thighs] and relishing the sight of your stuffed, stretched pussy. A blush clambers onto your cheeks as he reaches out and gently traces the lines of your opened labia. <i>“I don’t know whether to be flattered or unsurprised. Should I take it out?”</i> he growls, malevolent mischievousness honeying his tones, as he squeezes your engorged lips around the obstruction, sending pleasure rippling up your tunnel. <i>“Let it have a single moment to breathe, then stuff it even harder and fuller?”</i> He looks for a moment like he’s considering it; then he sits back with a haughty snort, erection rising up as he does. <i>“I think not. Better to keep it in whilst I put you to use in other ways, so all of your slatternly holes may know my touch.”</i>");
		}
		//If masculine male
		else if(pc.mf("m","") == "m")
		{
			output("\n\n<i>“No need for airs and back-and-forth, is there?”</i> he says, smirking as he relaxes back onto the melting snow, his hefty erection rising up as he opens his tree-trunk thighs. <i>“We’re both honorable men, we know how it works - how we like it. ");
			if(stormguardHonor() == 0) output("Or you should, at least. Elements know how many times we’ve ended up right here!”</i> He roars with joshing laughter. <i>“");
			output("One warrior giving his dues to a better, that’s all this is. Hop to it, there’s a lad.”</i>");
		}
		else if(pc.isShemale())
		{
			if(stormguardHonor() == 1) output("\n\n<i>“I suppose it was too much to hope someone who looks, sounds and fights like a woman would actually </i>be<i> one,”</i> he sighs, eyeing [pc.eachCock]. <i>“Decadent core-worlders, honestly.”</i>");
		}
		//If femboy
		else
		{
			output("\n\n<i>“An onnagre!”</i> he exclaims. <i>“I had heard of such exotic practices amongst the kaithrit and the decadent core-worlds - never in the flesh.”</i> He bends over you, his hot breath in your ear as he runs his hands along the line of your [pc.thigh] and [pc.chest]. <i>“I can definitely see the attraction, though,”</i> he murmurs. <i>“");
			if(stormguardHonor() == 2) output("You fight like a seasoned warrior and yet look like a china doll. How do you manage that, fascinating creature?");
			else output("It dishonors me to bruise the flesh of such a pretty thing. You should be on a stage somewhere, or servicing a kind master, not out here getting hurt by real men.");
			output("”</i> He sits himself back cross-legged, his hefty erection rising up.");
			output("\n\n<i>“One thing everyone knows about onnagre - they are exceptional at pleasuring cock,”</i> he growls, fierce lust in his slit eyes. <i>“Prove it.”</i>");
		}
		// {merge}
		output("\n\nYou’re too dazed and beaten down to summon up a rejoinder. You’re ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output("’s conquest, his dick is practically pointing in your face, you know what he wants you to do. You reach across, wrap your hand around his hot girth and slowly spread your [pc.lips] over his bulbous head, receiving a rumbling groan in response. Most of your misgivings and resentments fade away as the simple rhythm of giving oral takes over; opening your mouth wide enough to slide your lips and tongue down to his wedge-like ridges, pulling upwards to tighten up around his sensitive bulb before dipping down again. The earthy smell of him - cool and rainy yet shot through with musky, sweat-soaked vigor - gets deep into your lungs and head, making you feel softer and more complaisant, snuggling into your role as your conqueror’s prize, lustful heat of your own wiring down to your groin, ");
		if(pc.hasVagina()) output("[pc.eachVagina] moistening");
		if(pc.isHerm()) output(" and ");
		if(pc.hasCock()) output("[pc.eachCock] becoming submissively erect");
		output(". As you hollow your cheeks up around approximately half of his thick, slate-blue dick, you bend your hand in and caress his quartet of tennis-ball sized testicles, as dense and heavy as apples in your shifting palm.");

		output("\n\n<i>“Very good...”</i> husks the brazen warrior, mouth open and head angled towards the golden barrier. His rough hand strokes your [pc.hair] and the back of your neck. <i>“Keep doing it exactly like that...”</i> Slutty warmth shuddering through you, you attack his meaty alpha-dick with a bit more gusto, stretching your maw so you can feel ridge after ridge bump over ");
		if(pc.lipRating() >= 4) output("the delicious plumpness of ");
		output("your bottom lip, drawing upwards with delicious tightness before descending again, feeling his bulbous head bump against the back of your throat, beads of drool working their way down to the base.");

		output("\n\n<i>“Uh... ungh!”</i> His hand grips your neck tightly, his shaft bulges and the next instant he fills your mouth with a big dollop of... foam? It’s wet but filled with air, a mouthful of musky whipped cream. Cheeks bulging slightly, you pull away to look up at ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the cundarian");
		output(" with silent indignation.");

		output("\n\n<i>“It hardens quickly, usually,”</i> he says, looking back with a relaxed, unabashed smirk. <i>“Saliva breaks it down.”</i> It sticks to the insides of your mouth but you find, with a few rolls of the [pc.tongue] and bites of the teeth, it’s rather like eating a cum meringue. The big, naked tentacled creature watches you munch and swallow with evident pleasure, his cock still very much erect.");

		output("\n\n<i>“Your drool is a useful substance, isn’t it?”</i> he remarks, crossing his legs, wetted shaft in hand. <i>“Let’s hope it’s up to the next task. Come up here.”</i>");
		output("\n\nHe insists you sit face-to-face, so that he can drink in your expression as he presses his big cock-head against your [pc.ass], slowly but surely opening it wide around his hot length with small, forceful movements of his thighs, holding you firmly in place with strong hands. You gasp and he grunts with deep approval as he pressures the smooth oval of his head beyond your tender ring, freezing your muscles up with the intensity of it. Tightening up like that on the most sensitive part of his erection only excites him more, energetically jerking his hips and drawing you downwards, spreading you further and further down his thick, bumpy prick.");

		if(pc.ass.looseness() >= 3 || pc.ass.wetness() >= 1) 
		{
			output("\n\nOnce you’re beyond the initial toughness though, your experienced, cock-hungry tailpipe is more than capable of taking the cundarian, and you clench up around him, pleasure becoming more and more acute the more he fills you up and stretches you out.");
			if(pc.ass.wetness() >= 1) output(" He murmurs in surprise as your natural lubricant dribbles down his shaft, greedily easing its passage and making you moan.");

			if(stormguardHonor() == 0) output("\n\n<i>“Why am I not surprised you’re good at this,”</i> he growls, bestial arousal animating his hard-bitten face. <i>“You probably bend over for anyone that even looks in your direction, am I right?”</i>");
		}
		else
		{
			output("\n\nIt’s teeth-grittingly tough, and as he spreads your hole wider with each fresh passage of a thick ridge, you begin to wish you’d slathered it with more lubricant when you had the chance. Still, you’re determined not to give him any further reason to exult in your defeat, and stay stoically silent until at last you are feeling used to being stretched and filled up by a giant barbarian cock like this.");
			if(stormguardHonor() == 2) output("\n\n<i>“Better than I ever imagined,”</i> he groans, mouth open, exultant at how tight you are around him. <i>“A prize only the very best are allowed to claim!”</i>");
		}
		pc.buttChange(enemy.cockVolume(0));

		output("\n\nHe clasps your [pc.butt] and begins to roughly move you up and down, the hefty furrows of his dick sending sensation nibbling through you as he recedes, a taster for the indescribable feeling of having twelve inches of cundarian cock thrust straight up into your guts. Eventually you begin to crave that monumental feeling of being brutally filled, to yearn for the feeling of ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output("’s sex filling every inch of that hollow inside of you.");
		if(pc.hasCock() && !pc.hasVagina()) 
		{
			output(" Every rude shove inwards puts intense pressure on your prostate, making [pc.eachCock] harden and bulge gleefully, [pc.cum] oozing out of your glans. ");
			if(pc.cockTotal() == 1) output("It");
			else output("They");
			output(" bat unrequited against the washboard of the dominant male’s bare stomach.");
		}
		//If penis and vagina:
		else if(pc.isHerm())
		{
			output(" Every rude shove inwards puts intense pressure on your prostate and the inner walls of your [pc.vaginas] - [pc.eachCock] hardens and bulges gleefully whilst unrequited, frustrated pleasure pulses through your female sex.");
			if(pc.pluggedVaginas() > 0) output(" It’s made even worse by the plug this beast has shoved up you, rubbing endlessly against your increasingly wet lips and pussy flesh.");
		}
		else 
		{
			output(" Every rude shove inwards puts intense pressure on the inner walls of [pc.eachVagina], frustrated pleasure, pulsing through your female sex.");
			if(pc.pluggedVaginas() > 0) output(" It’s made even worse by the plug this beast has shoved up you, rubbing endlessly against your increasingly wet lips and pussy flesh.");
		}
		output("\n\nThe storm lancer has had his brilliant serpentine eyes fixed gloatingly on your face this entire time, and as he bucks his bulging thighs into you with escalating passion, heavy balls flapping against your [pc.hips], it’s impossible for you not to display the pleasure he’s forcing on you. Your gasping moan fades into his pleased, knowing growl, and he pushes his thumb into your open mouth as he reams your [pc.ass] with hard, heavy pumps, bumping roughshod over your most tender spots. You are forced to cling to the clenching muscle of his forearms and let him claim your poor, stretched asshole with all his might.");

		output("\n\n<i>“Should I plug up this hole of yours");
		if(pc.pluggedVaginas() > 0) output(" as well");
		output("?”</i> he barks, wide chest heaving. <i>“");
		if(pc.pluggedVaginas() > 0) output("Another");
		else output("A");
		output(" little memento of being ploughed silly by your better...");
		output(" Ungh! No... I am not that cruel.");
		if(stormguardHonor() == 2) output(" An opponent such as you deserves better.");
		output("”</i> He mires himself up to the balls in you - ");
		if(pc.hasCock()) 
		{
			output("your [pc.cock] ");
			if(pc.cumQ() < 10) output("dribbles");
			else output("spurts");
			output(" [pc.cum] freely");
		}
		if(pc.isHerm()) output(" and ");
		if(pc.hasVagina()) output("your [pc.vagina] clenches up in glistening ecstasy");
		output(" - and then he drags himself out, plastering his bulging chest against your [pc.chest] as he thrusts his dick between your butt-cheeks and cums, using the soft friction there to intensify his ejaculation. His heavy, muscular body rolls and writhes up you, the hushed, warm air filled with his gasps and groans as he pastes your back in foam, his uncontrolled cock rubbing over your thoroughly gaped [pc.anus]. By the time he is done your [pc.chest] and [pc.stomach] are oiled in his sweat, your back and [pc.butt] caked in generous amounts of cloudy jizz.");

		if(pc.mf("","f") == "f" && !pc.isShemale()) 
		{
			output("\n\nHe sighs deep and low, considering you stuck on his lap with a deeply satisfied expression baked onto his face. <i>“Everything I had ever hoped for, onnagre.");
			if(stormguardHonor() < 2) output(" Makes me wish I lived a life of plenty, so I had the means to keep a pretty creature like you as my own.”</i>");
			else output(" Truly worth the feat of taming such a prize! Why can’t there be more of you fierce-fighting girly boys out there?”</i>");
		}
		else
		{
			output("\n\nHe sighs deep and low, considering your limp form on his lap with a deeply satisfied expression baked onto his face. ");
			if(stormguardHonor() == 0) output("<i>“A meaningless victory you might be, but enjoyable all the same. Keep throwing yourself at me if you like, " + pc.mf("whelp","wench") + " - I don’t mind how we always ends up right here.”</i>");
			else if(stormguardHonor() == 1) output("<i>“I hope this experience strengthens your resolve to sharpen your skills and defeat me. Or maybe not?”</i> he poses, narrowing his eyes at you, considering your expression with teasing intent. <i>“Perhaps you like it this way enough to lay down your arms each time.”</i>");
			else output("<i>“I’ve wanted to do that for so long, honored " + pc.mf("warrior","valkyrie") + " - get just a little back for myself. May our battles long continue - you are such an inspiration!”</i>");
		}
		// {merge}
		output("\n\nWhen you slide off his warm, tough flesh, wincing slightly, he does not stop you. You have to spend a short time peeling trails of his cum off your back - the stuff sets like sticking plaster on your [pc.skinFurScales]. By the time you’ve put your gear back on, ");
		if(flags["MET_GEL_ZON"] == undefined) output("the storm lancer");
		else output("Gel Zon");
		output(" has returned to his lying position, hardened back up against the freeze - except now he has a big, pleased grin on his blunt features.");
		output("\n\nPerhaps you could look into bringing a sledgehammer with you next time.");
		//pc.loadInAss(enemy);
		processTime(30);
		pc.orgasm();
	}
	//output("\n\n(<b>Coder's Note:</b> Orifice plugging is not yet fully supported. This is going to take a lot of work and probably not work well for several months worth of patches. RIP, Fenoxo.)\n\n");
	IncrementFlag("SEXED_SG_MALE");
	IncrementFlag("SG_DEFEATED_PC");
	//NO HONOR!
	stormguardHonor(-1);
	output("\n\n");
	CombatManager.genericLoss();
}

//Pussy Plug
//Doubles Libido. Functionally removes vagina from PC until they have a shower.
//Tooltip: Your pussy has been bunged with cundarian cum. Neither you nor anyone else will be able to use it until you get rid of it - but the constant rubbing and stretching it causes will arouse you until you do.
//Continuing effect text (every eight squares moved?)

/*Stormlancer bounty board bits
Night Trap
Win scene*/
public function NTWinSceneForStormLancah():void 
{
	clearOutput();
	showStormguard(true);
	author("Night Trap");
	//PC must have vagana

	//reuse the bit from the buttfuck about activating his atmospheric generator
	if(flags["SG_LANCE_SEEN"] == undefined)
	{
		output("<i>“Can you do anything about...”</i> you gesture at the blizzard, the bleak landscape and all the other elements of Uveto that do not really lend themselves to al fresco sex. After a moment, ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output(" silently plucks the spear from his armor and rams it into the perma-frost. From the pommel it emanates an energy bubble, a thin golden wall which encompasses him and you, filled with the pleasant warmth of a spring day.");
		output("\n\n<i>“Nice!”</i> you remark, admiring the snowflakes melting against the membrane inches away from your [pc.face]. <i>“Now take your pants off, there’s a good boy.”</i>");
	}
	else output("<i>“Do the thing with your lance,”</i> you grin. <i>“And then take your pants off, there’s a good boy.”</i>");

	// {merge}

	output("\n\nYour eyes fall upon the quasi-beard of tentacles ringing ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s face. Your [pc.cunts] moisten");
	if(pc.totalVaginas() == 1) output("s");
	output(" at the thought of how those appendages would feel inside your womanhood, especially alongside that boastful tongue of his.");

	output("\n\n<i>“Lie on your back for me.”</i>");

	if(stormguardHonor() == 2) 
	{
		output("\n\nThe defeated cundarian sports a wide grin as he falls back into the snow. " + pc.mf("<i>“And the great warrior bares his womanhood! This will never cease to be astounding. Perhaps that is the key to your prowess? What is it you plan to do with me?”</i>","<i>“So, the valkyrie has chosen me as her perch? How do you plan on satiating yourself on my body?”</i>") + " His monolithic, ridged cock throbs upwards as you approach, but you have no plans on making use of it today");
		if(flags["SEXED_SG_MALE"] != undefined) output(", especially knowing the properties of cundarian semen");
		output(". As you ");
		if(!pc.isGoo() && !pc.isNaga() && !pc.isTaur()) output("plant your [pc.legs] to either side of his head");
		else if(pc.isNaga()) output("pile your coils on his beefy chest");
		else if(pc.isGoo()) output("pool your goo-puddle around his head");
		else output("park your tauric hind-end over him");
		output(", he sighs wistfully. <i>“Ah, yes of course: I have not earned the right to breed you. Still, I have no objection to tasting the womanhood I shall one day conquer!”</i>");
	}
	//Honor 0-1:
	else
	{
		output("\n\n");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("The storm lancer");
		output(" grins slightly as he follows your command. " + pc.mf("<i>“I would not have suspected one so masculine to bear the sex of a woman. How unusual you are. What is it you plan to do with me?”</i>","<i>“It is not every day that a woman bests me! I am excited to see how you plan to sate yourself!”</i>") + " His monolithic, ridged cock throbs upwards as you approach, but you have no plans on making use of it today");
		if(flags["SEXED_SG_MALE"] != undefined) output(", especially knowing the properties of cundarian semen");
		output(". As you ");
		if(!pc.isGoo() && !pc.isNaga() && !pc.isTaur()) output("plant your [pc.legs] to either side of his head");
		else if(pc.isNaga()) output("pile your coils on his beefy chest");
		else if(pc.isGoo()) output("pool your goo-puddle around his head");
		else output("park your tauric hind-end over him");
		output(", he nods his head knowingly. <i>“As I expected. A warrior would not wish to be weighed down with a child! Even so, I will savor your taste and remember it as the taste of defeat.”</i>");
	}

	output("\n\nYou roll your eyes and drop your mound onto the noisome warrior’s mouth, shivering not from the cold, but from the deliciously rough feeling of his wind-cracked lips on your soft, feminine ones.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] rest");
		if(pc.cockTotal() == 1) output("s");
		output(" atop his forehead, quite uncomfortably for him.");
	}
	var x:int = 0;
	if(pc.pluggedVaginas() == 0) output(" <i>“I want to see what those tentacles can do. Eat up,”</i> you command, emphasizing your order with a slow roll of your [pc.hips].");
	else 
	{
		for(var i:int = 0; i < pc.totalVaginas(); i++)
		{
			if(pc.isPlugged(i)) x = i;
		}
		output("\n\n<i>“I think you forgot something last time. I’m here to give it back to you.”</i> You emphasize your statement with a rough grind of your [pc.hips], still feeling <i>very</i> pent up from having his strange semen stretching your tunnel all this time.");

		output("\n\n");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("The storm lancer");
		output(" hesitates initially, but he understands better than anyone the consequences of defeat. With great reluctance, he gathers saliva on his tongue before beginning to lick at your sealed entrance. You gasp at the pleasurable contact, already primed for action from the torturous pleasure of being stimulated with every step you’ve been enduring since your last battle. You grab his head with both hands, baring your muff down into his mouth to speed up the process. A hollow groan escapes your [pc.lips] as your channel relaxes for the first time in a while as the cundarian’s semen rapidly dissolves. Some small measure of relief washes over you when your pussy finally begins to relax. When the last vestige of that damnable plug drains out of you, you moan desperately. You’re even hornier now than you were a moment ago, [pc.girlCum] dripping freely from your now-painfully empty [pc.cunts]. You flash a predatory grin down at ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output(". <i>“I hope you enjoyed the appetizer. Now it’s time for the main course. Eat up,”</i> you tease, grinding your [pc.clit] into the blue brute’s nose.");
		//remove cummy pluggy.
		pc.vaginas[x].delFlag(GLOBAL.FLAG_PLUGGED);
		if(pc.pluggedVaginas() == 0) pc.removeStatusEffect("Pussy Plugged");
	}
	if(pc.totalVaginas() > 1)
	{
		output("\n\nA muffled sound of surprise issues from beneath your crotch a moment before the blue brute pushes you up enough to speak. <i>“");
		if(pc.totalVaginas() == 2) output("Two");
		else output("Three");
		output(" womanhoods?!? You have brought me a feast only a core-worlder could provide!”</i> He chuckles to himself before lowering you again, his rumbling mirth flooding your muff with vibrations that make your eyes roll back momentarily.");
	}

	if(flags["MET_GEL_ZON"] != undefined) output("\n\nGel Zon");
	else output("\n\nThe storm lancer");
	output(" does as commanded, eagerly lapping up your ");
	if(pc.wetness(x) >= 3) output("copious ");
	output("feminine moisture with a pleased sound. He licks up and down the length of your [pc.pussy " + x + "], flicking your [pc.clits] with his tongue to coax more [pc.girlCumFlavor] juices out of you. You allow him to carry on like this for a minute before you clear your throat and shift your [pc.hips] a bit lower to rub against his tentacled chin, smearing the warm protrusions with your [pc.girlCum] and causing them to writhe gently against you.");

	output("\n\nThere’s a small grunt of effort from ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" before you feel his tentacles truly go into motion. You gasp in delight as multiple fleshy protrusions begin wriggling across your muff, stroking your labia with surprising strength as they seek out your entrance");
	if(pc.totalVaginas() > 1) output("s");
	output(". With a little more concentration, the cundarian cunnilingist manages to penetrate you with his facial appendages. <i>“Haha!”</i> you think you hear him shout triumphantly. It’s a little hard to tell with your [pc.cunts] in his face, but you definitely feel the vibration through his lips.");

	output("\n\nThe extra stimulation on top of the alien feeling of his tentacles beginning to stuff your [pc.cunts] prompts a pleased cry from you loud enough to make a whore blush. Your reaction causes ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" to laugh, which in turn draws another slutty cry from between your [pc.lips]. This in turn prompts more teasing laughter, resulting in a feedback loop of stimulation so slit-moistening that you’re hard pressed to care that his laughter is at your expense.");
	if(pc.isSquirter()) 
	{
		output(" The cyan alien’s laughter soon transforms into spluttering as your juicy box");
		if(pc.totalVaginas() > 1) output("es kick");
		else output("kick");
		output(" into high gear, leaking ");
		if(pc.totalVaginas() == 1) output("a torrent");
		else output("torrents");
		output(" of [pc.girlCum] all over his face. It pours down his face in [pc.girlCumVisc] streams, covering his chin and neck in your lubricants and puddling momentarily in the snow beneath his head before freezing solid.");
	}
	output("\n\nAs your pleasure mounts, you instinctively begin bucking your [pc.hips], reveling in the exotic sensations centered on your [pc.cunts]. You no longer restrain yourself, crying out freely now and outright fucking your opponent’s face as you climb towards what you can already tell is going to be a toe-curling orgasm. You just can’t get enough of the way those little tentacles wriggle and writhe inside you, rubbing and poking along your folds and stretching your opening");
	if(pc.totalVaginas() > 1) output("s");
	output(" with the sheer number of them filling you. It’s such a bizarre feeling, softer than fingers, more flexible than a penis, drier and more phallic than a tongue. Your [pc.cunts] flutter");
	if(pc.totalVaginas() == 1) output("s and clenches");
	else output(" and clench");
	output(" around the intruding tendrils, pulling them in deeper still.");

	if(pc.biggestTitSize() >= 1)
	{
		output("\n\nYour hands find your [pc.chest] unconsciously, groping at your [pc.breasts] greedily to maximize your pleasure, teasing more feminine cries of joy out of yourself.");
		if(pc.isLactating()) 
		{
			output(" Shortly after you begin fondling your breasts, you feel the telltale prickling sensation of your [pc.milk] letting down. You let out a throaty moan as you tug on your [pc.nipples], coaxing out more and more of your motherly essence. You rub your [pc.milk] into your [pc.skinFurScales], relishing the fleeting warmth the liquid brings your tender boobflesh. When some of your lactic bounty drips down onto ");
			if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
			else output("the storm lancer");
			output(", he hums in approval, flooding your snatch with more delicious vibrations.");
		}
	}
	output("\n\nLost in these exotic new feelings, you allow your [pc.eyes] to roll closed, shutting out the icy wasteland around you and focusing entirely on the heat that’s fast building in your belly. It’s surprisingly cozy inside the climate controlled bubble. You’re kept off of the snow by ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s face, and the air has begun to warm up with your respective body heat. You relish this rare bit of warmth in Uveto’s chilly environs, baring your weight down to press more of your [pc.skinFurScales] into contact with what little warmth your partner gives off.");

	output("\n\nBy now you had nearly forgotten your original order to ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(", but you’re given a potent reminder when you feel his brawny hands suddenly grasp your [pc.hips] to still you a moment before his mouth makes contact with your pussy. Even as his tentacles are hard at work exploring your ");
	if(pc.totalVaginas() > 1)
	{
		output("other ");
		if(pc.totalVaginas() > 2) output("two ");
	}
	output("puss");
	if(pc.totalVaginas() == 1) output("y");
	else output("ies");
	output(", his cracked lips seal themselves around your [pc.clits], sucking at the fleshy bud");
	if(pc.totalClits() > 1) output("s");
	output(" with delightful force. His tongue, warm and wet, soon joins the fray, so like the tentacles already filling you, yet so different. His oral muscle teases your folds with soft, tender licks before homing in on your [pc.clits] momentarily, poking under your hood");
	if(pc.totalClits() > 1) output("s");
	output(" to batter the sensitive bundle");
	if(pc.totalClits() > 1) output("s");
	output(" of nerves directly.");

	output("\n\nA slutty cry is forced from you instantly, your eyes opening wide in shock from the overwhelming feeling of pleasure. You try to buck your [pc.hips] in response, but the cundarian brute holds you still with his powerful arms, pressing his face even harder into your sopping wet cunny. He slips his tongue into your pussy, sliding it around amidst his tentacles and along the silken folds of your channel. ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The storm lancer");
	output(" prods his tongue as far into you as he can, scoring streaks of carnal delight along the walls of your pussy until you’re gasping on the very edge of cumming.");
	output("\n\nYou ride the edge of orgasm for what feels like an eternity, holding yourself back in order to savor your victory for as long as possible. Your [pc.cunts] spasm");
	if(pc.totalVaginas() == 1) output("s");
	output(" fitfully at the appendages writhing around inside you, clenching them tighter by the second in a bid to keep them where you want them, even as you drip still more [pc.girlCum] to allow them to move freely. Finally, ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" grunts in effort once more, and you scream in wanton bliss as his tentacles go wild. The little tendrils thrash about inside you, lashing every inch of your [pc.cunts] with power and speed belying their size while his tongue begins punishing your [pc.clits].");

	output("\n\nYou throw your head back and moan, loud and low, utterly overwhelmed by more stimulation than your nervous system can process. You cream the cundarian’s beard with everything you have, ");
	if(pc.isSquirter()) output("squirting a deluge");
	else output("leaking a healthy trickle");
	output(" of cunny honey as you buck your [pc.hips] helplessly.");
	if(pc.hasCock()) output(" Your [pc.cocks] join your female anatomy in orgasm, plastering your partner’s forehead and scalp with your [pc.cum].");
	if(flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
	else output(" The storm lancer");
	output(" dutifully weathers the storm of your orgasm, continuing his ministrations throughout your climax to maximize your enjoyment.");

	output("\n\nAll good things must end, and your orgasm is no different. As you come down from your orgiastic high, you pant heavily, your [pc.skinFurScales] slick with sweat and your [pc.hips] and [pc.cunts] still twitching at random with the aftershocks of pleasure. When you’re confident your [pc.legs] will support you, you shakily climb to your [pc.feet] again. The [pc.girlCumFlavor] scent of your arousal fills the high-tech bubble completely, and as you look down at the defeated cundarian you get a perverse little thrill out of the thought of how hard [pc.girlCum] must be to wash out of a tentacle beard.");
	output("\n\nIt’s impossible to miss the way ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s entire body is tense with unfulfilled need, especially with the 14 inches of alien dickflesh throbbing between his pillar-like legs. Amazingly though, he makes no effort to relieve his obvious arousal. He closes his eyes and takes a deep breath to calm himself before responding to the quirked eyebrow you regard him with. <i>“I have lost, and therefore have not earned release. I shall take this fire and use it to temper me, improving myself, so that when next we meet, I will overcome you.”</i> He opens his eyes again. <i>“THEN I will find release.”</i>");
	output("\n\nHe lets you keep the storm lance and its bubble, putting his pants back on before settling himself back down into the snow as you fetch your [pc.gear] - it winks out and the howling gale pushes into your face as soon as you click your heat belt back on. Frost has begun to settle back on the storm lancer’s features as you take your leave.");
	processTime(15);
	IncrementFlag("SG_LANCE_SEEN");
	IncrementFlag("SEXED_SG_MALE");
	stormguardHonor(1);
	enemy.girlCumInMouth(pc);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//Loss Scene
//Must have vagogo and be in heat
public function lossToSGWithHeatPussy():void
{
	clearOutput();
	showStormguard(true);
	author("Night Trap");
	var x:int = 0;
	for(var i:int = 0; i < pc.totalVaginas(); i++)
	{
		if(pc.isPlugged(i)) x = i;
	}
	//Pussy plugged
	if(pc.isPlugged(x))
	{	
		output("Even sealed up with inhuman cum as it is, your [pc.cunt " + x + "] still exudes an enticing, fertile scent. The intoxicatingly masculine alien draws in a deep breath of your pheromonal odor, his breeding rod giving an eager throb and his yellow eyes rolling closed as he savors your odor. You stare with undisguised hunger at his twitching maleness, something which provokes a thunderous laugh from ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output(" when he looks down at you again.");

		if(stormguardHonor() == 2)
		{
			output("\n\n<i>“Truly, you are a " + pc.mf("warrior","valkyrie") + " fit for poem! Filled with such a burning need for a man’s touch, and yet you have honorably kept my seal since our last combat. Even in defeat you impress me!");
		}
		//Honor 1-0: 
		else
		{
			output("\n\n<i>“Little surprise you once again failed to best me! I take it from my seal that you did not even wish to. Are you a warrior, or a brood sow? If my seed still hasn’t taken, then I suppose you are a failure as both!");
		}
		output(" Now, what shall I do with you?”</i>");

		output("\n\nA powerful, blue hand reaches down to trace the edges of your [pc.cunt " + x + "]’s jammed-open entrance. You let out a hollow groan, your tunnel feeling anything but as you rock your [pc.hips] into ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output("’s torturous prodding. Your movements only serve to torment your cunny further, the stimulation of your walls by the cumplug serving as a stark reminder that you aren’t being stuffed with jizz-spurting cocks like your body needs.");

		output("\n\nYour inner muscles clench hungrily at the pussyplug, forcing a ");
		if(!pc.isSquirter()) output("trickle");
		else output("flood");
		output(" of pheromone-rich [pc.girlCum] out around the intrusion to slather ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output("’s digits in your strong-smelling cunny honey. The conquering alien gathers the [pc.girlCumFlavor], slippery stuff on his fingertips before bringing it to his mouth to sample your flavor. He rumbles out his enjoyment of your taste in a bassy growl, club-like cock throbbing even harder now.");

		output("\n\n<i>“You really do need more, don’t you?”</i>");
		output("\n\nYou let out a submissive whimper and nod your head emphatically, [pc.eyes] still locked on the pillar of raw virility before you, the only thing around capable of scratching your primal itch.");
		output("\n\nHe sports a triumphant smirk at your response, clearly feeling his oats, growing even more turned on at having quite literally blue-walled you up to this point. The tentacled adonis pops his thick fingers into his mouth and begins licking them sloppily with vulgar, wet lashes of his alien tongue. It’s a bestial, crude display, but in the throes of your heat, you find yourself growing even wetter in response. Your head is filled with fantasies of that tongue polishing your [pc.clits] while those rough digits plunder your feminine softness. You practically faint in delight when your lurid wishes suddenly come to life: ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output(" reaches his spit-slicked hand down between your [pc.thighs] and begins pressing against his own cumplug.");

		output("\n\nIt seems at first as if he’s merely tormenting you further, but after what feels like an eternity to your lust-addled mind, the hardened jizz sealing your entrance yields before the fingers of the stud who left it there. Almost all at once, the plug loses its integrity, dissolving and crumbling like a meringue. The feeling of relief borders on overwhelming, and you groan loud and low as the cundarian’s fingers scrape out the last pieces of the damnable mating plug that has stretched and stimulated your [pc.cunt " + x + "] since your last tryst.");

		output("\n\nSealed until now in hellish chastity at the time you most needed real cock, your freed and desperate slit reflexively tugs ");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("the storm lancer");
		output("’s fingers further in with powerful contractions, seizing immediately upon the phallic intrusions with uncontrollable need. ");
		//PC Treated Pussy: 
		if(pc.isTreatedCow()) 
		{
			output("Even this hulking male has trouble denying your tunnel’s crushing spasms. Your genetically-engineered miracle pussy milks hungrily at anything that penetrates it under most circumstances, but as your are now, in heat and edged for hours, your ");
			if(silly) output("squish mitten");
			else output("velvety softness");
			output(" is practically an organic finger trap. ");
			if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
			else output("The storm lancer");
			output(" grunts in surprise and effort as he briefly struggles to liberate his phalanges from their carnal prison. When he begins wiggling his digits to try to yank them free, your eyes cross, and you moo frantically as you buck your [pc.hips] into his masculine hand. It finally escapes you with a wet pop that’s immediately drowned out by your mournful moo.");
		}
		//Lame, regular pusspuss: 
		else
		{
			output("The hulking male has no trouble extracting his digits from your [pc.cunt " + x + "] however. You whimper with need at the sudden departure. The only thing left in your tunnel now is an unbearable feeling of emptiness.");
		}
		output("\n\n");
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("The storm lancer");
		output(" flicks his hand a few times to clean it, splattering the snow with the remnants of his old cumplug and ");
		if(!pc.isSquirter()) output("copious droplets");
		else output("thick strands");
		output(" of your [pc.girlCum]. Like a bottle of sexual perfume being uncorked, a dense, undiluted cloud of your fertile pheromones immediately wafts up from between your [pc.thighs]. It blasts into the cundarian, whose nostrils flare just before his vertical pupils narrow and his cock thickens even further. He licks his lips in unconscious hunger, all of his usual boasting and taunting subsumed by his basest of urges: to breed you.");
		}
	//Not Pussy plugged
	else
	{
		if(pc.mf("boy","") == "boy")
		{
			if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
			else output("The storm lancer");
			output(" takes a particularly deep breath just before knitting his brow in confusion. <i>“Just what </i>are<i> you? Your body looks like that of a man ready to fight, but you have the sex and scent of a woman ready to breed. Can you not decide what it is you wish to be?");
			if(stormguardHonor() == 2) output(" It is remarkable you have done as well as you have with such a handicap.");
			else output(" Your nethers betray you, core-worlder. They scream that you are not made for battle. They shout that you are made for birthing true warriors. Perhaps you should listen to them and exchange the battlefield for the bedchamber!");
			output("”</i>");
		}
		//PC fem/andro:
		else
		{
			if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
			else output("The storm lancer");
			output(" inhales deeply before sighing in satisfaction. His enjoyment of your fertile scent is obvious enough from that alone, but the powerful throbbing of his ridged cock helps drive the point home. That pillar of raw virility stands at eager attention as your pheromones waft up to the cyan barbarian, the lusty chemicals no longer being diverted by the harsh winds outside the high-tech bubble.");
			if(stormguardHonor() == 2) output("\n\nThe cundarian beams down at you with a self-congratulatory grin, his inhuman eyes glowing like magma. <i>“By the Elements, I can scarce imagine a sweeter victory than this. I know a valkyrie such as yourself understands how to harness the fire in her loins to fight even harder than usual. Now I have beaten you not only at your best, but your most fertile, and a warrior woman storm lancers dream of is mine to breed!”</i>");
			else if(stormguardHonor() == 1) output("\n\nThe cundarian stares down at you briefly with a mirthful twinkle in his inhuman eyes. <i>“I had not realized during our battle what condition you were in. Now I can’t help but wonder in light of this: were you too distracted to fight properly, or did you focus your desires and surpass yourself?”</i> He strokes his tentacle-beard in thought for a moment before chuckling to himself. <i>“It matters little. I have beaten you, and your ripe womb is now mine to seed.”</i>");
			else if(stormguardHonor() == 0) output("\n\nThe cundarian frowns down at you with disdain in his serpentine eyes. <i>“How utterly unsurprising. You cannot even challenge me at your best, much less in this wanton state. There is no honor in defeating you at the best of times, but as you are now it is downright dishonorable.”</i> His voice is dripping with condescension, but as you whimper and spread your [pc.thighs] in a show of readiness, his cock betrays his desire for you.");
			else output("\n\nThe cyan barbarian snorts like a bull, but his disgusted tone sounds increasingly forced as he stews in the growing pheromone cloud polluting the atmosphere inside the high-tech bubble. <i>“A pretty little thing who cannot even control her body dishonors her opponents. You could easily find a man to seed you whenever you pleased. I take little joy in claiming your slatternly hole, but...”</i> the hulking warrior pauses briefly to stare at your lust-slicked cunt" + (pc.totalVaginas() == 1 ? "" : "s") + ". He unconsciously licks his lips before continuing, <i>“I am not so cruel as to leave your womb unfilled when you are clearly in great need.”</i>");
		}
	}
	output("\n\nStrong, blue hands suddenly seize your [pc.hips] and flip you onto your front at the same moment that ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" drops to his knees. You reflexively try to get your [pc.legs] under you, but you quickly realize that your weight is being entirely supported by ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s powerful grip on your [pc.hips]. Under normal circumstances this might seem painful to you, but on the primitive level you’re operating on now, the rough treatment just sends flutters of excitement through your belly. When you feel the course ridges of a huge cundarian cock land meatily on your [pc.ass], those flutters become outright trembles.");

	output("\n\nYou can feel ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s balls pressing into your [pc.cunt " + x + "] as he hotdogs you, and you immediately begin fantasizing about all the virile jizz those orbs will soon be pumping into your womb, filling you to the brim until you’re gravid with an entire litter of this brutish male’s spawn. Your [pc.cunts] leak");
	if(pc.totalVaginas() == 1) output("s");
	output(" even more [pc.girlCum] at the thought, ");
	if(!pc.isSquirter()) output("wetting his sack until it shines");
	else output("drenching his sack with a [pc.girlCumFlavor] waterfall that drips off of him in [pc.girlCumVisc] ropes thick enough to melt the snow under him");
	output(", instinctively preparing for the rough mating to come. The enticing smell of your pussy grows even stronger as your soon-to-be stud grinds his cock between the cheeks of your [pc.ass], causing him in turn to thrust more roughly against your backside, arousing you even further in a feedback loop that only ends when ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" finally slips the head of his cock down your taint and splits your [pc.cunt " + x + "] wide open with one bestial thrust.");

	if(pc.isTreatedCow()) output("\n\nThankfully, your Treated pussy was made for this sort of violent coupling. It accepts the sudden and massive penetration with no difficulty while still wrapping around it like a mould, working it from head to base with muscular contractions that demand as rapid an insemination as possible.");
	else if(pc.vaginas[x].looseness() < 3) output("\n\nThough it would normally be an agonizingly slow process to take such a massive insertion, your heat has made your pussy more receptive than a dozen hours of foreplay could. You tremble and open your mouth in a mute shriek, already nearly creaming the cundarian’s club-like member as it deforms your tight walls into a reverse mirror of itself, complete with sinfully-stimulating ridges.");
	//Loose: 
	else output("\n\nFew cocks are ever a snug fit for your experienced pussy, but your heat has made your slutty hole not only yielding, but accommodating. It accepts the massive insertion easily while still giving it a little resistance, just enough for the both of you to enjoy the way the cundarian’s ridges stretch and scrape the loose walls of your slit.");
	output(" Once he hilts himself in you, the alien warrior tightens his grip on your [pc.hips] and holds you still, savoring the feeling of your hot, wet cunt, using your desperate womanhood as little more than his personal dick sauna. You ");
	if(pc.isTreated()) output("moo");
	else output("moan");
	output(" in frustration, and, unable move your hips as instinct drives you to, you clench your inner muscles around his club-like cock.");

	pc.cuntChange(x,enemy.cockVolume(0));
	
	if(flags["MET_GEL_ZON"] != undefined) output("\n\nGel Zon");
	else output("\n\nThe storm lancer");
	output(" grunts with the effort of restraining himself. He breaks your concentration with a sharp spank to your buttock, glaring at you reproachfully when you look back at him in shock. He doesn’t have to say anything: you know he won the fight, and that means he decides the pace of this. You resolve yourself to total passivity with a whimper, lowering your head and torso below your [pc.hips]");
	if(pc.tailCount > 0) output(" and raising your [pc.tails]");
	output(", presenting your fertile [pc.cunt " + x + "] like ");
	if(pc.ausarScore() > 2 || pc.canineScore() >= 2) output("the bitch in heat you are.");
	else output("a bitch in heat.");
	output(". It’s an instinctive display of submissiveness that simultaneously places your womb lower than your entrance, positioning yourself to allow gravity to carry your stud’s sperm to your eggs as quickly as possible.");

	output("\n\nOnce he sees you’ve fully accepted your place, ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" takes a deep breath to regain his composure. This backfires immediately as the cyan conqueror heaves a deep breath of your pheromones. He empties his lungs in a feral sound somewhere between a growl and a roar and begins grinding his thick shaft deep into your cunt. His exotic ridges rub and stroke your folds, violently scraping across every sweet spot in your pussy until you’re arching your back and screaming in overstimulated bliss.");

	output("\n\nYour cunny spasms fitfully in response to the alien phallus grating against all the nerves of your vaginal walls. ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The storm lancer");
	output(" slaps your raised [pc.ass] again to still your clenching motions, but the blow only makes your slit milk his cock even harder for a moment. When another, harder spank only yields even more frantic clenching and a pleasured yelp from you, the cyan brute snarls and resigns himself to your coupling being quick and dirty. To that end, he withdraws his pillar-like member all the way to the very tip, dripping ");
	if(!pc.isSquirter()) output("strands");
	else output("ropes");
	output(" of your [pc.girlCum] into the snow. You groan at the painful emptiness in your gaped cunt, but your groan transforms into an ecstatic scream when ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" slams back into your hole at full force, his hips slapping into your [pc.ass] with a wet clap as his bloated sack hits your [pc.clits] like two flesh wrecking balls.");

	output("\n\nMind-numbing tension coils in your middle and between your pussy-drenched [pc.thighs] as the virile barbarian repeats his motion, his thrusts building in both speed and force until each hilting slam splatters more of your pheromonal [pc.girlCum] onto his crotch");
	if(pc.wetness(x) >= 3) output(" and even up to his chest");
	output(". The smell of your raw fertility drives the normally-measured warrior into an animalistic rut. ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The storm lancer");
	output(" has almost utterly surrendered to his urges to breed you, and though you’re too focused on the hard maleness filling your [pc.cunt " + x + "] to verbally beg him to cum, he’s obviously pleased with the bestial moans and whimpers you manage to slur out between his balls-deep thrusts.");

	output("\n\nIn what feels like mere moments, your [pc.hips] begin to tremble violently in ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s iron grip. Your shameless grunts and pleas crescendo into an ear-splitting ");
	if(pc.felineScore() >= 3) output("yowl");
	else if(pc.isTreated()) output("moo");
	else output("howl");
	output(" of ecstasy, and the tension in your body finally snaps. Overwhelming pleasure seizes your nerves, and you thrash like a trout on a line as your cunt throws itself fully into its true evolutionary purpose. The huge stud behind you hisses through his teeth as his breeding rod is assaulted by your love tunnel’s ");
	if(pc.isTreatedCow()) output("scientifically-engineered ");
	output("dick-draining ");
	if(silly) output("cunt-traction");
	else output("contractions");
	output(". Fragrant girlcum");
	if(!pc.isSquirter()) output(" streams down your inner thighs to puddle under your [pc.knees]");
	else output(", pressurized by the thick cock filling you, squirts out in a flood of fine droplets that coats everything in the vicinity");
	output(". The [pc.girlCumFlavor] odor of your [pc.pussy " + x + "] creaming his cock deepens the cundarian’s rut. You’re clamping down hard enough that ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s thrusts should be stopped, but he barely even slows. If anything, his masculine hips slam into you even faster.");

	output("\n\nThe wonderful sensation of his cock’s ridges plowing into your spasming slit is almost unbearable. One after another, your [pc.eyes] roll back into your head, your limbs fail you, and your orgiastic cries crack into hoarse whines. Your face lands in the snow, your brutal mate’s thrusts dragging it through the powder. Only his hands on your [pc.hips] keeps your lower half aloft, and you’re silently grateful that the cyan alien is strong to keep your womb positioned where it belongs.");

	output("\n\nThe overstimulation frays your sanity, and you instinctively try to close your nervelessly-twitching [pc.thighs] in an effort to slow the rutting male atop you. When your attempt to impede ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s thrusts fails miserably, you focus the last shred of your willpower on working your disobedient pelvic muscles in a last, desperate battle with the cundarian’s manhood. Though it’s a long fight, you lose it as soundly as you lost your conventional battle. Your orgasm eventually flags in the face of ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output("’s endless stamina, and he roars victoriously as he feels you finally go limp beneath him. He stills his hips for a moment, taking the chance to come back from his edge.");

	output("\n\nAs unforgettable as your climax was, it brings you no relief. The heat in your womb");
	if(pc.totalVaginas() > 1) output("s are");
	else output(" is");
	output(" as powerful as when you started. You don’t need to be fucked, you need to be <i>bred</i>, but ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" seems to have every intention of selfishly enjoying himself for as long as possible before inseminating you. His monastic discipline shines through even his rut, allowing him to power through the urge to just let you milk him dry. You whimper as the hulking brute resumes rutting you, knowing even the orgasm building anew in your lower half is little more than a temporary distraction from your true desire. Unfortunately, you are powerless to do anything but cream your stud’s rod as hard as you can.");

	output("\n\n");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The storm lancer");
	output(" fucks you thrice more to the same mind-shattering height of ecstasy. By now, the only muscles in your body that do more than spasm at random are the ones in your [pc.cunt " + x + "], which feels sore and exhausted. Even your used and abused box would’ve gone slack if not for your all-consuming drive to be seeded by the strongest mate you can find. This cundarian stud has undoubtedly proven his strength to you in every way, including by holding back on blowing his load in you for as long as possible. Just as you begin to considering praying to whatever god ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(" is obviously blessed by, your benediction is preemptively answered. The barbarian’s stamina finally runs out, and you let out a happy croak from your raw throat as his sweat-drenched body crashes into you one last time, burying his rod as deep inside you as possible just before his virile balls begin to clench against your [pc.clits].");

	output("\n\nEndorphins swamp your lust-hazed brain, a reward from its deepest depths for giving in to the most primal of all instincts. A final, more peaceful orgasm comes with the first lance of alien seed from ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("the storm lancer");
	output(". You tremble with relief and press yourself even harder against him as you cream his cock one last time. Throughout your orgasm, your puffy labia serve gloss your mate’s clenching nuts with one last [pc.girlCumVisc] coat of feminine ejaculate.");

	output("\n\nSo relaxed and fulfilled are you that you initially don’t sense the bizarre sensations in your tender pussy. What finally makes you take notice is the bizarre way in which the cundarian is cumming. Each wondrous pulsation of his potent seed is accompanied by another carnal bellow and another tug of your [pc.hips] towards him, exactly the same as when he first started pumping his load into you. His cum feels light, almost foamy, but it still manages to bloat your hungry womb, distracting you with fantasies of his sperm floating towards your eggs.");

	output("\n\n");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The storm lancer");
	output(" pulls his hips back until just his crown is inside you. There, with a final roar of effort and pleasure, he spurts one last lance of seed, filling the aching gape he hammered into your pussy. Without warning, he releases your hips and grabs your hands instead, holding your arms over your back with a sweaty grip.");

	output("\n\nHe explains himself to you between heaving breaths. <i>“A bit of insurance,”</i> he says in a hoarse mutter. ");
	if(stormguardHonor() == 1) output("<i>“A reminder as well. If my seed somehow does not take, then you’ll remember who kept you from seeking out another man and finding relief. Let that motivate you to find the strength to take revenge. Or let it remind you how pointless the effort was.”</i> He slaps your bruised-feeling [pc.butt] and then, with a satiated, rumbling sigh,releases your arms.");
	else if(stormguardHonor() == 0) output("<i>“I’m sure it will be needed. A harlot as wanton as you would otherwise fall before the very next man and beg him to seed her.”</i> He smacks both your buttocks at once before laughing mockingly. <i>“If you want cundarian children, you’ll have them on cundarian terms.”</i> Then, with a satiated, rumbling sigh, he releases your arms.");
	else output("<i>“Though I doubt it is needed. You are honorable enough I am sure to contain your lusts. Then, if my seed does not take, you may seek me out again, to punish me for my hubris, perhaps slake your need on me.”</i> He sighs with pleasure at the thought. <i>“I pray my seed will take. If it does... then you will bear the strongest, fiercest children the galaxy has ever known!”</i> With that, he releases your arms.");

	//just put the rest of the regular vaginal loss scene's ending here because I'm lazy and way over my word budget already
	output("\n\nBy the time you get your hands down to his hardening seed, the cloudy foam has hardened and formed a perfect, blue-colored plug. It stretches your pussy lips, seems to be bigger outside than in, and no matter how you attack it with your fingers, you - can’t - get - it - out. The sensation of being swollen with hot air has dissipated a bit at least, but until you ");
	if(flags["SHOWERED_OUT_PLUG"] != undefined) output("have a shower");
	else output("work out a way to get this thing out of you");
	output(", nothing is getting in or out of your [pc.vagina " + x + "]. The problem this is going to cause becomes evident as you’re putting your things back on - the solid, smooth cum block rubs your lips and [pc.eachClit] as you move, constantly arousing you and reminding you of your utterly stuffed pussy.");
	output("\n\nThe storm lancer has left his spear stuck in the ground for you, the energy shield it generates still holding. It winks off as you step back into the howling gale. ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The cundarian");
	output(" has returned to his lying position, hardened back up against the freeze - except now he has a big, pleased grin on his blunt features.");
	output("\n\nPerhaps you could bring a sledgehammer next time.");
	processTime(45);
	for(var y:int; y < 5; y++) {pc.orgasm();}
	IncrementFlag("SEXED_SG_MALE");
	IncrementFlag("SG_DEFEATED_PC");
	//So that heat sex loss and femdom victory scenes cause pregnancy but normal loss doesn't
	var fertileStormguard:StormguardMale = new StormguardMale();
	fertileStormguard.impregnationType = "StormguardPregnancy";
	pc.loadInCunt(fertileStormguard,x);
	flags["SG_PREG_SOURCE"] = 2;
	stormguardHonor(1);
	output("\n\n");
	CombatManager.genericLoss();
}

//Storm Lancer Throatfuck
//By QuestyRobo
//Requires a big, but not massive dick.
//[Throatfuck] Tear his noisehole a new one! {Too small:You would, but you don't think you're quite large enough for it to really have the effect you want./Too big:Easy there, wanna put him in his place, not tear his jaw off!}
public function stormlancerThroatfuck(x:int):void
{
	clearOutput();
	showStormguard(true);
	author("QuestyRobo");
	//Honor 0-1
	if(stormguardHonor() < 2)
	{
		output("This guy sure loves to talk shit doesn’t he? And yet, here he is, battered and beaten by your own hands");
		//repeat:
		if(flags["SG_BIG_BJ"] != undefined) output(" again");
		output(". Speaking of talking, he does have a nice mouth on him, doesn’t he.");

		output("\n\nHe grimaces at you, angered at the notion that he’s completely in your hands. ");
		if(!pc.isCrotchExposed()) output("You rip off your [pc.crotchCovers], exposing your half-hard, and rapidly hardening [pc.cockNounSimple " + x + "]");
		else output("You grab your [pc.cock " + x + "] and start stroking it to full hardness.");
		output(" You rub your meat in his face, making him savor the size and texture of your " + pc.mf("","wo") + "manhood.");

		output("\n\nHe almost seems like he’s going to bite it a few times; that’s rude! Seems like his mouth is ");
		//repeat:
		if(flags["SG_BIG_BJ"] != undefined) output("still ");
		output("a bit naughty, you’ll have to sort that out! You grab the defeated lancer by the sides of his head and shove him down on your [pc.cockNounSimple " + x + "], impaling him almost halfway in a single stroke.");
		if(pc.cockTotal() > 1)
		{
			output(" Your other dick");
			if(pc.cockTotal() > 2) output("s find their");
			else output(" finds its");
			output(" home on the side");
			if(pc.cockTotal() > 2) output("s");
			output(" of his face.");
		}

		if(flags["SG_BIG_BJ"] == undefined)
		{
			output("\n\nHis throat is virgin tight, and you find you have some difficulty getting smooth strokes. You’re gonna need some time with this boy in order to get him ready for this!\n\nHe gurgles and meekly bangs against your [pc.hips], trying to get you to stop.");
			output("\n\n<i>“Sorry bitch, there ain’t no brakes on this fuck train! Next stop, the back of your throat!”</i>");
		}
		else 
		{
			output("\n\nOoooh, this is much better than the first time! He’s still tight, but he knows good enough now how to make enough room for you.\n\nHe gags, but doesn’t physically protest you entering his mouth.");
			output("\n\n<i>“Good, good, just sit back and let the big " + pc.mf("boy","girl") + " work!”</i>");
		}
		output(" You pull back for a split second before slamming in again. He gags again, and huge wads of spit go flying out of the tight seal between your cock and his lips. He looks up at you, wide-eyed, trying to stay, or at least appear defiant while you ravage his mouth.");

		output("\n\nYou up your tempo, gripping him so tight that you’re sure it’s starting to hurt a bit. You don’t care though, you need the leverage so you can continue your phallic ramming assault on the keep of his esophagus.");

		output("\n\nHis protests wind down, suspiciously so. You look down to make sure he hasn’t passed out and see something that brings an even bigger grin to your face. Both of his hands have wandered down to his crotch ");
		//First:
		if(flags["SG_BIG_BJ"] == undefined) output("and are rubbing a very pronounced bulge in his pants.");
		else output("and have actually dug out his cock and begun to jerk it off. What a slut!");
		output(" You laugh as you see that you’ve finally broken him in after all that bluster. Oh baby that gets you going!");

		output("\n\n<i>“What’s wrong? I thought you were some kind of warrior, but here you are, drooling over getting your throat fucked like some kind of bimbo slut! Maybe you should just give up the ghost and start turning tricks in alleyways? I bet you’d love that.”</i>");

		output("\n\nHe moans out weakly in response, barely even cogent from your brutal fucking.");

		output("\n\n<i>“Don’t pass out now, I’m just about there.”</i> You call out as you feel your [pc.balls] start to clench, and the muscles in your lower half starting to work overtime as you rush toward orgasm.");
		IncrementFlag("SG_H0-1_BIG_BJ");
	}
	//Honor 2
	else
	{
		if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
		else output("The Lancer");
		output(" looks up at you expectantly. Unsurprising, considering how many times you’ve been through this little song and dance. Part of you wants to drag the boy away and make him your personal cock-holster, but you’re content to enjoy the more simple pleasures, for now.");

		if(!pc.isCrotchExposed()) output("\n\nYou simply thrust your crotch out, wordlessly telling your bitch boy what he needs to do. He goes to it with gusto, almost tearing off your [pc.lowerGarments] to expose your [pc.cocks]");
		else output("All you have to do is shake your [pc.hips], sending your [pc.cocks] swaying, and he comes running up like a dog after you shake its food bowl.");

		output(" He gets to work, stroking you off, lapping at your [pc.cockHead " + x + "], ");
		if(pc.balls > 0) output("massaging your [pc.balls], ");
		output("all to push you to full hardness. It doesn’t take that long. The sight of the proud warrior so willingly submitting himself ");
		//First:
		if(flags["SG_BIG_BJ"] == undefined) output("is making");
		else output("continues to make");
		output(" you swell with dominating, prideful lust.");

		if(flags["SG_BIG_BJ"] == undefined) output("\n\n<i>“You’re quite the cockslut, aren’t you?”</i>");
		else output("\n\n<i>“You’re turning into quite the little cocksucker, aren’t you?”</i>");

		output("\n\n<i>“The chance to properly service a worthy warrior is not something to be ashamed of,”</i> he says with the confidence you wouldn’t expect out of somebody working over a [pc.cockShape " + x + "], but that’s more than fine with you. You reach full hardness in seconds, showing the cundarian the full tumescence of your tool. He grunts softly in approval as he pulls back and looks up at you again.");

		output("\n\nHe looks into your eyes with a restrained desire, that quickly becomes unrestrained as soon as you see his gaping mouth and lolling tongue. The warrior slut is practically begging you to take him, and you’ll be damned if you’re gonna leave him hanging!");

		output("\n\nYou roughly grab him by the side of the head and shove [pc.oneCock] in");
		if(pc.cockTotal() > 1) 
		{
			output(", leaving the other");
			if(pc.cockTotal() > 2) output("s");
			output(" to slap against his face");
		}
		output(". You take a second to line yourself up, savoring the quiet, meek moan of desire he lets out before you ram yourself in.");

		output("\n\nWads of spit go flying as you nearly hilt yourself in a single stroke. ");
		//Haven’t done Honor 0-1 variant:
		if(flags["SG_H0-1_BIG_BJ"] == undefined) output("You take a second just to admire how accommodating his fuckhole is; properly serving indeed!");
		else output("Now he can take you in one go? You knew he was holding back before.");
		output(" You give him a second to adjust, but not a bit more. Almost immediately you’re building up your momentum, pulling out to the [pc.cockHead " + x + "] and then burying yourself right back in.");

		output("\n\nHe takes it ");
		//repeat:
		if(flags["SG_BIG_BJ"] != undefined) output("unsurprisingly ");
		output("well, clenching his throat in just the right ways to keep you going in and out smoothly. He coughs and gags a bit at first, but as you hammer him faster and faster, he quickly gets used to your pace. Soon there’s nothing but the blissful sounds of his throat molding around your [pc.cock " + x + "], and the copious amounts of drool leaking out the seams.");
		output("\n\nAnother noise soon joins the chorus, the familiar sound of someone jerking it! You look down and see that he’s pulled his cock out from under his armor and begun to stroke it. You almost want to reach down and stop him, but a strong clench in your [pc.balls] stops you dead as you get ready to greet your orgasm.");
	}
	//Merge
	//Low output:
	if(pc.cumQ() < 1000) 
	{
		output("\n\nYou ram into his throat as deep as you can and unload. The way his throat muscles clench along with you helps prolong your orgasm. You leave him with a good helping of [pc.cum] in his gut to think about, as you pull out. He breathes in and out, heavily, but more than that, you notice that he’s stopped working himself over, seemingly just on the verge of orgasm.");
		output("\n\n<i>“I-”</i> He gasps. <i>“-have not earned my release, yet. Next time, however, I will have <b>your</b> throat, and shall savor it greatly.”</i> He gets up, thoroughly blue-balled, and takes his leave, as you gather your gear back up.");
	}
	//High output:
	else if(pc.cumQ() < 10000) 
	{
		output("\n\nYou bottom out in his throat and sigh in relief as you unload inside him. His throat clenches along with your pulses, at first. When he realizes you aren’t stopping, he becomes a bit more frantic. When his stomach starts swelling from the sheer tide of [pc.cum], you can tell that he’s struggling. He takes it like a trooper, though, and not a single drop leaves his lips. When you finally wind down, you pull out, making sure to give him one last taste on his tongue, which he quickly swallows. He breathes in and out, heavily, but more than that, you notice that he’s stopped working himself over, seemingly just on the verge of orgasm.");
		output("\n\n<i>“...Don’t you find this a little excessive?”</i>");
		output("\n\n<i>“Nope, looks fine from where I am!”</i>");
		output("\n\n<i>“Fine, but don’t think I won’t remember this when I am victorious.”</i> He gets up, thoroughly blue-balled, and takes his leave, as you gather your gear back up.");
	}
	//Are those balls or is that a fuel tanker between your legs?
	else
	{
		output("\n\nYou ram yourself to the hilt inside his throat as you explode inside him. His throat muscles spasm as he feels your first shot flood his gut to bursting. The second burst balloons him out to <i>“nine-months pregnant”</i> levels, making him gurgle in protest. Your third shot causes twin [pc.cumColor] streams to shoot out of his nostrils. You decide that that’s the point to pull out, and midway through your fourth shot, you exit his throat.");
		output("\n\nHe coughs up wads of [pc.cum], only to be coated by rivers of the stuff as you grab onto your [pc.cock " + x + "] and jerk yourself through the last of your orgasm. By the time you’re done, ");
		//normal or other white colored cum:
		if(pc.fluidColorSimple(pc.cumType) == "white") output("it’s hard to distinguish him from the snow around him.");
		else output("he’s turned solid [pc.cumColor], contrasting heavily against the white snow around him.");
		output(" He falls over, meekly coughing and spasming as he lays in the snow.");
		output("\n\nYou move up to see if he’s alright, but he raises a shaky palm and waves you away as he rises to his feet and stumbles away. You tell yourself he’ll be fine as you re-dress yourself and get ready to move back out.");
	}
	IncrementFlag("SG_BIG_BJ");
	processTime(15);
	pc.orgasm();
	output("\n\n");
	stormguardHonor(1);
	CombatManager.genericVictory();
}
/*
Dominate
//Ride his dick until he passes out. 
//Must have won 5 times in a row & have vag & know his name.
//Puts Gel Zon on cd for 24 hours. Poor boy is tuckered out.
*/
public function femdomSGOhhhhYeeeeaaahhh(x:int):void
{
	clearOutput();
	showStormguard(true);
	author("Maye");

	if (pc.isBimbo())
	{
		output("<i>“It seems this naughty boy needs");
		if (flags["SG_FEMDOMMED"] == undefined) output(" even more");
		output(" special attention,”</i> you giggle");
	}
	else
	{
		output("<i>“It seems you need");
		if (flags["SG_FEMDOMMED"] == undefined) output(" to be reminded of your place");
		else output(" additional lessons");
		output(", boy,”</i> you state");
	}
	output(" before ripping off the cundarian’s armored shorts.");

	output("\n\nGel Zon stands in the protective heat bubble, his fourteen-inch dick fully erect at the sight of the fierce warrior [pc.man] that defeated him, pushing his arousal to the utmost limits. His cock throbs with impotent need, your battle prowess repeatedly denying the cundarian the prize he so desperately craves.");

	output("\n\nYou continue to undress the lancer, stripping off his armor chestplate and letting it drop down to the ground with a clang. Gel’zon stands before you completely nude. Even if he is a terrible fighter, you can’t help but admire his body.");

	output("\n\nReaching out, you grab the tip of his manly spear. He shudders at your touch as a single bead of pre oozes from the head of his prick. Wrapping your fingers around the entirety of his length, your hand languidly runs down the length of his nubby, ridged flesh.");

	output("\n\n<i>“No,”</i> he cries. <i>“I do not deserve this. I");
	if (flags["SG_FEMDOMMED"] == undefined) output(" still");
	output(" have not proven myself worthy!”</i>");

	output("\n\nYou ignore him, continuing on past his base to stroke his muscled, beefy ass before grasping his thick tail.");

	output("\n\nYou suddenly yank it, pulling him down into the snow below. You");
	if (pc.isNaga()) output(" leer");
	else output(" stand");
	output(" over his body triumphantly");
	if (!pc.isNude())output(" and begin stripping off your [pc.gear]");
	output(", eager to claim your prize. The man stares at your naked body in a stupor, as if you are the most beautiful thing he’s ever seen. You");
	if (pc.isNaga()) output(" wrap your tail around his legs, pressing his fat cock between the twin petals of your sex.");
	else
	{
		if (pc.isTaur()) output(" press your hindquarters down");
		else output(" kneel down");
		output(", sandwiching his fat cock between your [pc.buttcheeks].");
	}
	output("\n\n");
	if (pc.isBimbo()) output("<i>“You just won’t stop. Do you really want me that bad?”</i>");
	else if (flags["SG_FEMDOMMED"] == undefined) output("<i>“You should be praised for your persistence at the very least,”</i>");
	else output("<i>“Did you have fun last time, is that why you’ve kept challenging me?”</i>");
	output(" you tease, grindng your");
	if (pc.isNaga()) output(" pussylips");
	else output(" [pc.ass]");
	output(" against his shaft.");

	output("\n\n<i>“Stop,”</i> he protests, gritting his teeth as he mentally resists the temptations of your body. <i>“I am weak! I would only sully your beauty.”</i>");

	output("\n\nYou press your hand against his mouth and silence him. Vivid yellow eyes glare at you.");
	if (pc.isBimbo()) output(" <i>“Mine,”</i>");
	else output(" <i>“No, I am the one claiming you,”</i>");
	output(" you say, reaching back to grasp his thick man-meat. <i>“");
	if (flags["SG_FEMDOMMED"] == undefined) output("Did you forget?");
	if (pc.isBimbo()) output(" Only I get to use this yummy dick now.”</i>");
	else if (pc.isAss()) output(" This dick is mine and it will serve.”</i>");
	else output(" This dick belongs to me now, boy.”</i>");

	output("\n\nPushing off the cundarian, you raise your");
	if (pc.isNaga()) output(" tail");
	else output(" ass");
	output(" in the air, hovering over his pinned penis as droplets of arousal drip off your wanting folds. The cundarian sighs heavily as you breathe in the scent of his potent musk; it is a reflection of Gel Zon’s intense need, his unabated lust for the " + pc.mf("warrior", "valkyrie") + " that he cannot defeat. He stares at you");
	if (flags["SG_FEMDOMMED"] == undefined) output(" in shock, seemingly confused by the foreign feeling welling up inside his body. His eyes, however, reflect his real desire - one he has likely never experienced;");
	else output(" with raw need;");
	output(" the man desperately wants to be taken by a powerful [pc.manWoman], to be ravaged by them and claimed as their mate.");

	output("\n\nYou line your [pc.vagina " + x + "] up with the head of his dick and let go. His ridged cock plunges into you, spreading your walls with its splendid girth.");
	if (pc.vaginas[x].hymen) output(" His spear breaches your sealed walls, battering down the gates which lead to your unused womb. The thought of this barbarian warrior breaking your hymen and filling you with his seed has you trembling with delight.");
	else if (pc.vaginas[x].looseness() <= 3) output(" Inch after inch of his flesh slowly disappears into your tight walls.");
	else output(" It slides into you with ease, the entirety of his length swiftly sheathed inside your eager cunt.");

	if (pc.vaginas[x].hymen)
	{
		if (flags["SG_DEFEATED_PC"] == undefined) output("\n\n<i>“I am your first!?”</i> he cries out. <i>“No! This is not mine to take! I have dishonored you!”</i>");
		else output("<i>“What core-worlder magic is this!? This is not my first taste! How are you still pure?!”</i>");
	}
	if (flags["SG_FEMDOMMED"] == undefined) output("\n\n<i>“Awww, I bet it would have felt better if you earned it,”</i>");
	else output("\n\n<i>“The real magic is how my twat is going to squeeze out every last drop of your cum,”</i>} you coo.");
	pc.cuntChange(x,enemy.cockVolume(0));
	output("\n\nYou look at Gel Zon, his brilliant eyes meeting yours.");
	if (pc.isBimbo()) output(" <i>“Think you’re man enough for me,”</i> you giggle");
	else if (pc.isAss()) output(" I hope you fuck better than you fight,”</i> you taunt");
	else output(" <i>“You know, lancer. The bedroom is just another battlefield. Think you can defeat me?”</i> you grin");
	output(" before pushing off his body and letting his cock partially slide out.");

	output("\n\nRecognizing the challenge you’ve just issued, the sullied cundarian grits his teeth and thrusts his hips upwards just as your own drop down to meet his blow. Your");
	if (pc.isGoo()) output(" gooey hips slam into his");
	else if (pc.isNaga()) output(" serpentine tail slams into his hips");
	else if (pc.isTaur()) output(" tauric hind-end slams into his hips");
	else output(" hips slam into his");
	output(", an audible");
	if (pc.isGoo()) output(" squelching");
	output(" slap echoing out across the white snow. <i>“Yes!”</i> you cry out, <i>“Fight me! Show me that warrior spirit!”</i>");

	output("\n\n<i>“I’ll show you a spirit forged by the fire that runs in my blood. I’ll show you an endurance sculpted by long nights of meditation in the snow,”</i> he yells. <i>“I shall not lose again!”</i>");

	output("\n\nThe battle joined, you continue bouncing up and down on his dick fervently. Your quim clings to his member, gripping and squeezing his man meat, demanding insemination. His pent-up balls slap against your ass with every impact. Your repeated victories have left Gel Zon with no outlet, the lancer abstinent in the hope his ardent desires would allow him triumph. You couldn’t have planned it better.");

	output("\n\nA pleasured moan escapes your lips as lurid fantasies fill your mind and you can’t help but shiver in delight at the idea of his bloated orbs flooding your womb with his spunk. The thought of them pumping you full of this barbarian brute’s potent seed and making your belly swell with his spawn is almost overwhelming.");

	output("\n\nYour hips move faster and faster, feverishly fucking his girthy rod. The scent of your own arousal wafts through the air, pulling the man deeper into your clutches.");
	if (pc.hasCock())
	{
		output(" Your [pc.biggestCock] slaps his muscled stomach, in rhythm with the descent of your hips, the sound like an erotic metronome of your lust.");
		if (!pc.isNice() && (pc.biggestCockLength() >= 14)) output(" <i>“Look at this cock, Gel Zon. This is a real penis, the dick of a mighty warrior,”</i> you taunt.");
	}
	else if (!pc.isNice()) output(" Are you even trying?”</i> you tease. <i>“I can barely feel it.”</i>");

	output("\n\nGel Zon’s eyes have clouded over, the fallen barbarian having fully surrendered to his instinctual need to breed you. You revel in your conquest of this strong alpha male, your superiority made clear. All he needs now is a final push.");

	output("\n\nYou press your lips against his ear, letting your hot breath wash over them. <i>“Breed me,”</i> you moan softly. <i>“Fill my womb with your seed.”</i> Something inside Gel Zon snaps and the warrior begins feverishly pounding your cunt with animalistic fury. <i>“Breed me!”</i> you scream as your fingers grip him tightly and your nails dig into his flesh.");

	output("\n\nWith a loud grunt, the lancer thrusts upwards, pushing deep inside until the tip of his prick presses against the very entrance of your womb. His balls pull tight as thick cum surges up his dick. It pours into you,");
	if (pc.isGoo()) output(" his brilliant blue cum swirling through your translucent body, staining you with the color of his seed");
	else output(" flooding your womb with his virile sperm");
	output(". The first drop of his frothy load pushes you over the edge. Your [pc.legs] shake and [pc.hips] quiver as your pussy clamps down on his throbbing spear, intent on fulfilling its biological purpose.");
	if (pc.hasCock()) output(" Thick ropes of [pc.cum] spurt from your [pc.cocks], splattering all over Gel Zon’s face and chest in a brilliant sheen of [pc.cumColor].");
	output(" Explosions of pleasure wrack your body and you can’t help but cry lewdly in delight, your [pc.girlcum] leaking out,");
	if (!pc.isSquirter()) output(" drenching");
	else output(" covering");
	output(" his crotch and thighs with your liquid lust.");

	output("\n\nIt is not enough. The fire in your womb still burns. This paltry offering is not even close to satisfying your instinctual desires. You need more! Standing up, you let his brilliant blue cum ooze out of your gaping hole, down onto the winded warrior below. Exhausted from the exertion of his rutting frenzy, the barbarian lays there as you");
	if (pc.isNaga()) output(" slither");
	else output(" walk");
	if (pc.isTaur()) output(" forwards");
	else output("backwards");
	output(" until your [pc.vagina " + x + "] hangs over his head. With an unceremonious plop, you sit on his face, smearing his face with your shared fluids.");

	output("\n\n<i>“Clean it, weakling,”</i> you demand. Gel Zon mumbles a reply, a hint of defiance present in his eyes. You quash those smoldering embers of resistance by");
	if (pc.isTaur()) output(" pressing even more of your tauric weight against his face");
	else output(" reaching down and grabbing his tentacles. You yank on them, burying his face even deeper in your cunt");
	output(". He gives in and his tongue slips out to lick your petal soft folds, your subservient vassal soon slurping and sucking away.");

	output("\n\nYou gasp when his tentacles suddenly brush against your sex. The prehensile appendages gently caress your [pc.clits], their tiny tips teasing you in ways a finger never could, lathering attention onto");
	if (pc.totalClits() >= 2) output(" them");
	else output(" it");
	output(" until you are left grinding against his face. His tongue soon parts your feminine lips, revealing the plug of blue semen blocking your tunnel and you push into him. You need to be free of this seal.");

	output("\n\nGel Zon works away at the seal, until, finally, you are satisfied he is properly servicing your quim,");
	if (!pc.isTaur()) output(" you push up and twirl around to face his legs. Your [pc.vagina " + x + "] spins on his face, slathering him in your sexual effluence. Leaning down, you grasp");
	else output(" you lean down and grasp");
	output(" the barbarian’s member. Your face hovers mere inches away from his rod as you exhale, letting your hot breath wash over it. Twitching eagerly, the beast awakens from its slumber, stretching out to its full length in anticipation of the fuck to come.");

	output("\n\nHis thick, veiny prick throbs beneath you, practically begging for attention. You reach out to stroke the tip before sliding down his length, all the way to his balls. Cupping his cum-laden orbs in your palms, you slowly massage them, encouraging their productive efforts. The sight of these heavy spheres is beautiful. You need this savage’s seed. You want it to fill you and to breed you. Cradled in your soft hands, the virile orbs respond to your tender care. They bloat, frantically working to produce more sperm, their heat so fierce that it melts the snow nearby.");

	output("\n\nThe plug breaks and you shudder as a torrent of the lancer’s cum pours out onto his face. Finally, it’s gone. Standing up, you reposition yourself over his erection. Gel Zon groans as he realizes your intent. <i>“How can you possibly want more?”</i> he cries out. <i>“You fight like a frostwyrm, and you fuck like a horny milodan. You can’t be mortal. You.... You must be a " + pc.mf("god","goddess") + " of war in the flesh!”</i> You say nothing, only grinning as your pussy engulfs his cock once more.");

	output("\n\nA fluttering moan escapes your mouth as you bottom out. Fantasies flit through your mind as your hips rise and fall, your body now running on automatic");
	if (pc.hasCock()) output(" as your erect [pc.biggestCock] smacks away at the unconscious cundarian’s stomach");
	output(". The thought of this brute’s spunk spurting inside your womb and seeking out your eggs makes your entire body flush with desire. Your womb aches to be bred, crying out for the sperm of the man you’ve turned into your subservient stud. Primal instincts control your body and they cry out for impregnation, for you to breed and spread your glorious genes across the galaxy.");

	output("\n\nGel Zon is catatonic with pleasure and unable to mount any resistance. He merely lays there in the snow with his eyes rolled back. It doesn’t matter, the only thing you need is this splendid dick. His girth spreads your walls, the ridges lining his length massaging your tunnel and pushing you towards orgasm. This perfect penis completes you as if it was a missing puzzle piece you never knew you needed.");

	output("\n\nIt isn’t long before your legs begin to tremble and you cry out in sheer ecstasy as you orgasm");
	if (pc.hasCock()) output(", your penis painting his face [pc.cumColor] with your seed once more.");
	output(" Somehow, responding to your clarion call, the cundarian’s hips rise, the head of his throbbing cock pressing up against your cervix. Some primitive part of his brain still works, and it knows it is time to breed.");

	output("\n\nHis member swells with his release, the first lance of seed traveling up his distended cumvein and erupting into you. Every pulse of potent sperm sends shivers through your body. It floods your womb, the unconscious man emptying every single drop of his reserves. You bloat as his spunk overflows, his blue cum spilling back out around his prick and staining the snow below.");

	output("\n\nHis member twitches feebly as the last droplets of jizz emerge and it finally ends. You stand up, his spunk quickly hardening and sealing itself inside. Plumes of your fragrant pussy scent waft off the unconscious warrior. He is marked, your feminine musk claiming his cock as yours. All alone in these harsh snowfields with no easy way to cleanse himself, the smell of your lust will linger for weeks. With every breath he takes the cundarian will remember your sexual dominance over him. It is a reminder of his inferiority and of his inadequacy. A reminder that he is nothing but your vassal, merely a stud to use as you please.");

	output("\n\nHaving gotten what you want, you rub your belly fondly, enjoying the sensation of his lust sloshing around inside. Unfortunately, your quest calls and you redress, putting your equipment back on in preparation for the hostile environment. Once finished, you step outside the heat bubble and disappear into the storm.");
	output("\n\n");
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.createStatusEffect("STORMGUARD_CD");
	//24 hour CD.
	pc.setStatusMinutes("STORMGUARD_CD",60*24);
	IncrementFlag("SEXED_SG_MALE");
	IncrementFlag("SG_FEMDOMMED");
	//So that heat sex loss and femdom victory scenes cause pregnancy but normal loss doesn't
	var fertileStormguard:StormguardMale = new StormguardMale();
	fertileStormguard.impregnationType = "StormguardPregnancy";
	pc.loadInCunt(fertileStormguard,x);
	flags["SG_PREG_SOURCE"] = 1;
	stormguardHonor(1);
	CombatManager.genericVictory();
}
//Body Worship
public function gelZonWorshipsYouCauseUrBetterThanHim():void
{
	clearOutput();
	showStormguard(true);
	author("Maye");

	var pregSlot:int = pc.findPregnancyOfType("StormguardPregnancy");
	var x:int = pregSlot;

	if (pc.isBimbo()) output("<i>“I’m soooo horny! My body’s like...all...sensitive! Help me!”</i>");
	else
	{
		output("<i>“Well,”</i> you grin. <i>“Pregnancy has made my body <b>so</b> sensitive and horny.");
		if (pc.isAss()) output(" Get over here and service me.”</i>");
		else output(" Perhaps you can help with that, warrior?”</i>");
	}
	output("\n\nGel Zon activates his heat bubble and throws his spear to the ground. He walks over to you, his hand coming up to touch your swollen");
	if (pc.isTaur()) output(" tauric belly");
	else output(" stomach");
	output(". His hands work at your gear and he strips it away and lets it drop to the ground. Soon, your naked body is revealed in all its glory and the lancer gently guides you to the ground with a hint of veneration in his eyes.");

	output("\n\nWaves of potent, pregnancy-induced pheromones roll off your body, sinking their claws into the lancer and hypnotizing him into the willing service of his brood queen. His strong hands run over your flesh and they caress your belly. The sight of your taut tummy, swelling with his child has the man rock hard, so much so that an outline of his cock is visible through his armor.");

	output("\n\n<i>“Kiss me,”</i> you order. Your words goad the warrior into action. He is eager to please his revered " + pc.mf("god","goddess") + " of war. His rough lips press against yours and the barbarian’s tongue forces its way into your mouth. The lancer drinks in your sensual taste and you moan, the sound muffled by his kiss, the actions of this servile stud pleasing you. You delight in his virile, manly taste, but you’ve had enough. There are much more important areas of your body that he needs to service. A slight push on his chest and the cundarian relents, pulling away to await his broodmother’s next command.");

	if (pc.biggestTitSize() >= 3)
	{
		output("\n\nYou shake your breasts enticingly, making it clear where your dutiful servant should focus his attention. Gel Zon starts at your neck, kissing his way down your upper body until he arrives at the orbs of flesh you call your tits. He stares at them longingly, before burying his face in your chest. His hands firmly grasp your wobbling boobs, digging into your pliant flesh as his fingers assault your tender nubs and twist the sensitive buds until you can’t help but cry out in pleasure.");

		output("\n\n");
		if (pc.isLactating()) output("Your breasts are swollen with milk, preparing for the upcoming birth of your child. Droplets of [pc.milk] glisten on the tip of your nipples, his teasing has provoked its release. ");
		output("His lips lock around one of your buds, his mouth greedily sucking");
		if (pc.isLactating()) output(" down the bounty meant for his child. It feels wonderful, the sore fullness of your breasts quickly fading away as he drinks his fill");
		else output(" away at your teet");
		output(". The lancer switches tactics, one of his digits rubbing the very tip of your nub, his tongue hurriedly licking away at the other. You squirm under his ministrations, until finally, you can take no more.");
	}
	output("\n\nYou stare at your full belly, your action saying more than words ever could. Service your brood queen, your eyes demand. Show your appreciation for the fact I deigned to take your seed. Worship me like the " + pc.mf("god","goddess") + " you think I am. All that and more is conveyed by a simple glance. Your servant reacts, compelled by your unspoken command. The cundarian’s rough hands caress your");
	if (pc.isTaur()) output(" tauric underbelly");
	else output(" stomach");
	output(", touching the bulge inside which his child grows. He pulls away and his hands start fumbling with his lower armor, until finally it is undone and his brutish dick drops free.");

	output("\n\nGel Zon’s cock throbs with desire, but you have no intention of letting him slate his lust, this libidinous ritual solely about pleasing you. Pre gushes from his tip and he gathers great globs of goo with his hands, smearing his digits with the gelatinous substance. His touch upon your stomach makes you gasp. Covered in pre-cum, his hands provide calming relief for your straining skin, soothing the heat radiating from your burgeoning belly. They run over your swollen middle in smooth stroking motions, massaging his offering onto the temple that is your body. Your");
	if (pc.hasToes()) output(" toes crinch");
	else if (pc.isNaga()) output(" tail trembles");
	else output(" lower body trembles");
	output(" from the pleasure. It is just what you needed.");

	output("\n\nYou let the man continue and his hands traverse every inch of your stomach, until finally there is no spot left untouched. Gel Zon continues downwards, his lips softly kissing your skin as his fingers trace the curvature of your body. He");
	if (pc.isBiped()) output(" spreads your legs, revealing the flower of your feminine sex.");
	else
	{
		output(" plants his hands on your");
		if (pc.isNaga()) output(" serpentine hips");
		else if (pc.isTaur()) output(" tauric hindquarters");
		else output(" hips");
		output(" and stares at your glistening sex with obvious desire.");
	}
	if (pc.isPlugged(x))
	{
		output("\n\nA blue plug blocks the entrance to your quim. It is the seal your stud left when he bred you. Gel Zon spies it and his eyes go wide.");

		output("\n\n<i>“You honor me with your sincere chastity " + pc.mf("mighty warrior","fair valkyrie") + ",”</i> he rumbles, a blush spreading over his cheeks. <i>“I did not expect such devotion from an offworlder.”</i>");

		output("\n\nThe barbarian lowers his face down and buries his face in your wanting cunt. Passion overtakes the cundarian, your show of fidelity driving him forward and spurring him to put all of his effort into pleasing you.");
	}
	else
	{
		output("\n\nYou’ve long washed away the seal your stud left when he bred you. Not a trace of his blue cum is visible on your quim. Gel Zon notices its absence and his eyes dim.");

		output("\n\n<i>“Ahh,”</i> he rumbles. <i>“The seal is gone. It was foolish of me to think that such a " + pc.mf("mighty warrior","fair valkyrie") + " would not have other suitors and studs.”</i>");

		output("\n\nYou remind him just whose child you carry.");

		output("\n\nFire returns to the lancer’s eyes. Even if he cannot claim you all for himself, you chose him as your stud. It was his sperm, his seed that made you swell. The barbarian lowers his face down to your lower lips and buries it in your wanting cunt.");
	}

	output("\n\nGel Zon partakes of your feminine fruit, his tongue feverishly licking at your outer petals, flirting with them, but never pushing deeper. His tentacles come up to tease your [pc.clits],");
	if (pc.hasVaginas()) output(" even extending to your other pussies,");
	output(" and their tiny tips tickle your netherlips with little intricate motions. The man’s lips lock around your clit, sucking on your sensitive button and rolling it between his lips.");
	 
	output("\n\nFevered moans escape your mouth as he works, this act of servility pleasing you beyond question. Fuck, it feels so good to be worshipped like this; as if your true destiny is to be a brood queen ruling from a gilded throne, surrounded your by devoted studs who breed you and keep you swollen with child - all to ensure your superior lineage spreads to every corner of this galaxy. In this moment, there is nothing you want more.");

	output("\n\nLosing yourself in these lewd thoughts, you");
	if (pc.isTaur()) output(" cry out happily, your front pair of legs pawing against the ground and digging a trench in the snow as you push back into him, burying his face in your quim.");
	else if (pc.isNaga()) output(" wrap your tail around his body and pull him even deeper into your quim’s embrace.");
	else output(" clamp your thighs around his head, trapping his face against your quim.");

	output("\n\nYou fall deeper and deeper into an abyss of pleasure, the light of thought having long left your mind. Your hips rock instinctively, attempting to milk a cock that doesn’t exist, grinding your [pc.vagina " + x + "] against Gel Zon’s face. Short gasps erupt unbidden from your lips as you rush towards orgasm, the ecstasy in your thighs building and building until finally you achieve sweet, blissful release.");

	output("\n\nYou cry out, your voice rushing out over the snow");
	if (pc.isNaga()) output(" as your coiled tail squeezes him even tighter");
	output(". [pc.GirlCum]");
	if (!pc.isSquirter()) output(" flows your tunnel, pouring");
	else output(" floods out your tunnel, spraying");
	output(" out onto his face. The warrior drinks down your sweet nectar, the treat he has earned for his devoted care. Drowning in the depths of your ecstacy, all you can do is ride out the storm that has overtaken you, having become merely a passenger in your own body.");

	output("\n\nEventually, the floodwaters of your orgasm recede and you regain control. Gel Zon is still servilely licking at your quim, cleaning away every drop of your lust.");
	if (pc.isTaur()) output(" You relax, your tauric hindquarters no longer desperately pressing against his face.");
	else if (pc.isNaga()) output(" You uncoil your tail, releasing his body, and let it drop to the ground.");
	else output(" You relax your thighs, the vice grip you had on his head vanishing.");
	output(" He looks up and you nod, satisfied with his care, a slight smile on your face. The lancer helps you redress, driven to ensure your body and his child are protected from the elements, and helps you stand up. You check over your equipment and notice he has already settled back into the snow. As you turn and leave words ripple through the air.");

	output("\n\n<i>“Honored broodmother, return if you have further need of my devotion.”</i>");
	processTime(45);
	pc.orgasm();
	setEnemy(new StormguardMale);
	enemy.girlCumInMouth(pc);
	setEnemy(null);
	IncrementFlag("SEXED_SG_MALE");
	pc.createStatusEffect("STORMGUARD_CD");
	//24 hour CD.
	pc.setStatusMinutes("STORMGUARD_CD",60*24);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Service Him
public function worshipStormguardCuzHeBetterThanU():void
{
	clearOutput();
	showStormguard(true);
	author("Maye");

	var pregSlot:int = pc.findPregnancyOfType("StormguardPregnancy");
	var x:int = pregSlot;

	output("Lewd thoughts fill your mind,");
	if (flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
	else output(" the lancer");
	output("’s cock all you can think about. You drop to your knees, your hands pawing feebly at the crotch of his armor, as if his dick held the last drops of water in a drought stricken desert.");

	output("\n\n<i>“I neeeeed it,”</i> you plead. <i>“Please let me service your prick!”</i>");

	output("\n\nHe pushes you away and laughs.");
	if (stormguardHonor() == 2) output(" <i>“How the mighty " + pc.mf("warrior","valkyrie") + " has fallen, reduced to a wanton slut begging for the dick that bred them. Is that all it really takes to break a warrior of your caliber?”</i>");
	else output(" <i>“Look at the weak-willed slut pleading for my seed. All you can think about is my servicing my dick. It’s the only thing you’re good for anyway.”</i>");

	output("\n\nA shadow falls over you; it is the lancer.");
	if (!pc.isCrotchExposed()) output(" The barbarian reaches down and begins ripping away the armor concealing your genitals. A delicious sense of delight fills your body as this dominant man has his way with you. His eyes gleam as he prys off the last piece of gear hiding your sex.");

	if (stormguardHonor() == 2)
	{
		if (pc.isPlugged(x)) output("\n\n<i>“How unexpected!”</i> he laughs when he sees your quim still plugged with his cum. <i>“To think a valiant offworlder like you would show such devotion.”</i>");
		else output("\n\n<i>“I’d hoped a valiant " + pc.mf("warrior","valkyrie") + " like you would honor my conquest, but it seems that’s too much to ask of an offworlder.”</i>");
	}
	else if (pc.isPlugged(x)) output("\n\n<i>“Inconceivable!”</i> he yells. <i>“To think a wanton offworlder such as you would still be plugged!”</i>");
	else output("\n\n<i>“Hah! It’s gone!”</i> he laughs. <i>“I expected nothing else from a offworlder whore. Sluts like you will jump on every dick they find.”</i>");

	output("\n\nSeemingly satisfying his curiosity,");
	if (flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
	else output(" the lancer");
	output(" unbuckles his crotch guard and lets his thick slab of man-meat drop free. The musk of the barbarian’s cock washes over you, infused with his essence and his potent virility. A river of lust flows from your needy cunt and your mouth waters uncontrollably. You hunger for this hunk of flesh that bred you.");

	output("\n\nPushing yourself off the ground, you");
	if (pc.isNaga()) output(" weakly slither");
	else if (pc.isTaur()) output(" weakly shuffle");
	else output(" crawl");
	output(" over to him. The absence of your dominant stud’s dick drains your will to live and you tremble in withdrawl. Your hands reach up and grasp his limp rof, the heat of his splendid member sending pulses of energy through your parched body.");

	output("\n\nDriven by an irresistible compulsion to serve, your hands softly rub the warrior’s length, massaging him to erection. Pre beads at the tip of his shaft, glistening like morning dew in the sun. Your hands drop down and cradle his four swollen testicles. They are bloated, the skin of his sack stretched taut from the weight, completely full of the seed that bred you like the bitch you are.");

	output("\n\nThe heat of his round orbs blazes against your hands, the molten goodness inside hotter than a thousand suns. Your soft hands caress the lancer’s spheres, running over the blue skin of his sack in small circular motions as you bring your [pc.lips] down and kiss their sweaty surface. The taste of his nuts is orgasmic; it is infused with his manly essence and it drives you wild, reminding you of the glorious feeling of his thick dick splitting you apart as pressed up against your cervix and flooded your womb with his spunk.");

	output("\n\nThe warrior moans appreciatively as every inch of his four fat testicles is peppered with soft kisses. You worship these idols of virility, and his ridged penis trembles with delight at your dutiful service, great globs of pre gushing forth from his girthy rod and all over your [pc.skinFurScales]. The barbarian’s spear throbs with dire need and you pull away from his sack, pressing your face against the base of his prick. You look up at him with wide eyes, wordlessly asking for, no begging for his permission to continue.");

	output("\n\n<i>“What are you waiting for, slut?”</i> he rumbles loudly. <i>“Service your stud. Worship the one who owns your womb.”</i> The words spur you into action and your tongue slips between your lips. You move up his ridged length, never blinking or looking away, your svelte muscle running over every ridge and valley lining his cumvein. Every pleasured twitch of");
	if (flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
	else output(" the lancer");
	output("’s face fills you with glee; it is your ultimate purpose, after all, to submissively serve your breeder and bear him as many children as he wants.");

	output("\n\nYou reach the head of his cock and for a second lose yourself in the sight of");
	if (flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
	else output(" the lancer");
	output("’s prominent glans. Liberal amounts of pre flow forth from the head of his prick, like a veritable fountain of virility. Wrapping your [pc.lips] around his penis, the touch of your lips causes the barbarian to let out a sharp gasp of pleasure and you drink him in, his sweet liquid vanishing into the depths of your gullet.");

	output("\n\nYour cocksucking lips slide down his shaft as you take more and more of him into you,");
	if (pc.canDeepthroat()) output(" the entirety of his meaty rod disappearing down your throat.");
	else output(" until finally you can take no more.");
	output(" The girth of his member expands the walls of your throat. Trapped by his big dick, your stifled moans cannot escape and the sound waves bounce helplessly off his flesh, stimulating him even further.");

	output("\n\nFilled with a desire to serve him, your head bobs up and down on his ridged penis as you gleefully suck off your virile stud. You need his hot cum filling your belly. Your");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" long tongue coils around the length of his rod, using it to tug on his rod and help milk out his cum.");
	else output(" tongue fervently lashes his dick, licking his wide cumvein in the hopes it will soon fill with with his sperm.");

	output("\n\n");
	if (flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The lancer");
	output(" grunts with pleasure as the walls of your throat grip his prick, and his hips slowly rock against your face. His fat balls swing as he moves, and repeatedly smack you in the chin. Your hands come up and cup his testicles, rubbing them in an attempt to make them give up their creamy prize.");

	output("\n\nSuddenly, the warrior grabs your head and pulls you down on his dick. His member is forced down your throat and your eyes water as you choke on it.");
	if (flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
	else output(" The lancer");
	output(" roars with primal fury, and you feel his dick throb and his four orbs clench. His shaft swells as his thick, viscous cum floods his cumvein. Spunk gushes out off his tip and it pours down your throat and into your belly.");

	output("\n\nSpurt after spurt of seed vanishes into your stomach as the man seemingly pumps out gallons of his sperm. Unable to breathe, your vision dims and your hands slap at his legs, pitifully pleading for him to let you go. Just before everything goes completely black, the flow stops and he pulls out. The lancer pushes you away, and you collapse to the ground. You gasp for air and the blackness recedes. Utterly spent, you stay sprawled out on the ground, unable to do anything but take ragged breaths.");

	output("\n\n<i>“At least you’re good for sucking my cock, slut,”</i>");
	if (flags["MET_GEL_ZON"] != undefined) output(" Gel Zon");
	else output(" the lancer");
	output(" haughtily guffaws as he rebuckles his lower armor and walks away. You can’t even respond, still overwhelmed by the ordeal of pleasing your stud. Your hands feebly grope for your gear and you slowly put it back on before standing up on your trembling [pc.legOrLegs] and heading off into the storm.");
	processTime(45);
	pc.orgasm();
	setEnemy(new StormguardMale);
	pc.loadInMouth(enemy);
	setEnemy(null);
	IncrementFlag("SEXED_SG_MALE");
	pc.createStatusEffect("STORMGUARD_CD");
	//24 hour CD.
	pc.setStatusMinutes("STORMGUARD_CD",60*24);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function stormguardBirthing():void
{
	clearOutput();
	author("Maye");
	showName("\nBIRTHING!");

	output("Contractions rock your body. Your child is coming!");
	if (InShipInterior()) output(" Grabbing the medkit from your bathroom, you stumble towards your bed. You drop your [pc.gear] on the floor and clamber up. Settling into your bed, you prepare yourself and begin to push.");
	else if (InRoomWithFlag(GLOBAL.HAZARD)) output(" Like an idiot, you wandered into the wilds with a baby on the way. Now your idiocy is paying dividends. You drop your [pc.gear] on the ground as you search for somewhere, anywhere, safe and comfortable. You have no choice now, you will have to give birth unassisted. Hopefully, nothing goes wrong.");
	else output(" You waddle as quickly as you can to the nearest health clinic. Explaining your situation, the nurses take you into a nearby room, smiling happily and congratulating you on the upcoming birth of your new son or daughter.");
	//Merge
	output("\n\nYou cry out, your voice a mixture of both pleasure and pain. You feel your cervix dilate as your womb prepares to expel its current occupant. Your mind is hazy. Your body is pumping you full of endorphins. Something large passes through your cervix and into your canal.");
	//First cundarian kid
	if (StatTracking.getStat("pregnancy/gel zon births") <= 0) 
	{
		//First ever kid
		if (StatTracking.getStat("pregnancy/total births") <= 0) output(" Is... Is a kid supposed to feel like this?");
		output(" Even in your addled state you can tell something is off. It feels like you are giving birth to a large spherical object.");
	}
	else output(" From experience, you know you are giving birth to the egg which holds your developing child.");
	//Merge
	output("\n\nThe object makes its way down your tunnel, your contractions pushing it along until it reaches the entrance to your canal. Soon it pops free and you stare at the thing that’s come out of you. You’ve given birth to a large, blue egg. Holding your ear against the surface, a tiny heartbeat, is audible. You cradle the egg in your arms, caressing it, whispering soothing words of comfort even if you are unsure if your newborn can hear them. The arrival of the nursery drone breaks you out of your stupor. You secure your egg inside with the utmost of care and kiss your child goodbye before sealing the drone. You watch it go with a heavy heart. It’s time to continue your adventure.");
	//Clear preg related flags
	flags["SG_PREG_SOURCE"] == undefined;
	flags["SG_PREG_PC_KNOWS"] == undefined;
	flags["SG_PREG_MET"] == undefined;
	flags["SG_HATCH_TIMER"] = 0;
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function stormguardBabyBlurbs():void
{
	if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 8, 13) == 1)
	{
		var boy:Boolean = ChildManager.ofTypeAndGenderInRange(GLOBAL.TYPE_CUNDARIAN, ChildManager.GENDER_MALE, 8, 13);
		output("\n\nYour cundarian" + (boy ? "son" : "daughter") + " is crawling around the room, incessantly investigating their surroundings." + (boy ? "He" : "She") + "’s already getting into all sorts of trouble. Gonna be a handful this one.");
	}
	else if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 8, 13) == 2)
	{
		output("\n\nYour two cundarian kids are playing, challenging each other to mock fights. Mostly, it just involves biting.");
	}
	else if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 8, 13) >= 3)
	{
		output("\n\nA big pile of your cundarians kids are holding a 'hunt' of sorts in one of the rooms. It seems they have decided one of the robot nurses is a 'dragon' and they are trying to take her down. They mob her with their little fists but they aren't very successful, the 'dragon' picking them up one by one and getting them ready for their nap.");
	}
}
public function stormguardKidsOptions(button:Number):Number
{
	if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 0, 13) > 0)
	{
		addButton(button,"Cundarian",visitCundarianKids);
		button++;
	}
	else if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 13, 9001) > 0)
	{
		addDisabledButton(button,"Cundarian","Cundarian","You don’t have any kids young enough to play with. Maybe when you finish the quest, you’ll have time to be a real parent.");
		button++;
	}
	return button;
}
public function visitCundarianKids(choice:Number = -1):void
{
	clearOutput();
	author("Maye");
	showName("CUNDARIAN\nKIDS");
	//Build menu
	if (choice == -1)
	{
		output("Which age group will you interact with? (Buttons are in month age ranges)");
		clearMenu();
		if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 0, 1) > 0) addButton(0,"0-1 Months",visitCundarianKids,0);
		else addDisabledButton(0,"0-2 Months","0-2 Months","You have no kids in that age range.");
		if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 2, 5) > 0) addButton(1,"2-5 Months",visitCundarianKids,1);
		else addDisabledButton(1,"3-6 Months","3-6 Months","You have no kids in that age range.");
		if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 6, 12) > 0) addButton(2,"6-12 Months",visitCundarianKids,2);
		else addDisabledButton(2,"7-16 Months","7-16 Months","You have no kids in that age range.");
		if (ChildManager.numOfTypeInRange(GLOBAL.TYPE_CUNDARIAN, 13, 9001) > 0) addDisabledButton(3,"13+ Months","13+ Month","These kids are too old to play with.");
		return;
	}
	
	var boy:Boolean = false;
	var girl:Boolean = false;
	var numBabies:int = 0;
	
	var minAge:int;
	var maxAge:int;
	var children:Array = ChildManager.getChildrenOfType(GLOBAL.TYPE_CUNDARIAN);
	var tChildren:Array = [];
	var childIdx:int = -1;
	
	if(choice == 0) { minAge = 0; maxAge = 2; }
	else if(choice == 1) { minAge = 3; maxAge = 6; }
	else if(choice == 2) { minAge = 7; maxAge = 13; }
	
	// Filter for children and ages
	if(children != null && children.length > 0)
	{
		childIdx = 0; // The oldest should be first in the array!
		if(maxAge != -1 && maxAge < minAge) maxAge = -1;
		for(var i:int = 0; i < children.length; i++)
		{
			var c:Child = children[i] as Child;
			var m:int = c.Months;
			if((maxAge == -1 || m <= maxAge) && m >= minAge)
			{
				tChildren.push(c);
				numBabies += c.Quantity;
			}
		}
	}
	// If valid children, set perameters.
	if(tChildren.length > 0)
	{
		childIdx = rand(tChildren.length);
		if(tChildren[childIdx].NumMale > 0) boy = true;
		if(tChildren[childIdx].NumFemale > 0) girl = true;
		if(boy && girl) boy = (rand(2) == 0);
	}

	//Look at egg (0-8 weeks)
	if(choice == 0)
	{
	output("You look upon your cundarian child. The brilliant blue egg rests inside an incubator machine, swaddled in soft cloth. Will it be a boy or girl? You can’t wait to find out!	");
		processTime(2);
	}
	//Play with baby (9-24 weeks)
	else if(choice == 1)
	{
		output("You notice " + (numBabies > 1 ? "one of":"") + " your newly hatched cundarian child" + (numBabies > 1 ? "ren":"") + " sitting upright in " + (boy ? "his":"her") + " cradle. The small blue child looks towards you eagerly, gesturing that " + (boy ? "he":"she") + " wants the attention of " + (boy ? "his":"her") + " mother. " + (boy ? "His":"Her") + " face resembles yours, the crested eyebrows and finned ears of their father replaced with human equivalents. " + (boy ? "His" : "Her") + " hair, however, is still tentacled, the long blue appendages dangling from " + (boy ? "him":"her") + " head.");
		output("\n\nYou pick your child up, lifting them out of the cradle. "+  (boy ? "He":"She") + " gurgles happily, inspecting you with wide eyes. " + (boy ? "His":"Her")  +" prehensile tentacles come up and touch your face, this action seemingly how they bond with their parent. " + (boy ? "His":"Her") + " little hand grips one of your fingers. Quite a grip on this one! " + (boy ? "He":"She") + " is gonna be quite the warrior.");
		processTime(7);
	}
	//Play with baby (25-52 weeks)
	else if(choice == 2)
	{
		//One kid
		if(numBabies == 1)
		{
			output("You see your cundarian child playing in the common area. " + (boy ? "He" : "She") + " holds a rattle in " + (boy ? "his" : "her") + " hand. " + (boy ? "He" : "She") + " wields it like a makeshift club, using it to bop nurse droids on the head. Upon spotting you, " + (boy ? "he" : "she") + " shakily gets to " + (boy ? "his" : "her") + " feet and wobbles over to you before demanding you pick " + (boy ? "him" : "her") + " up. <i>“Mu ma,”</i> " + (boy ? "he" : "she") + " gurgles, looking up at you very seriously. <i>“Mu ma.”</i>");
			output("\n\nYou cradle your child in your arms, rocking them them gently as you weave a tale of your adventures. " + (boy ? "He" : "She") + " seems most interested in your battles, especially ones involving gigantic beasts. Soon " + (boy ? "he" : "she") + " falls asleep, and you put them to bed. It's time to let " + (boy ? "him" : "her") + " rest, and you cover " + (boy ? "him" : "her") + " with " + (boy ? "his" : "her") + " sheets before leaving.");
			processTime(45);
		}
		//Multiple kids
		else
		{
			output("You see your cundarian children playing in the common area. They hold rattles in their hands, wielding them like makeshift clubs. They use them to bop nurse droids, and each other on the head. One spots you and cries happily, your children shakily standing up and wobbling over to you. <i>“Mu ma,”</i> they gurgle, demanding your attention. <i>“Mu ma.”</i>");
			output("\n\nYou sit down, letting your children nuzzle up against your body as you weave a tale of your adventures. Your progeny are enthralled by your stories, seeming most excited by your battles, especially ones involving gigantic beasts.");
			output("\n\nAfter several tales, they fall asleep, their little heads resting against you. Nursedroids come by and pick them up one by one and take them to bed. You smile fondly as the last one is gathered up, before turning to leave.");
			processTime(75);
		}
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function processStormguardEggHatch(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if (flags["SG_HATCH_TIMER"] != undefined) flags["SG_HATCH_TIMER"] += totalDays;
	
	var timestamp:int = GetGameTimestamp() + deltaT;

	if (flags["SG_HATCH_EMAIL"] == undefined && (flags["SG_HATCH_TIMER"] > 2 * 30))
	{
		timestamp = (GetGameTimestamp() + deltaT - (flags["SG_HATCH_TIMER"] * 24 * 60) + 2 * 30 * 24 * 60);
		resendMail("stormguard_hatch", timestamp);
		flags["SG_HATCH_EMAIL"] = 1;
		flags["SG_HATCH_TIMER"] == undefined;
	}
}
public function stormguardEggHatchEmail():String
{
	var msg:String = "";
	//An unnecessarily large number of lines for such a short email
	//Almost definitely a better way to do it, I can barely wrap my head around the preg code
	var boy:Boolean = false;
	var girl:Boolean = false;
	var numBabies:int = 0;
	
	var minAge:int;
	var maxAge:int;
	var children:Array = ChildManager.getChildrenOfType(GLOBAL.TYPE_CUNDARIAN);
	var tChildren:Array = [];
	var childIdx:int = -1;
	minAge = 0;
	maxAge = 2;	
	// Filter for children and ages
	if(children != null && children.length > 0)
	{
		childIdx = 0;
		if(maxAge != -1 && maxAge < minAge) maxAge = -1;
		for(var i:int = 0; i < children.length; i++)
		{
			var c:Child = children[i] as Child;
			var m:int = c.Months;
			if((maxAge == -1 || m <= maxAge) && m >= minAge)
			{
				tChildren.push(c);
				numBabies += c.Quantity;
			}
		}
	}
	// If valid children, set perameters.
	if(tChildren.length > 0)
	{
		childIdx = rand(tChildren.length);
		if(tChildren[childIdx].NumMale > 0) boy = true;
		if(tChildren[childIdx].NumFemale > 0) girl = true;
		if(boy && girl) boy = (rand(2) == 0);
	}

	msg += "Your child hatched! It was a beautiful baby " + (boy ? "boy":"girl") + ". " + (boy ? "His":"Her") + " face looks just like yours. I almost feel like I’m caring for you all over again! I just know he/she will make a proud addition to the Steele family.\n\nBridget";
	return doParse(msg);
	flags["SG_HATCH_EMAIL"] = 1;
}