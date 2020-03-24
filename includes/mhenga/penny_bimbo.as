public function hungryFlahneWithBimboPenny():Boolean
{
	return (flags["SEEN_BIMBO_PENNY"] != undefined && (hours < 8 || hours >= 17));
}
//Post bimbo Penny reactions/repeat greetings (incl reaction from Flahne)
//Approach Text
//[replace text for Approach after Penny has been bimbo’d]
public function approachBimboPenny():void
{
	clearOutput();
	abeAuthor();
	//First Time
	if(flags["SEEN_BIMBO_PENNY"] == undefined)
	{
		showBust(flahneBustDisplay(true), pennyBustDisplay(true));
		showName("FLAHNE\n& PENNY");
		rooms["CUSTOMS OFFICE"].removeFlag(GLOBAL.NPC);
		generateMap();
		
		output("You head over to Penny’s desk, finding her sitting up straight at her chair, looking surprisingly perky and attentive. <i>“Oh, h-”</i> a weird look crosses her face briefly, but she recovers and finishes, <i>“hi [pc.name]!”</i>");
		output("\n\n<i>“Hi,”</i> you answer. <i>“How are you doing? You seem... distracted.”</i>");
		output("\n\nPenny giggles. <i>“Okay, you caught me!”</i> She throws her hands up in the air, then leans in close and whispers, as though telling a secret. <i>“I was finding it really hard to like, concentrate, and plus I had to deal with so much cum even </i>I<i> was having trouble drinking it all. But then, well, the problem solved itself!</i>");
		output("\n\nShe waves for you to come over, and, curious, you step around the desk. The first thing you see is that she’s not wearing any clothes from the waist down - although that’s hardly unusual - but then you see a shape down between her legs.");
		output("\n\nIt takes a little while before you figure out what it is, because at first it doesn’t really look like <i>anything</i>, just a big blob of... something. And then you see it - it’s Flahne. She’s on her knees, her face buried in Penny’s crotch, and you can see the fox-girl’s cock going inside her mouth and most of the way down her throat. The reason why you didn’t recognize Flahne at first is because she’s almost completely white, her body bulging a little bit under the massive loads Penny has clearly been feeding her for some time.");
		output("\n\n<i>“Ta-da!”</i> Penny announces happily. <i>“Flahne here has been really helpful in making sure I can still get work done, haven’t you?”</i>");
		output("\n\nFlahne pulls herself back, making Penny shudder as her dripping cock is pulled free to give Flahne room to speak. Finally she turns up to you and shrugs. <i>“It’s a living,”</i> she says simply.");
		output("\n\nPenny giggles again, slapping Flahne lightly. <i>“Oh you tease, acting like it’s all </i>such<i> a big trouble. You know as well as I do that you started drooling the second I told you about all this, and you couldn’t </i>wait<i> to help me out.”</i>");
		output("\n\nShe looks back up at you, pouting just a little bit. <i>“Do you know, I didn’t even have to like, go looking for her or anything? The second you left after we first did this I heard something out the window and she was just like, there. I swear she must be able to like, smell cum or something, and we both know I was putting out a </i>lot<i> of it.”</i>");
		output("\n\nYou both turn back to Flahne, and you think that maybe she blushes slightly, even though it’s hard to tell given her current coloring. She doesn’t say anything though, she just slides herself back onto Penny’s cock, making both of them shudder with pleasure.");
		output("\n\n<i>“So,”</i> Penny says eventually, <i>“what can I do ya for?”</i>");
		
		flags["SEEN_BIMBO_PENNY"] = 1;
		processTime(5);
		bimboPennyMenu();
		setButtonDisabled(3);
	}
	//Repeat
	else
	{
		showPenny(true);
		
		//IF PC HAS APPROACHED PENNY AFTER SHE HAS BEEN BIMBO’D BEFORE AND THE TIME IS BETWEEN 0800 AND 1700
		if(hours >= 8 && hours < 17)
		{
			output("Penny is sitting at her desk, doing her best to deal with the police work for the day. She looks pent up, even she’s drinking from a coffee mug that you’re pretty sure is filled with her own cum. Every now and again even that clearly isn’t enough, and she’s forced to lean back in her chair, push her monster cock between her breasts and hungrily suck on it until she gives herself another fresh coating. Her fur is thickly spattered with cum, and there are several other large splashes of it around the office. There’s no one else around for now though, Flahne must be having to work her day job. Penny looks up excitedly as you approach. <i>“Hi [pc.name], am I glad to see you! What can I do for ya?</i>");
		}
		//IF PC HAS APPROACHED PENNY AFTER SHE HAS BEEN BIMBO’D BEFORE AND THE TIME IS BETWEEN 1701 AND 0759
		else output("Penny is leaning back in her chair, happily relaxing as she finally gets to drain herself fully now that Flahne is here. The office looks surprisingly clean too - between the two of them they must have cleaned up once it got a bit quieter on the night shift. Flahne doesn’t say anything to you as you walk over, she’s a bit busy with Penny’s cock in her mouth, after all, but Penny looks up excitedly. <i>“Hey there [pc.name]! What can I do for ya?</i>");
		//Buttons
		//[Talk][Sex Options][Leave]
		bimboPennyMenu();
	}	
}

public function bimboPennyMenu():void
{
	clearMenu();
	addButton(0,"Talk",bimboPennyTalk);
	if(pc.lust() >= 33) addButton(1,"Sex",bimboPennySex);
	else addDisabledButton(1,"Sex","Sex","You are not quite in the mood for this at the moment.");
	if(!pennyRecruited())
	{
		// IQ B-Gone
		if(pc.hasItemByClass(IQBGone)) addButton(2,"IQ B-Gone",turnInIQBGoneToPenpen,undefined,"IQ B-Gone","Turn in the IQ B-Gone you got from Dr. Badger’s lab.");
	}
	if(pennyRecruited()) addButton(5, "Join Crew", pennyRejoinCrew, undefined, "Join Crew", "Ask Penny to rejoin your crew and move back into your ship.");
	else
	{
		if(hours >= 8 && hours < 17) addButton(5,"Recruit",recruitBimboPenpen,undefined,"Recruit","Offer Penny a spot on your crew as your own personal on-demand bimbo.");
		else addDisabledButton(5,"Recruit","Recruit","Penny seems a bit busy with Flahne. It would be better to discuss this between you and Penny.");
	}
	addButton(14,"Leave",mainGameMenu);
}

