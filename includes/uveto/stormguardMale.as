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
		SG_BUTTFUCKED	- Times buttfucked him
		SG_DEFEATED_PC	- Times lost to him (and therefore been plugged!)
		SEXED_SG_MALE	- Times had any kind of intercourse with him

*/

public function showStormguard(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showName("STORM\nLANCER");
	showBust("STORMGUARD_MALE"+nudeS);
}
public function stormguardHonor(arg:Number = 0):Number
{
	if(flags["STORMGUARD_HONOR"] == undefined) flags["STORMGUARD_HONOR"] = 0;
	if(flags["STORMGUARD_HONOR"] + arg < 0) flags["STORMGUARD_HONOR"] = 0;
	else if(flags["STORMGUARD_HONOR"] + arg > 2) flags["STORMGUARD_HONOR"] = 2;
	else flags["STORMGUARD_HONOR"] += arg;
	return flags["STORMGUARD_HONOR"];
}

//Intros
public function stormguardIntro():void 
{
	showStormguard();
	if(!CodexManager.entryUnlocked("Cundarians")) CodexManager.unlockEntry("Cundarians");
	//First
	if(flags["MET_STORMGUARD"] == undefined)
	{
		//9999 check with weather code?
		output("\n\nThe snow that ceaselessly whips and flurries down from the repressive skies above removes all features from the land around you, turning it into one vast, glaring reminder of the merciless winter that will never leave this place. The mounds and promontories that you travel past could be anything, really - relics of korgonne civilization, forgotten tech - and you’d never know. Why, that hulking shape to your right looks exactly like a statue fallen on its back...");
		output("\n\n<i>“Magnificent, isn’t it?”</i> says a deep, deliberate voice, and your heart almost jumps out of your mouth. Very slowly, the head of the <i>“statue”</i> turns to regard you with yellow slit eyes, dislodging some of the snow and frost settled on its features. <i>“A world of elemental savagery. Where every moment is a struggle to survive. Here, you find out what it truly means to live.”</i>");
		output("\n\nThick, hard-bitten lips curve into a smile as animation slowly flows down his neck, seeming to bring the rest of this snow-coated form to life. He is a big, bulky, slate-blue creature, half-naked, lying back as if he were relaxing on some sun-kissed beach rather than half-buried in a snowdrift. Small tentacles frame his flat-nosed, high-cheekboned face. Below his armored hips his legs end in two cloven hooves.");
		output("\n\n<i>“Out here, storm lancers battle,”</i> he says, gesturing heavily at the frozen hills. <i>“We struggle. We survive. We live. It is not the test; it is the reward. I would battle you, [pc.race]. If you have made it out this far, you must have worth.”</i> His eyes roam your body, the heat in them burning out from the whiteness they are mired in. <i>“No fleeing and the loser’s body the prize, as honor dictates.”</i> The lips curve into a challenging smirk. <i>“Do you know of honor, [pc.race]?”</i>");
		output("\n\nYour codex beeps; the specifics of what it says are whipped away on the wind, however you think you hear the word <i>“Cundarian”</i>.");
		flags["MET_STORMGUARD"] = 1;
		//[Fight] [No]
		clearMenu();
		addButton(0,"Fight",fightSnowRapeMan);
		addButton(1,"No",noSnowRapeForMeThanks);
	}
	else
	{
		output("\n\nMounds and strange shapes huddle under the snow all around you, features removed by the white freeze. They could be anything, really... but you are prepared, at least a little, when one of them slowly turns its head and gazes at you with brilliant yellow eyes.");
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
			output("\n\n<i>“What’s the point?”</i> he replies, the faintest of shrugs rolling off his bare, mountainous shoulders. <i>“I am not challenged by you. You do not learn from your defeats. Or worse - you want me to defeat you, because that excites you. In either case, there is little honor in fighting such an opponent.”</i> He flicks a ridged eyebrow at you. <i>“If you have genuine interest in bettering yourself, I will train you, as I would a vassal. But it has a cost. You know what it is.”</i> He shifts against the snow. <i>“Otherwise, leave me to my meditation.”</i>");
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

//No
//Tooltip: Refuse his offer of battle.
public function noSnowRapeForMeThanks():void
{
	clearOutput();
	showStormguard();
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
	if(pc.isNice()) output("<i>“Let’s see what you got then, champ!”</i> you laugh, drawing your [pc.weapon] with a flourish.");
	else if(pc.isMischievous()) output("<i>“It’s always pretty funny watching you embarrass yourself,”</i> you smirk teasingly, twirling your [pc.weapon] artfully.");
	else output("<i>“If you insist,”</i> you say without a flicker of emotion, snapping out your [pc.weapon].");

	//{merge}
	output("\n\nThe smile on the storm lancer’s broad lips deepens. He clicks his tongue, and from out of the drift rises sleek, white armor, which moves into him from behind before clicking sleekly into place. Off its back he takes off his lance and heavy pistol; as ever, you can see the rise of his cylindrical jet pack module on his back.");
	output("\n\n<i>“So then, honored challenger,”</i> rumbles the cundarian, chest heaving with battle lust beneath the armor that clads him everywhere except his head, <i>“defend yourself!”</i>");
	stormguardFightPrep();
}

//Spanked
public function spankedSGFightIntro():void
{
	clearOutput();
	showStormguard();
	output("Holding your gaze, he clicks his tongue, and from out of the drift rises sleek, white armor, which moves into him from behind before clicking sleekly into place. Off its back he takes off his lance and heavy pistol; As ever, you can see the rise of his cylindrical jet pack module on his back.");
	output("\n\n<i>“So then, sadistic " + pc.mf("hellion","brute") + ",”</i> rumbles the cundarian, chest heaving with battle lust beneath the armor that clads him everywhere except his head, <i>“defend yourself!”</i>");
	stormguardFightPrep();
}

//Refuse
public function refuseSpankedSGFight():void
{
	clearOutput();
	showStormguard();
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
	CombatManager.displayLocation("STORMLANCER");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}
//APPLY SEXUAL LIKES. LIKES TRAPS AND TINY DIX

//PC Wins
public function pcWinsVsSG():void
{
	clearOutput();
	showStormguard();
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
	}
	if(stormguardHonor() == 1)
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
	addButton(14,"Leave",CombatManager.genericVictory);
}

//PC Loses
public function losesToSG():void
{
	clearOutput();
	showStormguard();
	output("Overwhelmed, you fall to the cold ground, putting your hands up to signal an end to the battle. There’s a click of weapons being holstered and armor retracting, followed by the heavy crunch of hooves in snow stalking towards you. ");
	if(flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
	else output("The storm lancer");
	output(" looms over you, bare-chested.");

	if(stormguardHonor() == 1) 
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
		output("\n\nYou give him a round score of spanks, rhythmically making the brute admit to his <i>“crimes”</i>. You probably could stop sooner, but the process of changing the color of his big, muscular butt from grey to lavender via the flat of your hand is extremely satisfying. And this is your reward, after all!");
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
		output("\n\nSmack. Slap. Spank. The inherently satisfying sound of a big, muscular butt getting its color changed from slate to lavender is muffled by the snow, but still rings surely around the wintery landscape as you carry on, making the brute admit to his <i>“crimes”</i> and then administering the punishment.");
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
	pc.lust(10);
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
	if(flags["SG_BUTTFUCKED"] == undefined)
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
		output("\n\n<i>“Storm lancers must be ready for... all forms of physical hardship,”</i> comes the grumbling reply. <i>“Get on with it.”</i>}");
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
		else output("the storm lancer’s");
		output(" breath is coming as hot and heavy as your own, you notice. You let your hand swing beneath his thick thighs, give his heavy, ridge-encrusted cock a teasing stroke, and find that it’s bulgingly erect, becoming hard as knotted oak when you shove yourself inwards to your fullest extent. Your huge dick pressing into his inner sex, and his own self-denial, are evidently having an effect.");
		output("\n\n<i>“You enjoying that, boy?”</i> you " + pc.mf("husk","purr") + ", coiling his dick with flicks of the wrist. <i>“Are you?”</i> You receive nothing but a rumbling, catching groan in response. You exult in your conquest, this vainglorious beast you’ve tamed with your own hand, increasing the fervency with which you pound his big, tough backside. You could have a say over whether he cums his brains out here or not...");

		processTime(5);
		pc.lust(10);
		//[Let Him] [Deny]
		clearMenu();
		addButton(0,"Let Him",letSGCum);
		addButton(1,"Deny",denySGOrgasm);
	}
	IncrementFlag("SG_BUTTFUCKED");
	IncrementFlag("SEXED_SG_MALE");
	//Honor changes in sub-scenes for bigdicks
}

public function denySGOrgasm():void
{
	clearOutput();
	showStormguard(true);
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
	clearOutput();
	showStormguard(true);
	if(flags["MET_GEL_ZON"] == undefined) output("The mountainous hoofed creature");
	else output("Gel Zon");
	output(" straightens, heaves the lance from off his back and thrusts it deep into the frozen ground. With an electric hum, the device beams out a bubble of golden energy from its rounded pommel, expanding smoothly until it easily encompasses both of you. Inside the hemisphere of light it feels like a warm summer day; the snow on the ground remains, but is now a strange, chilly contrast to the dry heat of the air. Cold water beads around your hands.");
	//{Sensing the change in temperature, your heat belt winks off with a beep.}

	output("\n\n<i>“In the past, novice lancers who lost their way out here froze to death for their folly,”</i> growls the cundarian, unclasping his briefs and allowing his thick cock with its ridged underbelly to swing ponderously downwards. He stands over you, close enough that you can smell the salty tang of his sweat and earthy musk, pausing meaningfully. ");
	if(!pc.isAssExposed()) output("Blushing slightly, you begin to take off your [pc.gear]. ");
	output("You agreed to the terms; your body is his conquered property, at least until he has gained his satisfaction. Yellow slit eyes watch you, relishing every movement of your hands down your increasingly bare frame.");

	output("\n\n<i>“Now, our lances have these atmospheres projectors built into them, so novices may have a chance of making it back to the temple alive.”</i> He laughs, head tentacles shaking. <i>“Absurd mollycoddling, but it is useful for cold-feeling prizes, no? Touch me.”</i>");

	output("\n\nThe blizzard whips and howls around the golden energy shield, gobbets of snow beating and melting against the thin wall inches away from your naked [pc.skinFurScales]. It lends the space an odd intimacy, like a warm, invisible igloo, a sensation that increases when you clasp the storm lancer’s penis at its base and slowly inch your way upwards, filling the hushed air with his deep sighs and pleased grunts. The ridges along the underside of his thick, fourteen inch sex are blunt and slightly pliable that become more and more defined the more you pull and shift your grip up and down him. Beneath his shaft, four heavy bollocks shift and tighten restlessly. You don’t get any sense of where he’s most sensitive along his shaft; he becomes hotly erect after barely a few seconds under your touch, his round end pointing fervently at your face.");
	output("\n\n<i>“Part of the Stormguard discipline...”</i> he breathes, eyes half-lidded. <i>“Keeping your lust locked away, until you have </i>earned<i> the right for release. No prize is truly satisfying if it were any different.”</i> He bites his broad, weathered lips as he lets his gaze wander down your body.");

	//PC has pussy
	//PC is Masculine
	if(pc.hasVagina())
	{
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
		//{merge}
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
		else if(stormguardHonor() == 2) 
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
		if(9999) output("have a shower");
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
		//Pussy plugged
		if(tempPussyPlugCheck())
		{
			output("\n\nThe looming hill of a warrior booms with delighted laughter when his golden eyes land on your [pc.vagina], still stoutly plugged with his cork of smooth, solidified cum.");
			output("\n\n<i>“You’re still carrying that around?”</i> he says, casually opening your [pc.thighs] and relishing the sight of your stuffed, stretched pussy. A blush clambers onto your cheeks as he reaches out and gently traces the lines of your opened labia. <i>“I don’t know whether to be flattered or unsurprised. Should I take it out?”</i> he growls, malevolent mischievousness honeying his tones, as he squeezes your engorged lips around the obstruction, sending pleasure rippling up your tunnel. <i>“Let it have a single moment to breathe, then stuff it even harder and fuller?”</i> He looks for a moment like he’s considering it; then he sits back with a haughty snort, erection rising up as he does. <i>“I think not. Better to keep it in whilst I put you to use in other ways, so all of your slatternly holes may know my touch.”</i>");
		}
		//If masculine male
		else if(pc.mf("m","") == "m")
		{
			output("\n\n<i>“No need for airs and back-and-forth, is there?”</i> he says, smirking as he relaxes back onto the melting snow, his hefty erection rising up as he opens his tree-trunk thighs. <i>“We’re both honorable men, we know how it works - how we like it.");
			if(stormguardHonor() == 0) output(" Or you should, at least. Elements know how many times we’ve ended up right here!”</i> He roars with joshing laughter. <i>“");
			output("One warrior giving his dues to a better, that’s all this is. Hop to it, there’s a lad.”</i>");
		}
		else if(pc.isShemale())
		{
			if(stormguardHonor() == 1) output("\n\nI suppose it was too much to hope someone who looks, sounds and fights like a woman would actually </i>be<i> one,”</i> he sighs, eyeing [pc.eachCock]. <i>“Decadent core-worlders, honestly.");
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
		//{merge}
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
			if(tempPussyPlugCheck()) output(" It’s made even worse by the plug this beast has shoved up you, rubbing endlessly against your increasingly wet lips and pussy flesh.");
		}
		else 
		{
			output(" Every rude shove inwards puts intense pressure on the inner walls of [pc.eachVagina], frustrated pleasure, pulsing through your female sex.");
			if(tempPussyPlugCheck()) output(" It’s made even worse by the plug this beast has shoved up you, rubbing endlessly against your increasingly wet lips and pussy flesh.");
		}
		output("\n\nThe storm lancer has had his brilliant serpentine eyes fixed gloatingly on your face this entire time, and as he bucks his bulging thighs into you with escalating passion, heavy balls flapping against your [pc.hips], it’s impossible for you not to display the pleasure he’s forcing on you. Your gasping moan fades into his pleased, knowing growl, and he pushes his thumb into your open mouth as he reams your [pc.ass] with hard, heavy pumps, bumping roughshod over your most tender spots. You are forced to cling to the clenching muscle of his forearms and let him claim your poor, stretched asshole with all his might.");

		output("\n\n<i>“Should I plug up this hole of yours");
		if(tempPussyPlugCheck()) output(" as well");
		output("?”</i> he barks, wide chest heaving. <i>“");
		if(tempPussyPlugCheck()) output("Another");
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
			output("\n\nOtherwise: He sighs deep and low, considering your limp form on his lap with a deeply satisfied expression baked onto his face. ");
			if(stormguardHonor() == 0) output("<i>“A meaningless victory you might be, but enjoyable all the same. Keep throwing yourself at me if you like, " + pc.mf("whelp","wench") + " - I don’t mind how we always ends up right here.”</i>");
			else if(stormguardHonor() == 1) output("<i>“I hope this experience strengthens your resolve to sharpen your skills and defeat me. Or maybe not?”</i> he poses, narrowing his eyes at you, considering your expression with teasing intent. <i>“Perhaps you like it this way enough to lay down your arms each time.”</i>");
			else output("<i>“I’ve wanted to do that for so long, honored " + pc.mf("warrior","valkyrie") + " - get just a little back for myself. May our battles long continue - you are such an inspiration!”</i>");
		}
		//{merge}
		output("\n\nWhen you slide off his warm, tough flesh, wincing slightly, he does not stop you. You have to spend a short time peeling trailers of his cum off your back - the stuff sets like sticking plaster on your [pc.skinFurScale]. By the time you’ve put your gear back on, ");
		if(flags["MET_GEL_ZON"] == undefined) output("the storm lancer");
		else output("Gel Zon");
		output(" has returned to his lying position, hardened back up against the freeze - except now he has a big, pleased grin on his blunt features.");
		output("\n\nPerhaps you could look into bringing a sledgehammer with you next time.");
		pc.loadInAss(enemy);
		processTime(30);
		pc.orgasm();
	}
	output("\n\n(<b>Coder's Note:</b> Orifice plugging is not yet supported. This is going to take a lot of work and probably not work well for several months worth of patches. RIP, Fenoxo.)\n\n");
	IncrementFlag("SEXED_SG_MALE");
	IncrementFlag("SG_DEFEATED_PC");
	//NO HONOR!
	stormguardHonor(-1);
	CombatManager.genericVictory();
}

