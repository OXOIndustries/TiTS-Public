//Sylvie Bartheon (Hortonne, lul, but I like the more serious shit)
//ORIGINAL DESIGN:
//“Mount-Me” - Off Duty security officer there from 4pm till 3am
//Only up for chatting at first.
//Can buy her drinks. She prefers the ones with cum in them, obv.
//Gets progressively more intoxicated as the night wears on (or you can buy eher drinks to speed the process)
//Switches to “bra” version of bust when sauced enough to want to make love to every part of the PC’s body.
//At end of her bar “shift” takes a pill to insta-sober up when she leaves. Once PC sees scene, she can sell them to the PC. Clears alcohol effects.


/*Sylvie Breakdown
* Personality Subgroup:
* Aggressive drunk, maybe unaware of her strength/size when drunk? Meeses are huge
* Originally from backwater town. Got moose mods when she joined up with “the fuzz”. Rustic bar reminds her of the one place in her hometown.
* Loves Kally’s drinks. Knows what’s in them, but generally doesn’t let on to the player (one story clues us in tho)
* Three stages of drunk as the night progresses.
* Friendly - As the name implies
* Buzzed - Flirty/Happy cuddly. THE BOOBSQUISH ZONE
* Drunk - Smash mode engage if ever smashed. Otherwise aggressively flirty cuddly. Hands everywhere.
* Appearance Subgroup:
* 9' tall
* Glow-in-the-dark fur stripes on flanks for “safety”.
* J-Cups with jutting, thick nipples and large, puffy areolae.
* Orange eyes
* Brown Hair
* Green lipstick
* Huge rack (’heh’)
* Freckles on face, tops of boobers
* Droopy animal ears
* Fetishy red top
* Moosebod fur goes up to narrowest point of torso - around belly button
* Darker hexagonal buttstamp
* Vagina is modded to be extra poundable. Looks like a svelte little hole, but when aroused, puffs up into a big, padded ring.
* Flushes purple as it reaches full size. Muscles can contract it extra tight. Doesn’t lubricate until contact is applied to her lower back/haunches.
* Lubricant is excessive once started.
* Clit is nestled into an inward-facing crease on the bottom edge, about as thick as a thumb.
*/

public function showSylvie(nude:Boolean = false):void
{
	showName("\nSYLVIE");
	if(nude) showBust("SYLVIE_NUDE");
	else if(sylvieDrunkLevel() >= 2) showBust("SYLVIE_BRA");
	else showBust("SYLVIE");
}
public function showSylvieInBra():void
{
	showName("\nSYLVIE");
	showBust("SYLVIE_BRA");
}

public function sexedSylvie(arg:Number = 0):Number
{
	if(flags["SEXED_SYLVIE"] == undefined) flags["SEXED_SYLVIE"] = 0;
	if(arg != 0)
	{
		flags["SEXED_SYLVIE"] += arg;
	}
	return flags["SEXED_SYLVIE"];
}

public static const CONST_SYLVIE_BOOZE_MULT:Number = 2;
public function sylvieDrunkLevel():Number 
{
	//Figure out how drunk Sylvie is.
	//25 = Buzzed.
	//50 = Drunk.
	var sylvieDrunkTimeCounter:Number = 0;

	if(hours >= 16) sylvieDrunkTimeCounter = (hours-16) * 6;
	if(hours <= 3) sylvieDrunkTimeCounter = (hours + 8) * 6;

	//Initialize the flags.
	if(flags["SYLVIE_BOOZE_BOUGHT"] == undefined) flags["SYLVIE_BOOZE_BOUGHT"] = 0;
	if(flags["SYLVIE_BOOZE_TIME"] == undefined) flags["SYLVIE_BOOZE_TIME"] = 0;
	//Clear bought booze on new day.
	if(flags["SYLVIE_BOOZE_TIME"] + 60*12 < GetGameTimestamp()) flags["SYLVIE_BOOZE_BOUGHT"] = 0;

	trace("SYLVIE_CURR_DRUNK: " + (sylvieDrunkTimeCounter + flags["SYLVIE_BOOZE_BOUGHT"]));

	sylvieDrunkTimeCounter += flags["SYLVIE_BOOZE_BOUGHT"];
	if(sylvieDrunkTimeCounter >= 50) return 2;
	else if(sylvieDrunkTimeCounter >= 25) return 1;
	else return 0;
}

public function sylvieDrunkBump(booze:Number = 1):void
{
	sylvieDrunkLevel();
	trace("BUMPING");
	//Initialize the flags.
	if(flags["SYLVIE_BOOZE_BOUGHT"] == undefined) flags["SYLVIE_BOOZE_BOUGHT"] = 0;
	if(flags["SYLVIE_BOOZE_TIME"] == undefined) flags["SYLVIE_BOOZE_TIME"] = 0;
	//Clear yesterday's booze.
	if(flags["SYLVIE_BOOZE_TIME"] + 60*12 < GetGameTimestamp()) flags["SYLVIE_BOOZE_BOUGHT"] = 0;
	//Newest boozetime set!
	flags["SYLVIE_BOOZE_TIME"] = GetGameTimestamp();
	flags["SYLVIE_BOOZE_BOUGHT"] += booze * CONST_SYLVIE_BOOZE_MULT;
	sylvieDrunkLevel();
	trace("BUMPED");
}

public function sylvieInBar():Boolean
{
	if(hours >= 16 || hours < 3) 
	{
		if(pc.hasStatusEffect("SYLVIE WORKING")) return false;
		return true;
	}
	return false;
}
public function sylvieCuntSize():Number
{
	return 1500;
}

//Approaches
//Sober
public function approachSylvie():void
{
	//Repeat router!
	if(flags["MET_SYLVIE"] != undefined) { repeatSylvieApproaches(); return; }

	clearOutput();
	showSylvie();
	output("<i>“Hey there,”</i> the moose-girl calls out the moment you take a step her way. She adjusts her wide-brimmed hat to cant it at an attractive angle and takes a long pull of her beer, except she doesn’t stop drinking. The amber fluid sloshes lower and lower with each successive swallow until she slams the emptied vessel down with an authoritative ‘clunk’. <i>“");
	if(!pc.isTaur()) output("Pull up a chair.");
	else output("Have a lean.");
	if(sylvieDrunkLevel() >= 2) output(" You look like you could use a drink and a hug, spacer. Mmm... and a kiss.");
	else
	{
		output(" You look like you’ve got some stories to tell");
		if(sylvieDrunkLevel() >= 1) output(" and hugs to give");
		output(", spacer.");
	}
	output("”</i>");

	//Bimbo
	if(pc.isBimbo())
	{
		output("\n\nIf she can swallow beer like that, she must be like, a champion cock-sucker. <i>“Okay!”</i> You approach like you always do - with your hips wiggling and your eyelashes fluttering low. When you ");
		if(!pc.isTaur()) output("ease into your chair");
		else output("sidle up against the table");
		output(", half the eyes in the place are glued to your body.");
	}
	//Bro
	else if(pc.isBro())
	{
		output("\n\nIf there’s one thing you can respect, it’s a girl that can hold her booze. You grunt your assent and ");
		if(pc.isTaur()) output("sidle up");
		else output("find a sturdy chair");
		output(".");
	}
	//Else
	else
	{
		output("<i>“");
		if(pc.isNice()) output("Sure,");
		else if(pc.isMischievous()) output("You got it, lady justice,");
		else output("Got nothin’ better to do,");
		output("”</i> you answer as you approach");
		if(!pc.isTaur()) output(", grabbing an empty chair.");
		else output(", following her lead and leaning against the thick wooden slats.");
	}
	//Merge
	output("\n\nNow that you’re closer, you can get a good look at the buxom officer, from her enormous rack to her other enormous rack - J-cups, by your guess. Beneath her hat and antlers, shimmering brown hair frames her freckled face and piercing orange eyes. A petite nose and mouth complete the picture, though the latter is glossed with a fashionable layer of teal lipstick. Then there’s everything below her waist; she’s almost entirely moose from the belly-button on down, including an enormous frame entirely at odds with the otherwise cute-looking girl just above. Her fur, like her hair, is a rich brown and silky-smooth. Pink stripes zig-zag down her sides, so vibrant that they must glow in the dark. How else would the smaller Vesperian denizens avoid getting trampled in the event of a power outage?");
	//Sobermoose
	if(sylvieDrunkLevel() == 0) 
	{
		output("\n\n<i>“You know, if you’re going to spend all day staring at me, the least you could do is buy me a drink, " + pc.mf("handsome","sweetie") + ".”</i> Despite the cutting words, the nine-foot tall moosetaur is smiling");
		if(pc.tallness < 100) output(" down");
		else if(pc.tallness > 108) output(" up");
		output(" at you. <i>“I’m Sylvie by the way, and no, I’m not on duty.”</i>");
	}
	//Buzzmoose
	else if(sylvieDrunkLevel() == 1)
	{
		output("\n\n<i>“You know, if you’re going to spend all day staring, you could at least buy me a drink or give me a hug.”</i> Despite her chiding tone, she’s smiling and leaning closer. <i>“I’m Sylvie by the way, and since I’m not on duty, I’m free to cuddle with whoever I want, whenever I want.”</i> She burps and giggles, <i>“Excuse me.”</i>");
	}
	//Drunkmoose
	else 
	{
		output("\n\n<i>“You know, you can do more than stare. I’m not on duty.”</i> She belches and giggles, <i>“Hehe... dooty.”</i> When you don’t immediately take her up on the offer, she cocks her head curiously, leaning so close that you can smell a faint hint of exotic alcohol on her breath. <i>“Don’t be shy! My name’s Sylvie, and I’m only a little bit drunk. The bra thing? Just because it’s so warm in here, and bare skin is wayyy better for hugging... and kissing... and...”</i> She fans herself. <i>“...other things. We should totally hug.”</i>");
	}

	//Bimbo
	if(pc.isBimbo()) 
	{
		output("\n\n<i>“I’m [pc.name]. You have a super pretty name. You know, you’re like, super-hot for a police girl. I bet all kinds of criminals just fall into your lap.”</i> Upon realizing that she doesn’t have a lap in the traditional sense, you cover your mouth and blush. <i>“Oh, sorry! They probably fall into your... uh... haunches? There’s probably a line of them behind you all the time, huh?”</i> You peek around the table. Seeing the complete lack of hangers on, you’re immediately saddened, but then you remember you’re making a new friend and cheer right back up. <i>“I bet you have lots of fun with those handcuffs though!”</i>");
		//Sober
		if(sylvieDrunkLevel() == 0) output("\n\nSylvie smiles mischievously right back at you. <i>“I wouldn’t know anything about that.”</i> Her stubby little tail wiggles playfully, and a warm blush rises up beneath her freckles. <i>“Besides, you want cuffs with a little bit of padding for that sort of thing. If you tried to use the real deal with a big girl like me, you’d probably wind up hurting somebody.”</i>");
		//Buzz
		else if(sylvieDrunkLevel() == 1) output("\n\nSylvie smiles mischievously right back at you. <i>“Not as much as you’d think. I tried it once and almost broke my wrist. My poor little human half just isn’t built to stand up to 900 pounds of moosebutt in the bedroom.”</i> She jerks her head back toward the bar. <i>“Kally wouldn’t even let me use them on her, but she made up for it by um...”</i> She blushes crimson, her petite tail wagging at the end of her giant-sized haunches. <i>“Giving me so many free drinks! You shouldn’t use real handcuffs anyway. Get some padded ones so nobody gets hurt if things get rough.”</i>");
		//Drunk
		else output("\n\nSylvie titters at the mere suggestion. <i>“No way! I’m not allowed to get fucked on the clock. That’s why I come here. Kally’s super nice, and everyone is just... the friendliest!”</i> She picks up her handcuffs and tries to spin them around. They slip off and slide across the table, nearly knocking an empty glass to the floor. <i>“Whoopsie! Don’t try to use normal handcuffs for sexy stuff. Get some good ones with padding. They don’t slide as far when you drop ‘em.”</i> She nods sagely as she stretches to grab her lost cuffs. In the process, her tits squish down against the table and knock over a half-dozen empty mugs. <i>“At least I can do all the fuckin’ I want now. I could fuck you, or the bartender, or that handsome deer over there. I could even fuck the knob on the end of that handrail, but Kally got mad at me when I tried that, and I promised I wouldn’t do it again.”</i>");
		output("\n\nYou nod and make a mental note to only use appropriate bondage cuffs in the future. Like a sticky note soaked in industrial adhesive, the idea lodges firmly in your brain, easily displacing some stupid lesson about an ausar-terran war. If they had used the right kind of cuffs, they could’ve just fucked out their differences!");
	}
	//Bro
	else if(pc.isBro())
	{
		output("\n\n<i>“[pc.name],”</i> you grunt back, brazenly checking out her tits. The bright red top of her uniform barely does anything to hide her cleavage - or her underboob. You could rip the narrow bridge of fabric between and have her spilling out of her top in seconds. <i>“I might have to buy you that drink.”</i> An exotic scent tickles your enhanced nostrils, distinctly pheromonal and eminently female, like pussy and fields of amber grain. In its subtle bouquet you discover exactly what you hoped for: arousal, though relatively mild for now.");
		output("\n\nSylvie smiles right back at you");
		if(pc.hasCock() && pc.biggestCockLength() >= 15)
		{
			if(pc.isCrotchExposed()) output(" but mostly at your exposed crotch");
			else output(" but mostly at your bulging, barely contained crotch");
		}
		else output(" and your crotch, but the latter only holds her attention for a moment");
		output(". <i>“Cocky, eh? I like that.”</i> She mock stretches, pushing her breasts forward teasingly. <i>“");
		//Sober
		if(sylvieDrunkLevel() == 0) 
		{
			output("But be sure and keep your hands to yourself. Consent is key, and I’d hate to have to haul off a new friend in handcuffs.”</i>");
			output("\n\nYou briefly envision her in handcuffs, chained to the table and presenting whatever passes for her animalistic puss to you, absolutely weeping with need. She’ll consent eventually. You’ll just have to give her time to realize what a perfect partner you’d be.");
		}
		//Buzzed
		else if(sylvieDrunkLevel() == 1)
		{
			output("You’re adorable. Get me another drink or two and I’ll give you even more to look at. Just gotta get out of this stuffy thing. The stupid handcuffs always pinch into my side when I’m trying to give someone a proper squeeze.”</i>");
			output("\n\nYou briefly envision her in said handcuffs - and nothing else, chained to the table and presenting whatever passes for her animalistic puss to you, absolutely weeping with need.");
		}
		//Drunk
		else
		{
			output("Mmm... I like that a lot.”</i> She nuzzles into your shoulder, nostrils flaring. <i>“A whole lot.”</i> After a second like that, she wraps her arms around you and whispers, <i>“You ");
			if(!pc.hasStatusEffect("Sweaty")) output("smell so good, like stars ought to smell.");
			else output("smell so sweaty, like you’ve been working all day, and came here to find someone to take care of all your troubles.");
			output("”</i> She breaks away, kisses you on the cheek, and drunkenly bats her eyelashes at you.");
			output("\n\nYou immediately envision the affectionate policewoman stumbling over onto her flank and lifting her leg, presenting you with a sopping-wet pussy and a convenient handhold for thrusting. She’d probably spend the whole time babbling about how amazing you are.");
		}
	}
	//Else
	else
	{
		output("\n\n<i>“[pc.name],”</i> you answer. <i>“");
		if(pc.isNice()) output("Do you really get people bugging you about your job that much?");
		else if(pc.isMischievous()) output("And I don’t care whether you’re on duty or not. Since I came from another planet, I’m duty-free.");
		else output("I don’t care if you’re on the clock or not, I’m still gonna talk to you.");
		output("”</i>");

		//Sobermoose
		if(sylvieDrunkLevel() == 0)
		{
			output("\n\nSylvie smiles warmly at your words. <i>“Believe it or not, a lot of foreigners get nervous around an officer of the law. I can understand why. Foreign planets can be big, scary places, but not Canadia Station, eh?”</i> She gestures around the lodge and its smiling clientele. <i>“We try to use a light touch if at all possible. No sense having to house criminals for decades if we can avoid it.”</i> She stretches and sighs contently, incidentally showing off her truly mammoth breasts. The bright red of her uniform barely covers any of it. Cleavage and underboob alike are on full display.");
			output("\n\nYou pull your eyes up out of her tits and back to her face after a moment of companionable silence. Buying her a drink wouldn’t be the worst thing in the world. And what would she be like ");
			if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) output("after a few more doses of Kally’s adorahol");
			else output("after she starts buzzing");
			output("? Anyone drinking that hard has got to have a wild side.");
		}
		//Buzzmoose
		else if(sylvieDrunkLevel() == 1)
		{
			output("\n\nSylvie smiles broadly at your words. <i>“Yeah. A lot of people get hung up on the uniform, but it looks really good on me too! Just because I’m not on patrol doesn’t mean I can’t stop in for a few of the best damn drinks on station.”</i> She gestures back at the bar. <i>“I dunno what they put in these things, but it’s way better than the swill over at the Bucking Beaver. And everyone is so friendly!”</i> She cheers enthusiastically, making her rack bounce dangerously before the supportive top wrangles it back into place. You could lose yourself in cleavage like that - or vanish into the underboob with one wrong bounce.");
			output("\n\nYou pull your eyes up out of her tits and back to her face after a moment of companionable silence. Buying her a drink wouldn’t be the worst thing in the world, assuming you didn’t mind getting the big girl plastered");
			if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) output(" on ‘nuki jizz");
			output(". She’d be a real handful!");
		}
		//Drunkmooze
		else
		{
			output("\n\nSylvie smiles wider than you thought possible. <i>“Yeah, some people get all worried about me bein’ a cop! Can you believe it? Like the girl who can’t keep her shirt on is going to be a stickler about getting smashed in public and doing a little corner booth humping!”</i> She gestures very pointedly at the corner booth where a pair of kaithrit have squeezed into a single seat. <i>“We don’t get a lot of trouble-makers, so I can relax as much as I want. Can even let cute spacers like you feed me drinks until I’m slurring my words and spilling my tits into your lap!”</i> she slurs, leaning forward to expose the deepest cleavage you’ve seen in this system. <i>“Oopsie.”</i>");
			output("\n\nYou pull your eyes up out of her tits after a long and serious glance. She doesn’t seem like she needs any more drinks, though she might appreciate them nonetheless. In fact, you wager she’s gunning for an altogether more licentious goal.");
		}
	}
	//Merge bimbo/bro/else
	output("\n\n<i>“");
	if(sylvieDrunkLevel() < 1) output("So, how about that drink");
	else output("How about a little snuggle while I finish this drink");
	output("?”</i> She steps over, her hooves clicking against the floor, and leans against you. She’s very warm. <i>“");
	if(sylvieDrunkLevel() <= 2) output("I can tell you all sorts of things about this station.");
	else output("I can tell you all sorts of things while we do it... unless you wanted to do something else together. Like the baths. Or a kiss.");
	output("”</i>");
	processTime(10);
	flags["MET_SYLVIE"] = 1;
	sylvieMenu();
}

public function repeatSylvieApproaches():void
{
	clearOutput();
	showSylvie();
	//Sober
	if(sylvieDrunkLevel() == 0)
	{
		output("<i>“Hey, [pc.name]!”</i> Sylvie cheerfully calls. <i>“I was wondering if you’d come back over.”</i> She shifts to bump you with her gigantic, moose-like hindquarters. <i>“I’m glad the badge didn’t run you off. Good company isn’t always easy to find, eh?”</i> Brushing her lush hair back, the police-woman flashes you a brilliant smile. <i>“So what do you say, buy the pretty girl a drink?”</i>");
		output("\n\nJudging by the empty mugs piled up at her table, recreational alcohol consumption has become an expensive hobby for the big ‘taur.");
	}
	//Buzzed
	else if(sylvieDrunkLevel() == 1)
	{
		output("<i>“Oooh, [pc.name]!”</i> Sylvie playfully canters your way, her enormous hindquarters swaying a step behind. Her fluffy little tail wiggles happily. <i>“Just the spacer I was looking for.”</i> She leans into you");
		if(pc.tallness >= 90) output(", pressing her cheek into your shoulder");
		else if(pc.tallness >= 66) output(", pressing the side of a breast against your cheek");
		else output(", pressing the side of her muscular taur-body to your cheek");
		output(". <i>“How do you feel about a hug?”</i> She smiles coyly. <i>“Or you could buy me a drink.”</i> Leaning closer, she adds, <i>“I have some stories so spicy they’d curl your hair.”</i>");
	}
	//Drunko stunko
	else
	{
		output("<i>“[pc.name]!”</i> Sylvie cheers drunkenly the moment you sway her way. <i>“Come here, you ragamuffin!”</i> She sweeps you up in her arms");
		if(pc.tallness >= 95) output(", briefly shocked when she realizes you’re so tall that there’s no need to lift you off the ground");
		else output(", lifting your [pc.feet] off the ground");
		output(". Her bra-bound breasts briefly dominate your view, capped by a sea of cleavage, before she squeezes you into a crushing embrace. <i>“I fucken missed you, ya scamp.”</i>");
		if(sexedSylvie() > 0 && pc.hasGenitals())
		{
			output(" One of her hands roams ");
			if(pc.legCount > 1) output("between your [pc.legs]");
			else output("across your crotch");
			output(" while her mouth continues to gush, <i>“I missed the fuck out of you!”</i> Her fingers brazenly caress your most tender flesh. <i>“So much...”</i> She doesn’t let you go until she feels you ");
			if(pc.hasCock()) output("fully erect and twitching against her fingertips.");
			else output("wet and wanton against her fingertips.");
		}
		output(" The moose-woman’s half-lidded eyes glitter with unrestrained passion, for life and your body in equal parts.");
	}
	processTime(5);
	sylvieMenu();
}

//Room BonusText
public function sylvieRoomBonuses(slot:int):void
{
	if(sylvieInBar())
	{
		//Sober
		if(sylvieDrunkLevel() == 0)
		{
			//Unmet
			if(flags["MET_SYLVIE"] == undefined) output("\n\nA half-moose centaur (or is that moosetaur?) leans against one of the few tables big enough to support her, dressed in the traditional garb of Canadia Station’s police unit.");
			//Met
			else output("\n\nSylvie the moosetaur police officer is at her usual table, brew in hand. Her eyes are alert but friendly as she scans the bar for trouble or entertainment - whichever pops up first.");
		}
		//Buzzed
		else if(sylvieDrunkLevel() == 0) 
		{
			if(flags["MET_SYLVIE"] == undefined) output("\n\nA moose-bodied centaur is leaning heavily against her table and making conversation with anyone close enough to listen. Somehow, she hasn’t spilled anything on her police uniform.");
			//Met
			else output("\n\nSylvie is still at her table, knocking back drinks and giving out hugs and smiles to anyone brave enough to approach the massive policewoman. Somehow, her top remains pristine.");
		}
		//Drunk
		else
		{
			//Unmet
			if(flags["MET_SYLVIE"] == undefined) output("\n\nAn obviously drunk centaur (or is that moosetaur?) girl is giggling to herself and handing out kisses like candy. Her top sits next to her on the table, no doubt discarded when she messily spilled something on herself. A few drops of foaming brew on her collarbone lend credence to this theory.");
			//Met
			else output("\n\nSylvie the moosetaur is still at her table but just barely. At some point, she shed her top, leaving the symbols of her office rumpled and discarded, and now she’s offering hugs and kisses to any and all. Over a dozen empty mugs are stacked in a haphazard pyramid on her table. Just how much has she had to drink?");
		}
		var bName:String = "Sylvie";
		if(flags["MET_SYLVIE"] == undefined) bName = "Moose-girl";
		var drunkBonus:String = "";
		if(sylvieDrunkLevel() == 1) drunkBonus += " She’s pretty tipsy, and in her current state is more than happy to hand out hugs to all who ask for them.";
		else if(sylvieDrunkLevel() == 2) drunkBonus += " She’s three sheets to the wind, kissing and cuddling anyone who shows the slightest bit of passing interest.";
		addButton(slot,bName,approachSylvie,undefined,bName,"Approach the friendly moose-girl police officer." + drunkBonus);
	}
}

public function sylvieMenu():void
{
	clearMenu();
	//Sober
	if(sylvieDrunkLevel() == 0)
	{
		//[BuyHerBeers] - Grays out if Kally is on break for any reason!
		if(pc.credits >= 6) addButton(0,"BuyHerBeer",buyBeersForMooseSloot,undefined,"Buy Her Beers","Buy the pretty girl a Doe-Eyed Draft. Only six credits!");
		else addDisabledButton(0,"BuyHerBeer","Buy Her Beer","You can’t afford the six credits it would cost for a Doe-Eyed Draft.");
		//[BuyHerShots] - Grays out if Kally is on break for any reason!
		if(pc.credits >= 22) addButton(1,"BuyHerShots",shotsShotsShotsForSylvie,undefined,"Buy Her Shots","Buy the pretty girl some of Kally’s nicest shots - Kui-Tan Creamers. Only 22 credits!");
		else addDisabledButton(1,"BuyHerShots","Buy Her Shots","You can’t afford the 22 credits it would cost for some Kui-Tan Creamers.");
		//[Chill] - Just hang out a bit
		addButton(2,"Chill",chillWithSylvie,undefined,"Chill","You don’t need to buy Sylvie drinks to woo the moose-girl.");
	}
	//Buzzed
	else if(sylvieDrunkLevel() == 1)
	{
		//[BuyHerBeers] - Grays out if Kally is on break for any reason!
		if(pc.credits >= 6) addButton(0,"BuyHerBeer",buyBeersForMooseSloot,undefined,"Buy Her Beers","Buy the pretty girl a Doe-Eyed Draft. Only six credits!");
		else addDisabledButton(0,"BuyHerBeer","Buy Her Beer","You can’t afford the six credits it would cost for a Doe-Eyed Draft.");
		//[BuyHerShots] - Grays out if Kally is on break for any reason!
		if(pc.credits >= 22) addButton(1,"BuyHerShots",shotsShotsShotsForSylvie,undefined,"Buy Her Shots","Buy the pretty girl some of Kally’s nicest shots - Kui-Tan Creamers. Only 22 credits!");
		else addDisabledButton(1,"BuyHerShots","Buy Her Shots","You can’t afford the 22 credits it would cost for some Kui-Tan Creamers.");
		//[Hug]
		//Have a semi-random hug with light petting.
		addButton(2,"Hug",hugSylvie,undefined,"Hug","Just because she’s nine feet tall doesn’t mean you can’t while away the hours wrapped in her arms.");
	}
	//Drunk - After first sexytimes, can get forcy funtimes rarely.
	else
	{
		//[Get Sexy]
		if(pc.lust() >= 33) addButton(0,"Get Sexy",sylvieSexyTimeIntro,undefined,"Get Sexy","Now that she’s finally loosened up for a bit of fun, party with Sylvie!");
		else addDisabledButton(0,"Get Sexy","Get Sexy","You aren’t turned on enough for that.");
		//[Hug]
		//Semi-random hug with heavy petting. Guarantees forcy funtimes on next drunk approach that day.
		addButton(2,"Hug",hugSylvie,undefined,"Hug","Being drunk is no obstacle when it comes to snuggling.");
	}
	//If bartender is away!
	if(kallyIsAway() && sylvieDrunkLevel() <= 1)
	{
		addDisabledButton(0,"BuyHerBeer","Buy Her Beer","The bartender is away at the moment. Perhaps try this later.");
		addDisabledButton(1,"BuyHerShots","Buy Her Shots","The bartender is away at the moment. Perhaps try this later.");
	}
	//[COMPLETE] Rutted PCs Munch Sylvie out like their life depends on it.
	//Overrides normal sex menu. Add to normal Sylvie menu
	if(pc.inRut() && pc.hasCock() && pc.cockThatFits(sylvieCuntSize()) >= 0)
	{
		output("\n\nYour nose twitches as you catch a faint hint of Sylvie’s feminine odor. It burns a line straight down your nose and all the way into your crotch, suffusing your [pc.cocks] with thoughts of how wet her pussy would get with you inside of it, how lewd it would look after you knocked her up, claimed her as your own personal breeding sow. You barely hold yourself back from jumping the big, fuckable taur-girl, suppressing your rutting body’s desires at great personal effort... for now.");
		addButton(0,"Rut Sex",ruttedSylvieBangBusPheromoneHotPotato,undefined,"Rut Sex","You can’t think of any kind of sex other than following your body’s breeding instincts at this point.");
	}
	addButton(14,"Leave",mainGameMenu);
}

//Buy Beers
public function buyBeersForMooseSloot():void
{
	clearOutput();
	showSylvie();
	output("You grab a drink menu, and after a quick glance, settle on a ");
	if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) output("Kally-infused beverage");
	else output("nice beer");
	output(" for your tauric companion.");

	//Bimbo
	if(pc.isBimbo()) 
	{
		output("\n\n<i>“Oooh, how about a Doe-Eyed Draught? Sounds perfect for someone as pretty as you!”</i> you enthuse. <i>“");
		if(flags["MET_KALLY"] == undefined) output("The menu says they’re like, totally yummy.");
		else output("Kally says they’re like, totally yummy.");
		output("”</i>");
	}
	//Bro
	else if(pc.isBro())
	{
		output("\n\n<i>“If I’m buyin’, I’m pickin’,”</i> you state. <i>“Doe-Eyed Draught.”</i> You brazenly check out her cleavage before flicking your eyes back up to her face. <i>“Hope you’re as thirsty as I am.”</i>");
	}
	//Nice
	else if(pc.isNice())
	{
		output("\n\n<i>“How about a Doe-Eyed Draught?”</i> you suggest, looking Sylvie’s way for approval. Judging by her smile, she’s game. <i>“Great. They’re supposed to be one of this place’s specialties, but I suppose you’d know that better than anyone");
		if(flags["MET_KALLY"] != undefined) output(", save for maybe Kally");
		output(".”</i>");
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		output("\n\n<i>“Doe-Eyed Draught? Hrmmm,”</i> you tap your chin as if deep in thought. <i>“I guess you must have drank all the ‘Moose-Girl Majesty,’ then? Well, we can always settle for second best, I suppose.”</i> You wink.");
	}
	//Hard
	else output("\n\n<i>“You’re getting some Doe-Eyed Draught,”</i> you announce. <i>“You’ll love it, I’m sure.”</i>");

	//Merge
	//Sober
	if(sylvieDrunkLevel() == 0)
	{
		output("\n\nSylvie puts her hand on your arm while you place the order, squeezing gently. <i>“That sounds perfect.”</i> She shakes her head, waves of hair cascading down her back. One of her antlers nearly clocks the side of your face. <i>“You’re a real nice [pc.guyGirl], you know that? A hero even, bringing thirsty maidens the brew they so desperately need.”</i>");
		output("\n\n");
		if(flags["MET_KALLY"] != undefined) output("Kally");
		else output("The bartender");
		output(" swings by with a foamy mug a minute later, depositing it in front of the ecstatic mountie.");

		output("\n\nScooping it right up, Sylvie mock-salutes ");
		if(flags["MET_KALLY"] != undefined) output("Kally");
		else output("the chubby bartender");
		output(" and begins to chug. She’s quite adept at pounding down the drink if the falling fluid level is any indication. Half the drink is gone before she comes up for air, smiling and licking the amber foam from her greenish blue-painted lips. <i>“Since you’ve been such a " + pc.mf("gentleman","classy lady") + ", it seems only fair I give you a little entertainment for your effort. Good thing a girl with a job like mine has enough stories to keep you entertained ‘til closing time.”</i> She wraps an arm around your shoulders and pulls you close. <i>“Things around here can get pretty wild at times...”</i> She pauses for dramatic effect.");
		//Merge to sober stories
		moosyStoriesGo(2,false);
	}
	//Buzzed
	else if(sylvieDrunkLevel() == 1)
	{
		output("\n\nSylvie giggles at you. <i>“Oooh, I do love those.”</i> She looks over at her pile of empty mugs. <i>“I’ve only had... ");
		//14-25
		if(hours < 20) output("14");
		else if(hours < 21) output("15");
		else if(hours < 22) output("17");
		else if(hours < 23) output("19");
		else if(hours < 24) output("20");
		else if(hours == 24 || hours == 0) output("21");
		else if(hours == 1) output("22");
		else if(hours == 2) output("23");
		else output("24");
		output("... or something tonight. It’ll take at least... two times that many to get me really hammered.”</i> She leans heavily against you and whispers. <i>“You’re not trying to get me hammered so you can get in my little horsey-panties, are you?”</i> Snorting, the buzzed taur-girl giggles again. <i>“Cause it won’t work. I’m not wearing any!”</i> She laughs harder.");
		output("\n\nThe order arrives while Sylvie is too busy laughing to respond.");
		if(flags["MET_KALLY"] != undefined) output(" Kally winks at you when she drops off the drink and swats her tail against your [pc.butt] on the way out.");
		else output(" The bartender smiles warmly at Sylvie as she drops off the drink, even going so far as to pet the titanic ‘taur’s bottom half before going.");

		output("\n\nFinally calming, Sylvie waves to ");
		if(flags["MET_KALLY"] != undefined) output("Kally");
		else output("the kui-tan server");
		output(" and lifts her drink, setting into it with gusto. The level of fluid in her mug drops so rapidly that you briefly consider that she might be inhaling the beer rather than drinking. Your theory is further bolstered by the incredible burp Sylvie unleashes the moment she polishes off her beverage. It’s a full-bodied, bone-rattling belch, loud enough to generate a round of applause from some of the other patrons. Stars, the girl can drink!");
		output("\n\n<i>“Excuse me.”</i> Her apology is so dainty you can scarcely believe it came from the same woman. <i>“You know, some cultures call alcohol the devil’s drink.”</i> Leaning closer, Sylvie begins to idly rub your back. With her inhibitions dampened by drink, she sees nothing wrong with stroking you affectionately or pulling you tight up against her side, forcing you to bask in her superhuman body heat. Being this close is like standing at the entrance to a sauna. <i>“You wanna hear something crazy?”</i> She pauses to let her booze-burdened brain catch up with her mouth. <i>“It’s pretty slutty, but you’re cool, right?");
		if(sexedSylvie() > 0) output(" Of course you’re cool! What am I thinking?");
		output("”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“Great!”</i> Sylvie pours herself a fresh mug from a pitcher on the far side of the table. <i>“Let me know if I get out of hand.”</i> She blushes. <i>“");
		if(sexedSylvie() <= 0) output("I don’t want to impose on Kally. She’s such a sweetie. I don’t want to cause her trouble if I get too tipsy and randy.");
		else output("I seem to get so worked up around you. I dunno why, but I guess you get to look out for us both.");
		output("”</i>");
		output("\n\nYou assure her that you will.");
		//Merge to buzzo stories.
		syvlieBuzzedStories(2,false);
	}
	processTime(7);
	pc.credits -= 6;
}