//TALK
public function bimboPennyTalk():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	//IF PC IS A BIMBO
	//IF PC IS A BIMBO [whether Dr. Badger brand or not]
	if(pc.isBimbo() || pcBimboedByBadger())
	{
		output("You walk over, grabbing Penny in a big hug. <i>“Oh my goodness, how much fun are you having?”</i>");
		output("\n\n<i>“Oh man like, </i>so<i> much fun!</i>");
		output("\n\n<i>“And the fucking, right?”</i>");
		output("\n\n<i>“I </i>know<i>, right? Like, I used to like fucking, like, really like it, but now it’s like, whoa. A whole new level of pure fuck. It’s amazing!”</i>");
		output("\n\n<i>“So... uh...”</i> you stop, putting your finger to your lips for a moment as you try to think of something else to talk about. <i>“How’s like, work going?”</i>");
		output("\n\nPenny giggles. <i>“Fun! At least with Flahne to help me get through the slow parts. Other than that, it’s amazing how many problems you can solve in this town by bending over and taking it like a champ. Or giving it, if you need to, like with those nasty ol’ Zil. My cock has </i>totally<i> helped show them who’s boss.”</i>");
		output("\n\n<i>“Nice!”</i>");
		output("\n\nYou stop to think of something else to say again, and while she waits Penny shudders, cumming quietly under the table.");
		output("\n\n<i>“So...”</i> she says invitingly, <i>“you want to fuck yet?”</i>");
	}
	//IF PC IS NOT A BIMBO
	else
	{
		output("<i>“So, how do you actually feel?”</i> you ask.");
		output("\n\n<i>“Great!”</i> she answers happily. <i>“I don’t know - maybe some day I’ll want to go back to being super serious go-getter cop lady grr, but for now, this feels like a vacation, you know? Just me, my massive cock, my massive sex drive, and my buckets of cum. I think I’ve earned that, don’t you?”</i>");
		output("\n\nYou can’t argue with that. She definitely seems happy too, even if she’s a bit more... single-minded than she used to be. It seems like everything worked out pretty well after all. <i>“So,”</i> you say, unsure of where exactly to take the conversation after ‘buckets of cum’. <i>“Want to talk about your job? Your life? Your race?”</i>");
		output("\n\nPenny shrugs. <i>“Nah, you know all that by now, right? You must be sick of hearing me talk about being a kid in college who wanted to be a fox girl and secretly wanted to get a dick, and then I worked real hard and got both of those things, right?</i>");
		output("\n\n<i>“Uh, well...”</i>");
		output("\n\n<i>“So yeah, let’s skip all that! What say we go straight to the fun questions? Like - do you want to have sex, and what kind of sex do you wanna have?”</i>");
		output("\n\nWell then.");
	}
	//[Increase PC Lust by 15]
	pc.changeLust(15);
	processTime(3);
	clearMenu();
	bimboPennySexMenu();
}

//SEX OPTIONS
public function bimboPennySex():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("You tell Penny that you’re in the mood for some fun.");
	output("\n\n<i>“Oh thank </i>goodness<i>!”</i> she says with a giggle. <i>“You have no idea how much I was hoping you’d say that. So... what do you want to do?”</i>");
	bimboPennySexMenu();
}

