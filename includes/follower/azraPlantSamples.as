//Azra’s Samples~!
//Plant Samples:
public function azraPlantSamples(back:Boolean = false):void
{
	clearOutput();
	showAzra();
	if(back) output("You change your mind. Is there a different plant you’d like to interact with?");
	else
	{
		output("You let Azra know that you’d like to take a look at some of her samples.");
		//Professional!
		if(azraProfessional())
		{
			output("\n\nAzra displays a number of razor-sharp teeth in her knowing smile. <i>“I’ll step out for thirty minutes or so. That should more than enough to account for the mean standard copulation time.”</i>");
			output("\n\nYou nod as if that was a totally normal thing to say.");
			output("\n\nThe door hisses closed behind her. At last, you’re alone. What do you want to inspect?");
		}
		//Kissy Azra:
		if(flags["AZRA_MHENGAED"] == 1 && flags["AZRA_SEXED"] == undefined) 
		{
			output("\n\nGoing beet red, the shark-girl nods. <i>“I’m going to uh... go for a quick walk then. Be gentle, okay?”</i>");
			output("\n\nYou nod.");
			output("\n\n<i>“Okay... I’ll be back in thirty minutes!”</i> The suula scientist sets her watch on the way out.");
			output("\n\nThe door hisses closed behind her. At last, you’re alone. What do you want to inspect?");
		}
		//Fucky Azra
		else if(flags["AZRA_SEXED"] != undefined)
		{
			if(rand(5) == 0)
			{
				output("\n\nFanning herself, the shark-girl nods. <i>“I just gave them a feeding myself. I don’t think suula seed is perfect for their biology, but it does in a pinch.”</i> She glances at her codex. <i>“Thirty minutes ought to be more than enough for my dashing Captain. I barely made it ten.”</i>");
				output("\n\nAzra kisses you on the forehead on her way out the door, tail swishing happily behind her. <i>“Just don’t spend too much time thinking about me while you’re playing with our floral friends.”</i>");
				output("\n\nThe door hisses shut behind her.");
			}
			else
			{
				output("\n\nSmirking knowingly, the shark-girl says, <i>“");
				//Already on sex cooldown:
				if(pc.hasStatusEffect("Azra Sex CD") == 0)
				{
					if(rand(2) == 0) output("You know, if you spend all your time fucking around on the ship, you’ll never become the famous rusher I know you’re destined to be.");
					else output("The fuck lillies are good, but they’ll never be as good as me.”</i> She checks her watch, then sighs. <i>But I guess they’ll have to do for now...");
				}
				else if(pc.hasCock(GLOBAL.TYPE_EQUINE) && rand(7) == 0) output("You know, I can smell that horse-dick of yours from over here. If you’re going to whip it out in here, turn on the fan afterward. The last thing I need to do is feel like I’m penned up in your breeding barn.");
				else if(pc.hasCock(GLOBAL.TYPE_CANINE) && rand(6) == 0) output("You know, that doggie-dick of yours leaks pheromones like a busted faucet. You better turn up the life support filtration after this, or I’m going to be hornier in here than a bitch in heat.");
				else if(rand(5) == 0) output("Would you?”</i> Azra leans close. <i>“When you’re through in here, I have a special sample for you in my bedroom, if you have the time.");
				else if(rand(4) == 0) output("Remember, the mutagenic samples aren’t refined, tested products. There’s no telling what havoc abusing them could wreak on your system.”</i> She looks at you mischievously. <i>“But a brave [pc.boyGirl] like you is going to play with fire, aren’t you?");
				else if(rand(3) == 0) output("Just don’t use the leftmost Fuck Lilly. She just had a very thorough session, and I don’t want any of our prize plants to die from overfeeding.");
				else if(rand(2) == 0) output("I’m glad I’m not the only one who enjoys these little beauties. Be good to them, and they’ll be good to you.");
				else output("Aww, you’re such a sweet " + azraBoyfriend() + ", checking up on me and my work. Maybe one of these times you’ll catch me feeding the Fuck Lilies.");
				output("”</i> She glances at her Codex. <i>“Thirty minutes ought to be more than long enough for whatever you have planned. I barely last ten in those botanical succubi, but I know my " + azraBoyfriend() + " is made of tougher stuff.”</i>");
				output("\n\nAzra kisses you on the forehead on her way out the door, tail swishing happily behind her.");
			}
		}
		processTime(2);
	}
	clearMenu();
	addButton(0,"Fuck Lillies",approachFuckLillies);
	if(flags["AZRA_TARKUSED"] == 1) addButton(1,"Slutshrooms",slutShroomApproach);
	else addDisabledButton(1,"Undiscovered","Undiscovered","You have not yet saved this plant.");
	if(flags["AZRA_TARKUSED"] == 1 && flags["AZRA_TARKUS_SKIP"] != 1) addButton(2,"Motherhusks",motherhuskApproach);
	else addDisabledButton(2,"Undiscovered","Undiscovered","You have not yet saved this plant.");
	if(flags["AZRA_TARKUSED"] == 1) addButton(3,"Spunkshroom",spunkshroomApproach);
	else addDisabledButton(3,"Undiscovered","Undiscovered","You have not yet saved this plant.");
	addButton(14,"Leave",mainGameMenu);
}

