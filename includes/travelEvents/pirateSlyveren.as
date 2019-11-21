import classes.ShittyShips.NPCShips.SlyverenKihaCorpSpearheadSS;
//Wsan twerks.

//Appearance
//Younger-looking, like 18-19. She’s not nearly as experienced or mature as the sultry slavebreakers.
//Has red(?) hair, no cobra hood.
//Orange scales, glowing purple tiger stripes
//Eye color TBD. Green? Gold? Pink?
//Has lipstick. Color whatever.
//Clothes - idk. Something like Slave Leia’s outfit?
//Shy, blushing expression when nude. Maybe averted eyes.
//Has very, very weak telepathy if you want to signal that somehow.
//Long legs.
//Not SUPER THICC, just store-brand thicc. Leggy.
//<i>“The sight of a lusty, fertile body assaults you, the pilot’s body dripping with sweat. She’s humanoid with a shock of red hair, but her skin is covered with orange scales and a crisscross of purple stripes. The woman looks almost snakelike, her form shimmering as she addresses you.”</i>

//Second shipfite:
//Low level Star Vipers pirate encounter.
//Slyveren pilot
//Barely any psychic aptitude (can only telepathy if she tries hard).
//Low ranking and trying to work her way up in the gang
//Orange scales with glowing purple tiger stripes.
//Red hair? (might change depending on bust).
//Losing:
//Similar to last fite, PC can offer sex instead of losing credits. Doesn’t work for neuters.
//Can be rejected. Dice check based on sexiness score+pc.libido.
//Rejections result in getting robbed and ditched.
//Cockhavers auto succeed and get succed.
//4 Loss Scenes
//[Hyper] Innocent Slyveren maiden worships the biggest dick she’s ever touched.
//[Cockhavers] Get envenomed and sucked. (Causes slight penis growth).
//[Naga + Puss] Lusty snakegirl tribbing, resulting in her accidentally slipping an egg into you (which slides back out at the end of the scene, since you’re not a slyveren).
//She probably real into naga types.
//[Regular pusshavers] She sits on your face and makes you eat her out while her tail goes wild in your cunt.
//Winning
//Just as before, PC can call the cops or extort for money, but she sends a message offering sex in exchange for a lift back to wherever you’re going.
//4 Win Scenes
//[Dick <= 24] Free cock enlargement via lots of venom followed by deepthroat sucking for 2 hours straight. +1-4 inches.
//[Dick Fits Inside Cunt] Fuck Her, probably fairly vanilla
//[Pusshavers] Get eaten out + tailpegged (maybe give PC option on if they want it?)
//???

//Shipfight 2 - Star Viper Slyveren!
//Encounter
public function encounterSlyverenPirate():void
{
	clearOutput();
	showName("PIRATE\nATTACK!");
	output("Dropping out of light drive, you notice a foreign object in nearby space - and it’s noticed you! Scrambling to respond, you hear a voice hail you over the console.");
	output("\n\n<i>“Succumb to the Star Vipers!”</i>");
	output("\n\n<b>It’s a fight!</b>");
	//shipfite go!
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(shits["SHIP"]);
	CombatManager.setHostileActors(new SlyverenKihaCorpSpearheadSS());
	CombatManager.victoryScene(defeatZeStarViperBullshit);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, shits["SHIP"]);
	CombatManager.lossScene(losingToStahVipah);
	CombatManager.displayLocation("STAR VIPER");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function showStarViperPilot(nude:Boolean = false):void
{
	showName("STAR\nVIPER");
	showBust("STAR_VIPER_PILOT" + (nude ? "_NUDE":""));
}

/*
//Boarding
public function getBoardedByViper():void
{
	clearOutput();
	showName("PIRATE\nATTACK");
	output("An alarm rings from the console as your ship shudders, metal groaning under duress. You’re being boarded!");
	//9999
}*/

public function payOffDaStarVoipah():void
{
	clearOutput();
	showStarViperPilot();
	author("Fenoxo");
	output("If it’ll avoid your death, you’re willing to pay the pirate toll. Punching chit numbers into the console, you digitally transfer 5000 credits to the venomous raider.");
	output("\n\nHer voice almost sounds surprised when it blasts back through the comm. <i>“Oh. Really? O-okay then! Be a dear and bring me more credits next time.”</i>");
	output("\n\nYou’re left fuming as the interloper activates her ship’s light drip and vanishes into the countless stars.");
	pc.credits -= 5000;
	output("\n\n");
	CombatManager.genericLoss();
}

//Loss scenes
public function losingToStahVipah():void
{
	clearOutput();
	showStarViperPilot();
	author("Wsan");
	output("The fight over, you sigh and sit in your chair while the Star Viper ship docks with yours.")
	if(flags["STAR_VIPER_SHIPLOSS"] == undefined) 
	{
		output(" You’re not sure who or what’s going to come down the corridor but when the airlock hisses and the ship’s occupant emerges, you have to admit it’s not what you expected.");
		output("\n\nBefore you stands a red-headed snakegirl standing on two legs and wielding a little pistol, her orange-scaled skin crisscrossed with vibrant, glowing purple tiger stripes. She strides towards you without hesitation and bends over, exposing her impressive cleavage, staring straight into your [pc.eyes].");
		output("\n\n<i>“You’re going to be a good [pc.boyGirl] and give me all your credits, aren’t you?”</i> she murmurs, stroking your face while the extravagant patterns on her body pulse hypnotically. <i>“Every last bit...”</i>");
		output("\n\nYou stare back at her uncomprehending until you feel a minor itch at the edge of your mind. She’s trying to psychically compel you but...");
		output("\n\n<i>“I think we could make a deal?”</i> you say, and her head whips back as she gasps.");
		output("\n\n<i>“H-how- damn it!”</i> she curses, cheeks flushing with color as she shakily aims her pistol at you. <i>“D-don’t make any funny moves...”</i>");
		output("\n\n<i>“Whoa there,”</i> you say, raising your hands in a friendly manner. <i>“I’m not planning on resisting. Well, except for the psychic powers.”</i>");
		output("\n\n<i>“Ugh,”</i> she grumbles, her plump lips stretching into a fine line. <i>“I’m- I’m not very good at that, alright? It’s a work in progress.”</i>");
		output("\n\nThe curvy snakegirl looks embarrassed enough about it already but before you’ve even made the decision not to press her on it, she’s pushing onwards.");
		output("\n\n<i>“I’m just new! Not all of us just- command the power of the stars from day one, you know,”</i> she says, gesturing frantically. <i>“Some of us- some of us have to train.”</i>");
		output("\n\n<i>“Okay,”</i> you say, nodding. <i>“Relax.”</i>");
		output("\n\nShe watches you with narrow-eyed suspicion.");
	}
	else
	{
		output(" It’s the same snakegirl you’ve run into before, and she’s glaring at you in determined fashion. Walking up to you, she’s almost sitting in your lap as she bends over and stares into your [pc.eyes].");
		if(flags["STAR_VIPER_DICKSEXED"] != undefined && pc.hasCock())
		{
			output(" <i>“You’re going to give me all your credits or all-”</i> she stops, eyes shifting sideways before she glances back at you, cheeks discolored. <i>“All your credits or all your cock. Just like I want.”</i>");
			output("\n\nThe sensual snakegirl leans back and considers you. <i>“Is it working?”</i>");
			output("\n\n<i>“In a manner of speaking,”</i> you murmur, feeling your [pc.cocks] harden, <i>“yes.”</i>");
			pc.lust(5);
		}
		else
		{
			output(" <i>“You’re going to give me all your credits, aren’t you?”</i> she murmurs, studying you intensely. <i>“... Is it working?”</i>");
			output("\n\nYou stay silent and avert your eyes, glancing back when you hear her sigh.");
		}
	}
	IncrementFlag("STAR_VIPER_SHIPLOSS");
	processTime(2);
	clearMenu();
	if(pc.hasGenitals()) addButton(0,"Offer Sex",offerSex2Snake,undefined,"Offer Sex","Try and ply the full-bodied snakegirl with an alternative reward instead of your precious wallet.");
	else addDisabledButton(0,"Offer Sex","Offer Sex","You need genitals to get the full-bodied snakegirl interested in you.");
	if(pc.credits >= 5000) addButton(1,"Pay 5,000",payOffDaStarVoipah,undefined,"Give 5000 Credits","Pay off the pirate, if that’s what it takes.");
	else addDisabledButton(1,"Pay 5,000","Pay 5,000","You don’t have enough money for this...");
	if(!pc.hasGenitals() && pc.credits < 5000)
	{
		output("\n\nWhen you let her know that you don’t have very much money... or genitalia either, the greedy alien fumes. <i>“For real?”</i> She looks almost disappointed to pull out a stun-gun and aim its discharge at your chest.\n\nEverything goes black..." + (pc.credits > 0 ? " and your credit wallet is empty when you awaken.":"") + "\n\n");
		pc.credits = 0;
		CombatManager.genericLoss();
	}
}

