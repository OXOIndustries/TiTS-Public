public function brynnHeader(nude:Boolean = false):void
{
	if(nude) showBust("BRYNN_NUDE");
	else showBust("BRYNN");
	showName("\nBRYNN");
	author("Gedan");
}

public function brynnIntroduced():Boolean
{
	if (flags["BRYNN_INTRODUCED"] == undefined) return false;
	return true;
}

// Returns 3 states
// 0 = no proc
// 1 = regular proc. message but no button
// 2 = autoenter proc. message and hide all buttons, run this shit go go go
public function brynnRandomBarnEventFunc():Boolean
{
	flags["BRYNN_AUTOENTER"] = 0;
	
	if (flags["BRYNN_MET_TODAY"] == undefined && rand(5) == 0)
	{		
		clearOutput();
		brynnHeader();
		
		output("Whilst [pc.walking] past one of the stalls,");
		
		// Treated
		if (pc.isTreated())
		{
			output(" your nose catches the heavenly smell of");
			// TODO: Figure out how different types of treatment are going to be identified.
			if (pc.mf("m", "f") == "m") output(" a horny cow-girl in need");
			else output(" a delicious, virile cock, begging to be serviced");
			output(". Your mouth salivates at the prospect, and on instinct you turn towards the doors of the nearest stall, the scent already having having wound its hooks deep into your mind, dragging you inexorably to the source.");
			clearMenu();
			
			if (!brynnIntroduced() || pc.lust() / 10 > pc.willpower())
			{
				clearMenu();
				flags["BRYNN_AUTOENTER"] = 1;
				addButton(0, "Next", move, "BrynnsStall");
				return true;
			}
			else
			{
				return true;
			}
		}
		else
		{
			if (CodexManager.entryViewed("The Treatment"))
			{
				output(" you catch a lung-full of pheromones; an amalgamation containing the decidedly delicate spice of a horny cow-girl in need, almost hidden under the overpowering, brutish musk of virile bull-stud.");
			}
			else
			{
				output(" you [pc.walk] into a veritable cloud of sex; an unmistakable mix of juicy, needy cunt and virile male musk.");
			}
			
			if (pc.hasCock())
			{
				output(" Your [pc.cocks] throb");
				if (pc.cocks.length == 1) output("s");
				output(" insistently,");
				if (!pc.isCrotchExposed())
				{
					output(" swelling");
					if (pc.biggestCockLength() > 12) output(" uncomfortably");
					output(", restrained as");
					if (pc.cocks.length == 1) output(" it is");
					else output(" they are");
					output(" by your [pc.gear].");
				}
				else
				{
					output(" quickly swelling to full-mast and leaving little doubt as to the effect the thick smell of sex is having on your person.");
				}
			}
			if (pc.hasVagina())
			{
				output(" Your [pc.cunts]");
				if (pc.hasCock())
				{
					output(" follow");
					if (pc.vaginas.length == 1) output("s");
					output(" suit, fluttering");
				}
				else
				{
					output(" flutter");
					if (pc.vaginas.length == 1) output("s");
					output(" and flush");
					if (pc.vaginas.length == 1) output("es");
				}
				output(" with need as arousal begins to bead around your quim");
				if (pc.vaginas.length > 1) output("s, ");
				else output(",");
				if (pc.hasCock()) output(" as equally");
				output(" sensitive to the scent of a powerful, virile male wanting for a tight cunt to fill.");
			}

			output("\n\nDeep, guttural groans of encouragement emanate from one of the stalls in your proximity, simply adding further confirmation that there’s somebody getting hot and heavy nearby.");

			return true;
		}
	}
	return false;
}