//Fuck Lilies
public function approachFuckLillies():void
{
	clearOutput();
	showAzra();
	output("Since being placed in specially mixed soil, the Fuck Lilies have sprouted like weeds. You select one in particular to approach. The stalk itself is waist-high and extraordinarily sturdy looking, more like a small tree trunk than a flower’s stalk. Atop it sits a huge, violet bloom. The obscene flower looks positively female in every sense, right down to a clit-shaped bump and moist, gently parted lips. Inside that central passage, you can see a bevy of wiggling staman surrounding a larger, flared stalk. The scent that wafts out of that opening is sweet and floral, but undoubtedly sexual. It looks like a carefully designed organic sex toy more than a naturally occurring flower, nevertheless, nature on Mhen’ga has provided it to you.");
	if(pc.lust() < 33)
	{
		output("\n\n<b>You weren’t very aroused when you arrived, but the sight and smell has you ready to go.");
		pc.changeLust(33);
	}
	processTime(1);
	clearMenu();
	if(pc.cockThatFits(700) >= 0 && pc.hasCock()) addButton(0,"FuckWithDick",fuckTheFuckLily,undefined,"Fuck With Dick","Fuck them with your penis.");
	else if(pc.hasCock()) addDisabledButton(0,"FuckWithDick","FuckWithDick","Your member is too monstrous for the smaller flower.");
	else addDisabledButton(0,"FuckWithDick","FuckWithDick","Your need a penis for this.");
	if(pc.hasVagina()) addButton(1,"FuckWithCunt",rideDatFuckLily,undefined,"FuckWithCunt","Ride those wiggly stamen with your pussy.");
	else addDisabledButton(1,"FuckWithCunt","Fuck With Cunt","You need a vagina for this.");
	addButton(14,"Back",azraPlantSamples,true);
}