//[Offer Sex]
//doesn’t work for neuts
//invalid:You need genitals to get the full-bodied snakegirl interested in you.
//tooltip:Try and ply the full-bodied snakegirl with an alternative reward instead of your precious wallet.
public function offerSex2Snake():void
{
	clearOutput();
	showStarViperPilot(true);
	author("Wsan");
	if(flags["SEXED_SLYVEREN_PIRATE"] == undefined)
	{
		output("<i>“There’s something else I can offer you in place of credits,”</i> you say, smiling at her. <i>“Aren’t you interested?”</i>");
		output("\n\nHer eyes drop to your groin, and she scoffs. <i>“No.”</i> She looks back up at you, then stares at your groin for a few more seconds.");
		if(!pc.isCrotchExposed())
		{
			output(" <i>“D-do you have a penis...?”</i>");
			if(pc.hasCock())
			{
				if(pc.hasCocks())
				{
					output("\n\n<i>“More than one, even,”</i> you say, grinning wide. <i>“Would you like to see them?”</i>");
					output("\n\n<i>“M-more!”</i> she gasps before shaking her head and coughing. <i>“I- I mean, show me. Now.”</i>");
				}
				else
				{
					output("\n\n<i>“I do,”</i> you say, grinning wide. <i>“Would you like to see it?”</i>");
					output("\n\n<i>“Y-yes, pl- I! I mean, show me,”</i> she coughs, eyes flitting around before they settle on your crotch once more. <i>“Now.”</i>");
				}
				output("\n\nYou cast off your coverings and drink in the snakewoman’s reaction, an erotic shiver of desire starting at her head and working its way down her spine as she stares unabashedly, plush lips parted and welcoming mouth hanging open. A strand of drool runs from the corner of her glossy lips and drips to the floor.");
				output("\n\n<i>“Want to sample " + (!pc.hasCocks() ? "it":"them") + "?”</i> you offer, grinning wide. <i>“I’ll be totally hands-off.”</i>");
				output("\n\n<i>“Just- just a taste,”</i> she murmurs, breathing harder and leaning into you. <i>“A taste couldn’t hurt...”</i>");
			}
			else
			{
				output("\n\n<i>“I don’t, but I have a juicy pussy ready for you,”</i> you promise, grinning and sexily biting your lip. <i>“I’m told the taste is divine.”</i>");
				if(roamingStarViperPersuadeCheck()) output("\n\nShe looks you over uncertainly, studying your features, and apparently convinces herself of the idea. <i>“I- I suppose I might as well find out for myself, then...”</i>");
				else
				{
					output("\n\nShe looks over you, eyes roving from bottom to top, and shakes her head in staunch refusal. <i>“No. Give me your money or your ship’s gonna get it.”</i>");
					output("\n\nDamn. Maybe if you’d worn sexier clothing...");
					//send PC back to offer menu, but without the option to offer sex
					processTime(1);
					clearMenu();
					addDisabledButton(0,"Offer Sex","Offer Sex","You already tried this.");
					if(pc.credits >= 5000) addButton(1,"Pay 5,000",payOffDaStarVoipah,undefined,"Give 5000 Credits","Pay off the pirate, if that’s what it takes.");
					else 
					{
						output("\n\nWhen you let her know that you don’t have very much money... or genitalia either, the greedy alien fumes. <i>“For real?”</i> She looks almost disappointed to pull out a stun-gun and aim its discharge at your chest.\n\nEverything goes black..." + (pc.credits > 0 ? " and your credit wallet is empty when you awaken.":"") + "\n\n");
						pc.credits = 0;
						CombatManager.genericLoss();
					}
					return;
				}
			}
		}
		//exposed:
		else
		{
			if(pc.hasCock())
			{
				output(" <i>“Y-you have " + (!pc.hasCocks() ? "a penis":"penises") + "...”</i>");
				output("\n\n<i>“I do,”</i> you say, grinning wide. <i>“Want to sample " + (!pc.hasCocks() ? "it":"them") + "? I’ll be totally hands-off.”</i>");
				output("\n\n<i>“I- well,”</i> she murmurs, breathing harder and leaning into you. <i>“A taste couldn’t hurt...”</i>");
			}
			else
			{
				output(" <i>“You don’t have a penis...”</i>");
				output("\n\n<i>“But I do have a pussy getting wet for you,”</i> you promise, biting your lip. <i>“I can make you feel so good...”</i>");
				output("\n\nShe glances up at you, eyes tracing the lines of your body");
				//succeed persuasion:
				if(roamingStarViperPersuadeCheck()) output(", and apparently convinces herself. <i>“I-it’s hard to say no to that.”</i>");
				else
				{
					output(", and shakes her head in staunch refusal. <i>“No. Give me your money or your ship’s gonna get it.”</i>");
					output("\n\nDamn. Maybe if you’d worn sexier clothing...");
					//send PC back to offer menu, but without the option to offer sex
					processTime(1);
					clearMenu();
					addDisabledButton(0,"Offer Sex","Offer Sex","You already tried this.");
					if(pc.credits >= 5000) addButton(1,"Pay 5,000",payOffDaStarVoipah,undefined,"Give 5000 Credits","Pay off the pirate, if that’s what it takes.");
					else 
					{
						output("\n\nWhen you let her know that you don’t have very much money... or genitalia either, the greedy alien fumes. <i>“For real?”</i> She looks almost disappointed to pull out a stun-gun and aim its discharge at your chest.\n\nEverything goes black..." + (pc.credits > 0 ? " and your credit wallet is empty when you awaken.":"") + "\n\n");
						pc.credits = 0;
						CombatManager.genericLoss();
					}
					return;
				}
			}
		}
	}
	else
	{
		output("<i>“You sure you don’t want to help yourself to another ‘alternative payment’?”</i> you ask her, smiling.");
		output("\n\nShe glances down at your groin and back up at your face, her gaze hovering there before dropping back down to your crotch.");
		if(roamingStarViperPersuadeCheck())
		{
			output(" <i>“W-well, just once more...”</i>");
		}
		else
		{
			output(" <i>“Mmm- no. I need the money.”</i>");
			output("\n\nDamn. Apparently you’re not as alluring as you were the first time around...");
			//back to offer menu without option to offer sex
			processTime(1);
			clearMenu();
			addDisabledButton(0,"Offer Sex","Offer Sex","You already tried this.");
			if(pc.credits >= 5000) addButton(1,"Pay 5,000",payOffDaStarVoipah,undefined,"Give 5000 Credits","Pay off the pirate, if that’s what it takes.");
			else 
			{
				output("\n\nWhen you let her know that you don’t have very much money... or genitalia either, the greedy alien fumes. <i>“For real?”</i> She looks almost disappointed to pull out a stun-gun and aim its discharge at your chest.\n\nEverything goes black..." + (pc.credits > 0 ? " and your credit wallet is empty when you awaken.":"") + "\n\n");
				pc.credits = 0;
				CombatManager.genericLoss();
			}
			return;
		}
	}
	//route from here, I guess?
	slyverenLossSceneRouter();
}

public function roamingStarViperPersuadeCheck():Boolean
{
	var odds:Number = 20;
	odds += (pc.sexiness() * 5);
	if(pc.hasCock())
	{
		odds += (pc.cockTotal() * 5);
		var cLength:Number = pc.biggestCockLength();
		if(cLength >= 10) odds += 5;
		if(cLength >= 20) odds += 5;
		if(cLength >= 30) odds += 5;
		if(cLength >= 40) odds += 5;
	}
	return (rand(100) < odds);
}

public function slyverenLossSceneRouter():void
{
	if(pc.hasCock())
	{
		if(pc.biggestCockLength() >= 40) hyperSnekfun();
		else normalweenSlyverenSuckin();
	}
	else if(pc.hasVagina())
	{
		//for naga PCs with a pussy
		if(pc.isNaga()) nagaWithPussyStuff();
		//Non-naga puss-havers
		else nonNagaPussywhipping();
	}
	else
	{
		clearOutput();
		output("ERROR: You need to have genitals!");
		output("\n\n");
		CombatManager.genericLoss();
	}
}
	
//Hyper variant
//for 40+ inchers.
public function hyperSnekfun():void
{
	showStarViperPilot(true);
	author("Wsan");
	var x:int = pc.biggestCockIndex();
	output("\n\nShe kneels in front of you and places a delicate hand on your [pc.cock " + x + "], gently stroking you to hardness. Just the warmth of her inexperienced fingers gliding up and down your thickening length is stimulation enough to bring you to full, throbbing erection, at which point the entranced snakegirl snaps free of her miniature trance.");
	if(flags["STAR_VIPER_HYPERSEXED"] == undefined) 
	{
		output("\n\n<i>“Wait... you...”</i> she mutters, pupils dilating as she gazes up and down the enormous cock she’s been handling. <i>“I- oh...”</i>");
		output("\n\nStruck dumb by desire, there’s only one course of action left to the cock-hungry pirate. You groan in relief as she leans forward and runs her tongue along the underside of your bulging cock, her hands each coming to rest on either side of your gigantic member. Her conscious actions slowly give way to the subconscious, deep-seated lusts surfacing from below.");
		output("\n\n<i>“Never... never anyone seen- never seen anyone,”</i> the snakegirl mumbles as her tongue languidly traces over your cumvein, tripping over her words. <i>“<b>This</b> big...”</i>");
	}
	else
	{
		output("\n\n<i>“Stars... you...”</i> she mutters, pupils dilating as she gazes up and down the enormous cock she’s been handling. <i>“Need- mmm...”</i>");
		output("\n\nStruck dumb by desire, there’s only one course of action left to the cock-hungry pirate. You groan in relief as she leans forward and runs her tongue along the underside of your bulging cock, her hands each coming to rest on either side of your gigantic member. Her conscious actions slowly give way to the subconscious, deep-seated lusts surfacing from below.");
		output("\n\n<i>“How... how can you be...”</i> the snakegirl mumbles as her tongue languidly traces over your cumvein, tripping over her words. <i>“So <b>big</b>...”</i>");
	}
	output("\n\nShe’s in love with it. The way she treats it tells you everything, from the worshipful way her smooth, soft palms rub your rigid length to the way she presses her plump breasts up into it from below, the rock-hard points of her erect nipples jutting into your sensitive skin. Her shuddering breath is a warm constant as she climbs you, making her lewd, saliva-dripping journey all the way from your base to your [pc.cockHead " + x + "], where at last she allows herself a reprieve to gaze open-mouthed at your magnificence.");
	output("\n\nThen immediately plants her mouth on your cockhead and works on swallowing you, her lipsticked mouth stretching obscenely around your entire tip until she’s got you inside her and her loving tongue is rubbing against your spit-slicked underside.");
	//seen slavebreakers:
	if(flags["SLYVEREN_SUBMISSION"] != undefined) output(" Slyveren women are");
	else output(" This woman is");
	output(" something else! The suction of her mouth when she hollows her cheeks turns your knuckles white as you groan and grip your chair, straining against the impulse to cum.");
	output("\n\n<i>“Oh, stars, [pc.heShe] tastes so good!”</i> you hear in your mind, a sudden wave of pleasure washing over you and forcing you to grit your teeth. <i>“Mmmm! Mmmmoohhh, FUCK!”</i>");
	output("\n\nSo she <i>does</i> have psychic power lurking there, after all - and what an inopportune time for it to come to light! The cocksucking snakeslut doesn’t even seem to realize she’s broadcasting not only her thoughts but her very bliss at being so thoroughly fulfilled, her urges melding with your own, the compulsion to cum growing stronger by the second until you can’t stand it a moment longer.");
	output("\n\nYour lover cries out in psychic pleasure as you orgasm, your grunts drowned out by the sheer amount of empathic elation flowing from her to you while [pc.cum] pumps down her needy gullet. She gulps and swallows down everything you have to offer, all the while working her way down your behemoth cock, her elastic throat stretching around your titanic dick.");
	if(pc.cumQ() > 10000) output(" You don’t even notice the excess pouring back out of her button nose, too busy flexing and groaning while she sucks you off");
	else output(" Your entire world is condensed into the space of her throat, so focused on the sensation of her sucking you off that nothing else matters");
	output(".");
	output("\n\nBy the time your orgasm comes to an end she’s already halfway down your massive cock and blowing you as hard as she can, desperate to keep you stiff and wanting for her attentions. Her desires roll over you like the heat of solar flares, lighting up your mind with the urge to cum in her mouth until she’s taken her fill, driving you onwards with her pleasure. It’s impossible not to answer the call.");
	output("\n\nThe insides of her throat undulate up and down, massaging your obscene member until she gets a shot of spunk right into her stomach and almost purrs with satisfaction. Then another, and suddenly you’re cumming a second time, your abs tensing up as you strain and groan in release.");
	if(pc.balls > 0) output(" Your [pc.balls] draw" + (pc.balls == 1 ? "s":"") + " taut against your underside, pumping and pulsing while " + (pc.balls == 1 ? "it":"they") + " suppl" + (pc.balls == 1 ? "y":"ies") + " her with [pc.cumVisc] seed.");
	else output(" Your oversized dick pumps and pulses while it supplies her with [pc.cumVisc] seed, drizzling the snakegirl’s insides with your essence.");
	output("\n\n<i>“Yesyesyesyessss,”</i> you hear her exult, her tongue protruding from her stretched-wide lips to bathe your pulsating cumvein in love." + (pc.cumQ() > 3000 ? " <i>“Oh, stars, there’s so <b>much</b> of [pc.himHer]...”</i>":" <i>“Oh, stars, I need <b>more</b>...”</i>"));
	output("\n\nThis time her need is so utterly base that you can’t possibly resist it being communicated to you, the mere concept of need overwhelming your mind so thoroughly that all you can think to do is lean back in your chair" + (pc.legCount > 1 ? " and spread your [pc.legs] for her":"") + ". Your head rolls back as she sets about worshipping you once more, intent on sucking you dry. Now that you’ve given her a taste, all she wants is more.");
	output("\n\nShe lays you back and drinks down gulp after gulp of your spunk, the two of you relaxing as the reality of the situation settles over you. She’s going to blow you until you give her every last drop, and you’re going to sit there and let her do it. That seems more than agreeable.");
	output("\n\nTime fades into nothingness, your head spinning round and round while the snakegirl stimulates your massive cock with her throat and drinks freely of your offerings, satisfying a predator’s carnal hunger. You don’t even realize she’s stopped until she’s on her way out, sitting in your chair dumbfounded and panting. She halts at the door and turns back to you.");
	output("\n\n<i>“That was amazing,”</i> she confesses, twirling her hair around a finger. <i>“I’ll let you off just this once. But next time- next time-”</i> she mutters, staring at the half-hard enormity of your milked-out cock, <i>“uh, won’t be as easy, I think.”</i>");
	output("\n\nCradling her stomach, she departs your ship and shoots back into space in search of further prey. You settle back in your chair with a groan, closing your eyes for a moment. You’re not sure if you want her back in here or not after that, but it’s a decision for some other time.");
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	new SlyverenSlavebreaker().loadInMouth(pc);
	IncrementFlag("STAR_VIPER_HYPERSEXED");
	IncrementFlag("SEXED_SLYVEREN_PIRATE");
	output("\n\n");
	CombatManager.genericLoss();
}