public function tempPussyPlugCheck(arg:int = 0):Boolean
{
	if(pc.hasVagina() && arg >= 0)
	{
		if(arg < pc.totalVaginas())
		{
			if(9999 == 0) return true;
		}
	}
	else if(arg < 0 && 9999 == 0) return true;
	return false;
}

//Pussy Plug
//Doubles Libido. Functionally removes vagina from PC until they have a shower.
//Tooltip: Your pussy has been bunged with cundarian cum. Neither you nor anyone else will be able to use it until you get rid of it - but the constant rubbing and stretching it causes will arouse you until you do.

//Continuing effect text (every eight squares moved?)

/*9999 pussy plug shit
output("\n\nThe smooth plug of set cundarian cum rubs against the lips of your [pc.vagina] and [pc.eachClit] as you move, a constant source of aggravating arousal that you can do nothing about.");

output("\n\nPC has shower");

output("\n\nYou step underneath the jet of hot water, letting it flow through your [pc.hair]. Even here, it’s difficult to relax with your pussy plugged up like it is, the obstruction keeping you constantly aroused and frustrated. Perhaps the hot water... ? You pluck the shower head from out of its fixture and angle it at your [pc.vagina]. For a moment you think nothing is going to happen - then, in a wave of relief and hollowing out, the plug begins to lose its solidity, melting into fluffy blue foam which easily washes away down your [pc.legs] and into the drain. You sigh with relief. At last! {PC lust > 30: With the shower head where it is, perhaps you could take care of that aggravating lust now as well?");

output("\n\n[Masturbate] [Finish]}");

output("\n\nPC does not have pussy");
*/