public function bimboPennySexMenu():void
{
	clearMenu();
	//[Fuck her][Get fucked by her][Get oral][Cum bath][Play with Flahne]
	if(pc.hasCock() && pc.cockThatFits(penny.vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",fuckBimboPenny,undefined,"Fuck Her","Use your cock to fuck the happy little bimbo.");
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Her","Fuck Her","You’re too big to fit in her, even after her enhancements.");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis to fuck her.");

	addButton(1,"Get Fucked",getFuckedByBimboPenny,undefined,"Get Fucked","Take advantage of bimbo Penny’s rather sizeable tool.");
	addButton(2,"Get Oral",getOralFromBimboPenny,undefined,"Get Oral","Have your bimbo slut give you a nice oral servicing.");
	if(pennyIsCrew())
	{
		addButton(3,"Cum Bath",givePennyACumBath,undefined,"Cum Bath","Penny sure seems very... productive, maybe you could take advantage of that, if you want?");
	}
	else if(hours >= 8 && hours < 17) 
	{
		addButton(3,"Cum Bath",givePennyACumBath,undefined,"Cum Bath","Penny sure seems very... productive, maybe you could take advantage of that, if you want?");
		addDisabledButton(4,"Flahne Play","Play With Flahne","Flahne has to be here for this scene, try back later in the day.");
	}
	else 
	{
		addDisabledButton(3,"Cum Bath","Cum Bath","Come back when Flahne isn’t around so Penny has had more time to build up her production.");
		addButton(4,"Flahne Play",playWithFlahne,undefined,"Play With Flahne","Flahne’s had a lot of time to absorb Penny’s cum, surely that would make for some interesting flavors and opportunities?");
	}
	if(pennyIsCrew()) addButton(14,"Back",approachCrewPenny,true);
	else addButton(14,"Back",approachBimboPenny);
}

//FUCK HER
public function fuckBimboPenny():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("<i>“Ready for some fun?”</i> you ask");
	if(!pc.isCrotchExposed()) output(" as you strip off your [pc.crotchCovers],");
	else output(" as you lift your hips,");
	output(" exposing your cock as it quickly gets hard.");

	output("\n\n<i>“For sure!”</i> she answers happily, standing up so quickly that she knocks her chair over, making it fall to the ground with a clatter behind her. She doesn’t seem to be put off by that at all, leaning forward over her " + (pennyIsCrew() ? "bed":"desk") + " and wiggling her already naked butt with a happy giggle.");
	if(!pennyIsCrew() && (hours >= 17 || hours < 8)) output(" Beneath the desk, Flahne is clearly sad to have Penny taken away from her, but seems to be happy enough to just lie back and digest the cum she’d already received instead of trying to join in.");
	output(" You take up your position behind her, moving her bushy tail to the side to give yourself access and enjoying the way she shivers with pleasure as you do.");
	//IF PC IS A BIMBO = 
	if(pc.isBimbo() && pc.biggestTitSize() >= 5) output("\n\n<i>“Oh holy shit, this is so great,”</i> you gasp, grabbing at her big full booty as you lean forwards over her, your big tits reaching down far enough to brush against the fur of her back. <i>“I didn’t know how much I wanted to share my slutty bimbo-ness and make a nice pet to fuck, but now that I’ve done it... mhmmmm, it’s the </i>best<i>.”</i>");
	else output("\n\n<i>“You </i>are<i> a good girl, aren’t you?”</i> you whisper into her ears, leaning commandingly over her and grabbing at her big full booty. <i>“Making you into a cute, slutty bimbo pet to fuck was </i>definitely<i> the right choice, wasn’t it?”</i>");
	output("\n\nPenny’s first answer is just a happy little moan, pushing back onto your cock ever so slightly but still waiting for you to make the first move. <i>“I know, right?”</i> she says eventually. <i>“It’s like, I can remember that there was a point where I was all shy and unsure about wanting a big ol’ cock, but like, now it all just seems so dumb!”</i> She reaches down, taking her dick in her hands and putting it up on the desk in front of her before starting to eagerly jerk herself off. <i>“I mean, come on! How could I be unsure about </i>this<i>! It’s the best! I get to cum and cum and... fuck and be coated in... cum...”</i>");
	output("\n\nYou realize that she’s just about to get herself off just from her hands and from thinking about how much of a cum slut she’s become, so with a grin you press your cock into her waiting slit before she finishes without you. She cries out in pleasure as you do, her hands quickly moving off her shaft to steady herself against the desk. Taking that as encouragement you settle into a pounding rhythm, pushing her forwards again and again as she eagerly takes your length inside her.");
	pc.cockChange();
	//penny.cuntChange(0, penny.cockVolume(pc.cockThatFits(penny.vaginalCapacity(0))));
	output("\n\n<i>“Yes! Yes! Yes!”</i> she gasps with each thrust, rocking back into you to heighten the sensations. <i>“I... I need... more!”</i>");
	output("\n\nReaching down beneath herself, she once again wraps one of her hands around her thick shaft. You’re fucking her hard, but clearly she wants even more, wants to make sure she takes advantage of every part of the body you’ve given her. Pressing her cock up between her swaying tits she starts losing herself, letting go and eagerly embracing the urges and needs you’ve brought out in her. Her canine muzzle kisses at the tip of her cock every time one of your powerful thrusts pushes it towards her, her long tongue mixing drool with her dripping pre-cum.");
	output("\n\nIt doesn’t take long of this to make her cum, her knees locking forwards against the " + (pennyIsCrew() ? "bed":"desk") + " as her hips tremble, her cock spurting again and again all over her face. She’s quickly left with a dripping puddle to happily slather herself with, licking up as much as she can even as more slick whiteness pulses from her churning balls.");
	output("\n\nIt’s a good sight, and you’re not far from cumming yourself, but suddenly notices your body starting to tense up and turns around to look at you, eyes wide. <i>“N- wait!”</i> she gasps urgently. Pulling forwards she drags your cock out of herself, and before you can react she flips over, sliding forwards onto her knees and looking up at you.");
	output("\n\n<i>“Please,”</i> she begs, <i>“cum on my face. Don’t make me have to walk around all day waiting for all of your yummy cum to drip from my pussy - let me... let... I need, please...”</i>");
	output("\n\nPenny trails off, too busy drooling and licking her lips now that your stiff cock is right up next to her face. Closing her eyes, she takes one long, deep breath, savoring your scent as it reaches inside her sensitive nose and flips all the right switches in her brain, making her tail wag unthinkingly behind her. Then she opens her eyes again, and when she looks up at you you see that same flash of power and passion she had when you first met her, but now so eagerly and willingly redirected.");
	output("\n\nShe falls on you, a mess of flailing limbs and her wild, drooling tongue. After a few seconds of confusion she manages to come up with a plan, and, raising herself up slightly, she pushes her tits together with her hands and then slides your [pc.biggestCock] between then.");
	output("\n\n<i>“Yessss...”</i> she moans happily as she quickly settles into a rhythm. <i>“Yes, fuck me... fuck every part of me, just let- let me have- CUM!”</i>");
	output("\n\nOn that last word she thrusts herself forwards powerfully, and it’s more than enough to bring you over the edge. You fall against her, hands gripping at her head as you almost fold over, your body far more focussed on filling her request than on things like ‘standing up’. Penny gets her reward though, your cock pulsing as a blast of your [pc.cum] washes over her. She leans back, freeing you from between her tits to better let you coat as much of her as possible. Her tongue chases down several mouthfuls for her to savor, but for the most part she’s happy to just close her eyes and lie back, enjoying the feeling of your cum landing all over her.");
	output("\n\nShe opens her eyes again when you’re finally done, licking her lips with a smile. <i>“Mmmmm, that feels so right, having my whole body all nice and sticky with your cum and mine. ");
	if(pennyIsCrew())
	{
		output("I’m so lucky I can live like this all the time! I get to be your nice, drippy cumslut assistant, always ready to satisfy you... or any randy aliens you bring back. We can all fuck together. Just one, big, cum-drenched bunch of sluts.”</i>");
		output("\n\nYou smile back, unsure how to respond, but she giggles before you can answer. <i>“Yeah, I know, it’s like... the best. And I meant every word. I’m like, your personal spunk-dump, but I’ll fuck anybody you want, any time.”</i> She sighs happily. <i>“Well, I guess better clean up for my next show! I can’t be a mess all the time!”</i>");
	}
	else 
	{
		output("Can I just live like this always? Maybe I should just come with you and be your nice, dripping cumslut assistant that you can have all the aliens you fight fuck when you can’t be bothered fighting them yourself?”</i>");
		output("\n\nYou’re not sure what to make of that, but she giggles before you can respond. <i>“Nah, don’t worry, I’m just kidding. That’d be fun, but there’s all like, reasons why it’s not likely to happen.”</i> She sighs. <i>“Well, I guess for now I’d better make the most of you when you’re around.”</i>");
	}
	output("\n\nShe picks her chair up off the ground and sits down, wiping her clawed fingers slowly along her sticky fur and sucking it clean after every swipe. <i>“Let me know when you’re good to go again!”</i> she says in between mouthfuls.");
	processTime(38);
	penny.orgasm();
	penny.loadInCunt(pc, 0);
	pc.orgasm();
	IncrementFlag("SEXED_PENNY");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//GET FUCKED BY HER
public function getFuckedByBimboPenny():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("Smiling, you make your way over to Penny" + (!pennyIsCrew() ? "’s desk":"") + ", saying, <i>“I think it’s time to put that cock of yours to use...”</i>");
	output("\n\nPenny giggles happily in response, springing up from her chair and running over to you. <i>“You bet!”</i> she says simply. <i>“That sounds good to me!”</i>");
	if(!pennyIsCrew() && (hours >= 17 || hours < 8)) output(" Beneath the desk, Flahne is clearly sad to have Penny taken away from her, but seems to be happy enough to just lie back and digest the cum she’d already received instead of trying to join in.");
	output("\n\nYou ");
	if(!pc.isCrotchExposed()) output("shed your [pc.gear], leaning forwards and giving");
	else output("lean forward and give");
	output(" Penny a nice view. <i>“Well then, what are you waiting for?”</i>");
	output("\n\nPenny is caught off-guard for a moment, clearly expecting a little more teasing or foreplay, but she’s more than happy to roll with it if you just want something quick and dirty. <i>“Oh! Sorry!”</i> she says, but before you can tell her you were only kidding she grabs you firmly from behind, lining her thick cock up with your [pc.vagOrAss " + x + "]. <i>“You want me to like, go all at it then?”</i>");
	if(pc.isBimbo()) output("\n\n<i>“Psh, yuh. Why else would I have made you into a nice slutty bimbo like me if I didn’t want you to super fuck me a bunch?”</i>");
	else output("\n\n<i>“Uh, yeah, of course. Why else would I have made you a super horny bimbo slut with a nice big cock if I didn’t want you to fuck me with it?”</i>");
	output(", you answer, wiggling your rump to drive the point home and hopefully give her all the encouragement she could need.");
	output("\n\nIt works. Penny doesn’t even bother answering with words, instead just spearing herself into you, filling you up all nice and tight. She’s big, slick and hard, and you know for a <i>fact</i> that she’s ready and willing any time you want her to be. Settling quickly into a powerful rhythm, she’s soon fucking you like a pro, her clawed hands gripping you tightly as she puts every muscle in her body to work.");
	if(x >= 0) pc.cuntChange(x,penny.cockVolume(0));
	else pc.buttChange(penny.cockVolume(0));
	output("\n\n<i>“Mhmmm, that’s good girl,”</i> you sigh happily. <i>“You’re good at this, aren’t you?”</i>");
	output("\n\n<i>“Yes, yes, yes,”</i> she pants, each word in time with her thrusts.");
	output("\n\nYou lean back into it, savoring the feeling of her thick cock pushing so deep inside you. <i>“That’s what you’re for, isn’t it girl? Being always ready to fuck, whenever I want...”</i>");
	output("\n\n<i>“Yes... yes... yes...”</i> She’s having trouble concentrating enough to speak, only managing to get words out once every few thrusts, and the rest of the time her long tongue simply hangs needfully from her muzzle.");
	output("\n\n<i>“This is what you are now; an eager, bimbo slut,");
	if(pc.isBimbo()) output(" just like me,");
	output(" and doesn’t it feel good?”</i>");

	output("\n\nHer answer is mostly just a long, low growl. <i>“YYyess... yhrrrrssss... grhhhhh... yesss”</i>");
	output("\n\n<i>“You’re my little fuckpet, aren’t you? My cum addict slut, always dripping, always ready, always-”</i>");
	output("\n\nYou’re not sure what it was, but something you said pushes Penny over the edge. Whatever restraint she had breaks, and suddenly she’s just fucking you like a wild creature. There’s no rhythm, no technique, just a wild, unstoppable need to have as much of herself in as much of you as possible, over and over and over again. Her claws dig into you almost enough to draw blood, she leans down over you enough to start licking madly at your back with her long tongue, and you can <i>feel</i> her balls trembling as she builds up unstoppably. Smiling, you let her have her way with you for a few moments, until eventually you push back against her and say a single, commanding word:");
	output("\n\n<i>“CUM!”</i>");
	output("\n\n<i>“Gh-ahhhrhhhh!”</i> Penny answers, her whole body tensing up as she obeys your command. You feel her cock thicken inside you, her shaft pulsing as wave after wave of her cum surges through her. Her warm, wet slickness floods your [pc.vagOrAss " + x + "], blissful satisfaction pooling out inside you. You close your eyes and smile, content to lock your hips to hers and enjoy her trembling, eager tribute.");
	output("\n\nIt takes some time before she’s finally done, and then with a sigh you pull yourself away. She whines as you slowly release her slick member, but that quickly turns into a shocked gasp as she sees substantial slick mess that comes pouring out of you as she withdraws.");
	output("\n\n<i>“I- mhm!”</i> she whimpers, but before she can form a complete sentence she simply drops to her knees, overcome by her urges. <i>“Need!”</i> she adds in another quick gasp, then she presses her muzzle to the floor and begins to lap at her leftover cum.");
	output("\n\n<i>“Awww,”</i> you tease, scritching her lightly behind her ears, <i>“you just couldn’t hold yourself back, could you girl?”</i>");
	output("\n\nShe answers with a pout, or at least as much of one as she can manage with her face down in a puddle of her own cum. <i>“It’s </i>cum<i>,”</i> she whines, as though that were all the answer that was needed, and, thinking about it, that probably is.");
	output("\n\n<i>“I know girl. Can’t let that go to waste now, can you?”</i>");
	output("\n\nShe shakes her head, but doesn’t bother to answer any more than that. It looks like she’ll be busy cleaning up for some time, so you collect your things and get ready to resume your adventures.");
	processTime(37);
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(penny,x);
	else pc.loadInAss(penny);
	penny.orgasm();
	IncrementFlag("SEXED_PENNY");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//GET ORAL
public function getOralFromBimboPenny():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	if(pc.isBimbo()) 
	{
		output("<i>“I think, like, I </i>super<i> want to try out those nice plump lips of yours,”</i> you say happily, ");
		if(!pc.isTaur()) output("sitting down on the edge of her " + (pennyIsCrew() ? "bed":"desk"));
		else output("resting against the edge of her " + (pennyIsCrew() ? "bed":"desk"));
		output(" and leaning in close.");
	}
	else
	{
		output("<i>“I think it’s time to put those bimbo lips of yours to use servicing me,”</i> you say in a sultry whisper, ");
		if(!pc.isTaur()) output("sitting down on");
		else output("leaning against");
		output(" the edge of her " + (pennyIsCrew() ? "bed":"desk") + ".");
	}
	output("\n\n<i>“Oh yeah?”</i> Penny giggles, <i>“they’re pretty great, aren’t they?”</i>");
	output("\n\nInstead of answering you just grab her by the head, pulling her in as you ");
	if(!pc.isTaur()) output("bring your legs up, spinning around " + (pennyIsCrew() ? "":"on the desk and sweeping aside her terminal ") + "until you’re straddling her and her head is level with your crotch.");
	else output("clambering awkwardly " + (pennyIsCrew() ? "up":"onto the desk and positioning yourself") + " to make sure your crotch is right in front of her face.");

	output("\n\nPenny doesn’t need any more encouragement than that. She falls forward eagerly, ");
	//IF PC HAS A COCK = 
	if(pc.hasCock()) 
	{
		output("sliding her lips down the length of your [pc.biggestCock]. Her eyes roll up in her head in bliss - clearly, this is exactly what she loves to do.");
		if(pc.isBimbo()) output(" And why wouldn’t she? Sucking cock feels like, <i>so</i> great, why wouldn’t she love doing it?");
		output(" It feels pretty great on your side too, she is <i>good</i> at this. Her lips are so soft and plump that they feel like they’re designed to wrap perfectly around any and all cocks (and, knowing Dr. Badger, they probably are). Her tongue works your [pc.biggestCockhead] lovingly, scooping up your [pc.cumColor] pre-cum and shivering in pleasure every time she swallows a fresh batch.");
	}
	//IF PC DOES NOT HAVE A COCK BUT HAS A VAGINA = 
	else if(pc.hasVagina())
	{
		output("sliding her tongue tongue happily inside your [pc.biggestVagina]. She coos happily as you pull her close, licking at your insides while her plump lips brush against your [pc.oneClitPerVagina]. Her eyes roll up in her head in bliss - clearly, this is exactly what she loves to do.");
		if(pc.isBimbo()) output(" And why wouldn’t she? Eating out a pussy feels like, <i>so</i> great, why wouldn’t she love doing it?");
		output(" It feels pretty great on your side too, she is <i>good</i> at this. Her lips are so soft and plump that they feel just perfect against your clit, and she’s so skilled at moving her tongue inside you that it feels like it was designed for it (and, knowing Dr. Badger, it probably was). She presses herself close, making sure none of your [pc.girlCum] escapes and shivering in pleasure every time she swallows a fresh batch.");
	}
	//IF PC DOES NOT HAVE A COCK OR A VAGINA = 
	else
	{
		output("and you spin around again in anticipation, leaning forward so she can eat out your ass. She takes to it happily, her plump lips kissing at your soft flesh while her tongue sweeps eagerly along your rim. Her eyes roll up in her head in bliss - clearly, this is exactly what she loves to do.");
		if(pc.isBimbo()) output(" And why wouldn’t she? Eating someone out feels like, <i>so</i> great, why wouldn’t she love doing it?");
		output(" It feels pretty great on your side too, she is <i>good</i> at this. It’s like she was designed for it (and, knowing Dr. Badger, she probably was).");
	}
	output(" Despite all the ways ");
	if(!pc.isBimbo()) output("she’s changed physically");
	else output("her body has changed");
	output(", the hottest thing about might be the fact that she so clearly <i>needs</i> this. You don’t think she even eats or drinks anything else any more, she’s just a perfect, needy, eager cumslut, all day, every day.");
	output("\n\nYou did that. ");
	if(!pc.isBimbo()) output("You took this fierce, dedicated policewoman, and fucked her and changed her until she had a big, dripping cock, until her tits were so large they can barely fit in her uniform when she can be bothered to wear it, until all she wants to do is lie back on the ground and cover herself with cum again and again so that she can get to lick it all up. And she’s so happy with the results that she’ll eagerly service you in whatever way you ask every time you ask because it’s the only way she can think of to say thank you. Although, to be fair, that’s also how she says ‘hello’ now.");
	output("\n\nYou corrupted her. You fixed her. You made her yours. And she’ll beg you to use her every bit as much as you could possibly want to, because you made her need it too. You can see why Dr. Badger went full mad scientist over this.");
	//IF PC IS A BIMBO
	if(pc.isBimbo()) 
	{
		output(" You took this stuffy, angry cop and showed her how <i>good</i> it feels to be a slut. You showed her that her tits should be big, and always out and ready to receive the fresh blast of cum that’s your reward for being a good bimbo. You showed her how good it is to have her very own cock, so she can always have her lips wrapped around one and fresh cum to drink, even when she’s by herself. You showed her that it doesn’t matter if she constantly has to fall to all fours, even when she’s trying to get work done or trying to go somewhere or talk to someone or something, because she’s just hit with that <i>need</i> and she has to at <i>least</i> jerk herself off, making a nice fresh puddle of cum for her to push her muzzle into and lap up - that’s fine, that’s what she <i>should</i> be doing, because she’s a nice eager bimbo cumslut, and what could be more important than that?");
		output("\n\nYou showed her how good being a bimbo is. You spread your gift to her. Maybe you can spread it more. Maybe you’ll spread it to everyone. Maybe you can make everyone a nice, happy, slutty bimbo, just like you and Penny, make this whole sector big tits, swinging cocks and dripping cum. And you right at the front of all of it, fucking and being fucked, spreading the bimbo gospel to every new recruit you fill with your cum.");
		output("\n\nWow, you think suddenly, so <i>that’s</i> what Dr. Badger is all about. She really <i>is</i> smart.");
	}
	output("\n\nWith all of that going through your head, and with Penny doing such good work on you, it isn’t long before you finally orgasm. You grab her close, ");
	if(pc.hasCock())
	{
		output("pumping blast after blast of [pc.cum] down her throat.");
	}
	else if(pc.hasVagina()) output("pressing her muzzle as deep into yourself as possible before coating her tongue with a wave of your [pc.girlCum].");
	else output("shuddering with bliss as she sends you tumbling into eager, trembling climax.");
	//IF PC HAS MULTIPLE COCKS
	if(pc.cockTotal() > 1)
	{
		output(" Your unnattended cock");
		if(pc.cockTotal() > 2) output("s also fire");
		else output(" also fires");
		output(" off, sending long slick waves of [pc.cumColor] cum sliding down her fur.");
	}
	output(" She cums too, so blissfully happy to have successfully been of service, her thick cock spurting again and again down beneath the desk");
	if(!pennyIsCrew() && (hours >= 17 || hours < 8)) output(" - straight into Flahne’s welcoming mouth");
	output(".");
	output("\n\nEventually you push Penny back, and she licks her lips happily to savor the last of your flavor as you pull apart.");
	if(pennyIsCrew() || (hours >= 8 && hours < 17))
	{
		output(" She smiles at you, but a blush starts to rise in her cheeks, followed by an increasingly distracted look. Before you can ask her what’s wrong she blurts out <i>“sorry, I-!”</i> and dives down at of view.");
		output("\n\nYou’re confused for a second, but then you hear the sound of her snuffling frenziedly" + (pennyIsCrew() ? " on the ground":" beneath her desk") + ", clearly tracking down all the cum she just spent and licking it up. Eventually she rises back up, the tip of her muzzle stubbornly painted white even as her tongue wraps around her nose again and again to try and clean it all off.");
		output("\n\n<i>“Sorry,”</i> she says softly once she’s finally free to talk again. <i>“I just couldn’t like, sit here while I knew there was such a delicious treat just waiting for me.”</i> She nuzzles up close, snuggling up against your body lovingly. <i>“Plus, it always just tastes better when it’s from something I did with you.”</i>");
	}
	output("\n\n<i>“Thanks [pc.name]!”</i> she says perkily, straightening back up as you get off her desk, <i>“I </i>super<i> needed that.”</i>. She bites her lip, pouting a little bit as she adds. <i>“Let- let me know if you want to do anything else, please? I could always go for another round...”</i>");
	processTime(33);
	pc.orgasm();
	penny.orgasm();
	penny.loadInMouth(pc);
	IncrementFlag("SEXED_PENNY");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//CUM BATH
public function givePennyACumBath():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Looking down at Penny, so cute and pent-up, gives you an idea. <i>“Come with me,”</i> you say simply, grabbing her by the arm and pulling her away from her " + (pennyIsCrew() ? "camera":"desk") + ".");
	output("\n\nShe looks confused, but follows along obediently, only stopping " + (pennyIsCrew() ? "to swipe the power for her streaming station to “off.”":"for a second to flick a button that sets turns on an <i>“Out”</i> sign outside and locks the front door.") + " Then with a light-hearted giggle, she happily lets you pull her away. To her surprise, " + (pennyIsCrew() ? "you lead her":"you lead her not to a bed, but") + " to a large, empty bath.");
	output("\n\n<i>“Oh! Do you want to like... fuck in the bath? Or take a bath together?”</i>");
	if(pc.isBimbo()) output("\n\n<i>“Both!”</i>");
	else output("\n\n<i>“Something like that...”</i>");
	output(" you answer, leaning down to turn off the drain in the bath and then turning towards her. She’s already naked from the waist down - ");
	if(pc.isBimbo()) output("because why wouldn’t she be?");
	else output("putting a desk between her and anyone else coming in to see her being about as much as she can manage for modesty");
	output(" - so it’s a simple matter for you to grab her cock and start sliding your hand back and forth along the length of it.");
	output("\n\n<i>“A-ahmm! Oh " + pc.mf("Mister","Miss") + " Steele!”</i> she gasps, trembling as her eager balls can’t help but give off a quick spurt of cum. <i>“That’s... ah! Oh... ohhhhhh...”</i>");
	output("\n\nYou settle into a steady rhythm, smiling at the way she can’t help but bite her lip as you wring more and more cum out of her cock, aiming it all into the bath.");
	if(pc.isBimbo()) output("\n\n<i>“You’ve got like, </i>so<i> much cum,”</i> you say while you work happily, <i>“it’s like - I couldn’t let it go to waste! So I thought, how could I get the absolute </i>most<i> cum to play with all at once? And then, ta-da! Cum bath! Am I a genius or what?</i>");
	else output("<i>“I was just thinking...”</i> you tease her softly, even as you keep working her over unstoppably, <i>“I made it so you make all this cum, so shouldn’t I get to enjoy it all too? So, here we are...”</i>");
	output("\n\nHer hands grip at the edge of the bath, and you can see know that she knows what’s going on she’s clearly getting into it. <i>“Ohhh! Yes, [pc.name], use me... uhnnn! Use me like your - uhrnmmm! - nice little cum slut!”</i>");
	output("\n\n<i>“That’s right girl,”</i> you say, <i>“you’re made to be used for cum, aren’t you?”</i>");
	output("\n\n<i>“Yes! Yes! Yes!”</i> she pants desperately, each short happy bark accompanied by another thick blast of cum into the tub. <i>“Yesss I’m your... little! Fox! Cum! Slut!”</i>");
	output("\n\nYou lean back, and the second you move your hands she takes their place, wrapping one of her paws around her slick shaft and pumping away while her other one slips into her pussy to try and make sure she wrings out every bit of pleasure she is capable of.");
	output("\n\nHer efforts have paid off, and by now even though it hasn’t been that long the bath is already around a quarter full. Of course, that’s not <i>nearly</i> enough. Stroking her hair softly, you lean in and whisper right in her cute fluffy ears, <i>“That’s right girl. Doesn’t it feel so </i>good<i> to let yourself be what you should be?”</i>");
	output("\n\nBy now Penny can barely talk. Her tongue is hanging out of her muzzle, and something between a low growl and a needy whine is rising in her throat, but it’s all mixed together with a constant, panting chant of just <i>“Cum! Cum! Cum! Cum!”</i>");
	output("\n\nYou let this go on for a few moments, stroking her tenderly as she works herself over and fills up the tub. Despite the pretty constant stream of cum pouring out of her, her expression makes it look like she’s edging - clearly enjoying herself, but just on the edge of something so much more.");
	output("\n\nLooking down, you see the bath is now about half full. <i>“What are you for?”</i> you ask her simply.");
	output("\n\n<i>“Cum! Cum! Cum!”</i> she answers instantly.");
	output("\n\n<i>“And what do you </i>need<i>?”</i>");
	output("\n\nShe’s barely able to respond. Thick strands of drool run down from her lips, and her eyes are wide as she stares with naked desire at the pool in front of her. <i>“C-cum! Cu-uummm! CUM!”</i>");
	output("\n\nMoving around behind her, you give her fluffy tail a quick swipe, smiling as you see that even now that still stops her in her tracks. Taking advantage of her brief pause, you put one hand squarely on her back and say, <i>“Then go get it.”</i> Then you push.");
	output("\n\nShe falls forwards eagerly, bringing up her arms enough to break her fall but not enough to keep her from sliding beneath the surface of all her wonderful cum. As soon as she hits the bottom of the bath she flips over, lying on her back so that she can keep jerking herself off, her cock still standing stiffly out above her. She barely needs to touch it to bring herself to a final, climactic orgasm, clearly just the feel and the scent of being so completely soaked in her own liquid slickness is enough to make her cum like some sort of perverted fountain. She quickly adds so much more that she’s soon in danger of ");
	if(pc.isBimbo()) output("going like, underwater, but with cum");
	else output("submerging herself completely");
	output(", but she just manages to keep up by hurriedly lapping up as much cum as she can.");
	output("\n\nIt takes a while, but eventually her needful thrusts and arching jets of white cum die down enough that she can stop focussing her tongue on licking up as much cum as possible, at least for long enough to say quickly <i>“Care to join me then, [pc.name]?”</i>");
	processTime(33);
	penny.orgasm();
	penny.orgasm();
	penny.orgasm();
	//Add Buttons
	//[Yes][No]
	clearMenu();
	addButton(0,"Yes",cumBathWithYourCumSlut);
	addButton(1,"No",dontJoinPennyForACumBath);
}