//Non-hyper variant
//for <40 inches
public function normalweenSlyverenSuckin():void
{
	showStarViperPilot(true);
	author("Wsan");
	var x:int = pc.biggestCockIndex();
	output("\n\nShe kneels in front of you and places a delicate hand on your [pc.cock " + x + "], gently stroking you to hardness. Just the warmth of her inexperienced fingers gliding up and down your thickening length is stimulation enough to bring you to full, throbbing erection, the entranced snakegirl getting more intimate with your firm dick by the second until she plants a kiss on your" + (pc.balls > 0 ? " [pc.balls]":" base") + ". Seems like she’s forgotten about you already, but the attention she’s paying you down below is more than making up for it.");
	output("\n\nYou let out a quiet hiss of pleasure as her soft lips wrap around your [pc.cockHead " + x + "], enveloping you in the silken warmth of her mouth as she takes more and more of you inside her.");
	var len:Number = pc.cocks[x].cLength();
	if(len < 10) output(" The sensuous snakeslut swallows you to the hilt without even the slightest of hitches and begins to bob up and down, obviously not intent on drawing this out. Her hand works your swollen shaft in time with her mouth, jerking you off into her throat with casual movements.");
	else if(len < 20) output(" It takes her a modicum of effort to swallow you to the hilt, her determined expression finally relaxing when she " + (pc.balls > 1 ? "can comfortably tongue your balls":"reaches the bottom") + ". She begins to bob up and down while her hand works your swollen shaft, jerking you off into her throat with casual movements.");
	else output(" It takes her quite some effort to swallow your sizeable length to the hilt, but she manages it in the end. An expression of relief washes the worry on her face away as her tongue slips free to caress" + (pc.balls > 1 ? " your balls":" you") + ". After a moment’s rest she begins to bob up and down, her hand working your swollen shaft and jerking you off into her throat with casual movements.");

	output("\n\nGroaning in bliss, you settle back and let her do her magic. As inexperienced as her hand might be, she’s clearly very skilled with her mouth - she wants you to cum down her throat, and she wants it <i>now</i>. You can only moan in pleasure as her gullet begins to shift, undulating against the sensitive skin of your swollen cock, scarcely even feeling two slight points of impact against the surface. Before you can even think to question her, you’re blowing a massive load into her stomach.");
	output("\n\n<i>“Oh, god, fuck!”</i> you grunt, clutching your captain’s chair as you’re milked from base to tip. <i>“Nnnhhh!”</i>");
	output("\n\nStraining against both your instincts and her overwhelming command of your cock, you resist until the very last thread of your willpower frays and snaps. Grabbing her head, you pull her into your crotch and hold her there, squeezing her with your [pc.thighs] as you noisily cum down her yawning gullet. She doesn’t seem to mind at all, stroking your legs while you empty");
	if(pc.balls > 0) output(" your [pc.balls] to the last.");
	else output(" yourself to the last drop.");
	output("\n\nIt’s only when you finish cumming that you realize she isn’t going to stop, holding your [pc.legOrLegs] in place while she continues sucking on you even harder than she was before. The post-orgasm hypersensitivity makes it pleasurable torture, but torture nonetheless. Sweat breaks out across your body as you pant and moan, the snakegirl suckling your swollen member while she wraps the tightness of her seed-slick throat around it.");
	output("\n\nThe longer she persists, the tighter the seal of her plump, juicy lips feels around your bulging cock. Your skin itches as she drags herself over it, watching you keenly with upturned eyes, stretching your length as far as it’ll go. Wait, stretching?");
	output("\n\n<i>“Relax.”</i>");
	output("\n\nThe impulse plants itself in your mind as if you’d thought it yourself, and though you know that can’t be the case you find yourself obeying it regardless. The tension drains from your body as the snakegirl shifts her attentions to your [pc.cockHead " + x + "], hollowing her cheeks and sucking while she jacks you off below. Now that you can see your entire length being worshipped, it’s readily apparent - <b>your cock has grown.</b>");
	output("\n\n<i>“Fuck, yes, I’m going to make you so <b>big</b> and <b>thick!</b>”</i> you hear in your head, and you realize she’s telepathically broadcasting her own thoughts.");
	output("\n\nWhether her communication is conscious or unconscious you don’t know but either way it’s evident your growth is intentional and, if her desires are any indication, going to continue every time you meet her. It looks like you’ve only gained a couple inches at most but you can’t really tell what with the incredible pleasure of near-orgasm coursing through you as she continues sucking on your cockhead, reviving you from post-orgasm blues every bit as fast as she got your first load. You let out a shaky groan as she earns your second.");
	output("\n\n<i>“Yes, yes! Cum! More!”</i> she exults in your head, urging you on. <i>“Feed me more!”</i>");
	output("\n\nYou throw your head back and cum your brains out, your hips jerking and bucking with every ejaculation. [pc.Cum] coats the back of her throat as it surges down her gullet, sucked straight from your throbbing cock with all the vigor and lust of a thraggen in heat. The will to resist fades from you with every passing second until you’re little more than a writhing body in a chair, being sucked for everything you have. The fierce hold on your legs and kiss of her lips against your groin as your consciousness begins to waver isn’t quite what you expected...");
	var growth:Number = 1;
	if(pc.hasPerk("Mini")) growth -= 0.5;
	if(pc.hasPerk("Hung")) growth += 1 + rand(10)/10;
	output("\n\nWhen you come to, you’re still sitting where you were. Your dick is out and hanging limply, utterly drained and yet looking better than ever. Cellular growth of some kind..? You’re not sure, but <b>your dick has gained " + num2Text(Math.round(growth*10)/10) + " inches of length</b>.");
	output("\n\nYou make to leave your chair, to stand up and inspect yourself, but give up after a few seconds of shaky attempts. Maybe you’ll just stay seated here for a while and take it easy before you get back to adventuring...");
	processTime(35);
	pc.orgasm();
	pc.orgasm();
	new SlyverenSlavebreaker().loadInMouth(pc);
	output("\n\n");
	IncrementFlag("STAR_VIPER_DICKSEXED");
	IncrementFlag("SEXED_SLYVEREN_PIRATE");
	CombatManager.genericLoss();
	pc.cocks[x].cLength(growth);
}

