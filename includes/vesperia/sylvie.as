import classes.Characters.PregnancyPlaceholder;
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
	showBust(sylvieBustString(nude));
}

public function sylvieBustString(nude:Boolean = false):String
{
	if(nude) return "SYLVIE_NUDE";
	else if(sylvieDrunkLevel() >= 2) return "SYLVIE_BRA";
	else return "SYLVIE";
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
public function sylvieHasCock():Boolean
{
	return (flags["SYLVIE_SYNTHSHEATHED"] != undefined);
}
public function sylvieCockVolume():Number
{
	return (sylvieHasCock() ? 621 : 0);
}
public function sylviePP():PregnancyPlaceholder
{
	var ppSylvie:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppSylvie.removeCocks();
	if(sylvieHasCock())
	{
		ppSylvie.createCock(30, 1);
		ppSylvie.shiftCock(0,GLOBAL.TYPE_EQUINE);
		ppSylvie.cocks[0].cockColor = "brown";
		ppSylvie.balls = 2;
		ppSylvie.ballSizeRaw = 19;
		ppSylvie.createPerk("Fixed CumQ",158000,0,0,0);
	}
	ppSylvie.removeVaginas();
	ppSylvie.createVagina();
	ppSylvie.vaginas[0].loosenessRaw = 3;
	ppSylvie.vaginas[0].wetnessRaw = 4;
	ppSylvie.vaginas[0].bonusCapacity = 300;
	return ppSylvie;
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
		output(". <i>“Cocky, eh? I like that.”</i> She mock stretches, pushing her breasts forward teasingly.");
		//Sober
		if(sylvieDrunkLevel() == 0) 
		{
			output(" <i>“But be sure and keep your hands to yourself. Consent is key, and I’d hate to have to haul off a new friend in handcuffs.”</i>");
			output("\n\nYou briefly envision her in handcuffs, chained to the table and presenting whatever passes for her animalistic puss to you, absolutely weeping with need. She’ll consent eventually. You’ll just have to give her time to realize what a perfect partner you’d be.");
		}
		//Buzzed
		else if(sylvieDrunkLevel() == 1)
		{
			output(" <i>“You’re adorable. Get me another drink or two and I’ll give you even more to look at. Just gotta get out of this stuffy thing. The stupid handcuffs always pinch into my side when I’m trying to give someone a proper squeeze.”</i>");
			output("\n\nYou briefly envision her in said handcuffs - and nothing else, chained to the table and presenting whatever passes for her animalistic puss to you, absolutely weeping with need.");
		}
		//Drunk
		else
		{
			output(" <i>“Mmm... I like that a lot.”</i> She nuzzles into your shoulder, nostrils flaring. <i>“A whole lot.”</i> After a second like that, she wraps her arms around you and whispers, <i>“You ");
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
		if(sylvieHasCock()) output("\n\nYou note that the new addition to her undercarriage is quite firm.");
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
		if(sylvieHasCock()) output(" Something heavy and wet-sounding slaps into her belly.");
	}
	processTime(5);
	sylvieMenu();
}

//Room BonusText
public function sylvieRoomBonuses(slot:int):void
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
		else output("\n\nSylvie the moosetaur is still at her table but just barely. At some point, she shed her top, leaving the symbols of her office rumpled and discarded, and now she’s offering hugs and kisses to any and all. Over a dozen empty mugs are stacked in a haphazard pyramid on her table. ");
		if(sylvieHasCock()) output("One sits underneath, half full of drizzling pre. ");
		output("Just how much has she had to drink?");
	}
	var bName:String = "Sylvie";
	if(flags["MET_SYLVIE"] == undefined) bName = "Moose-girl";
	var drunkBonus:String = "";
	if(sylvieDrunkLevel() == 1) drunkBonus += " She’s pretty tipsy, and in her current state is more than happy to hand out hugs to all who ask for them.";
	else if(sylvieDrunkLevel() == 2) drunkBonus += " She’s three sheets to the wind, kissing and cuddling anyone who shows the slightest bit of passing interest.";
	addButton(slot,bName,approachSylvie,undefined,bName,"Approach the friendly moose-girl police officer." + drunkBonus);
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
		
		var bSynthSheath:Boolean = (CodexManager.entryUnlocked("SynthSheath"));
		if(sylvieHasCock()) addDisabledButton(1,(!bSynthSheath ? "HorseCock?" : "SynthSheath"),(!bSynthSheath ? "Horse-Cock?" : "SynthSheath"),"Sylvie already has a cock!");
		else if(pc.hasItemByClass(HorseCock)) addButton(1,(!bSynthSheath ? "HorseCock?" : "SynthSheath"),giveTheMooseABone,undefined,(!bSynthSheath ? "Horse-Cock?" : "SynthSheath"),"See how Sylvie feels about turning herself into the total package via an artificial package.");
		else if(!sylvieHasCock()) addDisabledButton(1,(!bSynthSheath ? "HorseCock?" : "SynthSheath"),(!bSynthSheath ? "Horse-Cock?" : "SynthSheath"),"You’d need to have a " + (!bSynthSheath ? "special dildo" : "SynthSheath") + " in order to do that.");
		
		//[Hug]
		//Semi-random hug with heavy petting. Guarantees forcy funtimes on next drunk approach that day.
		addButton(2,"Hug",hugSylvie,undefined,"Hug","Being drunk is no obstacle when it comes to snuggling.");
		//Bonus talking about her dick stuff. Twice-only.
		if(sylvieHasCock() && (flags["SYLVIE_DONG_TALK"] == undefined || (flags["SYLVIE_DONG_TALK"] != undefined && flags["SYLVIE_DONG_TALK"] + 72*60 < GetGameTimestamp() && flags["SYLVIE_SYNTHSHEATHED"] == 1))) addButton(5,"Ask: Penis?",sylviePenisTalk,undefined,"Ask: Penis?","Ask Sylvie how life with a penis is treating her.");
		//Gloryhole suck
		else if(sylvieHasCock() && flags["SYLVIE_DONG_TALK"] != undefined) addButton(5,"GloryholeSuck",sylvieGloryholeSuck,undefined,"Gloryhole Suck","Ask her if she’s taken her new addition to the gloryholes yet. You’ll probably wind up working one yourself, but that’s fiiine.");
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
		output(" and begins to chug. She’s quite adept at pounding down the drink if the falling fluid level is any indication. Half the drink is gone before she comes up for air, smiling and licking the amber foam from her greenish blue-painted lips. <i>“Since you’ve been such a " + pc.mf("gentleman","classy lady") + ", it seems only fair I give you a little entertainment for your effort. Good thing a girl with a job like mine has enough stories to keep you entertained till closing time.”</i> She wraps an arm around your shoulders and pulls you close. <i>“Things around here can get pretty wild at times...”</i> She pauses for dramatic effect.");
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
		if(sylvieHasCock()) output(" <i>“My cock wouldn’t fit in them anyway!”</i>");
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
		if(flags["UNLOCKED_JUNKYARD_PLANET"] >= 2) options.push(1);
		if(flags["SEXBOT_QUEST_STATUS"] == 3) options.push(2);
		if(pexigaRecruited()) options.push(3);
		if(CodexManager.entryUnlocked("Gold Myr")) options.push(4);
		subSelect = options[rand(options.length)];

		output("\n\nYou decide to tell her about one of the crazy things you’ve seen. ");
		if(subSelect == 1) 
		{
			output("Tarkus itself fits the bill - two half planetoids bound together by a sophisticated gravity tether.");
			if(completedStellarTetherGood()) output(" Those pirates could’ve wiped all the inhabitants if you hadn’t stopped them!");
			else output(" It’s a shame the pirate’s bomb wiped it off the map. There’s nothing more than a metal rich asteroid field to mark where it used to be.");
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
		pc.changeLust(5);
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
		output("\n\nSylvie actually looks offended at that. <i>“What? No, of course not. We very politely informed the minotau-err... gentlemen and their friends that we had a lovely bathing area where nudity and adult activities are allowed.”</i> She gestures at the room to the south. <i>“I might have spent a few minutes cuddling one first... and let him feel me up - it was the only honorable thing to do after giving him such a stiffy! But we didn’t break any obscenity laws.”</i> Her bluish-green lips curl with mirth. <i>“Then it turned into an orgy. Kally and I are above such things, naturally. We watched from one of the more distant tubs.”</i> A sigh so low it almost sounds like a moan bubbles out of her throat. <i>“I’ve never seen so many girls get so vigorously pounded. They’re like fuck-machines, [pc.name]. One girl after another - BAM! Fucked silly. POW! Drooling in the dirt, leaking cum from both ends. Once they finally finished up, Kally had to shut down the bar for three hours just to vent the pheromones and mop up all the jizz");
		if(sylvieHasCock()) output(", and thanks to you, that mop is getting a whole lot more use. To be honest, I’m kind of liking getting treated like those bull-boys. One look at my swinging dick, and half the girls in here start getting doe-eyed.");
		output(".”</i>");
		output("\n\n<i>“Wow.”</i>");
		output("\n\n<i>“And you thought your stories were wild, eh?”</i> Sylvie smiles and finishes her drink. <i>“");
		processTime(15);
		pc.changeLust(10);
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
		if(!sylvieHasCock())
		{
			if(!CodexManager.entryUnlocked("Throbb")) output("You look her up and down, unsure exactly what the drug is supposed to do. <i>“What’d it do to you?”</i>");
			else if(pc.isBimbo()) output("You lick your lips and peer around her flank to look for the dick. Sadly, none appears. <i>“Where’s the dick?”</i>");
			else output("You look around her flank, trying to spot the male organ you undoubtedly missed. <i>“I don’t see any dick. You get it removed?”</i>");
		}
		else
		{
			if(!CodexManager.entryUnlocked("Throbb")) output("You look her up and down, unsure exactly what the drug is supposed to do. <i>“What’d it do to you?”</i>");
			else output("You look squarely at her cock, secure in the knowledge that you’re solely responsible for it. <i>“I guess it didn’t work, huh? Last I checked, I’m responsible for that monster.”</i>");
		}
		output("\n\nSylvie’s fluffy little moosetail flutters as she giggles. <i>“One of the perks of being in the Vesperian police forces is a top of the line GeneGuard immune system. It doesn’t just protect us from poisons and pathogens - it repairs genetic damage on the fly, counters most transformations too. It’s a double-edged sword, but it keeps me safe.”</i> She pats her flat tummy affectionately. <i>“But sometimes the really strong stuff temporarily overloads it.”</i>");
		output("\n\n<i>“What happened?”</i> You lean in, genuinely interested in her reaction to the illicit drug.");
		output("\n\n<i>“What happened?”</i> Sylvie smiles roguishly. <i>“I grew a four foot dick, that’s what happened! There I am, cuffing the poor, misguided moron when the whole room spins on its axis. Apparently I dropped like a sack of rocks, just flopped over on my flank and lay there laughing like a hyena. I don’t really remember the laughing part, but I do remember feeling that dick boil up out of my loins, all hot and tight and throbbing. I guess that’s where the drug gets its name from, because after a second or two, that’s about all I could really feel - incredible, blissful throbbing.”</i>");
		output("\n\nA faraway look blossoms in the police-woman’s eyes. <i>“I remember cumming before it had even fully formed. I must have sprayed a gallon of the stuff, but it was like it didn’t matter. The stupid dick kept growing, and with every inch it swelled between my legs I felt less and less like resisting it. Have you ever been so tired that laying down in bed feels like absolute heaven? It was like that, like I knew that the moment I laid my hands on it, I’d get to orgasm again and again.”</i>");
		output("\n\nYou ask her if she did.");
		output("\n\n<i>“Of course I did!”</i> Sylvie thumps the table, nearly spilling her drink. She gives the beer an apologetic glance, then picks it up to down a little more. <i>“That’s what drugs like that do to you. I jerked myself off for fifteen minutes straight like some kind of depraved animal, dumping five or six loads over the guy that dosed me. I even tried to hit the crowd that gathered around me.”</i> She smiles fondly. <i>“Even had a cute girl try to drink straight from the tap. She got blasted a few feet back, though.”</i>");
		output("\n\nYou look at the giddy taur in shock.");
		output("\n\n<i>“It’s true. I got a copy of the security holo back at my bunk. They still call me ‘Six-Gallon Sylvie’ at HQ, sometimes.”</i> The moose-woman proudly preens. <i>“It’s always nice to know that if I ever wanted to hang up the law woman routine and throw my life away, I’d have the biggest dick on the station.”</i>");
		output("\n\nYou lean back to digest what she’s had to say. <i>“How long did it take to wear off?”</i>");
		output("\n\nSylvie replies, <i>“Do you mean ‘how long were you a big-dicked sex-fiend?’”</i> She winks. <i>“About an hour. I got hauled off before too long and put in confinement with a breeding relief stand - for races that get hit by rutting season really, really hard. I’m pretty sure I was still grinding up on it long after the dick went away. I guess my body might have recovered, but part of my mind wanted to keep going. I got two days paid leave to recover, got blitzed off my ass in here, and went back on duty afterward.");
		if(sylvieHasCock()) output(" Of course, we all know a certain someone indulged my appreciation for the male orgasm. Thanks for that by the way. That nick-name I mentioned? It’s all anybody calls me now.");
		output("”</i>");
		output("\n\n<i>“And the guy who drugged you?”</i>");
		output("\n\nShe smirks. <i>“Spending another two years in jail. Assaulting an officer is a stupid idea, I don’t care what planet you’re on.”</i>");
		output("\n\n");
		if(flags["RIYA_PUNCHED"] == 2) output("Maybe you shouldn’t have decked Riya.");
		else output("Isn’t that the truth.");
		output("\n\n<i>“");
		processTime(17);
		pc.changeLust(15);
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
		pc.changeLust(5);
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
	//So some mad scientist... Dr. Weasel or something passed through a few months back on the lam from UGC Peacekeepers. Turned a pair of deergirls on vacation into vacuous cum-suckers before she got chased off station.
	else if(storySelect == 6)
	{
		output("<i>“So you ever hear about that mad scientist, Doctor Weasel or Ferret or whatever? The one with a hard-on for turning people into idiot fuckslaves?”</i>");
		output("\n\n");
		if(flags["MET_DR_BADGER"] != undefined) output("Does she mean Doctor Badger?");
		else output("You’ve definitely heard bits on the news about someone like that, though she’s probably got the name wrong.");
		output(" <i>“Yeah.”</i>");
		output("\n\nSylvie licks the beer from her gleaming teal lips and explains, <i>“She was on this very station a few months back. We didn’t catch her at first. She somehow faked her geneprint and records in ways our scientists are still trying to figure out. Apparently she looked like a pudgy tiger - with a dick of course. Every pervert in the galaxy seems to feel the need to get one, whether or not they were born with it.”</i> Patting her hindquarters, ");
		if(sylvieHasCock()) output("she says, <i>“I guess that makes me one of those perverts doesn’t it? Fuck! Well, better you than Doctor Bimbomancer! I’m just lucky she didn’t set her sights on me.");
		else output("she proudly declares, <i>“I can proudly say that I’m 100% female... and lucky Doctor Bimbomancer didn’t set her sights on me.");
		output("”</i>");
		output("\n\nScratching your neck nervously, you ask, <i>“Why’s that?”</i>");
		output("\n\n<i>“Because in the three days she was here, she managed to turn two cute deer-girls on vacation into silicone-inflated nymphomaniacs.”</i> She shakes her head, then brushes a loose lock of hair out of the way. <i>“They went from petite beauties to artificial ultra-porn goddesses. And on top of that, the bitch managed to give my ex-partner the slip - and a few other additions that rendered him unable to continue his duties.”</i> Those last few words come out strangely wistfully...");
		output("\n\n<i>“What kind of additions? You sound like you liked them...”</i> you pry, curiosity piqued.");
		output("\n\nSylvie looks your way, a slow smile spreading across her features. <i>“You sly pervert. I guess I did promise you a good story, so I might as well dish. She gave him a dick big enough to please the biggest moosetaurs, myself included. I have no idea how she managed to get past his police-issue GeneGuard, but that part was certainly... nice.”</i>");
		output("\n\n<i>“It doesn’t sound so bad.”</i>");
		output("\n\nSylvie shakes her head. <i>“She also left him with a submission fetish a mile wide. We had fun with it for a few days, once he was re-cleared for duty, until he started getting loose with what orders he was obeying. At first it wasn’t a big deal. He’d get woodies from getting his assignments in the morning or blow a load midway through an intense workout with his trainer.”</i> She sighs heavily. <i>“But it got bad enough that he’d let criminals go the moment they asked, and then nearly blow a hole in his pants with the force of his own arousal.”</i>");
		output("\n\n<i>“Oh.”</i>");
		output("\n\n<i>“I still call him sometimes,”</i> Sylvie elucidates in between long swallows. <i>“He says he’s happier than he’s ever been, being a live-in servant for some rich couple on Ausaril. But I just can’t help but think of how much he could’ve accomplished here, with me, as an officer of the law.”</i> She stamps a hoof angrily. <i>“");
		if(drBadgerImprisioned()) output("Good thing some do-gooder got that bitch arrested.");
		else output("If I ever find that bitch, I’m going to put her in the darkest hole I can find and make sure she never, ever gets out.");
		output("”</i>");
		output("\n\nWith that story told, you realize you’re going to need to change topic - or buy her a drink.");
		processTime(16);
		pc.changeLust(8);
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
		if(metKiro()) output("She must have figured a little fun with Kiro would be safer than staying with those she had wronged...");
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
		pc.changeLust(10);
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
		pc.changeLust(15);
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
		if(pc.isBimbo()) output("\n\n<i>“‘Course not!”</i> you blithely promise. <i>“I’d be way too busy fucking you to leave!”</i>");
		else if(pc.isBro()) output("\n\n<i>“Nope. I’d be too tired from pounding your pussy to go anywhere.”</i> You reach back and give her ass a rough slap. She smiles.");
		else if(pc.isNice()) output("\n\n<i>“No way,”</i> you promise, smiling. <i>“I’d be lucky just to be there.”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“I’m not sure how I’d manage to run away with a crushed pelvis,”</i> you say. <i>“It’d be worth it.”</i>");
		else output("\n\n<i>“Nah,”</i> you promise. <i>“I’d stick around for round two at a minimum.”</i>");
		output("\n\nSylvie giggles, <i>“Keep tempting me like that I’ll have to see how you measure up.");
		processTime(20);
		pc.changeLust(10);
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
		pc.changeLust(15);
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
		output("\n\n<i>“Don’t go getting any ideas,”</i> she giggles, sipping on a beer. <i>“The story isn’t over yet, and if I have to hold it together and tell you all about the time I broke through the wall humping a fuck-machine, then you can keep it in your gitch till I’m done.”</i> Grabbing you by the butt, Sylvie pulls you close. <i>“But don’t let that fool you into thinking I’m not flattered.”</i> Her hand rubs you fondly. <i>“I am. Here, why don’t you settle for some other eye-candy while I talk? I know how hard it is to make eye-contact when you’re hot and bothered.”</i> She pulls her skin-tight shirt");
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
		pc.changeLust(10);
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
		output("\n\n<i>“God, I love giving out hugs!”</i> Sylvie declares while rubbing her whole body against you. Your [pc.cocks] can’t help but get hard when pressed against her, never mind that her pussy is nowhere within sight. A huge-breasted amazon is manhandling you against her waistline while you’ve got a faceful of tit. The only sensible response is to grow the biggest, bulgiest boner");
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
		output("\n\n<i>“God, I love giving out hugs!”</i> Sylvie declares while rubbing her whole body against you. You can’t help but get a little wet from all the friction, never mind that her crotch is out of sight. It certainly isn’t out of mind, definitely not as you luxuriate in the feel of her bare skin rubbing your [pc.vaginas]");
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
	//Interrupt for loooods!
	if(sylvieHasCock() && flags["KIRO_MET_KALLY"] != undefined && (pc.hasVagina() || pc.hasPerk("Buttslut")) && flags["SEXED_SYLVIE"] != undefined && sylvieDrunkLevel() >= 2 && !isKallySisterSchlicking() && !kallyIsAway() && roamingKiroAvailable()) 
	{
		horsecockFuckpuppetProc();
		return;
	}
	//Merge	
	output("\n\nYour whole body is sweating by the time you separate. Sylvie is flushed and smiling, and you imagine you must be in a similar state. Regardless, the giantess of a ‘taur decides to cool herself off by chugging an entire beer before your eyes. A belch bursts heedlessly from her mouth the second you separate. Her eyes are a little glassier, a bit drunker, perhaps, but her smile is bright enough to dazzle the grumpiest curmudgeon. <i>“");
	processTime(15);
	pc.changeLust(33);
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
	//Even futa sylvie still wants you to have genitals:
	if(!pc.hasGenitals() && !pc.hasPerk("Myr Venom"))
	{
		if(flags["SYLVIE_THROBB_GIFT"] == undefined)
		{
			output("The moment you speak, Sylvie is drunkenly shaking her head.");
			output(" <i>“Nope! You don’t have any genitals silly. Not yet anyway.”</i> She leans close, close enough to accidentally whack you with one of her antlers. <i>“Oopsie!”</i> Sylvie kisses the spot where she bumped you, then drifts down to your ear, whispering, <i>“I have a little Throbb from a recent bust, if you’d like to get suited up for a little fun.");
			if(sylvieHasCock()) output(" ‘Course you could always just slap a SynthSheath on yourself, like you did me.");
			output("”</i>\n\n");
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
	//Sylvie doesn't care if the PC has a decent-sized cock if she's got her own dick. buttfuxk ahoy.
	if(!sylvieHasCock())
	{
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
	}
	showSylvie(true);
	output("The moment you speak, Sylvie is in motion, displaying remarkable reflexes for one so wildly inebriated. She grabs you by the hand and ");
	if(pc.isTaur() || pc.isGoo() || pc.isNaga() || pc.isDrider()) output("drags you toward the baths");
	else output("tosses you on her back, clopping over to the baths");
	output(" without an ounce of subtlety, seemingly blind to the libidinous catcalls and crude cheers coming from the regulars. Her bra disappears the moment you’re through the door, and along with it, any sense of composure. She drunkenly leans back over her hindquarters, giving a sensuously inviting look. <i>“Since you’ve been so great, you can pick... this time. Just don’t leave me waiting.”</i> The nine-foot tall amazon tugs on her nipples and pivots, presenting you with a pussy so puffy and engorged that the purple-flushed skin shines on its own");
	if(sylvieHasCock()) output(", dribbling moisture down the taut skin of her ball-swollen sack. Just ahead is the semi-rigid length of her enormous mare-breaker, pulsating beneath your heady gaze");
	output(".");
	moveTo("CANADA7");
	processTime(1);
	clearMenu();
	sylvieSexMenu();
}

public function sylvieSexMenu():void
{
	clearMenu();
	if(sylvieHasCock())
	{
		//No reqs
		addButton(0,"AnalFistHer",fistSylvie,undefined,"Anally Fist Her","Introduce her to the pleasures of prostate milking.");
		//HasGenitals: TakeAnal
		if(pc.hasGenitals()) addButton(1,"Take Anal",takeItUpYourButtYouDirtySlutbag,undefined,"Take Anal","Let her get some relief in your ass.");
		else addDisabledButton(1,"Take Anal","Take Anal","You need genitalia for this scene.");
		//Requires Nonpreg && hasVagina: TakeVaginal
		if(!pc.isPregnant() && pc.hasVagina()) addButton(2,"TakeVaginal",catchFutaSylviaVaginally,undefined,"TakeVaginal","Take Sylvie vaginally.");
		else if(pc.isPregnant()) addDisabledButton(2,"TakeVaginal","Take Vaginal","It would probably be unsafe to take that much dick while pregnant.");
		else addDisabledButton(2,"TakeVaginal","Take Vaginal","You need a vagina for this.");
		//Requires 10" of dick: FuckHerPuss
		var x:int = pc.cockThatFits(sylvieCuntSize());
		if(pc.hasCock() && pc.cockVolume(x) >= 50)
		{
			addButton(3,"FuckHerPuss",penisRouter,[fuckDickedSylviesPussah,sylvieCuntSize(),false,50],"FuckHerPuss","Just because she has a dick doesn’t mean she can’t take one...");
			if(pc.isTaur()) addButton(4,"Mount Pussy",taurPussyMountWsanIsMyHero,undefined,"Mount Pussy","Mount her the way that ‘taurs were meant to be mounted - by another ‘taur.");
			else addDisabledButton(4,"Mount Pussy","Mount Pussy","You need to be some type of centaur-like creature for this.");
		}
		else if(pc.hasCock()) 
		{
			addDisabledButton(3,"FuckHerPuss","FuckHerPuss","Your penis isn’t appropriately sized for her.");
			addDisabledButton(4,"Mount Pussy","Mount Pussy","Your penis isn’t appropriately sized for her (and on top of that, this scene is for centaur-like characters only).");
		}
		else 
		{
			addDisabledButton(3,"FuckHerPuss","FuckHerPuss","You need a penis for this.");
			addDisabledButton(4,"Mount Pussy","Mount Pussy","You need a penis for this (and on top of that, this scene is for centaur-like characters only).");
		}		
		if(pc.hasCock())
		{
			if(pc.biggestCockLength() >= 12) addButton(5,"TittyBlow",tittyBlow,undefined,"Titty Blow","Get your dick wet in Sylvie’s drizzling pussy, then stuff it between her tits until you’re blowing a load down her throat.");
			else addDisabledButton(5,"TittyBlow","TittyBlow","Your penis is too short to truly enjoy the expanse of cleavage that Sylvie offers. Come back when your largest member is 12 inches or longer.");
		}
		else addDisabledButton(5,"TittyBlow","Titty Blow","You need a penis 12 inches or longer to titfuck her massive mammaries.");
		if(pc.hasVagina())
		{
			addButton(6,"SpankNGrind",spankyGrindyWimyFunSchlicks,false,"Spank ‘N Grind","Spank her and grind on her slit and clit until you mutually orgasm.");
			addButton(7,"Cuffs&Tongue",cuffsAndTongueFromNonesuchyDuchy,false,"Cuffs & Tongue","Get cuffed up and force-fed dripping deer cunt.");
		}
		else 
		{
			addDisabledButton(6,"SpankNGrind","Spank ‘N Grind","You need a vagina in order to do all this.");
			addDisabledButton(7,"Cuffs&Tongue","Cuffs & Tongue","You need a vagina in order to experience this forceful scene!");
		}
	}
	else
	{
		if(pc.hasCock())
		{
			var xx:int = pc.cockThatFits(sylvieCuntSize());
			if(pc.isTaur())
			{
				if(xx >= 0 && pc.cockVolume(xx) >= 50) addButton(0,"Mount Pussy",taurPussyMountWsanIsMyHero,undefined,"Mount Pussy","Mount her the way that ‘taurs were meant to be mounted - by another ‘taur.");
				else if(x >= 0 && pc.biggestCockVolume() < 1500) addDisabledButton(0,"Mount Pussy","Mount Pussy","You’re a little too small for her to interested in a proper mounting.");
			}
			else addDisabledButton(0,"Mount Pussy","Mount Pussy","You need to be some kind of centaur-like creature for this.");

			if(pc.biggestCockLength() >= 12) addButton(1,"TittyBlow",tittyBlow,undefined,"Titty Blow","Get your dick wet in Sylvie’s drizzling pussy, then stuff it between her tits until you’re blowing a load down her throat.");
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
	}
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
//Now supports futa sylvie
public function taurPussyMountWsanIsMyHero(forcy:Boolean = false):void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	var x:int = pc.cockThatFits(sylvieCuntSize());
	//Forcy Fen Intro
	if(forcy)
	{
		output("Sylvie, never breaking eye-contact, backs up, forcing you to step back further and further. Soon, you’re against a door, but she just keeps coming. She kicks off the ground, launching her massive rump high in the air, and hops back, slamming her hooves against the wall to either side of your head. Her pussy, big, round and smelling strongly of horny taur fills your vision and tickles your nose. ");
		if(sylvieHasCock()) output("Her dick and balls are there too, lower, dangling useless. It’s clear which part of her she favors at the moment. ");
		output("You push back, but the touch just makes her lubricate. Musky moose-goo trickles out of her pussy, doubling the intensity of her wanton scent.");
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
	output("\n\nSylvie throws her head back and cries out in ecstasy, her back arching to the point she’s leaning back into you and looking up into your eyes with an expression of agonizing lust. Her mouth hangs open, emitting fluttering gasps of shocked pleasure, each one signalling a simultaneous squeeze of her pussy walls around your bloated prick. ");
	if(sylvieHasCock()) output("Contractions ripple through her sack as her balls brew up a massive, ready-to-go load. ");
	output("You roughly take her head in your hands and kiss her, sealing her groans with your [pc.lips].");
	output("\n\nSylvie’s powerful hind legs continue to needily fuck back into you as you strain to keep her immobile, clamping your forelegs around her midriff to hold her still. The gesture calms the moosetaur somewhat, acting as a primal reminder that a mare should be submissive and docile when she’s being pumped full of cock. Given the opportunity to explore her body, you reach down and free her massive, shaking tits from the constraints of her mountie top. She moans as you squeeze a rock-hard nipple before letting go, watching them bounce atop her chest every time you thrust into her quivering snatch.");
	output("\n\n<i>“Oh my </i>god<i>, you’re good,”</i> Sylvie pants between each thudding impact against her ample ass, stroking your ego every bit as much as your dick. Her pretty little face has taken on an expression of fervent admiration, your passionate tryst evidently earning you the respect of the busty bombshell. You can’t help but want to drive her on even further, her words only encouraging you to pummel her harder.");
	output("\n\nShe drops onto the bed and screams in maddened pleasure, unable to keep her voice down as you slam her into submission. Her massive breasts shake beneath her as you work yourself towards orgasm, leaning down and placing your hands on her sweaty shoulders for grip. When you finally find yourself reaching a crescendo, you pull her up and into you as you sink your cock ");
	if(pc.balls > 1) output("balls deep");
	else output("to the hilt");
	output(" in her spasming, squirting cunt.");

	output("\n\nSylvie gives a little scream every time you deposit a warm load in her, your bulging cumvein compressing her clit against her swollen pussy. She suffers a back-arching orgasm with each jet of spunk you pack into her warm, wet pussy, her legs shaking and her stomach flexing with the effort of keeping up. ");
	if(sylvieHasCock()) output("Heavy splatters impact of a nearby wall as her enormous cock goes off like a cannon, for all its size, essentially useless compared to your quim-stuffing tool.");
	output("Her squeezed-close eyes slowly open, her body still tautly wrapped around your cock, and she looks up at you worshipfully, lifting an arm behind her to gently caress your face.");
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
	output("\n\nYou reduce her to a mewling mess on the bed with each flex of your hips, Sylvie’s squirting pussy desperately working your rod inside her, squeezing you with all her might. She groans into the ");
	if(sylvieHasCock()) output("cum-soaked ");
	output("sheets, teeth grit during the rough violation of her nethers. Each movement sets her ass shaking and her body shuffling forward, the busty ‘taur grabbing at the sheets with white knuckles as she’s dragged across them again and again");
	if(sylvieHasCock()) output(", sending ripples through flooding pools of wasted jism she’s created.");
	output(".");
	output("\n\nFinally, you feel yourself about to cum again. You pull back and, with a bestial roar of dominance, slam into Sylvie at full force before you tighten your grip around her midriff and begin pumping her full of your seed. Between the load you already dumped in her and the gouts of sticky cum spurting into her now, it’s not long before she’s messily overflowing. Warm seed slowly rolls down her shaking, spread-apart hind legs as it leaks from her abused pussy, spattering to the floor.");
	output("\n\nWhen you’re finally done, you give a deep, satisfied sigh and pull your cock from Sylvie’s still-gushing cunt, dismounting her. She stays on the bed for a second before pushing herself up with her arms, orange eyes half-lidded and clearly still in an orgasmic haze.");
	output("\n\n<i>“Oh my god,”</i> she mumbles, dizzily seeking out your face and meeting your gaze in reverence. <i>“My world is still spinning, and that’s </i>not<i> the alcohol.”</i>");
	var cumQ:Number = pc.cumQ();
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
		if(cumQ < 2000) output("\n\nThe first spurt of seed goes straight down her gullet, Sylvie quickly swallowing as you follow it up with a few more, painting the back of her throat [pc.cumColor]. She relaxes into a rhythm, gulping down your jizz every time your cumvein flexes across her tongue. When the flow stops, she swallows down the last of your load and sits back on her haunches.");
		else if(cumQ < 5000) output("\n\nRopes of [pc.cumColor] seed splatter against the back of her throat, running down her gullet and into her stomach. Sylvie quickly swallows it down, settling into the rhythm of gulping your jizz every time your cumvein flexes across her tongue. When the flow finally stops, she swallows down the last of your load and sits back on her haunches.");
		else if(cumQ <= 15000) output("\n\nSylvie makes a surprised noise from below as thick ropes of seed gush right down her gullet, rapidly swallowing to keep up with the flow of jizz into her tummy. You paint her throat [pc.cumColor] with your cum as she settles into gulping a load down every time your cumvein flexes across her tongue. When the torrential flow finally stops, she struggles to swallow down the last of your loads and sits back on her haunches, panting.");
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
//Now Futa-Sylvie compatible!
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
	if(sylvieHasCock()) output(", her churning balls slapping heavily into your [pc.chest]");
	output(". The walls tilt crazily as you fall, but at least the water’s edge cushions the impact of ass-on-plasticized aluminum. Assessing your new position, you determine that you could lie back comfortably here, if you chose. The enormous back-half of the drunken police-girl decides for you as it settles into place above, its heavy hooves splattering noisily as it gets into position.");

	//Crotch covered
	if(!pc.isCrotchExposed())
	{
		output("\n\n<i>“[pc.name]~!”</i> Sylvie calls, leaning back across four-legged lower body, <i>“Pull it out already! Don’t make me beg!”</i> She hurriedly drums on her quivering haunches, rapidly transitioning to shuddering slaps that cut through the air like a sharp knife. Her engorged pussy juices itself in response, puffy and gleaming, looking more like a target for taur-dick than traditional female genitalia. In a small, soaked crease, you can see the swelling mass of her clitoris gleaming like a fresh grape, begging to be rubbed and squeezed. Droplets of musky lady-lube drizzle over your [pc.lowerGarmentOuter], filling the air around you with insidious pheromones so strong ");
		if(pc.hasCock(GLOBAL.TYPE_EQUINE)) output("that your flaring horse-cock threatens to burst free under the strength of its own engorgement.");
		else output("that your head swims.");
		if(sylvieHasCock()) output(" The length of her own equine tool, a full 30 inches, hangs there erect and forgotten, sliming pre into the water.");
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
		if(pc.lust() >= 40 || pc.isErect()) output("smiling mischievously down at you. <i>“You’re so nice, getting all hard for me! Wanna see me get ready for you?”</i> She winks. <i>“Of course you do. Watch this!”</i>");
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
		if(pc.lust() < 40 && !pc.isErect()) output("\n\n<i>“I told you I’d make you hard,”</i> Sylvie titters, cupping her pendulous tits. She bites her lip and whimpers. Her sopping wet cunt clenches excitedly. <i>“I hope you’re as tough as you look, because I am going to fuck you so hard your dick falls in love with me forever.”</i>");
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
	pc.changeLust(200);
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
	if(sylvieHasCock()) output(" Her monstrous member is sandwiched between your bodies, belching what feels like a gallon of slippery pre over your [pc.skinFurScales].");

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
	output("\n\n<i>“Oof!”</i> you grunt involuntarily. The longer this goes on, the more forcefully she rides your dick, ");
	if(sylvieHasCock()) output("the more mess her bolted-on dick makes, ");
	output("and the more crushing the blows rain down from her bestial heiny.");
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
	if(sylvieHasCock())
	{
		output("\n\nYou can hear more than see the effect is has on her own maleness, the lurid splatters gleefully impacting on walls, churning up waves of water turned cum-lubed. As you climax, hers drags on, seemingly without end. The water level rises apace with your pleasure, heedless of anything but your paired, mounting release.");
	}
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
	pc.changeHP(-40);
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
	pc.changeHP(-10);
	soreDebuff(3);
	sweatyDebuff(2);
	processTime(10);
	sexedSylvie(1);
	IncrementFlag("SYLVIE_HIPBUSTERED");
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
		pc.applyPussyDrenched();
	}
	//Dick 5" thick or more.
	else
	{
		output("\n\n<i>“You asked for it.”</i> Hefting your enormous slab of cock, you awkwardly position the tip of your gigantic boner against a cunt that suddenly seems far too small for it.");
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
		pc.applyPussyDrenched();
	}
	//Merge
	output("\n\n<i>“Nice and wet,”</i> you observe, pulling out. Thick webs of moose-mare cum dangle between you, snapping one strand at a time. Your cock is shiny and throbbing, angry and hard, tortured with pleasure to the point where all you want to do is thrust it back inside and hump away until you get to cum as hard as Sylvie did. But you wanted a titfuck, and you’re going to get a titfuck. <i>“My turn.”</i> You pat the moose’s quivering ass. <i>“Turn around.”</i>");
	output("\n\n<i>“Hmmm?”</i> Sylvie mumbles, staggering back up on her hooves. <i>“O-oh... o-okay. Whatever you want, " + pc.mf("handsome","beautiful") + ".”</i>");
	processTime(25);
	pc.changeLust(200);
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
	if(cumQ > 4000) output(" So you shift your aim lower to smother her hips and belly, slicking down the coarse fur below. [pc.CumNoun] pools around her hooves, but the cum-drunk slut just laughs and spins around, letting you frost her back, flanks, tail, and even her pussy.");
	//More than 10k
	if(cumQ > 10000) output("\n\nThe policegirl must think the mess is getting out of hand, because she steps back to slide your [pc.cockHead " + x + "] back inside her tunnel, capturing wave after wave of virile bliss.");
	//More than 20k - no new PG.
	if(cumQ > 20000) output(" Liquid burbles can be heard through her middle as you expand it, lending the big woman a pregnant appearance.");
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
		pc.applyCumSoaked();
	}
	//More than 100k. No new pg
	if(cumQ > 100000) 
	{
		output(" But it’s not enough. You thread your still-spurting shaft");
		if(pc.cockTotal() > 1) output("s");
		output(" between her taut tummy and quivering thigh, washing underside in a thick coating of spermy goodness.");
		pc.applyCumSoaked();
	}
	//More than 110k - no new PG
	if(cumQ > 110000)
	{
		output(" There’s enough to leave her stranded in the midst of a musky puddle, though you suppose it might make it easier to drag her to a pool for cleaning.");
		pc.applyCumSoaked();
	}
	//More than 150k.
	if(cumQ > 150000)
	{
		output("\n\nYou stalk back around Sylvie, still ejaculating, spraying her with enough to cake her hair down into a cum-impregnated sheet. She wisely grabs hold of your [pc.cock " + x + "] as soon as you get within arm’s reach and threads it through her armpit. The tight, warm embrace milks more out of you, but it takes you a dozen ecstatic spurts before you identify why she did it: she’s aimed you into one of the pools. She milks the rest of your [pc.cum] like that, simultaneously squeezing out every drop while protecting her favorite bar from a deluge of spunk-induced property damage.");
		pc.applyCumSoaked();
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
//FutaSylvie compatible!
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
		output(" and give that well-filled booty a good, solid slap it deserves. Sylvie lets out a delighted little moan and sways her ample ass provocatively");
		if(sylvieHasCock()) output(", semi-hard cock slapping between her hind-thighs");
		output(". <i>“Oh, yes,”</i> she breathlessly teases, <i>“Surely you can do it harder.”</i>");

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
		moveTo("CANADA7");
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
		if(pc.tallness < 5*12) 
		{
			output(" swiftly crouch and pass under her");
			if(sylvieHasCock()) output(", banging off her cock in the process,");
			else output(", small as you are,");
			output(" faster than");
		}
		else if(!pc.isNaga()) output(" pinch her side hard enough to distract her and push her arm as you pass at her other side, before");
		else 
		{
			output(" decide to use her closeness against her, swiftly coiling your body with hers");
			if(sylvieHasCock()) output(", ignoring the way your snake-like tail slithers against her rigid dick,");
			output(" and slithering under her arms until you are snugly wrapped around her backside, trapping her in your coils beneath you, before");
		}		
		output(" she can react with more than a surprised gasp. You give her a few good, hard slaps on her hind quarters to keep her from trying to turn around, resulting in her moaning breathlessly. Now that you have her trapped ");
		if(!pc.isNaga()) output("in the corner with no space to turn around");
		output(", you decide you have changed your mind. After all, bad girls need to be taught some manners, no? <i>Perhaps a </i>hands-on<i> lesson will be needed</i>, you think, growing hot as her ");
		if(sylvieHasCock()) output("heavy sack and ");
		output("wet, inflamed nether lips rub against your ");
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
	output("\n\nYou start eagerly grinding against her deliciously soaked, swollen lips, ");
	if(sylvieHasCock()) output("careful not to press too hard against her swelling balls as you make ");
	else output("making ");
	output("sure to give her hard slaps on both sides of her enormous ass");
	if(!sylvieHasCock()) output(" at the same time");
	output(". Sylvie lets out a loud moaning gasp, followed by breathless whines and pants to the rhythm of your gyrating movements, scattered with whimpering groans and gasps whenever you reward her with a smack on her broad rear.");
	output("\n\nBy now, there is enough lubrication gushing from her eager cunt that your bodies slide against each other with practically no friction and, more importantly, no chafing. The sheer sensation is extremely satisfying, making your grinding much more enjoyable than usual.");
	if(pc.isNaga()) output(" You eagerly take advantage of her copious lubrication to rhythmically constrict and relax your body around hers in addition to your grinding. Whenever you do that, Sylvie lets out a hitched, breathless moan, her legs trembling stronger from excitement and arousal.");
	output("\n\nMoreover, her puffy, fat lips make a perfect surface for rubbing [pc.eachVagina] against, making you wish every snatch you encountered was this deliciously modded. ");
	if(pc.vaginalPuffiness(0) > 0 || pc.wettestVaginalWetness() >= 4) output("After all, there was a very <i>good</i> reason why you modded yours. ");
	output("Every glorious bit of friction is slowly destroying your composure, making your slaps lose rhythm and your mouth echo her blissful noises.");

	output("\n\nIn search of an even higher pleasure, you spare what little mental energy you can to adjust your hips to bring your clits into contact, the mere thought making you ache with anticipation. ");
	//(Big clit/s)
	if(pc.clitLength >= 3) output("Of course, the size of [pc.eachClit] helps immensely, making your [pc.clits] impossible to miss. ");
	output("You know the moment you find her clit both by the flash of pleasure from that brief hard resistance against your own throbbing [pc.clits] and by her louder, hitching moans.");

	output("\n\n<i>“Yes! Ah, right there,”</i> Sylvie breathlessly pants out. <i>“Harder, ah, faster!”</i> she begs, squeezing you between her wide thighs, her plush, muscular flesh rippling around you in ecstasy. Her enthusiastic movements leave you breathless with pleasure");
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
	if(sylvieHasCock()) output(" Gallon after gallon bursts forth from her flaring cock in the peak of her passion. You didn’t have to directly touch it to set her off. The feelings coursing through her animalistic cunt and stinging hindquarters are more than enough to empty every drop from her diminishing balls.");

	//(If not naga)
	if(!pc.isNaga()) output("\n\nOnce you catch your breath, you help her turn around and lay on the floor with her legs under her, both of you letting out chuckles from all the slipping and sliding you do on the wet floor. When she is settled, you lean against her flank and relax, the post-orgasm buzz still pleasantly running through your body.");
	else output("\n\nHer legs all but give up under her, her body unable to cope with your combined weight and the slippery floor in the middle of a mindblowing orgasm. Fortunately, you have suspected that something like that will happen and have managed to unravel yourself in time, before your tail would have been permanently and tragically squished under her considerable weight. You rest your upper body on top of her, lazily coiling your tail on the floor, watching her aftershocks with satisfaction of a job well done.");
	output("\n\n<i>“That,”</i> Sylvie exclaims once she got her breath back, <i>“was one of the best orgasms I ever had. Hm, just what I needed.”</i> She turns her head to you and gives you a flirtatious smile. <i>“You, darling, are welcome to </i>ravish<i> me anytime,”</i> she purrs. You reply that you’ll keep her offer in mind, giving her ");
	if(pc.isBimbo()) output("an enthusiastic beam.");
	else if((pc.isNice() || pc.isMischievous()) && !pc.isBro()) output("a teasing smile.");
	else output("a smug smirk.");

	output("\n\nLooking around the room, Sylvie sighs and starts getting up. <i>“Should probably start cleaning,”</i> she say, mumbling under her breath, <i>“since it’ll take us a while I suspect.”</i> She look exasperatedly at the ");
	if(sylvieHasCock()) output("sperm-infused");
	output("miniature");
	output(" lake under you. You look at her");

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
//Futasylvie compatible nau!
public function cuffsAndTongueFromNonesuchyDuchy(forcy:Boolean = false):void
{
	clearOutput();
	showSylvie(true);
	author("Nonesuch");
	//Roughhouse first time/repeat
	if(forcy)
	{
		output("<i>“Yes, I know.”</i> She rummages around in her bag, and from the booby muffler currently occupying your face you hear the slithering clink of a small chain. <i>“Since you’re being a lil’ teaser who thinks you can get away from me...”</i> The next moment you find yourself being roughly turned around and your wrists professionally cuffed together behind you. With one hot hand on your shoulder and the other embedded in your ass-cheek, you are frogmarched towards the visitor rooms.");
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
	output("\n\n<i>“I know where you been looking,”</i> slurs Sylvie. You can just about make out her flushed, jolly face peering over her shoulder at you, beyond the vast furred behind dominating your vision. She lifts her short tail, and the tang of heavy female arousal hits you, emanating from that big, puffy, purple fuck-hole of hers, slick with arousal. [pc.EachVagina] swims with lusty heat; partially in reflex and partially for provocative effect, you lick your [pc.lips] so that they shine with the saliva filling your mouth. That draws a pleased, lusty groan from the moosetaur hovering above you.");
	output("\n\n<i>“Yeah. Can’t help yourself, can you? ");
	//First:
	if(flags["SYLVIE_CUFFNFUCK"] == undefined) output("No offence, but I had you down as a subby lil’ pussy munch from the start. Just a question of, could you go the distance with me...”</i> She sighs as she slowly lowers her hindquarters, down far enough to reach out and eagerly lick her plump labia, oiling your [pc.tongue] with her scent. <i>“...lemme tell ya, I’m glad you did.”</i>");
	else output("Dunno how I managed before I found me a drinkin’ buddy that changes into a pussy slave at the end of the night.”</i> She giggles as she slowly lowers her hindquarters, down far enough to reach out and eagerly lick her plump labia, oiling your [pc.tongue] with her scent. <i>“Every workin’ gal needs one of you!”</i>");
	output("\n\nShe sighs with pleasure, hovering over you, hooves clacking on the floorboards as you circumscribe her outer lips with the tip of your tongue, building her pleasure with slow rotations; then, with an impatient whuff and a squelch, she sits most of the weight of her rear down on your face. Your world becomes a swaddle of supple, fur-covered bulk, her wet pussy pressed heavily onto your mouth.");
	output("\n\n<i>“Lick, [pc.boy],”</i> she grunts, from somewhere far away. <i>“You aren’t going nowhere until I’ve had my fill. Maybe... if you’re really good... I’ll return the favor.”</i>");
	output("\n\nBreath whistles through your nose as you desperately lap at the shining inner walls of her pussy, the padded labia mashing into your [pc.lips] like the most obscene and impatient of make-outs. Alarm flairs in your head every time Sylvie’s weight bears down in excited response to a flick of your tongue, making your neck creak. Make no mistake, the massive taur could easily kill you from this position if she wanted to - or if she was, say, extremely drunk and got careless. With your hands bound like this, there’d be very little you could do if she suddenly sat her whole weight down. You curse and inwardly rail at your libido for finding this fact extremely exciting, [pc.eachVagina] flushing with arousal and your [pc.nipples] ");
	if(!pc.hasLipples() && !pc.hasFuckableNipples()) output("hardening up");
	else output("wettening");
	output(" almost painfully the longer the muffled face-fuck goes on.");

	output("\n\nWith each loving stroke of your [pc.tongue] over its smooth walls, Sylvie’s cunt swells up more and more, until it’s like a giant, purple donut your mouth is mashed into. An escalating series of breathy sighs and groans emanates from above, hooves rapping sharply against the floorboards as you tongue your moosetaur top to ever greater heights of pleasure.");
	output("\n\n<i>“‘S right, right there, you dirty lil’ [pc.boy],”</i> she huffs. You can’t see, but you take it by the sound of shifting tunic fabric she’s toying with her massive breasts as you eat her out. ");
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
	if(sylvieHasCock()) output("\n\nThrough it all is the lurid gushing of her cock’s voluminous ejaculations. Splat after splat of augmented seed hits hard into the floor, Sylvie’s balls visibly quaking with the effort of disgorging so much. The sweat-slicked equine organ lurches time after time, long after you expected it to stop, hosing out a tidal wave of white, salty goo in response to your tongue’s loving licks.");
	pc.applyPussyDrenched();
	processTime(15);
	pc.changeLust(80);
	clearMenu();
	addButton(0,"Next",cuffnFuckSylviePartDues);
}

public function cuffnFuckSylviePartDues():void
{
	clearOutput();
	showSylvie(true);
	author("Nonesuch");
	output("<i>“Mmm,”</i> Sylvie sighs, lifting her thick hindquarters off your face at last. Silvery trails of femcum and saliva follow it as she turns like a ponderous, furry space cruiser to regard you with deep, rosy contentment. <i>“That was delicious. I definitely think rug munching like that deserves a lil’ reward.”</i>");
	output("\n\n<i>“If you say so, ma’am,”</i> you reply, with all the chipperness you can muster. It remains an awe-inspiring, slightly frightening experience to be bound and knelt in front of this towering beast-woman, utterly subservient to her drunken impulses.");
	output("\n\n<i>“You’re so One-damned precious!”</i> she laughs. <i>“A cute lil’ pet, all of my own. I just wanna eat you up... in fact, yeah. That’s exactly what I’m gonna do.”</i>");
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
	else if(pc.hasVaginaType(GLOBAL.TYPE_FLOWER)) output("\n\n<i>“Ooh hey,”</i> she coos, confusion coloring her tones as she gazes at your dewy orchid twat in full flourish. <i>“You got some sort of plant growing down here, didja know? You should prob’ly get that checked out.”</i> You exhale slowly as she wonderingly traces the sensitive innards of one of your [pc.vaginaColor] fronds with her warm, wet tongue. <i>“Real pretty, though.”</i>");
	else output("\n\n<i>“Cute vajazzle for a cute lil’ sub,”</i> she proclaims, looking up at you with thirsty vixenish lust writ large on her face. <i>“Certainly looks tasty.”</i>");
	output("\n\nSylvie lurches forward, roughly thrusting her tongue deep into the wet, sensitive suck of your hole, eagerly stroking your innards to send spasms of sensation whiplashing up your body. Hands cuffed and thrust up against the wall by the moosetaur’s cruiser-like mass, you are helpless to do anything but let her ravish you with her long, wriggling appendage; obscene smacking and slurping fills the room, joined shortly by your own groans and wails as it begins to feel like [pc.eachVagina] is melting with pleasure. She never stops looking upwards, laughingly drinking in your helpless reactions to her questing tongue like a crisp pint of lager.");
	output("\n\nYou clench your [pc.thighs] up tight around her neck as you blow like a rocket, ");
	if(!pc.isSquirter()) output("a generous dribble of [pc.girlCum] forced out of your flexing cunt");
	else output("a huge gush of [pc.girlCum] forced out of your over-juiced cunt");
	output(" by the warm, strong movements of the mountie’s mouth. Your orgasm only seems to goad her on; with a lusty, hungry hum she redoubles her grip around your hips, opens her mouth up and penetrates you even deeper with her questing tongue, determinedly lapping down every last drop your simmering fuck pocket");
	if(pc.totalVaginas() > 1) output("s produce");
	else output(" produces");
	output(", extending the ecstatic quakes even further.");

	if(InCollection(pc.girlCumType,[GLOBAL.FLUID_TYPE_CHOCOLATE_MILK,GLOBAL.FLUID_TYPE_HONEY,GLOBAL.FLUID_TYPE_STRAWBERRY_MILK,GLOBAL.FLUID_TYPE_NECTAR,GLOBAL.FLUID_TYPE_VANILLA,GLOBAL.FLUID_TYPE_CHOCOLATE_CUM,GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT,GLOBAL.FLUID_TYPE_FRUIT_CUM,GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM,GLOBAL.FLUID_TYPE_EGGNOG])) 
	{
		output("\n\n<i>“You’re so sweet!”</i> she exclaims with giddy excitement, when she finally pulls her [pc.girlCumColor]-smeared mouth away from your tenderized sex. <i>“Like a ");
		if(pc.girlCumType == GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM || pc.girlCumType == GLOBAL.FLUID_TYPE_FRUIT_CUM) output("glass of fruit juice");
		else if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output("pot of honey");
		else if(pc.girlCumType == GLOBAL.FLUID_TYPE_CHOCOLATE_CUM || pc.girlCumType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output("hot chocolate");
		else output("yummy treat");
		output(" after a night out. Can I keep you?”</i> Without pausing for an answer she greedily shoves her head back between your thighs, nose buried in your mons as she attacks your [pc.clit] with insistent flicks of her tongue and smooches of her lips.");
	}
	else
	{
		output("\n\n<i>“Mmm,”</i> she grins, [pc.girlCumColor] fluid smeared across her chin. <i>“Nothing like some refreshing girl juice after tying one on, am I right?");
		if(pc.wettestVaginalWetness() >= 4) output(" And you are soooo juicy, wow! You’re pretty much everything I want in a cunt toy, you know that?");
		output("”</i> Without pausing for an answer she greedily shoves her head back between your thighs, nose buried in your mons as she attacks your [pc.clits] with insistent flicks of her tongue and smooches of her lips.");
	}
	output("\n\nYou squeal and writhe and moan and flap your [pc.legOrLegs] against her back to her energetic saliva-coated strokings, but Sylvie is utterly insatiable. You are brought to another quivering orgasm - your cries and batters of your fists against the wall surely painting a lurid picture of what’s going on up here to every person in the Lodge - and she just keeps lapping away at your [pc.clit] and inner walls, not stopping until a third, shattering high ");
	if(!pc.isSquirter()) output("dribbles");
	else output("spurts");
	output(" surely every last drop you have to give out of your exhausted hole");
	if(pc.totalVaginas() > 1) output("s");
	output(" and down her gullet.");

	output("\n\n<i>“Ahhh,”</i> she sighs with a smack of her lips, finally releasing her grip around your waist and lowering you down. Your " + (pc.legCount == 1 ? "[pc.leg] is" : "[pc.legs] are") + " utterly nerveless, and you find yourself simply pooling onto the floor in front of her, [pc.eachVagina] throbbing mightily. It’s a pitiable state of affairs that earns you another tipsy honk of laughter from above. <i>“‘S what happens if you bounce that butt around after I’ve had a few, I’m afraid,”</i> the moosetaur says. You are smothered in boob again as she reaches down and unlocks your cuffs with a practiced click. Your shoulders and wrists sigh with relief. <i>“I get thirsty! And this --”</i> she pats her broad, furry side - <i>“needs a whole lot of foof juice to be properly satisfied. ");
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

	output("\n\n<i>“I almost forgot! I don’t want you bursting from the pressure before we get to the bath. The venom’s effects can be...”</i> you pause to lick her from the base of her neck all the way up to her ear, <i>“...quite </i>potent<i>.”</i> You trace a ring around her engorged pussy, just roughly enough to start her juices flowing.");
	output("\n\nTo her credit, the sturdy moose-taur stays on her feet. Her legs buckle, almost bringing her crashing into a table of partying bar-goers. She mumbles something that might have been an attempted apology, but her tongue lolls out of her mouth in the process, preventing the words from escaping. Embarrassment and excitement raise the already immense heat of her body as your saliva’s hold strengthens.");
	output("\n\nYou spend the last few steps across the bathing area gathering spit in your mouth, building up a veritable salvo of liquid lust. The dazed centaur gets a silly, hopeful grin on her face when she sees the first available jacuzzi, wobbling as she steps toward it a little too quickly. You let her make it maybe halfway there before leaning in and releasing the waterfall of fluid fervor along her collarbone. Thick globules collect and trickle down along her chest, mixing with her sweat to grow even more rapidly.");
	output("\n\nThe massive moose drops like a rock, clutching at her breasts to free them from the carpet of flaming passion. She manages to rub the slick substance further in, growing ever more feverish in her attempts. With a little effort you manage to remove her bra, granting her spasming hands extra space. Twitching fingers find her nipples, squeezing them tightly enough for a guttural moan to break through her venom induced silence.");
	output("\n\nYou swiftly plug her open mouth with a kiss, muffling the noise with your tongue. Her eyes shoot wide open, but the pupils remain totally unfocused, dilated so deeply you can see yourself in the reflection. Scent, taste, the raw heat of her body, you take them all, devouring her essence like mulled wine. Jutting nipples grind into your [pc.chest] as she breaths, and you can feel the thunderous beating of her heart through the compressed flesh.");
	output("\n\n<i>“We’ve gotta get you nice and dirty before you can take a bath,”</i> you say as you pull back, She follows you for another kiss, moaning in distress at the loss of direct contact with your venom drenched tongue. She grabs at your " + (pc.hasHair() ? "hair" : "head") + ", trying to pull you up but only succeeding in pulling you into her impressive rack. Making ample use of the opportunity, you take a thick, rosy nipple between your teeth. Rapturous moans erupt from the pleasure drunk mounty as you nibble on the sensitive nub, pausing to temper the bites with your tongue.");
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
		if(silly) output("So, how do you feel about donuts");
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
		if(silly) output("So, how do you feel about donuts");
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
	output("\n\nBetween your saliva, her sweat, and the natural humidity in the baths, Sylvie is sopping wet from head to hoof and oozing with enough heat to form your own personal sauna. It’s hard to breathe in the sweltering warmth, and harder to find traction on her slick skin. None of that matters to you; every inconvenience is driven from your mind by the sweet softness of her lips against yours.");
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
	if(!cat) output("kaithrit");
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
	pc.changeLust(15);
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
	pc.changeLust(200);
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
	pc.applyPussyDrenched();
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

	output("\n\nYour hips, yoked to the pheromones driving your body, pound away. Curtains of femcum splash up over your [pc.belly]. Other patrons look on in awe. More than one is masturbating, nearly as beholden to Sylvie’s sorcerous scent as you. Some are fucking, adding their own sexual aromas to the fuck-melange filling the air. Your sodden nose twitches.");
	if(pc.cockTotal() > 1) output(" So do your [pc.cocks.");
	else if(pc.cockTotal() == 1) output(" So does your [pc.cock].");
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
	output("\n\n<i>“Ahhh~!”</i> Sylvie cries. Her pussy gushes and grabs hold of you squeezing. It’s too much for you to endure, and the release you’ve been chasing since you smelled her so long ago finally claws its way out of your belly with wild spasms of pleasure. Your whole body shakes, every muscle taut, every nerve afire with bliss");
	if(pc.balls > 1) output(", your [pc.balls] audibly sloshing as they disgorge their virile payload");
	output(". Your [pc.cock " + x + "] feels like an erupting volcano, so soaked in red-hot liquid that you can scarcely tell your own ejaculate from the sea of Sylvie’s slutty secretions.");
	
	processTime(44);
	var cumQ:Number = pc.cumQ();
	
	output("\n\nThe titanic moose-taur grabs your hands off her ass and squeezes your palms in hers, looking you in the eye as you orgasm. She’s smiling wide, watching your face with rapt attention as you release jet after jet inside her");
	if((cumQ >= 500 && !pc.hasKnot(x)) || (cumQ >= 5000 && pc.hasKnot(x))) output(", more than enough to backflow into the pool");
	output(". <i>“Keep at it, stud,”</i> she whispers encouragingly. <i>“A little more cum and you’ll get me soooo pregnant.”</i> Her cunt rhythmically contracts and relaxes, milking you for more. <i>“Oooh, you’re doing it, you’re knocking me up!”</i> Sylvie squeezes your hands even tighter, and somehow you feel it echoed deep inside you, squeezing out the last few dregs of seed that your body can offer.");
	output("\n\nYou sigh heavily, then slump weakly over Sylvie’s ass. Cum trickles down your legs, and for once since going into rut, you feel completely sated.");
	
	pc.orgasm();
	pc.ballFullness = 0;
	clearMenu();
	addButton(0,"Next",sylvieRutFunPart4, cumQ);
}

public function sylvieRutFunPart4(cumQ:Number = 0):void
{
	clearOutput();
	showSylvie();
	output("Sylvie pushes you off her into the pool");
	pc.applyPussyDrenched();
	if(cumQ >= 3000) 
	{
		output(", and a tide of [pc.cumGem] sex-juice pours out over you, soaking you further");
		pc.applyCumSoaked();
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
	output("\n\nSylvie nods. <i>“It’s a shame you [pc.boyGirl]s get so sug");
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

/*=====================================
			SYLVIE FUTA EXPACK!
			By Wsan
  ===================================*/
//Fit into this menu: [Get Sexy] [SynthSheath] [Hug] [Leave]
//[SynthSheath] //requires a SynthSheath in your inventory

public function giveTheMooseABone():void
{
	clearOutput();
	showSylvie();
	author("Wsan");
	
	if(!CodexManager.entryUnlocked("SynthSheath"))
	{
		output("While checking your inventory, you run a hand over the strange horse dildo you found. Your Codex beeps with a warning about how the dildo-like device, a “Xenogen Biotech SynthSheath Mk1”, may irreversibly alter ones biology. You grimace ruefully at the thought of enhancing Sylvie’s genitalia.");
		CodexManager.unlockEntry("SynthSheath");
		output("\n\n");
	}
	
	output("An idea pops into your head right as Sylvie is directing the most intense fuck-me eyes your way.");
	output("\n\n<i>“Hey, Sylvie?”</i> you ask, looking through your belongings.");
	output("\n\n<i>“Yeees?”</i> she practically purrs, leaning forward and unintentionally wafting her lusty pheromones into your nostrils.");
	output("\n\n<i>“I’ve been lugging this thing,”</i> you say, brandishing the SynthSheath, <i>“around ever since picking it up on another planet. Whatcha think?”</i>");
	output("\n\nShe eyes it suspiciously, peering drunkenly at the base of it until you press the button that extends the cock from its sheath. Her eyes widen in surprise, then she smiles.");
	output("\n\n<i>“Oooh, horsecock. How’d you know that was my favorite? Nothing quite as filling...”</i> Sylvie trails off, her hindquarters bobbing a little. <i>“So what’re you gonna do with it?”</i>");
	output("\n\n<i>“It’s what </i>you’re<i> gonna do with it,”</i> you reply, pointing at it with your free hand. <i>“This thing attaches to you and becomes yours permanently. No hardlight dildo stuff, actually yours. It’ll match your skin and everything. Just happened to think you could make use of it because, well...”</i> you eye the grinning moosegirl. <i>“I get the feeling you’re the type of girl who’d be happy with your own cock to play with. Plus you’d probably make a lot of other people happy too,”</i> you add.");
	output("\n\n<i>“You got </i>that<i> right, that sounds like a lotta fun... as long as you help me test it out. Deal?”</i> she says, batting her eyelashes with a wide smile. She knows she’s getting off hard one way or another tonight.");
	//[Okay] [Naw]
	processTime(5);
	pc.changeLust(5);
	clearMenu();
	addButton(0,"Okay",sylvieOkayWithDongeridoodles);
	addButton(1,"Naw",nawSylvieImADumbshit);
}

//[Naw]
public function nawSylvieImADumbshit():void
{
	clearOutput();
	showSylvie();
	author("Wsan");
	output("Actually, taking care to help this amazonian would-be herm get off might be more trouble than you initially thought.");
	output("\n\n<i>“Maybe some other time,”</i> you reply evasively, putting the SynthSheath back.");
	output("\n\n<i>“Awww, I wanted to see if I could put it up your butt...”</i> Sylvie pouts, showing off those plush teal lips.");
	processTime(2);
	//Back to previous menu
	sylvieMenu();
}

//[Okay]
public function sylvieOkayWithDongeridoodles():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	pc.destroyItemByClass(HorseCock);
	flags["SYLVIE_SYNTHSHEATHED"] = 1;
	output("<i>“Least I could do for a girl in need,”</i> you say, grinning up at her as you kneel down beside her. <i>“Just as a reminder, the SynthSheath is permanent - it won’t just go away when you get off or whatever.”</i>");
	output("\n\n<i>“Thass’ okay. Government people get removals pretty much free here on Canadia! If I don’t want it, it won’t be there!”</i> Sylvie says, giggling. <i>“Anyway, I’m not in the detective division but I gotta hunch I’m gonna be keeping it...”</i>");
	output("\n\n<i>“What makes you say that?”</i> you ask, keeping the libidinous taurgirl busy while you position the sheath between her legs. The tantalizing perfume of her velvetine sex is overwhelming down here, and the only thing keeping you from just grabbing her legs and burying your tongue into her dripping cunt is the prospect of something better.");
	output("\n\n<i>“Did I ever tell ya about how I got the nickname Six Gallon Sylvie?”</i> she starts, recalling the tale. <i>“There was a prisoner- a pri- ooh, is that the sheath? That feels pretty- pretty good! Nngh.. ooh!”</i>");
	output("\n\nThe moment it settles into place, the SynthSheath begins changing color to match Sylvie’s lustrous brown fur. Sylvie can obviously feel it happening if the lusty moans emanating from above are any indication, the tone of her newly-acquired genitalia dulling until it’s close to black. A moment, and then the SynthSheath is gone - all that’s left is a regular sheathed horsecock and two very impressive balls hanging between Sylvie’s trembling legs.");
	output("\n\n<i>“Ooooh, wow,”</i> Sylvie moans, sounding a little out of breath. <i>“I think I came a little just having it put on!”</i>");
	output("\n\n<i>“The show’s not over yet,”</i> you tell her, shifting underneath her.");
	output("\n\nReaching up between her spread hindlegs, you surreptitiously slide your hand up to her pussy and find what you were looking for - Sylvie’s massive, swollen clit. You give it a gentle nudge and enjoy her quiet gasp, the muscles in her powerful thighs momentarily tightening in pleasure. Wetness trickles past your finger, sluicing down either side.");
	output("\n\nWith your other hand, you cup one of her giant balls, eliciting a surprised intake of breath from the moosetaur. Then, what you’re waiting for finally happens. Sylvie’s hips lower a little, angling downwards instinctively, and her sheath begins to swell. The giant, mottled black and pink head of her swelling cock makes its first appearance, pushing outwards and drooping under its own weight before her length begins to stiffen.");
	output("\n\nTrying her best to keep her moans at a minimum, the effect is somewhat dulled by the way Sylvie paws at the wooden floor with one of her forelegs as her monstrous erection works its way to fullness. It happens in twitches and jerks, unfamiliar vessels being used for the first time to supply her mammoth horsecock with enough blood for it to stand proud. She bucks once, twice, then shudders again when you touch her clit.");
	output("\n\nAt full length, her delectable cock must be somewhere close to two feet. It looks <i>painfully</i> stiff, hugging her underside so tightly you imagine it feels like an iron rod between her legs. Her balls, too, are beginning to swell - you can feel with your hand the warmth of seed weighing them down, sagging in your grip.");
	output("\n\n<i>“What are you two doing over there?”</i> Kally huffs, arms crossed and staring. <i>“Stop scuffing my floors!”</i>");
	output("\n\n<i>“Baths,”</i> Sylvie pants urgently, taking your arm with surprising strength, <i>“now.”</i>");
	processTime(10);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",sylvieTriesHerDongerOn1);
}

public function sylvieTriesHerDongerOn1():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	//move to baths!
	moveTo("CANADA7");
	generateMap();
	output("Sylvie hurriedly guides you to one of the rooms near the bathing section and slams the door behind herself, then leans forward to grab your shoulders and groan deeply right in your face. Her eyes are unfocused, and you can see she’s roughly biting her puffy lower lip.");
	output("\n\n<i>“Suh- something’s weird,”</i> she pants, squeezing your arms. <i>“Feels like I’m s-stretching!”</i>");
	output("\n\nRemoving her hands and ducking down to look, you almost get whapped in the face. She’s right - it <i>does</i> look like she’s stretching! You don’t know what’s going on, but her newest endowment is growing even larger than it initially was. You can see its bulging mass swell from base to tip, her hefty balls drooping with their weight, her cock adding inches to itself seemingly spontaneously.");
	output("\n\nYou’ve never seen this happen before, but Sylvie is evidently in quite a bit of discomfort. You can only really think of one way to ease her pain right now, and reach out to stroke the affected area. She makes a confused noise when you touch her, her cock jerking at the contact, then moves closer to you.");
	output("\n\n<i>“Keep touching it,”</i> she gasps, her hips beginning to buck involuntarily. <i>“Oh, god! Please keep touching it!”</i>");
	output("\n\nYou’re definitely going to need two hands for this. You stroke her from base to middle with one hand and from middle to tip with the other, lightly squeezing the tip of her dick, and some clear pre-cum begins to leak out. Her mounting cries of mixed distress and pleasure spur you further onwards, softly rubbing and kneading her newfound cock until finally, the pre-cum gives way to much thicker, creamier alabaster liquid.");
	output("\n\nSylvie makes blessed moans of relief as spunk drips, dribbles, then begins to roughly jerk and spurt from her flaring tip as you rub her, massive hips slowly rolling in your embrace. You milk her thoroughly as she begins to calm down, the reaction - whatever it was - apparently dissipating now that she’s able to cum. She croons sweetly with every heavy squirt of jizz onto the floor, her delighted moans like music to your ears.");
	output("\n\n<i>“Uuuhhhh, god!”</i> Sylvie huffs, squeezing her hips together so tightly she spunks an extra few feet. <i>“If it’s like this every time I’m never gonna stop.”</i>");
	output("\n\n<i>“Those animal instincts you were talking about, huh?”</i> you say, squeezing down hard to help her get all the rest out.");
	output("\n\n<i>“Nnnnthankyou!”</i> she pants, dollops of thick jizz splattering the floor. <i>“Animal instincts is right. All I wanna do right now is fuck something with this cock!”</i>");
	output("\n\n<i>“I think I can help with that,”</i> you say, eyeing her still-hard prick. It bounces against her stomach a little every time she flexes it and sends some more sticky spunk on its way to the floor, the cumshots appreciably smaller now but no less impressive. The real mindboggler, though, is the new size of her cock. It’s grown about half a foot longer and much, much thicker - you give her an affectionate squeeze and rub just for fun, and raise your head to ask about it.");
	output("\n\n<i>“Do you have any allergies or anything, Sylvie?”</i> you say, the moosetaur turning to look downwards at you. <i>“Something that might cause, well... this?”</i>");
	output("\n\nYou pull her cock to the side a little so she can see it, and the quizzical girl’s eyebrows raise in surprise.");
	output("\n\n<i>“No wonder it feels so swollen!”</i> she giggles, putting a hand to her cheek. <i>“No ideas, though. Police get tested for everything and I’m as clean as can be!”</i>");
	output("\n\nWell, you can figure out the mystery later. For now, you have a very eager-looking moosegirl and her animalistic urges to take care of. Not to mention the fat, dripping horsecock between her thighs.");
	output("\n\n<i>“Can I fuck your butt?”</i> Sylvie asks suddenly, hands clasped beneath her chin and eyes glittering. <i>“I wanna see how it feels!”</i>");
	output("\n\nHer generous bosom jiggles as she bounces in excitement at the prospect of burying her cock in your ass. Well, how can you say no to that?");
	processTime(25);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",sylvieTriesHerDongerOn2);
}

public function sylvieTriesHerDongerOn2():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("<i>“Fuck, you look sexy like that!”</i> Sylvie thrills, clapping her hands. She’s looking down at your naked form lying just on the edge of the bed with legs spread, her monster cock and your ass slathered in lubricant. You can’t help but feel slight apprehension as she rears up to place her thick, powerful forelegs on either side of your body, her rock hard dick spurting a bit of pre-cum over your [pc.tummy].");
	if(pc.hasCock()) output("\n\nYour own cock twitches involuntarily, perhaps an outward sign of nervousness, but it’s a little too late for regret now.");
	else output("\n\nYour asshole twitches a little, perhaps an outward sign of nervousness, but it’s a little too late for regret now.");
	output("\n\nYou completely skipped the foreplay, reasoning that nothing was going to help you take Sylvie in: it’ll either work or it won’t, and you’re pretty sure she’s got her sights set on making it work if her flushed face is a reliable indicator. She’s all but giddy with drunken glee at the prospect of getting to fit her newfound bitchmaker inside you.");
	output("\n\n<i>“Remember to take it a little easy, Sylvie,”</i> you tell her, but your words fall on all but deaf ears as she excitedly aligns herself with your [pc.asshole] and begins to push.");
	output("\n\nThe sheer heft of her moose-morph form forces you upwards slightly when she shoves upwards into you, the swollen head of her cock spreading your asscheeks wide and spearing the first couple of inches inside you.");
	output("\n\n<i>“Oh, god, that’s amazing,”</i> she groans in ecstasy, your asshole instinctively clamping down on her spongy, sensitive cockhead while you try not to shriek open-mouthed. <i>“Oh, I could let you do this </i>all<i> day.”</i>");
	output("\n\nThankfully, she seems content to do just that for now, enjoying your body’s desperate attempts to force the conqueror to acquiesce. No such luck for you, though - Sylvie is almost lying on top of you at this point, and you’re clearly going nowhere but further down her lubed-up cockshaft.");
	output("\n\nYou groan as you feel her slip a couple of inches deeper with alarming ease, copious lubrication and pre-cum making short work of the slightest opening. You can feel a massive protrusion between your slickening thighs, her giant equine length parting your insides and stretching apart your asshole like you’re nothing more than a synthetic fucktoy made for the well-endowed.");
	output("\n\n<i>“Aww, I can feel how much you want me inside!”</i> Sylvie giggles, drawing back for a deeper thrust. <i>“Mmmm, the way you keep squeezing down on me... you really like my dick, huh [pc.name]?”</i>");
	output("\n\nHonestly, you’re too focused on the feeling of internal displacement to be paying much attention to how she feels inside you. When Sylvie shoves herself back inside you gasp involuntarily, a response forced from your body on instinct.");
	if(pc.bellyRating() < 30) output(" Looking downwards shakily, you can see a giant bulge protruding from beneath the [pc.skinFurScales] of your [pc.stomach]. Oh fuck, maybe you really <i>are</i> just a fucktoy.");
	
	pc.buttChange(sylvieCockVolume());
	
	output("\n\nOn the next thrust, though, something changes. Sylvie’s thick, round medial ring pushes and pops inside your asshole and you groan loudly enough Kally might have been able to hear it. Sylvie’s ears prick up and she stops for a moment, looking down at you and grinning.");
	output("\n\n<i>“Ooooh, I think [pc.heShe] likes iiit,”</i> she singsongs, still drunk and having the time of her life. <i>“Why don’t you have some more?”</i>");
	output("\n\nPulling herself out with a slowness that makes you quiver, she slides her iron-hard cock back inside right up to the ring in one go and giggles when you gasp in pleasure.");
	output("\n\n<i>“Oh, having a dick is so much fun!”</i> Sylvie exclaims in glee, watching your every flustered reaction. <i>“Just listen to you, you sexy thing! Mmf!”</i>");
	output("\n\nIt’s like your body doesn’t know what to do or how to respond. You find yourself grabbing the thick, lustrous fur of her sides with your sweaty hands while she teases what feels like an unending amount of pleasure out of your ass with that thick midsection of her cock. Before long you’ve got your legs hooked around her hips, groaning and crying out so loudly the creaking of the bed is drowned out.");
	output("\n\n<i>“Sylvie! Sylvie!”</i> you gasp with every thrust, the pleasure inside you mounting and mounting until you can do nothing but tremble underneath her, poised right on the precipice of orgasm.");
	output("\n\n<i>“Go ahead and cum, babe,”</i> she whispers to you, rolling her massive hips slowly. <i>“Cum aaaaall over that big, fat cock in your ass.”</i>");
	output("\n\nFeeling her thrust deeper than ever before, you whimper and do as you’re told. Throwing your head back and pulling roughly at her fur, your back arches off the bed so harshly you thrust your chest into Sylvie’s soft underside with a helpless groan. She helps you ride through the full-body sensation, whispering encouragement and lusty moans when she feels you squeeze down hard on her veiny shaft.");
	output("\n\nIt feels like your entire body is contracting with every pulse of pleasure, leaving you breathless and shaking until the next. Your abdominal muscles are aching, but it’s impossible to resist the urge.");
	if(pc.hasCock()) output("\n\nYour cock dribbles an endless supply of pre-cum, a thick dollop of real cum mixed in every time you tighten up in orgasm. For some reason it just won’t stop, streaks of [pc.cumColor] running down the thick length of Sylvie’s swollen horsecock to drip from her balls.");
	if(pc.hasVagina()) output("\n\nYour [pc.pussy] sympathetically contracts and squeezes too, a scant trickle of femcum rolling down your trembling thighs.");
	output("\n\nYour desperate bucks and hip-thrusts gradually die down in intensity until all you’re doing is slowly sliding up and down a couple of inches of Sylvie’s dick, and you collapse back onto the bed with limbs spread. Your muscles ache <i>everywhere</i>");
	if(pc.hasPerk("Amazonian Endurance")) output(", your only saving grace your amazonian endurance");
	output(".");

	output("\n\n<i>“You’re a fucking star with how you dance on my pole, Steele,”</i> Sylvie purrs, slowly pulling out of your stretched-out asshole. <i>“I was this close to cumming right into your belly with the way you were squeezing me.”</i>");
	output("\n\nAfter some light struggling with getting her flare back out of your ass, she pulls free and beams down at you.");
	output("\n\n<i>“Do you want to take a little break, [pc.name]? You look a little tired, and I still haven’t cum, so it’ll be even rougher next time! Remember, we do have baths.”</i>");
	output("\n\nYou look up at the shining beacon of sexuality standing above you and smiling and consider your options.");
	if(pc.isTreated()) 
	{
		output("\n\n<i>“I’m fine, just give me a second,”</i> you huff, catapulting yourself into an upright sitting position to Sylvie’s surprise.");
		output("\n\n<i>“Wow, you’re really something!”</i> she says in admiration, looking over your body. <i>“The only person I know who could do that after a cock like mine is, well... me!”</i>");
	}
	//Non-Amazon:
	else
	{
		output("\n\n<i>“Actually, a bath would be pretty great if you want to help me into the water,”</i> you admit.");
		output("\n\n<i>“Of course I will, silly!”</i> Sylvie thrills, clapping her hands. <i>“Baths are fun!”</i>");
		output("\n\nA few minutes later and you’re taking a nice, warm bath with Sylvie humming in your ear and soaping up your back, those giant, soft tits of hers floating in the water on either side of your head. You have to say, this is a kind of tranquility you don’t get to experience often.");
		output("\n\n<i>“I could get used to this,”</i> you moan, leaning back into her caring embrace.");
		output("\n\n<i>“I’ll bet you could,”</i> Sylvie murmurs in your ear. <i>“Maybe we should make this a regular thing. I make you cum your brains out with my giant cock,”</i> she continues, sliding her soapy hands down your front and rubbing your [pc.nipples], <i>“then we take a nice, long bath before I rut you so hard you see stars. Seems like a good deal to me.”</i>");
		output("\n\nYou shiver at her words, knowing they’re a promise she’s good to deliver on. The bath continues with a teasing, sexual undertone of whispered words and murmured intimations until neither of you can take it any more. Hopping out, you dry each other off. Getting Sylvie completely dry is an arduous task, but fun; you can hardly help but notice her dripping wet erection either, the still-warm water running down her plump, low-slung balls. You gently rub her dry, eliciting approving moans with every soft, massaging touch.");
		output("\n\n<i>“Mmm, god,”</i> she sighs dreamily, pulling you up and into her voluptuous breasts. <i>“Let’s get back to the room before I take you right here against the wall.”</i>");
		output("\n\nYou’re half-hugged, half-marched back into the room by the enormous moosegirl, deposited on the bed, and hustled up to the headrest before you know it.");
		output("\n\n<i>“You’re gonna want to hang onto that,”</i> Sylvie advises, indicating the headrest. <i>“Trust me on that one.”</i>");
		//next page
	}
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",sylvieTriesHerDongerOn3);
}

public function sylvieTriesHerDongerOn3():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("<i>“Mmmmm... could you put some of this on my cock, please?”</i> Sylvie asks, tossing you a bottle labeled ‘elasticizing oil’. <i>“Just in case. I figure we both know the best method of application to your asshole. Just rub it right in there and I’ll get right to it,”</i> she says with a grin.");
	output("\n\nYou do so methodically, albeit with perhaps a little more attention to detail than you really need. It’s just kind of fascinating to feel every single bump, vein, and crease in Sylvie’s equine penis with your hands, knowing it’s about to be buried in your ass. You give special treatment to her medial ring, much to her approval, ensuring it’s slathered in a nice coating of lube before continuing onto the base. Just for good measure, you grope those heavy balls of hers and give them a slight, encouraging squeeze before retreating back to your position at the head of the bed.");
	output("\n\n<i>“You really know how to treat a girl, [pc.name],”</i> Sylvie says, biting her lip while she checks out your [pc.ass] pointed at her. <i>“Just looking at this... grr!”</i>");
	output("\n\nBending down, she seizes an asscheek and pulls, aggressively shoving two of her fingers right into your [pc.asshole]. The surprise penetration makes you moan a little, and Sylvie begins to rub her fingers along your sensitive insides.");
	output("\n\n<i>“That’s right, moan for me like a little slut,”</i> she croons, squeezing your ass. <i>“You’ll be screaming my name in a moment anyway.”</i>");
	output("\n\nAfter a few seconds she withdraws, standing on the bed on all fours, its intact state a testament to how well it supports weight. She smiles down at you cheerfully.");
	output("\n\n<i>“They test these beds specifically by getting ‘taurs to jump on them. You know, so they - we - can fuck like animals and not worry about them breaking. Welcome to Canadia!”</i>");
	output("\n\nWith that, she’s on top of you and pushing at your asshole with her oversized horsecock with a grunt of effort. You groan as you feel the inexorable stretching, your body giving way to her overwhelming dominance and size, her flare working its way inside until there’s a wet slurp and she’s inside you.");
	//stretch to fuck
	output("\n\n<i>“Uh!”</i> She grunts, leaning against the wall above you and already breathing heavily with lust. Pheromones wash over you and cloud your mind, wrapping around your brain and enthralling you with the idea of getting that impressive rod deeper inside. <i>“Okay, let’s go slowly at first...”</i> she whispers, half to herself.");
	output("\n\nYou’re treated to the feeling of her gradually sinking deeper inside you, both of you moaning in dizzy pleasure. Gripping the headrest so hard your knuckles turn white, you feel her ring slip inside you with a sensation that makes your legs quake, the much thicker part of her shaft soon following.");
	output("\n\n<i>“Oooooh fuck, you’re so gooood,”</i> Sylvie pants frustratedly, laughing a little. <i>“I’m </i>this<i> fucking close to just pounding the fuck out of you, [pc.name]...”</i>");
	output("\n\nFor your part, you’re thankful she isn’t - for now. Looking down hesitantly, you can see the imprint of her generous flare against your stomach and pushing deeper, the elasticizing lube doing its work to get her all inside. You gingerly put a hand to it and you can <i>feel</i> her inside you, her cock flexing and straining against your fingers as it seeks your recesses.");
	output("\n\n<i>“Hold on baby, we’re almost there,”</i> she grunts, swaying above you as she readjusts. <i>“Just... one more push... fuck!”</i>");
	output("\n\nWith a low, drawn-out groan she finally delivers on her promise, slipping her entire length between your cheeks. You can feel her loaded balls gently slapping against you");
	if(pc.balls > 0) 
	{
		output("r own, the gigantic testes resting against your");
		if(pc.ballDiameter() < 6) output(" smaller set, radiating intense warmth as if to remind you just how much of her spunk is going to be pumping inside you.");
		else output("s--her smaller but no less impressive set reminding you just how much spunk is going to be pumped inside you.");
	}
	else output(", their swollen weight resting between your inner thighs and reminding you of just how much spunk you’re going to have pumped inside you.");
	
	pc.buttChange(sylvieCockVolume());
	
	output("\n\n<i>“Holy </i>shit<i>,”</i> Sylvie groans loudly, and you’re treated to the sensation of her cock flexing and pulsating deep inside your body. <i>“Okay,”</i> she says, taking a deep breath, <i>“nice and slow on the outstroke...”</i>");
	output("\n\nTo her credit, she <i>does</i> take it slow on the outstroke and it <i>is</i> really nice feeling her mammoth length stroking you from the inside out, and the way her ring spreads you open when it pops out. But as much as you love her for the way she’s doing her absolute best to take care of you, it’s clearly taking a toll on her psyche trying to rein in her bestial instincts - and really, it’s not what you signed up for. You reach out and stroke one of her thick-furred legs, drawing the attention of the needy, panting moosetaur downwards.");
	output("\n\n<i>“Just pound me like a fucking animal,”</i> you moan.");
	output("\n\nSylvie is about to say something, but stops herself then nods. Her next thrust is much less charitable but no less amazing, her sheer size leaving you feeling like you’re wrapped around her cock as much as you are around her little finger. ");
	//dick: 
	if(pc.hasCock()) output("A thick strand of pre-cum is forced from your dick with the impact, the sensation making you groan in submissive lust.");
	else output("Some femcum squirts from your tightening pussy, teased out with a sensation that makes you groan in submissive lust.");

	output("\n\nVoid, this is exactly what you wanted. You’ve never felt so full as when she’s inside you or so empty when she’s pulling out. Once she’s assured she really isn’t hurting you and that you can handle it, you can feel her adjust her footing and begin <i>really</i> fucking your little asshole the way she should be. Aggressive grunts and groans begin to fill the room as Sylvie’s instincts take over, accompanying your higher-pitched moans and the noisy creaking of the bed below you.");
	output("\n\n<i>“Gonna cum hard,”</i> Sylvie pants urgently. <i>“Nngh! Nnn! Nnnnngh!!”</i>");
	output("\n\nHer long, deep strokes become frenetic, jerky motions of her hips, getting as much stimulation out of your insides squeezing down on her as she can. The forceful way she’s taking you is driving you steadily closer to your own orgasm too, Sylvie’s cock tying a knot of pleasure in your stomach even as it drives into it. Her scream of pleasure is all the warning you get before you’re suddenly lifted off the bed into the air, impaled on the end of her cock.");
	output("\n\n<i>“Oh god, oh god- nnnngggrh! Uuuuuuh! Uuuunnnnnh!”</i>");
	output("\n\nYou find yourself pressed against the wall with Sylvie’s forelegs on either side of your head, her hindlegs still frantically thrusting upwards without restraint and ensuring you can’t possibly get away. Buried so deeply in your body, you can feel every little part of yourself being spread wide by Sylvie’s rapidly flaring cockhead, and know it’s only a matter of scant seconds before those massive cumtanks hanging between her thighs tighten up and empty themselves into your guts. The foreknowledge, though, doesn’t in any way prepare you for the magnitude of what happens.");
	output("\n\nWith a primal, bestial scream of triumph, Sylvie finally nuts inside you so hard you can feel her entire body shaking behind you. The results are immediate. You feel a massive blossom of warmth spreading throughout your insides, and suddenly your stomach is sagging with liquid weight, swelling against the wall with the payload of Sylvie’s ejaculate. She doesn’t even notice what she’s doing to you, too enthralled with the novel ecstasy of her male orgasm.");
	if(pc.cockTotal() == 1) output("\n\nYour own [pc.cock] flexes and strains while you cum impossibly hard, your muscles tensing so tightly that you hear Sylvie mixing in some appreciative moans with her insensate, animalistic grunting, but nothing comes out of the tip. Teeth grit, prick fully erect and throbbing, you’re fucked to a dry orgasm by the relentless pounding from below.");
	else if(pc.hasCock()) output("\n\nYour own [pc.cocks] flex and strain while you cum impossibly hard, your muscles tensing so tightly that you hear Sylvie mixing in some appreciative moans with her insensate, animalistic grunting, but nothing comes out of the tips. Teeth grit, prick fully erect and throbbing, you’re fucked to a dry orgasm by the relentless pounding from below.");
	else if(pc.hasVagina())
	{
		output("\n\nYour [pc.vaginas] clench");
		if(pc.totalVaginas() == 1) output("es");
		output(" over and over, femcum spraying onto Sylvie’s sweaty, pumping balls and dripping down your [pc.thighs]. Your orgasmic moans go unheard, Sylvie’s animalistic grunting filling your ears the same way her cock is filling your stomach. She pounds you relentlessly throughout, riding you through your orgasm without even noticing.");
	}
	output("\n\nWith rising horror, you realize she’s going to pump you to the brim and then some. It starts as an overwhelming feeling of fullness, then you cough, and suddenly a river of spunk gouts forth from your open mouth like a waterfall. You automatically open wider just from the shock, but all you accomplish is advance the flow of Sylvie’s semen erupting from your throat. It comes in massive, cheek-swelling loads, unceremoniously spilling down your [pc.chest] to the bed below.");
	output("\n\nThe flow doesn’t stop, her jizz beginning to spurt from your nostrils too, but it eventually lessens to the point where you can take a gasping, shuddering breath before you “ejaculate” another massive load of moose spunk from between your [pc.lips]. You dimly realize you get a few seconds in between each payload being delivered from those fat, sweaty balls knocking against your [pc.ass], trying to make the most of it.");
	output("\n\nBy the time Sylvie groans and begins to relax, you’re pretty sure you have more of her splattered on your chest than resting in your stomach. You weakly swallow back down a warm, sticky load as she slowly pulls out, sated at last.");
	output("\n\n<i>“That was </i>amazi-<i> ooh, jeez, that’s why they called me Six Gallon Sylvie! I guess it might be more like 55 Gallon Sylvie now, or something! Lemme clean you up.”</i>");
	output("\n\nTo her credit, she does a very good job of cleaning off and massaging your mostly insensate body until you come back to your senses. Nattering away happily about how much fun this was while rubbing your shoulders, she fills your head with gleeful promises pertaining to what she’ll do with her cock next time. None of your holes escape mention, but she seems open to being on the receiving end too. She leaves you relaxing in the baths alone, citing a need to see the doctor and see exactly what’s going on.");
	processTime(30);
	var ppSylvie:PregnancyPlaceholder = sylviePP();
	pc.loadInAss(ppSylvie);
	pc.loadInMouth(ppSylvie);
	pc.orgasm();
	//next page
	clearMenu();
	addButton(0,"Next",sylvieTriesHerDongerOn4);
}

public function sylvieTriesHerDongerOn4():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("That <i>was</i> pretty fun, you think, even if you feel a little hollowed out right now. It doesn’t look like Sylvie will be getting rid of her horsecock any time soon, and you can’t say you’re surprised. She got <i>really</i> into that...");
	output("\n\nRaising your head, you realize you’ve actually spent quite some time in the baths just thinking of Sylvie’s brand new penis. You get out and find she’s left some towels behind just for you, retreating to a room to dry yourself off. Taken care of and dried off, you inspect yourself in the mirror. You don’t look like you were just violently fucked by a horny moosegirl, so that’s a plus. Checking yourself over, you make to leave.");
	processTime(3);
	pc.shower();
	//back to Baths menu
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Penis?]
public function sylviePenisTalk():void
{
	clearOutput();
	showSylvie();
	author("Wsan");
	//first time
	if(flags["SYLVIE_DONG_TALK"] == undefined)
	{
		flags["SYLVIE_DONG_TALK"] = GetGameTimestamp();
		output("<i>“So Sylvie,”</i> you start, the moosetaur looking at you over the rim of her glass, <i>“have you heard from the doctor about your new equipment? Do they know what caused the uh, reaction?”</i>");
		output("\n\nSylvie sets down the empty glass and looks at you, puzzled. <i>“My equipment? What do y- ooooh,”</i> a look of comprehension dawning on her face, then breaking into a grin as she leans across the table. <i>“You mean the big, fat horsecock hanging between my legs? The one that gets hard and drips every time I think about fucking you so hard you were spitting up gallons of my cum? That one?”</i>");
		output("\n\nShe settles back into her chair and shoots you a smug look. <i>“It’s fine. The doctor said it was due to the interaction between my government-issued nanites trying to shut down the ‘foreign body’. Apparently it caused an allergic reaction, like you said. She didn’t know why it had stopped and I didn’t bother telling her you were touching it at the time, but I’d guess the two things were related.”</i> She cocks an eyebrow at you. <i>“Guess your nanos don’t mess around, huh?”</i>");
		output("\n\n<i>“Right... so everything’s okay? You decided to keep it?”</i>");
		output("\n\n<i>“Yup!”</i> She affirms, nodding her head in a way that jiggles her around very flatteringly. <i>“The doc did mention the size increase was permanent. She was pretty clear on that point. She didn’t really say much else after that what with the foot or so of my cock in her throat.”</i>");
		output("\n\nYou can’t say you’re surprised.");
		output("\n\n<i>“Besides,”</i> she adds, <i>“if I really want it off I can get that done for pretty much free. Perks of working for the government! I don’t see it happening, though. I’m having too much fun giving people pony rides.”</i>");
		output("\n\nShe gives you a knowing wink.");
	}
	//Repeat
	else
	{
		flags["SYLVIE_SYNTHSHEATHED"] = 2;
		//grayed out until 72 hours have passed from initial dialogue
		output("<i>“So how’s life with a dick?”</i> you ask Sylvie, displaying the kind of familiarity only good friends or lovers could have. <i>“No regrets or anything?”</i>");
		output("\n\n<i>“Ha, nope!”</i> she replies with a happy grin, jerking a thumb back at the bar at Kally. <i>“Kally might be even more happy about it than I am, though. Having both sets sure provides more opportunities for fun... especially when there’s more than two of you taking part.”</i>");
		output("\n\nSeems like the friendly moosegirl’s wasted no time at all acquainting herself with the pleasures of having a dick.");
		output("\n\n<i>“Always a special place in my heart for the lover that took my virginity, though,”</i> she giggles, looking at you all doe-eyed and smiling. <i>“You never forget your first, right?”</i>");
		output("\n\n<i>“Pretty interesting first time,”</i> you note as she takes a drink. <i>“Do you treat all your partners like that?”</i>");
		output("\n\n<i>“Aww, just the ones I really love!”</i> Sylvie says, smiling again. <i>“And don’t even pretend you didn’t like it, [pc.name]. I’m not even sure </i>I’ve<i> ever squeezed down on someone as hard as you did on me. </i>Someone<i> likes having me up in their stomach pumping them full, hmmm?”</i>");
		output("\n\nSo she <i>did</i> notice that. ");
		//had vaginal with her before: 
		if(flags["SYLVIE_TAURMOUNT"] != undefined || flags["SYLVIE_HIPBUSTERED"] != undefined) output("<i>“I dunno about that...”</i> you muse, thinking back on your past trysts.");
		else output("<i>“Bet I can make you cum </i>twice<i> that hard,”</i> you promise her.");
		output("\n\n<i>“Oh?”</i> she answers, smirking. <i>“I am so fucking up for you proving that decisively. Your prize can be watching me cum my brains out all over a wall.”</i>");
		output("\n\nThat sounds like a pretty good deal, really. Getting back to your original question, though, Sylvie suddenly recalls something.");
		output("\n\n<i>“Oh. Speaking of cumming my brains out, there is actually one downside to having a horsecock. It gets fucking </i>everywhere<i>. And I mean that! I had to get an upgrade kit for my ‘taur milker just to handle the overflow. I had to stop mid-session the first time after I came once and clean my entire room,”</i> she sighs, recalling the sticky disaster. <i>“Well, that’s only a downside if you let it be! I do have to make sure I have some condoms on me all the time, though.”</i>");
	}
	output("\n\nIs there anything else you’d like to do with Sylvie?");
	processTime(10);
	sylvieMenu();
}

//Gloryhole suck
//HAS TO BE PUT PRIOR TO THE EMBEDDED SEX MENU
public function sylvieGloryholeSuck():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	//moveTo Gloryhole!
	moveTo("CANADA6");
	if(pc.isBimbo()) output("<i>“So, you taken that hulking cock of yours to the gloryholes yet?”</i> you ask, fluttering your eyelashes seductively at Sylvie.");
	else output("<i>“Have you tried out the gloryholes recently?”</i> you venture.");
	output("\n\n<i>“I go in there for fun sometimes, - ooh, you mean- oooooh! I can be on the other side now! That’s fucking awesome!”</i> Sylvie gasps, clapping her hands to her face.");
	if(pc.isBimbo()) output("\n\n<i>“Uh huh! Let’s go try, I wanna suck your fucking c-”</i>");
	else output("\n\n<i>“Let’s go try it out, then,”</i> you say, offering your hand. <i>“Should be f-”</i>");
	output("\n\nSylvie seizes your hand and ");
	if(pc.tallness < 6*12) output("throws you up on her back with a loud thud and a surprised <i>“oof”</i> issuing from your mouth");
	else output("tugs you out from behind the table before you even get to finish your sentence");
	output(".");
	output("\n\n<i>“Let’s go!”</i> she cheers, leading you past a bunch of clapping and catcalling patrons on your way to the bathrooms.");
	output("\n\n<i>“She’s a feisty one, y’might wanna be careful, kiddo,”</i> an old-timer warns you as you’re dragged on by.");
	if(pc.isBimbo()) output(" You giggle and blow him a kiss, already thinking of Sylvie’s massive rod");
	else output(" <i>Now</i> you feel like a proper spectacle");
	output(".");

	if(pc.isBimbo()) output("\n\n<i>“Do you have sex with like, </i>everyone<i> in the bar?”</i> you ask Sylvie, impressed.");
	else output("<i>“Do you bang everyone who frequents this place?”</i> you joke to Sylvie as she shuts the door behind you.");

	output("\n\n<i>“Just the beautiful ones,”</i> she breathes in your ear before catching you in a deep, passionate kiss with those plush, pliable lips. She’s a charmer, alright. You run a hand through that luxurious straight brown hair of hers, inhaling the heady scent of her perfume and rising pheromones. When you part, she’s flushed and beginning to pant.");

	output("\n\n<i>“Okay, I </i>really<i> need to fuck or get fucked right now,”</i> she sighs forcefully.");

	if(pc.isBimbo()) output("\n\n<i>“Oh! I think the best way to take care of that is with my mouth,”</i> you exclaim, pointing at the glory hole.");
	else output("\n\n<i>“Work the hole then,”</i> you point, walking over and sitting down in front of it.");

	output("\n\nYou hear shuffling on the other side of the wall, then Sylvie’s cockhead pops through with about a foot of meat following behind it. A moment later, her actual head pops over the stall wall along with her hooved forelegs.");

	output("\n\n<i>“It fits!”</i> she exclaims in glee. <i>“I didn’t know if it would!”</i>");

	if(pc.isBimbo()) output("\n\n<i>“Yay!”</i> you cheer, clapping your hands. Wait! You should be using these for putting that juicy penis in your mouth.");
	else output("\n\n<i>“You’re not meant to... oh, whatever,”</i> you sigh, shaking your head at the excited moosegirl. She’s missed the point of a gloryhole, but both of you are still going to have fun and that’s what matters.");
	output(" Directing your attention back to her swollen, bestial cock, you swear under your breath. Was it always this big?");

	output("\n\nThe head is so engorged you’re not even sure it will fit in your mouth. Maybe if you squeeze it down you can compress the spongy flesh enough to get it inside without letting your teeth touch it. Sylvie groans at the gentle contact of your hand, and you decide to get it over with sooner rather than later - lest she get any more erect and the task becomes <i>truly</i> impossible.");

	output("\n\nShe’s so <i>warm</i>. There are probably animals that have less blood flowing in their body than Sylvie does just in her massive cock. You can faintly feel her heartbeat through it with your hands if you wrap your palms around the bottom of the shaft, not to mention hear her happy sighs. She’s very easy to please, really. But you’d rather see her the way she was last time; grunting and groaning in ecstasy as a torrent of cum flows from her prick.");

	output("\n\nTaking a firm hold of the head, you ignore Sylvie’s gasps as you stretch your jaw wide enough for your [pc.lips] to sting and begin attempting to forcefeed yourself her cock. Mouth cruelly distended by the foreign object, you press your tongue hard into the underside of her and pull it further in with some help from your hands.");
	if(pc.isTreated()) output(" You shiver in pleasure when she slips a couple of inches inside, your Treated body rewarding you for doing such a good job for your master. Your eyes roll back in your head when her thick flare pops past your back teeth, conforming to the opening of your throat. This’ll be fun!");
	else output("This is fucking hard! You almost gag when she’s a couple of inches inside, risking losing your precious progress, but manage to fight off the urge. With immense relief, you feel her thick flare pop past your back teeth and conform to the opening of your throat.");

	output("\n\n<i>“Oooooh, that’s a nice combo of tight, warm, and wet,”</i> Sylvie moans, her length shivering in your grip. <i>“You can keep doing that!”</i>");

	if(pc.isBimbo()) output("\n\nYou gurgle happily around her cock, thrilled that she’s enjoying it");
	else output("\n\nGiven how difficult this is, you’re happy she’s appreciating the effort");
	output(". With her already filling your neck out and being squeezed tight, it’s not too difficult to slide a little further down her veiny cock, saliva dribbling down the underside even as pre-cum drizzles down your throat, lubricating her passage.");

	output("\n\nYou take Sylvie down a couple inches at a time, sometimes with your own initiative and sometimes when she groans and reflexively thrusts herself into your face. ");
	if(!pc.isBimbo()) output("Part of you wants to just let her work herself in at her own pace, even though you’re fairly certain it’ll end up just like it did last time you let her do that.");
	else output("Gosh, she should do that more often! You’re giving her all the loving encouragement you can, just waiting for her to take you up on the offer.");

	output("\n\nThe fun comes to an abrupt halt when Sylvie’s medial ring bumps up against your lips. You’re struck by two sudden realizations. One is that you’re not sure that any amount of work is going to get that in your mouth. The other is that you must not even be halfway down her cock yet. Holy shit! You’re suddenly dizzy at the prospect of having to take even more... well, if she can even get it in.");

	output("\n\n<i>“Straighten yourself out,”</i> Sylvie huffs from above you, waving a hoof. <i>“Your neck and back! Ninety degree angle to your hips!”</i>");

	if(pc.isBimbo()) output("\n\nWow, she can really take charge when she wants to. You guess that comes with being an officer of the law and all, but you surprise even yourself with how studiously you follow her instructions, shifting positions and letting her pull you forward on her cock until your lips are pressed right up against the gloryhole in the sloppiest kiss ever.");
	else output("\n\nYou gladly follow her instructions, full of appreciation for the dominant officer taking charge of you. You’re not so great with angles with so much delicious meat in your mouth, but you get what she means. She can’t get her cock balls-deep in your face unless you’re all lined up! She pulls you forward gently until your lips are pressed right up against the gloryhole in the sloppiest kiss ever.");

	output("\n\n<i>“Spread your legs and put your hands out on the wall in front of you outstretched, [pc.name]. Routine procedure, this’ll only take a second,”</i> Sylvie says, and you can <i>hear</i> the grin in her voice.");

	if(!pc.isBimbo()) output("\n\nYou feel a little silly following her every instruction to the letter, but you have to admit it’s pretty fun to play along with her. So caught up in the roleplay are you that you don’t even notice her slowly sliding herself out of your mouth until her fat flare makes its reappearance at the entrance to your throat. Wait, what’s that doing there?");
	else output("\n\nEagerly following her instruction to the letter, you desperately hope this is followed up by a nice reward. Like more of her cock! It’s <i>soooo</i> good, you’d swear you can still taste that mouth-watering pre-cum of hers on your tongue... wait, you can! For some reason, her flare is in your mouth again instead of being in its rightful place: down your throat. That’s confusing.");
	output("\n\n<i>“Hrrnnng-nnnh!”</i> Sylvie grunts in effort, followed by a loud bang against the stall wall that reverberates in your skull and leaves you seeing stars.");

	//Bimbo:
	if(pc.isBimbo())
	{
		if(pc.hasCock() && !pc.hasVagina()) output(" You mindlessly jerk your hips up and down, your [pc.cocks] jetting cum all over the stall wall as your oxygen-starved brain dumps dopamine into your system.");
		else if(pc.isHerm()) output(" You mindlessly jerk your hips up and down, your [pc.cocks] jetting cum all over the stall wall even as your [pc.pussy] tightens up and squirts femjizz all down your [pc.thighs]. Your oxygen-starved brain dumps dopamine into your system as a reward for being such a good cocksleeve.");
		else if(pc.hasVagina()) output(" Your knees bang together even as your [pc.pussy] tightens up and squirts femjizz all down your [pc.thighs], your oxygen-starved brain dumping dopamine into your system.");
		output("\n\nYou’d be all giggly now were it not for the fact your lips are spread around the very impressive base of Sylvie’s lengthy penis, cumvein and all. In fact, you can feel it pulsing and flexing against your lower lip. You’re not one hundred percent on what just happened, but that’s no big deal. The end result is that you have a horsecock buried in your throat and the owner is groaning happily, and you couldn’t ask for anything more.");
	}
	else
	{
		output("\n\nIt takes you a second to register what just happened, but when you do your eyes bulge in helpless alarm. In one thrust, Sylvie drilled herself from tip to base through your lips, leaving her bulging flare somewhere south of your throat. You can dimly hear her groaning in delight, your oxygen-starved brain responding in kind by dumping dopamine into your system. You gurgle around the base of her shaft as if taking pleasure from such treatment is perfectly normal.");
	}
	output("\n\n<i>“Uhhhhnnn, your throat is every bit as good as your asshole...”</i> Sylvie murmurs, drawing back and trapping your face against the wall with the suction. <i>“Wanna fuck it hard.”</i>");
	output("\n\nShe thrusts again and this time you’re sure of it; her rapidly flaring cockhead is actually <i>in</i> your stomach, spurting warm pre-cum against its walls. The thought of it would bring you to your knees were you not already on them, the rhythm of Sylvie’s thrusting angling deeper and deeper until you’re being pressed into the floor with your face upturned to accept her massive cock.");
	output("\n\n<i>“Hooohh, fuck, I’m gonna cum,”</i> Sylvie pants, gritting her teeth. <i>“Nnnnngggghhh-”</i>");
	output("\n\nAcquainted as you are with her cumvein, you get to experience the delight of <i>feeling</i> her orgasm begin, a gigantic load spreading your lips apart as it begins its descent down her throbbing shaft. It squirts into your stomach with such strength you can feel it splattering against your insides, filling you with warmth from within.");
	output("\n\n<i>“Oh, god, yes!”</i> Sylvie wails, throwing her head back and losing herself to her instincts. <i>“Rrrgh! Fuuuck! Nnnnngh!”</i>");
	output("\n\nEach ragged scream of release is accompanied by a cumload of truly giant proportions, every one thicker than the last until you can feel the sheer liquid weight beginning to weigh you down, your stomach expanding slightly. Mercifully, Sylvie begins to slowly pull out, her cock promptly filling the vacated space with more virile semen.");
	output("\n\n<i>“Aaaawww, shit,”</i> she sighs at length, shaking her head in amazement. <i>“That was fucking awesome, [pc.name]. Oops.”</i>");
	output("\n\nHer cock trapped behind your teeth, her sperm is spilling down your front after filling your cheeks to bulging. Tugging it free, a tidal wave of spunk splashes onto your [pc.chest] while you struggle to keep the rest inside. It’s hard to swallow more when you’re already full to the brim, though, and eventually you give up and just let it trickle from your lips and drip down your chin.");
	output("\n\n<i>“You are a fucking angel,”</i> Sylvie says with a smile, having watched the entire situation unfold. <i>“Mind cleaning me up a little?”</i>");
	output("\n\nYou don’t mind at all. In fact, you’re more than happy to do so. You give her entire length little laps and kisses, suckling her cock from every angle until her penis is literally shining with your saliva. With a satisfied moan, she withdraws from the gloryhole and sinks back down to her regular height of nine feet tall. For your part, you hastily clean yourself off with some water and tissues before checking a mirror. Yeah, no, you’re probably going to need a shower or a bath.");
	output("\n\n<i>“You look positively radiant,”</i> Sylvie murmurs from behind you, ");
	if(pc.tallness < 100) output("bending down");
	else if(pc.tallness > 108) output("stretching upwards");
	else output("leaning forwards");
	output(" to nibble your ear a little. <i>“You sexy thing.”</i>");

	output("\n\nYou turn to give her a kiss and she calmly takes your face in her hands, pressing against you and sucking your [pc.tongue] while her lips twitch upwards in a smile. When you part from her embrace, she deliberately licks her lips and winks at you.");
	output("\n\n<i>“We should do this again sometime,”</i> she suggests, jiggling a little in excitement. <i>“I had sooo much fun.”</i>");
	
	var ppSylvie:PregnancyPlaceholder = sylviePP();
	clearMenu();
	
	if(!pc.isBimbo()) 
	{
		output("\n\n<i>“Me too,”</i> you say, sliding a hand over your tummy. <i>“Definitely going to have to sleep this off, though.”</i>");
		output("\n\n<i>“Yeah, no kidding!”</i> Sylvie giggles, unable to help herself. <i>“Sorry about that! I get carried away, I know.”</i>");
		output("\n\n<i>“It’s okay, I knew what I was doing,”</i> you tell her.");
		output("\n\n<i>“Hell yes you know what you’re doing,”</i> she interrupts, suddenly enthusiastic. <i>“You’re a fucking champion of cocksucking, [pc.name]. You should be proud! I don’t think I’ve ever cum that hard in my </i>life<i>.”</i>");
		output("\n\nYou share a laugh, then head back into the bar. Most of the regulars are still there, and you can’t help but flush red when they break into laughter and cheers at the sight of your cum-swollen tummy. Sylvie, on the other hand, stands proud and tall, her virility on display for all to see. You mention you’re going to go sleep off the weight and she gives you another long, deep kiss in front of the crowd before patting your butt and waving you off.");
		output("\n\n<i>“Bye [pc.name]!”</i> she calls from behind you, already settling down for a drink at a table. <i>“Come back soon, lover!”</i>");
		output("\n\nBack at your ship, you collapse onto your bed with shaky legs and stretch out for a moment before relaxing. That <i>was</i> pretty fun... maybe when you wake up you can go back and see if Sylvie’s up for round two.");
		
		addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output("\n\n<i>“Me too!”</i> you say, sliding a hand over your tummy in admiration of her virility. <i>“You filled me with sooo much cum, I love it. Buuuuut...”</i>");
		output("\n\n<i>“But?”</i> Sylvie echoes, looking at you.");
		output("\n\n<i>“Why can’t we just do it again right now?”</i> you ask, putting a finger on your lips in confusion. <i>“Can you not go again at the moment?”</i>");
		output("\n\nSylvie’s eyebrows raise, then she slowly breaks into a smirk.");
		
		addButton(0,"Next",sylvieGloryholeSuckBimboEnd,ppSylvie);
	}
	processTime(70);
	pc.loadInMouth(ppSylvie);
	pc.applyCumSoaked();
	pc.changeLust(20);
	//moveTo("SHIP INTERIOR");
	currentLocation = "SHIP INTERIOR";
}
public function sylvieGloryholeSuckBimboEnd(ppSylvie:PregnancyPlaceholder):void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	
	output("<i>“Nnnnrrrgh, fuck!”</i> she pants, pummeling your face with heavy, deliberate thrusts that send sweat droplets flying from her balls to land on your cum-soaked chest. <i>“Here’s number six, drink up!”</i>");
	output("\n\nHaving foregone the gloryhole idea entirely, you’re pressed up against the back of a toilet gurgling around Sylvie’s fat cock cumming so hard you’re not even really sure where you are right now or what day it is. Nothing is relevant except for the rush of warm seed and endorphins inside you, the moosetaur emptying her quaking testes into your stomach with groans of fulfillment.");
	output("\n\n<i>“Hooo, that hit the spot,”</i> Sylvie huffs, wiping her sweaty brow with the back of a hand as she dismounts. <i>“You sure know how to take care of a girl, [pc.name].”</i>");
	output("\n\nYou nod vaguely, the dizzy euphoria of multiple orgasms still washing through your body. Sylvie peers closer, and you manage to focus your eyes on her flawless face.");
	output("\n\n<i>“How’s that for going again?”</i> Sylvie pants in happiness, flashing you a brilliant smile. <i>“You a bit less thirsty now, babe?”</i>");
	output("\n\n<i>“Uh huuuh,”</i> you croon, giving the woman a dopey smile. <i>“You rock.”</i>");
	output("\n\n<i>“Aww, you’re the best!”</i> she giggles, rubbing your head. <i>“C’mere and I’ll clean you up a bit and you can go rest in your ship, okay?”</i>");
	output("\n\nShe’s so nice! You obediently follow her instructions and let her clean you up with some tissues and water, though there’s nothing she can do about your massive, cum-swollen tummy. She did tell you to rest, though, so you guess you’ll go do that next to be a good [pc.girlBoy].");
	output("\n\nWhen she leads you back into the bar, enough of the patrons that were there when you entered the bathrooms are around that the crowd breaks into laughter and cheering at the sight of you and your obscenely gravid tummy. You’re not really sure what all the fuss is about, but you giggle and blow kisses to the people in the bar as Sylvie ushers you towards your ship.");
	output("\n\nWhen you’re on the boarding ramp, she tugs your arm hard enough to spin you around and send you straight into her cleavage. Giving you a tight hug, she kisses you deeply and passionately, sucking your [pc.tongue] while you play with her nipples through her clothes. When you part, she licks her lips and winks at you.");
	output("\n\n<i>“Now go get some sleep, [pc.name]. Come see me again in the bar soon!”</i> she tells you. <i>“You’re the best off-duty distraction I’ve ever met.”</i>");
	output("\n\nTurning around and blowing you a kiss over her shoulder, she trots back to the bar while you step inside and collapse onto your bed. You <i>should</i> go see her again soon... maybe when you wake up.");
	pc.orgasm();
	pc.orgasm();
	processTime(45);
	pc.loadInMouth(ppSylvie);
	pc.loadInMouth(ppSylvie);
	pc.loadInMouth(ppSylvie);
	pc.loadInMouth(ppSylvie);
	pc.loadInMouth(ppSylvie);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sex] -> [FuckPussy]
//requires 10" dik
//Use with dick-picker function!
public function fuckDickedSylviesPussah(x:int):void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("<i>“How about I show you and that pretty pussy of yours a good time, eh?”</i> you say to Sylvie, leaning in and smiling.");
	output("\n\n<i>“Now you’re sounding local,”</i> she giggles, face flushing a little more than it already was. <i>“Fuck yeah, you can show me and my pussy a good time. If you can handle this much meat, </i>" + pc.mf("stallion","stud") + "<i>.”</i>");
	output("\n\nShe turns and walks towards the bath, massive hips swaying with every step as if your eyes weren’t already glued to the generous curves of her ass. You follow her in a trance, your [pc.cocks] hardening when you step into the pheromones left in her wake. Between her bushy little tail flitting from side to side and her incredible scent, you’re left half-hypnotized as she leads you to the baths. You regain “consciousness” when Sylvie gently closes the door behind you, turning and pausing in front of you.");
	moveTo("CANADA7");
	output("\n\n<i>“You ready to make good on that promise, [pc.name]?”</i> she asks, smiling.");
	output("\n\n<i>“Hell yes,”</i> you reply automatically, moving on instinct. You run your fingers through her soft fur down her back, stopping at her shapely butt to give it a nice spank. <i>“Get yourself pressed up against that wall and spread your legs for me, Sylvie.”</i>");
	output("\n\n<i>“Ooh, yes </i>" + pc.mf("sir","ma’am") + "<i>,”</i> she murmurs hotly, trotting to the wall and immediately following your instructions, turning her torso half-back to gaze at you. <i>“When do I get my reward?”</i>");
	output("\n\n<i>“All things in good time,”</i> you tell her, stepping up behind her. <i>“Gotta inspect the goods first.”</i>");
	output("\n\nWith Sylvie’s equipment on full display, you take a second to admire her plush, poundable pussy. It’s all puffed up in anticipation of taking your dick, flushed purple and looking softer than velvet. You’re seized with the sudden urge to just bury your face in it, but that’s not what she’s looking for right now. Standing behind her, all you can see of her maleness is the two heavy, swaying balls between her legs - her giant cock is evidently so erect it’s tucked tightly under her stomach out of view. The instant you put your hands on her tight haunches in preparation, Sylvie has a moment.");
	output("\n\n<i>“Uunnh,”</i> she moans softly, juice spurting from her quivering pussy onto the floor followed by a steady flow down her thighs and underbelly.");
	output("\n\n<i>“Whoa, girl,”</i> you murmur, impressed. <i>“Better not keep you waiting, eh?”</i>");
	output("\n\n<i>“Pleeeaase,”</i> she begs.");

	var cumQ:Number = pc.cumQ();
	if(pc.isTaur()) 
	{
		output("\n\nBetween the room rapidly filling with sex pheromones and your animal instincts screaming at you, you’re <i>beyond</i> ready to fuck Sylvie. You’ve got to treat a girl like her right, though, and that means one thing: fucking her needy cunt as hard as possible right from the word ‘go’.");
		output("\n\nRearing up and landing on Sylvie’s back, you’re hardly acquainted with Sylvie’s lush fur before you’re scrabbling to get yourself aligned. The moment you feel your [pc.cock " + x + "] catch on her lips, you shove forward so violently the moosegirl’s upper half squishes against the wall.");
		output("\n\n<i>“Oh, fuck yes!”</i> she cries out, shivering in pleasure underneath you. <i>“Take me, you fucking beast!”</i>");
		output("\n\nAlready buried balls-deep in the warmth of her tight, wet cunt, you brace yourself and rock backwards before thrusting into her again, earning a high-pitched scream of ecstasy. You pound her squirting pussy like your life depends on it, each penetration bringing Sylvie to what must be one of the fastest orgasms you’ve ever given someone.");
		pc.cockChange();
		output("\n\n<i>“Cumming- I’m cuhhh! Nnnnhhh!”</i> Sylvie pants breathlessly, her entire body tensing up like a coil.");
		output("\n\nYou grunt in pleasure when you feel her pussy walls squeeze down on you so hard they threaten to bring your humping to a grinding halt, but power through it to keep fucking. You ride Sylvie like a champion through her entire orgasm, her voice rising octaves until you think glass would shatter if there was any nearby. Finally, it breaks, and she’s left with her torso turned half-sideways smushed against the wall with her lips spread wide in a silent scream of ecstasy.");
		output("\n\nYou allow yourself a momentary lapse just to smugly soak in the view; the proud, beautiful moosegirl subdued and gasping for air all because she’s getting her cunt hammered by a real stud. To her credit, she manages to stay standing instead of wilting underneath your powerful thrusts, getting the full experience for her efforts.");
		output("\n\n<i>“You like it rough, huh Sylvie?”</i> you pant, sweat flying from your body while you rock her world.");
		output("\n\nYou think her gaze flicks to you for a moment, registering the sound of her name being spoken, but honestly it’s hard to tell. With her hair flying everywhere and body shaking like a leaf in a hurricane, she’s so caught up in the experience you’re not sure she can hear anything right now.");
		output("\n\nA single, breathless whimper of surprise is all the signal you get before she cums from her second sex, her hips instinctively bucking and jerking beneath you as her cock spurts thick, creamy jizz all over the wall. Determined to force her to completely empty herself, you time your pumping with her own, getting as deep in her slick passage as possible.");
		output("\n\nSylvie finally gets her voice back midway through her male orgasm, but all that comes out of her mouth is horny, bestial grunting as you drive her towards the limits of pleasure. It’s honestly a miracle she hasn’t passed out - this is easily the hardest you’ve ever fucked someone, and you find yourself in disbelief anyone could even withstand it. But you suppose if there were somebody who could, it would be Sylvie.");
		output("\n\nWhile Sylvie’s busy moaning and groaning in subdued joy, you finally find yourself reaching your limits, fatigue taking ahold of your limbs. Maybe you should slow down.");
		//[Go slow] [NO!]
		processTime(20);
		clearMenu();
		addButton(0,"Go Slow",taurFuckDickSylvieSlow);
		addButton(1,"NO!",noSlowTaurFuckingDickSylvie);
	}
	//Nontaur
	else
	{
		output("\n\nBetween the room rapidly filling with sex pheromones and your swollen dick");
		if(pc.cockTotal() > 1) output("s");
		output(", you’re <i>beyond</i> ready to fuck Sylvie. You’ve got to treat a girl like her right, though, and that means one thing: fucking her needy cunt as hard as possible right from the word ‘go’.");
		output("\n\nStanding behind Sylvie, you’re barely even acquainted with the short fur of her rear before you’re shuffling desperately to get yourself aligned. The moment you feel your [pc.cock " + x + "] catch on her lips, you shove forward so violently the moosegirl’s upper half squishes against the wall.");
		output("\n\n<i>“Oh, fuck yes!”</i> she cries out, shivering in pleasure. <i>“Take me, you fucking animal!”</i>");
		output("\n\nAlready buried balls-deep in the warmth of her tight, wet cunt, you brace yourself and rock backwards before thrusting into her again, earning a high-pitched scream of ecstasy. You pound her squirting pussy like your life depends on it, each penetration bringing Sylvie to what must be one of the fastest orgasms you’ve ever given someone.");
		pc.cockChange();
		output("\n\n<i>“Cumming- I’m cuhhh! Nnnnhhh!”</i> Sylvie pants breathlessly, her entire body tensing up like a coil.");
		output("\n\nYou grunt in pleasure when you feel her pussy walls squeeze down on you so hard they threaten to bring your humping to a grinding halt, but power through it to keep fucking. You ride Sylvie like a champion through her entire orgasm, her voice rising octaves until you think glass would shatter if there was any nearby. Finally, it breaks, and she’s left with her torso turned half-sideways smushed against the wall with her lips spread wide in a silent scream of ecstasy.");
		output("\n\nYou allow yourself a momentary lapse just to smugly soak in the view; the proud, beautiful moosegirl subdued and gasping for air all because she’s getting her cunt hammered by a real stud. To her credit, she manages to stay standing instead of wilting underneath your powerful thrusts, getting the full experience for her efforts.");
		output("\n\n<i>“You like it rough, huh Sylvie?”</i> you pant, sweat flying from your body while you rock her world.");
		output("\n\nYou think her gaze flicks to you for a moment, registering the sound of her name being spoken, but honestly it’s hard to tell. With her hair flying everywhere and body shaking like a leaf in a hurricane, she’s so caught up in the experience you’re not sure she can hear anything right now.");
		output("\n\nA single, breathless whimper of surprise is all the signal you get before she cums from her second sex, her hips instinctively bucking and jerking beneath you as her cock spurts thick, creamy jizz all over the wall. Determined to force her to completely empty herself, you time your pumping with her own, getting as deep in her slick passage as possible.");
		output("\n\nSylvie finally gets her voice back midway through her male orgasm, but all that comes out of her mouth is horny, bestial grunting as you drive her towards the limits of pleasure. Keeping up the pace, you’re suddenly surprised when her front half buckles, her hindlegs skidding around until you’re being borne to the floor with her.");
		output("\n\n<i>“You- you okay?”</i> you pant, still rock-hard and hovering at her sopping entrance.");
		output("\n\n<i>“Fine, just- slipped is all,”</i> Sylvie gasps, catching her breath. <i>“I’m oka- nnnnnfffh! Nnngh!”</i>");
		output("\n\nYou don’t wait for further information, thrusting yourself straight to the hilt in the middle of her sentence. Her pussy reflexively squeezes down on you, trying to halt your progress, but to no avail. All she accomplishes is a wet, tight massage around the grooves of your cock, perfectly conformed to its shape.");
		output("\n\n<i>“Oh ffff</i>uck<i> you’re so hard!”</i> she cries, hands splayed on the wall in front of her. <i>“God </i>damn<i>!”</i>");
		output("\n\nIn an impressive display of flexibility, Sylvie’s back arches to the point where her humanoid torso is stretched out over her cervine half, her massive breasts almost concealing her face as she bounces in ecstasy, screaming for more. Determined to give her the full experience she asked for, you slam your hips into her butt so hard her expansive hindquarters lift an inch every time you pound her.");
		output("\n\nShe doesn’t even announce her next orgasm, too busy panting and moaning in delirious lust, but you definitely feel it. The way sbe’s wrapped around you, your own isn’t far off; as far as her pussy is concerned, she’s been begging for your cum inside her the moment you started fucking.");
		output("\n\n<i>“S-Sylvie,”</i> you pant in exertion, <i>“gonna cum real soon!”</i>");
		output("\n\n<i>“Yesyesyesyesyes!”</i> she screams, pushing back against you as best she can. <i>“Inside! Cum inside!”</i>");
		output("\n\nWith a strained grunt, you bury yourself as deep as you can inside her spasming cunt and blow a massive load into her depths. You give her everything and then some and she takes it like a champion, squirting down your cock and groaning all the while. Droplets of sweat and femjizz drip from your ");
		if(pc.balls == 0) output("dick");
		else output("[pc.balls]");
		output(" and Sylvie’s alike while you pump her full, enjoying the way she backs her big butt right up against your thighs.");
		if(cumQ < 5000) output("\n\nShe gives you a sweet smile with half-lidded eyes when you try to pull out, struggling a little to extricate yourself while she squeezes down as hard as she possibly can. You both moan a little when you finally pop free, Sylvie’s juices splashing to the floor. Of your cum, there’s no sight; you came in her too deep for it to spill out. She wiggles her hips a little and gives you a tempting wink from both ends.");
		else if(cumQ < 15000) output("\n\nShe gives you a sweet smile with half-lidded eyes when you try to pull out, struggling a little to extricate yourself while she squeezes down as hard as she possibly can. You both moan a little when you finally pop free, Sylvie’s juices splashing to the floor. A dribble of cum follows, rolling down her sizeable balls and dripping down. The rest is stuffed deep in her nethers, keeping her warm from the inside. She wiggles her hips a little and gives you a sultry wink from both ends.");
		else if(cumQ < 25000) output("\n\nShe gives you a sweet smile with half-lidded eyes when you try to pull out, struggling a little to extricate yourself while she squeezes down as hard as she possibly can. You both moan a little when you finally pop free, Sylvie’s juices splashing to the floor. A river of cum follows, flowing down her rear end and balls to drip from her flagging cock as if it were her own. The rest is stuffed deep in her nethers, keeping her warm from the inside. She wiggles her hips a little and gives you a sultry wink from both ends, squirting some of your cum onto the floor.");
		else 
		{
			output("\n\nShe gives you a sweet smile with half-lidded eyes when you try to pull out, struggling a little to extricate yourself while she squeezes down as hard as she possibly can. You both moan a little when you finally pop free, Sylvie’s juices splashing to the floor. A torrent of spunk follows, gushing from her stuffed-full pussy until the flow finally recedes to a river, rolling down her rear to her balls and dripping from her flagging cock as if it were her own. The rest is stuffed deep inside, swelling her tummy a little bit and making the moosegirl look like she might be expecting.");
			output("\n\n<i>“Awww, what a waste,”</i> she laments, looking at all the cum pooling on the ground. <i>“After you did </i>such<i> a good job of putting it so deep inside me, too.”</i>");
		}
		output("\n\n<i>“That’s a good look on you,”</i> you tell her, nodding at her ");
		if(cumQ >= 15000) output("cum-covered ");
		output("ass and tummy. <i>“Enhances your natural beauty ‘n all.”</i>");
		output("\n\n<i>“Aww, thank you!”</i> Sylvie says, smiling wide and giving you a flourish of her extraordinary hips. <i>“So nice of you to say. Care to rinse off together and join me in the baths to get all cleaned up?”</i>");
		output("\n\nSounds good.");
		//[Next] -> postBathsVaginal}
		processTime(35);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",postBathsSylvie);
	}
}

//[Go slow]
public function taurFuckDickSylvieSlow():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("You gradually slow down, letting Sylvie ride out the last few intense shakes of her orgasm while your legs and hips thank you for your decision.");
	output("\n\n<i>“Oohhhh,”</i> Sylvie moans like a whore. <i>“Oohhh, </i>gawd<i>. [pc.name]...”</i>");
	output("\n\n<i>“Having a good time yet?”</i> you puff, fucking her nice and slowly with long, deep thrusts.");
	output("\n\n<i>“For a while- unh! I thought I was going to fly away,”</i> she gasps, finally meeting your eyes before closing her own in pleasure. <i>“Ooh! But this isn’t so bad either...”</i>");
	output("\n\nWith a couple of minutes of well-timed and well-placed thrusts, you have a breathless Sylvie right on the verge of another orgasm, and you’re almost there yourself. You can feel her sensitive clit pulsing against your cumvein, as if encouraging you to empty yourself inside her. Taking advantage of your positions, you press yourself down into her and rub your cock against her clit until she can’t hold it any longer.");
	output("\n\n<i>“Ooh, I’m gonna cum!”</i> she wails, shuddering violently. <i>“Buh- both-”</i>");
	output("\n\nIt only takes you a second to figure out what she’s talking about when her pussy clamps down on you once more even as you hear the gush of cum splurting explosively from her dick. She flexes her expansive hindquarters on instinct, and that’s all you needed. With a strained grunt, you bury yourself as deep as you can inside her spasming cunt and blow a massive load into her depths.");
	output("\n\n<i>“Oh, yessss,”</i> she croons, still shaking in orgasm herself. <i>“Give me aaaalll that cum you’ve been saving up, baby. I’ve been so good.”</i>");
	output("\n\nYou give her everything and then some and she takes it like a champion, squirting down your cock and groaning all the while. Droplets of sweat and femjizz drip from your ");
	if(pc.balls == 0) output("dick");
	else output("[pc.balls]");
	output(" and Sylvie’s alike while you pump her full, enjoying the way she nuzzles her big butt right up against your legs.");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 5000) output("\n\nShe gives you a sweet smile with half-lidded eyes when you try to pull out, struggling a little to extricate yourself while she squeezes down as hard as she possibly can. You both moan a little when you finally pop free, Sylvie’s juices splashing to the floor. Of your cum, there’s no sight; you came in her too deep for it to spill out. She wiggles her hips a little and gives you a tempting wink from both ends.");
	else if(cumQ < 15000) output("\n\nShe gives you a sweet smile with half-lidded eyes when you try to pull out, struggling a little to extricate yourself while she squeezes down as hard as she possibly can. You both moan a little when you finally pop free, Sylvie’s juices splashing to the floor. A dribble of cum follows, rolling down her sizeable balls and dripping down. The rest is stuffed deep in her nethers, keeping her warm from the inside. She wiggles her hips a little and gives you a sultry wink from both ends.");
	else if(cumQ < 25000) output("\n\nShe gives you a sweet smile with half-lidded eyes when you try to pull out, struggling a little to extricate yourself while she squeezes down as hard as she possibly can. You both moan a little when you finally pop free, Sylvie’s juices splashing to the floor. A river of cum follows, flowing down her rear end and balls to drip from her flagging cock as if it were her own. The rest is stuffed deep in her nethers, keeping her warm from the inside. She wiggles her hips a little and gives you a sultry wink from both ends, squirting some of your cum onto the floor.");
	else 
	{
		output("\n\nShe gives you a sweet smile with half-lidded eyes when you try to pull out, struggling a little to extricate yourself while she squeezes down as hard as she possibly can. You both moan a little when you finally pop free, Sylvie’s juices splashing to the floor. A torrent of spunk follows, gushing from her stuffed-full pussy until the flow finally recedes to a river, rolling down her rear to her balls and dripping from her flagging cock as if it were her own. The rest is stuffed deep inside, swelling her tummy a little bit and making the moosegirl look like she might be expecting.");
		output("\n\n<i>“Awww, what a waste,”</i> she laments, looking at all the cum pooling on the ground. <i>“After you did </i>such<i> a good job of putting it so deep inside me, too.”</i>");
	}
	output("\n\n<i>“That’s a good look on you,”</i> you tell her, nodding at her");
	if(cumQ >= 15000) output(" cum-covered");
	output(" ass and tummy. <i>“Enhances your natural beauty ‘n all.”</i>");

	output("\n\n<i>“Aww, thank you!”</i> Sylvie says, smiling wide and giving you a flourish of her extraordinary hips. <i>“So nice of you to say. Care to rinse off together and join me in the baths to get all cleaned up?”</i>");
	output("\n\nYou would.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	//[Next] -> postBaths
	addButton(0,"Next",postBathsSylvie);
}

//[NO!]
public function noSlowTaurFuckingDickSylvie():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("Fuck slowing down, you’re going to ride this bitch until she’s unconscious. Grabbing ahold of her hair, you pull it hard enough to make her bend over backwards to face you and pump her so hard her juices begin to spray from her pussy around your cock, coating your underside. Ignoring the pain emanating from your muscles, you watch Sylvie’s face as she watches yours, her eyes wide in shocked pleasure until a particularly well-angled thrust makes them roll back in her head a little.");
	output("\n\n<i>“Unh,”</i> she groans, a tiny telltale indication before she cums from her pussy again, her back legs standing rigid as she reflexively tenses her body from tip to tail, helpless before the waves of pleasure rolling through her. You lean down and whisper naughty things in her ear and she listens wide-eyed and panting, the spasming of her cunt only getting more intense as you fill her pretty head with fantasies.");
	output("\n\nBefore she’s even finished with her orgasm, you make her cum from her cock again. The overlap of sensations makes shudder so hard you have to cling tightly so you’re not bucked off, fucking her to the hilt all the while. Her breath comes in halting, strained gasps, her exhales more like an animal’s grunt of pain, every bit of her tensing and relaxing over and over while she tries to control herself. Finally, though, she loses her battle.");
	output("\n\nYou feel her pussy slacken then convulse, heralding yet another orgasm just a few scant seconds after finishing with the last. Femcum squirts down your length while the woman in front of you appears to be on the verge of unconsciousness, your sexual stamina reaching its limit. With a grunt, you bury yourself balls-deep inside the quivering moosegirl’s cunt and blow your load.");
	output("\n\n<i>“Oh, yesssss, inside,”</i> she moans lightly. <i>“Yeeesssss...”</i>");
	output("\n\nA dopey smile crosses her face while she backs up into you, nuzzling your hindlegs with her big soft butt to ensure you’re as deep as you can get inside her. With that, you realize she’s passed out while still standing, cumming while unconscious. Looks like you’ve won your little “competition”.");
	if(!pc.isTreated())
	{
		output(" You’re still wearing a smug smirk when you pass out on top of her not even five seconds later, faceplanting between her human hips.");
		output("\n\nYou’re woken by a gentle lick on your cheek, opening your eyes to find a smiling Sylvie still underneath you, turned to face you.");
		output("\n\n<i>“Hello, lover. Think you can manage to pull out on your own? Not that I mind having you on top of me - in fact I rather like it - but I think we should bathe sooner, rather than later.”</i>");
		output("\n\n<i>“Oog,”</i> you grunt, shaking your head to clear it. <i>“Right, good idea.”</i>");
	}
	else 
	{
		output("\n\nThe only reason you’re not passed out on top of her is your Treated stamina, endowing you with the endurance of a demigod. You patiently wait out both of your orgasms - figuring it’d be rude to end her fun - before dismounting and gently pulling the snoozing ‘taur upright to wake her.");
		output("\n\nWhen she’s properly reoriented with the world, she asks if you’d like to join her for rinsing off and then a bath. Given your state, you think you would.");
	}
	processTime(15);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",postBathsSylvie);
	//[Next] -> postBaths
}