//Buy Shots
public function shotsShotsShotsForSylvie():void
{
	clearOutput();
	showSylvie();
	pc.credits -= 22;
	//If PC is buzzed or more
	if(pc.isBuzzed() || pc.isSmashed() || pc.isDrunk())
	{
		output("<i>“Shots! Shots! Shots! Shots! Shots! Shots! Shots-shots! Everybody!”</i> you shout ebulliently, hurriedly waving the bartender over.");
	}
	//Bimbo
	else if(pc.isBimbo())
	{
		output("<i>“A couple of shots’ll loosen you up!”</i> you declare, hands on your hips. <i>“They’re like, liquid fun enhancers in teeny tiny, adorable bottles.”</i> You indicate just how small shot-glasses usually are with your fingers, completely oblivious to the fact that Sylvie is clearly the type of girl to know what a shot is. <i>“You’ll love ‘em. They’re suuuper good!”</i>");
	}
	//Bro
	else if(pc.isBro()) output("<i>“Shots,”</i> you rumble, waving to the bartender. <i>“Shots for my four-legged friend. Make ‘em strong.”</i>");
	//Nice
	else if(pc.isNice()) output("<i>“How about some shots?”</i> you suggest, looking to Sylvie for approval. Noting her too-pleased smile, you wave down the bartender and call, <i>“Kui Creamers for the pretty police-girl!”</i>");
	//Mischievous
	else if(pc.isMischievous()) 
	{
		output("<i>“How about we double the pleasure and double the fun,”</i> you suggest.");
		output("\n\nSylvie cocks her head and blushes, not quite catching on.");
		output("\n\nYou holler, <i>“A pair of Kui Creamers for my friend,”</i> at the bartender, waving boisterously until you’re sure she’s gotten the order. <i>“What?”</i> you add, <i>“You didn’t think I meant...”</i> Chuckling, you lean closer to the crimson centaur. <i>“Enjoy the drinks, and maybe we can see about </i>that<i> kind of pleasure after.”</i>");
	}
	//Hard
	else
	{
		output("<i>“A pair of Kui Creamers for the lady,”</i> you call toward the bartender. <i>“You look like a girl who can handle her liquor. I hope I’m not wrong.”</i>");
	}
	//Merge
	output("\n\n");
	if(flags["MET_KALLY"] != undefined) output("Kally");
	else output("A chubby kui-tan in a tightly-cinched corset");
	output(" arrives with the drinks a second later, placing the two tiny glasses before the nine-foot tall moosetaur. <i>“Here you are.”</i>");

	output("\n\nYou transfer the credits for the bill before she leaves.");
	//Sober	
	if(sylvieDrunkLevel() == 0)
	{
		output("\n\n<i>“Mmm, I love these,”</i> Sylvie ");
		if(pc.isMischievous()) output("blithely changes topic, her flush fading.");
		else output("says with an ecstatic smile.");
		output(" <i>“If I could afford to, I’d only drink these. You can barely taste the alcohol.”</i> To demonstrate, she lifts one to her mouth and knocks it back. The shot glass seems almost microscopic next to the enormous woman, a point she’s happy to drive home by coyly dropping the empty vessel into her cleavage. <i>“Mmm, it’s like heaven in a bottle.”</i> She sighs, absolutely delighted by the flavor, and raises the second in your direction. <i>“To good friends.”</i> The ");
		if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) output("kui-tan cum-laced");
		else output("alcoholic");
		output(" beverage vanishes with a single gulp, and Sylvie drops the emptied shot into her tits.");

		output("\n\nSomehow, it lands perfectly inside the first glass, clinking softly.");
		output("\n\n<i>“Fuck, that hits the spot,”</i> the moosetaur moans, leaning back against her own lower body, canting her torso at an angle that displays sinful amounts of underboob. She looks your way, licking the last of the liquid from her lips and smiling. <i>“I suppose I owe you something for that. I hope a story will do.”</i> She steps a little closer, hooves clicking on the floor. <i>“I’ve got some real whoppers... besides these.”</i> She hefts her tits and giggles, already loosening up a little from the alcohol. She reaches across the table to pour herself another beer. <i>“Now, the only question is, what story do I tell? There are so many...”</i> She mulls it over for a second.");
		processTime(5);
		//Merge into normal chats.
		moosyStoriesGo(4,false);
	}
	//Buzzed
	else
	{
		output("\n\n<i>“Oh my stars, you are an angel,”</i> Sylvie declares, sweeping you up into a hug before you can react in the slightest.");
		if(pc.biggestTitSize() >= 9) output(" Her breasts crush against your own, the paired tits slipping exquisitely against one another despite the intervening layers of fabric.");
		else output(" Her breasts crush against you, large enough that you’d likely disappear into her cleavage if it wasn’t for the fabric barrier of her uniform.");
		output(" <i>“You are so wonderful, [pc.name]. I can’t believe you have the money to throw around on drinks like these.”</i> She snuggles against your shoulder, breathing deep, before she finally lets you go.");
		if(pc.tallness < 60) output(" Thankfully, the fall to the floor is short enough that you aren’t injured.");
		output(" <i>“You won’t regret it, I promise.”</i>");
		output("\n\nYou’re nearly bowled over by the big ‘taur when she clatters closer to rub her hindquarters against you. She wobbles once, then catches you and pulls you closer. She is very, very warm.");
		output("\n\n<i>“Oopsie! I guess I’m starting to get a little tipsy.”</i> Sylvie straightens and grabs the first shot, knocking it back in a single swallow. <i>“But the night’s just starting, eh?”</i> She pushes the empty glass down into her tits and grabs the next, inhaling it before you can comment on her increasing intoxication. <i>“Whoo! That hits the spot.”</i> She emphasizes the word ‘spot’ by pressing the other glass in alongside the first. It’s difficult to look away from the sinful levels of exposed cleavage and glittering glass. The clear vessels actually let you see deeper into her tits, now that you’re looking closely.");
		output("\n\nLetting out a belch loud enough to make her breasts quake and the shot glasses burrow deeper, Sylvie claps her hands across her traitorous mouth. <i>“Oopsie! Excuse me.”</i>");
		output("\n\n<i>“No problem,”</i> you say, wondering when you’ll lose sight of the emptied containers.");
		output("\n\n<i>“Oh, you’re not jealous of them, are you?”</i> Sylvie offers, plucking the shot glasses from the midst of her more than ample bosom. <i>“Here,”</i> she offers, setting them down and ");
		if(pc.tallness < 70) output("leaning over so that she can press your face into the heavy globes");
		else output("pulling you into her heavy globes");
		output(". <i>“It’s the least I can do for such a generous gentle[pc.manWoman]!”</i> She even pulls the hem of her uniform down to give you better access, though not quite far enough to expose a nipple.");
		output("\n\nSylvie’s cleavage smells faintly of fruity soap and the heady scent of spilled beer. Her breasts are all around you, pressing in on your cheeks, blocking out any light beyond a reddish-pink, all-encompassing haze. You can hear her heartbeat in your ears, thudding faster by the second, but you can barely breathe. She’s stiflingly warm, hot enough that after a few seconds you have to struggle free, gasping for breath.");
		output("\n\n<i>“You’re a real sweetie, but I think Kally would skewer me if I left you in there any longer. Besides, good conversation can be just as much fun with the right person, and I assure you, I am the rightest person you’re going to find.”</i> Sylvie gives her boobs a congratulatory pat and pours herself another glass of beer from a pitcher on the table. <i>“Did I ever tell you about- no, wait! I’ve got a way better story, but brace your ears because it’s pretty sordid!”</i>");
		processTime(5);
		//To buzzo stories.
		syvlieBuzzedStories(4,false);
	}
}

//Chill
public function chillWithSylvie():void
{
	clearOutput();
	showSylvie();
	//Kally AWOL
	if(kallyIsAway())
	{
		output("<i>“Looks like Kally isn’t taking orders at the moment. I guess we’ll have to settle for good conversation,”</i> you offer.");
	}
	//Kally there
	else output("<i>“The bartender seems pretty busy. How about we trade stories?”</i> you offer.");
	//Merge - first time
	if(flags["SYLVIE_CHILLED"] == undefined)
	{
		output("\n\nSylvie regards you curiously. <i>“You must have a whopper to tell then. Go on. I’ve still got to wet my whistle.”</i> She produces another beer and takes a slow sip, savoring slowly until the bartender can bring reinforcements.");
	}
	//Second time
	else if(flags["SYLVIE_CHILLED"] == 1) output("\n\nSylvie produces another drink from her dwindling pitcher, but she sips it slow this time. <i>“Works for me. But you’ll have to lead off since you didn’t pay the booze toll.”</i>");
	//2+
	else output("\n\nSylvie regards you curiously. <i>“You know, I’m starting to think you don’t really know how this whole bar thing works. Lucky for you, you’ve got plenty of rimworld escapades to regale me with.”</i> She produces a beer and takes a slow sip on it. <i>“And I’ve still got a few more beers. We can make this work.”</i>");
	
	IncrementFlag("SYLVIE_CHILLED");
	
	//PC story bit.
	var select:Number = 1 + rand(3);
	var options:Array = [];
	var subSelect:Number = 0;
	//1 - Space
	if(select == 1)
	{
		output("\n\nYou tell her of the strange things you’ve seen while piloting your ship in space, how no amount of schooling can prepare you for a whole wide universe of possibilities, and about one time you ");
		if(rand(5) == 0) output("nearly planted the nose into the side of an asteroid");
		else if(rand(4) == 0) output("had to land on manual when the nav systems shorted out. A little embellishment makes it seem far more thrilling than it actually was");
		else if(rand(3) == 0) output("flew by a pleasure yacht that had left its comm. systems open, broadcasting high definition holo of the occupants’ kinky bedroom activities to everyone in a few dozen kilometers");
		else if(rand(2) == 0) output("saw some radiation spikes with no discernable source or explanation. They vanished before you could get close enough to measure them. Spooky");
		else output("saw another ship nearly crash into the side of a jumpgate. It only grazed the side, but it was enough to back up traffic for an hour while repair crews struggled to get it up and running again. You wonder what would happen if something like that happened, just as you were using it");
		output(".");
	}
	//2 - Aliens
	else if(select == 2)
	{	
		if(CodexManager.entryUnlocked("Zil")) options.push(1);
		options.push(2);
		if(CodexManager.entryUnlocked("Venus Pitchers")) options.push(3);
		if(CodexManager.entryUnlocked("Vanae")) options.push(4);
		if(CodexManager.entryUnlocked("Raskvel")) options.push(5);
		if(CodexManager.entryUnlocked("Sydians")) options.push(6);
		if(CodexManager.entryUnlocked("Gray Goos")) options.push(7);
		if(CodexManager.entryUnlocked("Gold Myr")) options.push(8);
		if(flags["QUEEN_OF_THE_DEEP_ENCOUNTERED"] != undefined) options.push(9);

		subSelect = options[rand(options.length)];

		output("\n\nYou decide to tell her about some of the aliens you’ve met in your travels");
		if(subSelect == 1) output(", and how there’s a whole species of wasp-people on a jungle planet that try to rape each other as a means of introduction - something that seems all too common these days...");
		else if(subSelect == 2) 
		{
			output(", and how cunt-snakes have already infested new planets like Mhen’ga. ");
			if(!pc.hasCuntTail() && !pc.hasParasiteTail()) output("The damned things are everywhere!");
			else output("Fortunately, she doesn’t seem to mind you having one. Plenty of the local predators on Vesperia have adapted to eating them.");
		}
		else if(subSelect == 3) output(", and how Mhen’ga has an entire race of plant-women who seem to reproduce almost entirely through tricking other sapients into tentacle-filled pits.");
		else if(subSelect == 4) output(", and how there are these strange, blind squid-girls on Mhen’ga - a jungle planet of all places. The icing on the cake is their seemingly complete and total fixation on cum.");
		else if(subSelect == 5) output(", and how there’s a whole race of repair-fetishists on Tarkus. The machine-loving raskvel seem to get off on fixing up junkers almost as much as they get off on laying eggs. And they really love laying eggs.");
		else if(subSelect == 6) output(", and how there’s a whole race of metal-eating bug-men on Tarkus. Lucky for them, the whole planet is basically a junk pile. It’s a wonder they haven’t taken it over already.");
		else if(subSelect == 7) 
		{
			output(", and how there’s swarms of sapient microsurgeons on Tarkus. They’re sort of like galotians in a way: ravenous for sexual fluids and plenty ditzy.");
			if(flags["DECK13_GRAY_PRIME_DECISION"] != 3 && flags["DECK13_GRAY_PRIME_DECISION"] != undefined) output(" It turns out they’re actually the survivors of a deep space exploration vessel, and you did what you could to help them.");
		}
		else if(subSelect == 8)
		{
			output(", and how there’s two kinds of ant-women on Myrellion who can’t get along despite a great many similarities. The gold ones have huge tits, just like Sylvie, while merely kissing a red can induce enough lust to make a tree stump sprout wood.");
		}
		else output(", and how you discovered a strange sort of spider-squid-woman-thing deep, deep, deep underground. Talk about scary!");
	}
	//3 - Tech
	else if(select == 3)
	{	
		if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined) options.push(1);
		if(flags["SEXBOT_QUEST_STATUS"] == 3) options.push(2);
		if(pexigaRecruited()) options.push(3);
		if(CodexManager.entryUnlocked("Gold Myr")) options.push(4);
		subSelect = options[rand(options.length)];

		output("\n\nYou decide to tell her about one of the crazy things you’ve seen. ");
		if(subSelect == 1) 
		{
			output("Tarkus itself fits the bill - two half planetoids bound together by a sophisticated gravity tether.");
			if(completedStellarTetherGood()) output(" Those pirates could’ve wiped all the inhabitants if you hadn’t stopped them!");
			else output("It’s a shame the pirate’s bomb wiped it off the map. There’s nothing more than a metal rich asteroid field to mark where it used to be.");
		}
		else if(subSelect == 2) output("A rogue AI-D on Tarkus was going to overrun the planet, maybe even the galaxy, with deranged sex-bots. You’d read about similar things in the history books in school but never expected to encounter such a thing in real life.");
		else if(subSelect == 3) output("How a mad scientist set up a shop on Tarkus as a front for all kinds of perverted technology. The bizarre and depraved machinery you saw on your quest to <i>“fix”</i> the Pexiga was unlike anything else out there.");
		else output("About how the gold myr use bioluminescent fungus to illuminate their underground cities rather than electricity. How they eat the stuff too - that and boob-nectar from their so-called <i>“honeypots”</i>.");
	}
	//Semirandom reactions
	//Aliens
	if(select == 1) output("\n\n<i>“Damn the rush sounds wild.”</i> Sylvie sets her mug down and looks at you with undisguised respect. <i>“Things here seem so much less exciting by comparison, eh? Well, I’ve got a few interesting tales to weave myself...”</i> She pauses for dramatic effect.");
	//Space
	else if(select == 2) output("\n\nSylvie shakes her head. <i>“I know I’m living in a space station, but I think I’m kind of glad I don’t have to go out there...”</i> she gestures wildly, <i>“...on the fringe. You never know what you’re going to run into. Here, things are so much more predictable. Well, most of the time...”</i> She pauses for dramatic effect.");
	//Tech
	else if(select == 3) output("\n\n<i>“I have to say, at times like this, I’m glad to be a Vesperian girl. Between ethics boards, safety committees, and the amazing scientists planet-side, we get the best of both worlds: incredible technology and it doesn’t turn us all into mutant freaks... or something worse.”</i> Sylvie nods smugly. <i>“But just because we’re safer than at the core doesn’t mean I haven’t seen some crazy shit...”</i> She pauses for dramatic effect.");
	clearMenu();
	addButton(0,"Next",moosyStoriesGo,1);
}

//SoberStories
public function moosyStoriesGo(drunklevelChange:Number = 1,newPage:Boolean = true):void
{
	if(newPage)
	{
		clearOutput();
		showSylvie();
	}
	else output("\n\n");

	var storySelect:Number = rand(9);
	//Potential Stories:
	//Gush addict ODs in a service hallway. All two dozen kaithrit on station volunteer to clean it up.
	if(storySelect == 0)
	{
		output("<i>“This one time, some Gush-head - don’t ask me how she got that stuff this deep coreward without getting caught in an inspection - decided to see what three or four doses at once would feel like.”</i>");
		if(flags["USED_GUSH"] != undefined) output("\n\nYou try not to break out into a nervous sweat.\n\n");
		else output(" ");
		output("Sylvie rolls her eyes. <i>“I don’t know how these people get mixed up in stuff like that. It’s not that hard to stay away from the hard stuff. For me, the drinks here are my limit. Anything more is insanity. Just make a choice!”</i> The big taur-girl self-assuredly nods at you, assuming your agreement automatically. <i>“Anyway, this poor thing’s tits - which were already bigger than mine, by the way - they blow up like fucking beach balls and start spraying milk </i>everywhere<i>. And I mean everywhere. Trust me; I watched the security feed.”</i>");
		output("\n\n<i>“Wow.”</i>");
		output("\n\n<i>“Wow is right,”</i> Sylvie gushes. <i>“Like geysers. And the bigger her boobs got, the more they sprayed!”</i> She motions with her hands, jostling her boobs around until she catches you looking. With a mischievous smile, the police-woman continues, <i>“It took us thirty minutes to get a response team there. At the time, we didn’t know if it was a drug overdose or some sort of biological factor, and even after all that time she was still going. You know what the weirdest part is?”</i>");
		output("\n\nYou shake your head, curious.");
		output("\n\n<i>“We didn’t have to clean up any of it ourselves.”</i> Sylvie giggles to herself, content in her secret for a moment. <i>“Once word got out, just about every kaithrit on the station found their way down to the accident site. The milk came back clear from contaminants, so we let ‘em go at it. An hour later there wasn’t a drop left to be found anywhere, though I swear that corridor still smells like a dairy.”</i> She shakes her head and laughs. <i>“So much for avoiding stereotypes, eh?”</i>");
		output("\n\nLaughing along with her, you can’t shake the image of twenty or thirty kaithrit, crawling all over a hallway in search of more creamy milk.");
		if(pc.catDog("nyan", "bork") == "nyan") output(" Not that you can blame them. You’d likely do the same, given the chance.");
		output("\n\nSylvie drinks a little bit more, eyes twinkling. <i>“");
		processTime(13);
		pc.lust(5);
		// apply booze
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() == 0) output("So about another drink?");
		else output("Mmm, you’re really " + pc.mf("handsome","pretty") + ", you know that? A story like that deserves a hug...");
		output("”</i>");
	
		sylvieMenu();
	}
	//Five Treated Bulls walked into the bar...
	else if(storySelect == 1)
	{
		output("<i>“So, we had five New Texan bulls come visit the station once. I don’t really remember what for - that part isn’t really all that important, I suppose. What is important is when they finished up their job and stopped in here for pints before heading back home.”</i>");
		if(pc.isBro()) output("\n\nYou half grunt, half-laugh, knowing full well where this is going.");
		else if(CodexManager.entryUnlocked("The Treatment")) output("\n\nYou chuckle, already having a pretty good idea where this is going.");
		else output("\n\nYou look on inquisitively, curious where this is going.");
		output("\n\n<i>“They smelled like gods");
		if(pc.isTreated() && pc.isBro()) output(" - sort of like you do.”</i> The big taur girl leans in closer and sighs happily. <i>“And");
		else output(", and");
		output(" they had the physiques to back it up. You might not think it, but for two-legged guys, they were packing horse-level equipment - big enough to make a big-dicked deertaur blush in shame. I mean the outlines in those tight, denim jeans of theirs were absolutely enormous - flaccid. Well, for the ones without sheaths anyway.”</i> Sylvie leans down and uses her hands to show you just how long the example boner would’ve dangled down from her waist. <i>“A real treat for the eyes, those boys.”</i>");
		output("\n\n<i>“And?”</i> you try to steer her back to the conversation at hand.");
		output("\n\nSylvie takes a sip of her drink to settle herself and flashes you a knowing smile. <i>“And the five of them sat down right over there,”</i> she points to a nearby table, <i>“and started arm-wrestling. They were already sweaty, but in a few minutes, they were glistening. You could chart the progress of their pheromones wafting across the room by the wet patches breaking out in crotches all over. I’ll admit, I got a little randy myself.”</i> The blush on her cheeks indicates she got more than a little randy. She takes another quick drink to try and compose herself. <i>“After fifteen minutes of this, damn near every female, herm, and curious male in the joint was clustered around the table, pawing at their favorite bull, plastering him with kisses when he won.”</i>");
		output("\n\n<i>“What about you?”</i> you ask, giving Sylvie a serious look.");
		output("\n\nThe magnificent moose-woman flushes still hotter. If her skin were any brighter, you’d worry she was about to burst into flame. <i>“I kept Kally from doing anything she would regret. What are friends for, right?”</i>");
		output("\n\nYou ");
		if(!pc.isAss()) output("barely manage to keep from rolling your eyes");
		else output("roll your eyes");
		output(". It’s quite clear just how her and the bartender held themselves back: vigorous application of genital stimulation, or in baser terms: Repeated, feverish fucking. <i>“So did the place just break out into an orgy, or what?”</i>");
		output("\n\nSylvie actually looks offended at that. <i>“What? No, of course not. We very politely informed the minotau-err... gentlemen and their friends that we had a lovely bathing area where nudity and adult activities are allowed.”</i> She gestures at the room to the south. <i>“I might have spent a few minutes cuddling one first... and let him feel me up - it was the only honorable thing to do after giving him such a stiffy! But we didn’t break any obscenity laws.”</i> Her bluish-green lips curl with mirth. <i>“Then it turned into an orgy. Kally and I are above such things, naturally. We watched from one of the more distant tubs.”</i> A sigh so low it almost sounds like a moan bubbles out of her throat. <i>“I’ve never seen so many girls get so vigorously pounded. They’re like fuck-machines, [pc.name]. One girl after another - BAM! Fucked silly. POW! Drooling in the dirt, leaking cum from both ends. Once they finally finished up, Kally had to shut down the bar for three hours just to vent the pheromones and mop up all the jizz.”</i>");
		output("\n\n<i>“Wow.”</i>");
		output("\n\n<i>“And you thought your stories were wild, eh?”</i> Sylvie smiles and finishes her drink. <i>“");
		processTime(15);
		pc.lust(10);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() == 1) output("Mmm, and I’m still feeling a little warm. How about a hug? Or another drink...");
		else output("How about a drink? Surely a story like that is worth a few of your credits.");
		output("”</i>");
		
		sylvieMenu();
	}
	//Scumbag tries to inject her with Throbb, has #BigDickProblems for an hour.
	else if(storySelect == 2)
	{
		output("<i>“So, I’ve actually sort of done Throbb. Once. Not on purpose or anything. Some hoser I busted for indecency thought he could get revenge by sticking me with a double-dose of it while I was on duty. Lost five or six teeth for the trouble. Word of advice, [pc.name] - don’t be standing behind any kind of centaur unless she wants you there.”</i>");
		output("\n\n");
		if(!CodexManager.entryUnlocked("Throbb")) output("You look her up and down, unsure exactly what the drug is supposed to do. <i>“What’d it do to you?”</i>");
		else if(pc.isBimbo()) output("You lick your lips and peer around her flank to look for the dick. Sadly, none appears. <i>“Where’s the dick?”</i>");
		else output("You look around her flank, trying to spot the male organ you undoubtedly missed. <i>“I don’t see any dick. You get it removed?”</i>");
		output("\n\nSylvie’s fluffy little moosetail flutters as she giggles. <i>“One of the perks of being in the Vesperian police forces is a top of the line GeneGuard immune system. It doesn’t just protect us from poisons and pathogens - it repairs genetic damage on the fly, counters most transformations too. It’s a double-edged sword, but it keeps me safe.”</i> She pats her flat tummy affectionately. <i>“But sometimes the really strong stuff temporarily overloads it.”</i>");
		output("\n\n<i>“What happened?”</i> You lean in, genuinely interested in her reaction to the illicit drug.");
		output("\n\n<i>“What happened?”</i> Sylvie smiles roguishly. <i>“I grew a four foot dick, that’s what happened! There I am, cuffing the poor, misguided moron when the whole room spins on its axis. Apparently I dropped like a sack of rocks, just flopped over on my flank and lay there laughing like a hyena. I don’t really remember the laughing part, but I do remember feeling that dick boil up out of my loins, all hot and tight and throbbing. I guess that’s where the drug gets its name from, because after a second or two, that’s about all I could really feel - incredible, blissful throbbing.”</i>");
		output("\n\nA faraway look blossoms in the police-woman’s eyes. <i>“I remember cumming before it had even fully formed. I must have sprayed a gallon of the stuff, but it was like it didn’t matter. The stupid dick kept growing, and with every inch it swelled between my legs I felt less and less like resisting it. Have you ever been so tired that laying down in bed feels like absolute heaven? It was like that, like I knew that the moment I laid my hands on it, I’d get to orgasm again and again.”</i>");
		output("\n\nYou ask her if she did.");
		output("\n\n<i>“Of course I did!”</i> Sylvie thumps the table, nearly spilling her drink. She gives the beer an apologetic glance, then picks it up to down a little more. <i>“That’s what drugs like that do to you. I jerked myself off for fifteen minutes straight like some kind of depraved animal, dumping five or six loads over the guy that dosed me. I even tried to hit the crowd that gathered around me.”</i> She smiles fondly. <i>“Even had a cute girl try to drink straight from the tap. She got blasted a few feet back, though.”</i>");
		output("\n\nYou look at the giddy taur in shock.");
		output("\n\n<i>“It’s true. I got a copy of the security holo back at my bunk. They still call me ‘Six-Gallon Sylvie’ at HQ, sometimes.”</i> The moose-woman proudly preens. <i>“It’s always nice to know that if I ever wanted to hang up the law woman routine and throw my life away, I’d have the biggest dick on the station.”</i>");
		output("\n\nYou lean back to digest what she’s had to say. <i>“How long did it take to wear off?”</i>");
		output("\n\nSylvie replies, <i>“Do you mean ‘how long were you a big-dicked sex-fiend?’”</i> She winks. <i>“About an hour. I got hauled off before too long and put in confinement with a breeding relief stand - for races that get hit by rutting season really, really hard. I’m pretty sure I was still grinding up on it long after the dick went away. I guess my body might have recovered, but part of my mind wanted to keep going. I got two days paid leave to recover, got blitzed off my ass in here, and went back on duty afterward.”</i>");
		output("\n\n<i>“And the guy who drugged you?”</i>");
		output("\n\nShe smirks. <i>“Spending another two years in jail. Assaulting an officer is a stupid idea, I don’t care what planet you’re on.”</i>");
		output("\n\n");
		if(flags["RIYA_PUNCHED"] == 2) output("Maybe you shouldn’t have decked Riya.");
		else output("Isn’t that the truth.");
		output("\n\n<i>“");
		processTime(17);
		pc.lust(15);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() == 0) output("By my estimates, a story that good deserves a drink.");
		else output("Mmm, these beers are really getting to me. Wanna buy me shots? I bet I can come up with an even better story.");
		output("”</i>");
		CodexManager.unlockEntry("Throbb");
		sylvieMenu();
	}
	//Pirates try to rob a jewelry store, get blinded by their own weapons when they refract through precious gemstones and blind them
	else if(storySelect == 3)
	{
		output("<i>“You ever see what happens when laser weapons refract into someone’s eyes? I have. It ain’t a pretty sight, even when the victim is responsible for their own state.”</i> She shakes her head.");
		output("\n\n<i>“What happened?”</i>");
		output("\n\nTaking a long drink, the somber law-woman explains, <i>“A group of pirates figured they’d make a run at the jewelry store on Merchant Deck. It’s a pretty big deal here. Clients from other systems actually fly in to get custom work done there, and because of that, they’ve got quite a stockpile of gems in the back.”</i> Sylvie spreads her hands apart as to demonstrate the excessive amount of precious stones. <i>“So these poor deluded pirates manage to get in, grab the gems, and tie up the staff in a backroom, all before the police response team arrives.”</i>");
		output("\n\nYou nod attentively, curious how the pirates managed to blind themselves.");
		output("\n\n<i>“So one of these geniuses decides to show my comrades in arms how serious he is by firing his weapon straight into the air. Only problem is, the ceiling is mirrored. I’m talking high quality, maximum refraction, luxury mirrors. The beam hits it, reflects right back down, burns a hole into the sack of gems - where it’s split into something like 100,000 different, weaker beams. Instead of being strong enough to kill a man, they’re only potent enough to give a nasty burn... or blind someone after bouncing around the mirrored shop four or five more times.”</i> Sylvie seems split between amusement and empathy. <i>“By the time a single officer busts through the doors, there’s five guys rolling around, covered in splotchy sunburns and screaming to high heaven. The gems were fine, of course.”</i>");
		output("\n\nYou shake your head. <i>“Crime really doesn’t pay.”</i>");
		output("\n\nSylvie agrees, <i>“It really doesn’t, but you know what does? Buying a pretty girl a drink. Where else are you going to find entertainment this good?”</i>");
		processTime(10);
		sylvieDrunkBump(drunklevelChange);
		sylvieMenu();
	}
	//Six nearly feral galotians were found living in the walls, feeding off glory holes they carved in different bathrooms.
	else if(storySelect == 4)
	{
		output("<i>“We actually had galotians living in the walls here. Not here-here, but in the station itself. We thought there was only one or two, at first, but after a thorough scan for life signatures, we wound up hauling six of the pretty little things out of the ductwork and crawlspaces. I don’t know why they decided to live in there. Maybe they thought it was comfy.”</i> Sylvie shrugs. Her rack wobbles. <i>“All I know is that they had forty or fifty different secret glory holes carved into bathrooms to feed themselves. None in Kui Country, but there were a few in private residences. Two renters actually sent in complaints about it. I guess they assumed their apartment came stocked with a goopy sex-toy.”</i>");
		output("\n\nYou question, <i>“Did you have to kick them out?”</i>");
		output("\n\nSylvie laughs at that. <i>“I know, having goo-girls to bang on call sounds pretty great, but there’s all sorts of issues. What if someone below the age of maturity messes around with one? What if they cause a short in a critical life support system while they’re slithering their pseudopods through the walls? What if they transmit STDs to half the station’s population? We couldn’t let it go on, so we busted them.”</i> She sighs heavily. <i>“The poor dears were as dumb as I’ve seen galotians come, but some generous soul donated some refined Picardine once word got out. Apparently it’s a type of gemstone they can use to boost their intelligence?”</i>");
		output("\n\nThat definitely sounds familiar. You nod.");
		output("\n\n<i>“Nowadays they’ve got their own legal business set up on Red Light Deck. ‘Six Slippery Sluts’ or some such, though I think they’ve divided enough that it’s more like 46 sluts by this point. At least they’ve been model citizens ever since they got out of the slammer.”</i> Sylvie seems supremely proud of that fact. <i>“");
		processTime(13);
		pc.lust(5);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() == 0) output("Now how about a drink and another story?");
		else output("Gosh, you’re such a great listener. How about a hug?");
		output("”</i>");
		sylvieMenu();
	}
	//Some hacker kid - Simmembra? Something like that... Anyway she hacked climate control to make it snow for Christmas and everyone nearly froze to death.
	else if(storySelect == 5)
	{
		output("<i>“We had a real, honest-to-god white Christmas three years back, with snow and everything. I’m not kidding. We had snow drifts four feet tall under some of the bigger vents. It was absolutely beautiful... and quite nearly killed some people.”</i>");
		output("\n\n<i>“How?”</i> you wonder. <i>“It’s just snow...”</i>");
		output("\n\nSylvie snorts. <i>“No doubt that’s what the hacker thought too. She didn’t stop to think what would happen to all the people who live on a climate controlled station without any cold-weather clothing in their quarters, or the shorts all the condensation would cause. But given the hacker was all of fourteen or fifteen, I suppose I shouldn’t have expected too much from her.”</i>");
		output("\n\n<i>“Wait, some kid pulled this off?”</i>");
		output("\n\n<i>“Yeah,”</i> the big woman answers. <i>“Sym... Symmembra or something, I think. I probably butchered her name. She thought it would be a real gas right up until she started seeing terrans and ausar turning blue from hypothermia all over. By then, her connection to climate shorted out, and most of us were too distracted getting blankets and clothing distributed to hunt down the cause.”</i>");
		output("\n\n<i>“So how did it get fixed?”</i>");
		output("\n\nSylvie smirks. <i>“She turned herself in. Essential systems have redundant, hardened lines to communicate in case of serious damage, including one to HQ. We had the closest one she could get to, and at that point, we were desperate enough to let her tap into it. Sure enough, the heat came back on, and with it, two weeks worth of water damage and electrical fires.”</i>");
		output("\n\nYou chuckle at that.");
		output("\n\n<i>“It’s a Christmas miracle nobody died. I don’t think I’ve seen the station come together like that before or since, but I’ll be damned if that girl gets anywhere near Climate again.”</i> Sylvie thumps her fist into the bar and takes a big sip of beer.");
		output("\n\nYou ask, <i>“What happened to her?”</i>");
		output("\n\nThe statuesque law-woman shrugs. <i>“She got sent off to a juvenile detention facility for a few months, and I haven’t heard a word about her since. If I had to take a guess, her parents took her somewhere she couldn’t get in so much trouble, or the UGC snapped her up for covert digital warfare. The kid definitely had the skills for it.”</i>");
		output("\n\nNodding along, you realize the story has come to an end, and you’re going to have to decide if you want to go on your way or trade another set of stories.");
		processTime(13);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() >= 1) output(" The booze is definitely starting to kick in, judging by the way she keeps finding excuses to touch you.");
		sylvieMenu();
	}
	//So some mad scientist... Dr. Weasel or something passed through a few months back on the lam from UGC peacekeepers. Turned a pair of deergirls on vacation into vacuous cum-suckers before she got chased off station.
	else if(storySelect == 6)
	{
		output("<i>“So you ever hear about that mad scientist, Doctor Weasel or Ferret or whatever? The one with a hard-on for turning people into idiot fuckslaves?”</i>");
		output("\n\n");
		if(flags["MET_DR_BADGER"] != undefined) output("Does she mean Doctor Badger?");
		else output("You’ve definitely heard bits on the news about someone like that, though she’s probably got the name wrong.");
		output(" <i>“Yeah.”</i>");
		output("\n\nSylvie licks the beer from her gleaming teal lips and explains, <i>“She was on this very station a few months back. We didn’t catch her at first. She somehow faked her geneprint and records in ways our scientists are still trying to figure out. Apparently she looked like a pudgy tiger - with a dick of course. Every pervert in the galaxy seems to feel the need to get one, whether or not they were born with it.”</i> Patting her hindquarters, she proudly declares, <i>“I can proudly say that I’m 100% female... and lucky Doctor Bimbomancer didn’t set her sights on me.”</i>");
		output("\n\nScratching your neck nervously, you ask, <i>“Why’s that?”</i>");
		output("\n\n<i>“Because in the three days she was here, she managed to turn two cute deer-girls on vacation into silicone-inflated nymphomaniacs.”</i> She shakes her head, then brushes a loose lock of hair out of the way. <i>“They went from petite beauties to artificial ultra-porn goddesses. And on top of that, the bitch managed to give my ex-partner the slip - and a few other additions that rendered him unable to continue his duties.”</i> Those last few words come out strangely wistfully...");
		output("\n\n<i>“What kind of additions? You sound like you liked them...”</i> you pry, curiosity piqued.");
		output("\n\nSylvie looks your way, a slow smile spreading across her features. <i>“You sly pervert. I guess I did promise you a good story, so I might as well dish. She gave him a dick big enough to please the biggest moosetaurs, myself included. I have no idea how she managed to get past his police-issue GeneGuard, but that part was certainly... nice.”</i>");
		output("\n\n<i>“It doesn’t sound so bad.”</i>");
		output("\n\nSylvie shakes her head. <i>“She also left him with a submission fetish a mile wide. We had fun with it for a few days, once he was re-cleared for duty, until he started getting loose with what orders he was obeying. At first it wasn’t a big deal. He’d get woodies from getting his assignments in the morning or blow a load midway through an intense workout with his trainer.”</i> She sighs heavily. <i>“But it got bad enough that he’d let criminals go the moment they asked, and then nearly blow a hole in his pants with the force of his own arousal.”</i>");
		output("\n\n<i>“Oh.”</i>");
		output("\n\n<i>“I still call him sometimes,”</i> Sylvie elucidates in between long swallows. <i>“He says he’s happier than he’s ever been, being a live-in servant for some rich couple on Ausaril. But I just can’t help but think of how much he could’ve accomplished here, with me, as an officer of the law.”</i> She stamps a hoof angrily. <i>“");
		if(flags["DR_BADGER_TURNED_IN"] != undefined) output("Good thing some do-gooder got that bitch arrested.");
		else output("If I ever find that bitch, I’m going to put her in the darkest hole I can find and make sure she never, ever gets out.");
		output("”</i>");
		output("\n\nWith that story told, you realize you’re going to need to change topic - or buy her a drink.");
		processTime(16);
		pc.lust(8);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() >= 1) output("\n\nSylvie smiles warmly at you. <i>“Thanks so much for putting up with that depressing-ass story. Why couldn’t all spacers be like you? " + pc.mf("Handsome","Beautiful") + ", attentive listeners...”</i>");
		sylvieMenu();
	}
	//Some ausar scientists wanted to set up a research lab to investigate potential teleportation technologies, but Vesperian law shot them down. Turns out disassembling someone molecule by molecule and digitally reprinting them light years away counts as murder here.
	else if(storySelect == 7)
	{
		output("<i>“An ausar research group nearly rented half the station. Not just a warehouse - </i>half the station<i>. This is a really big station, and they wanted as much as they could get. For research? What kind of research needs that much room?”</i>");
		output("\n\nYou shrug. <i>“Weapons tech, maybe?”</i>");
		output("\n\n<i>“Good guess, but wrong.”</i> Sylvie winks your way. <i>“No, they were working on some kind of teleportation technology. The kind of thing that could let you move from one side of the galaxy to the other in the blink of an eye, if you can believe it - like warp gates on steroids, eh?”</i>");
		output("\n\nYou listen intently as she goes on.");
		output("\n\n<i>“A sister location was being built up at the same time, so they could test transporting across the galaxy... but they made one big fuck up.”</i> Sylvie wets her whistle with a mouthful of ");
		if(flags["MET_KALLY"] != undefined) output("Kally’s");
		else output("the bar’s");
		output(" stout beer. <i>“They disclosed one of the technologies they intended to test, and when our eggheads stopped to think about it, the conclusions weren’t pretty. Basically what they wanted to do is pull someone apart an atom at a time, scanning each one for exact position, and then rebuild the same person on the other side. Sure, you get across the galaxy, but only if you don’t believe in a soul. If you do, the original version of you was just killed and replaced with a doppleganger on the other side of the galaxy. In Vesperian law, that’s murder.”</i> She snaps her fingers. <i>“The judge agreed, and the science puppies got told to put their plans on ice.”</i>");
		output("\n\nThat sounds awful but potentially useful as a last ditch method of escape. If you’re going to die anyways, it’d be worth the risks.");
		output("\n\n<i>“I guess so, but that’s none of my beeswax. I just enforce the rules. I don’t write them or wax philosophical about their implications. Most of the time.”</i> The moosetaur waggles her palm noncommittally. <i>“Maybe at the end of a real bender - the kinds of nights that end with a headachy sunrise and a desert worth of dry mouth. You know what I’m talkin’ about, eh [pc.name]?”</i>");
		if(pc.isBimbo()) output("\n\n<i>“Omigod, days like that are the worst, but it’s so much fun before!”</i> you gush.");
		else if(pc.isBro()) output("\n\n<i>“Not often,”</i> you grunt.");
		else if(pc.isNice()) output("\n\n<i>“Yeah, hangovers aren’t exactly my idea of a good time either,”</i> you remark.");
		else if(pc.isMischievous()) output("\n\n<i>“Hell yeah. One time I woke up hurting so bad I literally couldn’t open my eyes for a few hours. Turns out I had picked a fight with a kaithrit, gotten clawed up before I passed out, and swelled up worse than a rahn with a bellyful of cum,”</i> you answer.");
		else output("\n\n<i>“Yup. Hangovers are a bitch,”</i> you answer.");

		output("\n\nDoing her best impression of a wise man, Sylvie gives you a slow nod... before guzzling down the rest of a drink. <i>“");
		processTime(16);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() == 0) output("You’re pretty good at this. Wanna talk some more, or do you wanna buy the pretty lady a drink?");
		else output("Mmm, I think I like you, [pc.name]. Companionship this good deserves at least a hug.");
		output("”</i>");
		sylvieMenu();
	}
	//Some kui-tan pirate took down a slave-running convoy on the fringes of the system. Shoulda left it to the cops. Someone coulda got hurt. Kally beams in the background.
	else if(storySelect == 8)
	{
		output("<i>“We’ve got a vigilante in system, or at minimum, one stopped by to pay some slavers a rather nasty visit.”</i>");
		output("\n\n<i>“Oh?”</i> Sounds like someone dropped the hammer on those low-lifes");
		if(silly) output(" and dispensed some indiscriminate justice");
		output(".");
		output("\n\n<i>“Oh yeah. A freighter full of illegal rim-slaves was scooting through our system on the way to Void knows where when another ship ran them down between gates. You don’t see a lot of folks willing to try to engage at near lightspeed, but this crazyass did it. It must have scared the slavers too, because they slammed on the brakes and dropped to sub-light the first chance they got. Must have figured they’d have better odds of surviving a gunfight than getting rammed at a third the speed of light.”</i> Sylvie snorts.");
		output("\n\nYou supply, <i>“They got their asses whupped?”</i>");
		output("\n\n<i>“You bet they did. I peeped a copy of the sensor logs, and it was like watching a leaf in the wind.”</i> She pauses and sips at her beer, then looks right back at you. <i>“Weird thing was, the ship </i>was<i> a leaf. Not lacking for style, mind you. The ident signals were scrambled of course, so we’ve got fuck-all to go on for tracking down our mysterious benefactor. The brass don’t even want to put any resources into it. I don’t understand why. Just because it worked out this time doesn’t mean we can afford to have vigilantes running around the system, handing out their particular brand of frontier justice.”</i>");
		//Kiro/Kally met
		if(flags["KIRO_MET_KALLY"] != undefined) output("\n\nFrom behind the bar, Kally grins like an idiot, polishing the same glass she’s been polishing for the past few minutes.");
		//Merge
		output("\n\nShaking her head, Sylvie sighs heavily. <i>“Luckily, nobody died. The vigilante took out their engines without decompressing a single compartment. The only injuries were from the slaves getting payback on their would-be masters. You should have seen them. Most of them were beaten black and blue, though there was a dzaan stuffed with enough cum to look half-past pregnant. Aside from that, she was untouched. I can only assume she found a pleasant way to handle her victim’s aggression, eh?”</i>");
		output("\n\n");
		if(flags["MET_KIRO"] == undefined) output("She must have figured a little fun with Kiro would be safer than staying with those she had wronged...");
		else output("She must have been a real whore to take that many loads...");
		output(" <i>“Yeah.”</i>");
		output("\n\nSylvie polishes off her beer with a resigned sigh. <i>“I guess at the end of the day we should just be glad that so many innocents were saved from a lifetime of suffering.”</i> She looks up at you");
		processTime(10);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() >= 1) output(", a lazy smile spreading across her lips at the sight of you. <i>“Buy me a drink, and I’ll tell you a much better story than that one.”</i> She leans close enough for you to smell the alcohol on her breath, then giggles and kisses your forehead. <i>“It’ll be fuuuun...”</i>");
		else output(", warming at the sight of you. <i>“I promise, my next story will be more fun. Unless it isn’t. Or you could buy me a drink. It’ll loosen my tongue... and maybe other places.”</i> Sylvie winks.");
		sylvieMenu();
	}
}

