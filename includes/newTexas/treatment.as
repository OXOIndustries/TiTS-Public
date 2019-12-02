import classes.Characters.PlayerCharacter;
import classes.StorageClass;
// Main info found in items -> Misc -> Treatment

// =========================================
//			TABLE O CONTENTS
//	Ctr + F the following to jump to
//	the correct section.
//		1. Amazon Treatment Section
//		2. Female Treatment Section
//		3. Male Treatment Section


/*
// "Treated" - Main, permanent status effect
VARIABLE DEPENDING ON GENDER
0 - Girl Mode:
	v1 - boob size result
	v2 - horn size result
	v3 - lip size result
	v4 - ball size result
1 - Male Mode:
	v1 - boob size result
	v2 - horn size result
	v3 - cock mod
	v4 - ball size result
4 - Amazon Mode:
	v1 - boob size result
	v2 - horn size result
	v3 - cock mod
	v4 - milky y/n

Have a second status to store more shit.
// "The Treatment"
v1 - Gender settings.
* 0 - girl mode
* 1 - dude mode
* 2 - "cum-cow" - herm/neuter girlmode with male dick boosts.
? 3 - herm/neuter doublemode - all male and female procs.
* 4 - herm/neuter amazon - male perks + boob/lactation boosts.
? 5 - herm girlmode + double dick/cum boosts.
? 6 - herm girlmode + dick shrinking to almost nothing.
* 7 - faux-cow
v2 special variants
v3 hour counter

// Special variants - girls with bigger horns (size 5)!
*/
public static const TREATMENT_GAIN_TARGETS:Array = [50, 52, 56, 62, 71, 86, 100, 120, 147, 165];

private function treatmentHourPrint(treatedHours:int, startHours:int):int
{
	return ((treatedHours - startHours - 1) * 60);
}
public function treatmentHourProcs(totalHours:int, effect:StorageClass):void
{
	if(effect == null) return;
	
	// Fix for maximum hours.
	if(totalHours > 168) totalHours = 168;
	
	var startHours:int = effect.value3;
	effect.value3 += totalHours;
	
	var treatedHours:int = startHours + totalHours;
	if(treatedHours > 168) treatedHours = 168;
	
	var numHornAttempts:int = 0;
	var numHornGains:int = 0;
	var hornTimestampStride:int = 0;
	
	var x:int = 0;
	var i:int = 0;
	
	// Amazon Effects
	// 1. Amazon Treatment Section
	if(effect.value1 == 4)
	{
		if(treatedHours <= 48)
		{
			pc.libido(1 * Math.floor((treatedHours - startHours) / 2));
		}
		
		// 1
		if(startHours < 2 && treatedHours >= 2)
		{
			if(pc.hasVagina())
			{
				AddLogEvent("Well, you’ve taken the Treatment, and you don’t feel different <i>at all</i>. No giant cow-boobs", "passive", treatmentHourPrint(2, startHours));
				if(pc.biggestTitSize() >= 6) ExtendLogEvent(", more than usual");
				ExtendLogEvent(", no inexplicable urge to start talking like a slutty hillbilly and sucking every dick in sight. You’re almost disappointed that you haven’t started gushing milk or climaxing hard enough to black out. Then again, maybe that’s the Treatment talking? Nahhh.");
			}
			else
			{
				AddLogEvent("You catch yourself daydreaming about sunbathing at one of the fancy resorts Dad sometimes let you accompany him to. You cast it aside with a wistful shake of your head. Those were better times.", "passive", treatmentHourPrint(2, startHours));
			}
		}
		
		// 2
		if(startHours < 4 && treatedHours >= 4)
		{
			AddLogEvent("You finish eating a small snack, only to immediate start into another. You shouldn’t be that hungry; you definitely shouldn’t have a gut growling like a starving jaguar, but you do. You shovel down two more ration bars in rapid succession, finally achieving a measure of relief from your cravings. Was it the Treatment, driving your insatiable appetite? You haven’t noticed any changes to your body yet, but would you?\n\nYou do a quick body-scan with the Codex to be sure. Everything comes back normal, except for a little over-eating induced bloating.", "passive", treatmentHourPrint(4, startHours));
		}
		
		// 3
		if(startHours < 6 && treatedHours >= 6)
		{
			AddLogEvent("You belch loudly, not remembering your manners until it’s too late to do anything about it. A sheepish look around you is all you manage before your shame melts away. It was just a burp. After eating that much, you’re lucky there wasn’t more coming up. You belch again, just to settle your stomach, enjoying the way it rumbles out of your chest. Not bad. Let’s see a slutty cow or brazen bull do that!", "passive", treatmentHourPrint(6, startHours));
		}
		
		// 4
		if(startHours < 8 && treatedHours >= 8)
		{
			AddLogEvent("Rubbing a sore spot in your shoulders, you consider the evidence stacking up around you. Empty wrappers from your seemingly endless snacking crinkle noisily in your pack. You don’t feel different, just hungry. Sure, the Codex articles on the Treatment might mention an increased appetite in the early stages of the transformation, but this is nuts. And you don’t even feel different mentally! You haven’t caught yourself thinking like a cow-" + pc.mf("boy", "girl") + " at all!\n\nBriefly, you consider lodging a complaint with the government of New Texas. The Treatment is supposed to make you happier and sluttier, not a glutton.", "passive", treatmentHourPrint(8, startHours));
		}
		
		// 5
		if(startHours < 10 && treatedHours >= 10)
		{
			AddLogEvent("Maybe the sexual urges that the Treatment promises aren’t as all-consuming as they appear from the outside. Maybe you have to work for them. Maybe you have to pin them down like a squirming faux-cow and force them to please you. Grinning, you dwell on the thought, imagining ", "passive", treatmentHourPrint(10, startHours));
			if(flags["MET_CAMERON"] != undefined) ExtendLogEvent("Cameron");
			else ExtendLogEvent("some prissy little farm boy");
			ExtendLogEvent(" squirming and squirting beneath you. Yeah... that seems right.");
			pc.lust(4);
		}
		
		// 6
		if(startHours < 12 && treatedHours >= 12)
		{
			AddLogEvent("All that eating must be paying off! You feel like you have enough energy to propel you all the way to the nearest warpgate. Maybe you should start working out. With all the calories floating around inside you, you could probably put on some muscle pretty easily. You could be the biggest, baddest cow on the ranch, pinning down dumb sluts and shoving your face between their thighs, milking them for the real honey.\n\nOooh, now there’s an idea that leaves you shivering! You bet those whores would love every minute of it too.", "passive", treatmentHourPrint(12, startHours));
			pc.lust(4);
		}
		
		// 7
		if(startHours < 14 && treatedHours >= 14)
		{
			AddLogEvent("You frown as a worrisome thought comes to your attention. What if you aren’t getting the normal Treatment effects? What if this is something else? You haven’t caught yourself ", "passive", treatmentHourPrint(14, startHours));
			if(pc.mf("","lady") == "lady") 
			{
				ExtendLogEvent("giggling at all, for one, and for another, the idea of sucking cock only appeals if you’re pinning the lucky bull to the bed, somehow outmuscling one of the Texan studs.");
				if(pc.hasCock()) ExtendLogEvent(" Imagine if you had the flexibility to ream his ass <i>and</i> still suck his dick. You’d be milking <i>him</i>!");
				else ExtendLogEvent(" Imagine if you got a hardlight strap-on to ream his ass with. You’d get to milk him for every drop he’s worth!");
			}
			else 
			{
				ExtendLogEvent("daydreaming about sucking on big milky boobs or munching oozy, wet cow-girl snatch. To be honest, the idea only really appeals to you if you imagine your own boobs pinning her down.");
				if(pc.hasCock()) ExtendLogEvent(" Imagine if you could eat her out while she sucks on your " + pc.nipplesDescript(0) + ". Maybe you could even coerce a faux-cow into fucking her at the same time to add a little extra flavor.");
			}
			ExtendLogEvent("\n\nWhat were you worried about again? You idly rub your warmed loins and shrug, finding it difficult to care. It must not have been that important.");
			pc.lust(5);
		}
		
		// 8
		if(startHours < 16 && treatedHours >= 16)
		{
			AddLogEvent("Your nostrils flare, delivering a symphony of scents to your mind. You can pick out your own natural odor with ease, and not in an unpleasant way. It’s like breathing in an aromatic version of your name. You’re fairly certain that you could identify flowers with a simple whiff and other people with only slightly more effort. Are the Treated cows and bulls of New Texas all like this? No wonder they can say so much with so little. They’re communicating on a whole other level!", "passive", treatmentHourPrint(16, startHours));
			if(pc.hasCock())
			{
				ExtendLogEvent("\n\nFor instance, you can smell your " + pc.cocksDescript() + ". You can tell just how aroused you are, whether ");
				if(pc.balls > 1) ExtendLogEvent("your balls are in need of relief");
				else ExtendLogEvent("you’re in need of relief");
				ExtendLogEvent(" or freshly sated. You could probably pick out the most virile man in the room just by walking past him.");
			}
			else if(pc.hasVagina())
			{
				ExtendLogEvent(ParseText("\n\nFor instance, you can smell your [pc.vaginas]. You can tell just how aroused you are, whether you’re wet with need or oozing a mate’s genetic material. You could probably pick out the friendliest, sluttiest girl in the room, just by walking past her."));
			}
			pc.lust(5);
		}
		
		// 9
		if(startHours < 18 && treatedHours >= 18)
		{
			AddLogEvent("In a slow moment, you let yourself daydream, imagining just how things will be once you knock some sense into your cousin and claim your birthright. It starts out as little more than a lead-up to your economic rewards, but the longer you dwell on the imaginary scenario, the less you care about the credits and the more you look forward to putting your cuz in [rival.hisHer] place. The look on [rival.hisHer] face will be priceless.", "passive", treatmentHourPrint(18, startHours));
		}
		
		// 10
		if(startHours < 20 && treatedHours >= 20)
		{
			AddLogEvent(ParseText("The Treatment is doing a number on you. You’re sure of it now. It shows itself in idle thoughts in fantasies and in your knee jerk reactions to the littlest inconveniences. You bumped your [pc.leg] earlier today and nearly flew into a rage. If it had been a table, you likely would’ve smashed it"), "passive", treatmentHourPrint(20, startHours));
			if(pc.AQ() > pc.PQ()) ExtendLogEvent(", or at least shot it up or something");
			ExtendLogEvent(". If it was a person? You shudder,");
			if(pc.hasCock() && pc.hasVagina()) ExtendLogEvent(" hardening and moistening");
			else if(pc.hasCock()) ExtendLogEvent(" hardening");
			else ExtendLogEvent(" moistening");
			ExtendLogEvent(" at the thought. The urges that well up in your brain are primal, powerful things. They demand satisfaction before you even have a chance to identify them, let alone control them.\n\nThere’s no way that you got the cow-girl version of the Treatment, but it doesn’t quite seem like bull variant either. What’s happening to you?");
		}
		
		// 11
		if(startHours < 22 && treatedHours >= 22)
		{
			AddLogEvent("Something occurs to you. You’re getting more confident. You’re sure of it. If you walked into a bar on the wrong planet, you’d look everyone you met in the eye without thinking twice about it. Best case scenario, you’d pick yourself up a punky lay. Worst case scenario, you get to shut up a few punks with excess ego.\n\n...You hope that the Treatment gives you the muscles to back up the newfound confidence. Otherwise you’re going to have to be agile as hell.", "passive", treatmentHourPrint(22, startHours));
		}
		
		// 12
		if(startHours < 24 && treatedHours >= 24)
		{
			AddLogEvent("Day one of the Treatment may have started out slow, but there’s no denying it now. Every woman you see, you imagine with bigger, milkier boobs. Every man you see, you find yourself scoping out. Just how long is his trouser snake? Just because he doesn’t have a bulge doesn’t mean he isn’t a fantastic grower. And the ladies - what do they taste like? Tangy? Sweet? Your mouth waters at the mere thought.\n\nThe part of you that worries about this stuff is surfacing less and less, letting you actually enjoy the changes as they happen. Fuck, how did you get anything done when you were being so concerned all of the time?", "passive", treatmentHourPrint(24, startHours));
			pc.lust(10);
		}
		
		// 13 - Pussies only
		if(startHours < 26 && treatedHours >= 26)
		{
			AddLogEvent(ParseText("You stretch out and spend a minute checking over your equipment. Sure, there’s a whole galaxy of challenges ahead of you, but you’re the [pc.guyGirl] to get it done. Besides, that galaxy full of challenges is the same galaxy that’s full of extremely fuckable aliens."), "passive", treatmentHourPrint(26, startHours));
			pc.lust(2);
		}
		
		// 14
		if(startHours < 28 && treatedHours >= 28 && !pc.hasPerk("Sexy Thinking"))
		{
			AddLogEvent("You catch yourself glaring at your Codex, like the little tablet did something wrong. All it did was hitch for a second while loading up an extranet page, sometime entirely beyond its control. Still, someone should be held accountable. Perhaps the local relay technicians or the routing center upstream. You make a mental note to look into it down the line. Maybe you can give someone a tongue-lashing over it. And maybe if they take care of it well enough, you can give them an entirely different kind of tongue-lashing.\n\nThe thought doesn’t even make you blush.", "passive", treatmentHourPrint(28, startHours));
			pc.lust(5);
			// Gain Sexy Thinking - gives sexiness bonus equal to (100-IQ-25)/20 + (100-WQ-25)/20
			ExtendLogEvent("\n\n(<b>Perk Gained: Sexy Thinking</b> - Increases tease damage inversely to how high willpower and intelligence are.)");
			pc.createPerk("Sexy Thinking",0,0,0,0,"Boosts tease damage more the dumber and less willful you are.");
		}
		
		// 15
		if(startHours < 30 && treatedHours >= 30)
		{
			AddLogEvent("Stars above, there is a serious ", "passive", treatmentHourPrint(30, startHours));
			if(pc.hasCock() && !pc.isCrotchExposed()) ExtendLogEvent(ParseText("tightness in your [pc.lowerGarment]. You take a look inside and find yourself more hard than you’ve been in a while, and just dribbling pre-cum all over the inside of your equipment. You let it snap closed and sigh. Either you’ve got to find a partner fast, or it’s time to vent some of the pressure building in your [pc.balls]. One way or the other, you’re due to blow a load."));
			else if(pc.hasCock())
			{
				ExtendLogEvent("hardness in your groin. You take a look down and find yourself more hard than you’ve been in a while, dribbling pre-cum down your length");
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				ExtendLogEvent(". Either it’s time to find a partner or time to jack off. Either way, you need to blow a load.");
			}
			else
			{
				ExtendLogEvent("ache of desire welling up within you. Fuck, you’re seriously ");
				if(pc.hasVagina()) ExtendLogEvent("wet");
				else ExtendLogEvent("horned up");
				ExtendLogEvent(". When did that happen? Screw it; it doesn’t matter. If you only had a dildo... or an eager little cowboy handy, you could just reach down and force him inside for a quick, messy orgasm. And then another. And another.");
				pc.maxOutLust();
			}
		}
		
		// 16
		if(startHours < 32 && treatedHours >= 32)
		{
			AddLogEvent(ParseText("You look yourself over and sigh, evaluating everything that has changed thus far. You’re more aggressive for sure, a little less self-conscious, and getting more libidinous by the minute. Thankfully, the extra lust doesn’t seem to be impacting your ability to focus - just <i>how</i> you focus. Little sensuous details pop out at you in every scenario, alerting you to erotic possibilities you may have never considered mere days ago. Yes, you’re going to get your inheritance, but the real prize isn’t the money so much as the opportunities it presents.\n\nJust like the aliens you encounter, this quest is ripe with lustful possibilities - never-ending line of hard dicks and wet pussies juicing themselves at the thought of a chance with you. A smirk curls the corners of your [pc.lipsChaste] as you consider what’s ahead of you, a Treated [pc.boyGirl] on a mission."), "passive", treatmentHourPrint(32, startHours));
		}
		
		// 17
		if(startHours < 34 && treatedHours >= 34)
		{
			AddLogEvent("You idly wonder if you should try and squeeze some gym equipment onto your ship - or make a stop back at the New Texan gym. Working out sounds almost... fun, like something you’d do to blow off steam, only without the whining you’d expect from a horned-up faux cow.\n\nYeah. That’d be nice. Maybe you could even get a faux cow and a muzzle (to keep him quiet), then bench press the little bitch, dropping his dick into your mouth with each rep. A reward for both of you. You’d know when you’ve had enough when he’s had enough.", "passive", treatmentHourPrint(34, startHours));
			if(pc.PQ() >= 70) ExtendLogEvent(" Mmm... if only you were that strong! You have so much work to do!");
			ExtendLogEvent(ParseText(" Oooh, and you could do squats onto a cow-girl’s face. You would know you’d dropped low enough when your [pc.vagOrAss] hit tongue.\n\nMaking up your mind, you decide to give the gym a try at your earliest convenience."));
		}
		
		// 18
		if(startHours < 36 && treatedHours >= 36)
		{
			// Herm
			if(pc.isHerm())
			{
				AddLogEvent("You growl in dissatisfaction. You can’t seem to quell the rioting heat in your loins. Neither your rock-hard cock", "passive", treatmentHourPrint(36, startHours));
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				ExtendLogEvent(" or leaky, eager cunt");
				if(pc.totalVaginas() > 1) ExtendLogEvent("s");
				ExtendLogEvent(ParseText(" will give you a break from near-constant thoughts of sex. Even your [pc.nipples] are "));
				if(pc.hasDickNipples()) ExtendLogEvent("jutting out of their sheaths, ready to be thrust inside something");
				else if(pc.hasLipples()) ExtendLogEvent("drooling");
				else if(pc.canMilkSquirt()) ExtendLogEvent("leaking");
				else if(pc.hasInvertedNipples()) ExtendLogEvent("pebbly and sensitive");
				else ExtendLogEvent("hard");
				ExtendLogEvent(". The worst part is that you can’t seem to make up your mind as to what you want. One moment you want a soft body to thrust inside of, to mount and hump until the poor thing is reduced to a quivering puddle of delirious moans. The next, you want a big fat dick to climb onto - something virile enough to keep up with you yet weak enough to give into your every whim.");
			}
			// Cock
			else if(pc.hasCock()) 
			{
				AddLogEvent(ParseText("You growl in dissatisfaction. You can’t seem to quell the rioting heat in your loins or the way it keeps your [pc.cocks] so iron-hard with thoughts of near-constant sex. Even your [pc.nipples] are "), "passive", treatmentHourPrint(36, startHours));
				if(pc.hasDickNipples()) ExtendLogEvent("jutting out of their sheaths, ready to be thrust inside something");
				else if(pc.hasLipples()) ExtendLogEvent("drooling");
				else if(pc.canMilkSquirt()) ExtendLogEvent("leaking");
				else if(pc.hasInvertedNipples()) ExtendLogEvent("pebbly and sensitive");
				else ExtendLogEvent("hard");
				ExtendLogEvent(". You briefly consider forcing yourself upon the next person you meet but immediately discard the thought. Why would you stoop to something so... so... uncivilized when there’s plenty of willing partners out there?");
			}
			// Pussah
			else if(pc.hasVagina())
			{
				AddLogEvent(ParseText("You growl in dissatisfaction. You can’t seem to quell the rioting heat in your loins or the constant dripping. [pc.EachClit] is achingly hard, like a bullet on a hair-trigger. The weirdest part is that you don’t really crave penetration - at least not your own. No, you want to push yourself against someone soft and yielding, really grind your weeping slit"), "passive", treatmentHourPrint(36, startHours));
				if(pc.totalVaginas()) ExtendLogEvent("s");
				ExtendLogEvent(" against them until you’re both covered in sweat and sexual effluvia, panting breathily with you on top.");
			}
			// Nothing
			else
			{
				AddLogEvent(ParseText("You growl in dissatisfaction. You can’t seem to quell the feeling of building eroticism or odd desires. Playing with your [pc.asshole] or [pc.nipples] just won’t be enough for you anymore. You want to be <i>fucked properly</i>, not just reamed. If only had a pussy, this would be so much easier... a nice, wet, welcoming hole to please your partners. You gently press at your [pc.asshole] and smile. It’s no cunt, but you bet you can make some wannabe stud melt inside."), "passive", treatmentHourPrint(36, startHours));
			}
			// Merge
			ExtendLogEvent("\n\nBesides, the real takeaway is just how hot and horny you’re able to get without going off. You’re able to sit there fantasizing about a pair of petite cow-boys with enormous dicks, imagining their delectible tools hardening down the legs of their jeans until the robust fabric shreds from the force of their engorging lust. Just two days ago, dwelling on something like this for so long would have driven you to masturbation. Today? You’re free to think of all the things you could do to them, all while continuing on your merry way. You suppose you’re getting better at it - being aroused that is. You could walk around ");
			if(pc.hasCock()) ExtendLogEvent("with a pant-straining stiffy for hours");
			else if(pc.hasVagina()) ExtendLogEvent("with soaked panties");
			else ExtendLogEvent("with overwhelming desire");
			ExtendLogEvent(" and still wait a few hours to find just the right playmate. It must be an effect of the treatment, turning you into some kind of sexual dynamo.\n\nYou aren’t even sure if you can be completely turned off any longer. Then again, do you want to be?");
			// Inhuman Desire +20!
			// Amazonian Needs +20 Min lust
			// Inhuman Desire +20 max lust.
			if(!pc.hasPerk("Inhuman Desire"))
			{
				ExtendLogEvent("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				ExtendLogEvent("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
			if(!pc.hasPerk("Amazonian Needs"))
			{
				ExtendLogEvent("\n(<b>Perk Gained: Amazonian Needs</b> - Your minimum lust is increased by 20.)");
				pc.createPerk("Amazonian Needs",20,0,0,0,"Increases minimum lust by 20.");
			}
			if(pc.lust() < 100) pc.lust(20);
		}
		
		// 19
		if(startHours < 38 && treatedHours >= 38 && pc.horns == 0)
		{
			AddLogEvent(ParseText("You spend a few minutes checking your forehead for horns. You should have horns, right? It feels like you should have horns. A horny [pc.boyGirl] should have horns."), "passive", treatmentHourPrint(38, startHours));
		}
		
		// 20
		if(startHours < 40 && treatedHours >= 40)
		{
			AddLogEvent("The idea that a little medipen filled with a few milliliters of fluid could somehow change your sexual preferences (and entire outlook) might have frightened you a little when this all started, but those concerns seem so silly now. It isn’t forcing you into anything. It’s just getting rid of the little walls in your head, the ones that might of stopped you from enjoying a cute bull-boy with a tree-trunk between his legs, or that might have thrown up objections to a cow-girl with two milk-dripping pussies for nipples. You can see the beauty in all of it.\n\nYou pull out your Codex, just to check. Surely there are limits to your interests, right? Pulling up a few of the more... sexual sites on the extranet, you get to work. This isn’t for masturbation. This isn’t for fun. This is a test.\n\nThat’s what you tell yourself, anyway.\n\nThe categories blow by one after another, each bringing a little more warmth to your loins: lubed up galotians wrestling in a vat of oil, burly leithan males leaning down to jack each other off, ausar girls in heat lapping at pussy like it’s an oasis in the desert. You drift into the realms of hyper-sexual gene-modded parodies of real bodies, pornstars who have spared no expense in making themselves as sexualized as possible. And it just makes you hotter.\n\nBy the time you remember to put the tablet away, your tongue feels dry", "passive", treatmentHourPrint(40, startHours));
			if(pc.hasVagina()) ExtendLogEvent(" and your loins wet.");
			else if(pc.hasCock()) ExtendLogEvent(" and your loins warm.");
			else ExtendLogEvent(" and your anus puckered.");
			pc.lust(13);
		}
		
		// 21
		if(startHours < 42 && treatedHours >= 42)
		{
			AddLogEvent("You check the chronometer app on your Codex, then check it again. Forty-two hours have passed since that one little prick. The mental changes should be mostly done in a half-dozen more. What then? An udder? No, that doesn’t feel right. ", "passive", treatmentHourPrint(42, startHours));
			if(pc.biggestTitSize() > 1) ExtendLogEvent("Bigger tits are definitely a possibility, of course. You heft one and squeeze, wondering if they really need to be any bigger.");
			else ExtendLogEvent(" Tits are a definite possibility. You gently knead your chest, wondering if it’ll start filling out soon, and if it does, how much?");
			ExtendLogEvent(" The waiting is the worst part!");
		}
		
		// 22
		if(startHours < 44 && treatedHours >= 44)
		{
			// Herms
			if(pc.isHerm())
			{
				AddLogEvent(ParseText("You find yourself idly rubbing at [pc.oneCock], curling your index finger down to gently press against "), "passive", treatmentHourPrint(44, startHours));
				if(pc.totalVaginas() > 1) ExtendLogEvent("a");
				else ExtendLogEvent("your");
				ExtendLogEvent(ParseText(" [pc.vagina]. It just happens on its own. At first, you might of tried to stop yourself or control it, but the more it goes on, the less reason you see to quit. The extra friction feels really, really <i>good</i> - like sex good, only without the rampaging drive to seek completion. And if it keeps you nice and wet for your next lay, why bother to stop?\n\nYou can handle it. Dealing with constant arousal is getting to be mostly automatic. Undergarments <i>should</i> be wet with pre and pussy juice. It’s practically their natural state. They slip and side so nicely when you’re adjusting them, and the scent functions a broadcast to anyone with a nose that you’re down for a good time. Assuming they can handle a firecracker like yourself.\n\nJust because you can endure arousal that would reduce lesser " + pc.mf("men","women") + " to a shuddering wreck doesn’t mean you’re an easy lay, however. If anything, it makes you a harder one. You’re pretty sure you can take more teasing than most people in the galaxy by now. You could probably stand in a cloud of aphrodisiacs for a few minutes and strut out with nothing more than a bit of extra wetness and extra hardness to show for it. Then you could toss the bastard responsible for the cloud inside... and fuck them into insensibility."));
			}
			// Cocks
			else if(pc.hasCock())
			{
				AddLogEvent(ParseText("You find yourself just kind of idly rubbing at [pc.oneCock] whenever you have a spare moment. At first, you’d stop yourself whenever it happened, but more and more, you don’t see the logic in stopping. It feels really good to have a little friction on your length, and if it keeps your body churning up a fresh load faster, who are you to complain? Your "), "passive", treatmentHourPrint(44, startHours));
				if(pc.cockVirgin) ExtendLogEvent("first");
				else ExtendLogEvent("next");
				ExtendLogEvent(" lay is going to thank you for being so ready for her, you’re sure of it.\n\nIt doesn’t even distract you that much, really. Dealing with arousal is an automatic thing for you now. Pre-soaked undies? You’re pretty sure you’d have no problem ignoring the sticky, moist feeling. Adjusting the fit of clothing to deal with your rigid length? Your hand is there anyway. It might as well keep you comfortable. And you can still sit there browsing the extranet with your other hand, or buying supplies... or grabbing a tit. Whatever really." + ParseText("\n\nThe important takeaway is that you’re so much better at being rock-hard than ever before. Before, you might’ve been desperate to climax, masturbating furiously. Now? You’ve learned to control it, to ride the tide of sexual desire like a cow[pc.boyGirl] on [pc.hisHer] steed. It’s empowering."));
			}
			// Cooches!
			else if(pc.hasVagina())
			{
				AddLogEvent(ParseText("You find yourself just kind of idly rubbing at [pc.oneClit] whenever you have a spare moment. At first, you’d stop yourself and blush, but more and more, you don’t see the logic in stopping. Your clit is there. It’s hard and wants touched. So you touch it. What’s the big deal? You aren’t masturbating, just keeping yourself ready is all. Why, everyone should be pleased that you’re keeping yourself so sexually ready all the time. Your lucky "), "passive", treatmentHourPrint(44, startHours));
				if(pc.vaginalVirgin) ExtendLogEvent("first");
				else ExtendLogEvent("next");
				ExtendLogEvent(" partner will be the one to reap the rewards of slippery-sweet sex, after all.\n\nYou don’t even really get distracted by it that much, really. The arousal burns like a pleasant heat in the back of your brain, spiking whenever your digits probe a particularly sensitive bundle of nerves, leaving the rest of your mind to do whatever mundane work it needs to do. You could probably file your taxes while a cute little faux-cow boy-toy kneels ");
				if(pc.legCount > 1) ExtendLogEvent(ParseText("between your [pc.legs]"));
				else ExtendLogEvent("down below");
				ExtendLogEvent(", putting a nice, wide bovine tongue to use, provided you had breaks for mind-shattering orgasms every now and again.");
				ExtendLogEvent("\n\nThe important takeaway is that you’re fucking amazing at being aroused now. Stimulation that would’ve morphed you into a mewling ball only makes you hotter and more capable of pleasure. It’ll take so much more teasing to bring you to the brink than ever before, but that just means you get to have bigger orgasms when you do. It’s win-win.");
			}
			// No Cooch!
			else
			{
				AddLogEvent(ParseText("You find yourself just kind of oddly clenching and unclenching your [pc.asshole]. Whenever you do, pleasant flashes of desire run through your body, slithering up your spine to wrap your brain in their sensuous warmth. Before taking the treatment, you’d be so turned on that you would probably be down on the ground, trying to stuff four fingers inside yourself. Now you can ride the arousal like your own personal steed, directing it but never denying it."), "passive", treatmentHourPrint(44, startHours));
				ExtendLogEvent("\n\nYou can only theorize that your brain is getting better and better at dealing with pleasure. The Treatment is making you more capable than ever before, even without normal genitalia. Why would anyone ever refuse such a gift?");
			}
			// All:
			// Inhuman Desire++
			if(!pc.hasPerk("Inhuman Desire"))
			{
				ExtendLogEvent("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				ExtendLogEvent("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
			pc.lust(13);
		}
		
		// 23
		if(startHours < 46 && treatedHours >= 46)
		{
			AddLogEvent("Momentarily bored, you try out a ‘moo.’ It doesn’t do much for you, not on its own. You suppose you aren’t going to be the type for submissive, idle moos. Maybe in the throes of passion you could slip one in edgewise, an unsubtle declaration that you’ve gone over the edge. At any other time? Fuck that. You’re going to be the one to make other cow-girls moo. You’ll be the one makes them beg to lick your boots, watching them submissively extend their tongues in between their plaintive lowing.", "passive", treatmentHourPrint(46, startHours));
			pc.lust(4);
		}
		
		// 24
		if(startHours < 48 && treatedHours >= 48)
		{
			AddLogEvent("You check your Codex’s chrono. It’s been 48 hours since your Treatment injection. That wasn’t that bad. You had worried that it would change who you were on the inside, but it didn’t change much, did it? Yeah, you’re a little more brash and a lot more horny, but you expected the latter. The former was an unexpected bonus. Instead of sounding like a cock-hungry cow-slut all the time, you’ve blossomed into an authoritative " + pc.mf("cow-bull", "queen bitch") + ". All in all, you’d say it’s a net positive.\n\nThere’s no doubt in your mind that you’ve contracted the so-called “Amazon” variant of the Treatment. The confidence, the domineering arousal... what else could it be?", "passive", treatmentHourPrint(48, startHours));
		}
		
		// ========================
		// MIND STUFF IS DONZO
		// FACIAL PRETTIES~
		// ========================
		if(pc.femininity < pc.femininityMax() && treatedHours >= 48 && startHours < 168)
		{
			// I'm not 100% sure this is exactly accurate as in the past, but it should be close as a start
			// Excel experimenting seems to agree that its pretty close tho
			var numRolls:int = Math.floor((treatedHours - 48 + 1) / 3);
			if (startHours >= 48) numRolls -= Math.floor((startHours - 48 + 1) / 3);
			
			for (i = 0; i < numRolls; i++)
			{
				// 1 - 3-5 points
				if(rand(3) == 0)
				{
					AddLogEvent("A shiver of warmth tingles on your lips. It radiates out into your jawbones as you sit there licking them, undoubtedly feminizing you.", "passive", treatmentHourPrint((startHours + (i * 3)), 0));
					x = 3+rand(3);
					pc.modFem(x);
				}
				// 2 - 5-7 points
				else if(rand(3) == 0)
				{
					AddLogEvent(ParseText("A gradual, insidious heat slowly suffuses the whole of your mouth. You gasp, only to have it seem to roll out with every exhalation, spreading to your cheeks and [pc.lips] first, then to your jaw and nose after. Getting girl"), "passive", treatmentHourPrint((startHours + (i * 3)), 0));
					if(pc.femininity >= 50) ExtendLogEvent("ier");
					else ExtendLogEvent("y");
					ExtendLogEvent(" feels surprisingly... nice.");
					x = 5+rand(3);
					pc.modFem(x);
				}
				// 3 - 8 - 11 points
				else if(rand(3) == 0)
				{
					AddLogEvent(ParseText("A whole body shudder works through you as you feel the transformative cocktail kick in. You can feel it in your cheeks and mouth, so warm you wonder if you’re glowing, spreading slowly across your [pc.face] as it feminizes it."), "passive", treatmentHourPrint((startHours + (i * 3)), 0));
					x = 8+rand(4);
					pc.modFem(x);
				}
				// 4 - 12-15 points
				else if(rand(2) == 0)
				{
					AddLogEvent(ParseText("The inside of your mouth is all tingly... but so are your lips! You purse them before pressing them together and sliding your [pc.tongue] between them. They feel like heated pads around the oral muscle. The sensation spreads outward through the whole of your [pc.face]. You can actually feel it changing!"), "passive", treatmentHourPrint((startHours + (i * 3)), 0));
					x = 12+rand(4);
					pc.modFem(x);
				}
				// 5 - 16-20 points
				else
				{
					AddLogEvent("You fail to stifle a gasp when a surge of white-hot pleasure spreads through your face. Your whole head feels like its practically glowing at this point, alight with electric buzzes of reforming flesh and remapped nerves. Your lips seem fuller and more sensitive, your jaw more svelte, and your nose cuter somehow.", "passive", treatmentHourPrint((startHours + (i * 3)), 0));
					x = 16+rand(5);
					pc.modFem(x);
				}
			
				// Announce when passing a threshold:
				// <= 90
				if(y <= 90 && pc.femininity > 90) ExtendLogEvent(ParseText(" <b>You can’t help but marvel at yourself when you look at your reflection. Your [pc.face] is the epitome of femininity. It’s jaw-droppingly girly. Your eyelashes are long and thick. Your nose is adorable. Even your lips look ready for a night on the town.</b>"));
				// <= 80
				else if(y <= 80 && pc.femininity > 80) ExtendLogEvent(" <b>Your eyelashes have gotten long and luxurious, your lips have gotten fuller, and even your nose looks cuter. You’re gorgeous.</b>");
				// <= 72
				else if(y <= 72 && pc.femininity > 72) ExtendLogEvent(ParseText(" <b>There’s no doubt about it. You’re definitely getting hotter. Your [pc.face] looks feminine and shapely, sure to draw attention.</b>"));
				// <= 65
				else if(y <= 65 && pc.femininity > 65) ExtendLogEvent(" <b>Checking yourself with your codex, you’re delighted to find that your cheekbones look positively pretty. You’re looking a lot cuter!</b>");
				// <= 55
				else if(y <= 55 && pc.femininity > 55) ExtendLogEvent(" <b>Your face is definitely starting to show touches of femininity at this point. Even your lips are a little fuller.</b>");
				// < 45
				else if(y < 45 && pc.femininity >= 45) ExtendLogEvent(ParseText(" <b>You check yourself out and discover that your [pc.face] is completely androgynous now. Your face alone isn’t going to tell anybody what gender you are, but if the Treatment keeps working....</b>"));
				// < 35
				else if(y < 35 && pc.femininity >= 35) ExtendLogEvent(ParseText(" <b>After looking at your [pc.face] in your codex’s holocam, you can only find a few hints of your masculinity left.</b>"));
				else if(y < 28 && pc.femininity >= 28) ExtendLogEvent(" <b>The profile of your face is getting less obviously masculine, but there’s still the matter of your somewhat angular jawline to contend with.</b>");
				else if(y < 20 && pc.femininity >= 20) ExtendLogEvent(" <b>You’re definitely getting a little less handsome from this stuff, but you’re still a long way from pretty.</b>");
				else if (y < 10 && pc.femininity >= 10) ExtendLogEvent(" <b>A check with your codex confirms your jaw is getting noticeably less square.</b>");
			}
		}
		// ========================
		// FACIAL PRETTIES OVER. ON
		// TO BOOOOOBS
		// ========================
		// Lactation
		// Lactation should be a 50% of the time proc for Amazons. They aren't all milky.
		if (startHours < 48 && treatedHours >= 48 && rand(2) == 0) pc.createStatusEffect("Milkazon", 0, 0, 0, 0, true, "Icon_Cow", "", false, 10080, 0xB793C4);
		
		if(treatedHours > 48 && pc.hasStatusEffect("Milkazon"))
		{
			pc.boostLactation(1 * (treatedHours - startHours));
		}
		
		// Once 100 is reached, unlock the Treated Milk perk.
		if(pc.milkMultiplier >= 100 && !pc.hasPerk("Treated Milk") && pc.hasStatusEffect("Milkazon"))
		{
			AddLogEvent(ParseText("You grow increasingly aware of how productive your [pc.breasts] are. The Treatment has given you the ability to produce so much!"), "passive", treatmentHourPrint(treatedHours, 0));
			if(pc.milkType == GLOBAL.FLUID_TYPE_MILK) ExtendLogEvent(" You squeeze a droplet onto a finger and try it, just to sample it. It tastes exactly like the freshest, most delicious milk you’ve ever tasted - way better than normal. No wonder New Texas is able to export so much milk; Texan cow-milk is amazing!");
			else ExtendLogEvent(ParseText(" You squeeze a droplet onto your finger to try it, amazed at how much richer the [pc.milk] tastes."));
			ExtendLogEvent(" Perhaps a mid-fuck snack will allow your lovers to keep up with you.");
			ExtendLogEvent("\n\n(<b>Perk Gained: Treated Milk</b> - Your milk tastes delicious, and milk production takes much longer to slow. The only way you’d stop producing is if you made a conscious effort to keep your roving hands off your milky nipples.)");
			pc.createPerk("Treated Milk",0,0,0,0,"Any milk you lactate tastes better, and you are less likely to stop lactating.");
		}
		
		// Tits 
		// to predetermined max. Many small changes.
		
		// This maxes out at 23 rating-- no more gains are effectively processed past that, so we might as well skip if we're already there
		if(treatedHours >= 49 && pc.breastRows[0].breastRating() < (Math.min(pc.statusEffectv1("Treated"), 23)))
		{
			var numGains:int = Math.floor((treatedHours - 49) / 3);
			if (startHours >= 49) numGains -= Math.floor((startHours - 49) / 3);
			
			if (numGains > 0)
			{
				for (i = 0; i < numGains; i++)
				{
					// Flat chest -> .5 cup
					if(pc.breastRows[0].breastRatingRaw < .5)
					{
						AddLogEvent(ParseText("Your chest feels strange. It’s all puffy, and your [pc.nipples] are a little swollen. Oh snap, are you getting boobs?"), "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw = .5;
					}
					// .5 cup to A cup
					else if(pc.breastRows[0].breastRatingRaw < 1)
					{
						// clothed
						if(!pc.isChestExposed())
						{
							AddLogEvent(ParseText("You’re noticing more and more that there’s a little something extra in your [pc.upperGarment]. It has moved your center of gravity just far enough forward to shift your posture, and it makes your [pc.nipples] rub oh-so-noticeably against your gear. You pull your top open for a better look and gasp. <b>You’ve grown breasts!</b> They’re still A-cups, really - barely breasts at all, but there’s no way they’re going to stay that small. How big will they get? Will they be big, overly sexualized melons or a pair of impressive mounds, clearing space ahead of you wherever you go?"), "passive", treatmentHourPrint((i * 3), 0));
							if(pc.bRows() > 1)
							{
								ExtendLogEvent(" The extra row");
								if(pc.bRows() > 2) ExtendLogEvent("s below remain");
								else ExtendLogEvent(" below remains");
								ExtendLogEvent(" unchanged. It looks like your top set are the only ones that are gonna get big and milky, but that’ll be fine.");
							}
						}
						// Nakers
						else
						{
							AddLogEvent(ParseText("You’ve been feeling clumsy all day, like something just isn’t right with your body. It isn’t until you glance down that the source of your awkwardness reveals itself - tits. <b>You’ve got pert little A-cups hanging off your chest!</b> They look cute - just enough to give tiny jiggles when you jump. Best of all, your [pc.nipples] seem to have grown in both size and sensitivity along with them.\n\nOf course, they won’t stay pert little melons for long. This is the first real step on your journey to having a room-dominating rack. One that’ll make non-New Texans look on with a mixture of envy and lust, mostly the latter in the case of males. You give yourself a squeeze and smile, already anticipating all the ways you can show yourself off."), "passive", treatmentHourPrint((i * 3), 0))
						}
						pc.breastRows[0].breastRatingRaw = 1;
					}
					// A -> B
					else if(pc.breastRows[0].breastRatingRaw < 2)
					{
						AddLogEvent("You idly squeeze your chest; just to check, you assure yourself. It seems a wise thing to do after taking the Treatment. After all, how else are you supposed to chart your progress from teensy teats to mouthwatering melons? You cup and caress them like favored pets. Yup, they’re definitely bigger. You squeeze again - definitely B-cups. They feel warm in your hands, alight with hormones and metabolic energies, pulsing bigger with every beat of your lusty heart.", "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw = 2;
					}
					// B-C
					else if(pc.breastRows[0].breastRatingRaw < 3)
					{
						AddLogEvent(ParseText("Whenever you move, your [pc.chest] move along with you. That’s no surprise. What does come as a shock is just how much they move - jiggling and shaking about whenever you twist or hop."), "passive", treatmentHourPrint((i * 3), 0));
						if(!pc.isChestExposed()) ExtendLogEvent(" You pop open your top for a look.");
						else ExtendLogEvent(" You look down.");
						ExtendLogEvent(" Damn! When did you get tits like that? They’re proper C-cups now - big enough to command the attention of passersby when shown off, not that you feel much need to. You flex and twist, admiring how you’re filling out all over. And to think it’s just getting started!");
						pc.breastRows[0].breastRatingRaw = 3;
					}
					// C-D
					else if(pc.breastRows[0].breastRatingRaw < 4)
					{
						AddLogEvent(ParseText("You reach up to adjust your [pc.chest], a motion you find yourself doing more and more lately. There’s nothing wrong with making sure your girls are sitting right, and if anyone has a complaint about it, that’s their problem. To your delight, your pleasing handfuls are... well, a little more hand-filling than before. You playfully squeeze them. There’s not enough for your fingers to really sink into... yet. But you’re on the Treatment now. Big, shuddering udders come with the package. You bounce yourself once more for good measure, imagining the goofy looks boys will get when they see them, assuming they earn the privilege, of course."), "passive", treatmentHourPrint((i * 3), 0));
						// +5 lust
						pc.lust(5);
						pc.breastRows[0].breastRatingRaw = 4;
					}
					// D->DD
					else if(pc.breastRows[0].breastRatingRaw < 5)
					{
						AddLogEvent(ParseText(" Your [pc.chest] feel so nice and warm"), "passive", treatmentHourPrint((i * 3), 0));
						if(!pc.isChestExposed()) ExtendLogEvent(ParseText(" against your [pc.upperGarment]"));
						ExtendLogEvent(ParseText(" that you just have to give them a firm squeeze. Your index fingers settle on your [pc.nipples] while your palms massage the burgeoning titflesh. It just doesn’t work as well as it should; your boobs are bigger and squishier than the last time you held them. You’ve gotta be at least a DD-cup now. You bounce them in your palms, watching with a goofy smile. Definitely DD’s."));
						// +2 lust
						pc.lust(2);
						pc.breastRows[0].breastRatingRaw = 5;
					}
					// DD->big DD
					else if(pc.breastRows[0].breastRatingRaw < 6)
					{
						AddLogEvent("It’s one thing to consider the idea of getting bigger breasts from a powerful transformative cocktail. It’s quite another to feel them pulling on you as they get heavier and heavier. Blessedly, the added mass doesn’t seem to bother your back; they’re more bulky than anything. You hold your hands up underneath them, weighing them. They’re so warm and squishy that you can’t help but give them a few playful bounces. Why, you’re big enough that you’re going to have DD-sized bras straining to keep up. You pinch a nipple gleefully. Soon you might even be an E!", "passive", treatmentHourPrint((i * 3), 0));
						// +5 lust.
						pc.lust(5);
						pc.breastRows[0].breastRatingRaw = 6;
					}
					// big DD -> E
					else if(pc.breastRows[0].breastRatingRaw < 7)
					{
						AddLogEvent("You give a squeal of surprise when you realize how big your tits are getting. They’re way more bouncy and squishy than before. If you got measured for a cheap bra, you’d definitely be an E-cup, but you don’t think you need one.", "passive", treatmentHourPrint((i * 3), 0));
						if(!pc.isChestExposed()) ExtendLogEvent(ParseText(" Even with your [pc.upperGarments] peeled down,"));
						else ExtendLogEvent(" Even as naked as you are,");
						ExtendLogEvent(" they sit high and proud, as if cradled by an imaginary corset. You play with them, bouncing them around. They aren’t too firm or too soft. In short, they look damned near perfect on you, a beautiful complement to match the rest of your developing body.");
						// +2 lust
						pc.lust(2);
						pc.breastRows[0].breastRatingRaw = 7;
					}
					// E -> big E
					else if(pc.breastRows[0].breastRatingRaw < 8)
					{
						AddLogEvent(ParseText("You let your hand play across your [pc.nipple] during an idle moment, just to check if your sensitivity is getting crazy or anything. The cow-girls seem to enjoy it, but while it gives you a fluttery thrill, it doesn’t make you weak in the knees. It doesn’t make you moo and moan in equal measure, though the thought of squeezing on some slutty cow until she does makes your nips perk quite nicely. Kneading your pillowy mammaries and smiling, you admire how big they’re getting, reveling in how the pliant flesh bulges between your questing fingers. It’s the only part of you that’s getting softer, and you’re completely okay with that."), "passive", treatmentHourPrint((i * 3), 0));
						ExtendLogEvent("\n\n<b>You’re almost too big for an E-cup.</b>");
						// +3 lust
						pc.lust(3);
						pc.breastRows[0].breastRatingRaw = 8;
					}
					// big E -> EE
					else if(pc.breastRows[0].breastRatingRaw < 9)
					{
						AddLogEvent("You look down, at first surprised and then pleased to see a little bit less of the ground than before. Yep, your chest is still growing.", "passive", treatmentHourPrint((i * 3), 0));
						if(!pc.isChestExposed()) ExtendLogEvent(ParseText(" You yank down your [pc.upperGarments] in a rush to examine it."));
						ExtendLogEvent(" Your breasts give so perfectly under your fingertips that you just <i>have</i> to squeeze them, groping them every bit as eagerly as any horny bull-boy. You knead them, watching yourself do so with a lazy smile. Hmmm, already an EE-cup from the Treatment, and you could still get even bigger. The idea of luring in a cute little faux cow or blushing alien hotty with your sexy melons and riding them to the ground springs onto you out of nowhere, and you’ve got to admit, it’s a pretty good one.");
						pc.breastRows[0].breastRatingRaw = 9;
					}
					// EE -> big EE
					else if(pc.breastRows[0].breastRatingRaw < 10)
					{
						AddLogEvent(ParseText("Your [pc.chest] sway and bounce with every movement. There’s no stopping that now, though. They’ve grown to the upper end of the EE-cup range, and you couldn’t stop the weighty orbs from banging together in such an eye-catching way if you wanted to. Even if you wrapped them, you’d feel them shifting and rubbing against the inside of the fabric, begging to be freed. Why the fuck should you have to wear a top, anyway? Most males don’t have to. You flex, squeezing your boobs between your biceps. Maybe you can convince a few planetary governors to put forth some less sexist regulations."), "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw = 10;
					}
					// big EE -> F
					else if(pc.breastRows[0].breastRatingRaw < 11)
					{
						AddLogEvent(ParseText("Looking down, you smile. Your [pc.feet] "), "passive", treatmentHourPrint((i * 3), 0));
						if(pc.legCount > 1) ExtendLogEvent("are");
						else ExtendLogEvent("is");
						ExtendLogEvent(" totally gone from view.");
						if(pc.hasCock())
						{
							ExtendLogEvent(ParseText(" Heck, if your [pc.cocks] "));
							if(pc.cockTotal() == 1) ExtendLogEvent("was");
							else ExtendLogEvent("were");
							ExtendLogEvent(" smaller, you wouldn’t see ");
							if(pc.cockTotal() == 1) ExtendLogEvent("it");
							else ExtendLogEvent("them");
							ExtendLogEvent(" either.");
						}
						ExtendLogEvent(ParseText(" The swelling of your bustline is truly a sight to behold. Besides, you can still see below if you bend forward a little bit, and you don’t need to watch your [pc.feet] or anything - not when you’ve got an ocean of pillowy flesh to flaunt. You’ve got big, sexy F-cups now."));
						pc.breastRows[0].breastRatingRaw = 11;
					}
					// F -> big F
					else if(pc.breastRows[0].breastRatingRaw < 12)
					{
						AddLogEvent("You start to adjust the girls again. They’re easy to pose just right for the maximum amount of eye-catching wobble, but much like cute bull-boys, sometimes you just gotta grab hold and play with them. You sigh, rubbing fingers around your enhanced areolae as you squeeze your breasts, imagining that it’s a big, strong bull doing it - while you’ve got your hand wrapped around his neck and your hips pounding him into the ground.", "passive", treatmentHourPrint((i * 3), 0));
						ExtendLogEvent("\n\nWith F-cups like these, ones that are almost too big for such a bra, you’ll be able to sleep with the cream of the crop. Men and women alike will line up just to buy you a drink, leaving you in total control of the rest of their evening. You could crush their hopes and dreams with an airy laugh or give them the night of their lives, leaving them with little more than a smile and a bruised pelvis in the morning.");
						// +5 lust
						pc.lust(5);
						pc.breastRows[0].breastRatingRaw = 12;
					}
					// big F -> FF
					else if(pc.breastRows[0].breastRatingRaw < 13)
					{
						AddLogEvent(ParseText("You stumble, setting off a small earthquake in your breasts. Grinning, you mentally categorize it as a class five boobquake and grab hold for stability, stilling your boobs with a supportive grope. There! You knead them a few times, weighing their mass. You’ve jumped up another cup size for sure, probably to a double ‘F’. You must cut quite the impressive figure in the mirror - a big [pc.boyGirl] with big, sexy boobs to match. The meek little cows of the world don’t stand a chance."), "passive", treatmentHourPrint((i * 3), 0));
						if(pc.bRows() > 1)
						{
							ExtendLogEvent(ParseText("You run one hand across your neglected lower [pc.nipples 1]. Maybe someday you can convince someone to make a treatment for ") + pc.mf("boys", "girls") + " with more than one meager row of tits.");
						}
						// +3 lust
						pc.lust(3);
						pc.breastRows[0].breastRatingRaw = 13;
					}
					// FF -> big FF
					else if(pc.breastRows[0].breastRatingRaw < 14)
					{
						AddLogEvent(ParseText("Every movement you make is accompanied by a lovely bounce and jiggle. Your breasts are the kind to display a fetching amount of kinetic movement without bouncing around so hard as to strain your back - that or your back is too tough to be bothered by a bit of boobalicious bouncing. The thought of every eye in the area watching your [pc.chest] has them feeling fuzzy with heat and swelling with pride - and an assortment of mammary-enhancing hormones. They’re bigger than the last time you checked. How much are they going to grow?"), "passive", treatmentHourPrint((i * 3), 0));
						if(pc.bRows() > 1)
						{
							ExtendLogEvent(ParseText("\n\nIt’s a shame that only your top row is seems to benefit from the Treatment, but at least your other [pc.nipples 1] are perking up to match their sisters above."));
						}
						pc.breastRows[0].breastRatingRaw = 14;
					}
					// big FF -> G
					else if(pc.breastRows[0].breastRatingRaw < 15)
					{
						AddLogEvent(ParseText("You run your hands across the curves of your swelling chest, admiring the feel of your [pc.skinFurScales] under your fingertips. You’ve gotten bigger again for sure. Now that you’ve swollen so large, each increase is packing more and more sensitive flesh onto your body, dragging your center of gravity kicking and screaming higher and to the fore. You’ve got to shift your posture to handle G-cups like these, arching your back to keep them from toppling you forward, but that’s a piece of cake for a capable woman like yourself. Eye-candy like this is sure to put you on top of any social situation."), "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw = 15;
					}
					// G -> big G
					else if(pc.breastRows[0].breastRatingRaw < 16)
					{
						AddLogEvent("You look down, pleased to note that another inch of ground has disappeared from view, blocked by the sprawling spheres that adorn your chest like a ship’s prow. They don’t feel heavy at all in spite of their immense size. You rub one, shivering in delight at the thought of how distracting they’ll be for both boys and girls, a dazzling cornucopia of lactic delight just waiting to be unleashed on an unsuspecting populace. Big G-cups like yours are meant to shown off, if only to provide you with an ample supply of mates.", "passive", treatmentHourPrint((i * 3), 0));
						// +5 lust.
						pc.lust(5);
						pc.breastRows[0].breastRatingRaw = 16;
					}
					// big G -> GG
					else if(pc.breastRows[0].breastRatingRaw < 17)
					{
						AddLogEvent("A warm, tingly feeling spreads through your chest as your breasts expand", "passive", treatmentHourPrint((i * 3), 0));
						if(!pc.isChestExposed()) ExtendLogEvent(ParseText(", straining against your [pc.upperGarment] as they go"));
						else ExtendLogEvent(", shifting slightly as they go");
						ExtendLogEvent(". Your hands fly to them of their own accord, wrapping fingers around big, sensitive nipples and pressing palms into expanding undersides. This must be what it feels like to be a supermodel: constant improvement of a body that deserves more and more attention with every passing second. You look at yourself - and the GG-cup behemoths stacked on top of you - and chuckle. The Treatment isn’t turning you into a slut. It’s just making you hotter and sexier, giving you the equipment you need to distract a lover while you pound his hips into the dirt.");
						if(pc.bRows() > 1) ExtendLogEvent(ParseText("\n\nYou idly caress a lower [pc.nippleNoun 1]. It’s just as sensitive as the ones up top, but unlucky enough not to get the sexy swelling your prime rack is."));
						// +7 lust
						pc.lust(7);
						pc.breastRows[0].breastRatingRaw = 17;
					}
					// GG -> big GG
					else if(pc.breastRows[0].breastRatingRaw < 18)
					{
						AddLogEvent("A sensation of sudden, sensitive firmness is the only warning you get before your boobs swell. Not that you needed the warning of course - the Codex gave you one of those a while back - but why would you care? Bigger tits are like better endowed lovers - why wouldn’t you want them? You rub your expanded assets, trying to gauge their new size for yourself, though it might look like you’re just feeling yourself up to a passerby. You’ve got big GG’s for sure. If you’re lucky, you’ll hit H-cups before this is all over!", "passive", treatmentHourPrint((i * 3), 0));
						// +3 lust
						pc.lust(3);
						pc.breastRows[0].breastRatingRaw = 18;
					}
					// big GG -> H
					else if(pc.breastRows[0].breastRatingRaw < 19)
					{
						AddLogEvent("You run your hands across your expanding chest in a slow, sensuous caress. It must look unquestionably erotic to the layperson, but the simple fact is that you’re just getting a feel for how big they’ve gotten, nothing else. If anyone else tried to touch you like this, they’d be unconscious and on the floor in a nanosecond. That or pinned between your thighs, ", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.hasCock()) ExtendLogEvent("forced to suck you off");
						else if(pc.hasVagina()) ExtendLogEvent("forced to lick you off");
						else ExtendLogEvent("forced to lick your blank crotch");
						ExtendLogEvent(" or be squeezed into unconsciousness. It’s the only punishment that makes sense in these trying times, really.");
						ExtendLogEvent("\n\nYou may not understand why New Texan cows are so keen to be manhandled, but you can certainly grow to be better endowed with them - with your brand new H-cups.");
						// Lust+7
						pc.lust(7);
						pc.breastRows[0].breastRatingRaw = 19;
					}
					// H -> big H
					else if(pc.breastRows[0].breastRatingRaw < 20)
					{
						AddLogEvent(ParseText("You keep checking your [pc.chest] for signs of growth. It’s hard not to on the Treatment, knowing that at any moment you could cross the threshold to a whole new cup size and a whole new world of bigger, more sensitive boobs. This time, you’re pretty sure that your fingers are sinking a little deeper into your assets. There’s a little bit more weight in your palms. You’re on the upper edge of an H-cup bra, and you wonder how many of the heifers on New Texas wear H-cups. How many mooing submissives diddle themselves silly to the thought of being taken by a [pc.manWoman] with bigger, better boobs than them?"), "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw = 20;
					}
					// big H -> HH
					else if(pc.breastRows[0].breastRatingRaw < 21)
					{
						AddLogEvent(ParseText("You glance down, pleased to note that your view of the ground is even more obstructed than before. You don’t need to see your [pc.feet] anyway; balance comes completely naturally by this point, no matter how mammoth your feminine mounds. They’re so rounded and shapely; how could anyone ignore a perfect, HH-cup rack like yours? You arch your back, displaying them like solar panels that exist solely to soak up attention."), "passive", treatmentHourPrint((i * 3), 0));
						if(pc.bRows() > 1)
						{
							ExtendLogEvent("\n\nMaybe you could get your other row");
							if(pc.bRows() > 2) ExtendLogEvent("s");
							ExtendLogEvent(" dosed with something so they don’t get forgotten. The more the merrier.");
						}
						// +3 lust
						pc.lust(3);
						pc.breastRows[0].breastRatingRaw = 21;
					}
					// HH -> big HH
					else if(pc.breastRows[0].breastRatingRaw < 22)
					{
						AddLogEvent("You lean back, feeling the weight of your feminine mounds flattening them slightly against your chest and rub your hands across them in slow circles, giving yourself a little massage. You’ve earned it after all, enduring the Treatment’s endless adjustments and transformations, tolerating the lust that swells in your breast like a tsunami closing in on a beach. Pinching your HH-cup tits, you give yourself a masochistic thrill. Perhaps now you’ll find a fuck-buddy every bit as capable as yourself, someone who can take a tumble in the hay and give just as good as they get.", "passive", treatmentHourPrint((i * 3), 0));
						// +6 lust
						pc.lust(6);
						pc.breastRows[0].breastRatingRaw = 22;
					}
					// big HH -> HHH
					else if(pc.breastRows[0].breastRatingRaw < 23)
					{
						AddLogEvent("Closing your eyes, you cop a feel at your bosom. It perfectly deforms around your questing fingertips, swallowing them almost wholly into itself. Each perfectly-shaped boob quivers against the other, pressed into a line of cleavage long enough to make a kui-tan cream her pants. You play with them", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.hasGenitals()) ExtendLogEvent(" until you feel more than a little sticky yourself");
						else ExtendLogEvent(ParseText(", feeling a little unfilled yourself. If only you had someone to come fuck your [pc.ass] right now"));
						ExtendLogEvent(ParseText(". There’s no doubt in your mind: you’re a triple-H [pc.boyGirl] now."));
						pc.breastRows[0].breastRatingRaw = 23;
						
						// End looping if we're already here
						break;
					}
				}
			}
		}
		// ==========================
		// BOOB STUFF OVER. ON
		// TOOO 'GINAS
		// ========================
		// Grow a 'gina if you're lacking one
		if(startHours < 49 && treatedHours >= 49 && !pc.hasVagina())
		{
			// If PC is ausar, vagina is canine. If PC has exclusively canine or equine maleness, match it. Otherwise human 'giny. @Jacques00 or other lovelies - if you want to hook more options in here, I suppose it would be okay.

			AddLogEvent("Oooh, you feel hot! A warm flush is running through your body, circulating between your head and toes before finally pooling in your loins. You whimper, pressing a finger to your crotch only to discover a nice, damp patch. You press on, whether due to fearlessness or desire, and discover a wanton cleft nestled firmly into your crotch. It’s already slick with need, its clitoris jutting free from its hood. <b>You’ve grown an extra-wet ", "passive", treatmentHourPrint(treatedHours, startHours));
			
			pc.createVagina();
			pc.setNewVaginaValues(0);
			// cunt select!
			if(pc.horseScore() >= 3 && pc.horseScore() > pc.canineScore())
			{
				pc.shiftVagina(0,GLOBAL.TYPE_EQUINE);
				ExtendLogEvent("equine");
				pc.clitLength = 0.5;
			}
			else if(pc.canineScore() >= 3)
			{
				pc.shiftVagina(0,GLOBAL.TYPE_CANINE);
				ExtendLogEvent("canine");
				pc.clitLength = 0.25;
			}
			else
			{
				pc.shiftVagina(0,GLOBAL.TYPE_HUMAN);
				ExtendLogEvent("terran");
				pc.clitLength = 0.4;
			}
			ExtendLogEvent("vagina!</b>");
			pc.vaginas[0].wetnessRaw = 3;
		}
		
		// Vaginal Elasticity 
		// Elasticity + bonus capacity to make sure the girl can handle roughly 24" by 4.5" poles.
		// Change it silently. Leave notification status effect that triggers off the next time cuntchange is called. Followup message:
		if(pc.hasVagina() && startHours < 123 && treatedHours >= 123)
		{
			if(pc.elasticity < (pc.hasPerk("Elasticity") ? 3.0 : 2.5) || pc.vaginas[0].bonusCapacity < 150)
			{
				if(pc.elasticity < (pc.hasPerk("Elasticity") ? 3.0 : 2.5)) pc.elasticity = (pc.hasPerk("Elasticity") ? 3.0 : 2.5);
				for(var cuntCount:int = 0; cuntCount < pc.totalVaginas(); cuntCount++)
				{
					if(pc.vaginas[cuntCount].bonusCapacity < 150) pc.vaginas[cuntCount].bonusCapacity = 150;
				}
			}
			pc.createStatusEffect("Treatment Elasticity Report Needed");
		}
		
		// Amazonian Endurance
		// Req's PC be taller than 6', have 60 tone, and procs off an orgasm after day 4.
		// Fen note: Nope, I cut the requirements down just in case of any weirdness with the TFs and timing or a PC nuking tone right before it woulda procced.
		if(startHours < 96 && treatedHours >= 96 && pc.hasVagina() && !pc.hasPerk("Amazonian Endurance"))
		{
			pc.createStatusEffect("Amazonian Endurance Report Needed");
			pc.createPerk("Amazonian Endurance",0,0,0,0,"Allows you to orgasm without fatiguing.");
		}
		
		// ==========================
		// GINA STUFF OVER. ON
		// TOOO SWEET GAINS, BRO
		// ========================
		
		if (pc.tone < 100)
		{
			var numToneGains:int = 0;
			var toneGainOffset:int = -1;
			
			for (i = 0; i < TREATMENT_GAIN_TARGETS.length; i++)
			{
				if (startHours < TREATMENT_GAIN_TARGETS[i] && treatedHours >= TREATMENT_GAIN_TARGETS[i])
				{
					numToneGains++;
					
					if (toneGainOffset == -1)
					{
						toneGainOffset = i;
					}
				}
			}
		
			if (numToneGains > 0)
			{	
				for (i = 0; i < numToneGains; i++)
				{
					var toneTimestamp:uint = treatmentHourPrint(TREATMENT_GAIN_TARGETS[toneGainOffset + i], startHours);
					
					// +slowStatGain physique
					pc.slowStatGain("physique", 1);
					// 0 to 10 tone
					if(pc.tone < 10)
					{
						AddLogEvent("You flex one of your arms and smile when you see a little muscle there. It isn’t much, but it’s a start. In fact... you drop to the ground and do a few push-ups, just to get your blood flowing.", "passive", toneTimestamp);
						pc.tone = 10;
					}
					// 10 to 20
					else if(pc.tone < 20)
					{
						AddLogEvent("Your arms, chest... all of you, really.... You’re looking a little less squeezably soft. Of course, you’re still a long way from well-defined muscles, but you’re not quite the creampuff you used to be either.", "passive", toneTimestamp);
						pc.tone = 20;
					}
					// 20 - 30
					else if(pc.tone < 30)
					{
						AddLogEvent("You feel... solid. On a whim, you do a couple push-ups and crunches, just to see how many you can do. They almost get easier the more you do them, but that can’t be right... can it? Whatever. You’re finally starting to fill out and pack on some muscle.", "passive", toneTimestamp);
						pc.tone = 30;
					}
					// 30 - 40
					else if(pc.tone < 40)
					{
						AddLogEvent("You’re tightening up in some places and swelling up in others, even if your overall broadness remains unchanged. Still, you no longer look like a soft, easy target. You’re starting to show a little muscle in places without flexing, but not much yet. You comfort yourself with the knowledge that a few hours racking weights ought to finish the job.", "passive", toneTimestamp);
						pc.tone = 40;
					}
					// 40 - 50
					else if(pc.tone < 50)
					{
						AddLogEvent("You go ahead and flex one more time, just for fun. There’s something delightful about watching your form swell with latent power. You could probably do a few pull-ups without breaking a sweat if you had a bar around.", "passive", toneTimestamp);
						pc.tone = 50;
					}
					// 50 - 60
					else if(pc.tone < 60)
					{
						AddLogEvent("You admire yourself in your Codex’s screen. The body of the " + pc.mf("guy", "girl") + " in the screen is starting to look pretty good. Muscles are making themselves known all over. If you keep it up, you might even get a pretty nice looking six pack.", "passive", toneTimestamp);
						pc.tone = 60;
					}
					// 60 - 70
					else if(pc.tone < 70)
					{
						AddLogEvent("You pick up a rock and toss it around, anything to keep your hands busy and blow off some of this excess energy. No matter how active you are, you always seem to have more fuel in your tank, and despite the glistening sheen of sweat that you break out in, your expanding muscles don’t seem to mind in the slightest.", "passive", toneTimestamp);
						pc.tone = 70;
					}
					// 70 - 80
					else if(pc.tone < 80)
					{
						AddLogEvent("Everyday tasks that once seemed exhausting or tiring are getting easier by the hour. Long walks? Piece of cake. Hefting some cargo? Not something a little elbow grease can’t take care of. Pinning some wannabe stud to the bed one-handed? Fuck yes. You’re breaking out in muscle all over, and it feels good.", "passive", toneTimestamp);
						pc.tone = 80;
					}
					// 80 - 90
					else if(pc.tone < 90)
					{
						AddLogEvent(ParseText("You do a few one-handed pushups, watching your muscles ripple under your [pc.skinFurScales] with a smile on your face. The physical exertion is calming. It helps you think and plan. When you stop, you’re covered in a light sheen of sweat that only makes your muscles stand out that much more clearly."), "passive", toneTimestamp);
						pc.tone = 90;
					}
					// 90-100
					else
					{
						AddLogEvent("You look at yourself in your Codex’s screen and marvel at the incredible amazon looking back at you. There isn’t a single part of your body that doesn’t display the unbridled physical power you have lurking just under the surface. You can’t imagine getting any more muscular than you already are, but that’s fine. Muscles are hot.", "passive", toneTimestamp);
						pc.tone = 100;
					}
				}
			}
		}
		
		// Some defatt too
		if (pc.thickness > 60 && ((startHours < 101 && treatedHours >= 101) || (startHours < 121 && treatedHours >= 121)))
		{
			// High thickness trims in.
			// Ogre -> Curvy cowgal
			if(pc.tone > 59)
			{
				AddLogEvent("Hour by hour, your overly imposing girth has been tightening in, giving up a bit of girth in exchange for making you look that much more toned and athletic. The only places seemingly unaffected are your hips and perhaps your thighs. You have the kind of physique that warns men that you can do more than keep up with them; you can outlast them and outdo them in every way.", "passive", treatmentHourPrint(treatedHours, startHours));
			}
			// High thickness and high fat trims in.
			// Fatty -> Curvy Cowgal
			else
			{
				AddLogEvent("All the excess weight you’ve carried around has been melting off hour by hour. You aren’t exactly a little stick of a girl - not by a longshot. You’ve still got a broad enough stance to give your lover’s pause - if only because they’ll be wondering how you’re going to manhandle them in the sack. Nobody with half a brain will call you fat any longer.", "passive", treatmentHourPrint(treatedHours, startHours));
			}
			pc.thickness = 60;
		}
		
		// ==========================
		// SWEET GAINS OVER.
		// ON TO TALLNESS GAINZZZ
		// ==========================
		
		// These are 24 hours apart, so we can math this - except 144 which was 23 hours apart so we're fixing that too
		if (pc.tallness < 90 && treatedHours >= 73 && startHours < 169)
		{
			var numTallnessGains:int = 0;
			if (startHours > 169)
			{ 
				// noop 
			}
			else
			{
				numTallnessGains = Math.floor((treatedHours - 49) / 24);
				
				if (startHours > 73)
				{
					numTallnessGains -= Math.floor((startHours - 49) / 24);
				}
				
				numTallnessGains = Math.max(0, numTallnessGains);
			}
			
			if (numTallnessGains > 0)
			{
				// baseGainOffset will give us the +hours required to hit the first trigger point this update cycle, then add i*24
				var baseGainOffset:int = startHours - ((Math.floor((startHours - 1) / 24) * 24) - 1);
				
				for (i = 0; i < numTallnessGains; i++)
				{
					pc.tallness += 1 + rand(3);
					// first time only
					if(!pc.hasStatusEffect("Treatment Height Boosted"))
					{
						pc.createStatusEffect("Treatment Height Boosted", 0, 0, 0, 0, true, "", "", false, 10080);
						AddLogEvent(ParseText("A kind of all-over ache has been bothering you off and on all day. It’s a deep pain, below the skin and muscles; you figure it’s your very bones. You were expecting to get taller. This must be what they mean by ‘growing pains’. A quick measurement confirms it. You’re [pc.height] tall now."), "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
					}
					// Less than 6’
					else if(pc.tallness < 72)
					{
						// Below 5’5"? Add +3"
						if(pc.tallness < 65) pc.tallness += 3;
						// 1
						if (rand(2) == 0)
						{
							AddLogEvent("The ground seems a little further away than before. At first, you think it’s your head playing tricks on you, but when you whack your head on something that you should have passed harmlessly underneath, you have to admit it. You’re getting taller. Pretty soon, nobody is going to call you short!", "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
						}
						// 2
						else
						{
							AddLogEvent(ParseText("You stop to measure yourself with a cocky smile. There’s nothing like getting bigger and stronger to make you feel like a million creds. The Codex beeps, informing you that you’re [pc.height] tall. Now that’s more like it!"), "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
						}
					}
					// Less than 7’
					else if(pc.tallness < 84)
					{
						// 1
						if (rand(3) == 0)
						{
							AddLogEvent(ParseText("Your back abruptly pops. It doesn’t hurt or anything, but you twist and stretch to limber up, feeling it pop a few more times in different places. The ever-present dull ache of growing bones underlies it all, promising that you’re still getting bigger and taller. Right now, you’re [pc.height] tall."), "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
						}
						// 2
						else if (rand(2) == 0)
						{
							AddLogEvent("Things that used to pass right on by your head are getting closer and closer these days. Sometimes you even have to duck to avoid them. The ground seems farther away with every passing minute, a constant reminder of your Treatment-enhanced physique.", "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
						}
						// 3
						else
						{
							AddLogEvent(ParseText("You snap out the Codex for a quick check on your amplified tallness. It beeps, displaying your new height on screen. You’re [pc.height] tall now. If this keeps up, you’re going to wind up taller than most normal terrans. And New Texans? Well... maybe you’ll catch up to the taller bulls."), "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
						}
					}
					// Less than 7'6"
					else if(pc.tallness < 90)
					{
						// 1
						if(rand(3) == 0) 
						{
							AddLogEvent("You’re definitely still growing in spite of being well past the seven foot threshold. You could pass for average on New Texas right now, if you wanted to stick around there. Elsewhere, you must look awful tall.", "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
							if(CodexManager.entryUnlocked("Raskvel")) ExtendLogEvent(" Heck, the raskvel on Tarkus will probably think you a giant.");
						}
						// 2
						else if (rand(2) == 0)
						{
							AddLogEvent(ParseText("You stretch your arms out high over your head and arch your back, working your sore joints. It’s one thing to revel in your added stature. It’s quite another to suffer from the constant aches and pains that come with your expanding physique. You do a quick measurement. You’re [pc.height] tall now."), "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
						}
						// 3
						else
						{
							AddLogEvent(ParseText("Your smile broadens while you look around. Your viewpoint is still rising, slowly but surely. Though it isn’t fast enough to be truly perceptible, you still find yourself taking note of your increasing height every few hours. Right now, you’re up to [pc.height] tall."), "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
						}
					}
					// It’s over - hit dat cap or day 6.5
					if(treatedHours >= 169 || pc.tallness >= 90)
					{
						AddLogEvent(ParseText("The familiar, dull ache to which you have grown accustomed diminishes moment by moment. You frown when it vanishes entirely; the Treatment won’t be making you any taller. You’ll have to settle for being [pc.height] tall."), "passive", treatmentHourPrint((baseGainOffset + (i * 24)), 0));
					}
				}
			}
		}
		// ==========================
		// SWEET GAINS OVER.
		// ON TO HORNDAWGS
		// ==========================
		// Horn Grow 2 Nubs
		// 5 to 8" max
		if((pc.horns == 0 || (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT) || pc.hornLength < pc.statusEffectv2("Treated")) && treatedHours >= 82)
		{
			numHornAttempts = treatedHours - Math.max(startHours, 81);
			numHornGains = 0;
			hornTimestampStride = 0;
			
			for (i = 0; i < numHornAttempts; i++)
			{
				if (rand(6) == 0) numHornGains++;
			}
			
			if (numHornGains > 0)
			{
				hornTimestampStride = Math.floor((treatedHours - Math.max(startHours, 81)) / numHornGains);
				
				for (i = 0; i < numHornGains; i++)
				{		
					// Existing horns transform into lil bull nubs.
					if(pc.horns > 0 && (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT))
					{
						AddLogEvent("There is a crackling, rustling sound coming from above you. You look up, but nothing is there. Instead, you hear the same sound from behind you. This time, you twist around to try and identify the source, but to no avail. A minute later a piece of horn bounces off your nose on the way to the ground.\n\n<b>Your horns are breaking apart!</b> Dazedly, you feel at the crumbling totems, feeling them come apart in your fingers. Chalky dust clings to your hand, but more importantly, two little nubs remain on your head. They’re small and pointed, like little cow horns.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.horns = 2;
						pc.hornLength = .5;
						pc.hornType = GLOBAL.TYPE_BOVINE;
					}
					// Starting
					else if(pc.horns == 0 && !pc.hasStatusEffect("Horn Bumps"))
					{
						AddLogEvent("Ugh. Your head itches! Reaching up to take a scratch, you wince when you come across a painful bump on your forehead. A quick check with the Codex confirms that it’s red and irritated, though you haven’t seen a head form on the zit yet. You’ve never had such prominent acne before, and there’s a matching lump on the either side. Maybe something stung you? It could always be a pair of bug bites. Gross.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.createStatusEffect("Horn Bumps");
					}
					// Breaking Skin
					else if(pc.horns == 0)
					{
						AddLogEvent("The pain from those irritating red bumps on your forehead is getting worse and worse with each passing moment, matched by a sudden desire to scratch madly at them until you flay the skin away. You resist as long as you can, but the need to tend to the maddening itch overwhelms your subpar self-control. Besides, if something itches, why not scratch it?", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent("\n\nTo your horror, your first scratch peels away a patch of offending skin, but with it comes a sense of relief. Helpless to stop yourself, you scratch and scratch until the desire is completely gone - and a pile of discarded skin has built up before your " + pc.feet() + ".");
						ExtendLogEvent("\n\nWhat have you done to yourself!? Pulling out your Codex, you use the camera to check.");
						ExtendLogEvent(ParseText("\n\nYou tumble onto your [pc.butt] in shock. You... y-you’re... <b>you’ve got the cutest pair of horns growing out of your forehead!</b> They’re only little nubs at the moment, but there’s no way they’re done growing. You’ll probably have an impressive rack when all’s said and done, all the better to complement your other growing rack."));
						pc.hornType = GLOBAL.TYPE_BOVINE;
						pc.removeStatusEffect("Horn Bumps", true);
						pc.horns = 2;
						pc.hornLength = .5;
					}
					// nubs -> 1" horns
					else if(pc.hornLength < 1)
					{
						AddLogEvent("For the past few minutes, a nasty little headache has been brewing. You squeeze your eyes closed, flexing your jaw in an effort to deal with it, when it abruptly fades, vanishing in the span of a second.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent(ParseText("\n\nYou gingerly prod yourself; just what kind of headache was that? You get your answer when your fingers find what your nubs have become: full blown horns. They stick at least a full inch out from your [pc.skinFurScales], coming to two proud points, though their tips are rounded enough that you doubt you could do any real injury with them yet. You’ll have to sharpen them up a little once they finish coming in, maybe even get them capped with ornamental steel."));
						pc.hornLength = 1;
					}
					// 1" horns to 2" horns
					else if(pc.hornLength < 2)
					{
						AddLogEvent("A wave of discomfort strikes just behind your forehead, growing worse by the second. There’s really only one thing it can be - your horns getting bigger! You whip out your Codex, wincing from the sudden motion, and flick it on, getting yourself a ticket to watch your own burgeoning majesty.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent("\n\nYour formerly one-inch horns have already pushed a little further out, perhaps a quarter inch. The longer they get, the wider their bases are becoming, and they’re growing fast enough now that you can actually see them slowly sliding out, revealing bit after bit of gleaming white ivory.");
						if(pc.hasHair() && pc.hairLength >= 2) ExtendLogEvent(" You brush your bangs to one side, hooking them around one of the horns in the cutest way.");
						ExtendLogEvent(" The process is fascinating enough for you to forget your earlier discomfort. You watch, spellbound, as your horns continue to expand, growing ever more prominent on your face until they stop at around two inches long.");
						ExtendLogEvent("\n\nNow this is more like it. A little bigger, and you’ll be able to stand up to some of the bulls.");
						pc.hornLength = 2;
					}
					// 2" horns to 3" horns
					else if(pc.hornLength < 3)
					{
						AddLogEvent("Your jaw clenches, a low growl escaping your throat entirely uncontrollably. There’s a powerful shifting and sliding going on in your skull. It leaves you seeing stars with your eyes half-crossed. There’s blessedly little pain, but when it passes, you’re very aware of additional weight tugging on your head. Your horns have grown: they’re now three inches of gleaming white, bovine awesomeness. You resolve to polish them at the first opportunity, maybe even get some ornamental jewelry for them.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 3;
					}
					// 3" horns to 4" horns - prolly gonna reuse some of this for guys.
					else if(pc.hornLength < 4)
					{
						AddLogEvent("Your eyes suddenly cross, and you drop yourself to the ground, lest you run into something or worse. The rumbling sense of movement is working on your skull once more, like giant boulders rolling around the inside of your head. It doesn’t hurt, but it is very disconcerting, making it next to impossible to think.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent("\n\nYou grunt and groan, feeling the sensation slide <i>outside</i> of your head as your horns expand, growing thicker and heavier. You sigh in satisfaction once they stop growing. Now these are respectable horns!");
						pc.hornLength = 4;
					}
					// 4" horsn to 5" horns - MAX LADIES CAN GET.
					else if(pc.hornLength < 5)
					{
						AddLogEvent("You feel a sense of... potential building within your head, expanding until it changes from a kind of nebulous energy into an unstoppable pressure. You feel your horns giving under the weight of it all, slowly sliding forward, expanding outward, growing heavier by the moment. You wrap your hands around them, feeling the change against your palms. When it’s all over, you’re left holding two big, strong five-inch horns. Nice.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 5;
					}
					else if(pc.hornLength < 6)
					{
						AddLogEvent("Here it comes! You wince at the onset of tightness in your forehead, increasingly familiar as your horns continue their trek toward their full size. It doesn’t even hurt that bad this time; it just feels like a strange, tight tingling as your horns add another inch to their already impressive length. When the sensation fades, <b>you admire your six-inch long horns.</b> Not too shabby. Any longer and you’ll have to be careful with them when going through doorways.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 6;
					}
					else if(pc.hornLength < 7)
					{
						AddLogEvent("You grunt as the familiar feeling of horn growth sets in. Grabbing hold of the curved, steer-like protrusions, you give them a tug, easing more gleaming ivory into the air. The more horn you grow, the wider their stance and the more threatening you become. You could probably just tip your head an inch forward, snort, and send half the galaxy running. The thought makes you smile almost as much as the idea of a faux cow squeezing them like handlebars while you suck his balls dry.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 7;
					}
					else if(pc.hornLength < 8)
					{
						var supahHorn:Boolean = false;
						AddLogEvent("You wince at the headache as it returns. The familiar ache that’s right behind your forehead can only mean one thing: your horns are about to grow again. But they’re already so big! You watch in disbelief as an extra inch", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						if(rand(4) == 0) 
						{
							ExtendLogEvent("... no two extra inches pour");
							supahHorn = true;
						}
						else ExtendLogEvent(" pours");
						ExtendLogEvent(" into your view. You must look so imposing. These are bigger than just about any bull’s on New Texas. <b>You have big, ");
						if(supahHorn) ExtendLogEvent("nine");
						else ExtendLogEvent("eight");
						ExtendLogEvent("-inch long horns.</b> How exciting that you, a ");
						if(pc.hasCock()) ExtendLogEvent("hermaphrodite");
						else ExtendLogEvent("female");
						ExtendLogEvent(" get to dwarf all the supposed ‘males.’");
						if(supahHorn) pc.hornLength = 9;
						else pc.hornLength = 8;
					}
				}
			}
		}
		// (Ram Horns!)
		if(pc.horns == 2 && pc.hornType == GLOBAL.TYPE_BOVINE && (pc.hornLength < 10 && pc.hornLength > 4) && startHours < 137 && treatedHours >= 137 && rand(3) == 0)
		{
			AddLogEvent("You feel the familiar tightness of your horns growing once more, but this time it doesn’t stop at simple pain. It intensifies into a flaring, twisting agony, like two screws boring into your skull. You double over, grabbing at the bony protrusions in horror in time to feel them twisting through your hands, angling your bovine horns back toward your own ears as inch after inch of fresh growth pushes through your fingers, slick with some kind of fluid as if fresh-birthed.\n\nThis goes on for minutes, but to you, it feels like hours of torture. No amount of willpower or machismo helps you deal with it. All you can do is curl into a ball and feel your horns twisting and changing, losing their bovine nature as they become something... else.\n\nThe pain fades without warning, and the growth goes with it just as suddenly. Shocked, you rise up, unaware of just when you fell to the ground, awed by the magnitude of just what happened. You pull out your Codex with a shaking hand and flick it on, more anxious to see the result of your transformation than you care to admit.\n\n<b>Two curled goat horns twist back over your ears</b>, giving you an appearance that seems both regal and playful, like the fauns of old terran myths. You smile as you take it all in. It was almost worth the pain to get a pair like this.", "passive", treatmentHourPrint(treatedHours, startHours));
			pc.hornType = GLOBAL.TYPE_GOAT;
			pc.hornLength = 11;
			pc.horns = 2;
		}
		// ==========================
		// HORNS R DUN!
		// ON TO SWEET TAILZ, EARS, AN HOOVES
		// ==========================
		// tail-converts existing to cowtail
		// cunt/cocktails prevent this!
		// 10% chance of no tail change!
		if(!pc.hasCuntTail() && !pc.hasCockTail() && pc.tailType != GLOBAL.TYPE_BOVINE && startHours < 112 && treatedHours >= 112 && rand(10) != 0)
		{
			// No tail
			if(pc.tailCount <= 0)
			{
				AddLogEvent(ParseText("You go to scratch at a spot above your [pc.butt] that’s been bothering you for a few hours and jerk when you hit something that wasn’t there before - something rounded and fluffy. Pressing back carefully, you ease your fingers around the growth, discovering its furred texture and cords of muscle. The oddest part is feeling the fingers pressing on you through the fur. There’s no doubt about it - <b>you have a tail.</b>\n\nIt’s a fairly long tail with a cute little poof on the end, just like a cow’s."), "passive", treatmentHourPrint(treatedHours, startHours));
				pc.tailCount = 1;
			}
			// Multitail
			else if(pc.tailCount > 1)
			{
				// Multi - short
				if(!pc.hasTailFlag(GLOBAL.FLAG_LONG))
				{
					AddLogEvent(ParseText("Your [pc.tails] brush against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had [pc.tails], now you’ve got gently-swaying, bovine tails, complete with fuzzy puffs at the tips."), "passive", treatmentHourPrint(treatedHours, startHours));
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(ParseText(" A fine layer of [pc.furColor] fur covers each one."));
					ExtendLogEvent(" You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.");
				}
				// Multi - long
				else
				{
					AddLogEvent(ParseText("Your [pc.tails] feel increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremities alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find."), "passive", treatmentHourPrint(treatedHours, startHours));
					ExtendLogEvent("\n\n" + StringUtil.upperCase(num2Text(pc.tailCount)) + " gently swinging, bovine tails hang behind you. The tips are poofing up, just as you’d expect");
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(", and a coat of fine fur is growing out over their lengths");
					ExtendLogEvent(". In seconds, the warmth fades, leaving you with new, bovine butt ornaments. You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.");
				}
			}
			// Single - short
			else if(!pc.hasTailFlag(GLOBAL.FLAG_LONG))
			{
				AddLogEvent(ParseText("Your tail brushes against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had a [pc.tail], now you’ve got a gently-swaying, bovine tail, complete with a fuzzy puff at the tip."), "passive", treatmentHourPrint(treatedHours, startHours));
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(ParseText(" A fine layer of [pc.furColor] fur covers the whole thing."));
				ExtendLogEvent(" You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.");
			}
			// Single - long
			else
			{
				AddLogEvent(ParseText("Your [pc.tail] feels increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremity alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find."), "passive", treatmentHourPrint(treatedHours, startHours));
				ExtendLogEvent("\n\nA gently swinging, bovine tail hangs behind you. The tip is poofing up, just as you’d expect");
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(", and a coat of fine fur is growing out over its length");
				ExtendLogEvent(". In seconds, the warmth fades, leaving you with a new, bovine butt appendage. You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.");
			}
			pc.clearTailFlags();
			pc.tailType = GLOBAL.TYPE_BOVINE;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		}
		
		// Cow ears (maybe)
		if(pc.earType != GLOBAL.TYPE_BOVINE && startHours < 160 && treatedHours >= 160 && rand(2) == 0)
		{
			AddLogEvent(ParseText("You go to scratch at one of your " + pc.earsDescript() + ", only to find it differently shaped - and in a new location - than before. Gingerly feeling it, you discover that your aural organs are soft and leathery, with a fine coat of [pc.furColor] across their outer edges. You can still hear just fine; <b>you’re just listening through a pair of floppy cow-ears now</b>. Briefly, you consider how good it would feel to have someone scratch them."), "passive", treatmentHourPrint(treatedHours, startHours));
			pc.earType = GLOBAL.TYPE_BOVINE;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_FURRED);
			pc.addEarFlag(GLOBAL.FLAG_FLOPPY);
		}
		
		// Hooves (Rarish) - requires biped minimum. No change for goo/nagaPCs
		if(pc.legCount >= 2 && pc.legType != GLOBAL.TYPE_BOVINE && startHours < 141 && treatedHours >= 141 && rand(10) <= 3)
		{
			if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES))
			{
				AddLogEvent("You stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. It’s then that you spot way your " + pc.feet() + " are shifting and changing. They look like they’re staying as hooves, but they’re a little more of a brown-black color, with a split down the middle. They look like the kind of hooves a cow would have. Well, there are worse things than having a matched set of transformations. <b>You resolve to enjoy your new cow hooves.</b>", "passive", treatmentHourPrint(treatedHours, startHours));
			}
			else
			{
				AddLogEvent("You stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. You see why when you glance to your " + pc.feet() + ". They’re malformed, twisting and narrowing before your eyes. They’re pulling their disparate parts together into one unified mass, almost cylindrical in shape", "passive", treatmentHourPrint(treatedHours, startHours));
				if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))
				{
					ExtendLogEvent(", and the change isn’t limited to below the ankle either. Your calves are reshaping, placing what used to be your ankle far above your blackening feet");
				}
				else ExtendLogEvent(", and they begin to blacken, moment by moment");
				ExtendLogEvent(".\n\nThey split in half, right down the middle, growing harder by the moment, dulling your sense of touch. You dully rub them, confused at first. Realization hits you like a ton of bricks - you have hooves! Just like a cow, you’ve got hooves to clop around on while you walk. Most people don’t get hooves from the Treatment. It looks like you were one of the lucky ones. You’re going to be turning heads for sure!");
			}
			pc.clearLegFlags();
			pc.legType = GLOBAL.TYPE_BOVINE;
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
		}
		
		// ==========================
		// COSMETICS DESTROYED!
		// ON TO HIPS AND BUTTS!
		// ==========================
		var numHipGains:int = 0;
		
		if (startHours < 126 && treatedHours >= 126) numHipGains++;
		if (startHours < 142 && treatedHours >= 142) numHipGains++;
		if (startHours < 156 && treatedHours >= 156) numHipGains++;
		
		if(numHipGains > 0 && pc.hipRatingRaw < 11)
		{
			for (i = 0; i < numHipGains; i++)
			{
				// Sub 3 to 3
				if(pc.hipRatingRaw < 3)
				{
					AddLogEvent("You look yourself over, discovering that your hips have widened, giving you a more feminine look.", "passive", treatmentHourPrint((treatedHours - startHours - (i * 14)), 0));
					pc.hipRatingRaw = 3;
				}
				// Not so smallish Sub 6 to 6
				else if(pc.hipRatingRaw < 6)
				{
					AddLogEvent("Whoah! Your hips have gotten wider. Nobody is going to mistake you for a boy when you can swivel these back and forth. You sashay them around a few times, just to try it out.", "passive", treatmentHourPrint((treatedHours - startHours - (i * 14)), 0));
					pc.hipRatingRaw = 6;
				}
				// Biggish (Sub max to max)
				else
				{
					AddLogEvent(ParseText("Moving around, you’re pleased to discover a little extra wiggle in you walk. Your [pc.butt] sways hypnotically as you go, automatically borne on a sinuous back and forth motion by your expanding [pc.hips]. You wonder if anyone will notice."), "passive", treatmentHourPrint((treatedHours - startHours - (i * 14)), 0));
					pc.hipRatingRaw = 7 + rand(4);
				}
			}
		}
		
		// Bigger Booty Towards 7-9.
		if(startHours < 156 && treatedHours >= 156 && pc.buttRatingRaw < 9)
		{

			if (!pc.isAssExposed())
			{
				AddLogEvent(ParseText("An increase in the tightness of your [pc.lowerGarments] gradually comes to your attention, forcing you to shift and adjust them."), "passive", treatmentHourPrint(156, startHours));
			}
			else
			{
				AddLogEvent("A slight shift in your balance gradually makes itself known to you, and you twist to regard your changing form, expecting to find a bigger butt.", "passive", treatmentHourPrint(156, startHours));
			}
			ExtendLogEvent(" Sure enough, your ass has swollen up with an influx of fresh new flesh, pushing it out into a quite squeezable, bubbly butt. The urge to shake it comes over you, but you fight it off, for now. There will be plenty of time for that sort of thing later. Not too much later, but later.");
			pc.buttRatingRaw = 9;
		}
		// ==========================
		// THICCness ACHIEVED
		// WHY NOT PENIS?
		// ==========================
		// [Rare] Grow Futacawk
		// Requires PC have a vagina.
		// Dick should match race. No special mention of race because #lazy.
		// 33% odds!
		if(startHours < 129 && treatedHours >= 129 && !pc.hasCock() && pc.hasVagina() && pc.statusEffectv3("Treated") != 0)
		{
			AddLogEvent("Oh fuck! Something is happening, something that shatters your confident facade with aplomb. You can feel it, wriggling and squirming ", "passive", treatmentHourPrint(129, startHours));
			if(pc.legCount == 1) ExtendLogEvent(ParseText("between your [pc.legs]"));
			else ExtendLogEvent("in your loins");
			ExtendLogEvent(ParseText(", just up and behind your [pc.vaginas]. It’s a tight, wet heat that grabs hold of your thoughts and yanks them around until they’re buried six-inches deep in an imaginary cow-pussy. It’s equal parts painful and exciting, burning a blistering path of lurid fucking through your fantasies and body alike."));
			ExtendLogEvent("With an audible pop, you suddenly feel immense relief from the pain - but not from the lust. You’re hornier than ever, and a barrage of foreign sensations emanate from your crotch. You reach down, expecting to find a sloppily drooling pussy, and instead bump into the rigid firmness of your new maleness. <b>You have a cock.</b>");
			ExtendLogEvent("\n\nThe discovery isn’t as unnerving as you feel it should be, though maybe that’s the scintillating pleasure that it grants with every touch. In no time flat, you’re wrapping a palm around and furiously stroking, humping your fist in a lewd declaration of pleasure, dribbling pre-cum over your knuckles and drool down your chin. Having a dick feels good! You whimper once, thrusting especially powerfully, then hump again, twice as hard.");
			ExtendLogEvent(ParseText("\n\nInternal muscles clench powerfully, triggering a cascade of endorphins and blissful relief in the moment of your climax. [pc.Cum] spills out onto the ground from your whorish masturbation, but you can’t bring yourself to stop, not until you squeezed every droplet of pleasure from this wondrous new appendage."));
			ExtendLogEvent("\n\nAfter a minute or so of tugging on your new dick, you moo softly to yourself and finally stop, staring in awe at the instrument of your desire while imagining the possibilities it opens up. You can fuck cow-girls now! You can fuck boys in the ass, ream them until they’re giggly, spunk-oozing messes. Hell, you can even rub dicks with a big bull until one of you glazes the other. Awesome!");
			pc.orgasm();
			pc.lust(4);
			pc.createCock();
			pc.setNewCockValues(0);
		}
		
		// Normal dick growth and animal cock chances.
		if (pc.hasCock()) standardTreatmentDickStuff(treatedHours, startHours);
		
		// Dicked PCs only - AMAZONIAN VIRILITY!
		// * Cum Volume & Minimum CumQ - Amazonian Virility
		if(pc.hasCock() && startHours < 153 && treatedHours >= 153 && !pc.hasPerk("Amazonian Virility"))
		{
			AddLogEvent(ParseText("Oh-ohh-ohhh-stars! Quivers of pleasure slap into you, one after another, robbing the strength from your [pc.legs] until the quivering limb"), "passive", treatmentHourPrint(153, startHours));
			if(pc.legCount > 1) ExtendLogEvent("s");
			ExtendLogEvent(ParseText(" give out entirely, spilling you to the ground. Every individual pulse is like a miniature orgasm. They surge out of your middle, flexing your [pc.cocks], making "));
			if(pc.cockTotal() == 1) ExtendLogEvent("its");
			else ExtendLogEvent("their");
			ExtendLogEvent(ParseText(" [pc.cockHeads] throb."));
			if(!pc.isCrotchExposed()) ExtendLogEvent(ParseText(" You barely manage to yank your [pc.lowerGarment] out of the way before collapsing flat onto your back, pumping your [pc.hips] into the air."));
			else ExtendLogEvent(ParseText(" You reach down, unsure if you’re going to stroke or simply take stock of the situation, but the ecstasy knocks you flat on your back a millisecond later, your [pc.hips] pumping lewdly into the air."));
			ExtendLogEvent(ParseText("\n\nGobs of [pc.cumNoun] spill down the sides of your [pc.cocks], venting slowly. The individual ejaculations aren’t powerful to push the sperm-laden goo more than an inch above your cum-slit, yet the pleasure isn’t ebbing. Your penis"));
			if(pc.totalCocks() > 1) ExtendLogEvent("es are like leaky faucets");
			else ExtendLogEvent(" is like a leaky faucet");
			ExtendLogEvent(". Jizz drools overwhere. You wrap your hands around your slickened dick");
			if(pc.cockTotal() > 1) ExtendLogEvent("s");
			ExtendLogEvent(ParseText(" and squeeze, reveling in the lubricated strokes, mooing softly when a particularly thick jet of [pc.cumColor] dribbles down your knuckles."));
			ExtendLogEvent(ParseText("\n\nEventually, you give yourself over entirely to the ecstatic pulses, gathering up handfuls of slick jism to smear into your [pc.thighs] and [pc.chest]. You moo, then whimper, embarrassed to sound so submissive but too blissed-out to care. Your crotch is completely on autopilot, determined to release a bathtub’s worth of orgasms, and your hands have climbed along for the ride, encouraging the endless eruptions to come out thicker and more voluminous by the minute."));
			ExtendLogEvent(ParseText("\n\nBy the time the orgasmic quivers die down, everything from your [pc.chest] to your [pc.feet] is soaked in [pc.cumColor] spooge, and the ground below is even worse off. You look like an unwilling participant in a kui-tan bukkake session, that or a victim of a ghost orgy.\n\nSomething inside you"));
			if(pc.balls > 0) ExtendLogEvent(ParseText(" or your [pc.balls]"));
			ExtendLogEvent(ParseText(" has changed - something that’s letting your body churn out [pc.cumNoun] as fast as you could possibly need it. You doubt you’ll ever have an orgasm less than “amazing” ever again. Amazing!"));
			for(var ii:int = 0; ii < 15; ii++)
			{
				pc.orgasm();
			}
			pc.applyCumSoaked();
			pc.boostCum(80);
			ExtendLogEvent("\n\n(<b>Perk Gained: Amazonian Virility</b> - Guarantees you’ll never run out of cum.)");
			pc.createPerk("Amazonian Virility",0,0,0,0,"Ensures you never ejaculate less than 300 mLs.");
		}
	}
	// Female Effects
	// 2. Female Treatment Section
	else if(effect.value1 == 0 || effect.value1 == 2)
	{
		// Over Time Intelligence + Perks
		// Intelligence/Willpower Reductions to 25 statquotient every 2 hours for 2 days. (time remaining % 60 == 0) for 48 hours. Played even if stats are done dropping.
		
		var numStatChanges:Number = 0;
		if (startHours < 48)
		{
			numStatChanges = Math.floor((Math.min(treatedHours, 48) - (startHours - (startHours % 2))) / 2);
		}
		
		if (numStatChanges > 0)
		{
			pc.intelligence( - (pc.hasPerk("Weak Mind") ? (numStatChanges / 2.0) : numStatChanges));
			if (pc.IQ() < 25) pc.intelligence(pc.intelligenceMax() / 4, true);
			
			pc.willpower( - (pc.hasPerk("Weak Mind") ? (numStatChanges / 2.0) : numStatChanges));
			if (pc.WQ() < 25) pc.willpower(pc.willpower() / 4, true);
			
			pc.libido(numStatChanges);
		}
		
		// 1
		if(startHours < 2 && treatedHours >= 2)
		{
			AddLogEvent("You catch yourself daydreaming about sunbathing at one of the fancy resorts Dad sometimes let you accompany him to. You cast it aside with a wistful shake of your head. Those were better times.", "passive", treatmentHourPrint(2, startHours));
		}
		
		// 2
		if(startHours < 4 && treatedHours >= 4)
		{
			AddLogEvent("You feel pretty good actually - nothing exceptional, just a general wellness. You stretch and smile. It’s turning out to be a pretty good day!", "passive", treatmentHourPrint(4, startHours));
		}
		
		// 3
		if(startHours < 6 && treatedHours >= 6)
		{
			AddLogEvent("Feeling a little hungry, you reach into your equipment and grab one of the cheap ration bars that came with your first ship. You’re staring at an empty wrapper and burping before you know it. Where did the time go?", "passive", treatmentHourPrint(6, startHours));
		}
		
		// 4
		if(startHours < 8 && treatedHours >= 8)
		{
			AddLogEvent("It’s been over eight hours since you took the treatment. Shouldn’t it have done something by now?", "passive", treatmentHourPrint(8, startHours));
			if(pc.hasVagina())
			{
				if(!pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" Glancing down, you look over your [pc.vaginas]."));
				else ExtendLogEvent(ParseText(" Peeling open your [pc.underGarment], you take a look at your [pc.vaginas]."));
				if(pc.totalVaginas() == 1) ExtendLogEvent(" It doesn’t");
				else ExtendLogEvent(" They don’t");
				ExtendLogEvent(" look any different. Would touching yourself feel any better than before? Surely, it wouldn’t hurt to test. For science.");
			}
			// Nopuss:
			else
			{
				ExtendLogEvent(" Glancing down, you find yourself wishing you had a pussy, just so you could watch the Treatment make it all sexy and wet.");
			}
			// +5 lust
			pc.lust(5);
			pc.libido(1);
			// Libido +1
		}
		
		// 5
		if (startHours < 10 && treatedHours >= 10)
		{
			AddLogEvent("You wonder... what would Oggy’s cock look like if it were straining his pants at the sight of you? Would it flush dark with blood and stretch the fabric taut? Would a dark smear appear at the tip, staining the fabric? You shake away the unusually strong fantasy and resolve to sneak glances below the waists of the males you meet. You might as well look at something, right?", "passive", treatmentHourPrint(10, startHours));
			// +7 lust
			pc.lust(7);
		}
		
		// 6
		if (startHours < 12 && treatedHours >= 12)
		{
			AddLogEvent("While you have a moment to be introspective, you take stock of yourself (and munch on another ration bar). You don’t feel any dumber yet, but focusing does seem to be a little trickier. There’s so many things and people that you could be looking at. It’s just such a nice day that focusing on boring stuff would be such a waste. Besides, the itch between your thighs is getting seriously intense.", "passive", treatmentHourPrint(12, startHours));
			if(!pc.hasVagina()) ExtendLogEvent(" If only you had a proper pussy there.");
			// +5 lust
			pc.lust(5);
		}
		
		// 7
		if(startHours < 14 && treatedHours >= 14)
		{
			AddLogEvent(ParseText("You spend a few moments running your hands over your [pc.chest] and down your [pc.belly], attempting to ignore the way your [pc.nipples] harden in an attempt to catch under your fingers. It feels REALLY good."), "passive", treatmentHourPrint(14, startHours));
			if(pc.hasHair() && pc.hairLength >= 10) ExtendLogEvent(ParseText(" Even the feel of your [pc.hair] on your shoulders is amazing."));
			if(pc.hasHair()) 
			{
				ExtendLogEvent(" You run your hands through ");
				if(pc.hairLength >= 10) ExtendLogEvent("it");
				else ExtendLogEvent("your hair");
				ExtendLogEvent(" and moan in rapture. It’s like a minute of massaging compressed into a moment.");
			}
			else ExtendLogEvent(" You run your hands over your head and moan in rapture. It’s like a minute of petting compressed into a moment.");
			ExtendLogEvent(" You could get used to this.");
			// +5 lust
			pc.lust(5);
			// Libido +1
			pc.libido(1);
		}
		
		// 8
		if(startHours < 16 && treatedHours >= 16)
		{
			AddLogEvent("This is turning out pretty nice. You run your hands across your chest, wondering how big you’ll get before it has its way with you.", "passive", treatmentHourPrint(16, startHours));
			if(pc.biggestTitSize() >= 20) 
			{
				ExtendLogEvent(" Can it really make you any bigger? A set like yours is already massive. Maybe it’ll just make you ");
				if(pc.canLactate()) ExtendLogEvent("extra ");
				ExtendLogEvent("milky.");
			}
			else ExtendLogEvent(" Will you have a hard time walking with them?");
			ExtendLogEvent(" More importantly, will the boys like them? You sigh dreamily.");
			// +2 lust.
			pc.lust(2);
			// Libido +1
			pc.libido(1);
		}
		
		// 9
		if(startHours < 18 && treatedHours >= 18)
		{
			AddLogEvent("After blinking, the colors around you seem to almost pop into greater vibrancy. You gasp and marvel at them. How could such a change be possible? You look around yourself in awe, reveling in the odd, ocular sensation. What were you thinking about again?", "passive", treatmentHourPrint(18, startHours));
		}
		
		// 10
		if(startHours < 20 && treatedHours >= 20)
		{
			AddLogEvent("You eat another ration bar and burp. Just how many will you eat before the Treatment works its way out of your system?", "passive", treatmentHourPrint(20, startHours));
		}
		
		// 11
		if(startHours < 22 && treatedHours >= 22)
		{
			if(pc.hasHair())
			{
				AddLogEvent(ParseText("Ugh! Your [pc.hair] is all wrong! Using the codex as a mirror, you spend a few minutes arranging it for maximum effect. It frames your face just so, and you purse your [pc.lips] invitingly. Yeah, that’s better."), "passive", treatmentHourPrint(22, startHours));
			}
			// No Hair
			else
			{
				AddLogEvent("Ugh! You don’t have any hair to accessorize with. Still, you could do something. You pull out your codex to use as a mirror and look over yourself. Maybe some cute earrings and some lip gloss would look on you. Pursed, inviting lips would complete the look.", "passive", treatmentHourPrint(22, startHours));
			}
			// Libido +1
			pc.libido(1);
		}
		
		// 12
		if(startHours < 24 && treatedHours >= 24)
		{
			AddLogEvent(ParseText("You catch one of your hands rubbing your [pc.chest] out of the blue. You probably shouldn’t be walking around idly groping yourself, but it feels really good, you know? Using your other hand, you squeeze from both sides at once. A ragged moan slips from your lips, and you release yourself, contented for now. You’ll need to spend some time with the girls later."), "passive", treatmentHourPrint(24, startHours));
			// +7 lust.
			pc.lust(7);
			// Libido +2
			pc.libido(2);
		}
		
		// 13 - Pussies only
		if(startHours < 26 && treatedHours >= 26)
		{
			AddLogEvent("You", "passive", treatmentHourPrint(26, startHours));
			if(pc.legCount != 1) ExtendLogEvent(" rub your thighs together");
			else ExtendLogEvent(" wiggle uncomfortably");
			ExtendLogEvent(". There’s this growing feeling of emptiness ");
			if(pc.legCount != 1) ExtendLogEvent("between them");
			else ExtendLogEvent("inside you");
			ExtendLogEvent(", like you’re as hollow as one of those chocolate bunnies they eat on Terra in spring. Only... a nice, hard dick would really hit the spot - a really veiny, thick one. It would complete you.");
			if(pc.hasVagina()) ExtendLogEvent(ParseText(" Dribbles of arousal leak down your [pc.legOrLegs] as you mull it over."));
			ExtendLogEvent(" Yeah... maybe a fuck break is in order.");
			// +8 lust or lust to 33, whichever is higher.
			if(pc.lust() + 8 < 33) pc.lust(33-pc.lust());
			else pc.lust(8);
			// Libido +2
			pc.libido(1);
		}
		
		// 14
		if(startHours < 28 && treatedHours >= 28 && !pc.hasPerk("Sexy Thinking"))
		{
			AddLogEvent("You’re definitely being changed by the Treatment - you’re sure of it. Your surroundings are no longer simple objects and materials. They’re a whole new set of sexual backdrops and tools. A chair could be used for oral, or a creative place to mount a hung stud. A spanner could be used as part of a slutty mechanic’s costume, matched by crotchless coveralls. You put your hands on your waist and smile, arching your back and cocking your hip out to the side at the same time. The motion is automatic. What some might view as getting dumber, you’re discovering is getting sexier.", "passive", treatmentHourPrint(28, startHours));
			ExtendLogEvent("\n\nWhy didn’t you take the Treatment before? This is awesome!");
			// +9 lust
			pc.lust(9);
			// Gain Sexy Thinking - gives sexiness bonus equal to (100-IQ-25)/20 + (100-WQ-25)/20
			ExtendLogEvent("\n\n(<b>Perk Gained: Sexy Thinking</b> - Increases tease damage inversely to how high willpower and intelligence are.)");
			pc.createPerk("Sexy Thinking",0,0,0,0,"Boosts tease damage more the dumber and less willful you are.");
			// Libido to 30 or +5
			if(pc.libido() + 5 < 30) pc.libido(30-pc.libido());
			else pc.libido(3);
		}
		
		// 15
		if(startHours < 30 && treatedHours >= 30)
		{
			AddLogEvent(ParseText("This time, when you find your hands on your [pc.chest], you let them play. You aren’t masturbating, per-se, just letting your fingers play a little. Hot jolts of ecstasy emanate from your [pc.nipples], and that’s just fine. By the time something else distracts you, your face is as flush as your teats are hard."), "passive", treatmentHourPrint(30, startHours));
			// lust +7
			pc.lust(7);
			// Libido to 35 or +5
			if(pc.libido() + 5 < 35) pc.libido(35-pc.libido());
			else pc.libido(4);
		}
		
		// 16
		if(startHours < 32 && treatedHours >= 32)
		{
			AddLogEvent(" You’re definitely not getting dumber. You’re sure of it now. It’s just that there’s so many things to pay attention to, and focusing on one thing for longer than a few moments is sooo boring. You can still do things like math. Eleven times eleven is still 121, but what’s the point? You could probably get a boy to do it for you, if you rubbed him the right way.", "passive", treatmentHourPrint(32, startHours));
		}
		
		// 17
		if(startHours < 34 && treatedHours >= 34 && !pc.hasPerk("Fuck Sense"))
		{
			AddLogEvent("Aside from feeling like a million bucks, you’re sure that the Treatment is feeding you information. Not boring stuff like formulae, but sexy, useful stuff - like your head is filling up with technical specifications for every kind of reproductive organ and how best to make it pulse with pleasure. You’re pretty confident that you could figure out the right way to wiggle to tease anyone or anything. There’s this way you can wiggle your butt... well, ausar are cute, right?", "passive", treatmentHourPrint(34, startHours));
			// Gain Fuck Sense - libido for tease eval
			ExtendLogEvent("\n\n(<b>Perk Gained: Fuck Sense</b> - The Sense ability now relies on your libido rather than intelligence.)");
			pc.createPerk("Fuck Sense",15,0,0,0,"Allows your sense ability to base success off your libido instead of intelligence.");
			// Libido to 40 or +5
			pc.libido(4);
			pc.lust(5);
		}
		
		// 18
		if(startHours < 36 && treatedHours >= 36)
		{
			AddLogEvent("You rub your nipple and smile. With how good this feels, you should be whimpering on the floor in a puddle of your own ", "passive", treatmentHourPrint(36, startHours));
			if(pc.hasVagina()) ExtendLogEvent(ParseText("[pc.girlCum]"));
			else if(pc.hasCock()) ExtendLogEvent(ParseText("[pc.cum]"));
			else if(pc.isLactating()) ExtendLogEvent(ParseText("[pc.milk]"));
			else ExtendLogEvent("drool");
			ExtendLogEvent(", but... but you’re not. You could probably take yourself to whole new heights of pleasure. Suddenly, regular orgasms seem like chopped liver, and you should be dining on caviar.");
			// Inhuman Desire +20 max lust.
			if(!pc.hasPerk("Inhuman Desire"))
			{
				ExtendLogEvent("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				ExtendLogEvent("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
			// Libido to 50 or +5
			pc.libido(4);
			pc.lust(5);
		}
		
		// 19
		if(startHours < 38 && treatedHours >= 38)
		{
			AddLogEvent("You giggle, ", "passive", treatmentHourPrint(38, startHours));
			if(pc.hasHair() && pc.hairLength >= 4) ExtendLogEvent(ParseText("twirling your [pc.hair]"));
			else
			{
				ExtendLogEvent(" and reach to twirl your hair before remembering you ");
				if(pc.hasHair()) ExtendLogEvent("don’t have enough");
				else ExtendLogEvent("don’t have any");
			}
			ExtendLogEvent(". Every laugh is accompanied by little bubbles of happiness in your head. You smile broadly. The good feelings are so contagious; you just have to share them!");
		}
		
		// 20
		if(startHours < 40 && treatedHours >= 40)
		{
			AddLogEvent("You look down at the Codex to check the time but stop yourself with a frown. Why did you set such an ugly background on it? It’s all boring - not even something fun, like pink. You spend a few minutes browsing the extranet for a better one, eventually settling on something bright to match how cheery you’re feeling.", "passive", treatmentHourPrint(40, startHours));
		}
		
		// 21
		if(startHours < 42 && treatedHours >= 42)
		{
			AddLogEvent("You’re taken by a sudden fantasy - sitting at your Steele Tech office, panties around your ankles. Your latest acquisition is kneeling between your thighs, getting his reward for selling his company at such a low price. One of your guards is sprawled out on your desk, filling your mouth with his length while you jack off his cohorts; it pays to keep one’s security happy after all.", "passive", treatmentHourPrint(42, startHours));
			// +11 lust
			pc.lust(11);
			// Libido to 60 or +5
			pc.libido(4);
		}
		
		// 22
		if(startHours < 44 && treatedHours >= 44 && !pc.hasPerk("Ditz Speech") && !pc.hasPerk("Brute Speech"))
		{
			AddLogEvent("Talking isn’t quite as easy as it used to be. There’s so many different words and concepts and ways to arrange them that by the time you get halfway through a sentence you’ve forgotten what you were trying to talk about. It’s way easier to just start talking with whatever words come to mind. Yeah, that’ll work!", "passive", treatmentHourPrint(44, startHours));
			// Ditz Speech
			ExtendLogEvent("\n\n(<b>Perk Gained: Ditz Speech</b> - You will now sound like a total bimbo in scenes that support it.)");
			pc.createPerk("Ditz Speech",0,0,0,0,"Alters dialogue in certain scenes.");
		}
		
		// 23
		if(startHours < 46 && treatedHours >= 46 && pc.hasPerk("Inhuman Desire"))
		{
			AddLogEvent(ParseText("A welcome flush rolls across your [pc.skin] as you consider your body. Your nerve endings seem alight with potential pleasure, just waiting to be touched and set off. Every part of your body begs for your attention and hands to tend to it. You idly rub your arms, [pc.hips], and [pc.legOrLegs] before letting go, tingling hotly. It’s all you can do to keep from touching yourself, but at the same time, you feel so good! Your overheated body can handle so much pleasure; it’s amazing! You’ve got to take your enhanced form for a spin and try some sex, just to see how incredible your orgasms will be. Maybe a few times in a row..."), "passive", treatmentHourPrint(46, startHours));
			// +5 lust
			pc.lust(5);
			// Inhuman Desire upgrade to +40.
			ExtendLogEvent("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
			pc.addPerkValue("Inhuman Desire",1,20);
			pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			// Libido to 75 or +5
			pc.libido(4);
		}
		
		// 24
		if(startHours < 48 && treatedHours >= 48 && !pc.hasPerk("Weak Mind"))
		{
			AddLogEvent("Is the Treatment done messing with your head yet? It’s gotta be, you figure. You’re having way more fun and thinking about cocks and stuff. Willpower is way down though. And book smarts? They’re kinda gross. All the stuff you read is still there, but it’s way easier not to think about. Besides, if you ever need to learn something you can just get a guy to explain it to you while you suck his cock!", "passive", treatmentHourPrint(48, startHours));
			// Weak Mind - Intelligence and Will losses doubled.
			ExtendLogEvent("\n\n(<b>Perk Gained: Weak Mind</b> - All intelligence and willpower losses are doubled.)");
			pc.createPerk("Weak Mind",0,0,0,0,"Intelligence and willpower losses doubled.");
		}
		
		// SPECIAL BIMBOCOW STUFF!
		if(effect.value1 == 0)
		{
			// by AHornyPanda
			
			// 72 hours:
			// Minimum lust raised to 33 + increase in fertility and wetness.
			if(startHours < 72 && treatedHours >= 72 && pc.hasVagina())
			{
				AddLogEvent(ParseText("A sudden heat overwhelms your [pc.vaginas] and radiates outwards, invading every inch of your body and sending your mind into carnal wonderland. You squirm with each wave of sexual need that passes over you, the mere"), "passive", treatmentHourPrint(72, startHours));
				if(!pc.isCrotchExposed()) ExtendLogEvent(ParseText(" friction between your [pc.underGarments] and"));
				else ExtendLogEvent(" breeze that sweeps over");
				ExtendLogEvent(ParseText(" your [pc.clits] as you move erratically only serves to heighten the exotic sensation. You reach down to relieve yourself, but all it takes is one touch to send you moaning into the throes of orgasm. Orgasmic bliss clouds your mind and senses, bringing you down to your knees, flooding"));
				if(!pc.isCrotchExposed()) ExtendLogEvent(ParseText(" your [pc.underGarments]"));
				else ExtendLogEvent(" the ground");
				ExtendLogEvent(ParseText(" with your [pc.girlCumVisc] [pc.girlCumNoun]."));
				ExtendLogEvent("\n\nThis was so amazing! Who knew you could experience such an orgasm from only a single touch!?");
				ExtendLogEvent(ParseText("\n\nAfter a brief moment of catching your breath, you get up and prepare to head on your way, only to realize that you are somehow still horny and your [pc.vaginas]. Looks like you will always be ready for sex from now on."));
				ExtendLogEvent("\n\nYour fuck senses also tell you that you will be much easier to impregnate.");
				
				if(!pc.hasPerk("Treated Readiness"))
				{
					ExtendLogEvent("\n\n(<b>Perk Gained: Treated Readiness</b> - Increases minimum lust to 33, ensuring you’re always ready to go.)");
					pc.createPerk("Treated Readiness",0,0,0,0,"Increases minimum lust to 33, ensuring you’re always ready to go.");
				}
				
				pc.orgasm();
				pc.fertilityRaw += 1;
				pc.boostGirlCum(25);
			}
			
			// 85 hours:
			// Gain bovine tongue.
			if(startHours < 85 && treatedHours >= 85 && pc.tongueType != GLOBAL.TYPE_BOVINE && rand(10) == 0)
			{
				AddLogEvent("A strange feeling in your mouth distracts you from fantasizing about sexy, New Texan hunks railing you. Within moments, it is concentrated into your tongue, and you feel it change shape, becoming smoother and broader. You pull out your codex and use its mirror to check on <b>your tongue, now a bovine one</b>. You are sure it will suit you once you become a full blown cow-slut.", "passive", treatmentHourPrint(85, startHours));
				
				pc.tongueType = GLOBAL.TYPE_BOVINE;
				pc.clearTongueFlags();
				pc.addTongueFlag(GLOBAL.FLAG_SMOOTH);
			}
			
			// 90 hours:
			// Gain "long" tongue flag.
			if(startHours < 90 && treatedHours >= 90 && pc.tongueType == GLOBAL.TYPE_BOVINE && !pc.hasTongueFlag(GLOBAL.FLAG_LONG) && rand(5) == 0)
			{
				AddLogEvent(ParseText("While admiring a passing stud, you feel your tongue push against your teeth on its own. Curiously, you open your mouth and your [pc.tongue] dangles out, longer than you remember it and still growing. It elongates more until it is a little over a foot long."), "passive", treatmentHourPrint(90, startHours));
				ExtendLogEvent("\n\nWow! You can already imagine all the new possibilities when going down on your mates. They’ll love it!");
				
				pc.addTongueFlag(GLOBAL.FLAG_LONG);
				pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			}
			
			// 160 hours
			// Total cumflation > 40000 mL, 1/10 Chance, Gain "Cum Highs".
			if(treatedHours >= 160 && pc.cumFlationAmount() >= 3000 && !pc.hasPerk("Cum Highs") && rand(2) == 0)
			{
				var filledHoles:int = 0;
				if(pc.statusEffectv1("Anally-Filled") > 0) filledHoles++;
				if(pc.statusEffectv1("Vaginally-Filled") > 0) filledHoles++;
				if(pc.statusEffectv1("Orally-Filled") > 0) filledHoles++;
				
				AddLogEvent("A strange, relaxing sensation emanates from your cum stuffed hole" + (filledHoles == 1 ? "" : "s") + ". You giggle uncontrollably, as your concerns dissipate and get replaced by happy thoughts. You can worry about your quest later. What matters is the now and how much you get to enjoy it.", "passive", treatmentHourPrint(160, startHours));
				ExtendLogEvent("\n\nDid you... just get high... on cum...? Awesome!");
				
				ExtendLogEvent("\n\n(<b>Perk Gained: Cum Highs</b> - You get high on the cum inside you!)");
				pc.createPerk("Cum Highs",0,0,0,0,"You can get high on cum.");
				
				cumHighUpdate(pc, pc.cumFlationAmount(), false);
			}
		}
		
		// SPECIAL CUMCOW STUFF :D
		if(effect.value1 == 2)
		{
			// 49 hours:
			// Grow a dick at 49 hours on the dot if doesn't have one. PC immediately becomes enthused.
			if(startHours < 49 && treatedHours >= 49)
			{
				if(!pc.hasCock())
				{
					AddLogEvent("Whoah, your crotch feels all... warm and tingly!", "passive", treatmentHourPrint(49, startHours));
					if(pc.isCrotchGarbed())
					{
						if(!pc.isCrotchExposed()) ExtendLogEvent(ParseText(" You pull your [pc.lowerGarment] out of the way, releasing "));
						else ExtendLogEvent(" You congratulate yourself on wearing something functional enough to allow you unimpeded access to ");
					}
					ExtendLogEvent("your sordidly glowing loins.");
					if(pc.hasVagina()) ExtendLogEvent(ParseText(" [pc.GirlCum] runs down your [pc.legs] as you bend low to inspect the disturbance, accidentally putting your [pc.vaginas] on to display to anyone who dares take a peek."));
					else ExtendLogEvent(ParseText(" Your [pc.asshole] flexes sympathetically as you bend low to inspect the disturbance, putting its eagerly winking ring on to display to anyone who dares take a peek."));
					ExtendLogEvent(" Stars! It feels so good you can barely stand!");
					ExtendLogEvent(ParseText("\n\nYou spot the source of it all a moment later, ignorant of your [pc.butt] subtly lifting in the air to better display itself. "));
					if(pc.hasVagina()) ExtendLogEvent(ParseText("Right above your [pc.vaginas]"));
					else ExtendLogEvent("Right in the middle of your pubic region");
					ExtendLogEvent(" is a small bulge, red and angry and getting bigger by the minute. Gingerly, you reach down and nearly collapse from the pleasure. Touching the little nub is like touching a live wire, like fondling a clit after an hour of foreplay, like ecstatic lightning is coursing up your spine and into your brain.");
					ExtendLogEvent("\n\nYou sink to the ground, giiggling and cooing");
					if(pc.legCount > 1) ExtendLogEvent(ParseText(", [pc.legs] akimbo"));
					ExtendLogEvent(", and uncross your eyes. The bump is bigger now, maybe an inch long and visibly growing by the minute. You don’t even have to touch it; surges of delight pump out of it with every pulse of blood that surges in, feeding the bizarre growth. Confused and excited, you gently caress it, moaning as it engorges at your touch, feeling the tip gain a defining ridge, just like a penis.");
					ExtendLogEvent("\n\nYour eyes shoot open, but your hand won’t stop stroking what you now realize is <b>your new cock.</b> Every tug on the cute little rod is like food for the swelling, misplaced manhood, letting it get thicker, longer, and veinier. You whimper as a droplet of pre slips out, greasing your palm, and you stroke faster. You must look like quite a sight, dropped on your ass and furiously masturbating an increasingly respectable looking dick.");
					ExtendLogEvent("\n\nCum squirts out, cloudy and white, hard enough to slap into the underside of your chin, but you keep stroking, reveling in the pleasure and giggling in mad delight. <b>You’ve got a dick!</b> A dick that’s at six... no, seven inches long already! It surges one last time, oozing cum over your fingertips, then relaxes, spent for the moment.");
					ExtendLogEvent("\n\nNo wonder guys are so eager to get off all the time, if that’s what it feels like for them. It’s all warm and hot and demanding, and then there’s nothing but white-hot pleasure and cum and slickness and ohhh... you want to do it again. Your new dick twitches in agreement, bringing a smile to your lips and naughty thoughts to your mind. You can stroke it any time you want, and maybe someday you could even suck it. Your mouth waters at the unspoken thought.");
					ExtendLogEvent("\n\nWho cares why the Treatment gave you a dick. Dicks are <i>amazing</i>.");
					pc.orgasm();
					pc.createCock();
					pc.setNewCockValues(0);
				}
				// Else - blurb about PC marvelling over how awesome their own dick is.
				else
				{
					// Below 75% lust, acquire boner
					if(pc.lust() < 75)
					{
						AddLogEvent(ParseText("Out of nowhere, you feel your [pc.cocks] erect, filling to a full tumescent state in a matter of seconds."), "passive", treatmentHourPrint(49, startHours));
						if(!pc.isCrotchExposed())
						{
							if(pc.cockTotal() > 1) ExtendLogEvent(" They’re so hard that they threaten");
							else ExtendLogEvent(" It’s so hard that it threatens");
							ExtendLogEvent(ParseText(" to split your [pc.lowerGarments] open. You do the sensible thing and pull your bottoms open before your inexplicable arousal overwhelms their structural integrity."));
						}
						ExtendLogEvent(" Fuck, ");
						if(pc.cockTotal() == 1) ExtendLogEvent("it’s");
						else ExtendLogEvent("they’re");
						ExtendLogEvent(" as big as you’ve ever seen ");
						if(pc.cockTotal() == 1) ExtendLogEvent("it");
						else ExtendLogEvent("them");
						ExtendLogEvent(". The veins stand out like iron bars, the flesh taut and gleaming like polished silver. ");
						if(pc.cockTotal() == 1) ExtendLogEvent("It bounces");
						else ExtendLogEvent("They bounce");
						ExtendLogEvent(" rhythmically with the beats of your heart, almost hypnotically.");
					}
					else
					{
						AddLogEvent(ParseText("[pc.EachCock], already hard, somehow seems to grow even harder. The full flesh tightens. The veins bulge. And the skin is pulled so taut by your tumescence that it gleams like the polished skin of a god."), "passive", treatmentHourPrint(49, startHours));
					}
					// Merge
					ExtendLogEvent("\n\nYou can’t manage to make yourself look away, but neither are you inclined to hide the sight of it with a trembling palm. So you do the only thing you can think of: stare at your own dick with a sense of growing appreciation. Sure, cocks seem pretty awesome, but this is <i>your</i> cock. This is an organ every bit as awesome as the rest of you, maybe more so. You memorize its every feature in perfect detail, watching it flex and ooze its eagerness. If it were on anyone else, you’d be between their knees, sucking. How lucky you keep it on your person at all times.");
					ExtendLogEvent("\n\nEventually, you shake yourself free the mesmeric charm, still just as hard and aching as before. Maybe it’s time you gave yourself some loving. Right now, you feel like your own hands would be almost as good as an eager mouth.");
					pc.lust(45);
				}
			}
			
			if(!pc.hasCock() && treatedHours >= 50)
			{
				AddLogEvent("A new penis springs out of your crotch new and fully formed. The Treatment seems determined to give you a dick. At least this one is, like, totally cute.", "passive", treatmentHourPrint(treatedHours, startHours));
				pc.createCock();
				pc.setNewCockValues(0);
			}
			
			// 57 hours:
			// Dick expands in size. Grow balls if none
			if(startHours < 57 && treatedHours >= 57 && pc.hasCock())
			{
				if(pc.cockTotal() == 1)
				{
					AddLogEvent("Your cock fattens deliciously one moment, then surges forward the next, straining as it adds an inch, then two to its length. More and more cock pours forth from your loins, the growth aided by budding tumescence until your boner is bigger than ever before", "passive", treatmentHourPrint(57, startHours));
					if(pc.cocks[0].hasFlag(GLOBAL.FLAG_FLARED)) ExtendLogEvent(", the enormous flare bowing down under its own weight");
					else if(pc.hasKnot(0)) ExtendLogEvent(", the enormous knot pulsing with fitful bursts of pleasure, thick enough to break a bitch in half");
					else if(pc.cocks[0].cType == GLOBAL.TYPE_FELINE) ExtendLogEvent(", the rubbery nubs that cover it bigger and more sensitive than ever. A mere touch is enough to make you shiver");
					else ExtendLogEvent(", rigid and proud");
					ExtendLogEvent(". You stroke and giggle to yourself, just as pleased to be able to get a handjob as give one. It’s like multitasking but better!");
					ExtendLogEvent(ParseText("\n\nBy the time you’re done grinning over your good fortune, your [pc.cock] is at least three or four inches longer and anxiously leaking pre. The gooey stuff is pouring out like water from a leaky faucet, enough to polish your jutting member, accompanied by an exotic sensation of tightness from somewhere inside you. It’s like something is reaching into you, threatening to squeeze the [pc.cumNoun] right out of you."));
				}
				// Dick Expansion - Multi
				else
				{
					AddLogEvent("Your cocks fatten delicious one moment, then surge forward the next, straining as they add an inch, then two to their perversely wobbling lengths. More and more cock pours forth from your loins, jostling against each other as they expand, the growth only aided by their increasingly tumescent forms until they’re unquestionably bigger than before.", "passive", treatmentHourPrint(57, startHours));
					if(pc.cocks[0].hasFlag(GLOBAL.FLAG_FLARED)) ExtendLogEvent(" You can feel the heavy weight of your enormous flare dragging on dick lower, bowing it beneath the weight of its recently expanded, obscene crown.");
					else if(pc.hasKnot(0)) ExtendLogEvent(" You can feel the paradoxical pulsing of your knot, fitfully broadcasting a newfound ability to break a bitch in half if you’re not careful.");
					ExtendLogEvent(" You stroke two and giggle to yourself, just as pleased to give out a double handjob as to get one. It’s, like, more efficient or something, like scratching two itches that seem unrelated but satisfy the exact same urge.");
					ExtendLogEvent(ParseText("\n\nBy the time you’re able to think about anything but the friction of your palms on your pricks, your embiggened tools are at least three or four inches bigger and anxiously leaking pre. The gooey stuff pours out like water from leaky faucets, soaking your members in your pernicious polish. You aren’t sure <i>why</i> you’re so drippy, but you wager it has something to do with the budding tightness inside you, almost like something is about to squeeze the [pc.cumNoun] right out of you."));
				}
				
				for(var cc:int = 0; cc < pc.cockTotal(); cc++)
				{
					pc.cocks[cc].cLengthRaw += 3 + rand(2);
				}
				
				// Single Ball - add one
				if(pc.balls == 1)
				{
					ExtendLogEvent(ParseText("\n\nThat pleasant internal pinching rises to a peak, then suddenly abates as you feel something <i>slip</i> down and out of you. Your [pc.sack] feels abruptly tight, and with a curious probe, you discover a second testicle has dropped. <b>You have two balls!</b> No wonder there was so much pre. You sloppily jack yourself for another minute, waiting to see if any other changes manifest, but none do."));
					ExtendLogEvent("\n\nYou may as well find a way to get off. You’re going to be useless until someone milks all this cum out. That someone could you");
					if(pc.canAutoFellate(-1)) ExtendLogEvent(". A blowie would feel good <i>and</i> give you a midday snack.");
					else
					{
						ExtendLogEvent(". Maybe you could even bend over and suck yourself off. It’d probably feel amazing <i>and</i> give you a lovely midday snack.");
						if(pc.canAutoFellate(-1)) ExtendLogEvent(" A quick check reveals that you can’t... at least not yet. Maybe soon.");
					}
					pc.balls++;
					if(pc.ballSizeRaw < 4) pc.ballSizeRaw = 4;
				}
				// Multiple - grow slightly
				else if(pc.balls > 1)
				{
					ExtendLogEvent(ParseText("\n\nThat pleasant pinching peaks, accompanied by a sudden straining of your [pc.sack], and then relaxes, bringing with it some additional weight"));
					if(pc.legCount > 1) ExtendLogEvent(ParseText(" between your [pc.legs]"));
					else ExtendLogEvent(" below the waist");
					ExtendLogEvent(". You gingerly explore, giving yourself a gentle poke that nearly makes you squirt. <b>Your balls got bigger too!</b> No wonder there’s been so much pre-cum! The Treatment is making everything dick-related bigger and better, which would probably confuse you if you bothered to think about anything besides how good it feels.");
					pc.ballSizeRaw += 2;
					if(pc.ballSizeRaw < 4) pc.ballSizeRaw = 4;
					ExtendLogEvent("\n\nYou sloppily jack yourself for another minute, waiting to see if any other changes manifest, but none do. And then you jack yourself some more, wondering if you should find a way to get off properly. You’re going to be useless until someone drains these nuts. Then again, that someone could be you. ");
					if(pc.canAutoFellate(-1)) ExtendLogEvent("How long has it been since you’ve sucked yourself off? Too long, for sure. T");
					else
					{
						ExtendLogEvent("There’s enough dick in your hands that you could probably suck yourself off if you were so inclined. Get a little pleasure and a little snack.");
						ExtendLogEvent(" You lean down to check, and pout when you discover that you’re still too short. Damn. Still, t");
					}
					ExtendLogEvent("he thought of all that cum in your mouth makes you a little lightheaded. Yeah, something oral would be nice....");
				}
				// None - GET YOU A SACK, SON
				else
				{
					ExtendLogEvent("\n\nThe pleasant pinching peaks into an uncomfortable mix of ecstasy and agony. It throbs inside you until you’re oozing pre and whimpering, incapable of doing anything anything but rubbing your sodden dick");
					if(pc.cockTotal() > 1) ExtendLogEvent("s");
					ExtendLogEvent(" and hoping for some kind of release. Then something - no, two somethings slip inside you, and low, warm weight settles beneath your still-squeezing palms. You gingerly reach down and around to discover <b>your new balls</b>. It looks like you’re going to be a fully functional ");
					if(pc.hasVagina()) ExtendLogEvent("hermaphrodite");
					else ExtendLogEvent("shemale cow");
					ExtendLogEvent(ParseText(".\n\nContinuing to jack yourself off, you wait for any further changes, but nothing comes, not even your orgasm, at least not yet. If you’re going to be any use at all today, you’re probably going to need to find someone to get you off. Maybe that someone could be you. Does having proper balls make [pc.cumNoun] taste any better? Will it be thicker or sweeter?"));
					if(pc.canAutoFellate(-1)) ExtendLogEvent(ParseText(" All you need to do is slip your [pc.cockHeadBiggest] into your lips and start sucking, and you’ll find out."));
					else ExtendLogEvent(ParseText(" All you need to do is get a little longer so that you can slip your [pc.cockHeadBiggest] between your lips, and you can suck until you find out."));
					ExtendLogEvent(" Ooh, that’d be nice....");
					pc.balls = 2;
					if(pc.ballSizeRaw < 4) pc.ballSizeRaw = 4;
				}
				// All - max lust
				pc.maxOutLust();
			}
			
			if ((pc.balls <= 0 || pc.ballSizeRaw <= 0) && treatedHours >= 58)
			{
				AddLogEvent("A tremendous pressure builds in your loins, then releases into twin points of release - <b>your new testicles.</b> You suppose balls must be an important part of whatever you’re going through.", "passive", treatmentHourPrint(treatedHours, startHours));
				pc.balls = 2;
				pc.ballSizeRaw = 4;
			}
		
			// 64 hours:
			// Minimum lust raised to 33 + increase in refractory rate + ball swelling + cock swelling
			if(startHours < 64 && treatedHours >= 64 && pc.hasCock() && pc.balls > 1)
			{
				AddLogEvent(ParseText("A flush warms your cheeks out of nowhere, accompanied by a sudden surge in blood down below, making your [pc.cocks]"), "passive", treatmentHourPrint(64, startHours));
				if(!pc.isCrotchExposed()) ExtendLogEvent(ParseText(" strain delightfully against your [pc.lowerGarment]."));
				else ExtendLogEvent(" jut delightfully in front of you.");
				ExtendLogEvent(ParseText(" Still more unexpected is the way they begin to lurch and jerk in the air, completely hands-free. The flush in your cheeks spreads to your [pc.chest], down your [pc.belly], and finally settles into your [pc.balls], suffusing them with wet heat. Whimpering, in delight and awe, you watch your [pc.cocks] begin to expand with every twitch, each movement heavier than the last."));
				ExtendLogEvent(ParseText("\n\nOrgasm slaps you upside the head like a jilted lover, demanding your full attention as thick ropes of [pc.cum] erupt from your distended cum-slit"));
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				ExtendLogEvent(", painting long lines across the ground in front of you even as you continue to grow. It’s incredible! All the pleasure of an orgasm is coursing through you mixed with the delight of ");
				if(pc.cockTotal() == 1) ExtendLogEvent("a ");
				ExtendLogEvent("swelling maleness");
				if(pc.hasVagina()) ExtendLogEvent(", or hermness in your case");
				ExtendLogEvent(". And you haven’t even touched yourself! You giggle drunkenly, spraying cum for what feels like hours, hypnotized by the increasing size and beauty of your member");
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				ExtendLogEvent(".\n\nBy the time the spunk runs out, you’re pretty sure you’ve gained at least two or three inches of length, bigger balls, and a lovely memory to think about the next time you go for a stroke. Your wilting member");
				if(pc.cockTotal() > 1) ExtendLogEvent("s twitch");
				else ExtendLogEvent(" twitches");
				ExtendLogEvent(" at the thought, suddenly leaping back to full hardness. Are you... you’re ready to go again? You look down at the ");
				if(pc.cumQ() < 1000) ExtendLogEvent("small ");
				ExtendLogEvent("lake of cum below and the wonderful tool");
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				ExtendLogEvent(" that created it and smile.");
				ExtendLogEvent("\n\nYou’re definitely good to go again. Somehow, you know that you’re always going to be ready to make a mess. It doesn’t matter if you just sucked yourself dry or spent an hour in New Texas’s milkers, your perfect prick");
				if(pc.cockTotal() > 1) ExtendLogEvent("s are");
				else ExtendLogEvent(" is");
				ExtendLogEvent(" is always going to be ready to please.");

				// MIN LUST BOOOOST
				if(!pc.hasPerk("Treated Readiness"))
				{
					ExtendLogEvent("\n\n(<b>Perk Gained: Treated Readiness</b> - Increases minimum lust to 33, ensuring you’re always ready to go.)");
					pc.createPerk("Treated Readiness",0,0,0,0,"Increases minimum lust to 33, ensuring you’re always ready to go.");
				}
				pc.orgasm();
				for(x = 0; x < pc.cockTotal(); x++)
				{
					pc.cocks[x].cLengthRaw += 2 + rand(2);
				}
				pc.ballSizeRaw += 5+rand(5);
				if(pc.refractoryRate < 30) pc.refractoryRate = 30;
				else pc.refractoryRate += 5;
				pc.boostCum(25);
			}
			
			// 73 hours:
			// Ball Growth
			if(startHours < 73 && treatedHours >= 73 && pc.balls > 0)
			{
				AddLogEvent(ParseText("Your musings are interrupted by a sudden swaying from your [pc.balls]. ") + (pc.balls == 1 ? "It wobbles" : "They wobble") + " so heavily that you can’t possibly ignore it, and when you reach down to shift " + (pc.balls == 1 ? "it" : "them") + ", you discover that " + (pc.balls == 1 ? "it’s" : "they’ve") + " grown bigger over the last half day or so. You gently squeeze and moan, feeling a little pre-cum ooze out from the tip", "passive", treatmentHourPrint(73, startHours));
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				ExtendLogEvent(ParseText(" of your [pc.cocks]. The little cum ") + (pc.balls == 1 ? "factory seems" : "factories seem") + " to be constantly swelling in size and pleasurability.");
				
				pc.ballSizeRaw += 5 + rand(5);
				
				if(pc.ballDiameter() > pc.biggestTitSize()) ExtendLogEvent(" If this keeps up, people are going to pay more attention to them than your breasts! ...Though you’re starting to think balljobs might be more fun than titfucks.");
				pc.lust(5);
				pc.boostCum(10);
			}
			
			// 80 hours:
			// Cock growth
			if(startHours < 80 && treatedHours >= 80 && pc.hasCock())
			{
				AddLogEvent(ParseText("You were just thinking about how amazing your [pc.cocks] "), "passive", treatmentHourPrint(80, startHours));
				if(pc.cockTotal() == 1) ExtendLogEvent("looks and feels");
				else ExtendLogEvent("look and feel");
				ExtendLogEvent(" when ");
				if(pc.cockTotal() == 1) ExtendLogEvent("it");
				else ExtendLogEvent("they");
				ExtendLogEvent(" got hard out of nowhere! So you did the only sensible thing you could possibly do in such a situation - ");
				if(!pc.isCrotchExposed()) 
				{
					ExtendLogEvent("pull ");
					if(pc.cockTotal() == 1) ExtendLogEvent("it");
					else ExtendLogEvent("them");
					ExtendLogEvent(" out and ");
				}
				ExtendLogEvent("admire how amazingly sexy ");
				if(pc.cockTotal() == 1) ExtendLogEvent("it looks");
				else ExtendLogEvent("they look");
				ExtendLogEvent(". Your mouth waters at the sight, and you swear ");
				if(pc.cockTotal() == 1) ExtendLogEvent("it gets bigger");
				else ExtendLogEvent("they get bigger");
				ExtendLogEvent(" before your eyes, adding an inch or two of extra size just to give you a reason to watch " + (pc.cockTotal() == 1 ? "it" : "them") + " longer.");

				ExtendLogEvent("\n\nWiping the drool from your chin, you put " + (pc.cockTotal() == 1 ? "it" : "them") + " away and try to go about your day without thinking of the enormous weight ");
				if(!pc.isCrotchExposed()) ExtendLogEvent(ParseText("stuffed into your [pc.lowerGarments]"));
				else if(pc.legCount > 1) ExtendLogEvent(ParseText("swinging between your [pc.legs]"));
				else ExtendLogEvent("dangling in front of you");
				ExtendLogEvent(". Needless to say, the organ between your ears won’t stop fantasizing about the one ");
				if(pc.legCount > 1) ExtendLogEvent(ParseText("between your [pc.legs]"));
				else ExtendLogEvent("below the belt");
				ExtendLogEvent(", and after a few minutes you stop trying to resist it. Your dick");
				if(pc.cockTotal() > 1) ExtendLogEvent("s are");
				else ExtendLogEvent(" is");
				ExtendLogEvent(" great anyway.");

				for(x = 0; x < pc.cockTotal(); x++)
				{
					pc.cocks[x].cLengthRaw += 1 + rand(2);
				}
			}
			
			// 100 hours:
			// Possible Milk-Herm Perk (Milk for Cum)
			if(startHours < 100 && treatedHours >= 100 && pc.canLactate() && pc.cumType != GLOBAL.FLUID_TYPE_MILK)
			{
				AddLogEvent(ParseText("The worst part of being a cummy, constantly ready-to-go cow-[pc.boyGirl] is definitely the fluid problem. If you think about someone pretty, or the taste of your own dickskin, or fucking a cow-girl until she’s dopey and mooing, you inevitably start to leak pre-cum all over yourself"), "passive", treatmentHourPrint(100, startHours));
				if(!pc.isNude()) ExtendLogEvent(" and your clothing");
				ExtendLogEvent(ParseText(". And then you’ll inevitably wind up doing something sexy with yourself or someone else and getting even messier - and then you smell like your own [pc.cumNoun] a... Oh fuck, you’re dripping again!"));
				ExtendLogEvent(ParseText("\n\nSomething’s different this time, though. It’s not quite as viscous as it normally is, and though it’s white, it smells sweeter, almost creamy. You gather a dollop on your finger and hold it up to your nose. It smells like... like... milk! <b>Your ejaculate has been replaced with delicious, creamy milk!</b> You grab [pc.oneCock] and squeeze a dollop onto your palm to drink. This is <i>awesome</i>."));
				ExtendLogEvent("\n\nCould your cockmilk still knock someone up? Like, could you stuff a girl full of milk and make her have a baby? You have a hunch the answer is yes, but it’d be way more fun to find out than to fiddle with the scanner on your boring old Codex.");
				pc.cumType = GLOBAL.FLUID_TYPE_MILK;
				pc.orgasm();
				pc.boostCum(5);
			}
			
			// 110 hours:
			// Panic Ejaculation Unlock Chance
			if(startHours < 110 && treatedHours >= 110 && !pc.hasPerk("Panic Ejaculation"))
			{
				AddLogEvent(ParseText("The strangest thing happens while you’re walking. You trip - but that isn’t the strange part. As you’re falling, flailing in absolute panic, your [pc.cocks] start"), "passive", treatmentHourPrint(110, startHours));
				if(pc.cockTotal() == 1) ExtendLogEvent("s");
				ExtendLogEvent(" firing cum everywhere.");
				if(!pc.isCrotchExposed()) ExtendLogEvent(ParseText(" Your [pc.lowerGarment] catches most of it, ensuring that you’re slicked in [pc.cum] from the waist down."));
				else ExtendLogEvent(ParseText(" There’s a small lake of [pc.cum] on the ground by the time you make contact, slicking the entire front half of your body in your own delightful ejaculate."));
				ExtendLogEvent(ParseText(" You stumble up on your [pc.feet], feeling a little drained, a little confused, and unsure of just why <b>you’re able to cum when panicked.</b>"));
				ExtendLogEvent("\n\nMaybe there’s a use for such a talent you haven’t considered, aside from sexual relief at inappropriate times.");
				// Gain Panic Ejaculation! WEEE
				ExtendLogEvent("\n\n(<b>Perk Gained: Panic Ejaculation</b> - Allows you to squirt out a little cum while grappled, easing your escape!)");
				pc.createPerk("Panic Ejaculation",0,0,0,0,"Allows you to squirt out a little cum while grappled, easing your escape!");
			}
			
			// 125 hours:
			// Massive dick growth leading to autofellatio. PC marvels at how it’s just as good as sex, maybe better. (Chance of Autofellatio Queen perk unlock. Chance of Autococknosis perk unlock)
			if(startHours < 125 && treatedHours >= 125 && pc.hasCock() && pc.genitalLocation() <= 1)
			{
				var dickBiggered:Boolean = false;
				
				// Can already autofellate - no cock growth - short intro
				if(pc.canAutoFellate(-1, true))
				{
					x = pc.longestCockIndex();
					AddLogEvent(ParseText("[pc.OneCock] slaps accusingly against your [pc.chest]"), "passive", treatmentHourPrint(125, startHours));
					if(pc.biggestTitSize() >= 3) ExtendLogEvent(", nestling itself into the cleavage");
					ExtendLogEvent(ParseText(". You gasp and look down, suddenly overwhelmed by the sight of your [pc.cockHead " + x + "] throbbing just in front of you. Fuck, that’s sexy! You run a fingertip gingerly down your swollen cumvein, feeling it already filling up with your "));
					if(pc.cumType == GLOBAL.FLUID_TYPE_MILK) ExtendLogEvent("milky ");
					ExtendLogEvent("pre, only stopping when you feel your drool splashdown onto the eager tip. <i>“Fuck it,”</i> you figure. Your cock clearly needs sucking.");
				}
				// Else grow till can fellate - Boom boom bigcock
				else {
					x = pc.longestCockIndex();
					AddLogEvent(ParseText("[pc.OneCock] slaps accusingly against your [pc.belly], then your [pc.chest]. It’s growing again, faster than before. The [pc.cockHead " + x + "] is getting wider and wider as it climbs up to your collarbone, the straining surface glossy and taut, polished by the suddenly oozing pre-cum that pours from the winking slit at the summit. You rub it encouragingly"), "passive", treatmentHourPrint(125, startHours));
					if(pc.biggestTitSize() >= 3) ExtendLogEvent(" as it batters through your cleavage");
					else ExtendLogEvent(" as it slips across your body");
					ExtendLogEvent(", leaving a trail of slime in its wake, climbing higher and higher.");

					var backupCount:int = 0;
					while(!pc.canAutoFellate(x, true) && backupCount < 100)
					{
						pc.cocks[x].cLengthRaw += 2 + rand(4);
						backupCount++;
					}
					if(backupCount >= 99) ExtendLogEvent(" <b>ERROR. Something was fucked with dick growth.</b>");
					dickBiggered = true;
					ExtendLogEvent("\n\nYou barely notice your drool until it lands on the fattening rod, drooling down the side, greasing hands that suddenly seem determined to pump it faster than a butter churn. You moo, still staring at your member. Then a thought comes to mind - there’s a cock in front of you and your mouth is open. Why aren’t you sucking it? Why aren’t you slobbering all over that prick until its owner is gurgling and cumming?");
				}
				// Suck dat chode
				ExtendLogEvent(ParseText("\n\nYour tongue touches down first, and that first contact is electric. A barrage of tastes and smells and synesthetic feelings assault you. You swear you can see the lust your cock exudes as a palpable object you could just reach out and touch, if you dared stop rubbing. You bend your neck a little and spread your [pc.lips] as wide as you dare, engulfing the [pc.cockHead " + x + "] in your slobbering maw a moment later. It feels just as good as it tastes."));
				ExtendLogEvent("\n\nYou suck greedily. The sloppy echoes of your overeager blowjob fill the air around you, but you suck uncaringly, worshiping the pole of your phallic totem with both hands, squeezing fat drops of tasty pre-cum onto your tongue. You swish it around your teeth, delighting in the sensuous flavor, and slide your tongue out further");
				if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) ExtendLogEvent(", wrapping it around your length like the stripes of a barber’s pole");
				ExtendLogEvent(", savoring the salty flavor of it all.");

				ExtendLogEvent(ParseText("\n\nThis is addictive, part of you realizes, but you don’t let that stop you. You doubt you’d let anything stop you at this point. A squad of kaithrit Sphynx Warriors could stomp up to you, and you’d keep right on sucking, making love to your [pc.cock " + x + "] with your mouth so eagerly that you’re dizzy from forgetting for breathe. Cock tastes <i>amazing</i>, better than the sweetest fruit or the saltiest snack. No, not just any cock - your cock. Your cock is perfect. One last growth spurt thrusts it firmly into your maw, prying your [pc.lips] wider than ausar porn-star’s gaping cunt, filling you with phallus and pleasure alike."));
				ExtendLogEvent(ParseText("\n\nYou flare your nostrils, drinking in as much air as you dare, then barrel down on your [pc.cock " + x + "], taking it as far back into your throat as you dare"));
				if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) ExtendLogEvent(", feeling the flare sealing itself against your throat");
				else if(pc.hasKnot(x)) ExtendLogEvent(", feeling your knot inflate from the sensation");
				ExtendLogEvent(ParseText(". Spit froths at the edges of your mouth and busily jacking hands while your urethra bloats in pre-orgasmic delight. [pc.Cum] mixes with the pre, and a sudden powerful contraction ripples through your muscles, curling tighter and tighter and tighter and then... relief!"));
				ExtendLogEvent(ParseText("\n\n[pc.Cum] splashes onto the back of your tongue and down your greedily drinking throat. You can feel it splashing into your stomach, the extra thick squirts flooding your neck in the brief moment before you completely devour them. Your eyes roll back, but you keep sucking and drinking on autopilot, like the Treatment has grown a part of your brain that can guide your body while you’re busy too busy cumming and quivering to think. It’s a good thing too, because you’re swallowing a lot of jizz. There’s enough to give your belly a little pudge and then some more, tingling on your tongue and delighting you with bliss-blasting mental fireworks."));
				pc.loadInMouth(pc);
				ExtendLogEvent(ParseText("\n\nThe [pc.cockHead " + x + "] escapes your [pc.lips] at some point, painting them in a lovely layer of [pc.cumColor]"));
				if(pc.cumQ() >= 10000)
				{
					ExtendLogEvent(ParseText(", then keeps squirting, hosing extra spunk across your [pc.hair], shoulders, and back. It slaps wetly against you, getting a shower by standing under a firehose full of goo. There’s just so much cum! Your straining middle could never contain it all, much as you might want to, so you make do by rubbing the excess over your [pc.chest] and [pc.cocks] both, sometimes even catching some in your mouth so that you can spit it onto a spot that hasn’t been glazed yet."));
					pc.applyCumSoaked();
					pc.applyCumSoaked();
				}
				else ExtendLogEvent(". More jizz dribbles out, the last dregs of your orgasm, so you take your time licking them from the pulsing length, greedily devouring every drop.");
				if(pc.cockTotal() > 1)
				{
					ExtendLogEvent(" Then you turn to your other dick");
					if(pc.cockTotal() > 1) ExtendLogEvent("s");
					ExtendLogEvent(", polishing every square inch of cock-skin that you can lay your tongue on. Maybe next time you can squeeze more than one into your mouth...");
				}
				// Realize how fucking awesome it is and that you feel totes my goats refreshed.
				ExtendLogEvent(ParseText("\n\nFuck yes, that was awesome! All that cumming, and if anything you feel even less tired than before. Is the Treatment, like, making you better at sucking your own cock so that you can do it all the time? Or maybe it did something to your [pc.cumNoun] to help it restore your energy. Who cares! If you get tired, you can just lean down and get a cock-snack, then go right back to adventuring... or fucking, you suppose. You pat your "));
				if(dickBiggered) ExtendLogEvent("bigger ");
				ExtendLogEvent("dick and giggle delightedly, convinced that your mouth is going to taste like sex for the rest of your life.");
				// Gain Autofellatio Queen perk
				pc.orgasm();
				pc.energy(20);
				if(!pc.hasPerk("Autofellatio Queen"))
				{
					ExtendLogEvent("\n\n(<b>Perk Gained: Autofellatio Queen</b> - Allows you to recover energy by drinking your own seed.)");
					pc.createPerk("Autofellatio Queen",0,0,0,0,"Allows you to recover energy by drinking your own seed.");
				}
			}
			
			// 130 hours:
			// Catch balls swelling and cock drooling
			if(startHours < 130 && treatedHours >= 130 && pc.hasCock() && pc.balls > 1)
			{
				AddLogEvent(ParseText("Ooh, your [pc.balls] feel so warm they’re practically glowing! You dance in place, feeling them wobbling back and forth"), "passive", treatmentHourPrint(130, startHours));
				if(pc.legCount > 1) ExtendLogEvent(ParseText(" between your [pc.thighs]"));
				ExtendLogEvent(ParseText(", so big and full of [pc.cum] that they squish and slosh from the motions. It feels so good that you soon forget your dance and flop down"));
				if(pc.legCount > 1) ExtendLogEvent(ParseText(", [pc.legs] spread as wide as possible to make room for your swelling nutsack"));
				ExtendLogEvent(ParseText(". Your [pc.cocks] join"));
				if(pc.cockTotal() == 1) ExtendLogEvent("s");
				ExtendLogEvent(" right on in, jutting up as the pernicious lust infects them, already oozing their yummy goo. <i>“How do the boys do it?”</i> you wonder. How do they keep from just worshipping themselves all day long?");
				ExtendLogEvent("\n\nYou nuzzle up against ");
				if(pc.cockTotal() > 1) ExtendLogEvent("the closest");
				else ExtendLogEvent("your");
				ExtendLogEvent(" dick and start licking it, roughly massaging a bloating ball with one hand, feeling them both expand. It’s not just the feel that you love but the heat and the smell, the way your flesh quivers and pulses on contact. It’s almost like your male genitalia doesn’t belong to you, like it’s an insatiable bull you get to carry around with you at all hours of the day and fuck and rub and fondle and... and... <i>service</i> forever and ever.");
				ExtendLogEvent(ParseText("\n\nA few ropes of [pc.cum] squirt out, providing a smidgen of relief as your abruptly overfull balls vent the excess created by their inexplicable growth. They’re so soft but so full, and they aren’t the only part of you that looks a little bigger. Your dick"));
				if(pc.cockTotal() > 1) ExtendLogEvent("s look");
				else ExtendLogEvent(" looks");
				ExtendLogEvent(" to have gained another inch or two as well, and as a bonus, ");
				if(pc.cockTotal() == 1) ExtendLogEvent("it seems");
				else ExtendLogEvent("they seem");
				ExtendLogEvent(" to be retaining much more of ");
				if(pc.cockTotal() == 1) ExtendLogEvent("its");
				else ExtendLogEvent("their");
				ExtendLogEvent(" size while flaccid. It’s going to be impossible to hide the python");
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				ExtendLogEvent(" down there, but do you really want to?");
				ExtendLogEvent(ParseText("\n\nThe idea that anyone could see your massive bulge has you flushing and eager tend to your [pc.cocks] once more, but you should probably attend to your other business first. What was it that was more important than orgasms again? You forget the question before you remember the answer. Gosh, you’re such a cum-cow!"));
				// Bigger balls & dick, + refill cum & blue balls
				pc.ballSizeRaw += 6;
				for(x = 0; x < pc.cockTotal(); x++)
				{
					pc.cocks[x].cLengthRaw += 1 + rand(2);
					if(pc.cocks[x].flaccidMultiplier < 0.75) pc.cocks[x].flaccidMultiplier = 0.75;
				}
				if(!pc.hasStatusEffect("Blue Balls")) pc.applyBlueBalls();
				// Orgasm -> +5 lust
				pc.orgasm();
				pc.lust(5);
			}
			
			// 155 hours:
			// Exhibitionism gains from playing with your enormous cocks.
			// Plays the next time the PC is in a public place
			if(startHours < 155 && treatedHours >= 155 && pc.hasCock() && pc.exhibitionism() < 66)
			{
				pc.createStatusEffect("Treatment Exhibitionism Gain 4 DickGirls");
			}
			
			// 160 Hours:
			// Possible Milk Fountain Perk
			if(startHours < 160 && treatedHours >= 160 && pc.canLactate() && !pc.hasPerk("Milk Fountain"))
			{
				AddLogEvent(ParseText("Your [pc.nipples] feel warm and... wet. You reach up to feel, "), "passive", treatmentHourPrint(160, startHours));
				if(!pc.isChestExposed()) ExtendLogEvent(ParseText("rubbing them through your dampening [pc.upperGarment]"));
				else ExtendLogEvent("rubbing your leaking chest");
				ExtendLogEvent(ParseText(". You didn’t even have to grab them and tug, the [pc.milk] just started coming out on its own, like your teats can drip and drool every bit as eagerly as your [pc.cocks]. The Treatment isn’t just making you a cow, or a cum-cow; it’s making every part of you drip and leak at the slightest arousal. <b>You’ll probably squirt when you cum now, too.</b> Maybe not all the time, but you bet it happens super easily. Your tits wouldn’t even need to be full or anything."));
				// Milk Fountain~
				ExtendLogEvent("\n\n(<b>Perk Gained: Milk Fountain</b> - Allows you to squirt milk with the greatest of ease.)");
				pc.createPerk("Milk Fountain",0,0,0,0,"Allows you to squirt milk with the greatest of ease.");
			}
			
			// 165 Hours - final negative perk
			if(startHours < 165 && treatedHours >= 165)
			{
				// Autococknosis - Sometimes automatically autofellate when resting or gain extra lust while resting.
				if(!pc.hasPerk("Auto-Autofellatio") && rand(3) <= 1)
				{
					pc.createPerk("Auto-Autofellatio",0,0,0,0,"Makes you so enamored of yourself that you can’t resist some auto-fellatio.");
				}
				// Dumb4Cum - Intelligence is reduced after 24 hours without swallowing cum.
				if(!pc.hasPerk("Dumb4Cum") && rand(2) == 0)
				{
					// Procs after swallowing cum:
					pc.createPerk("Dumb4Cum",0,0,0,0,"Grants extra intelligence after acquiring cum, but reduces it otherwise.");
					pc.createStatusEffect("Dumb4CumNotice");
				}
			}
		}
		
		// ==========================
		// MIND STUFF OVER. ON
		// TOOO BOOOOOBS
		// ========================
		// Tits 
		// to predetermined max. Many small changes.
		if(treatedHours >= 48 && pc.breastRows[0].breastRating() < pc.statusEffectv1("Treated") && treatedHours % 3 == 0)
		{
			numGains = Math.floor((treatedHours - 48) / 3);
			if (startHours > 48) numGains -= Math.floor((startHours - 48) / 3);
			numGains = Math.max(0, Math.min(numGains, pc.statusEffectv1("Treated") - pc.breastRows[0].breastRating()));
			
			if (numGains > 0)
			{
				for (i = 0; i < numGains; i++)
				{
					// Flat chest -> .5 cup
					if(pc.breastRows[0].breastRatingRaw < 0.5)
					{
						AddLogEvent(ParseText("Your chest feels strange. It’s all puffy, and your [pc.nipples] are a little swollen. Weird."), "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw += .5;
					}
					// .5 cup to A cup
					else if(pc.breastRows[0].breastRatingRaw < 0.5)
					{
						// clothed
						if(pc.isChestGarbed())
						{
							AddLogEvent(ParseText("You’re noticing more and more that there’s a little something extra in your [pc.upperGarment]. It’s moved your center of gravity just far enough forward to make you feel a little awkward, and it makes your [pc.nipples] rub oh-so-noticeably against your gear. You pull your top open for a better look and gasp. <b>You’ve grown boobs.</b> They’re still [pc.breastCupSize]s, really - barely tits at all. Of course they won’t stay that way for long. How big are your new boobs gonna get?"), "passive", treatmentHourPrint((i * 3), 0));
						}
						// Nakers
						else
						{
							AddLogEvent(ParseText("You’ve been feeling clumsy all day, like something just isn’t right with your body. It isn’t until you glance down that the source of your awkwardness reveals itself - tits. <b>You’ve got pert little A-cups hanging off your chest!</b> They look adorable - just enough to give tiny jiggles when you jump. Best of all, your [pc.nipples] seem to have grown in both size and sensitivity along with them."), "passive", treatmentHourPrint((i * 3), 0));
						}
						if(pc.bRows() > 1)
						{
							ExtendLogEvent(" The extra row");
							if(pc.bRows() > 2) ExtendLogEvent("s below remain");
							ExtendLogEvent(" below remains unchanged. It looks like your top set are the only ones that are gonna get big and milky, but that’ll be fine.");
						}
						pc.breastRows[0].breastRatingRaw = 1;
					}
					// A -> B
					else if(pc.breastRows[0].breastRatingRaw < 2)
					{
						AddLogEvent("You idly squeeze your chest; just to check, you assure yourself. It seems a wise thing to do after taking the treatment. After all, how else are you supposed to chart your progress from teensy teats to titanic, milk-seeping tits? You cup and caress them like favored pets. Yup, they’re definitely bigger. You squeeze again - definitely B-cups. They feel nice and warm in your hands.", "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw++;
					}
					// B-C
					else if(pc.breastRows[0].breastRatingRaw < 3)
					{
						AddLogEvent(ParseText("Whenever you move, your [pc.chest] move along with you. That’s no surprise. What does come as a shock is just how much they move - jiggling and shaking about whenever you twist or hop."), "passive", treatmentHourPrint((i * 3), 0));
						if(pc.isChestGarbed()) ExtendLogEvent(" You pop open your top for a look.");
						else ExtendLogEvent(" You look down.");
						ExtendLogEvent(" Damn! When did you get tits like that? They’re proper C-cups now - big enough to give your hands something perfectly cushy to squeeze on, which they’re doing right now. It feels great, really. You sigh and let your bigger boobs go, looking at them one last time. Yeah, you’re getting pretty sexy.");
						// +1 lust
						pc.lust(1);
						pc.breastRows[0].breastRatingRaw++
					}
					// C-D
					else if(pc.breastRows[0].breastRatingRaw < 4)
					{
						AddLogEvent(ParseText("You reach up to adjust your [pc.chest], a motion you find yourself doing more and more lately. There’s nothing wrong with making sure your girls are sitting right. To your delight, your pleasing handfuls are... well, a little more hand-filling than before. You playfully squeeze and fondle them. There’s not enough for your fingers to really sink into... yet. But you’re on the Treatment now. Big, shuddering udders come with the package. You bounce yourself once more for good measure, imagining how you’re going to end up, before letting go, a distant smile on your face."), "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw++
						// +5 lust
						pc.lust(5);
					}
					// D->DD
					else if(pc.breastRows[0].breastRatingRaw < 5)
					{
						AddLogEvent(ParseText("Your [pc.chest] feel so nice and warm"), "passive", treatmentHourPrint((i * 3), 0));
						if(pc.isChestGarbed()) ExtendLogEvent(ParseText(" against your [pc.upperGarment]"));
						ExtendLogEvent(ParseText(" that you just have to give it a friendly squeeze. Your index fingers settle on your [pc.nipples] while your palms attempt to cradle the burgeoning titflesh. It just doesn’t work as well as it should; your boobs are bigger and squishier than the last time you held them. You’ve gotta be at least a DD-cup now. You bounce them in your palms, watching with a goofy smile. Definitely DD’s."));
						pc.breastRows[0].breastRatingRaw++;
						// +2 lust
						pc.lust(2);
					}
					// DD->big DD
					else if(pc.breastRows[0].breastRatingRaw < 6)
					{
						AddLogEvent("It’s one thing to consider the idea of getting bigger breasts from a powerful transformative cocktail. It’s quite another to feel them pulling on you as they get heavier and heavier. You hold your hands up underneath them, weighing them. They’re so warm and squishy that you can’t help but give them a few playful bounces. Why, you’re big enough that you’re going to have DD-sized bras straining to keep up. You pinch a nipple gleefully. Soon you might even be an E!", "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw++;
						// +5 lust.
						pc.lust(5);
					}
					// big DD -> E
					else if(pc.breastRows[0].breastRatingRaw < 7)
					{
						AddLogEvent("You give a squeal of surprise when you realize how big your boobies are getting. They’re way more bouncy and squishy than before. If you got measured for a cheap bra, you’d definitely be an E-cup, but you don’t think you need one.", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.isChestGarbed()) ExtendLogEvent(ParseText(" Even with your [pc.upperGarments] peeled down,"));
						else ExtendLogEvent(" Even as naked as you are,");
						ExtendLogEvent(" they sit high and proud, as if cradled by an imaginary corset. You play with them, bouncing them around. They aren’t too firm or too soft. In short, they’re perfect for a grope.");
						pc.breastRows[0].breastRatingRaw++;
						// +2 lust
						pc.lust(2);
					}
					// E -> big E
					else if(pc.breastRows[0].breastRatingRaw < 8)
					{
						AddLogEvent(ParseText("You let your hand play across your [pc.nipple] during an idle moment, just to check if, like, your sensitivity is getting crazy or anything. It feels so good, but more startling is how there seems to be a little extra behind the pleasantly pulsing pleasure-bud. Your tits were already nice and big.... You squeeze them for good measure... so nice and big. They’re bigger now! The thought is slow coming while you grope yourself, but it comes all the same. You’re on the upper end of an E-cup now. If they keep growing, you’re going to have a very hard time finding your ") + pc.feet() + ", but that’ll be fine.\n\nYou fondle your expanded chest. Everything’s gonna be fine.", "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw++;
						pc.lust(2);
					}
					// big E -> EE
					else if(pc.breastRows[0].breastRatingRaw < 9)
					{
						AddLogEvent("You look down, at first surprised and then pleased to see a little bit less of the ground than before. Your titties are still growing!", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" You yank down your [pc.upperGarments] in a rush to examine them."));
						ExtendLogEvent(" They give so perfectly under your fingertips that you just <i>have</i> to really squeeze them, groping them like just like an overeager guy. You knead them, watching yourself do so with a lazy smile. Mmm, already an EE-cup from the Treatment, and you could still get even bigger. The idea of finding someone to give you a chest massage while you finish growing comes upon you out of nowhere, and you’ve gotta admit - it isn’t a bad one.");
						pc.breastRows[0].breastRatingRaw++;
						pc.lust(3);
					}
					// EE -> big EE
					else if(pc.breastRows[0].breastRatingRaw < 10)
					{
						AddLogEvent(ParseText("Your [pc.chest] sway and bounce with every movement. There’s no stopping that now, though. They’ve grown to the upper end of the EE-cup range, and you couldn’t stop the weighty orbs from banging together in such an eye-catching way if you wanted to. Even if you wrapped them, you’d feel them shifting and rubbing against the inside of the fabric, dragging enlarged and sensitized nipples back and forth. You rub one and wonder if you should go jogging...."), "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw++;
						pc.lust(4);
					}
					// big EE -> F
					else if(pc.breastRows[0].breastRatingRaw < 11)
					{
						AddLogEvent("Looking down, you smile. Your " + pc.feet() + " are totally gone from view.", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.hasCock()) 
						{
							ExtendLogEvent(" Heck, if your " + pc.cocksDescript() + " ");
							if(pc.cockTotal() == 1) ExtendLogEvent("was");
							else ExtendLogEvent("were");
							ExtendLogEvent(" smaller, you wouldn’t see ");
							if(pc.cockTotal() == 1) ExtendLogEvent("it");
							else ExtendLogEvent("them");
							ExtendLogEvent(" either.");
						}
						ExtendLogEvent(" The swelling of your bustline is truly a sight to behold. Besides, you can still see them if you bend forward a little bit, and you don’t need to watch your " + pc.feet() + " or anything - not when you’ve got an ocean of pillowy flesh to look at. You’ve got big, sexy F-cups now.");
						pc.breastRows[0].breastRatingRaw++;
						pc.lust(2);
					}
					// F -> big F
					else if(pc.breastRows[0].breastRatingRaw < 12)
					{
						AddLogEvent("You start to adjust the girls again. They’re easy to pose just right for the maximum amount of eye-catching wobble, but sometimes you’ve just gotta have an excuse to heft and weigh them. There’s nothing wrong with being comfortable with your own body or how soft and squishy and warm and wet your jugs are getting. You sigh, rubbing fingers around your enhanced areolae as you squeeze your breasts. They didn’t quit growing yet. You’re sure of it. Tits like these barely fit into an F-cup. You briefly consider kissing them.", "passive", treatmentHourPrint((i * 3), 0));
						// +5 lust
						pc.lust(5);
						pc.breastRows[0].breastRatingRaw++;
					}
					// big F -> FF
					else if(pc.breastRows[0].breastRatingRaw < 13)
					{
						AddLogEvent("You stumble, setting off a small earthquake in your breasts. Giggling, you mentally categorize it as a class five boobquake and grab hold for stability, stilling your boobs with a supportive grope. There! You knead them a few times, weighing their mass. It feels plenty good, and, you figure, you’ve got a pretty head-turning rack now. An F-cup bra wouldn’t fit you any more. Boobs like yours are a job for a double F... or a big, thick cock. These would be great for a titfuck, especially with how big and sensitive your nipples have gotten. They’re like built-in handholds!", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.bRows() > 1) ExtendLogEvent("\n\nYou run one hand across your neglected lower nipples. Maybe someday you can convince someone to make a treatment for " + pc.mf("boys","girls") + " with more than one meager row of tits.");
						// +3 lust
						pc.lust(3);
						pc.breastRows[0].breastRatingRaw++;
					}
					// FF -> big FF
					else if(pc.breastRows[0].breastRatingRaw < 14)
					{
						AddLogEvent(ParseText("Every movement you make is accompanied by a matching bounce and jiggle. Your breasts are the kind that stay in almost constant motion when you move, drawing the eye of every sapient creature in sight. The thought of all those eyes on your [pc.chest] has them feeling fuzzy with heat and your [pc.nipples] growing hard. They’re bigger too, which is great, you figure. They’ll be even more eye-catching, and they can hold more [pc.milkNoun]"), "passive", treatmentHourPrint((i * 3), 0));
						if(!pc.canLactate()) ExtendLogEvent(", once you start lactating");
						ExtendLogEvent("!");
						if(pc.bRows() > 1)
						{
							ExtendLogEvent(ParseText("\n\nIt’s a shame that only your top row is getting so big and sexy, but at least your other [pc.nipples] are getting sensitive to match their big sisters up top."));
						}
						pc.lust(6);
						pc.breastRows[0].breastRatingRaw++;
					}
					// big FF -> G
					else if(pc.breastRows[0].breastRatingRaw < 15)
					{
						AddLogEvent(ParseText("You run your hands across the curves of your swelling chest, admiring the feel of your [pc.skinFurScales] under your fingertips. You’ve gotten bigger again for sure. Now that you’ve swollen so large, each increase is packing more and more sensitive flesh onto your body, dragging your center of gravity kicking and screaming high and forward. You’ve got to shift your posture to handle G-cups like these, arching your back to keep them from toppling you forward, but that’s fine, you figure. Doing so displays them that much more effectively."), "passive", treatmentHourPrint((i * 3), 0));
						// +2 lust
						pc.lust(2);
						pc.breastRows[0].breastRatingRaw++;
					}
					// G -> big G
					else if(pc.breastRows[0].breastRatingRaw < 16)
					{
						AddLogEvent("You look down, pleased to note that another inch of ground has disappeared from view, blocked by the sprawling spheres that adorn your chest like a ship’s prow. Your boobs are even bigger than before, and so much more noticeable for the boys and girls (at least the ones that are into that sort of thing). You rub one, shivering in delight at the fizzing sparks of tactile pleasure. It’d feel so good to have a pair of lips sealed around a leaking nipple... and a big fat cock in between them. Big G-cups like yours deserve all the attention they can get.", "passive", treatmentHourPrint((i * 3), 0));
						// +5 lust.
						pc.lust(5);
						pc.breastRows[0].breastRatingRaw++;
					}
					// big G -> GG
					else if(pc.breastRows[0].breastRatingRaw < 17)
					{
						AddLogEvent("A warm, tingly feeling spreads through your chest as your breasts expand", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.isChestGarbed()) ExtendLogEvent(ParseText(", straining against your [pc.upperGarment] as they go"));
						else ExtendLogEvent(", shifting slightly as they go");
						ExtendLogEvent(". Your hands fly to them of their own accord, wrapping fingers around big, sensitive nipples and pressing palms into expanding undersides. This must be what it feels like to be in heaven: constant, sensitive pleasure, as your body becomes more and more perfect in every way. You look at them - the GG-cup behemoths stacked on top of you - and giggle. The Treatment isn’t turning you into a slut, just making you hotter, sexier. You don’t have to wrap these pillows around a dick, no matter how amazing it would feel.");
						if(pc.bRows() > 1) ExtendLogEvent("\n\nYou idly caress a lower nipple. It’s just as sensitive as the ones up top, but unlucky enough not to get the sexy swelling your top rack is.");
						// +7 lust
						pc.lust(7);
						pc.breastRows[0].breastRatingRaw++;
					}
					// GG -> big GG
					else if(pc.breastRows[0].breastRatingRaw < 18)
					{
						AddLogEvent("A sensation of sudden, sensitive firmness is the only warning you get before your boobs swell. Not that you needed the warning of course - the Codex gave you one of those a while back - but why would you care? Bigger tits are like better orgasms. Why wouldn’t you want them? You rub your expanded assets, trying to gauge their new size for yourself, though it might look like you’re just feeling yourself up to a passerby. You’ve got big GG’s for sure. If you’re lucky, you’ll hit H-cups before this is over!", "passive", treatmentHourPrint((i * 3), 0));
						// +3 lust
						pc.lust(3);
						pc.breastRows[0].breastRatingRaw++;
					}
					// big GG -> H
					else if(pc.breastRows[0].breastRatingRaw < 19)
					{
						AddLogEvent(ParseText("Your hands are running slowly across your expanding chest in a kind of slow dance, sending little whispers of pink-hued pleasure into your brain. It’s enough to keep a happy, ditzy smile on your face and your mind placid and calm. A simple tweak of a [pc.nipple] is enough to make your [pc.legOrLegs] wobble, and the idea of someone else doing the tweaking "), "passive", treatmentHourPrint((i * 3), 0));
						if(pc.hasVagina()) ExtendLogEvent("makes you positively drippy");
						else ExtendLogEvent("has you whimpering");
						ExtendLogEvent(". Best of all, you’re slowly coming to realize that you’ve grown again. You finally have H-cups!");
						if(pc.bRows() > 1) ExtendLogEvent("\n\nIf only your other boobs got to grow too. Maybe you could put some Boobswell pads on them?");
						// Lust+7
						pc.lust(7);
						pc.breastRows[0].breastRatingRaw++;
					}
					// H -> big H
					else if(pc.breastRows[0].breastRatingRaw < 20)
					{
						AddLogEvent(ParseText("You keep checking your [pc.chest] for signs of growth. It’s hard not to on the Treatment, knowing that at any moment you could cross the threshold to a whole new cup size and a whole new world of bigger, more sensitive boobies. This time, you’re pretty sure that your fingers are sinking a little deeper into your assets. There’s a little bit more weight in your palms. You’re on the upper edge of an H-cup bra, and you wonder if the heifers on New Texas wear H-cups. It would be terrifically appropriate, you decide. There’s nothing wrong with being called a cow when you’re mostly boob."), "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw++;
					}
					// big H -> HH
					else if(pc.breastRows[0].breastRatingRaw < 21)
					{
						AddLogEvent("You glance down, pleased to note that your view of the ground is even more obstructed than before. You don’t need to see your " + pc.feet() + " anyway, and you can always pull your boobs out to the side if you need to see past them. As a bonus, that would give you a chance to squeeze and rub at the well-rounded melons. They’re so rounded and shapely; how could anyone ignore a perfect, HH-cup rack like yours? You arch your back, displaying them like solar panels that exist solely to soak up attention.", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.bRows() > 1)
						{
							ExtendLogEvent("\n\nMaybe you could get your other row");
							if(pc.bRows() > 2) ExtendLogEvent("s");
							ExtendLogEvent(" dosed with something so they don’t get forgotten. You could probably titfuck, like, three guys at once then.");
						}
						// +3 lust
						pc.lust(3);
						pc.breastRows[0].breastRatingRaw++;
					}
					// HH -> big HH
					else if(pc.breastRows[0].breastRatingRaw < 22)
					{
						AddLogEvent(ParseText("You lean back, feeling the weight of your feminine mounds flattening them slightly against your chest, and rub your hands across them in slow circles, giving them a little massage. They’ve earned it after all, working so hard to swell up all big and sexy, being so sensitive and pleasant to feel. Your [pc.nipples] are like little dispensers that release pink clouds of happiness on contact. Giggling, you admire them, realizing they’ve gotten even bigger. You’ll barely fit in an HH-cup bra anymore."), "passive", treatmentHourPrint((i * 3), 0));
						// +6 lust
						pc.lust(6);
						pc.breastRows[0].breastRatingRaw++;
					}
					// big HH -> HHH
					else if(pc.breastRows[0].breastRatingRaw < 23)
					{
						AddLogEvent("Closing your eyes, you cop a feel at your bosom. It perfectly deforms around your questing fingertips, swallowing them almost wholly into itself. Each perfectly-shaped boob quivers against the other, pressed into a line of cleavage long enough to make a kui-tan cream her pants. You play with them", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.hasVagina()) ExtendLogEvent(" until you feel more than a little sticky yourself");
						else ExtendLogEvent(ParseText(", feeling a little unfilled yourself. If only you had someone to come fuck your [pc.ass] right now"));
						ExtendLogEvent(". There’s no doubt in your mind: you’re a triple-H girl now.\n\nYou don’t even try to stop a contented ‘moo’ from escaping your mouth. It feels right.");
						pc.lust(3);
						pc.breastRows[0].breastRatingRaw++;
					}
					// big HHH -> I
					else if(pc.breastRows[0].breastRatingRaw < 24)
					{
						AddLogEvent("Warmth burns through the nerves of your chest, heating your jiggling mounds to an incredibly pleasant simmer as they begin to swell. You grab them, mooing and moaning in equal parts, feeling them bulge out between your fingertips, marvelling at the weight of your expanding feminine flesh. Your tits are definitely I-cups now. The tingling heat fades, replaced by a desire for physical contact. You give them that and more. Your hands fly across your chest, mauling your boobs for what feels like hours. It isn’t until you cum from the incessant stimulation that your hands fall away", "passive", treatmentHourPrint((i * 3), 0));
						if((pc.hasCock() && pc.cumQ() >= 100) || (pc.hasVagina() && pc.wettestVaginalWetness() >= 3) || (pc.isLactating() && pc.lactationQ() >= 200)) ExtendLogEvent(", leaving you sitting in a puddle of your own fluids and panting");
						ExtendLogEvent(".");
						// orgasm!
						pc.orgasm();
						pc.breastRows[0].breastRatingRaw++;
					}
					// I -> big I
					else if(pc.breastRows[0].breastRatingRaw < 25)
					{
						AddLogEvent("A little extra wobble in your chest is all the notification you need to give yourself a quick grab ‘n’ squeeze. As expected, your tits are a little bigger than before. An I-cup bra would barely contain them! You sit there, petting them, hoping that it’ll encourage further growth. There’s no point in stopping when you’re this close to moving up a whole bra size, is there?", "passive", treatmentHourPrint((i * 3), 0));
						pc.breastRows[0].breastRatingRaw++;
					}
					// big I -> II
					else if(pc.breastRows[0].breastRatingRaw < 26)
					{
						AddLogEvent("Teetering forward and nearly losing your balance is all the reminder you need to give your rack some much needed attention. Unashamedly whipping them out, you take hold of your growing tits and weigh them. It isn’t a very precise method of measuring growth, but it feels wonderful. You spend a few moments playing with them, squishing them together, and even bouncing them in place before you come to a decision. You have II-cup boobs for sure.", "passive", treatmentHourPrint((i * 3), 0));
						// +2
						pc.lust(2);
						pc.breastRows[0].breastRatingRaw++;
					}
					// II -> big II
					else if(pc.breastRows[0].breastRatingRaw < 27)
					{
						AddLogEvent("Your chest has been supremely weighty for a while, but it seems a little heavier than before. You’d better check, just in case it got bigger... and more fuckable. Imagining it’s a dick sliding between your expanding knockers, you snake a hand through your cleavage, wrapping the crook of your arm around the bottom of it. It feels good, of course. Handling your breasts is an exercise in excitement for sure, but you do your best to keep your wits about you. It’s important to know how big your boobs are, after all. How else will you be able to brag about being almost too big for an II-cup bra?", "passive", treatmentHourPrint((i * 3), 0));
						// +7 lust
						pc.lust(7);
						pc.breastRows[0].breastRatingRaw++;
					}
					// big II -> J
					else if(pc.breastRows[0].breastRatingRaw < 28)
					{
						AddLogEvent("Every movement sends quakes of happy feelings through your mountainous melons, the feminine orbs entirely too delighted to bounce and jiggle for the whole world to see. And you can’t blame them either. They’re big, delicious tits. They deserve to be grabbed and squeezed and pulled until you’re whimpering and drooling all over them... just like now. You moo quietly under your breath and pull your hands away, trying not to cum. You’re pretty sure they’re at least J-cups by now, but it’s a far less pressing concern than the needy itch between your ", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.hasVagina()) ExtendLogEvent(ParseText("[pc.thighs]"));
						else ExtendLogEvent("cheeks");
						ExtendLogEvent(".");
						if(pc.breastRows.length > 1) ExtendLogEvent("\n\nIf you the Treatment worked on more than one row, you could probably be having a wonderful titgasm by now.");
						// +33 lust
						pc.lust(33);
						pc.breastRows[0].breastRatingRaw++;
					}
					// J -> big J
					else if(pc.breastRows[0].breastRatingRaw < 29)
					{
						AddLogEvent("Looking down, you barely suppress a giggle. Your titties are just so gosh darned big! They’re all wobbly and completely obscure your " + pc.feet() + "; why, you’re pretty sure that without some serious effort you won’t be able to make out your own groin. It’s a good thing your fingers already know just where to go, but you’re pretty sure they’d be manhandling these delicious knockers. You start squeezing them together, letting your eyes drift closed, imagining that strong, calloused fingers are doing the work. Having such big J-cups is nice.", "passive", treatmentHourPrint((i * 3), 0));
						// +10 lust
						pc.lust(10);
						pc.breastRows[0].breastRatingRaw++;
					}
					// big J -> JJ
					else if(pc.breastRows[0].breastRatingRaw < 30)
					{
						AddLogEvent("Ooooh! A throaty moan rips through the air around you as you feel something come over your tits. It feels like a wave of tingling is hitting you. Your [pc.nipples] instantly ", "passive", treatmentHourPrint((i * 3), 0));
						if(pc.hasFuckableNipples() || pc.isLactating()) ExtendLogEvent("leak in noticeable streams");
						else if(!pc.hasFuckableNipples() && pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_FLAT && pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED && pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_LIPPLES) ExtendLogEvent("tent out to their full size");
						else ExtendLogEvent("become sensitive and pebbly");
						ExtendLogEvent(", and the flesh around them is flushed and expanding. You hold on for dear life, rubbing your chest enthusiastically and occasionally interrupting your moans with fervent, eager moos. You wish you had someone to milk you and fuck you all at the same time!");
						ExtendLogEvent("\n\nStill tugging your nipples, you writhe on the ground");
						if(pc.isLactating()) ExtendLogEvent(", leaking fluids everywhere");
						ExtendLogEvent(" as you climax again and again, cumming to the feeling of your breasts expanding to JJ-cups. You never want it to stop. If your life became nothing more than breast-obsessed orgasmed chained on the heels of the last, you could die happy. You’re sure of it.");
						ExtendLogEvent("\n\nComing down from that high takes more than a few minutes and brings with regret in no small measure. There’s a sense of finality in your expanded breasts. The Treatment has done all that it can to them; you aren’t going to get any bigger. You guess that you’ll be fine with these. They’re bigger than most unaugmented New Texans, and you could always go get some Boobswell pads from the store if you really wanted to stand out.");
						ExtendLogEvent("\n\nIt would be... nice to have bigger breasts than anyone else. Your teats glow with approval.");
						// 3 cums! Ah ah ah! /thecount.
						pc.orgasm();
						pc.orgasm();
						pc.orgasm();
						pc.breastRows[0].breastRatingRaw++;
					}
				}
			}
			
			// Done before max:
			if(pc.breastRows[0].breastRating() >= pc.statusEffectv1("Treated") && !pc.hasStatusEffect("Boobgrow Done Notice"))
			{
				AddLogEvent(ParseText(" There’s a kind of quivering finality about the movements of your breasts as you walk. They don’t seem as constantly warm or well... active as before. The Treatment must be done working its magic on them, but at least they’re still big, sexy, and oh so fun to touch. Just the idea of fondling yourself has your [pc.skin] flushing hotly."), "passive");
				pc.createStatusEffect("Boobgrow Done Notice",0,0,0,0,true,"","",false,10080);
			}
		}
		
		// Lips 
		// Max size stored in v3
		// Raise femininity to max, then add lipRating as needed.
		// Final lip rating = 4 to 6.
		
		if((pc.femininity < 100 || pc.statusEffectv3("Treated") > pc.lipRating()) && treatedHours >= 121 && startHours < 168)
		{
			var femGainStarts:Array = [121, 130, 140, 150, 160, 168];
			
			for (i = 0; i < femGainStarts.length; i++)
			{
				if (startHours < femGainStarts[i] && treatedHours >= femGainStarts[i])
				{
					// sub 25 to -> 26 Femininity
					if(pc.femininity < 25)
					{
						AddLogEvent("You reach to scratch an itch on your jaw and find that it feels a little differently than before. Concerned, you pull out your Codex, using the camera function as a mirror. Your face <i>does</i> look different. A little softer somehow. Your features are getting less rugged, but you concede that you look a little more pretty, in a mannish way.", "passive", treatmentHourPrint(femGainStarts[i], startHours));
						pc.femininity = 26;
					}
					// sub 50 to 51 Femininity
					else if(pc.femininity < 50)
					{
						AddLogEvent(ParseText("Your [pc.lips] feel a little dry, and when you lick them, you discover that they feel a little fuller than before. You pull out your Codex’s camera function for another look. It confirms your worry. Your lips are bigger, and your face looks far more feminine than before. The Treatment has given you a fairly androgynous face. You could probably pass as either gender, if you wanted."), "passive", treatmentHourPrint(femGainStarts[i], startHours));
						pc.femininity = 51;
					}
					// sub 75 to 76 femininity
					else if(pc.femininity < 75)
					{
						AddLogEvent(ParseText("You wipe a bead of sweat from your brow, then jerk in surprise at how smooth your [pc.skin] felt. It didn’t use to feel that way! Hastily pulling out your Codex, you use it to examine your face. What you see shocks you. There’s a pretty face with lips that are noticeably fuller than before. <b>You’re actually... pretty.</b> More than that, you might even be beautiful. The confused-looking girl in the Codex purses her lips thoughtfully; you’re not sure you’ll ever get used to this."), "passive", treatmentHourPrint(femGainStarts[i], startHours));
						pc.femininity = 76;
					}
					// sub 100 to 100 femininity
					else if(pc.femininity < 100)
					{
						AddLogEvent("You chew on a wonderfully full lip while thinking, then stop, surprised by the fullness of it. Is the Treatment making your lips bigger? You pull out the Codex to check, looking at your reflection. It is, but that’s not all. Your whole face has been refined. Your cheekbones are perfectly placed. Your eyebrows arch perfectly. Even your nose is cute. Your visage is the epitome of feminine beauty. Wow. You’ll have lovers lining up for a chance with you!", "passive", treatmentHourPrint(femGainStarts[i], startHours));
						pc.femininity = 100;
					}
					// 0 to 1 mod.
					else if(pc.lipMod < 1)
					{
						AddLogEvent("While looking at your stunning features in a mirror, you discover a delightful change. Your juicy lips have swollen still larger, giving you a bee-stung look. Your voluptuous mouth is just begging to be kissed. Wondering how it would feel, you find yourself delightfully tingly.", "passive", treatmentHourPrint(femGainStarts[i], startHours));
						pc.lipMod = 1;
						pc.lust(1);
					}
					// 1 to 2 mod.
					else if(pc.lipMod < 2)
					{
						AddLogEvent(ParseText("You purse your [pc.lips] in front of your Codex, just to look at them. To your surprise, they’re even bigger than before. You lick them, making them shine. They’re almost... hypnotic. You purse your dazzling kissers, then smile. These lips are gorgeous. You could probably make guys rip holes in their pants, just by talking to them."), "passive", treatmentHourPrint(femGainStarts[i], startHours));
						pc.lipMod = 2;
					}
				}
			}
		}
		
		// Lubrication Gains
		// Wetness to 3
		if (pc.hasVagina() && pc.driestVaginalWetness() < 3 && treatedHours >= 25 && startHours < 74)
		{
			var lubeGainStarts:Array = [25, 50, 74];
			
			for (i = 0; i < lubeGainStarts.length; i++)
			{
				if (startHours < lubeGainStarts[i] && treatedHours >= lubeGainStarts[i])
				{
					// not lubricated at all
					if(pc.driestVaginalWetness() <= 0)
					{
						// Singlepuss
						if(pc.totalVaginas() == 1)
						{
							AddLogEvent("You suddenly feel... wet, ", "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
							if(pc.legCount > 1) ExtendLogEvent(ParseText("between the [pc.legs]"));
							else ExtendLogEvent("in your crotch");
							ExtendLogEvent(". You didn’t pee yourself - you’re sure of it. Gingerly dipping a fingertip inside your feminine crevice, you discover a pleasing slipperiness. You’re lubricating! This will make sex soooo much more pleasant.");
						}
						// Multipuss but only 1 changed
						else if(cuntsBelowWetnessThreshold(1) == 1)
						{
							AddLogEvent("Your dry pussy - the one that didn’t self-lubricate - suddenly feels decidedly... <i>moist.</i> You thrill at the discovery. Now all your vaginas are just as fuckable!", "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
						}
						// Multipuss multiple changed
						else
						{
							AddLogEvent("All at once, you feel moist all over your crotch. The strange sensation won’t go away, leaving you with nothing to do but press a pair of fingertips inside yourself, just to check. It’s slippery and wet - ", "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
							if(pc.totalVaginas() == 2) ExtendLogEvent("both");
							else ExtendLogEvent("all of");
							ExtendLogEvent(" your holes. You whimper. How are you supposed to keep your");
							if(pc.legCount > 1) ExtendLogEvent(ParseText(" [pc.legs] closed"));
							else ExtendLogEvent(" sex away");
							ExtendLogEvent(" when you’re getting so fuckable?");
						}
						// +5 lust for all
						pc.lust(5);
						setMinimumWetness(1);
					}
					// 1 -> 2 Lubiness
					if(pc.driestVaginalWetness() <= 1)
					{
						// Singlepuss
						if (pc.totalVaginas())
						{
							AddLogEvent("Whenever you get thinking too hard about what the Treatment is doing to your body, you find yourself getting wet, and not just wet, but slick enough that trickles of it can run down your thighs when you get all hot and bothered. It’ll be way easier to handle insertions from dildos... or big dicks... or anything really.", "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
						}
						// Multipuss but only 1 changed
						else if(cuntsBelowWetnessThreshold(2) == 1)
						{
							AddLogEvent(ParseText("Oooh, you feel a long overdue change in [pc.oneVagina]. It’s palpably wetter, just like its sister"), "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
							if(pc.totalVaginas() > 2) ExtendLogEvent("s");
							ExtendLogEvent(". You ");
							if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText("reach into your [pc.lowerGarment] and "));
							ExtendLogEvent("ease a finger inside, delighting in the hot slipperiness that you find. You’re practically as wet as an ausar now. Your body is practically begging for something to try out the improved entrance. You resolve to properly finger yourself as soon as humanly possible.");
						}
						// Multipuss multiple changed
						else
						{
							AddLogEvent(ParseText("A sudden pang of warmth and wetness assaults your crotch, dropping you to your hands and [pc.knees]. You’re getting so gloriously wet! You can practically smell the lubricant your body is making from your multiple honeypots, like you’ve got ") + num2Text(pc.totalVaginas()) + " horny ausar living in your crotch.", "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
						}
						// +10 lust
						pc.lust(10);
						setMinimumWetness(2);
					}
					// 2 -> 3 Lubiness
					else
					{
						// Singlepuss
						if(pc.totalVaginas() == 1)
						{
							AddLogEvent(ParseText("Out of nowhere, your [pc.vagina] alights with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] run unopposed down your [pc.legOrLegs]. You stare in fascination at the sensuous sight, feeling like you’re half-girl, half-river. If you had a boyfriend handy, he could slip right in with no trouble at all!"), "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
						}
						// Multipuss but only 1 changed
						else if(cuntsBelowWetnessThreshold(3) == 1)
						{
							AddLogEvent(ParseText("Out of nowhere, [pc.oneVagina] alights with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] are running unopposed down your [pc.legOrLegs]. Finally, you’re slippery all over. You feel like a brain attached to a multitude of slippery, wet holes, each signalling their readiness with fragrant arousal."), "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
						}
						// Multipuss multiple changed
						else
						{
							AddLogEvent(ParseText("Out of nowhere, your [pc.vaginas] alight with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] cascade down your [pc.legOrLegs]. You stare in fascination at the unquestionably sexual sight, feeling like you’re little more than a woman attached to a wellspring of lust. A boy with nice, thick cocks could just slide them all right into you!"), "passive", treatmentHourPrint(lubeGainStarts[i], startHours));
						}
						// +15 lust
						pc.lust(15);
						setMinimumWetness(3);
					}
				}
			}
		}
		
		// Lactation
		// boostLactation(1); every hour starting on day 3. until 100 is reached. Always max it out post 150th hour
		if (pc.milkMultiplier < 100 && treatedHours > 150)
		{
			pc.milkMultiplier = 100;
			pc.createStatusEffect("Pending Gain MilkMultiplier Note: 100");
		}
		else if (pc.milkMultiplier < 100 && startHours < 150 && treatedHours >= 73)
		{
			var numLactBosts:int = ((72 - startHours) + (treatedHours - 72)) * 2;
			if (startHours < 101 && treatedHours >= 101) numLactBosts++;
			if (startHours < 121 && treatedHours >= 121) numLactBosts++;
			if (startHours < 131 && treatedHours >= 131) numLactBosts++;
			if (startHours < 141 && treatedHours >= 141) numLactBosts++;
			
			pc.boostLactation(numLactBosts);
		}
		
		// lactation almost never stops. If combined with Milky perk, never stops. Ever.
		// Once 100 milkMultiplier is reached, unlock the Treated Milk perk.
		if(pc.milkMultiplier >= 100 && startHours < 78 && treatedHours >= 78 && !pc.hasPerk("Treated Milk"))
		{
			AddLogEvent(ParseText("You grow increasingly aware of how productive and wonderful your [pc.breasts] are. The Treatment has given you the ability to produce so much!"), "passive", treatmentHourPrint(78, startHours));
			if(pc.milkType == GLOBAL.FLUID_TYPE_MILK) ExtendLogEvent(" You squeeze a droplet onto a finger and try it, just to sample it. It tastes exactly like the freshest, most delicious milk you’ve ever tasted - way better than normal. No wonder New Texas is able to export so much milk; Texan cow-milk is amazing!");
			// Perk Unlocked: Treated Milk - Your milk tastes delicious, and milk production takes much longer to slow. The only way you’d stop producing is if you made a conscious effort to keep your roving hands off your milky nipples.
			ExtendLogEvent("\n\n(<b>Perk Gained: Treated Milk</b> - Your milk tastes delicious, and milk production takes much longer to slow. The only way you’d stop producing is if you made a conscious effort to keep your roving hands off your milky nipples.)");
			pc.createPerk("Treated Milk",0,0,0,0,"Any milk you lactate tastes better, and you are less likely to stop lactating.");
		}
		
		// Milk capacity gains
		if(pc.milkStorageMultiplier < 3 && pc.hasPerk("Treated Milk") && pc.canLactate())
		{
			for (i = 0; i < treatedHours - startHours; i++)
			{
				if (rand(8) == 0)
				{		
					// 1->1.5
					if(pc.milkStorageMultiplier <= 1)
					{
						AddLogEvent("By now you’ve gotten used to having a chest that feels like it’s full of sloshing, delicious cream, but, out of the blue, that feeling diminishes. You weren’t even milking yourself; you just feel like you can hold <i>more</i>. You rub your breasts curiously. Could the Treatment be making your body even better at storing up fluid? Rubbing your moistened teats, you wonder if your next milking will be that much more voluminous.", "passive", treatmentHourPrint(treatedHours, startHours));
						pc.milkStorageMultiplier = 1.5;
					}
					// 1.5->2
					else if(pc.milkStorageMultiplier <= 1.5)
					{
						AddLogEvent(ParseText("A wave of warmth washes over your [pc.chest], and in its wake you’re left feeling oddly... emptied. How odd. Hefting a tit in one hand, you squeeze it, delighted to see that [pc.milk] still comes out. The only conclusion you can come to is that the Treatment has somehow made your breasts... better - able to hold and give more [pc.milkNoun]. A sensation of rightness accompanies that thought. Of course! It only makes sense that your body would change itself in order to experience even longer, more exciting milkings."), "passive", treatmentHourPrint(treatedHours, startHours));
						pc.milkStorageMultiplier = 2;
					}
					// 2->2.5
					else if(pc.milkStorageMultiplier <= 2)
					{
						AddLogEvent(ParseText("Your attention is drawn to your chest out of the blue - not that unusual given your current state. You giggle, smooshing your boobs against one another, enjoying the feel of your lactating jugs bouncing and sloshing together like two energetic best friends. You’re getting better at it too - the whole milk giving thing. Just when you think you’re starting to get too full, it’s like your boobs find even more room for [pc.milkNoun]. You briefly imagine your tits rearranging their furniture to add another fridge, giggling all the while."), "passive", treatmentHourPrint(treatedHours, startHours));
						pc.milkStorageMultiplier = 2.5;
					}
					// 2.5->3
					else if(pc.milkStorageMultiplier <= 2.5)
					{
						AddLogEvent("Your chest wobbles under the weight of its own unrestrained lactic prowess. Your body is so good at making milk that you find yourself wondering if your time would be better spent hooked up to a pump than hopping around the galaxy on a vainglorious quest for riches. Hefting the wonderful weight of your all too efficient mammaries, you smile, somehow knowing you could give a dairy cow a run for her money.", "passive", treatmentHourPrint(treatedHours, startHours));
						pc.milkStorageMultiplier = 3;
					}
				}
			}
		}
		
		// Elasticity + bonus capacity to make sure the girl can handle roughly 24" by 4.5" poles.
		// Change it silently. Leave notification status effect that triggers off the next time cuntchange is called. Followup message:
		if(pc.elasticity < (pc.hasPerk("Elasticity") ? 4.0 : 3.5) && treatedHours >= 155)
		{
			pc.elasticity = (pc.hasPerk("Elasticity") ? 4.0 : 3.5);
			if(pc.hasVagina())
			{
				for(var cuntCount2:int = 0; cuntCount2 < pc.totalVaginas(); cuntCount2++)
				{
					if(pc.vaginas[cuntCount2].bonusCapacity < 150) pc.vaginas[cuntCount2].bonusCapacity = 150;
				}
			}
			else 
			{
				if(pc.ass.bonusCapacity < 150) pc.ass.bonusCapacity = 150;
			}
			// pc.createStatusEffect("Treatment Elasticity Report Q'ed");
			pc.createStatusEffect("Treatment Elasticity Report Needed");
		}
		
		// Horn Grow 2 Nubs
		if((pc.horns == 0 || (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT) || pc.hornLength < pc.statusEffectv2("Treated")) && treatedHours >= 82)
		{
			numHornAttempts = treatedHours - Math.max(startHours, 81);
			numHornGains = 0;
			hornTimestampStride = 0;
			
			for (i = 0; i < numHornAttempts; i++)
			{
				if (rand(6) == 0) numHornGains++;
			}
			
			if(numHornGains > 0) hornTimestampStride = Math.floor((treatedHours - Math.max(startHours, 81)) / numHornGains);
			
			for (i = 0; i < numHornGains; i++)
			{
				// Existing horns transform into lil bull nubs.
				if(pc.horns > 0 && (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT))
				{
					AddLogEvent("There is a crackling, rustling sound coming from above you. You look up, but nothing is there. Instead, you hear the same sound from behind you. This time, you twist around to try and identify the source, but to no avail. A minute later a piece of horn bounces off your nose on the way to the ground.\n\n<b>Your horns are breaking apart!</b> Dazedly, you feel at the crumbling totems, feeling them come apart in your fingers. Chalky dust clings to your hand, but more importantly, two little nubs remain on your head. They’re small and pointed, like little cow horns.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
					pc.horns = 2;
					pc.hornLength = .5;
					pc.hornType = GLOBAL.TYPE_BOVINE;
				}
				// Starting
				else if(pc.horns == 0 && !pc.hasStatusEffect("Horn Bumps"))
				{
					AddLogEvent("Ugh. Your head itches! Reaching up to take a scratch, you wince when you come across a painful bump on your forehead. A quick check with the Codex confirms that it’s red and irritated, though you haven’t seen a head form on the zit yet. You’ve never had such prominent acne before, and there’s a matching lump on the either side. Maybe something stung you? It could always be a pair of bug bites. Gross.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
					pc.createStatusEffect("Horn Bumps");
				}
				// Breaking Skin
				else if(pc.horns == 0)
				{
					AddLogEvent("The pain from those irritating red bumps on your forehead is getting worse and worse with each passing moment, matched by a sudden desire to scratch madly at them until you flay the skin away. You resist as long as you can, but the need to tend to the maddening itch overwhelms your subpar self-control. Besides, if something itches, why not scratch it?", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
					ExtendLogEvent("\n\nTo your horror, your first scratch peels away a patch of offending skin, but with it comes a sense of relief. Helpless to stop yourself, you scratch and scratch until the desire is completely gone - and a pile of discarded skin has built up before your " + pc.feet() + ".");
					ExtendLogEvent("\n\nWhat have you done to yourself!? Pulling out your Codex, you use the camera to check.");
					ExtendLogEvent(ParseText("\n\nYou tumble onto your [pc.butt] in shock. You... y-you’re... <b>you’ve got the cutest pair of horns growing out of your forehead!</b> They’re small little nubs at the moment - adorable really, but they do a great job telling everyone about your bovine proclivities."));
					pc.hornType = GLOBAL.TYPE_BOVINE;
					pc.removeStatusEffect("Horn Bumps", true);
					pc.horns = 2;
					pc.hornLength = .5;
				}
				// nubs -> 1" horns
				else if(pc.hornLength < 1)
				{
					AddLogEvent("For the past few minutes, a nasty little headache has been brewing. You squeeze your eyes closed, flexing your jaw in an effort to deal with it, when it abruptly fades, vanishing in the span of a second.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
					ExtendLogEvent(ParseText("\n\nYou gingerly prod yourself; just what kind of headache was that? You get your answer when your fingers find what your nubs have become: full blown horns. They stick at least a full inch out from your [pc.skinFurScales], coming to two proud points, though their tips are rounded enough that you doubt you could do any real injury with them. They’re mostly there for ornamentation, you figure, like a pair of earrings for your forehead."));
					pc.hornLength = 1;
				}
				// 1" horns to 2" horns
				else if(pc.hornLength < 2)
				{
					AddLogEvent("A wave of discomfort strikes just behind your forehead, growing worse by the second. There’s really only one thing it can be - your horns getting bigger! You whip out your Codex, wincing from the sudden motion, and flick it on, getting yourself a ticket to your own horny transformation show. You giggle to yourself and watch.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
					ExtendLogEvent("\n\nYour formerly one-inch horns have already pushed a little further out, perhaps a quarter inch. The longer they get, the wider their bases are becoming, and they’re growing fast enough now that you can actually see them slowly sliding out, revealing bit after bit of gleaming white ivory.");
					if(pc.hasHair() && pc.hairLength >= 2) ExtendLogEvent(" You brush your bangs to one side, hooking them around one of the horns in the cutest way.");
					ExtendLogEvent(" The process is fascinating enough for you to forget your earlier discomfort. You watch, spellbound, as your horns continue to expand, growing ever more prominent on your face until they stop at around two inches long.");
					ExtendLogEvent("\n\nEveryone will know you’re a New Texas " + pc.mf("boy","girl") + " now");
					if(pc.biggestTitSize() >= 15) ExtendLogEvent(", as if the tits weren’t an obvious enough sign");
					ExtendLogEvent(".");
					pc.hornLength = 2;
				}
				// 2" horns to 3" horns
				else if(pc.hornLength < 3)
				{
					AddLogEvent("Your jaw clenches, a low growl escaping your throat entirely uncontrollably. There’s a powerful shifting and sliding going on in your skull. It leaves you seeing stars with your eyes half-crossed. There’s blessedly little pain, but when it passes, you’re very aware of additional weight tugging on your head. Your horns have grown: they’re now three inches of gleaming white bovine beauty. You resolve to polish them at the first opportunity, maybe even buy some jewelry for them once you’re sure they’re done growing.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
					pc.hornLength = 3;
				}
				// 3" horns to 4" horns - prolly gonna reuse some of this for guys.
				else if(pc.hornLength < 4)
				{
					AddLogEvent("Your eyes suddenly cross, and you drop yourself to the ground, lest you run into something or worse. The rumbling sense of movement is working on your skull once more, like giant boulders rolling around the inside of your head. It doesn’t hurt, but it is very disconcerting, making it next to impossible to think.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
					ExtendLogEvent("\n\nYou grunt and groan, feeling the sensation slide <i>outside</i> of your head as your horns expand, growing thicker and heavier.");
					if(effect.value1 == 0) ExtendLogEvent(" The Treatment isn’t supposed to give you such large horns. You frown as they finish growing; the Texans will probably call you a milk-bull or something equally degrading.");
					else ExtendLogEvent("You sigh in satisfaction once they stop growing. Now these are respectable horns!");
					pc.hornLength = 4;
				}
				// 4" horsn to 5" horns - MAX LADIES CAN GET.
				else if(pc.hornLength < 5)
				{
					AddLogEvent("You feel a sense of... potential building within your head, expanding until it changes from a kind of nebulous energy into an unstoppable pressure. You feel your horns giving under the weight of it all, slowly sliding forward, expanding outward, growing heavier by the moment. You wrap your hands around them, feeling the change against your palms. When it’s all over, you’re left holding two big, strong five-inch horns.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
					pc.hornLength = 5;
					break;
				}
			}
		}
		
		// tail-converts existing to cowtail
		// cunt/cocktails prevent this!
		if(!pc.hasCuntTail() && !pc.hasCockTail() && pc.tailType != GLOBAL.TYPE_BOVINE && startHours < 97 && treatedHours >= 97 && rand(10) != 0)
		{
			// No tail
			if(pc.tailCount <= 0)
			{
				AddLogEvent(ParseText("You go to scratch at a spot above your [pc.butt] that’s been bothering you for a few hours, and jerk when you hit something that wasn’t there before - something rounded and fluffy. Pressing back carefully, you ease your fingers around the growth, discovering its furred texture and cords of muscle. The oddest part is feeling the fingers pressing on you through the fur. There’s no doubt about it - <b>you have a tail.</b>\n\nIt’s a fairly long tail with a cute little poof on the end, just like a cow’s."), "passive", treatmentHourPrint(treatedHours, startHours));
				pc.tailCount = 1;
			}
			// Multitail
			else if(pc.tailCount > 1)
			{
				// Multi - short
				if(!pc.hasTailFlag(GLOBAL.FLAG_LONG))
				{
					AddLogEvent(ParseText("Your [pc.tails] brush against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had [pc.tails], now you’ve got gently-swaying, bovine tails, complete with fuzzy puffs at the tips."), "passive", treatmentHourPrint(treatedHours, startHours));
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(ParseText(" A fine layer of [pc.furColor] fur covers each one."));
					ExtendLogEvent(" You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.");
				}
				// Multi - long
				else
				{
					AddLogEvent(ParseText("Your [pc.tails] feel increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremities alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find."), "passive", treatmentHourPrint(treatedHours, startHours));
					ExtendLogEvent("\n\n" + StringUtil.upperCase(num2Text(pc.tailCount)) + " gently swinging, bovine tails hang behind you. The tips are poofing up, just as you’d expect");
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(", and a coat of fine fur is growing out over their lengths");
					ExtendLogEvent(". In seconds, the warmth fades, leaving you with new, bovine butt ornaments. You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.");
				}
			}
			// Single - short
			else if(!pc.hasTailFlag(GLOBAL.FLAG_LONG))
			{
				AddLogEvent(ParseText("Your tail brushes against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had a [pc.tail], now you’ve got a gently-swaying, bovine tail, complete with a fuzzy puff at the tip."), "passive", treatmentHourPrint(treatedHours, startHours));
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(ParseText(" A fine layer of [pc.furColor] fur covers the whole thing."));
				ExtendLogEvent(" You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.");
			}
			// Single - long
			else
			{
				AddLogEvent(ParseText("Your [pc.tail] feels increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremity alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find."), "passive", treatmentHourPrint(treatedHours, startHours));
				ExtendLogEvent("\n\nA gently swinging, bovine tail hangs behind you. The tip is poofing up, just as you’d expect");
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(", and a coat of fine fur is growing out over its length");
				ExtendLogEvent(". In seconds, the warmth fades, leaving you with a new, bovine butt appendage. You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.");
			}
			pc.clearTailFlags();
			pc.tailType = GLOBAL.TYPE_BOVINE;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		}
		// Cow ears (maybe)
		if(pc.earType != GLOBAL.TYPE_BOVINE && startHours < 137 && treatedHours >= 137 && rand(10) == 0)
		{
			AddLogEvent("You go to scratch at one of your " + pc.earsDescript() + ParseText(", only to find it differently shaped - and in a new location - than before. Gingerly feeling it, you discover that your aural organs are soft and leathery, with a fine coat of [pc.furColor] across their outer edges. You can still hear just fine; you’re just listening through a pair of floppy cow-ears now. Briefly, you consider how good it would feel to have someone scratch them."), "passive", treatmentHourPrint(treatedHours, startHours));
			pc.earType = GLOBAL.TYPE_BOVINE;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_FLOPPY);
			pc.addEarFlag(GLOBAL.FLAG_FURRED);
		}
		// Hooves (Rarish) - requires biped minimum. No change for goo/nagaPCs
		if(pc.legCount >= 2 && pc.legType != GLOBAL.TYPE_BOVINE && startHours < 145 && treatedHours >= 145 && rand(10) <= 1)
		{
			if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES))
			{
				AddLogEvent("You stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. It’s then that you spot way your " + pc.feet() + " are shifting and changing. They look like they’re staying as hooves, but they’re a little more of a brown-black color, with a split down the middle. They look like the kind of hooves a cow would have. Well, there are worse things than having a matched set of transformations. <b>You resolve to enjoy your new cow hooves.</b>", "passive", treatmentHourPrint(treatedHours, startHours));
			}
			else
			{
				AddLogEvent("You stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. You see why when you glance to your " + pc.feet() + ". They’re malformed, twisting and narrowing before your eyes. They’re pulling their disparate parts together into one unified mass, almost cylindrical in shape", "passive", treatmentHourPrint(treatedHours, startHours));
				if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))
				{
					ExtendLogEvent(", and the change isn’t limited to below the ankle either. Your calves are reshaping, placing what used to be your ankle far above your blackening feet");
				}
				else ExtendLogEvent(", and they begin to blacken, moment by moment");
				ExtendLogEvent(".\n\nThey split in half, right down the middle, growing harder by the moment, dulling your sense of touch. You dully rub them, confused at first. Realization hits you like a ton of bricks - you have hooves! Just like a cow, you’ve got hooves to clop around on while you walk. Most people don’t get hooves from the Treatment. It looks like you were one of the lucky ones. " + pc.mf("The cow-girls are gonna be all over you!","The bull-boys are going to love the look!"));
			}
			pc.clearLegFlags();
			pc.legType = GLOBAL.TYPE_BOVINE;
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
		}
		// Clit Expanding
		if(pc.totalClits() > 0)
		{
			if((startHours < 113 && treatedHours >= 113) && pc.clitLength < 0.75)
			{
				// Small clits gro - clothed
				if(pc.isCrotchGarbed())
				{
					AddLogEvent(ParseText("With every movement you make, you become increasingly aware of your [pc.clits] rubbing against your [pc.lowerGarment]. It’s impossible to ignore the constant, distracting friction on your nub"), "passive", treatmentHourPrint(113, startHours));
					if (pc.totalClits() > 1) ExtendLogEvent("s");
					ExtendLogEvent(ParseText(", feeding your arousal fresh fuel. You huff in annoyance and yank the offending garments down, eyeballing [pc.oneClit] to see why it’s gotten so gosh darn sensitive."));
				}
				// Small clits gro - unclothed
				else
				{
					AddLogEvent("With every movement you make, you find your " + possessive(pc.vaginasDescript()) + ParseText(" [pc.clits] rubbing on your netherlips as if constantly aroused and swollen. It’s a nagging, constant sensation of friction on your nub"), "passive", treatmentHourPrint(113, startHours));
					if(pc.totalClits() > 1) ExtendLogEvent("s");
					ExtendLogEvent(ParseText(", feeding your arousal fresh fuel. You huff in annoyance and bend over for a closer look, eyeing [pc.oneClit] to see why it’s so sensitive now."));
				}
				// Merge
				ExtendLogEvent("\n\n<b>Your clit is like a big, pink gumball!</b> Even when it isn’t stimulated, it’ll probably stick out of its hood. It must be three quarters of an inch long at full size. You’ll just have to get used to having such a big, easily stimulated buzzer.");
				pc.clitLength = 0.75;
				// track
				pc.createStatusEffect("Clitgrow Done Notice",0,0,0,0,true,"","",false,10080);
			}
			// Big clit exhibitionism - not a TF, just a fun message.
			if((startHours < 127 && treatedHours >= 127) && pc.clitLength >= 0.75 && pc.hasStatusEffect("Clitgrow Done Notice"))
			{
				AddLogEvent("You wonder if the best way to handle your enlarged clit", "passive", treatmentHourPrint(127, startHours));
				if(pc.totalClits() > 1) ExtendLogEvent("s");
				ExtendLogEvent(" would just be to leave ");
				if(pc.totalClits() == 1) ExtendLogEvent("it");
				else ExtendLogEvent("them");
				ExtendLogEvent(" out and open to the air. Most of the frontier worlds don’t have laws against public nudity; some even encourage it! You wouldn’t have the constant rubbing to worry about, and you could bask in the lusty gazes of onlookers, maybe even seduce one into a quick romp!");
				// untrack
				pc.removeStatusEffect("Clitgrow Done Notice");
			}
		}
		// Defattening
		if(pc.thickness > 60 && startHours < 65 && treatedHours >= 65)
		{
			// High thickness trims in.
			// Ogre -> Curvy cowgal
			if(pc.tone > 59)
			{
				AddLogEvent("Hour by hour, the imposing girth and size of your body has been narrowing into a more svelte, feminine shape. Sure, some parts of you have stayed the same - your hips, for example, but your shoulders aren’t nearly as broad, and your arms are no longer as visibly muscular. You still feel just as strong; you’ve just taken on a more womanly look.", "passive", treatmentHourPrint(65, startHours));
				// Thickness to 60.
				pc.thickness = 60;
				// Tone to 59.
				pc.tone = 59;
			}
			// High thickness and high fat trims in.
			// Fatty -> Curvy Cowgal
			else
			{
				AddLogEvent("All the excess weight you’ve carried around has been melting off hour by hour. You aren’t exactly a little stick of a girl - not by a longshot. You’ve still got plush curves that just beg to be squeezed and handled. It’s just that no one with half a brain would call you fat now, though the term curvy might be apt.", "passive", treatmentHourPrint(65, startHours));
				// Thickness to 60
				pc.thickness = 60;
			}
		}
		// Hip widening towards 7-11.
		if(pc.hipRating() < 7 && treatedHours > 55)
		{
			numHipGains = 0;
			for (i = 0; i < treatedHours - Math.max(startHours, 55); i++)
			{
				if (rand(20) == 0) numHipGains++;
			}
			
			var hipsPerTick:Number = (treatedHours - Math.max(startHours, 55)) / numHipGains;
			
			for (i = 0; i < numHipGains; i++)
			{
				// Sub 3 to 3
				if(pc.hipRatingRaw < 3)
				{
					AddLogEvent("You look yourself over, discovering that your hips have widened, giving you a more feminine look.", "passive", treatmentHourPrint(((55 - startHours) + (hipsPerTick * (i + 1))), 0));
					pc.hipRatingRaw = 3;
				}
				// Not so smallish Sub 6 to 6
				else if(pc.hipRatingRaw < 6)
				{
					AddLogEvent("Whoah! Your hips have gotten wider. Nobody is going to mistake you for a boy when you can swivel these back and forth. You sashay them around a few times, just to try it out.", "passive", treatmentHourPrint(((55 - startHours) + (hipsPerTick * (i + 1))), 0));
					pc.hipRatingRaw = 6;
				}
				// Biggish (Sub max to max)
				else
				{
					pc.hipRatingRaw += 1 + rand(5);
					AddLogEvent(ParseText("Moving around, you’re pleased to discover a little extra wiggle in you walk. Your [pc.butt] sways hypnotically as you go, automatically borne on a sinuous back and forth motion by your expanding [pc.hips]. You wonder if anyone will notice."), "passive", treatmentHourPrint(((55 - startHours) + (hipsPerTick * (i + 1))), 0));
					break;
				}
			}
		}
		// Bigger Booty Towards 7-12.
		if(pc.buttRatingRaw < 7 && treatedHours > 49)
		{
			var buttGainProb:Number = Math.round((1 - Math.pow(23 / 24, (treatedHours - startHours - (49 * 2)))) * 1000);
			if (rand(1000) < buttGainProb)
			{
				if (pc.isCrotchGarbed())
				{
					AddLogEvent(ParseText("An increase in the tightness of your [pc.lowerGarments] gradually comes to your attention, forcing you to shift and adjust them."), "passive", treatmentHourPrint(((55 - startHours) + (hipsPerTick * (i + 1))), 0));
				}
				else
				{
					AddLogEvent("A slight shift in your balance gradually makes itself known to you, and you twist to regard your changing form, expecting to find a bigger butt.", "passive", treatmentHourPrint(((55 - startHours) + (hipsPerTick * (i + 1))), 0));
				}
				ExtendLogEvent(" Sure enough, your ass has swollen up with an influx of fresh new flesh, pushing it out into a quite squeezable, bubbly butt. The urge to shake it comes over you, but you fight it off, for now. There will be plenty of time for that sort of thing later. Not too much later, but later.");
				pc.buttRatingRaw = 7 + rand(6);
			}
		}
	}
	// REGULAR DUDEMOAD
	// 3. Male Treatment Section
	else if(effect.value1 == 1)
	{
		// 48 Hours of Mental Changes: slowStatGain of 2 libido an hour.
		// +Confidence
		// +Increased Enjoyment of Physical Tasks
		// +Libido (of course)
		// +Craving for vaginal fluid
		pc.slowStatGain("libido", (treatedHours - startHours) * 2);
		
		if(startHours < 2 && treatedHours >= 2)
		{
			AddLogEvent("Well, you’ve taken the Treatment and you don’t really feel any different yet. You would’ve thought that after an hour or two you’d be daydreaming about the silken slit between a busty cow-gal’s thighs, but... nope. You sigh and return to your previous business, hoping something happens soon.", "passive", treatmentHourPrint(2, startHours));
		}
		
		if(startHours < 4 && treatedHours >= 4)
		{
			AddLogEvent("You idly munch on a ration bar, struck by an unexpected pang of hunger. One moment, you’re moving along just fine, the next, you need to eat like nobody’s business. Good thing your ship was stocked full of them. You wouldn’t want to starve out here just because your body is stocking up on calories for a little ", "passive", treatmentHourPrint(4, startHours));
			if(!pc.hasCock()) ExtendLogEvent("muscle-building");
			else ExtendLogEvent("dick-swelling");
			ExtendLogEvent(".");
			if(pc.hasCock()) ExtendLogEvent(" You pull open your bottoms and eyeball your " + pc.cocksDescript() + ". Still the same. Damn.");
		}
		
		if(startHours < 6 && treatedHours >= 6)
		{
			AddLogEvent("You belch loudly, not remembering your manners until it’s too late to do anything about. A sheepish look around you is all you manage before your shame melts away. It was just a burp. It’s a totally normal thing to do, particularly after eating another ration bar. You belch again, enjoying the way it rumbles out of your chest a little more strongly than you anticipated. You’ve got nothing to be ashamed of.", "passive", treatmentHourPrint(6, startHours));
		}
		
		if(startHours < 8 && treatedHours >= 8)
		{
			AddLogEvent("Rubbing your chin, you consider the evidence stacking up around you in the form of empty wrappers. The Treatment is definitely doing something to you, though it’s still way too soon for it to be ", "passive", treatmentHourPrint(8, startHours));
			if(pc.hasCock()) ExtendLogEvent("giving you a sperm-dripping bull-cock");
			else ExtendLogEvent("changing your body");
			ExtendLogEvent(". You have been thinking about sex a little more than normal over these past few hours");
			if(pc.hasCock()) ExtendLogEvent(", and " + pc.eachCock() + " in engorges in anticipation of a little attention");
			ExtendLogEvent(". Not that there’s anything wrong with thinking about sex, you suppose. It’s not exactly a new thing, and it probably has nothing to do with the Treatment.");
			pc.lust(2);
		}
		
		if(startHours < 10 && treatedHours >= 10)
		{
			AddLogEvent("You find yourself smiling more and more, and not in the silly, stupid, giggly way that the bimbos back on New Texas do. No, it’s just an easy, friendly grin - the kind that lets people know you’ve probably got a few good stories to tell over beers and a campfire. It’s the kind of grin that could get a girl to climb into your lap for a heavy make-out session, and that thought just makes you smile all the harder.", "passive", treatmentHourPrint(10, startHours));
			pc.lust(4);
		}
		
		if(startHours < 12 && treatedHours >= 12)
		{
			AddLogEvent("You have so much energy lately. You could jog in place or drop and work through twenty pushups right now if you didn’t have other stuff to do. Maybe you ought to start working out soon. With all the food you’re consuming, it might be a good idea to burn some of the excess calories off before they go to your waistline. You’re going to need to be hot enough to pick up some cuties soon, what with how your libido is supposed to spike.", "passive", treatmentHourPrint(12, startHours));
			pc.lust(4);
			if(pc.hasCock()) 
			{
				ExtendLogEvent("\n\nYou pointedly adjust your " + pc.cocksDescript() + ", finding ");
				if(pc.cockTotal() == 1) ExtendLogEvent("it");
				else ExtendLogEvent("them");
				ExtendLogEvent(" to be entirely too rigid at this exact moment.");
				if(pc.lust() >= 80) 
				{
					ExtendLogEvent(" You’re either going to need to give ");
					if(pc.cockTotal() > 1) ExtendLogEvent("them ");
					else ExtendLogEvent("it ");
					ExtendLogEvent("some attention, or find a slippery girl in need of a good reaming soon.");
				}
				else ExtendLogEvent(" You give yourself a comforting squeeze and move on, reveling in the sensuous warmth that infuses you.");

			}
		}
		
		if(startHours < 14 && treatedHours >= 14)
		{
			AddLogEvent("You frown. It’s already been the better part of a day and you’re no closer to being a ", "passive", treatmentHourPrint(14, startHours));
			if(pc.hasCock()) ExtendLogEvent("hung bull");
			else ExtendLogEvent("chiseled adonis");
			ExtendLogEvent(" than you were back when you took the Treatment.");
			if(pc.hasCock()) 
			{
				ExtendLogEvent(" Is it too much to ask for your " + pc.cocksDescript() + " to swell up huge and hard when you want it to? You’re fucking horny, and ");
				if(pc.biggestCockLength() >= 12) ExtendLogEvent("though " + pc.eachCock() + " is already huge, you could be bigger! Imagine the gaped holes you’d leave behind!");
				else ExtendLogEvent("you’re not even ready to properly gape any cunts yet.");
			}
			ExtendLogEvent(" Growling, you scratch your crotch and sigh.");
			pc.lust(5);
		}
		
		if(startHours < 16 && treatedHours >= 16)
		{
			AddLogEvent("You decide to do a few pushups out of the blue. Despite your mind telling you that they should be a piece of cake, they’re way harder than your brain expected. You muscle through them anyhow, building up a sheen of sweat in the process. In the aftermath of the activity, you reflect on just how satisfying that felt. In its own way, it was almost as good as sex.", "passive", treatmentHourPrint(16, startHours));
			ExtendLogEvent("\n\nOf course, nothing would feel as right a solid, bed-breaking fuck right about now.");
			pc.lust(6);
		}
		
		if(startHours < 18 && treatedHours >= 18)
		{
			AddLogEvent("You spend a few minutes looking at yourself in the screen of your Codex and wonder if there’s anything you should change or do differently. A little grooming would go a long way towards making the ladies’ panties damp and clingy. Unbidden, a perfectly realized vision of a pair of white, cottony ones comes to mind, perfectly molded to a very aroused looking slit. You lick your lips and dismiss the image. You’re sure you’ll see that sort of thing plenty soon enough.", "passive", treatmentHourPrint(18, startHours));
			pc.lust(8);
		}
		
		if(startHours < 20 && treatedHours >= 20)
		{
			AddLogEvent("Something occurs to you. You’re getting more confident. You’re sure of it. If you walked into a bar on the wrong planet, you’d look everyone you met in the eye without thinking twice about it. Best case scenario, you’d pick yourself up a punky honey. Worst case scenario, you get to lay out a few toughs.", "passive", treatmentHourPrint(20, startHours));
			ExtendLogEvent("\n\n...You hope that muscle growth starts before you wind up getting yourself in over your head.");
		}
		
		if(startHours < 22 && treatedHours >= 22)
		{
			AddLogEvent(ParseText("In a slow moment, you let yourself daydream, imagining just how things will be once you knock some sense into your cousin and claim your birthright. You’ll have a grand capital ship, staffed with the buxom women of all colors and species. [rival.name] will be there, handing out towels on the nude pool deck, forbidden from touching any of your girls. When you aren’t relaxing, you’ll sit in your captain’s chair, signing important documents while the girls tend to the needs"), "passive", treatmentHourPrint(22, startHours));
			if(pc.legCount > 1) ExtendLogEvent(ParseText(" between your [pc.legs]."));
			else ExtendLogEvent(" of your sex.");
			ExtendLogEvent("\n\nThere’s nothing wrong with a little daydreaming, after all.");
			pc.lust(25);
		}
		
		if(startHours < 24 && treatedHours >= 24)
		{
			AddLogEvent("One day under the Treatment, and you’re already finding yourself imagining every woman you see with bigger, milkier, pregnant boobs. It’s hard not to, really. They’ve got all these organs whose sole purpose is to be filled with life, and their bodies get so sexy from it. It’s almost like it’s your duty to seed as many as possible. And in another day or two, you’ll probably be big and strong enough that they’ll just throw themselves into your arms. That easy grin comes back to your face, and you don’t expect it to ever leave.", "passive", treatmentHourPrint(24, startHours));
			pc.lust(10);
		}
		
		if(startHours < 26 && treatedHours >= 26)
		{
			AddLogEvent("You crack your neck and roll your shoulders. There’s a lot to get done, and you’re the only " + pc.mf("guy", "gal") + " that can do it. If you can manage to get your dick taken care of in the process, more power to you.", "passive", treatmentHourPrint(26, startHours));
			pc.lust(2);
		}
		
		if(startHours < 28 && treatedHours >= 28)
		{
			AddLogEvent("You grunt while looking at your Codex. When did you put such a cruddy color scheme on this thing? It looks like something a kid would have on their computer, not the type of thing you’d put on a serious business machine with a surprising amount of processing power. You click through the settings and pick a scheme that befits the serious nature of your quest. Now, back to work.", "passive", treatmentHourPrint(28, startHours));
		}
		
		if(startHours < 30 && treatedHours >= 30)
		{
			AddLogEvent("Stars above, there is a serious ", "passive", treatmentHourPrint(30, startHours));
			if(pc.hasCock())
			{
				if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText("tightness in your [pc.lowerGarment]. You take a look inside and find yourself more hard than you’ve been in a while, and just dribbling pre-cum all over the inside of your equipment. You let it snap closed and sigh. Either you’ve got to find a partner fast, or it’s time to vent some of the pressure building in your ") + pc.ballsDescript() + ". One way or the other, you’re due to blow a load.");
				else 
				{
					ExtendLogEvent("hardness in your groin. You take a look down and find yourself more hard than you’ve been in a while, dribbling pre-cum down your length");
					if(pc.cockTotal() > 1) ExtendLogEvent("s");
					ExtendLogEvent(". Either it’s time to find a partner or time to jack off. Either way, you need to blow a load.");
				}
			}
			else ExtendLogEvent("ache of desire welling up within you. If only had a dick, you could just reach down and tug yourself to an easy, messy orgasm. Maybe you could even splatter a layer of baby-making cream across a cute slut’s face. She’d love it. As it is, you’re going to have to settle for getting off some other way - anything to burn through this lusty haze.");
			pc.maxOutLust();
		}
		
		if(startHours < 32 && treatedHours >= 32)
		{
			AddLogEvent("You examine yourself and sigh, ticking through a mental list of the changes you’ve noticed so far. You’re a lot more confident. That’s a plus. And you’re hornier. A lot hornier. You can’t really doubt that now, even if your boosted libido feels as normal and right as fresh apple pie. You file that away as a plus too. The extra lust and the extra demands it places on you don’t distract you from what needs to be done as much as you thought they would. Also, you’re pretty sure you’re really starting to enjoy physical work. Just lifting a heavy weight up and down for an hour would be a pretty great way to spend an afternoon.", "passive", treatmentHourPrint(32, startHours));
			ExtendLogEvent("\n\nWhat about downsides? You rack your brain. Well, you’ve got to get off more for sure, but that’s not really a downside. You wouldn’t be able to keep a treated girl sated if you weren’t getting so randy. Is there anything else? You shake your head. Nothing is coming to mind. This Treatment is working out pretty great.");
			pc.lust(2);
		}
		
		if(startHours < 34 && treatedHours >= 34)
		{
			AddLogEvent("You idly wonder how hard it would be to fit some gym equipment onto your ship so that you can stay in shape on the road. It’d be an entertaining diversion from the monotony of waiting for light drive to carry you to the next jump gate.", "passive", treatmentHourPrint(34, startHours));
			if(celiseIsCrew()) ExtendLogEvent(" Celise could even service you while you go at it.");
			else ExtendLogEvent(" Maybe you can find someone willing to service you while you go at it.");
		}
		
		if(startHours < 36 && treatedHours >= 36)
		{
			// Cock
			if(pc.hasCock())
			{
				AddLogEvent("You growl in dissatisfaction. You can’t seem to quell the rioting heat in your loins or the way it keeps your " + pc.cocksDescript() + ParseText(" so iron-hard with thoughts of near-constant sex. Even your [pc.nipples] are "), "passive", treatmentHourPrint(36, startHours));
				if(pc.hasDickNipples()) ExtendLogEvent("jutting out of their sheaths, ready to be thrust inside something");
				else if(pc.isLactating() || pc.hasFuckableNipples()) ExtendLogEvent("leaking");
				else if(pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FLAT || pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) ExtendLogEvent("hard");
				else if(pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES) ExtendLogEvent("pursed and drooling");
				else ExtendLogEvent("pebbly and sensitive");
				ExtendLogEvent(". You briefly consider forcing yourself upon the next person you meet but immediately discard the thought. Why would you stoop to something so... so... uncivilized when there’s plenty of willing partners out there?");
			}
			// Pussah
			else if(pc.hasVagina())
			{
				AddLogEvent("You growl in dissatisfaction. You can’t seem to quell the rioting heat in your loins or the constant dripping.", "passive", treatmentHourPrint(36, startHours));
				if(pc.totalClits() > 0) ExtendLogEvent(ParseText(" [pc.EachClit] is achingly hard, like a bullet on a hair-trigger."));
				ExtendLogEvent(" The weirdest part is that you don’t really crave penetration - at least not your own. No, you want to push yourself against someone soft and yielding, really grind your weeping slit");
				if(pc.totalVaginas() > 1) ExtendLogEvent("s");
				ExtendLogEvent(" against them until you’re both covered in sweat and sexual effluvia, panting breathily with you on top.");
			}
			// Nothing
			else
			{
				AddLogEvent(ParseText("You growl in dissatisfaction. You can’t seem to quell the feeling of building eroticism or odd desires. Playing with your [pc.asshole] or [pc.nipples] just won’t be enough for you anymore. You want to <i>penetrate</i>, not be penetrated. If only had a dick, this would be so much easier... a nice, hard, throbbing prick to bury into your partners. You look at your fingers and smile. They’re no cock, but you bet you can make some cutie howl in delight if you use them right."), "passive", treatmentHourPrint(36, startHours));
			}
			// Merge
			ExtendLogEvent("\n\nBesides, the real takeaway is just how hot and horny you’re able to get without going off. You’re able to sit there fantasizing about a beauty so busty that her milk-stained top is about to tear off her tits well past the point where you’d have to masturbate before. You suppose you’re getting better at it - being aroused that is. You could walk around ");
			if(pc.hasCock()) ExtendLogEvent("with a pant-straining stiffy for hours");
			else if(pc.hasVagina()) ExtendLogEvent("with soaked panties");
			else ExtendLogEvent("with overwhelming desire");
			ExtendLogEvent(" and still wait a few hours to find just the right playmate. It must be an effect of the treatment, turning you into some combination of a rutting bull and sexual god. Either seems fine.");
			// Inhuman Desire +20 max lust.
			if(!pc.hasPerk("Inhuman Desire"))
			{
				ExtendLogEvent("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				ExtendLogEvent("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
			pc.lust(20);

		}
		
		if(startHours < 38 && treatedHours >= 38)
		{
			AddLogEvent("You crack your knuckles a few times, admiring the rich sound, powerful sound it makes. You can’t be far from getting your real rewards for taking the Treatment - muscles", "passive", treatmentHourPrint(38, startHours));
			if(pc.hasCock()) ExtendLogEvent(", a bigger dick");
			if(pc.balls > 1) ExtendLogEvent(", bigger balls");
			ExtendLogEvent(", potent pheromones, and badass horns. A cocky smile graces your features. This should be fun.");
		}
		
		if(startHours < 42 && treatedHours >= 42)
		{
			AddLogEvent("There’s little doubt that your preferences have been changing these past two days, but you decide to really put things to the test by using your Codex to access some of the more... sexual sites on the extranet. You don’t really do so with the intention of masturbating. It’s just idle curiosity over how your tastes are changing.", "passive", treatmentHourPrint(42, startHours));
			ExtendLogEvent("\n\nYou browse through the categories one by one, starting with things like galotian oil-porn and ausars in heat, then working your way across the xxx-rated mélange into ultraporn, the realm of gene-modded sexual parodies. The things you liked before are all still pretty awesome, but it’s like someone went and turned things like lactation, cow-girls, and pregnancy into the universe’s fetishes. Seeing a leaky tit onscreen makes your mouth water.");
			ExtendLogEvent("\n\nHell, even squirting orgasms look way more exciting that before. Your tongue feels chapped and dry, and you have the distinct desire to ram it into the gushing onscreen hole.");
			pc.lust(13);
		}
		
		if(startHours < 44 && treatedHours >= 44 && pc.hasPerk("Inhuman Desire"))
		{
			// Cocks
			if(pc.hasCock())
			{
				AddLogEvent("You find yourself just kind of idly rubbing at " + pc.oneCock() + " whenever you have a spare moment. At first, you’d stop yourself whenever it happened, but more and more, you don’t see the logic in stopping. It feels really good to have a little friction on your length, and if it keeps your body churning up a fresh load faster, who are you to complain? Your ", "passive", treatmentHourPrint(44, startHours));
				if(pc.hasVirginCock()) ExtendLogEvent("next");
				else ExtendLogEvent("first");
				ExtendLogEvent(" lay is going to thank you for being so ready for her, you’re sure of it.");
				ExtendLogEvent("\n\nIt doesn’t even distract you that much, really. Dealing with arousal is an automatic thing for you now. Pre-soaked undies? You’re pretty sure you’d have no problem ignoring the sticky, moist feeling. Adjusting the fit of clothing to deal with your rigid length? Your hand is there anyway. It might as well keep you comfortable. And you can still sit there browsing the extranet with your other hand, or buying supplies... or grabbing a tit. Whatever really.");
				ExtendLogEvent("\n\nThe important takeaway is that you’re so much better at being rock-hard than ever before. Before, when you were less awesome, you might’ve been desperate to climax, masturbating furiously. Now? You’ve learned to control it, to ride the tide of sexual desire like a cowboy on his steed. It’s empowering.");
			}
			// Cooches!
			else if(pc.hasVagina())
			{
				AddLogEvent("You find yourself just kind of idly rubbing at", "passive", treatmentHourPrint(44, startHours));
				if(pc.totalClits() > 0) ExtendLogEvent(ParseText(" [pc.oneClit]"));
				else if(pc.totalVaginas() != 1) ExtendLogEvent(" one of your slits");
				else ExtendLogEvent(" your slit");
				ExtendLogEvent(" whenever you have a spare moment. At first, you’d stop yourself and blush, but more and more, you don’t see the logic in stopping. Your");
				if(pc.totalClits() > 0) ExtendLogEvent(" clit is there. It’s hard");
				else ExtendLogEvent(" slit is there");
				if(pc.totalClits() > 0) ExtendLogEvent(" and wants to be touched. So you touch it. What’s the big deal? You aren’t masturbating, just keeping yourself ready is all. Why, everyone should be pleased that you’re keeping yourself so sexually ready all the time. Your lucky ");
				if(pc.hasVirginCock()) ExtendLogEvent("first");
				else ExtendLogEvent("next");
				ExtendLogEvent(" partner will be the one to reap the rewards of slippery-sweet sex, after all.\n\nYou don’t even really get distracted by it that much, really. The arousal burns like a pleasant heat in the back of your brain, spiking whenever your digits probe a particularly sensitive bundle of nerves, leaving the rest of your mind to do whatever mundane work it needs to do. You could probably file your taxes while a cute little faux-cow boy-toy kneels");
				if(pc.legCount > 1) ExtendLogEvent(ParseText(" between your [pc.legOrLegs]"));
				else ExtendLogEvent(" at your crotch");
				ExtendLogEvent(", putting a nice, wide bovine tongue to use, provided you had breaks for mind-shattering orgasms every now and again.");
				ExtendLogEvent("\n\nThe important takeaway is that you’re fucking amazing at being aroused now. Stimulation that would’ve morphed you into a mewling ball only makes you hotter and more capable of pleasure. It’ll take so much more teasing to bring you to the brink than ever before, but that just means you get to have bigger orgasms when you do. It’s win-win.");
			}
			// No Cooch!
			else
			{
				AddLogEvent(ParseText("You find yourself just kind of oddly clenching and unclenching your [pc.asshole]. Whenever you do, pleasant flashes of desire run through your body, slithering up your spine to wrap your brain in their sensuous warmth. Before taking the treatment, you’d be so turned on that you would probably be down on the ground, trying to stuff four fingers inside yourself. Now you can ride the arousal like your own personal steed, directing it but never denying it."), "passive", treatmentHourPrint(44, startHours));
				ExtendLogEvent("\n\nYou can only theorize that your brain is getting better and better at dealing with pleasure. The Treatment is making you more capable than ever before, even without normal genitalia. Why would anyone ever refuse such a gift?");
			}
			// All:
			// Inhuman Desire++
			// Inhuman Desire upgrade to +40.
			ExtendLogEvent("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
			pc.addPerkValue("Inhuman Desire",1,20);
			pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			pc.lust(13);
		}
		
		if(startHours < 46 && treatedHours >= 46 && !pc.hasPerk("Brute Speech") && !pc.hasPerk("Ditz Speech"))
		{
			AddLogEvent(ParseText("You catch yourself using fewer and fewer words to communicate as the days go by, not because using them is hard or anything, but because they seem pointless. Can’t they see how you feel from the set of your jaw or the tenseness of your shoulders? Can’t they read arousal in the flush of your [pc.skin] or the smell of your pheromones? There’s no point getting fancy with it when you can just state what you mean plainly and simply."), "passive", treatmentHourPrint(46, startHours));
			ExtendLogEvent("\n\nAll the big words are just a distraction.");
			// Brute Speech Unlock!
			ExtendLogEvent("\n\n(<b>Perk Gained: Brute Speech</b> - You will now sound like more like a reticent brute in scenes that support it.)");
			pc.createPerk("Brute Speech",0,0,0,0,"Alters dialogue in certain scenes.");

		}
		
		if(startHours < 48 && treatedHours >= 48)
		{
			AddLogEvent("You check your Codex’s chrono. It’s been 48 hours since your Treatment injection. That wasn’t that bad. You had worried that it would change who you were on the inside, but that didn’t happen, did it? You’re bigger, more confident, and ready to do some exercise as your muscles swell. And you’re hornier too, of course, but that goes without saying.", "passive", treatmentHourPrint(48, startHours));
			if(pc.hasCock())
			{
				ExtendLogEvent(" You could probably break a board in half with your dick");
				if(pc.cockTotal() > 1) ExtendLogEvent("s; they’re that hard.");
				else ExtendLogEvent("; it’s that hard.");
			}
			ExtendLogEvent(ParseText(" Underneath your more terse exterior and desire to fuck a big-boobed submissive, you’re still the same [pc.name] Steele."));
			ExtendLogEvent(ParseText("\n\nA better [pc.name] Steele."));
		}
		
		// Bigger Balls (egg to apple sized)
		// INCREASE BALLS TO 9.4 - 12.5 ballSize() = Almost 3" to almost 4" diameter		
		if(pc.balls > 0 && !pc.hasStatusEffect("Ballgrow Done Notice") && treatedHours >= 49 && startHours < 150)
		{
			var ballSizeGains:Array = [49, 80, 90, 110, 130, 150];
			var numBallSizeGains:int = 0;
			var firstBallSizeGain:int = -1;
			
			for (i = 0; i < ballSizeGains.length; i++)
			{
				if (startHours < ballSizeGains[i] && treatedHours >= ballSizeGains[i])
				{
					if (firstBallSizeGain <= -1)
					{
						firstBallSizeGain = i;
					}
					numBallSizeGains++;
				}
			}
		
			for (i = 0; i < numBallSizeGains; i++)
			{
				// Goodbye trap pouch
				if(pc.hasStatusEffect("Uniball"))
				{
					AddLogEvent(ParseText("You manage to make your swaying sack smack against your [pc.thigh] in the most painful way. It almost doubles you over. How could that have happened? You had such a tight, compact pouch for your ") + pc.ballsDescript() + ". Once the pain clears, you grab hold of yourself and sigh. Your almost vacuum-tight pouch is gone. In its place you’ve got a very normal, masculine-looking nutsack.", "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					pc.removeStatusEffect("Uniball", true);
					// Remove pouch
					// pc.lust(-10);
					pc.lust(-10);
				}
				// Hit max - notify and disable ball TFs till treatedment is over
				else if(pc.ballSizeRaw >= pc.statusEffectv4("Treated"))
				{
					AddLogEvent(ParseText(" A fateful tingle runs from one side of your [pc.sack] to the other, drawing your attention to the ") + pc.ballsDescript() + " within. They don’t look to have gotten any bigger this time. In fact, they’re probably done growing now. Well, ", "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					if(pc.balls == 1) ExtendLogEvent("it’s");
					else ExtendLogEvent("they’re");
					ExtendLogEvent(" at least as big as ");
					if(pc.ballDiameter() >= 3) {
						if(pc.balls == 1) ExtendLogEvent("an apple");
						else ExtendLogEvent("apples");
					}
					else
					{
						if(pc.balls == 1) ExtendLogEvent("a large egg");
						else ExtendLogEvent("large eggs");
					}
					ExtendLogEvent(" now. You’ll just have to get used to walking with a little bit more swinging down there.");
					pc.createStatusEffect("Ballgrow Done Notice",0,0,0,0,true,"","",false,10080);
				}
				// Up to 3
				else if(pc.ballSizeRaw < 3)
				{
					AddLogEvent("You feel a sort of effervescent heat pooling down in your loins, all warm and bubbly, like champagne inside you. It’s most concentrated in your " + pc.ballsDescript() + ParseText(", which you are very aware of pressing on the [pc.skinFurScales] of your [pc.thighs] through your [pc.sack]."), "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" You yank open your [pc.lowerGarment] for a look."));
					if(pc.balls == 1) ExtendLogEvent(" It’s");
					else ExtendLogEvent(" They’re");
					ExtendLogEvent("... bigger than before. Bigger by a pretty good margin. You’ve got ");
					if(pc.balls == 1) ExtendLogEvent("a ");
					ExtendLogEvent("pretty decent-sized nut");
					if(pc.balls > 1) ExtendLogEvent("s");
					ExtendLogEvent(" now. You roll ");
					if(pc.balls == 1) ExtendLogEvent("it ");
					else ExtendLogEvent("them ");
					ExtendLogEvent("in your palm, imagining the sheer virility contained within. From what you read, this is only the beginning. ");
					if(pc.balls == 1) ExtendLogEvent("It");
					else ExtendLogEvent("They");
					ExtendLogEvent(" won’t be done growing just yet.");
					pc.ballSizeRaw = 3;
				}
				// To 5
				else if(pc.ballSizeRaw < 5)
				{
					AddLogEvent("A pleasant, swaying weightiness accompanies your every stride, a potent reminder of your masculinity just a few inches below your crotch. And you think it’s getting heavier. Pausing with a grin the size of old Texas on your face, you reach down and cradle your " + pc.ballsDescript() + ". ", "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					if(pc.balls == 1) ExtendLogEvent("It’s ");
					else ExtendLogEvent("They’re ");
					ExtendLogEvent("warm and so pleasantly sensitive. You can almost swear you feel ");
					if(pc.balls == 1) ExtendLogEvent("it");
					else ExtendLogEvent("them");
					ExtendLogEvent(" puffing up and expanding in order to hold even bigger, juicier loads.");
					pc.ballSizeRaw = 5;
				}
				// To 7
				else if(pc.ballSizeRaw < 7)
				{
					AddLogEvent(ParseText("As you move about, you become very aware of a certain extra size in your crotch, pressing against your [pc.thighs] whenever you step too hastily. The sensation isn’t entirely unpleasant, as a matter of fact, the swaying feels kind of pleasant. Still, you stop to investigate, if for no other reason than to have a sense of just how big your growing cum-factor"), "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					if(pc.balls == 1) ExtendLogEvent("y is");
					else ExtendLogEvent("ies are");
					ExtendLogEvent(" getting on the Treatment.");
					if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" You just have to pull your [pc.lowerGarments] open first. You don’t even bother to see if anyone is looking."));
					if(pc.balls == 1) ExtendLogEvent(" It’s");
					else ExtendLogEvent(" They’re");
					ExtendLogEvent(" definitely bigger - over two inches across now for sure.");
					if(pc.balls == 1) ExtendLogEvent("\n\nA nut");
					else ExtendLogEvent("\n\nNuts");
					ExtendLogEvent(" like ");
					if(pc.balls == 1) ExtendLogEvent("this");
					else ExtendLogEvent("these");
					ExtendLogEvent(" might fit in with some of the most well-endowed terran naturals, but ");
					if(pc.balls == 1) ExtendLogEvent("it");
					else ExtendLogEvent("they");
					ExtendLogEvent("’d also look right at home on a large farm animal. You give yourself a comforting squeeze, hoping to encourage more growth.");
					pc.ballSizeRaw = 7;
				}
				// To 9
				else if(pc.ballSizeRaw < 9)
				{
					AddLogEvent("The sensation of heat and warmth throbbing through your " + pc.ballsDescript() + " is increasingly common, hour to hour, as ", "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					if(pc.balls == 1) ExtendLogEvent("it");
					else ExtendLogEvent("they");
					ExtendLogEvent(" swell");
					if(pc.balls == 1) ExtendLogEvent("s");
					ExtendLogEvent(" up with ever-greater amounts of virility. Why, you’re pretty sure ");
					if(pc.balls == 1) ExtendLogEvent("it’s");
					else ExtendLogEvent("they’re");
					ExtendLogEvent(" closing in on three inches across at the moment, to say nothing of ");
					if(pc.balls == 1) ExtendLogEvent("its");
					else ExtendLogEvent("their");
					ExtendLogEvent(" burgeoning circumference. What’s more important is of course the result of all that growing - all the spunk you’re churning up in ");
					if(pc.balls > 1) ExtendLogEvent("those cum factories");
					else ExtendLogEvent("that cum factory");
					ExtendLogEvent(", brewing up nice and thick for a randy twat.");
					pc.ballSizeRaw = 9;
				}
				// To 11
				else if(pc.ballSizeRaw < 11)
				{
					// Multinutt
					if(pc.balls > 1)
					{
						AddLogEvent(ParseText("You heft your expanding [pc.sack] in one hand, barely able to contain the orbs that practically glow with warmth. They’re bigger now, unsurprisingly. The best part is just how good they feel, rolling around in your palm, pressed against one another. It’s enough to draw a pleased sigh from your normally reserved throat. They’re probably each three and a half inches wide or more. You probably cum like a racehorse now. Heck, you probably cum harder and longer. Your nuts give an appreciative wobble of agreement. You ought to give these guys a try once you’ve made sure they’re totally full."), "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					}
					// Singlenutt
					else
					{
						AddLogEvent(ParseText("You heft your expanding [pc.sack] in one hand, feeling it fill your palm. It practically glows with its own, inner warmth. It’s bigger now, too. The best part is just how good it feels, rolling around in your palm, pressed against your fingers. It’s enough to draw a pleased sigh from your normally reserved throat. It’s probably each three and a half inches wide or more. You probably cum like a racehorse now. Heck, you probably cum harder and longer. Your nut gives an appreciative wobble of agreement. You ought to give this guy a try once you’ve made sure he’s totally full."), "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					}
					pc.ballSizeRaw = 11;
				}
				// To 12.5
				else if(pc.ballSizeRaw < 12.5)
				{
					// Multi
					if(pc.balls > 1)
					{
						AddLogEvent(ParseText("There’s no hiding the way your [pc.sack] sways about, certainly not now that the Treatment has blown up your nuts like balloons, only these are filled with the weight of virile, cum-pumping flesh. They’re on the edge of four inches wide - as big as apples - and sensitive to boot. It’s like the bigger they get, the more sensitive they’re becoming, but that can’t be right. Can it?\n\nGrunting, you decide it doesn’t really matter one way or the other. If you’re able to get off from a honey slowly fondling and licking the things, what do the hows and whys matter? Grinning now, you wonder if you’ll be able to get someone to give them a nice, long tongue-bath. You could sit there and look down a busily bobbing head as you’re brought to the peak, then watch your [pc.cum] rain down over her hair. As big as you are, you’ll probably paint her [pc.cumColor].\n\nThere’s no getting around it. <b>You have big, Treatment-bloated balls as big as any bull is likely to get without a crazy mutation occurring.</b>"), "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					}
					// Single
					else
					{
						AddLogEvent(ParseText("There’s no hiding the way your [pc.sack] sways about, certainly not now that the Treatment has blown up your nut like a balloon, only this one is filled with the weight of virile, cum-pumping flesh. It’s on the edge of four inches wide - as big as an apple - and sensitive to boot. It’s like the bigger it gets, the more sensitive it’s becoming, but that can’t be right. Can it?\n\nGrunting, you decide it doesn’t really matter one way or the other. If you’re able to get off from a honey slowly fondling and licking the thing, what do the hows and whys matter? Grinning now, you wonder if you’ll be able to get someone to give you a nice, long tongue-bath. You could sit there and look down a busily bobbing head as you’re brought to the peak, then watch your [pc.cum] rain down over her hair. As big as you are, you’ll probably paint her [pc.cumColor].\n\nThere’s no getting around it. <b>You have a big, Treatment-bloated ball as big as any bull is likely to get without a crazy mutation occurring.</b>"), "passive", treatmentHourPrint(ballSizeGains[firstBallSizeGain + i], startHours));
					}
					pc.ballSizeRaw = 12.5;
				}
			}
		}
		
		// Taller
		// If shorter than 8', grow 1-3" per day.
		if(pc.tallness < 96 && treatedHours >= 72 && startHours < 168)
		{
			numTallnessGains = 0;
			var firstTallnessGain:int = -1;
			var tallnessGainStarts:Array = [72, 96, 120, 144, 168];
			for (i = 0; i < tallnessGainStarts.length; i++)
			{
				if (startHours < tallnessGainStarts[i] && treatedHours >= tallnessGainStarts[i])
				{
					numTallnessGains++;
					if (firstTallnessGain == -1) firstTallnessGain = i;
				}
			}
		
			if (numTallnessGains > 0)
			{
				for (i = 0; i < numTallnessGains; i++)
				{
					pc.tallness += 1 + rand(3);
					// first time only
					if(!pc.hasStatusEffect("Treatment Height Boosted"))
					{
						pc.createStatusEffect("Treatment Height Boosted", 0, 0, 0, 0, true, "", "", false, 10080);
						AddLogEvent(ParseText("A kind of all-over ache has been bothering you off and on all day. It’s a deep pain, below the skin and muscles; you figure it’s your very bones. You were expecting to get taller. This must be what they mean by ‘growing pains’. A quick measurement confirms it. You’re [pc.height] tall now."), "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
					}
					// Less than 6’
					else if(pc.tallness < 72)
					{
						// Below 5'5"? Add +3"
						if(pc.tallness < 65) pc.tallness += 3;
						// 1
						if (rand(2) == 0)
						{
							AddLogEvent("The ground seems a little further away than before. At first, you think it’s your head playing tricks on you, but when you whack your head on something that you should have passed harmlessly underneath, you have to admit it. You’re getting taller. Pretty soon, nobody is going to call you short!", "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
						// 2
						else
						{
							AddLogEvent(ParseText("You stop to measure yourself with a cocky smile. There’s nothing like getting bigger and stronger to make you feel like a million creds. The Codex beeps, informing you that you’re [pc.height] tall. Now that’s more like it!"), "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
					}
					// Less than 7’
					else if(pc.tallness < 84)
					{
						// 1
						if (rand(3) == 0)
						{
							AddLogEvent(ParseText("Your back abruptly pops. It doesn’t hurt or anything, but you twist and stretch to limber up, feeling it pop a few more times in different places. The ever-present dull ache of growing bones underlies it all, promising that you’re still getting bigger and taller. Right now, you’re [pc.height] tall."), "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
						// 2
						else if (rand(2) == 0)
						{
							AddLogEvent("Things that used to pass right on by your head are getting closer and closer these days. Sometimes you even have to duck to avoid them. The ground seems farther away with every passing minute, a constant reminder of your Treatment-enhanced physique.", "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
						// 3
						else
						{
							AddLogEvent(ParseText("You snap out the Codex for a quick check on your amplified tallness. It beeps, displaying your new height on screen. You’re [pc.height] tall now. If this keeps up, you’re going to wind up taller than most normal terrans. And New Texans? Well... maybe you’ll catch up to the taller bulls."), "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
					}
					// Less than 7'6"
					else if(pc.tallness < 90)
					{
						// 1
						if(rand(3) == 0) 
						{
							AddLogEvent("You’re definitely still growing in spite of being well past the seven foot threshold. You could pass for average on New Texas right now, if you wanted to stick around there. Elsewhere, you must look awful tall.", "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
							if(CodexManager.entryUnlocked("Raskvel")) ExtendLogEvent(" Heck, the raskvel on Tarkus will probably think you a giant.");
						}
						// 2
						else if (rand(2) == 0)
						{
							AddLogEvent(ParseText("You stretch your arms out high over your head and arch your back, working your sore joints. It’s one thing to revel in your added stature. It’s quite another to suffer from the constant aches and pains that come with your expanding physique. You do a quick measurement. You’re [pc.height] tall now."), "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
						// 3
						else
						{
							AddLogEvent(ParseText("Your smile broadens while you look around. Your viewpoint is still rising, slowly but surely. Though it isn’t fast enough to be truly perceptible, you still find yourself taking note of your increasing height every few hours. Right now, you’re up to [pc.height] tall."), "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
					}
					// Less than 8"
					else
					{
						// 1
						if (rand(3) == 0)
						{
							AddLogEvent("There’s no hiding the way the Treatment is changing you. You’re definitely taller than you were yesterday - at least an inch, maybe more. With your augmented stature comes a boost to confidence; nobody is going to mess with a huge " + pc.mf("guy", "gal") + " like you.", "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
						// 2
						else if (rand(2) == 0)
						{
							AddLogEvent(ParseText("More and more, you have to duck to keep from whacking your head of objects of all shapes and sizes. It’s quite onerous to always have to duck and cower all the time, but at least everyone is always looking up to you. You’re [pc.height] tall now."), "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
						}
					}
					
					// It’s over - hit dat cap or day 6.5
					if(treatedHours >= 168 || pc.tallness >= 96)
					{
						AddLogEvent(ParseText("The familiar, dull ache to which you have grown accustomed diminishes moment by moment. You frown when it vanishes entirely; the Treatment won’t be making you any taller. You’ll have to settle for being [pc.height] tall."), "passive", treatmentHourPrint(tallnessGainStarts[firstTallnessGain + i], startHours));
					}
				}
			}
		}
		
		// Muscle Gain
		// +slowStatGain physique
		if(pc.tone < 100 && treatedHours >= 55 && startHours < 135)
		{
			var numSwoleGains:int = 0;
			var firstSwoleGain:int = -1;
			var swoleGainStarts:Array = [55, 74, 85, 93, 115, 135];
			for (i = 0; i < swoleGainStarts.length; i++)
			{
				if (startHours < swoleGainStarts[i] && treatedHours >= swoleGainStarts[i])
				{
					numSwoleGains++;
					if (firstSwoleGain == -1) firstSwoleGain = i;
				}
			}
			
			if (numSwoleGains > 0)
			{
				for (i = 0; i < numSwoleGains; i++)
				{
					pc.slowStatGain("physique",1);
					// 0 to 10 tone
					if(pc.tone < 10)
					{
						AddLogEvent("You flex one of your arms and smile when you see a little muscle there. It isn’t much, but it’s a start. In fact... you drop to the ground and do a few push-ups, just to get your blood flowing.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 10;
					}
					// 10 to 20
					else if(pc.tone < 20)
					{
						AddLogEvent("Your arms, chest... all of you, really.... You’re looking a little less squeezably soft. Of course, you’re still a long way from well-defined muscles, but you’re not quite the creampuff you used to be either.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 20;
					}
					// 20 - 30
					else if(pc.tone < 30)
					{
						AddLogEvent("You feel... solid. On a whim, you do a couple push-ups and crunches, just to see how many you can do. They almost get easier the more you do them, but that can’t be right... can it? Whatever. You’re finally starting to fill out and pack on some muscle.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 30;
					}
					// 30 - 40
					else if(pc.tone < 40)
					{
						AddLogEvent("You’re tightening up in some places and swelling up in others, even if your overall broadness remains unchanged. Still, you no longer look like a soft, easy target. You’re starting to show a little muscle in places without flexing, but not much yet. You comfort yourself with the knowledge that a few hours racking weights ought to finish the job.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 40;
					}
					// 40 - 50
					else if(pc.tone < 50)
					{
						AddLogEvent("You go ahead and flex one more time, just for fun. There’s something delightful about watching your form swell with latent power. You could probably do a few pull-ups without breaking a sweat if you had a bar around.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 50;
					}
					// 50 - 60
					else if(pc.tone < 60)
					{
						AddLogEvent("You admire yourself in your Codex’s screen. The body of the " + pc.mf("guy", "girl") + " in the screen is starting to look pretty good. Muscles are making themselves known all over. If you keep it up, you might even get a pretty nice looking six pack.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 60;
					}
					// 60 - 70
					else if(pc.tone < 70)
					{
						AddLogEvent("You pick up a rock and toss it around, anything to keep your hands busy and blow off some of this excess energy. No matter how active you are, you always seem to have more fuel in your tank, and despite the glistening sheen of sweat that you break out in, your expanding muscles don’t seem to mind in the slightest.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 70;
					}
					// 70 - 80
					else if(pc.tone < 80)
					{
						AddLogEvent("Everyday tasks that once seemed exhausting or tiring are getting easier by the hour. Long walks? Piece of cake. Hefting some cargo? Not something a little elbow grease can’t take care of. You’re breaking out in muscle all over, and it feels good.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 80;
					}
					// 80 - 90
					else if(pc.tone < 90)
					{
						AddLogEvent(ParseText("You do a few one-handed pushups, watching your muscles ripple under your [pc.skinFurScales] with a smile on your face. The physical exertion is calming. It helps you think and plan. When you stop, you’re covered in a light sheen of sweat that only makes your muscles stand out that much more clearly."), "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 90;
					}
					// 90-100
					else
					{
						AddLogEvent("You look at yourself in your Codex’s screen and marvel at the chiseled adonis looking back at you. There isn’t a single part of your body that doesn’t display the unbridled physical power you have lurking just under the surface. You can’t imagine getting any more muscular than you already are, but that’s fine. Chicks dig it.", "passive", treatmentHourPrint(swoleGainStarts[firstSwoleGain + i], startHours));
						pc.tone = 100;
					}
				}
			}
		}
		
		// Normal dick growth and animal cock chances.
		if(pc.hasCock()) standardTreatmentDickStuff(treatedHours, startHours);
		
		// Cum Volume & Minimum CumQ
		if(startHours < 63 && treatedHours >= 63 && pc.hasCock() && pc.maxCum() < 1000)
		{
			// Try and hit at least 1L if PC is below dat.
			// Balls
			if(pc.balls > 0)
			{
				AddLogEvent(ParseText(" You feel the inside of your [pc.sack] clench and release. The feeling repeats two or three times in quick succession, each time leaving you feeling a little heavier... a little denser, like your ") + pc.ballsDescript() + " ", "passive", treatmentHourPrint(63, startHours));
				if(pc.balls > 1) ExtendLogEvent("are");
				else ExtendLogEvent("is");
				ExtendLogEvent(" somehow becoming even more capable. You’ll probably have bigger, messier orgasms with ");
				if(pc.balls == 1) ExtendLogEvent("a nut like this");
				else ExtendLogEvent("nuts like these");
				ExtendLogEvent(".");
			}
			// No Balls
			else
			{
				AddLogEvent(ParseText("You feel a twinge deep inside you. It happens two or three more times in quick succession. Then, just as you’re trying to figure out what’s happening, a few drops of [pc.cum] drool out the end of ") + pc.oneCock() + ". Is your body somehow retooling itself to produce more ejaculate? You can only imagine what’s going on with your prostate and seminal vesicles right now.", "passive", treatmentHourPrint(63, startHours));
			}
			pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
		}
		
		// Refractory Megaboost & Cum Quality
		if(pc.hasCock() && pc.refractoryRate < 30 && treatedHours >= 69 && startHours < 159)
		{
			var numRefGains:int = 0;
			var refGainStarts:Array = [69, 77, 157];
			var firstRefGain:int = -1;
			
			for (i = 0; i < refGainStarts.length; i++)
			{
				if (startHours < refGainStarts[i] && treatedHours >= refGainStarts[i])
				{
					numRefGains++;
					if (firstRefGain == -1) firstRefGain = i;
				}
			}
		
			if (numRefGains > 0)
			{
				for (i = 0; i < numRefGains; i++)
				{
					// RefractoryRate to 10
					if(pc.refractoryRate < 10)
					{
						AddLogEvent("One thing that you’re increasingly aware of is just how fast your " + pc.ballsDescript() + " feel", "passive", treatmentHourPrint(refGainStarts[firstRefGain + i], startHours));
						if(pc.balls <= 1) ExtendLogEvent("s like it’s");
						else ExtendLogEvent(" like they’re");
						ExtendLogEvent(" filling up with new seed. You don’t really spend any time trying to measure your new production, but you’re definitely filling up way faster than before. You smile, doubting you’ll ever leave a hole unfilled again.");
						pc.refractoryRate = 10;
					}
					// RefractoryRate to 25
					else if(pc.refractoryRate < 20)
					{
						AddLogEvent("Wincing, you realize that you feel... fuller than you should. Like your body has gone into overtime, producing sperm in record quantities. This could come in handy....", "passive", treatmentHourPrint(refGainStarts[firstRefGain + i], startHours));
						pc.refractoryRate = 20;
					}
					// RefractoryRate to 50! & minimum cumQ of 15
					else if(pc.refractoryRate < 30)
					{
						AddLogEvent("There’s no doubt about it. Your " + pc.ballsDescript() + " ", "passive", treatmentHourPrint(refGainStarts[firstRefGain + i], startHours));
						if(pc.balls <= 1) ExtendLogEvent("is");
						else ExtendLogEvent("are");
						ExtendLogEvent(" filling up far faster than before, flooding with more and more unspent virility by the second. You could probably fuck a line of fifty girls and still not go dry by the last orgasm, not that you mind. At least the ubiquitous milking stalls and offers of blowjobs on New Texas make sense now. It could get quite uncomfortable without a regular release.");
						pc.refractoryRate = 30;
					}
				}
			}
		}
		
		// Cum Quality to 2.
		if(startHours < 133 && treatedHours >= 133 && pc.hasCock() && pc.cumQualityRaw < 2)
		{
			AddLogEvent("The Codex chirps, startling you. <i>“Alert: user virility levels have exceeded human norms. Sensors estimate a sperm density of over double terran standard. Use of contraceptives is recommended.”</i> What the.... Is this thing set up to monitor you that closely? Why the hell would it have an alert for that but not for you having emissions that could rival a horse? You sigh, resigned to the fact that you’re going to have pregnant partners if you want to have any real fun.", "passive", treatmentHourPrint(133, startHours));
			pc.cumQualityRaw = 2;
		}
		
		// PHEROMONES! Tease bonus!
		if(!pc.hasPerk("Pheromone Cloud") && pc.hasCock() && startHours < 138 && treatedHours >= 138)
		{
			AddLogEvent("Out of the blue, you catch a whiff of yourself, and... you smell pretty good, actually. You’d put your aroma somewhere between a woodsmoke, sweat, and a clean, almost nutty fragrance. Your body odor is undoubtedly getting thick with pheromones to better signal your intentions and desires. Luckily, they don’t seem to turn you on like they’re supposed to do others. Maybe you’re immune to your own. Then again, your nose seems a lot more sensitive. You could probably pick out individuals by their smell alone. Heck, you can identify your own penis", "passive", treatmentHourPrint(138, startHours));
			if(pc.cockTotal() > 1) ExtendLogEvent("es");
			ExtendLogEvent(" by the unique musk that underlays your own odor.");
			// Perk Unlocked: Pheromone Cloud - You are surrounded by a cloud of pleasant-smelling pheromones that increase the success rate and arousing potential of your tease attacks.
			ExtendLogEvent("\n\n(<b>Perk Gained: Pheromone Cloud</b> - Pheromones boost tease attack and arousal.)");
			pc.createPerk("Pheromone Cloud",0,0,0,0,"Boosts tease attack and arousal.");
		}
		
		// Horns
		// 5 to 8"
		// Horn Grow 2 Nubs
		if((pc.horns == 0 || (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT) || pc.hornLength < pc.statusEffectv2("Treated")) && treatedHours >= 82)
		{
			numHornAttempts = treatedHours - Math.max(startHours, 81);
			numHornGains = 0;
			hornTimestampStride = 0;
			
			for (i = 0; i < numHornAttempts; i++)
			{
				if (treatedHours % 2 == 1)
				{
					i++;
					continue;
				}
				
				if (rand(8) == 0)
				{
					numHornGains++;
				}
			}
			
			if (numHornGains > 0)
			{
				hornTimestampStride = Math.floor((treatedHours - Math.max(startHours, 81)) / numHornGains);
				
				for (i = 0; i < numHornGains; i++)
				{
					// Existing horns transform into lil bull nubs.
					if(pc.horns > 0 && pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT)
					{
						AddLogEvent("There is a crackling, rustling sound coming from above you. You look up, but nothing is there. Instead, you hear the same sound from behind you. This time, you twist around to try and identify the source, but to no avail. A minute later a piece of horn bounces off your nose on the way to the ground.\n\n<b>Your horns are breaking apart!</b> Dazedly, you feel at the crumbling totems, feeling them come apart in your fingers. Chalky dust clings to your hand, but more importantly, two little nubs remain on your head. They’re small and pointed, like little cow horns.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.horns = 2;
						pc.hornLength = .5;
						pc.hornType = GLOBAL.TYPE_BOVINE;
					}
					// Starting
					else if(pc.horns == 0 && !pc.hasStatusEffect("Horn Bumps"))
					{
						AddLogEvent("Ugh. Your head itches! Reaching up to take a scratch, you wince when you come across a painful bump on your forehead. A quick check with the Codex confirms that it’s red and irritated, though you haven’t seen a head form on the zit yet. You’ve never had such prominent acne before, and there’s a matching lump on the either side. Maybe something stung you? It could always be a pair of bug bites. Gross.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.createStatusEffect("Horn Bumps");
					}
					// Breaking Skin
					else if(pc.horns == 0)
					{
						AddLogEvent("The pain from those irritating red bumps on your forehead is getting worse and worse with each passing moment, matched by a sudden desire to scratch madly at them until you flay the skin away. You resist as long as you can, but the need to tend to the maddening itch overwhelms your subpar self-control. Besides, if something itches, why not scratch it?", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent("\n\nTo your horror, your first scratch peels away a patch of offending skin, but with it comes a sense of relief. Helpless to stop yourself, you scratch and scratch until the desire is completely gone - and a pile of discarded skin has built up before your " + pc.feet() + ".");
						ExtendLogEvent("\n\nWhat have you done to yourself!? Pulling out your Codex, you use the camera to check.");
						ExtendLogEvent("\n\nYou cup your chin and smile, regarding what you see with delight. <b>Your horns are coming in!</b> They’re only little nubs at the moment, but there’s no way they’re done growing. You’ll probably have an impressive rack when all is said and done, all the better to attract girls with nice squishy racks of their own.");
						pc.hornType = GLOBAL.TYPE_BOVINE;
						pc.removeStatusEffect("Horn Bumps", true);
						pc.horns = 2;
						pc.hornLength = .5;
					}
					// nubs -> 1" horns
					else if(pc.hornLength < 1)
					{
						AddLogEvent("For the past few minutes, a nasty little headache has been brewing. You squeeze your eyes closed, flexing your jaw in an effort to deal with it, when it abruptly fades, vanishing in the span of a second.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent(ParseText("\n\nYou aggressively prod yourself, trying to find the source of the fleeting pain; just what kind of headache was that? You get your answer when your fingers find what your nubs have become: full blown horns. They stick at least a full inch out from your [pc.skinFurScales], coming to two proud points, though their tips are rounded enough that you doubt you could do any real injury with them just yet. You’ll have to sharpen them up a little once they finish coming in, maybe even get them capped with ornamental steel."));
						pc.hornLength = 1;
					}
					// 1" horns to 2" horns
					else if(pc.hornLength < 2)
					{
						AddLogEvent("A wave of discomfort strikes just behind your forehead, growing worse by the second. There’s really only one thing it can be - your horns are getting bigger! You whip out your Codex, wincing from the sudden motion, and flick it on, getting yourself a ticket to watch your own burgeoning masculinity.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent("\n\nYour formerly one-inch horns have already pushed a little further out, perhaps a quarter inch. The longer they get, the wider their bases are becoming, and they’re growing fast enough now that you can actually see them slowly sliding out, revealing bit after bit of gleaming white ivory. The process is fascinating enough for you to forget your earlier discomfort. You watch, spellbound, as your horns continue to expand, growing ever more prominent on your face until they stop at around two inches long.");
						ExtendLogEvent("\n\nNow this is more like it. A little bigger, and you’ll almost look like a respectable " + pc.mf("bull","breeder") + ".");
						pc.hornLength = 2;
					}
					// 2" horns to 3" horns
					else if(pc.hornLength < 3)
					{
						AddLogEvent("Your jaw clenches, a low growl escaping your throat entirely uncontrollably. There’s a powerful shifting and sliding going on in your skull. It leaves you seeing stars with your eyes half-crossed. There’s blessedly little pain, but when it passes, you’re very aware of additional weight tugging on your head. Your horns have grown: they’re now three inches of gleaming white, bovine awesomeness. You resolve to polish them at the first opportunity, maybe even get some ornamental studs for them.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 3;
					}
					// 3" horns to 4" horns - prolly gonna reuse some of this for guys.
					else if(pc.hornLength < 4)
					{
						AddLogEvent("Your eyes suddenly cross, and you drop yourself to the ground, lest you run into something or worse. The rumbling sense of movement is working on your skull once more, like giant boulders rolling around the inside of your head. It doesn’t hurt, but it is very disconcerting, making it next to impossible to think.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent("\n\nYou grunt and groan, feeling the sensation slide <i>outside</i> of your head as your horns expand, growing thicker and heavier. You sigh in satisfaction once they stop growing. Now these are respectable horns! If they stop here, you won’t mind too badly.");
						pc.hornLength = 4;
					}
					// 4" horsn to 5" horns - MAX LADIES CAN GET.
					else if(pc.hornLength < 5)
					{
						AddLogEvent("You feel a sense of... potential building within your head, expanding until it changes from a kind of nebulous energy into an unstoppable pressure. You feel your horns giving under the weight of it all, slowly sliding forward, expanding outward, growing heavier by the moment. You wrap your hands around them, feeling the change against your palms. When it’s all over, you’re left holding two big, strong five-inch horns. Nice.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 5;
					}
					// 5" to six" horns
					else if(pc.hornLength < 6)
					{
						AddLogEvent("Here it comes! You wince at the onset of tightness in your forehead, increasingly familiar as your horns continue their trek toward their full size. It doesn’t even hurt that bad this time; it just feels like a strange, tight tingling as your horns add another inch to their already impressive length. When the sensation fades, <b>you admire your six-inch long horns.</b> Not too shabby. Any longer and you’ll have to be careful with them when going through doorways.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 6;
					}
					// 6" -> 7"
					else if(pc.hornLength < 7)
					{
						AddLogEvent("You grunt as the familiar feeling of horn growth sets in. Grabbing hold of the curved, steer-like protrusions, you give them a tug, easing more gleaming ivory into the air. The more horn you grow, the wider their stance and the more threatening you become. You could probably just tip your head an inch forward, snort, and send half the galaxy running. The thought makes you smile almost as much as the idea of a cow-girl squeezing them like handlebars while you give her a few good licks.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 7;
					}
					// 7" -> 8"
					else if(pc.hornLength < 8)
					{
						AddLogEvent("You wince at the headache as it returns. The familiar ache that’s right behind your forehead can only mean one thing: your horns are about to grow again. But they’re already so big! You watch in disbelief as an extra inch", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						if(rand(3) == 0) 
						{
							ExtendLogEvent("... no two extra inches pour");
							pc.hornLength++;
						}
						else ExtendLogEvent(" pours");
						ExtendLogEvent(" into your view. You must look so imposing. These are bigger than just about any bull’s on New Texas. <b>You have big, ");
						if(pc.hornLength >= 8) ExtendLogEvent("nine");
						else ExtendLogEvent("eight");
						ExtendLogEvent("-inch long horns.</b> Nobody will want to mess with you now.");
						pc.hornLength++;
					}
					
					// End gains once we reach max rng'd length
					if (pc.hornLength >= pc.statusEffectv2("Treated"))
					{
						break;
					}
				}
			}
		}
		
		// Quad Balls (Uncommon)
		if(startHours < 155 && treatedHours >= 155 && pc.balls > 0 && pc.balls < 4 && rand(10) == 0)
		{
			AddLogEvent(ParseText("Your [pc.sack] sways heavily, more than ever before, the skin stretched taut. It gets your attention without even trying, really."), "passive", treatmentHourPrint(155, startHours));
			// One nut no new PG
			if(pc.balls == 1) ExtendLogEvent(" Your " + pc.ballsDescript() + ParseText(" is huge, easily four times its old size and probably still growing. You heft it, curiously, feeling around its bulk to try and identify just what’s going on. There are seams in its surface in a number of places, splitting it into four quadrants, and the longer you poke and prod at them, the more obvious they become. You let go in shock, afraid you’ve somehow damaged your one super-nut, but it doesn’t stop the seams from growing deeper, their edges more rounded.\n\nIndeed, your ball is slowly dividing now. There’s no hiding it. That one big sphere is splitting into four smaller ones, each about the same size as your original testicle. One breaks away first, and the others follow, splitting into unique testes. All four settle at the bottom of your [pc.sack] after a moment. <b>You’ll just have to get used to having four nuts</b> and be careful not to sit on them."));
			// Two nuts no new PG
			else if(pc.balls == 2) ExtendLogEvent(" Your " + pc.ballsDescript() + " are huge, easily double their old size and probably still growing. You heft them curiously, feeling around their bulk to try and understand just what’s going on with your genitals. There are seams in their surfaces, dividing them in half. How... why do your nuts have <i>seams</i>? Letting go in shock, afraid you’ve somehow damaged your swelling nuts, you watch with a mounting sense of trepidation.\n\nThey’re definitely dividing, you realize. Those two seams are getting deeper and deeper, the edges more rounded by the second, curving until it looks less like a pair of meganuts and more like two pairs of conjoined testes. Even then, they look like they could come apart at any second, and they do, just a moment later. You wince, expecting pain, but it doesn’t hurt at all. You simply gain an awareness of having four balls, each as big as your original two were. <b>You’ll just have to get used to having four nuts crammed into your sack.</b>");
			// Triballs
			else if(pc.balls == 3)
			{
				ExtendLogEvent(" One of your " + pc.ballsDescript() + ParseText(" is huge, easily double its old size and probably still growing. You heft it, curiously, feeling around its bulk to try and identify just what’s going on without bothering the other two. There’s a seam in its surface across the middle, dividing it in half, and the longer you poke and prod at it, the more obvious it becomes. You let go in shock, afraid you’ve somehow damaged your growing super-nut, but it doesn’t stop the seam from growing deeper, the edges more rounded.\n\nIndeed, your ball is slowly dividing now. There’s no hiding it. That one big sphere is splitting into two smaller ones, each about the same size as your unmodified testicles. They round further and then divide, splitting into unique testes. The new twins settle in at the bottom of your [pc.sack] alongside their brothers a moment later. <b>You’ll just have to get used to having four nuts</b> and be careful not to sit on them."));
			}
			pc.balls = 4;
		}
		
		// (Ram Horns!)
		if(pc.horns == 2 && pc.hornType == GLOBAL.TYPE_BOVINE && pc.hornLength < 10 && startHours < 127 && treatedHours >= 127 && rand(6) == 0)
		{
			AddLogEvent("You feel the familiar tightness of your horns growing once more, but this time it doesn’t stop at simple pain. It intensifies into a flaring, twisting agony, like two screws boring into your skull. You double over, grabbing at the bony protrusions in horror in time to feel them twisting through your hands, angling your bovine horns back toward your own ears as inch after inch of fresh growth pushes through your fingers, slick with some kind of fluid as if fresh-birthed.\n\nThis goes on for minutes, but to you, it feels like hours of torture. No amount of willpower or machismo helps you deal with it. All you can do is curl into a ball and feel your horns twisting and changing, losing their bovine nature as they become something... else.\n\nThe pain fades without warning, and the growth goes with it just as suddenly. Shocked, you rise up, unaware of just when you fell to the ground, awed by the magnitude of just what happened. You pull out your Codex with a shaking hand and flick it on, more anxious to see the result of your transformation than you care to admit.\n\n<b>Two curled goat horns twist back over your ears</b>, giving you an appearance that seems both regal and playful, like the satyrs of old terran myths. You smile as you take it all in. It was almost worth the pain to get a pair like this.", "passive", treatmentHourPrint(127, startHours));
			pc.hornType = GLOBAL.TYPE_GOAT;
			pc.hornLength = 11;
			pc.horns = 2;
		}
		
		// Tail
		// Just tweak femtail stuff
		// cunt/cocktails prevent this!
		if(!pc.hasCuntTail() && !pc.hasCockTail() && pc.tailType != GLOBAL.TYPE_BOVINE && startHours < 98 && treatedHours >= 98 && rand(10) != 0)
		{
			// No tail
			if(pc.tailCount <= 0)
			{
				AddLogEvent(ParseText("You go to scratch at a spot above your [pc.butt] that’s been bothering you for a few hours, and jerk when you hit something that wasn’t there before - something rounded and fluffy. Pressing back carefully, you ease your fingers around the growth, discovering its furred texture and cords of muscle. The oddest part is feeling the fingers pressing on you through the fur. There’s no doubt about it - <b>you have a tail.</b>\n\nIt’s a fairly long tail with a gnarly little poof on the end, just like a cow’s."), "passive", treatmentHourPrint(98, startHours));
				pc.tailCount = 1;
			}
			// Multitail
			else if(pc.tailCount > 1)
			{
				// Multi - short
				if(!pc.hasTailFlag(GLOBAL.FLAG_LONG))
				{
					AddLogEvent(ParseText("Your [pc.tails] brush against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had [pc.tails], now you’ve got gently-swaying, bovine tails, complete with fuzzy puffs at the tips."), "passive", treatmentHourPrint(98, startHours));
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(ParseText(" A fine layer of [pc.furColor] fur covers each one."));
					ExtendLogEvent(" You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.");
				}
				// Multi - long
				else
				{
					AddLogEvent(ParseText("Your [pc.tails] feel increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremities alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find."), "passive", treatmentHourPrint(98, startHours));
					ExtendLogEvent("\n\n" + StringUtil.upperCase(num2Text(pc.tailCount)) + " gently swinging, bovine tails hang behind you. The tips are poofing up, just as you’d expect");
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(", and a coat of fine fur is growing out over their lengths");
					ExtendLogEvent(". In seconds, the warmth fades, leaving you with new, bovine butt ornaments. You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.");
				}
			}
			// Single - short
			else if(!pc.hasTailFlag(GLOBAL.FLAG_LONG))
			{
				AddLogEvent(ParseText("Your tail brushes against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had a [pc.tail], now you’ve got a gently-swaying, bovine tail, complete with a fuzzy puff at the tip."), "passive", treatmentHourPrint(98, startHours));
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(ParseText(" A fine layer of [pc.furColor] fur covers the whole thing."));
				ExtendLogEvent(" You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.");
			}
			// Single - long
			else
			{
				AddLogEvent(ParseText("Your [pc.tail] feels increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremity alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find."), "passive", treatmentHourPrint(98, startHours));
				ExtendLogEvent("\n\nA gently swinging, bovine tail hangs behind you. The tip is poofing up, just as you’d expect");
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(", and a coat of fine fur is growing out over its length");
				ExtendLogEvent(". In seconds, the warmth fades, leaving you with a new, bovine butt appendage. You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.");
			}
			pc.clearTailFlags();
			pc.tailType = GLOBAL.TYPE_BOVINE;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		}
		
		// Cow ears (maybe)
		if(pc.earType != GLOBAL.TYPE_BOVINE && startHours < 141 && treatedHours >= 141 && rand(10) == 0)
		{
			AddLogEvent("You go to scratch at one of your " + pc.earsDescript() + ParseText(", only to find it differently shaped - and in a new location - than before. Gingerly feeling it, you discover that your aural organs are soft and leathery, with a fine coat of [pc.furColor] across their outer edges. You can still hear just fine; you’re just listening through a pair of floppy cow-ears now. Briefly, you consider how good it would feel to have someone scratch them."), "passive", treatmentHourPrint(141, startHours));
			pc.earType = GLOBAL.TYPE_BOVINE;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_FURRED);
			pc.addEarFlag(GLOBAL.FLAG_FLOPPY);
		}
		
		// Hooves (Rarish) - requires biped minimum. No change for goo/nagaPCs
		if(pc.legCount >= 2 && pc.legType != GLOBAL.TYPE_BOVINE && startHours < 165 && treatedHours >= 165 && rand(10) <= 1)
		{
			if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES))
			{
				AddLogEvent("You stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. It’s then that you spot way your " + pc.feet() + " are shifting and changing. They look like they’re staying as hooves, but they’re a little more of a brown-black color, with a split down the middle. They look like the kind of hooves a bull would have. Well, there are worse things than having a matched set of transformations. <b>You resolve to enjoy your new bull hooves.</b>", "passive", treatmentHourPrint(165, startHours));
			}
			else
			{
				AddLogEvent("You stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. You see why when you glance to your " + pc.feet() + ". They’re malformed, twisting and narrowing before your eyes. They’re pulling their disparate parts together into one unified mass, almost cylindrical in shape", "passive", treatmentHourPrint(165, startHours));
				if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))
				{
					ExtendLogEvent(", and the change isn’t limited to below the ankle either. Your calves are reshaping, placing what used to be your ankle far above your blackening feet");
				}
				else ExtendLogEvent(", and they begin to blacken, moment by moment");
				ExtendLogEvent(".\n\nThey split in half, right down the middle, growing harder by the moment, dulling your sense of touch. You dully rub them, confused at first. Realization hits you like a ton of bricks - you have hooves! Just like a bull, you’ve got hooves to clop around on while you walk. Most people don’t get hooves from the Treatment. It looks like you were one of the lucky ones. " + pc.mf("The cow-girls are gonna be all over you!","The bull-boys are going to love the look!"));
			}
			pc.clearLegFlags();
			pc.legType = GLOBAL.TYPE_BOVINE;
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
		}
	}
	// FAUX COW MODE *FC
	// 4. Faux Cow Treatment Section
	// * Full documentation: https://docs.google.com/document/d/1cgDCTnJeAKri99u-KibLhuDlSKXJuUjnW8jejQt28YI/edit?usp=sharing
	else if(effect.value1 == 7)
	{
		var fauxIdx:int = -1;
		
		// If dick is ever lost, regrow dick!
		if(!pc.hasCock() && treatedHours >= 3)
		{
			AddLogEvent("A new penis springs out of your crotch new and fully formed. The Treatment seems determined to give you a dick. At least this one is pretty cute.", "passive", treatmentHourPrint(treatedHours, startHours));
			pc.createCock();
			pc.setNewCockValues(0);
		}
		
		// Gain 1 libido every hour
		pc.slowStatGain("libido", (treatedHours - startHours) * 2);
		
		// 1
		if(startHours < 2 && treatedHours >= 2)
		{
			AddLogEvent("It’s been a couple of hours since you’ve taken the Treatment, and suddenly you’re hit by a wave of uncertainty. Was it really a good idea to do it? Considering how unpredictable this thing is, there’s no telling exactly what you might end up with. At any rate, there’s nothing you can do about it now. Whatever will be... will be. But at least one thing is certain: the sex will become even more amazing after the Treatment.", "passive", treatmentHourPrint(2, startHours));
		}
		
		// 2
		if(startHours < 4 && treatedHours >= 4)
		{
			AddLogEvent(ParseText("You’ve been getting hungry an awful lot. No matter what you eat, it doesn’t seem to keep you sated for long, unless it’s got some protein. Maybe the Treatment is prompting your body to stock up energy to make some physical changes? Smiling, you start to fondle your [pc.cocks]. Yeah, that would be nice."), "passive", treatmentHourPrint(4, startHours));
		}
		
		// 3
		if(startHours < 6 && treatedHours >= 6)
		{
			AddLogEvent("Your right hand reaches into your pocket for another ration bar, but you stop it with a swat from the left. You can’t possibly be hungry with how much you’ve been eating! Now, how about a jog to burn those calories? Maybe the breeze will help to alleviate the weird hotness you’ve been feeling.", "passive", treatmentHourPrint(6, startHours));
		}
		
		// 4
		if(startHours < 8 && treatedHours >= 8)
		{
			AddLogEvent("You’re practically melting!", "passive", treatmentHourPrint(8, startHours));
			if(!pc.isChestExposed()) ExtendLogEvent(ParseText(" In fact, it’s so hot that you decide to take off your [pc.upperGarments] for a moment"));
			else ExtendLogEvent(" You decide to fan yourself for a moment");
			ExtendLogEvent(ParseText(", and you’re glad you did, because the air on your [pc.skinFurScales] feels really, <i>really</i> good! Maybe a bit too good, if the reaction from your [pc.cocks] is any indication. While you’re contemplating, a gust of wind rubs your [pc.nipplesNoun] almost like a sensual caress, and a strong tingling of pleasure spreads across your [pc.chest], causing you to shiver. Strange. Do all bulls have such sensitive skin?! Maybe you just got lucky..."));
			if(pc.exhibitionismRaw < 100) pc.exhibitionismRaw += 1;
			pc.lust(5);
		}
		
		// 5
		if(startHours < 10 && treatedHours >= 10)
		{
			AddLogEvent(ParseText("You run your hands across your [pc.chest] and [pc.belly], wondering just how perfect you will become. Will the Treatment give you strong, manly pecs and beefy abs, or will it give you more of a lean, athletic look? You daydream about the possibilities for a minute before continuing your quest."), "passive", treatmentHourPrint(10, startHours));
			pc.lust(5);
		}
		
		// 6
		if(startHours < 12 && treatedHours >= 12)
		{
			AddLogEvent("Anxious to see how the Treatment is going, you", "passive", treatmentHourPrint(12, startHours)); 
			if( !pc.isCrotchExposed() ) ExtendLogEvent(ParseText(" pull open your [pc.crotchCovers] and"));
			ExtendLogEvent(ParseText(" check your [pc.groin]. No real changes, but then again, perhaps it’s too soon for that. Still, [pc.eachCock] has been semi-erect for at least two hours now, with no signs of calming down any time soon. The extra volume in your pants does give you a very nice look though, so you adjust your [pc.cocks] just right to take full advantage of your boosted sex appeal."));
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 10;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
			pc.lust(10);
		}
		
		// 7
		if(startHours < 14 && treatedHours >= 14)
		{
			AddLogEvent(ParseText("You sigh in frustration. Ever since you used that medipen, you’ve been so damn horny all the time, even your [pc.nipplesNoun] are sensitive! A sensual thought or slight accidental rub is all it takes for your [pc.cocks] to start getting all randy, like an adolescent on a hot date."), "passive", treatmentHourPrint(14, startHours));
			pc.lust(10);
		}
		
		// 8
		if(startHours < 16 && treatedHours >= 16)
		{
			AddLogEvent(ParseText("You’ve been eating so much, and you’ve got so much energy that it’s making you crazy! You just have to burn calories somehow. The idea of swimming a few laps sounds extremely attractive, but you need to move <i>now</i>, so you settle for a run. Time flies by, until you realize you’ve been running at a brisk pace for nearly an hour, and what’s best: you’re not even that tired! If anything, you feel refreshed, the muscles on your [pc.legOrLegs] thankful for the workout. Maybe you should do some squats next. You can barely wait for the full effect the Treatment will have on your physique!"), "passive", treatmentHourPrint(16, startHours));
			pc.slowStatGain("reflexes",1);
			if(pc.thickness >= 5) pc.thickness -= 5;
		}
		
		// 9
		if(startHours < 18 && treatedHours >= 18)
		{
			AddLogEvent("Weird, you’re not feeling any more confident. Aren’t bulls supposed to be naturally confident? But you’re not feeling like an airheaded cow either, nor a domineering amazon. You’re actually feeling... calm, peaceful. If you walked into a bar right now and someone looked cross at you, you’d probably just shrug and smile bashfully. No need to get all defensive and confrontational when you can disarm them with some boyish charm, right?", "passive", treatmentHourPrint(18, startHours));
		}
		
		// 10
		if(startHours < 20 && treatedHours >= 20)
		{
			AddLogEvent("You’ve been catching yourself gazing a little longer than you normally would at most guys (and some girls) you pass by, and when you do, your eyes can’t help taking note of their more attractive features, especially if they’re packing a nice-looking bulge between their legs. And somehow, this doesn’t disconcert you at all. You’re only checking them out for reference. Yep, that’s gotta be it. Definitely.", "passive", treatmentHourPrint(20, startHours));
		}
		
		// 11
		if(startHours < 22 && treatedHours >= 22)
		{
			AddLogEvent("The last few minutes have been spent looking at yourself on the screen of your Codex, setting your hair just right. You’ve been conscious of your looks in a way you weren’t before, but that’s not necessarily a bad thing.", "passive", treatmentHourPrint(22, startHours));
			ExtendLogEvent("\n\nYou picture yourself casually strolling in a shopping center and attracting hungry looks from the people you pass by, getting them all hot and bothered: the girls with stiff nipples poking from their racks; the guys with a noticeable growth in their pants; the herms with both! You smile smugly. Whatever the Treatment is doing to your head, you’re pretty sure you don’t mind too much, at this point.");
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 10;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
		}
		
		// 12
		if(startHours < 24 && treatedHours >= 24)
		{
			AddLogEvent(ParseText("In a slow moment, you let yourself daydream, and sexual fantasies come to your mind unbidden."), "passive", treatmentHourPrint(24, startHours));
			ExtendLogEvent(ParseText("\n\nIn one of them, your hands and feet are tied to the bedpost while an amazon goddess makes you thoroughly worship her pussy before finally rewarding your [pc.cocks] with her delicious silky warmth, graciously allowing your [pc.cumNoun] to spill into her depths even as her own cock squirts all over your [pc.face] and [pc.chest], to mark you as the slut you are."));
			ExtendLogEvent(ParseText("\n\nIn another fantasy, you’re face-down, your [pc.butt] being plowed by a strong, hung bull with firm, slick thrusts, until he decides to pin you down with the sheer weight of his massive body and unload inside your ass unapologetically. The pressure of his spasming cock on your prostate brings you over the edge, and all you can do is moan loudly as [pc.eachCock] cums as well."));
			ExtendLogEvent(ParseText("\n\nIn yet another fantasy, a bubbly cow with a teasing smile is straddling your [pc.cocks] while force-feeding you milk from her improbably huge breasts and meaty nipples. With a long moo of pleasure, she squirts girlcum all over your crotch, and her pussy clamps down hard on your [pc.cockBiggest], bringing you to climax inside her fertile cunt."));
			ExtendLogEvent("\n\nIn all of these fantasies, you’re on the bottom, but that only makes it even hotter.");
			pc.maxOutLust();
		}
		
		// 13
		if(startHours < 26 && treatedHours >= 26)
		{
			AddLogEvent("Your nostrils flare, delivering a symphony of scents to your mind. You can pick out your own natural odor with ease, and not in an unpleasant way. It’s like breathing in an aromatic version of your name. You’re fairly certain that you could identify flowers with a simple whiff and other people with only slightly more effort. Are the Treated cows and bulls of New Texas all like this? No wonder they can say so much with so little. They’re communicating on a whole other level!", "passive", treatmentHourPrint(26, startHours));
		}
		
		// 14
		if(startHours < 28 && treatedHours >= 28)
		{
			AddLogEvent(ParseText("Okay, taking note of the changes so far. First, you are kind of randy most of the time, but that’s the point of the Treatment anyway, so you file it down as a good thing. Second, you’re feeling far more athletic, which is definitely a good thing. Third, your skin is getting more and more sensitive, especially your [pc.groin] and [pc.nipplesNoun]. This was unexpected, but with how good it feels, you’re not about to start complaining. Fourth, you’re not feeling as confident or brazen as you thought you would, instead you feel... peaceful, accepting."), "passive", treatmentHourPrint(28, startHours));
			ExtendLogEvent("\n\nSpeaking of which, you’ve been having submissive fantasies far more often than before. Wait. The realization finally dawns on you: could it be the Treatment has given you the rumored Faux Cow variant?");
		}
		
		// 15
		if(startHours < 30 && treatedHours >= 30)
		{
			AddLogEvent(ParseText("You’re still not entirely sure if you’ve got the Faux Cow variant, or how you should feel about it. For science, you bring a hand to your [pc.butt] and start playing with it – just a gentle caress at first, which soon turns into fondling and even a few slaps. Damn, did your butt always feel this good?! Getting bolder, you bring a finger to the rim of your back hole, and your body jolts out of sheer unexpected pleasure."), "passive", treatmentHourPrint(30, startHours));
			ExtendLogEvent(ParseText("\n\nEven as the sensation subsides, you can still feel your hole expanding and contracting of its own accord, as if enticing a big, juicy cock to fill it up. There’s no doubting it now: the Treatment is turning you into a Faux Cow. But if what just happened is any indication, you’re pretty sure it will make you feel more than great. Idly, you wonder how your prostate would feel being massaged by a bull or amazon from behind, while a busty cow takes control of your [pc.cocks] with her mouth..."));
			pc.lust(30);
		}
		
		// 16
		if(startHours < 32 && treatedHours >= 32)
		{
			AddLogEvent(ParseText("Running a hand over your [pc.hips] and [pc.butt], you wonder how the treatment is going to shape them. A quick search on your codex brings up the pictures of a number of Faux Cows, most of whom look like twinks you might see on porn movies: boyishly attractive, athletic and slim, not the ultra-muscular physique you normally see on bulls. They all have slim or shapely hips and sizable buns, nothing seems oversized, though you notice some of them have bull-sized junks – which manage to look even bigger on those twinks, since they’re much shorter than your average bull."), "passive", treatmentHourPrint(32, startHours));
			ExtendLogEvent("\n\nWell, you’re pretty sure you’re already hotter than any of those twinks anyway, so the Treatment can only make you even hotter.");
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 5;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
		}
		
		// 17
		if(startHours < 34 && treatedHours >= 34)
		{
			AddLogEvent(ParseText("It’s been less than two days since you took the Treatment, but the psychological changes are already noticeable. Every time you meet someone suitably strong, attractive or confident, your mind takes you to some erotic scenario where you’re enticing them to dominate or (try to) tame you. [pc.EachCock] gets stiff from just thinking about it."), "passive", treatmentHourPrint(34, startHours));
			ExtendLogEvent("\n\nBut it’s not like you’re resenting this, no! The Treatment has merely broadened your horizons, showing you a world of pleasure you couldn’t see properly before – there’s nothing wrong with servicing a delicious pussy, or giving a juicy cock the worship it deserves. You could probably get off just from the sheer thrill of it, if you were sufficiently pent-up.");
			pc.lust(10);
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 5;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
		}
		
		// 18
		if(startHours < 36 && treatedHours >= 36)
		{
			AddLogEvent(ParseText("Recently, you’ve become much more attuned to the body language of those around you when it comes to matters of sexual desire. You can intuitively tell what rocks their boat from observing the set of their jaw and shoulders, the undertones of their scent, the way they move, their voice tone, how they look at you... You’re pretty confident you could figure out the right way to tease anyone or anything by appealing to them with something they dig, be it your [pc.butt], your [pc.hips], your [pc.cocks] or a simple coy look."), "passive", treatmentHourPrint(36, startHours));
			if(!pc.hasPerk("Fuck Sense"))
			{
				ExtendLogEvent("\n\n(<b>Perk Gained: Fuck Sense</b> - The Sense ability now relies on your libido rather than intelligence.)");
				pc.createPerk("Fuck Sense",15,0,0,0,"Allows your sense ability to base success off your libido instead of intelligence.");
			}
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 5;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
		}
		
		// 19
		if(startHours < 38 && treatedHours >= 38)
		{
			AddLogEvent("You’re taken by a sudden fantasy – you’re making an important presentation to the Steele Tech local branch, when suddenly the vibe in your ass springs to life. You manage to disguise your reaction as a fit of coughing and try to continue the presentation as best you can, but your amazon secretary, sitting across, looks at you with a teasing smile and slowly jacks up the intensity. The vibrator’s noise can be heard by the entire room.", "passive", treatmentHourPrint(38, startHours));
			ExtendLogEvent("\n\nEventually, you give up any pretense of self-control and fall to the ground, lifting your ass up and whimpering in needy pleasure even as you hastily unbutton your elegant suit. The local managers already know the routine: within seconds, they’re forming a line to use you, starting with a Leithan technician preparing to mount you with his thick bulbous cock, while a Suula director rubs her tentacle-laden pussy all over your hungry lips.");
			ExtendLogEvent("\n\nIt’s their special ‘surprise’ bonus for good sales – that’s why everyone loves having you as a boss!");
			pc.lust(30);
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 10;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
		}
		
		// 20
		if(startHours < 40 && treatedHours >= 40)
		{
			AddLogEvent(ParseText("You spend a few moments running your fingertips over your [pc.chest], [pc.belly], [pc.butt] and groin. The growing sensitivity on your skin was a bit too much at first, but it seems like you’re finally getting used to it. [pc.EachCock] is still half-hard most of the time, but this doesn’t bother you anymore. If anything, you’re proud to display your willingness. The constant arousal doesn’t impose any obstacle to your daily life, and you figure you could probably delay your pleasure for ages, until you’re pent-up just enough to have one of those mind-shattering orgasms."), "passive", treatmentHourPrint(40, startHours));
			if(!pc.hasPerk("Inhuman Desire"))
			{
				ExtendLogEvent("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				ExtendLogEvent("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
		}
		
		// 21
		if(startHours < 42 && treatedHours >= 42)
		{
			AddLogEvent("There’s little doubt that your preferences have been changing over the past two days, but you decide to really put things to the test by using your Codex to access some sexual sites on the extranet. You don’t really do so with the intention of masturbating. It’s just idle curiosity over how your tastes are changing.", "passive", treatmentHourPrint(42, startHours));
			ExtendLogEvent("\n\nThe things you liked before are all still pretty awesome, but simple things like BDSM, edging, submission and pet play have taken on a whole new level of nuance for you. Watching an Ausar ‘sub’ begging in a half-assed way makes you want to go there to show her how it’s done. And watching a Kaithrit boy moan loudly and squirt his load while having his ass spanked by a busty Leithan teacher makes you want to take his place.");
			ExtendLogEvent(ParseText("\n\nBy the time you turn off the screen, [pc.eachCock] is rock hard, and your [pc.lipsChaste] feel dry. They could definitely use a precum-dripping cock or a soaking-wet pussy right about now."));
			pc.lust(30);
		}
		
		// 22
		if(startHours < 44 && treatedHours >= 44)
		{
			AddLogEvent(ParseText("You’re not eating as much as you were yesterday, but you still feel like you’ve got a lot of energy to burn, and your muscles are begging for activity, especially the [pc.legOrLegs] and glutes. How hard it would be to fit some gym equipment onto your ship so that you can stay in shape on the road? Perhaps you could even get a crew member to give you a thick ‘protein shake’ every time you complete your workout routine..."), "passive", treatmentHourPrint(44, startHours));
			pc.slowStatGain("reflexes",1);
			if(pc.thickness >= 5) pc.thickness -= 5;
		}
		
		// 23
		if(startHours < 46 && treatedHours >= 46)
		{
			AddLogEvent("Turning into a Faux Cow was supposed to be the proverbial ‘short end of the stick’, but now that it’s actually happening, you don’t feel that way anymore. It’s pretty awesome, actually. It’s like your sexual fears and insecurities are all melting away, allowing you to properly see the appeal of being a good sub, and it’s deeply empowering.", "passive", treatmentHourPrint(46, startHours));
			ExtendLogEvent("\n\nThe bulls who make Faux Cow jokes just don’t know what they’re missing out on! But then again, their vaunted masculinity is simply too narrow, they wouldn’t be able to be as good a sub as you, never mind please one of the more demanding amazons.");
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 5;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
		}
		
		// 24
		if(startHours < 48 && treatedHours >= 48)
		{
			AddLogEvent("By this point, you’re pretty much used to being aroused and smiling peacefully all the time. The galaxy is your playground, all you need to do is find good enough playmates. But you can afford to take your time; the build-up will only make the sex more amazing, after all. And if in the process you can make your playmate needy enough to lose control, that’s even better. Nothing beats being roughly dommed by an angry amazon mistress, or a powerful cowboy who just can’t hold back anymore. Or both at the same time. And if you can keep them pent-up long enough, you might get them to fuck you a few times in a row...", "passive", treatmentHourPrint(48, startHours));
			if(!pc.hasPerk("Inhuman Desire"))
			{
				ExtendLogEvent("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				ExtendLogEvent("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
		}
		
		// ******************************************************************************
		// FAUX COW: PSYCHOLOGICAL CHANGES ARE DONE, ON TO TRANSFORMATIONS
		// * Full documentation: https://docs.google.com/document/d/1cgDCTnJeAKri99u-KibLhuDlSKXJuUjnW8jejQt28YI/edit?usp=sharing
		// ******************************************************************************

		// *****************************************************
		// FAUX COW: FEMININITY (TWINK PRETTIES)
		// Try to get femininity between 40~50
		// *****************************************************
		if(!pc.hasPerk("Perma-cute") && !pc.hasPerk("Androgyny"))
		{
			var fauxFemTimes:Array = [50, 60, 70, 90, 100, 123, 143]; // array for storing all trigger times of this transformation
			var fauxFemIndex:int = 0; // this is used to determine where we are in the tf track, as well as to log the times
			var fauxFemCount:int = 0;
			fauxIdx = -1;
			for (x = 0; x <= fauxFemTimes.length; x++)
			{
				if (startHours < fauxFemTimes[x] && treatedHours >= fauxFemTimes[x])
				{
					if(fauxIdx == -1) fauxIdx = (x + 1);
					fauxFemCount++;
				}
			}
			for (fauxFemIndex = fauxIdx; fauxFemIndex <= fauxFemCount; fauxFemIndex++)
			{
				// 1st time
				if(fauxFemIndex == 1)
				{
					AddLogEvent("What are you going to do once you’ve got your inheritance and shown your cousin who’s boss? Well, with your looks and talent, you suppose you could easily become an idol or a movie star. It would be nice to do some ‘backstage collaboration’ with your producers, or maybe give your most loyal fans a private show...", "passive", treatmentHourPrint(fauxFemTimes[fauxFemIndex - 1], startHours));
					ExtendLogEvent(ParseText("\n\nIf the Faux Cows you’ve seen so far are any reference, you figure the Treatment is going to give you a hot ‘pretty boy’ kind of look. Anxious, you pick your Codex and check your [pc.face], only to realize the changes have already started: <b>your looks have become slightly more androgynous.</b>"));
					if(pc.femininity >= 40 && pc.femininity <= 50) pc.femininity = 40;
					else if(pc.femininity < 40) pc.femininity += 5;
					else pc.femininity -= 5;
					if(pc.exhibitionismRaw < 100)
					{
						pc.exhibitionismRaw += 5;
						if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
					}
					else pc.exhibitionism(1);
				}
				// small femininity shifts
				if(fauxFemIndex == 2 || fauxFemIndex == 4 || fauxFemIndex == 6)
				{
					if(pc.femininity < 40 || pc.femininity > 50)
					{
						AddLogEvent(ParseText("You’ve been feeling strange tingling on your [pc.face] for a few minutes now. Checking yourself on the screen of your Codex, you realize"), "passive", treatmentHourPrint(fauxFemTimes[fauxFemIndex - 1], startHours));
						if(pc.femininity < 40)
						{
							ExtendLogEvent(" <b>your lines have become slightly softer</b>, though they’re not getting anywhere near the ultra-feminine look you see on most cows and amazons.");
							pc.femininity += 5 + rand(11);
							if(pc.femininity > 50) pc.femininity = 50; // safety net
						}
						else
						{
							ExtendLogEvent(" <b>your jawline has become slightly more visible</b>, though it’s not getting anywhere near a rugged bull.");
							pc.femininity -= 5 + rand(11);
							if(pc.femininity < 40) pc.femininity = 40; // safety net
						}
					}
				}
				// large femininity shifts
				if(fauxFemIndex == 5 || fauxFemIndex == 7)
				{
					if(pc.femininity < 40 || pc.femininity > 50)
					{
						AddLogEvent(ParseText("For no particular reason, you decide to check your looks on the Codex, and the prince looks back at you. You touch your [pc.face] and [pc.lipsChaste] with a dreamy smile as you realize the lines and bones have been shifting again. <b>The Treatment seems to be taking you ever closer to the ideal of boyish prettiness.</b>"), "passive", treatmentHourPrint(fauxFemTimes[fauxFemIndex - 1], startHours));
						if(pc.femininity < 40) pc.femininity += 3 + Math.floor((50 - pc.femininity)*2/3); // https://www.wolframalpha.com/input/?i=plot+X+%2B+(3+%2B+(50-X)*2%2F3)+from+0+to+40
						if(pc.femininity > 50) pc.femininity -= 3 + Math.floor((pc.femininity - 40)*2/3);
						if(pc.femininity >= 37 && pc.femininity < 40) pc.femininity = 40; // force conformity if it gets close enough
						if(pc.femininity <= 53 && pc.femininity > 50) pc.femininity = 50;
					}
				}
			}
			// opportunities to gain perma-cute perk
			if(treatedHours >= fauxFemTimes[1] && pc.femininity >= 40 && pc.femininity <= 50 && !pc.hasPerk("Perma-cute") && !pc.hasPerk("Androgyny"))
			{
				AddLogEvent("Over the course of the last few hours, you’ve been feeling kind of a dull pain in your jaw and nose, though it’s almost gone now. It was as if the internal bone structure and cartilage were getting more... consistent, finally settling down in their current shape. You figure it’s going to be much more difficult to lose your pretty-boy looks from now on.", "passive", treatmentHourPrint(treatedHours, startHours));
				ExtendLogEvent("\n\n(<b>Perk Gained: Perma-cute</b> - Your face will always retain a cute, boyish appearance.)");
				pc.createPerk("Perma-cute", 40, 40, 0, 0, "Your face will always retain a cute, boyish appearance.");
				pc.femininity = 40; // set this to avoid perk message proc out of nowhere
			}
		}
		
		// *****************************************************
		// FAUX COW: TONE, THICKNESS AND HIPS
		// Slender, graceful, only slightly toned
		// *****************************************************
		if(pc.thickness > 30 || pc.tone < 50 || pc.tone > 60 || pc.hipRatingRaw > 4 || pc.hipRatingRaw < 2)
		{
			var fauxToneTimes:Array = [55, 65, 75, 90, 100];
			var fauxToneIndex:int = 0;
			var fauxToneCount:int = 0;
			// used for tracking changes
			var fauxHipsChanged:int = 0;
			var fauxToneChanged:int = 0;
			var fauxThicknessChanged:int = 0;
			fauxIdx = -1;
			for (x = 0; x <= fauxToneTimes.length; x++)
			{
				if(startHours < fauxToneTimes[x] && treatedHours >= fauxToneTimes[x])
				{
					if(fauxIdx == -1) fauxIdx = (x + 1);
					fauxToneCount++;
				}
			}
			for (fauxToneIndex = fauxIdx; fauxToneIndex <= fauxToneCount; fauxToneIndex++)
			{
				// make changes and record
				if(pc.hipRatingRaw > 4)
				{
					fauxHipsChanged = 1;
					pc.hipRatingRaw -= 2 + Math.floor((pc.hipRatingRaw - 4)/2);
				}
				if(pc.hipRatingRaw < 2)
				{
					fauxHipsChanged = 1;
					pc.hipRatingRaw += rand(3) + 1;
				}
				if(pc.tone > 60)
				{
					fauxToneChanged = 1;
					pc.tone -= Math.floor((pc.tone-60)/2) + 5 + rand(6);
				}
				if(pc.tone < 50)
				{
					fauxToneChanged = 2; // grown muscles
					pc.tone += Math.floor((50-pc.tone)/2) + 5 + rand(6);
				}
				if(pc.thickness > 30)
				{
					fauxThicknessChanged = 1;
					pc.thickness =- rand(11) + Math.floor((pc.thickness - 30)/3);
				}
				if(pc.exhibitionismRaw < 100) pc.exhibitionismRaw += 1;
				pc.slowStatGain("reflexes",2);
				
				// 1st variation
				if(fauxToneIndex == 1 || fauxToneIndex == 3 || fauxToneIndex == 5)
				{
					AddLogEvent("Taking a chance to unwind, you ", "passive", treatmentHourPrint(fauxToneTimes[fauxToneIndex - 1], startHours));
					x = rand(2);
					if(x == 0) ExtendLogEvent("smile devilishly and sashay for a few seconds, practicing for when you finally beat your cousin.");
					else ExtendLogEvent("start practicing a subtly sensual walk, aiming for a mix of innocence and sassiness.");
					ExtendLogEvent(" While you’re at it, you notice there’s been changes and touch your body, feeling it out.");
					// results report
					ExtendLogEvent(" Your body seems to be responding to the Treatment by");
					if(fauxHipsChanged == 1)
					{
						ExtendLogEvent(ParseText(" <b>sculpting your [pc.hips]</b>"));
						if(fauxToneChanged > 0 || fauxThicknessChanged > 0) ExtendLogEvent(" and also");
						else ExtendLogEvent(", to give you a lean, attractive physique.");
					}
					if(fauxToneChanged > 0 || fauxThicknessChanged > 0)
					{
						if(fauxToneChanged == 2) ExtendLogEvent(" <b>getting more toned</b>, putting emphasis on just the right curves to give you a lean, attractive physique.");
						else ExtendLogEvent(" <b>getting slimmer</b>, shaving off or shifting any surplus body mass to give you a lean, attractive physique.");
					}
				}
				// 2nd variation
				if(fauxToneIndex == 2 || fauxToneIndex == 4)
				{
					AddLogEvent(ParseText("Every time you check yourself (which has been pretty often), you notice you’re getting hotter and hotter, but not in the uber-muscular image of a bull. Instead, your body is shaping up in a lean, athletic way, especially your " + (pc.bellyRatingRaw < 1 ? "[pc.belly]" : "abs") + " and [pc.legOrLegs]."), "passive", treatmentHourPrint(fauxToneTimes[fauxToneIndex - 1], startHours));
					// results report
					ExtendLogEvent(" Your body seems to be responding to the Treatment by");
					if(fauxHipsChanged > 0)
					{
						ExtendLogEvent(ParseText(" <b>sculpting your [pc.hips]</b>"));
						if(fauxToneChanged > 0 || fauxThicknessChanged > 0) ExtendLogEvent(" and also");
						else ExtendLogEvent(", to give you a lean, attractive physique.");
					}
					if(fauxToneChanged > 0 || fauxThicknessChanged > 0)
					{
						if(fauxToneChanged == 2) ExtendLogEvent(" <b>getting more toned</b>, putting emphasis on just the right curves to give you a lean, attractive physique.");
						else ExtendLogEvent(" <b>getting slimmer</b>, shaving off or shifting any surplus body mass to give you a lean, attractive physique.");
					}
				}
			}
		}
		
		// *****************************************************
		// FAUX COW: FLAT CHEST
		// Like a J-pop singer
		// *****************************************************
		var fauxChestTimes:Array = [53, 58, 73, 78, 93, 98, 113];
		var fauxChestIndex:int = 0;
		var fauxChestCount:int = 0;
		fauxIdx = -1;
		for (x = 0; x <= fauxChestTimes.length; x++)
		{
			if (startHours < fauxChestTimes[x] && treatedHours >= fauxChestTimes[x])
			{
				if(fauxIdx == -1) fauxIdx = (x + 1);
				fauxChestCount++;
			}
		}
		for (fauxChestIndex = fauxIdx; fauxChestIndex <= fauxChestCount; fauxChestIndex++)
		{
			// 1st variation
			if(fauxChestIndex == 1 || fauxChestIndex == 3 || fauxChestIndex == 5 || fauxChestIndex == 7)
			{
				y = 0; //using this as a boolean soon
				for (x = 0; x < pc.bRows(); x++)
				{
					if(pc.breastRows[x].breastRatingRaw > 0) // aggressively reduce breast size
					{
						y = 1;
						if(pc.breastRows[x].breastRatingRaw >= 10) pc.breastRows[x].breastRatingRaw -= rand(3) + Math.floor(pc.breastRows[x].breastRatingRaw/2);
						else pc.breastRows[x].breastRatingRaw -= 2 + rand(3);
						if(pc.breastRows[x].breastRatingRaw < 0) pc.breastRows[x].breastRatingRaw = 0; // safety net
					}
				}
				if(y == 1)
				{
					AddLogEvent("Checking your appearance, your gaze wanders down, and you notice the volume on your chest has diminished. Languidly, you", "passive", treatmentHourPrint(fauxChestTimes[fauxChestIndex - 1], startHours));
					if(!pc.isChestExposed()) ExtendLogEvent(ParseText(" remove your [pc.upperGarments] and"));
					ExtendLogEvent(ParseText(" run your hands sensually over your [pc.chest], taking note of the recent changes brought about by the Treatment. It looks like <b>you’ve lost quite a bit of cup size</b>, but that’s not a bad thing, if it gives you a devilishly alluring figure that complements your innocent looks."));
					
					// 1/2 chance to also enlargen nipples and areolae and make them proportional, or close to
					if(pc.nippleLengthRatio < 1.6 && rand(2) == 0 && !pc.hasCuntNipples() && !pc.hasLipples() && !pc.hasTentacleNipples() && !pc.hasInvertedNipples() && !pc.hasFlatNipples())
					{
						if(pc.nippleLengthRatio < 1) pc.nippleLengthRatio = 1;
						pc.nippleLengthRatio += 0.2;
						if(pc.nippleWidthRatio < pc.nippleLengthRatio) pc.nippleWidthRatio = pc.nippleLengthRatio;
						ExtendLogEvent(ParseText("\n\nSince you’re already at it, you take this opportunity to play with your [pc.nipplesNoun], pinching and twisting with varying degrees of roughness, which quickly draws an involuntary, high-pitched moan of pleasure from your throat. They were sensitive, but not <i>that</i> sensitive! Stopping for a moment to take a good look at them, you realize <b>your [pc.nipples] are a bit larger than before!</b>"));
						pc.lust(30);
					}
				}
			}

			// 2nd variation
			if(fauxChestIndex == 2 || fauxChestIndex == 4 || fauxChestIndex == 6)
			{
				y = 0; //using this as a boolean soon
				for (x = 0; x < pc.bRows(); x++)
				{
					if(pc.breastRows[x].breastRatingRaw > 0) // aggressively reduce breast size
					{
						y = 1;
						if(pc.breastRows[x].breastRatingRaw >= 10) pc.breastRows[x].breastRatingRaw -= rand(3) + Math.floor(pc.breastRows[x].breastRatingRaw/2);
						else pc.breastRows[x].breastRatingRaw -= 2 + rand(3);
						if(pc.breastRows[x].breastRatingRaw < 0) pc.breastRows[x].breastRatingRaw = 0; // safety net
					}
				}
				if(y == 1)
				{
					AddLogEvent("Strange. You feel lighter than you were an hour ago. With a quick inspection, ", "passive", treatmentHourPrint(fauxChestTimes[fauxChestIndex - 1], startHours));
					if(!pc.isChestExposed()) ExtendLogEvent(ParseText(" after removing your [pc.upperGarments],"));
					ExtendLogEvent(ParseText(" you find the reason: it’s the Treatment trimming down unnecessary mass from your [pc.chest] in order to give you that enticing, twinkish look. <b>You’ve lost quite a bit of cup size.</b> Pulling your Codex in camera mode to check, you taking note of the subtle curves and how aesthetically pleasing your body is becoming."));
					
					// 1/2 chance to also enlargen nipples and areolae and make them proportional, or close to
					if(pc.nippleLengthRatio < 1.6 && rand(2) == 0 && !pc.hasCuntNipples() && !pc.hasLipples() && !pc.hasTentacleNipples() && !pc.hasInvertedNipples() && !pc.hasFlatNipples())
					{
						if(pc.nippleLengthRatio < 1) pc.nippleLengthRatio = 1;
						pc.nippleLengthRatio += 0.2;
						if(pc.nippleWidthRatio < pc.nippleLengthRatio) pc.nippleWidthRatio = pc.nippleLengthRatio;
						ExtendLogEvent(ParseText("\n\nYou also notice <b>your [pc.nipplesNoun] seem a bit larger than before</b>, so you decide to touch them, but this causes a tingle of pleasure so strong that your legs momentarily weaken. It seems all the sensitivity from your lost breast volume has been transferred to your buds! After a few moments, the sensation scales down to manageable levels, but your [pc.nipples] remain a bit more sensitive than before. You can’t wait to have a partner suckle or bite on them. Hmm, perhaps you should buy a pair of nipple clamps."));
						pc.lust(30);
					}
				}
			}
		}
		
		// *****************************************************
		// FAUX COW: CUTE ASS
		// Try to get butt rating between 4~8
		// *****************************************************
		if(!pc.hasPerk("Bubble Butt") && !pc.hasPerk("Buns of Steel") && !pc.hasStatusEffect("Ass Slap Patch"))
		{
			var fauxAssTimes:Array = [95, 105, 110, 115, 130, 135];
			var fauxAssIndex:int = 0;
			var fauxAssCount:int = 0;
			fauxIdx = -1;
			for (x = 0; x <= fauxAssTimes.length; x++)
			{
				if (startHours < fauxAssTimes[x] && treatedHours >= fauxAssTimes[x])
				{
					if(fauxIdx == -1) fauxIdx = (x + 1);
					fauxAssCount++;
				}
			}
			for (fauxAssIndex = fauxIdx; fauxAssIndex <= fauxAssCount; fauxAssIndex++)
			{
				// 1st time
				if(fauxAssIndex == 1)
				{
					if((pc.buttRatingRaw > 8 || pc.buttRatingRaw < 4) && !pc.hasPerk("Buttslut"))
					{
						AddLogEvent("Feeling up the boys (that’s how you’re calling your asscheeks now), you note that they are shaping up into into cute, perfect bubbles.", "passive", treatmentHourPrint(fauxAssTimes[fauxAssIndex - 1], startHours));
						if(pc.buttRatingRaw > 8) ExtendLogEvent(ParseText(" <b>Your [pc.butt] has lost a bit of excess size, but became more shapely in the process.</b>"));
						if(pc.buttRatingRaw < 4) ExtendLogEvent(ParseText(" <b>Your [pc.butt] has filled out some more.</b>"));
						ExtendLogEvent(" Judging by the other Faux Cows you’ve seen, your ass is going to have quite a good volume: not small by any measure, but not like one of those hilariously oversized cows either. And you can still use some mods for the finishing touches later.");
						
						if(pc.buttRatingRaw > 8) pc.buttRatingRaw -= 2 + rand(3);
						if(pc.buttRatingRaw < 4) pc.buttRatingRaw += 2 + rand(3);
					}
				}
				// small ass shifts
				if(fauxAssIndex == 2 || fauxAssIndex == 4)
				{
					if((pc.buttRatingRaw > 8 || pc.buttRatingRaw < 4) && !pc.hasPerk("Buttslut"))
					{
						AddLogEvent(ParseText("You’ve been feeling a bit different back there. Running a hand over <b>your [pc.butt], you realize it"), "passive", treatmentHourPrint(fauxAssTimes[fauxAssIndex - 1], startHours));
						if(pc.buttRatingRaw > 8) ExtendLogEvent(" feels a bit less ample than you remember</b>, but it has become more curvaceous");
						if(pc.buttRatingRaw < 4) ExtendLogEvent(" has expanded a bit</b>");
						if(pc.isAssExposed()) ExtendLogEvent(" and shifts enticingly as you walk.");
						else ExtendLogEvent(ParseText(", filling out your [pc.assCover] very nicely."));
						
						if(pc.buttRatingRaw >= 12) pc.buttRatingRaw -= 2 + Math.floor(pc.buttRatingRaw/3);
						else if(pc.buttRatingRaw > 8) pc.buttRatingRaw -= 2 + rand(3);
						if(pc.buttRatingRaw < 4) pc.buttRatingRaw += 2 + rand(3);
					}
				}
				// large ass shifts
				if(fauxAssIndex == 3 || fauxAssIndex == 5 )
				{
					if((pc.buttRatingRaw > 8 || pc.buttRatingRaw < 4) && !pc.hasPerk("Buttslut"))
					{
						AddLogEvent("During a private moment, you", "passive", treatmentHourPrint(fauxAssTimes[fauxAssIndex - 1], startHours));
						if(!pc.isAssExposed()) ExtendLogEvent(" pull down your gear for no particular reason and");
						x = rand(2);
						if(x == 0) ExtendLogEvent(" decide to give the boys an appreciative slap, delighting in the sound and feel of it.");
						else ExtendLogEvent(" run your hands over the boys, giving them a nice squeeze.");
						ExtendLogEvent(ParseText(" It looks like <b>your [pc.butt] has been</b>"));
						if(pc.buttRatingRaw > 8) ExtendLogEvent("<b> slimming down</b>");
						if(pc.buttRatingRaw < 4) ExtendLogEvent("<b> filling out</b>");
						ExtendLogEvent("<b> some more</b> and getting even more shapely in the process. The change leaves a lingering tingle on your asscheeks that makes you crave a glute massage. Or a good spanking.");

						if(pc.buttRatingRaw >= 12) pc.buttRatingRaw -= Math.floor(pc.buttRatingRaw/4);
						if(pc.buttRatingRaw > 8) pc.buttRatingRaw -= 3 + Math.floor(1+(pc.buttRatingRaw - 8)/2);
						if(pc.buttRatingRaw < 4) pc.buttRatingRaw += 3 + rand(4);
					}
				}
			}
			// opportunities to gain the bubble butt perk
			// skip size conditions if you have the buttslut perk
			if(treatedHours >= fauxAssTimes[1] && ((pc.buttRatingRaw >= 4 && pc.buttRatingRaw <= 8) || pc.hasPerk("Buttslut")) && !pc.hasPerk("Bubble Butt") && !pc.hasPerk("Buns of Steel") && !pc.hasStatusEffect("Ass Slap Patch"))
			{
				AddLogEvent(ParseText("You run your hands languidly over the boys, appreciating how deliciously soft and round they are, and how perfectly they mold to your form. Somehow, you know this is going to be the feel of your butt from now on, no matter how much weight you happen to lose or put on. You can barely wait to hear the sound of palms or hips slamming powerfully against your [pc.butt]."), "passive", treatmentHourPrint(treatedHours, startHours));
				ExtendLogEvent("\n\n(<b>Perk Gained: Bubble Butt</b> - Your butt remains soft regardless of muscle tone.)");
				pc.createPerk("Bubble Butt", 0, 0, 0, 0, "Your ass is always soft, regardless of tone.");
			}
		}
		
		// *****************************************************
		// FAUX COW: TALLNESS
		// Grow up to 70" / 166 cm
		// *****************************************************
		if(pc.tallness < 70 && pc.statusEffectv1("Treated") > 0) // using v1 as the tallness max procs
		{
			var fauxTallnessTimes:Array = [88, 108, 128, 148, 167];
			var fauxTallnessIndex:int = 0;
			var fauxTallnessCount:int = 0;
			fauxIdx = -1;
			for (x = 0; x <= fauxTallnessTimes.length; x++)
			{
				if (startHours < fauxTallnessTimes[x] && treatedHours >= fauxTallnessTimes[x])
				{
					if(fauxIdx == -1) fauxIdx = (x + 1);
					fauxTallnessCount++;
				}
			}
			for (fauxTallnessIndex = fauxIdx; fauxTallnessIndex <= fauxTallnessCount; fauxTallnessIndex++)
			{
				if(fauxTallnessIndex >= 1)
				{
					// 1st time
					if(!pc.hasStatusEffect("Treatment Height Boosted"))
					{
						pc.tallness += 1;
						pc.addStatusValue("Treated", 1, -1);
						pc.createStatusEffect("Treatment Height Boosted", 0, 0, 0, 0, true, "", "", false, 10080);
						AddLogEvent(ParseText("A kind of all-over ache has been bothering you off and on all day. It’s a deep pain, below the skin and muscles; you figure it’s your very bones. Taking a quick measurement, you see you’re now [pc.height] tall. This must be what they mean by ‘growing pains’. You briefly worry about getting too tall, but then you remember the Faux Cows you’ve seen so far, and the worry vanishes."), "passive", treatmentHourPrint(fauxTallnessTimes[fauxTallnessIndex - 1], startHours));
					}
					else if(pc.tallness < 65)
					{
						pc.tallness += 2 + rand(3);
						pc.addStatusValue("Treated", 1, -1);
						// 1
						if (rand(2) == 0)
						{
							AddLogEvent("The ground seems a little further away than before. At first, you think it’s your head playing tricks on you, but when you whack your head on something that you should have passed harmlessly underneath, you have to admit it. You’re getting taller. Pretty soon, nobody is going to call you short!", "passive", treatmentHourPrint(fauxTallnessTimes[fauxTallnessIndex - 1], startHours));
						}
						// 2
						else
						{
							AddLogEvent(ParseText("You stop to measure yourself with a cocky smile. You’ve grown quite a little bit! The Codex beeps, informing you that you’re [pc.height] tall. Now that’s more like it!"), "passive", treatmentHourPrint(fauxTallnessTimes[fauxTallnessIndex - 1], startHours));
						}
					}
					else if(pc.tallness < 70)
					{
						pc.tallness += 1 + rand(2);
						pc.addStatusValue("Treated", 1, -1);
						// 1
						if(rand(3) == 0)
						{
							AddLogEvent(ParseText("Your back abruptly pops. It doesn’t hurt or anything, but you twist and stretch to limber up, feeling it pop a few more times in different places. The ever-present dull ache of growing bones underlies it all, promising that you’re getting taller. Right now, your height is [pc.height]."), "passive", treatmentHourPrint(fauxTallnessTimes[fauxTallnessIndex - 1], startHours));
						}
						// 2
						else if(rand(3) == 0)
						{
							AddLogEvent("Things that used to pass right on by your head are getting closer and closer these days. The ground seems farther away with every passing minute, a constant reminder of your Treatment-enhanced physique, hopefully it won’t make you grow <i>too</i> much. You don’t want to get taller than your masters and mistresses, after all.", "passive", treatmentHourPrint(fauxTallnessTimes[fauxTallnessIndex - 1], startHours));
						}
						// 3
						else if(rand(3) == 0)
						{
							AddLogEvent(ParseText("You stretch your arms out high over your head and arch your back, working your sore joints. It’s one thing to revel in your added stature. It’s quite another to suffer from the constant aches and pains that come with your expanding physique. You do a quick measurement. You’re [pc.height] tall now."), "passive", treatmentHourPrint(fauxTallnessTimes[fauxTallnessIndex - 1], startHours));
						}
						// 4
						else
						{
							AddLogEvent(ParseText("You snap out the Codex for a quick check on your amplified tallness. It beeps, displaying your new height on screen. You’re [pc.height] tall now."), "passive", treatmentHourPrint(fauxTallnessTimes[fauxTallnessIndex - 1], startHours));
						}
					}

					if(pc.tallness >= 70) pc.addStatusValue("Treated", 1, -10); // force a stop if you’ve reached the max height
					if(treatedHours >= 168 || pc.statusEffectv1("Treated") <= 0)
					{
						AddLogEvent(ParseText("The dull ache in your bones diminishes moment by moment. You sigh in relief when it vanishes entirely; <b>you are now [pc.height] tall, and the Treatment won’t be making you any taller.</b>"), "passive", treatmentHourPrint(fauxTallnessTimes[fauxTallnessIndex + i], startHours));
					}
				}
			}
		} // end of if( pc.tallness < 70 && pc.statusEffectv1("Treated") > 0 )
		
		// *****************************************************
		// FAUX COW: COCKCHANTMENT
		// Shrink down to 4" with the Mini perk, otherwise grow
		// *****************************************************
		if(pc.statusEffectv3("Treated") > 0) // using v3 as the max number of cock change procs
		{
			var fauxCockTimes:Array = [63, 80, 103, 120, 140, 150];
			var fauxCockIndex:int = 0;
			var fauxCockCount:int = 0;
			fauxIdx = -1;
			for (x = 0; x <= fauxCockTimes.length; x++)
			{
				if (startHours < fauxCockTimes[x] && treatedHours >= fauxCockTimes[x])
				{
					if(fauxIdx == -1) fauxIdx = (x + 1);
					fauxCockCount++;
				}
			}
			for (fauxCockIndex = fauxIdx; fauxCockIndex <= fauxCockCount; fauxCockIndex++)
			{
				// 1st scene
				if(fauxCockIndex == 1)
				{
					// shrink cock if mini
					if(pc.hasPerk("Mini"))
					{
						for (x = 0; x < pc.totalCocks(); x++)
						{
							if(pc.cocks[x].cLengthRaw > 4)
							{
								y = 1;
								pc.cocks[x].cLengthRaw -= 1+rand(3);
								if(x != pc.smallestCockIndex()) pc.cocks[x].cLengthRaw -= 1;
								if(pc.cocks[x].cLengthRaw < 4) pc.cocks[x].cLengthRaw = 4;
							}
						}
						if(y == 1)
						{
							AddLogEvent("You feel a heat in your loins all of a sudden", "passive", treatmentHourPrint(fauxCockTimes[fauxCockIndex - 1], startHours));
							if(!pc.isCrotchExposed()) ExtendLogEvent(" and pull open your gear to check");
							ExtendLogEvent(ParseText(". Unrestrained, [pc.eachCock] rises to full mast like nobody’s business, and then it starts to twitch of its own accord. The phenomenon is accompanied by an intense flush of pleasure in the region, as if each little spurt of precum was a miniature orgasm in its own right."));
							ExtendLogEvent(ParseText("\n\nSoon you’re splashing precum all over the place, and your hands act of their own accord, grabbing [pc.eachCock] and pumping it in turn with frantic, desperate fervor. You moan like a slut in ecstasy as"));
							if(pc.totalCocks() > 1) ExtendLogEvent(ParseText(" your [pc.cocks] reach orgasm at different times, sending ropes of [pc.cum] flying all over the place before the next orgasm ensues."));
							else ExtendLogEvent(ParseText(" your [pc.cockNounComplex] gushes out rope after rope of [pc.cum] in a way that would probably win any long-distance cumming competition."));
							if(pc.hasVagina()) ExtendLogEvent(ParseText(" [pc.EachVagina] chooses to climax at the same time, contributing its own [pc.girlcum] to the party and thoroughly soaking your thighs."));
							ExtendLogEvent(ParseText("\n\nAfter the pleasure subsides and <b>your [pc.cocks]"));
							if(pc.totalCocks() > 1) ExtendLogEvent(" finish deflating, you notice they are");
							else ExtendLogEvent(" finishes deflating, you notice it is");
							ExtendLogEvent(" actually smaller and much cuter than before!</b> Looks like your petit charm has just gained a boost.");
							
							pc.orgasm();
							pc.addStatusValue("Treated", 3, -1);
						}
						else pc.addStatusValue("Treated", 3, -6); // force a stop if no cock is bigger than 4"

						if(pc.statusEffectv3("Treated") <= 0)
						{
							ExtendLogEvent("\n\nThe lingering tingle and buzz that has highlighted the constant change of your " + pc.cocksDescript() + " fades away. <b>Your manhood" + (pc.cockTotal() == 1 ? "" : "s") + " won’t be getting any more changes from the Treatment.</b>");
						}
					}
					// grow cock if not mini
					else
					{
						for (x = 0; x < pc.totalCocks(); x++)
						{
							y = 1;
							if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 1.5;
							if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 0.5;
							else pc.cocks[x].cLengthRaw += 1 + rand(3)/2;
						}
						if(y == 1) // leaving this here just for conformity, but it's not serving any purpose
						{
							AddLogEvent("You feel a heat in your loins all of a sudden", "passive", treatmentHourPrint(fauxCockTimes[fauxCockIndex - 1], startHours));
							if(!pc.isCrotchExposed()) ExtendLogEvent(" and pull open your gear to check");
							ExtendLogEvent(ParseText(". Unrestrained, [pc.eachCock] rises to full mast like nobody’s business, but it doesn’t stop there – it continues to intumesce, expanding in tiny bursts. The phenomenon is accompanied by an intense flush of pleasure in the region, as if each little spurt of precum was a miniature orgasm in its own right."));
							ExtendLogEvent(ParseText("\n\nSoon you’re splashing precum all over the place, and your hands act of their own accord, grabbing [pc.eachCock] and pumping it in turn with frantic, desperate fervor. You moan like a slut in ecstasy as"));
							if(pc.totalCocks() > 1) ExtendLogEvent(ParseText(" your [pc.cocks] reach orgasm at different times, sending ropes of [pc.cum] flying all over the place before the next orgasm ensues. "));
							else ExtendLogEvent(ParseText(" your [pc.cockNounComplex] gushes out rope after rope of [pc.cum] in a way that would probably win any long-distance cumming competition."));
							if(pc.hasVagina()) ExtendLogEvent(ParseText(" Your [pc.eachVagina] chooses to climax at the same time, contributing its own [pc.girlcum] to the party and thoroughly soaking your thighs."));
							ExtendLogEvent(ParseText("\n\nAfter the pleasure subsides and <b>your [pc.cocks]"));
							if(pc.totalCocks() > 1) ExtendLogEvent(" finish deflating, you notice they are");
							else ExtendLogEvent(" finishes deflating, you notice it is");
							ExtendLogEvent(" larger than before</b>. It looks like you’ve gained a bit of length and a proportional amount of girth.");
							
							pc.orgasm();
							pc.addStatusValue("Treated", 3, -1);
						}

						if(pc.statusEffectv3("Treated") <= 0)
						{
							ExtendLogEvent("\n\nThe lingering tingle and buzz that has highlighted the constant change of your " + pc.cocksDescript() + " fades away. <b>Your manhood" + (pc.cockTotal() == 1 ? "" : "s") + " won’t be getting any more changes from the Treatment.</b>");
						}
					}
				}
				// 2nd scene
				if(fauxCockIndex == 2)
				{
					// shrink cock if mini
					if(pc.hasPerk("Mini"))
					{
						for (x = 0; x < pc.totalCocks(); x++)
						{
							if(pc.cocks[x].cLengthRaw > 4)
							{
								y = 1;
								pc.cocks[x].cLengthRaw -= 1+rand(3);
								if(x != pc.smallestCockIndex()) pc.cocks[x].cLengthRaw -= 1;
								if(pc.cocks[x].cLengthRaw < 4) pc.cocks[x].cLengthRaw = 4;
							}
						}
						if(y == 1)
						{
							AddLogEvent("It’s happening again! You feel the blood rushing to your groin", "passive", treatmentHourPrint(fauxCockTimes[fauxCockIndex - 1], startHours));
							if(!pc.isCrotchExposed()) ExtendLogEvent(" and open up your gear just in time");
							ExtendLogEvent(ParseText(", as your [pc.cocks]"));
							if(pc.totalCocks() > 1) ExtendLogEvent(" burst out in full hardness, but they’re smaller than your remember!");
							else ExtendLogEvent(" bursts out in full hardness, but it’s smaller than your remember!");
							ExtendLogEvent(ParseText(" Taken by intense need, you start to move your [pc.hips], moaning indecently and thrusting into an imaginary hole even as your dirty mind pictures a thick cock filling your"));
							if(pc.hasVagina()) ExtendLogEvent(" hungry ass or cunt.");
							else ExtendLogEvent(" hungry ass.");
							ExtendLogEvent(" Before you can even think, your hands are already working on this fantasy:");
							if(pc.hasVagina()) ExtendLogEvent(ParseText(" one fingering your back hole, while the other plays with your [pc.clit]."));
							else ExtendLogEvent(ParseText(" inserting as many fingers as you can take in your [pc.butt] and compressing your [pc.balls] just right."));
							ExtendLogEvent("\n\nYou would probably blush if you could see your own whorish face in a mirror right now. The mental image of a voyeur watching your shameless display brings you to the edge in no time.");
							if(pc.hasVagina())
							{
								if(pc.totalVaginas() > 1) ExtendLogEvent(ParseText(" Your [pc.vaginas] are the first to orgasm, squirting [pc.girlCumNoun] down your legs."));
								else ExtendLogEvent(ParseText(" Your [pc.vaginas] is the first to orgasm, squirting [pc.girlCumNoun] down your legs."));
							}
							ExtendLogEvent(" Obligingly, the ring of your ass contracts tightly around your fingers as your");
							if(pc.totalCocks() > 1) ExtendLogEvent(ParseText(" [pc.cocks] reach orgasm all at once, squirting [pc.cumNoun] like it’s nobody’s business without even being touched."));
							else ExtendLogEvent(ParseText(" [pc.cockNounComplex] gushes [pc.cumNoun] in one thick, incredibly long stream without even being touched."));
							ExtendLogEvent(ParseText("\n\nAfter the pleasure subsides and <b>your [pc.cocks]"));
							if(pc.totalCocks() > 1) ExtendLogEvent(" finish deflating, you notice they are");
							else ExtendLogEvent(" finishes deflating, you notice it is");
							ExtendLogEvent(" actually smaller and much cuter than before!</b> Looks like your petit charm has just gained a boost.");
							
							pc.orgasm();
							pc.addStatusValue("Treated", 3, -1);
						}
						else pc.addStatusValue("Treated", 3, -6); // force a stop if no cock is bigger than 4"

						if(pc.statusEffectv3("Treated") <= 0)
						{
							ExtendLogEvent("\n\nThe lingering tingle and buzz that has highlighted the constant change of your " + pc.cocksDescript() + " fades away. <b>Your manhood" + (pc.cockTotal() == 1 ? "" : "s") + " won’t be getting any more changes from the Treatment.</b>");
						}
					}
					// grow cock if not mini
					else
					{
						for (x = 0; x < pc.totalCocks(); x++)
						{
							y = 1;
							if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 1.5;
							if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 0.5;
							else pc.cocks[x].cLengthRaw += 1 + rand(3)/2;
						}
						if(y == 1) // leaving this here just for conformity, but it's not serving any purpose
						{
							AddLogEvent("It’s happening again! You feel the blood rushing to your groin", "passive", treatmentHourPrint(fauxCockTimes[fauxCockIndex - 1], startHours));
							if(!pc.isCrotchExposed()) ExtendLogEvent(" and open up your gear just in time");
							ExtendLogEvent(ParseText(", as your [pc.cocks]"));
							if(pc.totalCocks() > 1) ExtendLogEvent(" burst out in full hardness and continue to grow as you observe in awe!");
							else ExtendLogEvent(" bursts out in full hardness and continue to grow as you observe in awe!");
							ExtendLogEvent(ParseText(" Taken by intense need, you start to move your [pc.hips], moaning indecently and thrusting into an imaginary hole even as your dirty mind pictures a thick cock filling your"));
							if(pc.hasVagina()) ExtendLogEvent(" hungry ass or cunt.");
							else ExtendLogEvent(" hungry ass.");
							ExtendLogEvent(" Before you can even think, your hands are already working on this fantasy:");
							if(pc.hasVagina()) ExtendLogEvent(ParseText(" one fingering your back hole, while the other plays with your [pc.clit]."));
							else ExtendLogEvent(ParseText(" inserting as many fingers as you can take in your [pc.butt] and compressing your [pc.balls] just right."));
							ExtendLogEvent("\n\nYou would probably blush if you could see your own whorish face in a mirror right now. The mental image of a voyeur watching your shameless display brings you to the edge in no time.");
							if(pc.hasVagina())
							{
								if(pc.totalVaginas() > 1) ExtendLogEvent(ParseText(" Your [pc.vaginas] are the first to orgasm, squirting [pc.girlCumNoun] down your legs."));
								else ExtendLogEvent(ParseText(" Your [pc.vaginas] is the first to orgasm, squirting [pc.girlCumNoun] down your legs."));
							}
							ExtendLogEvent("Obligingly, the ring of your ass contracts tightly around your fingers as your");
							if(pc.totalCocks() > 1) ExtendLogEvent(ParseText(" [pc.cocks] reach orgasm all at once, squirting [pc.cumNoun] like it’s nobody’s business without even being touched."));
							else ExtendLogEvent(ParseText(" [pc.cockNounComplex] gushes [pc.cumNoun] in one thick, incredibly long stream without even being touched."));
							ExtendLogEvent(ParseText("\n\nAfter the pleasure subsides and <b>your [pc.cocks]"));
							if(pc.totalCocks() > 1) ExtendLogEvent(" finish deflating, you notice they are");
							else ExtendLogEvent(" finishes deflating, you notice it is");
							ExtendLogEvent(" larger than before</b>. It looks like you’ve gained a bit of length and a proportional amount of girth.");
							
							pc.orgasm();
							pc.addStatusValue("Treated", 3, -1);
						}
						
						if(pc.statusEffectv3("Treated") <= 0)
						{
							ExtendLogEvent("\n\nThe lingering tingle and buzz that has highlighted the constant change of your " + pc.cocksDescript() + " fades away. <b>Your manhood" + (pc.cockTotal() == 1 ? "" : "s") + " won’t be getting any more changes from the Treatment.</b>");
						}
					}
				}
				// repeat scenes
				if(fauxCockIndex >= 3)
				{
					// shrink cock if mini
					if(pc.hasPerk("Mini"))
					{
						for (x = 0; x < pc.totalCocks(); x++)
						{
							if(pc.cocks[x].cLengthRaw > 4)
							{
								y = 1;
								pc.cocks[x].cLengthRaw -= 1+rand(3);
								if(x != pc.smallestCockIndex()) pc.cocks[x].cLengthRaw -= 1;
								if(pc.cocks[x].cLengthRaw < 4) pc.cocks[x].cLengthRaw = 4;
							}
						}
						if(y == 1)
						{
							AddLogEvent("You feel a tightness in your groin, but this time the sensation is not as concentrated as before. It’s more like a long, pleasant period of tumescence and precum-dribbling. After twenty minutes or so, the phenomenon subsides, and you", "passive", treatmentHourPrint(fauxCockTimes[fauxCockIndex - 1], startHours));
							if( !pc.isCrotchExposed() ) ExtendLogEvent(ParseText(" pull open your [pc.crotchCoverUnder] to"));
							ExtendLogEvent(ParseText(" check <b>your [pc.cocks], noting that"));
							if( pc.totalCocks() > 1 ) ExtendLogEvent(" they have");
							else ExtendLogEvent(" it has");
							ExtendLogEvent(ParseText(" shrunk in size</b> once again. How cute! You picture a master or mistress’ hand enveloping your [pc.cockSmallest] as a reward and slowly jerking you off to climax. The mental image brings a demure blush to your [pc.face]."));
							
							pc.lust(20);
							pc.addStatusValue("Treated", 3, -1);
						}
						else pc.addStatusValue("Treated", 3, -6); // force a stop if no cock is bigger than 4"
						
						if(pc.statusEffectv3("Treated") <= 0)
						{
							ExtendLogEvent("\n\nThe lingering tingle and buzz that has highlighted the constant change of your " + pc.cocksDescript() + " fades away. <b>Your manhood" + (pc.cockTotal() == 1 ? "" : "s") + " won’t be getting any more changes from the Treatment.</b>");
						}
					}
					// grow cock if not mini
					else
					{
						for (x = 0; x < pc.totalCocks(); x++)
						{
							y = 1;
							if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 1.5;
							if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 0.5;
							else pc.cocks[x].cLengthRaw += 1 + rand(3)/2;
						}
						if(y == 1) // leaving this here just for conformity, but it's not serving any purpose
						{
							AddLogEvent("You feel a tightness in your groin, but this time the sensation is not as concentrated as before. It’s more like a long, pleasant period of tumescence and precum-dribbling. After twenty minutes or so, the phenomenon subsides, and you", "passive", treatmentHourPrint(fauxCockTimes[fauxCockIndex - 1], startHours));
							if( !pc.isCrotchExposed() ) ExtendLogEvent(ParseText(" pull open your [pc.crotchCoverUnder] to"));
							ExtendLogEvent(ParseText(" check <b>your [pc.cocks], noting that"));
							if( pc.totalCocks() > 1 ) ExtendLogEvent(" they have");
							else ExtendLogEvent(" it has");
							ExtendLogEvent(ParseText(" grown larger</b> once again. How awesome! You picture your [pc.multiCocks] swinging wildly and dripping precum everywhere while a hung, sexy alien pounds you relentlessly from behind. That’s the stuff..."));

							pc.lust(20);
							pc.addStatusValue("Treated", 3, -1);
						}
						
						if(pc.statusEffectv3("Treated") <= 0)
						{
							ExtendLogEvent("\n\nThe lingering tingle and buzz that has highlighted the constant change of your " + pc.cocksDescript() + " fades away. <b>Your manhood" + (pc.cockTotal() == 1 ? "" : "s") + " won’t be getting any more changes from the Treatment.</b>");
						}
					}
				} // end of repeat scenes
			}
		} // end of cock changes
		
		// *****************************************************
		// FAUX COW: DELICIOUS BALLZ
		// (OR PROSTATE, IF NO BALLS)
		// Max size 6.3 (2"), or 12.6 (4") if bulgy (stored in value 4)
		// Chance to get that very nice pouch
		// *****************************************************
		var fauxBallTimes:Array = [68, 88, 108, 128, 148, 163];
		var fauxBallIndex:int = 0;
		var fauxBallCount:int = 0;
		fauxIdx = -1;
		for (x = 0; x <= fauxBallTimes.length; x++)
		{
			if (startHours < fauxBallTimes[x] && treatedHours >= fauxBallTimes[x])
			{
				if(fauxIdx == -1) fauxIdx = (x + 1);
				fauxBallCount++;
			}
		}
		for (fauxBallIndex = fauxIdx; fauxBallIndex <= fauxBallCount; fauxBallIndex++)
		{
			// ball growth scenes
			if(pc.ballSizeRaw < pc.statusEffectv4("Treated"))
			{
				// 1st variation
				if(fauxBallIndex == 1 || fauxBallIndex == 4)
				{
					pc.ballSizeRaw += 1+rand(25)/10;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 1+rand(35)/10;
					if(pc.ballSizeRaw > pc.statusEffectv4("Treated")) pc.ballSizeRaw = pc.statusEffectv4("Treated");
					
					AddLogEvent("A sudden pressure seizes your ", "passive", treatmentHourPrint(fauxBallTimes[fauxBallIndex - 1], startHours));
					if(pc.balls > 0) ExtendLogEvent(ParseText(" [pc.sack] from inside, as if it was a balloon expanding."));
					else ExtendLogEvent(" prostate from inside, you can practically feel it ‘filling up’.");
					ExtendLogEvent(" It’s both deliciously painful and pleasant at the same time. Wasting not a second,");
					if(!pc.isCrotchExposed()) ExtendLogEvent(" you pull down your gear and");				
					if(pc.balls > 0) ExtendLogEvent(" you start touching it to check.");
					else ExtendLogEvent(" insert a finger inside to check.");
					ExtendLogEvent(ParseText(" What was just an examination turns into a few minutes playing with yourself, as you delight in the sensation of your <b>permanently enlarged, sensitive [pc.ballsNoun].</b>"));
					pc.lust(20);
				}
				// 2nd variation
				if(fauxBallIndex == 2 || fauxBallIndex == 5)
				{
					pc.ballSizeRaw += 1+rand(25)/10;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 1+rand(35)/10;
					if(pc.ballSizeRaw > pc.statusEffectv4("Treated")) pc.ballSizeRaw = pc.statusEffectv4("Treated");
					
					if(pc.balls > 0)
					{
						AddLogEvent(ParseText("Idly, you decide to compress <b>your growing [pc.balls]</b> with increasing force, trying to reach that ecstatic threshold where pain outlines pleasure. Every time your"), "passive", treatmentHourPrint(fauxBallTimes[fauxBallIndex - 1], startHours));
						if(pc.balls == 1) ExtendLogEvent(" testicle expands, it becomes");
						else ExtendLogEvent(" nuts expand, they become");
						ExtendLogEvent(ParseText(" that much more squeezable, which you figure will come in handy for those times when a larger partner pressures your [pc.balls] with the sheer power of their body as they fuck you missionary-style."));
					}
					else AddLogEvent(ParseText("Idly, you decide to insert as many fingers as you can inside your [pc.butt], trying to simulate the feel of a very girthy knot compressing <b>your growing prostate</b>. It’s a very satisfactory sensation. Eventually, however, you choose to stop playing with yourself. Better save that load for when you have someone to actually do it to you."), "passive", treatmentHourPrint(fauxBallTimes[fauxBallIndex - 1], startHours));
					pc.lust(20);
				}
				// 3rd variation
				if(fauxBallIndex == 3 || fauxBallIndex == 6)
				{
					pc.ballSizeRaw += 1+rand(25)/10;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 1+rand(35)/10;
					if(pc.ballSizeRaw > pc.statusEffectv4("Treated")) pc.ballSizeRaw = pc.statusEffectv4("Treated");
					
					AddLogEvent(ParseText("You’ve been feeling a tingling inside your [pc.balls] for the past half hour, but decided to ignore it, letting the sensation build up until you can’t help turning your full attention to it. With a quick probing, you confirm that <b>your [pc.balls] " + (pc.balls == 1 ? "is" : "are") + " growing again!</b>"), "passive", treatmentHourPrint(fauxBallTimes[fauxBallIndex - 1], startHours));
				}
			} // end of ball growth scenes
		}

		// ballsack turns into beautiful pouch once balls have grown enough
		if(treatedHours >= fauxBallTimes[1] && pc.balls > 0 && !pc.hasStatusEffect("Uniball"))
		{
			AddLogEvent(ParseText("There’s been a pleasant itch all over your [pc.sack] for the past couple of minutes"), "passive", treatmentHourPrint(treatedHours, startHours));
			if(!pc.isCrotchExposed()) ExtendLogEvent(", so you pull open your gear with cruiosity");
			ExtendLogEvent(ParseText(". To your amazement, your scrotum is pulling up a little tighter, compacting around your [pc.balls] without actually shrinking them, <b>framing them into an adorable, supremely squeezable pouch!</b>"));
			pc.createStatusEffect("Uniball",0,0,0,0,true,"","",false,0);
		}

		// *****************************************************
		// FAUX COW: CUM AVAILABILITY
		// Cum storage towards 20, cum refractory towards 6
		// Also boost cum quality a bit, for that thick cockmilk
		// *****************************************************
		if(pc.ballEfficiency < 20 || pc.refractoryRate < 6)
		{
			var fauxCumTimes:Array = [63, 80, 103, 120, 140, 150];
			var fauxCumIndex:int = 0;
			var fauxCumCount:int = 0;
			var fauxRefractoryChanged:int = 0;
			var fauxStorageChanged:int = 0;
			fauxIdx = -1;
			for (x = 0; x <= fauxCumTimes.length; x++)
			{
				if (startHours < fauxCumTimes[x] && treatedHours >= fauxCumTimes[x])
				{
					if(fauxIdx == -1) fauxIdx = (x + 1);
					fauxCumCount++;
				}
			}
			for (fauxCumIndex = fauxIdx; fauxCumIndex <= fauxCumCount; fauxCumIndex++)
			{
				// 1st variation
				if(fauxCumIndex == 1 || fauxCumIndex == 3 || fauxCumIndex == 5)
				{
					if(pc.refractoryRate < 6)
					{
						fauxRefractoryChanged = 1;
						pc.refractoryRate += 1 + rand(5)/2;
						if( pc.refractoryRate > 6 ) pc.refractoryRate = 6;
						pc.cumQualityRaw += 0.2;
					}
					if(pc.ballEfficiency < 20 && rand(2) == 0) // this one has a random chance
					{
						fauxStorageChanged = 1;	
						if( fauxRefractoryChanged == 1 ) fauxRefractoryChanged += 1;
						pc.ballEfficiency += 1 + Math.floor((20-pc.ballEfficiency)/3) + rand(4);
						if(pc.ballEfficiency > 20) pc.ballEfficiency = 20;
						pc.cumQualityRaw += 0.2;
					}
					if(fauxRefractoryChanged > 0 || fauxStorageChanged > 0)
					{
						AddLogEvent(ParseText("Recently, you feel like your [pc.balls] " + (pc.balls > 1 ? "have" : "has") + " been working overtime to keep up with your increased libido – and well " + (pc.balls > 1 ? "they" : "it") + " should!"), "passive", treatmentHourPrint(fauxCumTimes[fauxCumIndex - 1], startHours));
						if(fauxRefractoryChanged == 1) ExtendLogEvent(ParseText(" <b>Your body is producing [pc.cumNoun] faster.</b>"));
						else if(fauxRefractoryChanged == 2) ExtendLogEvent(ParseText(" <b>Your body is able to store more [pc.cumNoun] and is producing it faster.</b>"));
						else ExtendLogEvent(ParseText(" <b>Your body is able to store more [pc.cumNoun].</b>"));
					}
				}
				// 2nd variation
				if( fauxCumIndex == 2 || fauxCumIndex == 4 )
				{
					if(pc.refractoryRate < 6)
					{
						fauxRefractoryChanged = 1;
						pc.refractoryRate += 1 + rand(5)/2;
						if( pc.refractoryRate > 6 ) pc.refractoryRate = 6;
						pc.cumQualityRaw += 0.2;
					}
					if(pc.ballEfficiency < 20 && rand(2) == 0) // this one has a random chance
					{
						fauxStorageChanged = 1;	
						if( fauxRefractoryChanged == 1 ) fauxRefractoryChanged += 1;
						pc.ballEfficiency += 1 + Math.floor((20-pc.ballEfficiency)/3) + rand(4);
						if(pc.ballEfficiency > 20) pc.ballEfficiency = 20;
						pc.cumQualityRaw += 0.2;
					}
					if(fauxRefractoryChanged > 0 || fauxStorageChanged > 0)
					{
						AddLogEvent(ParseText("Your reproductive system is becoming more efficient, so that you’re able to cum as many times as possible before running dry. Unbidden, your lascivious mind fantasises about a line of pent-up soldiers – bulls, amazons, sexy aliens; the images easily change according to your whims – waiting to use you as their sex-toy, milking you of your [pc.cumNoun] many times in a row. When the last one finishes, the first is ready to go again!"), "passive", treatmentHourPrint(fauxCumTimes[fauxCumIndex - 1], startHours));
						if(fauxRefractoryChanged == 1) ExtendLogEvent(ParseText(" <b>Your body is now producing [pc.cumNoun] faster.</b>"));
						else if(fauxRefractoryChanged == 2) ExtendLogEvent(ParseText(" <b>Your body is now able to store more [pc.cumNoun] and is producing it faster.</b>"));
						else ExtendLogEvent(ParseText(" <b>Your body is now able to store more [pc.cumNoun].</b>"));
					}
				}
			}
		} // end of cum section
		
		// ********************************************************************
		// FAUX COW: BONUS CAPACITY / ELASTICITY / LOOSENESS
		// Make sure the twink can be the bext power bottom in existence
		// ********************************************************************
		if(startHours < 153 && treatedHours >= 153)
		{
			var fauxCapacityChanged:int = 0; // used to track anal changes
			var fauxLoosenessChanged:int = 0; // used to track anal changes
			var z:int = 0; // used to track vaginal changes
			y = 0; // used to track vaginal changes

			// largely boost elasticity
			if(pc.elasticity < 5) pc.elasticity = 5;
			else if(pc.hasPerk("Elasticity")) pc.elasticity += 2;
			else pc.elasticity += 1;

			// reduce looseness
			if(pc.ass.loosenessRaw > 1)
			{
				fauxLoosenessChanged = 1;
				if(pc.ass.minLooseness > 1) pc.ass.minLooseness = 1;
				pc.ass.loosenessRaw = 1;
			}
			for (x = 0; x < pc.totalVaginas(); x++)
			{
				if(pc.vaginas[x].loosenessRaw > 1)
				{
					z = 1;
					if(pc.vaginas[x].minLooseness > 1) pc.vaginas[x].minLooseness = 1;
					pc.vaginas[x].loosenessRaw = 1;
				}
			}
			// increase bonus capacity
			if(pc.ass.bonusCapacity < 150)
			{
				fauxCapacityChanged = 1;
				pc.ass.bonusCapacity = 150;
			}
			for (x = 0; x < pc.totalVaginas(); x++)
			{
				if(pc.vaginas[x].bonusCapacity < 150)
				{
					y = 1;
					pc.vaginas[x].bonusCapacity = 150;
				}
			}
			
			// base scene
			if(fauxCapacityChanged == 1 || y == 1 || fauxLoosenessChanged == 1 || z == 1)
			{
				AddLogEvent(("For the past few minutes, you’ve been tormented by an emptiness inside, a deep craving for something or someone to fill a hole. In fact, you’ve probably never felt this strange thing before, it’s definitely a physical need, but also an existential one. You stop for a moment to take stock of the situation and, now that you’re standing still, you can clearly feel something is changing, you just know <b>your " + (pc.hasVagina() ? "holes have" : "butthole has") + " become more elastic.</b>"), "passive", treatmentHourPrint(153, startHours));
				pc.lust(30);
			}
			// capacity report
			if(fauxCapacityChanged == 1 || y == 1) ExtendLogEvent("\n\nBut that’s not all: your inner walls are pulling up, reshaping themselves to allow you to take even bigger insertions.");
			if(fauxCapacityChanged == 1)
			{
				if( y == 1 ) ExtendLogEvent(" <b>Your anal and vaginal capacities have increased in terms of depth.</b>");
				else ExtendLogEvent(" <b>Your anal capacity has increased in terms of depth.</b>");
			}
			else if( y == 1 ) ExtendLogEvent(" <b>Your vaginal capacity has increased in terms of depth.</b>");

			// looseness scene
			if(fauxLoosenessChanged == 1 || z == 1)
			{
				ExtendLogEvent("\n\nCurious, you");
				if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" pull open your [pc.lowerGarments] and"));
				if( fauxLoosenessChanged == 1 )
				{
					if(z == 1) ExtendLogEvent(" reach for your back and front holes,");
					else ExtendLogEvent(" reach for your back hole, ");
				}
				else if(z == 1) ExtendLogEvent(ParseText(" reach for your [pc.vaginas],"));
				ExtendLogEvent(" inserting a finger to test the waters, then another, and another...");
			}
			// looseness report
			if(fauxLoosenessChanged == 1)
			{
				ExtendLogEvent("\n\nAfter careful probing, you conclude that <b>the looseness of your");
				if(z == 1) ExtendLogEvent(" back and front holes has diminished</b>, but they are");
				else ExtendLogEvent(" back hole has diminished</b>, but it’s");
				ExtendLogEvent(" capable of stretching even more than before while remaining oh-so-tight! Unlike one of those loose cows, you’ll be able to satisfy even the most demanding of amazons or bulls!");
			}
			else if(z == 1)
			{
				ExtendLogEvent(ParseText("\n\nAfter careful probing, you conclude that <b>the looseness of your [pc.vaginas] has diminished</b>, but at the same time " + (pc.totalVaginas() > 1 ? "they are" : "it is") + " capable of stretching even more than before while remaining oh-so-tight! Unlike one of those loose cows, you’ll be able to satisfy even the most demanding of amazons or bulls!"));
			}
			ExtendLogEvent("\n\nYou barely manage to suppress a self-satisfied smile from your face before it becomes a permanent feature. Perhaps you should buy a big anal plug and wear it 24/7, just to show everyone that you can.");
		} // end of the capacity section, and what a trip it was

		// ***********************************************************************************
		// FAUX COW: ANAL WETNESS
		// Make sure ass is self-lubricated, but just enough
		// I really wanted an excuse to make the ass aphrodisiac, but couldn't come up with anything
		// so it's just self-lubricating (I'd use the lubricated flag if it didn't make you a walking fountain)
		// ***********************************************************************************
		if(pc.ass.wetnessRaw < 1 && startHours < 155 && treatedHours >= 155)
		{
			pc.ass.wetnessRaw = 1;
			AddLogEvent("You’re walking when suddenly you feel a certain slickness between the boys, but you’re pretty sure it’s not fluids from a previous lover. You", "passive", treatmentHourPrint(155, startHours));
			if(!pc.isAssExposed()) ExtendLogEvent(ParseText(" pull down your [pc.assCover] to"));
			ExtendLogEvent(" check, taking some of the fluid in your fingers and bringing them before your eyes. Whatever it is, it looks, feels and even smells exactly like your precum. Your Treated senses tell you it <i>is</i> your precum, but what’s it doing coming out of your butt?!");
			ExtendLogEvent(ParseText("\n\nFor science, you insert a finger inside and realize that your ass is indeed secreting a small amount of precum, though it doesn’t seem to be enough to leak out on its own. Well, it looks like your [pc.butt] is now self-lubricating. Nice!"));
		}

		// ******************************************************************************
		// FAUX COW: SPECIAL PERKS
		// 
		// EASY: already exists, just placing the proc here for practicality.
		// CUM HIGHS: already exists, just placing the proc here for practicality.
		// 
		// LUSTY AFTERGLOW: every time fluids are shot inside of you, you regain random 3~9 
		// energy. While cumfilled, you gain lust over time twice as fast (does not apply to combat 
		// sources, only to the lust you gain passively, like the Extra Ardor starting perk).
		// 
		// INNOCENT ALLURE: Gives a +5 passive sexiness boost. And if you successfully tease an 
		// enemy, they suffer a -10% hit-chance penalty for the rest of the battle. I think this will 
		// work like the smuggler's flash grenade, except with a much smaller penalty. In fact, the 
		// penalty from allure should not stack with flash grenade - this will serve as a balancing 
		// mechanism to reduce the evasion stacking for faux cow smulgglers.
		// 
		// * If the hit-chance penalty is too troublesome to code, a simple +5% flat evasion boost 
		// should suffice. But the hit-chance penalty would be better for the non-smuggler classes.
		// ******************************************************************************
		// first hints of the cumslut route
		if(startHours < 100 && treatedHours >= 100)
		{
			AddLogEvent("You wonder if being a Faux Cow is going to be an obstacle to your quest. Briefly, you imagine how it would be to submit to your cousin and just let them handle all the bothersome stuff, but your butthole clenches in revolt at the very idea of submitting to someone so pathetic. No, if you’re going to be someone’s toy, it should be someone worthy, someone strong, who can treat you right and make you squeal in pleasure. Totally not some piece of garbage like your cousin, or that obnoxious and incredibly hot jock from college.", "passive", treatmentHourPrint(100, startHours));
			ExtendLogEvent("\n\n...Well, there’s your answer.");
		}
		// prelude scene for Cum Highs and Lusty Afterglow, urging the pc to get cumfilled
		if((startHours < 123 && treatedHours >= 123) || (startHours < 143 && treatedHours >= 143))
		{
			if(!pc.hasPerk("Lusty Afterglow") || !pc.hasPerk("Cum Highs")) // safety check
			{
				AddLogEvent("You’ve been feeling awfully hungry as of late, but it’s not just any kind of hunger: you lust to be", "passive", treatmentHourPrint(treatedHours, startHours));
				if(pc.cumFlationAmount() > 0) ExtendLogEvent(" even more");
				ExtendLogEvent(" filled with cum and <i>stay</i> that way for hours on end. Doesn’t matter if it’s in your belly, your butt... as long as it’s inside your body and not, say, some greedy parasite tail. The other things you dig are still awesome, but for some reason you’ve been having this particular urge a lot lately, to the point you’ve even caught yourself fantasizing about that annoyingly hot jock from college cumming in your mouth with a throaty <i>‘Ahhh’</i> and that smug grin of his. <i>Yummy</i>. You mean, <i>Eww</i>.");
				ExtendLogEvent("\n\n<b>You have no idea why, but intuition tells you it’s the Treatment asking something of you. And maybe you should listen to it, if you want to get the full benefits.</b> (But a corner of your brain warns that giving in to lust can lead you down a dangerous path. The choice is yours.)");
			}
		}
		// Cum Highs perk gain (starts the cumslut route)
		if(treatedHours >= 125 && !pc.hasPerk("Cum Highs") && pc.cumFlationAmount() > 0)
		{
			AddLogEvent("<i>Uhhh... maybe you’ve been taking in too much cum lately</i>, a part of your brain chimes in. Your vision doubles momentarily. <i>Nah, there can never be such a thing as too much cum</i>, another part argues. <i>Wait, being filled with cum gets us high?</i> You ask your imaginary friends. The answer should be no, but somehow you’re pretty sure it does now. Well, you don’t have a headache or anything, so at least your body seems to be handling this whole situation pretty well. <i>Whoohoo! Cum’s the best drink in the stars!</i> You raise a victorious fist and yell all of a sudden, looking up at... you don’t know what you were expecting. Your cheeks flush with embarrassment. Dang, you’ve become such a cumslut!", "passive", treatmentHourPrint(treatedHours, startHours));
			ExtendLogEvent("\n\n(<b>Perk Gained: Cum Highs</b> - You can get high on cum!)");
			pc.createPerk("Cum Highs",0,0,0,0,"You can get high on cum.");
			// Raise your alcohol tolerance by 40
			pc.tolerance(40);
		}
		// Easy perk gain (only in the cumslut route)
		if(treatedHours >= 133 && pc.hasPerk("Cum Highs") && !pc.hasPerk("Easy"))
		{
			AddLogEvent(ParseText("Lately, you’ve been paying a lot more attention to people who show open sexual interest in you. It’s like your brain is being rewired to react more positively to their advances, sending a chain reaction of electric impulses that starts with that fuzzy feeling of being appreciated, then spreads to your stiffening [pc.nipplesNoun], [pc.crotch] and finally ends with a tingling on your [pc.butt]. You’d better work on your self-control if you don’t want to let every sexy alien have their way with you. Or maybe that’s exactly what you want."), "passive", treatmentHourPrint(treatedHours, startHours));
			ExtendLogEvent("\n\n(<b>Perk Gained: Easy</b> - Gain 20% more lust from combat sources.)");
			pc.createPerk("Easy",20,0,0,0,"Gain 20% more lust from combat sources.");
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 5;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
		}
		// Lusty Afterglow perk gain (crowns the cumslut route)
		if(treatedHours >= 145 && !pc.hasPerk("Lusty Afterglow") && pc.hasPerk("Cum Highs") && pc.cumFlationAmount() > 0)
		{
			var fauxFilledHoles:int = 0;
			if(pc.statusEffectv1("Anally-Filled") > 0) fauxFilledHoles++;
			if(pc.statusEffectv1("Vaginally-Filled") > 0) fauxFilledHoles++;
			if(pc.statusEffectv1("Orally-Filled") > 0) fauxFilledHoles++;
			AddLogEvent("A wonderful satisfaction spreads throughout your entire body, radiating from the hole" + (fauxFilledHoles == 1 ? " " : "s ") + "you’ve recently cumfilled. How long has this been going on? You can’t be bothered to remember, and honestly it doesn’t matter, all that matters now is the gentle afterglow you’re basking in. This soothing, invigorating sensation could become the focus of your entire life, and you would probably consider yourself fulfilled. After you’ve put your cousin in their place and acquired your inheritance, that is.", "passive", treatmentHourPrint(treatedHours, startHours));
			ExtendLogEvent("\n\n(<b>Perk Gained: Lusty Afterglow</b> - Every time fluids are shot inside of you, you recover some energy, and you gain lust over time twice as fast while cumfilled.)");
			pc.createPerk("Lusty Afterglow",0,0,0,0,"Every time fluids are shot inside of you, you recover some energy, and you gain lust over time twice as fast while cumfilled.");
		}
		// Innocent Allure perk gain (any route)
		if(startHours < 165 && treatedHours >= 165 && !pc.hasPerk("Innocent Allure"))
		{
			AddLogEvent("Presently, you find yourself enthralled by your own image on the screen of your Codex. Setting it to record mode, you smile unguardedly, bat your eyelashes twice and slowly start to purse your lips in the promise of a kiss.", "passive", treatmentHourPrint(165, startHours));
			ExtendLogEvent("\n\nBefore the picture is complete, you raise a reluctant hand to your mouth and bite lightly on your thumb while diverting your eyes with a chaste, self-conscious expression, making sure to cast your gaze down at a thirty-degree angle. A blush comes to your cheeks of its own accord to complete the act, and you take it as a cue to return your gaze to its original position, glancing back at your imaginary partner with innocent, shy eyes, thumb still on your lips.");
			ExtendLogEvent("\n\nYou stop recording and re-watch the the performance in awe – a face like that could melt anyone’s heart! If you did this for real, they might fall for you on the spot...");
			ExtendLogEvent("\n\n(<b>Perk Gained: Innocent Allure</b> - Boosts your sexiness. After a successful tease, enemies may become slightly distracted and staggered for a brief amount time.)");
			// storing the sexiness boost in v1 and the hit-chance penalty in v2, but those numbers should probably be hard-coded, instead of stored in a flag
			pc.createPerk("Innocent Allure",5,10,0,0,"Boosts your sexiness. After a successful tease, enemies may become slightly distracted and staggered for a few rounds.");
			if(pc.exhibitionismRaw < 100)
			{
				pc.exhibitionismRaw += 5;
				if(pc.exhibitionismRaw > 100) pc.exhibitionismRaw = 100;
			}
			else pc.exhibitionism(1);
		}
		
		// *****************************************************
		// FAUX COW
		// BOVINE STUFF FROM HERE ON
		// *****************************************************
		
		// FAUX COWS: HORNY BOYS
		// 5" max horn size
		if(startHours < 77 && treatedHours >= 77 && pc.horns == 0)
		{
			AddLogEvent(ParseText("You spend a few minutes checking your forehead for horns. You should have horns, right? It feels like you should have horns. A horny [pc.boyGirl] should have horns. What about a cute cow tail, or floppy furred ears?"), "passive", treatmentHourPrint(77, startHours));
		}
		if((pc.horns == 0 || (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT) || pc.hornLength < pc.statusEffectv2("Treated")) && treatedHours >= 83)
		{
			numHornAttempts = treatedHours - Math.max(startHours, 82);
			numHornGains = 0;
			hornTimestampStride = 0;
			
			for (i = 0; i < numHornAttempts; i++)
			{
				if(rand(6) == 0) numHornGains++;
			}

			if(numHornGains > 0)
			{
				hornTimestampStride = Math.floor((treatedHours - Math.max(startHours, 82)) / numHornGains);
				
				for (i = 0; i < numHornGains; i++)
				{
					// Existing horns transform into lil bull nubs.
					if(pc.horns > 0 && (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT))
					{
						AddLogEvent("There is a crackling, rustling sound coming from above you. You look up, but nothing is there. Instead, you hear the same sound from behind you. This time, you twist around to try and identify the source, but to no avail. A minute later a piece of horn bounces off your nose on the way to the ground.\n\n<b>Your horns are breaking apart!</b> Dazedly, you feel at the crumbling totems, feeling them come apart in your fingers. Chalky dust clings to your hand, but more importantly, two little nubs remain on your head. They’re small and pointed, like little cow horns.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.horns = 2;
						pc.hornLength = .5;
						pc.hornType = GLOBAL.TYPE_BOVINE;
					}
					// Starting
					else if(pc.horns == 0 && !pc.hasStatusEffect("Horn Bumps"))
					{
						AddLogEvent("Ugh. Your head itches! Reaching up to take a scratch, you wince when you come across a painful bump on your forehead. A quick check with the Codex confirms that it’s red and irritated, though you haven’t seen a head form on the zit yet. You’ve never had such prominent acne before, and there’s a matching lump on the either side. Maybe something stung you? It could always be a pair of bug bites. Gross.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.createStatusEffect("Horn Bumps");
					}
					// Breaking Skin
					else if(pc.horns == 0)
					{
						AddLogEvent("The pain from those irritating red bumps on your forehead is getting worse and worse with each passing moment, matched by a sudden desire to scratch madly at them until you flay the skin away. You resist as long as you can, but the need to tend to the maddening itch overwhelms your subpar self-control. Besides, if something itches, why not scratch it?", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent("\n\nTo your horror, your first scratch peels away a patch of offending skin, but with it comes a sense of relief. Helpless to stop yourself, you scratch and scratch until the desire is completely gone - and a pile of discarded skin has built up before your " + pc.feet() + ".");
						ExtendLogEvent("\n\nWhat have you done to yourself!? Pulling out your Codex, you use the camera to check.");
						ExtendLogEvent(ParseText("\n\nYou tumble onto your [pc.butt] in shock. You... y-you’re... <b>you’ve got the cutest pair of horns growing out of your forehead!</b> They’re only little nubs at the moment, but there’s no way they’re done growing. You’ll probably have quite an adorable pair when all’s said and done!"));
						pc.hornType = GLOBAL.TYPE_BOVINE;
						pc.removeStatusEffect("Horn Bumps", true);
						pc.horns = 2;
						pc.hornLength = .5;
					}
					// nubs -> 1" horns
					else if(pc.hornLength < 1)
					{
						AddLogEvent("For the past few minutes, a nasty little headache has been brewing. You squeeze your eyes closed, flexing your jaw in an effort to deal with it, when it abruptly fades, vanishing in the span of a second.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent(ParseText("\n\nYou gingerly prod yourself; just what kind of headache was that? You get your answer when your fingers find what your nubs have become: cute bovine horns. They stick at least a full inch out from your [pc.skinFurScales], coming to two proud points, though their tips are rounded enough that you doubt you could do any real injury with them. You briefly consider whether you should find a way to give them a nice color once they finish coming in, or maybe get them capped with a few stylish rings instead. So many possibilities..."));
						pc.hornLength = 1;
					}
					// 1" horns to 2" horns
					else if(pc.hornLength < 2)
					{
						AddLogEvent("A wave of discomfort strikes just behind your forehead, growing worse by the second. There’s really only one thing it can be - your cute horns growing! You whip out your Codex, wincing from the sudden motion, and flick it on, getting yourself a ticket to watch the show.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						ExtendLogEvent("\n\nYour formerly one-inch horns have already pushed a little further out, perhaps a quarter inch. The longer they get, the wider their bases are becoming, and they’re growing fast enough now that you can actually see them slowly sliding out, revealing bit after bit of gleaming white ivory.");
						if(pc.hasHair() && pc.hairLength >= 2) ExtendLogEvent(" You brush your bangs to one side, hooking them around one of the horns in the cutest way.");
						ExtendLogEvent(" The process is fascinating enough for you to forget your earlier discomfort. You watch, spellbound, as your horns continue to expand, growing ever more prominent on your face until they stop at around two inches long.");
						pc.hornLength = 2;
					}
					// 2" horns to 3" horns
					else if(pc.hornLength < 3)
					{
						AddLogEvent("Your jaw clenches, a low growl escaping your throat entirely uncontrollably. There’s a powerful shifting and sliding going on in your skull. It leaves you seeing stars with your eyes half-crossed. There’s blessedly little pain, but when it passes, you’re very aware of additional weight tugging on your head. Your horns have grown: they’re now three inches of gleaming white, bovine awesomeness. You resolve to polish them at the first opportunity, maybe even get some ornamental jewelry for them.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 3;
					}
					// 3" horns to 4" horns
					else if(pc.hornLength < 4)
					{
						AddLogEvent("You feel a sense of... potential building within your head, expanding until it changes from a kind of nebulous energy into an unstoppable pressure. You feel your horns giving under the weight of it all, slowly sliding forward, expanding outward, growing heavier by the moment. You wrap your hands around them, feeling the change against your palms. When it’s all over, you’re left holding two four-inch horns that give you a playful look. Nice.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 4;
					}
					// 4" horsn to 5" horns - MAX LADIES CAN GET.
					else if(pc.hornLength < 5)
					{
						AddLogEvent("You grunt as the familiar feeling of horn growth sets in. Grabbing hold of the curved, steer-like protrusions, you give them a tug, easing more gleaming ivory into the air. The more horn you grow, the wider their stance – all the better for a hung bull or amazon to squeeze like handlebars while you suck their balls dry.", "passive", treatmentHourPrint((hornTimestampStride * i), 0));
						pc.hornLength = 5;
					}
				}
			}
		}
		
		// FAUX COW: TAILS, EARS, AND HOOVES
		if(!pc.hasCuntTail() && !pc.hasCockTail() && pc.tailType != GLOBAL.TYPE_BOVINE && startHours < 118 && treatedHours >= 118 && rand(10) < 9)
		{
			// No tail
			if(pc.tailCount <= 0)
			{
				AddLogEvent(ParseText("You go to scratch at a spot above your [pc.butt] that’s been bothering you for a few hours and jerk when you hit something that wasn’t there before - something rounded and fluffy. Pressing back carefully, you ease your fingers around the growth, discovering its furred texture and cords of muscle. The oddest part is feeling the fingers pressing on you through the fur. There’s no doubt about it - <b>you have a tail.</b>\n\nIt’s a fairly long tail with a cute little poof on the end, just like a cow’s."), "passive", treatmentHourPrint(treatedHours, startHours));
				pc.tailCount = 1;
			}
			// Multitail
			else if(pc.tailCount > 1)
			{
				// Multi - short
				if(!pc.hasTailFlag(GLOBAL.FLAG_LONG))
				{
					AddLogEvent(ParseText("Your [pc.tails] brush against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had [pc.tails], now you’ve got gently-swaying, bovine tails, complete with fuzzy puffs at the tips."), "passive", treatmentHourPrint(treatedHours, startHours));
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(ParseText(" A fine layer of [pc.furColor] fur covers each one."));
					ExtendLogEvent(" You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.");
				}
				// Multi - long
				else
				{
					AddLogEvent(ParseText("Your [pc.tails] feel increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremities alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find."), "passive", treatmentHourPrint(treatedHours, startHours));
					ExtendLogEvent("\n\n" + StringUtil.upperCase(num2Text(pc.tailCount)) + " gently swinging, bovine tails hang behind you. The tips are poofing up, just as you’d expect");
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(", and a coat of fine fur is growing out over their lengths");
					ExtendLogEvent(". In seconds, the warmth fades, leaving you with new, bovine butt ornaments. You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.");
				}
			}
			// Single - short
			else if(!pc.hasTailFlag(GLOBAL.FLAG_LONG))
			{
				AddLogEvent(ParseText("Your tail brushes against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had a [pc.tail], now you’ve got a gently-swaying, bovine tail, complete with a fuzzy puff at the tip."), "passive", treatmentHourPrint(treatedHours, startHours));
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(ParseText(" A fine layer of [pc.furColor] fur covers the whole thing."));
				ExtendLogEvent(" You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.");
			}
			// Single - long
			else
			{
				AddLogEvent(ParseText("Your [pc.tail] feels increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremity alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find."), "passive", treatmentHourPrint(treatedHours, startHours));
				ExtendLogEvent("\n\nA gently swinging, bovine tail hangs behind you. The tip is poofing up, just as you’d expect");
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) ExtendLogEvent(", and a coat of fine fur is growing out over its length");
				ExtendLogEvent(". In seconds, the warmth fades, leaving you with a new, bovine butt appendage. You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.");
			}
			pc.clearTailFlags();
			pc.tailType = GLOBAL.TYPE_BOVINE;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FURRED); // adding this because very short fur is still fur, and my real-life cows have furred tails ¯\_(ツ)_/¯
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		}
		
		// Cow ears (maybe)
		if(pc.earType != GLOBAL.TYPE_BOVINE && startHours < 115 && treatedHours >= 115 && rand(2) == 0)
		{
			AddLogEvent(ParseText("You go to scratch at one of your " + pc.earsDescript() + ", only to find it differently shaped - and in a new location - than before. Gingerly feeling it, you discover that your aural organs are soft and leathery, with a fine coat of [pc.furColor] across their outer edges. You can still hear just fine; <b>you’re just listening through a pair of floppy cow-ears now</b>. Briefly, you consider how good it would feel to have someone scratch them."), "passive", treatmentHourPrint(treatedHours, startHours));
			pc.earType = GLOBAL.TYPE_BOVINE;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_FURRED);
			pc.addEarFlag(GLOBAL.FLAG_FLOPPY);
		}
		
		// Hooves (Rarish) - requires biped minimum. No change for goo/nagaPCs
		if(pc.legCount >= 2 && pc.legType != GLOBAL.TYPE_BOVINE && startHours < 147 && treatedHours >= 147 && rand(5) == 0)
		{
			if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES))
			{
				AddLogEvent("You stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. It’s then that you spot way your " + pc.feet() + " are shifting and changing. They look like they’re staying as hooves, but they’re a little more of a brown-black color, with a split down the middle. They look like the kind of hooves a cow would have. Well, there are worse things than having a matched set of transformations. <b>You resolve to enjoy your new cow hooves.</b>", "passive", treatmentHourPrint(treatedHours, startHours));
			}
			else
			{
				AddLogEvent("You stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. You see why when you glance to your " + pc.feet() + ". They’re malformed, twisting and narrowing before your eyes. They’re pulling their disparate parts together into one unified mass, almost cylindrical in shape", "passive", treatmentHourPrint(treatedHours, startHours));
				if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))
				{
					ExtendLogEvent(", and the change isn’t limited to below the ankle either. Your calves are reshaping, placing what used to be your ankle far above your blackening feet");
				}
				else ExtendLogEvent(", and they begin to blacken, moment by moment");
				ExtendLogEvent(".\n\nThey split in half, right down the middle, growing harder by the moment, dulling your sense of touch. You dully rub them, confused at first. Realization hits you like a ton of bricks - you have hooves! Just like a cow, you’ve got hooves to clop around on while you walk. Most people don’t get hooves from the Treatment. It looks like you were one of the lucky ones. You’re going to be turning heads for sure!");
			}
			pc.clearLegFlags();
			pc.legType = GLOBAL.TYPE_BOVINE;
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
		}
		
		// FAUX COW: ANIMAL DICKS
		// Had to edit some descriptions that clashed *strongly* with the faux cow flavor
		if( pc.hasCock() && startHours < 131 && treatedHours >= 131 && rand(2) == 0 )
		{
			treatmentCockTF(treatedHours, startHours);
		} // end of animal dicks
		
	} // End of the Faux Cow section
	
	// Treatment Ends
	if(effect.minutesLeft <= 0 && effect.value1 != -1)
	{
		AddLogEvent("<b>The Treatment is over.</b> You aren’t sure why or how you know, but you know it all the same. Well, there’s nothing left to do but enjoy your enhanced body to the fullest! ...While hunting for Dad’s probes, of course. It’s the best way to meet sexy new aliens.\n\nOnce you claim your fortune, you can retire on New Texas, maybe even get your own private milker.", "passive", treatmentHourPrint(treatedHours, startHours));
		
		pc.taint(4);
		
		effect.value1 = -1;
	}
}

public function cuntsBelowWetnessThreshold(threshold:Number = 0):Number
{
	if(!pc.hasVagina()) return 0;

	var counter:int = 0;
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[0].wetness() < threshold) counter++;
	}
	return counter;
}
public function setMinimumWetness(arg:int = 0):void
{
	if(!pc.hasVagina()) return;

	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[0].wetness() < arg) pc.vaginas[0].wetnessRaw = arg;
	}
	return;
}

public function treatedVagNote(butt:Boolean = false):void
{
	// Amazons got a special version of this.
	if(pc.isAmazon() && !butt && pc.hasVagina())
	{
		AddLogEvent(ParseText("Taking something in [pc.oneVagina] has never felt so effortless, so automatic, like your vagina has been gifted with an ability to expand beyond all previous limits. You shrug and slip a finger inside, uncaring if anyone sees you, shuddering with the ease with which it vanishes into your nethers. Then you add another. And another. Four digits disappear into your greedy twat before you have to pull yourself away, barely stopping yourself from devolving into full-on fisting.\n\n[pc.EachVagina] has apparently been retooled into a greedy, capacious slot, able accept the biggest, fattest cocks without an ounce of discomfort. You suppose that such a change works in your favor - as big as you are, it only makes sense that you’d be able to fuck monster pricks with ease."), "passive");
		pc.lust(3);
	}
	if(!butt && pc.hasVagina())
	{
		AddLogEvent(ParseText("Weird. It felt really, really easy to slip something inside [pc.oneVagina]. Concerned, you decide a little vaginal exploration is in order. You press one finger at first, then another into your [pc.vagina], discovering that the third is almost as easy to add as the first two. Impressively coordinated muscles squeeze and caress your digits, but don’t impede the insertion of more in the slightest. As a matter of fact, once your fourth finger is inside, the muscles gradually pull your hand in to the wrist.\n\nThere’s no getting around it, the Treatment has retooled [pc.eachVagina] into an elastic, powerfully coordinated pleasure palace. You doubt you’ll even run into someone “too big” for you again."), "passive");
	}
	else
	{
		AddLogEvent(ParseText("Weird. It felt really, really easy to slip something inside your [pc.asshole]. Concerned, you decide a little rectal exploration is in order. You press one finger at first, then another into your ring, discovering that the third is almost as easy to add as the first two. Impressively coordinated muscles squeeze and caress your digits, but don’t impede the insertion of more in the slightest. As a matter of fact, once your fourth finger is inside, the muscles gradually pull your hand in to the wrist.\n\nThere’s no getting around it, the Treatment has retooled your butt into an elastic, powerfully coordinated pleasure palace. You doubt you’ll even run into someone “too big” for you again."), "passive");
	}
	pc.removeStatusEffect("Treatment Elasticity Report Needed");
	pc.removeStatusEffect("Treatment Elasticity Report Q'ed");
}
public function amazonEnduranceNotice():void
{
	AddLogEvent("Usually, sexual release would leave you feeling a little drained, but you’re still full of energy. It’s like cumming isn’t slowing you down at all, like your body is designed to get off with a minimum of effort so that you can keep banging until your partner’s body gives out or begins to bore you.\n\n(<b>Perk Gained: Amazonian Endurance</b> - Allows you to orgasm without fatiguing.)", "passive");
}

// Cum Highs Mechanics
// by AHornyPanda
public function cumHighUpdate(target:Creature, cumQ:Number = 0, addLog:Boolean = true):void
{
	if(target == null) return;
	
	// The player can get a stronger "cum high" if they take in more cum while at a lower stage. They cannot go back down though.
	// The player cannot get cum high again for 48 hours, regardless of the effect strength.
	// The status icon is the same as the alcohol one but pink.
	
	if(target.hasStatusEffect("Cum High Cooldown")) return;
	
	var msg:String = "";
	var fluidMLs:Number = (cumQ > 0 ? cumQ : target.cumFlationAmount());
	if(fluidMLs < 3000) return;
	
	// Status Effect: "Cum High"
	// v1: + max energy
	// v2: + reflexes
	// v3: + intelligence
	// v4: + willpower
	target.createStatusEffect("Cum High", 0, 0, 0, 0, false, "Icon_DizzyDrunk", "", false, 0, 0xFF69B4);
	
	var effect:StorageClass = target.getStatusEffect("Cum High");
	
	// Stage 1
	if(fluidMLs >= 3000 && effect.value1 < 10)
	{
		if(addLog)
		{
			if(target is PlayerCharacter) msg += "You feel relaxed and a little woozy. This is definitely your body must be reacting to the cum inside you. <b>You are now a little cum high.</b>";
		}
		effect.value1 = 10;
		effect.value2 = -1;
		effect.value3 = -1;
		effect.value4 = -1;
	}
	// Stage 2
	else if(fluidMLs >= 6000 && effect.value1 < 20)
	{
		if(addLog)
		{
			if(target is PlayerCharacter) msg += "Most of your worries and concerns fade from your mind and you start to giggle at the silliest of things. Although your movements are not as swift and focusing is a little hard, you feel a lot more energetic. There is no doubt this is the result of being of full of cum. <b>You are now cum high.</b>";
		}
		effect.value1 = 20;
		effect.value2 = -2;
		effect.value3 = -2;
		effect.value4 = -2;
	}
	// Stage 3
	else if(fluidMLs >= 12000 && effect.value1 < 30)
	{
		if(addLog)
		{
			var filledHoles:int = 0;
			if(target.statusEffectv1("Anally-Filled") > 0) filledHoles++;
			if(target.statusEffectv1("Vaginally-Filled") > 0) filledHoles++;
			if(target.statusEffectv1("Orally-Filled") > 0) filledHoles++;
			if(target is PlayerCharacter) msg += "All of your worries and concerns dissipate and get replaced by happy thoughts. Smiling and laughing is like your base state of mind. Your movements and thoughts are very slow and relaxed but you feel much more energetic nonetheless. All that cum stuffing your hole" + (filledHoles == 1 ? "" : "s") + " must be starting to have an effect on you. <b>You are now very cum high.</b>";
		}
		effect.value1 = 30;
		effect.value2 = -3;
		effect.value3 = -3;
		effect.value4 = -3;
	}
	
	effect.tooltip = (target is PlayerCharacter ? "You get high on the cum inside you!\n\nYou feel energetic but your thoughts and movements are relaxed. It is also harder to resist indulging yourself." : "High on cum!") + "\n\n" + StringUtil.printPlusMinus(effect.value1) + " Max Energy\n" + StringUtil.printPlusMinus(effect.value2) + " Reflexes\n" + StringUtil.printPlusMinus(effect.value3) + " Intelligence\n" + StringUtil.printPlusMinus(effect.value4) + " Willpower";
	
	effect.minutesLeft += 480;
	if(effect.minutesLeft > 1440) effect.minutesLeft = 1440;
	
	if(addLog && msg != "") AddLogEvent(msg, "passive");
}

// Lusty Afterglow Mechanics
public function lustyAfterglowUpdate(target:Creature, cumQ:Number = 0):void
{
	if(target == null) return;
	
	// every time you get cumfilled, you regain random 3~9 energy.
	target.energy(5 + Math.max(Math.round(cumQ/1000), (3 + rand(7))));
}

// if(pc.hasStatusEffect("Treatment Exhibitionism Gain 4 DickGirls") && pc.hasCock())
public function treatmentCumCowExhibitionism():void
{
	AddLogEvent("You’re getting lots of looks as you walk around, and not just because of your lovely boobs. No, most of the curious looks are centered at your crotch.", "passive");
	if(!pc.isCrotchExposed()) 
	{
		ExtendLogEvent(ParseText(" There’s no hiding your [pc.cocks], not with how long "));
		if(pc.cockTotal() == 1) ExtendLogEvent("it is");
		else ExtendLogEvent("they are");
		ExtendLogEvent(ParseText(", even flaccid. You’re a [pc.boyGirl] with a third leg"));
		if(pc.cockTotal() > 1)
		{
			ExtendLogEvent(" and fourth");
			if(pc.cockTotal() > 2) ExtendLogEvent("... and fifth...");
		}
		ExtendLogEvent(".");
	}
	else
	{
		ExtendLogEvent(ParseText(" There’s no hiding your [pc.cocks] anymore, not with how big "));
		if(pc.cockTotal() == 1) ExtendLogEvent("it stays");
		else ExtendLogEvent("they stay");
		ExtendLogEvent(" even flaccid. You’ve got bulky penis");
		if(pc.cockTotal() > 1) ExtendLogEvent("es");
		ExtendLogEvent(", and no amount of clothing can hide the pent-up virility from questioning onlookers.");
	}
	ExtendLogEvent(" It wouldn’t be so bad if it didn’t send a shiver up your spine or warm your loins.");
	ExtendLogEvent(ParseText("\n\nIt’s a vicious cycle, really. People see that you’re a cow-[pc.boyGirl] with a lot going on down below, and it turns you on, so your equipment gets even bigger and more obvious. Then still more eyes glue themselves to your equipment, and it’s everything you can do to keep from wrapping your hands around your [pc.cocks] and moaning, letting the high-pitched cries of your voice lure more onlookers to watch your impromptu show."));
	ExtendLogEvent("\n\nF-fuck, you’re starting to drool. You’d better go blow off some steam before that fantasy becomes a reality! <b>You suppose you’re an exhibitionist now.</b>");
	// Instantly exhibitionist.
	if(pc.exhibitionismRaw < 100) pc.exhibitionismRaw = 100;
	pc.removeStatusEffect("Treatment Exhibitionism Gain 4 DickGirls");
}

// Proc auto-autofellate, then play the following message
// "Auto-Autofellatio"
public function autoautofellatioNotice():void
{
	AddLogEvent(ParseText("It’s super weird that you would just suck yourself off without thinking about it, but then again, looking at your dick or even thinking about it too much makes your head feel sort of fuzzy and silly, like your dick is so awesome it can hypnotize you just by being there. You spend a few minutes imagining it bobbing back and forth to your heartbeat, then shake your head and smile, savoring the residual taste of [pc.cum] on your tonsils."), "passive");
	if(pc.perkv1("Auto-Autofellatio") == 0)
	{
		ExtendLogEvent(ParseText("\n\n(<b>Perk Gained: Auto-Autofellatio</b> - Makes it difficult to avoid fellating yourself.)"));
		if(!pc.hasPerk("Auto-Autofellatio")) pc.createPerk("Auto-Autofellatio",0,0,0,0,"You’re so enamored with yourself that you can’t resist a little self-love.");
	}
}

public function dumb4CumReset():void
{
	if(pc.hasStatusEffect("Dumb4CumNotice"))
	{
		AddLogEvent(ParseText("Now that you’ve swallowed all that goo, you feel positively quick-witted and exceptionally lucid, like the spunky flavor somehow greased the workings of your brain to let you think clearly once more. Not that you couldn’t go for a hot dicking at the drop of a hat, but for some reason you’re able to think completely clearly and rationally about how perfectly arousing it could be. And you bet you could calculate the coordinates for a light drive jump mid-coitus, so there’s that."), "passive");
		ExtendLogEvent(ParseText("\n\nYou estimate that you’ve gotten the “<b>Dumb4Cum</b>” Treatment modification, a variant that allows you periods of extreme clearheadedness and boosted intellect in the 24 hours after drinking cum at the expense of reduced intelligence during periods of withdrawl."));
		pc.removeStatusEffect("Dumb4CumNotice");
	}
	else if(pc.perkv1("Dumb4Cum") != 0)
	{
		AddLogEvent(ParseText("With the warm feeling of reproductive juices in your body, you find you’re able to think clearly once more."), "passive");
	}
	pc.setPerkValue("Dumb4Cum",1,0);
	// Regain lost intellience
	if(pc.perkv2("Dumb4Cum") > 0)
	{
		pc.intelligence(pc.perkv2("Dumb4Cum"));
		pc.setPerkValue("Dumb4Cum",2,0);
		pc.setPerkValue("Dumb4Cum",3,0);
	}
	
	// Ditz Speech Removal
	// Dr. Badger bimbofication and Dumbfuck sneezes are permanent though...
	if(pc.hasPerk("Ditz Speech") && canRemoveDitzSpeech())
	{
		ExtendLogEvent("\n\n(<b>Perk Lost: Ditz Speech</b>)");
		pc.removePerk("Ditz Speech");
	}
}
public function canRemoveDitzSpeech():Boolean
{
	// Bimbofication permanence
	if(flags["DR_BADGER_BIMBOED_PC"] != undefined) return false;
	if(flags["MITZI_BIMBOED_PC"] != undefined) return false;
	if(flags["DUMBFUCK_SNEEZES"] != undefined && flags["DUMBFUCK_SNEEZES"] >= 20) return false;
	return true;
}

public function dumb4CumUpdate(totalHours:int):void
{
	var effect:StorageClass = (pc as PlayerCharacter).getPerkEffect("Dumb4Cum");
	
	// Pool intelligence into a reserve...
	if(effect.value1 >= 24)
	{
		if (effect.value2 < effect.value3)
		{
			// Clamp up to v3
			effect.value2 = Math.min(effect.value2 + totalHours, effect.value3);
		}
	}
	effect.value1 += totalHours;
	var tics:Number = effect.value1;
	
	if(tics == 24)
	{
		AddLogEvent(ParseText("You lick your lips, vividly imagining what cum would taste like on your tongue. You shake your head, feeling a little absentminded, and go on your way."), "passive");
		// Just in case:
		pc.intelligence();
	}
	else if(tics == 30)
	{
		AddLogEvent(ParseText("You thoughtlessly chew on your [pc.lipChaste], for a moment forgetting whatever it was you were thinking of. In the brief, empty interrim, a vague echo of the flavor of cum takes its place. You could go for a snack..."), "passive");
	}	
	else if(tics == 40)
	{
		AddLogEvent(ParseText("Uh, it’s, like, getting super hard <i>not</i> to think about cum. Like one minute you’re all focusing on something, and the next you can’t stop fantasizing about shoveling gobs of the stuff into your lips. You’d probably fuck or suck just about anything right now."), "passive");
	}
	else if(tics == 48)
	{
		AddLogEvent(ParseText("You can’t seem to go more than a minute without thinking of getting fucked or sucking someone off. When you close your eyes, all you can think about is penises. When someone asks you a question, you have to pause for a few seconds, dragging your thoughts through a melange of pink-tinged fucking. <b>You need some cum.</b>"), "passive");
	}
	else if(tics > 60 && tics % 12 == 0)
	{
		AddLogEvent(ParseText("You can’t seem to go more than a minute without thinking of getting fucked or sucking someone off. When you close your eyes, all you can think about is penises. When someone asks you a question, you have to pause for a few seconds, dragging your thoughts through a melange of pink-tinged fucking. <b>You need some cum.</b>"), "passive");
	}
	
	// Ditz Speech Add-on
	if(tics >= 40 && !pc.hasPerk("Ditz Speech"))
	{
		ExtendLogEvent("\n\n(<b>Perk Gained: Ditz Speech</b> - You will now sound like a total bimbo in scenes that support it.)");
		pc.createPerk("Ditz Speech",0,0,0,0,"Alters dialogue in certain scenes.");
	}
}

// Rare arousing rest proc - more common if cock exposed
public function autoCocknosisDistraction():void
{
	var eBuffer:String = "";
	eBuffer += "While resting, ";
	if(pc.isCrotchExposed()) eBuffer += ParseText("you find your gaze drawn down to your [pc.cockBiggest].");
	else eBuffer += ParseText("you realize that you’ve freed your [pc.cockBiggest] from your [pc.lowerGarment] but have a hard time convincing yourself to put it away.");
	eBuffer += " It’s certainly more entertaining to watch than everything going on around you.";

	eBuffer += "\n\nLike a snake-charmer’s pet, it seems to respond to your gaze, twitching lightly, shifting to lie against your other thigh. It lazily lengthens, straightening folds of flesh into a column, and you watch, spellbound, too hypnotized by the view of your own member to do anything about it. The base shifts powerfully, arcing upward before the rest of it, dragging the flaccid snake inevitably towards the sky. You can see the rhythms in its pulsations now, the obvious throbbing of the veins. It’s thickening as it rises.";
	eBuffer += ParseText("\n\nYour [pc.tongue] slips out of your mouth while you watch, moist with drool, and still your [pc.cockBiggest] engorges further. It straightens out as it rises until it transforms into a firm column of needy cockmeat, slowly bobbing back and forth in front of your eyes. It dribbles, releasing pearlescent globs of pre-cum. The glittering juices only further serve to deepen your dick-induced trance, helping you ignore everything that isn’t the pleasant, rhythmic pulsing of your own boner.");
	eBuffer += ParseText("\n\nHours pass by in a blur. When something finally distracts you, your lips are chapped and your [pc.cocks] ache");
	if(pc.cockTotal() == 1) eBuffer += "s";
	eBuffer += ".";
	if(pc.hasVagina()) eBuffer += " The ground below is absolutely soaked in your pussy juices.";
	eBuffer += ParseText(" You’re as pent up as you’ve ever been, like your body spent the entire time doing nothing but turning you on and brewing ever more [pc.cum] in your [pc.balls].");
	// Give full cum + blue balls + Lots of lust
	if(!pc.hasStatusEffect("Blue Balls")) pc.applyBlueBalls();
	output(eBuffer);
}

public function standardTreatmentDickStuff(treatedHours:Number, startHours:Number):void
{
	var x:int = 0;
	
	// Bigger Dick (+2 to 8 inches normally)
	// At least one expansion regardless of max. EVERYBODY gets a bigger dick.
	
	// Okay this is getting reworked somewhat. For the non-amazon changes, every change is entirely unique, so we'll just slam them in to the initial
	// determination of what we're doing rather than double-nesting teh same effective check
	
	if (pc.hasCock() && pc.statusEffectv3("Treated") > 0)
	{
		var numGains:int = 0;
		var baseGainTime:int = 0;
		if (pc.isAmazon())
		{
			if (startHours < 132 && treatedHours >= 132)
			{
				numGains++;
				if (baseGainTime == 0) baseGainTime = 1;
			}
			if (startHours < 138 && treatedHours >= 138)
			{
				numGains++;
				if (baseGainTime == 0) baseGainTime = 2;
			}
			if (startHours < 150 && treatedHours >= 150)
			{
				numGains++;
				if (baseGainTime == 0) baseGainTime = 3;
			}
			if (startHours < 162 && treatedHours >= 162)
			{
				numGains++;
				if (baseGainTime == 0) baseGainTime = 4;
			}
			
			if (numGains > 0)
			{
				var cockGainTimes:Array = [132, 138, 150, 162];
				
				for (var i:int = 0; i < numGains; i++)
				{
					AddLogEvent(" Your " + pc.cocksDescript() + " ", "passive", treatmentHourPrint(cockGainTimes[baseGainTime - 1], startHours));
					if(pc.cockTotal() == 1) ExtendLogEvent("is");
					else ExtendLogEvent("are");
					ExtendLogEvent(" swinging wider and wider these days, a fact that warms your breast with no small amount of pride. Even now, without you bothering ");
					if(pc.cockTotal() == 1) ExtendLogEvent("it");
					else ExtendLogEvent("them");
					ExtendLogEvent(", you can feel the pleasant buzz of hormones marinating your dick");
					if(pc.cockTotal() > 1) ExtendLogEvent("s");
					ExtendLogEvent(", telling your cells to build inch after inch of new, cunt-filling dick. Speaking of gaining inches - you’ve probably added another. No matter how many times you discover your heightened ");
					if(pc.isAmazon() && pc.hasVagina()) ExtendLogEvent("herm");
					else ExtendLogEvent("man");
					ExtendLogEvent("hood, it never gets old.");
					pc.lust(3);
					for(x = 0; x < pc.totalCocks(); x++)
					{
						if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
						else pc.cocks[x].cLengthRaw += 2;
					}
					pc.addStatusValue("Treated", 3, -1);
					
					if(pc.statusEffectv3("Treated") <= 0)
					{
						ExtendLogEvent("The lingering tingle and buzz that has highlighted the constant expansion of your " + pc.cocksDescript() + " fades away. <b>Your manhood");
						if(pc.cockTotal() > 1) ExtendLogEvent("s");
						ExtendLogEvent(" won’t be getting any bigger, at least not from the treatment.</b>");
						break;
					}
				}
			}
		}
		else
		{
			if (startHours < 51 && treatedHours >= 51)
			{
				// Pants on!
				if(pc.isCrotchGarbed())
				{
					AddLogEvent(ParseText("You feel a growing tightness in your [pc.lowerGarment] that’s anything but comfortable. It’s the kind of tightness that demands your attention - the kind that happens when you’re sporting a hard-on that could chop wood. You shift your ") + pc.cocksDescript() + " around a few times before giving up and pulling ", "passive", treatmentHourPrint(51, startHours));
					if(pc.cockTotal() == 1) ExtendLogEvent("it");
					else ExtendLogEvent("them");
					ExtendLogEvent(" out.");
					ExtendLogEvent("\n\nAs expected, you’re as rigid as a titanium girder, but that doesn’t entirely explain your predicament. You’re longer too, by at least an inch, and proportionally thicker. In disbelief over your good fortune, you slowly stroke " + pc.oneCock() + ", feeling it firm and plump up even bigger in your palm. The " + pc.cockHead() + " slips past your fingers and abruptly ejaculates, growing all the while. You furiously beat your meat throughout, not stopping until you’re standing in a puddle of your own goo");
					if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) ExtendLogEvent(" and trying to play it off nonchalantly. Hopefully no one will care");
					ExtendLogEvent(".");
					
					ExtendLogEvent("\n\nYour prong");
					if(pc.cockTotal() > 1) ExtendLogEvent("s are");
					else ExtendLogEvent(" is");
					ExtendLogEvent(" at least two inches longer than before you took the Treatment and likely to get even bigger before it’s all over. You’ll just have to be careful that your " + pc.cocksDescript() + ParseText(" don’t rip your [pc.lowerGarments] off the next time you get hard."));
				}
				// Pants Off!
				else
				{
					AddLogEvent("Your " + pc.cocksDescript() + " ", "passive", treatmentHourPrint(51, startHours));
					if(pc.cockTotal() == 1) ExtendLogEvent("is");
					else ExtendLogEvent("are");
					ExtendLogEvent(" getting awfully uncomfortable all of a sudden. You grab " + pc.oneCock() + " and give it a little squeeze just to make sure everything is alright. It feels as hard as a titanium girder and somehow... tight. There’s not really any other word to describe it; it’s almost like your dick is getting too big for the " + pc.cocks[0].cockColor + " skin it’s wrapped in. You rub it a few times, just enjoying the friction while you’ve already got it in hand, feeling it thickening by the second.");
					ExtendLogEvent("\n\nWait, weren’t you already at full mast? You look down in awe, watching your " + pc.cockHead() + " slip through your fingers.");
					if(pc.hasSheath(0)) ExtendLogEvent(" You swear you can even see the fresh length pouring out of your sheath, as if there’s just an infinite supply of dick down there to push out.");
					ExtendLogEvent(" Bullets of pre roll across your knuckles as you squeeze them out, watching your dick");
					if(pc.cockTotal() > 1) ExtendLogEvent("s");
					ExtendLogEvent(" lengthen the whole time.");

					ExtendLogEvent(ParseText("\n\nYour heartbeat hammers at your eardrums faster and faster. Your breath comes quicker. You couldn’t stop yourself if you wanted to, and you don’t. You don’t ever want this moment to stop. You " + pc.cockHead() + " lurches, and you’re cumming, spraying a puddle of [pc.cum] all over the ground in front of you"));
					if (InPublicSpace()) ExtendLogEvent(" to the dismay of the onlookers");
					ExtendLogEvent(". Jacking for all you’re worth, you milk every drop from your growing dick. It isn’t until it’s all over that the magnitude of what just happened sinks in.");
					ExtendLogEvent("\n\nThe Treatment made your " + pc.cocksDescript() + " grow bigger - a full two inches bigger, by your measurements. It might not be done either. There’s still a pleasant, lingering tingle in your groin, and it’s not the normal post-orgasmic one.");
					if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) ExtendLogEvent(" You should probably move on before someone takes issue with the lewd display.");
				}
				// orgasm, +2 dicklength for everybody across the board.
				pc.orgasm();
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 2;
					else pc.cocks[x].cLengthRaw += 3;
				}
				pc.addStatusValue("Treated",3,-2);
			}
			if (startHours < 60 && treatedHours >= 60)
			{
				AddLogEvent("You grin when you realize how heavy the swaying length", "passive", treatmentHourPrint(60, startHours));
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				if(pc.legCount > 1) ExtendLogEvent(ParseText(" between your [pc.legs]"));
				else ExtendLogEvent(" dangling from your crotch");
				if(pc.cockTotal() == 1) ExtendLogEvent(" has");
				else ExtendLogEvent(" have");
				ExtendLogEvent(" become.");
				if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" You yank open your [pc.lowerGarment] check it out."));
				else ExtendLogEvent(" You figure a little self-examination won’t hurt.");
				ExtendLogEvent(" Grabbing hold of " + pc.oneCock() + ParseText(", you decide that you’ll be sure not to get as excited as last time. Better to save the [pc.cumNoun] for someone who really wants it. Easy does it."));

				if(pc.lust() < 70) ExtendLogEvent("\n\nYou stroke cautiously until you reach your full size, then try to eyeball a measurement.");
				else ExtendLogEvent("\n\nYou stroke a few times just to make sure you’ve reached your full size, but as horny as you are, you probably didn’t even have to touch the thing.");
				ExtendLogEvent(" Damn, it’s at least an inch longer.");
				if(pc.cockTotal() > 1) 
				{
					if(pc.cockTotal() == 2) ExtendLogEvent(" The other one is bigger too");
					else ExtendLogEvent("The other ones are bigger too");
					ExtendLogEvent(", though growing faster to catch up to the main event.");
					ExtendLogEvent(" You pump a few more times, savoring the warmth and heat that it brings to your body, then release yourself with a sigh.");
				}
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
				pc.lust(5);
			}
			if (startHours < 66 && treatedHours >= 66)
			{
				AddLogEvent("Fuck yes, your " + pc.cocksDescript() + " ", "passive", treatmentHourPrint(66, startHours));
				if(pc.cockTotal() == 1) ExtendLogEvent("is");
				else ExtendLogEvent("are");
				ExtendLogEvent(" still growing. There’s no way you were this big a few hours ago.");
				if(pc.isCrotchGarbed()) 
				{
					ExtendLogEvent(ParseText(" The bulge in your [pc.lowerGarments] is getting more and more noticeable, but that’s just fine, you figure. "));
					if(pc.isAmazon()) ExtendLogEvent("Maybe before long you can cock-shame a blushing faux cow.");
					else ExtendLogEvent("Maybe you’ll get to catch a girl giving it a look.");
					ExtendLogEvent(" The image of a blushing, nervous smile makes your " + pc.cocksDescript() + " jump.");
				}
				else 
				{
					ExtendLogEvent(" The dangling length");
					if(pc.cockTotal() > 1) ExtendLogEvent("s");
					ExtendLogEvent(" of meat sway");
					if(pc.cockTotal() == 1) ExtendLogEvent("s");
					ExtendLogEvent(" heavily with every step. You wonder if you’ll catch anyone checking you out during your travels. The thought of a few giggling cow-girls sneaking glances at your crotch as you walk has you doing a lot less dangling and a lot more jutting straight forward. You’ll have to be careful turning corners.");
				}
				// +20 lust
				pc.lust(20);
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
			}
			if (startHours < 83 && treatedHours >= 83)
			{
				// Pants!
				if(pc.isCrotchGarbed())
				{
					AddLogEvent(ParseText("Your can barely fit in your [pc.lowerGarments] anymore. Even soft, your ") + pc.cocksDescript() + " ", "passive", treatmentHourPrint(83, startHours));
					if(pc.cockTotal() == 1) ExtendLogEvent("is");
					else ExtendLogEvent("are");
					ExtendLogEvent(" straining against the equipped restraints, feeling trapped no matter how elastic ");
					if(pc.cockTotal() == 1) ExtendLogEvent("its");
					else ExtendLogEvent("their");
					ExtendLogEvent(" confinement. It wouldn’t be so bad if you weren’t spending so much time turned on and ready to blow. You’ve gotta be at least an inch longer now");
					if(pc.cockTotal() == 2) ExtendLogEvent(", and your other wang is even longer, trying to catch up");
					else if(pc.cockTotal() > 2) ExtendLogEvent(", and your other wangs have grown even more, still trying to catch up");
					ExtendLogEvent(".");
				}
				// NoPantz
				else
				{
					AddLogEvent("You can barely go ten minutes without having to stop and appreciate your expanding manhood", "passive", treatmentHourPrint(83, startHours));
					if(pc.cockTotal() > 1) ExtendLogEvent("s");
					ExtendLogEvent(". It’s one thing to read in clinical detail about how your penis might get bigger. It’s another to hold it in your hand, feeling it snake out to new lengths, surging on tides of artificially-created hormones and busy microsurgeons. A part of you wishes this could go on forever, even if it meant immobilizing yourself under the weight of your own phall");
					if(pc.cockTotal() > 1) ExtendLogEvent("i");
					else ExtendLogEvent("us");
					ExtendLogEvent(".");
					ExtendLogEvent("\n\nBy your estimate, you’re about an inch longer than you were at your last measurement");
					if(pc.cockTotal() == 2) ExtendLogEvent(", and your spare dick is catching up fast");
					else if(pc.cockTotal() > 2) ExtendLogEvent(", and your spare dicks are catching up fast");
					ExtendLogEvent(".");
				}
				// +10 lust
				pc.lust(10);
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
			}
			if (startHours < 100 && treatedHours >= 100)
			{
				AddLogEvent("Your " + pc.cocksDescript() + " surge", "passive", treatmentHourPrint(100, startHours));
				if(pc.cockTotal() == 1) ExtendLogEvent("s");
				ExtendLogEvent(" forward out of the blue");
				if(pc.armor.shortName != "") ExtendLogEvent(ParseText(", snaking down the inside of your [pc.armor]"));
				else ExtendLogEvent(ParseText(", threatening to tear your [pc.underGarment] from your frame"));
				ExtendLogEvent(", gorging on ");
				if(pc.cockTotal() == 1) ExtendLogEvent("its");
				else ExtendLogEvent("their");
				ExtendLogEvent(ParseText(" own tumescent potential until you feel more dick than [pc.man]. There’s no resisting it. All you can do is ride the waves of bliss as you shoot [pc.cumVisc] ropes of [pc.cumNoun]"));
				if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" down the inside of your [pc.lowerGarment], moaning all the while."));
				else ExtendLogEvent(" across the ground in front of you, moaning all the while.");
				ExtendLogEvent("\n\nWhen it’s all over, you realize that you’re at least an inch longer, maybe more.");
				// Cum!
				pc.orgasm();
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
			}
			if (startHours < 125 && treatedHours >= 125)
			{
				AddLogEvent("You’re sure you’ve been growing all day, but you want more. Grabbing hold of " + pc.oneCock() + ", you sit there, idly tugging at it, enjoying the play of your elastic flesh as it lengthens in response to your ministrations. All the pulling has you hard in the span of a few minutes, rendering the tugging pretty pointless. Of course, you’re even bigger than the last time you took stock of yourself.", "passive", treatmentHourPrint(125, startHours));
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
				ExtendLogEvent("\n\nYour " + pc.cockDescript(pc.biggestCockIndex()) + " is a proud " + num2Text(Math.round(pc.biggestCockLength())) + " inches now");
				if(pc.cockTotal() == 2) ExtendLogEvent(", and your other isn’t far behind");
				else if(pc.cockTotal() > 2) ExtendLogEvent(", and your others aren’t far behind");
				ExtendLogEvent(".");
				pc.lust(10);
			}
			if(pc.statusEffectv3("Treated") <= 0)
			{
				ExtendLogEvent("The lingering tingle and buzz that has highlighted the constant expansion of your " + pc.cocksDescript() + " fades away. <b>Your manhood");
				if(pc.cockTotal() > 1) ExtendLogEvent("s");
				ExtendLogEvent(" won’t be getting any bigger, at least not from the treatment.</b>");
			}
		}
	}
	
	// Animal Dicks: Horse, Dog, Cat, maybe one with multiple type qualities
	// 80% chance of animal type conversion. Of that 80%, 50% of the time it’s forced on all members.
	if(pc.hasCock() && (
		(!pc.isAmazon() && startHours < 105 && treatedHours >= 105 && rand(10) <= 7) ||
		(pc.isAmazon() && startHours < 159 && treatedHours >= 159 && rand(2) == 0)
	))
	{
		treatmentCockTF(treatedHours, startHours);
	}
}
public function treatmentCockTF(treatedHours:Number, startHours:Number):void
{
	var x:int = 0;
	
	// Pick type to change to.
	var chosenDickType:int = rand(5);
	// Convert to proper values
	switch(chosenDickType)
	{
		case 0:
		case 1:
			chosenDickType = GLOBAL.TYPE_EQUINE;
			break;
		case 2:
		case 3:
			chosenDickType = GLOBAL.TYPE_CANINE;
			break;
		case 4:
			chosenDickType = GLOBAL.TYPE_FELINE;
			break;
	}
	var changeAllDicks:Boolean = false;
	
	// Points to the chosen cock.
	var targetDick:int = 0;

	// This will go true if everything is already the appropriate type.
	var unchanged:Boolean = false;

	// Set the dick that's getting TFed.
	if(pc.cockTotal() == 1) targetDick = 0;
	else
	{
		targetDick = -1;
		// Loop through
		for(x = 0; x < pc.cockTotal(); x++)
		{
			// First appropriate dick gets picked.
			if(targetDick == -1 && chosenDickType != pc.cocks[x].cType) targetDick = x;
			// Turn on alldickTF if more than 1 need 50% of the time.
			if(x != targetDick && targetDick >= 0 && chosenDickType != pc.cocks[x].cType) changeAllDicks = (rand(2) == 0 ? true : false);
		}
		// If failed, set target to 0. Will get caught in cleanup and "unchanged" set to true to disable TF
		if(targetDick == -1) targetDick = 0;
	}
	// DISABLE IF EVERYTHING IS ALREADY THE RIGHT TYPE
	if(pc.cocks[targetDick].cType == chosenDickType) unchanged = true;
	
	var isAmazon:Boolean = pc.isAmazon();
	var isFauxCow:Boolean = pc.isFauxCow();
	
	if(!unchanged)
	{
		// Hoarse Cawk
		if(chosenDickType == GLOBAL.TYPE_EQUINE)
		{
			// Single cock transform!
			if(!changeAllDicks)
			{
				AddLogEvent("Feeling a little light-headed, you find yourself a seat just in time to notice", "passive", treatmentHourPrint((isAmazon ? 159 : 105), startHours));
				if(!pc.hasSheath(targetDick))
				{
					ExtendLogEvent(" an odd pinching feeling coming from your " + pc.cockDescript(targetDick) + ". Obviously concerned, you");
					if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" remove your [pc.lowerGarments] for a better look"));
					else ExtendLogEvent(" take a look");
					ExtendLogEvent(". Something weird is happening - right around the base, the " + pc.cocks[targetDick].cockColor + " skin is bunching up into folds");
					if(pc.cocks[targetDick].cockColor != "black") ExtendLogEvent(" and darkening to an almost glossy " + (!isFauxCow ? "black" : "tone"));
					ExtendLogEvent(". There’s little to no pain, but your prick does seem to be slowly vanishing into the thickly folded skin with every passing second. Never mind that it’s thickening as it withdraws, your cock is vanishing into some kind of musky-smelling sheath!\n\n");
				}
				else 
				{
					ExtendLogEvent(" your " + pc.cockDescript(targetDick) + " vanishing entirely into your");
					if(pc.cocks[targetDick].cockColor != "black") ExtendLogEvent(" rapidly darkening");
					ExtendLogEvent(" sheath!");
				}
				ExtendLogEvent(" You probe the still-sensitive bundle of flesh with a fingertip and nearly moan in delight when you come in contact with a ");
				if(pc.cocks[targetDick].hasFlag(GLOBAL.FLAG_BLUNT)) ExtendLogEvent("newly-");
				ExtendLogEvent("blunted and extraordinarily sensitive head. The");
				var tempColor:String = "mottled";
				if(rand(2) == 0) tempColor = "black";
				ExtendLogEvent(" " + tempColor + " length reacts by lurching out, surging into your fingers like an animal seeking attention, and it feels too good not to indulge it. You wrap your hand around the equine length and stroke, feeling it expand in the palm of your hand.");
				var nubbed:Boolean = false;
				if(rand(4) == 0) nubbed = true;
				if(nubbed) ExtendLogEvent(" Sensitive nubs cover the whole of it, but you don’t have time to consider the strange mutation or how good it feels.");
				ExtendLogEvent(ParseText(" Droplets of your [pc.cum] roll out of your flaring head one after another, filling the air with the telltale scent of your own ecstasy."));
				ExtendLogEvent(ParseText("\n\nLooking down, you realize you’re holding a rigid, cum-drooling horse-cock that’s bigger than your old dick ever was in your hand and cum, finally shooting the long lances of [pc.cumNoun] that you’ve felt coming since your oddly powerful erection."));
				var knotted:Boolean = false;
				if(rand(4) == 0) knotted = true;
				if(knotted) ExtendLogEvent(" Each spurt comes bigger and thicker than the one behind it, and when your hand slides down to squeeze a newly-formed, canine knot, your mind buckles.");
				ExtendLogEvent(ParseText(" You fall back, splattering yourself with your [pc.cumColor] love again and again. Your cockhead has flared cartoonishly wide; you battle with an urge to whinny in delight as the eruptions coat your [pc.chest]."));
				ExtendLogEvent(ParseText("\n\nThe orgasm does eventually end, leaving a residual euphoria and a thorough layer of [pc.cum] in its wake."));
				if(knotted) 
				{
					ExtendLogEvent(" The knot doesn’t shrink down for at least five minutes after. Had you been balls-deep in a");
					if(isFauxCow) ExtendLogEvent("n amazon, she would’ve had to sit there and let you fill her.");
					else if(isAmazon) ExtendLogEvent(" faux-cow, he would’ve had to sit there and let you fill him.");
					else ExtendLogEvent(" bitch, she would’ve had to sit there and let you fill her.");
				}
				ExtendLogEvent(" <b>You’ll need to get used to having a ");
				if(knotted) ExtendLogEvent("knotted ");
				if(knotted && nubbed) ExtendLogEvent("and ");
				if(nubbed) ExtendLogEvent("nubby ");
				ExtendLogEvent("horse-cock.</b>");
				
				
				ExtendLogEvent(" <b>You’ll need to get used to having a");
				if(knotted) ExtendLogEvent(" knotted");
				if(knotted && nubbed) ExtendLogEvent(" and");
				if(nubbed) ExtendLogEvent(" nubby");
				ExtendLogEvent(" horse-cock.</b>");

				// +5 inches. increase cum volume and such slightly.
				pc.cocks[targetDick].cLength(5);
				pc.shiftCock(targetDick, chosenDickType);
				if(tempColor != "mottled")
				{
					if(rand(2) == 0) pc.cocks[targetDick].cockColor = "black";
					else pc.cocks[targetDick].cockColor = "pink";
				}
				else pc.cocks[targetDick].cockColor = "mottled pink and black";
				if(knotted) 
				{
					pc.cocks[targetDick].addFlag(GLOBAL.FLAG_KNOTTED);
					pc.cocks[targetDick].knotMultiplier = 1.5;
				}
				if(nubbed) pc.cocks[targetDick].addFlag(GLOBAL.FLAG_NUBBY);
				// Cum
				pc.orgasm();
				pc.boostCum(3);
			}
			// Dubstep+ cawk transform!
			else
			{
				AddLogEvent(ParseText("Feeling more than a little light-headed, you drop to the ground before your [pc.legOrLegs] do"), "passive", treatmentHourPrint((isAmazon ? 159 : 105), startHours));
				if(pc.legCount == 1) ExtendLogEvent("es");
				ExtendLogEvent(". A strange pinching feeling is overwhelming your " + pc.cocksDescript() + ". You");
				if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(" pull your [pc.lowerGarments] down for a look"));
				else ExtendLogEvent(" look down");
				ExtendLogEvent(", discovering with some shock that your phalli are withdrawing");
				if(pc.hasSheath(targetDick) && pc.totalSheaths() > 1) ExtendLogEvent(" completely into their sheaths until you can’t even make out their " + pc.cockHeads() + ".");
				else 
				{
					ExtendLogEvent(" into themselves, leaving the " + pc.cocks[targetDick].cockColor + " skin to bunch up around their bases. As you watch, the flesh darkens to a glistening black. You can practically taste the muskiness pouring off the mutating dickskin. No matter when you do, they vanish into what can only be described as rather equine-looking sheaths.");
				}
				ExtendLogEvent("\n\nYou can’t just sit here watching and waiting, and without a degree of unearned confidence, you gingerly probe your fingers around the cockholes, eventually sticking your pinky into the biggest one. It hits what feels like a flat, blunt-tipped member, shooting lightning bolts of pleasure up your spine. Between the sensitive, hidden meat and the fact that your sheaths themselves are still very responsive, you find your heartbeat speeding and something shifting within you.");
				ExtendLogEvent("\n\n" + StringUtil.upperCase(pc.eachCock()) + " surges out of its sheath in unison with its identically");
				var tempColor2:String = "mottled";
				if(rand(2) == 0) tempColor2 = "black";
				ExtendLogEvent(" " + tempColor2 + " brothers, getting thicker, longer, and veinier by the minute. You can almost taste the pheromones pouring off your lengthened rods, and while you enjoy it, you bet it would have the cow-girls mewling in delight. You grab hold of the swelling dicks, one in each hand, and stroke, feeling the extra inches pour out of your sheaths.");
				var nubby:Boolean = false;
				if(rand(4) == 0) nubby = true;
				if(nubby) ExtendLogEvent(" Strangely, you feel sensitive bumps welling up under your fingertips, but they feel too good to worry about, regardless of how out of place they are on your equine rods.");
				ExtendLogEvent(" You’re getting longer and harder than you were before, and the pleasure mounts and mounts, threatening to send you past a precipice that has your flaring tips nearly doubling in size.");
				ExtendLogEvent("\n\nThere’s no containing the rampant, almost feral pleasure that overwhelms you. All you can do is lie back and hump at your own hands, suddenly erupting");
				if(pc.cockTotal() == 2) ExtendLogEvent(" twin");
				else ExtendLogEvent(" into a multitude of");
				ExtendLogEvent(ParseText(" fountains of [pc.cumNoun]. Lances of the [pc.cumVisc] thrust through the air before splattering all over your [pc.chest] and body."));
				var knotty:Boolean = false;
				if(rand(4) == 0) knotty = true;
				if(knotty) ExtendLogEvent(" Each spurt comes bigger and thicker than the one behind it, and when your hand slides down to squeeze a newly-formed, canine knot, your mind buckles.");
				else ExtendLogEvent(" The goo falls thicker and thicker while you heedlessly pump, all the while fighting with an urge to whinny in delight.");
				ExtendLogEvent(ParseText("\n\nThe orgasm does eventually end, leaving a residual euphoria and a thorough layer of [pc.cum] in its wake."));
				if(knotty) 
				{
					ExtendLogEvent(" The knots don’t shrink down for at least five minutes after. Had you been balls-deep in a");
					if(isFauxCow) ExtendLogEvent("n amazon, she would’ve had to sit there and let you fill her.");
					else if(isAmazon) ExtendLogEvent(" faux-cow, he would’ve had to sit there and let you fill him.");
					else ExtendLogEvent(" bitch, she would’ve had to sit there and let you fill her.");
				}
				ExtendLogEvent(" <b>You’ll need to get used to having a");
				if(knotty) ExtendLogEvent(" knotted");
				if(knotty && nubby) ExtendLogEvent(",");
				if(nubby) ExtendLogEvent(" nubby");
				ExtendLogEvent(" horse-cock.</b>");

				// +5 inches. increase cum volume and such slightly.
				for(x = 0; x < pc.cockTotal(); x++)
				{
					// TFable dick!
					if(pc.cocks[x].cType != chosenDickType)
					{
						// +5 inches. increase cum volume and such slightly.
						pc.cocks[x].cLength(5);
						pc.shiftCock(x, chosenDickType);
						if(tempColor2 != "mottled")
						{
							if(rand(2) == 0) pc.cocks[x].cockColor = "black";
							else pc.cocks[x].cockColor = "pink";
						}
						else pc.cocks[x].cockColor = "mottled pink and black";
						if(knotty) 
						{
							pc.cocks[x].addFlag(GLOBAL.FLAG_KNOTTED);
							pc.cocks[x].knotMultiplier = 1.5;
						}
						if(nubby) pc.cocks[x].addFlag(GLOBAL.FLAG_NUBBY);
					}
				}
				// Cum
				pc.orgasm();
				pc.boostCum(3);
			}
		}
		// Dawg Cawk
		else if(chosenDickType == GLOBAL.TYPE_CANINE)
		{
			// Single
			if(!changeAllDicks)
			{
				AddLogEvent("Your " + pc.cockDescript(targetDick) + " shifts, pulling up against your crotch. You wince at the abrupt change", "passive", treatmentHourPrint((isAmazon ? 159 : 105), startHours));
				if(isFauxCow) {}
				else if(isAmazon) ExtendLogEvent(", wondering if something has gone wrong, fearing that you’ll wind up as some kind of tiny-dicked freak");
				else ExtendLogEvent(", wondering if something has gone wrong, fearing that you’ll wind up as one of the effeminate faux-cows");
				if(pc.isCrotchGarbed()) ExtendLogEvent(" even while you pull your equipment off for a better look");
				else ExtendLogEvent(" even while you peer down for a better look");
				ExtendLogEvent(". It doesn’t feel like it’s shrinking, but it is");
				if(pc.hasSheath(targetDick)) ExtendLogEvent(" pulling further and further into its sheath. Eventually, it vanishes entirely, hidden from view.");
				else ExtendLogEvent(" pulling into your crotch somehow, leaving your " + pc.cocks[targetDick].cockColor + " skin to bunch up around the base. Fur breaks out over the strange pubic mound, taking the place of the hair that once dwelt there. Meanwhile, your " + pc.cockDescript(targetDick) + " continues its vanishing game, eventually disappearing entirely into what can only be a fuzzy sheath.");
				ExtendLogEvent("\n\nYou feel strangely warm all over from the odd change sweeping through your body, but the heat is primarily concentrated in your loins, where <i>something</i> is happening to your dick. You can’t just sit here and wait. You’ve got to figure out what’s happening to you, even if it means sticking a finger in after. Here goes....");
				ExtendLogEvent("\n\nYour probing digit slips right in, finding the interior to be warmer than you expected, almost hot. It’s a little slick too, like the whole of it is covered in a thin sheen of sweat. You feel around in there, breathing faster and faster from the inexpert stimulation, until you hit the pointed tip of what can only be your prick.");
				if(!pc.cocks[targetDick].hasFlag(GLOBAL.FLAG_TAPERED)) ExtendLogEvent(" Wait... pointed tip? Your cock wasn’t <i>that</i> angular.");
				ExtendLogEvent(" The sensation of friction between your finger and genital is almost more than you can bear. You fall back, panting noisily and rubbing all the harder.");
				ExtendLogEvent("\n\nYou can’t keep it up, though. Your bright red length is pushing your naughty digit out of your sheath, revealing its new shape to you in all its glory. <b>You have a bright red, pointed dog-dick, complete with a slight bulge at the base from your uninflated knot.</b> The sensation of the air blowing across it is almost too much to bear. Your hand wraps around it, at first to shield it from errant breezes, and then to stroke it, pumping furiously, feeding more and more pleasure to your expanding " + (isFauxCow ? "puppy cock" : "bitch-breaker") + ".");
				ExtendLogEvent(ParseText("\n\nYou howl, a blissful, wonderful sound of triumph, announcing that you’ve hit your peak even before it. The bulge at the base of your canine prick expands, and you just <i>have</i> to wrap your hand around it, to feel something warm squeeze against it. It’s all too much. The pulsing, animalistic bliss overwhelms you, and you abruptly erupt, launching rope after rope of [pc.cum] across your [pc.chest]"));
				if(pc.cocks[targetDick].cLength() < 18) ExtendLogEvent(ParseText(" and [pc.belly]"));
				else ExtendLogEvent(ParseText(" and [pc.face]"));
				ExtendLogEvent(". The climax drags on and on. Even when you go dry, you’re still pulsating in your grip, your rock-solid knot");
				if(isFauxCow) ExtendLogEvent(" satisfying an imaginary master or mistress while they reward you.");
				else ExtendLogEvent(" holding an imaginary cow-girl in place while she fountains milk along with you.");
				ExtendLogEvent(" The orgasm eventually ends, leaving you with a slowly-receding dick that would look at home on");
				if(pc.originalRace != "half-ausar") ExtendLogEvent(" a big dog");
				else ExtendLogEvent(" an ausar");
				ExtendLogEvent(".");
				pc.shiftCock(targetDick, chosenDickType);
				// orgasm
				pc.orgasm();
				pc.boostCum(3);
			}
			// Multi!
			else
			{
				AddLogEvent("You double over a feeling that can only be described as... diminishment traverses your crotch from one side to the other, centered over your " + pc.cocksDescript() + ". Terrified that something might have gone wrong", "passive", treatmentHourPrint((isAmazon ? 159 : 105), startHours));
				if(isFauxCow) {}
				else if(isAmazon) ExtendLogEvent(" - that you might be shrinking into some sort of tiny-dicked freak");
				else ExtendLogEvent(" - that you might be shrinking and turning into a faux-cow");
				ExtendLogEvent(", you stagger back");
				if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(", reaching into your [pc.lowerGarment] with shaking hands"));
				else ExtendLogEvent(", looking down with probing eyes");
				ExtendLogEvent(".");
				if(pc.totalSheaths() <= 1) ExtendLogEvent(" The strangest thing is happening. Your " + pc.cocksDescript() + " are each shrinking... and yet not. They feel more like they’re pulling back into your body, and the skin is bunching up around the base of each one, sprouting a fine layer of fur as it thickens. You gasp. Your dicks aren’t getting smaller - they’re retracting into sheaths! Canine cocksheaths!");
				else ExtendLogEvent(ParseText(" Thankfully, your members are merely retracting into their sheaths, pulling back until they’ve almost entirely vanished. More importantly, the sheaths themselves are covered in a layer of rich, [pc.furColor] fur, appearing canine in nature."));
				ExtendLogEvent("\n\nWith this new development firmly in your mind, you sink to the ground, sitting");
				if(!pc.isTaur()) ExtendLogEvent(ParseText(" on your [pc.butt]"));
				else ExtendLogEvent(" on your haunches");
				ExtendLogEvent(" to watch the developing drama down south. It actually feels kind of... good. There’s a kind of sensual warmth to it. A whole-body flush spreads through your form while your " + pc.cocksDescript() + " finish their descent into hiding. You groan and slide your hands down to your sheaths, rubbing them affectionately, enjoying the sensation of playing with new nerves. You realize something is happening within you: your " + pc.cocksDescript() + " are changing into something else. They bulge against the inside of your sensitive folds in the most pleasant way. Just what are they changing into?");
				ExtendLogEvent("\n\nThey answer your question a moment later by thrusting up out of your sheaths, bright-red and pointed, narrow tips visibly quivering as more sensitive dickflesh emerges. You whimper; it sounds almost like a pant to your ears. They feel so good, and they’re so slick and hot. They almost glow to your eyes, bundles of red erotic energy just waiting to be touched, squeezed, and explosively released. Your hands are trembling and sweating, barely controlled. You aren’t sure that you could stop yourself from jacking off if you wanted to.");
				ExtendLogEvent("\n\nThe decision is taken out of your hands when, with violent lurches and soft-sounding pops, glistening knots emerge. The rounded bulges are trembling with unchecked need. They grow by the second, surging with the intensity of their building load.");
				var nubtacular:Boolean = false;
				if(rand(4) == 0) nubtacular = true;
				if(nubtacular) ExtendLogEvent(" Small nubs grow out of the surfaces of your " + pc.cocksDescript() + " before your eyes, but the ever-increasing pressure keeps your attention focused on your impending eruption over any concerns about the shapes of your new features.");
				ExtendLogEvent(" You feel so pent up, like you haven’t cum in days. The knots grow ever larger, and you whine, humping the air. That pressure is almost overwhelming, blasting every thought out of your head except for one: how badly you need to release.");
				ExtendLogEvent(ParseText("\n\nAlmost doubling in size, your knots expand once more, the sensation so hellishly pleasurable that you lose all control. Your muscles quiver. Your hips lock. Arching your back, you erupt like a geyser, spewing ropes of [pc.cum] into the air with such force that they look like a [pc.cumColor] web. A moment later, they fall down across you, but you’re already launching more up to replace them, painting yourself with layer after layer of glistening [pc.cumNoun], cumming to the feeling of your knots being so swollen. You can only imagine how good they would feel trapped in tight channels"));
				if(!isFauxCow) ExtendLogEvent(", pouring your virile energy into them with womb-filling fury");
				ExtendLogEvent(".");
				ExtendLogEvent(ParseText("\n\nThe comedown happens an indeterminate amount of time later. You have memories of seemingly unending pleasure, and you’re panting like you’ve just run a marathon. Also, you’re lying in the biggest puddle of [pc.cum] you’ve ever produced. A look at the Codex tells you that you’ve been here for the better part of a half-hour. Doing your best to clean yourself off, you find yourself smiling all the same"));
				if(isFauxCow) ExtendLogEvent(", you find yourself smiling all the same, happy with your puppy cocks");
				else ExtendLogEvent(". Tools like this are going to be extra effective at breeding bitches");
				if(nubtacular) ExtendLogEvent(", extra nubs or not");
				ExtendLogEvent(".");

				for(x = 0; x < pc.cockTotal(); x++)
				{
					// TFable dick!
					if(pc.cocks[x].cType != chosenDickType)
					{
						pc.shiftCock(x, chosenDickType);
						if(nubtacular) pc.cocks[x].addFlag(GLOBAL.FLAG_NUBBY);
					}
				}
				// Cum
				pc.orgasm();
				pc.boostCum(3);
			}
		}
		// Cat Cawk - Fuck this, not doing it nau
		else
		{
			// Single Catcock TF
			if(!changeAllDicks)
			{
				AddLogEvent("Your " + pc.cockDescript(targetDick) + " becomes distressingly hard in an instant", "passive", treatmentHourPrint((isAmazon ? 159 : 105), startHours));
				if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(", threatening to shred your [pc.lowerGarments] no matter how sturdy the construction. It’s like walking around with an ill-fitting titanium bar in your pants. You pull the offending equipment out of the way, and the relief is so palpable you could swim in it"));
				else ExtendLogEvent(", jutting out from your crotch like some kind of rigid, cybernetically attached lever. You aren’t sure you’d be able to stand having an erection this strong trapped within any kind of clothing");
				ExtendLogEvent(". It grows harder by the second. A small part of you wonders if you’re somehow going to explode.");
				// Not yet spined
				if(!pc.cocks[targetDick].hasFlag(GLOBAL.FLAG_NUBBY))
				{
					ExtendLogEvent("\n\nThe pent-up pressure fades, leaving heat, lust, and cosmetic additions to your cock. Tiny bumps are rising up out of your sensitive, " + pc.cocks[targetDick].cockColor + " flesh. At first, they’re small enough that you wouldn’t have noticed them without holding your member in your hand. But as your heart beats and the overwhelming tightness recedes, they grow bigger, transforming into fleshy, texture-rich nodules. Just feeling your fingertips playing across them has you swooning and leaking from the tip. You can only imagine what they’ll do to a pussy or an asshole. It’ll be a sensory overload they won’t soon forget.");
				}
				// Already spined
				else ExtendLogEvent("\n\nThe pent-up pressure fades as quickly as it appeared, bringing with it waves of lust and a strange quivering from the nubs that cover your " + pc.cockDescript(targetDick) + ". They wiggle, pulsating bigger for a moment before receding. You don’t have time to question the odd development as the rising tide of desire compels you to wrap a hand around the quivering length and tug, stroking the sensitive haft until droplets of pre-cum are spilling from the tip almost nonstop.");
				// CHANGE PLACES... errr shapes
				ExtendLogEvent("\n\nYour jaw opens, and you release a throaty roar of satisfaction, pumping your transforming prick for all you’re worth. It changes inside your palm. The shape twists. The veins vanish. The only constant is the all-consuming enjoyment that it provides - the way it makes your synapses dance in ecstasy. The tip fattens and then narrows between your fingertips, coming to something approximating a tip. Luckily, those wonderful nubs hang on through it all, even when your dick’s transformation seems to be coming to a close, bringing with it final surges of electric, dazzling pleasure.");
				ExtendLogEvent(ParseText("\n\nGrunting, you thrust into your palm. Those grunts transform into feral, powerful roars of " + (isFauxCow ? "need" : "triumph") + ", and orgasm washes through you, transforming your body to a fiery volcano. Ropes of licentious release erupt from you, chased by even bigger geysers of your seed. You pump widely, clenching powerful internal muscles to drive yet more [pc.cum] from your undoubtedly feline member."));
				if(isFauxCow) ExtendLogEvent(" You are overwhelmed by an urge to clamp your jaw around your mate’s shoulder, or to drive your nails over their back while they fuck you!");
				else ExtendLogEvent(" The urge to clamp your jaw around your mate’s neck overwhelms you - if only you had a female here, impaled on your spurting cat-cock!");
				ExtendLogEvent(ParseText(" The thought sends fresh squirts of [pc.cumColor] out to fall on the ground, and your eyelids roll back, your mind overloaded."));
				
				ExtendLogEvent("\n\nComing down, you find yourself still stroking your softening cat-cock. Having a big, fat animal-dick like this makes you feel like some kind of alpha male. You pat the shrinking thing affectionately, and resolve to live up to the " + (isFauxCow ? "savage" : "predatory") + " image it conjures in your mind.");
				if(isFauxCow) ExtendLogEvent(" You don’t want to be like a mewling cow, you want to be in a pride! The stars can be your savanna.");
				else if(isAmazon) ExtendLogEvent(" You don’t want a harem of mewling cow-girls. You want a pride. The stars can be your savanna, and you’ll be its amazon queen.");
				else ExtendLogEvent(" You don’t want a harem of mewling cow-girls. You want a pride. The stars can be your savanna, and you’ll be its lord.");
				pc.shiftCock(targetDick, chosenDickType);
				pc.orgasm();
				pc.boostCum(3);
			}
			// Multicock!
			else
			{
				AddLogEvent("In an instant, your " + pc.cocksDescript() + " become distressingly hard", "passive", treatmentHourPrint((isAmazon ? 159 : 105), startHours));
				if(pc.isCrotchGarbed()) ExtendLogEvent(ParseText(", threatening to shred your [pc.lowerGarments] no matter how sturdy the construction. It’s like walking around with ill-fitting titanium bars stuffed into your pants. You pull the offending equipment out of the way, and the relief is so palpable that you could fill a pool with it"));
				else ExtendLogEvent(", jutting out from your crotch like levers from a perverse control panel. You aren’t sure you’d be able to stand having erections like this trapped within any kind of clothing. For once, nudity pays off");
				ExtendLogEvent(". They’re getting harder by the second, still. A part of you wonders if they’re going to pump up until they burst, overwhelmed by some kind of incredible, internal pressure.");
				// No spines
				if(pc.cocks[targetDick].hasFlag(GLOBAL.FLAG_NUBBY))
				{
					ExtendLogEvent("\n\nStrangely, the strain begins to fade almost as soon as it arrived, replaced by a rampant, unrestrained heat. The change from discomfort to a balmy arousal is almost instantaneous, and with it comes another unfamiliar sensation: little nubs pressing against your palm. You aren’t sure when you grabbed hold of " + pc.oneCock() + " and started stroking, but you can feel the surface of your shaft morphing beneath your fingertips, sprouting tiny, textured nubs across its entire surface. You wouldn’t have noticed if you weren’t squeezing yourself so, at least not at first. Those little nubs are getting more prominent. After a few pumps, they’re big enough to be seen with the naked eye. You ooze pre-cum, imagining the way your newly-textured cock will overwhelm your mates with ecstasy. Wait... mates?");
				}
				// Spined already
				else ExtendLogEvent("\n\nStrangely, the strain begins to fade almost as soon as it arrives. The nubs that cover your cocks wiggle, twitching wildly, even swelling up for a few short moments. Luckily, they return to their normal size a moment later. You sigh with relief, unsure what you would have done had they gotten any larger. Now that the discomfort is gone, you’re aware of another sensation emanating from your genitalia: lust. Not just normal lust either. The kind of lust that compels you to wrap both hands around your lengths and stroke. The kind of lust you couldn’t say no to even if you had an iron will and a lifetime of self-discipline to call upon. Pre dribbles out of your tips in thin streams already. Just how horny are you?");
				// Lets TF this bitch
				ExtendLogEvent("\n\nYou jack of harder, stroking two handed, each palm sliding across a pre-cum lubricated length. Releasing a throaty roar of satisfaction, you thrust your hips forward, burying the");
				if(pc.cockTotal() > 2) ExtendLogEvent(" lucky");
				ExtendLogEvent(" twin lengths into your hands. At the same time, you become aware of something else.... They’re changing in your very grips, twisting and reshaping against your slickened palms. The nubs don’t change, but just about everything else does. One second, your shafts feel like they’re swelling up like balloons. The next, your " + pc.cockHeads() + " are fat and prominent, a little squishy and almost spongy. Then, they’re narrowing to tapered points. Your pricks are transforming by the second, and you can do naught but continue to stroke them, compelled by infinitely erotic, transformative energies.");
				ExtendLogEvent("\n\nThere’s no stopping you now. The pleasure rises higher and higher, taking you further and further away from the mundane world. Your head is in the clouds even as your hands are bound to the pulsating, slowly-solidifying lengths below. Your cocks are almost finished changing, and releasing larger and larger waves of bliss to push you beyond conscious thought. Their tips are narrow and pointed, the shafts thick, each nub jolting your ecstatic mind with red-hot, rutting desire.");
				if(pc.balls > 1) ExtendLogEvent(" Your " + pc.ballsDescript() + " clench, and y");
				else ExtendLogEvent(" Y");
				ExtendLogEvent("our rods thicken, urethras flooding with soon to be expelled goo. One thought surfaces a moment before you explode: you have thick");
				if(isFauxCow) ExtendLogEvent(", kitty dicks, like a graceful tiger.");
				else ExtendLogEvent(", feline dicks, like an immense, powerful lion.");
				ExtendLogEvent(ParseText("\n\n[pc.Cum] surges, obliterating any attempt at reason, leaving you roaring and spurting, erupting long lances of"));
				if(pc.cumType == GLOBAL.FLUID_TYPE_CUM) ExtendLogEvent(" leonine jism");
				else ExtendLogEvent(" relief");
				ExtendLogEvent(" into a puddle on the ground. The pleasure is incandescent, burning away any worry or concern, leaving only deep-seated satisfaction in its wake");
				if(!isFauxCow) ExtendLogEvent(" and the desire to find a group of willing females to sate your rut again and again");
				ExtendLogEvent(ParseText(". The ribbons of [pc.cum] seem almost unending, the continuous bliss beyond your capacity to endure. Your eyes roll back, and consciousness fades to the feeling of your hands stroking one quivering tool after another."));
				ExtendLogEvent("\n\nWhen you awake, you’re still standing there with both your hands wrapped around your softening dicks, somehow. You let go and stretch, totally sated for once. But, just when you’re planning to");
				if(pc.isCrotchGarbed()) ExtendLogEvent(" pull your gear back up and");
				ExtendLogEvent(" get back to business as usual, you give your");
				if(isFauxCow) ExtendLogEvent(" tiger-like phalli an appraising look and remember your desire to be in a harem... no, a pride. You’ll have to find a few playmates soon, maybe even some that’ll love the feel of you biting at their shoulder or driving your nails over their back.");
				else ExtendLogEvent(" lion-like phalli an appraising look and remember your desire for a harem... no, a pride. You’ll have to find a few cuties to sate you soon, maybe even some that’ll love the feel of you biting at their neck while you take them.");
				for(x = 0; x < pc.cockTotal(); x++)
				{
					// TFable dick!
					if(pc.cocks[x].cType != chosenDickType)
					{
						pc.shiftCock(x, chosenDickType);
					}
				}
				// Cum
				pc.orgasm();
				pc.boostCum(3);
			}
		}
	}
}

