// Stub for follower Syri

public function syrisPussAvailable():Boolean
{
	if (flags["SYRIQUEST_SYRI_ONAHOLE"] == 1) return true;
	else if (flags["SYRIQUEST_SYRI_ONAHOLE"] == 2 && syriIsCrew()) return true;
	return false;
}

public function syriFollowerApproach():void
{
	if (flags["PENNY_SYRIVAG_WATCHED"] == 1 && (rand(20) == 0 || pc.hasStatusEffect("Syri Pennybating")))
	{
		clearMenu();
		clearOutput();

		output("You pass by Syri's room and hear an erotic groan, making your [pc.ears] perk up. What <i>is</i> your cute ausar crewmate up to in there?");
		pc.createStatusEffect("Syri Pennybating");
		pc.setStatusMinutes("Syri Pennybating", 15+rand(31));

		addButton(0, "Investigate", interruptSyrisPornWatching);
		addButton(1, "Leave", function ():void
		{
			clearMenu();
			clearOutput();
			output("Best not to interfere when the crew's having some alone time, you've found. You trod away as Syri lets out a loud moan, doing your best to ignore it for her sake.");
			addButton(0, "Next", crew);
		});

		return;
	}

	// Add real follower stuff here
	clearMenu();
	clearOutput();

	output("hah. no.");

	addButton(0, "Next", crew);
}

public function interruptSyrisPornWatching():void
{
	clearMenu();
	clearOutput();
	showSyri(true);

	output("You enter the room and the first thing you hear is, oddly, Penny.");
	output("\n\n<i>\"Uuuuuhhhhnnnn,\"</i> Penny groans. <i>\"Oh, fuck, I love how tight it is…\"</i>");
	output("\n\nYou raise your eyebrows at the situation before you. You've heard that line before -- it's from the video Penny sent you a little while back, of her using Syri's biona-puss as a masturbation toy for her stream watchers. Now Syri is bent over her own laptop, watching the video and fiercely biting her lower lip, a low growl of pleasure coming from her throat.");
	output("\n\n<i>\"Nnn- nnngggh!\"</i> Syri grunts, her right hand vigorously rubbing and squeezing at her bright red cock. <i>\"Ggg- hhfuck!\"</i>");
	output("\n\nYou get a front seat view as her eyes close and she throws her head back, thrusting her hips forward as white spunk begins to pump from her throbbing tip. Her knot pumps itself up with every rough ejaculation, the sensation sending wild wobbles through her legs. Wow, she's <i>into</i> this.");
	output("\n\nYou give her enough time to be done with it all, only tilting your head down to her level and smiling when she's doubled over on her bed and moaning quietly.");
	output("\n\n<i>\"Hi, Syri,\"</i> you greet her.");
	output("\n\n<i>\"Steele!\"</i> she yelps, sitting up with eyes as wide as saucers. <i>\"Jeez, you gave me a fright…\"</i>");
	output("\n\n<i>\"Sorry, just something I do,\"</i> you say, shrugging and spreading your arms. <i>\"Can't seem to help myself when I hear a crewmember moaning out loud.\"</i>");
	output("\n\n<i>\"Well, I can hardly blame you for that,\"</i> Syri says with a smirk, closing her laptop. <i>\"I </i>do<i> sound pretty sexy if I say so myself.\"</i>");
	output("\n\n<i>\"You do,\"</i> you agree, nodding at the computer. <i>\"It's a nice video, right? Saw it myself not too long ago.\"</i>");
	output("\n\n<i>\"Wait - she sent it to </i>you<i>?! Oh, my goood…\"</i> Syri moans in despair, rubbing her face as she realizes you know all about what she's getting off to. <i>\"That girl, I swear…\"</i>");
	output("\n\n<i>\"Well, I thought it was hot,\"</i> you say, shrugging and smiling. <i>\"Plus, only Penny wouldn't figure out what you were going to do with the footage later.\"</i>");
	output("\n\n<i>\"Well… true,\"</i> Syri admits, biting her lip. <i>\"I do tune in sometimes… just casually, I mean! Gah! Ugh, why do I even open my mouth?\"</i>");
	output("\n\n<i>\"Right,\"</i> you say, smiling wider. <i>\"Well, none of this is really my business.\"</i> You pat the despondent pup on the head. <i>\"No need to be ashamed, just have some fun. Okay?\"</i>");
	output("\n\n<i>\"Okay,\"</i> she huffs, taking a few seconds before she nods. <i>\"Okay. Thanks for not making it weird, [pc.name].\"</i>");
	output("\n\n<i>\"Sure thing,\"</i> you say, ruffling her hair. <i>\"See you 'round, Syri. And next time, ask if I wanna join in!\"</i>");
	output("\n\nWith that, you leave her in her room to clean herself up.");

	flags["SYRI_CAUGHT_PENNYBATING"] = 1;
	pc.removeStatusEffect("Syri Pennybating");

	addButton(0, "Next", crew);
}