//Fuck It!
public function fuckTheFuckLily():void
{
	clearOutput();
	showName("FUCK\nLILIES");
	showBust("FUCKLILLIES");
	var x:int = pc.cockThatFits(700);
	if(x < 0) x = pc.smallestCockIndex();
	if(!pc.isCrotchExposed()) output("Undoing your [pc.crotchCover]");
	else output("Hefting [pc.oneCock]");
	output(", you approach the pulsating plant with one thought in mind: fucking it. At the sight of [pc.eachCock], the petals flutter happily, their surface glimmering with moisture in an instant, slick and wet for your pleasure. You lean down to inhale the sweet yet sensual nature of the flower’s aroma, letting it tickle your nostrils as you idly fondle [pc.oneCock]. Your maleness quickly assumes ");
	if(pc.isBimbo()) output("your favorite state");
	else if(pc.libido() < 50) output("an aroused state");
	else output("its favorite state");
	output(" - hard and sensitive, ready to plunge into the nearest set of wet lips with the reckless abandon. At the same time, you can see the wriggling tendrils inside the flower’s vase waving about hungrily.");
	output("\n\nYou ");
	if(pc.isNice()) output("smile");
	else if(pc.isMischievous()) output("chuckle");
	else output("laugh");
	output(" in amusement; who are you to deny it the creamy treat it so richly deserves? Letting go of your [pc.cock " + x + "], you reach around the soft petals to the harder, central bud and slide yourself through the honeyed embraced into the pulsating, tentacled flower-core. Juicy warmth snuggles about your dick, the velvet-soft chamber immediately tightening up while the petals fold in, crossing over one another until they form a tube long enough to swallow you whole. Gentle suction begins to rhythmically tug at your [pc.cockHead " + x + "], swelling you larger and more sensitive inside. Immediately, the tiny tendrils you saw swarming around earlier reach up to massage your cock, slithering across your skin like tiny, sinuous snakes.");
	pc.cockChange();
	output("\n\nIt’s enough to make your [pc.legs] quake, and you slowly slide to the ground. The flower, now a tightly-sealed bulb, sucks hard enough to stay latched onto you as you recline. It bends the stem double, but the resilient plant seems to handle the strain with ease. Rivulets of clear slime escape from the tight seal to run down your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("[pc.legs]");
	output(" and form a sticky puddle. Now moaning, you grab the stem and start to pump the sheath up and down, using the plant like the cock-toy it was bred to be. Lewd, wet squishes ring out through the air,");
	if(pc.exhibitionism() < 33) output(" and you timidly look around, hoping the sounds don’t carry through the door.");
	else if(pc.exhibitionism() < 66) output(" and you worriedly glance around, hoping yet terrified that Azra will walk in on you at your most depraved.");
	else output(" and you glance around, hoping Azra will walk in on the sexy show you’re making.");
	output("\n\nNow panting with unbearable lust and undeniable levels of pleasure, you give up all sense of propriety and resort to fucking wildly, [pc.hips] jumping inches off into the air. The flower’s interior is a slick, silky heaven for your [pc.cock " + x + "], a sucking, squeezing hole of seemingly infinite pleasure. Inside its gluttonous gullet, the numerous tentacles twist around, the longest ones circling the base of your shaft");
	if(pc.hasSheath(x)) output(" inside your violated sheath");
	output(". With so much blood trapped in your [pc.cock " + x + "], it’s bigger and harder than ever, twitching valiantly against its restraints with every beat of your heart.");
	output("\n\nOne of the tentacles circles your [pc.cockHead " + x + "] for a moment, and without much warning or pause, it lances forward to bury itself into your vulnerable cum-slit. Your preconceptions are turned on their head when there’s a complete lack of pain from the abrupt penetration. If anything, it actually feels kind of good... like there’s a warm, slippery finger caressing your penis from the inside out. It slithers in and out of you, pumping you inside, burrowing pleasure into your center even while stroking you from without. Your body, burning from the exertion of fucking the flower’s pod and the constantly-rising tidal wave of lust, begins to twitch spasmodically,");
	output("\n\nThe internal suction spikes as your dick bloats larger, and with a roar of bestial pleasure, you arch your back, hands pushing your [pc.cock " + x + "] as deep into the plant’s gullet as possible. ");
	if(pc.balls > 0) 
	{
		if(pc.balls > 1) output("Your [pc.balls] gurgle, a surprisingly happy sound, and cling tight to your loins. ");
		else output("Your [pc.balls] gurgles, a surprisingly happy sound, and clings tight to your loins. ");
	}
	output("Inside you, you can feel the liquid heat of your spurting release exploding out, melting everything before it with liquid, orgasmic bliss. A low moan bursts from your lips when the sounding tentacle pulls out of your sloppy cock-slot, and the rushing tide of bubbling cum follows it, bursting into the sweet, suckling nectar-pot.");
	if(pc.cumQ() >= 500) output(" You pour forth your prodigious essence without pause or fail, and the plant immediately begins to drink it down, the stem bulging with rounded balls of sperm that it carries into its root system.");
	if(pc.cumQ() >= 2000) output(" Soon, the meager stem cannot swallow it all. Spunk froths and squirts out around the base of your tool for a moment, and then a veritable tide of the stuff gushes out to soak you and Azra’s floor. Whoops.");
	output("\n\nSatisfied or exhausted, you slump down and release your grip on the creampied fuck-flower. It slowly, laboriously removes itself from around your orgasm-bloated shaft, cleaning the sperm from it as it goes. There’s a visible swallowing motion, and a globular bulb moves down the stalk into the ground. Once upright, the petals bloom back into the flower, the only hint of your tryst a milky-white sheen upon the purple petals.");
	output("\n\nYou have just enough time to clean up before Azra returns. Whew.");
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckFlowerEpilogue);
}