//[postBathsVaginal]
public function postBathsSylvie():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("<i>“Hoooo, this is nice,”</i> Sylvie sighs, the two of you unwinding in the baths after your frenzied fuckathon. She leans back and relaxes, turning her head and gazing at you with hooded eyes. <i>“I haven’t been fucked like </i>that<i> since those New Texas boys rolled through.”</i>");
	if(pc.isBro() && pc.isTreated()) 
	{
		output("\n\n<i>“Got a little bit of New Texas in me myself,”</i> you say, tapping your chest.");
		output("\n\n<i>“Ooh, I thought so!”</i> Sylvie says excitedly. <i>“There’s just something about the way you Treated boys smell... makes me wanna just spread my legs and get my fucking pussy pounded.”</i>");
	}
	else
	{
		output("\n\n<i>“Glad to be of service,”</i> you say modestly.");
		output("\n\nShe snorts in mirth. <i>“I got fucking serviced alright. We’re definitely going to do </i>this<i> again.”</i>");
	}
	output("\n\n<i>“Could always go again now,”</i> you offer, and Sylvie laughs.");
	output("\n\n<i>“If only, babe,”</i> she says, smiling. <i>“I’ve got a job to do out there, though. Otherwise we’d still be in the room.”</i>");
	output("\n\nShe hums thoughtfully. <i>“Maybe I should take a couple days vacation...”</i>");
	output("\n\nYou spend the rest of the time in the baths chatting companionably, flirting and occasional touching each other just for fun. After the two of you get dressed together, Sylvie gives you a big kiss before you see her off back to her job as a policewoman. Come to think of it, you feel sorry for any criminal that gets on her bad side. You can only imagine how she’ll “punish” them now...");
	//Back to menu, in baths
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sex] -> [TakeVaginal]
//Can’t be pregnant.
public function catchFutaSylviaVaginally():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	var x:int = rand(pc.totalVaginas());
	output("<i>“So, now that you’ve got a big, fat, juicy horsecock swinging between those legs of yours, Sylvie,”</i> you say, slowly running a finger over your [pc.lipsChaste] and letting it hang on your lower lip, <i>“do you wanna see if you can fit all of it in my pussy?”</i>");
	output("\n\n<i>“Well, this rock-hard erection you just gave me talking like that isn’t gonna go away unless I do, so...”</i> Sylvie says.");
	output("\n\n<i>“Oh, good,”</i> you sigh in apparent satisfaction. <i>“I was worried I might not get to feel that beautiful rod stretching me taut, or that soft, plump flare of yours pressing up against my womb. Maybe, if I’m </i>really<i> lucky,”</i> you continue, leaning over the table and looking into Sylvie’s eyes, <i>“I might even get to feel those bulging balls of yours pressed against my ass while they pump me full.”</i>");
	if(!pc.isTaur()) output("\n\n<i>“Woowww, [pc.name],”</i> Sylvie murmurs, smirking devilishly. <i>“If you want it like </i>that<i>, you’re gonna fucking get it, missy. Get that sexy butt of yours up off that chair and down on a bed with your legs behind your head </i>pronto<i>. I’m gonna fuck your little pussy into next week.”</i>");
	else output("\n\n<i>“Woowww, [pc.name],”</i> Sylvie murmurs, smirking devilishly. <i>“If you want it like </i>that<i>, you’re gonna fucking get it, missy. Get that sexy butt of yours up off the ground, we’re going to a room </i>pronto<i>. I’m going to fucking pound your naughty cunt until you can’t walk without winking.”</i>");
	output("\n\nIn the room, Sylvie takes charge.");
	moveTo("CANADA9");
	//nontaur:
	if(!pc.isTaur())
	{
		output("\n\n<i>“Spread those legs, Steele, I wanna see that tight little pussy of yours before I fucking destroy it,”</i> she purrs, pushing you down on the bed.");
		if(!pc.isCrotchExposed()) output("\n\nYou hastily throw everything you’re wearing below your waist to the ground, and barely have time to strip off your top before she’s pulling you down the bed and onto her face");
		else output("\n\nYou don’t even have time to look up at her before she’s pulling you down the bed and onto her face");
		output(". She sucks [pc.oneClit] hard enough to make you groan out loud in pleasure, running your hands through her luscious brown hair before you alight upon the wonderful idea of holding her impressive antlers like they’re handlebars.");
		output("\n\nTaking your cue, she all but buries her tongue into your wet, needy muff while you rub your clit on her little button nose, moaning in delight. You get off almost immediately, femcum dribbling down Sylvie’s chin while she laps all of you up, tongue-teasing your clitty while you hump her face in the throes of orgasm. You fall back on the bed with limbs splayed, already panting.");
		output("\n\n<i>“Now that’s the look of a satisfied customer,”</i> Sylvie says, licking her lips clean. <i>“You just lie there and let me get lined up.”</i>");
		output("\n\nRearing up on her forelegs and planting herself on either side of your head, you suddenly feel very enclosed. The only things in your vision are Sylvie’s lush, furry underside and the huge, angry-looking horsecock resting between your [pc.breasts]. Seized by lust, you lean down to give it a quick kiss of blessing before she drags it down your body to align her fat, ridged flare with your [pc.pussy " + x + "].");
		output("\n\n<i>“Oooh fuck I’m gonna blow your little biped form up like a blimp,”</i> Sylvie pants, halting at your dripping entrance. <i>“You won’t be able to go </i>anywhere<i> without thinking of me, dripping spunk down those thighs of yours!”</i>");
		output("\n\nWith an aggressive grunt, Sylvie violently bucks her powerful hips and sinks her massive cock right to the hilt. You instinctively recoil, your back arching so sharply your stomach presses against Sylvie’s underside as the pleasure rushes through your body. <i>Fuck, she’s so big!</i> You find yourself desperately clutching onto her fur, trying to retain some sense of control.");
		
		pc.cuntChange(x, sylvieCockVolume());
		
		output("\n\n<i>“Wow, you weren’t ready for that one, were you?”</i> Sylvie purrs, slowly drawing herself back and taking the time to luxuriate in the uncontrollable spasming of your folds as you desperately squeeze down on her. <i>“No time to rest, though.”</i>");
		output("\n\n<i>“Ooooohhhhh, god! Sylvie!”</i> you cry, juices squirting from around Sylvie’s turgid rod when she thrusts it back in. <i>“Oh my god!”</i>");
		output("\n\n<i>“Goddess,”</i> she smugly corrects you, leaning downwards on her forelegs. <i>“Now fucking lie there and take my blessing.”</i>");
		output("\n\nWithout waiting for a response, she bears down and begins slowly pounding you, the weight of her entire bulk behind each loud, squelching thrust. Your cries get louder and deeper with every slap of Sylvie’s gigantic balls off your [pc.ass], her soft flare pressing right up against your womb and giving it a sloppy wet kiss. You can already feel her squirting pre-cum inside you, her cocknozzle comfortably wedged right against your cervix for easy passage. Your eyes rolling back in your head, you can hardly comprehend the sensations Sylvie is subjecting you to.");
		output("\n\nShe doesn’t give you time to dwell on them, grunting with effort as she begins to fuck you faster, sending you scrambling to grasp the bed with one tightly clutched hand so she doesn’t accidentally pick you up and suspend you on her prodigious prick. You can scarcely weather the rough pounding of your sopping cunt, being stretched to its absolute limit by the sheer size of Sylvie’s swollen dick. You hardly even get the chance to catch your breath, and when you do it comes out in wordless groans of bliss or shuddering, gasping pants.");
		output("\n\n<i>“Guuuuh! Sylvie!”</i> you cry, eyes squeezed shut. <i>“Sylvie, Sylvie, Sylvie!”</i>");
		output("\n\n<i>“That’s right, scream my fucking name!”</i> Sylvie tells you, rearing back for a particularly violent thrust that sends you a few inches up the bed. <i>“Beg me to cum inside that little womb of yours!”</i>");
		output("\n\n<i>“C-cum,”</i> you gasp, already doing so yourself. <i>“Nnnn-hhnngh!”</i>");
		output("\n\nWith a triumphant scream of conquest, Sylvie lunges forward so far her throbbing cock pins you against the headboard of the bed and holds you there. You feel a <i>massive</i> blossom of warmth inside you, Sylvie’s cock rippling from base to tip as she begins to dump the truckloads of sticky jizz held in her pulsing balls.");
		output("\n\n<i>“Oohhhhhhhhh, god daaamn,”</i> Sylvie groans, bucking you against the bed with each thrust of her hips. <i>“Oh, you feel fucking amazing. Keep squeezing, baby, that’s the way.”</i>");
		output("\n\nYou couldn’t stop if you tried. With her equine cocknozzle plugging up your cervix, all you can feel is the orgasmic sensation of your womb being filled, over and over. By the time she slowly - very slowly - pulls herself out of you, Sylvie’s followed through on her promise. You’re going to be walking around with a “baby bump” for quite some time. For her part, she looks ecstatically smug.");
		output("\n\n<i>“Ho hooo, look at yooouuu,”</i> Sylvie croons, seating herself in front of your panting, sweaty form.");
		if(pc.biggestTitSize() > 5) output(" <i>“Good thing you got those giant, suckable titties to make yourself look like a believable mommy, huh?”</i>");
		output("\n\nShe brings her face closer to yours, gazing into your eyes and smiling deeply as she runs her fingers over your taut, swollen stomach.");
		output("\n\n<i>“You look as sexy now as you sounded during the act,”</i> Sylvie murmurs in your ear, moving close enough to rest her gigantic breasts on your tummy. <i>“I really like you like this, sweaty and full of my cum. And that expression,”</i> she sighs, softly rubbing her thumb across your lower lip. <i>“To die for. Just makes me want to stick it in another hole of yours and start humping...”</i>");
		output("\n\n<i>“I think you’ve humped my holes enough for one day,”</i> you moan quietly, leaning back against the headrest with your eyes closed and just enjoying her attention. <i>“God damn...”</i>");
		output("\n\n<i>“Everything you wanted and more, huh?”</i> Sylvie says, and even without opening your eyes you can see the smug smile on her face. <i>“I don’t think you’ll be fucking any fellow bipeds any time soon, [pc.name]. They won’t even touch your fucking walls after the way I ruined your pretty little cunt...”</i>");
		output("\n\nYou feel her other hand surreptitiously slip down to your overtaxed pussy, still weakly clenching and letting huge, sticky load after load spill from between your thighs. Unable to resist, you moan when you feel her gently stretch your folds apart, exposing your sex and forcing you to helplessly squeeze out a huge load of Sylvie’s jizz all over her prying fingers.");
		output("\n\n<i>“Open up,”</i> she whispers, and you suddenly find two spunk-soaked fingers pushing into your mouth.");
		output("\n\nFor some reason, you don’t mind at all. You softly suck her fingers clean, Sylvie’s breath hot on your flushed face while you tongue her hand off. Her dainty digits are pulled from your mouth only to be immediately replaced by her warm, wet tongue wrapping around your own, pulling you into a deep, slow, kiss.");
		output("\n\n<i>“Mmmmf,”</i> Sylvie moans into your mouth, running a hand ");
		if(pc.hasHair()) output("through your [pc.hairNoun]");
		else output("along your cheek");
		output(" and whispering between every kiss.");
		output("\n\n<i>“We should - mm - do this - mmn - more often,”</i> she whispers. <i>“I want to keep you pumped full all the time, until it takes...”</i>");

		if(StatTracking.getStat("pregnancy/total births") < 40) 
		{
			output("\n\n<i>“If you’re that good </i>every<i> time...”</i> you murmur back, letting the sentence hang in the air as a tantalizing treat for Sylvie.");
			output("\n\n<i>“You teeeaaase,”</i> she admonishes you gently, pinching your nose softly before kissing you again. <i>“Let’s go get you washed up, [pc.name].”</i>");
		}
		else
		{
			output("\n\n<i>“Please tell me that’s a promise,”</i> you murmur back, hooding your [pc.eyes]. <i>“I’ll come back here as often as I can so you can fuck me full of your hot spunk until I have your beautiful kids. And then,”</i> you continue, watching Sylvie’s reaction, <i>“I’ll spread my legs and you can start all over again.”</i>");
			output("\n\n<i>“Oho, you </i>like<i> that idea, don’t you? I know a few studs that would love a woman like you as a breeder...”</i> she leans in, pressing her nose lightly against yours. <i>“Present company included.”</i>");
			output("\n\n<i>“You are </i>quite<i> the stud,”</i> you agree, smiling. <i>“With your new equipment, you might need someone around to take the load off. Ease your burden.”</i>");
			output("\n\n<i>“You can take my load any time you like, girl,”</i> Sylvie says with a grin, pecking you on the lips. <i>“For now though, let’s get you washed up, [pc.name].”</i>");
		}
	}
	//taur:
	else
	{
		output("\n\n<i>“Up against the wall and spread those thick hindlegs of yours, Steele, I wanna see that sexy little pussy of yours before I fucking destroy it,”</i> she purrs, hands on your flank.");
		if(!pc.isCrotchExposed()) output("\n\nShe’s tugged your undergarments off before you even have time to follow her instructions, and the moment you do she’s got her face buried underneath your tail and in your muff");
		else output("\n\nYou’ve barely even followed the instructions before she’s got her face buried underneath your tail and in your muff");
		output(". She hones in on [pc.oneClit] immediately, rolling it across her tongue before sucking on it hard enough to make you groan out loud in pleasure, instinctively lifting one leg to allow her easier access.");
		output("\n\nTaking your cue, she all but buries her tongue into your wet, needy cunt while you rub your clit on her little button nose, moaning in delight. You get off almost immediately, femcum dribbling down Sylvie’s chin while she laps all of you up, tongue-teasing your clitty while you hump her face in the throes of orgasm. You groan and hang your head against the wall, the aftershocks still running up and down your body.");
		output("\n\n<i>“Mmm, that’s the taste of a mare in heat if I’ve ever known it,”</i> Sylvie says, licking her lips clean as she rises. <i>“Hold still, [pc.name]. I’ll have you satisfied in no time.”</i>");
		output("\n\nRearing up on her forelegs and landing on your back with a heavy impact, you suddenly feel very enclosed. You twist your torso back a little to look, only to be seized by Sylvie from behind. Upturning your face, she kisses you upside down while wiggling her hindquarters to get her fat, ridged flare aligned with your [pc.pussy " + x + "].");
		output("\n\n<i>“Ooooh fuck I’m gonna leave you looking like a goddamn broodmare,”</i> Sylvie pants, pulling away and halting at your dripping entrance. <i>“You won’t be able to go </i>anywhere<i> without thinking of me, dripping spunk down that sexy ass of yours!”</i>");
		output("\n\nWith an aggressive grunt, Sylvie violently bucks her powerful hips and sinks her massive cock right to the hilt.");
		
		pc.cuntChange(x, sylvieCockVolume());
		
		output("\n\nYou instinctively recoil, your back arching so sharply you push Sylvie’s torso backwards with you before she catches you, holding you in her very generous bosom. <i>Fuck, she’s so big!</i> You find yourself desperately reaching backwards to clutch her forelegs, trying to retain some sense of sanity, but there’s no escape from the way she’s irresistibly spreading you open.");
		output("\n\n<i>“Wow, you weren’t ready for that one, were you?”</i> Sylvie purrs, slowly drawing herself back and taking the time to luxuriate in the uncontrollable spasming of your folds as you desperately squeeze down on her. <i>“No time to rest, though.”</i>");
		output("\n\n<i>“Ooooohhhhh, god! Sylvie!”</i> you cry, juices squirting from around Sylvie’s turgid rod when she thrusts it back in. <i>“Oh my god!”</i>");
		output("\n\n<i>“Goddess,”</i> she smugly corrects you, repositioning herself at your cunt’s sloppy entrance. <i>“Now fucking stand there like a good broodmare and take my blessing.”</i>");
		output("\n\nWithout waiting for a response, she begins slowly pounding you, the weight of her entire bulk behind each loud, squelching thrust. Your cries get louder and deeper with every slap of Sylvie’s gigantic balls off your [pc.ass], her soft flare pressing right up against your womb and giving it a sloppy wet kiss. You can already feel her squirting pre-cum inside you, her cocknozzle comfortably wedged right against your cervix for easy passage. Your eyes rolling back in your head, you can hardly comprehend the sensations Sylvie is subjecting you to.");
		output("\n\nShe doesn’t give you time to dwell on them, grunting with effort as she begins to fuck you faster, forcing you to brace yourself against the wall with white-knuckled effort so she doesn’t wind up slamming you into it. You can scarcely weather the rough pounding of your sopping cunt, being stretched to its absolute limit by the sheer size of Sylvie’s swollen dick. You hardly even get the chance to catch your breath, and when you do it comes out in wordless groans of bliss or shuddering, gasping pants.");
		output("\n\n<i>“Guuuuh! Sylvie!”</i> you cry, eyes squeezed shut. <i>“Sylvie, Sylvie, Sylvie!”</i>");
		output("\n\n<i>“That’s right, scream my fucking name!”</i> Sylvie tells you, rearing back for a particularly violent thrust that sends your face mere inches. <i>“Beg me to cum inside that spunkdump of yours!”</i>");
		output("\n\n<i>“C-cum,”</i> you gasp, already doing so yourself. <i>“Nnnn-hhnngh!”</i>");
		output("\n\nWith a triumphant scream of conquest, Sylvie lunges forward so far her throbbing cock pins you against the wall and holds you there. You feel a <i>massive</i> blossom of warmth inside you, Sylvie’s cock rippling from base to tip as she begins to dump the truckloads of sticky jizz held in her pulsing balls.");
		output("\n\n<i>“Oohhhhhhhhh, god daaamn,”</i> Sylvie groans, bucking the side of your face up against the wall with each thrust of her hips. <i>“Oh, you feel fucking amazing. Keep squeezing, baby, that’s the way.”</i>");
		output("\n\nYou couldn’t stop if you tried. With her equine cocknozzle plugging up your cervix, all you can feel is the orgasmic sensation of your womb being filled, over and over. By the time she slowly - very slowly - pulls herself out of you and dismounts, Sylvie’s followed through on her promise. You’re going to be walking around with a sagging “baby bump” for quite some time. For her part, she looks ecstatically smug.");
		output("\n\n<i>“Ho hooo, look at yooouuu,”</i> Sylvie croons, trotting around behind you to inspect your thoroughly-bred form from multiple angles.");
		if(pc.biggestTitSize() > 5) output(" <i>“Good thing you got those giant, suckable titties to make yourself look like a believable mommy, huh?”</i>");
		output("\n\nShe walks alongside you and brings her face close to yours, gazing into your eyes and smiling deeply as she runs her fingers along your flushed cheek.");
		output("\n\n<i>“You look as sexy now as you sounded during the act,”</i> Sylvie murmurs in your ear, moving close enough to rest her gigantic breasts against your chest. <i>“I really like you like this, sweaty and full of my cum. And that expression,”</i> she sighs, softly rubbing her thumb across your lower lip. <i>“To die for. Just makes me want to stick it in another hole of yours and start humping...”</i>");
		output("\n\n<i>“I think you’ve humped my holes enough for one day,”</i> you moan quietly, leaning against her shoulder. <i>“God damn...”</i>");
		output("\n\n<i>“Everything you wanted and more, huh?”</i> Sylvie says, and even without opening your eyes you can see the smug smile on her face. <i>“Heh... I feel a little sorry for less-endowed partners, if you’ve got any. They won’t even touch your fucking walls after the way I ruined your pretty little cunt...”</i>");
		//little extra section
		//check for others fucked
		if(flags["EDAN_FUCKED"] != undefined) 
		{
			output("\n\n<i>“There is actually this huge leithan guy on Tarkus...”</i> you admit sheepishly, wondering if Sylvie will get jealous in her post-sex ardor, but her response is one of eyebrow-arched surprise.");
			output("\n\n<i>“Seriously? Get him over here sometime and we can have a threesome! Fill you up from both ends until you can’t walk.”</i>");
			//wow, bet you didn’t think i’d dig up that old flag, did you? Who was edan, again?
			//Fen note: nobody cares about males, Wsan.
			output("\n\n<i>“I’m actually a little flattered that in all the galaxy you’ve travelled, you’ve only managed to find a handful of people with cocks big and juicy enough to compare to mine,”</i> Sylvie says, grinning.");
			//notfuckedKiro:
			if(!kiroSexed()) output(" <i>“Pity we probably won’t be able to team up on you.”</i>");
			else output(" <i>“Maybe we should get Kally and her sister in on the action too, huh? Bet you’d like that,”</i> she teases, squeezing one of your nipples. <i>“I can tell you’re a size queen with the way you react to this dick.”</i>");
		}
		output("\n\n<i>“Hmmm,”</i> Sylvie hums nonchalantly, eyeing you before ducking in to give you a kiss on the cheek. <i>“Stay right there.”</i>");
		output("\n\nShe turns and slowly makes her way back to your rear, running her hand slowly down the [pc.skinFurScales] of your back before arriving back at your flank. Her cum still very visibly dripping from your abused cunt, she reaches between your legs and gently stretches your overtaxed folds apart, exposing your sex and forcing you to helplessly squeeze out a huge load of Sylvie’s jizz all over her fingers.");
		output("\n\n<i>“Mmmnf, look at that,”</i> Sylvie says, walking back alongside you after she’s satisfied with your performance. <i>“Open up,”</i> she whispers, and you suddenly find two spunk-soaked fingers pushing into your mouth.");
		output("\n\nFor some reason, you don’t mind at all. You softly suck her fingers clean, Sylvie’s breath hot on your flushed face while you tongue her hand off. Her dainty digits are pulled from your mouth only to be immediately replaced by her warm, wet tongue wrapping around your own, pulling you into a deep, slow, kiss.");
		output("\n\n<i>“Mmmmf,”</i> Sylvie moans into your mouth, running a hand ");
		if(pc.hasHair()) output("through your [pc.hairNoun]");
		else output("along your cheek");
		output(" and whispering between every kiss.");
		output("\n\n<i>“We should - mm - do this - mmn - more often,”</i> she whispers. <i>“I want to keep you pumped full all the time, until it takes...”</i>");
		if(StatTracking.getStat("pregnancy/total births") < 40) 
		{
			output("\n\n<i>“If you’re that good </i>every<i> time...”</i> you murmur back, letting the sentence hang in the air as a tantalizing treat for Sylvie.");
			output("\n\n<i>“You teeeaaase,”</i> she admonishes you gently, pinching your nose softly before kissing you again. <i>“Let’s go get you washed up, [pc.name].”</i>");
		}
		else
		{
			output("\n\n<i>“Please tell me that’s a promise,”</i> you murmur back, hooding your [pc.eyes]. <i>“I’ll come back here as often as I can so you can fuck me full of your hot spunk until I have your beautiful kids. And then,”</i> you continue, watching Sylvie’s reaction, <i>“I’ll spread my legs and you can start all over again.”</i>");
			output("\n\n<i>“Oho, you </i>like<i> that idea, don’t you? I know a few studs that would love a woman like you as a breeder...”</i> she leans in, pressing her nose lightly against yours. <i>“Present company included.”</i>");
			output("\n\n<i>“You are </i>quite<i> the stud,”</i> you agree, smiling. <i>“With your new equipment, you might need someone around to take the load off. Ease your burden.”</i>");
			output("\n\n<i>“You can take my load any time you like, girl,”</i> Sylvie says with a grin, pecking you on the lips. <i>“For now though, let’s get you washed up, [pc.name].”</i>");
		}
	}
	processTime(20);
	pc.loadInCunt(sylviePP(), x);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",catchFutaSylviaVaginallyEnd);
}
public function catchFutaSylviaVaginallyEnd():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("Washing up is mostly uneventful, though Sylvie seems very taken with the idea of kissing you and fondling your pregnant-looking tummy. You get the feeling that she’s very into the whole thing, and you have to say that for your part it’s very nice having your partner fussing over you so much.");
	output("\n\nOne intimate and enjoyable bath later, you’re both clean and Sylvie needs to go to work. The little kiss and smile she gives you as you wave off her uniformed departure makes you feel a little like you’re a wife in one of those old shows you once saw in a documentary back on Earth, and you can’t help but snicker at the thought.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sex] -> [TakeAnal]
public function takeItUpYourButtYouDirtySlutbag():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("<i>“Hey, remember what we did when you first got your dick?”</i> you ask Sylvie, who nods and smiles. <i>“Think you can handle a repeat?”</i>");
	output("\n\n<i>“Think I can handle a repeat?”</i> she echoes, smirking. <i>“Think </i>you<i> can handle a repeat? Come on " + pc.mf("big boy","pretty girl") + ", let’s go find out. You’ve got me all hard thinking of your tight fuckin’ butt.”</i>");
	output("\n\n<i>“Nice to know I have such a dramatic effect on you,”</i> you say, completely earnest. It’s true. Walking to the rooms with Sylvie close behind, you can feel her eyes drinking in the sight of you from behind. The attention is more than a little flattering, and you can’t help but sway your hips a little just to tempt her.");
	output("\n\n<i>“You are gonna fuckin’ get it,”</i> she whispers from behind you as you pass some people in a corridor.");
	output("\n\n<i>“Is that a promise?”</i> you murmur back.");
	output("\n\nThe moment the door shuts behind you,");
	moveTo("CANADA7");
	if(pc.isTaur())
	{
		output("\n\nSylvie is all over you, pressing up against your [pc.chest] with her magnificent rack and kissing you deeply, hands running up and down your back ");
		if(!pc.isChestExposed()) output("tugging at your top");
		else output("touching your shoulders and gently stroking your spine");
		output(". She captures you in a deep, heated kiss, almost forcing herself on you, so desperate is she in her need. When she pulls back, she’s panting and the only thing in her eyes is the fire of lust.");
		output("\n\n<i>“Now turn around and flex those big, strong hindlegs of yours, [pc.name],”</i> she purrs, eyeing you with a predator’s leer. <i>“You don’t want to fall down when I’m on top now, do you?”</i>");
		output("\n\n<i>“No ma’am,”</i> you respond, turning and getting comfortable against the wall. The last thing you do is spread your legs just a little, to absorb the coming impact, and turn at the hips to face her. <i>“Like this?”</i>");
		output("\n\n<i>“Perfect,”</i> Sylvie murmurs, eyeing your [pc.ass].");
		if(pc.mf("m","f") == "m") output("\n\n<i>“Ever since getting a cock, I’ve started thinking about guys a little different. I still love taking it rough, but fuck if there isn’t something special about hearing boys moan like sluts while they squeeze down on you...”</i>");
		output("\n\nRearing up, she steps forward and lands on your back with a heavy thump.");
		if(pc.tallness >= 9) output("\n\nIt’s a good thing you’re so large yourself, because Sylvie is massive in more ways than one");
		else output("\n\nSylvie’s massive frame dwarfs your own, practically enveloping your body with her limbs");
		output(". She feels like an entire gym’s worth of equipment on your back, albeit a lot softer and fluffier. Not to mention that you can feel her big, fat cock rubbing your underside affectionately.");
		output("\n\n<i>“You like feeling that?”</i> Sylvie whispers in your ear, ");
		if(pc.hasCock()) output("stroking your prick using her own with slow hip movements");
		else output("stroking the [pc.skinFurScales] of your tummy with slow hip movements");
		output(". <i>“I’m gonna have soooo much fun putting this in your little asshole and rutting you, [pc.name]. I wonder how many times you’ll cum for me?”</i>");
		output("\n\nBefore you even have a chance to reply, she’s pulled back and has herself expertly angled, poised to shove her dick balls-deep into your [pc.asshole]. Which is why you’re surprised when she presses forward with gentleness unbecoming of such a large creature, forcing a soft moan from your lips. Her flare slowly spreads you apart to make you hers, the feeling making your legs shake a little while you grunt.");
		
		pc.buttChange(sylvieCockVolume());

		output("\n\n" + pc.mf("<i>“Awww, there are those sounds I love,”</i> Sylvie coos, an arm snaking around you to rub your [pc.chest]. <i>“So tough! Now give it aaaalll up for me, baby. I wanna hear you moaning like a girl.”</i>","<i>“Awww, you sound so cute like that,”</i> Sylvie coos, an arm reaching around to cup one of your breasts. <i>“Being so tough for me! Now get ready to take it all in, okay?”</i>"));
		output("\n\nYou have to admit this is a <i>lot</i> more gentle than your first time trying anal with Sylvie. Despite her incredible size, you’re quickly discovering that having the giant moosegirl slowly slide herself in is even better than you expected. You shiver, moan and shudder while Sylvie giggles in lustful glee, enjoying every little bit of your reactions. She’s having way too much fun with this, and she knows it. She whispers sweet nothings in your ear constantly while stretching you out, getting you used to the prospect of being wrapped around her.");
		if(pc.hasCock()) output("\n\n<i>“I think I’ll ride you niiice and slow into a long, drawn-out prostate orgasm,”</i> she murmurs in your ear, nibbling on it between strokes. <i>“How would you like that, [pc.name]? Does that sound good?”</i>");
		else if(pc.hasVagina()) output("\n\n<i>“I think I’ll ride you nice and slow until you can’t help but cum all down your legs,”</i> she murmurs in your ear, nibbling on it between strokes. <i>“Would you like that, [pc.name]? Having your ass ridden until your quivering little pussy squirts everywhere?”</i>");
		if(pc.hasGenitals()) output("\n\nYou’re helpless to do anything other than nod in assent. <i>“Mmmn, I thought so,”</i> Sylvie croons, rubbing you up and down. ");
		else output("\n\n");
		output("<i>“Come on, then. Don’t be afraid of getting too loud, nobody can hear you in here.”</i>");
		output("\n\n<i>Fuck</i>, you both think and groan out loud. She is really, <i>really</i> good at doing exactly what she says she will. There’s something about the way she’s handling you - the loving care contrasted with the giant cock splitting you apart - that makes you <i>want</i> to cum for her, to be forcefully herded over the peak of ecstasy. With every long, measured thrust you cry out in a wordless moan for more, listening to the deep, controlled breathing of Sylvie in your ear.");
		output("\n\nThat’s the difference, you realize dimly. Sylvie’s in control right now, of both her animal instincts <i>and</i> you. You’re dancing in the palm of her soft, loving hand, and fuck if it isn’t one of the best things you’ve ever felt. Your voice gets higher and louder with every penetration, the pleasure mounting and mounting but never quite getting there, not on your own, not without Sylvie.");
		output("\n\n<i>“Do you want to cum?”</i> she whispers so quietly you’d swear you heard it with your mind instead of your ears.");
		output("\n\n<i>“Yes!”</i> you cry, desperately squeezing down and stroking her cock with your insides for some measure of her approval. <i>“Please let me cum!”</i>");
		output("\n\n<i>“Good " + pc.mf("boy","girl") + ",”</i> she mutters, and that small compliment feels like being handed water in a desert.");
		output("\n\nShe adjusts the angle of her thrusts and begins rolling those huge, powerful hips behind you until it feels like you’re a tiny vessel amidst a stormy sea. More than anything, though, you can feel yourself on the verge of climax. With a joyous, almost tearful cry of delight, you feel the dam break free and your body instinctively tense.");
		if(pc.hasCock()) output("\n\nWhat follows is almost five full minutes of Sylvie expertly milking you for cum, each massive load of [pc.cumColor] liquid spurting unbidden from the end of your cock, some of it dripping to the floor and the rest of it running down the underside of your throbbing penis. She keeps you at it like she’s being paid by the litre, never too forceful and never too light, always just stroking your prostate with her flare exactly how it feels best for you. Some part of you is overcome with emotion, the passion she’s sharing with you, keeping you orgasming for so long; she <i>really</i> cares about you getting off, and getting off <i>hard</i>.");
		else if(pc.hasVagina()) 
		{
			output("\n\nYou get the scantest of seconds to take a deep breath before loosing it in a deep, satisfied groan of pure orgasmic pleasure. ");
			if(pc.isSquirter()) output("You bite your lip and squirt <i>everywhere</i>, little muffled shrieks of ecstasy escaping your lips with each clench of your pussy. Sylvie gently slides herself in while you’re cumming until you can feel the warmth of her giant, overloaded balls pressed up against your quivering pussy lips. Unable to help yourself, you give them a nice, heavy coating of femjizz with a violent shudder of pleasure.");
			else output("You bite your lip while the unconscious clenching of your pussy sends trickles of femcum down your shaking legs, little muffled shrieks of ecstasy escaping your lips with each one. Sylvie gently slides herself in while you’re cumming until you can feel the warmth of her giant, overloaded balls pressed up against your quivering pussy lips. There’s something insanely sexy about the gesture, and you can scarcely help yourself from cumming even harder at their touch.");
		}
		output("\n\nSylvie stays silent throughout the entire ordeal, choosing instead to massage and rub you while you sing her praises. By the time you finish, you’re almost ready to collapse when you feel Sylvie’s fingers drumming lightly on your shoulders. She leans down to whisper in your ear.");
		output("\n\n<i>“That was beautiful, [pc.name],”</i> she breathes, and you can feel the lust in her voice. <i>“But I still haven’t cum yet.”</i>");
		output("\n\nWithout waiting for an answer, she pulls back and rocks against you, ramming herself back in. In your post-orgasm sensitivity, you can’t resist crying out her name in a long, whorish moan, and you’d swear she gets harder inside you when you do. Whether she’s being considerate of your state or all your horny theatrics got her worked up beforehand, it doesn’t take long for Sylvie to cum. A groan of contentment and her balls resting against your rear is all the warning you get before a great rush of seed fills your backside, flowing inside your guts.");
		output("\n\n<i>“Mmmmmmnnn, that’s niiiice,”</i> Sylvie sighs in your ear, relaxing atop you while she pumps you full of jizz. <i>“Going slow is fun too.”</i>");
		output("\n\nWith the way she made you cum so hard... you’re inclined to agree. You’ll gladly stand here and be her little cum-dump if every session is like <i>that</i>. You feel utterly drained despite being filled with more of Sylvie’s seed with every passing second. By the time she dismounts and pulls herself free with a wet pop and a grunt of satisfaction, you’ve definitely packed on a few pounds. Your stomach is hanging a lot lower to the ground now, that’s for sure.");
		output("\n\n<i>“Oh, you look so pretty like that,”</i> Sylvie says, smiling. <i>“C’mere, you!”</i>");
		output("\n\nHer cock spurting jizz between your forelegs even now, she catches you in a loving kiss, hands stroking your face even as her tongue twists around your own. Eyes closed, you engage in her gentle passion and enjoy a moment of aftercare. When she pulls back, Sylvie’s beaming.");
		output("\n\n<i>“You are just what the doctor ordered,”</i> Sylvie giggles happily, heading for the door before turning back and proffering her hand. <i>“Let’s go get cleaned up in the baths, okay?”</i>");
		output("\n\n<i>“I could go for a relaxing bath after having a ton of moose on my back,”</i> you reply, taking her hand and smiling.");
		output("\n\n<i>“Are you calling me fat?!”</i> Sylvie gasps in mock horror, raising a hand to her mouth. <i>“Well, I never.”</i> After a couple of seconds, she snickers. <i>“Not to mention I think we’ve traded a bit of weight, Steele.”</i>");
	}
	//next (go to Post-Take Anal below the nontaur scene)
	else
	{
		output("\n\nSylvie is all over you, lifting you with a surprising amount of strength and pressing you against a wall with her giant rack. Holding you in midair, Sylvie captures you in a deep, heated kiss, almost forcing herself on you, so desperate is she in her need. When she pulls back, she’s panting and the only thing in her eyes is the fire of lust. To your surprise, though, she manages to hold back and take control of herself. Soon, only the embers of calculated desire smolder in her gaze.");
		output("\n\n<i>“I am gonna make you cum so fucking hard,”</i> she whispers to you, running a hand down your cheek.");
		output("\n\nBefore you even have a chance to reply, she’s pulled back and has herself expertly angled, poised to shove her dick balls-deep into your [pc.asshole]. Which is why you’re surprised when she presses forward with gentleness unbecoming of such a large creature, forcing a soft moan from your lips. Her flare slowly spreads you apart to make you hers, the feeling making your legs shake a little while you grunt.");
		
		pc.buttChange(sylvieCockVolume());
		
		output("\n\n" + pc.mf("<i>“Mmmm, that’s riiight, it’s good, isn’t it?”</i> Sylvie coos, staring deeply into your eyes. <i>“Now give it aaaalll up for me, baby. I wanna hear you moaning like a girl.”</i>"," <i>“Awww, you sound so cute like that,”</i> Sylvie coos, reaching forward to cup one of your breasts. <i>“Being so tough for me! Now get ready to take it all in, okay?”</i>"));
		output("\n\nYou have to admit this is a <i>lot</i> more gentle than your first time trying anal with Sylvie. Despite her incredible size, you’re quickly discovering that having the giant moosegirl slowly slide herself in is even better than you expected. You shiver, moan and shudder while Sylvie giggles in lustful glee, enjoying every little bit of your reactions. She’s having way too much fun with this, and she knows it. She whispers sweet nothings in your ear constantly while stretching you out, getting you used to the prospect of being wrapped around her.");
		if(pc.hasCock()) output("\n\n<i>“I think I’ll fuck you niiice and slow into a long, drawn-out prostate orgasm,”</i> she murmurs in your ear, nibbling on it between strokes. <i>“How would you like that, [pc.name]? Does that sound good?”</i>");
		else if(pc.hasVagina()) output("\n\n<i>“I think I’ll fuck you nice and slow until you can’t help but cum all down your legs,”</i> she murmurs in your ear, nibbling on it between strokes. <i>“Would you like that, [pc.name]? Having your ass fucked until your quivering little pussy squirts everywhere?”</i>");
		if(pc.hasGenitals()) output("\n\nYou’re helpless to do anything other than nod in assent. <i>“Mmmn, I thought so,”</i> Sylvie croons, rubbing you up and down. ");
		else output("\n\n");
		output("<i>“Come on, then. Don’t be afraid of getting too loud, nobody can hear you in here.”</i>");
		output("\n\n<i>Fuck</i>, you both think and groan out loud. She is really, <i>really</i> good at doing exactly what she says she will. There’s something about the way she’s handling you - the loving care contrasted with the giant cock splitting you apart - that makes you <i>want</i> to cum for her, to be forcefully herded over the peak of ecstasy. With every long, measured thrust you cry out in a wordless moan for more, listening to the deep, controlled breathing of Sylvie in your ear.");
		output("\n\nThat’s the difference, you realize dimly. Sylvie’s in control right now, of both her animal instincts <i>and</i> you. You’re dancing in the palm of her soft, loving hand, and fuck if it isn’t one of the best things you’ve ever felt. Your voice gets higher and louder with every penetration, the pleasure mounting and mounting but never quite getting there, not on your own, not without Sylvie.");
		output("\n\n<i>“Do you want to cum?”</i> she whispers so quietly you’d swear you heard it with your mind instead of your ears.");
		output("\n\n<i>“Yes!”</i> you cry, desperately squeezing down and stroking her cock with your insides for some measure of her approval. <i>“Please let me cum!”</i>");
		output("\n\n<i>“Good " + pc.mf("boy","girl") + ",”</i> she mutters, and that small compliment feels like being handed water in a desert.");
		output("\n\nShe adjusts the angle of her thrusts and begins rolling those huge, powerful hips below you until it feels like you’re a tiny vessel amidst a stormy sea. More than anything, though, you can feel yourself on the verge of climax. With a joyous, almost tearful cry of delight, you feel the dam break free and your body instinctively tense.");
		if(pc.hasCock()) output("\n\nWhat follows is almost five full minutes of Sylvie expertly milking you for cum, each massive load of [pc.cumColor] liquid spurting unbidden from the end of your cock, some of it dripping to the floor and the rest of it running down the underside of your throbbing penis. She keeps you at it like she’s being paid by the litre, never too forceful and never too light, always just stroking your prostate with her flare exactly how it feels best for you. Some part of you is overcome with emotion, the passion she’s sharing with you, keeping you orgasming for so long; she <i>really</i> cares about you getting off, and getting off <i>hard</i>.");
		else if(pc.hasVagina()) 
		{
			output("\n\nYou get the scantest of seconds to take a deep breath before loosing it in a deep, satisfied groan of pure orgasmic pleasure. ");
			if(pc.isSquirter()) output("You bite your lip and squirt <i>everywhere</i>, little muffled shrieks of ecstasy escaping your lips with each clench of your pussy. Sylvie gently slides herself in while you’re cumming until you can feel the warmth of her giant, overloaded balls pressed up against your quivering pussy lips. Unable to help yourself, you give them a nice, heavy coating of femjizz with a violent shudder of pleasure.");
			else output("You bite your lip while the unconscious clenching of your pussy sends trickles of femcum down your shaking legs, little muffled shrieks of ecstasy escaping your lips with each one. Sylvie gently slides herself in while you’re cumming until you can feel the warmth of her giant, overloaded balls pressed up against your ass. There’s something insanely sexy about the gesture, and you can scarcely help yourself from cumming even harder at their touch.");
		}
		output("\n\nSylvie stays silent throughout the entire ordeal, choosing instead to massage and rub you while you sing her praises. By the time you finish, you’re almost ready to collapse when you feel Sylvie’s fingers drumming lightly on your shoulders. She leans down to whisper in your ear.");
		output("\n\n<i>“That was beautiful, [pc.name],”</i> she breathes, and you can feel the lust in her voice. <i>“But I still haven’t cum yet.”</i>");
		output("\n\nWithout waiting for an answer, she pulls back and rocks against you, ramming herself back in. In your post-orgasm sensitivity, you can’t resist crying out her name in a long, whorish moan, and you’d swear she gets harder inside you when you do. Whether she’s being considerate of your state or all your horny theatrics got her worked up beforehand, it doesn’t take long for Sylvie to cum. A groan of contentment and her balls resting against your rear is all the warning you get before a great rush of seed fills your backside, flowing inside your guts.");
		output("\n\n<i>“Mmmmmmnnn, that’s niiiice,”</i> Sylvie sighs in your ear, relaxing against you while she pumps you full of jizz. <i>“Going slow is fun too.”</i>");
		output("\n\nWith the way she made you cum so hard... you’re inclined to agree. You’ll gladly hang here and be her little cum-dump if every session is like <i>that</i>. You feel utterly drained despite being filled with more of Sylvie’s seed with every passing second. By the time she pulls herself free with a wet pop and a grunt of satisfaction, you’ve definitely packed on a few pounds. Your stomach is hanging a lot lower, that’s for sure.");
		output("\n\n<i>“Oh, you look so pretty like that,”</i> Sylvie says, smiling. <i>“C’mere, you!”</i>");
		output("\n\nHer cock spurting jizz between your legs even now, she catches you in a loving kiss, hands stroking your face even as her tongue twists around your own. Eyes closed, you engage in her gentle passion and enjoy a moment of aftercare. When she pulls back, Sylvie’s beaming.");
		output("\n\n<i>“You are just what the doctor ordered,”</i> Sylvie giggles happily, heading for the door before turning back and proffering her hand. <i>“Let’s go get cleaned up in the baths, okay?”</i>");
		output("\n\n<i>“I could go for a relaxing bath after having a ton of moose pressed against me,”</i> you reply, taking her hand and smiling.");
		output("\n\n<i>“Are you calling me fat?!”</i> Sylvie gasps in mock horror, raising a hand to her mouth. <i>“Well, I never.”</i> After a couple of seconds, she snickers. <i>“Not to mention I think we’ve traded a bit of weight, Steele.”</i>");
		//next (post-Take Anal, below)
	}
	processTime(45);
	pc.orgasm();
	pc.loadInAss(sylviePP());
	clearMenu();
	addButton(0,"Next",postTakeAnalWithDickSylvie);
}