//Naga with puss
//for naga PCs with a pussy
public function nagaWithPussyStuff():void
{
	showStarViperPilot(true);
	author("Wsan");
	output("\n\nYou sway out of your chair and momentarily tower over the woman before you lower yourself back down, smiling at her while you slide towards your bedroom. She takes the hint - the captain’s chair isn’t really any place to try and fuck a naga.");
	output("\n\nOnce you’ve got her on the bed, though, all bets are off.");
	output("\n\n<i>“Oh, <b>fuck</b>,”</i> you groan, throwing your head back in bliss and feeling your back arch while the pirate slides her long, warm tongue deep into your [pc.pussy]. <i>“Uh! Unh! You- ah! You got a thing for naga" + pc.mf("s","women") + ", h-huh?”</i>");
	output("\n\n<i>“Mmmmhn,”</i> she half-responds, eyes flicking up to your flushed face to watch you wince in sudden pleasure when her skilled tongue curls back on itself to lick extremely sensitive flesh. <i>“You don’t know the half of it.”</i>");
	output("\n\nYou can’t complain. Fetish or no, the sheer enthusiasm with which she’s pumping her tongue up into your squeezing cunt is enough to allay any potential concerns. The pirate obviously knows a lot about pleasing a woman and she’s keen to demonstrate it, giving you a crash course on what makes <i>you</i> feel like you’re on cloud nine.");
	output("\n\n<i>“Uh! Mm!”</i> you moan, writhing in her grip, your coils undulating on the bed below. She has such a fierce grip on your [pc.hips] you can barely move, and all the better for her. She’s sinking her long tongue into your pliant pussy over and over to lap at your walls with such aplomb you can’t do anything but cry out in pleasure, inching closer and closer towards a massive orgasm. <i>“Hmmnnf-!”</i>");
	output("\n\nYou bite your lip and arch your back hard enough to come off the bed, your pirate lover gently pressing her thumb down on your [pc.clit] while it throbs in pleasure, your drippy pussy clenching up and squeezing down on her warm, protruding tongue as you cry out. Your body instinctively seeks to bring your [pc.thighs] together but to no avail, your captor keeping them well-spread and ensuring your straining muscles accomplish nothing but intensifying your pleasure. It feels like your entire body is tensing from head to wiggling tail, and the pirate drinks in the sight with a carnal desire you’ve seldom seen.");
	output("\n\n<i>“Mmm...”</i> she murmurs, slowly withdrawing her tongue from your quivering slit. [pc.GirlCum] drips down your body, running free now that the blockade has been removed, and the skillful woman gives you a lazy smile. <i>“Now you’re all nice and loosened up.”</i>");
	output("\n\nIf she means that it feels like the strength has gone out of your entire body, then yeah. You’re still shaking and moaning your way through aftershocks as she mounts you, climbing atop your snakelike body and pressing her pussy against yours. She stays silent when she begins softly grinding her lips into your own, but you’re loud enough for both of you.");
	output("\n\n<i>“Oh. OH! Uh! I-I’m still sensitive!”</i> you gasp, pleading with the pirate, but she only grins down at you. <i>“Nnnhhh!”</i>");
	output("\n\n<i>“Lean into it,”</i> she advises you, reaching down to stroke your hair before she bucks her hips. <i>“Nnn... fuck, you are hot.”</i>");
	output("\n\nDespite your initial misgivings the hypersensitivity of post-orgasm soon fades to be replaced by the bliss of submission, your voice coming out in long, high-pitched moans while the feminine pirate grinds her slippery pussy against yours, brushing your hard, sensitive clit with her own. The grunts of pleasure she’s making under her breath are sexy as hell, and you soon find yourself grabbing at her arms just to hold onto her and steady her while she fucks you. It looks like she’s getting closer and closer to cumming with every passing second, her wild expression of ecstasy every bit as hot as the rest of her.");
	output("\n\n<i>“Hh-hhahh-oh, <b>fuck</b>-”</i> she gasps, grabbing you tight. <i>“Nnnnggghh! C-uh! Cumming!”</i>");
	output("\n\nYou’re not even a second into your own heated throes of passion when you realize something is happening - something alien and unfamiliar. There’s a large, hard protrusion from between the stretching walls of the pirate’s spasming pussy, and it’s pressing against your clenching cunny hard enough to exert some serious pressure. By the time you gather your wits enough to glance down at yourself, you can hardly believe what you’re seeing.");
	output("\n\nShe’s pushing out an enormous egg from her stretched-wide pussy, almost doubled over with the effort of it, sweating and panting while she groans in impassioned pleasure. What’s more, she’s forcing it into <i>you</i> - already your wet, slippery walls are giving way to accept her gift, spreading wide around the crown of the egg. Your mouth stretches open almost as wide as your pussy as you silently scream, the involuntary contractions of your orgasm drawing it deeper and deeper until, with a sudden slide and the sensation of utter fullness, you take it in entirely.");
	output("\n\n<i>“A- hh-”</i> you gasp, uncomprehending. You have no idea what’s going on until the sweaty, tired pirate leans over you, smiling as she puts a salty finger to your lips.");
	output("\n\n<i>“Relax,”</i> she mutters. <i>“It’s not fertilized.”</i>");
	output("\n\nThat’s really only <i>one</i> of your many concerns about having your pussy pumped full of her egg, but it looks like that’s the only answer you’re getting for now. So stretched out and sensitive, it’s all you can do to keep from screaming yourself hoarse with pleasure as the pirate reaches down and begins to rub your engorged clit, sending spasms through your entire body.");
	output("\n\nWith her egg inside you, your core feels so much weaker. You can’t even bring yourself to tense your muscles to gather any strength, and you can feel each tiny pulse of pleasure from wherever she touches you carrying throughout your lower half until your mouth is hanging open with drool running from its corners. You pant and gasp, shaking beneath her while she switches positions and lies alongside you, rubbing your cunt with the palm of her hand and tweaking your clit with the other.");
	output("\n\nYou lose track of the time she spends utterly ravishing your body. You cum again and again, slowly getting used to the feeling of carrying the pirate’s egg, until at last your taut and tensed body gives way to a feeling of complete looseness.");
	output("\n\n<i>“Oh, here it comes,”</i> she whispers in your ear, two fingers grinding into your excited clit. <i>“Push!”</i>");
	output("\n\nYou let out a shaky whine of pleasure as the egg begins to slip free of you, stretching your lower lips wide as the crown makes a reappearance amidst your squirting juices. Straining and sweating, you push and push, trying to brace yourself with the weakened muscles of your abdominals while the snakelike pirate whispers sexy encouragement in your [pc.ear]. She doesn’t let up on the vaginal stimulation for even a second and eventually, you can’t stand it a second longer.");
	output("\n\n<i>“Cuuummiiiinnnnggg!”</i> you scream, grabbing the bedsheets and arching your back. Your knuckles go white as the orgasmic contractions rock through you, forcing the egg further and further out of your squeezing-tight cunt until at last, with a ragged moan of joy, you push it free of yourself and experience a cluster of orgasms all at once.");
	output("\n\nYou fall back to the bed as the pirate secures her egg and lays atop you, kissing your face as your eyes roll in your head. You feel so <b>drained</b> all of a sudden, your hand coming up as if to stretch out to the ceiling and falling on her back in a lackadaisical embrace.");
	output("\n\n<i>“Good [pc.boyGirl],”</i> she whispers in your ear, and then everything goes black.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",nagaWithPussyStuff2);
}
public function nagaWithPussyStuff2():void
{
	clearOutput();
	showStarViperPilot();
	author("Wsan");
	output("When you awaken, there’s nothing left of the pirate... except your sodden bedsheets. The egg is gone, too, and you feel a slight pang of alarm before remembering her words. She said it was unfertilized - ");
	//read slyveren codex:
	if(CodexManager.entryViewed("Slyverens")) output("it sounds like she’s a slyveren, and you know from your reading they only reproduce between themselves. Good thing you’re not one yourself, or you’d have just been pinned to your bed and impregnated!");
	else output("so, nothing’s going to hatch from it. A good thing, too - you hadn’t really signed up for that.");
	output("\n\nYou shakily slither from your bed and head back to the captain’s chair. Your debt to the pirate paid, you resume your travels.");
	processTime(6*60+rand(10));
	restHeal();
	output("\n\n");
	IncrementFlag("STAR_VIPER_NAGAD");
	IncrementFlag("SEXED_SLYVEREN_PIRATE");
	CombatManager.genericLoss();
}