public function brynnsStallFunc():Boolean
{
	if (flags["BRYNN_MET_TODAY"] != undefined) return false;

	clearOutput();
	brynnHeader(true);

	if (flags["ENTERED_BRYNNS_STALL"] == undefined)
	{
		flags["ENTERED_BRYNNS_STALL"] = 1;

		output("Parting the doors to the stall, you inch your way into the sweltering space beyond. The thick smell of sodden cunt mixed with liberal quantities of masculine musk assaults your sense of smell the second you cross the threshold, the power of the spicy scent amplified ten-fold almost instantly. The concentration of the thick smell of raw <i>fuck</i> hits you hard; a flash of a tinny metallic taste in your mouth pre-empting a prodigious amount of saliva, your mouth literally watering at the prospect.");
		
		output("\n\nThe squeal of the double-hinged doors parting as you enter seems to have gone unnoticed; that, or the occupants of the room just don’t care about having an audience. Or they’re expecting more company.");
		
		output("\n\nWhen your mind cuts through the lusty haze induced by the heavy, pheromone-laden air, you’re greeted by the sight of a monstrously huge bull-stud. Even sat low to the floor as he is, almost squatting atop a solid wooden bench,");
		if (pc.tallness < 12 * 7) output(" he still towers over you");
		else output(" you’re still only at eye-level with him");
		output(". The subtle motion of muscles rippling under his flesh is the only indication that the centerpiece of the room is actually a living, breathing creature, rather than an exquisitely crafted marble statue capturing an idealised male physique.");
		
		output("\n\nThe literal giant of a man seems cramped, almost cooped up in such a tiny little space. His presence absolutely dominates the interior of the stall, his scale so massive that everything appears to be only a fraction of its usual size. He looks as though he could easily reach out and touch both walls of the stall at the same time without much trouble, only further magnifying the effect and leaving you subtly uncomfortable. You know the stall is nowhere near as tiny as it feels right now, but you can’t shake the feeling of being slightly claustrophobic because of it. Shit, even the tiny little maintenance ducts meandering their way all over your ship seem bigger than <i>this</i>.");
		
		output("\n\nA deep, bassy grunt vibrates from deep within his chest, and it’s only then, with his vocal approval of his current predicament, that you realize he isn’t in here on his own. So enraptured by his appearance as you’ve been you had completely neglected to notice the pair of curvaceous cowgirls also residing within the stall. Each one is wrapped around one the chiseled adonis’ powerful legs and are worshipping the");
		if (pc.isTreated()) output(" prime beef");
		output(" thick, equine cock");
		output(" drooping from the bull-stud’s crotch with admittedly well-deserved praise. They alternate between planting their pouty lips along the heavy length of cock, kissing deeply along its length from base to flared head, and lavishing the flesh before them with their wide, wet tongues. As one licks toward the thickly flared head to kiss a bead of precum from the tip of the cock, the other nuzzles in against the base, lapping around the weighty root of dick to tease at the heavily laden balls below.");
		
		output("\n\nThe scale of the brute before you is only made more apparent by the size of his meaty hands, both easily wrapped around the back of the two cowgirls’ heads, firmly controlling the pace of the pair along his immense cock. Despite all the attention, the dick the girls are focused so intently upon is only semi-rigid; the mass of sensitive flesh before them curves heavily in the air, one of the girls keeping the flared head aloft with a delicate grip, so that both of them can access every glorious inch of cock.");
		
		output("\n\n<i>“More,”</i> comes a deep voice, reverberating through the stall, <i>“it’s not enough - urgh.”</i> The bull-stud sits upright slowly, his control over the two girls slurping noisily at his cock not faltering for a second. He bites his lip, hard enough to force a slight grunt of discomfort from deep within his chest, as he rocks his powerful hips forward, thrusting his dick between the two girls trying their very best to service him. <i>“It’s not enough!”</i> comes his thick, gravelly voice again.");
	}
	else
	{
		if (!pc.isTreated())
		{
			if (brynnIntroduced()) output("Brynn");
			else output("The bull");
			output(", as usual, dominates the inside of the stall. He has himself another pair of knob-polishers, enraptured by the slab of cockflesh before them, although that’s hardly surpising given the nature of New Texas.");
			if (brynnIntroduced()) output(" Or Brynn, for that matter.");
			
			output("\n\nThis time, the squeal of the double-hinged doors doesn’t go unnoticed;");
			if (brynnIntroduced()) output(" Brynn");
			else output(" the bull");
			output(" lifts his head up from his reclined position against the back wall of the stall.");
			if (brynnIntroduced()) output(" <i>“Ah, [pc.name]. Good to - aah, right there - see you again!”</i> Brynn greets you, his deep, gravelly voice reverberating through the enclosed space and adding a certain ominous weight to his words in the process. <i>“Your timing couldn’t be better; these girls could - urgh - use a little help, and I know just the person...”</i>");
			else output("<i>“Come in, come in,”</i> the stud greets you, his deep, gravelly voice reverberating through the enclosed space and adding a certain ominous weight to his words in the process. <i>“your timing couldn’t be better; these girls could use a little help....”</i>");
		}
		else
		{
			if (flags["BRYNN_AUTOENTER"] == 1)
			{
				output("The delicious smell filling the air speaks to your treated mind on a level far below conscious thought, drumming directly on the deeply-rooted part of your mind that desires- no, craves- the essence of those scents. The quiet minority that used to lurk deep within your mind; the miniscule voice that grew and grew, until it started to drown out every other thought. The small part of your psyche that your rational mind used to be able to reason with - now, thanks to the Treatment, it shouts over every other need, every last desire, every other conceivable action until it gets what it wants. Until it gets what it <i>craves</i>; sex. Hot, sweaty, messy <i>fucking</i>, in every imaginable way, shape and form.");
				if (pc.hasVagina()) output(" Thick, virile cocks to sate the burning fire, smoldering away deep within your [pc.cunt]");
				if (pc.hasVagina() && pc.hasCock()) output("; t");
				else if (!pc.hasVagina() && pc.hasCock()) output(" T");
				if (pc.hasCock()) output("ight, juicy cunts ready to wring your throbbing [pc.cocksLight] for every drop of cum your body can produce");
				if (pc.hasVagina() || pc.hasCock()) output(".");
				output(" To <i>fuck</i>.");
				
				output("\n\nYou push through the doors of the stall in a daze, the smell of the very thing your Treated body needs dragging you nose-first through the barn and to the strongest source of raw sex it can find. Your [pc.feet] abruptly come");
				if(pc.legCount == 1) output("s");
				output(" to a stop, your [pc.legOrLegs] having been moving on effective autopilot without your conscious consent.");
				
				if (brynnIntroduced())
				{
					output("\n\n<i>“I’m glad to see you found your way back, [pc.name],”</i> Brynn announces, his heavy voice reverberating through the interior of the stall.");
				}
				else
				{
					output("\n\n<i>“Come in, come in,”</i> the stud announces, his heavy voice reverberating through the interior of the stall.");
				}

				output(" You look up from your lust-fueled daze, and register the filthy smirk across the bull’s face. He already knows that he’s going to get exactly what he wants; the only question is just how long it’s going to take that little voice that you’ve barely managed to stuff back into some deep, dark corner of your mind to find its way back to the forefront, and take action on your behalf.");
			}
			else
			{
				output("You graciously accept what the little voice in the back of your mind is currently demanding you do; to seek out the source of that fabulous smell immediately, and to immerse yourself in the further creation of such delicious, messy fucking as quickly as possible. To sate the ever-present burning desire smoldering deep within your mind and your loins.");
				
				output("\n\nPerking your nose into the air, you follow your Treatment-induced instincts and sniff out the strongest source of hot, sweaty sex within your vicinity; chasing the smell as it gets stronger, you quickly find yourself pushing through a set of double-hinged doors to one of the stalls toward the rear of the milk barn. You’re greeted by the sight of");
				if (brynnIntroduced()) output(" Brynn");
				else output(" a massive bull-stud");
				output(", lounging lazily upon his sturdy bench, his cock at half-mast between a");
				if (brynnIntroduced()) output(" new");
				output(" pair of cow-girls, both of them working a monstrously thick equine cock between them as best they can.");
				
				if (brynnIntroduced()) output("\n\n<i>“[pc.name]!”</i> Brynn greets you, having been alerted to your presence by the sound of the stall doors squealing closed behind you, <i>“Back for another round?”</i>");
				else
				{
					output("\n\n<i>“Welcome!”</i> the stud greets you, having been alerted to your presence by the sound of the stall doors squealing closed behind you,");
					if (silly) output(" <i>“Stay awhile and suckle?”</i>");
					else output(" <i>“Feel like easing the burden on these two ladies?”</i>");
				}
			}
		}
	}

	//[Entrance Menu]
	brynnEntranceMenu();
	return true;
}

public function brynnEntranceMenu():void
{
	flags["BRYNN_MET_TODAY"] = 1;
	clearMenu();
	addButton(0, "Suck It", suckThatMassiveStudlyBrynnDick, undefined, "Suck It", "Help the girls out on their quest to worship his massive dick.");
	addButton(14, "Leave", brynnLeave);
}