//[post-Take Anal]
public function postTakeAnalWithDickSylvie():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("<i>“Oh my god,”</i> you groan, relaxing in the bath, spreading your aching limbs in the warm water.");
	output("\n\n<i>“Goddess, I believe,”</i> Sylvie corrects you with a smile as she wades in to join you. <i>“Nice, isn’t it?”</i>");
	output("\n\nAll you offer in reply is a contented sigh, leaning your head against Sylvie’s shoulder when she’s close enough. ");
	if(pc.hasHair()) output("She begins slowly scooping water from the bath and pouring it over your [pc.hairNoun], shielding your face from droplets while she washes you. It feels very nostalgic for a reason you can’t place, and since you can’t find a reason to stop her, you let Sylvie continue to wash and brush your hair, humming quietly all the while. ");
	output("After what could either be thirty seconds or an eternity, you hear Sylvie ask you a question.");
	output("\n\n<i>“Sorry?”</i> you ask, lifting your head a little. <i>“I was dozing off there.”</i>");
	output("\n\n<i>“Can’t say I’m too surprised,”</i> Sylvie says, smiling. <i>“I just asked if you’d like me to wash your back.");
	if(pc.isTaur()) output(" I know it can be annoying to reach as a ‘taur.");
	output("”</i>");
	output("\n\n<i>“Oh, sure,”</i> you nod, allowing her to take hold of your shoulders. A mere moment later and you’re like putty in her hands, sighing deeply in satisfaction.");
	output("\n\n<i>“Do you like the massage option?”</i> Sylvie jokes. <i>“Free of charge, just for you.”</i>");
	output("\n\n<i>“So generous,”</i> you murmur, feeling the tension in your muscles fade away as Sylvie swaps between massaging and washing your back.");
	output("\n\n<i>“I think this might be the first time I’ve come away from sex more clean and energized than I was when we started,”</i> you mention to Sylvie, setting her off in giggles.");
	output("\n\nThe two of you enjoy the rest of your time together in the bath before Sylvie has to get dressed and leave for work.");
	output("\n\n<i>“You’d better come see me again soon! I like having you around, [pc.name],”</i> Sylvie tells you, pointing. She ducks in to give you a little kiss on the lips with a big smile and waves before leaving, swaying her hips confidently. You definitely watch her go, eyes glued to that sexy butt. Shaking your head, you gather your thoughts.");

	processTime(25);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sex] -> [FistHer]