//Non-naga puss-havers
public function nonNagaPussywhipping():void
{
	showStarViperPilot(true);
	author("Wsan");
	output("\n\nYou take her to your bedroom and no sooner have you arrived than she’s pushing you down on the bed, throwing her clothes to the side and straddling you with her tail held in the air. She smirks from atop your [pc.chest] as she reaches up and grabs a pillow, lifting your head and sliding it under you before letting go. The next thing you see is the tight slit of her fertile cunt before the heat of it is being pressed against your [pc.lips], an impatient buck of her hips grinding you into the bed.");
	output("\n\nYou take the hint. Reaching up you take her girly hips in your hands and squeeze, running your [pc.tongue] up her length of her warm pussy and feeling her shiver in your grip. She seems content to let you tease her, the erotic moan she makes when you part her folds with your tongue just a little flattering, and you decide on the spot to draw it out for her.");
	output("\n\nYou’re a little surprised when you feel the touch of her tail at your [pc.thighs], but you realize immediately what she’s doing;");
	if(!pc.isCrotchExposed()) output(" stripped of your [pc.crotchCovers], she reveals your [pc.pussy] and sets about doing the same to you.");
	else output(" the snakegirl sets about performing the same teasing on you.");
	output(" Now you have to perform with this slight <i>distraction</i>, but you’re not going to let it get to you. Besides, she’s already practically purring atop you.");
	output("\n\nThe longer you keep at her pussy and clit the more vigorously she rubs the thick length of her tail up and down your sensitive lower lips, stimulating you until both your and her pussies are dripping wet with need. You can feel how hard she’s breathing with your hands and tongue, her taut stomach shifting with every intake of breath while her serpentine tail seems to take on a mind of its own, teasing at your entrance until at last, you can’t resist.");
	output("\n\nShe sinks inches of herself into your quivering slit at exactly the moment you slip your tongue deep into her, tasting the depths of her slavering pussy and feeling her soft inner walls press against you as she clenches in pleasure. Doing your best to ignore the way she’s matching you stroke for stroke, you put all of yourself into pleasing her. Your tongue works until her juices are dripping from your chin, the taste light and heady, her plush folds inflamed with desire and twitching with need.");
	output("\n\nNo communication passes between the two of you, and none is needed. You’re already talking to her with your tongue, telling her how much pleasure you want her to experience, and how you’re holding back that last little bit that would put her over the edge. You slowly slide the very tip over a particularly sensitive spot and feel her shake above you, trying to ignore the frustration welling up inside you while her tail plumbs the depth of your dripping pussy, knowing that if she just drilled you a little deeper you’d cum so explosively your bedsheets would be soaked through.");
	pc.cuntChange(0,100);
	output("\n\nYour will weakens until it’s hanging by a thread, but you’re consoled by the knowledge she’s just as pissed off as you are. You can feel it in the jerky, frustrated movements she’s making with her tail, the way she’s squeezing your head, the slight shaking of her thighs. Your tongue is starting to tire and before you have to spend all day with this snakegirl sitting on your face, you decide to end it.");
	output("\n\nTightening your grip around her generous hips, you pull her down until she lets out a feral groan of bliss as you reach her innermost depths with your tongue. The taste of her changes and intensifies, her pussy suddenly drawing taut around you, her impending orgasm driving you forward. Even right on the cusp of her release she makes sure not to ignore you, pumping her tail in and out of your squeezing cunny until your legs are shaking in joy.");
	output("\n\n<i>“Oh! CUMMING!”</i> she screams, throwing her head back and rocking atop you. <i>“Nnnnnn- nnnnngh! Nnnnnnnnhhhhhh!”</i>");
	output("\n\nShe <i>strains</i>, bucking and jerking with wild abandon as her core tenses up over and over. With her tail thrust as deep as it’ll go inside you, the only thing that escapes is a squirt of [pc.girlCum] followed by a stream of your juices down her undulating length while you hold her in place, nose pressed into her hard little clit and tongue dug right up inside her. She’s still staring at the ceiling when she finishes cumming, delicate aftershocks running through her sweaty, overstimulated body, utterly content with life.");
	output("\n\n<i>“Ohhh, <b>fuck</b>,”</i> she finally sighs, leaning over you with her hair hanging down. She gives you a shining smile. <i>“That was good. Almost like we were fighting all the way up until we came. Don’t you think?”</i>");
	output("\n\nYou’re just glad she didn’t leave you hanging. She leaves you on the bed panting as she collects her clothes and gives you a casual wave, leaving your ship for her own. Apparently your ‘payment’ was good enough" + (pc.isAmazon() ? " - not that you wouldn’t give her more if she asked. There’s still plenty left in the tank, after all.":" - and a good thing, too. There’s nothing left in the tank."));
	output("\n\nYou let out a loud sigh and relax for a moment before hopping out of bed. At least now you can head for the destination you’d intended all along.");
	processTime(30+rand(5));
	pc.orgasm();
	pc.girlCumInMouth(new SlyverenSlavebreaker());
	output("\n\n");
	IncrementFlag("STAR_VIPER_PUSS_SEXED");
	IncrementFlag("SEXED_SLYVEREN_PIRATE");
	CombatManager.genericLoss();
}

//Win scenes
public function defeatZeStarViperBullshit():void
{
	clearOutput();
	showStarViperPilot();
	author("Wsan");
	output("Victorious, you lean back in your captain’s chair only to raise your eyebrows at a notification. There’s a live transmission from the enemy ship. You put it up on screen to watch.");
	output("\n\nThe sight of a lusty, fertile body assaults you, the pilot’s body dripping with sweat. She’s humanoid with a shock of red hair, but her skin is covered with orange scales and a crisscross of purple stripes. The woman looks almost snakelike, her form shimmering as she addresses you.");
	output("\n\n<i>“Wait!”</i> she begs, gripping her screen. <i>“Take me with you. I’ll- I’ll have sex with you if you do. Just to wherever you’re going! I won’t even stay!”</i>");
	output("\n\nWell, that’s an offer, alright.");
	processTime(2);
	clearMenu();
	addButton(0,"Accept",acceptSnekBuddyYay,undefined,"Accept","Why not?");
	addButton(1,"Refuse",refuseWinBoardingFun,undefined,"Refuse","Not interested.");
}

//[Accept]
//tooltip:Why not?
public function acceptSnekBuddyYay():void
{
	clearOutput();
	showStarViperPilot();
	output("<i>“Sure,”</i> you say, her eyes lighting up at the sound of your voice. <i>“Tow yourself in.”</i>");
	output("\n\nOnce her ship is docked with yours, you stride down the corridor to greet your assailant. She comes through the airlock looking almost shy, her tail wiggling nervously behind her as she steps up to you.");
	output("\n\n<i>“H-hi!”</i> she announces, standing before you.");
	//repeat:
	if(flags["STAR_VIPER_SAVED"] != undefined)
	{
		output(" <i>“Fancy um, seeing you again. Sooo... are you taking me to your bedroom, or...?”</i>");
	}
	else output(" <i>“So, um. We can fly whenever. Do you want to take me to your bedroom now, or-”</i>");

	output("\n\nShe lets out a quiet gasp and shivers as you wrap your arm around her lower back and begin to guide her towards your room, the softness of her breast pressing against your side.");
	if(flags["STAR_VIPER_SAVED"] != undefined) output("\n\n<i>“Remind me again what you can do,”</i> you say, smiling at her.");
	else output("<i>“Any snakelike abilities I should know about?”</i> you ask, smiling at her.");

	output("\n\n<i>“O-oh, um,”</i> she mutters. <i>“My... my throat is stretchy. Like, I can probably handle... whatever you have down there. No matter how big. And- and if you’re <b>not</b> big, I can make you bigger with my venom. And if you don’t have a c- a penis, well,”</i> she says, looking at you and blushing. <i>“I guess I can use my tongue...?”</i>");
	output("\n\n<i>“Aren’t you skilled?”</i> you say, moderately impressed. <i>“Dream partner, huh?”</i>");
	output("\n\n<i>“Thanks,”</i> she murmurs.");
	output("\n\nYou pull her into your bedroom, gently pushing her down on your bed. Flipping herself over, she pulls herself up onto her elbows and takes her top off revealing two abundant mounds, each big enough to sink your hands into. You take stock of her with your palms, murmuring appreciatively as she turns red and arches her back with a slight moan.");
	output("\n\nShe’s putty in your hands.");
	IncrementFlag("STAR_VIPER_SAVED");
	pc.createStatusEffect("SnekOnboard");
	processTime(4);
	clearMenu();
	var capacity:Number = new SlyverenSlavebreaker().vaginalCapacity(0);
	if(pc.hasCock() && pc.cockThatFits(capacity) >= 0) addButton(0,"Fuck Her",penisRouter,[winFukkSnekWivDickydicky,capacity,false,0],"Fuck Her","Fuck the snakegirl until she’s squirming and cumming all over you.");
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Her","Fuck Her","This requires a penis that would actually fit, not a monster-dick.");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You require a penis to fuck the snakegirl.");
	//[DickGrowth]
	if(pc.hasCock() && pc.cockThatFits(1500) >= 0) addButton(1,"DickGrowth",penisRouter,[dickGrowthWithSlyveren,1500,false,0],"DickGrowth","Take the snakegirl up on her generous offer of growth.");
	else if(pc.hasCock()) addDisabledButton(1,"DickGrowth","Dick Growth","You’re too big to fit in her mouth!");
	else addDisabledButton(1,"DickGrowth","DickGrowth","You can’t have her grow you a dick from scratch.");

	if(pc.hasVagina()) addButton(2,"Get Licked",vaginaRouter,[getSlyverenCuntSlurpies,0,0,0,false],"Get Licked","Get your pussy eaten out.");
	else addDisabledButton(2,"Get Licked","Get Licked","You need to have a vagina for this.");

	addButton(4,"No Thanks",noThanksSnekkySnake,undefined,"No Thanks","You don’t actually want to fuck right now.");
}

public function noThanksSnekkySnake():void
{
	clearOutput();
	showStarViperPilot();
	output("You let her know that just because you’re taking pity on her doesn’t mean you’re going to be fucking. She needs to strap in and stay out of your way.\n\n");
	CombatManager.genericVictory();
}