public function fuckFlowerEpilogue():void
{
	clearOutput();
	showAzra();
	output("Azra ");
	if(flags["AZRA_MHENGAED"] == -1) output("hesitantly re-enters");
	else output("barges into the room in a rush, hoping to catch you mid-coitus");
	output(". <i>“I see you’ve finished your ‘inspection’.");
	if(flags["AZRA_MHENGAED"] == 1) output(" Maybe you’d like to inspect something else?");
	else output(" Is there anything else I can help you with, Captain [pc.name]?");
	output("”</i>");
	processTime(1);
	IncrementFlag("FUCK_LILLIES_USED");
	azraMenu();
}

//Ride It (skimmed)(coded)
public function rideDatFuckLily():void
{
	clearOutput();
	showName("FUCK\nLILIES");
	showBust("FUCKLILLIES");
	output("You ");
	if(!pc.isCrotchExposed()) output("shuck your [pc.crotchCovers] and ");
	output("slowly ease yourself towards the violet-hued creature. As soon as you get within a few feet, the flower’s bulb angles toward you, the petals wiggling slightly along with the stamen inside. A few of them even stretch out towards you like longing fingertips, shaking slightly from the effort before sliding back inside. The dull ache in your [pc.vaginas] grows a few degrees hotter at the display, your body growing flush with excitement for the coming copulation. Throwing caution to the wind, you move forward with a confident sway of your [pc.hips]. It’s time to get pollinated.");
	output("\n\nGrabbing hold of the plant, you tug it up against your mons and sigh. The silky-smooth petals flatten against your thighs, the tips curling over to touch the sides of your [pc.butt], slicking it with lubricating moisture. You let go, and the flower holds fast to your [pc.hips], firmly embracing you as its stamen begin to roam across your vulva. Slowly, an intrepid tentacle ventures between your labia, into the slick passageway you’re so ready to fill with wiggly delight. A dribble of fresh fluid rushes out at those first, hesitant touches, and encouraged by its success, the stamen’s brothers join in on the slippery party, plunging into your box and immediately swirling over your inner walls.");
	output("\n\nDriven mercilessly by the sudden onslaught of sensation, you flop back onto the ground, but the flower comes with you, latched onto your [pc.hips] with no sign of releasing. The swirling tentacles twist around inside you in a tornado of ecstasy, and the pleasure, that awful, unstoppable pleasure, it twists your muscles into knots, instinctively convulsing to raise your lower lips higher, as if that would somehow propagate even deeper penetration. One of the tentacles retracts, drawing a burst of slick cunt-lube with it. Then, it twists around [pc.oneClit], tightening up on the over-sensitive bud until it feels like it could pop.");
	if(pc.clitLength > 3) output(" Your heavy buzzer is so big that the flexible plant-cock has plenty of room to curl around it, and if you could see it, your clit would look look almost like a candy-cane (if one set of stripes was jerking off the cane beneath).");
	if(pc.hasCock()) output(" [pc.EachCock] soon has its own partner twisting around it, a pussy-slicked vine to jerk and twine about its girth.");
	output("\n\nWith nothing to occupy your roving hands, you let the slide up your [pc.skinFurScales] to your ");
	if(pc.bRows() > 1) output("lowest row of tits, cupping them before going to your top row of breasts");
	else output("[pc.chest]");
	output(", caressing the swell as you search for the lust-tightened skin of your [pc.nipples]. They seem almost as sensitive as little clits, and as soon as you find them, you immediately set to circling them slowly, occasionally tugging and twisting when you a particularly powerful sensation works through your pleasure-wracked body.");
	if(pc.isLactating())
	{
		output(" One after the other, they begin to ");
		if(!pc.canMilkSquirt()) output("leak");
		else output("spray torrents of");
		output(" [pc.milkNoun].");
	} 
	output(" You moan in unabashed delight, your mouth hanging open in a mindless, blissful ‘o’ in between vocalizations. If your Azra could see you know, writhing on the deck, face open in simple, animal pleasure, and perhaps worst of all, fucking a plant, you’d die of ");
	if(pc.exhibitionism() < 50) output("embarrassment");
	else output("lust");
	output(".");
	output("\n\nWith that thought somehow staying firmly in your battered consciousness, you reach a climax of mind-breaking proportion, eyes rolling wildly as every muscle locks in one united twitch of rapture.");
	if(pc.hasCock()) output(" [pc.EachCock] explodes in release, pumping heavy flows of seed into the petals, even as y");
	else output(" Y");
	output("our quivering pussy, already sopping wet, releases the last of your juices in a soaked ");
	if(pc.wettestVaginalWetness() < 2) output("drizzle");
	else if(pc.wettestVaginalWetness() < 4) output("stream");
	else if(pc.wettestVaginalWetness() < 5) output("spray");
	else output("torrent");
	output(". The tentacles inside you curl in on themselves and slowly pull back from the well-creamed quim, scraping out as much fluid as possible from your oversensitive honey-pot. The binding on your [pc.clit] releases, which of course sets off a whole new wave of rippling pleasure-contractions in your cunt.");
	output("\n\nYou swoon from it all, your body slowly relaxing, sinking back to the ground. The fuck-flower visibly swallows your juices, a bulge visible on the stem. It detaches with a hungry pop, strands of its slime webbing the space between person and plant for a second before it withdraws completely. Slowing gradually, the corrupt greenery resumes its formerly placid, open state, aimed at the lights. You can see the tentacle-like stamen still wiggling inside, but they seem a little more lethargic now. Your [pc.vagina] twitches in rememberence of their caresses, and you wonder when you’ll take advantage of this wondrous plant next.");
	//[Next] - to fuck-flower epilogue
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckFlowerEpilogue);
}
public function spunkshroomApproach():void
{
	clearOutput();
	showName("\nSHROOMS!");
	output("Azra has placed the so-called ‘spunkshrooms’ in a bed of orange-hued soil ringed by evenly spaced posts designed to mimic the lighting conditions where you found them. At first, they look sort of sick, but you then you remember that they’re fat, droopy things. Their caps hang down all the way to the soil for a reason known only to the fungi themselves. A holographic display at the base of the planter reads, <i>“Ferrous Ejaculatus.”</i> Azra wastes no time in naming her discoveries. Further notes expound that preliminary tests reveal them to be mildly toxic and mutagenic.");

	output("\n\nPotential effects on ingestion include unexpected leakages of sperm-supporting fluids, increased virility, unexplained breeding urges. ");
	if(pc.statusEffectv1("Spunkshroom CD") >= 4) output("<b>Azra has left a note telling you to leave her samples alone for the time being. They need to recover from your previous harvests.</b>");
	else if(!pc.hasCock()) output("No point in taking one without any sort of penis, you suppose.");
	else output("You suppose you could pick one if you wanted to get a little masculine enhancement.");
	
	processTime(2);
	clearMenu();
	if(pc.statusEffectv1("Spunkshroom CD") >= 4) addDisabledButton(0,"Pick One","Pick One","You should give the plants a break before taking any more.");
	else addButton(0,"Pick One",pickASpunkshroom);
	addButton(14,"Back",azraPlantSamples,true);
}

