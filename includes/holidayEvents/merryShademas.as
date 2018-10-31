//Invitation From Shade
//Author: Savin

//Email sent to PCs who are either lovers or siblings with Shade. Must have already met her on Uveto. Does not repeat on subsequent years.

//Subject: Happy Holidays
//From: Shade Irons (Shade@Stormguard.net)
//To: [pc.Email]@SteeleTech.corp

public function shademasEmailString():String
{
	var buff:String = "Hey, kid, how’s tricks?\n\nDon’t know as much about your beliefs as I’d like, but us Uvetans have a pretty regular holiday around our planet’s winter solstice. Stormguard think the big lightning storm is the gods’ way of reminding us of their power. I just like the excuse to spend a day baking.\n\nSpeaking of which, I was talking to Astra and we decided that we’d be very happy to have you over for the holidays. I know you’re busy out there being a billionaire play-[pc.boyGirl] adventurer, but everybody needs a day off, right? Especially when it comes with some of your ";
	if(!shadeIsSiblings()) buff += "special friend";
	else buff += "sister";
	buff += "’s home cooking.\n\nLet me know~\n\nHugs and kisses,\n\t-Shade";
	return ParseText(buff);
}

//Show Up at Shade’s Place
//Play when the PC knocks on Shade’s door after receiving the email, any time in December.
public function shadeHolidayKnock():void
{
	clearOutput();
	moveTo("UVI P30");
	removeUvetoCold();
	showBust(shadeBustDisplay(), astraBustDisplay());
	showName("SHADE &\nASTRA");
	author("Savin");
	output("You’ve barely knocked on the door to Shade’s abode before it slides open, sucking in the cold air around you. It’s not Shade who’s answering, though: ");
	//hasn’t met Astra:
	if(flags["MET_ASTRA"] == undefined) 
	{
		output("you’re faced by a very tall ashen-haired woman with a pair of ginger ausar-ears poking out between her snowy braids. A confident smile is on her blue-hued lips, and a thick, fluffy ginger tail wags behind her.");
		output("\n\n<i>“Hey mom! ");
		if(shadeIsLover()) output("Your [pc.boyGirl]friend");
		else output("[pc.name]");
		output(" is here!”</i> she calls over her shoulder. She takes a step back, making way for you to enter. <i>“Hey, I’m Astra. C’mon inside, [pc.name]. There’s a winter storm a-comin’ and I gotta seal the doors good or we’ll end up flooded.”</i>");
	}
	//Has met Astra before:
	else
	{
		output("\n\nYou immediately recognize the ashen braids and ginger tail of your ");
		if(!shadeIsSiblings()) output("friend’s daughter");
		else output("niece");
		output(", all a-fluff as she slides the door open.");
		output("\n\n<i>“Hey, [pc.name]!”</i> she cheers, throwing her arms around you for a hug. While you’re busy being crushed to death in the buxom half-kitty’s embrace, she calls over her shoulder, <i>“Mom! [pc.name] is here!”</i>");

		output("\n\nSmiling ear to ear, Astra pulls you inside and pushes the door closed behind you. <i>“Glad you’re here. There’s a bad winter’s storm coming, and I gotta seal us up or we’re gonna drown like rats down here. Speaking of which, mom’s got this weird cheese thing down there called fond-you or something. Better hurry down and get it before I eat the rest of it.”</i>");
	}
	output("\n\nFair enough. You squeeze past your ");
	if(shadeIsLover()) output("lover");
	else output("sister");
	output("’s stacked daughter and into the warm seclusion of Shade’s subterranean abode. Behind you, Astra busies bolting the door closed with a noisy turbodrill; the noises follows you as you descend into the brightly-lit home beneath the snows, suffused with the familiar smells of fresh bread and cooked meats ripe with Roshan spices. Your stomach’s growling by the time you’re brushing through the colorful cloth curtain into Shade’s cozy little living room.");

	output("\n\nYour hostess is standing on the far side of the curved leather sofa that dominates the sitting room, wearing a flour-stained white apron over a jaunty red-and-white sweater adorned with little evergreen trees and reindeer. She leans against the kitchen door and gives you a motherly smile that makes you feel more like a kid coming home for the holidays than... whatever you are now.");

	output("\n\n<i>“Heyya, kiddo,”</i> Shade says, reinforcing your thought like she was just reading your mind. <i>“Glad you made it before the storm rolled in. The weather bunny up at the government building says it’s gonna be a real nasty one. Worst we’ve seen since Astra was a baby.”</i>");

	output("\n\nSo you heard. <i>“Hopefully the weather won’t ruin our fun.”</i>");

	output("\n\nShade snickers. <i>“");
	if(shadeIsSiblings()) output("Don’t worry little " + pc.mf("brother","sister") + ", I’ll keep ya safe.");
	else output("It’s alright if you’re scared of storms, love. I’ll hold ya close and keep you safe tonight.");
	output("”</i>");

	output("\n\nYou roll your eyes");
	if(shadeIsLover()) output(", though that does sound nice...");
	output(". With some difficulty, Shade wipes the grin off her face and seduces you deeper into her home by pulling off her messy apron and opening her arms, gesturing for you to come get a hug. Of course you do so, crossing the room and burying yourself in the sinfully soft embrace of the milfy kaithrit. You sink into the squishy warmth of Shade’s embrace, feeling her strong arms wrap around you.");
	//Lover:
	if(shadeIsLover()) output(" Shade plants a quick kiss on your forehead before releasing you.");

	output("\n\n<i>“Alright, enough giving you a hard time. Make yourself at home; I’m gonna go finish up our holiday feast!”</i>");

	output("\n\nThe cat-momma throws her apron back on and saunters back into her domain, leaving you to flop down on the couch and settle in. You’re surrounded by pictures of Shade and Astra, staring down at you from the mantle and shelves with warm smiles and laughing faces. A holoscreen on the wall is playing a looped animation of a crackling campfire, lending an impression of organic warmth to the toasty air coming through the vents.");

	output("\n\nYou’re so distracted by your homey surroundings that you don’t quite notice the drilling sounds in the background coming to an end, or Astra’s footsteps padding down the stairs. She snaps you out of your reverie by throwing her arms around your shoulders from behind, ");
	if(pc.tallness < 62) output("plopping her plush rack on top of your head like a hat!");
	else output("pulling the back of your head into her plush cleavage.");

	output("\n\n<i>“Hey!”</i> she says from above, out of sight. <i>“Mom’s been talking you up");
	//met before: 
	if(flags["MET_ASTRA"] != undefined) output(" nonstop since the last time we met.");
	else output(" ever since you met!");
	output(" So tell me about all your new space adventures, huh? I barely ever get off this icecube, and no matter how much I train and train and train, no spacer’s been willing to hire a greenhorn to keep them alive in the Rush. Oh, I wish I’d been born a couple years earlier!”</i>");

	output("\n\n<i>“You were born just right!”</i> Shade chides from the other room. <i>“Besides, being underage and pregnant would have sucked way worse for both of us.”</i>");
	output("\n\nRather than answer, Astra jumps over the back of the couch and drops into the seat beside you. She crosses her legs underneath her and sinks into the cushions with a wistful sigh. <i>“So c’mon, [pc.name]. Spill the beans!”</i>");

	processTime(60);
	clearMenu();
	addButton(0,"RegaleAstra",regaleAstra,undefined,"Regale Astra","Tell your stories to the eager pup.");
}