//Buzzed Stories
public function syvlieBuzzedStories(drunklevelChange:Number = 1,newPage:Boolean = true):void
{
	if(newPage)
	{
		clearOutput();
		showSylvie();
	}
	else output("\n\n");

	var storySelect:Number = rand(5);
	//Worked the gloryhole once and got inexplicably hammered after.
	if(storySelect == 0)
	{
		output("<i>“So you might have a hard time believing it, but there’s a gloryhole in the bathroom, and yours truly has worked it a time or two,”</i> ");
		if(sexedSylvie() >= 0) output("Sylvie bites her lip, awaiting your reaction. When you don’t do more but look on expectantly, she smirks and continues,");
		else output("Sylvie gives you a look that’s part bashful shyness and part barely-repressed excitement.");
		output(" <i>“People kept groping me when I was hugging on them, and petting me... back there, and I got really worked up. So I decided I’d go work the gloryholes and have a bit of fun.”</i>");
		output("\n\n<i>“Oh yeah?”</i> you lean in closer. This story is already off to a good start.");
		output("\n\nSylvie blushes and fidgets, hooves loudly clopping on the floor. <i>“Yeah. Probably not my wisest move, eh?”</i> She looks off into the distance, lost in the memory. <i>“I can’t really reach back there, so I needed help to deal with it. Lucky enough, some sweet girl with a big ol’ dick showed up before long, but I was so worked up that I didn’t even think to turn around and back into it. I just started sucking.”</i> Two large points appear on her chest, and the mildly intoxicated woman doesn’t even try to hide them. Quite the opposite, in fact. She idly brushes one. It seems to pull her hand in as if magnetic.");
		output("\n\nYou nod agreeably, waiting for more sordid details.");
		output("\n\n<i>“And once I started, I just couldn’t stop. Like, I was so horny that dick tasted like the best thing ever, and the pre... Stars, there was so much pre! She was leaking it so fast I could’ve popped off and filled up a mug in no time, but I didn’t want to pull off.”</i> Sylvie shivers, and her tail flutters back and forth. <i>“Fuck, I sound like such a cock-slut, but that’s what I was. I was a knob-gobbling cock-slut. I took that thing as deep as I could. I flicked my tongue out through the hole, and I squirmed like hell, damn near kicked down the stall wall with how crazy I was going.”</i>");
		output("\n\n<i>“The whole wall?”</i> She’s certainly big enough, but damn.");
		output("\n\nSylvie’s fair skin flushes crimson as the enormity of what she’s been saying sinks in, but the liquored up police officer trundles on, too committed to back out now. <i>“Yeah. They had to replace a few of the bolts when I was done. It was unreal!”</i> She slams back a huge sip of her drink before pressing on. <i>“I couldn’t stop myself. I just wanted to make it cum. I was grinding on the wall, slobbering pussy juice up and down the side, but I wouldn’t stop slurping. She must have known how eager I was, because she started throbbing before long. I swallowed what felt like a gallon, and I face-fucked the hell out of her.”</i>");
		output("\n\n<i>“And?”</i> you supply, eager for more.");
		output("\n\n<i>“And that’s where it gets weird.”</i> Sylvie notices that she’s thumbing her nipple and pulls her hand away, putting it to work on shuttling a beer into her mouth. <i>“I swallowed. At that point it would be rude not to. Even creamed myself from how hot it was drinking all that spunk, it was like gallons. She nutted, and nutted, and if I wasn’t a ton of centaur, I would’ve blown up like a balloon from trying to drink it all.”</i> She shakes her head. <i>“We went our separate ways, never learning who the other was, but all of sudden, it was like I couldn’t walk.”</i>");
		output("\n\nYou cock your head. <i>“");
		if(pc.isBimbo()) output("Whatcha mean?");
		else output("What do you mean?");
		output("”</i>");
		output("\n\n<i>“I mean I couldn’t walk. I barely got out of the bathroom before I tipped over on my flank. I mean I’ve been really drunk, but this was like, super drunk.”</i> Sylvie shakes her head. <i>“So I got up, and my legs just wobbled all over the place. I was ass-over-tits again and again. The room started swimming, and I blacked out on the floor, stinking of sex and cum.”</i> She snorts. <i>“Woke up in Kally’s room with a headache sharp enough to cleave through titanium and a lot of confusion as to how I got there.”</i>");
		output("\n\nLooking concerned, you ask her if she found out she got there.");
		output("\n\n<i>“Kally saved my ass. Apparently she got a few of the regulars to help her put me in her room before someone reported me.”</i> She sighs wistfully. <i>“She’s a good apple, that one. If she hadn’t acted when she did, I could have lost my job.”</i>");
		//KNOW SEKRIT
		if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) output("\n\nYou decide not to mention that it was probably Kally’s alcoholic cum that put her in that state in the first place.");
		//Else
		else output("\n\n<i>“She saved your ass,”</i> you observe.");
		//Merge
		output("\n\nSylvie smiles. <i>“Well... not entirely. I found out later she was the one who dumped all that alcoholic cum into me, but she’s more than made up for it since.”</i>");
		output("\n\n<i>“How?”</i>");
		output("\n\n<i>“By serving as my back-up stress reliever. If I ever get that worked up again, and there’s no cute spacers around...”</i> She strokes your cheek, smiling. <i>“...she has to satisfy me - with a condom on. It’s a pretty sweet deal.”</i>");
		output("\n\nYou look at her, then back at the bartender, then back at her, then back at the bartender. ");
		if(flags["MET_KALLY"] != undefined) output("Kally");
		else output("The Kui-tan");
		output(" waves and blows your table a kiss.");
		output("\n\nThe moose-girl giggles upon seeing your double-take. <i>“Don’t worry, it’s not anything serious. Besides, I bet a ");
		if(pc.tallness >= 76) output(pc.mf("big boy","big girl"));
		else if(pc.biggestCockLength() >= 25) output(pc.mf("hung stud","hung girl"));
		else if(pc.canineScore() >= 3) output("talented bitch");
		else if(pc.biggestTitSize() >= 5) output("luscious girl");
		else output(pc.mf("talented boy","talented girl"));
		output(" like you is ten times as good in bed.”</i>");
		output("\n\n<i>“Sooo...”</i> your eyes flick down to her clearly visible nipples, then back to her face.");

		processTime(20);
		pc.lust(10);
		sylvieDrunkBump(drunklevelChange);
		//If now drunk, cut to sex menu intro!
		if(sylvieDrunkLevel() >= 2)
		{
			sylvieMenu();
		}
		else
		{
			output("\n\nSylvie laughs and playfully socks you in the shoulder. <i>“I’m having too good a time to bound off to bed now, but play your cards right, and we could see where things go. How about a hug in the meantime?”</i>");
			sylvieMenu();
		}
	}
	//Once had a galotian crawl inside her womb and stay the night.
	else if(storySelect == 1)
	{
		output("<i>“So did I ever tell you about the time I woke up and gave birth to a galotian?”</i> Sylvie asks. <i>“No?”</i>");
		output("\n\nYou shake your head.");
		output("\n\n<i>“It really happened, sort of.”</i> Sylvie giggles and gestures at her tauric body. She’s certainly big enough for your average galotian to squeeze inside of, you suppose. <i>“Like most of my more salacious tales, this one starts off with a late night right here, where I’m standing.”</i>");
		output("\n\n<i>“");
		if(pc.isBimbo()) output("You must have been like, super duper drunk!");
		else output("Drank too much, I take it.");
		output("”</i>");

		output("\n\n<i>“You guessed it,”</i> the heavy drinker replies after inhaling most of another beer. <i>“Some big-shot galotian ambassador was here for a few days. She was a real charmer too. Kept buying me drinks on her travel budget and telling me about all the different species she’s had sex with. Who wouldn’t get smashed hanging out with someone like that, eh?”</i> Sylvie fans herself at the memory. <i>“And she was like a hundred people in one! She could make her boobs swell out to here,”</i> she reaches out as far as she can, <i>“or give herself the biggest, slickest cock you can imagine - or anything in between!”</i>");
		output("\n\nSylvie is pretty goddamn enthused about this woman. You ask her if she got her name.");
		output("\n\n<i>“Oh, Galos I think. Not a very original name, if you ask me.”</i> Sylvie shrugs, her breasts wobbling despite her uniform’s attempts to contain them. <i>“But she got me plastered on Kally’s finest wines and whiskeys. I remember making a move on her, but for some reason it didn’t work. She just kept teasing me and feeding me more drinks, promising that we could go fuck in one of the hot tubs in the back after ‘just one more.’”</i>");
		output("\n\nConcerned, you ask just how much she drank.");
		output("\n\n<i>“Fuck if I know. It’s tough to say when you don’t even realize how strong the drinks are!”</i> Sylvie sighs. <i>“I got so smashed I didn’t even remember to take my Sobr.”</i> She proudly gestures at her badge. <i>“Standard issue to all cops. It’s a little pill full of microsurgeons that neutralize the effects of alcohol. I guess they did a study, and they figured it was cheaper to hand out booze-countering pills than deal with all the lost productivity from hungover cops in the morning.”</i> She waggles her fingers noncommittally. <i>“But I was too smashed for anything but following the slippery minx back to her room.”</i>");
		output("\n\nThe badge-toting behemoth giggles. <i>“Next thing I know, I’m waking up in her bed - which isn’t quite big enough, by the way - by myself. I thought I had crushed her to death, or gotten dosed with something that made me hallucinate.”</i> Sylvie shakes her head, then grabs a quick sip of beer to refresh her palate. <i>“Then I felt something in my pussy, stroking me from the inside out.”</i> She shifts nervously. <i>“I couldn’t see what it was, but I could feel the warm slickness sawing back and forth, grinding across my clit, pushing me toward orgasm before I even knew what was going on.”</i>");
		output("\n\nYou raise an eyebrow.");
		output("\n\n<i>“Just ‘cause this story makes me sound like a slut doesn’t mean you can climb on me like some sort of amusement park ride.”</i> She looks over her shoulder and prances in place, giggling. <i>“Though I am pretty fetching, I’m no Candy Planet. Have you ever been there? It’s a real treat, no pun intended. They’ve got awesome rides, not that I can get on any of them any more, and they even have a brothel where the whores’ bodies and juices taste like all kinds of sugary treats!”</i>");
		output("\n\n<i>“I haven’t, but what about the galotian?”</i>");
		output("\n\nSylvie puts down her mug and drawls, <i>“Ohhh yeah. I was telling you about getting fucked from the inside out the morning after, wasn’t I?”</i> She leans close, boobs practically spilling out of their cherry-red confinement, her hard nipples on full display through the straining fabric. <i>“Yeah, like every part of my pussy was getting licked at once, inside and out. I came hard enough that it felt like I squirted a gallon, but there was more to it than that.”</i> The four-legged filly chews on her thumb as she remembers. <i>“When I looked back, I saw her head just behind my tail, looking back at me and smiling.”</i>");
		output("\n\nYou rock back in your seat. <i>“Just her head?”</i>");
		output("\n\nShaking her head, Sylvie clarifies, <i>“No, her neck was there too, just like... really long. I guess the rest of her was still inside me. I didn’t really get to think about it much. She disappeared back behind me and started sucking on my clit while the rest of her slipped out.”</i> Next to you, Sylvie’s knees wobble. <i>“If I wasn’t already laying down, it would’ve put me on my ass. It felt that good. I wonder if that’s what birth feels like for some races - warm, gooey pleasure that just makes you cum and cum while a person works their way out of you.”</i>");
		output("\n\n");
		if(CodexManager.entryUnlocked("Raskvel")) output("You aren’t sure about the gooey part, but a raskvel would probably agree.");
		else output("Probably something to that effect, you agree.");

		output("\n\n<i>“Galos was pretty good about it too. She didn’t just slip out of me - she fucked me every step of the way. I was braying like an idiot, mauling my own tits, just generally slutting it up, eh?”</i> The big moose-girl elbows you affectionately, then prattles on. <i>“She’d wrap my clit up in herself and suck on it, or she’d vibrate the whole way into my womb. Every orgasm was a different experience. The only constant was... well, how wet she made everything. It took me an hour after she left to stop dripping.”</i>");
		output("\n\n<i>“Wow.”</i>");
		output("\n\n<i>“I know, right?”</i> Sylvie laughs and nervously shuffles in place, a distinct flush in her cheeks. <i>“Mmm, that was a good night, but tonight is shaping up pretty great too.”</i> She playfully pinches your cheek and finishes off her beer. <i>“Look at you, buying me drinks and listening to me verbally slutting it up, and you haven’t tried to jump my sweet ass once.”</i> Leaning way, way back, the moose-taur slaps her own ass and whimpers in delight. <i>“That’s the stuff... now how about another drink, " + pc.mf("handsome","my lovely") + "?”</i>");
		processTime(20);
		pc.lust(15);
		sylvieDrunkBump(drunklevelChange);
		sylvieMenu();
	}
	//Ausar dominatrix brought her submissive terran slut and offered to let Sylvie use him. He had a heavily modded tongue.
	else if(storySelect == 2)
	{
		output("<i>“You don’t need to go all the way to the frontier to run into the weird shit.”</i> Sylvie burps, then presses on, <i>“Why, just a few weeks ago I was sitting here, having a good enough evening, when this ausar walks in covered in latex from damn near head to toe. She even had bands of the stuff strapped around her tail, adorned with bells. It would’ve been annoying if she wasn’t so stupid hot.”</i> Sylvie takes a long swig of beer, apparently to cool off. <i>“And in her hand is a little leash. Guess what it connected to?”</i>");
		output("\n\nYou scratch your chin. <i>“Her pet tentacle monster?”</i>");
		output("\n\n<i>“That would have been awesome, but no,”</i> Sylvie answers, smirking devilishly. <i>“No, she had a collared terran crawling behind her on all fours, his legs and arms all bound up in some kind of weird latex harness that forced him to get around on his elbows and knees. There were even little paw patterns on the pads that touched the ground, like he was the dog-person, not her.”</i> She leans in close, dropping her voice to a whisper. <i>“And he had one of those buttplug-mounted tails stuffed tight in his heiny! Fortunately for him, his mistress was smart enough to keep his bulging boy parts wrapped up nice and tight - and out of public view.”</i>");
		output("\n\n<i>“Weird.”</i>");
		output("\n\nThe moose-woman laughs. <i>“Yeah... but honestly, kind of sexy too. She got this guy, who would’ve been quite a looker on a normal day, to truss himself up and put himself on display for her. He was hung too. That little crotch cover definitely wasn’t quite up to the task. The way he bulged made it clear he was big enough to please a deer-girl, maybe even a moose on a good day.”</i>");
		output("\n\n");
		if(pc.biggestCockLength() >= 24) output("You feel a little smug at the size of your own maleness.");
		else if(pc.hasCock()) output("You suddenly feel a little inadequate by comparison. How could you possibly satisfy a woman this big?");
		else output("You count yourself lucky that you’re above such concerns. Who needs a dick when you’ve got fingers and a tongue (or if all else fails, a fist).");
		output(" <i>“So what’d they do?”</i>");
		output("\n\n<i>“Nothing at first. She got a shot for herself a beer for him, though she made him sit under the table and lick his out of a bowl.”</i> Sylvie shakes her head in disbelief. <i>“He even barked whenever he wanted her attention. Some people really commit to their roleplay, I guess.”</i>");
		output("\n\nScratching your neck, you look to her for more. <i>“That’s it?”</i>");
		output("\n\nSylvie giggles. <i>“Getting impatient for the sordid, slutty details, eh? I was too, so I walked up to her and introduced myself.”</i> Leaning closer, she adds, <i>“Between you and me, I was pretty deep into my beers by then, so I was feeling pretty friendly, and what’s more friendly than introducing yourself to a newcomer?”</i> She nibbles on her lip, then shrugs. <i>“Turns out they were newlyweds on their honeymoon, and they both took a liking to me immediately. She started petting my big ol’ moose-butt before long, and the wannabe mutt started grinding himself on my hind leg.”</i> Sylvie’s tail flutters. <i>“I guess they were swingers? I don’t know the technical term for whatever they were, but she wanted to watch him service me, and I didn’t protest very hard.”</i>");
		output("\n\nYou look around in disbelief. <i>“Right here in the bar?”</i>");
		output("\n\nSylvie playfully slaps your hand, then rubs it apologetically. <i>“No! No... in their room. Me and her walked back there with him hobbling along behind, and that’s when I saw it.”</i> She knocks back the rest of her drink. A sizable belch forces its way out of her painstakingly painted mouth a heartbeat later. <i>“His tongue was huge. He was watching my ass as I walked, and every step, more of his tongue slipped out of his mouth. It wasn’t like a normal tongue either. It was a big, purple tube. Probably twice as thick as normal and lined with rows of shining nubs on each side. By the time we closed the door behind us, he was drooling badly enough to leave a gleaming trail back out into the bar.”</i>");
		output("\n\nHolding up her hands, Sylvie indicates that it must have been around a foot in length. <i>“Sadie explained that her husband had an oral fixation, so they had modded his tongue to be the perfect tool for pleasure. By then it was sweeping back and forth on the floor behind me. All the petting had me pretty leaky too, and the subbie terran quite liked the taste of taur.”</i> Sylvie’s face is a little flushed, and she’s breathing a little more rapidly than before. You enjoy the sight of her barely constrained mounds heaving. <i>“She wanted him to use it on me - wanted to watch him thrust that monster-tongue into me again and again. Turns out she liked to watch... and both his tail plug and her suit were equipped with remote-control vibrators linked to her Codex.”</i>");
		output("\n\n<i>“Wow. Did you let them?");
		if(pc.isBimbo()) output(" Gosh, you should’ve asked if you could suck him off while he fucked you. It’d only be fair!");
		output("”</i>");

		output("\n\nSylvie wraps an arm around your shoulder and pulls you tight against her body, her fingers slowly petting. <i>“Of course I let them! I’d be an idiot not to take a ride on that guy’s face... or in this case, lay down on the bed and let his face ride me. Once you get ‘taur-modded, girl on top is only an option if your partners come with shatter-resistant pelvises.”</i> She shifts her hips to slam them into your side. If she hadn’t been holding onto you, you would’ve been thrown a good ");
		if(pc.tallness <= 55) output("six");
		else if(pc.tallness <= 65) output("five");
		else if(pc.tallness <= 75) output("four");
		else if(pc.tallness <= 85) output("three");
		else output("two");
		output(" feet away. Instead, you’re pressed close enough to catch a whiff of a faint, musky smell. <i>“Sometimes being this much girl comes with downsides.”</i>");
		output("\n\nYou pet her back while she talks, and soon Sylvie is interspersing her story with lusty groans and sighs of delight. <i>“I uh... mmm... I have to admit, he really knew what he was doing. That tongue was between my legs before I had even settled into place on the bed, and he was just getting started. That first foot burrowed into my snatch in an instant, folded up to fill every inch of space along the way. It was wet with spit, and I was wet with lust, so between the two of us, he was able to pump in six more inches by the time I managed to squeak out my first moan.”</i>");
		output("\n\n<i>“");
		if(!pc.isBimbo()) output("He had what, a foot and a half?");
		else output("Like, how much tongue did he have?");
		output("”</i> Surely at some point, the subby terran had to run out of twat-teaser.");

		output("\n\n<i>“I’m not sure, but it was definitely longer than two or three feet. And the more he pushed in, the thicker it got.”</i> Sylvie’s back arches with remembered pleasure. <i>“Thicker than your average terran’s prick. Probably thicker than his too. I’m telling you, that pussy-hound was built for cunnilingus and was a devoted zealot to the church of muff-pleasing. He didn’t just work that tongue, he got his lips in there, kissing me all over, twisting to twirl his muscle inside me. It was all I could do to stay conscious under an onslaught like that. I clenched and squirmed so hard that the bed nearly shook apart. I’m not kidding - Kally got complaints about the bed in that room a week later. She had to call in a repair crew and everything.”</i>");
		output("\n\n<i>“What about the ausar?”</i>");
		output("\n\nThe crimson-clothed centaur lifts a finger, dips it in her drink, and sucks on it, rhythmically shoving it in and out of her mouth. After a few moments of that, she pulls it out and laughs. <i>“She was sucking her fingers just like that while writhing in a chair, watching. Her hips were shaking worse than mine. I guess she had her vibe almost maxxed out. I’d have helped her out myself if my muscles weren’t jello. Her wonderful bitch boy was massaging my haunches while he ate me out, and I don’t think I had an ounce of control left. I just wanted to keep cumming until I melted into the bed.”</i>");
		output("\n\n");
		if(pc.hasCock())
		{
			output("Discretely adjusting your boner");
			if(pc.cockTotal() > 1) output("s");
		}
		else if(pc.hasVagina() && !pc.isCrotchExposed()) output("Discretely adjusting your sticky underthings");
		else output("Discretely adjusting yourself");
		if(!pc.isBimbo() || pc.exhibitionism() <= 50) output(", you try not to let on just how her story is turning you on.");
		else output(", you try not to distract her too much. You want to hear every sordid detail. Then maybe you can like, give her a story of your own.");
		output(" <i>“How much did you cum?”</i>");
		output("\n\n<i>“I don’t know!”</i> Sylvie admits. <i>“I sort of lost count after a while. It sort of gets tough to tell after you have seven or eight in rapid succession. There’s basically nothing left to do but orgasm and babble nonsense. I can’t even accurately remember how good it felt. I just know that thinking about it too hard makes my knees wobble and my cleft twinge. One thing I do remember is what it felt like to wake up in a mattress soaked in my own sexjuice. Ugh. Amazing how much you love the smell during sex and just how badly you want to wash it off afterward. Talk about a shower of shame.”</i>");
		output("\n\n<i>“They left you like that?”</i> you ask.");
		output("\n\nSylvie polishes off a beer, then pours another. <i>“Yep. Fucked me until I passed out, then made tracks. Didn’t even bother to leave me a number.”</i> She bats her eyelashes at you. <i>“You wouldn’t run off on me, I bet.”</i>");
		if(pc.isBimbo()) output("\n\n<i>“’Course not!”</i> you blithely promise. <i>“I’d be way too busy fucking you to leave!”</i>");
		else if(pc.isBro()) output("\n\n<i>“Nope. I’d be too tired from pounding your pussy to go anywhere.”</i> You reach back and give her ass a rough slap. She smiles.");
		else if(pc.isNice()) output("\n\n<i>“No way,”</i> you promise, smiling. <i>“I’d be lucky just to be there.”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“I’m not sure how I’d manage to run away with a crushed pelvis,”</i> you say. <i>“It’d be worth it.”</i>");
		else output("\n\n<i>“Nah,”</i> you promise. <i>“I’d stick around for round two at a minimum.”</i>");
		output("\n\nSylvie giggles, <i>“Keep tempting me like that I’ll have to see how you measure up.");
		processTime(20);
		pc.lust(10);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() >= 2) output(" Think you could do better than that slutpuppy?");
		else output(" If you can keep it up through a few more drinks, you’ll get your chance.");
		output("”</i>");
		sylvieMenu();
	}
	//Purple pheromone rahn managed to put Sylvie in heat. Wouldn’t stop fucking her till she was full of eggs.
	else if(storySelect == 3)
	{
		output("<i>“One time I was just sitting here, minding my own business.”</i> Sylvie pauses and looks your way. Upon seeing your intent expression, she giggles, <i>“Okay, so I might have been hugging and snuggling... and kissing a little... platonically of course. Just because I get affectionate doesn’t mean I’m a slut. I wasn’t giving out handies under the table or stuffing my fingers up some galotian’s slit.”</i> Sylvie hugs you one-handed and pounds down a beer in seconds, her body so warm it nearly sizzles against you. <i>“Just this.”</i> She squeezes you tight, then lets you go. A smile as bright as a cloudless day graces her features.");
		if(pc.isBimbo()) output("\n\n<i>“Oooh, you’re so warm. You sure you wanna finish that story? We could snuggle some more,”</i> you offer.");
		else if(pc.isBro())
		{
			output("\n\n<i>“Yeah,”</i> you grunt. <i>“Real platonic.”</i>");
			if(pc.hasCock()) output(" You make a point of adjusting your package as obviously as possible to just show her how arousing her attentions can be.");
		}
		else output("\n\n<i>“I’m starting to think this was just an excuse to hug me,”</i> you observe.");
		output("\n\n<i>“Sorry,”</i> Sylvie peeps, occupying her hands by pouring herself another beverage. She swirls the amber intoxicant in her mug in a surprising display of dexterity. <i>“I mean it platonically I guess. If I was going to fuck somebody, I’d at least try to drag them back to the baths where nobody would mind. Here in the bar, I’d never go past a few friendly teases,”</i> she declares");
		if(pc.hasCock()) output(", rubbing your thigh an inch away from your significant bulge");
		else output(", rubbing your thigh");
		output(". When your traitorous hips shift to press her fingers higher, she pulls back and giggles. <i>“Don’t get ahead of yourself.”</i> Those soft, teal lips of hers curl into a knowing smile.");
		output("\n\nYou clear your throat and attempt to gather your wits. After an awkward second");
		if(pc.hasCock()) output(", your dick even harder");
		output(", you ask, <i>“Was there a story behind all this?”</i>");
		output("\n\nNodding in agreement, Sylvie sips her beer and gathers her thoughts. <i>“Sorry. It’s a hell of a story, I promise. Like I said, I was minding my own business, having a good time, when this purple rahn saunters up in a dress so tight and so sheer that she must have had it printed directly onto her body. It was that thin. If it didn’t have thicker patches around the crotch and tits, I would’ve been able to see everything. It didn’t stop me from trying, eh?”</i> She winks at you over the lip of her mug. <i>“You’d have to be dead not to.”</i>");
		output("\n\n");
		if(pc.isBimbo()) output("Totally! It’d be rude not to. Any girl who dresses like that obviously wants as many eyes... and dicks on her as possible!");
		else if(pc.isBro()) output("Aint that the truth.");
		else if(pc.libido() < 50) output("That seems a little presumptuous on her part, but you’ll roll with it to see where this goes.");
		else output("Truer words have never been spoken. The universe is a melange of erotic possibilities, and you’d have to be dead not to pursue every single one of them.");
		output(" You nod.");

		output("\n\n<i>“By the time I was looking at her eyes again, she had the sassiest, cockiest smile you can imagine painted on her face. The kind of smile I’d have when I’m seconds away from slapping cuffs on some dumb thief who thought he could outrun a solid ton of police-enforcing muscle.”</i> Sylvie straightens her back and gently strokes one of her antlers. <i>“Sometimes it’s good to be a moose-girl. But back then, I froze like a deer in headlights. She introduced herself, but I was too off-kilter to catch it. So I nodded, trying not to look like a massive idiot, and introduced myself.”</i>");
		output("\n\n<i>“Really? She must have been truly stunning.”</i>");
		output("\n\nSylvie sighs, <i>“Yeah... But there was more to it than that. My heart kept beating faster, and I was flushed brighter than a schoolgirl with her crush. She was just another person. I didn’t understand why I was getting so worked up - why I couldn’t seem to think straight around her. I pushed through it and swept her up in a hug. Mmm, she was so soft and squishy.”</i> Sylvie has a dreamy look in her eyes as she reminisces. <i>“But it was how she smelled that was the best of all. She didn’t have a ton of perfume on or something, but there was a kind of slight muskiness to her that I couldn’t get enough of. I might have taken in a big breath once I smelled it... four or five times.”</i> The moose-woman’s back half is standing rigidly at attention, her tail straight up.");
		output("\n\nYou point out just how weird that is.");
		output("\n\nBlushing brighter than a sun about to go nova, Sylvie gasps, <i>“I knooooow! It’s not as bad as it seems. I promise.”</i> The moose-girl all but inhales half of her beer for courage. <i>“She was a doh’rahn... which means she’s a pheromonal time-bomb. She must have wanted me pretty badly, because by the time I was hugging her, I was halfway into heat.”</i> She shakes her head. <i>“I’m not even supposed to be able to go into heat! Not unless I take some special meds, but there I was, hips wiggling, pussy so engorged I couldn’t stop thinking about it, begging somebody to stuff it... and the source of it all was right in front of my nose, feeding me more of her scented witchcraft.”</i>");
		output("\n\n<i>“Wow.”</i>");
		output("\n\nShivering, the moose-girl leans into you and presses on. <i>“Yeah... I was kissing and licking her before long. I couldn’t get enough of her taste. I could barely hear what she was saying over how hard my heart was drumming in my ears, could barely think over the tsunami brewing between my hind legs. I’m fortunate that my pussy doesn’t leak until something is pressing on my haunches, because there would’ve been an oil slick behind me otherwise. Poor Kally would probably wipe out in a puddle of cunt-juice on her way to a table. I was spinning out of control fast, and the seductress in my arms was too busy sticking her tongue down my throat to care.”</i>");
		output("\n\nYou ask her if she wound up fucking the girl here... and just how that sort of thing would work. Scissoring must be awkward with the lower body of such a huge creature.");
		output("\n\n<i>“Almost,”</i> Sylvie confides, wrapping an arm around your waist and squeezing you tight. Her other hand feeds her still more beer. Her belly must be bottomless. <i>“I would’ve if she let me, but the doh’rahn was a pro. She wrapped her legs around my waist, locked her feet together, and slipped right out of my arms. Did you know they don’t have spines? I found that out when she arched her back so sharply that her tits pressed against mine... and somehow she was able to twist her shoulders far enough away to point me at the baths.”</i> You swear you hear the moose-woman whimper as she takes a breath. <i>“I don’t know if I’ve ever moved that fast in my life. Next thing I know, I’m tripping over myself into a hot-tub.”</i>");
		output("\n\nLooking over her rather prodigious size, you ask her if her and her passenger were okay.");
		output("\n\n<i>“Awww, you’re so sweet, caring about me.”</i> She tightens the hug until ");
		if(pc.tallness <= 76) output("you’re lifted up off the ground, your cheek pressed");
		else output("your cheek is pressed");
		output(" against a wobbling breast. <i>“We were okay. We landed like one of those old timey, single use rockets: with a big splash and no lasting damage. I’m not even sure I would’ve noticed if I did get hurt, because when we came up out of the water, she had grown a pretty respectable dick... and it smelled like the rest of her, but better.”</i> Sylvie’s nipples are rock hard, and her face is clearly flushed with arousal, not embarrassment.");
		output("\n\n<i>“So, did you suck her or fuck her?”</i>");
		output("\n\n<i>“Mmmm,”</i> Sylvie groans, trotting in place. <i>“Everything and anything she wanted. I was in heat. I wasn’t thinking about anything aside from her and her dick, and doing whatever she wanted me to do. I tried to suck her at first, but she waved me off. I didn’t know I could feel such acute disappointment. It was like she was crushing my heart with her heel. Then she waded around behind me and slapped me across the ass. I think she might have called me a ‘sexy beast’ too, but I was too busy gushing lube to care. That impact opened up the floodgates, and I couldn’t have gotten any wetter if you hosed me down with a five gallon drum of lube. My whole body pushed back into her, and she just slapped me again. It didn’t even hurt, no matter how hard she did it, but I could feel the impact vibrating </i>everywhere<i>. I might have cum once or twice from the paddling.”</i>");
		output("\n\nYou look back at her big, tauric ass, and Sylvie catches you doing it. Her tail wiggles.");
		output("\n\n<i>“It was incredible. She shoved that big, gooey fuckstick inside me, and I nearly melted. It was like she solved all my problems at once, like all I needed to do was let her fill me with cum, and all would be made well. I’m not 100% sure if there is a heaven, but I think getting fucked by a nice, big dick while you’re in heat is about as close as we’re going to get to it on this mortal coil.”</i> Sylvie fans herself while finishing her beer. <i>“Of course, it turns out she didn’t have a real dick. Rahn just have big, egg-laying fuck-sticks that looks like dicks. I doubt I would’ve cared even if I had known. Ovipositors feel about as good as any prick I’ve ever had, and getting stuffed full of eggs feels pretty tops.”</i>");
		output("\n\n<i>“Eggs?”</i> you ask, probing about the seemingly inevitable pregnancy.");
		output("\n\nSylvie lets you go, pushing you back towards the middle of her moose-body. <i>“Yup! Dozens of them. Can’t you tell? I’m super-preggers.”</i> She leans back to rub her own flank, taking your hand and pressing it against her bottom half’s belly. When you finally give in and start rubbing alongside her, she erupts into laughter. <i>“Nahh, I’m just horsin’ around. You should’ve seen the look on your face, eh? Like, ‘holy hell, that hoser actually got herself knocked up!”</i> Priceless.”</i> She ");
		if(pc.tallness <= 80) output("leans down");
		else output("leans over");
		output(" and puts her hands on your shoulders, kissing you on the forehead before you can get too upset. <i>“You’re a sweetheart for caring, and if I ever do get pregnant, you’re more than welcome to rub on the ol’ baby bump to your heart’s content.”</i> She gently strokes her fingers down the nape of your neck. <i>“I think I’d like it actually.”</i>");
		output("\n\n<i>“But what about the eggs?”</i>");
		output("\n\n<i>“Oh, if they aren’t actual fertilized eggs, they dissolve away pretty quick. I was bow-legged and drooling for a few hours, just soaking in the pool, after she was done with me. Kally was nice enough to make sure I was okay. She even brought me a few free drinks and made sure I didn’t have any injuries... back there.”</i> Now Sylvie flushes hard. You get the impression she’s not telling the whole story. <i>“I do remember kissing the doh’rahn before she left... but that’s about it. With her and her pheromones gone, I recovered relatively quickly. Even made it to shift on time. That or there were enough eggs in me for my body to assume I was pregnant. One of the two.”</i>");
		output("\n\nYou ask her if she’d do it again, given the chance.");
		processTime(20);
		pc.lust(15);
		//Booze bump
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() >= 2)
		{
			output("\n\n<i>“Fuck yesh!”</i> she gushes, half-slurring. She pulls you against her side again and offers. <i>“Just retelling the story has me all twitterpated, and the lovely company only makes it worse. What if I go into heat right now?”</i> She hams it up, throwing her head back and holding her wrist to her forehead dramatically. <i>“Would you help me? Do you think you could keep up, " + pc.mf("stud","princess") + "?”</i>");
			sylvieMenu();
		}
		//Buzzed
		else
		{
			output("\n\n<i>“Fuck, that one always leaves me with a little wiggle in my jiggle,”</i> Sylvie enthuses, noisily bouncing her haunches on her hind legs. <i>“Whoo. I must be getting pretty tipsy if I told you all that, huh?”</i> She kisses you on the cheek. <i>“I hope you don’t think less of me for it.”</i> When you smile back at her, she adds, <i>“I bet I have at least one more like it, if you want to trade a drink for it.”</i>");
			sylvieMenu();
		}
	}
	//Bought a TamaniCorp ‘Taur-Tamer with realistic lube-jizzing action. Broke through the dividing wall in her apartment it was mounted on.
	else if(storySelect == 4)
	{
		showSylvieInBra();
		output("<i>“This might come as some surprise to you, but despite the prim and proper air I maintain in such a public establishment, I do have a whole lot of animal in me... and with that comes proportionally stronger </i>urges<i>.”</i> Sylvie’s hooves click noisily as she shifts position, drinking a little bit more to steady herself. <i>“Much stronger </i>urges<i>,”</i> she repeats, <i>“and by that I mean, my body all but begs me to start fucking people at the slightest provocation. If I didn’t go out of my way to maintain myself, I’d be pounding you through the floor. Seriously.”</i> She all but eyefucks you. <i>“So that’s why I bought a TamaniCorp ‘Taur-Tamer. One of the good ones, with the realistic lube-jizz action and everything. It’s all part and parcel of the animal-girl package. You want the muscle and speed, you gotta be willing to work the hell out of your pussy three or four times a day.”</i>");
		output("\n\nWhen you look back over your shoulder to try and catch sight of the aforementioned moose-pussy, Sylvie playfully shimmies away.");
		output("\n\n<i>“Don’t go getting any ideas,”</i> she giggles, sipping on a beer. <i>“The story isn’t over yet, and if I have to hold it together and tell you all about the time I broke through the wall humping a fuck-machine, then you can keep it in your gitch ‘til I’m done.”</i> Grabbing you by the butt, Sylvie pulls you close. <i>“But don’t let that fool you into thinking I’m not flattered.”</i> Her hand rubs you fondly. <i>“I am. Here, why don’t you settle for some other eye-candy while I talk? I know how hard it is to make eye-contact when you’re hot and bothered.”</i> She pulls her skin-tight shirt");
		//output(" up and over her head");
		output(" off her person");
		output(", leaving her in nothing but a bra.");
		output("\n\nGulping, you accept the offer and peer deep into her cleavage. It’s as expansive as it is tantalizing. You struggle with your own urge to climb into it.");
		output("\n\n<i>“Where was I? Right, so I got this high grade fuck-toy designed for use by ‘taurs. I even got the extra-large size. The regular seemed a little small, probably designed for smaller centaurs and deertaurs. I’m a whole different animal.”</i> Sylvie twists her torso, bouncing her boobs from side to side. Any attempt you were making to meet her face is instantly aborted. <i>“The box it came in could’ve been used to ship a fridge. It was that big.”</i>");
		output("\n\nStill locked to her tits, you ask her what sort of sex-toy it was. You’re not familiar with the Taur-Tamer.");
		output("\n\nAt this, the brazen brunette pauses. <i>“It’s uh... well, it’s a sort of column that you install from the floor to the ceiling with mounts for various sorts of phallic attachments. You can put anything on it from a terran dick all the way up to fantastical, Naughty Wyvern dildo. Stuff that they haven’t even invented mods yet for. I stuck to the standard horse-cock... upsized a few times for good measure. A normal stallion just doesn’t quite cut it when you’re a literal moose, eh?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“It has a programmable VI with different subroutines for different experiences, so it can fuck you soft, hard, or anywhere in between. Sometimes variations of all three.”</i> Sylvie ticks off her fingers as she explains, then noticing where your eyes are, uses her forearms to squeeze her boobs together, causing her cleavage to come close to spilling out a suddenly ill-fitting bra. <i>“I was so horny, but by the time I got it out of the box I couldn’t be bothered to bolt it into place. I just stuck it on the wall, plugged it in, and went to town.”</i> She runs a finger along the rim of her glass, sighing wistfully. <i>“I’d tried the odd suction-cupped dildo before, but they just don’t compare. It was like I was really getting fucked, just... absolutely pounded.”</i>");
		output("\n\nIf it was pounding the hell out of her, how did both her and the toy wind up going through the wall? You go ahead and ask.");
		output("\n\n<i>“Well it started out that way. At first it was perfect, exactly what I wanted and more, but you remember those animal instincts I was talking about?”</i> Sylvie lifts your chin to bring your eyes back up to hers. Then, once satisfied you remember what she’s talking about, puts her hands under her bra-clad boobs and idly bounces them. <i>“Getting fucked wasn’t enough for my body. It decided it was going to be an active participant in this hour-long bang-a-thon.”</i> She thumbs a nipple and sighs, <i>“And it felt so much better. Something about banging back into whoever’s fucking you makes the experience so much more satisfying. I couldn’t stop myself. I slammed my pussy into that dick so hard that the impacts must have sounded like gunshots. I heard the wall creak but I didn’t care; I just wanted to cum.”</i>");
		output("\n\nSylvie shudders ");
		processTime(20);
		pc.lust(10);
		sylvieDrunkBump(drunklevelChange);
		if(sylvieDrunkLevel() >= 2) output("and pinches a nipple through the fabric of her bra");
		else output("picks her top back up, stopping just short of putting it back on");
		output(". <i>“I did get to cum by the way. That extra ounce of enthusiasm was all it took to break through the apartment wall and into my neighbor’s place, squealing and gushing the whole way. Somehow I landed on top of the pole with the dick still in me, creaming myself while it pumped what felt like a gallon of lube into my snatch.”</i> Sylvie giggles");
		if(sylvieDrunkLevel() < 2) output(" and covers her boobs back up");
		else output(" and looks around to make sure no one is watching. Satisfied, she peels the top of one of her bra cups down to give you a peek of boob");
		output(". <i>“I was lucky he wasn’t home, or I’d have never lived it down. Instead I had the time to calm down, clean up, and pretend like I had slipped on the floor and crashed through.”</i>");
		output("\n\n<i>“He believed that?”</i>");
		output("\n\nThe ");
		if(sylvieDrunkLevel() >= 2) output("flirty mountie");
		else output("buzzing moose-girl");
		output(" wiggles her hand noncommittally. <i>“Sort of? I think he could smell a little leftover residue... but I was paying for the damages, so he didn’t complain much. I’m a good neighbor most of the time,”</i> Sylvie observes. <i>“I don’t make much noise at night... at least not at home. I’ve got the Kui Country Bar and Lodge");
		if(sexedSylvie() > 0) output(" and you");
		output(" for that. And you can bet your ass I properly installed the Taur-Tamer after that mess. The only things shattering in my place now are my orgasms.”</i>");

		//Drunko
		if(sylvieDrunkLevel() >= 2)
		{
			output("\n\nSylvie loops her discarded top around your neck and pulls you close. <i>“What about you, tiger? I think you’d hold up better than the wall, eh? You’d be a damned fine Taur-Tamer.”</i>");
			sylvieMenu();
		}
		//Not
		else
		{
			output("\n\nSylvie downs her beer, following it up with a raucous belch. <i>“Oof! I guess I’ve probably told you all my best stories by now. You’re a real sweetheart, sticking around while I’ve gotten you all hot and bothered. I’d really like to give you a hug, if you’re okay with it. I don’t want you to go. Maybe... if you wanted... you could come back soon? Or buy me more drinks. I’ll tell you my stories all over again! Maybe we’ll be able to make a new one together after I get a little more loosened up.”</i>");
			sylvieMenu();
		}
	}
}

