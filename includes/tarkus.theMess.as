public function messBonusFunction():Boolean
{
	if(flags["HAS_ORDERED_FOOD_AT_THE_MESS"] == undefined) addButton(0,"Order Food",orderFoodFromTheMess,undefined,"Order Food","Order some food from this \"fine\" establishment.");
	else addDisabledButton(0,"Order Food","Order Food","No way are you doing that again. The service is terrible and the food looks even worse.");
	//Also adds a button to slot 1 if tarkus 'sploded
	auroroMessInRoomText();
	
	return false;
}
public function barBonusFunction():Boolean
{
	//Bartender (Time 0-4)
	if(timesDelilahSexed() < 5) output("\n\nYou see a svelte, dusky-skinned girl moving behind the bar, dressed in a tight cocktail dress that nicely hugs her rounded ass, showing it off behind the see-through bar. More than one randy customer reaches over to smack that ass as she works, nearly making her spill every other drink she tries to pour!");
	//5th+ Time
	else output("\n\nThe dusky-skinned, trappy bartender is currently bent over her bar, servicing a client front and back as she mixes a few brightly-colored drinks for the customers. A little bowl has been set up next to her reading, \"Tap that ass for tips!\" It's practically overflowing with credit chits and a few stray strands of cum. Looks like she's finally accepted her place!");
	if(flags["MET_DEL"] == undefined) addButton(0,"Bartender",approachDCLTrap,undefined,"Bartender","Approach the bartender for a drink or something.");
	else addButton(0,"Del",approachDCLTrap,undefined,"Del","Approach Del the bartender for a drink or some other service.");
	addButton(1,"Watch TV",stephIrsonEpisodeTwo,undefined,"Watch TV","Watch the television. It looks like an episode of Steph Irson: Galactic Hunter is on.");
	return false;
}
//Order Food
//{One-time option}
public function orderFoodFromTheMess():void
{
	clearOutput();
	author("Savin");
	output("You snag one of the waitresses and ask for a menu. She nods and scurries off toward the front, vanishing into the crowd of bodies flooding through the place. You plop down at one of the benches to await your menu, and are quickly surrounded by raskvel, also waiting on their orders. They crowd around you, seemingly heedless of your personal space, noses and hands poking all over your alien form for what must be half an hour before your waitress returns with a glass of water and a menu. She scoots off before you can ask for a proper drink or an appetizer.");
	output("\n\nFor fuck's sake. You spend a few minutes looking through the menu, find the closest thing to terran food you can see, and grab a different waiter walking by to place your order when it's clear the first isn't coming back today. He nods, scribbling it down before bolting off to another table, utterly ignoring the clamoring family of raskvel around you.");
	output("\n\nNow surrounded by perturbed raskvel and with an empty glass of water, you slump down in your seat for... an hour? Two? You lose track. How the hell is someone supposed to get fed around here!? By the time the third hour rolls around, you decide to say, <i>\"fuck it\"</i> and leave. You say goodbye to the raskvel family sitting around (or in their son's case, on) you and depart. Just as you're reaching the door, you turn back to see the first waitress coming by your former table with a basket of what looks like very stale bread.");
	output("\n\nTalk about kitchen nightmares. Maybe you'll have better luck in the bar...");
	processTime(211);
	flags["HAS_ORDERED_FOOD_AT_THE_MESS"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Bartender; First Time]
public function approachDCLTrap():void
{
	clearOutput();
	author("Savin");
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH");
	if(flags["MET_DEL"] == undefined)
	{
		flags["MET_DEL"] = 1;
		userInterface.showBust("BETH","DELILAH");
		userInterface.showName("BETH AND\nDELILAH");
		output("You approach the slender bartender and ask what's on tap.");
		output("\n\n<i>\"Quivering Quasars for 10 credits, Sex on a Meteor for 20. Of course, we've got good ol' beer and liquor, too,\"</i> she says matter-of-factly. Just as she's reaching for a glass for you, though, a tall, buxom woman steps out from the kitchen behind the bar, dressed in nothing but a pair of pasties barely doing anything to cover her large, pink areola, and a tight thong that leaves nothing to the imagination.");
		output("\n\n<i>\"Did you forget to mention today's special?\"</i> the nearly-nude woman asks sternly, looking down on the comparatively tiny bartender. Tsking her tongue, the woman turns to you and says, <i>\"I apologize for my slave. I am Bethany. Bethany Carver. This is my establishment, and soon to be brothel. One of many in my possession. The little one here seems to have forgotten her place, hasn't she?\"</i>");
		output("\n\n<i>\"Y-yes, mistress. I'm sorry, I just...\"</i>");
		output("\n\n<i>\"No excuses, girl. Tell " + pc.mfn("him","her","them") + " the special of the day.\"</i>");
		output("\n\nBiting her lip, the girl looks up at you nervously before saying. <i>\"T-that would be me. I'm free. I-if you want, that is. You could always just have a drink!\"</i> she adds hopefully.");
		output("\n\nThe mistress tsks her tongue. <i>\"Take what you want from the slave, Captain. If you require anything with more... substance... you are welcome to speak to me.\"</i> With that, she gives the bartender a harsh look before vanishing back through the door.");
		output("\n\nBlushing hard, the bartender adds, <i>\"The name's Del, by the way. Delilah now, I guess...\"</i>");
		clearMenu();
		addButton(0,"Free?",approachDCLBooty,undefined,"Free?","Ask Del a little bit more about this.");
		addButton(2,"Get Drink",getADrinkFromDCLsButt,undefined,"Get Drink","Ask about purchasing a drink.");
		addButton(14,"Leave",mainGameMenu);
		return;
	}
	//[Bartender; not had sex]
	else if(timesDelilahSexed() < 1)
	{
		output("<i>\"Oh, hi,\"</i> the effeminate bartender, Del, says by way of greeting as you approach the bar.");
		output("\n\n<i>\"Here for a drink?\"</i> she asks, and after a moment, nervously adds, <i>\"Or did you want the, uh... special?\"</i>");
		//[{PC has dick:}Sex] [{PC has a cun:} Face Sit] [Drink] [Leave]
		clearMenu();
		addButton(0,"Freebies?",approachDCLBooty,undefined,"Free?","Ask Del a little bit more about the situation.");
		addButton(2,"Get Drink",getADrinkFromDCLsButt,undefined,"Get Drink","Ask about purchasing a drink.");
		addButton(14,"Leave",mainGameMenu);
		return;
	}
	//[Bartender; has had sex]
	else
	{
		output("<i>\"Oh, it's... um, hi,\"</i> the bartender \"girl\" says shyly as you approach, knees knocking together nervously as you near her supple body once again.");
		output("\n\n<i>\"You're not... going to make me fuck you again, are you?\"</i> she says, ");
		//If <5 times:
		if(timesDelilahSexed() < 5) output("though you think there's a little more to than tone that dread. She practically sounds like she wants it!");
		else output("biting her lower lip cutely as she all but wiggles her hips for you, her tone nothing but hopeful. You ought to get paid for breaking this slut in so well!");
		//[{PC has dick:}Sex] [{PC has a cun:} Face Sit] [Drink] [Leave]
	}
	processTime(1);
	clearMenu();
	if(pc.hasCock() && pc.lust() >= 33) addButton(0,"Buttsex",buttStretchDelsAnus,undefined,"Buttsex","Take the \"free\" trapslut out for a spin.");
	else addDisabledButton(0,"Buttsex","Buttsex","You need to be sufficiently turned on and have a dick to take this trap for a spin.");
	if(pc.hasVagina() && pc.lust() >= 33) addButton(1,"Face Sit",sitOnDelilahsFace,undefined,"Face Sit","Sit on the trapslut's face and make her go to work pleasing you.");
	else addDisabledButton(1,"Face Sit","Face Sit","Sitting on Del's face requires you have a vagina and be suitably lusty.");
	addButton(2,"Get Drink",getADrinkFromDCLsButt,undefined,"Get Drink","Ask about purchasing a drink.");

	//Slut Training
	//Requirement: PC is a trap or shemale with a non-virgin asshole. Access via normal sex menu
	if(pc.mf("him","her") == "her" && !pc.analVirgin && pc.hasCock()) addButton(3,"SlutTraining",delilahSlutTraining,undefined,"SlutTraining"," Delilah needs to learn how to properly service her clients with that tight little ass of hers. You're the perfect person to show her how it's done...");
	else addDisabledButton(3,"SlutTraining","SlutTraining","SlutTraining requires you to be a trappy, non anal virgin so that you can show Delilah how it's done.");
	addButton(14,"Leave",mainGameMenu);
}

//[Free Booty?]
public function approachDCLBooty():void
{
	clearOutput();
	author("Savin");
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH");
	output("<i>\"You're free?\"</i> Not much of a brothel if the mistress is giving it away for nothing!");
	output("\n\nShe hesitates, then seems to take a mental second wind, stomping her foot down. <i>\"I'm not a girly girl! I'm a man, damn it! I didn't sign up for this!\"</i>");
	output("\n\n<i>\"A... man?\"</i> She looks about as far from it as you can get.");
	output("\n\nShe (he?) scowls at you, arms crossing under her barely-noticeable bust. <i>\"I am! Really! But Beth makes me wear this until I'm \"broken in\" for her! I didn't... I thought I was just going to be a bartender!\"</i>");
	output("\n\nWell, it seems there's a tight little boy-pussy for the taking here. And she can't say no. Then again, that'd be taking advantage, wouldn't it?");
	processTime(1);
	clearMenu();
	if(pc.hasCock() && pc.lust() >= 33) addButton(0,"Buttsex",buttStretchDelsAnus,undefined,"Buttsex","Take the \"free\" trapslut out for a spin.");
	else addDisabledButton(0,"Buttsex","Buttsex","You need to be sufficiently turned on and have a dick to take this trap for a spin.");
	if(pc.hasVagina() && pc.lust() >= 33) addButton(1,"Face Sit",sitOnDelilahsFace,undefined,"Face Sit","Sit on the trapslut's face and make her go to work pleasing you.");
	else addDisabledButton(1,"Face Sit","Face Sit","Sitting on Del's face requires you have a vagina and be suitably lusty.");
	addButton(2,"Get Drink",getADrinkFromDCLsButt,undefined,"Get Drink","Ask about purchasing a drink.");
	//Slut Training
	//Requirement: PC is a trap or shemale with a non-virgin asshole. Access via normal sex menu
	if(pc.mf("him","her") == "her" && !pc.analVirgin && pc.hasCock()) addButton(3,"SlutTraining",delilahSlutTraining,undefined,"SlutTraining"," Delilah needs to learn how to properly service her clients with that tight little ass of hers. You're the perfect person to show her how it's done...");
	else addDisabledButton(3,"SlutTraining","SlutTraining","SlutTraining requires you to be a trappy, non anal virgin so that you can show Delilah how it's done.");
	addButton(14,"Leave",mainGameMenu);
}

//[Drink]
public function getADrinkFromDCLsButt():void {
	clearOutput();
	author("Savin");
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH");
	processTime(1);
	output("<i>\"Oh, thank God,\"</i> the bartender says, her relief palpable. <i>\"So, what can I get you?\"</i>\n\n<b><u>Menu:</u></b>\nBeer - 1 cred.\nQuivering Quasar - 10 creds.\nSex on a Meteor - 20 creds.");
	clearMenu();
	//1
	if(pc.credits >= 1) addButton(0,"Beer",haveABeer,undefined,"Beer","The cheap beer at this place has only the barest taste of alcohol in it and won't even get you drunk.");
	else addDisabledButton(0,"Beer","Beer","You can't afford a beer. Maybe you should get a job, you bum.");
	//10
	if(pc.credits >= 10) addButton(1,"Q.Quasar",quiveringQuasar,undefined,"Quivering Quasar","A drink purported to make you quite strong, but it can have negative effects on your vision.");
	else addDisabledButton(0,"Q.Quasar","Quivering Quasar","You can't afford the ten credits for this.");
	//20
	if(pc.credits >= 20) addButton(2,"S.Meteor",sexOnAMeteor,undefined,"Sex On A Meteor","This drink is supposed to make you more alluring but more easily lured....");
	else addDisabledButton(2,"S.Meteor","Sex On A Meteor","You can't afford the twenty credits for a Sex on a Meteor.");
	addButton(14,"Back",approachDCLTrap);
}

//Quivering Quasar
public function quiveringQuasar():void
{
	//{Temporarily Increases Physique value, small random chance to blind yourself on any given turn}
	clearOutput();
	processTime(3);
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH");
	author("Savin");
	output("<i>\"Let's try one of those Quasars.\"</i>");
	output("\n\n<i>\"Careful, it kicks like a mule,\"</i> the bartender warns you as she mixes you a brightly-colored, almost glowing, drink which bubbles in its glass as she slides it on over. You pick the glass up, and recoil a bit at the ozone smell emanating off of it; giggling, the bartender adds, <i>\"It's electrifying, huh?\"</i>");
	output("\n\nUh-huh. Well, bottoms up. You knock back your Quasar, shivering as it rushes down your throat, leaving your hair standing on end. You suddenly feel <i>strong</i>, like you could take on a pack of cyborg grizzly bears head-on!");
	pc.credits -= 10;
	if(pc.hasStatusEffect("Quivering Quasar")) {
		if(pc.statusEffectv2("Quivering Quasar") < 10) {
			pc.addStatusValue("Quivering Quasar",2,5);
			pc.physiqueMod+=5;
			pc.lust(5);
		}
		else output("\n\nYou're about as drunk on Quivering Quasar as you're going to get.");
	}
	else {
		pc.createStatusEffect("Quivering Quasar",0,5,0,0,false,"Icon_DizzyDrunk","This top-shelf alcohol makes you feel stronger - so much so that your maximum physique is temporarily increased.",false,180);
		pc.physiqueMod+=5;
		pc.lust(5);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sex on a Meteor
public function sexOnAMeteor():void
{
	clearOutput();
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH");
	processTime(3);
	author("Savin");
	//{Raise lust, temp. +Libido, -Lust Resistance, +Tease Damage}
	output("<i>\"Sex on a Meteor?\"</i> you ask, cocking an eyebrow at the name.");
	output("\n\n<i>\"Owner's choice,\"</i> the bartender chuckles, <i>\"It'll make you all but irresistible... even to yourself!\"</i>");
	output("\n\nShe quickly pours what looks like a heady mixture of drinks, which end up in a bright pink concoction topped with a slice of orange and a curly straw. She slides it over to you, saying, <i>\"Enjoy! Everyone else will, too!\"</i>");
	output("\n\nAlrighty then. You grab your sexy, girly drink and start draining it. You barely realize how... how horny you're getting until you've drained the last drop, only to find a burning fire spreading through your loins.");
	output("\n\nYou could really go for a dick to suck.");
	output("\n\nWait, what!?");

	pc.credits -= 20;
	if(pc.hasStatusEffect("Sex On a Meteor")) {
		if(pc.getStatusMinutes("Sex On a Meteor") < 700) {
			pc.addStatusMinutes("Sex On a Meteor",60);
		}
		else output("\n\nYou're not going to get  as you're going to get.");
	}
	else {
		pc.createStatusEffect("Sex On a Meteor",0,5,0,0,false,"LustUp","This top-shelf alcohol makes you almost irresistible, but easily aroused as well.",false,180);
	}
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Beer (like, 1 cred)
public function haveABeer():void
{
	clearOutput();
	processTime(5);
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH");
	pc.credits--;
	author("Savin");
	output("<i>\"Just a beer,\"</i> you say. She nods, and produces a cold one from under the counter, popping the cap for you before serving it. You spend a few minutes chatting with her, ");
	//if 5+ times sex'd:
	if(timesDelilahSexed() >= 5) output("trying to ignore the fact that she's quickly called on to \"service\" a pair of raskvel guys mid-conversation, "); 
	output("before standing to go.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sex; PC must have a dick]
public function buttStretchDelsAnus():void
{
	clearOutput();
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH_NUDE");
	var x:int = pc.cockThatFits(chars["DELILAH"].analCapacity());
	if (x < 0) x = pc.smallestCockIndex();
	author("Savin");
	output("<i>\"I think I'll take your mistress up on that offer,\"</i> you say, grinning lustfully at the pretty girly-boy body on display for you.");
	output("\n\nDeliliah ");
	//if 1st-4th time:
	if(timesDelilahSexed() < 5) output("blushes hard, dread mixing with arousal at the blatant demand for a fuck");
	else output("blushes, practically jumping into your arms for another taste of your bitch-breaking cock");
	output(". She obediently slips out from behind the bar, getting more than a few cat-calls from her customers as she makes ready for her upcoming ordeal, cheeks flush bright red as she slips her hands up under her skirt... and slips her panties right down. Tossing the pink silk aside, she chews her lips, awaiting your command and trying not to give away the fact that her little knee-skirt is tenting something awful.");
	output("\n\nYou crook a finger toward the floor. ");
	//if 1-4: 
	if(timesDelilahSexed() < 5) 
	{
		output("She hesitates but, trembling, she falls to her knees before your groin, awaiting the ");
		if(pc.isCrotchGarbed()) output("reveal ");
		else output("onslaught ");
		output("of your manhood");
	}
	else output("She obediently drops to her knees, one hand slipping back to spread her cheeks wide, already oh so eager for a taste of your cock back there as she opens wide, ready to receive your package");
	output(". You step forward, tossing your [pc.gear] onto the bar and grabbing your [pc.cock " + x + "]. A few fast strokes have you at the ready, the turgid shaft of your prick looming over the trappy whore's face, your crown practically pushing against her lips. She only manages to hold herself back for a few seconds before her tongue stretches out, caressing the crown of your cock. ");
	if(timesDelilahSexed() < 5) output("<i>\"Ugh... you... you really want me to... to...\"</i> she sputters indignantly, trying to hide the little tentpole between her slender legs.");
	else output("<i>\"I love the taste of your cock...\"</i> she purrs, nuzzling the shaft of your [pc.cock " + x + "] affectionately as her tongue lavishes it with affection. <i>\"The first... and the best...\"</i> she adds happily, planting a kiss on the tip.");
	output(" You shudder as the sensation of her tongue on your most sensitive flesh snakes through your body, and you're forced to grip the bar to support yourself, [pc.legOrLegs] shaky under the startlingly skilled ministrations of the trappy slut.");
	output("\n\n<i>\"Juuust like that,\"</i> you moan through clenched teeth, trying to control yourself. Your fingers snake through Deliliah's blonde-dyed hair, coaxing her on as she slicks and kisses at the underside of your member, slowly but surely working herself up to taking it wholesale.");
	if(pc.balls > 0 && timesDelilahSexed() >= 5) 
	{
		output(" But first, she lets a hand wander free up");
		if(pc.legCount > 1) output(" one of");
		output(" your [pc.legOrLegs], caressing the tender flesh slowly as she works up to your base, hands cupping your swinging sack, rolling your [pc.balls] between her dainty little fingers. The slutty, dusky whore grins up at you, her mouth trailing kisses down your girthy length until she can lap at your [pc.balls], lavishing your hefty nut");
		if(pc.balls > 1) output("s");
		output(" with the tip of her eager tongue before opening wide and swallowing them up, suckling on your gonad");
		if(pc.balls > 1) output("s like a pair of teats");
		else output(" like a teat");
		output(". You groan and shudder, trying not to cum as your well-trained trap sucks on your sack like the pro she's turned out to be.");
	}
	output("\n\nFinally, the slutty trap makes her way back up to the crown of your cock, slowly opening her lips to welcome in your manhood, ");
	if(timesDelilahSexed() < 5) output("desperately pressing her legs together to hide her tiny, trappy shame tenting under her skirt");
	else output("blatantly spreading her legs, one hand fully disappearing under her skirt and up her wanton hole in preparation, teasing her tiny masculinity from behind, making it jump in responses, wholly throwing back the hem of her skirt and leaving her cock for all to see");
	output(". You guide her forward, easing her lips around the swell of your schlong, shuddering as you feel her wet, warm embrace wrapping around you, sucking and squeezing oh so wonderfully. Gods, she was born for this! You stifle a little moan as she ");
	if(pc.cocks[x].cLength() <= 12) output("takes you to the hilt, your [pc.cock " + x + "] vanishing down her throat");
	else output("sucks up every inch she can manage, choking down more than a foot of cockmeat before finally giving in, her throat utterly bulging with your massive girth stretching her pussy-like gullet wide");
	output(".");

	output("\n\n<i>\"Good little slut,\"</i> you coo, stroking her bleach-blonde hair, <i>\"You're good at this. Got yourself a talented mouth, huh?\"</i>");
	output("\n\nDeliliah murmurs a response, muffled by the thick cock in her mouth into an unintelligible babble that sends trickles of pre-slick drool down her chin. You chuckle and pat her on the head, assuring her what a good little cocksucker she is as you gently guide her back from your prick until just the crown is spearing her lips. You give her a little push, pressing her back against the hard front of the bar as you shift forward, getting ready to get a right proper cock-shining. With her head against the glass, there's nowhere for her to recoil as you slam your hips forward, thrusting your prick into her mouth ");
	if(pc.cocks[x].cLength() <= 12 && pc.balls > 0) output("until your [pc.balls] slap her chin");
	else if(pc.cocks[x].cLength() <= 12) output("until her nose presses against your [pc.sheath " + x + "]");
	else output("until her throat is bulging with your massive meat, so much crammed down her that she looks ready to burst");
	output(". The trap-slut gags and cries out as she's suddenly and violently face-fucked, but the growing crowd around the two of you cheers as you fill her mouth with cock.");
	output("\n\nThe trappy bartender's got little to do but sit and take it, slumping against the bar as you hold her head steady, using and abusing her mouth as your own personal warm, wet cocksleeve. Your thrusts soon have the poor lady-boy drooling freely, spittle rolling down her chin and onto the tiny tent of her cock, which she's now feverishly working, abandoning any masquerade of restraint under the punishing beat of your oral assault. You grin down at the trappy whore as she jacks off, too horny to stop herself, throwing up her skirt around her waist to get at the shaft of her prick sticking shamefully out.");
	output("\n\nWith your cock sufficiently slathered with her spit, and the trap herself all nice and hard and ready to fuck, you steadily slow your pelvic thrusting, finally stopping with the head of your cock on her lips.");
	output("\n\n<i>\"Kiss it,\"</i> you command, holding the trappy slut's gaze as your cock sits of the swell of her lower lip expectantly.\n\n");
	//if first time:
	if(timesDelilahSexed() < 1) output("<i>\"Y-you're just doing this to humiliate me, you " + pc.mf("bastard","bitch") + "!\"</i> she growls, but knows her place well enough not to refuse you. Instead, she glowers up at you as she places a perfunctory peck on the crown of your cock, rewarded with a tiny coating of pre-spunk on her rosy lips for her troubles!");
	//If 2-4th time:
	else if(timesDelilahSexed() < 5) output("<i>\"Fiiiine,\"</i> she groans, wrapping her hands around your shaft a little too eagerly to back up her disdainful tone. Locking eyes with you, she kisses your cock, all but Frenching it as her lips suckle on your tip, tongue swirling around your cum-slit until you can't help but drool a nice, fat glob of pre right into her waiting mouth.");
	//if 5th time+:
	else output("The trappy whore eagerly plants a tongue-filled parting kiss on the crown of your cock, wrapping her lips around the head one last time and making sure to slather it with her tongue. By the time she's through, a thick sheen of spit's glazed across your tender flesh, bridges of it still connecting you to the dusky whore.");
	output("\n\nWith your cock nice and lubed up thanks to the trap-whore's succulent little mouth, you grab the slender girly-boy by the shoulder and heft her up onto the bar, letting her ample ass press hotly onto the glass. She gives you a questioning look... until your hands slip up her slender legs, hooking through the hem of her skirt and gently pulling it off, leaving her bare to the world. Or at least, the growing circle of interested spectators, many of whom are pitching tents by the time the bartender's tiny little cock pops free, left to hang flag-pole like as you push her down and spread her legs to give yourself a clear shot to the real prize on offer. You hoist her legs over your shoulders and step up to the plate, your [pc.cock " + x + "] dropping into the crevasse between her thigh and groin before dragging down to the gently-parted crack of her tight little ass.");
	//If 1-4th time:
	if(flags["TOOK_DELILAHS_BUTTGINITY"] == undefined || timesDelilahSexed() < 5) output("\n\n<i>\"P-please...\"</i> the trap-slut whines as your crown presses into her dark star, biting her lip and wriggling back in your firm grasp. <i>\"Be... be gentle...\"</i>");
	//5th+:
	else output("\n\n<i>\"Go on,\"</i> she coos, wiggling her hips enticingly as your crown presses into her dark star, practically being drawn in by her well-used hole, <i>\"ram it on in!\"</i>");

	output("\n\nYou figure the little whore can have it her way this once. You wrap your hands around her quaking hips and push in, one slow, long stroke that tears a shriek of ");
	//1st time: 
	if(flags["TOOK_DELILAHS_BUTTGINITY"] == undefined) output("pain");
	else if(timesDelilahSexed() < 5) output("pleasure and pain");
	else output("wild pleasure");
	output(" from her as you spear her on your [pc.cock " + x + "], thrusting deep into her writhing ass. Her back arches, voice breaking as you fuck yourself deep into her little asshole, until ");
	if(pc.cocks[x].cLength() <= 12 && pc.balls == 1) output("your [pc.balls] slaps against her cheeks, your shaft fully buried");
	else if(pc.cocks[x].cLength() <= 12 && pc.balls > 1) output("your [pc.balls] slap against her cheeks, your shaft fully buried");
	else if(pc.cocks[x].cLength() <= 12) output("your hips press into hers, your shaft fully buried");
	else output("her stomach is bulging from the massive, throbbing prick buried in her, stretching her asshole until she's apt to break in half");
	output(". She cries out, fingers digging into the edge of the bar as you settle inside her, giving her a few seconds to adjust to your girth before you start to move.");
	pc.cockChange(true,false);

	output("\n\nBut that's the last kindness you're going to show this wanton whore's little pucker. You draw yourself only half-way out before slamming back home, thrusting back with all the force your [pc.hips] can muster, sending shockwaves through the flesh of the trap-slut's bubble butt. Her prick jumps in response to your next thrust, hopping straight up and twitching visibly as a bead of creamy white wells up at its tip. You consider giving her a little tug to help her along, but then... that'd defeat the purpose! This slut's supposed to be a little anal whore, so by God that's what she'll be. You reaffirm your grab on her girly hips and start pounding with a vengeance, faster and harder until the little slut's whining and moaning with every push, crying her pleasure aloud with utter abandon, any trace of her once-bashful reserve melting away as you pound her ass.");
	output("\n\nBetween the sloppy blowjob she gave you and now the tight, wringing grip of the trap's ");
	if(flags["TOOK_DELILAHS_BUTTGINITY"] == undefined) output("virgin");
	else output("skilled");
	output(" boypussy, you don't know how long you're going to hold out. Her ass feels like a vice, so tight around your [pc.cock " + x + "] its nearly painful, yet with every thrust you can feel the twitch and spasm of her muscles as her little sphincter tries to push you out or draw you in, you're never sure. Either way, it's making a tight, wet, squirming hole for you to fuck, ushering you inexorably towards your now-inevitable orgasm.");
	output("\n\nYou feel your cock swelling inside her, cum rushing through your [pc.cock " + x + "] towards the waiting receptacle of the trap-whore's wanton hole. She seems to sense the oncoming climax, and responds with a shrill yelp of pleasure, her own cock twitching madly, so close yet so far from orgasm. She reaches up and grabs your shoulders, clutching tightly at you as you flood her bowels with cum. Shockwaves of pleasure tear through your body as [pc.cumColor] ropes let loose from your [pc.cock " + x + "], smearing the trap's rectal walls with your sticky seed. Your [pc.hips] piston away, thrusting you as deep into her ass as you can go before you've finished, making sure to bust your nut straight into her spasming colon, giving it a taste of cum before you're finally finished.");
	output("\n\nYou shudder with an absolute contentment, panting heavily as your cock starts to deflate in the trap's well-fucked ass. Slowly, you withdraw yourself from her hole, giving the act of her use a note of finality as you wipe your prick off on her thigh, smearing it with the last trickles of your seed. For her part, the trap-slut's all but insensate, leaning back on the bar with her cock rock-hard and swaying, begging for relief you're not going to give her. Instead, you collect your gear and step back, leaving the little whore's legs spread and ass agape as the crowd that'd collected around you during your lewd, public act gets ready to get intimate with the whore. Looks like she'll be busy for a good long while!");
	if(chars["DELILAH"].analCapacity() < 1000) chars["DELILAH"].ass.bonusCapacity += 10;
	if(chars["DELILAH"].ass.loosenessRaw < 4) chars["DELILAH"].ass.loosenessRaw++;
	flags["TOOK_DELILAHS_BUTTGINITY"] = 1;
	pc.orgasm();
	timesDelilahSexed(1);
	processTime(30+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Face Sitting]
public function sitOnDelilahsFace():void
{
	clearOutput();
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH_NUDE");
	var x:int = rand(pc.totalVaginas());
	author("Savin");
	output("<i>\"I think I'll take your mistress up on that offer,\"</i> you say, grinning lustfully at the pretty girly-boy body on display for you. <i>\"Why don't you get up on the bar for me, cutey?\"</i>");
	output("\n\nThe bartender babe ");
	if(timesDelilahSexed() < 5) output("blushes hard, dread mixing with arousal at the blatant demand for a fuck");
	else output("blushes, practically melting into your arms, all but begging to be dominated");
	output(". She obediently clambers up onto the bar, getting more than a few cat-calls from her customers as she makes ready for her upcoming ordeal, cheeks flush bright red as she slips her hands up under her skirt... and slips her panties right down. Tossing the pink silk aside, she chews her lips, awaiting your command and trying not to give away the fact that her little knee-skirt is tenting something awful.");
	output("\n\nYou crook a finger toward the floor. ");
	if(timesDelilahSexed() < 5) 
	{
		output("She hesitates but, trembling, she falls to her knees before your groin, awaiting ");
		if(pc.hasCock())
		{
			output("the ");
			if(pc.isCrotchGarbed()) output("reveal");
			else output("onslaught");
			output(" of your manhood");
		} 
		else output("a pussy to lick");
	}
	else output("She obediently drops to her knees, one hand slipping back to spread her cheeks wide, already oh so eager for any touch back there as she opens wide, ready to receive whatever you deign to shove back there this time");
	output(". You step forward, hopping up behind the effeminate bartender, giving her a little push onto her back. She gives a little gasp as she flops down, legs spreading reflexively, giving you easy access to the tight, dark hole between them. But that's just an added bonus to you.");
	output("\n\nYou crawl up her svelte little body, slowly pulling up her skirt to leave her groin and hips bare. The tiny little cock she's packing ends up pointing skyward like a flagpole, and its owner squirms and blushes as you leave her prick exposed to the bar crowd, now slowly gathering around you. Looks like you've got an audience! Hot. You plant your [pc.knees] on the trap's shoulders, pinning her down to the bar for a moment as you slowly slip out of your [pc.gear], making a bit of a show if it for your new fans - especially as you get down towards you groin. You can already feel the heat welling up inside you, eagerly awaiting a taste of the submissive little slut's tongue, and as the last bits of your equipment fall aside, it's a sweet relief to let it kiss the cool air.");
	output("\n\nThat's not the only thing that's going to be kissing it, either. You let a pair of fingers slink down to your [pc.vagina " + x + "], spreading the lips of your labia wide just shy of the trap's chin, almost close enough to let your excitement drool down into her lips.");
	if(timesDelilahSexed() < 5) output(" <i>\"Wait... you... you really want me to... to...\"</i> she sputters indignantly, trying to hide the little tentpole between her slender legs");
	else output(" She blushes, licking her lips. <i>\"I love the taste of your pussy juices, mistress,\"</i> she coos, eyes transfixed by your slit");
	output(". Slowly, her tongue slips out from her dark lips, one long slurp across your [pc.vagina " + x + "]. You shudder as the sensation of her tongue on your most sensitive flesh snakes through your body, and you're forced to grip the bar to support yourself, [pc.legOrLegs] shaky under the startlingly skilled ministrations of the trappy slut. Maybe in her previous life, she might have been pretty popular with the ladies....");
	output("\n\nYou let yourself give a little moan as the trap-slut goes down on you, tongue delving deep between your folds. <i>\"That's it, girl... Now, why don't we have you do the alphabet?\"</i>");
	//if 1st time:
	if(timesDelilahAteOut() < 1) output("\n\n<i>\"Hrm?\"</i> the bartender murmurs, voice muffled in your muff.\n\n<i>\"The alphabet, dumb slut! Use your tongue to make the letters. Of every alphabet you know.\"</i>");
	//2-4th time:
	else if(timesDelilahAteOut() < 5) 
	{
		output("\n\n<i>\"Again?\"</i> Deliliah groans, coming up for air, <i>\"I think I got the idea.\"</i>");
		output("\n\nYou tsk your tongue. <i>\"Fine, then maybe you'd rather I bend you over this bar and see if that duster will fit up your pussy, huh?\"</i>");
		output("\n\n<i>\"Alright, alright,\"</i> she cries, getting to work.");
	}
	//5th+ time:
	else
	{
		output("\n\n<i>\"Mmhm!\"</i> Del grins, going to work immediately, putting her hard-earned skills to use without much more prompting than that.");
	}
	output("\n\nNice and slow, your subby slut starts to do as you commanded, tongue working out a great big \"A\" in the lips of your [pc.vagina " + x + "]. You glance over your shoulder, to the rigid stiffy poking out from beneath the hem of Deliliah's skirt. Something in your memory jogs a thought about positive reinforcement, and you reach under the bar to pick up the feather duster hanging on a nail. Nice. You reach behind your [pc.hips], teasing along her flat stomach until you feel the soft feathers brushing the silky skirt... and then something nice and hard.");
	output("\n\nDelilah reacts instantly, legs twitching and tongue freezing as you brush her little cock. <i>\"Who told you to stop?\"</i>");
	output("\n\nIn return, you stop your brush mid-stroke, the head of her cock entombed in a bed of feathers. With a soft groan, the trappy bartender starts to move her tongue again, forming \"M\" and \"N\", the tops of those letters treading awful close to your [pc.clit], sending shivers up your spine. You return the favor, circling her cock with your duster, even reaching back to tease her balls and thighs when she gets to a delightfully slow \"Q\" and \"R.\"");
	//if 1st time:
	if(timesDelilahAteOut() < 1) output("\n\n<i>\"Getting the hang of this, aren't you?\"</i> you grin, taking the time to stroke the lady-boy's hair. <i>\"Keep this up, and I might just let you cum.\"</i>");
	//2+ time:
	else output("\n\n<i>\"You just keep getting better at this,\"</i> you grin, taking pride in your work on Beth's newest toy. <i>\"Now, make me cum, and I'll do the same for you.\"</i>");
	output("\n\nThat's all the encouragement she needs to lunge for \"Z,\" tongue working deeper and deeper into your [pc.vagina " + x + "], face getting more and more drenched with your excitement as her talented tongue works its wonders. You decide to give her a little reward, relaxing yourself and letting go, trying to cum by the time she hits that final letter. [pc.Hips] bucking and chest heaving with your quickening breath, you find yourself on the precipice before you know it, and just as her tongue forms the back of the \"Z,\" your [pc.vagina " + x + "] starts to contract, all but trapping her tongue between its walls as your start to climax, throwing your head back with a cry of pleasure as Delilah's face is plastered with girlcum.");
	output("\n\nBut you're not letting her off the hook this early. Shuddering, you try to recover yourself as the trap's head rests back, thinking herself done. Not quite!");
	output("\n\n<i>\"That was the English alphabet,\"</i> you grin, swinging around to a reverse-cowgirl post over her head. <i>\"Now let's see about the Ausar alphabet.\"</i>");
	output("\n\nYour thighs are nice and drenched, but it doesn't stop your oral protege from going back to work, now half-mad from lust and pleasure as you start back on her cock, one hand wrapping around her tiny little trap-sack as the other dusts off her glans, wiping away the accumulated pre-seed on its tip. The two of you soon come to something of a rhythm: for every curve of the flowing ausar script, another squeeze of the sack or a flick of the featherduster. Your pace picks up as she gets closer and closer to the edge, hips twitching up as you squeeze and massage her balls, steadily milking out what promises to be a nice, big load from the trappy whore-to-be.");
	output("\n\nWhen she cums, it's everything you were hoping it would be. With a cry and a buck of her hips, the cock in your hand erupts into a geyser of spooge, drenching the duster and your fingers in a nice, thick layer of creamy spunk. She gives a final gasp and slumps back, having finally achieve a sweet release. You swing your [pc.hips] back around, looking down on her blissed-out face, cum-dumped featherduster still in hand.");
	//If 1-4 time:
	if(timesDelilahAteOut() < 5) 
	{
		output("\n\n<i>\"Wh-what are you...\"</i> she starts to ask, but realization dawns as your cum-blasted hand looms over her mouth.");
		output("\n\n<i>\"You got me dirty,\"</i> you chide, putting a spunky fingertip to her lips, which she quickly seals. <i>\"You gotta clean up after yourself, little girl.\"</i>");
		output("\n\nShe resists, but your insistent pressure on her lips finally forces her to relent, and she's soon slurping up her own cum off your fingers, much to the delight of the crowd now gathered around you (many of whom are sporting tents of their own, clearly ready to get in on the action when you're done). You make sure your hands are spotless before swinging off the bar, hiking her legs off the edge to put her ass in the air for the next customer. She gives a sharp cry as she's quickly speared on a dick, leaving you to get your gear and catch your breath.");
	}
	//if 5th plus time:
	else
	{
		output("\n\n<i>\"You got me dirty,\"</i> you chide, putting a spunky fingertip to her lips. She opens wide for you. <i>\"You gotta clean up after yourself, little girl.\"</i>");
		output("\n\n<i>\"Delicious,\"</i> she grins, tongue lapping up her salty seed like a good little whore. You make sure your hands are spotless before swinging off the bar, hiking her legs off the edge to put her ass in the air for the next customer. She gives a sharp cry of pleasure as she's quickly speared on a dick, leaving you to get your gear and catch your breath.");
	}
	processTime(30+rand(5));
	pc.orgasm();
	timesDelilahAteOut(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function timesDelilahAteOut(arg:int = 0):int
{
	if(flags["TIMES_ATE_DELILAH_OUT"] == undefined) flags["TIMES_ATE_DELILAH_OUT"] = 0;
	flags["TIMES_ATE_DELILAH_OUT"] += arg;
	timesDelilahSexed(arg);
	return flags["TIMES_ATE_DELILAH_OUT"];
}
public function timesDelilahSexed(arg:int = 0):int
{
	if(flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"] == undefined) flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"] = 0;
	flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"] += arg;
	return flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"];
}

//Steph Irson, Galactic Huntress
public function stephIrsonEpisodeTwo():void
{
	var x:int = 0;
	if(pc.hasCock()) x = pc.smallestCockIndex();
	else if(pc.hasVagina()) x = rand(pc.totalVaginas());
	//[Watch Screen]
	clearOutput();
	author("Savin");
	showName("STEPH\nIRSON");
	showBust("STEPH_2");
	output("You flop down in a quiet booth in the corner of the bar, looking up at a sizable Super-HD Viewscreen mounted above the bar. As you sit down, the last commercial break is just coming to an end, telling you to buy JoyCo brand healing services before the screen fades to a superimposed logo of <b>Steph Irson: Galactic Huntress</b>, a popular nature show. The camera pans down from a bright sunrise to an athletic young woman in an almost comically skimpy ranger outfit, with khaki hotpants and low-cut shirt rolled up to expose her midriff and ample cleavage both. Her blonde ponytail bounces excitedly as she jogs along through a jungle underbrush, the camera-drone struggling to keep pace with her. Despite her obvious humanity, the hostess is sporting a pair of perky kitty-ears atop her sandy hair, which twitch cutely as the camera focuses in on them.");
	output("\n\nA U.G.C. mandated warning appears on the screen in tiny letters:");
	output("\n\n<b>\"The U.G.C. Scout Authority apologizes for content in previous episodes of <i>Steph Irson: Galactic Huntress</i>, and warns that interacting with unidentified xeno-biotics can result in erratic and unexpected mutations or grievous injury. Do not attempt anything seen in this series at home, or without professional guidance.\"</b>");
	output("\n\nMeanwhile, on screen, the now cat-eared Steph grabs the camera, showing off the rusty wastelands behind her as she narrates: ");
	output("\n\n<i>\"We're here on ancient Tarkus, a world of rough and tumble inhabitants dealing with wild and untamed life and technology,\"</i> the host begins in a thick New Brisbane accent, <i>\"and we're on the hunt for the Grey Goo. Now I know I usually go huntin' for my creatures alive and kickin', but these goo're something special: made up of trillions of discarded micromachines, Grey Goo have a kind of network intelligence: the more of 'em, the smarter they are. They're very aggressive, though, so I'll have to be very careful to stay out of their reach if I wanna make it out alive. One touch and I could end up enveloped in goo! Nasty!\"</i>");
	output("\n\nHaving spoken her piece, Steph takes off jogging into the mechanical dunes of the Tarkus wastes, deftly maneuvering between piles of discarded trash and ruined tech from ages past, stopping occasionally to lament about the sad state of the planet or to scratch at her twitching cat ears (once even stopping to jump at an errant laser point coming from an old mining rig). Eventually, though, with a gasp of surprise and awe, the huntress meets her prey:");
	output("\n\n<i>\"Crikey! Look at this!\"</i> Steph says, tumbling behind a steel outcropping for cover. <i>\"Come on, take a look at this: isn't she a beaut?\"</i>");
	output("\n\nThe camera hovers down behind her shoulder, focusing in as she points to a clearing ahead, in which sits what looks like a voluptuous grey woman, shining brightly in the sunlight, her proportions comically over-exaggerated - were she a <i>\"real\"</i> girl, you doubt she could stand up under the weight of those tits. Slowly, Steph creeps forward, whispering, <i>\"Oh yeah, there's one now. See how she morphs herself into a humanoid form? It's just like a bird showing its plumage to attract a mate, but this babe's got a devious twist to her: give her half a chance and she'll drain you dry! Grey Goo live off of our bodily fluids, see, and they'll do anything to get 'em. I'd better be careful not to alert her to my presence!\"</i>");
	output("\n\nSlowly, Steph creeps out of cover, hugging the ground almost like a cartoon character as she sneaks up on the Grey Goo sunbathing in the clearing. The camera putters behind her, giving an excellent view of the host's ass in her sheer short pants, ever so slightly raised in the air as she creeps toward her prey.");
	output("\n\nNearing the slumbering goo-girl, Steph holds still a hair's breadth away, camera zooming in for a close-up of the grey's cute little face as she snores quietly. <i>\"Must be in standby mode,\"</i> Steph says, relief palpable in her voice. <i>\"Look at how she mimics a human. Kinda cute, innit she?\"</i>");
	output("\n\nAs she speaks, Steph pulls on a blue rubber glove, giving it a quiet snap before reaching up to the goo. <i>\"Let me show just how gooey this creature is. She's like gelatin to the touch, see-\"</i>");
	output("\n\nAs soon as Steph prods the gey goo's tit, of course, its eyes snap open. The goo sits up, looking around in total confusion before her gaze alights on the galactic huntress, whose hand quickly retracts, owner stumbling away as the goo wakes up.");
	output("\n\n<i>\"Oh my gosh! A-are you Steph Irson!?\"</i> the goo says suddenly, surging toward Steph, stoppin just a few inches away, faces practically pressed together. <i>\"Ohmygoshohmygosh! I love your show! Are we on right now? HI MOM! I mean, I don't really have a mom, but if I did I'd totally say 'hi' to her right now!\"</i>");
	output("\n\nSteph stares at the goo-girl for a long moment. <i>\"W-what?\"</i>");
	output("\n\nThe goo circles the galactic bounty hunter, in half-disbelief. <i>\"A-and this is what you look like up up close? Oh gosh I'm so happy to meet you! A real person, a star! Eep, I'm nervous! I have all your shirts, Miss Irson, oh and I used to have a Galactic Huntress action figure but a rust monster stole it and used it like a dildo and fucked me with it! That was super fun, though. OH! W-would you sign, uh... I KNOW! Sign my tits!\"</i>");
	output("\n\nThe goo makes an exaggerated motion, as if pulling her non-existent shirt up, presenting her gigantic bosom to Steph. Finally recovering from her surprise, the huntress runs a hand through her sandy hair, pulling out a marker from her pocket.");
	output("\n\n<i>\"Sure! Anything for an adoring fan!\"</i> she beams, as if she's completely forgotten the mortal peril she's supposedly in. Steph twirls the pen and pops the cap, asking, <i>\"So, who do I sign this to, pretty lady?\"</i>");
	output("\n\n<i>\"Uh... I don't know...\"</i> the goo says apologetically, rubbing the back of her head in mock consternation, <i>\"I don't really have a name.\"</i>");
	output("\n\n<i>\"Aw, that's alright, babe. I'll call you Carrie! Like my mum!\"</i> Steph says with a grin, starting to write on the goo's tit... only to have her pen... and her hand... sink into her gooey skin.");
	output("\n\nThe goo and Steph both stare at the huntress's wrist as it vanishes into the goo-girl's tit. <i>\"Oops. I guess I'm hungry! Oh well! This is gonna be super duper fun, Miss Irson, I promise.\"</i>");
	output("\n\nSteph manages only to let out a panicked scream as a surge of grey goo rushes up her arm, crashing across her body like a tidalwave, pulling her into the main mass of silvery machines. Her voice is silenced as a million micromachines surround her, dragging the show's host into the googirl's body until there's no trace of her left except her ponytail wiggling around behind the goo's head, dripping with moist micromachines. Giggling to herself, the goo spins around and strikes a pose, now almost perfectly mirroring Steph's shapely, athletic form (except for a much larger bust and ass), even pouring herself in to fill out the huntress's clothes.");
	processTime(4);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",stephIrsonEpisodeTwoDashTwo);
}
public function stephIrsonEpisodeTwoDashTwo():void
{
	clearOutput();
	author("Savin");
	showName("STEPH\nIRSON");
	showBust("STEPH_2_NUDE");
	var x:int = 0;
	if(pc.hasCock()) x = pc.smallestCockIndex();
	else if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("<i>\"Say hi to the camera!\"</i> The goo titters, bending over and wiggling her ass at the camera drone hovering around her. Winking at the camera over her shoulder, she reaches back and spreads her cheeks, quick and hard enough to rip her short pants and revealing a glistening wet ass and pussy - a human pair - beneath the torn bits of short pants still clinging to the hidden Steph's hips. The drone zooms in on her slit, catching a bit of lens flare as the dim sun reflects off of Steph's soaked-wet pussy, showing a thick trail of vaginal secretion trickling down from her spread hole.");
	output("\n\n<i>\"Won't need THESE anymore,\"</i> the goo giggles, fingers slipping into her hips and pulling off the ruins of Steph's shorts, and then her lacy black panties, which the goo pauses to get a nice whiff of. <i>\"Oh, she smells just like I thought she would! M-maybe I should keep these...\"</i> she says, looking around in mock-guilt before stuffing them into her gooey cleavage.");
	output("\n\nPants gone, the goo shimmies down to the ground, planting her ass on the dusty plain and lifting her long, toned legs up, slowly pulling off her boots one by one, leaving Steph's long stockings bare to the camera. <i>\"Oooh, sexy! Maybe I'll just leave these on!\"</i> the goo giggles, rolling onto her knees and showing off her backside and legs for the camera.");
	output("\n\nThe goo's absolutely putting on a show of her own, now, crawling toward the camera on all fours, slowly letting her machines tear apart Steph's shirt to reveal her impressive bust, barely held back by a tight black bra. She exaggerates her movements, making sure her heavy chest is nice and bouncy for the camera as she approaches.");
	output("\n\n<i>\"Do you like my tits, galaxy?\"</i> the googirl grins, groping her Steph-shaped bosom. <i>\"Maybe you want a closer look?\"</i>");
	output("\n\nWith a saucy smile, the goo covers her lace-clad breasts with her arms, immitating a show of modesty... only for the bra covering them to tear a moment later from the sheer amount of goo straining beneath it, letting her tits bounce free. Steph's stiff, small nipples quickly draw the camera drone's auto-focus.");
	output("\n\n<i>\"Oh, no, my big, bouncy tits are exposed! The whole galaxy can see my boobs... how embarrassing...\"</i> the goo says with mock shyness, barely able to contain her laughter. <i>\"Does that mean I'm a slut now? Oh, I bet so many people are masturbating to me now...\"</i>");
	output("\n\nShe giggles to herself, but looking around the bar, she's not wrong. Plenty of other folk in the smoky back-room tavern are sporting impressive bulges in their pants, and some are even shamelessly jerking it.");

	//If PC has fucked TrapCL AND has a dick that fits her or a vagina:
	if(timesDelilahSexed() > 0 && (pc.hasCock() || pc.hasVagina()))
	{
		output("\n\nSeeing your favorite bartender a short distance away, also watching the lewd display on galactic TV, you motion her over. Hesitantly, she obeys - its not like anyone's ordering drinks with their hands full of dick. You pull the trappy lady-boy into your lap, your fingers quickly sliding down her lacy panties from under her knee-skirt, leaving her dusky cheeks bare against your ");
		if(!pc.isCrotchGarbed()) output("[pc.skinFurScales]");
		else output("[pc.lowerGarment]");
		output(", letting her feel the ");
		if(pc.hasCock()) output("swell of your own rising erection");
		else output("heat of your loins");
		output(". Bound by her mistress's command, the bartender can do nothing to resist you.");

		//If PC has a dick that fits
		if(pc.hasCock()) 
		{
			output("\n\nAlready used to your cock, it's easy to shift the girl from sitting in your lap to sitting on your dick. She gives a quiet gasp as you plant her hips over your crown, clasping her hands over her mouth as you let her go, leaving her to slide down your [pc.cock " + x + "], encasing it in the tight, warm confines of her boypussy. You give a sigh of relief, happy to have a nice sheath for your schlong, her muscles contracting and writhing around your girth, waiting eagerly to accept your cum when the goo's done with Steph. Speaking of which....");
			pc.cockChange(true,false);
		}
		//If PC has a vag:
		else 
		{
			output("\n\nHaving seen the googirl's show the same as you, your poor little ladyboy is already rock-hard, cock making a nice little tent under her skirt. You figure, why not be generous? Even sissies need to cum sometimes. You spread your [pc.legOrLegs] for her");
			if(pc.isCrotchGarbed()) output(", pushing your [pc.lowerGarments] out of the way");
			output(" to give the bartender easy access to your [pc.vagina " + x + "]. Horny as she is, it doesn't take much more prompting than that to get your favorite Tarkusian trap to straddle your [pc.legOrLegs] and start pounding away, her tiny prick easily entering your sex and spearing you with pleasure. Now that's more like it. You lean back in your booth, letting the trappy slut wrap her arms around you as she fucks you, and enjoy the show and the sex at once....");
			pc.cuntChange(x,chars["DELILAH"].cockVolume(0),true,true,false);
		}
	}

	output("\n\nBack on screen, the grey goo encasing Steph Irson has rolled onto her back, spreading her legs for the camera, fingers delving into poor Steph's gaping cunt, thumb teasing the bud of her clitty. The goo herself is giving the audience a playful grin, clearly enjoying the galactic attention - or at least that of the drone as it buzzes around her, always searching for the best angle. Giving a little gasp of pleasure, her slimy fingers slip into Steph's folds, spreading her cunt out for its closeup. The drone dutifully flies in, giving you a perfect High-Def view of Steph Irson's pussy gaped around the googirl's hand as she starts to jill off.");
		output("\n\n<i>\"Are you getting close, galaxy?\"</i> the goo grins, fingers moving faster and faster through Steph's exposed groin. Mimicking Steph's own accent, she continues, <i>\"Well, I sure am! Let's finish together, everyone!\"</i>");
	//If PC is fucking TrapCL: 
	if(timesDelilahSexed() > 0 && (pc.hasCock() || pc.hasVagina()))
	{
		output("\n\nWell, who're you to say no? You let down your guard, releasing your body to fulfil its most primal wishes with the help of the trappy bartender. ");
		//Dicksex:
		if(pc.hasCock()) output("The girly-boy gives a muted little gasp as she feels your cock swelling inside her hole, and her fingers lace through yours as you grunt and spurt, hips slapping up into her butt as your [pc.cock " + x + "] unleashes its creamy load right up her tailhole.");
		else output("<i>\"C-cumming,\"</i> the trap moans, burying her face in your [pc.chest] as her hip-thrusts reach a new height of speed, slamming into your [pc.vagina " + x + "] with wild abandon. Grinning, you tell her to let it go, wrapping your [pc.legOrLegs] around her hips to draw her deep inside as she cums, flooding your sex with hot, creamy seed.");
		pc.orgasm();
	}
	else pc.lust(33);
	output("\n\nWith a giddy cry of pleasure, the goo-girl lets out a powerful squirt of girl-cum right into the camera drone's eye, sending it tumbling back as its owner and her gooey captor cum and cum, screaming and bucking their hips on the ground. A few moments later, the screen goes black, followed by an <i>\"Experiencing Technical Difficulties\"</i> warning superimposed over the <i>Galactic Huntress</i> logo. In the background, though, you can still hear Steph moaning as the goo finishes with her.");
	output("\n\n<i>\"So, you're gonna edit all that out in post, right?\"</i> the goo giggles, just as a commercial comes on.");
	processTime(19);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Slut Training
//{Requirement: PC is a trap or shemale with a non-virgin asshole. Access via normal sex menu
//Tooltip: Delilah needs to learn how to properly service her clients with that tight little ass of hers. You're the perfect person to show her how it's done...}
public function delilahSlutTraining():void
{
	clearOutput();
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH_NUDE");
	author("Savin");
	output("<i>\"Not me, no,\"</i> you say, taunting the cute trap. You curl your finger in a come-hither, drawing her out from behind the bar, and take a look at your trappy protege. She's lithe and feminine, whether by gene-mod or naturally, you don't know; either way, she's certainly more girly than man, especially in the cross between maid uniform and outright lingerie she's dressed up in, complete with thigh-high stockings and garter hidden under a sinfully short skirt that can't quite reach to her knees. The perfect combination of cute and slutty, just right for someone like the two of you.");
	output("\n\n<i>\"Watch and learn,\"</i> you breathe into her ear, close enough that your [pc.lips] brush against her ear as you slip over to the bar, bending over it and wiggling your [pc.hips] toward the patrons of the bar. A few boys look your way as you shimmy up onto the bar, ass in the air, giving everyone who even glances your way a full-force show as you start to peel off your [pc.gear], revealing the full cheeks of your [pc.butt]. That gets their attention: a few wolf-whistles and cat-calls come your way as you let your hind end slip free, making sure to spread 'em wide as your welcoming little hole comes into view while simultaneously keeping your [pc.cock] well out of view");
	if(pc.legCount > 1) output(", trapped between your [pc.legs]");
	else output(".");
	output("\n\nYou cast a glance over your shoulder to your impromptu audience, gratified to see several tented trousers among the gathering of humans, ausar, and other coreward races sitting in the booths, all with a front-row seat to your show. Now for a little audience participation....");
	output("\n\nYou reach back and give yourself a slap on the ass, drawing a sharp breath at the gratifying snap of pain, and the motion of your jiggling cheeks as they recoil from the blow. Your hand moves in, spreading your cheeks wide so everyone can get a good look at your [pc.asshole], shamelessly on display and already craving cock. You can <i>feel</i> the need in your loins and hole, hungry for the familiar taste of cock inside you, pounding you into the cold, unforgiving wood of the bar, stretching your slutty hole wide open.");
	output("\n\nYour mouth is watering. And oh <i>god</i> is your cock hard.");
	output("\n\n<i>\"Why don't you get me ready?\"</i> you whisper to Del with another wiggle of your [pc.hips].");

	//if 1-4 time:
	if(timesDelilahSexed() <= 4)
	{
		output("\n\n<i>\"W-what do you...\"</i> Del starts to ask, before you reach back, grab her head, and smash it down into the crack of your ass. She gasps, struggling against your grasp as your hold her against your butt, waiting until the inevitable sinks in. To her credit, she learns fast.");
	}
	else output("\n\n<i>\"Thought you'd never ask...\"</i> the whorish bartender says with a lascivious smile, slipping down onto her knees behind you and spreading your cheeks open with her hands.");
	output(" You give a little shudder of pleasure as Delilah's tongue slurps along from the ");
	if(!pc.balls == 0) output("[pc.sheath] of your [pc.cock]");
	else output("back of your [pc.balls]");
	output(" up to the tight-clenched hole of your [pc.asshole].");

	output("\n\n<i>\"Riiiight there,\"</i> you purr, winking at a nearby patron as Del's tongue caresses your rim. You try and relax yourself, breathing steady as her wet appendage's tip puts a bit of pressure on you. Not enough to truly penetrate, but certainly enough to spread your sphincter open around her, letting her drool soak into your hole. Your breath catches as you feel the first rivulet of lubricant enter you. Your fingers dig into the wood, gripping the rim of the bar tight as you struggle to contain your moans, letting Del get you ready for the main event.");
	output("\n\nYou let your hand stroke through your slutty protege's golden hair, urging her on until your [pc.legOrLegs] are shaking, her tongue slipping into your ass, slathering you with spit. In her lust, she even reaches around your quaking [pc.legOrLegs], finding the [pc.cockHead] of your [pc.cock] and squeezing it. A long, loud moan escapes your lips, high and feminine as your prick gets teased by her small, deft hands. Oh... if you're not careful, you may find your fun over before it begins. You hate to do it, but... with a heavy sigh, you push Del back, leaving yourself with a hollow, empty feeling in your backside.");
	output("\n\nYou sit Del down beside you, out of the way for the moment and turn your full attention to the audience on hand. A smile and a wink to a powerfully built ausar spacer sitting across the bar from you is all it takes to get it going, but just for good measure as your first taker stands up, you grin at the bar and declare: <i>\"Alright, boys... come and get it!\"</i>");
	output("\n\nThe ausar's quick to take you up on your now-explicit offer, his black-furred hands grabbing your [pc.hips] and unceremoniously flopping his thick, red, canine cock onto your backside, the pointed crown pressing into your spit-slick hole.");
	output("\n\n<i>\"Not the knot, please,\"</i> you whisper, <i>\"Gonna have a long line for me.\"</i>");
	output("\n\n<i>\"Yeah, yeah,\"</i> the ausar says, already sliding his hips forwards into you. You bite your lip, stifling a groan as that hollowness in you, that need, is suddenly and wonderfully filled. Your back arches as the ausar stretches you wide on thick canid cock, thrusting deep in until you can feel the bulb of his knot against your hole. For a moment, you're afraid he'll ruin your fun; but he's a good sport and pulls right back out until there's just his tapered tip inside you.");
	pc.buttChange(130,true,false);
	output("\n\nYou squeeze down on the intruding member, giving the ausar a nice, tight, wet hole to thrust into - and he does so with gusto. A few slow, even strokes to start you off, and then he's pounding away at you, hammering his crotch into your ass, forcing you into the bar with every smack of flesh-on-flesh. You moan, crying out as his meaty prick stretches you wide, putting just enough pressure on that wonderful bud inside your clenching hole to make your [pc.cock] jump back to attention, bobbing as your hips are rocked by the impact of his cock slamming home.");
	output("\n\nIt doesn't take long before the man's grunting with effort, thrusts becoming quick and erratic as your well-trained hole milks him. With a roar, the ausar buries himself deep, grabbing your ass until his nails score you flesh; you clamp your muscles down as hard as you can to give him as pleasurable a release as possible. You both heave a sigh as you feel the familiar flood of spooge into your ass, and it takes everything you have not to give in and start masturbating just at the wonderfully full, wet, hot sensation of seed spilling into your boypussy.");
	output("\n\nPanting, the ausar man stumbles back, red cock slathered with his own cum as it flops out of you. You push back a little as he withdraws, and shudder as you feel a little trickle of his hot, creamy spunk drool out of your hole");
	if(pc.legCount > 1) output("\n\n, pooling between your wide-spread [pc.legs]");
	output("\n\n. That's how it's done! You give Del a sultry wink as the first of many men leaves you, only to be quickly replaced by a second: a human man, if the bulbous crown pressing into your now-gaping, cum-filled hole is any indication.");
	output("\n\n<i>\"Oh yeah! Fuck me!\"</i> your purr, even as his cock's halfway inside you, using the previous tenant's spunk as a thicker, longer-lasting lube to slide easily into your unopposing depths. As the man hilts himself inside you, you can't hold back a long, moaning <i>\"Ooohhh fuck.\"</i>");
	output("\n\nYou pull yourself up onto your elbows as the man gets to ass-fucking you, tearing off what remains of your [pc.gear] to get at your [pc.chest], tweaking one of your stiff nipples to add to your pleasure. From this angle, you can see more than half the bar's on their feet, tented pants (and a few skirts, you note) on display as a bit of a line forms up behind you, everyone eager to get their turn at your [pc.asshole]. Now there's a thought you can relish for a while. Between lewd moans and husky words of encouragement to your current butt-lover, you whistle over to another man in the crowd, wiggling a finger until he's in front of you, cock flopping out of his jeans. You twist a bit to get a good angle on the juicy-looking cock on display, brushing your fingertips up the turgid length until your hand is wrapped around it, guiding it toward your mouth.");
	output("\n\nAs your tongue lashes out toward the man's prick, your eyes roll back at the wonderful, earthy taste of cock. You feel yourself trembling as you take the dick into your mouth, wrapping your [pc.lips] around the head and tasting the salty flavor. You guide your third john in, opening wide to let him bury himself in your mouth, even as number two's pounding away at your other hole. You lose yourself into the mindless bliss of the double-team, eyes fluttering closed as you let your cock-wielding customers use your body as they like. You barely even notice this time as the man fucking your ass cums, spraying your colon with another load of seed to ease the entrance of the next.");
	output("\n\nMinutes of cock-sucking and ass-fucking go by before you manage to remember why you started this - other than your own rampant cocklust, anyway. You grunt as the third man cums in your mouth, shooting a thick load of spunk down your throat. With a cough and a lip-licking grin, you let him stumble off. With spooge drooling down your chin, you turn to Del, and find her staring wide-eyed at you, ");
	//if 1-4:
	if(timesDelilahSexed() < 5) output("utterly horrified at the display on hand");
	else output("a look of utter, needy lust writ large on her whorish face");
	output("."); 

	output("\n\n<i>\"Come on,\"</i> you say, patting the bar beside you. You barely notice a big glob of spunk fall out of your mouth, splattering on the wood. The trappy slut looks nervously at the line of men waiting to try out your ass or mouth, but ");
	if(timesDelilahSexed() < 5) output("resigned to her fate");
	else output("giving in to her own lusts");
	output(", she clambers up beside you, mirroring your position of submission, sticking her ass up in the air and shimmying out of her panties, leaving her own little hole open to the crowd.");

	output("\n\nAs Del is getting ready, you feel another one blow his load inside your own [pc.asshole], filling you with such an abundance of creamy spunk that as soon as he fumbles his cock out of your ass, you're instantly leaking gooey whiteness down your thighs and onto the floor. You give a dreamy sigh and lean onto your arms, meekly accepting another cock in both your holes at once. This is the life... and it's time to induct your dusky, trappy friend into the affair. You give a subtle nod to another man in line, and he steps out from behind you and grabs Del by the hips. She gives a startled cry, but her scream turns soundless, breath caught in her straining throat as the john takes her without ceremony, plunging his prick into the waiting hole of her ass.");
	output("\n\nYou reach out and take Del's hand, lacing your fingers through the dusky whore's as she's filled with almost as much cock as you are. Her muscles are going crazy, chest heaving and back arching as she's fucked hard and fast, pounding her into the hardwood with you. That a girl. You turn your attention back to your own lucky customers, slipping a few fingers into the dark star of the man plunging into your open mouth, giving him a thrill and a quick cumshot that leaves your face fully plastered with spunk.");
	output("\n\nYou lick up a few drops during your short reprieve before a large, vaguely equine woman steps up and unleashes a mammoth member in front of you: two feet of solid horsecock that nearly knocks you cold with the sheer <i>smell</i> of it, so rich and manly and.... and when did you start sucking it? Your eyes just about roll up as your lips slurp up as much of this massive equine member as you can get, doing everything in your power to kill off your gag reflex as your jaw stretches out to accommodate it. You look up to the hermaphroditic woman, unable to see her face under the huge swells of her hefty breasts, which heave and strain against the sheer fabric constraining them as you suck her off.");
	output("\n\nThe horsey babe puts a hand on your [pc.hair], cooing softly as you manhandle the majority of her mammoth member into your mouth. You reach down and cup her heavy balls, practically able to feel them churning with pent-up seed, straining against their thick sack. It takes a moment for you to realize you're trembling with excitement at the thought of her emptying those thick, meaty nads down your throat, bloating your belly with cum until you look");
	if(!pc.hasPregnancy()) output("positively pregnant");
	else output("even more pregnant than you are");
	output(". Slowly, though, it dawns on you that hogging this magnificent cock all for yourself would just be too greedy. And besides, Del needs to learn how to handle a real monster cock.");
	output("\n\nMarshalling your willpower, you manage to pull yourself off the horse-girl's prick. She gives a low grunt, clearly displeased, until you point to your friend beside you. Just in time, too: the two of you glance over just as Del throws her head back with a whimpering cry of pleasure. Her john's hilt-deep in her hold, chest heaving as he pumps his load into her quivering hole, filling her with her first load of the day. You give the massively-endowed horsegirl a little push toward the now-vacant slut as her first cock is withdrawn from her, its owner staggering off to recover.");
	output("\n\nYou watch with glee as the horsecock-toting hermaphrodite circles around you and the fellow currently making use of your ass, stepping up behind Del as the lithe little trap recovers from her ass-pounding. She goes wide-eyed as a two-inch thick rod of horsemeat suddenly flops onto her back, looking almost as long as her torso at this angle. You lick your lips, suddenly reminded of just how <i>hard</i> you are as you watch the horse-herm rub the flare of her prick through Del's spread crack, slathering the her crown with the runoff seed of the last john to take your trappy protege.");
	output("\n\nSufficiently lubed up, the equine babe gives you a sultry wink and thrusts her hips towards Del's. The trap-slut screams in pain and pleasure as she's suddenly and violently stretched open on the blunted flare of the horsecock. As she's introduced to the thick, throbbing horsemember, you're suddenly all-too-aware of the cock pumping into your own hole, and how very near to orgasm you are. You try to hold back");
	if(pc.legCount > 1) output(", clenching your [pc.cock] tight between your [pc.legs]");
	output(", focusing not on the thick, spunk-slathered schlong pounding your hole, but on the huge, girthy, gut-distending rod slowly splitting Delilah in half. She's being physically lifted from the ground on the rigid length of horsemeat probing her guts, feet dangling as the towering equine's dick visibly stretches her body out, showing through her once-flat belly as it travels through the tight passage of her ass.");
	output("\n\nBetween the lewd show Del and the horsecock'd girl are putting on and the ever-present feeling of being fucked, the constant pressure on your backdoor pleasure-buzzer and the churning in your [pc.balls], you can't hold out for long. You look back at the guy currently balls-deep in your ass and, in the most seductive voice you can manage while drooling cum from two holes and just about to bust your own nut, moan out, <i>\"Cum with me! Shoot your load deep inside! Make me cum!\"</i>");
	output("\n\nThat gets him excited. The man grabs your [pc.hips] and plows in, thrusting fast and hard until you're both moaning openly, and you can feel the familiar, rising pleasure of an anal orgasm riding up on you. You grip the bar as tight as you can, focusing entirely on the ass-spearing pleasure and the sight of Del being fucking into a quivering pile of trappy lust. Oh, you could get used to this....");
	output("\n\nYou reward your ardent lover with a high, girly whine of pleasure as he fills you with a thick wad of man-goo, joining the lake already backed up in your [pc.asshole], and finally let yourself cum. As soon as your relax yourself, you feel your [pc.cum] welling up from within as your prostate finally surrenders, meekly and discreetly leaking out of your [pc.cocks] and down the side of the bar as the cum's fucked out of you from behind. Moaning like the whore you are, you ride out the orgasm to the beat of the buttfucking, smearing your thighs and the wood of the bar with your messy orgasm, enjoying every moment of cumming like a proper girl.");
	output("\n\nYou give a self-pleasured shudder as the last cock pulls slowly out of your cum-stuffed backdoor, letting spooge leak out like a waterfall as your still-twitching muscles work out all that backlogged spunk. You collapse atop the bar, barely sensate, just keeping your eyes open long enough to watch Del's belly suddenly swell as the horse-girl blows her load deep in the dusky trap's ass, leaving her looking nine months pregnant before she pulls out with a gusto, letting a flood of horse-cream flow out onto the floor....");
	if(pc.isAss()) output(" Gonna have to make Del clean all this up after. Maybe with her mouth.");
	pc.orgasm();
	pc.orgasm();
	processTime(60+rand(5));
	clearMenu();
	addButton(0,"Next",delSlutTraining2);
	//Pass ~1 hr
}

public function delSlutTraining2():void
{
	clearOutput();
	userInterface.showName("\nDELILAH");
	userInterface.showBust("DELILAH_NUDE");
	author("Savin");
	output("<b>Time passes...</b>");
	output("\n\nYou lost count of how many men (and women!) have used your body. At least thirty; probably more. Someone got on their holoband and called their friends over after the line got thinned out, and pretty soon you and Del were swimming in an ocean of spooge coating yourselves and the bar. You can't feel your [pc.legOrLegs] anymore... but in a good, contented, tired-from-getting-your-brains-fucked-out sort of way. You lie with your back atop the bar");
	if(pc.legCount > 1) output(", your [pc.legs] spread almost to your ears");
	output(" as the last man standing finishes himself inside you. You give an approving gasp, nearly joining him - though you've already cum on yourself enough for one day, perhaps: your [pc.chest] is completely soaked, with rivulets running off your bare body to stain the hardwood below you.");
	output("\n\nWith a grunt, the last john of the day pulls out of you, still leaking cum, and wipes himself off on your thigh. You give him a wink and blow a kiss after him before collapsing back, trying to catch your breath. Delilah's beside you still, though you're not sure if she's still conscious: that horsecock'd woman left her pretty well ruined for the moment, and only the best-endowed men have used her since. But she's certainly gotten her taste of what it REALLY means to be a cock-hungry whore. You lean over and give her a peck on the cheek before unsteadily clambering off the bar and searching for your gear. Nice and cum-soaked....");
	processTime(15);
	timesDelilahSexed(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}