public function regaleAstra():void
{
	clearOutput();
	showBust(shadeBustDisplay(), astraBustDisplay());
	showName("SHADE &\nASTRA");
	author("Savin");
	//Tell your stories to the eager pup.
	output("You spend the next little while regaling Astra with the stories of your most recent exploits");
	//did KaraQuest: 
	if(flags["KQ2_QUEST_FINISHED"] == 1) output(", though you judiciously leave out the whole pirate business on Myrellion");
	output(". You’re just finishing your most recent harrowing story to your entranced one-woman audience when Shade’s voice rings out from the kitchen. <i>“I hope you two are hungry! The weksha roast is just coming out of the oven, and it’s the juiciest thing I’ve ever seen!”</i>");

	output("\n\n<i>“Thank the gods,”</i> Astra cheers, hopping up. <i>“I haven’t eaten all day!”</i>");

	output("\n\nYou follow her wagging ginger tail towards the source of the intoxicating aromas. The bevy of delicious scents has been steadily growing in intensity as you tell your stories, but when you finally brush through the quilted curtain that divides the kitchen from the rest of the house, you’re almost overwhelmed by the blunt force impact of so many distinct smells impacting your senses all at once.");

	output("\n\nThe little breakfast table the Irons family owns is so laden with dishes that there’s barely room for the silverware. Smoking-hot meats ooze juices into their pans, thick slices of fresh bread pipe from a wicker basket, and cream-topped pies wait in the wings to be devoured.");

	output("\n\nYou have to stop yourself from drooling.");

	output("\n\nFlour dust billows off Shade’s apron as she throws it over a shoulder. <i>“How’s that look, you two? Think there’s enough?”</i>");

	output("\n\n<i>“I dunno,”</i> Astra says with a grin, sliding into one of the chairs around the feast. <i>“Might be okay for me, but what about you two?”</i>");

	output("\n\nShade snickers and pushes you towards one of the free chairs. <i>“I’m sure we’ll manage, right [pc.name]?”</i>");

	output("\n\nSomehow, you think you’ll make do. You end up sitting across from Shade, with a big pile of juicy roast between you. You’ve barely sat down before Astra’s jabbing her fork into a slice of meat, piling it into her plate with a greedy smile. Shade pats her daughter between the ears, letting the youngest of the group dig in first.");

	output("\n\n<i>“I guess you’re still not one for the whole prayer-before-meal thing, huh?”</i> the motherly kaithrit smirks. <i>“C’mon, [pc.name], dig in while there’s still time.”</i>");

	processTime(25);
	clearMenu();
	addButton(0,"Eat",eatWithShadeAndAstra,undefined,"Eat","Devour the bounty momma Shade has placed before you.");
}