public function fistSylvie():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("<i>“How about I give you a nice surprise?”</i> you suggest, winking at Sylvie across the table.");
	if(flags["SYLVIE_PROSTATE_MILKED"] != undefined) output("\n\n<i>“Well, I’ve liked every surprise you’ve given me so far...”</i> Sylvie jokes, grinning. <i>“Let’s get a room, shall we?”</i>");
	else 
	{
		output("\n\n<i>“Ooh, I do so love surprises,”</i> Sylvie says, leaning in and smiling. <i>“‘Specially when I get to cum at the end of them.”</i>");
		output("\n\n<i>“Oh, there’ll be a lot of cumming alright,”</i> you say knowingly, rising from your seat with a mysterious smile playing on your lips.");
	}
	clearMenu();
	addButton(0,"Next",fistSylvieNext);
}
public function fistSylvieNext():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	moveTo("CANADA7");
	output("Once you’re in the room and the door is locked securely behind you, Sylvie turns and gazes at you with one arm on her cocked hips.");
	output("\n\n<i>“So, which way do I face for my surprise, cutie?”</i> she asks, beaming confidently.");
	output("\n\n<i>“Away,”</i> you tell her");
	if(!pc.isChestExposed()) output(", taking off your [pc.upperGarments]");
	output(". <i>“Works best when you don’t see it coming.”</i>");

	output("\n\n<i>“Ooh, taking charge, I like it,”</i> Sylvie murmurs, turning away and facing a wall. <i>“Like this, " + pc.mf("sir","ma’am") + "?”</i>");
	output("\n\n<i>“Perfect,”</i> you say, eyeing that huge booty of hers. She’s built like a fucking bombshell, that’s for sure. You give that monumental ass of hers a nice smack, enjoying the way Sylvie moans like a whore as the flesh jiggles under your hand. Time to unpack her surprise! Slowly shifting your hand from gently stroking the region you just slapped, you slip a finger, then two, then three into Sylvie’s asshole. The surprised - but not displeased - moan from up front along with the ease with which her velvet-soft hole accepts you is a sure sign; she’s no stranger to anal fun.");
	output("\n\nStill, though, this is meant to be a surprise, and that means doing something unexpected. Spreading your fingers around to expose her hole, you pull them back out and ball your hand into a fist.");
	output("\n\n<i>“Gohhhh!”</i> Sylvie half-cries, half-moans in surprise. <i>“Is that your whole hand?!”</i>");
	output("\n\n<i>“Yup,”</i> you reply drily, flexing it just inside her asshole and watching her ring swell around the entrance. <i>“Time to teach you about one of the lesser-known upsides of your cock, Sylvie.”</i>");
	output("\n\n<i>“Unh!”</i> she groans, looking back at you. <i>“You gonna teach me from the inside out, then? Mmngh!”</i>");
	output("\n\n<i>“Yeah, in a manner of speaking,”</i> you say idly, relaxing your hand and sliding a little deeper. <i>“You just relax, okay?”</i>");
	output("\n\n<i>“Ooh! You try relaxing with someone trying to turn you into a puppet, Steele,”</i> Sylvie grouses, but she does as you say. Besides, you have a perfectly clear view of that padded pussy of hers - swollen up, drooling, and practically begging to have a fat cock inside it, you don’t think she hates it too much.");
	output("\n\nYou spend a couple of minutes just getting her acquainted with having your fist inside her ass; you suspect she’s probably taken horsecocks this big inside before, but having a hand inside is a little different from a flare. For one thing, a hand doesn’t compress when you squeeze down on it like a needy slut.");
	output("\n\n<i>“Having fun?”</i> you murmur.");
	output("\n\n<i>“It’s not so bad,”</i> she admits, tossing her hair. <i>“Gonna take some work to- to- hnnn... mmm. What </i>is<i> th- oh!”</i>");
	output("\n\n<i>“The surprise,”</i> you tell her, gently stroking her prostate. Holy <i>fuck</i>, it’s huge. In retrospect you shouldn’t be surprised given how well-endowed the massive moose is, but this is something else. You can feel it protruding through her walls, her asshole rapidly contracting whenever you brush your fingertips against it.");
	output("\n\n<i>“Feels- nnf!”</i> Sylvie gasps, beginning to breathe a little faster. <i>“Feels weird...”</i>");
	output("\n\n<i>“Just relax and focus on the feeling, Sylvie,”</i> you tell her, slowly massaging the oversized organ with radial movements. <i>“It takes a while.”</i>");
	output("\n\nYou gently guide the moosegirl on her ascent to pleasure, her head down and her breath long and deep. It doesn’t take long for the stimulation to stir her big, fat balls into action, a gradual everflowing strand of pre-cum hanging from her cock’s crown. Slowly but surely, you incite Sylvie to produce a small pool of perfectly clear pre-cum beneath her, sweat breaking out on the woman’s well-built body as she makes tiny moans of exertion. Her asshole lightly clenches with every touch to her prostate even as she tries to fight it, keeping her instincts at bay so you can keep stroking and brushing her snug insides.");
	output("\n\nIt doesn’t take too long for Sylvie to get completely used to having you inside her. Her breathing is slow and measured, and even though her head is still down with her hair hanging across her face, she’s perfectly relaxed. Her half-sheathed cock alternates between stiffening and softening every few seconds, no doubt a confusing sensation for the overly horny girl, but it never stops drooling that transparent cum from the tip.");
	output("\n\nShe moans at length when you start rubbing against her a little faster, quietly at first and with growing fervor as your pace increases. Soon her relaxation is done for, but her concentration isn’t; she’s still focused entirely on the sensation of <i>you</i>, on what you’re doing to her, and what’s happening to her body. You keep up the persistent stroking in one spot until, finally, she can take no more and speaks.");
	output("\n\n<i>“Oh god, I feel like I’m gonna cum but it never happens,”</i> she gasps, breathing unsteadily and flexing her hindquarters erratically. <i>“I feel so close..!”</i>");
	output("\n\n<i>“Just relax and let it happen,”</i> you tell her, stroking her flank with your free hand. <i>“Just think only about cumming.”</i>");
	output("\n\nTo her credit, Sylvie doesn’t complain and instead bows her head once more, her breath coming faster and faster until you can feel her beginning to clench down on you once more - and then, she’s rewarded for her patience.");
	output("\n\nThe clear, sparkling pre-cum that’s been free-flowing from the end of her cock like a faucet since you began suddenly stops, the strand dangling from her dick dropping to the ground. For a moment, nothing happens - then with a deep, animalistic groan of whorish ecstasy, Sylvie cums all over the floor - one throbbing, pumped-out load at a time. Cream-white spunk begins to spurt from her cockhead, her body forcing it out after being subject to such tantalizing overstimulation.");
	output("\n\nHer hips jerk and buck with your arm inside her, only succeeding in spurring herself further onwards into orgasm. You can feel her flex around you when she leans forward, as if trying to instinctively bury herself as deep in a mare as possible, but the satisfaction of completion never comes. Instead she tightens around you again and again, dropping load after load of pearly jizz while her balls quiver with no end in sight.");
	output("\n\n<i>“Hhhnnnggh-! Nnnngh! Nnnnn!”</i> Sylvie grunts forcefully, flexing so hard with each release you can see her muscles rippling across her tauric body. <i>“Ohhhhhh, </i>GOD<i>. Steele, Steele, Steele,”</i> she pants happily, all but putty in your hands. <i>“Ooohhhh fuck yessss...”</i>");
	output("\n\nYou could let her ride this out, or get some good-natured bullying in if you wanted...");
	IncrementFlag("SYLVIE_PROSTATE_MILKED");

	processTime(30);
	pc.changeLust(10);
	clearMenu();
	//[SqueezeBalls] [Relax]
	addButton(0,"SqueezeBalls",squeezeballsSylvie);
	addButton(1,"Relax",relaxAndJizzFromProstateShitSylvie);
}

