import classes.Items.Miscellaneous.SmallEgg;

public function showShelly(nude:Boolean = false):void
{
	showBust(shellyBustDisplay(nude));
	
	if(flags["KNOW_SHELLYS_NAME"] == undefined) showName("BUNNY\nWOMAN");
	else showName("\nSHELLY");
}
public function shellyBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "SHELLY";
	
	if(flags["CAME_INSIDE_SHELLY"] != undefined || pc.hasStatusEffect("Shelly Leave Egg CD")) sBust += "_HUGE";
	if(nude) sBust += "_NUDE";
	
	return sBust;
}

public function shellyCapacity():Number
{
	return 150;
}

//First encounter
public function ShellyBlurb(slot:int = 5):void
{
	if(pc.hasStatusEffect("Shelly Assist Cooldown")) return;
	if(flags["KNOW_SHELLYS_NAME"] == undefined) {
		output("\n\nYou notice a new addition to the bar’s normal clientele; a lone woman stands near the back wall, trying to get the attention of passersby. A closer look reveals her to have tall bunny ears atop her head and a slightly distended belly.");
		addButton(slot,"BunnyWoman",investigateSlashShelly,undefined,"Bunny Woman","What might she be offering?");
	}
	else 
	{
		output("\n\nShelly stands at the back of the bar, trying to advertise Ovilium to anyone who will listen.");
		addButton(slot,"Shelly",investigateSlashShelly,undefined,"Shelly","She looks like she needs some assistance. ");
	}
}

//[add option “investigate” to list of possible bar happenings]
public function investigateSlashShelly():void
{
	clearOutput();
	showShelly();
	author("Gardeford");
	//Investigate
	if(flags["APPROACHED_SHELLY"] == undefined)
	{
		flags["APPROACHED_SHELLY"] = 1;
		output("You decide to check out the bunny girl at the back of the bar. As you get closer you notice she holds a sign with the Xenogen Biotech logo emblazoned across its top. The sign proclaims the advent of a new product, “Ask about Ovilium!”, designed to assist with all situations in which eggs and milk are required. The girl herself seems a little nervous, and as you finally reach her you see part of the reason why. Her clothing consists of a denim bikini that barely conceals her D-cup chest and short shorts that offer even less coverage to her legs. Colorful easter eggs have been tattooed across her pregnant looking stomach. Tall pink bunny ears topped with rainbow, cotton-like puffballs that bob and turn to meet new noises poke out from her head of baby blue hair. In contrast to her hair and ears, her skin is as dark as baker’s chocolate. A faint sugary scent emanates from her like perfume, leaving you with a bubbly smile. When she notices you looking her over, she blushes and smiles.");
		output("\n\n<i>“H-hi there, would you care for some info on Xenogen Biotech’s newest product?”</i>");
	}
	//Repeat [shelly]
	else
	{
		if(flags["KNOW_SHELLYS_NAME"] != undefined) 
		{
			output("You [pc.walk] up to Shelly, and she waves happily when she sees you coming.");
			output("\n\n<i>“Hey [pc.name], you need anything?”</i>");
		}
		else 
		{
			output("You [pc.walk] up to the bunny woman, and she locks you with a hopeful look when she sees you approaching.");
			output("\n\n<i>“Hello again. You need something?”</i>");
		}
		output(" she asks with a warm grin.");
	}
	//[talk] [assist] [sex] [leave](at first only talk and leave available, after talk you get assist, after assist cock weilders get other sex)
	clearMenu();
	addButton(0,"Talk",talkToShelly);
	if(flags["TALKED_TO_SHELLY"] == 1) addButton(1,"Assist",assistShellyLaying,undefined,"Assist","Help Shelly lay some eggs.");
	else if(flags["KNOW_SHELLYS_NAME"] == undefined) addDisabledButton(1,"Assist","Assist","You must talk to the bunny woman before you can assist her with anything.");
	else addDisabledButton(1,"Assist","Assist","You must talk to Shelly before you can assist her with anything.");
	if(flags["ASSISTED_SHELLY_WITH_LAYING"] != undefined)
	{
		if(pc.hasCock() && pc.lust() >= 33)
		{
			if(pc.cockThatFits(shellyCapacity()) >= 0) addButton(2,"Sex",sexWithShelly);
			else addDisabledButton(2,"Sex","Sex","You’re too big to fit inside Shelly.");
		}
		else addDisabledButton(2,"Sex","Sex","Sex with Shelly requires both a phallus and lust to be at or above 33.");
		
		if(flags["ASSISTED_SHELLY_WITH_LAYING"] >= 3)
		{
			if(silly) addButton(6,"Assist+",shellyIntenseEggLaying,undefined,"Uneggspected Eggspelling in Eggcess","<i><b>Really</b></i> help Shelly lay some eggs. <i>Eggcelsior!</i>");
			else addButton(6,"Assist+",shellyIntenseEggLaying,undefined,"Intense Egg Laying Session","<i><b>Really</b></i> help Shelly lay some eggs.");
		}
		if(pc.hasHardLightEquipped() && pc.hasHardLightUpgraded()) addButton(3,"Tool Assist",dildoLayAssistForShellyBuns,undefined,"Tool Assist","Use your size-adjustable hardlight to help Shelly lay... and to make sure the eggs rub her g-spot on their way out.");
		else addDisabledButton(3,"Tool Assist","Tool Assist","You need hardlight-enabled underwear with an adjustable-size upgrade for this.");
	}
	else 
	{
		addDisabledButton(2,"Sex","Sex","Shelly isn’t interested in sex unless you’ve already “Assist”ed her.");
		//tooltip disabled, has not assisted Shelly normally yet: {Shelly/The bunny-girl} is too wary to agree to this until you get to know her, and her unusual biology, a little better.
		addDisabledButton(3,"Tool Assist","Tool Assist","She is too wary to agree to this until you get to know her, and her unusual biology, a little better.");
	}
	addButton(14,"Leave",mainGameMenu);
}

