//Upon visiting The Dark Chrysalis on Halloween a special Halloween area text and Halloween opening is used (if the event was already triggered it can be repeated with a “standard” opening at any time of the year.)
//Requirements are a PC with at least A-cups that is currently receiving salary from Sera.

//In both openings, Sera forces the PC to eat a big handful of “Halloween Candy” which turns out to be Milk Caramel Gushers.

//After some oral fun for Sera, the PCs breasts are finally swollen with milk (increase size by 2 cups) from the high dosage of Milk Caramel Gushers and anal sex follows. The PC is pressed against the shop-window from the inside and “cleans” the window with swollen, milky breasts while taking Sera up the butt. Afterwards the PC has his/her breasts return to normal size after the effects of the Milk Gushers wear off.


// only trigger the scene if PC has at least A-cup breasts+receives salary from Sera
//increase exhibitonism-value highish (2% base change?)
// use “Halloween opening” if systemdate is between 10/28 and 11/3
// if the event has already been triggered once, it can be repeated with the “standard opening” as long as the PC is still receiving salary

//if(isHalloweenish() && pc.breastRows[0].breastRating() >= 1 && seraIsMistress())

public function seraTrickOrTreatEventIntro():void
{
	clearOutput();
	showSera();
	author("flying_moustache");
	//upon entering The Dark Chrysalis (Halloween opening)
	if(isHalloweenish())
	{
		output("As you enter The Dark Chrysalis you are immediately greeted by a voice well-known to you.");
		output("\n\n<i>“I SWEAR ON MY DICK, IF YOU ASK ME ONE MORE TIM-oh.”</i>");
		output("\n\nThe demonic face of your mistress is one of pure fury as she whirls around and feels around with her left hand for <i>anything</i> throwable. Upon recognizing you, she visibly relaxes and lets out something between a snort and a laugh.");
		output("\n\nYou stand there in silence, wondering if you should ask what that was about or not, when your mistress starts leaning onto the counter chin in hand.");
		output("\n\n<i>“Count yourself lucky, pet. I almost mistook you for one of those annoying assholes. Can you imagine? CHILDREN I get, I mean, not that they come here at all but they would be fine if they were to do it.”</i>");
		output("\n\nBoth of her hands are slammed onto the counter in what seems to be an attempt to vent her frustration.");
		output("\n\n<i>“But ADULTS? And they are asking for FREE MODS? Just because you wear a costume on Halloween doesn’t mean you can have anything, just because you shout ‘Trick or treat!’ like an asshole! </i>And<i> they have the gall to ask me for furry mods!”</i>");
		output("\n\nThat last part was more animalistic growl than human speech but it still kinda sounded like the voice of your mistress. Maybe.");
	}
	else
	{
		output("Sera has an exceedingly dangerous look in her eye, much like she did at Halloween. Perhaps you’d best bail if you don’t want a faceful of boob-growing “candy”.");
	}
	
	processTime(3);
	clearMenu();
	//[Can I help?] [Tooltip: Are you sure about this?]
	addButton(0,"Can I Help?",canIHelpYouSeraImDumb,undefined,"Can I Help?","Are you sure about this?");
	//[Sneak out] [Tooltip: She seems pretty absorbed in her anger. You could probably sneak out of the shop if you wanted.]
	addButton(1,"Sneak Out",sneakOutOfAngryHalloweenSera,undefined,"Sneak Out","She seems pretty absorbed in her anger. You could probably sneak out of the shop if you wanted.");
}