public function squeezeballsSylvie():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("You’re gonna make her cum <i>everything</i> she’s got in that low-hanging sack of hers. There must be gallons of warm jizz in those giant fucking balls, weighing the obscene orbs down. She’ll need juuuust a little help getting it out...");
	output("\n\n<i>“Uuuhhhh! Uuuunnnnhhh! Oooohhh!”</i> Sylvie cries, pressing herself against the wall so hard you’re worried for a moment it might break, sending a ton of slow-orgasming moose rolling through the rooms. <i>“Oooohhhh, GOD!”</i>");
	output("\n\nYou’ve hardly even given <i>one</i> of her quaking cumtanks a loving squeeze and she’s already giving you such a delicious reaction. If you get a better grip and squeeze these plump balls just a <i>little</i> harder...");
	output("\n\nSylvie lets loose a crude, strained grunt through grit teeth that sounds more like the aggressive snort of a wild animal than anything else, followed by a massive spray of spunk that spatters against the ground so hard it splashes her legs. With a manipulative stroke of your fingers and another possessive squeeze, Sylvie makes a violent, wordless exclamation and loudly stamps a back hoof before letting loose her biggest load yet.");
	output("\n\nHer fingers practically digging into the walls, you keep the massive moosegirl cumming like a fucking hose, squirting out huge, cock-straining blasts of cum that all but paint the floor below her and some of the wall in front of her too. Sylvie’s shaking legs slowly draw tighter and tighter together as she’s repeatedly pushed over the brink of ecstasy, giving herself over to her animalistic instincts.");
	output("\n\n<i>“Wow, you are just a big ol’ stud that loves to cum, huh Sylvie?”</i> you murmur to the moosegirl cumming her overtaxed brains out. <i>“Look at how much of a mess you’re making.”</i>");
	output("\n\nSylvie doesn’t hear you, too busy repainting the floor with massive ejaculations while grunting loudly. You start taking it a bit easier - best to leave room for the girl in her own head before this gets out of hand...");
	output("\n\n<i>“Hnnnh-rrrrrgh! Nnnnngh! Oh, god,”</i> Sylvie pants, shaking her head from side to side. <i>“I think I’m- cuh-cumming-”</i>");
	//go to merge
	processTime(20);
	clearMenu();
	addButton(0,"Next",sylvieProstateStimEnd);
}