//Talk
public function talkToShelly():void
{
	clearOutput();
	showShelly();
	author("Gardeford");
	flags["TALKED_TO_SHELLY"] = 1;
	output("You ask the embarrassed bunny-girl about her sign and what she’s doing in the bar. She brightens, looking a little less nervous.");
	output("\n\n<i>“Really? You want to hear about it? Everyone else has just been rude”</i> she says, the relief evident in her voice. You assure her that you’d love to hear about this “Ovilium” stuff.");
	output("\n\n<i>“Awesome! Well, it’s the newest product out of Xenogen Biotech’s development labs. It’s supposed to help with lactation for pregnant women with deficient mammary glands who don’t want to use artificially made milk,”</i> she begins, pointing to the reference to milk on the sign.");
	output("\n\nYou ask her if that’s the reason she was chosen for testing, seeing as she looks quite pregnant.");
	output("\n\nThe dark skinned girl averts her eyes and fiddles with her sign for a moment. <i>“Well, kinda, not really. So this was made for people who were already pregnant, but they needed to test it on people who weren’t pregnant as part of medical trials. I signed up because they were offering good money to be part of the trials and living on the fringe planets isn’t always the easiest. So when I get to the testing site, they give me this gummy medicine that looks more like a piece of candy than your average drug. I take it like they tell me to, and at first, nothing really happens, and the scientists are looking kinda bummed out. Then, there’s this kinda popping noise and my stomach kinda pokes out to about half the size it is now. The scientists look kinda surprised and run over with a mini X-ray screen. When they hold it over my midsection, lo and behold, I’ve got eggs,”</i> she says, patting her belly with one hand.");
	output("\n\nYou chuckle, telling her that part of her problem might be people thinking she’s just pregnant in a bar. She frowns slightly and removes her hand.");
	output("\n\n<i>“Yeah I guess, but you only got half the story. The trial I was in was more than a year ago. Apparently the test drug they gave me was a little too effective, so whenever these eggs come out more replace them near immediately. The drug that’s going to markets is improved, no permanent effects. They must have realized people would make that mistake like you thought though. The company gave me a job promoting the product, and it’s okay money - enough to rent a room on the station,”</i> she says, sounding a little more optimistic at the end.");
	output("\n\nYou mention that you heard her mentioning “layings” and ask what that entails. She blushes and sets the sign off to the side, weaving her fingers together and looking around to see if anyone else is listening.");
	output("\n\n<i>“Well, so I’m full of eggs, and even though they keep coming back, laying is fairly regular. Usually it’s just once every couple days, but they can be... coerced to come out sooner. If you get over the fact that they came out of a person, they taste really sweet,”</i> she says with an embarrassed smile. Without really thinking about it, you tell her you’d be happy to assist her with laying eggs if she ever wanted help. The dusky saleswoman’s pink bunny ears turn beet red as she takes in your words, and you realize what you said.");
	output("\n\n<i>“W-well, if you really wanted too, I’d be okay with it. If I just wait for it to happen, they kinda build up and get heavier. My name is Shelly by the way,”</i> she says, brushing her hair away from her face. You aren’t sure if she’s desperate or if you made that big of an impression being the only person who came up and talked to her, but it seems she’d be willing to let you help her, and all that entails. You give her your first name in return and tell her you’ll probably be back soon.");
	flags["KNOW_SHELLYS_NAME"] = 1;
	//pass 30 min
	processTime(30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Assist
public function assistShellyLaying():void
{
	clearOutput();
	showShelly();
	author("Gardeford");
	output("You tell Shelly if she wants some assistance with her egg laying, you’re available now. She nods, grinning and gripping your hand tightly as she pulls you to one of the back rooms. The room is well lit and surprisingly comfortable-looking for what you would expect from a bar like this.");
	output("\n\n<i>“The company gave me this room in case I needed to use it for emergencies. They refurbished it to be a little more inviting than it originally was,”</i> she says as she continues in and stands by the bed. <i>“Okay, so all you need to do is stimulate me... down there.”</i>");
	output("\n\nA blush begins running up her ears, but you tell her not to worry; you’ll have the excess eggs out of her in no time. This calms her down a bit, and she sits on the edge of the bed, reaching behind her back to undo her bra. You take that time to kneel at the foot of the bed next to her, unbuttoning the fastener on her shorts and pulling them down to reveal a pair of gray lace underwear. Not exactly the sexiest you’ve ever seen, but by no means a mood dampener.");
	output("\n\nYou loop your fingers into the elastic band of her undergarments, brushing from her front all the way back to her butt before pulling them down over her legs and feet. It’s hard not to giggle as you see her pink, fluffy cottontail sitting at the base of her spine. You lean forward and kiss her belly, looking up to see her peering down at you through the canyon of her freed, D-cup chest.");
	output("\n\nHer dusky nipples look too inviting to ignore, and you raise your head a little to give one a lick, playing with the other gently. Shelly hums happily as you wrap your lips around her teat, sucking softly. You’re pleasantly surprised when after a moment, a small stream of sweet liquid flows into your mouth. You drink a few spurts of the sugary milk before popping off the tap and licking your lips with a smile. The chocolate bunny girl giggles and leans back onto the bed.");
	output("\n\n<i>“That’s another side effect of my prototype drug test. My insides are sweet like candy,”</i> she says seductively, holding open her mons with two fingers, revealing the pink insides and round clit. You move closer, kissing the inside of her thighs as you approach your ultimate goal. Not wanting to leave her in suspense much longer, you give her sex a big pressing lick from bottom to clit, traveling over her entrance and prompting a drawn-out moan from over the dark mountain of her belly.");
	output("\n\nShe wasn’t wrong when she said she was sweet. Her juices taste like candy, and you nearly get a sugar high during the heavy licking you give her dripping cunt. She grips your head with both hands, holding you there as you mash your face against her. You bring your hands up around her sides, playing with her breasts while her hands are occupied. Her milk appears to be slowly leaking as you give her pussy attention, and you rub it over her chest until it feels slick with candied shine.");
	output("\n\nAfter you’ve fully shined her boobs, you bring one hand back down by your mouth, rubbing her ample butt with a milk covered hand. You glide your slippery fingers between her cheeks, rubbing a thumb at the entrance to her asshole. The juices from your licking have further soaked the hole, leaving it ready for penetration. Slowly but surely, you sink your thumb into her, rubbing the hot walls of her anal passage.");
	output("\n\nThe slow penetration is apparently too much for her to handle, and you feel her tense up and howl with pleasure as she cums, covering your face in sweet juices. You continue licking through it, determined to have her spouting eggs by the end of this.");
	output("\n\n<i>“Eggs, coming, here they c-cumm,”</i> she says weakly, tensing and contracting as you kiss around her legs. You hold out a hand as a pink and purple egg suddenly pops out of her snatch. It is followed quickly by a single colored egg and one with polkadots. At first you think they’re all you’ll get for now, but she tenses one more time as an egg roughly the size of the other three combined slowly pushes through her. By this time, her stomach has noticeably shrunk, and you can see her eyes unfocus as the giant egg leaves her body.");
	output("\n\nYou leave the eggs in a pile on the bed beside her and hoist yourself up to give her a kiss on the lips. Your chocolate-coated, candy treat kisses you back and grins happily. Her entire body glistens with sweet liquids that soak the bedsheets around her and smell like a syrupy perfume.");
	output("\n\n<i>“Thanks for the help, I’d love to do it again some time. You can have one of the eggs if you want. I don’t know if the colors are special, but they all taste really good as far as I’ve tested them,”</i> she says, her amber eyes beaming up at you.");
	if(flags["ASSISTED_SHELLY_WITH_LAYING"] == undefined) output("\n\nYou tell her you’d be happy to take one and give her another kiss for good measure. She laughs warmly and tells you she’ll lie here for a half hour or so to recover before she goes back to her job.");
	else output("\n\nYou tell her you’ll be sure to come back to help again some time, and leave with one of the smaller eggs in your hand.");
	output("\n\n");
	processTime(40+rand(10));
	IncrementFlag("ASSISTED_SHELLY_WITH_LAYING");
	pc.lust(15+rand(3));
	pc.milkInMouth(getShellyPregContainer());
	pc.girlCumInMouth(getShellyPregContainer());
	pc.createStatusEffect("Shelly Assist Cooldown", 0, 0, 0, 0, true, "", "", false, (30 + rand(16)));
	//[gain small egg](just restores small hp amount unless you wanna make it like coc eggs)
	//Set quantity!
	//Start loot
	oviliumEggReward();
}

public function getShellyPregContainer():PregnancyPlaceholder
{
	var pregContainer:PregnancyPlaceholder = new PregnancyPlaceholder();
	pregContainer.createStatusEffect("Infertile");
	pregContainer.breastRows[0].breastRatingRaw = 4;
	pregContainer.milkType = GLOBAL.FLUID_TYPE_VANILLA;
	pregContainer.milkMultiplier = 100;
	pregContainer.milkFullness = 100;
	return pregContainer;
}

//Sex
public function sexWithShelly():void
{
	clearOutput();
	showShelly(true);
	author("Gardeford");
	
	var x:int = pc.cockThatFits(shellyCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	processTime(50+rand(10));
	
	output("You ask Shelly if she’d be up for a little more than just egg-laying assistance. She looks confused for a moment before realization lights up her face.");
	output("\n\n<i>“Really? You’d do that, with me?”</i> she asks, obviously happy but not totally sure.");
	output("\n\nYou tell her there’s nothing you’d rather do more at the moment. She takes your arm, pulling you into the back room nearly bouncing on her heels. When you arrive in the comfortable looking lodging, She turns around, presses herself against you, and ");
	if(!pc.isNude()) output("begins to remove your [pc.gear], brushing her fingers against your [pc.skinFurScales] as your body is revealed");
	else output("begins exploring your body with her hands, unhooking your codex from its belt and laying it gently on the bed");
	output(". You reciprocate her attention, untying her bikini and pulling it away from her dusky D-cups.");

	output("\n\nYour hands crawl down over her egg filled belly, fingers tapping against the brightly colored egg tattoos that dot her skin. Shortly after, you reach her pants, undoing the button and pulling them over her bountiful bottom. She’s wearing pink lace underwear, criminally cute when her small cotton-ball of a tail is factored in, sticking halfway out of the offending garment. Not wanting to leave it cooped up, you loop your thumbs into the lace band and pull her panties down to the floor. After she steps out of them, you turn her around so that her front faces the bed, back to you.");

	//pc non-taur
	if(!pc.isTaur())
	{
		output("\n\nYou grasp your [pc.cock " + x + "], bringing its length to bear and slipping it between her thighs. You hear her gasp with surprised pleasure as the top of your [pc.cock " + x + "] slides over her slit, parting her folds slightly and rubbing her heated entrance. She turns her head to kiss you, and you return it, playing with her tongue and tasting her candy sweet saliva. You rub her legs and grip them, preparing to lift her up.");
		pc.cockChange();
		output("\n\nWhen you hoist, you’re surprised to find her to be incredibly light and end up nearly flinging her onto the bed. She gives a surprised giggle, not realizing your overzealous lift was an error. You’re happy to go with it, lowering her back until your [pc.cockHead " + x + "] slightly pushes her folds apart, hovering just above penetration. After a few seconds of teasing rubs, you slowly lower her over your [pc.cockNounSimple " + x + "].");
		output("\n\nShe sighs with ecstasy as you fill her, her heated insides clamping down on your [pc.cock " + x + "], until soon ");
		if(pc.cockVolume(x) <= 50) output("you hilt inside her");
		else output("your [pc.cockHead " + x + "] bumps into her cervix");
		output(". You begin bouncing her lightly, moving your hips in time with her body to give her the best experience you can. While you work, she begins kneading her breasts, causing small beads of milk to drip down over her hands as she tugs on the nipples.");
		output("\n\nYou kiss her neck and let one of your hands slide down her leg to play with her budding clit, rubbing the sensitive nub and bringing a lusty moan to your easter treat’s lips. Her moans slowly increase in intensity until she clenches tightly around you, her hands squeezing her breasts so hard that a small spurt of milk sprays onto the bed. Her legs splay out and her toes clench in the air.");
		output("\n\nYou spin her around on your [pc.cock " + x + "] so that she faces you, not giving her a chance to rest. Her stomach is too big to press her against you, but you hold her with one hand at her bottom and the other at her back, giving her ample support as you fuck her silly. You give her a kiss that she returns with gusto, still holding onto her wits despite her intense orgasm.");
		output("\n\nHer legs are now locked around your waist, giving her a better grip to bounce with. She holds your shoulders in both hands, allowing you to use your other hand to play with her breasts. The milk-slicked mounds shine with sugary goodness, and you give one a taste, settling on the nipple to get a drink straight from the source.");
		output("\n\nHolding some of the sweet fluid in your mouth, you kiss Shelly again. She accepts her own sweet milk from you, swallowing the delicious mouthful and leaving a trail of sticky saliva between the two of you when the kiss ends. ");
		if(!pc.hasTailCock()) output("You position the hand holding her ass so that you can stick a finger inside, prompting a pleased gasp from the dusky beauty.");
		else output("You bring your [pc.tailCock] around, sliding it into her well lubed asshole. She gives a pleased gasp as you piston it in and out inside her.");
		output("\n\nYou can practically feel her lust building toward the second orgasm, and can feel your own edging ever closer. She seems to sense this and tries to tell you something.");
		output("\n\n<i>“W-wait! Shoot outside... please,”</i> she says between ecstatic moans. It looks like you have a decision to make.");
		clearMenu();
		addButton(0,"Outside",humanoidsCumOutsideShelly);
		addButton(1,"Inside",humanoidsCumInsideShelly);
	}
	//Pc taur 
	else
	{
		output("\n\nYou silhouette the dark skinned delicacy with your hands, prodding her to bend forward in front of the bed. Shelly bends sensually, holding her pussy open with two fingers and aiming a seductive gaze at you over her shoulder. You lean your upper body over her, grasping a breast in each hand and giving her a deep kiss.");
		output("\n\nAfter a moment you bring your tauric half up, feeling your underside brush over her smooth back until [pc.cock " + x + "] slides like a puzzle piece between her cheeks. You rub back and forth against her, letting her prepare for penetration and teasing her at the same time. She grips [pc.cock " + x + "] with the tips of her fingers, caressing the underside whenever you pull back.");
		output("\n\nYou brace yourself on the bed and look at Shelly. She’s holding herself up with one elbow and smiling at you as she polishes your [pc.cockNoun " + x + "] with her hand. The sight is too much to resist, and you rearrange yourself one more time, lining [pc.cock " + x + "] up with the entrance to her vagina. Your [pc.cockHead " + x + "] pushes into her folds, penetrating her easily");
		if(pc.cockVolume(x) <= 50) output(" til you hilt inside her");
		else output(" til your tip bumps into her cervix");
		output(".");
		pc.cockChange();
		output("\n\nYou smile as you see her sink onto the bed, eyes fluttering with bliss as she tightly grips the sheets. You begin rhythmically pumping your hips, starting slow enough for her to feel every inch of your length as it glides in and out of her. You gradually pick up the pace, your thrusts gaining speed until you can hear your hips slapping against her plush buttocks.");
		output("\n\nShelly’s tongue has lolled out of her mouth, and you can see a growing stain of sugary milk soaking the sheets, spreading from under her chest. She grunts and moans with every thrust until finally she shouts in a rapturous orgasm. Her insides clasp around [pc.cock " + x + "], wringing you for everything you’ve got. You feel your own end coming, and she seemingly notices your rapidly approaching release.");
		output("\n\n<i>“W-wait! please. Shoot it outside!”</i> she gasps between moans of ecstasy. It looks like you have a decision to make.");
		clearMenu();
		addButton(0,"Outside",taursCumOutsideShelly);
		addButton(1,"Inside",taursCumInsideShelly);
	}

}

//Outside
public function humanoidsCumOutsideShelly():void
{
	clearOutput();
	output("Deciding to honor her wish, you piston a few more times for build-up and then gently lay her on the bed, popping your cock out of her pussy just in time. [pc.EachCock] pulses with orgasmic bliss, spurting blasts of [pc.cum] all over her body. A few ropes reach her face, painting parts of her dusky body [pc.cumColor]. She smiles and thanks you for not cumming inside.");

	//if first time: 
	if(flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] == undefined) output("\n\nCurious, you ask her why not.");
	pc.orgasm();
	omniShellyEpilogueBlurb();
}

//Inside
public function humanoidsCumInsideShelly():void
{
	clearOutput();
	output("Ignoring her warning, you piston several times inside her before hilting in preparation for the coming torrent. Your rapid thrusts set off her second orgasm, and you give her a kiss as her body clamps around you. Her tightened insides are too much to resist, and your dick blows its load inside her egg filled womb.");
	if(pc.cockTotal() > 2) output(" Your other cocks spurt wildly over her legs and the underside of her stomach.");
	else if(pc.cockTotal() == 2) output(" Your other cock spurts wildly over her legs and the underside of her stomach.");
	if(pc.hasTailCock()) output(" Your [pc.tailCock] pumps a load of [pc.cum] into her clenching anal cavity.");
	output(" You set her gently onto the bed, popping your spent prick out of her and smiling like an idiot. She punches your shoulder, looking cross with you. You hear a muted bump and notice that her belly looks a little more pregnant than it did before.");
	flags["CAME_INSIDE_SHELLY"] = 1;
	pc.orgasm();
	omniShellyEpilogueBlurb();
}

//Taur
public function taursCumOutsideShelly():void
{
	clearOutput();
	output("Deciding to honor her wish, you thrust a few more times, popping out of her velvety box just in time. [pc.EachCock] pulses with orgasmic fervor, spurting your load over her butt and back. Your cum paints her back [pc.cumColor], and a few shots even make it to her neck. She smiles weakly and thanks you for not cumming inside.");
	//(if first time: Curious, you ask her why not.)
	if(flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] == undefined) output("\n\nCurious, you ask her why not.");
	pc.orgasm();
	omniShellyEpilogueBlurb();
}

//Inside
public function taursCumInsideShelly():void
{
	clearOutput();
	output("Ignoring her warning, you piston your powerful hips a few more times, finally hilting inside her in preparation for flooding her with seed. Your thrusts start her orgasm anew, and she bites the sheets, now soaked in sugary fluids. Her tightened insides are too much to resist in the heat of the moment, and your breath catches as you’re overwhelmed by lust. Your dick pumps its load into her egg-stuffed womb.");
	if(pc.cockTotal() > 1)
	{
		output(" Your unused cock");
		if(pc.cockTotal() > 2) output("s spurt");
		else output(" spurts");
		output(" [pc.cum] over the dusky bunny’s butt.");
	}
	output(" You pull out of her, hearing a pop as you leave her passage. She punches your shoulder, looking cross as she rolls over. You hear a muted bump and notice that her belly seems a bit more pregnant than it had before.");
	flags["CAME_INSIDE_SHELLY"] = 1;
	pc.orgasm();
	omniShellyEpilogueBlurb();
}

public function omniShellyEpilogueBlurb():void
{
	showShelly(true);
	author("Gardeford");
	//if first time: 
	if(flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] == undefined)
	{
		flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] = 1;
		output("\n\n<i>“Semen makes the eggs multiply. That’s why it’s not good to cum inside,”</i> she says, patting her stomach.");
		if(flags["CAME_INSIDE_SHELLY"] == undefined) output(" You mention you’re glad you didn’t make it any harder for her, but if you did happen to forget you’d be happy to relieve her of the extra eggs.");
		else output(" You apologize for not listening, but mention that you would be happy to help relieve her of those new extra eggs if she wants.");
	}
	//after first time:
	else
	{
		output("\n\nYou pat your egg-stuffed lover on the stomach and tell her you’d be happy to relieve her of her eggs or just have some fun at any time.");
	}
	if(flags["CAME_INSIDE_SHELLY"] != undefined)
	{
		flags["CAME_INSIDE_SHELLY"] = undefined;
		pc.clearRut();
	}
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Inside
public function shellyIntenseEggLaying(pageNum:int = 1):void
{
	clearOutput();
	showShelly(true);
	author("Gardeford");
	
	if(pageNum == 1)
	{
		output("You ask Shelly if she’d be up for a little more intensive session of egg-laying. She cocks an eyebrow, not fully sure of your meaning, but interested enough that you think she’ll accept. After a few moments of thought she nods, pulling you into the back room she uses to lay her eggs. You follow eagerly, her sugary scent making your mouth water.");
		output("\n\n<i>“Alright, now what’s this intensity you’re talking about?”</i> she asks, turning to face you. You tell her");
		if(flags["ASSISTED_SHELLY_WITH_INTENSE_LAYING"] == undefined) output(" it’s a surprise, but the first egg will be coming out while she’s still standing");
		else output(" it’s the same kind of treatment as last time");
		output(". As you speak you");
		if(!pc.isNude()) output(" strip from your [pc.clothes] before stepping");
		else output(" step");
		output(" closer to her, unhooking her denim bikini and freeing her dusky mounds.");
		output("\n\nBeads of sugary milk have already begun to form on her nipples, and you take a slow drink from one as you work the button on her shorts. You gently tug them down over her ample booty, revealing a pair of lace panties. This time they match her hair in color, a shiny bright blue. You end your drink, letting some of the milk stay on your lips as you plant wet kisses along her egg-filled belly.");
		output("\n\nUnder the dark mountain of her stomach you find her glistening slit. You prompt her to open her legs a little further, spreading her lips as you press your own into them. Her hard clit is like sweet candy as you roll your tongue over it, lapping up her juices with gusto. You’re pleased to feel her legs quiver as you lick, and you can hear her trying to contain her voice.");
		output("\n\nYour fingers join your lips, playing around her entrance teasingly. Your other hand reaches around her back, giving her ass a squeeze and toying with the cottony fuzz of her bunny tail. You see Shelly’s arms move out of sight above her belly, assumedly to play with her tits. Sure enough you soon see small streams of milk trickling into your vision, dripping onto your face and mixing with her other juices.");
		output("\n\nThe egg-filled bunny girl’s candied liquids set you on a sugar high, licking her faster and faster as it increases. Your fingers now penetrate her sopping hole, and she moans as they rub the sensitive walls of her insides. The muscles of her squeezable butt tense in your hand, and you massage the dusky flesh as you work her clit.");
		output("\n\nHer voice grows louder and louder as you continue, wobbling on her legs as her pleasure builds. She holds your head to steady herself, and you nearly lose your own footing as you’re used as a table. You grin as she shudders, and feel her entire body tensing as she cums. Her noises catch in her throat, unable to escape the spasming vessel that contains them.");
		output("\n\n<i>“Oooooh. The first egg is c-coming,”</i> she says, her voice slurring as her balance wobbles. You hold out both hands, giving her one last lick before pulling back. In short time, a small pink egg pushes its way out of her, plopping into your hands with a small splash. Once the effort is over the strength leaves Shelly’s body, and she collapses onto the bed, holding herself up with her arms and knees.");
		
		processTime(10);
		pc.milkInMouth(getShellyPregContainer());
		pc.girlCumInMouth(getShellyPregContainer());
		pc.lust(5);
		clearMenu();
		addButton(0, "Next", shellyIntenseEggLaying, 2);
		return;
	}
	else if(pageNum == 2)
	{
		output("<i>“");
		if(flags["ASSISTED_SHELLY_WITH_INTENSE_LAYING"] == undefined) output("Is that all? that wasn’t much different from norm");
		else output("Yeah, this way is the be");
		output("-ahhh,”</i> she begins, but you interrupt her before she can finish, plugging her now easily visible hole with your tongue. The remnants of her previous orgasm set her insides to clutching tightly around your oral muscle. You kiss her hole like the mouth of a lover, tonguing sensuously at its corners.");
		output("\n\nYou give her legs a bear hug as you continue to lick her inside and out, inhaling her sugary scent like a drug. The smell is intoxicating, and every breath you take is accompanied by a twinge from your groin. Your attentions draw coos and hums from the egg-stuffed bunny, and you reach up to cup one of her dusky D-cups.");
		output("\n\nThe chocolate colored orb is as soft as the bed she kneels on, and still dripping with a few beads of milk that let your hand coat it with a sugary sheen. Her upper arms seem to be losing their strength about as fast as her legs did, and you wonder how much longer she’ll be able to hold herself in her current position.");
		output("\n\nBeing a curious person, you can’t help but test out such a thought. You grip both of her ebony ass-cheeks, squeezing them and spreading her wider as you intensify your treatment of her nethers. Candied juices drip from her hungry cunt, soaking the bed beneath it. Her arms wobble one more time before she falls forward, no longer able to hold against your assault.");
		output("\n\nHer front falls, pressing into the bedding, and she buries her face in a pillow, unable to completely muffle the loud moan that comes next. You rub her burdened belly, starting at the sides of her now smushed breasts and continuing until you reach the top of her pelvis. You trace lines over her skin with your fingertips, eliciting a number of pleased noises and twitches from the happy bunny.");
		output("\n\nYou give her a break for a moment, more to catch a breather for yourself than to give her a rest. Sticky strands of the sugary slut’s juices cling you your mouth breaking as you lick your lips, mixing with your saliva. Your tongue is coated in a similar mixture, so the sweet syrup is too thick to completely remove, and your lips cling to her irresistibly smooth butt for a moment when you kiss it.");
		output("\n\nYou squeeze Shelly’s cute cotton tail like a sponge, giggling in your sugar induced high as the fur tickles your fingers. You blow on the base of the fuzzy thing, your giggle becoming a laugh when her cheeks clench in response. You pull back for a second, pulling off the dusky beauty’s blindingly white socks and planting a sugar slickened kiss on the sole of each foot. Her toes splay out as you do so, and you lace your fingers through them as you return your attention upward.");
		output("\n\nOn the way you plant a smooch on the underside of the chocolate bunny’s belly, transitioning to a lick that travels up her trail of dripping juices all the way to her snatch. You’re pleased to see her clenching the bed sheets in each hand, and slow down to a tantalizing gait as your [pc.tongue] slides over her entrance.");
		output("\n\nShelly holds her breath as she waits for your oral muscle to finish its path. What kind of person would you be if you denied her? Just as your [pc.tongue] is about to leave the top of her pussy, you dive back, plunging it as deeply as you can into her. The breath she had held sighs out, rising into an orgasmic moan as her entire body shudders.");
		output("\n\nIt would appear that the dark skinned rabbit was holding in a lot more than you’d thought. Sweetened juices splash your face as a new egg bumps into your tongue. You pull back in surprise, letting the white striped ovoid plop out of her with the next giant spasm of pleasure. You catch the new egg in your hands, placing it next to the pink one from before.");
		output("\n\nYou don’t give the beleaguered bunny a chance to rest, flipping her over while she’s still cumming from the last bout of fun. You dive into her still clenching cunt, sucking her candied clit for a few seconds before moving on the biggest dessert. Now that she’s flipped over your [pc.tongue] has a new area of muscle to explore.");
		output("\n\n<i>“W-wait, I’m still c-cumming!”</i> she half shouts between moans. You ignore her plea, instead opting to slather her inner thighs with kisses as they instinctively close around your head. The bright pink clit that your nose is rubbing against is blinding against the darker flesh that surrounds you.");
		output("\n\n<i>“M-more cumming...”</i> she says, her voice trailing off into quiet moans as her body is rocked with a mind melting orgasm. The bed beneath her is soaked with milk and fem-cum, filling the air with her enticingly sweet scent. The smell of it batters through your self restraint, urging you to let your licks last longer and longer.");
		output("\n\nYou gently massage her egg-filled midsection, coaxing it with touches to release another into your safe keeping. You pause periodically to give her breasts a rough squeeze, the coating of milk making them nearly slip out of your grip each time. Soon her entire front is covered in a slick sheen of shiny milk, letting your hands slide easily to whatever portion you wish to fondle.");
		output("\n\nShelly’s vocalizations have been reduced to exhausted moans, her legs loosening on your neck and dropping to rest on your shoulders");
		if(pc.hasWings()) output(", the toes brushing your [pc.wings]");
		output(". She attempts to grasp your head but her slippery fingers run");
		if(pc.hasHair()) output(" through your [pc.hair]");
		else output(" over your scalp");
		output(" unsuccessfully. You take one of her hands as she pulls them back, giving it a reassuring squeeze.");
		output("\n\nShe squeezes back as best as she can, grunting numbly as your nose bumps a particularly sensitive spot on her clit. You swirl your [pc.tongue] around inside her, stirring up the walls of her vagina as it tightens fitfully around you. A part of you is surprised that you haven’t gotten another egg yet, but you can’t give up now.");
		output("\n\nWith your unoccupied hand, you slip under her butt, sliding easily under the squishy cheek with the her sugary lube paving the way. You pause when you reach the now flattened bunny tail, eliciting a yelp from it’s owner when you give it a solid tug. Her legs unconsciously open a little wider as you draw your finger in a circle around its base, tracing your thumb slowly along her flesh until you reach her asshole. You rub up and down the exposed orifice, reveling in the feeling of her plush assflesh on every side.");
		output("\n\nAfter a few cycles, you slip your thumb into her fem-cum slicked butt. Shelly tries to vocalize her pleasure, but it comes out in a moaning half-purr as she tenses, her legs lifting herself up on your shoulders. You do your best to move the encased digit, but her heated passage constricts it too tightly to do much. You continue licking throughout the process, not giving her rest for anything.");
		output("\n\nYou stroke the rabbit-like tail above her butt, now too soaked with juices to be fuzzy, but still feeling soft as velvet. Her moans cease completely, catching in her throat as you give the silky brush three short tugs. More for your own benefit than hers, you set your fingers in a circle, letting them feel along the entire outer edge of the fluffy ball until they meet on the other side. You reverse the direction afterwards, traveling back to the base and a few inches up her tailbone. She manages a short gasp as her fur is stroked backwards, setting her already molten thoughts into disarray.");
		output("\n\nGradually her shock is overridden, and she sinks back to the warm, wet, cradle of the bed. Your thumb digs deeper, matching your [pc.tongue] in intensity once she no longer has the strength to stop it. A sugary haze covers your vision, and you pull away for a second to catch your breath, face dripping strands of syrupy fem-cum.");
		output("\n\n<i>“Cum-cumming... Big egg cumming,”</i> the bunny girl manages between silent moans. It takes your hazy mind a second to remember what she’s talking about, but you duck back just in time for the bottom of a giant egg to bump you in the nose. You hear Shelly give a distressed vocalization as she pushes to no end. It would seem you’re mouth-fucking was so intense that she doesn’t have strength left to get the last egg out.");
		
		pc.lust(10);
		pc.girlCumInMouth(getShellyPregContainer());
		processTime(20);
		clearMenu();
		addButton(0, "Next", shellyIntenseEggLaying, 3);
		return;
	}
	else if(pageNum == 3)
	{
		output("You assist her in the only way you can think of, by continuing said mouth-fuck. You attempt to clean the egg off the juices that coat it’s shell. Your effort are in vain, as your [pc.tongue] is coated with just as much of the sticky substance. The only recourse is to settle with suckling her clit until she cums again.");
		output("\n\nYou dig in, rolling the sensitive bud again and again, using your fingers when your mouth tires. Shelly continues her instinctive pushing and distressing, failing each time and relaxing for a few haggard breaths before trying again. You almost think the cycle will be endless, but a lucky circumstance prevents such a loop.");
		output("\n\nYour efforts finally pay off as she cums once again, pushing at the same time hard enough that the large egg plops out onto the saturated bed sheet. Her orgasm splatters your face with a squirt of syrup in the process. You’ve already begun to crash from the sugar rush of the original intake, and, despite your best efforts to clean your face, you only end up smearing the sticky goo.");
		output("\n\nYou give up after a few minutes, crawling up next to the utterly spent rabbit and snuggling into her side with a sticky kiss to her neck. Shelly seems to have fallen asleep, breathing deeply as she recovers. You join her in rest and warmth for the time being, not wanting to leave with your face covered in sugar and unsure what to do.");
		output("\n\nThe two of you wake up a couple hours later, stuck to the bed but feeling somewhat rested. You wash off in the shower, freeing your face from the prison of crystallized sugar. When you get back, you kiss the dusky girl goodbye, gathering your things and stretching before heading back to your previous endeavors. Shelly waves as you leave, smiling dreamily and rearranging the three eggs you left her with.");
		
		// (pass 4 hours)
		processTime(180 + rand(45));
		IncrementFlag("ASSISTED_SHELLY_WITH_LAYING");
		IncrementFlag("ASSISTED_SHELLY_WITH_INTENSE_LAYING");
		pc.girlCumInMouth(getShellyPregContainer());
		pc.lust(5 + rand(21));
		pc.shower();
		pc.createStatusEffect("Shelly Assist Cooldown", 0, 0, 0, 0, true, "", "", false, (30 + rand(16)));
		restHeal();
	}
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//dildo lay assist w/ Shelly (reviewedready for review)
//button name: ToolAssist
//scene for Shelly's 'assist' menu
//take hardlight in hand to coax eggs out of Shelly, then get sex (or don't)
//tooltip: Use your size-adjustable hardlight to help Shelly lay... and to make sure the eggs rub her g-spot on their way out.
//tooltip disabled, no hardlight: You need hardlight-enabled underwear with an adjustable-size upgrade for this.
//tooltip disabled, has not assisted Shelly normally yet: {Shelly/The bunny-girl} is too wary to agree to this until you get to know her, and her unusual biology, a little better.

public function dildoLayAssistForShellyBuns():void
{
	clearOutput();
	showShelly(true);
	author("Zeikfried");
	if(pc.isBimbo()) output("<i>“Ooh, girl, you look knocked up. You need help?”</i>");
	else if(pc.isBro()) output("<i>“You need a lay? Let’s go in the back,”</i>");
	else if(pc.isNice()) output("<i>“Do you need some help with your eggs?”</i>");
	else if(pc.isMischievous()) output("<i>“You full of eggs and need help again, or did you meet a nice man?”</i>");
	else output("Let’s waddle over to your room and I’ll help you lay,”</i>");
	output(" you reply.");

	output("\n\nShelly blushes, still uncomfortable with having help or possibly just with laying in the first place. <i>“Right, yes,”</i> she says, setting her sign aside. The woman pulls you along, walking slowly and ponderously, and invites you into her room.");
	output("\n\nShelly prepares as you watch. Her shorts, already unbuttoned to accommodate eggs, give her a bit of trouble - her gravid belly is too in the way to slip them off gracefully, so she simply lets them drop and kicks them off, then does the same with her underwear.");
	output("\n\nYour bemused expression catches her notice. <i>“What?”</i> she asks, defensively.");
	if(pc.isNice()) output("\n\n<i>“It was cute,”</i> you answer.");
	else if(pc.isMischievous()) output("\n\n<i>“You must lead an interesting life,”</i> you answer politely.");
	else output("\n\n<i>“Nothing at all,”</i> you answer, grinning.");

	output("\n\nShelly harrumphs and flops down on the bed. The following pause is long enough that you wonder if you should apologize, but she grins and beckons to you. The bunny leans in as you approach; her eyes twinkle with excitement and she pouts alluringly, pink lips framed by dark skin. When you take her chin in your hand, the color rises in her cheeks. Her amber eyes dance - they convey the impression that you’re becoming more than just a convenient assistant to her....");
	output("\n\n<i>“Um,”</i> she asks, <i>“are you going to kiss me?”</i>");

	//nice/misch
	if(pc.isNice() || pc.isMischievous())
	{
		if(pc.isNice()) output("\n\n<i>“If you want me to,”</i> you answer.");
		else output("\n\n<i>“I don’t know... am I?”</i> you retort.");
		output("\n\nShelly looks away, flustered, then puckers for a kiss. You press your lips to hers - they taste faintly of sugar, and you’re not sure whether to credit her lip balm or the drug that made her into a walking, talking candy machine.");
		output("\n\nShe leans into the kiss, getting into it. Her lips part and her tongue dabs at you, trying for admission; you open up and she slips into your mouth, tickling the tip of your [pc.tongue] with hers.");
	}
	//mean
	else
	{
		output("\n\n<i>“No,”</i> you answer.");
		output("\n\nShelly’s chin drops in shame, as though she’d been rebuked. You lift it again, then lunge underneath, pressing your lips to her neck. The bunny shudders as you nip and tease, and tucks her chin ticklishly; you respond by grabbing a handful of hair, pulling her head back to continue ravishing her.");
	}
	//merge
	output("\n\nYour dark-skinned lover - she may as well be, now - shudders in your palm as you explore her with lips and tongue. You find her stomach with a blind fumble and slide up to touch the denim of her top... then slip underneath. Your fingers reach nipple and Shelly starts in surprise, then pushes her chest into your hand greedily. The perky little nib slides through your fingers, and then you pull away, bringing her top with you and allowing her heavy breasts to spill out.");
	output("\n\nShelly sighs");
	if(!pc.isAss()) output(" into your mouth");
	output(" and pushes you back. Her eyes look wistful and hopeful together... she wants badly to be kissed again, but she wants you to move on to her wet, lonely pussy just a bit more.");
	output("\n\nYou stand up");
	//(clothed)
	if(!pc.isCrotchExposedByArmor()) output(", unfasten your [pc.lowerGarmentOuter]");
	output(" and find the controls to your [pc.lowerUndergarment]. With a touch, the hardlight springs to life. Shelly’s eyes dance with anticipation at the sight of the shining stiffy, and you slip out of your pants in order to pick up the dildo with your hand.");
	output("\n\nShelly opens her legs until her sex is visible, layered in shadow by her gravid belly. Bringing the luminous toy closer reveals a quim slick and spread, dilated to lay. Idly, you wonder if she <i>really</i> needs more stimulation ‘down there’; you could kiss and play with her breasts a bit longer and her flowing pussy-juice would carry her burden right out, or so you guess. But, you set the idea aside and touch your tool to her. Shelly shivers, and nods permission.");
	output("\n\nSlowly, you insert the dildo. A low groan rolls from her, right in time, as if you’re forcing it out. When you jerk, Shelly’s groan hitches in response and you smile to yourself. An egg stops you; it seems this is as deep in Shelly as you can go, for now.");
	output("\n\nWith the same smooth strokes, you begin to tease the bunny, working her pussy around the edge and marveling at the stream of lubrication she’s producing. Shelly’s self-control is already faltering - her thighs reflexively clamp shut on every out-stroke, trying to hold in the cock; your other hand stays busy pushing them back apart. Despite this, you occasionally find the chance to finger her ");
	if(pc.isNice() || pc.isAss()) output("little pink clitoris, which throbs with heat whenever you touch it. Every rub produces a gush of lubrication and another millimeter of dilation, edging her closer to the lay.");
	else output("tight little pucker. Shelly starts when you touch it, reflexively trying to scoot away, but the sheet under her slides and she only manages to lean backwards. Her puff of a tail jerks and wags, beating wrinkles into the bedclothes.");
	output("\n\n<i>“It’s coming!”</i> the bunny moans, sweating and squeezing her breast. Indeed, you can feel an egg bump against the hardlight as Shelly’s pussy ripples and constricts in rhythm.");
	var eggColor:String = RandomInCollection(["red","orange","yellow","green","blue","purple","pink","white"]);
	output("\n\nYou grope for the girth control - difficult while the cloth is draped haphazardly over your fist - and slim the toy down. The egg slips around the diminished crown and through Shelly’s vagina; lubrication flows from her pussy in little streams, presaging its emergence. You help it along by levering it with the toy; a " + eggColor + " circle appears, then is pushed out and drops softly to the floor.");
	

	output("\n\nShelly groans and sweats, smelling sweet and musky, and the toy jogs just slightly as another egg brushes past the tip and into position. Watching her shiver, you put your plan into action and angle your hardlight hand-lever upward, pressing the egg into her pussy wall and aiming for the g-spot on her urethral line.");
	output("\n\nYou must have succeeded, because Shelly’s breath catches and her back stiffens as if touched by a strange hand until the egg has passed. <i>“W-what was that?”</i> she staggers out. You wink and tap the side of your nose, signifying a secret.");
	output("\n\nThe bunny-girl takes a deep breath, but her pussy is flowing and the next egg is clipping along - you push it into her g-spot as well, and Shelly’s wind escapes before she can speak. Her back stiffens again, but with just the slightest tremors of tension, like a rubberband being plucked. Shelly’s breasts shake and heave, set into motion by the sudden sharp exhalation.");
	output("\n\n<i>“Oh, god...”</i> she wheezes, desperately. You look up again. Far from being unhappy, her face is a grinning mask, locked in an open-mouthed smile. Her eyes try to focus on you, but the toy pins the next egg and they roll upward even as her dopey grin deepens. You’re literally watching her thoughts get blanked out by the pleasure... it’s exciting.");
	output("\n\nThe pile of brightly-colored, slick eggs between her legs grows by inches as you work the hapless sales-girl, teasing her anatomy in ways she likely never imagined when she took the job. Her face is a mess with tears of happiness and her mouth, stuck open, is drooling on her chest. The eggs backed up behind the tip of your techno-toy dwindle in number as she dispenses her candy creations until, finally, there is only one. It’s not moving - though you could dig it out - and it’s so small and so far back that you wonder if Shelly can even feel it.");
	output("\n\nShe gives every indication that she doesn’t. The intense sexual exertion that froze her muscles recedes, allowing her to slump. The lust, however, is still burning. She stares at you, catching her breath, eager to speak.");
	output("\n\n<i>“Incredible...”</i> she finally blurts. <i>“God, I’m so horny now...”</i>");
	if(pc.isBimbo()) output("\n\n<i>“I bet you are, honey,”</i>");
	else if(pc.isBro()) output("\n\n<i>“Hell yeah,”</i>");
	else output("\n\n<i>“No surprise,”</i>");
	output(" you remark, watching her newly-flat, brown stomach tremble and her blushing pussy drool and twitch, craving contact.");
	output("\n\nShelly tries her best to be seductive, leaning in and letting her breasts dangle in sharp relief, but her eyes stare and her voice squeaks, betraying her excitement. <i>“Do... do you wanna have sex?”</i> she asks.");

	processTime(24);
	pc.lust(15);
	clearMenu();
	//buttons: ‘No’, ‘Yes’, ‘Leave Egg’
	//’No’
	addButton(0,"No",noDontFuckShelly,undefined,"No","Duck the dusky bunny’s demand.");
	//’Yes’
	//tooltip: Let the bunny-girl borrow your hardlight underwear and ride your [pc.vagOrAss] to climax.
	addButton(1,"Yes",yesBoneShellyWivHardlight,undefined,"Yes","Let the bunny-girl borrow your hardlight underwear and ride your [pc.vagOrAss] to climax.");
	//’Leave Egg’
	//gives mean or misch point (coder choice) - Fen: I went with mean.
	if(pc.hasStatusEffect("Shelly Leave Egg CD")) addDisabledButton(2,"Leave Egg","Leave Egg","After the way you ‘helped’ last time, Shelly is openly suspicious - she’s feeling her belly for leftover eggs. Come again later and maybe she will have forgotten your most recent dirty trick.");
	//disabled tooltip, no cum_reaction flag: 
	else if(flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] != 1) addDisabledButton(2,"Leave Egg","Leave Egg","If you knew a bit more about Shelly’s biology, you could have some devious fun with her. Maybe you should get more intimate.");
	else if(!pc.hasCock()) addDisabledButton(2,"Leave Egg","Leave Egg","If you had a cock that fit Shelly, you could leave an egg in her and cum inside to fill her up again. It wouldn’t be nice, but it would be funny.");
	else if(pc.hasCock() && pc.cockThatFits(shellyCapacity()) < 0) addDisabledButton(2,"Leave Egg","Leave Egg","If you had a cock that fit Shelly, you could leave an egg in her and cum inside to fill her up again. It wouldn’t be nice, but it would be funny.");
	//PC leaves an egg in and cums inside Shelly to multiply it again
	//requires cockFit and flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] = 1
	else addButton(2,"Leave Egg",leaveEggInShellyThenJizzOnItYaJerk,undefined,"Leave Egg","Shelly’s eggs multiply in the presence of semen... it wouldn’t be very nice, but you could leave the last egg, then cum inside to fill her up again.");
}

