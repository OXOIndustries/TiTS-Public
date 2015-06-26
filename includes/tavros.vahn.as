//Vahn, Your Friendly Ship Mechanic
//By JimT

//Concept
//Vahn Desai is one of the technician that work on your ship. He's a blond half-Ausar with brown ears, a bushy canine tail (also blonde) and a (slightly modded) phallus. He's lean but muscular, fairly tall, and bisexual. He's often working up a light sweat, and he lives and works on Tavros station.
//Vahn has a fascination for ships, and loves junkers because they break down often.
//He's a switch, fairly easy, and attracted to the PC.
//His cock is terran except for his knot and how long he cums for. This is the result of some slight gene modding.

//Vahn
//Dialogue Menu

// Positioned somewhere in the starting Hanger. 
public function fuckedVahn():Boolean
{
	return (flags["SEXED_VAHN"] != undefined);
}
public function showVahn():void
{
	showName("\nVAHN");
	showBust("VAHN");
	author("JimThermic");
}

public function VahnTheMechanic():void 
{
	clearOutput();
	showVahn();
	//First Time:
	if(flags["MET_VAHN"] == undefined)
	{
		output("Feeling a bit curious, you walk up to chat to him. When you get close, his brown canine ears perk and he looks up with a brilliant smile. His sandy tail is swishing back and forth.");
		output("\n\n<i>“Hi there, Captain Steele! Nice ship you’ve got here,”</i> the technician cheerfully tells you. He stretches out a hand and you shake it. <i>“I’m Vahn, one of the ground crew assigned to your ship.”</i>");
		output("\n\nYou’ve never heard anyone call your ship ‘nice’. Really, it’s an old clunker. You ask him why he thinks it’s so amazing.");
		output("\n\n<i>“W-well, I guess it’s not from a pilot’s perspective. But for me, your old Casstech Z14 is like a big puzzlebox, always breaking down and a real brain-teaser to fix. Pretty obvious why I became a mechanic, right? It’s really challenging to keep your old clunker going. Sometimes it even stumps the boss, and that’s saying something!”</i>");
		output("\n\nHe deactivates and tucks the pad away, turning his full attention to you. <i>“...So, was there something you want, or just checking up on your ship? Don’t worry, the repair costs are footed by Steele Industries - anything extra, though, and we’d have to charge.”</i>");
		flags["MET_VAHN"] = 1;
		processTime(2);
	}
	//Repeat:
	else
	{
		output("You walk up to Vahn. He’s standing in the hangar next to your ship, checking over its condition. When you walk up, he stops what he’s doing and shoots you a cheery smile. His canine ears are perked and his tail is swishing side to side.");
		output("\n\n<i>“Hey there, ");
		if(fuckedVahn()) output(pc.mf("handsome","beautiful"));
		else output("Captain Steele");
		output("! What can I do you for?”</i>");
		processTime(1);
	}
	//[Appearance] [Talk] [Sex]
	clearMenu();
	addButton(0,"Appearance",appearanceForVahn);
	addButton(1,"Talk",talkToVahn,undefined,"Talk","Talk to the guy.");
	if(pc.lust() >= 33) addButton(2,"Sex",vahnSexMenu,undefined,"Sex","See if this guy is up for a roll in the hay.");
	else addDisabledButton(2,"Sex","Sex","You aren't aroused enough for sex.");
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function appearanceForVahn():void
{
	clearOutput();
	showVahn();
	output("Looking Vahn over from head to toe, he’d definitely qualify as ‘handsome’ under those oil-stained cheeks. The half-ausar male is usually smiling, bright teeth flashing with good humor as he works up a sweat over your rusty spaceship. He has chestnut-hued canine ears and sandy blond hair, which looks perpetually tousled. His blond tail swishes behind him.");
	output("\n\nThe hard-working ausar stands six feet tall and has a lean yet muscular build. All those hours of hard labor repairing starships have perfectly tuned his body, as well as your vessel. His eyes are a glimmering green, filled with obvious intelligence - it takes brains to know how to properly calibrate a sublight drive!");
	output("\n\nHe’s wearing a technician’s outfit, which would be plain except he wears it rather well. The otherwise dull fabric hugs his muscles and slim waist, accentuating everything beneath. The one item of note is his tool belt, with different gadgets of importance tacked on.");
	clearMenu();
	addButton(14,"Back",VahnTheMechanic);
}

//Talk
public function talkToVahn():void
{
	clearOutput();
	showVahn();
	output("What would you like to talk to Vahn about?");

	//[Vahn] [Starships] [Hobbies]
	clearMenu();
	addButton(0,"Vahn",talkToVahnAboutVahn);
	addButton(1,"Starships",talkToVahnAboutStarships);
	addButton(2,"Hobbies",talkToVahnAboutHisHobbies);
	addButton(14,"Back",VahnTheMechanic);
}

//Vahn
public function talkToVahnAboutVahn():void
{
	clearOutput();
	showVahn();
	output("You’re interested to hear more about Vahn, so you ask him about himself.");
	output("\n\nThe blonde half ausar crosses his arms, his fluffy tail swishing about. <i>“...  Me? I’m not that interesting. I mean, young, strapping half-ausar tech heads like me are a credit a dozen. My story doesn’t even hold a candle to yours, " + pc.mf("Mr.","Ms.") + " heir-to-a-galactic-business-empire.”</i>");
	output("\n\nNot one to let up, you pester Vahn until he caves. <i>“... Oh, all right. Where to start? Uh... I guess with my name - Vahn Arcon Desai. Only fair I give you mine, since everyone knows yours. I work for Steele Tech as a senior ship technician, so I spend a lot of my days fixing up mining vessels that dock at Tavros.”</i>");
	output("\n\nStill, working for Steele Tech as a senior technician is fairly impressive, especially since Vahn looks fairly young. You state as much and he bashfully scratches one of his canine ears.");
	output("\n\n<i>“Well, yeah, I got pretty lucky - scored myself a scholarship to Ausaril Tech funded by your dad’s company. I heard he had an honorary doctorate there? Anyway, I studied Applied Mechanics, since I love tinkering with my hands,”</i> Vahn brushes back his hair, <i>“...When I graduated, I was scooped up immediately by Steele Tech, since, you know, they’re </i>always<i> looking for folks who are good with gadgets.”</i>");
	output("\n\n<i>“That’s pretty much how I wound up here. I’m not sure if that answered your question, though, since I </i>do<i> have a life outside of work!”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToVahn);
}

//Starships
public function talkToVahnAboutStarships():void
{
	clearOutput();
	showVahn();
	output("You ask Vahn how he ended up working on starships, specifically yours.");
	output("\n\n<i>“Only the best technicians for [pc.fullName], I guess?”</i> He playfully grins and slides his hands in his jump suit pockets. <i>“... I love working on ships and Steele Tech has a lot of them. I like yours the most, though, because it’s an exploratory vessel.”</i>");
	output("\n\nWhen you ask why that’s important, Vahn’s eyes come alive with excitement. <i>“Oh, what isn’t to love? I’m working on a ship that’s going where nobody’s ever gone before! You’re going to be roughing it through alien skies, landing on alien worlds - all in the ship I’ve worked on!”</i>");
	output("\n\n<i>“Without a top notch vessel, even the greatest galactic rusher is stuck twiddling their thumbs in a docking bay. Not too different from what you’re doing now, right?”</i> He teasingly winks, bushy tail swishing. <i>“... All my sweat and effort goes into your engines, shields, guns, life support... pretty cool, right?”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToVahn);
}

//Hobbies
public function talkToVahnAboutHisHobbies():void
{
	clearOutput();
	showVahn();
	output("You ask Vahn about his hobbies. The friendly half-ausar seems happy to discuss them with you.");
	output("\n\n<i>“My hobbies? Vehicle restoration’s a biggie; I’ve got two vintage hovercars I bought for a steal and I’m doing them up,”</i> Vahn explains, <i>“One is a Atlas Dynamus, a beautiful old twin-seater with an old quad-levi axel. It was really big during the last rush. The other one is a Lexi Fusion that I’m missing half the parts for; I’m hand machining half of them myself since I can’t find a seller.”</i>");
	output("\n\nThere’s a distinct gleam in the blond tech’s eyes and his bushy tail is waggling. It’s pretty obvious Vahn loves talking about his toys!");
	output("\n\n<i>“Um, what else? Oh - I also love playing graviball. There’s a court on the station and I play twice a week. We’re not the best team, but we’re in the top three. I play point guard. I’ve started playing back when I was at Ausaril Tech and I’ve kept with it since then.”</i>");
	output("\n\n<i>“Other than that, I usually like going out with the crew, having a few drinks and playing a few rounds of billiards. If I’m lucky, usually the night ends with me sinking one in a nice, tight pocket.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToVahn);
}

//Sex
public function vahnSexMenu():void
{
	clearOutput();
	showVahn();
	//First Time:
	if(fuckedVahn())
	{
		output("You ask if Vahn is interested in servicing something <i>other</i> than your ship, like you, for instance.");
		output("\n\nThe blond ausar brushes back his hair and grins, <i>“...Well, I’m definitely keen to warm up your engines.”</i> He gives a quick glance over his shoulder, to make sure none of the other crew are watching.");
		output("\n\n<i>“So - what did you have in mind?”</i>");
	}
	//Repeat
	else
	{
		output("...What do you suggest?");
	}
	//[GiveBJ] [GiveAnal]
	processTime(1);
	clearMenu();
	addButton(0,"GiveBJ",giveVahnABJ,undefined,"Give BJ","Give the ausar mechanic a BJ. He deserves it for all his hard work, right?");
	if(pc.hasCock()) 
	{
		if(pc.cockThatFits(550) >= 0) addButton(1,"GiveAnal",giveVahnAnal,undefined,"Give Anal","Give the ausar mechanic a little rump loving.");
		else addDisabledButton(1,"GiveAnal","Give Anal","You're too big for Vahn.");
	}
	else addDisabledButton(1,"GiveAnal","GiveAnal","You need a dick in order to give him some anal.");
	addButton(14,"Back",VahnTheMechanic);
}

//Sex Scenes
//Give BJ
public function giveVahnABJ():void
{
	clearOutput();
	showVahn();
	output("Looking at Vahn, you’re filled with all kinds of lusty thoughts. You want to tear that jumpsuit off him and just have your way with him. Most of all, you want to suck his half-ausar dick. You want to get him all hot and bothered, to suck on his turgid length and to hear his glorious, pleasured moans.");
	output("\n\nCrooking a finger, you gesture for him to follow you behind a cargo container. It’s semi-private - someone could happen upon you there - but isn’t that half the fun? Vahn gladly follows you, a look of anticipation in his eyes. His bushy brown tail is wagging behind him; he must know he’s in for a ‘treat’.");
	output("\n\nIn the shadowy alcove, you turn to him, ");
	if(!pc.isNude()) output("and begin to strip off your things.");
	else output("and slide your hands down your naked form. Since you’re not wearing a scrap of clothing, everything is already on display, but here in private, he doesn’t have to pretend not to stare...");
	//PC is wearing armor:
	if(!(pc.armor is EmptySlot)) output(" You pull off your [pc.armor], letting your garb fall to the docking floor as he watches on with obvious lust.");
	if(!(pc.upperUndergarment is EmptySlot)) output(" Reaching up, you slip off your [pc.upperGarment], tossing it aside and liberating your [pc.chest].");
	if(!(pc.lowerUndergarment is EmptySlot))
	{
		output(" When you remove your [pc.lowerUndergarment], you take it nice and slow, letting him enjoy the sight of your slowly emerging ");
		if(pc.hasCock()) output("cock");
		if(pc.cockTotal() > 1) output("s");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) 
		{
			output("puss");
			if(pc.totalVaginas() == 1) output("y");
			else output("ies");
		}
		if(!pc.hasVagina() && !pc.hasCock()) output("loins");
		output(".");
	}

	output("\n\nYou feel a rush of pride as a mighty pitch grows in the front of Vahn’s jump suit. You sensuously walk over and tug at the front of his jump suit, pressing your naked [pc.chest] against him, and giving him a long, lusty kiss. When he feverishly kisses you back, you’re both utterly lost in the moment.");
	output("\n\nStripping off his clothes, you pull away from him, and get the measure of his manhood.");
	if(!fuckedVahn()) output(" What you see makes you longingly lick your [pc.lipColor] lips.");
	output(" His dick is long and thick - ten inches of delicious rigidity - and completely terran except for the knot at his base. His low hanging balls look full, ripe, and <i>very</i> fondleable.");

	output("\n\nDropping down ");
	if(pc.hasKnees() && pc.legCount > 1) output("on your [pc.knees]");
	else output("to the ground");
	output(", you soak in every little detail. His musky, manly scent makes your head spin and your mouth");
	if(pc.hasVagina()) output(" - not to mention your [pc.pussies] -");
	output(" wetten. Inching forward, you press your nose against his canine bulge and run it up the underside of his glorious erection, greedily inhaling his dreamy scent.  It truly is a top-notch cock!");
	if(pc.hasTail() && pc.tailType == GLOBAL.TYPE_CANINE) 
	{
		output(" Your ");
		if(pc.tailCount > 1) output("tails swish");
		else output("tail swishes");
		output(" like you’re a bitch in heat!");
	}
	else if(pc.hasTail() && pc.tailType == GLOBAL.TYPE_FELINE) 
	{
		output(" Your feline ");
		if(pc.tailCount > 1) output("tails sway");
		else output("tail sways");
		output(" side to side - you feel like you’re in heat!");
	}

	output("\n\n<i>“Like my scent, do you?”</i> Vahn grinds his cock against your nose and [pc.lips]. You shiver with delight as his firm heat presses forcefully against your [pc.face]. An electric shiver runs down your spine.  You’re just giving a blowjob. Why does it feel like so much <i>more</i>?");
	output("\n\nWith shivering fingers, you reach out and stroke his muscular thighs, as if to steady yourself. Right. Sucking his cock! You start with a long lick, letting your tastebuds roll over his throbbing dick. There’s a hint of salt and sweat, but it’s definitely not unpleasant. The longer you lick it, the tastier it is, until you’re suckling happily on his knob. Mmmm!");
	output("\n\nYou hear Vahn groaning and there’s a splash of warm slickness against your tongue. It drools down, bathing your palate with his gooey spunk. It’s zesty and delicious! Every thought is clouded, bar one - the desire to have more of his cock cream!");
	output("\n\nWith increased zeal, you take his throbbing man-meat wholly into your mouth. His swollen glans presses and rubs against the back of your tongue, feeling so much <i>bigger</i> than it looked. At the same time, his knotted base plushly presses against your [pc.lips]. Rather than try to strain your jaw around his girth, you wetly lash the underside of his cock with your [pc.tongue], running your tip along the wonderfully distinct grooves of his undercarriage.");
	output("\n\nVahn groans and presses his back against the container. At the same time, his hips rise to meet your suckling mouth. You glance up and the half-ausar’s head is lolling back, his eyes partially closed - he’s definitely enjoying himself!");
	output("\n\nYou reach up and cup his hefty balls, running a finger along the sensitive flesh between his sack and buttocks. With the slightest finger curl, he arches and moans. It’s a weak spot! You utterly abuse this knowledge, teasing his perineum as you bob and suckle his manhood.");
	output("\n\nA thrilling flush runs through your body, tickling your [pc.skin]. You’re butt naked in a cargo bay, sucking off this gorgeous mechanic in the shadows. Anyone could come around the corner and see [pc.fullName] on [pc.hisHer] hands and knees, going down on the ground crew. Your [pc.thighs] tremble with sensual delight at the thought - part of you even <i>wants</i> to get caught!");
	if(pc.hasCock() || pc.hasVagina()) 
	{
		output(" Your");
		if(pc.hasCock()) 
		{
			output(" [pc.cocks]");
			if(pc.cockTotal() == 1) output(" is");
			else output(" are");
			output(" rock hard");
		}
		if(pc.hasVagina() && pc.hasCock()) output(", and your");
		if(pc.hasVagina())
		{
			output(" [pc.vaginas]");
			if(pc.totalVaginas() == 1) output(" is");
			else output(" are");
			output(" sopping wet, making a moist mess down there");
		}
		output(".");
	}
	output("\n\nSpurred on by your utter horniness, you relax your throat and push forward, taking his entire ten-inch shaft into your throat. His crown buries itself deep in your gullet and his muscled knot fills your mouth. Drool dribbles down your chin as you eagerly deep throat his sublime cock and his low hanging balls slap under your chin.");
	output("\n\nYour lusty cock-sucking efforts quickly bring him to the brink of ecstasy. With a very loud groan, Vahn suddenly grabs the back of your head. You’re so worked up that as soon as you feel the first slick splash of his boy-cream on your tongue, you’re cumming yourself, ");
	if(pc.hasCock() && pc.hasVagina()) output("both of you simultaneously shooting your loads and you creaming your [pc.vaginas] as well.");
	else if(pc.hasCock() || pc.hasVagina())
	{
		if(pc.hasCock()) output("both of you simultaneously shooting your loads.");
		else if(pc.hasVagina()) 
		{
			output("creaming your [pc.vaginas]");
			if(pc.isSquirter()) output(" and squirting your [pc.girlCum] all over the place");
		}
		output(".");
	}
	else output("your [pc.thighs] trembling with wave after wave of glorious ecstasy.");

	output("\n\nIn your orgasmic haze, you don’t recognize Vahn’s swelling knot until it’s straining your mouth wide open. Wave after wave of his delectable cream shoots down your gullet... and it just doesn’t stop. It’s forceful, but you don’t care - your oral efforts are rewarded with countless gooey ropes of his baby batter washing down your throat and down into your belly. Your mouth is literally mated with his waist, his balls pressed hard against your [pc.face].");
	output("\n\nWhen he finally deswells and pulls his dripping dick out of your equally wet mouth, you’re both utterly spent. Your belly feels warm and full, and your mouth couldn’t be more filled with his slick, succulent taste. Reaching up, you rub your [pc.lips] and let out a dreamy sigh.");
	output("\n\nVahn helps you up, though you’re a bit wobbly and he’s hardly better. He wraps his arms around you and gives you a long, passionate kiss, pressing you up against the cargo container in the process. You run your hands through his thick sandy hair, your tongue dancing with his, sharing both his taste and yours.");
	output("\n\n<i>“...That was stellar. Any time you want to do that again, I’m free. I’ll make time if I have to,”</i> Vahn breathily tells you, stroking your cheek. You both pull away and put on your things. When you come around the corner, more than a few of the ground crew are raising an eyebrow at you both. It’s not that hard to guess what you two were doing!");
	processTime(13+rand(4));
	flags["SEXED_VAHN"] = 1;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give Doggy
public function giveVahnAnal():void
{
	clearOutput();
	showVahn();
	var x:int = pc.cockThatFits(550);
	if(x < 0) x = pc.smallestCockIndex();
	// Req: Pc must have cock
	// Max cocksize: 18 inches long, 5 inches wide.
	output("Looking at Vahn, you’re filled with lusty thoughts of taking the handsome half-ausar. That bushy tail looks so <i>grabbable</i> - you find yourself fantasizing about bending him over and having your way with his perfectly toned butt.");
	output("\n\nPicking up on your body language, Vahn’s tail begins to wag, and he suggestively raises an eyebrow. <i>“You’re... thinking about something. Something good.”</i>");
	output("\n\nYou step forward and whisper in his fluffy canine ear exactly what you’re thinking about doing to him in intimate detail. The moment you utter your sensuous intentions, his breathing becomes hot and heavy.");
	output("\n\nSlipping your arms around his waist, you kiss and suckle on his neck, pressing your hips against his. Vahn lets out a breathy sigh and you feel a stiffening against your [pc.cockNounSimple " + x + "].");
	output("\n\n<i>“I’d... yes, I think I’d like that,”</i> he huskily murmurs. You lead him by the hand up the ramp and into your ship’s cargo bay. There, you tell him to strip for you. Blushing, the blond haired ausar unzips his jumpsuit and begins to slide it down his muscled yet slender body, exposing his broad chest, well-toned abs, and slender waist.");
	if(!fuckedVahn()) output(" His veiny, knotted manhood is already proudly pointing upwards and achingly erect.");

	else output("\n\nYour mouth wettens at the sight of his wonderful manhood. His dick is long and thick - ten inches of deliciously rigidity - and completely terran except for the knot at his base. His low-hanging balls look full and ripe.");

	//Pc is wearing any clothes at all:
	if(!pc.isNude())
	{
		output("\n\nWith a " + pc.mf("cheeky","sultry") + " smile, you decide to give him a little strip tease.");
		if(!(pc.armor is EmptySlot)) output(" Slowly and sensuously, you strip off your [pc.armor] before letting it fall to the floor.");
		if(!(pc.upperUndergarment is EmptySlot)) output(" Reaching up, your [pc.upperGarment] comes off – tossed aside and liberating your [pc.chest].");
		if(!(pc.lowerUndergarment is EmptySlot)) output(" Your [pc.lowerGarment] is slid off inch by inch, exposing your [pc.groin]. Vahn lets out a <i>very</i> appreciative groan at the sight. His bushy blonde tail is wagging madly!");
	}

	output("\n\nYou " + pc.mf("stride up","saunter up") + " and, grabbing his slim hips, turn him around on the spot. Leading him up to one of the cargo crates, you bite his ear and whisper for him to bend over. Obeying your command, the handsome half ausar delightedly gulps and bends forward, lifting his fluffy tail in the air – just like a bitch in heat. As he braces himself against the crate, you grind your [pc.cockNounSimple " + x + "] between his firm butt-cheeks and he excitedly flushes.");

	//FirstTimeAnalWithVahn:
	if(flags["FUCKED_VAHNS_ASS"] == undefined)
	{
		output("\n\n<i>“Is this your first time?”</i> You ask, rubbing your [pc.cockHead " + x + "] against his oh-so-sensitive tail base. His thighs tremble with delight.");
		output("\n\n<i>“N-no, when I was an apprentice, the older guys liked to celebrate a job well done – usually with me,”</i> Vahn moans as you hotdog his hunky ass and his bushy blond tail waggles happily. <i>“Sometimes they’d bend me over and fuck me while I was working, just like this.”</i>");
		output("\n\n<i>“Now I’m a senior tech, nobody fucks me like that anymore.”</i>");
		output("\n\nWell, you’re definitely going to have to fix <i>that</i>.");
	}
	else output("\n\n<i>“Void, I love the feel of your dick,”</i> Vahn moans.");
	output(" Grabbing your [pc.cockNounSimple " + x + "], you position it between his hard butt-cheeks. You press your [pc.cockHead " + x + "] forward and against his deliciously tight pucker. It strains to accommodate your sensitive crown, slowly slipping around it until your tip is buried inside his delectable butt.");

	output("\n\nWith the slightest flex, his hot tunnel wrings your [pc.cockHead " + x + "], and you let out a low, lusty groan - the half ausar’s butt is mind-numbingly tight! Slick rivulets of [pc.cumNoun] pour out of your urethra and into the bent over beefcake, weaving its way deep into his rippling bowels.");
	pc.cockChange();

	output("\n\n<i>“It’s so hot,”</i> Vahn moans, his butt flexing and clenching around your [pc.cockNounSimple " + x + "]. With his snug passage lubed up with your pre-[pc.cumNoun], you bury your " + pc.mf("manhood","member") + " deep inside of him. His hot flesh constricts around your ");
	if(pc.cocks[x].cLength() < 6) output("little");
	else if(pc.cocks[x].cLength() < 16) output("engorged");
	else output("massive");
	output(" length, eagerly and instinctively wringing it for every [pc.cumVisc] drip.");

	output("\n\n<i>“Who does your ass belong to?”</i> You demand of Vahn, grabbing his fluffy tail in one of your hands. At the same time, you pointedly grind your [pc.hips] against his delectable rump, and the blond lets out a sinful little cry.");

	//FirstTimeAnal:
	if(flags["FUCKED_VAHNS_ASS"] == undefined)
	{
		output("\n\n<i>“W-what-?”</i> He breathily asks. You pull back until only your [pc.cockHead " + x + "] remains inside of him, awaiting his answer. His parted pucker longingly wrings your glans. He’s clearly missing your [pc.cockNounSimple " + x + "] inside of him! <i>“W-why’d you pull out-? Come onnn...”</i>");
		output("\n\n<i>“Not until you tell me who your ass belongs to,”</i> you insist, rubbing your [pc.cockHead " + x + "] teasingly against his prostate.  His taut thighs and bushy tail quiver with pent-up pleasure and he lets out a low, howling whine.");
		output("\n\n<i>“... Y-you... my ass... it’s definitely yours. Please, fuck my naughty ass!”</i> The dirty talk is <i>really</i> turning him on, his half-doggie dick straining and slapping against his belly. His own pre-cum is dribbling down his shaft and balls. When you re-sheathe yourself inside of his ass, the river of spunk flows faster, puddling between his spread legs.");
	}
	//Else notFirstTimeAnal:
	else
	{
		output("\n\n<i>“Y-you, my ass belongs to you-!”</i> Vahn lustily moans. The dirty talk really turns him on, his half-doggie dick straining and slapping against his belly. His own pre-cum dribbles down his shaft and balls, a river of spunk that gushes as you pound his perfectly defined ass.");
	}
	output("\n\nThe air is filled with the lewd sound of your slapping thighs and your shared moans. You fuck him hot and hard against the crate, passionately pressing forward to meet his every backwards thrust.  As you feverishly fuck his backside, Vahn groans and needily clenches your [pc.cockNounSimple " + x + "], the half ausar quickly reaching his limit...");
	output("\n\nBoth of you reach that fiery crescendo within moments of each other, letting out sweet, uninhibited cries. As his insides clench and convulse, you grab his hips and bury yourself to the hilt inside of his ass. Climaxing in unison, his butt and insides tremble and he spurts his spunk all over his belly, while you shoot your [pc.cumVisc] hot [pc.cumNoun] inside of the ausar boy’s butt. His tail trembles from tip to base and his pucker deliciously squeezes your base for every last [pc.cumColor] drop.");

	//Pc.hasAKnot:
	if(pc.hasKnot(x))
	{
		output("\n\nYour knot swells as his does, locking inside of Vahn’s ass. With an animalistic cry, the half-ausar whines and rubs his butt against your hips. Some primal calling takes over his mind as you knot with his ass; his furry ears pull back, his tail lifts up, and he begins to lustily pant. His insides ripple around your [pc.cock " + x + "], coaxing each [pc.cumVisc] spurt up to make way for another. Before long his ass is packed full of your [pc.cumNoun], the barest dribble seeping out of his well-stretched star.");
		output("\n\n...Half an hour later...");
	}
	output("\n\nWhen you pull out of Vahn’s sexy bottom, you leave his back door gaping. ");
	if(pc.cumQ() >= 10)
	{
		output("A ");
		if(pc.cumQ() < 25) output("thin stream");
		else output("slippery stream");
		output(" of [pc.cumColor] gushes out and sensuously runs down his thighs. ");
	}
	output("His fluffy blond tail twitches and he lets out a sexy groan. Beneath his furry appendage, his dialated pucker clasps at the empty air.");

	//if pc.doesnothaveknot:
	if(!pc.hasKnot(x))
	{
		output("\n\n<i>“U-um... I’m still c-c-cumming...”</i> Vahn cutely stammers. Thin, intermittent spurts are still jumping out from his swollen cock. Reaching around his waist and down, you suckle on his ear and neck, all the while gently jerking him off.");
		output("\n\nHe moans and trembles as you tease his tender dick, coaxing out each slick spurt. It lewdly batters the cargo bay wall, smearing it in his canine seed. It takes a while for the virile tech to get it all out - he’s got quite a lot to give!");
	}
	output("\n\nTurning Vahn around in your arms, you pull him close and give him a dreamy, post-orgasmic kiss. He moans and slides his arms around your waist. Teasing him a little, you slide one of your fingers into his sloppy butt and he trembles with delight.");
	output("\n\n<i>“... Ahh-! I-If you tease me like t-that, I-I’ll want to go again...”</i> the male tech lightly whines, his blond doggy ears flattened back. He sucks on your lower lip, nibbling it playfully - he doesn’t seem <i>entirely</i> against the idea...");
	output("\n\nThere’s a shout from outside the ship. One of the ground crew is looking for him! You both hastily get redressed, barely finishing in time as a tech jogs up the ramp.");
	output("\n\nVahn winks to you and walks down the ramp with his co-worker, getting back to work. There’s a slight wobble to his step and his tail is wagging happily.");
	output("\n\nWith a little grin, you wonder how long it will be before the half-ausar notices the dripping trail of cum he’s leaving on the deck floor...?");
	processTime(20+rand(10));
	flags["SEXED_VAHN"] = 1;
	flags["FUCKED_VAHNS_ASS"] = 1;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


