public function pickASpunkshroom():void
{
	clearOutput();
	showName("\nYOINK!");
	output("You reach under the enormous cap to grab a mushroom by the stalk and nearly recoil when you make contact with the slimy fungus. The drape-like top may help them trap moisture for their root systems, but it makes tugging one out of the ground more work than it ought to be. The mushroom breaks off after a few both and forth tugs.\n\n");
	//After taking four, needs a 4 day CD. CD resets on each pick.
	if(!pc.hasStatusEffect("Spunkshroom CD")) pc.createStatusEffect("Spunkshroom CD",1);
	else pc.addStatusValue("Spunkshroom CD",1,1);
	pc.setStatusMinutes("Spunkshroom CD",60*24*4);
	//Standard item collection here
	eventQueue.push(spunkshroomApproach);
	quickLoot(new SpunkShroom());
}

public function slutShroomApproach():void
{
	clearOutput();
	showName("\nSLUTSHROOMS");
	output("The pink-colored mushrooms, so-called ‘slutshrooms’ have taken to captivity with gusto. Azra has them growing in a bed of iron-enriched soil, kept moist by a steady stream of mist from a climate simulation unit. A holographic display at the base of the planter reads, <i>“Scortum Duonus.”</i> Azra wasted no time in naming her discoveries. Further notes expound that preliminary tests reveal them to be non-toxic, if unpredictable.");
	output("\n\nPotential effects on ingestion include increased vaginal wetness, undue vaginal secretions, enhanced libido, and modification of certain neural structures in the brain (pending further research). ");
	if(pc.statusEffectv1("Slutshroom CD") >= 4) output("<b>Azra has left a note telling you to leave her samples some time to recover from your previous harvests.</b>");
	else if(!pc.hasVagina()) output("No point in taking them without any sort of vagina, you suppose.");
	else output("You suppose you could pick one if you wanted to get a little slicker.");
	processTime(2);
	clearMenu();
	if(pc.statusEffectv1("Slutshroom CD") >= 4) addDisabledButton(0,"Pick One","Pick One","You should give the plants a break before taking any more.");
	else addButton(0,"Pick One",pickASlootShroom);
	addButton(14,"Back",azraPlantSamples,true);
}