//’No’
//tooltip: Duck the dusky bunny’s demand.
public function noDontFuckShelly():void
{
	clearOutput();
	showShelly(true);
	author("Zeikfried");
	//if nice
	if(pc.isNice()) 
	{
		output("<i>“Sorry,”</i> you say with a wink. <i>“I can’t right now.”</i> You flick the final egg out of her and into the pile between her legs.");
		output("\n\nShelly is stunned. <i>“But what am I supposed to do?”</i> she whines.");
		if(pc.isBimbo()) output("\n\n<i>“Maybe, like, go find a cutie in the bar with more free time?”</i>");
		else output("\n\n<i>“Remember the feeling for me?”</i>");
		output(" you suggest. Shelly frowns, and you smile deviously.");
		output("\n\nYou remount your underwear and collect your things; the woman watches inscrutably. Her breath sounds intensify behind you... no longer encumbered by a pregnant-sized belly, she has rediscovered her sex. You don’t even need to look. You’re quite certain she’ll be fine.");
	}
	//if misch/mean
	else
	{
		output("<i>“Sorry,”</i> you answer. <i>“Can’t right now.”</i> You pull the strap-on free, leaving the final egg inside.");
		output("\n\nThe bunny-girl glares at you. <i>“What am I supposed to do?”</i>");
		if(pc.isBimbo()) output("\n\n<i>“I dunno... find some cutie to fuck you?”</i>");
		else output("\n\n<i>“Well, there’s still one in there. So keep your legs closed, I guess.”</i>");
		output(" You slip your underwear on again and begin to collect your things.");
		output("\n\nShelly watches you, annoyed, but her fingers creep toward her pussy. With the eggs out of the way, she’s easily able to reach her sex and slip inside; her cute grunts begin again as you leave. She’ll probably be fine on her own - but just to be sure, you leave the door ajar so anyone who comes by can check on her.");
	}
	//end scene
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//’Yes’
//tooltip: Let the bunny-girl borrow your hardlight underwear and ride your [pc.vagOrAss] to climax.
public function yesBoneShellyWivHardlight():void
{
	clearOutput();
	author("Zeikfried");
	//first time seeing the ‘Yes’ subsection
	if(flags["SHELLY_HL_SEX_BONUS"] == undefined)
	{
		output("Your eyes wander to your hardlight underpants as you consider how to have the wanton woman. They’ll transmit sensation to whoever wears them....");
		if(pc.isBimbo() || pc.isMischievous()) output(" <i>“Sure, sticky bun,”</i>");
		else if(pc.isBro() || pc.isAss()) output(" <i>“Okay,”</i>");
		else output(" <i>“I’d like that,”</i>");
		output(" you answer, and thrust them out to her. <i>“But you wear these.”</i>");

		output("\n\n<i>“Uh? But I’m so horny... won’t you wear them instead? I’ll do you afterward, promise.”</i>");

		if(pc.isNice()) output("\n\n<i>“Trust me - you’ll like it,”</i> you reassure.");
		else output("\n\nYou frown and jab the underwear at her again, insistently.");
	}
	//repeat intro for the ‘Yes’ subsection
	else
	{
		if(pc.isBimbo() || pc.isMischievous()) output("\n\n<i>“Sure, sticky bun,”</i>");
		else if(pc.isBro() || pc.isAss()) output("<i>“Okay,”</i>");
		else output("<i>“I’d like that,”</i>");
		output(" you answer, chipper. Shelly’s eyes drift to the underpants in your hand. When you hold them out to her, a greedy smile spreads across her face, like an addict’s about to get a fix.");
	}
	//merge first/repeat
	output("\n\nShelly takes the soaked skivvies from you and begins to slip them on. You study her face carefully, waiting for the moment when the sensory feedback makes connection with her nerves. Her first hint comes when the fabric touches her puffy, eager pussy, but she doesn’t stop yet. By the time she’s adjusting the waistband, however, her face clearly shows that the connection is live.");
	output("\n\nYou lean in");
	//(long hair)
	if(pc.hasHair() && pc.hairLength >= 8) output(", brush your [pc.hair] aside with a hand,");
	output(" and regard the thinned-down photon prick. Capturing Shelly’s attention, you pucker your lips flirtatiously and then blow a puff of air on the crown of the cock. The bunny-girl’s eyes cross as the impulse translates through the circuitry to her nerves - if your [pc.lowerUndergarment] weren’t already so soaked that Shelly’s dark labia showed, you’d swear the crotch just got even wetter.");

	output("\n\n<i>“Oh, god...”</i> she repeats.");

	output("\n\nYou quirk an eyebrow. ");
	if(pc.isBimbo() || pc.isBro() || pc.isMischievous()) output("<i>“So, we gonna fuck, or...?”</i>");
	else output("<i>“Shall we begin?”</i>");

	output("\n\nShelly looks like she could knock you down and mount you right now, but restrains herself. Her gaze lingers on your crotch, and she twirls a finger, motioning you to turn around. You oblige");
	if(!pc.isTaur()) output(" and go even further, bending over to give");
	else output(", giving");
	output(" her an eyeful of your [pc.vagOrAss].");

	output("\n\nShe stares unabashedly and begins to stroke the strap-on, like she’s had a cock all her life. ");
	var looseness:Number = pc.ass.looseness();
	if(pc.hasVagina()) looseness = pc.vaginas[0].looseness();

	if(looseness < 4) 
	{
		output("Watching over your shoulder, you see her kneel down and trace the outside of your ");
		if(pc.hasVagina()) output("pussy");
		else output("pucker");
		output(" with a finger; at the same time, her other hand moves to the control she saw you operate earlier. The hardlight projection thickens again while she teases, sizing up to match the circles her finger is drawing.");
	}
	else
	{
		output("A shy cough comes as she ponders your ");
		if(pc.hasVagina()) output("stretched");
		else output("ruined");
		output(" hole, and you peer over your shoulder. Hesitantly, her hand moves to the girth control she saw you operate earlier. She amps it up as high as it will go, swelling the photo-prick until it looks like it belongs planted in the ground instead of strapped to her dusky crotch.");
	}
	output("\n\n<i>“Okay,”</i> she says nervously, <i>“I’m going to put it in.”</i>");

	output("\n\nYou waggle your ass at her, eager to get beyond the preludes and apologies. Shelly gets the message. Her awkward hesitation disappears, her back straightens, and she grips your [pc.ass] in both hands. Confidently, she shoves forward, impaling your [pc.vagOrAss] on the resized rod; it’s still so drenched in Shelly’s pussy-juice that it hilts in a single stroke.");
	// very small stretch/verginity check
	if(pc.hasVagina()) pc.cuntChange(0,50);
	else pc.buttChange(50);

	output("\n\nIf there were any question whether the sensory feedback were working, there isn’t now. Shelly’s knees buckle, and the bunny-girl falls on you for support. Her heavy breasts hit your back, mashed up against your [pc.skinFurScales], and the fingers digging into your ass grip even tighter, trying to stop her from falling off completely.");
	output("\n\nIt takes a second, but she gets her legs under her again - though not having them hasn’t prevented her from starting to fuck. She’s already made a few limp strokes before her knees re-engage, whereupon you <i>really</i> begin to feel her enthusiasm. Shelly takes to you with such lust that you wonder if she weren’t born a boy. Her furious strokes set your [pc.ass] ");
	//(ass rating, small to large)
	if(pc.buttRating() < 6) output("jiggling");
	else if(pc.buttRating() < 15) output("rippling");
	else output("waving");
	output(" like water under her onslaught, and she burnishes the nerves in your ");
	if(pc.hasVagina()) output("pussy");
	else output("anus");
	output(" until you tremble.");

	output("\n\n<i>“Cuh... cumming,”</i> Shelly mumbles abruptly, cutting into your thoughts. She hilts a final time, and you feel her knees lock; her breasts hit your back again as she loses muscle control. You can feel her diaphragm though your ass; it jerks and spasms for breath as Shelly’s drooling cunt repaints your underwear with her personal color. Your [pc.vagOrAss] twitches too, working out a small orgasm as Shelly’s shaking turns the dildo into a human-powered vibrator");

	var wetness:Number = pc.ass.wetness();
	if(pc.hasVagina()) wetness = pc.vaginas[0].wetness();
	//(if vag/anal squirter)
	if(wetness >= 4)
	{
		output(", and you gush ");
		if(pc.hasVagina()) output("[pc.girlCum] ");
		output("all over the bunny’s olive-skinned thighs");
	}
	output(".");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] ");
		if(pc.cockTotal() > 1) output("squirt");
		else output("squirts");
		output(" on the floor, ");
		if(pc.cumQ() < 100) output("spattering");
		else output("soaking");
		output(" the pile of eggs and Shelly’s discarded shorts.");
	}
	output("\n\nYour muscles slacken and you lower yourself cumbersomely - lucky for Shelly, since only the dildo in your ");
	if(pc.hasVagina()) output("cunt");
	else output("ass");
	output(" is holding her up at this point. The bunny lies on top, breathing heavily and staring at you, not quite sleeping but not quite thinking either.");
	if(!pc.isAss()) output(" Eventually,");
	else output(" Eager to get out from under her,");
	output(" you clench down, delivering a shock through the cock that brings her around. Shelly apologizes, draws free with a shudder, and easily steps out of your pussy-soiled underwear now that her belly is gone.");

	output("\n\n<i>“That was great,”</i> she gushes, handing you an egg and your [pc.lowerUndergarment]: a sopping wad of cloth with a dildo sticking out. You deactivate and slip them back on somewhat awkwardly");
	if(!pc.isCrotchExposedByArmor()) output(", then don the rest of your clothes");
	output(". <i>“I really appreciate it. I hope you’ll come back and help me lay again,”</i> Shelly smiles. She’s covered in sweat, but glowing - there’s no question which ‘lay’ she’s really looking forward to.\n\n");
	//end
	//pc orgasm, pass time, get an egg, go wherever PC goes after Shelly sex
	//disable Shelly’s ‘Assist’ and ‘Sex’ function for 24hrs
	
	processTime(45);
	pc.orgasm();
	pc.createStatusEffect("Shelly Assist Cooldown", 0, 0, 0, 0, true, "", "", false, 24*60);
	oviliumEggReward();
	showShelly(true);
}

