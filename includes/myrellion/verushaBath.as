/*
 *	verusha and stuff
 *	
 * Verusha In Myrellion - status effect 
*/

//Someday this bust will be real
public function showArmoredVerusha():void
{
	author("Doots");
	showBust("VERUSHA");
	showName("\nVERUSHA");
}

public function verushaWasInMyrellion():void
{
	flags["BATHED_VERUSHA"] = 1;
	flags["VERUSHA_APPEAR_DISABLE_TILL"] = GetGameTimestamp() + 2*24*60;
	rooms[currentLocation].removeFlag(GLOBAL.NPC);
}

public function verushaMyrBonus():Boolean
{
	if (!pc.hasGenitals()) return false;
	else if (!pc.hasLegs()) return false;
	else if (rand(100) != 0) return false;
	else if (pc.tallness > 9*12) return false;
	else if (flags["BATHED_VERUSHA"] != undefined) return false;
	else if (flags["SEXED_VERUSHA"] == undefined) return false;
	else if (flags["VERUSHA_PAST_TALK"] == undefined) return false;
	else if (flags["VERUSHA_RACE_TALK"] == undefined) return false;
	else if (flags["VERUSHA_PIRATES_TALK"] == undefined) return false;
	else if (flags["VERUSHA_MERCENARY_TALK"] == undefined) return false;
	//DISABLE HERE AFTER VERUSHAQUEST

	clearMenu();
	clearOutput();
	showName("\nARGUMENT!");
	showBust("VERUSHA", "MYR_RED_GUARD");
	
	output("You hear some kind of argument happening in a nearby alleyway, so you glance towards it. It's just some hyena-morph arguing with a red myr. A few seconds later you realize it's not just any hyena morph - it's Verusha. While she's wearing a rather heavy-looking suit of armor instead of her usual topless look, there's no denying it. The height, the voice, the cybernetic limbs - it's definitely her.");
	output("\n\nThe argument between Verusha and the red myr is getting rather heated, but before things can escalate any further, the myr pulls out a small bag which Verusha snatches from her. This seems to satisfy Verusha as she pockets the bag and turns away from the red officer.");
	output("\n\nNow would be an opportunity to talk to her if you want to.");
	
	rooms[currentLocation].addFlag(GLOBAL.NPC);
	generateMap();
	
	addButton(0, "Talk", verushaMyrTalk);
	addButton(1, "Nah", verushaMyrNoTalk);
	
	return true;
}

public function verushaMyrTalk():void
{
	clearMenu();
	clearOutput();
	showArmoredVerusha();
	processTime(2+rand(3));
	
	output("<i>\"Hey, Verusha, over here!\"</i> you yell at her, waving as she turns her attention towards you.");
	output("\n\nShe walks towards you, pushing a couple of myr girls out of her way. <i>\"What are you doing around here, Steele?\"</i> she asks when she gets close enough.");
	output("\n\n<i>\"" + (reclaimedProbeMyrellion() ? "Just chasing some alien tail." : "Looking for one of my father's probes.") + "\"</i> you answer. <i>\"What was that argument about?\"</i>");
	output("\n\n<i>\"The bug-bitch refused to pay the agreed amount, saying that I didn't complete the job properly,\"</i> she growls, <i>\"but no need for you to worry about that.\"</i> She scratches her chin, <i>\"Say, Steele, since I have done my job... would you care to go to that bathhouse? I've heard some good things about it but haven't had a chance to try it out myself.\"</i>");

	addButton(0, "Bath House", verushaMyrBathTime);
	addButton(1, "No", verushaMyrNoBath);
}

public function verushaMyrNoTalk():void
{
	clearMenu();
	clearOutput();
	author("Doots");
	
	output("You have your own plans, so you let Verusha get on her own way. Soon she's lost to the crowd, well, as much as someone who towers over most myr can be. Since you have no reason to stay, you take your leave as well.");

	verushaWasInMyrellion();
	
	addButton(0, "Next", mainGameMenu);
}