//Pick one
public function pickASlootShroom():void
{
	clearOutput();
	showName("\nYOINK");
	output("You grab one of the mushrooms by the stalk, and it immediately breaks off in your hand. Azra surely had a devil of a time collecting these without damaging them herself. Perhaps a new one will grow back from the abandoned root system?\n\n");
	processTime(1);
	//After taking four, needs a 4 day CD. CD resets on each pick.
	if(!pc.hasStatusEffect("Slutshroom CD")) pc.createStatusEffect("Slutshroom CD",1);
	else pc.addStatusValue("Slutshroom CD",1,1);
	pc.setStatusMinutes("Slutshroom CD",60*24*4);
	//Standard item collection here
	eventQueue.push(slutShroomApproach);
	quickLoot(new SlutShroom());
}

public function motherhuskApproach():void
{
	clearOutput();
	showName("MOTHER\nHUSKS");
	output("The motherhusks have taken to captivity with gusto. Already, a two foot spire of segmented growth has emerged from a bed of rust-red soil intermixed with silvery aluminium filings. A hardlight terrarium keeps the floating spores safely contained, so as not to contaminate the lab - or Azra’s ovaries. The sharky scientist has placed a small display at the base that reads <i>“Matar Factorum.”</i> Further notes explain that you are free to harvest the smaller spires surrounding the main growth. Simply press a button on the right side to reduce the strength of the hardlight shield to a fist-permeable level.");
	output("\n\nFor raw usage, it is suggested to crush a single husk to powder and inhale the airborne particles released. Side effects are largely unknown, but minor corruption of the user’s genome is likely. The benefits are expounded upon in far greater detail: increased nutrient delivery to the womb, more rapid zygote development, and optimizations to the imbiber’s genome to support more rapidly developing the womb’s pregnancy support structures. ");
	if(!pc.hasVagina()) output("No point in grabbing one without any wombs, you suppose.");
	else if(pc.statusEffectv1("Motherhusk CD") < 2) output("You could take one, if you wanted your pregnancies to progress at superhuman speed.");
	else output("<b>Azra has left a note telling you to leave this sample alone for the time being. It needs time to recover after your previous harvest.</b>");
	processTime(1);
	clearMenu();
	if(pc.statusEffectv1("Motherhusk CD") >= 2) addDisabledButton(0,"Pick One","Pick One","You should give the plants a break before taking any more.");
	else addButton(0,"Pick One",pickAMotherHusk);
	addButton(14,"Back",azraPlantSamples,true);
}

//Pick one
public function pickAMotherHusk():void
{
	clearOutput();
	showName("\nYOINK!");
	output("You tap a button on the side of the projector, and the fizzing hardlight shield dims to a barely perceptible hum. You gingerly press your hand against it. To your surprise, it parts easily for your fist, allowing you to grab hold of a ridged piece and snap it off. A cloudy puff of spores vents into the containment area");
	if(pc.isBimbo() || (pc.IQ() < 40) || pc.libido() >= 100) output(", and part of you wishes could just stuff your head in and huff the whole mess. Azra would get super mad, probably");
	processTime(1);
	output(".\n\n");
	if(!pc.hasStatusEffect("Motherhusk CD")) pc.createStatusEffect("Motherhusk CD",1);
	else pc.addStatusValue("Motherhusk CD",1,1);
	pc.setStatusMinutes("Motherhusk CD",60*24*4);
	//Standard item collection here
	eventQueue.push(motherhuskApproach);
	quickLoot(new Motherhusk());
}