//Hug
//Buzzed/Drunk Sylvie only.
public function hugSylvie():void
{
	clearOutput();
	showSylvie();
	//Bimbo
	if(pc.isBimbo()) output("<i>“Oooh, let’s hug!”</i> you gleefully cheer, spreading your arms wide.");
	//Bro
	else if(pc.isBro()) output("You silently spread your arms wide, inviting her to lay her biggest, best hug on you.");
	//Nice
	else if(pc.isNice()) output("<i>“A hug sounds great,”</i> you say, opening your arms invitingly.");
	//Misch
	else if(pc.isMischievous()) output("<i>“You can hug me if you can catch me,”</i> you offer, spreading your arms wide. <i>“But be warned, the wild [pc.name] Steele is as elusive as [pc.heShe] is charming.”</i>");
	//Hard
	else output("You spread your arms wide. <i>“Go nuts.”</i>");
	//Merge
	output("\n\nSylvie practically squeals in excitement before wheeling on you, hooves clattering noisily on the hard floor. The big, half-moose woman ");
	if(pc.tallness <= 60) output("has to bend low to grab you, lifting you way off the floor and up into her arms.");
	else if(pc.tallness <= 80) output("has to bend down a little to grab you, lifting you slightly off the floor in the process.");
	else
	{
		output("seems all too pleased to have someone ");
		if(pc.tallness <= 12*9+1) output("approaching her own height");
		else output("taller than her");
		output(" to grab onto for a change, pulling you in close.");
	}
	output(" This close to her, you can appreciate how unnaturally warm she is. It must be a side-effect of the transformation that gifted her with her enormous lower half. Whatever the cause, when she enfolds you into a tight, almost crushing hug, it feels almost smothering. She’s so warm and soft, with such a pillowy chest, that you could almost lose yourself in her embrace.");
	if(pc.isSmashed() || pc.isDrunk()) 
	{
		output(" Drunk as you are, you lay your head down and immediately feel your eyelids drifting closed.\n\nYou come to in a chair next to the big taur a few minutes later. She’s stroking your head and gently calling your name, a glass of water in her hand. How sweet, she made sure you were okay. You thank her for the help and swiftly drink the beverage before standing up. Maybe you’d better sleep this one off?");
		//End scene, next main menu.
		processTime(85);
		restHeal();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	output("\n\nYou wrap your arms around her back, surprised to feel a bit of muscle definition under your fingers. Then again, carrying melons as big as hers must be quite a workout. Her back provides a firm handhold to cling to while her front offers the most delightful cushion. The harder you squeeze, the deeper into her tits you sink, and the more firmly she hugs back. Sylvie sighs contently and reaches up to stroke your ");
	if(!pc.hasHair()) output("head");
	else output("[pc.hair]");
	output(", her other hand brushing up and down along your spine. Her fingertips are softer than you would expect yet surprisingly strong. You doubt you could wiggle out of her grip if you tried.");

	//Boobies
	if(pc.biggestTitSize() >= 1)
	{
		output("\n\nThe moosey police-girl’s breasts and yours press down against one another in an unspoken battle of mammary proportions, sometimes slipping and wobbling when you shift against each other. She presses your face into the nape of her neck as the hug goes on, and you feel her breath, rapid and excited against your [pc.ear]. Her nipples are definitely getting ");
		if(pc.lust() >= 75 && !pc.hasInvertedNipples() && !pc.hasLipples() && !pc.hasFlatNipples()) output("as hard as yours");
		else output("hard");
		if(pc.lust() < 75 && !pc.hasInvertedNipples() && !pc.hasLipples() && !pc.hasFlatNipples())
		{
			output(", just like yours");
		}
		if(pc.hasDickNipples()) output(". If only she knew the about the secret dicks rubbing against her tits, barely hidden from view");
		output(". Reaching lower, Sylvie grabs hold of your [pc.butt] and lifts, letting your sinfully squished breasts decompress. Now the pressure is on your crotch.");
	}
	//Nobewbs
	else output("\n\nThe moosey police-girl’s breasts are quite soft for their size, molding around you like memory foam pillows to perfectly cradle the parts of you that press into them the hardest. She shows no signs of discomfort. If anything, her nipples are getting harder and harder against you the longer this goes on. She presses your face into the nape of her neck, and you feel her breath wash over your [pc.ear], hot and rapid. Reaching lower, Sylvie grabs you by the [pc.butt] and lifts, letting a little bit of pressure off her chest in order to press the rest of your body against her - namely your crotch.");
	//Cocks
	if(pc.hasCock()) 
	{
		output("\n\n<i>“God, I love giving out hugs!”</i> Sylvie declares while rubbing her whole body against you. Your [pc.cocks] can’t help but get hard when pressed against her, nevermind that her pussy is nowhere within sight. A huge-breasted amazon is manhandling you against her waistline while you’ve got a faceful of tit. The only sensible response is to grow the biggest, bulgiest boner");
		if(pc.cockTotal() > 1) output("s");
		output(" that you can. She feels it too. There’s no way that she can’t, not while she’s basically grinding ");
		if(pc.cockTotal() > 1) output("iron bars");
		else output("an iron bar");
		output(" against her belly. She confirms your thoughts moments later by saying, <i>“Mmm, don’t go blowing your top yet, tiger. You keep ");
		if(pc.cockTotal() == 1) output("that big hard-on");
		else output("those big hard-ons");
		output(" ready for ");
		if(sexedSylvie() > 0) output("later. Don’t waste it on a little hug!");
		else output("whoever you fuck later tonight. You’ll make some girl so happy.");
		output("”</i>");
	}
	//NoCoxButtCunts
	else if(pc.hasVagina())
	{
		output("\n\n<i>“God, I love giving out hugs!”</i> Sylvie declares while rubbing her whole body against you. You can’t help but get a little wet from all the friction, nevermind that her crotch is out of sight. It certainly isn’t out of mind, definitely not as you luxuriate in the feel of her bare skin rubbing your [pc.vaginas]");
		if(!pc.isCrotchExposed()) output(" through your [pc.lowerGarments]");
		output(".");
		if(pc.clitLength >= 3)
		{
			output(" You thrust your [pc.clits] forward as ");
			if(pc.totalClits() == 1) output("it extends");
			else output("they extend");
			output(" outward, mashing the sensitive organs against the incredible police officer, feeling ");
			if(pc.totalClits() > 1) output("them get so hard that they");
			else output("it get so hard that it");
			output(" might as well be a");
			if(pc.totalClits() > 1) output(" bundle of rock-hard cocks");
			else output("a rock-hard cock");
			output(".");
		}
		else
		{
			output(" You thrust your [pc.clits] forward, grinding yourself off on the incredible police officer");
			output(", so delighted at the shocks of acute ecstasy that it’s all you can do not to scream in delight.");
		}
		output(" There’s no way Sylvie hasn’t noticed the state she’s put you in");
		if(pc.wettestVaginalWetness() <= 2) output(", not with the way you’re quivering and shuddering again and again");
		else if(pc.wettestVaginalWetness() >= 4) output(", not with the rivers of fuck-juices leaking down your [pc.thighs]");
		else output(", not with all the juices drizzling down your [pc.thighs]");
		output(". She confirms your thoughts a moment later by saying, <i>“Oooh, don’t start cumming from this, tiger.”</i> She squeezes your [pc.butt] and kisses your cheek. <i>“");
		if(sexedSylvie() > 0) output("Save it for the back room. If you start cumming... I’ll have to fuck you right here, and then we’ll both get arrested!");
		else output("Save it for whoever you plan to fuck later. You don’t want me to turn you in for public indecency, do you?");
		output("”</i>");
	}
	//Nogenitals because you suck at liiiiife/you actually thought Dr. Lash was your friend
	else
	{
		output("\n\n<i>“God, I love giving out hugs!”</i> Sylvie declares while rubbing her whole body against you. If you had genitals, this would probably feel very, very erotic. Instead, it just feels kind of nice. The incredible police woman must feel similarly as she presses her bare belly against you, her genitals safely ensconced in the rear half of her moose-body. After what feels like minutes of pressing yourselves against one another, she sighs contentedly. <i>“Mmm, you’re fucking amazing. I can hug you all day, and you don’t get all stupid horny or anything. I wish I could hug you all forever.”</i>");
	}
	//Merge	
	output("\n\nYour whole body is sweating by the time you separate. Sylvie is flushed and smiling, and you imagine you must be in a similar state. Regardless, the giantess of a ‘taur decides to cool herself off by chugging an entire beer before your eyes. A belch bursts heedlessly from her mouth the second you separate. Her eyes are a little glassier, a bit drunker, perhaps, but her smile is bright enough to dazzle the grumpiest curmudgeon. <i>“");
	processTime(15);
	pc.lust(33);
	sweatyDebuff(2);
	sylvieDrunkBump(1);
	if(sylvieDrunkLevel() >= 2) 
	{
		output("God, I want to fuck you.");
	}
	else 
	{
		output("Wanna buy me a drink? It seems this one is empty.”</i> She giggles and leans close. <i>“I’ve got some stories that’d make it worth your while, and who knows what I’ll do if I get drunk?");
	}
	output("”</i>");
	if(sylvieDrunkLevel() >= 2)
	{
		sylvieMenu();
	}
	else sylvieMenu();
}

//Sexes
//Standard sexytime lead-in.
public function sylvieSexyTimeIntro():void
{
	clearOutput();
	if(!pc.hasGenitals() && !pc.hasPerk("Myr Venom"))
	{
		if(flags["SYLVIE_THROBB_GIFT"] == undefined)
		{
			output("The moment you speak, Sylvie is drunkenly shaking her head.");
			output(" <i>“Nope! You don’t have any genitals silly. Not yet anyway.”</i> She leans close, close enough to accidentally whack you with one of her antlers. <i>“Oopsie!”</i> Sylvie kisses the spot where she bumped you, then drifts down to your ear, whispering, <i>“I have a little Throbb from a recent bust, if you’d like to get suited up for a little fun.”</i>\n\n");
			quickLoot(new Throbb());
			CodexManager.unlockEntry("Throbb");
			flags["SYLVIE_THROBB_GIFT"] = 1;
		}
		else
		{
			output("The moment you speak, Sylvie is drunkenly shaking her head.");
			output(" <i>“Nope! You still don’t have any genitals silly. Did you lose the Throbb I gave you?”</i> She leans close, close enough to accidentally whack you with one of her antlers. <i>“Oopsie!”</i> Sylvie kisses the spot where she bumped you, then drifts down to your ear, whispering, <i>“I don’t have any more on me, but that mouse over there might. She deals, but I haven’t busted her because she’s such a good informant. Just be careful, okay? Don’t go crazy with that stuff or I’ll only get to see you in the slammer.”</i> She pouts as if it would be the worst thing in the world.");
			flags["SYLVIE_MABBSED"] = 1;
			CodexManager.unlockEntry("Throbb");
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		return;
	}
	if(pc.biggestCockVolume() < 50 && !pc.hasVagina() && !pc.hasPerk("Myr Venom"))
	{
		output("The moment you speak, Sylvie is drunkenly shaking her head.");
		output(" <i>“Nope! You’re, not packing quite enough just yet. You know, that mouse girl might over there might have some Throbb.”</i> Sylvie titters, leaning so close her antler nearly bumps your head. Her voice comes out in a hushed, slurred whisper. <i>“Because she’s my shecret informant! So long as she feeds me intel, I let her minor transguh... transgressions slide, and when I meet a cutie like you who needs a little extra...”</i> She grabs you by the crotch and squeezes, kissing you full on the mouth. Sylvie’s pops off with a giddy grin, still rubbing you. <i>“...I can send you over there to top up. Just be safe, okay?”</i>");
		output("\n\nSylvie nods as if that was the easiest task in the world.");
		flags["SYLVIE_MABBSED"] = 1;
		CodexManager.unlockEntry("Throbb");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	showSylvie(true);
	output("The moment you speak, Sylvie is in motion, displaying remarkable reflexes for one so wildly inebriated. She grabs you by the hand and ");
	if(pc.isTaur() || pc.isGoo() || pc.isNaga() || pc.isDrider()) output("drags you toward the baths");
	else output("tosses you on her back, clopping over to the baths");
	output(" without an ounce of subtlety, seemingly blind to the libidinous catcalls and crude cheers coming from the regulars. Her bra disappears the moment you’re through the door, and along with it, any sense of composure. She drunkenly leans back over her hindquarters, giving a sensuously inviting look. <i>“Since you’ve been so great, you can pick... this time. Just don’t leave me waiting.”</i> The nine-foot tall amazon tugs on her nipples and pivots, presenting you with a pussy so puffy and engorged that the purple-flushed skin shines on its own.");
	currentLocation = "CANADA7";
	generateMap();
	processTime(1);
	clearMenu();
	sylvieSexMenu();	
}

public function sylvieSexMenu():void
{
	clearMenu();
	if(pc.hasCock())
	{
		var x:int = pc.cockThatFits(sylvieCuntSize());
		if(pc.isTaur())
		{
			if(x >= 0 && pc.cockVolume(x) >= 50) addButton(0,"Mount Pussy",taurPussyMountWsanIsMyHero,undefined,"Mount Pussy","Mount her the way that ‘taurs were meant to be mounted - by another ‘taur.");
			else if(x >= 0 && pc.biggestCockVolume() < 1500) addDisabledButton(0,"Mount Pussy","Mount Pussy","You’re a little too small for her to interested in a proper mounting.");
		}
		else addDisabledButton(0,"Mount Pussy","Mount Pussy","You need to be some kind of centaur-like creature for this.");

		if(pc.biggestCockLength() >= 12) addButton(1,"TittyBlow",tittyBlow,undefined,"Titty Blow","Your your dick wet in Sylvie’s drizzling pussy, then stuff it between her tits until you’re blowing a load down her throat.");
		else addDisabledButton(1,"TittyBlow","TittyBlow","Your penis is too short to truly enjoy the expanse of cleavage that Sylvie offers. Come back when your largest member is 12 inches or longer.");
	}
	else
	{
		addDisabledButton(0,"Mount Pussy","Mount Pussy","Only penis-wielding, tauric creatures can do this.");
		addDisabledButton(1,"TittyBlow","Titty Blow","You need a penis 12 inches or longer to titfuck her massive mammaries.");
	}
	if(pc.hasVagina())
	{
		addButton(2,"SpankNGrind",spankyGrindyWimyFunSchlicks,false,"Spank ‘N Grind","Spank her and grind on her slit and clit until you mutually orgasm.");
		addButton(3,"Cuffs&Tongue",cuffsAndTongueFromNonesuchyDuchy,false,"Cuffs & Tongue","Get cuffed up and force-fed dripping deer cunt.");
	}
	else 
	{
		addDisabledButton(2,"SpankNGrind","Spank ‘N Grind","You need a vagina in order to do all this.");
		addDisabledButton(3,"Cuffs&Tongue","Cuffs & Tongue","You need a vagina in order to experience this forceful scene!");
	}
	//[COMPLETE] [VenomKiss] Red Myr PCs only, kiss and lick her for an hour or two, making her cum like crazy.
	if(pc.hasPerk("Myr Venom")) addButton(4,"Venom Kiss",redMyrSylvieFunz,undefined,"Venom Kiss","Teach Sylvie just how fun red Myr venom can be!");
	else addDisabledButton(4,"Venom Kiss","Venom Kiss","You need to secrete red Myr venom in order to do this.");	
	addButton(14,"Leave",leaveSylvieHighAndLessThanDryYaCunt);
}
public function sylvieForcyRouter():void
{
	var options:Array = [];
	var x:int = pc.cockThatFits(sylvieCuntSize());
	if(pc.hasVagina())
	{
		options.push(cuffsAndTongueFromNonesuchyDuchy);
		options.push(spankyGrindyWimyFunSchlicks);
	}
	if(pc.hasCock())
	{
		options.push(pelvisShatteringFuntimesWithSylvie);
		if(pc.isTaur() && x >= 0 && pc.cockVolume(x) >= 50) options.push(taurPussyMountWsanIsMyHero);
	}
	options[rand(options.length)](true);
}

//If picks leave option, FORCEY TIMES!
public function leaveSylvieHighAndLessThanDryYaCunt():void
{
	clearOutput();
	showSylvie(true);
	output("When you turn to leave, Sylvie ");
	if(!(pc.armor is EmptySlot)) output("snags you by the collar");
	else output("grabs you by the shoulder");
	output(" and spins you around, slamming you into her side. <i>“Don’t worry, Momma Sylvie will pick for you if you don’t wanna worry about it.”</i> She pulls your face ");
	if(pc.tallness < 80) output("up");
	else if(pc.tallness < 95) output("over");
	else output("down");
	output(" to one of her tits, forcibly rubbing her nipple over your [pc.lipsChaste]. <i>“I know just what to do with you,”</i> she drunkenly promises, bending low to slap your ass. The motion makes her breast jiggle against your face.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",sylvieForcyRouter);
}

//[COMPLETE] [Wsan] [Mount Pussy] - Big Dikked Taur Mount It
//for taurs with dik >10"
public function taurPussyMountWsanIsMyHero(forcy:Boolean = false):void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	var x:int = pc.cockThatFits(sylvieCuntSize());
	//Forcy Fen Intro
	if(forcy)
	{
		output("Sylvie, never breaking eye-contact, backs up, forcing you to step back further and further. Soon, you’re against a door, but she just keeps coming. She kicks off the ground, launching her massive rump high in the air, and hops back, slamming her hooves against the wall to either side of your head. Her pussy, big, round and smelling strongly of horny taur fills your vision and tickles your nose. You push back, but the touch just makes her lubricate. Musky moose-goo trickles out of her pussy, doubling the intensity of her wanton scent.");
		output("\n\nFrom somewhere deep inside you, a growl worms out of your throat, and you push back twice as hard. Sylvie doesn’t fall away. Instead, the door behind you gives out, and you stumble in, Sylvie clopping in after. Her pussy is lush and dribbling, shimmering like a puffy purple target for your [pc.cocks]. You rear up and throw yourself at her, launching yourself halfway up her massive rump, clawing at her furred midriff for purchase.");
		output("\n\n<i>“Oh! That’s it, big [pc.boyGirl], now you’re getting in the spi-”</i> she slurs, tensing up when she feels your [pc.cock " + x + "] slap against her dribbling pussy. <i>“Oh, fuck it!”</i> she groans, holding still while you align the rigid pole. <i>“Fuck me so hard!”</i>");
	}
	//Non forcy intro
	else
	{
		output("By the time the intoxicated moosetaur carelessly bumps into the door to a private room, sending it slamming open, you’re practically halfway up her massive rump, clawing at her furred midriff for purchase.");
		output("\n\n<i>“Oh! Easy big [pc.boyGirl], wwwe’re not even ins-”</i> she slurs, tensing up when she feels your [pc.biggestCock] slap against her dribbling pussy. <i>“Oh, fuck it!”</i> she groans, holding still while you align your throbbing length.");
	}
	//Merge
	output("\n\nA short, shrill scream of lust echoes through the halls of the onsen’s accommodation as you roughly fuck your way between the lips of her suddenly-soaked and pliable cunt. Mounting her properly, you savagely thrust your hips, each motion jabbing her forward a couple of steps. Moving her closer to the bed in the centre of the room, you reach out one hind leg and surreptitiously slam the door shut behind you before continuing to ride your ");
	pc.cockChange();
	//first time: 
	if(!forcy && flags["SYLVIE_TAURMOUNT"] == undefined) output("newfound ");
	output("submissive broodmare. She makes beautiful little grunting gasps every time you slip deeper into her, sounding very un-ladylike in her drunken pleasure.");
	output("\n\nThe sensation of her dripping pussy is <i>amazing</i> - she must have mods, because the way she’s squeezing your cock is otherworldly. It takes all you have not to just cum on the spot, her passage tightening from tip to tail in repetitive massaging motions. Her voluptuous thighs begin to shake while she moans, her hind legs pulling apart slightly as she finally reaches the bed, bracing herself against the end of it.");
	output("\n\n<i>“Cumming already?”</i> you pant, drilling her ");
	if(pc.balls > 1) output("balls deep,");
	else output("as deep as possible,");
	output(" sheathing your entire length inside her impossibly tight, sodden fuckhole. It’s a struggle to endure the wildly erotic way her walls grip at you, desperately enticing you to blow a fat load right into her depths.");
	output("\n\n<i>“Uhhh! M-my clit!”</i> she gasps, rocking back into you. <i>“Your cumveinnngh! Is rubbing my clit!”</i>");
	output("\n\nSylvie throws her head back and cries out in ecstasy, her back arching to the point she’s leaning back into you and looking up into your eyes with an expression of agonizing lust. Her mouth hangs open, emitting fluttering gasps of shocked pleasure, each one signalling a simultaneous squeeze of her pussy walls around your bloated prick. You roughly take her head in your hands and kiss her, sealing her groans with your [pc.lips].");
	output("\n\nSylvie’s powerful hind legs continue to needily fuck back into you as you strain to keep her immobile, clamping your forelegs around her midriff to hold her still. The gesture calms the moosetaur somewhat, acting as a primal reminder that a mare should be submissive and docile when she’s being pumped full of cock. Given the opportunity to explore her body, you reach down and free her massive, shaking tits from the constraints of her mountie top. She moans as you squeeze a rock-hard nipple before letting go, watching them bounce atop her chest every time you thrust into her quivering snatch.");
	output("\n\n<i>“Oh my </i>god<i>, you’re good,”</i> Sylvie pants between each thudding impact against her ample ass, stroking your ego every bit as much as your dick. Her pretty little face has taken on an expression of fervent admiration, your passionate tryst evidently earning you the respect of the busty bombshell. You can’t help but want to drive her on even further, her words only encouraging you to pummel her harder.");
	output("\n\nShe drops onto the bed and screams in maddened pleasure, unable to keep her voice down as you slam her into submission. Her massive breasts shake beneath her as you work yourself towards orgasm, leaning down and placing your hands on her sweaty shoulders for grip. When you finally find yourself reaching a crescendo, you pull her up and into you as you sink your cock ");
	if(pc.balls > 1) output("balls deep");
	else output("to the hilt");
	output(" in her spasming, squirting cunt.");

	output("\n\nSylvie gives a little scream every time you deposit a warm load in her, your bulging cumvein compressing her clit against her swollen pussy. She suffers a back-arching orgasm with each jet of spunk you pack into her warm, wet pussy, her legs shaking and her stomach flexing with the effort of keeping up. Her squeezed-close eyes slowly open, her body still tautly wrapped around your cock, and she looks up at you worshipfully, lifting an arm behind her to gently caress your face.");
	output("\n\n<i>“You... you’re amashing,”</i> she whispers in a drunken slur, little shocks running across her expression every time she feels your cock pump more semen down her fuckhole. <i>“Mmmm...”</i>");
	output("\n\nYou bend down to kiss her again, enjoying the softness of her lips before you pull away. <i>“I think half the station must’ve heard you there,”</i> you murmur to her.");
	output("\n\n<i>“Who cares,”</i> she moans, still bathing in the afterglow. <i>“Anyone would sound like me after </i>that<i>. I’ve never been mounted like that in my life.”</i>");
	output("\n\n<i>“Glad to help out,”</i> you say with a feral grin, <i>“but we’re not done yet.”</i>");
	output("\n\n<i>“Wuh- what do you m-”</i> she begins, before you surprise her by pulling your hips back and driving back in. <i>“Guh!”</i>");
	output("\n\nShe tightens up immediately, looking up at you in wonderment.");
	output("\n\n<i>“You’re still hard after cumming?”</i> Sylvie asks, before smiling and massaging your cock with her pliant pussy. <i>“You fucking </i>animal<i>.”</i>");
	output("\n\n<i>“Just for you,”</i> you promise.");
	output("\n\nYou slowly draw back, her soft walls tightly gripping you all the way, until your [pc.cockHead " + x + "] is right at her entrance.");
	output("\n\n<i>“Give it to me, you beast,”</i> Sylvie moans, shallowly thrusting her hips back at you. <i>“Fill me up.”</i>");
	output("\n\n<i>“You asked for it,”</i> you grunt, rearing back.");
	output("\n\nYou spear her all the way to the hilt, pushing through the wetness of her unresisting walls. She cries out in passion, her humanoid front half collapsing onto the bed. You fuck her slower than before, but with even more intensity. Each thrust results in a loud slap of flesh on flesh, the shaking moosetaur’s muscular butt providing a cushy surface for you to bounce against.");
	output("\n\nYou reduce her to a mewling mess on the bed with each flex of your hips, Sylvie’s squirting pussy desperately working your rod inside her, squeezing you with all her might. She groans into the sheets, teeth grit during the rough violation of her nethers. Each movement sets her ass shaking and her body shuffling forward, the busty ‘taur grabbing at the sheets with white knuckles as she’s dragged across them again and again.");
	output("\n\nFinally, you feel yourself about to cum again. You pull back and, with a bestial roar of dominance, slam into Sylvie at full force before you tighten your grip around her midriff and begin pumping her full of your seed. Between the load you already dumped in her and the gouts of sticky cum spurting into her now, it’s not long before she’s messily overflowing. Warm seed slowly rolls down her shaking, spread-apart hind legs as it leaks from her abused pussy, spattering to the floor.");
	output("\n\nWhen you’re finally done, you give a deep, satisfied sigh and pull your cock from Sylvie’s still-gushing cunt, dismounting her. She stays on the bed for a second before pushing herself up with her arms, orange eyes half-lidded and clearly still in an orgasmic haze.");
	output("\n\n<i>“Oh my god,”</i> she mumbles, dizzily seeking out your face and meeting your gaze in reverence. <i>“My world is still spinning, and that’s </i>not<i> the alcohol.”</i>");
	//2 cums thus far.
	//Untreated: 
	if(!pc.isTreated()) 
	{
		output("\n\n<i>“Glad to hear it. Seems like you enjoyed yourself.”</i>");
		output("\n\n<i>“Enjoyed myself?”</i> she asks, a touch incredulous. <i>“[pc.name], I don’t know if I’ll ever be able to fuck anyone else after that.”</i> She sighs wistfully, a twinkle in her eye. <i>“You’ve ruined me for all my other partners.”</i>");
		output("\n\nThe two of you break up into laughter before you help her up off the bed, Sylvie experimentally stretching her massive hind legs and giving you a bit of a show before she decides she can still walk on her shaky hooves. You clean her up and head back to the inn.");
	}
	else
	{
		output("\n\n<i>“Hope you didn’t think we were done, sweetheart,”</i> you grunt. <i>“I’ve got something else you can drink.”</i>");
		output("\n\nHer mouth drops in open-mouthed awe. <i>“You can keep going?”</i> A little bit of apprehension dawns on her face. <i>“When do you </i>stop<i>?”</i>");
		output("\n\n<i>“Whenever I want,”</i> you reply evenly.");
		output("\n\nSylvie looks at you, then down at your [pc.biggestCock] before mouthing ‘wow’ and slipping off the bed. She seats herself, assuming a demure position with her legs folded under her body, and opens her mouth wide expectantly.");
		output("\n\n<i>“Heh, good girl.”</i>");
		output("\n\nYou stand astride her, using the bed to position yourself so your cock is at the level of her mouth. She dips forward to lick at the head before you push forward, insistent. Understanding the gesture, she opens her mouth once more and takes the first few inches in. You sigh in bliss as you feel her tongue attend to the sensitive tip of your swollen dick, urgently slurping up the remnants of your cum and her love juices.");
		output("\n\nSylvie keeps her hands out of the equation, which suits you just fine. She handles your prick with expert care in spite of her drunkenness, sliding her lips inches down your length and sucking hard, leaving an imprint of her cyanlipstick on your cock. You groan when you feel her tongue slide down your cumvein, teasing the underside of your slickened shaft.");
		output("\n\n<i>“Gonna cum soon, Sylvie,”</i> you grunt, your lower half flexing as you feel yourself nearing the edge.");
		output("\n\nShe responds by obediently taking you deeper, the head of your cock almost in her throat when you loudly groan in release.");
		if(pc.cumQ() < 2000) output("\n\nThe first spurt of seed goes straight down her gullet, Sylvie quickly swallowing as you follow it up with a few more, painting the back of her throat [pc.cumColor]. She relaxes into a rhythm, gulping down your jizz every time your cumvein flexes across her tongue. When the flow stops, she swallows down the last of your load and sits back on her haunches.");
		else if(pc.cumQ() < 5000) output("\n\nRopes of [pc.cumColor] seed splatter against the back of her throat, running down her gullet and into her stomach. Sylvie quickly swallows it down, settling into the rhythm of gulping your jizz every time your cumvein flexes across her tongue. When the flow finally stops, she swallows down the last of your load and sits back on her haunches.");
		else if(pc.cumQ() <= 15000) output("\n\nSylvie makes a surprised noise from below as thick ropes of seed gush right down her gullet, rapidly swallowing to keep up with the flow of jizz into her tummy. You paint her throat [pc.cumColor] with your cum as she settles into gulping a load down every time your cumvein flexes across her tongue. When the torrential flow finally stops, she struggles to swallow down the last of your loads and sits back on her haunches, panting.");
		else 
		{
			output("\n\nSylvie exclaims from below as a torrent of [pc.cumColor] seed gushes down her throat, spraying into her stomach. The poor girl can barely keep up with the flow, taking gulping swallows every second just to try and keep your cock in her mouth while your cumvein flexes across her tongue. Eventually, it’s no use, and she has to pull your still-spurting prick from between her lips. Jizz runs from her mouth, bulging cheeks unable to contain your virility, and splatters across the top of her freckled breasts.");
			output("\n\nYou pull back from her and admire the view of the astonished, cum-soaked moosetaur. Her beautiful face and massive rack are absolutely covered in your jizz.");
			output("\n\n<i>“Lookin’ good,”</i> you say, nodding approvingly.");
			output("\n\nShe tries to speak, but the only thing that comes out is a fresh stream of cum that runs down her chest. Taking a few hard swallows and gasping for air, she gives it another shot.");
			output("\n\n<i>“Oh my </i>god<i>,”</i> Sylvie exclaims raggedly. <i>“I feel like I gained a few kilograms just then.");
		}
		output("\n\nYou taste... divine.”</i> She looks almost puzzled at the realization, absently licking around her lips to get the rest of your cum.");
		output("\n\n<i>“Probably the Treatment,”</i> you reply with a shrug. <i>“Seems to please the ladies.”</i>");
		output("\n\n<i>“God,”</i> Sylvie says again, gazing up at you with a new look in her eye. <i>“And I bet you could do it again, couldn’t you?”</i>");
		output("\n\nYou just give her a content smile, and she sighs wistfully. <i>“Not enough men ");
		if(pc.mf("","f") == "f") output("- or women,”</i> she adds, <i>“");
		output(" can do that around here. Maybe I should use my leave to head down to New Texas sometime...”</i>");
		output("\n\n<i>“Just make yourself available when I’m around and I’ll see you’re taken care of,”</i> you promise her.");
		output("\n\n<i>“I believe it, [pc.name]”</i> she says, eyeing you hungrily. <i>“We’re gonna have to get an all-day room sometime... but for now, mind helping me clean up? I’m, er, a little messy.”</i>");
		output("\n\nYou help the shaky moosetaur over to the shower, where she collapses on the floor and leans against the wall. She gives you a grateful smile and a wave as you turn on the hot water.");
		output("\n\n<i>“I guess I’ll see you back in the bar whenever I can stand again,”</i> she says with a laugh. You give her a nod and depart.");
	}
	IncrementFlag("SYLVIE_TAURMOUNT");
	sexedSylvie(1);
	processTime(25);
	pc.orgasm();
	pc.orgasm();
	if(pc.isTreated())
	{
		processTime(15);
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].northExit);
}

//[COMPLETE] [Fenoxo] [Reverse Moose-girl] AKA: Get Your Pelvis Shattered
public function pelvisShatteringFuntimesWithSylvie(force:Boolean = false):void
{
	clearOutput();
	showSylvie(true);
	output("Sylvie brashly shoves you toward one of the tubs. ");
	if(pc.PQ() >= 80) output("You barely regain your balance at the sloping edge, but the aggressively lusty ‘taur’s hindquarters are right there, giving you the bump you need to tumble back into the water.");
	else output("You windmill your arms all the way to the sloping edge, then tumble right on in. Sylvie’s hindquarters are the last thing you see before the waters close in over your head.");
	output(" Lurching up out of the water, spitting and sputtering, you get halfway ");
	if(!pc.isNaga() && !pc.isGoo()) output("to your [pc.feet]");
	else output("up");
	output(" before the moose-girl’s enormous ass thrusts ");
	if(pc.tallness >= 80) output("into your chest");
	else output("against your face");
	output(". The walls tilt crazily as you fall, but at least the water’s edge cushions the impact of ass-on-plasticized aluminum. Assessing your new position, you determine that you could lie back comfortably here, if you chose. The enormous back-half of the drunken police-girl decides for you as it settles into place above, its heavy hooves splattering noisily as it gets into position.");

	//Crotch covered
	if(!pc.isCrotchExposed())
	{
		output("\n\n<i>“[pc.name]~!”</i> Sylvie calls, leaning back across four-legged lower body, <i>“Pull it out already! Don’t make me beg!”</i> She hurriedly drums on her quivering haunches, rapidly transitioning to shuddering slaps that cut through the air like a sharp knife. Her engorged pussy juices itself in response, puffy and gleaming, looking more like a target for taur-dick than traditional female genitalia. In a small, soaked crease, you can see the swelling mass of her clitoris gleaming like a fresh grape, begging to be rubbed and squeezed. Droplets of musky lady-lube drizzle over your [pc.lowerGarmentOuter], filling the air around you with insidious pheromones so strong ");
		if(pc.hasCock(GLOBAL.TYPE_EQUINE)) output("that your flaring horse-cock threatens to burst free under the strength of its own engorgement.");
		else output("that your head swims.");
		output("\n\n");
		if(pc.lust() >= 75) output("You hastily remove the obstructing garment before your steel-hard tumescence thrusts straight through, unable to restrain a sigh of sensuous relief.");
		else
		{
			output("You hastily remove the obstructing garment before Sylvie manhandles you into it. Beneath, your traitorous dick");
			if(pc.cockTotal() > 1) output("s are");
			else output(" is");
			output(" already hard and getting harder by the second. You groan in sensuous delight when your thumb carelessly brushes against ");
			if(pc.cockTotal() == 1) output("it");
			else output("one");
			output(". ");
			if(!pc.isBimbo()) output("To your ears, it sounds entirely too slutty.");
			else output("To your ears, it isn’t slutty enough. You meet Sylvie’s eyes and stroke yourself once more, moaning whorishly.");
		}
		output("\n\n<i>“I told you,”</i> the giggling moose-girl slaps her haunches, dribbling more musky mare-juice, <i>“I told you I knew what to do with you.”</i> Bending almost double, she reaches back to palm her slobbering cunt, gathering enough feminine excitement to lick out of her cupped hand. <i>“Look at how wet I am for you. Imagine how it’ll feel, slipping inside me. Your body can’t wait, eh?”</i> She smears the excess around her lips, polishing them until they acquire a near mirrored sheen.");
	}
	//Uncovered
	else
	{
		output("\n\n<i>“[pc.name]~!”</i> Sylvie calls, leaning back across her four-legged body, ");
		if(pc.lust() >= 40) output("smiling mischievously down at you. <i>“You’re so nice, getting all hard for me! Wanna see me get ready for you?”</i> She winks. <i>“Of course you do. Watch this!”</i>");
		else 
		{
			output("pouting down at you. <i>“Aww, having trouble getting hard? Don’t worry, I have a great cure for whiskey dick!”</i> ");
			if(!pc.isDrunk() && !pc.isSmashed()) output("That might be more useful if you were as sauced as her.");
			else output("You blearily tilt your head, flicking your eyes between her puffed-up puss and her blushing face.");
			output(" <i>“Just lie back and watch. I’ll put on a little how for you.”</i>");
		}
		output("\n\nThe drunken woman begins by reaching back to drum out a simple, tuneless beat upon her moosey hindquarters, her tail flicking from side to side with each soft slap. Soon, her exotic pussy is moistening, releasing a trickle of musky mare-juice to drip onto your [pc.legOrLegs]. She shimmies backward, smacking herself harder. Her muscly, fur-lined haunches ripple from the blows, but her tightening, winking cunt soaks itself with each blow. Flecks of pussy-juice spatter your [pc.cocks]");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(", claiming ");
		if(pc.cockTotal() + pc.balls == 1) output("it");
		else output("them");
		output(", making you every bit as sensuously slippery as Sylvie’s own snatch.");
		if(pc.libido() >= 70 || pc.isTreated() || pc.isBro())
		{
			output(" Her scent hangs in the air like a sexual fog. It tickles up your nose, down your spine, and into your loins, squeezing more and more blood into your [pc.cocks]. You’re hard enough to fuck your way through a brick wall, and if Sylvie’s dazzylingly wet, alien pussy was on the other side, you’d do it right now.");
		}
		else output(" Her pheromones hang between you like a gauzy curtain, brushing by your face, lending the four-legged girl an indescribably erotic air. Without a single ounce of your better judgement or a consultation with your willpower, [pc.eachCock] responds. It’s a pleasant feeling, getting hard while watching a big-breasted police-girl get wetter and wetter just above, letting her soak you in preparation of the coming copulation.");
	}
	//Uncovered, not hard
	if(pc.isCrotchExposed())
	{
		if(pc.lust() < 40) output("\n\n<i>“I told you I’d make you hard,”</i> Sylvie titters, cupping her pendulous tits. She bites her lip and whimpers. Her sopping wet cunt clenches excitedly. <i>“I hope you’re as tough as you look, because I am going to fuck you so hard your dick falls in love with me forever.”</i>");
		//Uncovered, hard
		else output("\n\n<i>“I told you that you’d want to see,”</i> Sylvie titters, gesturing toward your twitching boner. She bites her lip and sighs wistfully, her sopping wet cunt clenching. <i>“I hope you’re as tough as you look, because I am going to fuck you so hard your dick falls in love with me forever.”</i>");
	}
	//Merge
	output("\n\nYou nod and lean back, letting your [pc.cocks] jut into the empty air, throbbing bigger and harder by the second, vainly reaching for the glistening entrance to Sylvie’s Vesperian treasure.");
	if(pc.smallestCockVolume() > sylvieCuntSize())
	{
		output("\n\n<i>“That’s good because I’m going to ride the hell out of you in a moment. First, let’s make sure everything will fit.”</i> She pulls a bottle of Peggy’s Elasticizing Oil out from beneath a bench and leans back, drizzling it over her lips and your cock both. <i>“There. That’ll keep you from splitting me in half... and me from rupturing anything in that delicious dick,”</i> she says. <i>“Brace yourself.”</i> With her hind legs trembling, Sylvie drops herself into the water - and onto you.");
	}
	else output("\n\n<i>“That’s good, because I can’t go another second without you inside of me,”</i> she admits. <i>“Brace yourself.”</i> With her hind legs trembling, Sylvie drops herself into the water - and onto you.");
	processTime(14);
	pc.lust(200);
	clearMenu();
	addButton(0,"Next",crotchBustingSnuSnuPartTwo);
}

public function crotchBustingSnuSnuPartTwo():void
{
	clearOutput();
	showSylvie(true);
	var x:int = pc.cockThatFits(sylvieCuntSize());
	if(x < 0) x = pc.smallestCockIndex();
	var cVolume:Number = pc.cockVolume(x);
	output("Your copulation with Sylvie is no gentle slip between the legs. It’s a nigh-instantaneous transition from eager waiting to being completely enveloped in a steaming taur-snatch. Her swollen entrance works like a funnel to guide you directly to the gushing center. There, her slickened tunnel accepts you with seeming ease");
	if(cVolume >= 800) output(", despite your cunt-destroying size");
	output(". Heavy weight slams into your [pc.hips], smashing you to the ground under what must be at least 200 pounds worth of taurbutt, but it only serves to sink you that much deeper into her depths");
	if(cVolume >= 1000) output(", swelling her belly around a dick too big for any sane sapient to take.");
	else if(pc.hasKnot(x)) output(", pushing your knot inside her before it can dare inflate.");
	else output(", squishing her padded pussy’s entrance down in order to take every single millimeter of available dick.");
	pc.cockChange();

	output("\n\n<i>“");
	if(cVolume < 300)
	{
		output("Gosh, you feel good for a little [pc.guyGirl]! So active, twitching and grinding on my clit!");
	}
	else if(cVolume < 700) output("Gosh, that’s just what I needed, a little skin on skin - friction and affection and love!");
	else if(cVolume < 1000) output("Gosh, you’re big! I can feel your heart pumping through my pussy. You must be almost as excited for this as me.");
	else output("H-holy~! Uhm... uh, g-goddamn you’re big. It’s like your cock is stretching out my whole body, taking over my pussy. I can feel your heart beating.... So fast...”</i> She whimpers. <i>“M-mine too!");
	output("”</i> Rivulets of clear arousal stream down your [pc.legOrLegs] as Sylvie’s legs flex, dragging her muscular snatch up your [pc.cock " + x + "], squeezing it so tightly that you fear she’ll rip it right off your body.");
	output("\n\nYou have a moment to breathe before she slams down again, crushing to the floor once more. Girlcum gushes from her stuffed snatch in every direction, rendering your body slick from her secretions and more than a little warm. Sylvie looks back at you over her shoulder as she starts to fuck you, one finger twirling her hair playfully while the toys with tits a little too big to be ignored. She winks when she slams down especially firmly, her cunny squeezing down equally firmly, ");
	if(cVolume < 1000) output("shaping itself into a tunnel just tight enough to drive you wild.");
	else output("straining to squeeze down on a dick that seems determined to permanently stretch it out of shape.");
	output(" Her clit rubs against your [pc.sheathOrKnot " + x + "] on the way down, a little rubbery nub that makes her squeal when it passes over the ridge of a vein");
	if(pc.balls > 0) output(" and moan as it rests against your [pc.sack]");
	output(".");
	output("\n\n<i>“Oof!”</i> you grunt involuntarily. The longer this goes on, the more forcefully she rides your dick, and the more crushing the blows from her bestial heiny.");
	//Bro - no new PG
	if(pc.isBro()) output(" You grunt in irritation and grab her tail in your fist, yanking on it until she’s compelled to take a little of her weight off your middle. She cries out like a slut in heat, getting off on it, so you slap her ass with your other hand for her temerity, dragging her up and down your dick. What was once a forceful copulation has yields to a submissive, lazy fuck, Sylvie’s slutty body obeying your every whim.");
	//Nonbro no new pg
	else 
	{
		output("\n\nYou grunt from the near-bonecrushing impacts, the rhythmic pain mixing with the pernicious pleasure until you can scarcely tell one from the other, more aware of the needful ache ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("building below");
		output(" than which particular sensation is feeding it. Struggling would be futile. There’s nothing you can do but lie there and let Sylvie pound away at your prick. Her slutty body slams into your loins, trying to hammer you as deeply into her sloppy pussy as possible.");
	}
	//Merge
	output("\n\nSylvie’s thoroughly modded muff adores every second of it. Inside, her folds squeeze and ripple in ways no human ever could");
	if(CodexManager.entryUnlocked("The Treatment")) output(", not even a heavily enhanced New Texan");
	else output(", not even the sluttiest bimbo");
	output(". Half the time, she grips so you tightly that it almost feels like you’re getting jacked off with a onahole two sizes too small. The rest of the time, her folds flutter faster than a humingbird’s wings, alight with such delirious, drunken pleasure that their nerves fire almost entirely at random. Juices soak you from the waist down, mixing into the warm water below.");
	output("\n\nWhenever Sylvie’s hips clap into yours, a fresh splatter of gleaming girl goo erupts from her taut haunches. The giggling drunkard bends back and back... and back until her palms rest above her hindmost hips, displaying a gymnast’s flexibility. High atop her arched chest, two pendulous breasts sway. No, tits. Boobs that big with nipples that lewd are fit for little more than ogling and groping, but perhaps in time they could make for mighty milkers. For now, you watch her pinkish nips wobbling alongside their owner’s obscene motions, hypnotically jiggling a half-step behind her haunches.");
	output("\n\nMore important are her bright orange eyes, alternatively watching for any signs of discomfort and crossing from pleasure. The giant-sized moose-girl slaps her own ass and moans in uninhibited excitement, her tunnel seizing your dick from [pc.sheathOrKnot " + x + "] to [pc.cockHead " + x + "] and squeezing, hard. <i>“Oh my goooood, just give me that cum already!”</i> she gasps, panting as she ");
	if(cVolume >= 1000) output("doubles her pace");
	else output("wrings your dick twice as hard");
	output(", her juices flowing more freely by the second. <i>“I - ah! - I wanna see you do it. See how good I make you feel.”</i> She gyrates atop you when she bottoms out, swiveling her enormous animal-hips in a quick figure-eight atop your [pc.cock " + x + "].");
	output("\n\nYou arch your back and throb powerfully, but you don’t quite cum yet. The edge is there; a few quick thrusts is all it would take. ");
	if(!pc.isBro()) output("Sylvie just needs to give you a few more bone-jarring pumps to get all the virile cream she wants.");
	else output("You just need to drag her around by her tail until she thumps into your crotch a few more time; all the virile cream she could possibly want is right there, waiting.");
	//Nonbro
	if(!pc.isBro()) output("\n\n<i>“Oh, you’re gonna do it! I can see it in your eyes,”</i> Sylvie announces, lifting herself up in order to jackhammer you with two dozen micro-thrust. She only bothers to lift up an inch or two before slamming back down, but she does it so rapidly and with such enthusiasm that it’s impossible for you not to give her exactly what she wants, no matter how bruised you may be.");
	//Bro
	else
	{
		output("\n\n<i>“Oh, you’re close aren’t you? I can tell,”</i> Sylvie announces.");
		output("\n\nYou backhand her haunches hard enough for you to feel the vibrations in your [pc.cock " + x + "]. Then, and only then, do you deign to put her back to work, rocking her whole body atop your crotch, driving her inhuman cunt back and forth with such rapidity that you can’t help but give her exactly what she wants.");
	}
	var cumQ:Number = pc.cumQ();
	var cumBathed:Boolean = (cumQ >= 10000);
	//merge
	output("\n\nIn the moment of climax, you thrust up into her for all the good it does: exactly none. You’re still pinned to the ground, still smothered in hundreds of pounds of juicing, eager ‘taur. But that’s part of what makes it so hot - what makes it so easy to cum, and cum, and cum some more inside her. The knowledge that Sylvie’s body has all but enveloped your own, wreathing your [pc.cock " + x + "] in silky softness and your [pc.legOrLegs] in shaggy fur.");
	//sub 1k cums
	if(cumQ < 1000) output("\n\nSylvie looks on, eyelids drooping blissfully, her cunt drinking down every drop of [pc.cum] you have to offer. A dazed smile spreads across her features in what you can only assume is satisfaction, like all it took was the sight of your orgasm to give her one of her own.");
	//1k-10k cum
	else if(cumQ < 10000) output("\n\nSylvie looks on, at first pleased, then surprised, then exceedingly pleased as you creampie her channel from womb to bestial muff. Her eyelids droop blissfully, a dazed smile spreading across her features the longer you cum. By the time you’re done, she’s idly groping her tits and drooling from both ends in post-coital bliss.");
	//10k-50k cum
	else if(cumQ < 50000) 
	{
		output("\n\nSylvie looks on, pleased at first but then in shock as she feels the sheer volume of jism splashing into her cunt, floating her from stem to stern in the span of a single squirt. Her eyes roll back as you continue to unload, distending her belly");
		if(!pc.hasKnot(x)) output(", then backwashing into the pool");
		else output(", then distending further thanks to the seal offered by your knot");
		output(". A dazed, blissed-out smile spreads across her features as she cums from the feeling of your [pc.cumNoun] bathing every inch of reproductive surface in [pc.cumVisc] love. By the time you’re done, Sylvie’s bottom and the pool are stained [pc.cumColor], though heavy duty filters have kicked in to clean the latter.");
	}
	//50k+
	else
	{
		output("\n\nSylvie looks on in bliss, then alarm as she feels the extent of your first torrential ejaculation. So much [pc.cum] erupts inside her that her middle balloons big enough for her to look pregnant, then bigger still. Your second squirt inflates her enough to lift her halfway out of the pool");
		if(!pc.hasKnot(x)) output(", but at that point the pressure is simply too great for your [pc.cock " + x + "]. Thick gouts of excessively spermy relief backwash out of her alongside your orgasmic contractions, soaking you from the waist down and raising the level of the pool high enough that it may soon overflow.");
		else output(", but you’re just getting started. With your knot stuck inside her, you fill her with enough spermy ecstasy that her hooves barely scrape the floor - and your [pc.butt] is lifted clean off the ground, supported entirely by the friction of your passion-conjoined forms. No seal is perfect, however. A few squirts later, [pc.cumGem] streams are spraying out of Sylvie’s puss in every direction, flooding the pool with evidence of the tryst.");
		output("\n\nBy the time you’re done, you realize Sylvie has checked out mentally. Her eyes are rolled back so that only the whites are visible, and her tongue hangs out the side, drooling up her cheek. [pc.Cum] squirts out of her from vicious, post-orgasmic tremors, accompanied by gasps and moans that sound too earnest to be anything less than expressions of pure, subconscious ecstasy.");
	}
	pc.HP(-40);
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",hipBustingSnuSnu3, cumBathed);
}

public function hipBustingSnuSnu3(cumBathed:Boolean):void
{
	clearOutput();
	showSylvie(true);
	output("The pool’s filters eliminate any evidence of your drunken fuck in a few minutes, thanks biological contaminant scrubbers. ");
	if(!cumBathed) output("Likewise, Sylvie seems as pristine as ever when she clatters up the ramp, any evidence of your licentious dealings tucked securely away in her womb.");
	else output("Likewise, Sylvie needs a good cleaning herself. She lounges in the water for a while, languidly scrubbing the sperm out of her fur until she’s squeaky clean.");
	output("\n\n<i>“You okay, [pc.name]?”</i> Sylvie sounds genuinely concerned as she looks you over");
	if(pc.hasFur() || pc.hasScales() || pc.hasChitin() || pc.hasFeathers()) output(", unsure if you’re bruised under your [pc.skinFurScales]");
	else output(", checking you over for bruises");
	output(". <i>“I get so out of hand... I’m sorry if I hurt you!”</i> She sweeps you into a big hug before you can protest in the slightest, burying your face directly into her tits. Her grip is as powerful as her hips, but thankfully she lets you go after a minute of mandatory snuggling. <i>“I’d better take my Sobr and get ready for work. You stay out of trouble, eh [pc.name]?”</i>");
	output("\n\nYou promise that you will while Sylvie downs her little pill. Instantly, her posture stiffens, and her gait straightens. She looks back your way, clutching her forehead and giggling as she grabs her things.");
	output("\n\n<i>“I can’t believe I did that... and it didn’t kill you.”</i>");
	output("\n\nExamining your tenderized thighs, neither can you.");
	pc.HP(-10);
	soreDebuff(3);
	sweatyDebuff(2);
	processTime(10);
	sexedSylvie(1);
	pc.createStatusEffect("SYLVIE WORKING");
	pc.setStatusMinutes("SYLVIE WORKING",(9*60));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[COMPLETE] [Fenoxo] [TittyBlow] PC Fucks For Lube, then gets Titfuck & Blow finisher
public function tittyBlow():void
{
	clearOutput();
	showSylvie(true);
	output("You tell her that you’d like to fuck her tits.");
	output("\n\nSylvie cradles her recently freed melons in her arms, squeezing them together to create an appealing line of cleavage. <i>“Mmm, someone’s a titty-[pc.boyGirl], eh? Well, I’m game, but you can’t just thrust it in here, not without proper lubrication.”</i> She bounces her boobs around, creating an ocean of pale, hypnotically undulating flesh. Her eyes glitter happily at how well you follow their every move. <i>“Lucky for you, I know just where you can get wet.”</i> Reaching behind, Sylvie slaps herself square on her haunch, right on the hexagonal tramp stamp.");
	output("\n\nThe moose-girl’s tail lifts straight up, then quivers like a taut bowstring. She smiles lustily at you, then repeats the action on the other cheek. Her face flushes as bright as a setting sun. Then you smell it: the rich aroma of a girl in heat. Pheromones roll of Sylvie in a thick cloud, and when she pivots, you see why. Her puffy, purple pussy is shining, so wet that a bead of lubricant hangs from her fattened clit. She slaps again, and that tiny droplet transforms into a slutty trickle. Breathing heavily, she looks to your crotch. Her eyes simmer with lust. <i>“Don’t make me beg.”</i>");
	output("\n\nYou don’t. ");
	if(!pc.isCrotchExposed())
	{
		output("Unsheathing your [pc.cocks], you ");
		if(pc.cockTotal() > 1) output("select the largest and ");
	}
	else if(pc.cockTotal() > 1) output("Selecting your largest of your [pc.cocks], you ");
	else output("Grabbing hold of your [pc.cock], you ");
	output("step up behind her");
	var x:int = pc.biggestCockIndex();
	if(pc.tallness < 70) output(", climbing onto a nearby chair to reach her elevated cunny");
	output(". This close, there’s no doubting how aroused, how ludicrously wet, she is. Some of it dribbles onto your [pc.cock " + x + "] while you line yourself up, speckling you with a leopard-like pattern of pussy-print, and you decide to reward her by rubbing your [pc.cockHead " + x + "] against her swollen vulva, circling the puffy, sensitive skin until Sylvie is panting in need and the top few inches of your dick are painted in girlcum.");
	output("\n\n<i>“Ohhh god, just put it in already,”</i> Sylvie moans, backing up a little. <i>“Fuck me just a little first, please?”</i> Her pussy clenches and relaxes in a desirous wink.");

	//Dick less than 5"
	if(pc.cocks[x].thickness() < 5) 
	{
		output("\n\n<i>“It’d be my pleasure,”</i> you admit. Grabbing yourself by the base, you thread your [pc.cock " + x + "] between her cushy pussylips and thrust, hard. Sylvie’s cunt drinks your dick in, giving way just enough for you to glide in on a curtain of lube, pushing back hard enough to make sure every inch delivers dizzying levels of sensual friction. Being inside her is like getting a heated massage from a dozen tongues. Every fold ripples and squeezes. Muffled squelches can be heard, accompanied by individual bursts of cock-stroking bliss.");
		pc.cockChange();
		output("\n\nThe drunken cow stumbles unsteadily, then straightens, her bright eyes flashing over her shoulder at you. <i>“Mmm, I think I love you");
		if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE || pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) || pc.horseScore() >= 3) output(", fuck-stallion");
		else if(pc.tallness >= 80) output(", big boy");
		else output(pc.mf(", handsome",", gorgeous"));
		output(".”</i> She twists her torso so that you can see her tugging on her nipples, bouncing her weighty mounds. Her more than generous tits shine with a fine layer of sweat.");
		output("\n\nYou jerk your hips involuntarily, pounding on her furry haunches.");
		output("\n\n<i>“Ohh, I do! I fucking love you!”</i> Sylvie shrieks, grabbing onto her own antlers and arching her back in pleasure. <i>“Don’t stop! Screw me bareback!”</i> She chews on her lip and thrusts back, knocking you a few inches out of her snatch.");
		output("\n\nYou answer by throwing yourself back against her. Your [pc.hips] impact her ass with an audible splattering sound, and when you draw back, your whole crotch is painted with Sylvie’s lusty liquid. The moose-taur herself gasps at her empty snatch, then moans when you return. Her pussy gushes like a geyser. Sylvie herself leans back across her body, playing with her breasts once more. She coos, <i>“Like that. Fuck me like that!”</i> until the pleasure overwhelms her.");
		output("\n\nSylvie’s body leaves no room to doubt the earnestness of her climax. You can’t fake squirting enough girlcum to drown a galotian, and there’s no way she’s a good enough actor to fake her eyes rolling back or her mouth hanging slack in wordless ecstasy. Her pussy hugs you tight, tight enough to stop you from thrusting any longer, wringing you with near-painful contractions. Slapping Sylvie’s ass encouragingly, you spur her to cum that much harder. She trembles in overwhelming pleasure, then her forelegs give out, dropping her to her knees, canting her ass up that much higher. The new angle rubs your [pc.cock " + x + "] against whole new bundles of nerves and gives the drooling drunkard something new to scream about.");
		output("\n\nLetting out a groan of your own, revel in the feeling of your [pc.sheathOrKnot " + x + "] nestling snugly into her drenched mons, delighting in the wet squishes emanating from her twat as she cums. There’s no doubt that you’re lubed up enough for two-dozen titfucks, let alone one from a sexually satisfied ‘taur.");
		applyPussyDrenched(pc);
	}
	//Dick 5" thick or more.
	else
	{
		output("\n\n<i>“You asked for it.”</i> Hefting your enormous slab of cock, you awkwardly position the the tip of your gigantic boner against a cunt that suddenly seems far too small for it.");
		output("\n\nSylvie shivers from the tip of her fluffy tail all the way to her luscious locks. <i>“I can take it.”</i>");
		output("\n\nPutting her words to the test, you thrust ahead. There’s almost no give at first. Her pussy might as well be a brick wall. Then, Sylvie moans and, with a shudder, gives way to your [pc.cock " + x + "]. Her sodden entrance dilates once, not enough, but close. You shove again, grunting with the effort, and Sylvie’s purple pussy opens up for you like a blooming flower. It does so reluctantly, perhaps even if with a bit of pain, but it does so all the same. She’s wet enough that as soon as it does, you slip a whole foot inside in a single stroke, spearing her, stretching her bestial channel wider than it has ever been before.");
		output("\n\n<i>“Fu-fuck, no I can’t!”</i> the moose-woman cries, tossing her hair. It catches on her jutting, pink nipples. <i>“Too much!”</i>");
		output("\n\nYou slap Sylvie’s ass, and she shuts right up, her protests swiftly replaced by wanton moans. Her taut, modded cunt drenches itself; with the extra lube, she no longer feels quite so crushingly tight. She <i>can</i> take you, and her body begs you to. Her clit is a rock, dragging along the veiny underside of your [pc.cock " + x + "]. Her nipples may as well be joy-buzzers for how Sylvie has started to tug on them. Most importantly of all, she’s panting and drooling all over her pendulously swaying milkers.");
		output("\n\n<i>“More!”</i> the inebriated officer demands, lost in the moment, the complaints of a minute ago forgotten under a tide of taur-filling pleasure.");
		output("\n\nSylvie’s clearly never had dick like yours. Not from another ‘taur, not from a modded biped, not even from a galotian who turned half her mass into a pseudopenis. You fill her in ways she’s never been filled before, and as you ease in another few feet of dick, you can feel the mind-shattering orgasms rippling through her, leashing her cognition to the army of nerves in her cunt, barraging her with ecstasy. Her forelegs buckle, and she drops to her knees. Her hind legs stay locked, perhaps following some animalistic instinct to stay upright. Perhaps they’re simply wired to remain upright while she’s getting fucked, no matter how the orgasm ravage her.");
		output("\n\nWhatever the reason, her body lets you plug her ");
		if(pc.cocks[x].cLength() > 48) output("until her belly is bulging with the outline of your [pc.cockHead " + x + "] and refuses to accept another inch. Even moose-girls have limits, after all.");
		else output("until your [pc.sheathOrKnot " + x + "] is snug ");
		if(pc.cocks[x].cLength() > 48) output("within");
		else output("against");
		output(" her bestial mons and utterly drenched in her squirting girlcum.");
		output(" You’re pretty sure you’re wet enough for your tit-job now. There’s no way Sylvie can complain that you didn’t give her anything for her trouble.");
		applyPussyDrenched(pc);
	}
	//Merge
	output("\n\n<i>“Nice and wet,”</i> you observe, pulling out. Thick webs of moose-mare cum dangle between you, snapping one strand at a time. Your cock is shiny and throbbing, angry and hard, tortured with pleasure to the point where all you want to do is thrust it back inside and hump away until you get to cum as hard as Sylvie did. But you wanted a titfuck, and you’re going to get a titfuck. <i>“My turn.”</i> You pat the moose’s quivering ass. <i>“Turn around.”</i>");
	output("\n\n<i>“Hmmm?”</i> Sylvie mumbles, staggering back up on her hooves. <i>“O-oh... o-okay. Whatever you want, " + pc.mf("handsome","beautiful") + ".”</i>");
	processTime(25);
	pc.lust(200);
	clearMenu();
	addButton(0,"Next",fuckyTittyBlowblow2);
}

public function fuckyTittyBlowblow2():void
{
	clearOutput();
	showSylvie(true);
	var x:int = pc.biggestCockIndex();
	output("When Sylvie turns around, she’s glassy-eyed and grinning. Her palms rest atop her pillowy rack, smearing spit and sweat into a smooth, shining coat. <i>“Such a gentle[pc.manWoman], making me cum that hard.”</i> She reaches out, grabbing your [pc.cock " + x + "] ");
	if(pc.cocks[x].thickness() < 5) output("in one hand");
	else output("with both hands, barely able to wrangle its enormity");
	output(". <i>“Oooh, it’s so warm. Is that because of my pussy? My pussy got you so fucking hard, eh?”</i> She strokes, her hands gliding with near-effortless ease across your heavily lubricated flesh. <i>“Don’t cum yet. I promised you a tit-fuck, [pc.name]. And I really want you to cum in my titties... make ‘em all gooey and wet and slippery, and then you can watch me lick it off...”</i> She trails off, stroking you faster, lost in her own fantasy.");
	output("\n\nYou start to open your mouth, but her finger finds the space just below your [pc.cockHead " + x + "], and the pleasure makes your [pc.hips] lurch. Your penis stabs hard into her left breast, digging deep into the forgiving flesh before Sylvie gasps and twists away. <i>“Oooh, right. My tits.”</i> She grabs her nipples and tugs, lifting the magnificent mounds high before they slip out of her fingers, bouncing and crashing against each other in a beautiful display of boobaliciousness. <i>“Bring it to momma.”</i> Sylvie eyes your [pc.cock " + x + "]. <i>“Gimme that dick.”</i>");
	output("\n\nTrying not to show your eagerness, you give the big-breasted ‘taur exactly what she wants, slapping your prick into place between her bouncy tits. She looks down, her eyes crossing to fix on the swollen head. Sylvie licks her lips. You grab her tits in your hands, digging your fingers in deep to get a good grip, and slap them together around your pussy-slimed dick, swaddling it in the marvellous mounds. Somehow, they’re almost as warm as Sylvie’s cunt - twice as soft too. You’re in complete control this time, or so you think.");
	output("\n\nThe orange-eyed hussy appears completely enraptured by your exposed tip, but her hands do not sit by idle. They reach beneath the obscuring wall of tit, ");
	var y:int = -1;
	if(pc.totalCocks() > 1) y = pc.biggestCockIndex2();
	if(pc.cockTotal() > 1) output("seeking another penis to play with. By virtue of her wonderful pussy, it’s as drenched as the other. Her nails gently press against your [pc.dickSkin " + y + "], dragging the whole way down to the [pc.sheath " + y + "]. Then, she twists her wrists and places her palm against your urethra, giving you an underhanded handjob.");
	else if(pc.hasSheath(x) || pc.hasKnot(x) || (pc.balls == 0 && pc.totalVaginas() == 0))
	{
		output("seeking your [pc.sheathOrKnot " + x + "]. Once she finds it, ");
		if(pc.hasSheath(x)) output("she slips her fingers inside the too-sensitive skin");
		else if(pc.hasKnot(x)) output("she gives it a tight squeeze");
		else output("she gives it a little squeeze");
		output(", measuring your enjoyment in the way your [pc.cockHead " + x + "] swells.");
	}
	else if(pc.balls > 0)
	{
		output("seeking your [pc.sack]. Sylvie’s palms cup your [pc.balls], gently rolling ");
		if(pc.balls> 1) output("them");
		else output("it");
		output(" around. She gives on a less gentle squeeze, measuring the effect in how it makes your [pc.cockHead " + x + "] - and how much pre-cum you dribble.");
	}
	else if(pc.totalVaginas() > 0)
	{
		output("seeking your slit");
		if(pc.totalVaginas() > 1) output("s");
		output(". Sylvie’s fingers wind their way inside");
		if(pc.totalVaginas() > 1) output(" one");
		output(", worming their way around to find the places that make your [pc.cockHead " + x + "] swell the most.");
	}	
	output(" <i>“Gotcha,”</i> she breathes, kissing your tip. <i>“I get all of this.”</i> Her tongue slithers around the veiny surface, gathering her own fragrant pussy-juice from every crevice. <i>“Mmm... nothing tastes quite as good as pussy-covered dick.”</i>");
	output("\n\nYou’ll have to take her word for it. Her breasts are exquisitely supple, milky white save for her wide, pink areolae and jutting nipple-tips, and if she’s got your dick, at least you’ve got these magnificent mammaries. You make full use of them, squeezing them down, twisting them slightly to caress yourself through the layer of beautiful boob. Then you lift them, dragging them up until you’re pinning Sylvie’s tongue against your [pc.cock " + x + "]. She looks up at you in alarm. You just smile and slam them back down, driving yourself through the creamy cleavage until ");
	if(pc.cocks[x].cLength() < 30) output("Sylvie’s tits smack into her wrists below.");
	else output("her boobs can’t stretch any farther. You’re simply too long!");
	output("\n\n<i>“Mmmmf! So rough,”</i> Sylvie coyly scolds. She closes her lips over your dick and gently presses her teeth against the skin until you slow. Then she breaks free with a loud pop, teal lips shining. <i>“That’s better... nice even.”</i> She kisses you again. This time, the teeth don’t come out. Her hidden hands work harder, coaxing you to throb and drip into her mouth. <i>“Mwah!”</i> The cock-hungry moose-girl pops off, twisting to the side of your [pc.cockNoun " + x + "]. <i>“I’ll be so nice to you.”</i> Her tongue slides back and forth across your urethra. <i>“So goddamn nice...”</i> She sucks the edge of your [pc.cockHead " + x + "], then gasps, <i>“-Make you cum so hard...”</i>");
	output("\n\nAll the while, you pump her obviously mod-enhanced breasts along your length, rubbing her pussyjuice into her tits until beads of it gather on her nipples. Every inch of her smells like it’s been rubbed by a centaur in heat, musky and loaded with pheromones. Her boobs gleam and squeeze. Sylvie’s eyes closed, and her cheeks hollow. Your dick pulses between the pinning pillows. It held up to the vice-like pressure of her cunt through several female orgasms without losing control, but there’s no point in holding back now. The only thing either of you want is for you to finally let go cum into Sylvie’s tits.");
	output("\n\nA shuddering climax arrives unannounced but far from unexpected, clawing its way out from between your [pc.thighs] in rhythmic, muscular contractions. Paroxysms of pleasure twist your hands in that final moment, and with them, Sylvie’s breasts, tightening their grip on you. Your [pc.cockNoun " + x + "]’s orgasmic flexing sends ripples of kinetic delight through their ivory curves, just as it sends [pc.cum] through the middle. Sylvie’s cheeks hollow, then expand with your fruitful release. As soon as her mouth fills, she pulls off, smiling, letting you shoot a rope across her cheek.");
	var cumQ:Number = pc.cumQ();
	//More than 25mLs.
	if(cumQ > 25) output("\n\nThat’s just the beginning of course. More squirts spray out, hitting her forehead and nose. One paints her chin and collarbone, dripping down into her slut-greased tits.");
	//More than 100mLs - no new PG
	if(cumQ > 100) output(" Sylvie arches her back, dragging her boobs from your loosened fingers and up so that they can catch the rest of it. You glaze her cleavage in [pc.cum], causing a puddle to form at the top and small river to dribble from the bottom.");
	//More than 500 mLs - no new PG
	if(cumQ > 500) output(" The [pc.cumGem] flow thickens into a belly-slicking downpour while the pool floods, drizzling runners of [pc.cumNoun] down the outer curvature of her boobs.");
	//More than 1k
	if(cumQ > 1000) output("\n\nBut you aren’t done, and Sylvie seems to know it. She steps back, sliding your cock completely free of her tits. It jerks wildly as it unloads, releasing thick ropes across the moose-taur’s front. You grab hold of it and aim, painting Sylvie’s tits until they’re little more than your cum-glazed canvas.");
	//More than 4k - no new PG
	if(cumQ > 4000) output(" So you shift your aim lower to smother her hips and belly, slicking down the coarse fur below. [pc.cumNoun] pools around her hooves, but the cum-drunk slut just laughs and spins around, letting you frost her back, flanks, tail, and even her pussy.");
	//More than 10k
	if(cumQ > 10000) output("\n\nThe policegirl must think the mess is getting out of hand, because she steps back to slide your [pc.cockHead " + x + "] back inside her tunnel, capturing wave after wave of virile bliss.");
	//More than 20k - no new PG.
	if(cumQ > 20000) output("Liquid burbles can be heard through her middle as you expand it, lending the big woman a pregnant appearance.");
	//More than 30k - no new PG.
	if(cumQ > 30000) 
	{
		output(" She clearly gets off on it, judging by her facial expression and how she’s rubbing your [pc.cumNoun] into her bouncing boobs. Simultaneously, you stuff more inside her. She’s literally transformed herself into your own personal cum-dump, taking the burden of a sloshing, bloated belly rather than allowing you to make a mess of ");
		if(flags["MET_KALLY"] != undefined) output("Kally’s");
		else output("the");
		output(" bathing area.");
	}
	//More than 70k
	if(cumQ > 70000)
	{
		output("\n\nEven nine foot tall animal-girls have their limits, and you can tell that you’ve reached it the moment her middle pushes down against the ground. [pc.Cum] sprays out of her snatch and back over you.");
		applyCumSoaked(pc);
	}
	//More than 100k. No new pg
	if(cumQ > 100000) 
	{
		output(" But it’s not enough. You thread your still-spurting shaft");
		if(pc.cockTotal() > 1) output("s");
		output(" between her taut tummy and quivering thigh, washing underside in a thick coating of spermy goodness.");
		applyCumSoaked(pc);
	}
	//More than 110k - no new PG
	if(cumQ > 110000)
	{
		output(" There’s enough to leave her stranded in the midst of a musky puddle, though you suppose it might make it easier to drag her to a pool for cleaning.");
		applyCumSoaked(pc);
	}
	//More than 150k.
	if(cumQ > 150000)
	{
		output("\n\nYou stalk back around Sylvie, still ejaculating, spraying her with enough to cake her hair down into a cum-impregnated sheet. She wisely grabs hold of your [pc.cock " + x + "] as soon as you get within arm’s reach and threads it through her armpit. The tight, warm embrace milks more out of you, but it takes you a dozen ecstatic spurts before you identify why she did it: she’s aimed you into one of the pools. She milks the rest of your [pc.cum] like that, simultaneously squeezing out every drop while protecting her favorite bar from a deluge of spunk-induced property damage.");
		applyCumSoaked(pc);
	}
	processTime(25);
	pc.orgasm();
	sexedSylvie();
	clearMenu();
	addButton(0,"Next",sylvieFuckyTitBlow3,cumQ);
}
public function sylvieFuckyTitBlow3(cumQ:Number):void
{
	clearOutput();
	showSylvie(true);
	output("Sylvie helps you " + (cumQ <= 4000 ? "put your python away" : "clean your spooge-soaked python") + ", and you help her bathe in one of the nearby pools, but not before watching her slurp a down ");
	if(cumQ <= 10) output("a mouthful of [pc.cumNoun]");
	else if(cumQ <= 25) output("a few mouthfuls of [pc.cumNoun]");
	else if(cumQ <= 100) output("a few loads worth of [pc.cumNoun] directly off her tits");
	else output("dozens of loads worth of [pc.cumNoun], some directly off her tits but others gathered on her fingers, then meticulously licked off");
	output(".");
	output("\n\nWhen she gives you a blushing hug, you’re blushing a little yourself - and half-hard all over again. You squeeze her tits playfully, earning a giggle from the inebriated moose-taur.");
	output("\n\n<i>“Still not satisfied?”</i> Sylvie titters, patting your crotch. <i>“You insatiable slut!”</i> She kisses you on the lips, hard, running her fingers ");
	if(!pc.hasHair()) output("across your scalp");
	else output("through your [pc.hair]");
	output(". You’re left panting for breath when she pulls away. <i>“Let me get a drink to whet my whistle, and if you’re still feeling randy, you can come take me for a ride.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[COMPLETE] [Meredith Caerwyn] [Spank ‘N Grind] Spank Her Grind on her slit & clit till mutual ‘gasms. [4Ladies]
//Since pressure on her backside triggers lubrication, spanking makes her super wet. Gonna need a mop.
public function spankyGrindyWimyFunSchlicks(forcy:Boolean = false):void
{
	clearOutput();
	showSylvie(true);
	author("Meredith Caerwyn");
	//NON-FORCEFUL START
	if(!forcy) 
	{
		output("Well, if that isn’t an invitation, you don’t know what is. Unable to resist, you ");
		if(pc.isBimbo()) output("giggle");
		else if((pc.isNice() || pc.isMischievous()) && !pc.isBro()) output("grin");
		else output("smirk");
		output(" and give that well-filled booty a good, solid slap it deserves. Sylvie lets out a delighted little moan and sways her ample ass provocatively. <i>“Oh, yes,”</i> she breathlessly teases, <i>“Surely you can do it harder.”</i>");

		output("\n\nYou ");
		if(pc.isBimbo() || pc.isMischievous()) output("release a fake scandalized gasp and ask cheekily whether");
		else if(pc.isBro() || pc.isAss()) output("smirk and say gruffly so");
		else output("raise an amused eyebrow and ask with a laugh in your voice whether");
		output(" that means she must like it rough, like this, and for good measure, give her voluptuous ass another stronger smack, causing her already leaking purple, inflamed nether lips to release new streams of lubricant. Sylvie moans excitedly and says, <i>“Yes, yes! Give it to me! Please, [pc.name]!”</i>");
		output("\n\nYou release an amused sound and merely knead her broad, plush behind teasingly. The <i>very</i> pleasant sight of so much pliant, warm flesh rippling around your hands almost manages to distract you from the way her slit is practically gushing lubricant from her enthusiasm at this point. The moment she releases an impatient groan, you chide her for her impatience with a couple of fast, solid slaps against her ass, alternating sides, and end with a hard one right across her hexagonal butt-stamp. She moans and sways her hind quarters enticingly, trying to convince you to continue immediately, while a fresh surge of lubrication gushes down her thighs.");
		output("\n\n");
		if(pc.isBimbo()) output("Giggling");
		else if(pc.isNice()) output("Smiling teasingly");
		else output("Smirking");
		output(", you wonder aloud whether you would be able to make her orgasm just from spanking her naughty ass while giving her another few slaps, making her soft backside ripple and clench. <i>“[pc.name], please! Spank my naughty ass, please!”</i> she begs breathlessly, all but pushing her sizeable ass into your hands.");
		if(pc.isNaga()) output(" Coiling around her plush backside for a better grip and amused");
		else output(" Amused");
		output(" by her pleading, you decide to give this needy ‘taur exactly what she wants.");
	}
	//FORCEFUL START
	else
	{
		currentLocation = "CANADA7";
		generateMap();
		output("Before you can ");
		if(!pc.isNaga()) output("break");
		else output("wriggle out of");
		output(" her hold, she ");
		if(pc.tallness > 9*12) output("<i>somehow</i> ");
		output("manages to back you into the corner and trap you there with her voluptuous breasts. Trying to push her away with your hands proves about as effective as trying to catch a galotian with your bare hands. That is to say, it’s terribly ineffective. The only thing you manage is to thoroughly bury your hands into her soft, generous breasts, provoking delighted giggles from her.");
		output("\n\n<i>“Don’t worry sweetheart, Sylvie will take such good care of you,”</i> she singsongs delightfully, enveloping you even more fully into her squishy embrace, letting her hands wander over your [pc.fullChest] and back. Somewhat dazedly, you muse that trying to push her away has been very effective in a <i>certain</i> way, feeling a flush spread through your body as you reflexively squeeze her breasts with your hands. Shaking your head to try to clear it");
		if(pc.libido() > 50 || pc.isBimbo()) output(", something which you barely manage");
		output(", you decide that desperate times need desperate measures.");

		output("\n\nBatting away her wandering hands, you");
		//(Tallness <5’)
		if(pc.tallness < 5*12) output(" swiftly crouch and pass under her, small as you are, faster than");
		else if(!pc.isNaga()) output(" pinch her side hard enough to distract her and push her arm as you pass at her other side, before");
		else output(" decide to use her closeness against her, swiftly coiling your body with hers and slithering under her arms until you are snugly wrapped around her backside, trapping her in your coils beneath you, before");
		output(" she can react with more than a surprised gasp. You give her a few good, hard slaps on her hind quarters to keep her from trying to turn around, resulting in her moaning breathlessly. Now that you have her trapped ");
		if(!pc.isNaga()) output("in the corner with no space to turn around");
		output(", you decide you have changed your mind. After all, bad girls need to be taught some manners, no? <i>Perhaps a </i>hands-on<i> lesson will be needed</i>, you think, growing hot as her wet, inflamed nether lips rub against your ");
		if(pc.tallness < 5 * 12) output("front");
		else output("crotch");
		output(".");
	}
	//MERGE SCENES
	output("\n\nOf course, the spanking had hardly left you indifferent, as the wetness ");
	//(biped)
	if(pc.legCount > 1) output("between your [pc.legs]");
	else output("at your waist");
	output(" testify. On the other hand, it isn’t really enough on it’s own for you to achieve orgasm. Tossing your [pc.gear] aside, you knead her plush backside, contemplating your current situation.");

	//(if biped)
	if(!pc.isNaga())
	{
		output("\n\nWhile trying to think of a solution, you make sure to give her enough smacks to keep her generous behind nice and, you image under that silky smooth fur, red. It’s a pity you can’t see her skin color, but the sounds of her moans and whines and the lubrication gushing steadily from her puffy, pulsing cunt is more than adequate reward for your efforts. Resting your hands on her ample bottom, you consider simply eating her out and then having her do the same when an idea sparks in your head.");
		output("\n\n<i>“[pc.name], why did you stop?”</i> Sylvie whines impatiently, looking over her shoulder with confused eyes and a pout on her full teal lips, swaying her hips seductively in an attempt to make you continue what you were doing. Giving her a");
		if(pc.isBimbo()) output("n excited beam");
		else if((pc.isNice() || pc.isMischievous()) && !pc.isBro()) output(" cheeky smile");
		else output(" confident smirk");
		output(" you tell her to lay down and turn on her back.");
		output("\n\n<i>“Sure, honey, but why?”</i> she asks, puzzled until you explain your idea. <i>“Oh, sweetie, you got such wonderful ideas,”</i> Sylvie says giggling and turns back to lay down her tauric body on the floor, taking care not to slip in a quickly growing puddle of her own feminine juices. You help her turn around her hind quarters until you can comfortably settle between her voluptuous thighs.");
		if(pc.tallness < 5*12) output(" Small as you are, you practically disappear from view between her powerful hind legs, enveloped completely by her curves.");
		output("\n\n<i>Now this is more like it</i>, you think and give your big girl a smack on that plush booty in reward, getting an excited moan and a new flood of fem-cum in return. With her ample ass in easy reach and her puffy, shimmering purple pussy right where you want it - in close contact with [pc.eachVagina] - this is the prime time to get this show on road.");
	}
	//(If naga body)
	else
	{
		output("\n\nWhich, you realize, isn’t much of one. A minor adjustment of the angle and you are pretty sure you can manage to grind directly on her cute clit and puffy, shimmering purple pussy. <i>It’s good having a tail instead of legs,</i> you think, smiling in satisfaction. You squeeze her body with your tail teasingly when you give her another strike on her ample backside, rubbing it in satisfaction at her excited pants. Her lubrication makes your tail more slippery and wet, only further making it easier for you to be able to slide and grind against her.");
	}
	output("\n\nYou start eagerly grinding against her deliciously soaked, swollen lips, making sure to give her hard slaps on both sides of her ample ass at the same time. Sylvie lets out a loud moaning gasp, followed by breathless whines and pants to the rhythm of your gyrating movements, scattered with whimpering groans and gasps whenever you reward her with a smack on her broad rear.");
	output("\n\nBy now, there is enough lubrication gushing from her eager cunt that your bodies slide against each other with practically no friction and, more importantly, no chafing. The sheer sensation is extremely satisfying, making your grinding much more enjoyable than usual.");
	if(pc.isNaga()) output(" You eagerly take advantage of her copious lubrication to rhythmically constrict and relax your body around hers in addition to your grinding. Whenever you do that, Sylvie lets out a hitched, breathless moan, her legs trembling stronger from excitement and arousal.");
	output("\n\nMoreover, her puffy, fat lips make a perfect surface for rubbing [pc.eachVagina] against, making you wish every snatch you encountered was this deliciously modded. ");
	if(pc.vaginalPuffiness(0) > 0 || pc.wettestVaginalWetness() >= 4) output("After all, there was a very <i>good</i> reason why you modded yours. ");
	output("Every glorious bit of friction is slowly destroying your composure, making your slaps lose rhythm and your mouth echo her blissful noises.");

	output("\n\nIn search of an even higher pleasure, you spare what little mental energy you can to adjust your hips to bring your clits into contact, the mere thought making you ache with anticipation. ");
	//(Big clit/s)
	if(pc.clitLength >= 3) output("Of course, the size of [pc.eachClit] helps immensely, making your [pc.clits] impossible to miss. ");
	output("You know the moment you find her clit both by the flash of pleasure from that brief hard resistance against your own throbbing [pc.clits] and by her louder, hitching moans.");

	output("\n\n<i>“Yes! Ah, right there,”</i> Sylvie breathlessly pants out. ”</i><i>Harder, ah, faster!”</i> she begs, squeezing you between her wide thighs, her plush, muscular flesh rippling around you in ecstasy. Her enthusiastic movements leave you breathless with pleasure");
	//(if tallness<5' or strength<80%)
	if(pc.tallness < 5*12 || pc.PQ() < 80)
	{
		output(", even though her unrestrained strength almost crushes your relatively frail body. Paradoxically, this close to orgasm, the pain only serves to enhance your pleasure");
		if(!pc.isNaga()) output(", though your muddled brain would appreciate a little more air in your lungs, you’re sure");
		output(". You strike her quivering hunches, prompting a whimpering moan from her, and breathlessly state that if she wishes to have you continue grinding, she’ll have to release her unyielding grip on you. Though she looks you in the eyes with her smoldering, hungry orange eyes, you aren’t sure how much of that she hears or understands in the throes of her pleasure but she does relax her thighs enough for you to be able to continue your gyrating motions.");
	}
	//(If tallness>5' and strength>80%)
	else
	{
		output(". The unyielding grip of her thighs only serves to spur you on, her considerable power not an obstacle, but a thrilling challenge to pass for your equally formidable strength. Your display of sheer physical power visibly excites her, making her all but writhe beneath you. <i>“Oh, damn, that’s so hot.”</i> Sylvie pants shallowly, licking her teal lips, purposely squeezing her thighs a second later and all but unraveling when that doesn’t even make your movements falter. You smirk with satisfaction as she looks at you with her smoldering, hungry orange eyes and strike her quivering hunches, her whimpering moan spurring you to further heights.");
	}
	output("\n\nWith [pc.eachVagina] feverishly throbbing between your thighs, wet from torrents of Sylvie lubricant and your own leaking [pc.girlCum], you know you are close. You collect your scrambled composure and start matching the pace of your strikes to your grinding, making sure to strike whenever you pass over her engorged clit. Sylvie watches you with eyes unfocused from lust and pleasure, fondling her own luscious breasts and pinching her firm, big nipples. The sight makes you bring one of your own hands to your neglected [pc.nippleColor] nipples, pinching and pulling");
	if(pc.isLactating()) output(", using your flowing [pc.milk] to heighten the pleasure,");
	output(" until you feel the <i>mind blowing</i> pleasure from your orgasms wash over you.");

	output("\n\nThe euphoric feeling of [pc.eachVagina] clenching and spasming makes you black out for a moment, the contractions demanding you put your hands to rest on her body. You feel");

	//(if high amount)
	if(pc.isSquirter()) output(" a veritable flood of [pc.girlCum] flow down to mix with Sylvie’s feminine juices, together all but making a small lake on the floor beneath you.");
	else if(pc.wettestVaginalWetness() < 4) output(" a river of [pc.girlCum] flow down to mix with Sylvie’s feminine juices, making the puddle from her copious lubrication a little bigger.");
	else output(" a stream of [pc.girlCum] flow down your body to mix with Sylvie’s feminine juices, though it doesn’t make the puddle from her copious lubrication any bigger.");
	output("\n\nYou pant breathlessly after your orgasm and rub Sylvie’s quivering backside as she reaches her own orgasm, set off by the feeling of your entrance clenching and fluttering against her own.");

	//(If not naga)
	if(!pc.isNaga()) output("\n\nOnce you catch your breath, you help her turn around and lay on the floor with her legs under her, both of you letting out chuckles from all the slipping and sliding you do on the wet floor. When she is settled, you lean against her flank and relax, the post-orgasm buzz still pleasantly running through your body.");
	else output("\n\nHer legs all but give up under her, her body unable to cope with your combined weight and the slippery floor in the middle of a mindblowing orgasm. Fortunately, you have suspected that something like that will happen and have managed to unravel yourself in time, before your tail would have been permanently and tragically squished under her considerable weight. You rest your upper body on top of her, lazily coiling your tail on the floor, watching her aftershocks with satisfaction of a job well done.");
	output("\n\n<i>“That,”</i> Sylvie exclaims once she got her breath back, <i>“was one of the best orgasms I ever had. Hm, just what I needed.”</i> She turns her head to you and gives you a flirtatious smile. <i>“You, darling, are welcome to </i>ravish<i> me anytime,”</i> she purrs. You reply that you’ll keep her offer in mind, giving her ");
	if(pc.isBimbo()) output("an enthusiastic beam.");
	else if((pc.isNice() || pc.isMischievous()) && !pc.isBro()) output("a teasing smile.");
	else output("a smug smirk.");

	output("\n\nLooking around the room, Sylvie sighs and starts getting up. <i>“Should probably start cleaning,”</i> she say, mumbling under her breath, <i>“since it’ll take us a while I suspect.”</i> She look exasperatedly at the miniature lake under you. You look at her");

	//(No Treatment and Libido<75)
	if(!pc.isTreated() && pc.libido() < 75)
	{
		output(" and sigh in amused agreement. You thank whoever is listening that you did this in the baths. Should be a little easier to clean it up here, after all. You follow her outside to get the mops and buckets. <i>This is probably gonna take a while,</i> you muse.");
	}
	//(Treatment or Libido>75)
	else 
	{
		output(" and chuckle in amusement. You stop her from getting up and ask her where does she think she is going? <i>“For mops?”</i> she answers, momentarily confused. You ");
		if(pc.isBimbo()) output("giggle");
		else output("smirk");
		output(" and say you aren’t finished with her yet. <i>In fact</i> you have only just started, you say with an unquenchable thirst in your [pc.eyes].");
		output("\n\nSylvie inhales startled but you can see her gearing up for another round, her perk little tail waggling eagerly. <i>“Well then, what are you waiting for, darling,”</i> she say breathless once more as you start rubbing her backside in preparation for a second round. You don’t give her an answer in words, but you are pretty certain your actions make your intentions more than clear enough.");
		output("\n\n<i>Some time later...</i>");
		output("\n\nOnce you have satisfied your libido and she has recovered enough of her wits to remember that, yes, indeed, she is in fact capable of speech and, no, you haven’t literally fucked her mind out of her head, she gives you an awestruck and rapturous look. <i>“You, my darling, are a </i>beast<i> and a ravenous one at that,”</i> she accuses.");

		//(If Bimbo or femininity>75)
		if(pc.isBimbo() || pc.femininity > 75) output("\n\nYou give her a wide eyed, <i>completely</i> innocent look and do you best to blink cutely at her. <i>“Oh, no,”</i> Sylvie says amused, <i>“I’m not falling for your act, sweetheart. ");
		else output("\n\nYou have <i>no idea</i> what she is on about, you claim with a smug smirk, giving her a heated look. <i>“Really,”</i> she says and gives you an exasperated look, <i>“");
		output("I repeat, a ravenous, dangerous beast, that’s exactly what you are.”</i> She looks you in the eyes and smiles. <i>“That said, most certainly, you are always </i>most welcome<i> to come catch up with me, whenever you are at the station.”</i> She gives you a teasing wink and gets up with a groan and a wince. <i>“We should probably clean up, but I have no energy for it. I am gonna go beg and see if Kally wants to help,”</i> she says as she stambles on shaky legs out of the door.");
		processTime(45);
		for(var y:int = 0; y < 8; y++) { pc.orgasm(); }
	}
	sexedSylvie(1);
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[COMPLETE] [Cuffs&Tongue] Get cuffed up and forced to eat her out, then get eaten out.
//Requires pussy and non-taur, obv.
//By Nonesuch
//Requires: Pussy

//Tooltip: Get cuffed up and force-fed dripping deer cunt.
public function cuffsAndTongueFromNonesuchyDuchy(forcy:Boolean = false):void
{
	clearOutput();
	showSylvie(true);
	author("Nonesuch");
	//Roughhouse first time/repeat
	if(forcy)
	{
		output("<i>“Yes, I know.”</i> She rummages around in her bag, and from the booby muffler currently occupying your face you hear the slithering clink of a small chain. <i>“Since you’re being a lil teaser who thinks you can get away from me...”</i> The next moment you find yourself being roughly turned around and your wrists professionally cuffed together behind you. With one hot hand on your shoulder and the other embedded in your ass-cheek, you are frogmarched towards the visitor rooms.");
		output("\n\n<i>“You got a date with the law,”</i> a voice awash in beer husks in your ear. Vast amounts of boob swells around your shoulders. <i>“And the law is feelin’ frisky.”</i>");
	}
	//Regular first time
	else if(flags["SYLVIE_CUFFNFUCK"] == undefined)
	{
		output("<i>“Um...”</i> Your mouth is watering slightly at the sight of Sylvie’s exposed, puffy snatch, utterly intoxicating in both sight and smell. You swallow meaningfully as you drag your gaze from it to her rosy face. <i>“...did you say you had cuffs on you?”</i>");
		output("\n\nIt takes the staggeringly drunk moosetaur a couple of moments to cotton on, but when she does wicked glee blazes out of her rosy face.");
		output("\n\n<i>“Ooh, you’re </i>that<i> kind of bedtime fun buddy, are you?”</i> She butts her vast flank into your side, roughly grasping at your [pc.chest] with one hand whilst the other rummages around in her bag. She pulls the handcuffs out with a flourish, spinning them on one finger. <i>“So much more exciting and </i>hefty<i> than grav cuffs, aren’t they? Guess I’m a trashi- treadin - tradishy kinda... whoops!”</i> The stainless steel lands on the floor with a clatter. <i>“Could you pick those up? I mean... I mean.”</i> Sylvie draws herself up to her considerable height, hand gripping your shoulder hard. <i>“Pick those up,”</i> she orders in stern, policewoman tones. <i>“Now.”</i>");
		output("\n\nWith a bite of the lip, you saunter across, bend over and collect the handcuffs - gratuitously displaying your [pc.butt] as you do.");
		output("\n\n<i>“Unf,”</i> goes 900 pounds of moosetaur behind you. The ground quakes slightly as she paws the ground. <i>“I am so getting a piece of that.”</i> You tremulously hand the cuffs over, and the next moment you find yourself shoved around 180 degrees, your wrists professionally snapped together behind you. With one hot hand on your shoulder and the other embedded in your ass-cheek, Silvie frog-marches you towards the visitor rooms.");
	}
	//Regular repeat
	else
	{
		output("<i>“You, uh...”</i> Your mouth is watering slightly at the sight of Sylvie’s exposed, puffy snatch, utterly intoxicating in both sight and smell. You swallow meaningfully as you drag your gaze from it to her rosy face. <i>“...you got your cuffs on you?”</i>");
		output("\n\nYou have to be a bit patient with the moosetaur when she’s in this state, but you know it’s worth it. After a few moments of looking blank, wicked glee blazes out of her rosy face.");
		output("\n\n<i>“Ohoho, yes, yes I do!”</i> She rummages around in her purse and retrieves the slithery steel with a flourish. <i>“Mostly in case you happened to come around.”</i> She gazes at you with smouldering intent as she dangles the cuffs from a finger before letting them drop. <i>“Pick them up,”</i> she orders in her best no-bullshit policewoman tones. <i>“Now.”</i>");
		output("\n\nWith a bite of the lip, you saunter across, bend over and collect the handcuffs - gratuitously displaying your [pc.butt] as you do.");
		output("\n\n<i>“Unf,”</i> goes 900 pounds of moosetaur behind you. The ground quakes slightly as she paws the ground. <i>“I am so getting a piece of that.”</i> You tremulously hand the cuffs over, and the next moment you find yourself shoved around 180 degrees, your wrists professionally locked together behind you, and with one hot hand on your shoulder and the other embedded in your ass-cheek, frogmarched towards the visitor rooms.");
	}
	//Body
	output("\n\nOnce you’re both safely inside a cabin room, Sylvie pushes you down onto your [pc.knees] before slamming the door closed with a single swing of her hefty behind. It’s a dizzying, intoxicating feeling to be at the mercy of this huge, tauric woman. Or have you just breathed in enough of the vast amount of alcohol she’s put away to become passively sozzled yourself? You shiver, tensing your trapped wrists as black, shiny hooves clop slowly around you, moving with the heavy deliberation of drunken concentration.");
	output("\n\n<i>“I know where you been looking,”</i> slurs Sylvie. You can just about make out her flushed, jolly face peering over her shoulder at you, beyond the vast furred behind dominating your vision. She lifts her short tail, and the tang of heavy female arousal hits you, emanating from that big, puffy, purple fuck-hole of hers, slick with arousal. [pc.eachVagina] swims with lusty heat; partially in reflex and partially for provocative effect, you lick your [pc.lips] so that they shine with the saliva filling your mouth. That draws a pleased, lusty groan from the moosetaur hovering above you.");
	output("\n\n<i>“Yeah. Can’t help yourself, can you? ");
	//First:
	if(flags["SYLVIE_CUFFNFUCK"] == undefined) output("No offence, but I had you down as a subby lil pussy munch from the start. Just a question of, could you go the distance with me...”</i> She sighs as she slowly lowers her hindquarters, down far enough to reach out and eagerly lick her plump labia, oiling your [pc.tongue] with her scent. <i>“ ...lemme tell ya, I’m glad you did.”</i>");
	else output("Dunno how I managed before I found me a drinkin’ buddy that changes into a pussy slave at the end of the night.”</i> She giggles as she slowly lowers her hindquarters, down far enough to reach out and eagerly lick her plump labia, oiling your [pc.tongue] with her scent. <i>“Every workin’ gal needs one of you!”</i>");
	output("\n\nShe sighs with pleasure, hovering over you, hooves clacking on the floorboards as you circumscribe her outer lips with the tip of your tongue, building her pleasure with slow rotations; then, with an impatient whuff and a squelch, she sits most of the weight of her rear down on your face. Your world becomes a swaddle of supple, fur-covered bulk, her wet pussy pressed heavily onto your mouth.");
	output("\n\n<i>“Lick, [pc.boy],”</i> she grunts, from somewhere far away. <i>“You aren’t going nowhere until I’ve had my fill. Maybe... if you’re really good... I’ll return the favor.”</i>");
	output("\n\nBreath whistles through your nose as you desperately lap at the shining inner walls of her pussy, the padded labia mashing into your [pc.lips] like the most obscene and impatient of make-outs. Alarm flairs in your head every time Sylvie’s weight bears down in excited response to a flick of your tongue, making your neck creak. Make no mistake, the massive taur could easily kill you from this position if she wanted to - or if she was, say, extremely drunk and got careless. With your hands bound like this, there’d be very little you could do if she suddenly sat her whole weight down. You curse and inwardly rail at your libido for finding this fact extremely exciting, [pc.eachVagina] flushing with arousal and your [pc.nipples] ");
	if(!pc.hasLipples() && !pc.hasFuckableNipples()) output("hardening up");
	else output("wettening");
	output(" almost painfully the longer the muffled face-fuck goes on.");

	output("\n\nWith each loving stroke of your [pc.tongue] over its smooth walls, Sylvie’s cunt swells up more and more, until it’s like a giant, purple donut your mouth is mashed into. An escalating series of breathy sighs and groans emanates from above, hooves rapping sharply against the floorboards as you tongue your moosetaur top to ever greater heights of pleasure.");
	output("\n\n<i>“‘S right, right there, you dirty lil [pc.boy],”</i> she huffs. You can’t see, but you take it by the sound of shifting tunic fabric she’s toying with her massive breasts as you eat her out. ");
	if(pc.biggestTitSize() >= 1) output("Well, that’s what <i>you</i> would be doing in her position. ");
	output("She pulls her soft, puffy sex back from your questing tongue a bit - trails of saliva and intoxicating pussy juice follow it - and rears herself up so that her distended clit is practically butting you in the nose. <i>“Now there - yes!”</i> she cries out as you obey, sucking at the protuberant little nub and then flicking at it insistently with the tip of your tongue.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) 
	{
		output("\n\nSensing she’s close to the edge, you follow up by bending your [pc.tongue] over her button and then deep into her beading hole, unrolling your long, slathering appendage so that you can reach as far into her as you can. Void, is she deep! Ponderous amounts of muscle quiver and clench around you as you caress her fully a foot into her hot wet, guiding her tang along the red carpet of your taste buds.");
		output("\n\n<i>“Fuck! Yes!”</i> she squeals in response, slamming her hooves into the floor. <i>“Just like th’ boy bitch! Oh fuck ME I’ve gotta become a dom so I can get this whenever I want, it’s too fucking GOOD!”</i>");
		output("\n\nHer long tunnel squeezes up around you hard, and a huge gout of pussy juice spatters over your chin as it contracts out. You are dizzied by doughty hills of moose flesh excitedly battering into your upturned face, but all the way through the moosetaur’s loud, gratuitous orgasm you keep using your [pc.tongue] to touch and tickle her deepest parts senseless.");
	}
	else
	{
		output("\n\nSensing she’s close to the edge, you reach up as far as your bound hands will allow you and catch her pleasure buzzer between your [pc.lipsChaste], sucking at it intently at the same time as you snake your tongue out, lapping at her spongy outer walls.");
		output("\n\n<i>“Yes! Like that!”</i> she groans, slamming her hooves into the floor as you hollow your cheeks determinedly. <i>“Fuuuuuck are you good at that!”</i>");
		output("\n\nHer clit throbs in your mouth, and a huge gout of pussy juice spatters over your chin as it contracts out. You are dizzied by doughty hills of moose flesh excitedly battering into your upturned face, but all the way through the moosetaur’s loud, gratuitous orgasm you keep a firm hold on that tender little nub, audibly intensifying her pleasure.");
	}
	applyPussyDrenched(pc);
	processTime(15);
	pc.lust(80);
	clearMenu();
	addButton(0,"Next",cuffnFuckSylviePartDues);
}

public function cuffnFuckSylviePartDues():void
{
	clearOutput();
	showSylvie(true);
	author("Nonesuch");
	output("<i>“Mmm,”</i> Sylvie sighs, lifting her thick hindquarters off your face at last. Silvery trails of femcum and saliva follow it as she turns like a ponderous, furry space cruiser to regard you with deep, rosy contentment. <i>“That was delicious. I definitely think rug munching like that deserves a lil reward.”</i>");
	output("\n\n<i>“If you say so, ma’am,”</i> you reply, with all the chipperness you can muster. It remains an awe-inspiring, slightly frightening experience to be bound and knelt in front of this towering beast-woman, utterly subservient to her drunken impulses.");
	output("\n\n<i>“You’re so One-damned precious!”</i> she laughs. <i>“A cute lil pet, all of my own. I just wanna eat you up... in fact, yeah. That’s exactly what I’m gonna do.”</i>");
	output("\n\nYour heart flutters as she clops forward, reaches down and grabs you around the waist, grunting and giggling slightly as she lifts you up, vast amounts of soft, warm boob plushing into your [pc.chest]. ");
	if(pc.tallness >= 12*6+6) output("You aren’t exactly tiny yourself, but Sylvie has the leg strength of, well, a moose, and is three sheets to the wind besides. The wooden floor creaks alarmingly as she digs her hind-quarters in, hauling you up bodily with an exultant grunt.");
	else output("She may as well have picked up her own bag, it’s that easy for her. Her upper body may not look strong, but underlying it is the horny, drunken might of a creature that has no problem doing whatever it likes with a pixie like you.");
	output("\n\nThe [pc.skinFurScales] on your back prickles as you are pushed firmly up against a wall. You press your cuffed hands against the cool surface");
	if(pc.biggestTitSize() >= 2) output(", [pc.boobs] quaking,");
	output(" as Sylvie ");
	if(pc.isNaga()) output("hoists your reptilian tail");
	else if(pc.isGoo()) output("gooey mass over one shoulder");
	else output("hoists your [pc.legs] over her shoulder"); 
	output(", exposing [pc.eachVagina] to her warm, beery breath.");

	if(pc.totalVaginas() > 1) 
	{
		output("\n\n<i>“Ooh, lookit you!”</i> she giggles, gazing wide-eyed at your slickened holes. <i>“More’n one must get pretty exciting.”</i> She looks up at you, thirsty, vixenish lust writ large on her face. <i>“They certainly look tasty.”</i>");
		output("\n\nYou reflexively tense up as she lays her wet, smooth tongue on your [pc.vagina 1], flicking and lavishing it teasingly until it is flush with [pc.girlCum] and you are gasping in pleasure, before moving up, laying a lascivious, full-blooded kiss on your [pc.vagina 0].");
	}
	else if(pc.hasVagina(GLOBAL.TYPE_FLOWER)) output("\n\n<i>“Ooh hey,”</i> she coos, confusion coloring her tones as she gazes at your dewy orchid twat in full flourish. <i>“You got some sort of plant growing down here, didja know? You should prob’ly get that checked out.”</i> You exhale slowly as she wonderingly traces the sensitive innards of one of your [pc.vaginaColor] fronds with her warm, wet tongue. <i>“Real pretty, though.”</i>");
	else output("\n\n<i>“Cute vajazzle for a cute lil sub,”</i> she proclaims, looking up at you with thirsty vixenish lust writ large on her face. <i>“Certainly looks tasty.”</i>");
	output("\n\nSylvie lurches forward, roughly thrusting her tongue deep into the wet, sensitive suck of your hole, eagerly stroking your innards to send spasms of sensation whiplashing up your body. Hands cuffed and thrust up against the wall by the moosetaur’s cruiser-like mass, you are helpless to do anything but let her ravish you with her long, wriggling appendage; obscene smacking and slurping fills the room, joined shortly by your own groans and wails as it begins to feel like [pc.eachVagina] is melting with pleasure. She never stops looking upwards, laughingly drinking in your helpless reactions to her questing tongue like a crisp pint of lager.");
	output("\n\nYou clench your [pc.thighs] up tight around her neck as you blow like a rocket, ");
	if(!pc.isSquirter()) output("a generous dribble of [pc.girlCum] forced out of your flexing cunt");
	else output("a huge gush of [pc.girlCum] forced out of your over-juiced cunt");
	output(" by the warm, strong movements of the mountie’s mouth. Your orgasm only seems to goad her on; with a lusty, hungry hum she redoubles her grip around your hips, opens her mouth up and penetrates you even deeper with her questing tongue, determinedly lapping down every last drop your simmering fuck pocket");
	if(pc.totalVaginas() > 1) output("s produce");
	else output(" produces");
	output(", extending the ecstatic quakes even further.");

	if(InCollection(pc.girlCumType,[GLOBAL.FLUID_TYPE_CHOCOLATE_MILK,GLOBAL.FLUID_TYPE_HONEY,GLOBAL.FLUID_TYPE_STRAWBERRY_MILK,,GLOBAL.FLUID_TYPE_NECTAR,GLOBAL.FLUID_TYPE_VANILLA,GLOBAL.FLUID_TYPE_CHOCOLATE_CUM,GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT,GLOBAL.FLUID_TYPE_FRUIT_CUM,GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM,GLOBAL.FLUID_TYPE_EGGNOG])) 
	{
		output("\n\n<i>“You’re so sweet!”</i> she exclaims with giddy excitement, when she finally pulls her [pc.girlcumColor]-smeared mouth away from your tenderized sex. <i>“Like a ");
		if(pc.girlCumType == GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM || pc.girlCumType == GLOBAL.FLUID_TYPE_FRUIT_CUM) output("glass of fruit juice");
		else if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output("pot of honey");
		else if(pc.girlCumType == GLOBAL.FLUID_TYPE_CHOCOLATE_CUM || pc.girlCumType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output("hot chocolate");
		else output("yummy treat");
		output(" after a night out. Can I keep you?”</i> Without pausing for an answer she greedily shoves her head back between your thighs, nose buried in your mons as she attacks your [pc.clit] with insistent flicks of her tongue and smooches of her lips.");
	}
	else
	{
		output("\n\n<i>“Mmm,”</i> she grins, [pc.girlcumColor] fluid smeared across her chin. <i>“Nothing like some refreshing girl juice after tying one on, am I right?");
		if(pc.wettestVaginalWetness() >= 4) output(" And you are soooo juicy, wow! You’re pretty much everything I want in a cunt toy, you know that?");
		output("”</i> Without pausing for an answer she greedily shoves her head back between your thighs, nose buried in your mons as she attacks your [pc.clits] with insistent flicks of her tongue and smooches of her lips.");
	}
	output("\n\nYou squeal and writhe and moan and flap your [pc.legOrLegs] against her back to her energetic saliva-coated strokings, but Sylvie is utterly insatiable. You are brought to another quivering orgasm - your cries and batters of your fists against the wall surely painting a lurid picture of what’s going on up here to every person in the Lodge - and she just keeps lapping away at your [pc.clit] and inner walls, not stopping until a third, shattering high ");
	if(!pc.isSquirter()) output("dribbles");
	else output("spurts");
	output(" surely every last drop you have to give out of your exhausted hole");
	if(pc.totalVaginas() > 1) output("s");
	output(" and down her gullet.");

	output("\n\n<i>“Ahhh,”</i> she sighs with a smack of her lips, finally releasing her grip around your waist and lowering you down. Your " + (pc.legCount == 1 ? "[pc.leg] is" : "[pc.legs] are") + " utterly nerveless, and you find yourself simply pooling onto the floor in front of her, [pc.eachVagina] throbbing mightily. It’s a pitiable state of affairs that earns you another tipsy honk of laughter from above. <i>“‘S what happens if you bounce that butt around after I’ve had a few, I’m afraid,”</i> the moosetaur says. You are smothered in boob again as she reaches down and unlocks your cuffs with a practiced click. Your shoulders and wrists sigh with relief. <i>“I get thirsty! And this - ”</i> she pats her broad, furry side - <i>“needs a whole lot of foof juice to be properly satisfied. ");
	if(flags["SYLVIE_CUFFNFUCK"] != undefined && pc.isSquirter()) output("And you’re the juiciest, subbiest little slut I know. If you’re around, I just gotta have you!");
	else output("And you’re fantastic at both ends. You be sure to be around regularly, alright?");
	output("”</i>");

	output("\n\nShe plops her wide-brimmed hat back on top of her messy hair, either unaware or uncaring of the fact her breasts still hang open and jiggling to the world. <i>“Now, if you’ll excuse me - I gotta go wee like an, um, four-legged thing. Take care, sweet lips!”</i> She trots off unsteadily towards the bathroom, leaving you to rest for a moment in the glow, collect your scattered gear, and beat a retreat to a bar full of smirking Vesperians.");
	processTime(35);
	for(var x:int = 0; x < 3; x++) { pc.orgasm(); }
	IncrementFlag("SYLVIE_CUFFNFUCK");
	sexedSylvie(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[COMPLETE] [VenomKiss] Red Myr PCs only, kiss and lick her for an hour or two, making her cum like crazy.
//By Gardeford
//from a menu pre- standard sex lead in, available after drunk
public function redMyrSylvieFunz():void
{
	clearOutput();
	showSylvie(true);
	author("Gardeford");
	if(silly) author("Gerbilford");
	output("You snuggle up closer to the massive moose-taur, gently lifting one of her hands to your cheek. She gives you an adorable drunken smile, blissfully unaware of your intentions.");
	output("\n\n<i>“You know, there’s another story I could tell you about my travels. Well, this is more of a <i>show</i> than a tell. I visited this planet full of ant girls, and some of them had the most delicious aphrodisiac venom ever. So delicious, in fact, that I just couldn’t leave without sharing in such a wonderful trait,”</i> you explain. Sylvie nods obliviously, but that’s alright, the explanation was for nothing but dramatic effect. As you finish speaking you move her hand from your cheek to your [pc.lips], sucking one finger and lavishing it with oral attention.");
	output("\n\nA shuddering impulse travels up her arm, and you revel in the sight of your venom’s effects on the off duty officer. Her eyes dilate intensely, barely managing to stay focused on you as the aphrodisiac spreads in her body. Barely contained breasts shudder as her breaths become ragged, and her tauric legs begin to fidget and trot in place. The fluffy brush of her tail juts into the air, the last inch of her body to fall under your spell.");
	output("\n\n<i>“You want more?”</i> you ask, already moving to her side in anticipation. She manages a nod, turning shakily toward one of the baths.");
	output("\n\n<i>“I’m oh so tired, though. I’m afraid you’ll need to ");
	if(pc.tallness < 7*12) output("carry me");
	else output("help me along the way");
	output(",”</i> you say, inflating the drama in your words and planting a wet kiss on the back of her hand. She nods a few too many times, ");
	if(pc.tallness < 7*12) output("hoisting you onto her back");
	else output("putting an arm under yours");
	output(" and bringing you close to her as she begins to cover the short distance.");

	output("\n\n<i>“I almost forgot! I don’t want you bursting from the pressure before we get to the bath. The venom’s effects can be...”</i> you pause to lick her from the base of her neck all the way up to her ear, <i>“... quite </i>potent<i>.”</i> You trace a ring around her engorged pussy, just roughly enough to start her juices flowing.");
	output("\n\nTo her credit, the sturdy moose-taur stays on her feet. Her legs buckle, almost bringing her crashing into a table of partying bar-goers. She mumbles something that might have been an attempted apology, but her tongue lolls out of her mouth in the process, preventing the words from escaping. Embarrassment and excitement raise the already immense heat of her body as your saliva’s hold strengthens.");
	output("\n\nYou spend the last few steps across the bathing area gathering spit in your mouth, building up a veritable salvo of liquid lust. The dazed centaur gets a silly, hopeful grin on her face when she sees the first available jacuzzi, wobbling as she steps toward it a little too quickly. You let her make it maybe halfway there before leaning in and releasing the waterfall of fluid fervor along her collarbone. Thick globules collect and trickle down along her chest, mixing with her sweat to grow even more rapidly.");
	output("\n\nThe massive moose drops like a rock, clutching at her breasts to free them from the carpet of flaming passion. She manages to rub the slick substance further in, growing ever more feverish in her attempts. With a little effort you manage to remove her bra, granting her spasming hands extra space. Twitching fingers find her nipples, squeezing them tightly enough for a guttural moan to break through her venom induced silence.");
	output("\n\nYou swiftly plug her open mouth with a kiss, muffling the noise with your tongue. Her eyes shoot wide open, but the pupils remain totally unfocused, dilated so deeply you can see yourself in the reflection. Scent, taste, the raw heat of her body, you take them all, devouring her essence like mulled wine. Jutting nipples grind into your [pc.chest] as she breaths, and you can feel the thunderous beating of her heart through the compressed flesh.");
	output("\n\n<i>“We’ve gotta get you nice and dirty before you can take a bath,”</i> you say as you pull back, She follows you for another kiss, moaning in distress at the loss of direct contact with your venom drenched tongue. She grabs at your hair, trying to pull you up but only succeeding in pulling you into her impressive rack. Making ample use of the opportunity, you take a thick, rosy nipple between your teeth. Rapturous moans erupt from the pleasure drunk mounty as you nibble on the sensitive nub, pausing to temper the bites with your tongue.");
	output("\n\nYou feel a plump pressure atop your skull as the bliss blind moose-taur plants a smooch on your forehead. Full lips linger on your [pc.skinFurScales] for just under too long before she drunkenly pulls you deeper into her bosom. The noise of the bathing room fades away, leaving you alone with the roar of Sylvie’s excited heart and the warmth of her encompassing J-cups.");
	output("\n\nUnder normal circumstances you might be afraid of suffocating in the cage of plush titflesh, but the coating of slippery liquid covering them lets you slide right up, trailing your tongue all the way up the valley of her chest and onto her neck. Now that you’ve returned to the open air, you can see a number of onlookers pausing their activities to watch you. You also become aware of an acute smacking sound, looking over your partner’s shoulder to see her rear end humping uselessly in the air, splashing into an ever growing puddle of her own juices.");
	output("\n\n<i>“Let’s see if we can’t find someone to help you with that. Just wait here while I pick one, and don’t touch yourself while I’m gone,”</i> you command, getting up and heading to a nearby hot-tub. Sylvie gives a worried cry as you leave. Shaking in place as she tries to hold her hands away from her body. She lasts a scant few seconds, squeezing her breasts so hard her fingers slip uselessly over her nipples. You make a mental note to punish her when you get back.");
	output("\n\nThe first couple you see is chubby kaithrit and gryvain with a tapered dick befitting a moose.");

	//50% pick either of the two
	var cat:Boolean = (rand(2) == 0);
	if(cat)
	{
		output("\n\nYou turn your eyes to the plump catgirl, and her twin tails begin swishing in earnest. She gulps down a breath of air as you advance, pressing close to her body and taking her chin in one hand.");
		output("\n\n<i>“");
		if(silly) output("So, how do you feel about doughnuts");
		else output("What an adorable kitty. How would you like to join us");
		output("?”</i> you ask, groping one of her E-cup breasts with your free hand. The plus-sized cutie quivers at your touch, nodding shyly in response.");

		output("\n\n<i>“I-");
		if(silly) output("I love them");
		else output("I’d love to");
		output(",”</i> she says quietly. You tug her gently toward the moose shaped sex puddle, pushing her to her knees before the pillowy ass. She stares in awe at the engorged ring of Sylvie’s pussy, taking a short breath before you guide her head into the sopping fuckhole. An electric shiver travels down her back and into her tails as she’s thrown into sympathetic heat. Once she’s in place you leave her be, perfectly content to bask in the fountain of cervine ardor.");
	}
	else
	{
		output("\n\nYou turn your eyes to the taller gryvain, and are pleased to see her draconic dick twitch responsively as you approach. She straightens as you close in, pressing tight enough to compress her cock between your stomachs.");
		output("\n\n<i>“");
		if(silly) output("So, how do you feel about doughnuts");
		else output("You should do as a dildo for my lover. How would you like to join us");
		output("?”</i> you ask, running a hand over her chiseled stomach. She gulps, struggling internally for a moment before she responds.");
		output("\n\n<i>“I-");
		if(silly) output("I love them");
		else output("I want to");
		output(",”</i> She admits, breaking her gaze. You tug her gently toward the moose shaped sex puddle, pushing her to her knees before the pillowy ass. Her breaths grow tense as you line her up with the engorged center of Sylvie’s purple pussy. It takes a push to get her started, plunging her tapered fuckstick into the dripping ring, but once she’s in she bucks her hips, a heavenly expression on her face as she basks in cervine ardor.");
	}
	output("\n\nThe flood of musk has your mind swimming by the time you reach your partners human half, allowing only instinct and raw urges to the front. You root your fingers in the burnished mane of her hair, pulling the two of you tightly together. Lips, tongue, teeth, the roof of her mouth, ");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("you’d fuck her throat with your tongue if you could reach it");
	else output("even the depths of her throat are at your mercy");
	output(". A veritable buffet of sticky saliva and boiling breath.");

	output("\n\n<i>“You’re due for a punishment,”</i> you exhale when you break away. You tug her arms up, and grin when she holds them there after you let go. After a brief moment spent admiring her displayed form, you press your lips into her belly. This time you stray from her bust, snaking around to lick up the side of her body, climbing all the way to her fingertips. Every inch your tongue reaches only drags her deeper into the void of unthinking lust, and every kiss strengthens your hold over her senses.");
	output("\n\nYou can hear muffled moans and wet dripping from her rear, and avert your attention to check on the hired help. ");
	if(cat) output("The kaithrit’s tails twitch and twist together as she relentlessly attacks Sylvie’s cunt with her mouth. She doesn’t so much kiss as bury her entire face in the puffy pussy, soaking her skin with musk as thick as heavy perfume.");
	else output("The gryvain humps weakly into Sylvie’s modified cunt, collapsing onto her expansive ass as it constricts around her cock. Her wings stretch out, spreading to their limits as she shouts incomprehensibly.");
	output(" When you attempt to join them you feel the drunken moose-taur’s grip tighten around your shoulders.");

	output("\n\n<i>“Noooooo. Don’ leave... More lick. I need you to lick more,”</i> she slurs, planting a sloppy smooch on your forehead and pulling you into her cleavage. Even incapacitated by aphrodisiac venom, her strength is far beyond the average woman. You resign yourself to the situation, what the hell. It’s not like you weren’t coming right back. The drunken pecks continue to dot your head, so you turn up to meet one, pushing back up and into her exposed mouth with your [pc.tongue].");
	output("\n\nBetween your saliva, her sweat, and the natural humidity in the baths, Sylvie is sopping wet from head to hoof and oozing with enough heat to form your own personal sauna. It’s hard to breath in the sweltering warmth, and harder to find traction on her slick skin. None of that matters to you; every inconvenience is driven from your mind by the sweet softness of her lips against yours.");
	output("\n\nFaintly twitching muscle alerts you to an oncoming orgasm before Sylvie can register what’s going on. This one feels much bigger than the barrage of smaller spasms that have come before it, and you make as inconspicuous an effort as possible to maneuver the moose-taur police-woman’s hands into a better position.");
	if(silly) output(" An early obituary reading <i>“crushed to death by moose in the throes of lust”</i> is not on your desired list of accomplishments.");
	else output(" A hug is one thing, a guillotine is another.");
	output("\n\nA guttural, baying moan escapes from the tauric mounty’s throat as her brain catches up to the fire in her nerves. You can feel the vibration of it on your tongue as you further envenom her neck. Her hands find an impossible grip on her steam slicked J-cups, keeping the hefty orbs in place as she draws in heaving breaths. As her spasms reach their apex, you find yourself tracing the muscles in her gut, brushing your fingers over the impressive bastion of flesh.");
	output("\n\nOver her shoulder, you can see your new friend cumming her brains out in tandem with your tauric lover. ");
	if(cat) output("Gushing spurts of femcum wash over the plump kaithrit. She’s resorted to laying back in the pool of excess fluids and letting the fresh juice shower her while she works her clit with two fingers. Her tails prod and brush Sylvie’s squirting slit, making sure to not leave her out of the festivities.");
	else output("Waves of femcum splash over the gryvain’s hips. She lies helplessly on Sylvie’s backside, tongue lolling out as she fills the gushing slit with jizz. Her butt clenches tightly as she cums, and her eyes flutter with each flowing release.");

	output("\n\nWith this final release, Sylvie slumps in exhaustion. Her body still twitches, but further kisses only breed tentative moans. It seems you’ve drugged her to the breaking point for the night. You draw back the few feet required to reach the nearest bath, gently tugging the drained moose by both hands. She wobbles to her feet, taking short, shaky steps before collapsing with a splash into the heated water.");
	output("\n\nShe sighs as the steamy bath washes off the excess venom, and you do your best to help scrub her down without making the problem worse. Barring a few irresistible nipple tweaks that prompt weak cries of bliss, you are mostly successful. Focus returns to the moose-taur’s eyes as she begins to come to her senses.");
	output("\n\n<i>“Oh-oh god. A girl could get addicted to something like that. Every time I tried to form a thought it just changed into ‘get more kisses’,”</i> she explains, a hungry glow showing in her eyes. When she sees you staring she shakes her head. <i>“A-anyway, feel free to do that again any time. I think I’m gonna stay and soak a bit first though, my legs are still half numb.”</i>");
	output("\n\nYou nod, pulling yourself out of the balmy pool and stretching. On your way out the door, you see the ");
	if(cat) output("kaithrit");
	else output("gryvain");
	output(" trying to rouse her partner. You toss a wink in her direction as you pass by, happy to see ");
	if(cat) output("a flush travel from her chubby cheeks to the top of her chest");
	else output("her tapered cock twitch and stiffen as she watches you");
	output(". Before you leave, you turn back to address her.");

	output("\n\n<i>“Come by again sometime. Maybe that will be you, instead,”</i> you say with a grin. She looks down at her friend, passed out in a puddle of sweet sex juice, and nods meekly. You leave for the bar proper, ready for more adventuring, or perhaps a nap.");

	//(remove Sylvie from bar for 1 hour)
	pc.createStatusEffect("SYLVIE WORKING");
	pc.setStatusMinutes("SYLVIE WORKING",(60));
	processTime(75);
	pc.shower();
	pc.lust(15);
	sexedSylvie(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[COMPLETE] Rutted PCs Munch Sylvie out like their life depends on it.
//Overrides normal sex menu. Add to normal Sylvie menu
public function ruttedSylvieBangBusPheromoneHotPotato():void
{
	clearOutput();
	showSylvie(true);
	//output("Your nose twitches as you catch a faint hint of Sylvie’s feminine odor. It burns a line straight down your nose and all the way into your crotch, suffusing your [pc.cocks] with thoughts of how wet her pussy would get with you inside of it, how lewd it would look after you knocked her up, claimed her as your own personal breeding sow. You barely hold yourself back from jumping the big, fuckable taur-girl, suppressing your rutting body’s desires at great personal effort... for now.");

	//Clothed
	if(!pc.isCrotchExposed()) output("You don’t try to talk, you just grab hold of your [pc.lowerGarments] and start trying to whip out your [pc.cocks], fumbling slightly in your unnatural eagerness to sample Sylvie’s delicious-smelling cunt.");
	//Unclothed
	else output("You don’t try to talk, you just grab hold of your [pc.cocks] and start idly stroking, feeling the rigidity grow apace with your desire to taste Sylvie’s cunt.");
	output("\n\nShe arches an eyebrow at first, but as you go on, comprehension slowly dawns upon her ");
	if(sylvieDrunkLevel() >= 2) output("deliciously inebriated visage");
	else if(sylvieDrunkLevel() >= 1) output("curious visage");
	else output("concerned visage");
	output(".");

	//Drunk
	if(sylvieDrunkLevel() >= 2)
	{
		output("\n\n<i>“Aww, [pc.name], you need it so bad, don’t you?”</i> She shifts slightly, hooves clattering, the motion carrying a richer sample of her pheromonal bouquet your way. She reaches down, easily batting your shaking hands away from your junk, but only so that she can wrap her own slender digits about it, securely gripping your trembling maleness in a vice-like embrace. <i>“What did it? Was it my boobs?”</i> She notices your nose twitching, drinking in her fertile scent. <i>“Oh, it’s my scent isn’t? Poor [pc.boyGirl]. Are you in rut? Do you need to stick this dick into a steaming-hot pussy and get it all preggy?”</i>");
		output("\n\nYou nod. Your dick quivers like an over-tightened guitar string.");
		output("\n\n<i>“Good,”</i> Sylvie purrs, rubbing around your [pc.cockHead]. <i>“You can try as hard as you want in the baths.”</i> She lets go and leans back back, stretching almost double to slap her ass, hard. The sharp crack splits the air, drawing the attention of other patrons.");
		if(flags["MET_KALLY"] != undefined) output(" Kally smiles knowingly.");
		output(" The strength of ");
		if(flags["MET_KALLY"] != undefined) output("Sylvie’s pussy-scent");
		else output("her scent");
		output(" almost instantly doubles. <i>“God, I love that look on your face. Keep looking at me like that, and you can do whatever you want.”</i>");
		output("\n\nThe moose-girl trots through a doorway to the south, her big haunches making her glistening pussylips wobble enticingly with every step. You float along behind her, eyes half-closed, [pc.cocks] sticking out, drool filling your mouth, fixated completely on the sight and smell of Sylvie’s plump, pheromone-secreting pussy.");
	}
	//Not drunk
	else
	{
		output("\n\n<i>“Are you - oh my... Are you in heat... no wait, rut?”</i> Sylvie shifts slightly, hooves clattering. Her tail wiggles adorably, and the pheromonal cocktail doubles in intensity. [pc.EachCock] twitches, flexing with powerful, instinctual need. She starts to reach down but draws back at the last second. Instead, she leans back and fans her arm along her flank, blowing a cloud of chemical signals straight up your nostrils. Your hips lurch, and you crane your head to the side, trying to see her cunt, trying to find out if it’s as juicy as it smells, if it looks half as erotic as the one you’re envisioning in your mind.");
		output("\n\nSylvie smirks and brushes a lock of her shimmering hair back over an antler. <i>“You really are in rut, aren’t you?”</i>");
		output("\n\nBarely listening, you nod.");
		output("\n\n<i>“Normally I’d brush off someone who came at me this strongly, but I can’t leave you like this. You’d get yourself arrested for public indecency before I could finish my next drink. Look at you, jacking yourself off in public of all places.”</i> She shakes her head. <i>“There’s gloryholes in the bathroom and a fuck-acceptable onsen just through the door, and you’re here, in the common room, completely unable to stop yourself from jacking off because you caught the barest hint of my pussy. I suppose I should commend you for having the inner strength to hold yourself back as much as you have.”</i> She cracks her knuckles. <i>“I’ve put more than one horny fuck-boy in jail after he lost control of himself around me.”</i>");
		output("\n\nRather than dissuading you, Sylvie’s competent boasts only make you harder and more eager. She’s not just a fertile-smelling woman - she’s a fertile-smelling woman who’s strong, smart, and skilled. She’d be the perfect mother. You could knock her up again and again, and she’d raise a whole brood of Steele-sired mooselings into talented adults. You try to circle around her, but she pivots to face you, sighing heavily.");
		output("\n\n<i>“Okay, here’s what I’ll do, [pc.name].”</i> Sylvie announces, grabbing you by the shoulders to stop your incessant attempts to get at her inhuman cunt. <i>“I’m going to walk over to the baths and sit down on the edge of one. If you can keep yourself under control long enough for me to do that, I’ll help you out. But if you jump me before I’m ready, you’re getting a time-out in the slammer. Got it?”</i>");
		output("\n\nYeah, you got it. She’s going to let you ravish her pussy in a minute. Even sit down on the edge of a pool to put it at the perfect height for licking and fucking. You belatedly remember to nod.");
		output("\n\n<i>“Good [pc.boyGirl],”</i> she coos, reaching back to slap her ass. Tail wiggling, Sylvie confidently saunters south towards the onsen, finally displaying her pussy to you. It’s puffy and engorged, shining with a layer of femslime that’s only started leaking out in the past few seconds. To you, her musky cunt may as well be made of honey for how delicious it smells. You stumble after in a daze, feeling very much like her pheromones have embedded two hooks in your nostrils to drag you along behind her, making you dizzy and horny, almost completely unaware that you’re stumbling across the entire length of the bar with your [pc.cocks] dangling out in the open air.");
	}
	//Merge
	processTime(10);
	pc.lust(200);
	clearMenu();
	addButton(0,"Next",sylvieRutFunPart2);
}

public function sylvieRutFunPart2():void
{
	clearOutput();
	showSylvie(true);
	author("Fenoxo Fennybuns");
	output("Sylvie takes her time getting into position at the edge of a pool, carefully folding her legs beneath herself so that she can sit down with her pudgy cuntlips hanging on the edge, trickling tiny droplets of girlish lust into the pool. She leans back over herself, digging her hands into her haunches, sinking her fingers deep into the thick fur there and pulling her animalistic asscheeks wide to properly display her puffy pussy. Her tail, tiny though it may be, flutters, fanning her erotic aroma your way. <i>“Here you go, [pc.name].");
	if(sylvieDrunkLevel() >= 2) output(" It’s all yours, baby. God, if you keep looking at me like that I’m going to flood this pool. Get over here already!");
	else output(" Good [pc.boyGirl]. I must admit, I like the way you look at my pussy. It sends shivers down my spine, and it’s gotten me a little wet, you see?”</i> Sylvie rubs her finger over her flushed quim, collecting some of her shining juices to display. <i>“So go ahead. We both know you want to. It won’t be such a burden, letting a cute [pc.guyGirl] like you fulfill [pc.hisHer] naughtiest dreams.");
	output("”</i>");
	output("\n\nYou’re");
	if(!pc.isCrotchExposed()) output(" stripped and");
	output(" in the pool before she’s finished talking. Your eyes, treated to an up close and personal look at her enormous, lust-inflated pussy, palpably dilate with desire. Suddenly everything seems too bright, the details of her cunt too sharp, the smell too intense. You sway in the warm, bubbling water, leaning closer, shading your eyes from the sun-simulacrum beneath her fluffy tail. There you can see that she’s flushed almost purple, her lips so engorged they would gleam even without the layer of liquid arousal that emerges from within. Her feminine musk is everywhere. You breathe so deep of it that it feels like it has emptied out your head to make room for more of itself, leaving only one signal coursing down your spinal cord: desire to breed.");
	output("\n\nYou could mount her right now. You’re acute aware of the fact, but some instinct inside you isn’t ready to just yet, no matter how hard your [pc.cocks] ache");
	if(pc.cockTotal() == 1) output("s");
	output(". No, you feel compelled to lick, to lay your tongue against her rubbery vulva and slide it in a wide circle until you’ve collected every ounce of her forbidden flavor. You thrust in, deep and plunging, shocking yourself with the delectably sharp tang, the slightly salty hint of sweaty skin layered beneath. To you, her moosey muff is ambrosial in flavor. You grab hold of her ass in both hands, your palms laying over hers, and press your face hard against her.");
	output("\n\nYour chin bumps Sylvie’s clit, and she gasps. Her juices thicken with delight, and you shift down to brush it with your [pc.lipChaste], dragging it back and forth across her thumb-sized buzzer with exquisite slowness. Your tongue slides around in a wide circle, savoring her, caressing her, and pressing in places that make the buxom police officer whimper like the bitch in heat you intend to make her. You lose yourself in the texture of her pussy and the sublime taste that bathes your tongue. Your nose is soaked in cunt-juice, tinting every breath with the heady flavor of fucking, making you feel bigger and harder than you ever have in your entire life.");
	output("\n\n<i>“Mmmm,”</i> Syvie hums, tail flicking against your forehead. <i>“A girl could get used to this.”</i> She slips her fingers out from underneath yours as she pushes your hands down into her ass, forcing you to grab her more firmly. You give her exactly what she wants and squeeze down, hard. Her pussyjuice becomes a river of sodden lust, pouring directly into your waiting mouth - most of it, anyway. Plenty is there to run down your chin");
	if(pc.biggestTitSize() >= 4) output(" and spatter over the top of your [pc.fullChest]");
	else output(" and drip into the pool");
	output(". You could hold a cup beneath and fill it in the span of a few dozen seconds, proof that Sylvie is loving this every bit as much as the rut-addled rusher eating her out.");

	//Special muzzle paragraph
	if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED))
	{
		output("\n\nJust tasting her isn’t quite enough for you. For that matter, neither is making her gush over your face, soaking down your chin to your collarbone. Your tongue isn’t ");
		if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("deep");
		else output("thick");
		output(" enough for the animalistic urges filling your mind, and your cock is too far away. Instead, you do what comes naturally, burying your muzzle deep into Sylvie’s cunt, pushing your whole mouth and nose inside until you can’t quite breathe, but can somehow still smell her, stronger than ever. You manage to squeeze your tongue back out from its deeper position, rolling about her capacitive channel, plunging in hungry, rapacious strokes. When that fails to satisfy your body’s pernicious demands, you roll back, sliding out so that you can thrust your face in once more, fucking Sylvie’s gushing quim with your own muzzle.");
		output("\n\nYou must look terrifically pussy-obsessed, a living embodiment of every negative stereotype of animal-morph there is, wasting your pre in the water as you insist on licking every inch of cunt you can reach. The lurid squelches your rabid cunt-eating makes are music to your ears, so loud that you can barely hear Sylvie moaning. For that matter, you can barely hear anything over the beating of your own heart, wildly thumping its staccato rhythm through your arteries until the dull roar threatens to drown out everything else.");
	}
	//Merge
	output("\n\nFinally, something clicks in your head. It’s enough. You’ve followed your instincts to the letter, ensuring your mate is more than sufficiently lubricated for what’s to come. You pull back, [pc.face] connected by a web of creamy cunt-love for a brief few seconds, gasping. Sylvie is leaning back across her own lower body, rubbing her ass, making her pussy wink at you as it dribbles fresh streams of girlish goo into the pool, strengthening the already dizzying saturation of taur-scent in the air into a mist thick enough to cut with a knife.");
	processTime(20);
	applyPussyDrenched(pc);
	pc.createStatusEffect("Mare Musk",0,0,0,0,false,"Icon_Smelly","You smell like a horny mare! The potent female scent is sure to drive others wild - though it gets you a little worked up as well.",false,0);
	clearMenu();
	addButton(0,"Next",sylvieRutFunPart3);
}

public function sylvieRutFunPart3():void
{
	clearOutput();
	showSylvie(true);
	author("Fenoxo Rutfen");
	var x:int = pc.cockThatFits(sylvieCuntSize());
	if(x < 0) x = pc.smallestCockIndex();
	output("You can no more ignore the call of Sylvie’s siren slit than you could her aromatic enticements. You climb higher, buoyed by the water, pressing down hard on her ass as you lift your [pc.cock " + x + "] into position behind her haunches. She whimpers but nods, letting go of her ass to grab hold of her pendulous tits. She tugs her nipples, smiling at you, and you can wait no longer. You drive yourself forward with all of your strength.");
	output("\n\nHeat enfolds you in its all-encompassing embrace, cradling every part of your throbbing fuck-stick in juicy warmth. Sylvie’s folds part so easily for you but squeeze so tightly and yet so tenderly once you’re inside. It’s an overwhelming onslaught of sensation that nearly makes you spill every drop of sperm in your body at once, but remarkably, you don’t. Not yet. You can feel pre trickling out for certain, but while the rut has hold of you, you know that you won’t climax until you’ve had a chance to gather every drop of seed up for one massive ejaculation.");
	output("\n\n<i>“That was niiiiice,”</i> Sylvie sighs.");
	output("\n\nLooking down at your crotch, you realize that it’s more than water soaking you from the waist down now. The animalistic part of you thrills, knowing that if you can make a bitch cum, you’ll definitely be able to knock her up. The harder she creams herself, the more she’ll be after your dick, and the more babies you can stuff in her waiting womb. Sylvie would look so good as a mother, her belly so heavy with your children that it practically drags along the ground, her tits swollen with milk, dribbling at the slightest provocation, and her body so flushed with hormones that you could make her cum just by prodding her puss with a single finger.");
	output("\n\nYou snap back to reality, your hips hammering into Sylvie’s, pounding her nicely padded pussy so hard that it makes her luscious tits ripple in her hands. She clenches down at the apex of every thrust, her pussy wringing your [pc.cock " + x + "]");
	if(pc.hasKnot(x)) 
	{
		if(pc.knotThickness(x) <= 7) output(", accepting your knot without issue");
		else output(", struggling to accept your monster knot");
	}
	else if(pc.hasSheath(x)) output(", rubbing your slickened sheath gently against your root");
	else output(", demanding it offer up the contents of your coming climax");
	output(". You cannot think of a better way to spend ");
	if(hours >= 3 && hours < 10) output("a morning");
	else if(hours >= 10 && hours < 12) output("a late morning");
	else if(hours >= 12 && hours < 17) output("an afternoon");
	else if(hours >= 17 && hours < 20) output("an early evening");
	else if(hours >= 20 && hours <= 22) output("an evening");
	else output("a late night");
	output(" than this. It’s difficult to think through the pleasure at all");
	if(pc.isTreated()) output(", but that’s just fine. You’re used to riding the seas of enhanced sensation your Treated body offers. It’s when you’re fucking that you feel truly superhuman, and truly alive");
	output(".");

	output("\n\nYour hips, yoked to the pheromones driving your body, pound away. Curtains of femcum splash up over your [pc.belly]. Other patrons look on in awe. More than one is masturbating, nearly as beholden to Sylvie’s sorcerous scent as you. Some are fucking, adding their own sexual aromas to the fuck-melange filling the air. Your sodden nose twitches. So ");
	if(pc.cockTotal() > 1) output("do your [pc.cocks.");
	else if(pc.cockTotal() == 1) output("does your [pc.cock].");
	if(pc.exhibitionism(1) < 33) output(" You’re glad it’s impossible to focus on anything than breeding this law-serving slut or you’d be self-conscious about the audience.");
	else if(pc.exhibitionism() < 66) output(" You blush, a little embarrassed but equally aroused by all the eyes on your body, thrilling that so many are getting to watch you breed this law-serving slut.");
	else output(" You flash a feral grin as you continue to thrust, reveling in the attention, knowing that everyone around you either wants to be you or to fuck you.");
	output("\n\nSylvie’s melodious voice moans, then hitches in wordless pleasure. She gasps, and her cunt clenches. She shudders, and her tunnel ripples around you, spreading viced-in pleasure along every inch of cock you can give her.");
	//Balls
	if(pc.balls > 1)
	{
		output("\n\nYour [pc.balls] sympathetically swelter, warm and heavy. They clench tight against your body then relax, repeating the motion again and again as they slowly release freshly brewed seed into your body, mixing it with what feels like a tide of pent-up seminal fluid that’s just waiting to escape. How then do they feel so heavy, and heavier by the second? They smack heavily into Sylvie’s clit when you hump, making her moan and you groan, not in true pain but in a sort of erotic discomfort that just makes it that much easier to push toward orgasm.");
	}
	//Merge
	output("\n\n<i>“Ahhh~!”</i> Sylvie cries. Her pussy gushes and grabs hold of you squeezing. It’s too much for you to endure, and the release you’ve been chasing since you smelled her so long ago finally claws its way out of your belly with wild spasms of pleasure. Your whole body shakes, every muscle taut, every nerf afire with bliss");
	if(pc.balls > 1) output(", your [pc.balls] audibly sloshing as they disgorge their virile payload");
	output(". Your [pc.cock " + x + "] feels like an erupting volcano, so soaked in red-hot liquid that you can scarcely tell your own ejaculate from the sea of Sylvie’s slutty secretions.");
	output("\n\nThe titanic moose-taur grabs your hands off her ass and squeezes your palms in hers, looking you in the eye as you orgasm. She’s smiling wide, watching your face with rapt attention as you release jet after jet inside her");
	if((pc.cumQ() >= 500 && !pc.hasKnot(x)) || (pc.cumQ() >= 5000 && pc.hasKnot(x))) output(", more than enough to backflow into the pool");
	output(". <i>“Keep at it, stud,”</i> she whispers encouragingly. <i>“A little more cum and you’ll get me soooo pregnant.”</i> Her cunt rhythmically contracts and relaxes, milking you for more. <i>“Oooh, you’re doing it, you’re knocking me up!”</i> Sylvie squeezes your hands even tighter, and somehow you feel it echoed deep inside you, squeezing out the last few dregs of seed that your body can offer.");
	output("\n\nYou sigh heavily, then slump weakly over Sylvie’s ass. Cum trickles down your legs, and for once since going into rut, you feel completely sated.");
	processTime(44);
	pc.orgasm();
	pc.ballFullness = 0;
	clearMenu();
	addButton(0,"Next",sylvieRutFunPart4);
}

public function sylvieRutFunPart4():void
{
	clearOutput();
	showSylvie();
	output("Sylvie pushes you off her into the pool");
	applyPussyDrenched(pc);
	if(pc.cumQ() >= 3000) 
	{
		output(", and a tide of [pc.cumGem] sex-juice pours out over you, soaking you further");
		applyCumSoaked(pc);
	}
	output(". You swim your way back up the surface, sputtering and gasping, glaring daggers at the grinning moose-girl.");
	output("\n\n<i>“Better?”</i>");
	output("\n\n<i>“Huh?”</i> Maybe it’s the sexual exhaustion but you don’t really follow.");
	output("\n\nSylvie smiles knowingly and slowly stretches. <i>“");
	if(sylvieDrunkLevel() >= 2) output("Hehe... ");
	output("I asked if you’re feeling better, now that you got to get your rocks off in one of the bes");
	if(sylvieDrunkLevel() >= 2) output("h");
	output("t pussies in the galaxy. Nice and");
	if(sylvieDrunkLevel() >= 2) output("-hic!-");
	else output(" ");
	output("calm, mmm? Placid, feeling like you’ve done your duty as a male, eh?”</i>");
	output("\n\nThat’s true. She still smells... well, arousing, but you are no longer quite so driven, quite so determined to impregnate every fertile pussy in a five mile radius. <b>Your rut has ended.</b>");
	output("\n\nSylvie nods. <i>“It’s a shame you [pc.boyGirls] get so sug");
	if(sylvieDrunkLevel() >= 2) output("... shug... sug");
	output("gestible while you’re in rut, but God, can you ever </i>fuck<i>. I can’t even get knocked up right now, but a few words and you cum like a firehose!”</i>");
	output("\n\nSlowly closing your jaw, you shake your head and smile ruefully. Regardless of whether you could knock her up, that was truly an experience to remember. <b>You should return to her whenever you’re in rut, and she can help you bring it to a swift end.</b>");
	output("\n\nSylvie presses the button to drain and refill the small pool with fresh water");
	if(sylvieDrunkLevel() >= 2) output(", then messily kisses you. She staggers up on stumbly legs shortly after, heedless of the dripping trail she leaves behind her");
	output(". You could stay in and clean up or step out, delighting in the thick layer of sexual fluids coating you from head to toe.");

	pc.clearRut(false);
	sexedSylvie(1);
	processTime(5);
	clearMenu();
	addButton(0,"Clean Up",cleanUpPostRutSylvie);
	addButton(1,"Don’t",dontCleanUpPostRutSylvie);
}

public function cleanUpPostRutSylvie():void
{
	clearOutput();
	showName("SCRUBBA\nDUB DUB");
	output("It only takes you a few minutes to satisfy your desire for cleanliness as thoroughly as your desire for an orgasm. <b>You’re no longer covered in Sylvie’s pheromonal juices!</b>");	
	pc.shower();
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dont
public function dontCleanUpPostRutSylvie():void
{
	clearOutput();
	showName("PHEROMONAL\nMUSK");
	output("You decide to stay as you are, figuring that the pheromonal dousing you’ve had may appeal to others in your travels as much as it does you. <b>You’re thoroughly doused in Sylvie’s pheromonal juices!</b>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}