//[Relax]
public function relaxAndJizzFromProstateShitSylvie():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("<i>“Just go with it,”</i> you murmur to her comfortingly, stroking her back. <i>“Let it roll over you.”</i>");
	output("\n\n<i>“I- I- nnnfgh...”</i> Sylvie stutters, losing her way trying to get a sentence out. <i>“Oooooh...”</i>");
	output("\n\nSomehow grasping your meaning, Sylvie’s bestial, almost tortured grunts of lust over her body’s utter betrayal slowly give way to softer, high-pitched moans of the joy of being taken for a ride. Helpless to do anything with the sensations but experience them, she takes a back seat and lets you milk her for all she’s worth. Each small stroke of your fingers across her prostate is accompanied by an almost melodic sigh of arousal, closely followed by a massive squirt of thick, creamy seed from her throbbing cock.");
	output("\n\n<i>“Aaawwww god,”</i> Sylvie moans, leaning back and squeezing her nipples between thumb and forefinger. <i>“I can’t stooop...”</i>");
	output("\n\nPure white seed fountains from her hanging cock, each ejaculation bringing her gradually closer to having busted a nut for minutes on end. You can’t help but feel a little jealous of the moaning moosegirl; it’s hard to imagine how long this must feel for her, orgasming with every passing second.");
	output("\n\n<i>“Is that good, Sylvie?”</i> you ask lightly, giving her a nice rub across her bulging prostate. <i>“Squeezing out a day’s worth of jizz in a few minutes?”</i>");
	output("\n\n<i>“Oh my god, it’s </i>so<i> good,”</i> she groans, nodding vigorously and beginning to clench down on you again. <i>“I think- I think I’m gonna cum for reallll-”</i>");
	processTime(20);
	clearMenu();
	addButton(0,"Next",sylvieProstateStimEnd);
}