public function brynnLeave():void
{
	clearOutput();
	brynnHeader(true);
	if (!brynnIntroduced())
	{
		output("Between the two girls slurping noisily along the length of cock, and the owner of said mass of sensitive flesh, nobody has yet noticed that they’ve garnered themselves a peeping tom.");

		if (!pc.isTreated())
		{
			output("\n\nNot wanting to potentially interrupt the group, you sneak back out through the doors of the stall before your presence is registered.");
		}
		else
		{
			output("\n\nYou somehow manage to beat back the little voice in your mind <i>demanding</i> that"); 
			// TODO: Another one of the treatment-type clarifications
			if (!pc.hasCock()) output(" you join the girls in reverence of such a magnificent cock");
			else output(" you plunge your throbbing, aching cock into the perfectly framed, fabulously soaked cunts on display");
			output(", and sneak back out of the stall before your presence is registered.");
		}
	}
	else
	{
		output("You can barely manage to keep your tongue in your mouth - and your hands");
		if (pc.hasCock() || pc.hasVagina())
		{
			if (!pc.isCrotchExposed()) output(" out of your pants and");
		}
		else if (pc.biggestTitSize() > 1)
		{
			if (!pc.isChestExposed()) output(" out of your shirt and")
		}
		else
		{
			if (!pc.isCrotchExposed()) output(" out of your pants and");
		}
		output(" away from your");

		if (pc.hasVagina())
		{
			output(" [pc.cunts]")
		}
		else if (pc.hasCock())
		{
			output(" [pc.cocks]")
		}
		else if (pc.biggestTitSize() > 1)
		{
			output(" [pc.breasts]");
		}
		else
		{
			output(" [pc.butt]")
		}
		output(", but you somehow manage to wrest back control from your baser instincts. Bidding the group a pleasurable finish to their no-doubt extensive rendezvous, you slide back out through the doors of the stall");

		if (pc.isTreated())
		{
			output(" before the nagging, incessant little voice tucked deep in your mind manages to batter its way back to the forefront and take action on your behalf.");
		}
		else
		{
			output(" before you have a chance to reconsider.");
		}
	}
	
	clearMenu();
	addButton(0, "Next", move, "514");
}