//[DickGrowth]
//requires dick <=24
//tooltip:Take the snakegirl up on her generous offer of growth.
//invalid no dick:You can’t have her grow you a dick from scratch.
//invalid length:Your dick has to be 24 inches or less to do this. You’re too big!
//note: this is a pretty good scene imo. Might be best to let the PC do it even at >24 inches but with no results. I’ve included a result variant to accommodate for this.
public function dickGrowthWithSlyveren(x:int):void
{
	clearOutput();
	showStarViperPilot(true);
	author("Wsan");
	//first time:
	if(flags["SLYVEREN_PIRATE_GROWTHS"] == undefined) 
	{
		output("<i>“Alright, gotta admit you’ve got me interested with the ‘growth via venom’ thing,”</i> you say, leaning back and looking down at her. <i>“What’s that about?”</i>");
		output("\n\n<i>“It’s something all members of my species can do,”</i> she says, nudging her upper lip back with a finger to reveal an incisor. <i>“Our venom produces a local numbing agent and encourages... stretching. Um, the process is kind of involved, though.”</i>");
		output("\n\n<i>“Oh yeah?”</i> you ask, smiling. <i>“Involved how?”</i>");
		output("\n\n<i>“Um,”</i> she starts, cheeks turning red again, <i>“I’m going to have to suck your penis for a couple of hours if you want it to work.”</i>");
		output("\n\nYou are prepared to make such a sacrifice, heavy though the cost may be.");
		output("\n\n<i>“Pretty remarkable,”</i> you say, " + (!pc.isCrotchExposed() ? "pulling your [pc.cock " + x + "] free":"grabbing your [pc.cock " + x + "]") + " and shuffling into position above her. <i>“What else can your species do?”</i>");
		output("\n\n<i>“Uh, our tongues have a groove in them to channel cum down into our throats and I shouldn’t be saying this!”</i> she squeaks, putting her hands over her eyes when she realizes how embarrassing reeling off a list of her ‘features’ is. <i>“Please just put your dick in my mouth, it’s easier to just show you...”</i>");
		output("\n\n<i>“Fine,”</i> you say with a grin, leaning over her. <i>“But I would have enjoyed listening to you talk more about how suited you are to being a slut for sucking cock.”</i>");
	}
	else
	{
		output("<i>“Tell me a bit about how much you like to make dicks grow,”</i> you say, grinning as you look down at her.");
		output("\n\n<i>“W-well, the whole reason we do it is so we can feed better,”</i> she replies just a little defensively, blushing but determined. <i>“It’s easier for us to please a mate when they’re bigger.”</i>");
		output("\n\n<i>“Oh? And why is that?”</i> you say.");
		output("\n\n<i>“The bigger you are, the deeper I can get you in my throat,”</i> she explains. <i>“Our throats are pretty um, special. You probably noticed last time,”</i> she continues, breath hastening as she recalls the experience, <i>“b-but uh, we’re very good at manipulating them. The more you have to give, well, the more we can take.”</i>");
		output("\n\n<i>“What exactly <b>is</b> your species?”</i> you ask, curiosity getting the better of you. <i>“Were you... designed?”</i>");
		output("\n\n<i>“No,”</i> she says, smiling slightly. <i>“And I’m a slyveren.”</i>");
		//encountered slavebreakers:
		if(flags["SLYVEREN_SUBMISSION"] != undefined) output("\n\n<i>“Slyveren?”</i> you ask, eyebrows raised. <i>“You do resemble the ones I’ve run into, but there’s a lot of differences between you.”</i>");
		else output("\n\n<i>“Slyveren,”</i> you echo, considering the word. <i>“Huh. Never run into one before.”</i>");
		output("\n\n<i>“We’re very... adaptive,”</i> she murmurs, casting her gaze aside for a moment before looking back up at you. <i>“How we look depends on our environment.”</i>");
		output("\n\nThere’s something more to it than that, but right now there’s an issue more pressing than how her species operates: namely, the coupling of your penis and her mouth.");
		output("\n\n<i>“Well, I understand you a little more now,”</i> you say, brandishing your [pc.cock " + x + "] and noting how her eyes track it. <i>“So you want to feed on cum.”</i>");
		output("\n\n<i>“Y-yes,”</i> she mumbles, placified by your dick. <i>“Put it in and I’ll make you grow...”</i>");
		output("\n\nCan’t turn that down.");
	}
	output("\n\n<i>“Ugh-nnmmm... mmm,”</i> she moans, opening her mouth for you when she feels your [pc.cockHead " + x + "] pressing at her pouty lips.");
	output("\n\nThe first contact between her long, gifted tongue and your rock-hard dick is great, but the way she takes you inside is <i>amazing</i>. Her hands come up to grasp your shaft and stroke it with feather-soft motions, enough to titillate you into pushing your [pc.hips] forward and sinking more of yourself into her warm, welcoming mouth. She hums in approval, running her fingers along your [pc.skinFurScales] until she’s holding your waist.");
	output("\n\nYou realize she’s artfully guided and encouraged you into the depths of her tight throat without you even thinking of it but now that you’re here, it’s hard not to notice. The way it constricts and wraps around you feels incredible, so much so that you find yourself almost doubled over with your hands pressed into your mattress, grunting like an ape. <i>Fuck</i>, she’s good!");
	output("\n\nYour [pc.stomach] flexes as you struggle to retain control of yourself, veins standing out on your forearms as sweat breaks out across your body, but it’s no use. Right before you cum you feel two tiny pinpricks in the skin of your dick and then you’re arching your back, almost snarling in feral pleasure, ");
	if(pc.balls > 0) output("your [pc.balls] pressed right up");
	else output("hilted to the last");
	output(" against the snakegirl’s dainty chin.");
	if(pc.cumQ() < 50) output(" She has you emptied out in seconds with her skillful sucking, draining you dry of [pc.cum] and keeping you inside her to ensure the venom’s effectiveness.");
	else if(pc.cumQ() < 1000) output(" She gulps down every last load of [pc.cum] until you’re drained dry inside her, leaving yourself hilted to ensure the venom’s effectiveness.");
	else output(" She doesn’t even bother to swallow your enormous loads, instead just opening her throat to your use while a section of it ripples against your pulsating prick, forcing ever more [pc.cum] from your tip.");
	//cummy #1
	output("\n\nPanting, you raise your head and stare at the wall for a moment of reflection. A couple of hours of <i>this</i> is going to be an experience you won’t soon forget. Even now your flagging, half-hard cock is being lovingly massaged back to full hardness by her rolling throat, a slow, undulating motion gripping you from the base and riding all the way down to your sensitive head.");
	output("\n\nIt doesn’t take long for you to get hard again, by which point the sexy snakegirl has long since returned to servicing you in earnest, trying to get you to pop. Usually it’s harder the second time around but this girl does it effortlessly, eyes closed and head pressed into the bed while you groan and empty your");
	if(pc.balls > 0) output(" tightening ball" + (pc.balls > 1 ? "s":""));
	else output("self");
	output(" down her throat and into her stomach. An idea occurs to you then, rising up from the abyss of decadent pleasure.");
	output("\n\n<i>“H-hey,”</i> you grunt, looking down at her. She opens her eyes and gazes up at you, awaiting your question with her mouth stretched wide around your still-throbbing dick. <i>“Do I have to be cumming every few minutes for the stretching to work?”</i>");
	output("\n\nShe nods vigorously, eyes innocent and guileless, but when you grunt in resignation and lean forward once more you can feel her plush lips contort into a smile around the length of your hardening dick. You half-suspect she’s pulling wool over your eyes, but fuck it - you’re stuck here now, and you suppose you don’t really want her to stop. It’d just be nice if she were a <i>little</i> easier about it, but she doesn’t show any signs of wanting to let up.");
	output("\n\nIn fact, if anything, she’s swallowing you with ever more enthusiasm. You can feel the breath from her nose hot on your groin, coming in short, excited puffs while she blows you, eager to get her next filling of hot cream. It doesn’t take long.");
	output("\n\nYou moan in blissful release as you cum again, hips shaking slightly as you clench your butt and let her have it. Her arms slip over your legs to hold you around your lower back as if to not only brace you, but ensure you don’t have any second thoughts about staying put. This is going to be a long two hours...");
	processTime(60);
	pc.orgasm();
	pc.orgasm();
	var slyvvy:SlyverenSlavebreaker = new SlyverenSlavebreaker();
	slyvvy.loadInMouth(pc);
	slyvvy.loadInMouth(pc);
	clearMenu();
	addButton(0,"Next",dickGrowthWithSlyveren2,x)
}

public function dickGrowthWithSlyveren2(x:int):void
{
	clearOutput();
	showStarViperPilot(true);
	author("Wsan");
	output("Time passes by in achingly slow fashion. Fearing cramping muscles, you move all over the ship with your faithful cocksucker between your [pc.thighs], keeping your iron-hard dick sheathed well within the warm, wet comfort of her throat and having her swallow every last drop of cum from its throbbing head. She clings to you like an ardent lover, switching positions and coiling herself around you but never once letting up on her target.");
	output("\n\nAfter one colossal orgasm she slips " + (pc.legCount > 1 ? "through your [pc.legs]":"around your [pc.leg]") + " and begins blowing you from behind while you shake in your metaphorical boots and grit your teeth in pleasure. From there you plod down the hall to your captain’s chair, one very slow step at a time with the sexy snakegirl’s nose pressed against your ");
	if(pc.balls > 0) output("ball" + (pc.balls > 1 ? "s":""));
	else output("underside");
	output(" until you have to lean against the wall for support as you cum again. You’re beginning to believe her venom does a lot more than just lengthen your dick, but you can’t be bothered thinking about it.");
	output("\n\nYou can’t be bothered doing anything, actually, except keep cumming yourself dry while the snake-like pirate follows you eagerly down the hall when you begin to move again, shuffling between your legs like she’s your pet. Lifting your leg over her and collapsing into your captain’s chair with a groan, you look down to find her bobbing up and down on your half-soft, half-hard length with a wide smile and glittering eyes. She’s ecstatic about this situation, no doubt.");
	output("\n\nGripping the arms of the chair and tensing up, you sigh in muted elation as she milks yet another load from your pulsing dick, hollowing her cheeks and sucking as hard as she can. The suction feels amazing across the sensitized skin of your penis and you can’t help but shiver in delight as her lips pass over your cockhead and finally, <i>finally</i> pop free. Shuddering, you lean back against the commander seat and let the tension drain from your body.");

	var growth:Number = 1 + rand(3);
	if(pc.hasPerk("Mini")) growth--;
	if(pc.hasPerk("Hung")) growth += 1 + rand(2);


	if(growth == 1) 
	{
		output("\n\n<i>“Oh, very good,”</i> you hear from between your thighs. You’re debating whether you’re too tired to pay any heed when you feel the pirate’s hand on your limp cock and sit up, looking down at her. <i>“You’re bigger now!”</i>");
		output("\n\nGlancing at the object of her affection, you see - and feel - she’s right. It looks like <b>your cock has grown an inch.</b>");
		output("\n\n<i>“Two hours for one inch?”</i> you grouse, lying back in your chair and closing your eyes. <i>“Ugh.”</i>");
		output("\n\n<i>“Awww, it was fun!”</i> the snakegirl protests, patting your dick. You crack your eyes open just enough to see her stand and give you a radiant smile. <i>“Don’t forget to drop me off!”</i>");
		output("\n\nShe walks back down the hallway and disappears into a room - <i>your</i> room - and you’re too tired to bother doing anything about it. Lifelessly spinning your chair around, you try to think about where you were going before you picked her up.");
	}
	else if(growth <= 2) 
	{
		output("\n\n<i>“Ooh, you’re growing big!”</i> the snakegirl exclaims, and you lift your head to look down at her. She runs her hand along the length of your limp cock, examining it closely. <i>“Look at you...”</i>");
		output("\n\nGlancing at the object of her affection, you see - and feel - she’s right. It looks like <b>your cock has grown two inches.</b>");
		output("\n\n<i>“An hour per inch, huh?”</i> you mutter, settling back in your chair once more. <i>“Not too bad.”</i>");
		output("\n\n<i>“I’m always up for more,”</i> she tells you, pushing off the ground with her knees and standing with a radiant smile. <i>“Though maybe not right now. I think you need some water. Just don’t forget to drop me off!”</i>");
		output("\n\nShe walks back down the hallway and disappears into a room - <i>your</i> room - and you’re too tired to bother doing anything about it. Spinning your chair around with a grunt of effort, you try to think about where you were going before you picked her up.");
	}
	else if(growth <= 3) 
	{
		output("\n\n<i>“Ohh!”</i> the snakegirl exclaims softly, stroking your limp cock. <i>“Wow, you really grew.”</i>");
		output("\n\nYou raise your head and look down at her petting you. It looks - and feels - like she’s right. <b>Your cock has grown three inches.</b>");
		output("\n\n<i>“That venom really does work, huh?”</i> you grunt, relaxing back into your chair again. <i>“Thanks.”</i>");
		output("\n\n<i>“Any time!”</i> she says, standing and flashing you a radiant smile. <i>“Well, maybe not today. I think you need some rest and recovery. Don’t forget to drop me off when you’re done!”</i>");
		output("\n\nShe walks back down the hallway and disappears into a room - <i>your</i> room - and you’re too tired to bother doing anything about it. Spinning your chair around with a grunt of effort, you try to think about where you were going before you picked her up.");
	}
	else 
	{
		output("\n\n<i>“Ohh, wow,”</i> you hear the snakegirl mumble, her breath hot on your limp cock. Then her lips press against its head in a soft kiss and suddenly, you’re paying a lot more attention. <i>“You’re so <b>big</b> now.”</i>");
		output("\n\nYou glance downwards at the object of her affection and notice the difference immediately. It looks like <b>your cock has grown four inches.</b>");
		output("\n\n<i>“Wow. That venom of yours is something else,”</i> you remark.");
		output("\n\nShe winks up at you. <i>“You know, we usually keep it a bit of a secret.”</i> Standing, she dusts her knees off and gives you a radiant smile. <i>“Get some rest and we can try it again - I know <b>I</b> want another shot now that you’re so big. And don’t forget to drop me off!”</i>");
		output("\n\nShe walks back down the hallway and disappears into a room - <i>your</i> room - and you’re too tired to bother doing anything about it. Spinning your chair around with a grunt of effort, you try to think about where you were going before you picked her up.");
	}
	IncrementFlag("SLYVEREN_PIRATE_GROWTHS");
	IncrementFlag("SEXED_SLYVEREN_PIRATE");
	pc.cocks[x].cLength(growth);
	processTime(60);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Fuck Her]