//merge relax/squeeze
public function sylvieProstateStimEnd():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("With a cry of joyous release, Sylvie bucks once, twice, then flexes her hindquarters so hard your hand is immobilized. Her long, equine shaft suddenly hardens and inflates, swelling to its full size within moments, and the seed spouting from her tip begins to thicken as it surges outwards.");
	output("\n\n<i>“Oh, god,”</i> Sylvie pants breathlessly, <i>“cumming, cumming, cumming-! [pc.name]!”</i>");
	output("\n\nCrying your name, Sylvie pumps the rest of her huge stores of jizz right out onto the floor in a few gigantic loads, a veritable tsunami of warm, virile spunk flowing from her massive flare.");
	output("\n\nBy the time Sylvie finishes cumming, you’ve slowly withdrawn your hand from her ass to give her the release of a real, unhindered orgasm just to cap things off. All you have now is a huge, moaning moosegirl still suffering the aftershocks of her incredible release, looking all but like she wants to keel over and fall asleep right there.");
	output("\n\n<i>“Steeeeele,”</i> she moans, tipping to one side before turning to face you. <i>“Oh my g- mmmnnf-”</i>");
	output("\n\nShe grabs you and kisses you so forcefully you think she might swallow your tongue. She doesn’t let you shrink back, either, suddenly fiercely possessive of you and your ability to make her cum for minutes on end. In retrospect, you guess that makes a lot of sense.");
	output("\n\n<i>“You’re like an artist,”</i> Sylvie pants when she finally pulls back, drooling down her chin and onto her tits. <i>“And I’m just the canvas... that was amazing.”</i>");
	output("\n\n<i>“It looked like you were having a lot of fun,”</i> you say, smiling. <i>“Do you want to go have a bath?”</i>");
	output("\n\n<i>“What I want to do is carry you to bed and go to sleep wrapped around you,”</i> she admits, looking you up and down, <i>“but a nice, warm bath could be nice too...”</i>");
	output("\n\n<i>“No reason we can’t do both,”</i> you say, leaning forward and kissing her before taking her hand.");
	output("\n\nYou lead the drained ‘taur-girl to the water and watch her happily sink into its depths, sighing in satisfaction. Joining her in the bath, you soap her up and wash her down, getting all the hard-to-reach places for the tired girl. By the time you finish, she’s practically swaying on her feet with sleepiness, and you find yourself having to gently guide her back to the room so she can take a nap.");
	output("\n\nNaked and sparkling clean, Sylvie collapses onto the bed and is out like a light. After sharing in her incredible little experience, you’d like to be there for her when she wakes up; you clamber around the gently snoring moosegirl’s entanglement of limbs and wrap your arm around her back to take a quick break.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",sylvieProstateStimEndEnd);
}
public function sylvieProstateStimEndEnd():void
{
	clearOutput();
	showSylvie(true);
	author("Wsan");
	output("She’s only asleep for maybe half an hour when her eyelids flutter, her eyes opening to gaze at your face for a few seconds before recognition dawns on her.");
	output("\n\n<i>“Oh my gooosh,”</i> she fawns, catching you in a hug against her bountiful bosom. <i>“You just skyrocketed to the top of my list. Wow. I’m gonna have to teach </i>everyone<i> I know about this.”</i>");
	output("\n\nYou can already envision a not-so-distant future of Kally and Sylvie taking turns milking each other for gallons and gallons. Rubbing up against you with affection, Sylvie gets herself dressed - making sure to give you a nice show as she works her clothes on, smiling the whole time - and gets ready to go back to work. Right before she leaves, she gives you a kiss.");
	output("\n\n<i>“Make sure you come back soon, got it?”</i> she tells you, looking at you meaningfully. <i>“I want to see a </i>lot<i> more of you around.”</i>");
	output("\n\n<i>“Sure thing,”</i> you say with a grin. <i>“Couldn’t leave my favorite moosegirl all alone out here.”</i>");
	output("\n\n<i>“You better not!”</i> she huffs, then grins. <i>“Okay. I’d better get back to work, there’re probably petty criminals out there who need a good dicking to set them right.”</i>");
	output("\n\n<i>“I didn’t know you were a petty criminal,”</i> you reply innocently.");
	output("\n\nShe sticks out her tongue and blows a raspberry as she leaves. Not even a second goes by before she pops her head back in the door and points at you. <i>“Soon!”</i>");
	output("\n\nThen she’s gone. You pity the next fool she comes across in the line of duty.");
	processTime(30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Steele is a Horsecock Fuckpuppet
//By QuestyRobo
//Requires Sylvie to have a horse dingus, and at least the initial meeting between Kiro and Kally done.
//Requires you to have a pussy or be a Buttslut (with the perk).
//scene triggers when you Hug Sylvie while she's drunk and DtF, if you meet the requirements.
//Adds to the end of Hug, if requirements are met
public function horsecockFuckpuppetProc():void
{
	showSylvieAndKally();
	author("QuestyRobo");
	output("\n\nYou hear a loud rumbling, like glasses tumbling around wildly. Indeed you look behind you and see Kally struggling to not drop a plate of empty beer mugs, her horse dick brazenly erect, unable to be contained by her mere skirt. Sylvie chuckles drunkedly as Kally barely gets herself together, no doubt blushing under her dusky fur as her eyes, and cock turn toward you.");
	output("\n\n<i>“She was shooting us a real nice look, before she started tumbling. Oh, let’s invite her over for some fun! Pretty pleeeeease?”</i>");
	clearMenu();
	addButton(0,"Invite",inviteKallyOverForTripleHorsemeat,undefined,"Invite","Call Kally over for some fun. Who knows where it might lead!");
	addButton(1,"Nah",noFunsiesSylvie);
}

public function noFunsiesSylvie():void
{
	clearOutput();
	showSylvie();
	author("QuestyRobo");
	output("Sylvie pouts, momentarily put out.");
	sylvieMenu();
}

public function inviteKallyOverForTripleHorsemeat():void
{
	clearOutput();
	showSylvieAndKallyAndKiro();
	author("QuestyRobo");
	output("Being ");
	if(pc.isDrunk() || pc.isSmashed()) output("more composed about your inebriated state");
	else output("sober");
	output(", you try and keep it subtle, raising your hand like you’re ordering another round of drinks. Sylvie, being off her fucking rocker drunk, yells out at the top of her lungs. <i>“Kallllly! Bring that sweet dick over here so we can have a taste!”</i>");
	output("\n\nKally’s probably a fur-coated tomato by this point, but she shuffles over anyway. She glares at Sylvie with a look somewhere between “I’m going to strangle you” and “I’m going to make you choke on my dick”.");
	output("\n\n<i>“Syviiiiiiiiiiiiiiiiiie!”</i> Kally quietly screams out between gritted teeth.");
	output("\n\n<i>“Sorry Kally, I’ve just got this thing about big ol’ horsey dicks ever since I got one of my own, and you had yours just hanging there.”</i>");
	output("\n\n<i>“Only since you got one of your own?”</i> you chide.");
	output("\n\n<i>“Well, more of a one than before.”</i> She trails off dreamily as her massive mare meat throbs against her underside. Kally’s stallion is equally straining, as if the two are having a competition to see which one can drain more blood from their owners.");
	output("\n\nThe two have almost entirely lost focus as they ogle each other’s equipment. It’s a regular horse-cock house party here, and if the person coming towards you is who you think it is, it’s about to get even bigger.");

	var kallyCumQ:Number = kally.cumQ();
	//Kiro and Kally sitting in a tree F U C K I N G:
	if(kiroKallyThreesomes() > 0) 
	{
		output("\n\nSuddenly Kiro comes up and grabs Kally from behind, fondling her sister’s rock-hard cock while threading her own erection under her quaking sack. <i>“Guess who?”</i>");
		output("\n\nKally starts to moan out, only to be silenced as Kiro locks lips with her. Sylvie almost drools while she looks over the incestuous pair, cursing under her breath that she can’t reach her own cock to relieve the pent-up pressure.");
		output("\n\nThe ‘nukis part lips, Kally stammering out between moans of pleasure. <i>“K-Kiro please! I-I-I’m gonna cuuuuuum!”</i> Indeed, Kally’s cock is ");
		if(kallyCumQ < 8000) output("dribbling pre-cum liberally, slicking her feet and the floor in a thin puddle of nuki-horse cum.");
		else if(kallyCumQ < 16000) output("shooting huge gobs of pre onto the floor in front of her.");
		else output("lancing huge sprays of intoxicating seed, several feet in front of her. <i>“C-cum sooooooo much...”</i>");

		output("\n\nShe looks like she’s about to blow, right before Kiro pulls away from her with a flourish. Kally drops to her knees, trying desperately to resist touching herself while Kiro saunters over to Sylvie.");
	}
	else
	{
		output("\n\nIndeed, Kiro barges her way in between the two ready-to-rut girls. Her own bestial meat is shamelessly snaked up her dress, the head flaring between her tits, and her balls are swollen enough to be clearly visible beneath it.");
		output("\n\n<i>“Looks like you’re having some fun over here. Mind if I join in?”</i>");
		output("\n\nKally struggles to speak out in protest at having her sister expose herself in front of the whole bar, but Sylvie seems to feel the exact opposite. <i>“Go right ahead, cutie. The more the merrier!”</i>");
		output("\n\nKally shakes her head rapidly, still too shocked to speak properly. Kiro doesn’t care, though. <i>“Great!”</i> She lifts up her dress and lets her own flared meat fall into view.");
		output("\n\nSylvie coos while Kally recoils in embarrassment, actually falling back onto her cushy butt.");
		output("\n\n<i>“Come on sis, I see your dick every time I come in here. I’m just returning the favor.”</i> She’s joking around, though, there’s some kind of tension between the two that you could cut with a knife. Before it gets more awkward, Kiro turns to Sylvie and focuses on her.");
	}

	//first:
	if(flags["CANADIA_TRIPLE_HORSED"] == undefined)
	{
		output("\n\nSylvie snaps out of her stupor as Kiro approaches. <i>“Mhmmm, you’re just as bad as she said you were.”</i>");
		output("\n\n<i>“You’ve heard of me?”</i>");
		output("\n\n<i>“Bits and pieces from Kally. She might have let slip that you’ve been... naughty before.”</i> Kiro gulps as Sylvie steps toward her. <i>“Mhmmm, don’t worry, I won’t say anything. But if you do anything bad, I might have to break out the cuffs, and ‘discipline’ you.”</i> The moose-taur looms over Kiro, making sure to emphasize her own colossal cock. Kiro’s look is somewhere between excitement and terror; the usual reaction to a hung taur talking about plowing you. Before that can go any further, Kally gets up and interrupts.");
	}
	//Repeat
	else
	{
		output("\n\nSylvie smiles as the familiar felon approaches her. <i>“I knew you couldn’t resist coming back.”</i>");
		output("\n\n<i>“What can I say officer, your... authority is just hard to resist.”</i> Kiro says, staring directly at Sylvie’s rock-hard member. Sylvie is equally entranced with Kiro’s horse boner. You feel like one of them’s about to get on their knees and start sucking, before Kally gets up from the floor and interrupts.");
	}
	output("\n\n<i>“Guys, can we take this somewhere else?”</i> She points you in the onlooking crowd, embarrassed, and far more aroused than she’d like to be.");
	output("\n\nKiro finally takes notice of you. She comes up and wraps herself around you, lavishing your body in sesual attention while her hermhood throbs hotly agaist your leg. <i>“What do you say angel? There’s three, fat, throbbing, drooling horse cocks looking for holes to fill. Think you can take all of them?”</i>");
	output("\n\nIt’s a daunting proposal to say the least. <i>Are</i> you up to it?");
	processTime(20);
	pc.changeLust(20);

	clearMenu();
	if(pc.isPregnant()) addDisabledButton(0,"Gangbang","Gangbang","This would be unsafe given your current, pregnant state.");
	else if(!pc.hasVagina()) addDisabledButton(0,"Gangbang","Gangbang","You don’t even have a pussy!");
	else addButton(0,"Gangbang",tripleHorseingIntro,false,"Gangbang","You’ve always wondered what it’d be like to be a horse’s onahole.");
	if(pc.hasPerk("Buttslut")) addButton(1,"UpTheAss",tripleHorseingIntro,true,"Up the Ass","Let’s take this in a different direction.");
	else addDisabledButton(1,"UpTheAss","Up The Ass","You’d need to be a <i>special</i> kind of butt slut to even consider this.");
	addButton(3,"Nope",turnDownATripleHorsing,undefined,"Never Mind","You enjoy your organs far too much to do this.")
}

//Nope
public function turnDownATripleHorsing():void
{
	clearOutput();
	showSylvieAndKallyAndKiro();
	author("QuestyRobo");
	output("You politely decline, causing a collective sigh of disappointment to ring out from the three girls. ");
	//Kiro and Kally fucking:
	if(kiroKallyThreesomes() > 0) 
	{
		output("Kiro shrugs and walks back over to Kally and Sylvie, putting her arms around each of their shoulders. <i>“Looks like we’re making our own fun, girls. Don’t worry sis, I’ll drain <b>those</b> personally.”</i> She says, pointing at Kally’s massively swollen nuts. The two coo as Kiro leads them off, blatantly displaying them like a pair of first-place trophies.");
		output("\n\n<i>“Catch you later, Angel.”</i>");
	}
	else
	{
		output("\n\nBefore anyone else can say anything, Sylvie hoists Kally up and starts carrying her off. <i>“Don’t worry, I’ll get you taken care of.”</i> Kally struggles slightly, but eventually goes limp in the moose-taurs arms, getting carried away to sexy times unknown.");
		output("\n\n<i>“Welp, I got things to do, myself. Catch you later, Angel.”</i> Kiro dismounts herself from you, her cock still fully erect. Strangely, she seems to be following Sylvie. You wonder why.");
	}
	output("\n\nWith that, you’re left to your own devices, as well as the snickering, whispering crowd that still seems attentive to you, at least for a few minutes. When everything dies down, you go back to your business.");
	//Disable all 3 for an hour!
	pc.createStatusEffect("SYLVIE WORKING");
	pc.setStatusMinutes("SYLVIE WORKING",60);
	pc.createStatusEffect("KIRO_TEMP_DISABLED");
	pc.setStatusMinutes("KIRO_TEMP_DISABLED",60);
	pc.createStatusEffect("Kally Cummed Out");
	pc.setStatusMinutes("Kally Cummed Out",60);

	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function showSylvieAndKally(nude:Boolean = false):void
{
	showBust(sylvieBustString(nude),kallyBustString(nude));
	showName("SYLVIE\n& KALLY");
}
public function showSylvieAndKallyAndKiro(nude:Boolean = false):void
{
	showBust(sylvieBustString(nude),kallyBustString(nude),kiroBustDisplay(nude));
	showName("SYLVIE\n& KALLY & KIRO");
}

//Either Option
public function tripleHorseingIntro(upAss:Boolean = false):void
{
	clearOutput();
	showSylvieAndKallyAndKiro(true);
	author("QuestyRobo");
	var x:int = 0;
	if(pc.totalVaginas() > 1) x = pc.smallestVaginaIndex();
	if(!upAss) output("You feel [pc.oneVagina] squeeze in on itself. Whether it’s in anticipation or fear is beyond you at this point. All you need to know is that there’s a trio of horse-cocks in front of you, and you’ve got enough ready holes for each of them!");
	else output("The idea of taking one massive horse cock in your ass would give any normal person pause. The idea of taking two would make them quake in their boots. You’re not normal people though, not anymore. Your [pc.ass] was made to take cocks! Little cocks, big cocks, multiple cocks, all the cocks!");
	output(" You grab Kiro’s hefty meat and give it a quick jerk, signaling your approval without a single word.");

	output("\n\n<i>“Oooh, feeling feisty today, angel? Good.”</i> She returns the favor by grabbing your [pc.ass]. <i>“Because you’re gonna need a <b>lot</b> of energy for what’s coming up. Come on, girls!”</i> she yells out as she tightens her grip and uses it to lead you into the baths, the other two following closely behind.");
	//currentLocation = Baths
	currentLocation = "CANADA7";
	generateMap();
	output("\n\nWhen you get there, Kiro finds the closest, sturdiest looking bench and tosses you onto it, ass up. ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("You take the opportunity to strip yourself of all those pesky clothes you were wearing, tossing them off to the side, where they won’t get dirty. ");
	output("The horse-equipped trio surround you, puzzling out exactly what to do with you.");
	if(upAss && !pc.hasVagina()) 
	{
		output("\n\nKally pauses as she realizes something. <i>“Hey, there’s three of us, but [pc.name] only has two holes.”</i>");
		output("\n\n<i>“Don’t worry sis, [pc.name] is a top class slut. I’m sure [pc.heShe] knows what [pc.heShe]’s doing.”</i> Indeed you do. You spread your [pc.asshole] with one hand, and point toward Kiro and Sylvie with the other, crooking your finger to lead them into your ass.");
		output("\n\n<i>“See?”</i>");
		if(flags["CANADIA_TRIPLE_HORSED_ANAL"] == undefined)
		{
			output("\n\n<i>“T-that’s crazy!”</i>");
			output("\n\n<i>“Just trust [pc.himHer], sis. [pc.HeShe]’ll be fine.”</i> Kally still looks worried, but seems to be going along with it, now. Sylvie, on the other hand, seems excited at the prospect of really stretching you out.");
		}
		else output("\n\n<i>“Again? Jeez, you’re really addicted to doing this, aren’t you? You nod excitedly, eagerly waiting for them to start.");
	}
	else if(upAss)
	{
		output("\n\nKiro moans out as she grabs her cock. <i>“Aw yeah. I don’t get into good double penetration sessions often enough. Let’s start getting you ready he-”</i> she starts reaching for your [pc.pussy] and you wag your finger at her before she finishes. Your girly bits are going to wait, this time. You spread your [pc.asshole] with one hand, and point toward Kiro and Sylvie with the other, crooking your finger to lead them into your ass.");
		if(flags["CANADIA_TRIPLE_HORSED_ANAL"] == undefined) 
		{
			output("\n\nKiro coos in pleased surprise, but Kally is worried. <i>“Wait, two up your ass? T-that’s crazy!”</i>");
			output("\n\n<i>“Just trust [pc.himHer], sis. [pc.HeShe]’ll be fine.”</i> Kally still looks worried, but seems to be going along with it, now. Sylvie, on the other hand, seems excited at the prospect of really stretching you out.");
		}
		else output("\n\n<i>“Ever the buttslut, aren’t you, angel?”</i> You nod eagerly in agreement, causing the three to cheer eagerly.");
	}
	else
	{
		output("\n\nKiro walks up to you and sticks one of her fingers into your [pc.pussy], really digging it in, in order to get a good grasp of your capacity. <i>“");
		if(pc.wetness() < 3) output("Mmmm, gonna need extra lube for you.");
		else if(pc.wetness() < 5) output("Good wetness down here, angel. I love to see that from my sluts.");
		else output("Woah, now that’s a gusher. You want me to grab a few guys from the bar to help out down there? Who am I kidding; I want this all to myself.");
		output("”</i> She pulls out, satisfied with her findings.");
		output("\n\n<i>“I call pussy!”</i> she yells out.");
	}
	output("\n\n<i>“Alright sluts, gather around for some lube.”</i> Kiro pulls out a huge bottle of her favorite elasticizing lube. From where, you have no idea. ");
	var kallyCumQ:Number = kally.cumQ();
	if(kiroKallyThreesomes() > 0) 
	{
		output("She personally administers the lubricant, squirting out huge flows into her hands and vigorously jerking off both Sylvie and Kally.");
		output("\n\nSylvie groans out. <i>“Ooooh, you’re such a dear! Mhnf, I wish I could reach down theeeeere.”</i>");
		output("\n\nKally almost seems to be competing with Sylvie in how much she can get off from Kiro’s ministrations. <i>“Kiroooooooo, why are your hands so gooooood?”</i>");
		output("\n\n <i>“Lots of practice, sis. Maybe you should help me out one of these days?”</i>");
		output("\n\n<i>“Yesyesyesyesyeeeeeeeeeeeeeeeees!”</i> Kally’s eyes starts to cross as her cock ");
		if(kallyCumQ < 8000) output("dribbles");
		else if(kallyCumQ < 16000) output("drools");
		else output("spews");
		output(" pre-cum. Kiro seems to think that’s enough lube for both of them, and starts to get herself ready. Instead of just using the lube, she plants her dick against her sister’s soaking up the pre that she’s leaking. ");
		if(kallyCumQ < 8000) output("Of course it’s not enough to get her fully ready, and she squirts another volley onto her’s and Kally’s members.");
		else if(kallyCumQ < 16000) output("Kally’s enhanced production provides ample lube, but not quite enough for Kiro’s mammoth member. She squirts another round onto their twined meat.");
		else 
		{
			output("Kally’s production is utterly obscene at this point. In a only a few seconds, she manages to squirt out enough pre to fully cover Kiro’s cock, <i>and</i> give her own a second coating.");
			output("\n\n<i>“Proud of you,”</i> Kiro declares as her sisters pre overflows their stacked sticks.");
		}
		output(" She pulls away, leaving the chubbier ‘nuki panting like the pent-up whore she is. <i>“Don’t blow your top yet, Kally. [pc.name] needs [pc.hisHer] treat.”</i> Kally nods and settles down before turning to you.");
	}
	else
	{
		output("\n\nShe gets to work immediately on Sylvie, squirting out a huge gout of lube onto her tauric member, and jerking her vigorously.");
		output("\n\n<i>“Ooooooh, you’re such a dear. Mhnf! I wish I could reach down theeeeeere!”</i>");
		output("\n\nKally looks embarrassed, and aroused at watching her sister jerk off a massively hung taur. She starts to mindlessly jerk herself off, but quickly returns to some kind of sense as she remembers the point to all of this.");
		output("\n\n<i>“H-hey, toss me some of that lube.”</i> Kiro does so with one hand, not even losing a stroke on Sylvie as she tosses the bottle of lube at her sister. Kally barely manages to get her hands off her cock in time to catch it. She squeezes a streak out on her member, and moans out as she renews her strokes.");
		output("\n\nSylvie’s beast member starts drooling pre-cum, drawing a big grin out of Kiro. She takes her other hand and scoops up the musky mixture of pre and lube. She brings it up to her nose for a quick sniff that causes the degenerate delinquent to shudder. After licking her lips, she rams her hand down her shaft to her base, vigorously working herself, and Sylvie over.");
		output("\n\nThe three seem to be reaching a fever-pitch before Kiro manages to yank herself off herself and Sylvie, and then calms Kally down.");
		output("\n\n<i>“C-come on sis’, save it for [pc.name]!”</i>");
		output("\n\nKally gasp and nods as she drags herself off her cock and turns to you.");
	}
	output("\n\n<i>“I guess I better rear up first.”</i> Sylvie walks up and plants herself above you, her fat moose cock planted right up against your [pc.anus]. Kiro steps up behind her, while Kally works around to your front.");

	output("\n\n<i>“Mhmm, nice view back here.”</i> Kiro plants a kiss on Sylvie’s sweltering taur-pussy, drawing a moan out from her.");

	output("\n\n<i>“Same over here.”</i> Kally grabs the moose-taur’s massive tits and starts manhandling them.");
	output("\n\nSylvie cries out. <i>“A-ahh, appreciate the compliments, but shouldn’t we be focusing on [pc.name]?”</i>");
	output("\n\n<i>“Why not both?”</i> Kiro lines up her cock ");
	if(!upAss) output("with your [pc.pussy " + x + "]");
	else output("alongside Sylvie’s");
	output(", while at the same time diving deeper into Sylvie’s cunt. Kally follows suit and brings her beast cock in line with your face.");

	output("\n\n<i>“Hope you’re ready, sugar, cause I don’t think I can hold my hips back after all of this.”</i> You’re as ready as you’ll ever be, not like saying otherwise would mean anything at this point. The trio line up, pull back, and thrust in.");
	output("\n\nIt’s an almost transcendental experience, having three giant futa cocks spear you at the same time. Your body feels like a machine made for pleasure; the way their cocks throb in joy, the way they cry out in sheer bliss as they stretch you beyond reason, it all jolts something deep inside you that says <i>“this is right.”</i>");
	if(!upAss) 
	{
		pc.buttChange(sylvieCockVolume());
		pc.cuntChange(x, kiro.cockVolume(0));
	}
	else pc.buttChange(sylvieCockVolume() + kiro.cockVolume(0));
	output("\n\n<i>“Uuuugh! So fucking tight! Stars, I feel you down there, Kiro. [pc.name] is so nice letting us both in, isn’t [pc.heShe]?”</i>");
	output("\n\nKiro responds, but with her face buried in moose-muff, all that any of you hear is gibberish, undercut with pleasure. You feel her cock throbbing even harder inside you, spurred to even greater hardness and size by the avalanche of pheromones she’s buried herself in.");
	output("\n\nKally moans out in front of you as she slides inch after inch down your throat. ");
	if(pc.canDeepthroat()) output("You take each one like a champ, even flexing your throat in such a way that it draws the horny bartender in faster.");
	else output("Each one is a struggle, but it’s a struggle that you’re willing to make.");
	output(" She bottoms out, pushing your face into her fuzzy crotch, and letting you feel her throbbing sack on your chin.");
	output("\n\n<i>“Ooooooh, your throat is so goood, [pc.name]! D-don’t want to cum yet. Just give me a minute.”</i>");
	output("\n\nSylvie doesn’t seem to be listening, as she pulls Kally into a deep kiss, pressing their fat tits against each other.");

	output("\n\nThe action on your lower half has been pretty slow so far. They’ve mostly been sitting there, throbbing and spurting pre inside you, while they wait for you to adjust. Kiro breaks that calm in feral fashion. The pheromone-soaked kui-tan drags her head out of Sylvie’s drooling cunt just enough to yell out like a mad woman. As she does that, she yanks her beasthood out of you, to the tip, and rams it back in with all her might.");

	if(upAss) 
	{
		output("\n\nBeing in the same hole, Sylvie’s cock gets dragged along with Kiro’s, the moosey mountie spurred to movement whether she likes it or not. She pops off of Kally’s lips when she feels the disturbance.");
		output("\n\n<i>“H-hey, remember who you’re in there with! I guess we’re off to the races now. Hope you’re ready!”</i>");
	}
	else
	{
		output("\n\nSylvie dislodges from Kally and groans out when Kiro moves, feeling their cocks rub together through your thin inner walls. Hell, it’s making you go almost crazy.");
		output("\n\n<i>“Unf, getting started now? Alright. Hope you’re ready, [pc.name]!”</i>");
	}
	output("\n\nSylvie follows Kiro’s lead, thrusting <i>deep</i> inside of you, causing your gut to bow out to near bursting. She has some trouble syncing up with Kiro’s ravenous pace, but she works it out. You groan around Kally’s fat, throat-stuffing dick, your eyes crossing in pleasure as your body feels like it’s overheating.");
	output("\n\nYou cum immediately,");
	if(pc.hasCock()) 
	{
		output(" your [pc.cocks] limply soaking the bench under you, and");
	}
	output(" your ass ");
	if(pc.hasVagina()) output("and [pc.vaginas] ");
	output("squeezing down on the invading horse members as hard as your muscles will allow. This doesn’t seem to even slow the two down. Between Kiro’s pheromone-induced rut and Sylvie’s tauric strength, they batter down your resistance before it can even begin.");

	output("\n\nYou feel another orgasm trailing right on the heels of the first one. ");
	if(upAss) 
	{
		output("You welcome it with open arms, embracing the mindless anal pounding. This is <i>exactly</i> what you’ve wanted ever since ");
		if(pc.hasPerk("Buttslut")) output("that wonderful trip into the buttslutinator");
		else output("you learned the <i>truth</i> about what your ass is for");
		output(". Your body and mind were molded just for this, and you gleefully sink into your destined role as a mindless cumdump.");
	}
	else output("You try and hold it back, to retain some ounce of sanity and not just be reduced to a horse-cock fuckpuppet, but nothing can close the floodgates now that they’ve been so thoroughly ripped open.");
	output(" You cum again, and again, and again, every muscle in your body going slack, and every neuron in your brain frying with pleasure.");

	output("\n\nKally, spurred on by the sheer energy of the other two, as well as your dopey, cross-eyed stare as you choke on her cock, gets moving again. She groans heavily in effort as she rears back and slams herself into your throat. Her weighty balls slam against your chin as she bottoms out again. With how fucked-out your body is, there’s no resistance for her to break through. Her strokes are interrupted, though, when Sylvie grabs the chubby ‘nuki, and presses her into a tight hug.");
	output("\n\nThe rutting taur is barely holding it together at this point. Kiro’s frantic feasting on her animalistic womanhood is loud enough to echo throughout the baths, and her thrusts have grown nearly as desperate as Kiro’s. Even with her speed, you can feel her throbbing <i>hard</i>. She’s almost there, and both of you know it.");
	output("\n\n<i>“Uuugh. Sorry girls, looks like I’m going f-fiiiiiiRRRST!”</i> Her thrusts stop and her cock bloats. She yanks Kally even further in, pulling her into a deep kiss. Kiro doesn’t stop though, not even when massive gouts of moose-taur cum come rushing through Sylvie’s urethra. The tightness of the two titanic pieces of meat means that Kiro’s thrusts actually compresses Slyvie’s cumvein enough to keep her orgasm from fully blooming.");
	output("\n\nShe pulls away from Kally again, leaving the overwhelmed nuki hanging limply, aside from her thrusting hips. <i>“Kiro pleeeeeeeeease! I need to cum!”</i> Despite the blockage on her male half, from the sounds of it, her female half is cumming along nicely. Kiro almost chokes as a rush of girl cum shoots down Sylvie’s passage, soaking the desperate ‘nuki, and causing her to finally take her head out of the mountie’s ass.");
	output("\n\n<i>“Oooooooooh fuck, Sylvie! I could drown in this stuff back here.”</i>");
	output("\n\n<i>“Glad you l-li-UUUUGHH!”</i> Her sentence is interrupted when the pressure on her urethra finally overwhelms the tightness of your insides. Moose cum blasts into your bowels");
	output(", stretching your [pc.belly] into a gravid dome.");

	output("\n\n<i>“Blowing already, big girl?”</i>");
	output("\n\n<i>“...Sorry. I think I can keep going.”</i>");
	output("\n\n<i>“Maybe you can...”</i> Kiro mutters. You soon find out why, when the two start thrusting again. Kiro’s balls feel like two beach balls slapping against your [pc.ass]. They quake and throb hotly, so delightfully overstuffed with her musky cum that the skin has gone completely taut.");
	output("\n\nYou quickly realize that Kally is in the same position. Her balls are the size of pumpkins, and slowly growing by the second. Her thrusts have grown even more frantic, barely even bothering to bottom out anymore. When she’s not smooching Sylvie, she huffing and moaning and groaning like a complete slut. Her copious pre is starting to tinge with her signature alcoholic flavor, causing your already light head to swim even more.");
	output("\n\nThe three finally seem to be at their limit. The small, sexual enclave that your orgy has created is sweltering and sweaty, everyone inside well worn and ready to blow. Sylvie’s already cum once, so she’s far too sensitive to keep going for too long on round two. Kiro’s balls are so big that she has to fan her legs all the way out, and she likely won’t be able to walk, or thrust if she goes on too much longer. Kally is just at the end of her rope, barely even conscious at this point.");
	output("\n\n<i>“F-f-fuuuuuck! I can’t take it anymore, angel.”</i> Kiro bottoms out as quickly as she can. <i>“Cuuuuuming!”</i> As soon as she says that, everyone cries out in unison, joining her.");
	output("\n\nYou fill out like a balloon attached to a fire hose, reaching limits of fullness that you never thought were possible. The three over-productive skanks make sure that every single inch of space inside of you is filled with their essence, before pulling out. It should hurt, or at least feel strange, but you’re stuffed with so much of Kally’s intoxicating brew, that you can’t feel anything but absolute pleasure.");

	output("\n\nThe three absolutely baste you in their fluids, the excess running off into a pool beneath the bench. ");
	if(kallyCumQ >= 16000) output("Kally absolutely steals the show, though. The virility drugs she’s been taking have turned her into a one-nuki tsunami. Kiro and Sylvie look on in awe as she outpaces both of them put together. Kally herself is far too engrossed in it to really notice. Her eyes are completely screwed up into her head, and her mouth hangs open in silent bliss. ");
	output("They all eventually run dry, limply falling to the ground in various states of exhaustion. You yourself are completely immobilized on the bench, looking like a galotian that just got done being the center of a kui-tan gangbang. Which isn’t really far from the truth.");
	output("\n\n<i>“That... was... amazing!”</i> Kiro exhaustedly cries out, to weary, but enthusiastic cheers from the rest of you.");
	output("\n\nKally rouses from her stupor. <i>“I-I’m gonna g-get this cleaned up. Sylvie, could you be a de");
	if(!silly) output("a");
	else output("e");
	output("r and get [pc.name] cleaned up? You can pop [pc.himHer] in my room when you’re done.”</i>");
	output("\n\nSylvie complies, picking up your well-used form and taking you off. Unfortunately, the feeling of gallons of hot fluid sloshing around inside of you as you’re moved is enough to finally take you down, and you pass out on Sylvie’s back.");
	processTime(35);
	var cummies:Number = 13+rand(5);
	for (var y:int = 0; y < cummies; y++) { pc.orgasm(); }
	var sylviesLoad:PregnancyPlaceholder = sylviePP();
	pc.loadInAss(sylviesLoad);
	pc.loadInAss(sylviesLoad);
	if(upAss) pc.loadInAss(kiro);
	else pc.loadInCunt(kiro, x);
	pc.loadInMouth(kally);
	pc.applyCumSoaked();
	if(upAss) IncrementFlag("CANADIA_TRIPLE_HORSED_ANAL");
	else IncrementFlag("CANADIA_TRIPLE_HORSED");
	clearMenu();
	addButton(0,"Next",tripleHorseingOutro);
}

//[Next] //Three hours pass.
public function tripleHorseingOutro():void
{
	clearOutput();
	author("QuestyRobo");
	showName("KALLY’S\nBEDROOM");
	currentLocation = "CANADA8";
	generateMap();
	output("You wake up in Kally’s bedroom, cleaned up, but still stuffed full of nuki and taur cum. You’re also still tipsy from Kally’s copious cum, and the smell of it still wafts off of your skin. Still, you manage to get up and head down to the bar");
	if(!pc.isNude()) output(" re-dressing yourself before leaving the room, of course");
	output(". When you get down there, Kally, ");
	
	if(!sylvieInBar()) output("and Kiro");
	else output("Kiro, and Sylvie");
	//force Kiro to be new bar-girl:
	flags["BAR_NPC"] = kiroSetup;
	flags["BAR_NPC_TIMER"] = GetGameTimestamp();
	output(" are still there, and each give you a sly look, as well as several of the bar patrons.");
	output("\n\nIt might have gotten a little out of hand, but it doesn’t seem like anyone minded, least of all you.");
	processTime(60*2+30);
	//Kiro and Sylvie have shit to do :3
	if(!pc.hasStatusEffect("SYLVIE WORKING")) 
	{
		pc.createStatusEffect("SYLVIE WORKING");
		pc.setStatusMinutes("SYLVIE WORKING",260);
	}
	if(!pc.hasStatusEffect("KIRO_TEMP_DISABLED"))
	{
		pc.createStatusEffect("KIRO_TEMP_DISABLED");
		pc.setStatusMinutes("KIRO_TEMP_DISABLED",240);
	}
	IncrementFlag("SEXED_SYLVIE");
	//Count as a threesome IF they're already bangin'
	if(kiroKallyThreesomes() > 0) kiroKallyThreesomes(1);
	clearMenu();
	addButton(0,"Next",move,"CANADA5");
}