public function suckThatMassiveStudlyBrynnDick():void
{
	clearOutput();
	brynnHeader(true);

	var didDeepthroat:Boolean = false;

	output("Before you have a chance to realize which way is up, you’re down on your [pc.knees] and shuffling your way between the two curvaceous cowgirls already servicing");
	if (!brynnIntroduced()) output(" the bull-stud");
	else output(" Brynn");
	output("’s magnificent cock. As you settle into position at just the perfect spot, the girls close in around you, their wide, luscious frames brushing against your [pc.hips] to ensure that their new-found help doesn’t have an opportunity to make a last-second departure before the stud has been sated.");
	
	output("\n\nNow that you’re safely tucked between");
	if (!brynnIntroduced()) output(" the stud");
	else output(" Brynn");
	output("’s legs, you can see every glorious inch of equine mare-breaker in exquisite detail; every vein, ridge and bulge throbbing in time with the adonis’ powerful heartbeat. Your");
	if (pc.hasVagina())
	{
		output(" [pc.cunts] flutter");
		if (pc.vaginas.length == 1) output("s");
	}
	else if (pc.hasCock())
	{
		output(" [pc.cocksLight] throb");
		if (pc.cocks.length == 1) output("s");
	}
	else output(" [pc.asshole] flutters");
	output(" as you take in the sheer scale of the dick before you, as you begin to map every last detail of it: from the blunt, flared head, to the thick medial ring, all the way down to the lightly furred sheath from which the pillar of prime cow-girl breeding cock extends.");
	
	output("\n\nAs much of a feast for the senses as the sight of the cock is, your ears are not excluded from the party; the girls, so utterly focused on the potent symbol of masculinity that has all three of you enraptured, continue to work the sensitive flesh over with their mouths; they haphazardly move along the length of dick, shifting between long, wet licks from stem to stern, to planting their plump lips against the more sensitive features, deeply suckling on what little of the cock they can actually slurp into their mouths.");

	if (pc.isTreated())
	{
		output("\n\nThe needy fire deep within your loins burns all the hotter now that you’re this close to the source of raw masculinity your Treated mind demanded you seek out; enclosed between the luscious girls to the rear, the stud’s powerful legs to either side, and the magnificent cock in front, the heady musk must be a dozen times more powerful. Seeping from every square millimeter of skin, every single pore, from every direction, all at once... your muscles weaken for a split second, fluttering in time with your");
		if (pc.hasVagina()) output(" [pc.cunts]");
		else output(" [pc.asshole]");
		output(", and you fall back against your sisters-in-arms behind you.");
	}
	else
	{
		output("\n\nThe needy fire deep within your loins burns all the hotter now that you’re this close to such a powerful source of raw virility. Enclosed between the luscious girls to the rear, the stud’s powerful legs to either side, and the magnificent cock in front, the heady");
		if (!CodexManager.entryViewed("The Treatment")) output(" musk laces");
		else output(" pheromones lace");
		output(" the air all the more thoroughly, amplifying the effect by an order of magnitude. It’s all you can do to stay upright, weakly grasping at");
		if (!brynnIntroduced()) output(" the stud");
		else output(" Brynn");
		output("’s thighs to stay upright as your body acclimatizes to the stuffy environment.");
	}

	output("\n\nWhen your gaze finally meets the base of the monstrously huge cock, you can’t help but stifle a needy groan; proudly on display between the heavily muscled legs defining the limits of your universe sit a weighty pair of balls. You tentatively reach a hand towards the smooth sack to heft the weight of one of the globes fueling the cock that has three");
	if (pc.mfn("m", "f", "n") != "f") output(" ‘girls’");
	else output(" girls");
	output(" swooning. They’re so <i>heavy</i>, the liquid mass contained within the stud’s nuts pooling across your palm, just one of his balls completely dominating the size of your hand. Their virile contents churns as you grope the sensitive flesh, every subtle squeeze drawing a deep, contented groan from above you.");

	output("\n\nA glimmer of something right in the crux of the stud’s hefty sack shines in the dim light making it past the mass of bodies enclosing you. Your gentle jouncing of his balls disturbs a small amount of it, a trail of fluid escaping from the captive volume, running between the weighty orbs to dab the faintest trace of wetness on your hand. You somewhat reluctantly slide your hand out from under the comfortable warmth of soft skin, and bring it up to your [pc.face].");
	if (pc.isTreated()) output(" Your hand smells heavenly, of absolute paradise, distilled into liquid form and dappled over your palm;");
	else output(" One whiff of the precum coating your hand and");
	output(" before you know it, you’re licking every last trace of the watery goodness from your fingers.");

	output("\n\nThe");
	if (pc.isTreated()) output(" delicious");
	output(" tang of pre-cum coating your digits only lasts a few scant seconds; in no time at all, the majority of it is gone, and you’re sucking the last traces of its flavor from your skin. Your very next breath reminds you of where you are, and that the source of that delicious taste is only inches away. You lean forward and bring your");
	if (!pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output(" mouth");
	else output(" maw");
	output(" to within millimeters of");
	if (!brynnIntroduced()) output(" the stud");
	else output(" Brynn");
	output("’s balls, focusing right on the dimple where the little reservoir of milky whiteness has collected.");

	output("\n\nYou squeeze in under the rigid length of cock. It’s so close to your face, you can feel the heat of it on your skin, and you can almost hear the stud’s heartbeat as blood courses through the throbbing maleness. One little lash of your [pc.tongue] is all it takes to reach the source of the");
	if (pc.isTreated()) output(" delicious");
	else output(" tangy");
	output(" fluid - and it’s all it takes for what little of your restraint remains to evaporate as well. You mash your head right into the soft flesh drenched in the ambrosia your taste buds demand, your [pc.face] quickly sandwiching itself between a baby-smooth ball-pillow and a swelteringly hot cock. You pucker your [pc.lips] and plant them firmly against the skin of");
	if (!brynnIntroduced()) output(" the stud");
	else output(" Brynn");
	output("’s ballsack, suckling the wetness straight from his flesh");
	if (pc.isTreated()) output("; you’re getting what you want, and giving his big ol’ balls a sloppy wet kiss in appreciation for their tireless work");
	output(".");
	
	output("\n\nIn only a matter of seconds, you’ve suckled every drop of pre from the little pool nestled within his balls, so you go in search of more. Gradually, you work across the surface of the silky-smooth skin, licking and slurping every last trace of tangy, musky fluid you can find. You pull away before too long, cupping his balls with a hand in reverence and giving each globe one last final, gentle kiss, to take in the sight of a pair of saliva-shone balls");
	if (pc.isTreated()) output(" some part tucked away in your mind profoundly proud of such a job well done");
	output(".");

	if (!brynnIntroduced()) output("\n\nWhilst the addition of a third greedy mouth to the veritable palace of cock-worship might have gone unnoticed by the stud, the loss of one of his needy followers certainly does register somewhere deep within his");
	else output("\n\nLosing one of the worshipful mouths suckling against his mighty pillar of cock registers somewhere deep within the stud’s");
	output(" pleasure-stricken mind. A deep grunt tinged with a definite tone of disapproval rings out above you, and a second later, his strong fingers carefully");
	if (pc.hairLength > 5) output(" entwine themselves in your [pc.hair]");
	else output(" wrap around the back of your head");
	output(". The grip urges you forward, pushing your face back into the crux at the base of the meaty dick, the intent of the owner of the hand made very clear. Not wanting - or willing - to disappoint, you happily get back to work slurping at the tangy, masculine flesh that your face is being gently, yet insistently pushed against.");

	output("\n\nSurrendering to the control of the commanding grip, you wrap your mouth around as much of the cockmeat as you can, sucking on the sensitive flesh as it passes between your [pc.lips] achingly slowly. Every now and then, a little dab of wetness beads down the side of your cheek, the source of the heady pre that you’d so greedily devoured only moments ago still drooling copious quantities of the watery stuff down the underside of the enormous cock. The wetness only serves to motivate you into working your [pc.tongue] against the pillar of masculinity all the harder, seeking out every last dribble of tangy sweetness still tainting the pulsing flesh.");

	if (!pc.isTreated())
	{
		output("\n\nWith the need to decide just how best to lavish praise upon the stud’s cock taken out of your hands, your focus is split evenly between the taste of his flesh between your lips, and the");
		if (pc.hasCock() || pc.hasVagina()) 
		{
			if (pc.hasVagina()) 
			{
				if (pc.wettestVaginalWetness() <= 3) output(" beading");
				else output(" drooling");
				output(" wetness of your [pc.cunts]");
			}
			if (pc.hasCock() && pc.hasVagina()) 
			{
				output(" and");
			}
			if (pc.hasCock())
			{
				output(" insistent throbbing of your [pc.cocksLight]");
			}
		}
		else
		{
			output(" needy throbbing deep in your loins");
		}
		output(". With your mouth already working");
		if (!brynnIntroduced()) output(" the stud");
		else output(" Brynn");
		output(" over, y");
	}
	else
	{
		// Treated
		output("\n\nNo longer having to dedicate precious thinking power to the task of figuring out just how best to bring pleasure to the virile stud with his cock lodged between your lips, you’ve finally got a chance to realize just how needy your own");
		if (pc.hasVagina()) output(" [pc.cunts]");
		else if (pc.hasCock()) output(" [pc.cocks]");
		else output(" loins");
		if (pc.hasVagina() && pc.vaginas.length == 1) output(" is");
		else if (pc.hasVagina() && pc.vaginas.length > 1) output(" are");
		else if (pc.hasCock() && pc.cocks.length == 1) output(" is");
		else if (pc.hasCock() && pc.cocks.length > 1) output(" are");
		else output(" are");
		output(". Just the scent of such a perfectly formed example of a bull-stud has your");
		if (pc.hasVagina()) output(" thighs soaking");
		else if (pc.hasCock()) output(" cock throbbing");
		else output(" lust raging");
		output(" - having even only a small portion of his cock stuffed in your mouth, and the delicious taste of his pre oozing over your tongue has your");
		if (pc.hasVagina()) output(" greedy cunt");
		else if (pc.hasCock()) output(" needy cock");
		else output(" [pc.asshole]");
		output(" just begging for attention. Y");
	}

	// Front genitals
	// Not and/or for cocks/cunts- pref cunts over cocks
	if (pc.genitalSpot == 0 || pc.genitalSpot == 1)
	{
		output("ou let one of your hands fall from his thickly muscled thighs and slip it toward");
		if (pc.hasVagina()) output(" [pc.oneCunt], using your fingers to tug and knead at your quivering cunt lips in time to the cock throbbing against your [pc.tongue].");
		else if (pc.hasCock()) output(" [pc.oneCock], wrapping your fingers around its girth and stroking yourself in time to the shaft throbbing against your [pc.tongue].");
		else output(" your [pc.asshole], gently working your fingers against your sensitive rosebud in time to the cock throbbing against your [pc.tongue].");
	}
	// Rear genitals
	else
	{
		output("ou let one of your hands fall from his thickly muscled thighs and reach back as far as you can. Your taur-like body is just too large though, the stimulation you crave");
		if (pc.hasVagina())
		{
			output(" against your cunt");
			if (pc.vaginas.length > 1) output("s");
			output(" agonizingly out of reach.");
		}
		else if (pc.hasCock())
		{
			output(" around your dick");
			if (pc.cocks.length > 1) output("s");
			output(" agonizingly out of reach.");
		}
		else output(" against your asshole agonizingly out of reach.");

		output("\n\nOne of the cowgirls to your rear takes note of your plight, and she lends a hand - quite literally. Her delicately soft fingers are quickly and confidently");
		if (pc.hasVagina()) output(" kneading at the lips of your [pc.cunt]");
		else if (pc.hasCock()) output(" stroking along the length of your [pc.cock]");
		else output(" working against your [pc.asshole]");
		output(" in time to the throbs pulsing through the length of cock wedged between your [pc.lips]. You just barely manage to mutter out a");
		if (pc.mfn("m","f","n") != "m") output(" moan");
		else output(" groan");
		output(" of thanks before refocusing your mouth fully to the task of bringing immeasurable pleasure to");
		if (!brynnIntroduced()) output(" the stud");
		else output(" Brynn");
		output(".");
	}

	output("\n\nYour mouth is inched along the seemingly endless feet of cock with a firmly controlled pace, allowing you time to inspect every ridge along its length with your tongue in great detail");
	if (pc.isTreated()) output(", the Treatment’s tune-up of your oral sensitivity bringing your own pleasure to new heights");
	output(". As you bump into the ring at the midpoint of the cock, the grip controlling your progress stalls momentarily, allowing you time to get far more intimate with the highly sensitive feature; you experiment with sucking and nibbling on the thick ridge, figuring out the most pleasurable effect based on the tone of the stud’s growing grunts of approval at the collective activity of three needy sluts suckling his iron-hard shaft.");
	
	output("\n\nEventually though, the grip begins to tug you away from your station. You give the ridge a final parting nibble before you’re pulled away from it, further up the length of cock. As you near the head, you notice the trail of musky pre you’ve spent considerable effort to capture entirely growing thicker; you find more and more of the tangy fluid to tantalize your taste buds, until you finally reach the flared head of the monster horsecock. The grip pulls you away from the pillar of flesh, and you strain your tongue to maintain contact with it for as long as possible, but it’s out of reach all too quickly.");
	
	output("\n\nThankfully, it isn’t long before you’re being pushed back towards it; this time, aimed right at the crown topping the magnificent, throbbing beast. Just before contact though, the controlling hand determining when, and where, you’re allowed to worship its owners cock stops you short. Casting your gaze upward, you’re greeted by the stud’s piercing brown eyes staring back at you, a faintly impressed smirk upon his face.");

	if (!brynnIntroduced())
	{
		output("\n\n<i>“You’re good, [pc.girl]. What’s your name?”</i> he asks. The sheer fact that his attention is now firmly focused on you, waiting for your answer, causes a flutter in your loins.");
		
		output("\n\n<i>“[pc.name],”</i> you reply");
		if (pc.isTreated()) output(" with a wink of an eye");
		output(". <i>“[pc.name] St-”</i>. Before you can finish your full name, the bull-man pulls you back onto his cock, smothering the words from your lips with the fat head of his dick.");
		
		output("\n\n<i>“Brynn,”</i> he replies. <i>“Now, o");
	}
	else output("\n\n<i>“O");

	output("pen wide, [pc.girl]");
	if (brynnIntroduced()) output(",”</i> he tells you, his deep voice being directed at you causing a flutter of weakness in your [pc.knees]. Before you can muster a reply, the bull-man pulls you back onto his cock, smothering whatever words might have been forthcoming with the fat head of his dick.");
	else output(".”</i>");

	output("\n\nYour mouth is mashed right into the streaming source of the");
	if (pc.isTreated()) output(" delicious");
	else output(" tasty");
	output(" pre that you’ve been focused on entirely; heavy, heady spurts of the musky fluid liberally oozing from the cockhead directly on to your [pc.tongue]. Once more, you pucker up and suck lightly, now being rewarded for your worshipful work with liberal spurts of the stuff straight from the source across your tastebuds. You work your writhing, slick muscle across the scant features available to it, tickling at the subtle ridges and undulations across the head of Brynn’s flared cockmeat. Your ears are treated to the sound of the stud vocalising his pleasure, long, drawn out grunts and groans building deep in his chest, peaking whenever you hit a particularly sensitive spot.");

	output("\n\nWhen you tease at the opening of his cock- seeking even better access to the liquid ambrosia jetting across your tongue- the stud’s grunts of approval melt into a strangled exhalation. You look up, dragging your eyes away from his pillar of cock, and look towards his face; his eyes are half-lidded, and his thick, wide tongue hangs from his open mouth. You pull your tongue away from the slit in the center of his fleshy spear, and a moment later, he settles back down to terra-firma.");
	
	output("\n\n<i>“Damn [pc.name]- you’re a fucking keeper!”</i> he exults, his powerful grip pushing you into his cock all the more insistently in response.");
	
	output("\n\n");
	if (silly) output("Stuck between a cock and a hard place");
	else output("With his powerful grip behind you, and his iron-hard cock in front");
	output(", there’s only one thing you can do- you stretch your mouth open as wide as possible, as he rocks your head from side to side to slowly work your");
	if (pc.isTreated()) output(" cock-hole");
	else output(" suckling maw");
	output(" open wider. With a pop, one half of the blunt cockhead slips into your mouth, and with one final rock to the other side punctuated with another wet pop, your jaw finally opens wide enough for the thick slab of dick to squeeze inside.");
	
	output("\n\nWith his cock lodged firmly in your mouth, the constant flow of liquid");
	if (pc.isTreated()) output(" paradise");
	else output(" virility");
	output(" increases; a testament to the pleasure that your maw is bringing the stud, simply by offering a wet, tight hole to sheathe inside of. He seems content to leave you there, giving your jaw time to relax and properly accept such a hugely thick cock jamming it wide open.");

	// First time OR not treated OR no horns
	if (flags["SUCKED_BRYNN"] == undefined || !pc.canDeepthroat() || pc.tallness < 59)
	{
		flags["SUCKED_BRYNN"] = 1;
		
		output("\n\nThe increasing flow of musky pre oozing directly onto your tongue rapidly begins to fill your mouth to capacity; between the volume occupied by thickly pulsating cock and the near-perfect seal of your [pc.lips] stretched tight around the mottled, veiny flesh, there’s nowhere for it to escape. It builds and builds, contained within your mouth, basting your tongue in its heady flavor, sloshing around as your sinuous muscle continues to tease at the head of the stud’s cock in an uncontrollable reactive impulse, trying to weakly push the foreign invader, by now firmly lodged behind your teeth, out.");
		
		output("\n\nWith nowhere for the churning, tangy pre building up in your mouth to go, it’s only a matter of a few short seconds before it’s tickling at the back of your throat. With no other option, you’re forced to swallow it down- not that you were actively trying to avoid it. With the air-tight seal of lips-around-cock, swallowing the stud’s liquid lust has the added side-effect of providing an exquiste vaccum around his cock, suckling firmly on the sensetive flared head in the process. The response is immediate, a much thicker spurt of salty fluid jetting from Brynn’s cock, filling your mouth much faster than previously- a vicious feedback cycle, every mouthful of pre swallowed forcing the next to come even faster than the last.");
		
		output("\n\nIt only takes a couple of cycles before you’re struggling to keep up with the prodigious flow pouring from his cock. A deep rumble grows in the stud’s chest, the vibrations flowing out through his limbs as it intensifies in-tempo with the powerful suckling around his throbbing cock. As your swallows reach a constant peak, so too does the stud’s groaning appreciation of your oral attentions.");
		
		output("\n\nYou’re caught by surprise when his cock slips another few inches deeper into your mouth, threatening to start making progress down your throat; the stud’s hips are bucking slightly- restrained, held-back- as his pleasure rolls over into orgasm. The vibrating-rumble passing through his cock and into your head, thanks to the snug fit against your jaw, grows, his cock throbbing even larger for a scant second.");
		
		output("\n\nA sudden burst of much thicker fluid slams into the back of your throat, the");
		if (pc.isTreated()) output(" delicious");
		output(" taste of the virile bull much stronger, far more potent, than it previously had been. The speed and the sheer quantity of the stuff catches you by surprise, and the force of it against the back of your mouth forces you to cough rather than to swallow it down. Between the mouthful of thick cum, the coughing closing off your throat, and a larger follow up jet spewing from the bulls cock, the combined pressure forces the fat cockhead from your lips. The majority of the second shot of spunk covers your face entirely, splattering you from chin to forehead in a single shot.");
		
		output("\n\nBy the time you’ve actually managed to catch a breath, Brynn has fired off another two thick shots of cum, his cock still aimed directly at your face. By the fifth shot, the pressure is much weaker, the quantity greatly reduced- it arcs through the air, and lands in your still agape mouth, quickly splattering your tongue with a fresh load of heavy jizz. You quickly swallow it down");
		if (pc.isTreated()) output("- enjoying the much stronger flavor, and its far heavier weight resting in your stomach, compared to the watery pre the stud graciously provided your hungry mouth.");
		else output(", the much thicker fluid threatening to cut off your ability to breathe between it liberally coating your [pc.face], clogging your nose with its much stronger scent, and resting heavily on your tongue.");
		
		output("\n\nThe sixth is smaller again, this time falling far short of your face and lazily splattering over your [pc.fullChest], finishing the cumglaze started by the initial spurts completely coating your visage.");
	}
	else
	{
		output("\n\nThe delicious proof of the stud’s appreciation for your tight, suckling mouth flows liberally, pre-cum oozing from the fat cock directly onto your tongue. You swirl it around with your tongue, thoroughly enjoying both the taste and the texture of the watery fluid, sampling it like one would a fine wine. With your [pc.lips] sealed tight around the mottled, veiny flesh stuffed into your mouth, the tasty treat rapidly fills your mouth to capacity, your cheeks puffed out like some mockery of a squirrel’s stuffed full of nuts.");
		
		output("\n\nGreedily, you swallow down the first mouthful of Brynn’s pre, the watery liquid gliding down your throat oh so very smoothly. Slurping down the first mouthful only serves to increase the flow escaping the fat cock; the act of swallowing also, as it happens, providing the stud a rather pleasurable and sustained suckle against the sensitive head of his cock. With less room for the fluid to fill, and the speedier flow, the next gulp of tangy pre comes faster than the first, repeating the process; sucking the cock deeper and deeper, the blunt head quickly sitting at the entrance to your throat.");
		
		output("\n\nThat doesn’t stop you though; it only serves to encourage you all the more, to cut out the middleman of swallowing the lustrous fluid entirely- just swallow the cock and let it pump the proof of the stud’s virility directly into you. With the next mouthful, you do just that. Or at least, that’s what you attempt to do; you push forward in time with the suction, the wide tip of Brynn’s cock just too fat to easily swallow down.");
		
		output("\n\nHe catches your intent though, and quickly takes action to help out, wrapping his powerful hands around the");
		if (pc.hasHorns() && pc.hornLength >= 2) output(" convenient [pc.horns] jutting from your head as if they were handlebars provided just for this purpose");
		else if (pc.hairLength > 5) output(" entwining his powerful fingers with your [pc.hair] and using it to gain the needed leverage");
		else output(" surrounding the back of your head with his powerful fingers to gain the needed leverage");
		output(". You swallow again, and the stud tugs your head firmly towards his crotch, the flat battering ram of his cock prising your throat open in the process. With a resounding wet slurp, the slightly fatter tip of his cock settles into your throat.");
		
		output("\n\n");
		if (flags["DEEPTHROATED_BRYNN"] == undefined) output("<i>“Gahh </i>fuck<i> [pc.name], it’s been a long fucking time since I had my dick sucked this good,”</i> Brynn says with clear enthusiasm for your skill.");
		else output("<i>“</i>Fuck<i> [pc.name]; how the fuck did I manage to get by without you, huh?”</i> Brynn enthusiastically says.");
		
		flags["DEEPTHROATED_BRYNN"] = 1;
		
		output(" He gives another firm tug");
		if (pc.hasHorns() && pc.hornLength >= 2) output(" on your [pc.horns]");
		output(" and slides his iron-hard, throbbing cock another few inches deeper into your greedy gullet.");
		
		output("\n\nWith such a fat slab of dickmeat stuffed deep into your throat, you can’t stop the involuntary reaction to swallow; your gullet pulsing and undulating, pulling the stud’s cock ever deeper into the warm, oh so tight embrace of your body. Between the induced swallowing, and the carefully measured pull on your");
		if (pc.hasHorns() && pc.hornLength >= 2) output(" [pc.horns]");
		if (pc.hairLength > 5) output(" [pc.hair]");
		else output(" head");
		output(", his dick quickly disappears into your body, forcing you to");
		if (pc.isBiped()) output(" stand");
		else output(" rise");
		output(" up from your [pc.knees] to straighten your neck as it bulges out to contain the rigid shaft.");
		
		output("\n\n<i>“Oh god, look at that,”</i> comes a silky-smooth voice from your right");
		if (pc.genitalSpot == 2)
		{
			output(", from the girl with her fingers");
			if (pc.hasVagina()) output(" lodged in [pc.oneCunt]");
			else if (pc.hasCock()) output(" wrapped around [pc.oneCock]");
			else output(" lodged in your [pc.asshole]");
			output(".");
		}

		output("\n\nYou consider trying to mumble a reply out around the throat full of dick, when the girl to your left pipes up, <i>“That’s so fucking hot!”</i>");
		
		output("\n\nSomething warm and soft gently presses against the [pc.skinFurScales] of your neck, right in the middle of the bulge of cock distorting the usually much slimmer profile. A second later, the delicate touch is replaced by something much wetter and rougher swiping along the same area. A pair of incredibly smooth-skinned arms wrap around you, quickly followed by a sensually soft presence almost melting against the left side of your body. <i>“Keep going, stud, I wanna see if [pc.heShe] can take all of you,”</i> left-girl says, an obvious lusty tone dripping from her words. Licking. She’s licking your neck, continuing to pay reverence to the stud’s cock despite the fact that it’s busy being swallowed whole!");
		
		output("\n\nWith the challenge set, Brynn wastes no time; his calculated force");
		if (pc.hasHorns() && pc.hornLength >= 2) output(" around your [pc.horns]");
		else if (pc.hairLength > 5) output(" applied to your scalp");
		else output(" applied to the back of your skull");
		output(" increases, quickly sliding more of his cock deep into your mouth. Very quickly though, he runs into a roadblock. Or more accurately, your [pc.lips] run into the fat ridge marking the two-thirds point of his dick. With what little play you have, you slowly manage to wriggle your lips around and over the ridge with care, slowly working past the widest part of his cock so that he can continue.");
		
		output("\n\nWith one final heave, the stud tugs you all the way to the hilt in one slow, continual glide, your chin nestling into the space between his balls and your nose pressed into the short fuzzy fur above his sheath. You can’t help but feel a certain sense of pride, having managed to conquer such an expansive, throbbing monster of a cock. A few powerful jabs from his hips, his cock pounding into your throat, sheath mashing against your lips, and it’s more than pride; the Treatment’s tweaks to your mouth’s sensitivity pays dividends, simply being fucked in the mouth is enough to cause your");
		if (pc.hasVagina())
		{
			output(" cunt to ripple around the digits deeply embedded in your tunnel,");
			if (pc.wettestVaginalWetness() <= 3) output(" dappling");
			else output(" gushing");
			output(" [pc.girlCum] all over");
			if (pc.genitalSpot == 2) output(" the cowgirl’s");
			else output(" your");
			output(" hand");
		}
		else if (pc.hasCock()) 
		{
			output(" cock to pulsate and throb, jetting thick stream");
			if (pc.cumQ() >= 250) output(" after stream");
			if (pc.cumQ() >= 1000) output(" after stream");
			output(" of [pc.cum] onto the floor");
		}
		output(".");
		pc.orgasm();
		
		output("\n\nYou catch a glimpse of Brynn’s face through your watery eyes, his head lolling back in the depths of his own building orgasm. The ponderous orbs below his sheath, still wet with your saliva, pull taut and tap against your chin ominously. Soon after, his cock throbs wider in a powerful, rolling wave starting from the base; it pushes your lips wider, squeezes your tongue to the base of your mouth, stretches your neck tighter, flowing along the length of grade-A marebreaker stuffed into your greedy gullet. It flows deeper and deeper, and ends its journey with a distinct gurgle, a certain heaviness settling into your stomach.");
		
		output("\n\nThe fingers");
		if (pc.genitalSpot != 2) output(" you have");
		if (pc.hasVagina()) output(" stuffed into your [pc.cunt]");
		else if (pc.hasCock()) output(" stroking your [pc.cock]");
		else output(" stuffed into your [pc.asshole]");
		output(" keep working to extend your high, and in the process, turning every muscle, every cell, every fiber of your being into a full-body cock milking machine. Your muscles involuntarily work in concert with the stud’s pulsing organ, helping to draw each heavy bulge of cum along the entire length of his massive cock as his balls work tirelessly to deliver another thick batch of jizz to your [pc.belly].");
		pc.loadInMouth(brynn);
		pc.orgasm();
		brynn.orgasm();

		// Cumflation enabled
		if (pc.cumflationEnabled())
		{
			output("\n\nLeft-girl takes ahold of your hand, prying your white-knuckle grip from the bull’s thigh to lay the palm of it on your [pc.belly]. She places her hand over top to hold it in position. You can just faintly make out the throb of the massive pillar of dick as it spews Brynn’s prodigious load into your stomach. Jet after jet lances out of his flared cock with a rumbling gurgle from your innards, continually adding to the weight of spunk building in your gut, and audibly sloshing the heavy load around in the process. Throb, swallow, gurgle, slosh. Over and over. Every batch of cum disappearing into your greedy belly, and perceptibly pushing against your hand. The bulls pent-up load is massive, and now that he’s found himself a proper cock-cozy, he’s going to work out every last drop of built-up lust that he can.");

			// Set cumflation to cap
			pc.maxOutCumflation("mouth", brynn);
		}

		output("\n\nBrynn’s dick continues to inject huge gouts of cum long past your ability to contain his massive load, the pressure building and building until it reaches a peak. With nothing left to give, the buildup of spunk forces his cock back out of you. His now fully flared cockhead strains against sensitive places normally untouched whilst the veiny mass of dick is half-dragged, half-ejected from your throat. The features decorating the length that you were so focused upon earlier are paying you back in kind, as they graze and bump into your lips, teasing another weak orgasm from your shaky loins in the process.");
		
		output("\n\nWith a suitably loud and resounding pop, the ludicrously fat flare flops out of your mouth mid-spurt, only serving to paint your [pc.face] with the bull’s musky load. By the time you’ve actually managed to catch a breath, Brynn has fired off another two thick shots of cum, his cock still aimed directly at your face. By the third shot, the pressure is much weaker, the quantity greatly reduced- it arcs through the air, and lands in your still agape mouth, quickly splattering your tongue with a fresh load of heavy jizz. You quickly manage to swallow it down despite already sporting a belly-full of his spunk. No sense letting good cum go to waste, right?");
		
		output("\n\nHis cock lazily drizzles out another shot, this time falling far short of your face and splattering over your [pc.fullChest] and providing the finishing touch to your full-frontal cumglaze.");

		didDeepthroat = true;
	}
	
	pc.applyCumSoaked();
	
	// PROBS TIME FOR A NEW PAGE
	clearMenu();
	addButton(0, "Next", suckThatMassiveStudlyBrynnDickII, didDeepthroat);
}

public function suckThatMassiveStudlyBrynnDickII(didDeepthroat:Boolean):void
{
	clearOutput();
	brynnHeader(true);

	output("You can’t muster the energy to do much more than rest on your [pc.knees] before the magnificent bull-stud, his massive load oozing from your features and dripping to the ground in a chorus of irregularly-timed splats. His spunk weighs heavily on your frame, the rivulets of cum pooling wherever they can before falling to the floor; especially your [pc.nipples], jizz building up");
	if (pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_FUCKABLE && pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_LIPPLES && pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED) output(" on their pointy tips");
	else output(" against them");
	output(" only to tickle as the drops ball up and pull away from your [pc.skinFurScales].");
	
	output("\n\nA coo of delight comes from somewhere to the right, closely followed by a rough sensation trailing up from your neck, over your cheek and right across your eyelid, leaving a sense of... clarity in its wake. You can feel the gap in the layer of spunk still covering you- feel the weight of its absence across your [pc.skinFurScales] and over your eye. With some measure of trepidation, you blink open your eye- discovering that it has indeed been rescued from its sticky prison- just in time to see one of the girls leaning back in to lash her tongue across your face, slurping up Brynn’s");
	if (pc.isTreated()) output(" delicious");
	output(" cum. A similar sensation meanders its way across one of your [pc.breasts] on the opposite side and flicks off the very tip of your [pc.nipple].");
	
	output("\n\nA deeply satisfied groan emanates from above you, Brynn luxuriating in his front-row seat at the cum-covered [pc.name] oral-only cleanup show.");
	if (!didDeepthroat) output(" <i>“Ahh, that took the edge off just nice like,”</i>");
	else
	{
		output(" <i>“You");
		if (pc.mfn("m","f","n") == "m") output(" </i>girls<i>");
		else output(" girls");
		output(" know just what a guy likes to see,”</i>");
	}
	output(" he rumbles deeply to the three of you");
	if (pc.isBiped()) output(" kneeling");
	else output(" poised"); 
	output(" at his feet. He stands up from his seat, the floor under his feet groaning in protest at his sheer bulk, and heads toward the stall door.");
	if (didDeepthroat) output("<i>“Sure hope I see you again tomorrow, [pc.name]. Been a long-ass time since I had a pretty somethin’ like you drain me out that good.”</i>");
	
	output("\n\nThe two cow-girls make quick work of the spunk blanket splattered all over your body, slurping up every last drop they can find in short order. Not an inch is spared in their meticulous work, the same effort they were demonstrating on Brynn’s cock now being applied to your [pc.skinFurScales]. The pair of them manage to re-stoke your lust, but keep you simmering at a low boil as they glide over every patch of skin, very clearly spending more time than absolutely required whenever they’re working on anything particularly sensitive to a careful nibble or a gentle kiss. Your [pc.nipples] bear the brunt of their attention, at least one of the two girls lapping, sucking or kissing one of your [pc.breasts] almost constantly.");
	if (pc.cumflationEnabled()) output(" Your [pc.belly] is also a prime target for long, drawn out swipes of the tongue across its surface; every touch against it only reminding you of the potent, virile load pumped so casually down your throat, leaving you looking heavily pregnant.");
	
	output("\n\nBefore too long, the girls are done with your impromptu cleaning session and sit back on their haunches. Satisfied with their work, each of them in turn leans in to give you a parting kiss- one of them sneaking a glob of cum in with their tongue for you to share together. The");
	if (pc.isTreated()) output(" delicious");
	output(" tang of the stud’s cum re-ignites your post-");
	if (!didDeepthroat) output("blowjob");
	else output("deepthroat");
	output(" haze for a moment, reminding you so vividly of the actions of the last few minutes.");
	
	output("\n\nBy the time you come back down to earth, the girls have departed as well, leaving you alone in the stall, the scent of potent stud rapidly diminishing in the wake of his absence.");
	
	output("\n\nYou’re sticky. And alone. And naked. And still horny. But there’s a warmth radiating deep in your [pc.belly] reminding you of Brynn.");
	
	output("\n\nYou gather up your [pc.gear] and make yourself as presentable as possible given the circumstances");
	if (pc.cumflationEnabled()) output("- and the much larger midriff than when you arrived-");
	output(" and head back out of the stall.");
	
	for (var i:int = 0; i < 8; i++)
	{
		pc.loadInMouth(brynn);
		brynn.orgasm();
	}
	processTime(30);
	pc.changeLust(15);
	clearMenu();
	addButton(0, "Next", move, "514");

	flags["BRYNN_MET_TODAY"] = 1;
	if(!brynnIntroduced()) flags["BRYNN_INTRODUCED"] = 1;
}