//YES
public function cumBathWithYourCumSlut():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("You strip down and slide into the bath happily, and Penny moves around to the side to give you room. Pretty quickly she’s on top of you, letting you sink down into the warm, slick cum she’s so thoughtfully provided, while she straddles you with a grin.");
	output("\n\nYou think she’s about to say something, but instead she just leans forwards, licking her long wet tongue all the way along your chest. You’re not sure if it’s for your benefit or if it’s just because now you’re coated with the cum that she craves, and maybe she isn’t either, but it still results in a definitely good time. She giggles as you grab her around the waist, but she’s so focussed you decide to just leave it at that. Just you and her, enjoying this nice warm bath, while she so eagerly and dedicatedly slides her tongue over every single part of you. It’s surprisingly relaxing.");
	output("\n\nYou only realize you drifted off after you wake up. Penny’s asleep too, all curled up and cute on top of you. Eventually you realize - you don’t feel that wet anymore. You were expecting to feel at least sticky still, but... it really does seem like she managed to get all of it. Damn. She is definitely good at what she does, thanks to you.");
	output("\n\nIt’s almost a shame to wake her, but you have places to be and new worlds to discover. She gives you one last kiss as you get up, her tongue still slick with the last of the cum, and then settles back down at her " + (pennyIsCrew() ? "bed":"desk") + " with a sigh as you get ready to leave.");
	processTime(75);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//NO