//’Leave Egg’
//PC leaves an egg in and cums inside Shelly to multiply it again
//requires cockFit and flags["KNOWS_ABOUT_SHELLY_CUM_REACTION”</i>] = 1
//may require non-sterile PC if Shelly’s egg multiplication requires fertile sperm (coder or character designer’s discretion)
//gives mean or misch point (coder choice)
//triggers a cooldown of ~a couple weeks before PC can select it again (Shelly gets mad); cooldown can be fixed or increase with pc’s cum amount (coder’s choice)
//tooltip: Shelly’s eggs multiply in the presence of semen... it wouldn’t be very nice, but you could leave the last egg, then cum inside to fill her up again.
//disabled tooltip, no cockFit: If you had a cock that fit Shelly, you could leave an egg in her and cum inside to fill her up again. It wouldn’t be nice, but it would be funny.
//disabled tooltip, no cum_reaction flag: If you knew a bit more about Shelly’s biology, you could have some devious fun with her. Maybe you should get more intimate.
//disabled tooltip, scene on cooldown: After the way you ‘helped’ last time, Shelly is openly suspicious - she’s feeling her belly for leftover eggs. Come again later and maybe she will have forgotten your most recent dirty trick.
public function leaveEggInShellyThenJizzOnItYaJerk():void
{
	clearOutput();
	author("Zeikfried");
	var x:int = pc.cockThatFits(shellyCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	if(pc.isBimbo()) output("<i>“Sure; I like horny bunnies,”</i>");
	else output("<i>“Okay,”</i>");
	output(" you answer. Skillfully, you withdraw without disturbing the last egg. Shelly folds her hands over her knees and bats her eyelashes at you in a come-hither gesture... trying to be coquettish and flirty despite having shown you her twitching pussy for the last ten minutes.");
	output("\n\nShe is cute, though. The blood rushing to her face makes her deep rouge cheeks shine with desire, and her eyes search yours for your intentions. Shelly smiles bashfully and crooks a finger, beckoning you in.");
	output("\n\nYour [pc.cocks] ");
	if(pc.cockTotal() > 1) output("throb");
	else output("throbs");
	output(", eager to be inside the dark-skinned candy girl, and her pussy glistens in sympathy. Without any ado at all, you ");
	if(pc.isTaur()) output("step onto the bed, trusting the girl to line you up nicely.");
	else output("slip your hands behind Shelly’s knees, raising and pushing them apart.");
	output(" Your [pc.cockNounSimple " + x + "] spears her in one smooth motion, guided by her waiting fingers.");

	output("\n\n<i>“Ohh, yeah,”</i> Shelly mumbles.");

	output("\n\nYou smile inwardly at that - she has no idea what’s coming her way. Her pussy quivers, still stretched out by the eggs but hot, wet, and deep; it swallows, contracts and strokes your cock, trying to milk it for all it’s worth. With at least ten minutes’ head start, Shelly’s orgasm arrives quickly; her jaw drops and her eyes roll as her body begins to spasm out a climax that’s been badly backlogged.");

	output("\n\nAs greedy as her pussy was before, it doesn’t compare to Shelly’s orgasm. Her vagina grips you like an oily hand, trying to squeeze but so slippery that it only tightens around your stroke. The bunny-girl shakes and thrusts her chest into the air, arching her back to try and get relief from the onslaught of pleasure, but you ignore her and keep going, determined to make up for time. It’s not much longer before her tight pussy and sweaty, writhing contortions spur you to finish, as well.");
	pc.addHard(1);
	//if small/normal cum
	if(pc.cumQ() < 1500)
	{
		output("\n\nYour [pc.cockNounSimple " + x + "] twitches and ejaculates, ");
		if(pc.cumQ() < 25) output("trickling");
		else output("spurting");
		output(" [pc.cum] into the unwary woman; you slump forward, resting ");
		if(!pc.isTaur() && pc.tallness < 64) output("your head ");
		output("against her soft breasts. The intimacy brings a smile to Shelly’s face, and she stares affectionately into your eyes - for a few seconds, until your semen reaches the last egg. Her pupils widen and her smile vanishes as you feel a rumbling and a faint popping.");

		output("\n\nAbruptly, her stomach begins to push against you, swelling with defined lumps - new eggs - that drop down from Shelly’s ovaries, triggered by the reaction. She looks profoundly uncomfortable with her womb compressed between you, and when you push off, her belly once again looks ");
		if(pc.cumQ() < 100) output("three or four");
		else output("five or six");
		output(" months pregnant.");
		output("\n\nShelly stares at it disbelievingly. <i>“What...? But... you... you bastard! You left an egg in!”</i> The fetching blush in her cheeks is completely transformed to ruddy anger, and her fingers work like she wants to claw you.");

		if(pc.isNice()) 
		{
			output("\n\n<i>“I must have");
			if(pc.isBimbo()) output(", like,");
			output(" missed one. Sorry!”</i> you reply.");
		}
		else output("\n\n<i>“Oops,”</i> you reply.");

		output("\n\n<i>“Some help!”</i> she fumes, rubbing her stomach. <i>“I look as pregnant as I did when I came in!”</i>");
		output("\n\n<i>“That’s true,”</i> you answer.");
		if(pc.isBimbo() || pc.isBro())
		{
			output(" <i>“But you’re cute when you’re knocked up.”</i>");
		}
		else output(" <i>“But it’s a good look for you.”</i>");

		output("\n\nShelly grabs your wadded hardlight underwear and throws them at you. <i>“Oh, fuck off!”</i> she barks, pettishly.");
		output("\n\nSniggering inwardly, you get dressed and leave her to do the same.");
		processTime(25);
		if(!pc.hasStatusEffect("Shelly Leave Egg CD")) pc.createStatusEffect("Shelly Leave Egg CD", 0, 0, 0, 0, true, "", "", false, 24*60*6);
		pc.orgasm();
		//pc orgasm, don’t get any eggs
		//pass time, go wherever
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//if big cum
	else
	{
		output("\n\nYour [pc.cockNounSimple " + x + "] twitches; you hold it as long as possible, knowing that you’re going to blow so much sperm into Shelly that the eggs are liable to push you out, and determined to give her as much as you can before then. Your body spasms once, twice, thrice, and then you can’t hold it anymore. [pc.Cum] gushes from you like water from a cut firehose; your first stroke floods Shelly all the way to the back, where the hidden egg is. Her stomach bloats, stretchy skin filled out with [pc.cumNoun] where once there were eggs, and keeps growing. You squeeze and squeeze, trying to put cum into the woman, but within seconds you hear Shelly’s gut rumble like a steam locomotive. Little muffled pops fill the air.");
		output("\n\nFrom jizz alone, Shelly looks as pregnant as she did before. She opens her mouth to speak, but doesn’t get the chance; her gut rumbles again, and the smooth, sloshing curve of the cum-stuffed belly begins to take on the lumpy shape of eggs. They drop down so quickly that they crowd out your cock, pinching your prick until it hurts. You have no choice but to withdraw your plug, knowing that most of the cum you’ve gifted Shelly will be spilled.");
		output("\n\nA cataract follows you out, enough to soak your [pc.legs]. The rumble continues, expanding Shelly until she looks twelve months pregnant. Soon, even her stretchy skin can stretch no more, and her pussy dilates as the escaping semen begins to carry new eggs with it.");
		output("\n\n<i>“Guhh...”</i> the bunny-girl groans, holding her bloated stomach as eggs and [pc.cum] pulse out of her. Her thighs squeeze automatically as the eggs brush past her pussy, and the color begins to drain from her face. Pushing egg after [pc.cumVisc] egg over her nerves, her hips start to buck again. Within the minute she’s having another orgasm, sucking air as her cunt squeezes down, forcing the eggs to drag her nerves even harder. Her vacant eyes briefly meet yours; she’s completely checked out.");
		output("\n\nThere’s no end in sight... you retrieve your sticky, cummy underpants from the mess on the floor, take a large egg for your troubles, and leave her there, still sloppy with cum and building up to another orgasm.\n\n");
		//end
		//pc orgasm, get 3 eggs
		//pass time, go to appropriate location, hide Shelly button completely for 24hr
		pc.createStatusEffect("Shelly Assist Cooldown", 0, 0, 0, 0, true, "", "", false, 24*60);
		if(!pc.hasStatusEffect("Shelly Leave Egg CD")) pc.createStatusEffect("Shelly Leave Egg CD", 0, 0, 0, 0, true, "", "", false, 24*60*16);
		processTime(30);
		pc.orgasm();
		oviliumEggReward(true);
	}
	showShelly(true);
}