public function verushaMyrNoBath():void
{
	clearMenu();
	clearOutput();
	showArmoredVerusha();
	processTime(1);

	output("<i>\"Well, It's your loss,\"</i> she shrugs, <i>\"I suppose I should get going then. I'll be back on Tarkus in a couple of days, so you can come and get fucked if you feel like it.\"</i> she cackles as she turns to walk away. Soon she's out of your eyesight so you decide to move on as well.");
	
	verushaWasInMyrellion();
	
	addButton(0, "Next", mainGameMenu);
}

public function verushaMyrBathTime():void
{
	clearMenu();
	clearOutput();
	showVerusha(true);
	processTime(15+rand(46));
	
	output("<i>\"Sounds good,\"</i> you tell her.");
	output("\n\nVerusha is more talkative than usual. She still doesn't really talk about herself but she shares some info on employers and jobs she's had recently. You're surprised at how many of her employers talk openly about the job when she's around.");
	output("\n\nSoon you get to the bath house. Verusha opens the door for you. <i>\"Bitches first,\"</i> she chuckles.");
	output("\n\nYou roll your eyes and step inside.");
	output("\n\nThe gold matron at the desk turns as you approach her. <i>\"A private bath for two,\"</i> Verusha says, handing some federation silver to the matron.");
	output("\n\nAnother sister of the order comes to lead the two of you to a free bath. " + (pc.isNude() ? "Since you are already naked, you just put your codex away before heading straight to the pool" : "You store your [pc.gear] into the chest provided to you before heading to the pool") + ". As you settle yourself into the hot pool you can hear Verusha swearing in the changing room. It sounds like she's having issues with her gear.");
	output("\n\nSoon the hyena joins you in the bath. She sighs in contentment as she lowers herself into the pool. <i>\"Damn, this is good. Now I know why everyone was recommending this place to me.\"</i> Before you can react, Verusha pulls you into her lap. <i>\"I doubt that I'll get to do this again anytime soon, or ever, so I want to make this special. After all, it's not every day I get to relax with someone who I...\"</i> she trails off. <i>\"With someone... with someone who's not a complete asshole.\"</i> You feel the tip of Verusha's tapered member pressing against your [pc.ass]. As Verusha's dick hardens against your behind, she reaches for the box she brought along. She opens the box and grabs a cigar and a lighter. Putting the cigar between her teeth, she lights it and takes a long drag of it before breathing out. The smoke reaches your nose, but instead of making you cough, the smoke makes your muscles relax.");
	output("\n\nBy now, Verusha's shaft is at full mast. You bite your [pc.lipChaste] before giving your behind a little bounce, dragging your ass cheeks against her shaft. <i>\"Wait a sec,\"</i> Verusha grunts as you rub yourself against her rock-hard member. She stands up and grabs a condom from the box. You give her a quizzical look as she wraps her boner in latex. <i>\"What? I'm taking a bath, I don't want to get dirtier.\"</i>");
	output("\n\n<i>Fair enough</i> you think as you sit back down into her lap. Verusha pulls you close, sandwiching her cock between your back and her stomach.");
	output("\n\nWith her length squeezed between two warm bodies, she starts gently thrusting, creating small waves in the pool. Not leaving you out, Verusha " + (pc.hasCock() ? "grabs your [pc.cock] with her metallic hand" : "starts fingering your [pc.pussy] with her metallic fingers") + ". Surprisingly she takes her time, slowly " + (pc.hasCock() ? "stroking your shaft" : "fingering your slit") + ". The grinning hyena hooks her muzzle over your shoulder, holding you even tighter against her body. You feel her member violently throbbing against your behind. She's on quite a hair trigger today, it seems. As if sensing your thoughts, she breaths into your ear, <i>\"I haven't had a chance to jack off in a while, and seeing all those gold myr slaves with their massive tits isn't helping.\"</i> You can feel her balls throb against your [pc.ass] as she mentions massive gold titties.");
	output("\n\nShe pulls her hand away from your " + (pc.hasCock() ? "[pc.cock]" : "[pc.pussy]") + " and instead grabs your [pc.thighs], lifting you briefly above the water before letting you down so that her cock rests between your [pc.thighs]. <i>\"I was hoping that I get to fuck one of those goldies, but since your slutty ass came over I can forget about them,\"</i> she grunts as she starts to fuck your thighs.");
	output("\n\nHer fucking gets progressively faster, starting from a lazy rubbing and escalating into a rough pounding that creates waves in the pool. Her balls pull up and her knot gets bigger with each beat of her heart. She's right on the edge of her orgasm. With a final thrust and a loud moan, she pulls your [pc.thighs] against her sheath as cum shoots forth into the head of the condom. Her now fully inflated knot pulses between your legs as the tip of the condom expands like a balloon. The cum-bubble keeps on growing. Soon it's at the size you'd expected, but there seems to be no end to her cum.");
	output("\n\nDamn! She really is pent up.");
	output("\n\nWhen her orgasm finally comes to an end, she reclines against the edge of the pool, resting from her orgasm. <i>\"That was grand, almost worth the wait.\"</i> She sighs as she snubs her cigar. You climb up off of her lap, allowing her to pull her condom off. She ties the prophylactic off before lifting it out of the pool. You sit down on the edge of the pool as Verusha gets back into the water. She pushes you gently so you're laying on your back. <i>\"Just lay back and enjoy,\"</i> she whispers while breathing against your " + (pc.hasCock() ? "[pc.cock]" : "[pc.pussy]") + ". You gasp as her tongue drags against your sensitive flesh.");

	if (pc.hasCock()) output("\n\nYou moan as Verusha's muzzle envelops your [pc.cock]. You want to fuck her it but you don't know if that would be wise. She slowly drags her muzzle up to your [pc.cockHead] before letting it out with a pop and taking it back in. You decide to throw caution to the wind and grab her head before thrusting your hips upwards. Verusha looks at you as you continue to pummel your [pc.sheath] against her muzzle, you can't tell what she's thinking, but right now you don't really care if she's pissed since she's letting you face fuck her freely.");
	else output("\n\nVerusha spears your hot tunnel with her tongue. You bite your lip and glance at Verusha; she looks damn sexy between your legs, munching away at your pussy. You want to wrap your legs around her head and push her into your cunt, but you're not sure if she'd appreciate it. When her nose bumps against [pc.oneClit], you decide to risk it. You wrap your legs around her head, pulling her tightly against your [pc.pussy]. You moan as Verusha's muzzle sinks into your cunt as you press her against it.\n\nA moment later, she pulls her furry muzzle out of your cunt with a sloppy smile, making you giggle. She flashes you a wink before getting back to business.");

	output("\n\nYou're surprised at how good Verusha is at oral. For someone who doesn't care about someone else's pleasure, she pretty good at pleasuring others. You're getting closer to your own orgasm with each passing second. At this rate, you're going to cum soon.");

	if (pc.hasCock()) output("\n\nYou gasp as one of Verusha's fingers suddenly penetrate your asshole up to her knuckle. Her finger wiggles around your behind, seeking that cum button hidden inside your ass that'll melt you with pleasure. When she finds said pleasure spot, she gives it a thorough one-finger massage, casually kneading it. That's enough to make you bust your nut straight down her throat. She keeps swallowing your [pc.cumNoun] without stopping" + (pc.cumQ() > 200 ? " until suddenly she pulls your [pc.cock] out of her throat and aims your extra surges to your side." : "."));
	else output("\n\nYour breath catches in your throat as you feel a pinching sensation on your clit; your [pc.girlCum] " + (pc.isSquirter() ? "splatters over" : "soaks into") + " her muzzle. She laps at your pussy, making sure that there's nothing left.");

	output(" Verusha licks her chops. <i>\"Don't think this will become a regularity; next time you're going to be the one sucking my dick.\"</i> A playful yet possessive growl follows.");
	output("\n\nYou spend the next few minutes drying each other off before getting clothed again. Stepping outside, Verusha speaks up, <i>\"I'll be back on Tarkus in a couple of days if you want to fuck some more.\"</i>");
	output("\n\nThat definitely sounds like a good idea.");
	
	generateMapForLocation("831");
	verushaWasInMyrellion();
	flags["BATHED_VERUSHA"] = 2;
	IncrementFlag("SEXED_VERUSHA");
	pc.orgasm();
	pc.shower();
	
	
	addButton(0, "Next", function():void
	{
		moveTo("830");
		mainGameMenu();
	});
}