public function dontJoinPennyForACumBath():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Penny does her best to make it look inviting, but you decide to leave her to it. You have places to be and new worlds to discover, and it’s <i>probably</i> not the best idea to try and do all that while dripping with sex fluids. You make your excuses, and while she looks disappointed, she’s too excited by being covered in cum to be sad for long. You slip outside, followed by some very eager and happy noises as Penny gets back to having fun.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PLAY WITH FLAHNE
public function playWithFlahne():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Looking down under Penny’s desk, you see Flahne sitting back happily, sucking on Penny’s cock as it sends a slow, constant stream of whiteness down her throat.");
	output("\n\n<i>“Having fun, are you?”</i> you ask innocently.");
	output("\n\nFlahne takes a moment to reply, having to slowly pull herself away from Penny’s cock first. <i>“Y... yeah,”</i> she mumbles. She seems... not quite drunk, but sort of like, blissed out - like she’s so deep in the pleasure of what she’s doing that she’s having trouble focussing on anything else. <i>“Iss good.”</i>");
	output("\n\nBefore you can say anything further, Penny interrupts with a giggle. She’s snuck one of her paws down to her cock and quickly rocks her hips forwards, and a sudden blast of cum catches Flahne full in the face. <i>“Oops!”</i> Penny teases, <i>“Silly me!”</i>");
	output("\n\nFlahne doesn’t bother to even act upset, instead just leaning back with a smile and licking up the cum that coats her slick flesh. Even after she clears most of it up her face still seems slightly whiter than before - clearly, Penny is giving her body too much to absorb normally.");
	output("\n\nThinking about that gives you an idea. <i>“Hey, come up here for a minute,”</i> you tell her, leaning down to help pull her up. Penny pouts as her favorite toy is taken away, but doesn’t stop you from picking Flahne up and leaning her against the desk so she’s steady enough to stand. Then, while she’s smiling blissfully at you and waiting whatever comes next, you lean in, wrapping her up in a passionate kiss.");
	output("\n\nShe responds immediately, her tongue sliding inside your mouth as the two of you press together tightly. Eventually you pull back, licking your lips as you consider things briefly.");
	output("\n\n<i>“Yep,”</i> you announce after a few seconds, <i>“tastes like cum.”</i>");
	output("\n\nPenny looks shocked, her ears standing straight up from her head in surprise. <i>“What?”</i> she gasps, but before you can answer she lunges forwards, grabbing Flahne out of your arms and pulling her down into her lap. Flahne purses her lips, clearly expecting another kiss, but Penny has something else in mind, and starts simply licking her, sending her long canine tongue sliding all the way along Flahne’s goopy white flesh from the bottom of her chin to the top of her head.");
	output("\n\n<i>“You’re right!”</i> Penny says between licks, <i>“She’s like cum but like... different? Like, less wet... but more sweet?”</i>");
	output("\n\nThat sounds about right. Somewhere between all the sweetness Flahne loves and the natural texture of her body, kissing her tasted like if someone had for some reason made an icecream out of cum.");
	output("\n\nClearly it’s a flavor that Penny is enjoying, given that she’s now furiously licking over every part of Flahne’s dripping white body that she can reach, while holding her so tightly that her claws are sinking ever so slightly into the goopy flesh of her butt. Fortunately Flahne seems to be enjoying it, leaning in happily and relaxing under the attention of Penny’s eager tongue. She doesn’t seem to be being hurt by any of it either - Penny’s claws clearly aren’t enough to cause the goo girl any problems, and no matter how hard she licks Penny is only tasting Flahne’s wet skin rather than actually consuming her at all.");
	output("\n\nYou stand back and let them enjoy themselves for a few moments, happy to have taught both of them a new trick, but soon you decide that you want to do more than just watch. Reaching out you grab Flahne, pulling her up with enough force that eventually Penny gets the point and lets her go. You don’t pull her away entirely though, instead just raising her up enough that she’s standing bent over just in front of Penny’s legs, then spinning her around so she’s facing towards you. Then, leaning around Flahne to make eye contact with Penny, you say, <i>“Let’s give her a nice fresh filling then, shall we?”</i>");
	output("\n\nPenny looks confused for a moment, but soon her cock rises back up into her view, and looking between that and Flahne’s dripping wet pussy you’re putting on display in front of her is enough to kick her mind into gear. <i>“Oh!”</i> she answers with a happy giggle, then reaches forwards and takes Flahne from your arms, guiding her down lovingly onto her cock.");
	output("\n\nShe takes the entire length with little more than a blissful shudder, the smile wide on her face as Penny fills her utterly. Penny also seems to be enjoying herself, her giggle dying off into a low growl as she starts rocking her hips powerfully back forth, making Flahne gasp at the intense pleasure. Taking that as your cue you lean in, wrapping Flahne up in another passionate kiss even as Penny pistons into her from below.");
	output("\n\nYou can feel Penny’s movements through Flahne’s body, and pretty soon you can even feel the growing, urgent pulse as Penny once again starts to fill her goopy body up with cum. You hold Flahne tight, riding with her over every bump and thrust of the climax she’s surfing, but all the while savoring the sweet but salty taste clinging to every drop of her body. And then, suddenly, there’s some tipping point, Flahne’s whole body tenses up, and then there’s just - release.");
	output("\n\nYou don’t know if it’s because Flahne’s saliva has been so soaked with cum, or even if somehow her body is fluid enough to allow Penny to simply shoot her load straight up through her if she’s already so full, but whatever the reason you suddenly find your own mouth flooding with thick, creamy cum. Flahne’s tongue is sliding thickly between your lips, almost the same texture and definitely the same taste, swiping slickly around inside you as the stream of cum pours down your throat. It tastes amazing, but more than that, it feels so wonderfully perverted; the fact that this sweet little goo girl has been fucked so hard - by the girl that <i>you</i> turned into an eager, big-cocked bimbo - that now it’s like she’s almost made of cum, and absolutely loving every second of it. You made Penny the perfect cumslut, and then you made her so potent that she converted someone else into a dripping monument to sex without even realizing it. And now, as the three of you hold each other tight, you’re all able to let go and enjoy what that truly means, Penny’s over-productive balls pumping an endless stream of cum straight into Flahne’s eager pussy, while in turn a flood of her freshly-sweetened cum floods into your mouth.");
	output("\n\nIt’s you that breaks contact first. Penny and Flahne both seem completely willing to keep going, but before long your pesky need to breathe forces you to pull away. Flahne still seems lost in bliss as you part, thick strands of cum still connecting the two of you until you stand back up fully, but Penny has by now recovered herself enough that she’s watching your contented expression with a happy grin of her own - even though she’s still fucking Flahne steadily all the while.");
	output("\n\n<i>“Wow [pc.name],”</i> she says eventually, <i>“you have like, the </i>best<i> ideas.”</i>");
	output("\n\nYou smile in response as you stand back up and put yourself back together, leaving Flahne to sink slowly back down beneath the table as Penny settles back down to her earlier position.");
	output("\n\nWinking as you turn and leave, you say simply, <i>“Have fun!”</i>");

	processTime(25);
	penny.orgasm();
	pc.loadInMouth(penny);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