//requires dick
//tooltip:Fuck the snakegirl until she’s squirming and cumming all over you.
//invalid:You require a penis to fuck the snakegirl.
public function winFukkSnekWivDickydicky(x:int):void
{
	clearOutput();
	showStarViperPilot(true);
	author("Wsan");
	output("She’s already wet and dripping between her soft legs as it is but something drives you to go a little further with your momentary foreplay. Maybe it’s the cute reactions, the slight hint of submissiveness, or ");
	if(pc.cocks[x].cLength() >= 20) output("the fact you need to really work to fit your enormous cock inside most partners");
	else output("the way her pretty thighs are trembling already");
	output(" - it’s hard to decide. All you know is that when you place your [pc.cock " + x + "] against the steamy heat of her quivering slit, it’s because you can’t help yourself.");

	output("\n\nShe gazes down at your");
	if(pc.cocks[x].cLength() < 10) output(" hardened length");
	else if(pc.cocks[x].cLength() < 20) output(" big, hard cock");
	else output(" titanic cock");
	output(" with her alluring lips parted, her eyes widening in what might be realization that she’s about to get fucked. They instantly half-close when you rub yourself upwards, grinding the base of your rock-hard dick into her little clit and forcing the breath from her lungs in a breathy sigh. She bares her teeth in an unconscious grimace of pleasure when you bring your [pc.hips] back down again, feeling her sweet-scented juices beginning to drip down your " + (pc.balls > 0 ? "[pc.balls]":"underside") + ".");
	output("\n\n<i>“U-unh,”</i> she mutters, trying not to vocalize. <i>“Nn- nnh...”</i>");
	output("\n\nYou keep her trapped there, performing with the same maddeningly slow pace until the pirate’s arousal is pooling between her curvy asscheeks and her near-silent sighs have become long, drawn-out moans of anticipatory ecstasy, her generous thighs shaking and spreading with every teasing stroke.");
	output("\n\n<i>“O-oh, g-god!”</i> she stutters, squeezing her eyes shut and grabbing fistfuls of your sheets. <i>“<b>Please</b> just <b>FUCK</b> me!”</i>");
	output("\n\n<i>“Wasn’t so hard, was it?”</i> you murmur, aligning your [pc.cockHead " + x + "] with her eager entrance.");
	output("\n\nHer pleated walls are so impossibly tight when you slide into her you can scarcely believe it, grunting in surprise when you feel them ripple and contract to draw you inside, leaning over her and planting a hand on the bed to stabilize yourself. The shaking snakegirl throws one leg over your back and looks right into your eyes, mouth hanging open in an unspoken plea. She wants you, and she wants you <i>deep</i>.");
	output("\n\n<i>“Ooohhh fuck!”</i> she cries out as you thrust, grabbing your shoulders. <i>“U-uh! Oh! Mm! Mm- oh, <b>finally</b>...”</i>");
	pc.cockChange();
	output("\n\nHer bright red hair spills out below her as she throws her head back in bliss, her entire body squeezing around the length of your studly cock as she cums not once but twice, shuddering and gasping while her fucked-full pussy contracts and squirts. It feels like she’s writhing under you for minutes on end, twisting and gyrating her girly hips with the head of your rock-hard dick pressed to her cervix while her lilting voice sings wordless praises. You hold her close and let her ride it all out, enjoying the effect you’re having on her.");
	output("\n\nWhen at last she collapses to the bed, weakened and gasping, that’s when you actually start in on her. You wrap your arm under her back and lift her off the mattress to fuck her, driving yourself into the silk-soft wetness of her spasming pussy just hard enough to make her luscious breasts shake on her narrow chest. As overstimulated as she is she can’t possibly hope to resist, her mouth hanging open in perpetual pleasure while you take her for all she’s worth.");
	output("\n\nWhen you feel her getting close again you take care to maintain that exact rhythm, her voice growing louder and louder in gradual realization until she’s screaming in ecstatic release, core tensed and knees turned inwards with the effort of it while you guide her through. The moment she’s done you get in closer, dropping her back on the bed and lifting her flexible legs until they’re next to her head, leaning over and piledriving her as deep as you can while she throws her head back in bliss, her body sinking into the mattress with every thrust.");
	output("\n\n<i>“You- oh! Fuck! Uh! Nnh!”</i> she screams hoarsely, groaning in exhausted lust after every sharp intake of breath. <i>“Oh! OH! An-animal! Mh!”</i>");
	output("\n\nGrunting with the effort of destroying her, you squeeze her legs and tense your [pc.stomach] as you feel the pleasure of orgasm begin to rise inside you. Figuring now is as good a time as any, you grind yourself forward and plunge into her [pc.knotBallsHilt " + x + "]-deep, eliciting a high-pitched howl of erotic bliss right before you unload inside her womb. [pc.Cum] jets up into her, bathing her walls with your seed until it begins to drip free of her quivering, squeezing cunny, forced out by the rhythmic clenching of her final orgasm.");
	output("\n\nYou pull out and leave her there panting on the bed, eyes almost as glazed as her well-used pussy, a low moan coming from between her lips while her stretched-open legs slip back down to the bed. [pc.cumColor] jizz drips from her glistening snatch while you head back to the captain’s chair momentarily to reset your destination. If she thinks that was all you’ve got to give, she’s got another thing coming.");
	processTime(45);
	pc.orgasm();
	IncrementFlag("SEXED_SLYVEREN_PIRATE");
	IncrementFlag("STAR_VIPER_DICKSEXED");
	new SlyverenSlavebreaker().loadInCunt(pc,0);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Oral]
//requires vagina
//tooltip:Get your pussy eaten out.
//invalid:You need to have a vagina for this.
public function getSlyverenCuntSlurpies(x:int):void
{
	clearOutput();
	showStarViperPilot(true);
	author("Slyveren");
	output("You climb on top of the blushing snakegirl" + (!pc.isCrotchExposed() ? " and shuck your gear, tossing it all off your bed and grinning":" and grin") + " down at her. Running your hands down your [pc.breasts] and [pc.stomach] you let her gaze follow your fingers tracing downwards as they come to rest alongside your [pc.pussy " + x + "], all but framing it for her.");
	output("\n\n<i>“Show me what that tongue does.”</i>");
	output("\n\nHer hands come up to gently grip your [pc.hips] while you shift to hold yourself right above her face, ensuring easy access, exerting just enough pressure that you know what she’s asking for. Your ");
	var wetness:Number = pc.vaginas[x].wetness();
	//pussy wetness low:
	if(wetness < 2) output("arousal-swollen");
	else if(wetness < 4) output("wet, warm");
	else output("soaking wet");
	output(" lips touch her lipsticked mouth and you sigh in comfort through your nose, spreading your [pc.thighs] far enough that you’re now sitting on the colorful girl’s face. Tilting your head back slightly and letting your eyes fall closed, you at last feel her tongue slip from between her juicy lips to caress yours, slowly running the length of your sensitive labia before swirling around your [pc.clits].");
	output("\n\n<i>“Ah,”</i> you murmur, " + (pc.hasToes() ? "curling your toes and flexing your calves":"feeling your muscles tighten") + ".");
	output("\n\nHer scaled skin shimmers in the low light of your room as she adjusts herself, tilting her face upwards to plant a long, soft kiss on your quivering clit. Your breath catches in your throat after a long inhale, her lovely tongue dipping back downwards to tease and rub at your dripping entrance, lapping at your juices as your anticipation builds and builds. As relaxed as you are, you don’t see any need to rush her - and besides, she’s <i>good</i> at this... shivers of lust are running up your spine already, your lower half flexing every time she discovers something new about you.");
	output("\n\nSlowly, gradually, sweat begins to break out on your body. Your heart pounds in your chest, thighs tightening on either side of the snakegirl’s head while she pushes you higher and higher, leaving you trembling atop the peak of pleasure, your breath coming in short, shallow moans. She certainly undersold her abilities when she told you she could ‘use her tongue’, but you’re not complaining now.");
	output("\n\n<i>“I’m close,”</i> you pant, gripping the sheets and balling them up. <i>“Ah! J-just a little more!”</i>");
	output("\n\nAt your urging she finally, <i>finally</i> slides her long, warm tongue into your slippery canal, your walls immediately clenching around her as an incredible orgasm rocks your body. Crying out in happiness, you arch your back so severely your gaze is fixed to the ceiling while the pirate quietly tends to you. Each subtle teasing motion serves only to enhance your pleasure, your voice growing louder and louder until you’re groaning in outright ecstasy, your abs almost cramping with the effort of cumming.");
	output("\n\nThe snakegirl draws back and lets you come down both literally and figuratively, her chin coated in your fluids by the time you lay down on top of her, still panting hard. Though she seems hesitant to explore your body of her own accord, you’re not nearly as shy as she is. Your hands roam up and down to gently cup one of her voluptuous breasts at the same time as you stroke her little rosebud of a clit, your middle finger running over her sensitive flesh until she whimpers in your ear.");
	output("\n\nYou seek to silence her with your upper lips this time but to no avail. When your fingers dip into the soft warmth of her tight little pussy she moans even louder than you, and before a second goes by she’s clamping up and cumming around you, shuddering violently as she squirts all over your sheets. The poor girl was so worked up from tasting you she could barely hold it in.");
	output("\n\n<i>“There you go,”</i> you murmur in her ear, grinding your thigh into her wet, dripping slit. <i>“Just relax.”</i>");
	output("\n\n<i>“Aaah- hhhhnnnh,”</i> she moans, eyes squeezing shut. Her legs wrap around your own, trapping you between them while she rubs herself up and down. <i>“Ooohhhh...”</i>");
	output("\n\nYou nip at her twitching ear and peck her on the cheek, eliciting murmurs and sighs of approval as she shakily comes down from her own high, trembling beneath you like a leaf in a storm. Even her pointed tail comes up to weakly wrap around you, embracing you from behind while you kiss and touch her, enjoying the unique texture of her skin.");
	output("\n\n<i>“For a girl covered in scales, you’re very soft,”</i> you comment, nuzzling up against her neck and running your fingers through her sweaty red hair.");
	output("\n\n<i>“You- you have very kissable lips,”</i> she replies, her cheeks flushing as she realizes what she’s said.");
	output("\n\n<i>“Oh? And <b>which</b> lips are you referring to?”</i> you ask the red-faced snakegirl, smiling down at her.");
	output("\n\nTo save her from further embarrassment you catch her in another kiss, deep and long, and feel her relax beneath you. Her legs finally come undone and you slowly slide your own around them, spreading her thighs with some coercion and a murmur of approval when she lets you part them. The pleasant sensation of her tail rubbing your back gives you an idea...");
	processTime(30);
	pc.orgasm();
	new SlyverenSlavebreaker().girlCumInMouth(pc);
	IncrementFlag("STAR_VIPER_PUSS_SEXED");
	clearMenu();
	addButton(0,"Get Tailfucked",getTailfukkedBySlyvLady,x,"Get Tailfucked","Find out for yourself exactly <i>how</i> prehensile this serpentine woman’s tail is.");
	addButton(1,"Relax",relaxForSnuggsWivSnekwife,undefined,"Relax","Set a course for your destination and return to snuggle in your bed.");
}