//sneak out
public function sneakOutOfAngryHalloweenSera():void
{
	clearOutput();
	showSera();
	author("flying_moustache");
	//Perm lockout if skipped first time :3
	if(flags["SERA_HALLOWEEN_LOCKED"] == undefined) flags["SERA_HALLOWEEN_LOCKED"] = 1;
	output("You mumble something about having to excuse herself and slowly retreat to the door. Sera doesn’t even look at you, rambling about how she should have done something mean to those costumed pricks and just <i>“Yeah, whatever”</i>s you when you excuse yourself.");

	output("\n\nYou feel like you dodged a bullet there.");
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//Can I help?
public function canIHelpYouSeraImDumb():void
{
	clearOutput();
	showSera();
	author("flying_moustache");
	IncrementFlag("SERA_HALLOWEEN_HELPED");
	
	var furScore:Number = ( pc.badgerScore()+pc.bovineScore()+pc.bunnyScore()+pc.canineScore()+pc.deerScore()+pc.felineScore()+pc.horseScore()+pc.huskarScore()+pc.laquineScore()+pc.nukiScore()+pc.pandaScore()+pc.sheepScore()+pc.vulpineScore() );
	
	if(isHalloweenish())
	{
		output("The moment you say that, Sera’s eyes light up. Silence.");
		output("\n\n<i>“Yeah. Yeah, you can.”</i>");
		output("\n\nMaybe you should not have said that.");
		output("\n\n<i>“I have this idea but I don’t know if it works out as I think it will.");
		//if PC has a Badger, Bovine, Bunny, Canine, Deer, Feline, Horse, Huskar, Laquine, Lupine, Nuki, Panda, Sheep or Vulpine score of 0:
		if(furScore == 0) output(" I mean, you look </i>nothing<i> like them, but it could work.");
		//if PC has a Badger, Bovine, Bunny, Canine, Deer, Feline, Horse, Huskar, Laquine, Lupine, Nuki, Panda, Sheep or Vulpine score of 1:
		else if(furScore < 2) output(" Could work though. You kinda look like them.");
		else output(" But it will probably work out fine. You look just like those guys.");
		output("”</i>");

		output("\n\nSera ducks under the counter to get something and casually presses a button on a remote without skipping a beat. You hear how the door out locks behind you. That’s that.");

		output("\n\nYou gulp.");

		output("\n\n<i>“One of them dropped this on their way out. ");
		if(!pc.isNude()) output("Get out of your clothes and p");
		else output("P");
		output("ut that on.”</i>");

		output("\n\nThe demoness throws a pair of bunny-ears on a headband over to you as she unwraps some kind of candy. You awkwardly strip and place them on your head and before you can start to wonder too much about why she wants you to wear a headband with bunny-ears");
		if(pc.earType == GLOBAL.TYPE_LAPINE) output(" even though you already have bunny-ears");
		output(", a smiling Sera curls her finger at you to come over to her standing at the shop window. You sigh, but do as demanded.");
		
		output("\n\n<i>“So, about those free furry mod samples you all wanted...”</i> she says with a sickeningly sweet voice. Then, after a brief pause, <i>“Go on. Say it once more.”</i> Does she mean...? You gulp again. But, like before, you dare not to disobey.");

		output("\n\n<i>“T-trick or tr-?”</i>");

		output("\n\nAs you try to say it, Sera crams a fistful of candy into your mouth, smiling all the while.");

		output("\n\nStill shocked, a strong hand easily ");
		if(pc.hasKnees()) output("brings you down onto your knees");
		else output("lowers you to her crotch");
		output(" and your mouth onto your mistress’ dick. Sheer physical force shoves the caramel-flavored candy down your throat only for bulging demon-dick to follow.");
		output("\n\n<i>“Trick or treat that, you pricks. Should have done that right away when you asked.”</i>");
	}
	//[continue with “merge Halloween opening or standard opening here”]
	//standard opening
	else
	{
		output("As you enter The Dark Chrysalis, you notice a familiar succubus pretending not to notice you. In fact, she walks right by you to the shop window and runs her claw-tipped finger across it.");
		output("\n\n<i>“Unacceptable.”</i>");
		output("\n\nShe holds it out to you.");
		output("\n\n<i>“I run a business here. My reputation is my life. What would my potential customers think of my shop if they saw how dusty my showcase is? Hm? That my shop is boring? And dirty? How do you plan on taking responsibility for this?”</i>");
		output("\n\n<i>“I don’t see any-”</i>");
		output("\n\n<i>“I </i>said<i>, slut, how do you plan to take responsibility?”</i>");
		output("\n\nAny form of protest is immediately suffocated by the glare of your mistress, a look both demanding and hard. Something else has seemingly also gotten hard, judging from how her dick feels against your [pc.belly]. She clearly has something in mind.");
		output("\n\n<i>“Mistress, I-”</i>");
		output("\n\nYou gasp in surprise as she roughly grabs your [pc.breast].");
		output("\n\n<i>“Yeah, that could work. Good thinking, slut.");
		if(!pc.isNude()) output(" Get your clothes out of the way then.");
		output("”</i>");

		output("\n\nFor a long second, you hesitate. Can you talk yourself out of this somehow? The demanding look of your mistress says otherwise. You hang your head in defeat ");
		if(!pc.isNude()) output("and start to strip out of your clothes");
		else output("wondering how you got into this situation");
		output(" as Sera goes behind the counter to get something and then waits beside the shop window, with both hands behind her back. You walk up to her, wary but also a tiny bit curious.");
		output("\n\n<i>“Here. For old time’s sake.”</i>");
		output("\n\nSera smiles warmly and quickly puts something onto your head. You look into your reflection in the shop window to see it’s a headband with bunny-ears. You gasp in surprise.");
		output("\n\nAnd that’s what your mistress was waiting for.");
		output("\n\nShe crams a fistful of caramel-flavoured candy into your mouth and ");

		if(pc.hasKnees()) output("brings you down onto your knees");
		else output("lowers you to her crotch");
		output(" and onto her dick in your moment of confusion.");
		output("\n\nSheer physical force shoves the caramel-flavored candy down your throat only for bulging demon-dick to follow.");
		output("\n\n<i>“Trick or treat,”</i> she husks in enjoyment.");
	}
	//[continue with “merge Halloween opening or standard opening here”]
	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",roughFunsWithSeras,furScore);
}

//merge Halloween opening or standard opening here
public function roughFunsWithSeras(furScore:Number):void
{
	clearOutput();
	showSera(true);
	author("flying_moustache");
	output("Claw-tipped fingers firmly grasp your ");
	if(pc.horns > 1 && pc.hornLength >= 4) output("horns");
	else output("skull");
	output(" and hold you in place as Sera starts using you. She starts a bit slow, but soon, her thrusts are long and hard enough to have your throat bulge on her forward movements, bringing tears to your eyes.");

	if(pc.horns > 1 && pc.hornLength >= 4) output("\n\nYour mistress seems to like your horns. She holds a firm grip on them, using them as convenient handles. <i>“You grew these just for me? While thinking how great me fucking your throat is gonna feel with that? You really are on another level, you furry slut!”</i>");

	output("\n\nAmidst your oral abuse, you notice how your breasts start to feel hot and tingly. Something seems to gather inside of them, swelling them from the inside. Could it be milk? That candy must have caused this! Any other time you would probably be more concerned about that, but right now you are desperate to focus on Sera’s timing to get even just a little bit more air in between her thrusts.");

	output("\n\nYou notice that her rhythm starts getting slower and wonder if she might be pacing herself to enjoy your throat a bit longer, but realize that might not be it. She’s just not moving her hips as much anymore, but instead mostly lets you bop your head on your own, merely guiding you with her hands. But even with that realization, you don’t stop. You want it too now. To please your mistress, to receive her, be used by her. And while your breasts continue to swell, you notice why your mistress stopped using her hips: She’s leaning her butt against the shop window.");

	output("\n\nThe window! As you think how your mistress’ butt pressed against the shopwindow must be a look to be worshipped, you realize every passerby can also see you servicing your mistress.");
	if(pc.exhibitionism() < 66 && pc.exhibitionism() >= 33) output(" And you notice how that thought excites you.");
	else if(pc.exhibitionism() >= 66) output(" And that thought alone brings a hot blush to your cheeks.");
	output("\n\nYou hesitate for a moment and are again promptly forced down deep onto the demonic dick by two clawed hands until you feel your throat bulging. Long, hard thrusts test your and your throat’s limits as the succubus relentlessly humps into you. More than just a few people turn their heads at your show now,");
	if(pc.exhibitionism() < 33) output(" but you count yourself lucky that most can’t get a decent look at your face, being behind your mistress, moving fast up and down and all.");
	else if(pc.exhibitionism() < 66) output(" but you count yourself lucky that most can’t get a decent look at your face, being behind your mistress, moving fast up and down and all. Then again, some part of you thinks it would be pretty hot if they could watch a little bit...");
	else output(" but you wish more could see your lewd face as you suck the demonic dick of your mistress unashamedly. Maybe some would recognize you?");

	output("\n\nAs Sera increases her pace again, breathing becomes a luxury and your bunny-ears hop around all over the place.");

	output("\n\nEven in your current predicament you can’t help but imagine before your mental eye how Sera’s plump and sweat-drenched ass presses flat against the glass with every pull backwards and in return how with every thrust her dick explores your insides, pleasing your mistress. And you want it even more now. To please her, receive her. You grab her hips and add to the motion. A strained giggle rewards your ears.");

	output("\n\n<i>“I know you are eager to but you don’t get to swallow today, that’s needed elsewhere.”</i>");

	output("\n\nYou are pushed backwards off her meatstick and held in place as she violently invades the valley of your now milky-swollen ");

	//[if C-cup or more: 
	if(pc.breastRows[0].breastRating() >= 3) output("breasts");
	//[if B-cup: generous D-cups]
	else if(pc.breastRows[0].breastRating() >= 2) output("generous D-cups");
	//[if A-cup: generous C-cups]
	else output("generous C-cups");

	output(" with her mass of cockflesh. You press your breasts together, eager to please, but are freed of your service only a minute later when Sera ejaculates with a groan all over your breasts and face. Your mistress jacks herself a few more times with skilled hand motions to make sure her balls empty themselves completely on your swollen breasts.");

	output("\n\nYou cough as your demonic mistress helps you up and turns you around to face the glass. Even in your current daze, you can’t help but notice how amazing your breasts feel! They are practically glowing hot and positively full to bursting with milk now! If only your mistress would grab and knead them... They are so sore from all that milk, begging for release. Maybe you could beg your mistre-");

	output("\n\nAs you think that thought, you feel a claw-tipped hand on your [pc.hip], another on your back and one shove later have your upper body pressed against the glass, smearing milk and cum all over it.");

	output("\n\n<i>“Don’t make them wait all day, furry slut.”</i> Sera husks as she presses her own breasts into your back.");

	output("\n\nPeople are openly watching you now. Some make no excuses of their suddenly tenting pants or even skirts, a few even touching themselves with no regard for decency. Several passersby seem to look up above the shop window for some reason. Is that a reflection of The Dark Chrysalis’ neon signage you see across the street?");

	if(furScore < 3) output(" <i>“Today: Wannabe-furry asks for free mods! Gets free treat!”</i>");
	else output(" <i>“Today: Furry asks for free mods! Gets free treat!”</i>");

	output("\n\nThe demoness puts even more pressure on you, forcing your cheek against the glass. Something hard pokes your butt. Without a second thought, you spread your [pc.ass]. You need this now. And you know you will get it.");

	output("\n\nThankfully, Sera’s cock is cum-smeared by now and can penetrate your [pc.asshole] with little trouble because your mistress is positively out of patience, immediately thrusting full force into you. Your breasts are pressed flat against the glass again and again with every slam of the demoness’ hips, as well as dragged up and down. The constant change between the cold of the glass and the heat of the body fluids, feels both like bliss and torture for your [pc.nipples]. Repeatedly, they are crushed against the glass and the harder they are crushed the harder they get.");
	pc.buttChange(sera.cockVolume(0));
	output("\n\nWithout mercy Sera throws you against the glass with every thrust, having you moan and your boobs squeak on the glass, polishing your leaking milk into it. The more the demoness ruts you stupid, the further you fall into a state of stupor and more people on the street stop to enjoy the show.");
	output("\n\nYou don’t know! You don’t understand!");
	if(pc.exhibitionism() < 33) output(" You don’t usually feel like that! But t");
	else if(pc.exhibitionism() < 66) output(" Somehow this feels so good! T");
	else output(" Has this always felt so good, so <i>right?</i> T");
	output("he more people stare at you with open lust or absolute shock, the more you want to be looked at. The more you are uncomfortably thrown against the cold glass, the more you want to be thrown against it. The rougher you are fucked, the rougher you want it.");
	output("\n\nYou want it. And you say as much.");
	output("\n\n<i>“More Mistress, please! Faster! Rougher! Look at me!”</i>");
	output("\n\nLaughter. Hands spank your ass and leave marks where the claws hit the skin a bit too hard. As the demonic dom nears her climax she grabs you by the shoulders. Your face leaves the glass and you can see your own face, distorted by lust like in a frenzy and the leering demonic face behind you.");

	output("\n\n<i>“Do you like it, you fucking furry slut?”</i> Sera hurls that line at you, in a tone both accusing and amused.");

	output("\n\n<i>“No,”</i> you answer immediately, raising an eyebrow on your mistress’ face. <i>“I love it,”</i> you add in your voice dripping with lust, earning you your first spurt of cum straight up your [pc.asshole].");

	output("\n\n<i>“Then fucking take it up your ass, furry whore!”</i>");

	output("\n\nSera can’t wait anymore and immediately pulls you as far down as she can and fills you with everything she has. Hot cream floods into you as you scream your orgasm into the shop window. Demon claws dig into your skin hard enough to draw drops of blood. Behind you, your mistress opens her lovely lips to grunt her fire-hot orgasm. In front of you, strands of cum fly through the air onto the outside of the shop window.");
	if(pc.cockTotal() == 1) output(" Your own [pc.cocks] fires its milk onto your side of the glass, adding to the mess.");
	else if(pc.cockTotal() > 1) output(" Your own [pc.cocks] fire their milk onto your side of the glass, adding to the mess.");
	if(pc.hasVagina()) output(" Another eruption comes from your ladyparts, sending a wave of love juice down your [pc.legs].");
	output("\n\nUnable to stand any longer, you slowly collapse to the floor, smearing one last trace of cum and milk across the glass and slipping off Seras demonic dick in the process. You helplessly leak cum from your gaping [pc.asshole] and milk from your [pc.breasts]");
	//output(", the latter having returned to their original size");
	output(".");
	output("\n\n<i>“And that’s your free treat, furry slut. Wasn’t so bad. For me at least. Almost makes me wish people would come in here and ask for free furry mods again.”</i>");
	output("\n\nYou are allowed a moment’s rest but as soon as you have started to catch your breath, you hear a familiar snarl from above you.");
	output("\n\n<i>“How long do you plan on lying on the ground here, pet!? Get out before I have you lick the window clean on both sides!”</i>");
	output("\n\nYou hurry onto your feet and gather your clothes, frightened your mistress might actually do just that. Luckily the demoness seems suddenly uninterested. She just activates cleaning bots on both sides of the shop window with a button on a remote and grabs the headband with bunny-ears from your head on your way out. You do wonder why she is so keen on keeping that headband but ultimately decide to leave as quickly as possible.");
	processTime(30);

	pc.orgasm();
	pc.loadInMouth(sera);
	pc.loadInAss(sera);
	pc.applyCumSoaked();
	pc.exhibitionism(2);

	applyCandyFun();

	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

public function applyCandyFun():void
{
	var target:Creature = pc;
	for(var x:int = 0; x < pc.bRows(); x++)
	{
		pc.breastRows[x].breastRatingRaw += 2;
	}
	pc.boostLactation(75);
	if(target.milkFullness < 75) target.milkFullness = 75;
}