//Silly TT: You hungry slut
//Normal TT: Devour the bounty momma Shade has placed before you.
public function eatWithShadeAndAstra():void
{
	clearOutput();
	showBust(shadeBustDisplay(), astraBustDisplay());
	showName("SHADE &\nASTRA");
	author("Savin");
	output("By the time the meal’s done, and everyone’s leaning back with content smiles and full bellies, you really do feel like part of the family. Astra’s been so busy eating that she clearly doesn’t have time to talk much between mouthfuls, but she still manages to laugh and smile as you speak. Shade’s eyes rarely leave you during the meal, talking to fill the void when you stop to eat, listening attentively to the tales you tell between dishes.");

	output("\n\nYou get the feeling she’s watching you, studying you. ");
	//Siblings: 
	if(shadeIsSiblings() && !shadeIsLover()) output("Maybe she’s trying to make up for lost time, getting to know you as best she can.");
	else 
	{
		output("You can’t tell for sure, but you get the feeling she’s just undressing you with her eyes through the whole conversation... or maybe she’s just enjoying having her partner around for the holidays. You notice a distinct lack of Astra’s sire, now that you think of it.");
		//Did KaraQuest:
		if(flags["KQ2_QUEST_FINISHED"] == 1) output(" Good, because that’d be... awkward, to say the least.");
	}

	output("\n\nAside from Shade’s gaze, you’ve also started hearing noises from outside. A faint rumbling out there grows louder and louder with each dish you finish off, and despite the heaters billowing inside, you can feel the temperature dropping a few degrees by the time Shade’s sliding a slice of berry pie onto your plate. When you’re finally finished with everything, the house feels like it’s rumbling every few minutes, shaking with the thunder outside - and the roar of rain and hail beating down on the little hovel above ground is almost deafening.");
	output("\n\n<i>“Told ya it’d be a drowning storm,”</i> Astra says as she sets aside her freshly-finished plate. <i>“Did your home planet have storms like this, [pc.name]? Kind that’ll wash you away in an instant, if the hail and lightning doesn’t kill you first.”</i>");
	output("\n\nWell, good old Earth has its storms, sure, but you get the feeling they’re the rule on Uveto; not the exception.");
	output("\n\nAstra snorts a laugh. <i>“Yeah, I’ll say! I’m a snow-hound, born and raised, and I don’t think I’ve ever gone a week of my life without hearing the storm’s cry.”</i>");
	output("\n\nShe gives you a self-satisfied smile, leaning back and twirling one of her braids around a finger. Yeah, she’s a real badass for living here, for sure. You try not to roll your eyes.");
	output("\n\n<i>“Speaking of the storm, though,”</i> Shade says, glancing up at the kitchen clock. <i>“I do hope you didn’t have any plans for the rest of the evening. Uveto’s only got two kinds of storms: deadly, and long and deadly. If it’s not clearing out by now, then it probably won’t until morning. If we’re lucky.”</i>");
	output("\n\nHer statement’s punctuated by a rumble from the heavens that shakes you to your bones, making the lights flicker and bits of drywall billow down from the ceiling. Oh well, that’s reassuring. Shade curses and shields the juiciest of the leftovers from the raining debris. You watch her pussy-tipped tail get thumped by a piece about the size of your thumbnail, and it starts to go crazy thrashing about behind her, looking for the source of the impact. Astra covers her mouth and giggles, trying not to stare at her mother’s parasitic attachment flopping around.");
	output("\n\n<i>“Okay, well, I’m gonna go do my evening workout,”</i> the halfbreed pup proclaims, hopping to her feet and heading for the door. She’s gone by the time Shade looks up.");
	output("\n\nHer mother just sighs and slumps back in her chair. <i>“Don’t worry about the dishes. I’ll take care of it! Kids! Uh, no offense. You’re captain of your own ship, you probably know something about responsibility!”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("<i>“Naaah, that’s for other people! I’m just chief cock-gobbler!”</i> you giggle, only half kidding. <i>“But I guess I can help!”</i>");
	else 
	{
		output("You smirk and tell her that you at least know a thing or two about helping your ");
		if(shadeIsLover()) output("lovers");
		else output("sisters");
		output(".");
	}
	output("\n\n<i>“You’re a peach,”</i> Shade smiles, scooping up some of the emptied plates. You follow suit, rolling up your ");
	if(pc.isChestExposed()) output("metaphorical ");
	output("sleeves.");

	processTime(40);
	clearMenu();
	addButton(0,"Clean Up",cleanUpWithShade);
}

public function cleanUpWithShade():void
{
	clearOutput();
	showBust(shadeBustDisplay(), astraBustDisplay());
	showName("SHADE &\nASTRA");
	author("Savin");
	//Clean Up [Siblings Version]
	if(!shadeIsLover())
	{
		output("<b>Some scrubbing later...</b>");
		output("\n\nYou slump down into the welcoming softness of the couch’s embrace with a sigh. Shade’s hands rest on your shoulders, rubbing the stress out of them. The storm-noises outside have only gotten more intense, making it difficult to hear your sister’s words, but the intent comes through all the same: she’s happy to have you around. When Astra comes back out of her room, a towel wrapped over her sweat-slicked shoulders, she flashes you both a smile and swings into a seat beside you.");
		output("\n\n<i>“So how’re we passing the evening?”</i> she asks, rolling her head back so she can see her mother. <i>“Goin’ out’s out the question!”</i>");
		output("\n\n<i>“I guess we’ll just have to suffice with each other’s company. At least the extranet’s not out yet,”</i> Shade says, continuing to rub your shoulders. <i>“I think there’s a few thousand channels playing holiday marathons tonight.”</i>");
		output("\n\nShade makes her way around the couch, picking up the remote as she goes. She settles in on the other side of you, resting her tail in her lap. The holoscreen on the wall flickers to life, barraging your eyes with a thousand flickering colors. Over the next few minutes, the three of you decide on something ");
		if(pc.isNice()) output("heartwarming");
		else if(pc.isMischievous()) output("funny");
		else output("actiony");
		output(" to watch. Before long, Astra’s head is resting on your shoulder and Shade’s eyes are struggling to stay open. Her hand is absently stroking the scaly head of her parasitic tail, making the little beast drool and wiggle.");

		output("\n\n<i>This is nice,</i> you think to yourself, putting an arm around Astra’s shoulders. Nights like these make it a little easier to move on from Dad’s passing, from the missing and dysfunctional family he left behind. Maybe it’s good for you to take a quiet(ish) holiday like this off from your adventures with the Irons family...");
	}
	else
	{
		showBust(shadeBustDisplay(true));
		showName("\nSHADE");
		//Clean Up [Lovers Version]
		output("Before you can dig into the work at hand, another pair of hands grabs your [pc.butt], squeezing hard. Shade presses herself into your back, her plump rack squeezing against you. <i>“On second thought,”</i> Shade whispers into your [pc.ear], nipping at the edge, <i>“chores can wait. Astra’s in her room, and she works out with her headphones on...”</i>");
		output("\n\nShe’s barely had time to finish the thought before you’ve turned around, thrusting your tongue into the kitty-MILF’s mouth. She moans softly, clutching at your hips and wrapping her tail around your [pc.leg]. Instinctively, you feel");
		if(pc.hasCock()) output(" your dick stiffening, pressing against Shade’s thigh");
		if(pc.hasVagina())
		{
			if(pc.hasCock()) output(" while");
			output(" your pussy starts to quiver with anticipation");
		}
		if(!pc.hasGenitals()) output(" your body flush with desire for your feline lover");
		output(". <i>“Let’s ride this storm out together, huh?”</i>");

		output("\n\nThere’s no place you’d rather be on a cold, stormy winter’s night. You take Shade’s hand and let the mature kaithrit lead you to her bedroom.");

		output("\n\nThe moment the door closes behind you, you find yourself shoved up against it with Shade’s fingers tearing at your");
		if(!(pc.armor is EmptySlot)) output(" [pc.armor]");
		else output(" gear");
		output(". Her lips press feverishly against your own, then move downwards, kissing at your neck, then chest, licking and biting as she goes. Between gropes and moans, you manage to grab Shade’s shirt and yank it up over her head - and stop there, covering the kitty’s eyes and leaving her tits bouncing free. You keep her blinded with one hand, and use the other to pull her close, letting you thrust your face into her cleavage and submerge yourself in the sinful softness of her breasts.");

		//Shade is lactating:
		if (shade.isLactating())
		{
			output("\n\nYou hungrily latch onto one of your lover’s pert teats, flicking the pebbly areola with your [pc.tongue]. Shade gasps as a trickle of milk leaks from her nipple, rolling across your [pc.lips]. You’re not here to nurse, but you do make damn sure Shade knows you appreciate these big tits of hers, and what she’s let you do to them.");
		}
		output("\n\nAfter a few moments, Shade manages to use that kaithrit flexibility to wiggle her head free, making her breasts bounce delightfully in your hands. Grinning devilishly, the freed cat-woman grabs you by the waist and spins you, pushing you back so you go sprawling onto her bed. She leaps on you, pushing you down and straddling your waist. Slowly, sensually, Shade rises up on her knees, shaking her hips as she hooks her thumbs into her jeans and shimmies them down.");

		output("\n\nYou get your first look (for the night, anyway) of her lovely slit, just a moment’s glimpse of pink pussyflesh and curly silver hair before her dance brings her down to all fours, and her pants slide down over the lean curves of her ass. She kicks them off, leaving only the sheer veneer of her panties between you and the sulty slit hiding between her thick thighs.");
		var x:int = pc.cockThatFits(shade.vaginalCapacity(0));
		if(x < 0 || !pc.hasCock()) x = -1;
		if(x >= 0)
		{
			output("\n\n<i>“How’s my ");
			if(pc.cocks[x].cLength() < 7) output("little");
			else output("big ol’");
			output(" friend doing down here?”</i> Shade coos, wrapping her fingers around your dick. <i>“It’s getting cold in here... I better find somewhere warm for it to hide.”</i>");

			output("\n\nThe MILF-kitty gives you a sultry wink, slowly rocking her wrist up and down along your length. Your body instantly reacts, sending thrills of pleasure like electric jolts through your [pc.legs] and belly.");

			output("\n\n<i>“How ‘bout this for starters?”</i> your lover purrs, slipping down and stroking your cock until your dick’s standing straight up, and her pink lips are pressed to the crown. She brushes a stray bit of silver hair back and, locking eyes with you, slides her mouth down the length of your [pc.cock " + x + "]. By the time her lips press against your [pc.knot " + x + "], Shade’s eyes have fluttered closed, only opening again when she’s returned to the crown, leaving trails of glistening saliva coating your shaft. Moaning softly, the silver-maned sex-kitten bobs down on your cock again and again, not stopping until your dick’s sheened with her spit.");

			output("\n\nShade slips her lips off your [pc.cockHead " + x + "], leaving it with a parting lick across the glans. <i>“I don’t know,”</i> she purrs, dragging her knees up and pressing them into your hips. <i>“I think your [pc.cock " + x + "] would feel a lot better here instead.”</i>");
			output("\n\nThe sensual huntress rises as high as she can on her knees and reaches a hand between her legs, spreading open the plush pink lips of her pussy. Your eyes fixate on the slick slit of her sex, watching the visceral wetness of the kaithrit’s excitement all but drool onto your crotch... and your dick throbs with that familiar feeling: the desperate, hungry need to breed.");
			output("\n\nSensing your growing desire, Shade plants a hand firmly on your chest, pinning you down to the bed. <i>“Down, [pc.boyGirl],”</i> she chides. <i>“Let momma do her thing.”</i>");
			output("\n\nShe grins at you, flashing her fangs as she starts to lower her hips down on your fuckrod. Your whole body tenses when her twat engulfs the [pc.cockHead " + x + "] of your [pc.cock " + x + "], bathing it in sultry warmth. Instinctively, your body tenses for a split second, reveling in the pleasure of penetration. Shade’s wet walls squeeze around your dick as it slides into her, forming her pussy into a perfect mold of your dick by the time you’re fully buried in her.");
			if(pc.hasKnot(x)) output(" Your turgid knot spreads her lower lips, straining Shade’s quim until the cat-girl arches her back and moans, grinding hard against your throbbing bitch-breaker.");
			pc.cockChange();
			output("\n\n<i>“That’s more like it,”</i> Shade groans, settling on your pillar of cockflesh. <i>“Ohhhh, yeah. Fuck, I’ve been dripping wet since you came in the door. I needed this in me so bad!”</i>");

			output("\n\nThe feeling’s mutual - and your prick’s got no qualm about showing it. Your [pc.cock " + x + "] is throbbing with desperate need, leaking pre and jerking up into Shade’s welcoming womanhood with every ragged breath you take.");

			output("\n\n<i>“Good, I love it when you want me!”</i> she laughs, grabbing your hands. Shade laces her fingers through yours, squeezing them tight as she gets moving. Her tits bounce hypnotically as Shade starts to ride you, rocking her hips back and forth in your lap. Behind her, her parasitic tail ");
			if(pc.hasTailCock()) output("squirms between your [pc.legs], searching out its twin. Your [pc.cockTail] is soon engulfed in Shade’s tail, sliding deep into her drooling pussy-slit.");
			else if(pc.cockTotal() > 1) 
			{
				output("drools obscenely, craving a taste of dick. Your second cock is quickly engulfed in Shade’s extra cunt, sliding deep into her lusty tail-slit.");
			}
			else output("drools obscenely, craving a taste of dick - and finding none. With a soft gurgling noise, it contents itself rubbing against your thigh, stimulating its own turgid clit against your [pc.skinFurScales].");

			output("\n\nShade moans, squeezing your hands - and your [pc.cock " + x + "] - tight. Her hips move faster, smacking her ass on your thighs and making her tits jiggle so enticingly that you soon can’t help yourself. The desire to play with those big");
			if (shade.isLactating()) output(", milky");
			output(" mounds drives you mad with lust, compelling you to throw Shade’s hands aside and lunge for her boobs, squeezing them in your hands until their owner cries out, arching her back and gasping your name.");

			output("\n\n<i>“[pc.name]!”</i> she moans, clutching at your back. <i>“I want... I need...”</i>");
			output("\n\nYou know exactly what she needs. Stars, your body’s desperate to give it to her, to fill her with your seed. Leaning in and kissing Shade, you grab her lush asscheeks and pull her down, flipping the mature kitty on her back beneath you. She doesn’t miss a beat: Shade’s legs pull you in, forcing you in to the [pc.knot " + x + "] and holding you with all her strength. Her pussy’s muscles work like mad, wringing your [pc.cock " + x + "] until you come crashing over the edge.");

			output("\n\n[pc.CumNoun] gushes into Shade’s willing twat. You push your [pc.face] into her cleavage, soaking up all the little quakes and jiggles of her breasts while your [pc.cock " + x + "] unleashes its mighty load inside the beautiful MILF.");
			if(pc.hasKnot(x)) output(" Your [pc.knot " + x + "] wedges firmly between your lover’s pussylips, tying you two together until your orgasm’s passed.");
			else if(pc.hasTailCock()) output(" Your tail-mounted dick mimics the motions of your main dick, giving Shade’s tailcunt all the sweet spunk it craves while your main dick leaks its aftershots.");

			output("\n\nShade’s deathgrip on you relaxes, going from fierce to a loving embrace as your cock finishes its dirty business inside her. When you extract your face from between her breasts, the first thing you see is her smile as she runs a hand across your cheek.");

			output("\n\n<i>“You really knew what I needed,”</i> she laughs, planting a kiss on your forehead. <i>“");
			if(pc.hasKnot(x)) output("I hope you weren’t planning on leaving me... because I’m not letting go until morning.");
			else output("Don’t you dare pull out until morning... I’m not letting you get away from me.");
			output("”</i>");
			output("\n\nYou wouldn’t dream of it...");
			pc.orgasm();
			shade.loadInCunt(pc, 0);
			IncrementFlag("SEXED_SHADE");
		}
		//PC Has No Cawk Vers.
		//Just use generic Shade Pitch Strapon scene.
		else
		{
			clearMenu();
			addButton(0,"Next",takeShadesHardlightPenisInYerBoot,true);
			return;
		}
	}
	processTime(9*60);
	clearMenu();
	addButton(0,"Next",shadeCleanupEpilogue);
}

public function shadeCleanupEpilogue():void
{
	clearOutput();
	showBust(shadeBustDisplay(), astraBustDisplay());
	showName("SHADE &\nASTRA");
	author("Savin");
	if(!shadeIsLover())
	{
		output("When you wake up the next morning, many movies into the holiday marathon, your eyes flutter open to see Shade and Astra leaning against you. The screen’s still going, playing a scene of some human men dressed in Stormguard attire handing out presents - mostly wrapped polearms - to small children clustered around some kind of alien tree.");

		output("\n\nHow wholesome - kinda like you and your family here, all snuggled up on the couch. You’re content to relax between the pair of snoozing kitties until they slowly start to rouse themselves, stretching and yawning, tails wiggling.");

		output("\n\n<i>“Oh, hey,”</i> Astra murmurs, flicking a tail around your [pc.leg]. <i>“Sounds like the storm’s finally died down.”</i>");
		output("\n\nYou glance upwards, straining your ear. Yeah, there’s no roar coming from outside anymore. Guess you weathered the storm after all.");
		output("\n\nShade sighs, brushing a lock of silver hair out of her eyes. <i>“I guess that means you’re hitting the star-trails again, huh kiddo?”</i>");
		output("\n\n<i>“Unfortunately,”</i> you say, giving her a hug. You gotta get back out there, while there’s still time to win this race.");
		output("\n\n<i>“Give ‘em hell, then,”</i> Astra laughs, giving you a friendly punch on the shoulder. ");
		if(pc.isGoo()) output("Your body ripples outwards from the impact, making you wobble in place between them. ");
		output("You ruffle her hair in return, slowly disentangling yourself from the kaithrit duo. Shade follows you, throwing on the familiar blue duster as you finish collecting your various belongings.");
		output("\n\n<i>“Sure you don’t want breakfast, at least?”</i> she offers. <i>“No, I know you’ve gotta go. Let me walk you out at least.”</i>");
		output("\n\nAstra rolls onto her knees, resting her chin in her hands. <i>“Was nice seeing you, [pc.name],”</i> she says, tails wagging. <i>“Hope we see you again before next winter!”</i>");
		output("\n\nThere’s a season that isn’t winter around here?");
		output("\n\nThe Irons girls both laugh, and Shade puts a hand around your shoulder, leading you towards the door. She picks up the drill Astra had been using the day before, quickly undoing the bolts for you. When the doors slides open, you’re greeted with a rush of ice-cold water and slushy snow spilling in, soaking your [pc.feet] before being sucked away by a little drain next to the stairs. Outside, there’s the ever-present foot-deep layer of snow covering everything you can see, making what little sunlight gets through glare into your eyes until you squint and cover them.");
		output("\n\nBefore you can step outside, Shade squeezes your shoulder and says, <i>“Thanks for coming, [pc.name]. It means a lot to me, having you here. To Astra, too. I’ve never had the best luck with family, and... and I guess, I hope I see more of you this year, alright? Make up for lost time and all that sappy shit neither of us ever got... little " + pc.mf("bro","sis") + ".”</i>");
		output("\n\nYou pull Shade in for a hug and tell her you’ll be sure of it.");
	}
	else
	{
		output("You fall asleep in Shade’s arms, using the kitty-MILF’s breasts as your pillow. You can’t remember the last time you slept so well...");
		output("\n\nYou awaken to the feeling on Shade stroking your [pc.hair]. <i>“Oh, you’re awake. Too bad, I was enjoying petting you... you don’t mind when an older woman takes advantage of your body, do you?”</i>");
		output("\n\nShe laughs before you can respond, planting a kiss on your cheek. <i>“I’m just teasing... though I do love having you here with me. Could get used to this... when you’re done with your big, important quest anyway. You know I’d never ask you to give up on it.”</i>");
		output("\n\nYeah, you know.");
		output("\n\n<i>“Well, sounds like the storm’s cleared up,”</i> your lover says, sitting up on her elbows. <i>“Too bad.”</i>");
		output("\n\nYou give her a smile and tell her not to worry - you’ll be visiting her again, and again. Not to worry.");
		output("\n\nShade laughs. <i>“I know. Come on, let’s get dressed before Astra starts getting worried about us. Oh, I didn’t even say goodnight.”</i>");
		output("\n\nConsidering the noise the two of your made, you’re pretty sure Astra knows where you’ve been. Still, you follow your lover’s lead in getting your gear back together - and sneaking in a few spanks and gropes on her lovely rear while you work. When she’s finally gotten her clothes on, Shade’s ass is nice and red - as are her cheeks.");
		output("\n\n<i>“You’re awful,”</i> she informs you, shoving you up against the wall and kissing you. <i>“And I love it. Now come on before I throw you back on this bed and ravish you ‘till the next big storm.”</i>");
		output("\n\nAstra is sitting on the couch, staring at the both of you as you exit Shade’s bedroom. Your lover blushes, and her daughter laughs, giving you both a grin from ear to ear. <i>“Good morning! Sounded like you two had a... rough night. So I made breakfast!”</i>");

		if(pc.isNice() && !pc.isTreated()) output("\n\nYou and Shade both groan, covering your faces. Astra just laughs even harder.");
		else if(pc.isMischievous()) output("\n\nYou and Astra both laugh while Shade covers her face, beet red.");
		else output("\n\nYou just stare at Astra while her mother groans and covers her face.");

		output("\n\n<i>“Sorry, mom,”</i> Astra snickers. <i>“Couldn’t help it. Uh, I did actually make breakfast, but I already ate. I’m gonna go on to the temple. See you around, [pc.name]!”</i>");
		output("\n\nShe hops up from the couch, gives you a slug on the shoulder, and jogs on up the stairs before Shade can stop blushing. From above, you hear the sounds of the drill whirring, then water rushing and some grumbling from Shade’s daughter before the door closes again, leaving you in silence.");
		output("\n\nShade breaks out laughing a moment later, leaning back against the wall and covering her mouth. <i>“Oh shit... oh that’s awkward. Never gonna live that down... especially if she tells her sire.”</i>");
		output("\n\nYou put a hand on Shade’s shoulder and tell her not to worry about it. The two of you will just have a nice breakfast, and you’ll get out of her hair.");
	}
	processTime(20);
	clearMenu();
	addButton(0,"Next",move,"UVI N30");
	var currDate:Date = new Date();
	flags["SHADE_XMAS"] = currDate.fullYear;
}