//tooltip:Find out for yourself exactly <i>how</i> prehensile this serpentine woman’s tail is.
public function getTailfukkedBySlyvLady(x:int):void
{
	clearOutput();
	showStarViperPilot(true);
	author("Wsan");
	output("<i>“So how rough can you get with that tail of yours?”</i> you ask her, hand brushing her cheek.");
	output("\n\n<i>“Huh?”</i> she asks, realization slowly dawning across her confused face. <i>“Oh... oh! Uh- well, it <b>is</b> fully prehensile...”</i>");
	output("\n\nShe begins to trace letters of the Terran alphabet across the [pc.skinFurScales] of your back with its tip.");
	output("\n\n<i>“Wow,”</i> you remark, smirking. <i>“Point made, then. How about you slide that puppy between my thighs...”</i>");
	if(flags["9999tailfukk"] == undefined) output("\n\n<i>“Okay... this’ll be new,”</i>");
	else output("\n\n<i>“Okay... I’m still not very good at this,”</i>");
	output(" she murmurs.");
	output("\n\n<i>“Relax,”</i> you tell her, smiling as you feel the tapered length of her tail slither along your pussylips. <i>“I’m sure you’ll do just fffooohhhh, <b>fuck!</b>”</i>");
	output("\n\n<i>“Is that good?”</i> she asks hesitantly, watching her tailtip slowly disappear while she works it between your dripping lips.");
	output("\n\n<i>“Don’t. Stop,”</i> you seethe, grabbing her hips. <i>“Oh, stars, that’s good!”</i>");
	output("\n\n<i>“Yeah?”</i> the snakegirl asks, a small smile breaking out on her face. <i>“Do you like this?”</i>");
	output("\n\nYou groan and bring your thighs together as she slides herself deeper, pumping you with the thicker part of her tail and getting your juices all down its striped length for her efforts. Dear void, the way she can work that tip - it’s taking all you have not to orgasm immediately, and even then you’re fighting on borrowed time. You gasp and grind your hips in the air, losing control of your instincts as the pirate tailfucks your spasming slit, grinning up at you. How confident she looks now that you’re squirming atop her like a maiden.");
	output("\n\n<i>“Oh, you’re going to make me cum <b>so</b> hard,”</i> you groan, squeezing her waist affectionately. <i>“I’m gonna cum! Nmh! Cumming! Cumming!”</i>");
	output("\n\nShuddering and gasping, you come to a colossal orgasm while the snakegirl’s slick, pumping tail fucks your [pc.pussy " + x + "] hard enough ");
	if(pc.isSquirter()) output("to make you squirt all down her scaled length, spraying across her pussy and stomach");
	else output("to get her scaled length all covered in [pc.girlCum]");
	output(". She instinctively slows it down and lets you ride it all throughout, one hand coming up to " + (pc.biggestTitSize() >= 1 ? "cup your [pc.breast] and ":"") + "gently tweak your [pc.nipple] while you cum over and over. It’s not until you’re done orgasming that you let out a throaty moan and gaze down at her that she realizes she might be toeing the line.");
	output("\n\n<i>“You’re getting mighty cocky,”</i> you murmur, running your hands up her waist and back down. <i>“But if you can fuck me like <b>that</b> for a few hours, I won’t complain at all.”</i>");
	output("\n\n<i>“R-right,”</i> she squeaks, cowed into submission.");
	output("\n\nYou pass the next several hours getting your pussy plowed with snake tail, orgasming so many times you lose count. Leaving the exhausted pirate on her back and panting as you [pc.move] over to the console and tap in your destination, you idly wonder how much more you can get out of her before she leaves.");
	processTime(30);
	IncrementFlag("SLYVEREN_PIRATE_TAILFUCKS");
	IncrementFlag("SEXED_SLYVEREN_PIRATE");
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Relax]
//tooltip:Set a course for your destination and return to snuggle in your bed.
//apparently not possible to do this bit so just have it play and then have the PC pick their destination again and they can just imagine they’re cuddling snek while they fly.
public function relaxForSnuggsWivSnekwife():void
{
	clearOutput();
	showStarViperPilot(true);
	author("Wsan");
	output("<i>“You wait right here,”</i> you murmur to her, gently squeezing an ear as you ");
	if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) output("clop");
	else if(pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output("pad");
	else if(pc.isNaga()) output("slither");
	else output("shakily walk");
	output(" over to your console and set the ship cruising once more before returning to your bed. By the time you walk back in the pirate’s wriggled under your blankets, peeking at you over the edge of them as you smile and join her inside.");
	output("\n\n<i>“Nice and toasty,”</i> you sigh, cuddling up against her before turning and embracing her fully. <i>“Mm. Do you want to sleep? I’ll wake you when we get there.”</i>");
	output("\n\n<i>“Okay,”</i> she mumbles, burrowing her head into the pillow. <i>“Thanks.”</i>");
	output("\n\nYou acknowledge her by snuggling your chin into the crook of her neck and lying there, holding her against you in amicable silence broken only by the sound of your slowing breathing. She shivers once, presses back into you and tugs the blankets closer.");
	output("\n\n<i>“You’re warm,”</i> she whispers, and then she’s asleep. The smile is still lingering on your face by the time you fall asleep yourself. She’s still snoozing by the time you get up.\n\n");
	IncrementFlag("SEXED_SLYVEREN_PIRATE");
	processTime(5*60);
	restHeal();
	CombatManager.genericVictory();
}

//[Refuse]
//tooltip:Not interested.
public function refuseWinBoardingFun():void
{
	clearOutput();
	showStarViperPilot();
	author("Wsan");
	output("<i>“Sorry, not interested,”</i> you say, cutting the transmission. Now you’ll have to figure out what to do with her ship.");
	//output("\n\n[authorities] etc? Are these standard scenes?");
	addButton(0,"Extort",extortSomeMuns,undefined,"Extort","Get reimbursed for the trouble.");
	if(enemy.hasPerk("PIRATE")) addButton(1,"Peacekeepers",turnInPirateFiteToCops,undefined,"Peacekeepers","Call in the peacekeepers on this villain.");
	else addDisabledButton(1,"Peacekeepers","Peacekeepers","It’s probably not worth it to get the cops involved, since your foe wasn’t some kind of flag-waving pirate.");
	addButton(14,"Leave",leaveShipfiteAfterVictory);
}

//Leaving scene
//for when the PC drops her off
public function snekWifeDropoffScene():void
{
	clearOutput();
	showStarViperPilot();
	author("Wsan");
	pc.removeStatusEffect("SnekOnboard");
	output("<i>“Okay, we’re here,”</i> you tell the snakegirl pirate, nodding at the console as she peers over your shoulder. <i>“Make your escape, or whatever it is you do.”</i>");
	output("\n\n<i>“Thank you so much,”</i> she says, leaning back when you turn to face her. Averting her eyes, she continues. <i>“And um, thanks for the... fun. I- I mean, I hope it was as fun for you as it was for me. I didn’t expect you to be so giving <b>or</b> skilled.”</i>");
	output("\n\n<i>“Sounds like you don’t want to go back out there,”</i> you venture, smiling.");
	//" <i>“You could just stay onboard, you know. I’m sure the two of us could find a way to keep entertained.”</i>");
	output("\n\n<i>“I- damn,”</i> she mutters. <i>“No, I do. But...”</i> she hesitates, biting her lip and turning away. <i>“Thanks for the ride.”</i>");
	output("\n\n<i>“Suit yourself,”</i> you say, shrugging. You watch her walk down the corridor, hips and butt swaying hypnotically. <i>“Feel free to come back soon.”</i>");
	output("\n\nThen she’s gone, and your ship is down one snakegirl. Still, it was nice while it lasted - and you have a feeling you’ll run into her again, anyway.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}