/*Suggested Names

GaloMax
GooPlus
Goo You
Morph Gel 3 - new, stronger formula!
Goo Gone Wild!

//Effects run in predictable sequence. Highly limited stock? One dose available for every planet completed?
//Dose 1
-Goo hair + Biomass thirst + Hair control in appearance screen
//Max mass - 300
//Dose 2
Sexual fluids replaced with green slime + biomass vent (increases cumQ or girlCumQ by biomass quantities. Toggled in goo submenu)
//Max Mass 750
//Dose 3
All genitalia are goo.
//Max Mass 1500
Elasticity to 3 min
//Dose 4
Body exterior gets gooey - skinType change. Boobs can now be resized in goo submenu.
//Nipplecunts/dix as toggled by goo menu.
//Max Mass 10,000
//Dose 5
Fullgoo. Monoped goobod, Gain resistance to corrosion. Height and thickness become adjustable via goo menu.
//Max Mass: no limit. Extra lowerbody descs for lots of goo?
*/
public function gooColor():String
{
	if(flags["GALOMAX_DOSES"] == undefined) return "green";
	else if(flags["GALOMAX_DOSES"] < 4) return pc.hairColor;
	else return pc.skinTone;
}

public function showZodee():void
{
	showBust("ZODEE");
	showName("\nZO’DEE");
}

public function gooBiomassMax():Number
{
	if(flags["GALOMAX_DOSES"] == 1) return 300;
	else if(flags["GALOMAX_DOSES"] == 2) return 750;
	else if(flags["GALOMAX_DOSES"] == 3) return 1500;
	else if(flags["GALOMAX_DOSES"] == 4) return 10000;
	else if(flags["GALOMAX_DOSES"] == 5) return 900000;
	return 0;
}

public function gooBiomass(arg:Number = 0):Number
{
	if(flags["GOO_BIOMASS"] == undefined) flags["GOO_BIOMASS"] = 0;
	if(arg == 0) return flags["GOO_BIOMASS"];
	else
	{
		flags["GOO_BIOMASS"] += arg;
		if(flags["GOO_BIOMASS"] < 0) flags["GOO_BIOMASS"] = 0;
		else if(flags["GALOMAX_DOSES"] > 0 && flags["GALOMAX_DOSES"] <= 5)
		{
			if(flags["GOO_BIOMASS"] > gooBiomassMax()) flags["GOO_BIOMASS"] = gooBiomassMax();
		}
	}
	return flags["GOO_BIOMASS"];
}

public function zodeeGivesFirstGalomax():void
{
	showName("A\nSTRANGER");
	showBust("ZODEE");
	output("\n\nThere’s another rusher here - a rahn by the looks of it. She’s dressed in a pale white jumpsuit that hides most of her gleaming teal, gelatinous skin from view but does little to conceal the weighty jiggle of her chest. Her hands are in her pack, sorting through enough gleaming prizes to make your belly clench with envy, and her plump rump is positioned perfectly to entice you with its restless wiggles. Just how much did she find before you got here?");
	output("\n\nTossing items carelessly over her shoulder, the rahn seems blithely unaware of your presence until a pill-bottle smacks off your chest, rattling noisily. She draws in the blink of an eye, then lowers her weapon at the sight of another galactic traveler.");
	output("\n\n<i>“Oh, didn’t think I’d bump into another rusher out here. You can have the GaloMax if you want. Not much use to a girl like me.”</i> She eyeballs you from the crown of your head to the bottom");
	if(pc.legCount != 1) output("s");
	output(" of your [pc.feet], blatantly evaluating every detail. You’ve had full-body scans that felt less invasive. <i>“You know, you just might make it out here, if you’re careful.”</i> Straightening and shouldering her bag, the alien woman licks her lips and grins. <i>“The name’s Zo’dee, by the way. Maybe we’ll bump into each other again sometime. Just don’t get mad when I score all the loot before you get there.”</i>");
	output("\n\nYou pick up the pills and answer, ");
	if(pc.isBimbo()) output("<i>“Ooh, I hope we meet again super soon! My name’s [pc.name].”</i>");
	else if(pc.isBro()) output("<i>“[pc.name], and I’ll get it first,”</i> with a growl.");
	else if(pc.isNice()) output("<i>“I’m [pc.name], and I think I’d like that.”</i>");
	else if(pc.isMischievous()) output("<i>“I go by [pc.name]. I sure hope you aren’t too sore when I’m scoring crate loads of riches out from under your nose.”</i>");
	else output("<i>“Good luck with that. I’m [pc.name]. Remember it.”</i>");
	output("\n\nZo’dee shrugs nonchalantly, but your eyes are firmly drawn to the wiggle of her hips, brought out in stark relief by the glistening shine of her bodysuit, as she walks away. <i>“Maybe. Be careful with that GaloMax by the way. I hear it’s pretty permanent. Or get as much as you can, I don’t really care. Maybe I want you all gooey and slutty?”</i>\n\n");
	flags["MET_ZODEE"] = 1;
	flags["ZODEE_GALOQUEST"] = 1;
	quickLoot(new GaloMax());
}

//Zo’dee encounter #2
public function secondZodeeEncouonterForGaloMax():void
{
	clearOutput();
	showZodee();
	output("You aren’t alone. A white-suited figure stands a few yards away, warily aiming the muzzle of a deadly-looking weapon in your direction - at least, until she recognizes you.");
	output("\n\n<i>“Oh it’s you.”</i> Her familiar voice instantly lightens the tone, and with the barrel of the weapon no longer waving in your face, you’re able to identify her. It’s Zo’dee - another rusher. You bumped into her a while back.");
	output("\n\nYou wave back in greeting, taking the chance to drink in the sight of the skimpily-clothed alien. She notices and puts a hand on her hip, subtly shifting her chest to lift her prodigious bosom into a shelf of jiggling delights. The arching of her back puts her thinly-veiled derriere on full display, a pair of almost globular cheeks that beg to be squeezed. Zo’dee’s voice lilts playfully. <i>“My eyes are up here.”</i>");
	output("\n\nYou jerk your gaze back up-");
	output("\n\n<i>“But you can keep looking if you want.”</i> Zo’dee wiggles closer, running a palm up her thigh to the side of her belly. <i>“It’s so easy to get all worked up out here.”</i> Her antennae bounce to the same hypnotic beat as her breasts. <i>“The damned natives are just too good at making a girl fill up with eggs, you know?”</i> The gelatinous rusher gestures at her crotch, displaying the bulging outline of a prominent ovipositor. <i>“Hey, I got an idea. Help me squeeze ‘em out, and I’ll give you this dose of GaloMax I found.”</i>");
	output("\n\nIf you help her, you’ll have to squeeze the eggs out of that thing between her legs, but if you don’t, you might miss out on a rare transformative item. Maybe you could buy it? Five hundred credits sound fair.");
	
	processTime(4);
	//lust+5
	pc.changeLust(5);
	flags["ZODEE_GALOQUEST"] = 2;
	//[Help Her] [Buy It] [Nope]
	clearMenu();
	addButton(2,"Nope",nopeZodeeIDontWantShit,undefined,"Nope","Turn down her offer and be on your way.");
	addButton(0,"Help Her",helpZodeeWithHerEggProblem,undefined,"Help Her","Help her squeeze out some eggs for GaloMax.");
	if(pc.credits >= 500) addButton(1,"Buy It",buyGaloMaxFromZodee,undefined,"Buy It","Offer to buy the GaloMax off her for 500 credits. That’s a good deal, right?\n\n<b>500 Credits</b>");
	else addDisabledButton(1,"Buy It","Buy It","You could offer to buy the GaloMax off her for 500 credits... if only you had the money for it.\n\n<b>500 Credits</b>");
}


//[Nope]
public function nopeZodeeIDontWantShit():void
{
	clearOutput();
	output("<i>“No thanks, but good luck.”</i> You give her a friendly wave and prepare to go on your way.");
	output("\n\nZo’dee waves back. <i>“Suit yourself, but don’t expect me to come save you.”</i>");
	output("\n\nWhen you look back, the rahn has moved on.");
	processTime(1);
	flags["ZODEE_S2_CHOICE"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Buy It]
public function buyGaloMaxFromZodee():void
{
	clearOutput();
	output("<i>“");
	if(pc.isBimbo()) output("Umm, like how about I buy it? 500 sound good?");
	else if(pc.isBro()) output("No time to screw around with that shit. 500 creds.");
	else if(pc.isNice()) output("Would you accept credits instead? 500, to be precise.");
	else if(pc.isMischievous()) output("Much as I might enjoy getting my hands on your body, I’m in a bit of a hurry. How about 500 credits?");
	else output("Eh. I bet you’d rather have 500 credits.");
	output("”</i> You pull a loaded chit out and wave it around.");
	output("\n\nZo’dee looks about to refuse, then thinks better of it. <i>“Yeah, I guess,”</i> she huffs, snatching the chit from your hand. <i>“You’re more boring than a Tove diplomat. Little bastards wouldn’t know a good fuck if it cockslapped them in the face. Here-”</i> She pulls a pill bottle off her hip and tosses it your way. <i>“Don’t get crazy with the GaloMax. It’d be hard to adventure from the inside of a bucket.”</i>");
	output("\n\nCan that... can that actually happen? You look up from the label to ask, but Zo’dee is already stomping off into the untamed wilds.\n\n");
	//-500 creds, acquire GaloMax
	pc.credits -= 500;
	flags["ZODEE_S2_CHOICE"] = 0;
	processTime(2);
	quickLoot(new GaloMax());
}

//[Help Her]
public function helpZodeeWithHerEggProblem():void
{
	clearOutput();
	showZodee();
	output("Zo’dee’s eyes light up when you tell her you’ll help her.");
	output("\n\n<i>“Really?”</i> The teal-skinned gel-girl seems positively elated. <i>“That kind of service usually costs quite a few credits... or a few drinks at least.”</i> Running a finger down the edge of her outfit, she releases an invisible catch, allowing the white latex to peel away. Deep blue nipples appear shortly before the tip of her turgid egg-layer, and the more you see of her unfeminine organ, the more aware of her plight you become. She is <i>stuffed</i> with eggs. The topmost sphere looks about ready to pop out. All you’ve got to do is give it a squeeze.");
	output("\n\n<i>“Go on,”</i> Zo’dee purrs encouragingly. <i>“Squeeze them out.”</i>");
	output("\n\nYour breath")
	if(pc.isBimbo()) output(" catches in your throat. It’s beautiful, even for like, a lady-cock.")
	else output(" seems a little too fast even to your own ears. There’s something indescribably exciting about offering such salacious assistance.")
	output(" You reach out and grab hold, marveling at the smooth, almost slick texture of her gelatinous skin. It’s not quite as soft as you’d expect, tough and hard enough to make you doubt you’ll be much help at squeezing out all the eggs trapped inside, but Zo’dee’s blissful expression is all the encouragement you need to forge ahead.");
	output("\n\nExperimentally stroking, you squeeze it from the base to the tip, at first alarmed and then pleased when a whitish-green goo leaks from the tip to glaze your fingers. Zo’dee wobbles and gasps, leaning against you for support")
	if(pc.tallness <= 48) output(", forced to hold onto your diminutive shoulders lest she pitch over on top of you")
	output(". You grin up at her and squeeze her near the base, forcing her prong to bloat bigger, the head greenish-blue. Its slit-tip is already starting to gape. More yogurt-thick goop oozes out.");
	output("\n\nYou use the extra fluid as lubricant, squeezing tight, dragging your pinching fingers upward. The spherical distentions of her eggs press back against your digits, but even they have to give. One forceful tug is all it takes to pop the first egg from Zo’dee’s dribbling spout. Rahn-spunk sprays out like champagne from a shaken bottle, carrying another orb to land alongside the first.");
	output("\n\nThe gelatinous girl is biting her lower lip and watching you with rapt attention, grunting and shaking her hips, slamming her spurting ovipositor into your fingers as hard as she can. She’s straight-up fucking your hand at this point. All you have to do is hold on and squeeze at the right moments to make the orgasmically addled alien moan and spurt. Ribbons of gooey relief intermingle with your squelching knuckles, filling the air with the lewdest slaps imaginable.");
	output("\n\nAnother egg lands in a rapidly expanding puddle with a squelch, kicking droplets of mixed ivory-emerald spunk onto your ");
	if(pc.hasToes()) output("toes");
	else output("[pc.footOrFeet]");
	output(". Zo’dee bucks powerfully another few times, expelling two more orbs, yet her frenetic motions die down afterward, expended. More eggs still lie within her. You can feel them rolling past your palm, pushed into position by whatever her race has in place of muscles. But Zo’dee seems spent. Her eyes are closed, her tongue is hanging free, and her antennae are drooping so low they verge on pressing against her face.");
	output("\n\nWeak twitches are the most your cummed-out companion can offer, but you did promise her you would help her with her egg problem. And there are still so many eggs to wring out of her.");
	output("\n\nShifting position, you ease Zo’dee onto the ground with her legs akimbo, splayed to either side of the puddle of eggs and rahn-butter. Then, squatting behind her, you get both hands on her still-stuffed ovipositor and work it over in earnest. She whimpers and cums again, splattering a half-dozen eggs onto the pile in rapid succession. You don’t pause or slow, mercilessly stroking her off, pumping her with sure, firm strokes until her body stops offering you more eggs - and the flood of creamy spooge tapers down to a drizzle.");
	output("\n\nZo’dee’s head lolls back, and she looks at you with a dazzling smile. <i>“O-oh, I might have to keep you...”</i> She grabs your head and forcefully kisses you, popping free with a ‘Mwah’.");
	output("\n\nYou stumble up, a little confused at her sudden recovery and fumbling for your words.");
	output("\n\n<i>“Maybe next time I’ll have you suck me off even when I’m </i>not<i> full of eggs. I bet that mouth of yours is just as good as your hands.”</i> Zo’dee produces the bottle of GaloMax and chucks it your way. <i>“See ya around, slut.”</i>");
	output("\n\nYou catch the bottle and shake it. A single pill rattles around inside.");
	output("\n\nThe teal rahn is already on her feet and lacing up her jumpsuit. She favors you with a mischievous smile, stretches out like a cat, and prances off into the wilds, brandishing her pistol.");
	output("\n\nWeird.");
	pc.changeLust(15);
	output("\n\n");
	flags["ZODEE_S2_CHOICE"] = 1;
	processTime(17);
	quickLoot(new GaloMax());
}

public function galoMaxTFProc():void
{
	clearOutput();
	showName("\nGALOMAX");
	author("Fenoxo-Sama-Chan-Kun");
	//Dose 1
	//-Goo hair + Biomass thirst + Hair control in appearance screen
	if(flags["GALOMAX_DOSES"] == 1)
	{
		output("A slight itch on your head is your first alert that the GaloMax you took is working, but it doesn’t stay a minor irritant for long. It threads under the surface of your scalp like worms crawling beneath your [pc.skinNoun], twisting and twining against one another until the whole of your scalp is a latticework of delirium-inducing discomfort. You can’t help but scratch at it");
		if(pc.hairLength > 0) output(", raking your fingers through your [pc.hair] until clumps of your old ‘do are clinging to your fingertips, revealing the bald [pc.skinNoun] below.");
		else output(", clawing madly at your scalp, almost wishing you had hair that you could blame the itch on.");
		//High will
		if(pc.WQ() >= 50) output("\n\nThrough sheer force of will, you drag your hands away before you can bloody your own pate. You grit your teeth and grunt, doing your best to ignore the throb in your head and the slowly growing burn of exotic, onsite genetic engineering. Just when you’re about to cave in and itch away, the sensory onslaught abates, leaving a cool wetness in its wake.");
		//Lower will
		else output("\n\nYou try to drag your hands away, but the itch is too intense, too overwhelming for your sub-par willpower. You have to scratch, no matter how much damage you might do in the process, but it brings no relief. The pernicious irritant merely metamorphosizes into a burning fire, a sensory onslaught of onsite genetic engineering that scours its way through your pores, changing them into something... moist?");
		//Merge
		output("\n\nYou gingerly run a fingertip through the fluid covering your head, but it comes away clean - without the slightest residue. Attempting to pinch some off doesn’t work much better. It just flows around your digits like water and reforms on the other side. Stranger still, you can feel the fingers on your... well, goo, as well as the goo on your fingers. It’s as much a part of you as anything else.");
		output("\n\n<b>You have ");
		var colorSelect:String = pc.hairColor;
		if(InCollection(colorSelect, "black", "brown", "sable", "transparent", "clear")) colorSelect = RandomInCollection("green","emerald","blue","purple","pink","orange");

		output(colorSelect + " gooey hair, just like a galotian");
		if(CodexManager.entryUnlocked("Ganrael")) output(" or ganrael");
		output("!</b>");

		output("\n\nYou have to get a good look at it! Pulling out your Codex, you boot up the holocam and get your first look at your semi-solid locks, discovering a mop of " + colorSelect + " locks a few inches long. It looks like it’ll drip off you at any moment, but somehow the mass maintains its shape and position. It might look better parted another way, you muse.");
		output("\n\nAnd just like that, the part shifts from one side of your head to the other. You nearly drop the Codex in surprise. Somehow, you’re able to control the shape of your hair. What about the length? How would you look with a buzz cut or shoulder-length goo?");
		output("\n\nThe buzz cut is easy. You manage that in the blink of an eye, absorbing the extra mass back inside yourself, but when you imagine it longer, it merely returns to its old size, chased by the kind of full-body ache you might get after an entire day without a bite to eat. You’ll need to eat something to make it any longer... or find some other way to provide your goo with additional proteins and biomass.");
		if(pc.isTreated() && pc.isBro()) output(" You probably just need to top off the tank with some cow-girl milk. Nothing like a big-boobed slut in your lap to fill up the tank.");
		else if(pc.isBimbo()) 
		{
			output(" You lick your lip and giggle. This is nothing a little cock can’t fix. You’ll have beautiful, long goo hair in no time!");
			if(metKiro()) output(" Maybe Kiro is in town?");
		}
		output("\n\nNo other changes seem forthcoming. You’ll need another GaloMax to get any gooeyer.");
		//Uncool hair colors are changed to green, blue, or some other standard goo color. Maybe consult codex to see what choices we have?
		pc.hairColor = colorSelect;
		if(pc.hairType == GLOBAL.HAIR_TYPE_TENTACLES) pc.hairStyle = "tentacle";
		else pc.hairStyle = "null";
		pc.hairType = GLOBAL.HAIR_TYPE_GOO;
		if(!pc.hasStatusEffect("Cumflation Immune")) pc.createStatusEffect("Cumflation Immune");
	}
	//Dose 2
	//Sexual fluids replaced with hairColor slime + biomass vent (increases cumQ or girlCumQ by biomass quantities. Toggled in goo submenu)
	else if(flags["GALOMAX_DOSES"] == 2)
	{
		output("This time, there is no itch. There is no painful ache slithering through your skull. Instead, your heart flutters, beating faster and harder. Is this it? Is your whole body going to go from solid to liquid in the span of a few minutes? Your [pc.skinNoun] doesn’t feel any different");
		if(pc.hasFur() || pc.hasScales() || pc.hasFeathers()) output(", nor your [pc.skinFurScales]");
		output(". You’re just getting... warm... kind of hot really. Like sitting in a tub with water that’s a touch too warm, or snuggling into a hot-blooded lover’s arms while the climate control is on the fritz. That warmth flows radiates out through your whole body, but most of it sinks down, a thick flow that settles deep into your crotch to glow with unnatural lust.");
		pc.girlCumType = GLOBAL.FLUID_TYPE_SPECIAL_GOO;
		pc.cumType = GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO;
		//Neuters grow a cunt
		if(!pc.hasGenitals())
		{
			output("\n\nYou wince. This shouldn’t be affecting you! There’s nothing down there to turn on! No vagina to get all drippy and wet, and certainly no dick to distract you by getting hard or rubbing up on your clothes while you’re trying to talk to a pretty sapient. You shouldn’t be flushed like this. You shouldn’t be starting to pant or trembling");
			if(pc.hasKnees()) output(" with your [pc.knees] knocking");
			output("!");
			output("\n\nNevertheless, that seeping warmth sticks to the inside of your loins, flaring hotter and somehow <i>wetter</i>, centering itself directly ");
			if(pc.legCount == 1) output("above");
			else output("between");
			output(" your ");
			if(pc.isTaur()) output("hindlegs");
			else output("[pc.legOrLegs]");
			output(". You whimper and writhe, unable to keep your hands from pressing down on the sweet, moist heat, unable to stop from shuddering when your fingertips squeeze into a fold of flesh as pleasurable as it is slippery.");
			
			pc.createVagina();
			pc.vaginas[pc.vaginas.length-1].addFlag(GLOBAL.FLAG_GOOEY);
			pc.vaginas[pc.vaginas.length-1].vaginaColor = gooColor();
			
			output("\n\n<b>You have a pussy! A hot one that’s apparently sprung a leak if the sopping squeeze around your fingertips is any indication.</b> You pry your dancing fingers away before they decide to wring an orgasm from your new-budding clit, and gasp at the fluid coating your fingers.");
			if(pc.fluidColorSimple(pc.girlCumType) != pc.hairColor) output(" It’s [pc.hairColor]! <b>Your sexual secretions have turned [pc.hairColor] and have an extremely slimy consistency.</b>");
			else output(" <b>Your sexual secretions are more slime-like than ever before, and the color is richer somehow, a slippery counterpart to your hair.</b>");
			output("\n\nThere’s no stopping the torrid flow from your new orifice either. It dribbles freely even without aid from your slick fingers or decidedly more libidinous mind. It’ll probably squirt from the tiniest of orgasms. Your hand twitches in anticipation, wondering if your new, extra-gooey cunny will give off a little jet of lust or a whorish splatter. Maybe, like with your hair, you could direct your body’s biomass to enhance the effect?");
			output("\n\nOnly one way to find out!");
		}
		//Dicks and Cunts
		if(pc.hasCock() && pc.hasVagina())
		{
			output("\n\nYou’re helpless against the tide of lust rolling into your nethers, steadily filling your [pc.cocks] and flooding your [pc.vaginas]. You get hard - rock hard. A boner this rigid could chop wood. And you’re wet, wetter than a terran monsoon. Moisture ");
			if(!pc.isCrotchGarbed()) output("dribbles in thin streams down your thighs");
			else output("sticks to the inside of your [pc.lowerGarment]");
			output(", and you know that all you have to do is dip a finger inside to turn the trickles into streams of lusty drool. Biting your lip, you struggle to keep your hands away, but it’s a futile effort.");
			output("\n\nYour fingers know where they belong, know where they can touch to bring relief, where they can stroke to make your nerves dance pirouettes of bliss. They make the journey into ");
			if(pc.totalVaginas() == 1) output("your");
			else output("an");
			output(" oozing snatch before you’re consciously aware of it. ");
			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output("They don’t care that you’re in public, out where anyone could see you. If Peacekeepers show up, they’ll have to pry them out with a crowbar.");
			else output("They don’t care a whit about your location. If you were out in public, they’d still be knuckle-deep inside you. The Peacekeepers would have to pry them out of you with a crowbar");
			output(". Your other hand settles on [pc.oneCock] and begins to stroke, and pre-cum spills out in eager response. Everything feels so hot and wet, and the faster you masturbate, the slipperier you get.");
			output("\n\nYour boundless sex juices fill your palms to overflowing, and you instinctively smear it all over your genitals, your own slippery, gooey lubricant. It provides the perfect mix of slickness and friction, just enough to ease the passage of your hands’ back and forth motions. You squelch and stroke and whine, dribbling down your [pc.legOrLegs] - so wet... so very, very wet. Your cock");
			if(pc.cockTotal() > 1) output("s are fountains");
			else output(" is a fountain");
			output(", your puss");
			if(pc.totalVaginas() > 1) output("ies");
			else output("y");
			output(" a river.");

			output("\n\nOrgasm is less like a blissful explosion and more like breaking the top off a fire hydrant. Ribbons of... syrupy, [pc.girlCumColor] cum spray from both sets of sex organs. It’s different than you remember, tapping into a reservoir that you never would have expected to aid in your dual ejaculation, releasing pulsing waves of thick, sloppy goop to puddle on the floor and coat your [pc.legOrLegs]. It’s difficult to take in while the raw pleasure is dancing behind your eyes, but the minute the flow tapers down to a gentle drip, you realize what’s happened.");
			output("\n\n<b>The GaloMax has turned your cum - male and female alike - into the same sort of material as your hair, but slicker.</b> And you’re pretty sure you can spend your biomass to make future orgasms bigger and messier, just like the last. This might take some getting used to.");
		}
		//Just dix
		else if(pc.hasCock())
		{
			output("You’re helpless against the tide of lust rolling into your nethers, steadily filling your [pc.cocks]. You get hard - rock hard. ");
			if(pc.cockTotal() > 1) output("Boners");
			else output("A boner");
			output(" this rigid could chop wood, and yet ");
			if(pc.cockTotal() == 1) output("it seems");
			else output("they seem");
			output(" content to throb and await your attentions. ");
			if(pc.cockTotal() == 1) output("It bobs");
			else output("They bob");
			output(" in place, twitching. You know that all you have to do is grab hold to make it make ");
			if(pc.cockTotal() == 1) output("it spill its");
			else output("them spill their");
			output(" passionate load");
			if(pc.cockTotal() > 1) output("s");
			output(". Biting your lip, you struggle to keep your hands away, but it’s a futile effort.");

			output("\n\nYour fingers know where they belong, know where they can touch to bring relief, where they can stroke to make your nerves dance pirouettes of bliss. They make the journey to [pc.oneCock] before you’re consciously aware of it. ");
			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output("They don’t care that you’re in public, out where anyone could see you. If Peacekeepers show up, they’ll have to pry them off with a crowbar.");
			else output("They don’t care a whit about your location. If you were out in public, they’d still be wrapped around your length. The Peacekeepers would have to pry them off of you with a crowbar");
			output(". Pre-cum spills out in eager response. Everything feels so hot and wet, and the faster you masturbate, the slipperier you get.");
			output("\n\nYour boundless sex juices fill your palms to overflowing, and you instinctively smear it all over your genitals, your own slippery, gooey lubricant. It provides the perfect mix of slickness and friction, just enough to ease the passage of your hands’ back and forth motions. You squelch and stroke and whine, dribbling down your [pc.legOrLegs] - so wet... so very, very wet. Your cock");
			if(pc.cockTotal() > 1) output("s are fountains.");
			else output(" is a fountain.");
			output("\n\nOrgasm is less like a blissful explosion and more like breaking the top off a fire hydrant. Ribbons of... syrupy, [pc.cumColor] cum spray your [pc.cocks]. It’s different than you remember, tapping into a reservoir that you never would have expected to aid in ejaculation, releasing pulsing waves of thick, sloppy goop to puddle on the floor and coat your [pc.legOrLegs]. It’s difficult to take in while the raw pleasure is dancing behind your eyes, but the minute the flow tapers down to a gentle drip, you realize what’s happened.");
			output("\n\n<b>The GaloMax has turned your cum into the same sort of material as your hair, but slicker.</b> And you’re pretty sure you can spend your biomass to make future orgasms bigger and messier, just like the last. This might take some getting used to.");
		}
		//Just twats
		else
		{
			output("\n\nYou’re helpless against the tide of lust rolling into your nethers, steadily flooding your [pc.vaginas]. You get wet, wetter than a terran monsoon. Whatever that GaloMax is doing to you, it’s doing a better job than a date with a porn star. Moisture ");
			if(!pc.isCrotchGarbed()) output("dribbles in thin streams down your thighs");
			else output("sticks to the inside of your [pc.lowerGarment]");
			output(", and you know that all you have to do is dip a finger inside to turn the trickles into streams of lusty drool. Biting your lip, you struggle to keep your hands away, but it’s a futile effort.");
			output("\n\nYour fingers know where they belong, know where they can touch to bring relief, where they can stroke to make your nerves dance pirouettes of bliss. They make the journey into ");
			if(pc.totalVaginas() == 1) output("your");
			else output("an");
			output(" oozing snatch before you’re consciously aware of it. ");
			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output("They don’t care that you’re in public, out where anyone could see you. If Peacekeepers show up, they’ll have to pry them out with a crowbar.");
			else output("They don’t care a whit about your location. If you were out in public, they’d still be knuckle-deep inside you. The Peacekeepers would have to pry them out of you with a crowbar.");
			output(" Everything feels so hot and wet, and the faster you masturbate, the slipperier you get.");
			output("\n\nYour boundless sex juices fill your palms to overflowing, and you instinctively smear it all over your genitals, your own slippery, gooey lubricant. It provides the perfect mix of slickness and friction, just enough to ease the passage of your fingers. You squelch and stroke and whine, dribbling down your [pc.legOrLegs] - so wet... so very, very wet. Your puss");
			if(pc.totalVaginas() > 1) output("ies");
			else output("y");
			output(" a seemingly endless river.");
			output("\n\nOrgasm is less like a blissful explosion and more like breaking the top off a fire hydrant. Ribbons of... syrupy, [pc.cumColor] cum spray from your drenched, quivering twat. It’s different than you remember, tapping into a reservoir that you never would have expected to aid in your feminine ejaculation, releasing waves of thick, sloppy goop to puddle on the floor and coat your [pc.legOrLegs]. It’s difficult to take in while the raw pleasure is dancing behind your eyes, but the minute the flow tapers down to a gentle drip, you realize what’s happened.");
			output("\n\n<b>The GaloMax has turned your girlcum into the same sort of material as your hair, but slicker.</b> And you’re pretty sure you can spend your biomass to make future orgasms bigger and messier, just like the last. This might take some getting used to.");
		}
		pc.createStatusEffect("Goo Vent");
	}
	//Dose 3
	//All genitalia are goo.
	//Max Mass 1500
	//Elasticity to 3 min
	else if(flags["GALOMAX_DOSES"] == 3)
	{
		output("Here it comes! Once again, that heavy heat spreads throughout you, circling from your fingertips to ");
		if(pc.hasToes()) output("your toes");
		else output("the tips of your [pc.footOrFeet]");
		output(" only to settle more and more of itself into your crotch. Your [pc.groin] flood");
		if(pc.cockTotal() + pc.totalVaginas() < 2) output("s");
		output(" with it, plumping up with artificially-induced arousal. Your head swims, dizzied by the ");
		if(pc.isCrotchGarbed()) output("hot press of your aching, leaky flesh against your [pc.lowerGarment]");
		else output("currents of air blowing over your leaking, engorged flesh");
		output(". Standing up seems too difficult, all of a sudden, and you drop to the floor");
		if(pc.isCrotchGarbed()) output(", shedding your [pc.lowerGarments] as you go");
		output(".");
		//Used haircolor since that’s what we’re setting gooshit off of.
		output("\n\nRibbons of viscous juice spill from your ");
		if(pc.hasGenitals())
		{
			if(pc.hasCock()) 
			{
				output("[pc.cocks]");
				if(pc.hasVagina()) output(" and ");
			}
			if(pc.hasVagina()) output("[pc.vaginas]");
		}
		else output("[pc.crotch]");
		output(", oozing along your");
		if(pc.hasGenitals())
		{
			output(" bizarrely clenching ");
			if(pc.hasCock()) output("[pc.cockColor]");
			else output("[pc.vaginaColor]");
		}
		else output(" bare");
		output(" skin, painting it [pc.cumColor] in its wake. It almost looks like you’re cumming");
		if(!pc.hasGenitals())output(" - if you had a vagina that is -");
		else output(",");
		output(" but without the enjoyment the associated act would entail. Instead, you’re slumped on the floor, trying not to slump over while paradoxical contractions wreath you in tingling goo.");
		output("\n\nIt does feel kind of good, in an unusual kind of way. You feel like a passenger in a remote-controlled body, one that insists on making its crotch so hot that it threatens to liquefy under the deluge. It’d be maddening if you hadn’t expected something like this to happen. Rapid pants, whining gasps, and splatters fill the air with their lurid echoes. Aeons seem to pass while you lie there, fruitlessly twitching, bathing your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("crotch");
		output(" in goo. Just when you fear it will never end, the flow stops, and your head clears.");
		output("\n\nYou try to clean up, but no matter how much of the gooey slop you wipe away, there always seems to be more underneath. No amount of toweling off seems to help");
		if(pc.hasGenitals())
		{
			if(pc.hasCock())
			{
				output(", and it isn’t until you see your fingers <i>through</i> ");
				if(pc.cockTotal() > 1) output("a");
				else output("your");
				output(" semi-transparent cock that you realize what’s happened.");
			}
			else output(", and it isn’t until you see the edge of a finger through a freshly-cleaned nether-lip that you realize what’s happened.");
			output(" <b>Your genitalia... your whole pubic mound, really, has become " + (pc.hairType == GLOBAL.HAIR_TYPE_GOO ? "[pc.hairColor]" : "green") + " and gooey");
			if(pc.hairType == GLOBAL.HAIR_TYPE_GOO) output(", just like your hair");
			output(".</b>");
		}
		else
		{
			output(", and it isn’t until you see the edge of a finger through the skin that you realize what’s happened.");
			output(" <b>Your... your whole “pubic” area really has become gooey");
			if(pc.hairType == GLOBAL.HAIR_TYPE_GOO) output(", just like your hair");
			output(".</b>");
		}
		output("\n\n<i>Maybe you can shift things around down there too...</i>");
		pc.createStatusEffect("Goo Crotch");
		//Elasticity to 3
		//Cocks/Cunts to goo
		if(pc.elasticity < (pc.hasPerk("Elasticity") ? 4 : 3)) pc.elasticity = (pc.hasPerk("Elasticity") ? 4 : 3);
		var x:int = 0;
		for(x = 0; x < pc.totalCocks(); x++)
		{
			if(!pc.hasCockFlag(GLOBAL.FLAG_GOOEY,x)) pc.cocks[x].addFlag(GLOBAL.FLAG_GOOEY);
			pc.cocks[x].cockColor = pc.hairColor;
			if(pc.hairType != GLOBAL.HAIR_TYPE_GOO) pc.cocks[x].cockColor = RandomInCollection("green", "emerald");
		}
		for(x = 0; x < pc.totalVaginas(); x++)
		{
			if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY)) pc.vaginas[x].addFlag(GLOBAL.FLAG_GOOEY);
			pc.vaginas[x].vaginaColor = pc.hairColor;
			if(pc.hairType != GLOBAL.HAIR_TYPE_GOO) pc.vaginas[x].vaginaColor = RandomInCollection("green", "emerald");
		}
	}
	//Dose 4
	//Body exterior gets gooey - skinType change. Boobs can now be resized in goo submenu.
	//Nipplecunts/dix as toggled by goo menu.
	//Max Mass 10,000
	else if(flags["GALOMAX_DOSES"] == 4)
	{
		var gooColor:String = pc.hairColor;
		output("You wipe sweat from your brow, alarmed at how warm the air is getting. Your whole body feels sticky with perspiration. ");
		if(pc.isNude()) output("Nudity provides no defense. Even bare, your extremities are uncomfortably heated.");
		else output("Equipment is nothing but an inconvenience. Even once you strip naked, your extremities feel uncomfortably heated.");
		output(" Salty moisture rolls down your face, threatening to blind you. This cannot be natural. Surely, this is the GaloMax modifying your body... It <i>must</i> be the GaloMax.");
		//Since we start by looking at arms, base TF text off the appearance of the PC's arms if possible, if not base on appropriate skin tag.
		var choice:String = "skin";
		if(pc.hasArmFlag(GLOBAL.FLAG_CHITINOUS)) choice = "chitin";
		else if(pc.hasArmFlag(GLOBAL.FLAG_FEATHERED)) choice = "feathers";
		else if(pc.hasArmFlag(GLOBAL.FLAG_FURRED)) choice = "fur";
		else if(pc.hasArmFlag(GLOBAL.FLAG_SCALED)) choice = "scales";
		else if(pc.skinType == GLOBAL.SKIN_TYPE_CHITIN) choice = "chitin";
		else if(pc.skinType == GLOBAL.SKIN_TYPE_SCALES) choice = "scales";
		else if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) choice = "fur";
		else if(pc.skinType == GLOBAL.SKIN_TYPE_FEATHERS) choice = "feathers";
		//Chitin arms
		if(choice == "chitin")
		{
			output("\n\nHolding a " + pc.chitinColor() + "-armored arm up in front of your face, you watch in horror as the individual chitin plates become slimy and matted with sweat. Worse yet, they’re next to impossible to distinguish from one another, blurring together into a seemless mass of gleaming slime. ");
			if(pc.chitinColor() != gooColor) output("Tendrils of " + gooColor + " spread inward from the edges like ink soaking through paper. Their progress is inexorable, and no matter how much the process disturbs you, you’re completely " + gooColor + " in no time at all. ");
			output("You shiver feverishly and gape when you realize that you can see <b>through</b> your own hand, barely.");
		}
		//Fur skin or furred arms.
		else if(choice == "fur")
		{
			output("\n\nHolding a " + pc.furColor + "-furred hand up in front of your face, you watch in horror as the individual strands become slimy and matted with sweat. Worse yet, they become more and more difficult to distinguish with each passing second. ");
			if(pc.furColor != gooColor) output("Tendrils of " + gooColor + " spread outward from the roots like ink soaking through paper. Their progress is inexorable, and no matter how much the process disturbs you, you’ve become completely " + gooColor + " in no time at all. ");
			output("You shiver feverishly and gape when you realize that you can see <b>through</b> your own hand, barely.");
		}
		//Feathers or feathered arms
		else if(choice == "feathers")
		{
			output("\n\nHolding a " + pc.furColor + "-feathered arm up in front of your face, you watch in horror as the individual feathers become slimy and matted with sweat. Worse yet, they’re next to impossible to distinguish from one another, blurring together into a tangled mass of slimy fibers. ");
			if(pc.furColor != gooColor) output("Tendrils of " + gooColor + " spread outward from the quills like ink soaking through paper. Their progress is inexorable, and no matter how much the process disturbs you, you’re completely " + gooColor + " in no time at all. ");
			output("You shiver feverishly and gape when you realize that you can see <b>through</b> your own hand, barely.");
		}
		//Scales/scaled arms
		else if(choice == "scales")
		{
			output("\n\nHolding a " + pc.scaleColor + "-scaled arm up in front of your face, you watch in horror as the individual scales become slimy and matted with sweat. Worse yet, they’re next to impossible to distinguish from one another, blurring together into a single sheet of gleaming carapace. ");
			if(pc.scaleColor != gooColor) output("Tendrils of " + gooColor + " spread inward from the individual edges like ink soaking through paper. Their progress is inexorable, and no matter how much the process disturbs you, you’re completely " + gooColor + " in no time at all. ");
			output("You shiver feverishly and gape when you realize that you can see <b>through</b> your own hand, barely.");
		}
		//Actual skinz without special armbutts.
		else
		{
			output("\n\nHolding a " + pc.skinTone + " arm up in front of your face, you watch in horror as your skin begins to gleam with layer after layer of greasy sweat. Hairs disappear before your eyes, seemingly melting into the soupy morass. ");
			if(pc.skinTone != gooColor) output("Tendrils of " + gooColor + " creep upward from the edges of your fingertips like ink soaking through paper. Their progress is inexorable, tracing spiderwebs of color through your arms and into your shoulders where they meet up with the ones spreading out from your crotch. ");
			output("Shivering feverishly, you fail to contain your shock when you hand reveals the ground behind it. You can see through it, barely.");
		}
		//Merge
		output("\n\nThe change isn’t limited to your hand either. Your whole body may as well be made of gelatin for how transparent it has become. Stranger still is what you see when you look at your own torso. There’s no flesh or organs beneath your translucent membrane, just an endless expanse of " + gooColor + " that wobbles delightfully where you poke and prod. You aren’t quite made of liquid, like a galotian, just yet, but you’re something close. A shiny, smooth surface has replaced your ");
		if(pc.hasFur()) output("fur");
		else if(pc.hasFeathers()) output("feathers");
		else if(pc.hasScales()) output("scales");
		else if(pc.hasChitin()) output("scales");
		else output("skin");
		output(", ");
		if(pc.skinType != GLOBAL.SKIN_TYPE_SKIN) output(" not quite skin but ");
		output("more like the cellular membrane of a rahn.");
		output("\n\nYou calm down as well as you are able after such a massive change, still feeling your heartbeat hammering in your chest somehow. Happily the intense, full body fever seems to have passed. You’re still slick and slimy with whatever passes for your sweat, but at least you’re comfortable in your own gelatinous skin.");
		output("\n\n<b>Your whole body is gooey and gelatinous from head to toe. You’re pretty sure you can even reshape your chest as easily as your ever-slimy loins. One more dose ought to finish the job and let you be a gooey, ever-shifting mass");
		if(celiseIsFollower()) output(", like Celise");
		output(".</b>");
		revertGooBody();
		pc.createStatusEffect("Gel Body");
		if(pc.elasticity < (pc.hasPerk("Elasticity") ? 4.5 : 3.5)) pc.elasticity = (pc.hasPerk("Elasticity") ? 4.5 : 3.5);
	}
	else if(flags["GALOMAX_DOSES"] == 5)
	{
		output("You unexpectedly feel a little faint, your [pc.legOrLegs] wobbling uncontrollably. Attempting to hold yourself together you place your hands on your thighs and command the rebellious biomass to support you, only to have your hands sink <i>inside</i> your simulated musculature. It feels... good. Without thinking, you plunge into your elbows, squeezing and kneading your own goopy insides.");
		output("\n\nThe ground rushes up at you when the last bits of rigidity fade away, but instead of hitting cold, hard ground, you bounce on a cushion off your own making, feeling your [pc.butt] sink halfway into the mound of jiggling goo. <b>You don’t have ");
		if(pc.legCount == 1) output("a [pc.leg]");
		else output("[pc.legs]");
		output(" anymore!</b> Instead, a large blob of slime cradles your form. It’s even more comfortable than the highest quality beanbag chair, but far wetter.");
		output("\n\nStraightening back up is a challenge. Your hips keep sliding back and forth through your bottom half, making it almost impossible to find your center of balance, and when you forget to think about it, that selfsame bottom half thins and spreads, lowering you dangerously. There’s no other choice but to take your time and adjust to your new form. With practice, you learn to stay upright. Maintaining the cohesion of your drippy base becomes almost second nature, allowing you to slide around just as fast as you could walk.");
		output("\n\nAnd it feels fantastic. Just sticking a hand inside yourself has you quivering in bliss. Scooping a handful of yourself out doesn’t even hurt. It just feels weird, like that part of you has gone numb. Pushing it back into your returns everything to normal, or as close to normal gets <b>when your only mode of transportation is rolling along on a mound of slime.</b>");
		output("\n\nGaloMax won’t be much use to you now. You’re almost indistinguishable from Galotians at a glance.");

		pc.legCount = 1;
		pc.clearLegFlags();
		pc.addLegFlag(GLOBAL.FLAG_AMORPHOUS);
		pc.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
		pc.legType = GLOBAL.TYPE_GOOEY;
		pc.genitalSpot = 0;
		//Set v1 of Gel Body to 1. Better than piling on more wasted status effects.
		pc.addStatusValue("Gel Body",1,1);
		if(pc.elasticity < (pc.hasPerk("Elasticity") ? 5 : 4)) pc.elasticity = (pc.hasPerk("Elasticity") ? 5 : 4);
		//Mimbranes!
		pc.removeStatusEffect("Mimbrane Foot Left");
		pc.removeStatusEffect("Mimbrane Foot Right");
	}
	// PLACEHOLDER - Failsafe, Overlimit, What do?
	// (Fill this in with your content if necessary!)
	else
	{
		var galoDoses:Number = doseEffectRevert();
		if(galoDoses > 0)
		{
			output("Uh... You feel funny all of a sudden... The number of GaloMax doses you have taken are making your microsurgeons go crazy. It looks like this dose is reverting you back!");
			if(galoDoses == 1) output("\n\n<b>Your hair changes back to its former gooeyness!</b>");
			else
			{
				output("\n\n<b>Your hair");
				if(galoDoses == 2) output(" and insides");
				else if(galoDoses == 3) output(" and crotch");
				else if(galoDoses > 3) output(", crotch and lower body");
				output(" revert back to their former gooeyness!</b>");
			}
		}
		else
		{
			output("Oh...");
			output("\n\nOoh...");
			output("\n\nAnd... nothing happens.");
			output("\n\nSeems like that GaloMax pill didn’t have any effect on you this time.");
			if(rand(2) == 0)
			{
				output("..");
				output("\n\nSuddenly, you feel a surge of biomass flow into your body. Well, it did have an effect after all!");
				gooBiomass(1000);
			}
		}
	}
	// Make sure max is not surpassed after tranformation.
	gooBiomass();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Hotfix for reverting goo-dosed bodies
public function doseEffectRevert(part:String = "all"):Number
{
	if(flags["GALOMAX_DOSES"] == undefined) return -1;
	
	var changeCount:Number = 0;
	
	if((part == "hair" || part == "all") && flags["GALOMAX_DOSES"] >= 1 && pc.hairType != GLOBAL.HAIR_TYPE_GOO)
	{
		if(pc.hairType == GLOBAL.HAIR_TYPE_TENTACLES) pc.hairStyle = "tentacle";
		else pc.hairStyle = "null";
		pc.hairType = GLOBAL.HAIR_TYPE_GOO;
		changeCount++;
	}
	if((part == "vent" || part == "all") && flags["GALOMAX_DOSES"] >= 2 && !pc.hasStatusEffect("Goo Vent"))
	{
		pc.createStatusEffect("Goo Vent");
		changeCount++;
	}
	if((part == "crotch" || part == "all") && flags["GALOMAX_DOSES"] >= 3 && !pc.hasStatusEffect("Goo Crotch"))
	{
		pc.createStatusEffect("Goo Crotch");
		changeCount++;
	}
	if((part == "body" || part == "all") && flags["GALOMAX_DOSES"] >= 4 && !pc.hasStatusEffect("Gel Body"))
	{
		revertGooBody();
		pc.createStatusEffect("Gel Body");
		changeCount++;
	}
	if((part == "body" || part == "all") && flags["GALOMAX_DOSES"] >= 5 && pc.statusEffectv1("Gel Body") != 1)
	{
		pc.addStatusValue("Gel Body",1,1);
		revertGooBody();
		changeCount++;
	}
	
	return changeCount;
}
public function doseEffectRevertFix(part:String = "all"):void
{
	clearOutput2();
	switch(part)
	{
		case "all":
			output2("Your entire body tingles as parts of you shift and warp. Suddenly, <b>you are back to your normal goo self</b>, more or less.");
			break;
		case "hair":
			output2("Your [pc.hair] tingles, then it begins to shift and morph. Not too soon after, <b>it has reverted itself back to its normally gooey self</b>.");
			break;
		case "vent":
			output2("Your crotch tingles as you feel a bubbling in the region. Suddenly,");
			if(!pc.hasGenitals()) output2(" a great pressure spikes, urging for release--but then it quickly subsides. Hm... <b>something changed, leaving you feeling more normal than before.</b>");
			else
			{
				if(pc.hasCock()) output2(" [pc.cum]");
				if(pc.hasCock() && pc.hasVagina()) output2(" and");
				if(pc.hasVagina()) output2(" [pc.girlCum]");
				output2(" starts to seep out of your loins... <b>It seems you have regained your ability to vent yourself!</b>");
			}
			break;
		case "crotch":
			output2("A tingling feeling hits your [pc.crotch]. You can sense the internal masses ebb and flow, kneading to your will. It looks like <b>you have regained the ability to reshape your genitals now</b>");
			if(!pc.hasGenitals()) output2("--assuming you had any, that is..");
			output2(".");
			break;
		case "body":
			output2("Your body shudders, then tingles for a moment, shifting and warping. As quickly as it begane, you suddenly find yourself back in your morphable gooey self.");
			break;
		default:
			output2("Nothing happens!");
			break;
	}
	doseEffectRevert(part);
	clearGhostMenu();
	addGhostButton(0, "Next", gooShiftMenu);
}
//Goo Body transformations
public function revertGooBody(part:String = "all", consumeBiomass:Boolean = false):void
{
	var i: int = 0;
	var gooTone:String = gooColor();
	if(part == "skin" || part == "all")
	{
		if(pc.hairType != GLOBAL.HAIR_TYPE_GOO)
		{
			if(pc.hairType == GLOBAL.HAIR_TYPE_TENTACLES) pc.hairStyle = "tentacle";
			else pc.hairStyle = "null";
			pc.hairType = GLOBAL.HAIR_TYPE_GOO;
		}
		pc.skinTone = gooTone;
		pc.furColor = gooTone;
		pc.scaleColor = gooTone;
		// Skin actually changes?
		pc.skinType = GLOBAL.SKIN_TYPE_GOO;
		pc.clearSkinFlags();
		pc.addSkinFlag(GLOBAL.FLAG_ABSORBENT);
		pc.addSkinFlag(GLOBAL.FLAG_SQUISHY);
		if(pc.statusEffectv1("Gel Body") >= 1) pc.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
		if(consumeBiomass) gooBiomass(-20);
	}
	// Goo mound!
	if(part == "mound" || (part == "all" && pc.statusEffectv1("Gel Body") >= 1))
	{
		pc.legCount = 1;
		pc.clearLegFlags();
		pc.addLegFlag(GLOBAL.FLAG_AMORPHOUS);
		pc.legType = GLOBAL.TYPE_GOOEY;
		pc.genitalSpot = 0;
		pc.removeStatusEffect("Mimbrane Foot Left");
		pc.removeStatusEffect("Mimbrane Foot Right");
		if(consumeBiomass) gooBiomass(-20);
	}
	// Gel-like legs? (legCount and genitalLocation() are preserved)
	else if(part == "legs partial" || part == "legs" || part == "all")
	{
		var legProperties:Array = [];
		if(pc.legFlags.length > 0)
		{
			// Strip skin/fur/scale flags for gel legs
			for (i = 0; i < pc.legFlags.length; i++)
			{
				if (!InCollection(pc.legFlags[i], GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_SCALED, GLOBAL.FLAG_CHITINOUS, GLOBAL.FLAG_FEATHERED))
					legProperties.push(pc.legFlags[i]);
			}
			pc.clearLegFlags();
			pc.legFlags = legProperties;
		}
		if(part == "legs partial")
		{
			pc.addLegFlag(GLOBAL.FLAG_GOOEY);
			if(consumeBiomass) gooBiomass(-5000);
		}
		else
		{
			pc.legType = GLOBAL.TYPE_GOOEY;
			if(consumeBiomass) gooBiomass(-20);
		}
	}
	// Gel-arms!
	if(part == "arms" || part == "all")
	{
		var armProperties:Array = [];
		if(pc.armFlags.length > 0)
		{
			for (i = 0; i < pc.armFlags.length; i++)
			{
				if (!InCollection(pc.armFlags[i], GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_SCALED, GLOBAL.FLAG_CHITINOUS, GLOBAL.FLAG_FEATHERED))
					armProperties.push(pc.armFlags[i]);
			}
			// Special exceptions
			if(pc.armType == GLOBAL.TYPE_DEMONIC && pc.hasArmFlag(GLOBAL.FLAG_CHITINOUS) && !pc.hasArmFlag(GLOBAL.FLAG_SMOOTH)) armProperties.push(GLOBAL.FLAG_SMOOTH);
			pc.clearArmFlags();
			pc.armFlags = armProperties;
		}
		pc.addArmFlag(GLOBAL.FLAG_GOOEY);
		if(consumeBiomass) gooBiomass(-20);
	}
	// Gel-tail! (number preserved)
	if(pc.hasTail() && (part == "tail" || part == "all"))
	{
		var tailProperties:Array = [];
		if(pc.tailFlags.length > 0)
		{
			for (i = 0; i < pc.tailFlags.length; i++)
			{
				if (!InCollection(pc.tailFlags[i], GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_SCALED, GLOBAL.FLAG_CHITINOUS, GLOBAL.FLAG_FEATHERED))
					tailProperties.push(pc.tailFlags[i]);
			}
			pc.clearTailFlags();
			pc.tailFlags = tailProperties;
		}
		pc.addTailFlag(GLOBAL.FLAG_GOOEY);
		if(consumeBiomass) gooBiomass(-20);
	}
	// Antennae and horns are probably ambiguous enough to remain unaffected.
	// Genitals! (already covered automagically!)
}

//Goo Options submenu.
public function gooShiftMenu():void
{
	clearOutput2();
	//Fix cumstuff
	if(pc.cumType == GLOBAL.FLUID_TYPE_SPECIAL_GOO) pc.cumType = GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO;
	output2("Now that you’re ");
	if(!pc.isGoo()) output2("part");
	else output2("a");
	output2(" goo creature, you can resize and change the goo’ed up parts of your form however you like. Which part of yourself will you focus on?");
	showBiomass();
	clearGhostMenu();
	var isGaloMaxxing:Boolean = pc.hasStatusEffect("GaloMax");
	if(flags["GALOMAX_DOSES"] > 1 || (!isGaloMaxxing && flags["GALOMAX_DOSES"] == 1))
	{
		if(pc.hairType == GLOBAL.HAIR_TYPE_GOO) addGhostButton(0, "Hair", gooHairAdjustmenu);
		else addGhostButton(0,"Fix Hair",doseEffectRevertFix,"hair");
	}
	else addDisabledGhostButton(0, "Hair");
	if(flags["GALOMAX_DOSES"] > 3 || (!isGaloMaxxing && flags["GALOMAX_DOSES"] == 3))
	{
		if(pc.hasStatusEffect("Goo Crotch")) addGhostButton(1,"Crotch",gooCrotchCustomizer);
		else addGhostButton(1,"Fix Crotch",doseEffectRevertFix,"crotch");
	}
	else addDisabledGhostButton(1,"Locked","Locked","It takes three doses of GaloMax to unlock this option.");
	if(flags["GALOMAX_DOSES"] > 4 || (!isGaloMaxxing && flags["GALOMAX_DOSES"] == 4))
	{
		if(pc.hasStatusEffect("Gel Body")) addGhostButton(2,"Chest",gooChestCustomizer);
		else addGhostButton(2,"Fix Chest",doseEffectRevertFix,"body");
		if(pc.hasStatusEffect("Gel Body")) addGhostButton(3,"Body",gooBodyCustomizer);
		else addGhostButton(3,"Fix Body",doseEffectRevertFix,"body");
	}
	else
	{
		addDisabledGhostButton(2,"Locked","Locked","It takes four doses of GaloMax to unlock this option.");
		addDisabledGhostButton(3,"Locked","Locked","It takes four doses of GaloMax to unlock this option.");
	}
	if(flags["GALOMAX_DOSES"] > 2 || (!isGaloMaxxing && flags["GALOMAX_DOSES"] == 2))
	{
		if(pc.hasStatusEffect("Goo Vent")) addGhostButton(4,"ToggleVent",ventToggle,undefined,"Toggle Vent","Toggle on or off whether you would like to add excess biomass to your own orgasmic releases.");
		else addGhostButton(4,"Fix Vent",doseEffectRevertFix,"vent");
	}
	else addDisabledGhostButton(4,"Locked","Locked","It takes two doses of GaloMax to unlock this option.");
	
	addGhostButton(5, "Cumflation", gooCumflationOptions, undefined, "Cumflation Options", "Adjust whether or not you want to retain the fluids pumped into you or convert them to biomass.");
	
	if(pc.hasSkinFlag(GLOBAL.FLAG_ABSORBENT) && (pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched"))) addGhostButton(6, "Clean Self", gooCleanSelf, undefined, "Clean Yourself", "Use your absorbant skin to clean off the sex fluids you are covered in.");
	
	if(flags["GALOMAX_DOSES"] > 2 || (!isGaloMaxxing && flags["GALOMAX_DOSES"] == 2))
	{
		addGhostButton(9, "Fluids", gooFluidOptions, undefined, "Body Fluid Options", "Adjust the type of your bodily fluids.");
	}
	else addDisabledGhostButton(9,"Locked","Locked","It takes two doses of GaloMax to unlock this option.");
	
	addGhostButton(14, "Back", backToAppearance, pc);
}

public function showBiomass():void
{
	output2("\n\n\tBiomass Reserve: <b>" + gooBiomass() + "</b>");
	if(flags["GALOMAX_DOSES"] >= 1 && flags["GALOMAX_DOSES"] <= 5) output2(" / " + gooBiomassMax());
	output2(" mLs");
	if(pc.hasStatusEffect("Goo Vent")) {
		output2("\n\tVenting: ");
		if(pc.statusEffectv1("Goo Vent") == 1) output2("On");
		else output2("Off");
	}
}

//Hair
//100 biomass/inch
public function gooHairAdjustmenu():void
{
	clearOutput2();
	output2("You currently have " + num2Text(Math.round(pc.hairLength*10)/10) + "-inch");
	if(Math.round(pc.hairLength*10)/10 != 1) output2("es");
	output2(" of gooey hair, in ");
	if(pc.hairStyle == "null") output2("no particular");
	else output2(indefiniteArticle(pc.hairStyle));
	output2(" style. Will you do anything with it?");
	showBiomass();
	//[Lengthen] [Shorten] [Style]
	clearGhostMenu();
	addGhostButton(0,"Lengthen",lengthenHairGoo,undefined,"Lengthen","Put 100 mLs of biomass into adding an inch to your hair.");
	if(pc.hasHair()) addGhostButton(1,"Shorten",shortenHairGoo,undefined,"Shorten","Shorten your gooey hair, regaining a portion of its biomass.");
	else addDisabledGhostButton(1,"Shorten","Shorten","You’ve got to have hair in order to shorten it!");
	if(pc.hairLength <= 0) addDisabledGhostButton(2,"Style","Style","You need some hair in order to style it!");
	else addGhostButton(2,"Style",newGooStyle,undefined,"Style","Style your hair into a more pleasing shape.");
	addGhostButton(14,"Back",gooShiftMenu);
	
}

//Lengthen
public function lengthenHairGoo():void
{
	clearOutput2();
	//Below 100 Biomass
	if(gooBiomass() < 100) 
	{
		output2("No matter how hard you will your ");
		if(!pc.hasHair()) output2("bald head to sprout hair, it steadfastly refuses to grow.");
		else output2("slippery locks to lengthen, they steadfastly refuse to grow.");
		output2(" The empty ache in your gut informs you that you’ll need more biomass to grow it longer.");
	}
	//Enough
	else
	{
		output2("You blink your eyes closed and direct your will to the flowing fluid atop your head, directing to expand and lengthen, to grow out ");
		if(pc.hairLength >= 1) output2("another");
		else output2("an");
		output2(" inch. You feel a bizarre tingle as it happens, but a second later, you’ve gotten longer hair.");
		if(pc.hairStyle != "null") 
		{
			output2(" <b>Growing it out mussed up your style. You’ll have to re-coif your ‘do if you want it back.</b>");
			pc.hairStyle = "null";
		}
		//-100 biomass. Reset style.
		gooBiomass(-100);
		pc.hairLength++;
	}
	clearGhostMenu();
	addGhostButton(0,"Next",gooHairAdjustmenu);
}

//Shorten
public function shortenHairGoo():void
{
	clearOutput2();
	output2("You scrunch up your face and draw the excess hair into your scalp, absorbing back into your reserve of biomass.");
	if(pc.hairStyle != "null")
	{
		pc.hairStyle = "null";
		output2(" <b>Shrinking it down messed up your style. You’ll have to re-coif your ‘do if you want it back.</b>");
	}
	if(pc.hairLength - 1 <= 0) output2(" There’s no more visible hair. You look bald now, though you could have a mop of hair back whenever you wanted it.");
	//+100 biomass, reset style
	gooBiomass(75);
	pc.hairLength -= 1;
	if(pc.hairLength < 0) pc.hairLength = 0;
	clearGhostMenu();
	addGhostButton(0,"Next",gooHairAdjustmenu);
}

//Style
public function newGooStyle():void
{
	clearOutput2();
	output2("What style will you shape your hair into?");
	//[All options go to Style Confirmation]
	clearGhostMenu();
	//[Straight] Sets [pc.hairstyle] to null.
	if(pc.hairStyle != "null" && pc.hairStyle != "straight") addGhostButton(0,"Straight",gooStyle,"straight","Straight","Style your hair into a plain, straight do.");
	else addDisabledGhostButton(0,"Straight","Straight","Your hair is already straight.");
	//[Ponytail]
	if(pc.hairStyle != "ponytail" && pc.hairLength >= 5) addGhostButton(1,"Ponytail",gooStyle,"ponytail","Ponytail","Style your hair into a ponytail.");
	else if(pc.hairStyle != "ponytail") addDisabledGhostButton(1,"Ponytail","Ponytail","Your hair isn’t long enough to get put into a ponytail.");
	else addDisabledGhostButton(1,"Ponytail","Ponytail","You already have a ponytail.");
	//[Pigtails]
	if(pc.hairStyle != "pigtails" && pc.hairLength >= 5) addGhostButton(2,"Pigtails",gooStyle,"pigtails","Pigtails","Style your hair into pigtails.");
	else if(pc.hairStyle != "pigtails") addDisabledGhostButton(2,"Pigtails","Pigtails","Your hair isn’t long enough to get put into pigtails.");
	else addDisabledGhostButton(2,"Pigtails","Pigtails","You already have a pigtails.");
	//[Curls]
	if(pc.hairStyle != "curls") addGhostButton(3,"Curls",gooStyle,"curls","Curls","Style your hair into curls.");
	else addDisabledGhostButton(3,"Curls","Curls","You already have your hair curled.");
	//[Braided]
	if(pc.hairStyle != "braided" && pc.hairLength >= 5) addGhostButton(4,"Braided",gooStyle,"braided","Braided","Style your hair into a braid.");
	else if(pc.hairStyle != "braided") addDisabledGhostButton(4,"Braided","Braided","Your hair isn’t long enough to be braided.");
	else addDisabledGhostButton(4,"Braided","Braided","You already have your hair braided!");
	//[Afro]
	if(pc.hairStyle != "afro" && pc.hairLength <= 12) addGhostButton(5,"Afro",gooStyle,"afro","Afro","Style your hair into an afro.");
	else if(pc.hairStyle != "afro") addDisabledGhostButton(5,"Afro","Afro","Your hair is too long to be styled into an afro.");
	else addDisabledGhostButton(5,"Afro","Afro","You already have an afro.");
	//[Mohawk]
	if(pc.hairStyle != "mohawk" && pc.hairLength <= 12) addGhostButton(6,"Mohawk",gooStyle,"mohawk","Mohawk","Style your hair into a mohawk.");
	else if(pc.hairStyle != "mohawk") addDisabledGhostButton(6,"Mohawk","Mohawk","Your hair is too long to be styled into a mohawk.");
	else addDisabledGhostButton(6,"Mohawk","Mohawk","You already have a mohawk.");
	addGhostButton(14,"Back",gooHairAdjustmenu);
}

//Style it
public function gooStyle(arg:String):void
{
	clearOutput2();
	output2("You use your Codex’s Holocam to check your appearance as your hair miraculously assumes the chosen shape. There’s a certain thrill in being able to alter your looks so effortlessly on your own, without something as barbaric as a pair of clippers or styling gel. You’re your own styling gel!");
	pc.hairStyle = arg;
	output2("\n\n<b>You now have a new hairstyle: " + pc.hairStyle + "!</b>");
	clearGhostMenu();
	addGhostButton(0,"Next",gooHairAdjustmenu)
}

public function ventToggle():void
{
	clearOutput2();
	if(pc.statusEffectv1("Goo Vent") == 1)
	{
		output2("You stop venting excess biomass when you orgasm.");
		pc.setStatusValue("Goo Vent",1,0);
	}
	else 
	{
		output2("You will now vent excess biomass when you orgasm.");
		pc.setStatusValue("Goo Vent",1,1);
	}
	clearGhostMenu();
	addGhostButton(0,"Next",gooShiftMenu);
}

//BODY
public function gooBodyCustomizer():void
{
	clearOutput2();
	output2("Do you will your body to change anything?");
	
	// Print body stats here:
	var i:int = 0;
	output2("\n\n<b><u>Body</u></b>");
	output2("\n<b>* Height: </b>" + prettifyLength(pc.tallness));
	output2("\n<b>* Tone: </b>" + pc.tone + " / " + pc.toneMax());
	output2("\n<b>* Thickness: </b>" + pc.thickness + " / " + pc.thicknessMax());
	output2("\n<b>* Hip Size: </b>" + formatFloat(pc.hipRating(), 3));
	output2("\n<b>* Butt Size: </b>" + formatFloat(pc.buttRating(), 3));
	output2("\n<b>* Skin:</b>");
	if(pc.skinFlags.length > 0)
	{
		for(i = 0; i < pc.skinFlags.length; i++)
		{
			output2(" " + GLOBAL.FLAG_NAMES[pc.skinFlags[i]] + ",");
		}
	}
	output2(" " + GLOBAL.SKIN_TYPE_NAMES[pc.skinType]);
	output2("\n<b>* Arms:</b> ");
	if(pc.armFlags.length > 0)
	{
		for(i = 0; i < pc.armFlags.length; i++)
		{
			output2(" " + GLOBAL.FLAG_NAMES[pc.armFlags[i]] + ",");
		}
	}
	output2(" " + GLOBAL.TYPE_NAMES[pc.armType]);
	if(pc.legCount >= 2)
	{
		if(pc.legType == GLOBAL.TYPE_NAGA) output2("\n<b>* Lower Tails:</b>");
		else output2("\n<b>* Legs:</b>");
		output2(" " + pc.legCount + ",");
	}
	else output2("\n<b>* Lower Body:</b>");
	if(pc.legFlags.length > 0)
	{
		for(i = 0; i < pc.legFlags.length; i++)
		{
			output2(" " + GLOBAL.FLAG_NAMES[pc.legFlags[i]] + ",");
		}
	}
	output2(" " + GLOBAL.TYPE_NAMES[pc.legType]);
	if(pc.tailCount > 0)
	{
		if(pc.tailCount == 1) output2("\n<b>* Tail:</b>");
		else output2("\n<b>* Tails:</b>");
		output2(" " + pc.tailCount + ",");
		if(pc.tailFlags.length > 0)
		{
			for(i = 0; i < pc.tailFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.tailFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.TYPE_NAMES[pc.tailType]);
	}
	
	showBiomass();
	clearGhostMenu();
	
	// General body shape:
	if(flags["GALOMAX_DOSES"] > 5 || (!pc.hasStatusEffect("GaloMax") && flags["GALOMAX_DOSES"] == 5))
	{
		if(pc.statusEffectv1("Gel Body") >= 1)
		{
			addGhostButton(0,"Height",adjustGooBody,["height","menu"],"Height","Make adjustments to your height.");
			addGhostButton(1,"Thickness",adjustGooBody,["thickness","menu"],"Thickness","Make adjustments to your thickness.");
			addGhostButton(2,"Tone",adjustGooBody,["tone","menu"],"Tone","Make adjustments to your tone.");
		}
		else
		{
			addGhostButton(0,"Fix Height",doseEffectRevertFix,"body");
			addGhostButton(1,"Fix Thick",doseEffectRevertFix,"body");
			addGhostButton(2,"Fix Tone",doseEffectRevertFix,"body");
		}
	}
	else
	{
		addDisabledGhostButton(0,"Locked","Locked","It takes five doses of GaloMax to unlock this option.");
		addDisabledGhostButton(1,"Locked","Locked","It takes five doses of GaloMax to unlock this option.");
		addDisabledGhostButton(2,"Locked","Locked","It takes five doses of GaloMax to unlock this option.");
	}
	addGhostButton(3,"Hip Size",adjustGooBody,["hip size","menu"],"Hip Size","Make adjustments to your hip size.");
	addGhostButton(4,"Butt Size",adjustGooBody,["butt size","menu"],"Butt Size","Make adjustments to your butt size.");
	
	// Bodypart fixans: (Primarily for things that got force changes--like Dr. Badger and Holiday events)
	var nonGooPart:Number = 0;
	if(pc.skinType != GLOBAL.SKIN_TYPE_GOO || pc.hairType != GLOBAL.HAIR_TYPE_GOO)
	{
		if(gooBiomass() >= 20) addGhostButton(5,"Revert Skin",revertGooBodyPart,"skin","Revert Skin and Hair","Revert your skin and hair back to goo.\n\n<b>20 mLs Biomass</b>");
		else addDisabledGhostButton(5,"Revert Skin","Revert Skin","You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
		nonGooPart++;
	}
	else addDisabledGhostButton(5,"Revert Skin","Revert Skin","Your skin and hair are already made of goo!");
	if(pc.hasArmFlag(GLOBAL.FLAG_FURRED) || pc.hasArmFlag(GLOBAL.FLAG_SCALED) || pc.hasArmFlag(GLOBAL.FLAG_CHITINOUS) || pc.hasArmFlag(GLOBAL.FLAG_FEATHERED))
	{
		if(gooBiomass() >= 20) addGhostButton(6,"Revert Arms",revertGooBodyPart,"arms","Revert Arms","Revert your arms back to goo.\n\n<b>20 mLs Biomass</b>");
		else addDisabledGhostButton(6,"Revert Arms","Revert Arms","You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
		nonGooPart++;
	}
	else addDisabledGhostButton(6,"Revert Arms","Revert Arms","Your arms are already made of goo!");
	if(pc.legType != GLOBAL.TYPE_GOOEY || pc.hasLegFlag(GLOBAL.FLAG_FURRED) || pc.hasLegFlag(GLOBAL.FLAG_SCALED) || pc.hasLegFlag(GLOBAL.FLAG_CHITINOUS) || pc.hasLegFlag(GLOBAL.FLAG_FEATHERED) || (pc.statusEffectv1("Gel Body") >= 1 && !pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)))
	{
		if(gooBiomass() >= 20)
		{
			if(pc.statusEffectv1("Gel Body") >= 1) addGhostButton(7,"Revert Legs",revertGooBodyLegs,"mound","Revert Lower Body","Revert your lower body back to an amorphous goo mound.\n\n<b>20 mLs Biomass</b>");
			else addGhostButton(7,"Revert Legs",revertGooBodyLegs,"legs","Revert Lower Body","Revert your lower body back to goo.\n\n<b>20 mLs Biomass</b>");
		}
		else addDisabledGhostButton(7,"Revert Legs","Revert Lower Body","You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
		nonGooPart++;
	}
	else addDisabledGhostButton(7,"Revert Legs","Revert Lower Body","Your lower body is already made of goo!");
	if(pc.hasTail())
	{
		if(pc.hasTailFlag(GLOBAL.FLAG_FURRED) || pc.hasTailFlag(GLOBAL.FLAG_FLUFFY) || pc.hasTailFlag(GLOBAL.FLAG_SCALED) || pc.hasTailFlag(GLOBAL.FLAG_CHITINOUS) || pc.hasTailFlag(GLOBAL.FLAG_FEATHERED))
		{
			if(gooBiomass() >= 20) addGhostButton(8,"Revert Tail",revertGooBodyPart,"tail","Revert Tail","Revert [pc.eachTail] back to goo.\n\n<b>20 mLs Biomass</b>");
			else addDisabledGhostButton(8,"Revert Tail","Revert Tail","You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
			nonGooPart++;
		}
		else
		{
			if(pc.tailCount == 1) addDisabledGhostButton(8,"Revert Tail","Revert Tail","Your tail is already made of goo!");
			else addDisabledGhostButton(8,"Revert Tail","Revert Tail","Your tails are already made of goo!");
		}
	}
	else addDisabledGhostButton(8,"Revert Tail","Revert Tail","You don’t have any tails to revert!");
	if(nonGooPart > 1)
	{
		if(gooBiomass() >= (20 * nonGooPart)) addGhostButton(9,"Revert All",revertGooBodyPart,"all","Revert All","Revert almost every body part back to goo.\n\n<b>" + (20 * nonGooPart) + " mLs Biomass</b>");
		else addDisabledGhostButton(9,"Revert All","Revert All","You don’t have enough biomass for that.\n\n<b>" + (20 * nonGooPart) + " mLs Biomass</b>");
	}
	else addDisabledGhostButton(9,"Revert All","Revert All","You’ll need to have more than one body part that is able to revert in order to try this!");
	if((pc.skinType == GLOBAL.SKIN_TYPE_GOO || pc.hasSkinFlag(GLOBAL.FLAG_GOOEY)) && pc.hairType == GLOBAL.HAIR_TYPE_GOO) addGhostButton(10,"Match Color",revertGooBodyColor,"menu","Match Colors","Force the color of your body or hair to match one another.");
	else addDisabledGhostButton(10,"Match Color","Match Colors","You’ll need to have gooey skin and gooey hair in order to try this!");
	
	if(pc.legType == GLOBAL.TYPE_GOOEY && pc.statusEffectv1("Gel Body") >= 1)
	{
		addGhostButton(12,"Change Legs",adjustGooLegs,["menu"],"Customize Lower Body","Change the shape of your [pc.legs].");
	}
	
	addGhostButton(14,"Back",gooShiftMenu);
}
public function adjustGooBody(arg:Array):void
{
	var part:String = arg[0];
	var desc:String = arg[1];
	var cost:Number = 0;
	var limitMax:Number = 100;
	var limitMin:Number = 0;
	clearGhostMenu();
	// Menu blurb
	if(desc == "menu")
	{
		clearOutput2();
		output2("You take a look at your body’s shape, contemplating the changes you could make to it. ");
	}
	// Parts Options
	if(part == "height")
	{
		cost = 20;
		limitMax = 144;
		limitMin = 36;
		if(desc == "increase" || desc == "decrease")
		{
			clearOutput2();
			if(desc == "increase")
			{
				output2("You concentrate, bunching up some biomass to add an extra inch to your tallness.");
				pc.tallness++;
				if(pc.tallness > limitMax) pc.tallness = limitMax;
				gooBiomass(-1 * cost);
			}
			else if(desc == "decrease")
			{
				output2("You relax, letting go of an inch of your height to become a little shorter.");
				pc.tallness--;
				if(pc.tallness < limitMin) pc.tallness = limitMin;
				gooBiomass(cost * 0.75);
			}
			output2(" <b>You are now " + pc.displayTallness() + " tall.</b>");
		}
		output2("\n\n");
		if(pc.tallness >= limitMax) addDisabledGhostButton(0,"Increase","Increase","It looks like you can’t get any taller than you are now!");
		else if(gooBiomass() >= cost) addGhostButton(0,"Increase",adjustGooBody,[part,"increase"],"Increase","Add an inch to your height.\n\n<b>" + cost + " mLs Biomass</b>");
		else addDisabledGhostButton(0,"Increase","Increase","You don’t have enough biomass for that.\n\n<b>" + cost + " mLs Biomass</b>");
		if(pc.tallness <= limitMin) addDisabledGhostButton(1,"Decrease","Decrease","It looks like you can’t get any shorter than you are now!");
		else addGhostButton(1,"Decrease",adjustGooBody,[part,"decrease"],"Decrease","Reduce your height by an inch.");
	}
	else if(part == "thickness")
	{
		cost = 20;
		limitMax = pc.thicknessMax();
		limitMin = pc.thicknessMin();
		if(desc == "increase" || desc == "decrease")
		{
			clearOutput2();
			if(desc == "increase")
			{
				output2("You concentrate, allowing your body and limbs fill with gooey biomass...");
				output2(pc.modThickness(1));
				gooBiomass(-1 * cost);
			}
			else if(desc == "decrease")
			{
				output2("You relax, letting the biomass flow back into your reserves...");
				output2(pc.modThickness(-1));
				gooBiomass(cost * 0.75);
			}
			output2("\n<b>Your thickness level is now " + pc.thickness + ".</b>");
		}
		output2("\n\n");
		if(pc.thickness >= limitMax) addDisabledGhostButton(0,"Increase","Increase","It looks like you can’t get any thicker than you are now!");
		else if(gooBiomass() >= cost) addGhostButton(0,"Increase",adjustGooBody,[part,"increase"],"Increase","Add a size to your thickness.\n\n<b>" + cost + " mLs Biomass</b>");
		else addDisabledGhostButton(0,"Increase","Increase","You don’t have enough biomass for that.\n\n<b>" + cost + " mLs Biomass</b>");
		if(pc.thickness <= limitMin) addDisabledGhostButton(1,"Decrease","Decrease","It looks like you can’t get any thinner than you are now!");
		else addGhostButton(1,"Decrease",adjustGooBody,[part,"decrease"],"Decrease","Reduce your thickness by one size.");
	}
	else if(part == "tone")
	{
		cost = 20;
		limitMax = pc.toneMax();
		limitMin = pc.toneMin();
		if(desc == "increase" || desc == "decrease")
		{
			clearOutput2();
			if(desc == "increase")
			{
				output2("You concentrate, trying your best to tighten your body...");
				output2(pc.modTone(1));
				gooBiomass(-1 * cost);
			}
			else if(desc == "decrease")
			{
				output2("You relax, letting your body become more fluid...");
				output2(pc.modTone(-1));
				gooBiomass(cost * 0.75);
			}
			output2("\n<b>Your tone level is now " + pc.tone + ".</b>");
		}
		output2("\n\n");
		if(pc.tone >= limitMax) addDisabledGhostButton(0,"Increase","Increase","It looks like you can’t get any more solid than you are now!");
		else if(gooBiomass() >= cost) addGhostButton(0,"Increase",adjustGooBody,[part,"increase"],"Increase","Add a level to your tone.\n\n<b>" + cost + " mLs Biomass</b>");
		else addDisabledGhostButton(0,"Increase","Increase","You don’t have enough biomass for that.\n\n<b>" + cost + " mLs Biomass</b>");
		if(pc.tone <= limitMin) addDisabledGhostButton(1,"Decrease","Decrease","It looks like you can’t get any more fluid than you are now!");
		else addGhostButton(1,"Decrease",adjustGooBody,[part,"decrease"],"Decrease","Reduce your tone by one level.");
	}
	else if(part == "hip size")
	{
		cost = 20;
		limitMax = 100;
		limitMin = 0;
		if(desc == "increase" || desc == "decrease")
		{
			clearOutput2();
			if(desc == "increase")
			{
				output2("You concentrate, filling yourself up with biomass to increase the size of your hips.");
				pc.hipRatingRaw++;
				//if(pc.hipRatingRaw > limitMax) pc.hipRatingRaw = limitMax;
				gooBiomass(-1 * cost);
			}
			else if(desc == "decrease")
			{
				output2("You relax, pulling in some biomass to decrease the size of your hips.");
				pc.hipRatingRaw--;
				if(pc.hipRatingRaw < limitMin) pc.hipRatingRaw = limitMin;
				gooBiomass(cost * 0.75);
			}
			output2(" <b>You now have [pc.hips].</b>");
			if(pc.hipRatingRaw <= limitMin && pc.hipRating() > limitMin) output2("\n\nYou realize that this is the smallest your hips can get. If you want them any smaller, you’ll have to remove whatever it is that is currently affecting their size.");
		}
		output2("\n\n");
		if(gooBiomass() >= cost) addGhostButton(0,"Increase",adjustGooBody,[part,"increase"],"Increase","Add a size to your hips.\n\n<b>" + cost + " mLs Biomass</b>");
		else addDisabledGhostButton(0,"Increase","Increase","You don’t have enough biomass for that.\n\n<b>" + cost + " mLs Biomass</b>");
		if(pc.hipRatingRaw <= limitMin) addDisabledGhostButton(1,"Decrease","Decrease","It looks like your hips can’t get any smaller than they are now!");
		else addGhostButton(1,"Decrease",adjustGooBody,[part,"decrease"],"Decrease","Reduce your hips by one size.");
	}
	else if(part == "butt size")
	{
		cost = 20;
		limitMax = 100;
		limitMin = 0;
		if(pc.hasPerk("Buttslut")) limitMin = 18;
		if(desc == "increase" || desc == "decrease")
		{
			clearOutput2();
			if(desc == "increase")
			{
				output2("You concentrate, filling yourself up with biomass to increase the size of your ass.");
				pc.buttRatingRaw++;
				//if(pc.buttRatingRaw > limitMax) pc.buttRatingRaw = limitMax;
				gooBiomass(-1 * cost);
			}
			else if(desc == "decrease")
			{
				output2("You relax, pulling in some biomass to decrease the size of your ass.");
				pc.buttRatingRaw--;
				if(pc.buttRatingRaw < limitMin) pc.buttRatingRaw = limitMin;
				gooBiomass(cost * 0.75);
			}
			output2(" <b>You now have [pc.butts].</b>");
			if(pc.buttRatingRaw <= limitMin && pc.buttRating() > limitMin) output2("\n\nYou realize that this is the smallest your butt can get. If you want it any smaller, you’ll have to remove whatever it is that is currently affecting its size.");
		}
		output2("\n\n");
		if(gooBiomass() >= cost) addGhostButton(0,"Increase",adjustGooBody,[part,"increase"],"Increase","Add a size to your butt.\n\n<b>" + cost + " mLs Biomass</b>");
		else addDisabledGhostButton(0,"Increase","Increase","You don’t have enough biomass for that.\n\n<b>" + cost + " mLs Biomass</b>");
		if(pc.buttRatingRaw <= limitMin) addDisabledGhostButton(1,"Decrease","Decrease","It looks like your butt can’t get any smaller than it is now!");
		else addGhostButton(1,"Decrease",adjustGooBody,[part,"decrease"],"Decrease","Reduce your butt by one size.");
	}
	
	output2("How would you like to change your " + part + "?");
	showBiomass();
	
	addGhostButton(14,"Back",gooBodyCustomizer);
}
public function adjustGooLegsMenu():void
{
	clearGhostMenu();
	
	addGhostButton(0, "Count", adjustGooLegs, ["count", -1, 0], "Leg Count", "Adjust the number of appendages that make up your lower body.");
	
	if(pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) addDisabledGhostButton(1, "Amorphous", "Amorphous Lower Body", "Your lower body is already an amorphous blob.");
	else if(gooBiomass() >= 20) addGhostButton(1, "Amorphous", adjustGooLegs, ["shape", GLOBAL.FLAG_AMORPHOUS, 20], "Amorphous Lower Body", "Liquify your lower body, reverting it back to a natural goo mound.\n\n<b>20 mLs Biomass</b>");
	else addDisabledGhostButton(1, "Amorphous", "Amorphous Lower Body", "You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
	
	if(pc.hasLegFlag(GLOBAL.FLAG_PREHENSILE)) addDisabledGhostButton(2, "Prehensile", ("Prehensile Tentacle" + (pc.legCount == 1 ? "":"s")), ("Your appendage" + (pc.legCount == 1 ? " is already a snake-like tail" : "s are already gooey tentacles") + "."));
	else if(gooBiomass() >= 20) addGhostButton(2, "Prehensile", adjustGooLegs, ["shape", GLOBAL.FLAG_PREHENSILE, 20], ("Prehensile Tentacle" + (pc.legCount == 1 ? "":"s")), ("Convert your appendage" + (pc.legCount == 1 ? " into a snake-like tail" : "s to gooey tentacles") + ".\n\n<b>20 mLs Biomass</b>"));
	else addDisabledGhostButton(2, "Prehensile", ("Prehensile Tentacle" + (pc.legCount == 1 ? "":"s")), "You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
	
	if(pc.hasLegFlag(GLOBAL.FLAG_TENDRIL)) addDisabledGhostButton(7, "Tendril", ("Wriggling Tendril" + (pc.legCount == 1 ? "":"s")), ("Your appendage" + (pc.legCount == 1 ? " is already a tendril-like tail" : "s are already gooey tendrils") + "."));
	else if(gooBiomass() >= 20) addGhostButton(7, "Tendril", adjustGooLegs, ["shape", GLOBAL.FLAG_TENDRIL, 20], ("Wriggling Tendril" + (pc.legCount == 1 ? "":"s")), ("Convert your appendage" + (pc.legCount == 1 ? " into a tendril-like tail" : "s to gooey tendrils") + ".\n\n<b>20 mLs Biomass</b>"));
	else addDisabledGhostButton(7, "Tendril", ("Wriggling Tendril" + (pc.legCount == 1 ? "":"s")), "You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
	
	if(pc.legCount >= 2) {
		if(pc.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) addDisabledGhostButton(3, "Plantigrade", "Plantigrade Legs", "Your legs are already human-shaped.");
		else if(gooBiomass() >= 20) addGhostButton(3, "Plantigrade", adjustGooLegs, ["shape", GLOBAL.FLAG_PLANTIGRADE, 20], "Plantigrade Legs", "Change your leg stance to be more human-like.\n\n<b>20 mLs Biomass</b>");
		else addDisabledGhostButton(3, "Plantigrade", "Plantigrade Legs", "You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
		
		if(pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) addDisabledGhostButton(8, "Digitigrade", "Digitigrade Legs", "Your legs are already beast-shaped.");
		else if(gooBiomass() >= 20) addGhostButton(8, "Digitigrade", adjustGooLegs, ["shape", GLOBAL.FLAG_DIGITIGRADE, 20], "Digitigrade Legs", "Change your leg stance to be more bestial.\n\n<b>20 mLs Biomass</b>");
		else addDisabledGhostButton(8, "Digitigrade", "Digitigrade Legs", "You don’t have enough biomass for that.\n\n<b>20 mLs Biomass</b>");
	}
	else {
		addDisabledGhostButton(3, "Plantigrade", ("Plantigrade Leg" + (pc.legCount == 1 ? "":"s")), "You require multiple legs for this!\n\n<b>20 mLs Biomass</b>");
		addDisabledGhostButton(8, "Digitigrade", ("Digitigrade Leg" + (pc.legCount == 1 ? "":"s")), "You require multiple legs for this!\n\n<b>20 mLs Biomass</b>");
	}
	
	addGhostButton(14, "Back", gooBodyCustomizer);
}
public function adjustGooLegs(args:Array):void
{
	clearOutput2();
	
	var response:String = (args.length > 0 ? args[0] : "menu");
	var iNum:int = (args.length > 1 ? args[1] : -1);
	var cost:int = (args.length > 2 ? args[2] : 0);
	var i:int = 0;
	
	switch(response)
	{
		case "menu":
			output2("How would you like to adjust your [pc.lowerBody]?");
			
			adjustGooLegsMenu();
			break;
		case "count":
			output2("How many appendages do you want for your lower body?");
			
			var legList:Array = [];
			var btnSlot:int = 0;
			var baseCost:int = 20;
			
			legList.push(1);
			legList.push(2);
			//legList.push(3);
			legList.push(4);
			legList.push(6);
			legList.push(8);
			//legList.push(10);
			//legList.push(12);
			//legList.push(16);
			//legList.push(24);
			
			for(i = 0; i < legList.length; i++)
			{
				if(pc.legCount == legList[i]) addDisabledGhostButton(btnSlot, StringUtil.upperCase(num2Text(legList[i])), (legList[i] == 1 ? "Single Mass" : (StringUtil.upperCase(num2Text(legList[i])) + " Masses")), ("Your lower body " + (legList[i] == 1 ? "is already a natural goo mass" : ("already consists of " + num2Text(legList[i]) + " appendages")) + "."));
				else {
					cost = (baseCost * (legList[i] - pc.legCount));
					if(pc.legCount > legList[i]) addGhostButton(btnSlot, StringUtil.upperCase(num2Text(legList[i])), adjustGooLegs, ["legCount", legList[i], cost], (legList[i] == 1 ? "Single Mass" : (StringUtil.upperCase(num2Text(legList[i])) + " Masses")), ("Reduce your appendages until you have " + num2Text(legList[i]) + "."));
					else if(gooBiomass() >= cost) addGhostButton(btnSlot, StringUtil.upperCase(num2Text(legList[i])), adjustGooLegs, ["legCount", legList[i], cost], (legList[i] == 1 ? "Single Mass" : (StringUtil.upperCase(num2Text(legList[i])) + " Masses")), ("Grow " + (legList[i] == 1 ? "a single mass lower body" : ("up to " + num2Text(legList[i]) + " appendages total")) + ".\n\n<b>" + cost + " mLs Biomass</b>"));
					else addDisabledGhostButton(btnSlot, StringUtil.upperCase(num2Text(legList[i])), (legList[i] == 1 ? "Single Mass" : (StringUtil.upperCase(num2Text(legList[i])) + " Masses")), ("You don’t have enough biomass for that.\n\n<b>" + cost + " mLs Biomass</b>"));
				}
				btnSlot++;
			}
			cost = 0;
			
			addGhostButton(14, "Back", adjustGooLegs, ["menu"]);
			break;
		case "legCount":
			output2("You concentrate your thoughts to the center of your [pc.lowerBody], preparing yourself for a new change. A bubbling sensation is felt throughout " + (pc.legCount == 1 ? "the whole of your lower body" : "all " + num2Text(pc.legCount) + " of your [pc.legsNoun]. They then merge together, melting into a unified puddle") + ". Ripples form across the lake-like surface and the biomass");
			if(iNum == 1) output2(" extends and morphs until it becomes a single appendage, more-or-less.");
			else output2(" subdivides itself until it becomes a total of " + num2Text(iNum) + " limbs.");
			
			// Apply leg count
			pc.legCount = iNum;
			// Flag adjustments
			if(pc.legCount < 2) {
				pc.removeLegFlag(GLOBAL.FLAG_PLANTIGRADE);
				pc.removeLegFlag(GLOBAL.FLAG_DIGITIGRADE);
				if(!pc.hasLegFlag(GLOBAL.FLAG_PREHENSILE) && !pc.hasLegFlag(GLOBAL.FLAG_TENDRIL) && !pc.hasLegFlag(GLOBAL.FLAG_GOOEY)) pc.addLegFlag(GLOBAL.FLAG_AMORPHOUS);
			}
			// Genital location
			pc.resetGenitalLocation();
			
			output2("\n\n<b>" + (iNum == 1 ? "You now have a single goo mound" : ("Your gooey mass has sprouted " + num2Text(iNum) + " appendages")));
			if(pc.isDrider()) output2(" like a scurrying spider");
			else if(pc.isTaur()) output2(" like a bestial taur");
			else if(pc.isNaga()) output2(" like a " + (pc.legCount <= 2 ? "slithering snake" : "land-roaming cephalopod"));
			output2("!</b>");
			
			// Subtract/Add biomass cost
			if(cost != 0) gooBiomass(-1 * cost);
			
			addGhostButton(0, "Next", adjustGooLegs, ["menu"]);
			break;
		case "shape":
			output2("You concentrate your thoughts to the base of your [pc.lowerBody], preparing yourself for a new change.");
			if(pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && iNum != GLOBAL.FLAG_AMORPHOUS) output2(" The gooey surface of your undercarriage begins to tighten, taking on a more gel-like consistency.");
			else if(!pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && iNum == GLOBAL.FLAG_AMORPHOUS) output2(" The gel-like surface of your undercarriage begins to loosen, taking on a more liquid consistency.");
			else output2(" The surface of your undercarriage begins to ripple but mostly retains its consistency.");
			
			pc.removeLegFlag(GLOBAL.FLAG_AMORPHOUS);
			pc.removeLegFlag(GLOBAL.FLAG_PREHENSILE);
			pc.removeLegFlag(GLOBAL.FLAG_TENDRIL);
			pc.removeLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.removeLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			
			if(iNum == GLOBAL.FLAG_AMORPHOUS) {
				output2(" You shift your weight from side to side, feeling very comfortable and content being in your more natural and fluid form.");
				output2("\n\n<b>You now have " + (pc.legCount == 1 ? "an amorphous lower body" : "amorphous appendages making up your lower body") + "!</b>");
				pc.addLegFlag(GLOBAL.FLAG_AMORPHOUS);
			}
			else if(iNum == GLOBAL.FLAG_PREHENSILE) {
				output2(" You allow your biomass to morph into a form that slithers and squirms around, much like a serpent or tentacle.");
				output2("\n\n<b>You now have " + (pc.legCount == 1 ? "a prehensile snake-like lower body" : "prehensile tentacles making up your lower body") + "!</b>");
				pc.addLegFlag(GLOBAL.FLAG_PREHENSILE);
			}
			else if(iNum == GLOBAL.FLAG_TENDRIL) {
				output2(" You allow your biomass to morph into a form that curls and contorts about, similar to a vine or tentacle.");
				output2("\n\n<b>You now have " + (pc.legCount == 1 ? "a wriggling tendril-like lower body" : "wriggling tendrils making up your lower body") + "!</b>");
				pc.addLegFlag(GLOBAL.FLAG_TENDRIL);
			}
			else if(iNum == GLOBAL.FLAG_PLANTIGRADE) {
				output2(" You allow your biomass to morph into legs that have obvious joints, including knees and ankles, and shaping them into something similar to humanoid legs.");
				output2("\n\n<b>You now have human-jointed legs!</b>");
				pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			}
			else if(iNum == GLOBAL.FLAG_DIGITIGRADE) {
				output2(" You allow your biomass to morph into legs that have obvious joints, including knees and ankles, and shaping them into something similar to an animal’s legs.");
				output2("\n\n<b>You now have beast-jointed legs!</b>");
				pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			}
			
			if(cost != 0) gooBiomass(-1 * cost);
			
			addGhostButton(0, "Next", adjustGooLegs, ["menu"]);
			break;
	}
	
	output2("\n\n<b><u>Body</u></b>");
	if(pc.legCount >= 2)
	{
		if(pc.legType == GLOBAL.TYPE_NAGA) output2("\n<b>* Lower Tails:</b>");
		else output2("\n<b>* Legs:</b>");
		output2(" " + pc.legCount + ",");
	}
	else output2("\n<b>* Lower Body:</b>");
	if(pc.legFlags.length > 0)
	{
		for(i = 0; i < pc.legFlags.length; i++)
		{
			output2(" " + GLOBAL.FLAG_NAMES[pc.legFlags[i]] + ",");
		}
	}
	output2(" " + GLOBAL.TYPE_NAMES[pc.legType]);
	showBiomass();
	output2("\n\n");
}
public function revertGooBodyLegs(part:String = "legs"):void
{
	if(gooBiomass() < 5000)
	{
		revertGooBodyPart(part);
	}
	else
	{
		clearOutput2();
		output2("Hm, you want to change your [pc.legOrLegs]? Since you seem to have enough biomass, would you like to use a good chunk of it to retain your lower body’s shape as much as possible or simply return it back into a normal goo mound?");
		
		showBiomass();
		
		clearGhostMenu();
		if(part == "mound") addGhostButton(0,"Normal", revertGooBodyPart, part, "Normal Revert", "Just change back to a normal goo mound.\n\n<b>20 mLs Biomass</b>");
		else addGhostButton(0,"Normal", revertGooBodyPart, part, "Normal Revert", "Just change back to a normal goo lower body.\n\n<b>20 mLs Biomass</b>");
		addGhostButton(1,"Retain", revertGooBodyPart, "legs partial", "Partial Revert", "Concentrate more mass to keep your lower body’s shape intact while making it gooey.\n\n<b>5000 mLs Biomass</b>");
	}
}
public function revertGooBodyPart(part:String = "all"):void
{
	clearOutput2();
	output2("With a few shifts of your biomass, you close your [pc.eyes] and concentrate, focusing on");
	if(part == "all") output2(" your entire body");
	else if(part == "skin")
	{
		output2(" your");
		if(pc.skinType != GLOBAL.SKIN_TYPE_GOO) output2(" [pc.skin]");
		if(pc.skinType != GLOBAL.SKIN_TYPE_GOO && pc.hairType != GLOBAL.HAIR_TYPE_GOO) output2(" and");
		if(pc.hairType != GLOBAL.HAIR_TYPE_GOO) output2(" [pc.hair]");
	}
	else if(part == "legs partial" || part == "legs" || part == "mound") output2(" your [pc.legOrLegs]");
	else if(part == "arms") output2(" your [pc.arms]");
	else if(part == "tail") output2(" [pc.eachTail]");
	else output2(" a bag of dicks");
	output2(" and giving yourself a nice coating of slimy goo. After a moment, any anomaly that existed is no more. <b>You are feeling more gooey now!</b>");
	revertGooBody(part, true);
	clearGhostMenu();
	addGhostButton(0,"Next",gooBodyCustomizer);
}
public function gooMismatchedGenitals(sColor:String = "green"):int
{
	var i:int = 0;
	var mismatchedGenitals:int = 0;
	if(pc.hasCock())
	{
		for(i = 0; i < pc.cockTotal(); i++)
		{
			if(pc.hasCockFlag(GLOBAL.FLAG_GOOEY,i) && pc.cocks[i].cockColor != sColor) mismatchedGenitals++;
		}
	}
	if(pc.hasVagina())
	{
		for(i = 0; i < pc.totalVaginas(); i++)
		{
			if(pc.vaginas[i].hasFlag(GLOBAL.FLAG_GOOEY) && pc.vaginas[i].vaginaColor != sColor) mismatchedGenitals++;
		}
	}
	if(pc.balls > 0)
	{
		if(pc.statusEffectv1("Special Scrotum") == GLOBAL.FLAG_GOOEY && (pc.getStatusTooltip("Special Scrotum") != "" || pc.getStatusTooltip("Special Scrotum") != sColor)) mismatchedGenitals++;
	}
	return mismatchedGenitals;
}
public function revertGooBodyColor(part:String = "menu"):void
{
	clearOutput2();
	var i:int = 0;
	var sColor:String = pc.skinFurScalesColor();
	if(part == "menu")
	{
		output2("You flip open your Codex and");
		if(pc.isBimbo() || pc.isBro()) output2(" compulsively snap a photo of yourself - of course, you can’t resist the urge to do that - who wouldn’t want to see a bod’ like yours, right? You then");
		output2(" take a look at your gooey [pc.skinColor] skin");
		if(pc.hasHair()) output2(" and [pc.hairColor] [pc.hairsNoun]");
		output2(" and ponder for a bit.");
		showBiomass();
		output2("\n\n");
		clearGhostMenu();
		if(gooBiomass() >= 10 && pc.hairColor != pc.skinTone)
		{
			output2("You can tell your colors are different, would you like to force them to match? You can colorize yourself to either match your [pc.hairColor] hair");
			if(!pc.hasHair()) output2(", if it were visible that is,");
			output2(" or your [pc.skinColor] skin. ");
			addGhostButton(0,"Hair",revertGooBodyColor,"hair","Hair","Shift your body color to match your [pc.hairColor] hair.\n\n<b>10 mLs Biomass</b>");
			addGhostButton(1,"Skin",revertGooBodyColor,"skin","Skin","Shift your hair color to match your [pc.skinColor] skin.\n\n<b>10 mLs Biomass</b>");
		}
		else if(pc.hairColor != pc.skinTone)
		{
			output2("You can tell your colors are different, but unfortunately, you don’t have enough biomass to do anything about it. ");
			addDisabledGhostButton(0,"Hair","Hair","You don’t have enough biomass for that.\n\n<b>10 mLs Biomass</b>");
			addDisabledGhostButton(1,"Skin","Skin","You don’t have enough biomass for that.\n\n<b>10 mLs Biomass</b>");
		}
		else
		{
			addDisabledGhostButton(0,"Hair","Hair","Your hair and body colors already match!");
			addDisabledGhostButton(1,"Skin","Skin","Your hair and skin colors already match!");
		}
		if(pc.hasBeard())
		{
			if(pc.beardColor != pc.hairColor)
			{
				output2("Your [pc.beardColor] beard doesn’t quite match your [pc.hairColor] hair. ");
				if(gooBiomass() >= 10) addGhostButton(5,"Beard",revertGooBodyColor,"beard","Beard","Shift your beard color to match your [pc.hairColor] hair.\n\n<b>10 mLs Biomass</b>");
				else addDisabledGhostButton(5,"Beard","Beard","You don’t have enough biomass for that.\n\n<b>10 mLs Biomass</b>");
			}
			else
			{
				addDisabledGhostButton(5,"Beard","Beard","Your beard and hair colors already match!");
			}
		}
		if(gooMismatchedGenitals(sColor) > 0)
		{
			output2("Your genital colors seem to be off compared to the rest of your body. ");
			if(gooBiomass() >= 10) addGhostButton(2,"FixGenitals",revertGooGenitalColor,sColor,"Revert Genital Color","Shift your genital color to match your " + sColor + " body.\n\n<b>10 mLs Biomass</b>");
			else addDisabledGhostButton(2,"FixGenitals","Revert Genital Color","You don’t have enough biomass for that.\n\n<b>10 mLs Biomass</b>");
		}
		else
		{
			if(pc.hairColor == pc.skinTone) output2("You might be able to shift your colors if they are ever mismatched. ");
			addDisabledGhostButton(2,"FixGenitals","Revert Genital Color","Your genital and body colors already match!");
		}
		addGhostButton(14,"Back",gooBodyCustomizer);
	}
	else if(part == "hair")
	{
		output2("With relative ease, you allow the pigmentation to flow from your head and down into your body.");
		output2("\n\nSwirls of [pc.hairColor] trickle down, mixing then overrunning the [pc.skinColor] below. Not too soon after, you complete the color transformation and admire your changes. <b>Your body color now matches your hair color!</b>");
		pc.skinTone = pc.hairColor;
		pc.furColor = pc.hairColor;
		pc.scaleColor = pc.hairColor;
		gooBiomass(-10);
		clearGhostMenu();
		if(gooMismatchedGenitals(pc.hairColor) > 0)
		{
			output2("\n\nTilting your codex to your nether region, you noticed the color is a bit off... Do you want to change to color of your gooey genitals to match as well?");
			showBiomass();
			if(gooBiomass() >= 10) addGhostButton(0,"Yes",revertGooGenitalColor,pc.hairColor,"Yes","Shift your genital color to match your [pc.hairColor] hair.\n\n<b>10 mLs Biomass</b>");
			else addDisabledGhostButton(0,"Yes","Yes","You don’t have enough biomass for that.\n\n<b>10 mLs Biomass</b>");
			addGhostButton(1,"No",revertGooGenitalColor);
		}
		else addGhostButton(0,"Next",revertGooBodyColor,"menu");
	}
	else if(part == "skin")
	{
		output2("Concentrating hard, you try to allow the pigmentation to climb from your body and up into your head.");
		if(!pc.hasHair()) output2("\n\nNothing visibly changes, but you know that any new hair growth will turn out to be [pc.skinColor]-colored.");
		else output2("\n\nWebs of [pc.skinColor] cast across your head, mingling then engulfing your gooey [pc.hairColor] hair. After a brief moment, you complete the color transformation and admire your changes.");
		output2(" <b>Your hair color now matches your skin color!</b>");
		pc.hairColor = pc.skinTone;
		gooBiomass(-10);
		clearGhostMenu();
		if(gooMismatchedGenitals(pc.skinTone) > 0)
		{
			output2("\n\nTilting your codex to your nether region, you noticed the color is a bit off... Do you want to change to color of your gooey genitals to match as well?");
			showBiomass();
			if(gooBiomass() >= 10) addGhostButton(0,"Yes",revertGooGenitalColor,pc.skinTone,"Yes","Shift your genital color to match your [pc.skinColor] skin.\n\n<b>10 mLs Biomass</b>");
			else addDisabledGhostButton(0,"Yes","Yes","You don’t have enough biomass for that.\n\n<b>10 mLs Biomass</b>");
			addGhostButton(1,"No",revertGooGenitalColor);
		}
		else addGhostButton(0,"Next",revertGooBodyColor,"menu");
	}
	else if(part == "beard")
	{
		output2("Concentrating hard, you try to allow the pigmentation to climb from your head and into your facial hair.");
		output2("\n\nTiny dots of [pc.hairColor] bubble up and grow within the [pc.beardColor] [pc.beardNoun]. After a brief moment, you complete the color transformation and admire your changes.");
		output2(" <b>Your beard color now matches your hair color!</b>");
		pc.beardColor = pc.hairColor;
		gooBiomass(-10);
		clearGhostMenu();
		addGhostButton(0,"Next",revertGooBodyColor,"menu");
	}
}
public function revertGooGenitalColor(sColor:String = "null"):void
{
	clearOutput2();
	var mismatchedGenitals:int = 0;
	var i:int = 0;
	if(sColor == "null")
	{
		output2("Deciding to leave your genitals alone for now, you take a moment to survey the rest of your body one more time.");
	}
	else
	{
		if(pc.hasCock())
		{
			for(i = 0; i < pc.cockTotal(); i++)
			{
				if(pc.hasCockFlag(GLOBAL.FLAG_GOOEY,i)) pc.cocks[i].cockColor = sColor;
				mismatchedGenitals++;
			}
		}
		if(pc.hasVagina())
		{
			for(i = 0; i < pc.totalVaginas(); i++)
			{
				if(pc.vaginas[i].hasFlag(GLOBAL.FLAG_GOOEY)) pc.vaginas[i].vaginaColor = sColor;
				mismatchedGenitals++;
			}
		}
		if(pc.balls > 0)
		{
			if(pc.statusEffectv1("Special Scrotum") == GLOBAL.FLAG_GOOEY) pc.setStatusTooltip("Special Scrotum", sColor);
		}
		output2("Urging your biomass to move, you will yourself to shift the colors into your groin until");
		if(mismatchedGenitals == 1) output2(" its");
		else output2(" each");
		output2(" slimy surface matches the rest of you. <b>Your gooey genitals are now " + sColor + "!</b>");
		gooBiomass(-10);
	}
	clearGhostMenu();
	addGhostButton(0,"Next",revertGooBodyColor,"menu");
}

//CHEST
public function gooChestCustomizer():void
{
	clearOutput2();
	output2("Do you will your body to change anything?");
	boobStuff(pc);
	showBiomass();
	clearGhostMenu();
	var boobRowMax:Number = 3;
	if(pc.isNaga() || pc.isGoo()) boobRowMax = 5;
	if(pc.bRows() < boobRowMax)
	{
		if(gooBiomass() >= 200) addGhostButton(0,"Add Row",gooGrowNewBreastRow,undefined,"Add New Row","Grow an additional row of breasts and nipples.\n\n<b>200 mLs Biomass</b>");
		else addDisabledGhostButton(0,"Add Row","Add New Row","You don’t have enough biomass for that.\n\n<b>200 mLs Biomass</b>");
	}
	else addDisabledGhostButton(0,"Add Row","Add New Row","You have too many rows of breasts to grow more.");
	if(pc.bRows() > 1) addGhostButton(1,"Remove Row",gooRemoveBreastRow,undefined,"Remove Row","Remove your bottom-most breast row.");
	else addDisabledGhostButton(1,"Remove Row","Remove Row","You’d look incredibly weird without anything on your chest at all.");
	if(pc.bRows() == 1 && pc.biggestTitSize() < 198) addGhostButton(2,"ExpandBoobs",gooExpandBreastsMenu,undefined,"Expand Breasts","Make your row of breasts larger.\n\n<b>" + gooExpandBreastsCost(0) + " mLs Biomass</b>");
	else if(pc.smallestTitSize() < 198) addGhostButton(2,"ExpandBoobs",gooExpandBreastsMenu,undefined,"Expand Breasts","Make a single row of breasts larger.");
	else addDisabledGhostButton(2,"ExpandBoobs","Expand Breasts","You can’t make your breasts any larger without straining the limits of your cohesion.");
	if(pc.bRows() == 1 && pc.biggestTitSize() >= 1) addGhostButton(3,"ShrinkBoobs",gooShrinkBreastsMenu,undefined,"Shrink Boobs","Make your row of breasts smaller.");
	else if(pc.biggestTitSize() >= 1) addGhostButton(3,"ShrinkBoobs",gooShrinkBreastsMenu,undefined,"Shrink Boobs","Make a single row of breasts smaller.");
	else addDisabledGhostButton(3,"ShrinkBoobs","Shrink Boobs","You cannot make your breasts any smaller.");
	if(gooBiomass() < 300) addDisabledGhostButton(5,"Add Nipples","Add Nipples","You don’t have enough biomass for that.\n\n<b>300 mLs Biomass</b>");
	if(pc.nipplesPerBreast < 4) addGhostButton(5,"Add Nipples",gooAddNipples,undefined,"Add Nipples","Add another nipple to every breast.\n\n<b>300 mLs Biomass</b>");
	else addDisabledGhostButton(5,"Add Nipples","Add Nipples","You don’t think you could handle having any more nipples.");
	if(pc.nipplesPerBreast > 1) addGhostButton(6,"Remove Nip",gooRemoveNipples,undefined,"Remove Nipples","Remove a nipple from each of your breasts.\n\n<b>225 mLs Biomass Gain</b>");
	else addDisabledGhostButton(6,"Remove Nip","Remove Nip","You cannot remove any more nipples. Breasts without even a single nip would look quite strange. Too strange, even for you.\n\n<b>225 mLs Biomass Gain</b>");
	if(gooBiomass() >= 100) addGhostButton(7,"Widen Nips",widenGooNipples,undefined,"Widen Nipples","Widen the areola of your [pc.nipples].\n\n<b>100 mLs Biomass</b>");
	else addDisabledGhostButton(7,"Widen Nips","Widen Nipples","You don’t have enough biomass to widen your nipples.\n\n<b>100 mLs Biomass</b>");
	if(pc.nippleWidthRatio >= 1) addGhostButton(8,"Narrow Nips",narrowGooNips,undefined,"Narrow Nipples","Make your nipples narrower.\n\n<b>75 mLs Biomass Gain</b>");
	else addDisabledGhostButton(8,"Narrow Nips","Narrow Nipples","You can’t make your nipples any narrower.\n\n<b>75 mLs Biomass Gain");

	if(gooBiomass() >= 100) addGhostButton(10,"LengthenNips",lengthenGooNips,undefined,"Lengthen Nipples","Lengthen the tips of your [pc.nipples].\n\n<b>100 mLs Biomass</b>");
	else addDisabledGhostButton(10,"LengthenNips","Lengthen Nipples","You don’t have enough biomass to lengthen your nipples.\n\n<b>100 mLs Biomass</b>");
	if(pc.nippleLengthRatio >= 1) addGhostButton(11,"Shorten Nips",shortenGooNips,undefined,"Shorten Nipples","Shorten the tips of your [pc.nipplesNoun].\n\n<b>75 mLs Biomass Gain</b>");
	else addDisabledGhostButton(11,"Shorten Nips","Shorten Nipples","You cannot make your [pc.nipplesNoun] any shorter.\n\n<b>75 mLs Biomass Gain</b>");
	addGhostButton(4,"Nip Type",nippleTypeGooMenu,undefined,"Nip Type","Change what type of nipples you will have.");
	if(pc.hasDickNipples()) 
	{
		if(gooBiomass() >= pc.totalNipples() * 25) addGhostButton(9,"DickNipType",dickNippleGooCustomizer,undefined,"Dick Nipple Type","Change the type of penis that your dick-nipples resemble.\n\n<b>" + pc.totalNipples() * 25 + " mLs Biomass</b>");
		else addDisabledGhostButton(9,"DickNipType","Dick Nipple Type","You don’t have enough biomass to change what type of dick-nipples you’re sporting.\n\n<b>" + pc.totalNipples() * 25 + " mLs Biomass</b>");
	}
	else addDisabledGhostButton(9,"DickNipType","Dick Nipple Type","You don’t have any dick-nipples to customize.");
	addGhostButton(14,"Back",gooShiftMenu);
}

public function dickNippleGooCustomizer():void
{
	clearOutput2();
	output2("What type of dick-nipples would you like to have?");
	boobStuff(pc);
	showBiomass();
	clearGhostMenu();
	var cTypes:Array = [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_SNAKE, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_VULPINE];
	// Unlockables
	if(flags["MET_SERA"] != undefined)
		cTypes.push(GLOBAL.TYPE_DEMONIC);
	if(CodexManager.entryViewed("Venus Pitchers") || CodexManager.entryViewed("Cockvines"))
		cTypes.push(GLOBAL.TYPE_TENTACLE);
	if(CodexManager.entryViewed("Zil"))
		cTypes.push(GLOBAL.TYPE_BEE);
	if(CodexManager.entryViewed("Fanfir") || CodexManager.entryViewed("The Dragon's Hoard"))
		cTypes.push(GLOBAL.TYPE_DRACONIC);
	if(CodexManager.entryViewed("Gabilani"))
		cTypes.push(GLOBAL.TYPE_GABILANI);
	
	var newType:Number = 0;
	var btnName:String = "";
	for(var x:int = 0; x < cTypes.length; x++)
	{
		newType = cTypes[x];
		if(newType == GLOBAL.TYPE_HUMAN) btnName = "Terran";
		else if(newType == GLOBAL.TYPE_SNAKE) btnName = "Snake-like";
		else if(newType == GLOBAL.TYPE_BEE) btnName = "Zil";
		else btnName = GLOBAL.TYPE_NAMES[newType];
		if(pc.dickNippleType != newType) addGhostButton(x,btnName,actuallyCustomizeGooDickNipples,newType);
		else addDisabledGhostButton(x,btnName,btnName,"Your dick-nipples are already this type.");
	}
	
	addGhostButton(14,"Back",gooChestCustomizer);
}


public function actuallyCustomizeGooDickNipples(arg:int = 0):void
{
	clearOutput2();
	//HumanWang
	//Horsecock
	//Dogdick
	//Catdick
	//EVERYTHING ELSE
	output2("You concentrate and your [pc.dickNipples] emerge from their nipple-sheaths, erect and proud. Focusing again, they each begin to quake, then shift, and morph into the new shape you’ve committed to memory. Once complete, you observe your phallic nipples with satisfaction.");
	output2(" <b>You now have " + (GLOBAL.TYPE_NAMES[arg]).toLowerCase() + " dick-nipples!</b>");
	pc.dickNippleType = arg;
	gooBiomass(-1 * (pc.totalNipples() * 25));
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

public function nippleTypeChangeCost(target:int = 0):Number
{
	var cost:Number = 0;
	for(var i:int = 0; i < pc.bRows(); i++)
	{
		//If we got a change on our hands.
		if(pc.breastRows[i].nippleType != target)
		{
			//Dicknipples cost - 150 biomass.
			if(target == GLOBAL.NIPPLE_TYPE_DICK) cost += pc.breastRows[i].breasts * pc.nipplesPerBreast * 150;
			//Nipplecunts cost - 75 biomass
			else if(target == GLOBAL.NIPPLE_TYPE_FUCKABLE) cost += pc.breastRows[i].breasts * pc.nipplesPerBreast * 75;
			//Lipples cost - 200 biomass.
			else if(target == GLOBAL.NIPPLE_TYPE_LIPPLES) cost += pc.breastRows[i].breasts * pc.nipplesPerBreast * 200;
			//Inverted cost - 50 biomass.
			else if(target == GLOBAL.NIPPLE_TYPE_INVERTED) cost += pc.breastRows[i].breasts * pc.nipplesPerBreast * 50;
			//Normals cost - 100 biomass.
			else if(target == GLOBAL.NIPPLE_TYPE_NORMAL) cost += pc.breastRows[i].breasts * pc.nipplesPerBreast * 50;
		}
	}
	return cost;
}

public function canGooNippleChange(target:int):Boolean
{
	for(var i:int = 0; i < pc.bRows(); i++)
	{
		//If any nipples are different, you can TF 'em
		if(pc.breastRows[i].nippleType != target) return true;
	}
	//All the same? FUCK OFF!
	return false;
}

public function nippleTypeGooMenu():void
{
	clearOutput2();
	output2("What type of nipples would you like to have?")
	boobStuff(pc);
	showBiomass();
	clearGhostMenu();
	if(canGooNippleChange(GLOBAL.NIPPLE_TYPE_NORMAL))
	{
		if(nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_NORMAL) <= gooBiomass()) addGhostButton(0,"Normal",nippleGooGetsTypeChanged,GLOBAL.NIPPLE_TYPE_NORMAL,"Normal","Change your nipples to be normal-looking.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_NORMAL) + " mLs Biomass</b>");
		else addDisabledGhostButton(0,"Normal","Normal","You don’t have enough biomass to make all your nipples normal.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_NORMAL) + " mLs Biomass</b>");
	}
	else addDisabledGhostButton(0,"Normal","Normal","All your nipples are already normal.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_NORMAL) + " mLs Biomass</b>");
	//Inverted
	if(canGooNippleChange(GLOBAL.NIPPLE_TYPE_INVERTED))
	{
		if(nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_INVERTED) <= gooBiomass()) addGhostButton(1,"Inverted",nippleGooGetsTypeChanged,GLOBAL.NIPPLE_TYPE_INVERTED,"Inverted","Change your nipples to be inverted.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_INVERTED) + " mLs Biomass</b>");
		else addDisabledGhostButton(1,"Inverted","Inverted","You don’t have enough biomass to make all your nipples inverted.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_INVERTED) + " mLs Biomass</b>");
	}
	else addDisabledGhostButton(1,"Inverted","Inverted","All your nipples are already inverted.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_INVERTED) + " mLs Biomass</b>");
	//Fuckable
	if(canGooNippleChange(GLOBAL.NIPPLE_TYPE_FUCKABLE))
	{
		if(nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_FUCKABLE) <= gooBiomass()) addGhostButton(2,"Fuckable",nippleGooGetsTypeChanged,GLOBAL.NIPPLE_TYPE_FUCKABLE,"Fuckable","Change your nipples to be fuckable.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_FUCKABLE) + " mLs Biomass</b>");
		else addDisabledGhostButton(2,"Fuckable","Fuckable","You don’t have enough biomass to make all your nipples fuckable.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_FUCKABLE) + " mLs Biomass</b>");
	}
	else addDisabledGhostButton(2,"Fuckable","Fuckable","All your nipples are already fuckable.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_FUCKABLE) + " mLs Biomass</b>");
	//Lipples
	if(canGooNippleChange(GLOBAL.NIPPLE_TYPE_LIPPLES))
	{
		if(nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_LIPPLES) <= gooBiomass()) addGhostButton(3,"Lipples",nippleGooGetsTypeChanged,GLOBAL.NIPPLE_TYPE_LIPPLES,"Lipples","Change your nipples to be fuckable sets of lips.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_LIPPLES) + " mLs Biomass</b>");
		else addDisabledGhostButton(3,"Lipples","Lipples","You don’t have enough biomass to make all your nipples fuckable sets of lips.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_LIPPLES) + " mLs Biomass</b>");
	}
	else addDisabledGhostButton(3,"Lipples","Lipples","All your nipples are already fuckable sets of lips.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_LIPPLES) + " mLs Biomass</b>");
	//Dicknipples
	if(canGooNippleChange(GLOBAL.NIPPLE_TYPE_DICK))
	{
		if(nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_DICK) <= gooBiomass()) addGhostButton(4,"DickNipples",nippleGooGetsTypeChanged,GLOBAL.NIPPLE_TYPE_DICK,"Dick Nipples","Change your nipples to be dick-nipples.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_DICK) + " mLs Biomass</b>");
		else addDisabledGhostButton(4,"DickNipples","Dick Nipples","You don’t have enough biomass to make all your nipples dick-nipples.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_DICK) + " mLs Biomass</b>");
	}
	else addDisabledGhostButton(4,"DickNipples","Dick Nipples","All your nipples are already dick-nipples.\n\n<b>" + nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_DICK) + " mLs Biomass</b>");
	addGhostButton(14,"Back",gooChestCustomizer);
}

public function nippleGooGetsTypeChanged(target:int):void
{
	clearOutput2();
	//Normal nipples
	if(target == GLOBAL.NIPPLE_TYPE_NORMAL)
	{
		//Spend biobutts
		gooBiomass(-1 * nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_NORMAL));
		output2("You palm your chest and close your eyes, willing your unusual nipples to transform into the kind of pert, pebbly nipples that are all too common on most terrans and ausar. <b>You have normal nipples once more!</b>");
	}
	else if(target == GLOBAL.NIPPLE_TYPE_INVERTED)
	{
		//Spend biobutts
		gooBiomass(-1 * nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_INVERTED));
		if(pc.hasFuckableNipples()) output2("You close up the passages inside your [pc.nipples] and reform their normal tips, leaving them delightfully inverted. When you get horny enough, they’ll be sure to pop back out.");
		else output2(pc.mf("Chuckling","Giggling") + " to yourself, you push your [pc.nipples] back into themselves, willing them to turn into simple ‘innies.’ Of course, when you get sufficiently horny, they’ll pop right back out.");
		output2(" <b>Aren’t inverted nipples fun?</b>");
	}
	else if(target == GLOBAL.NIPPLE_TYPE_FUCKABLE)
	{
		gooBiomass(-1 * nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_FUCKABLE));
		output2("Gently playing with your [pc.nipples], you push them back into your forgiving chest, willing them to deepen, to clutch at your fingers and develop into the sensory powerhouses that the deserve to be. You gasp and moan when fluid dribbles out around your digits, nearly creaming yourself to the sensation of fingering <b>your brand new nipple-cunts.</b>");
	}
	else if(target == GLOBAL.NIPPLE_TYPE_LIPPLES)
	{
		gooBiomass(-1 * nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_LIPPLES));
		output2("Reinforcing your [pc.nipples] with fresh biomass, you will them into malleability. Then, with gentle squeezes, you sculpt them into a pair of puckered, almost smiling lips, wrapped around a nerve-line passage that’s sure to please. <b>You’ve given yourself lipples,</b> perfect for exotic fun.");
	}
	else if(target == GLOBAL.NIPPLE_TYPE_DICK)
	{
		gooBiomass(-1 * nippleTypeChangeCost(GLOBAL.NIPPLE_TYPE_DICK));
		output2("You have to close your eyes and focus for this one. Willing your old [pc.nipples] to melt down into simple, darker colored blobs, you reform them into normal-looking tips - at least on the surface. Below, you sculpt sensitive layers of flesh, each ready to fill with whatever passes for your blood these days and expand into full tumescence. The nipples above will part around them when you let them out, acting more like a sheath than lactic organs they once were.\n\nYou build up internal testes behind <b>your new dick-nipples</b> in order to let them properly cum, but leave the milk ducts surrounding them intact. You should be able to get milked normally, if you ever want to, so long as you can keep your tit-mounted cocks from surging out of containment.");
		if(pc.dickNippleMultiplier < 5) pc.dickNippleMultiplier = 5;
	}
	//Change all da nips!
	for(var i:int = 0; i < pc.bRows(); i++)
	{
		pc.breastRows[i].nippleType = target;
		if(target == GLOBAL.NIPPLE_TYPE_LIPPLES) pc.breastRows[i].clearAreolaFlags();
	}
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

//Actually widen 'dem puppies
public function widenGooNipples():void
{
	clearOutput2();
	var totalNips:int = pc.totalNipples();
	output2("You grab hold of the edges of ");
	if(totalNips > 2) output2("two of ");
	output2("your [pc.nipples] and pull, stretching the areolae wider. You gasp in mixed pleasure and pain, watching your malleable flesh adjust to its new shape. Your body’s alien flexibility never ceases to amaze.");
	if(totalNips > 2) output2(" You repeat the process until every single teat-topper is proportionally correct.");
	if(pc.nippleWidth(x) <= 1) pc.nippleWidthRatio += 0.5;
	else pc.nippleWidthRatio += 0.25;
	gooBiomass(-100);
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}
//Actually narrow 'dem puppies
public function narrowGooNips():void
{
	clearOutput2();
	var totalNips:int = pc.totalNipples();
	output2("You grab hold of the edges of ");
	if(totalNips > 2) output2("two of ");
	output2("your [pc.nipples] and pinch, forcing the edges of the areolae inward. You gasp in mixed pleasure and pain, watching your malleable flesh adjust to its new shape. Your body’s alien flexibility never ceases to amaze.");
	if(totalNips > 2) output2(" You repeat the process until the whole set is appropriate matched.");
	if(pc.nippleWidth(x) <= 1) pc.nippleWidthRatio -= 0.5;
	else pc.nippleWidthRatio -= 0.25;
	gooBiomass(+75);
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

public function lengthenGooNips():void
{
	clearOutput2();
	var totalNips:int = pc.totalNipples();
	output2("You grab hold of ");
	if(totalNips > 2) output2("two of ");
	output2("your [pc.nipples] and give them a tug. The mixture of pleasure and pain draws a gasp from your lips, and better still, when you let go, they retain the extra length.");
	if(totalNips > 2) output2(" You repeat the process until the extras match up with the first batch.");
	if(pc.nippleLength(x) <= 1.5) pc.nippleLengthRatio += 0.5;
	else pc.nippleLengthRatio += 0.25;
	gooBiomass(-100);
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

public function shortenGooNips():void
{
	clearOutput2();
	var totalNips:int = pc.totalNipples();
	output2("Your [pc.nipples] are entirely too distracting, always bulging forward and getting in the way! You push back on their tips, gingerly squishing them partway back into your body. You can feel the biomass bubble through you as the excess flesh is converted back into goopy potential.");
	if(totalNips > 2) output2(" You make sure to give the rest of your [pc.nipplesNoun] equal treatment. Can’t have any looking disproportional, can you?")
	if(pc.nippleLength(x) <= 1.5) pc.nippleLengthRatio -= 0.5;
	else pc.nippleLengthRatio -= 0.25;
	gooBiomass(75);
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

//300 biomass
public function gooAddNipples():void
{
	clearOutput2();
	if(pc.nipplesPerBreast == 1) 
	{
		output2("One nipple per ");
		if(pc.biggestTitSize() < 1) output2("pectoral");
		else output2("breast");
		output2(" hardly seems fitting. You blink your eyes and focus, and when you look back down, <b>you’ve doubled your nipples.</b>");
	}
	else if(pc.nipplesPerBreast == 2) 
	{
		output2("Having two nipples on each of your ");
		if(pc.biggestTitSize() < 1) output2("pectoral");
		else output2("breast");
		output2(" looks a little... off. A third one would help round things out for sure. Tweaking your existing [pc.nipples], you direct flows of biomass into your [pc.fullChest], gasping when at the white-hot pleasure of new nipples being born. <b>You have three [pc.nipples] on every breast.</b>");
	}
	else
	{
		output2("Triple-nipples are pretty awesome, but what’s better than having a quartet of teats? You pinch the flesh alongside your current tit-tips and visualize it as a perfect copy of the others, moaning when you feel the goo solidify into another perfect nip.");
	}
	pc.nipplesPerBreast++;
	gooBiomass(-300);
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

//225 biomass back
public function gooRemoveNipples():void
{
	clearOutput2();
	if(pc.nipplesPerBreast == 2) output2("Deciding double-nipples are better in your imagination than in real life, you glare the offending teats and watch them shrink away to nothing, leaving you with a single [pc.nipple] per breast once more.");
	else if(pc.nipplesPerBreast == 3) output2("You close your eyes and gently touch your triple-nipples, pushing one part of the triumvirate down in order to leave you with doubled sets. Isn’t being made of goo wonderful?");
	else output2("You will your quad nipples away, diminishing a quarter of their over-sensitive size and leaving you with triple nips.");
	pc.nipplesPerBreast--;
	gooBiomass(225);
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

public function gooShrinkBreastsMenu():void
{
	clearOutput2();
	output2("Which row will you shrink?");
	boobStuff(pc);
	output2("\n");
	clearGhostMenu();
	var boobCost:Number = 0;
	//Try to force single boob reduction
	if(pc.bRows() == 1 && pc.biggestTitSize() >= 1)
	{
		//Determine boobcost
		if(pc.breastRows[0].breastRating() < 6) boobCost = (Math.round((boobsVolumeCheesed(pc.breastRows[0].breastRatingRaw) - boobsVolumeCheesed(pc.breastRows[0].breastRatingRaw-1)) * 0.75)) * pc.breastRows[0].breasts;
		else boobCost = (Math.round((boobsVolumeCheesed(pc.breastRows[0].breastRatingRaw) - boobsVolumeCheesed(pc.breastRows[0].breastRatingRaw-2)) * 0.75)) * pc.breastRows[0].breasts;
		//Let's do it.
		shrinkASpecificTitRow(0);
		return;
	}
	for(var x:int = 0; x < pc.bRows(); x++)
	{
		//Small boobs need a smaller boost to increase a cup size than bigger tiddies.
		if(pc.breastRows[x].breastRating() < 6) boobCost = (Math.round((boobsVolumeCheesed(pc.breastRows[x].breastRatingRaw) - boobsVolumeCheesed(pc.breastRows[x].breastRatingRaw-1)) * 0.75)) * pc.breastRows[x].breasts;
		else boobCost = (Math.round((boobsVolumeCheesed(pc.breastRows[x].breastRatingRaw) - boobsVolumeCheesed(pc.breastRows[x].breastRatingRaw-2)) * 0.75)) * pc.breastRows[x].breasts;
		//Display costs
		output2("\n" + (x+1) + ": [pc.breastCupSize " + x + "] - <b>Biomass Gain: </b>" + boobCost + " mLs");
		if(pc.breastRows[x].breastRating() >= 1) addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),shrinkASpecificTitRow,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Row","Shrink this row.\n\n<b>" + boobCost + " mLs Biomass Gain</b>");
		else addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Row","You can’t make this row any smaller.");
	}
	showBiomass();
	addGhostButton(14,"Back",gooChestCustomizer);
}

public function shrinkASpecificTitRow(arg:int = 0):void
{
	clearOutput2();
	if(pc.breastRows[arg].breastRatingRaw >= 1)
	{
		output2("You look down at your chest and silently will your bosom to reduce to its size. Your [pc.breasts " + arg + "] shrink before your eyes, allowing you to reabsorb most of the mass it took to expand them.");
	}
	else 
	{
		output2("There’s barely any biomass fortifying your chest, but you drain it away all the same, ");
		if(pc.breastRows[arg].breastRating() >= 2) output2("minimizing the size of your tits. If you want to get rid of them entirely, you’ll need to deal with whatever else is keeping them so swollen.");
		else output2("leaving you with a nice set of pectorals for your trouble.");
	}
	//Figure out refund amount.
	var boobCost:Number = 0;
	if(pc.breastRows[arg].breastRating() < 6) boobCost = (Math.round((boobsVolumeCheesed(pc.breastRows[arg].breastRatingRaw) - boobsVolumeCheesed(pc.breastRows[arg].breastRatingRaw-1)) * 0.75)) * pc.breastRows[arg].breasts;
	else boobCost = (Math.round((boobsVolumeCheesed(pc.breastRows[arg].breastRatingRaw) - boobsVolumeCheesed(pc.breastRows[arg].breastRatingRaw-2)) * 0.75)) * pc.breastRows[arg].breasts;
	gooBiomass(boobCost);
	if(pc.breastRows[arg].breastRating() < 6) pc.breastRows[arg].breastRatingRaw--;
	else pc.breastRows[arg].breastRatingRaw -= 2;

	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

public function gooExpandBreastsCost(idx:int = 0):Number
{
	if(pc.breastRows[idx].breastRating() < 5) return (Math.round(boobsVolumeCheesed(pc.breastRows[idx].breastRatingRaw+1) - boobsVolumeCheesed(pc.breastRows[idx].breastRatingRaw))) * pc.breastRows[idx].breasts;
	return (Math.round(boobsVolumeCheesed(pc.breastRows[idx].breastRatingRaw+2) - boobsVolumeCheesed(pc.breastRows[idx].breastRatingRaw))) * pc.breastRows[idx].breasts;
}
public function gooExpandBreastsMenu():void
{
	clearOutput2();
	clearGhostMenu();
	var boobCost:Number = 0;
	//Try to force expansion of a single row if only 1!
	if(pc.bRows() == 1 && pc.biggestTitSize() < 198)
	{
		//Determine boobcost
		boobCost = gooExpandBreastsCost(0);
		//If we can afford, skip menu BS.
		if(gooBiomass() >= boobCost)
		{
			expandASpecificTitRow(0);
			return;
		}
		else
		{
			output2("No matter how hard you try, you can’t muster up anything more than an empty feeling inside yourself. It looks like you’ll need more biomass for this.");
			addGhostButton(0,"Next",gooChestCustomizer);
			return;
		}
	}
	output2("Which row will you expand?");
	boobStuff(pc);
	output2("\n");
	for(var x:int = 0; x < pc.bRows(); x++)
	{
		//Small boobs need a smaller boost to increase a cup size than bigger tiddies.
		boobCost = gooExpandBreastsCost(x);
		//Display costs
		output2("\n" + (x+1) + ": [pc.breastCupSize " + x + "] - <b>Biomass cost: </b>" + boobCost + " mLs");
		if(gooBiomass() >= boobCost) addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),expandASpecificTitRow,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Row","Enlarge this row.\n\n<b>" + boobCost + " mLs Biomass</b>");
		else addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Row","You don’t have enough biomass to enlarge this row.\n\n<b>" + boobCost + " mLs Biomass</b>");
	}
	showBiomass();
	addGhostButton(14,"Back",gooChestCustomizer);
}

public function expandASpecificTitRow(arg:int):void
{
	clearOutput2();
	if(silly)
	{
		output2("A somewhat silly idea takes you, and you inhale, sucking in a huge lungful of air. Then, placing your thumb in your mouth, you blow, pretending that the extra air is flowing into your chest, effortlessly inflating your mammaries. In reality, your visualization has produced the same effect, spilling biomass instead of air into your expanding boobs.");
	}
	else
	{
		//Flat to A-cups.
		if(pc.breastRows[arg].breastRating() < 1) output2("Taking a deep breath, you look down and focus on your chest, willing your biomass to flow up into your pectorals. Slippery-smooth flesh bulges, deforming your muscular chest into rounded, teardrop-shaped half-globes. <b>The A-cups look quite good on you.</b>");
		//A -> B
		else if(pc.breastRows[arg].breastRating() < 2) output2("Placing your hands on the undersides of your [pc.breasts " + arg + "], you will your pliable flesh to pour into them. Jiggly goo floods into your chest right on cue, filling your palms and turning your tiny teardrops into <b>bouncy B-cups.</b>")
		//B -> C
		else if(pc.breastRows[arg].breastRating() < 3) output2("Redistributing your body is almost second nature at this point, and your [pc.breasts " + arg + "] begin expanding before you even finish thinking about it. Reaching up to cup them, you marvel at the expanding fullness of your chest, the way your boobs have grown to fill your hands with bouncing, jiggly weight.");
		//C -> D
		else if(pc.breastRows[arg].breastRating() < 4) output2("Your chest needs to be bigger. With a lascivious grin, you plant your hands on your hips and thrust your chest forward, relishing the feeling of your center of mass shifting forward. Watching the curves slowly swell and then bounce with your every motion is intoxicating. Could you go bigger, perhaps?");
		//D -> DD
		else if(pc.breastRows[arg].breastRating() < 5) output2("Your breasts are currently... adequate, for an unmodded terran, but they can be bigger. Cupping them, you give your girls a squeeze and very direct command: grow. Biomass flows into them immediately, plumping the cutely-jiggling half-spheres into lush orbs, thick squeezable breasts whose bounciness could win competitions.")
		//Over DD to pretty fuckin' big
		else if(pc.breastRows[arg].breastRating() < 15) 
		{
			output2("Fluid flows into your [pc.breasts " + arg + "] on command, filling the soft, squeezable orbs with yet more mass, swelling them into lewder, rounder tits. Squeezing them, you struggle to suppress a moan at the erotic, infinitely enjoyable feeling of expanding your chest.");
			pc.lust(10);
		}
		//Pretty fuckin' big to huge
		else if(pc.breastRows[arg].breastRating() < 30) output2("Some might say that top-heavy is an apt description for a [pc.boyGirl] like you, but that’s just the start. You massage the bouncy, slick surface of your tits, openly groping them as you direct more of your internal mass reserves to fill them, to add to their wiggle and jiggle. You’ve got huge, brazen boobs, and you’ve made them bigger yet. Maybe you should do it again?");
		//Huge to megahuge
		else output2("More. You dig your fingers into your [pc.breasts " + arg + "], sinking your digits deep into the forgiving, gooey orbs, rolling the hefty mounds back and forth as you pump more heavy goo into their capacious interiors. It feels good, stretching the membrane of your “skin” taut, then letting it loose enough to allow the barest hint of natural sag.");
	}
	var boobCost:Number = gooExpandBreastsCost(arg);
	//Spend the biomass.
	gooBiomass(-1 * boobCost);
	//Actually increase the boobiliciousness
	if(pc.breastRows[arg].breastRating() < 5) pc.breastRows[arg].breastRatingRaw++;
	else pc.breastRows[arg].breastRatingRaw += 2;
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}


public function gooGrowNewBreastRow():void
{
	clearOutput2();
	output2("Grabbing hold of the blank space below ");
	if(pc.bRows() > 1) 
	{
		if(pc.breastRows[pc.bRows()-1].breastRating() < 1) output2(" your lowest row of [pc.nipples " + (pc.bRows()-1) + "]");
		else output2(" your lowest row of [pc.breasts " + (pc.bRows() -1) + "]");
	}
	else 
	{
		if(pc.breastRows[0].breastRating() < 1) output2("your [pc.nipples]");
		else output2("your [pc.breasts]");
	}
	output2(", you give your supple, yielding goo-flesh a tug. Right on cue, " + num2Text(pc.nipplesPerBreast * pc.breastRows[pc.bRows()-1].breasts) + " slight bulges form beneath your fingers, new nipples that ape the appearance of those above. There’s not much breast built up below, just enough to form a foundation for future growth.");
	output2(" <b>You have " + num2Text(pc.bRows()+1) + " rows of breasts.</b>");
	pc.createBreastRow();
	pc.breastRows[pc.bRows()-1].breasts = pc.breastRows[pc.bRows()-2].breasts;
	pc.breastRows[pc.bRows()-1].nippleType = pc.breastRows[pc.bRows()-2].nippleType;
	gooBiomass(-200);
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

public function boobsVolumeCheesed(boobRating:Number):Number
{
	var amount:Number = Math.round(4 / 3 * Math.PI * boobRating/2 * boobRating/2 * boobRating/2) / 2;
	return amount;
}

public function gooRemoveBreastRow():void
{
	clearOutput2();
	output2("Grabbing hold of the bottom edge of your chest, you push your palms flat against the [pc.nipples " + (pc.bRows()-1) + "] and concentrate on removing the extra row from your body. There’s a brief, answering tingle, followed by the satisfaction of absorbed biomass.");
	output2(" <b>You have " + num2Text(pc.bRows()-1) + " row");
	if(pc.bRows() > 2) output2("s");
	output2(" of breasts.</b>")
	gooBiomass(150);
	if(pc.breastRows[pc.bRows()-1].breastRatingRaw >= 1) gooBiomass(Math.round(boobsVolumeCheesed(pc.breastRows[pc.bRows()-1].breastRatingRaw) * 0.75 * pc.breastRows[pc.bRows()-1].breasts));
	pc.removeBreastRow(pc.bRows()-1,1);
	
	clearGhostMenu();
	addGhostButton(0,"Next",gooChestCustomizer);
}

//Crotch
//Copy past crotch display from Appearance screen.
public function gooCrotchCustomizer():void
{
	clearOutput2();
	output2("Do you will your body to change anything?");
	crotchStuff(pc);
	showBiomass();
	//[Penis] [Vagina] [Balls] [Misc]
	clearGhostMenu();
	addGhostButton(0,"Penis",gooCockRootMenu,undefined,"Penis","Modify phallus parameters.");
	addGhostButton(1,"Vagina",vaginaGooRootMenu,undefined,"Vagina","Modify vaginal parameters.");
	addGhostButton(2,"Balls",gooBallsMenu,undefined,"Balls","Modify testicular parameters.");
	addGhostButton(14,"Back",gooShiftMenu);
}

//Penis
//Show cocks desc
public function gooCockRootMenu():void
{
	clearOutput2();
	output2("What would you like to do?");
	crotchStuff(pc);
	showBiomass();
	//[Grow One] [Reshape] [Resize][Remove 1][Remove All]
	clearGhostMenu();
	if(gooBiomass() >= 500) 
	{
		if(pc.cockTotal() < 10)
		{
			if(!pc.createCockUnlocked(pc.cockTotal() + 1)) addDisabledGhostButton(0,"Grow One","Grow One","Something is preventing you from growing a penis.");
			else addGhostButton(0,"Grow One",growANewGooCock,undefined,"Grow One","Grow a new, gooey penis.\n\n<b>500 mLs Biomass</b>");
		}
		else addDisabledGhostButton(0,"Grow One","Grow One","There’s no room for any more penises!");
	}
	else addDisabledGhostButton(0,"Grow One","Grow One","You don’t have enough biomass for that.\n\n<b>500 mLs Biomass</b>");

	if(pc.hasCock()) 
	{
		if(gooBiomass() >= 100 && pc.cockTotal() == 1 && pc.cocks[0].hasFlag(GLOBAL.FLAG_GOOEY)) addGhostButton(1,"Reshape",reshapeACaaaawk,undefined,"Reshape","Change the shape of your penis.\n\n<b>100 mLs Biomass</b>");
		else if(gooBiomass() >= 100) addGhostButton(1,"Reshape 1",reshapeACaaaawk,undefined,"Reshape One Cock","Change the shape of a penis.\n\n<b>100 mLs Biomass</b>");
		else addDisabledGhostButton(1,"Reshape","Reshape","You lack sufficient biomass to reshape your penis.\n\n<b>100 mLs Biomass</b>");
		if(pc.cockTotal() == 1 && pc.cocks[0].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			var cockCost:Number = costGooCockLengthen(0, 2);
			addGhostButton(2,"Lengthen",lengthenGooCock,undefined,"Lengthen","Put some biomass to work making your endowment longer.\n\n<b>" + cockCost + " mLs Biomass</b>");
			addGhostButton(3,"Shorten",shortenADick,undefined,"Shorten","Shorten your penis and reclaim some of its biomass.");
			if(!pc.removeCockUnlocked(0, 1)) addDisabledGhostButton(5,"Remove","Remove","Something is preventing your penis from being removed.");
			else addGhostButton(5,"Remove",removeGooCockRoot,undefined,"Remove","Remove your penis, returning it to plain goo.");
		}
		else
		{
			addGhostButton(2,"Lengthen 1",lengthenGooCock,undefined,"Lengthen One Cock","Put some biomass to work making an endowment of your choice longer.");
			addGhostButton(3,"Shorten 1",shortenADick,undefined,"Shorten One Cock","Shorten a penis and reclaim some of its biomass.");
			addGhostButton(5,"Remove 1",removeGooCockRoot,undefined,"Remove One Cock","Remove one of your penises, returning it to plain goo.");
		}
		if(pc.cockTotal() > 1)
		{
			var numGooCocks:Number = 0;
			for(var x:int = 0; x < pc.cockTotal(); x++)
			{
				if(pc.cocks[x].hasFlag(GLOBAL.FLAG_GOOEY)) numGooCocks++;
			}
			if(!pc.removeCocksUnlocked()) addDisabledGhostButton(6,"Remove All","Remove All","Something is preventing your penises from being removed all the same time.");
			else if(pc.cockTotal() == numGooCocks) addGhostButton(6,"Remove All",removeAllGooCocks,undefined,"Remove All Cocks","Remove all penises.");
			else addDisabledGhostButton(6,"Remove All","Remove All","Your penises aren’t all made of goo and cannot be removed at the same time.");
		}
		else addDisabledGhostButton(6,"Remove All","Remove All","You don’t have multiple goo penises to try this.");
	}
	else
	{
		addDisabledGhostButton(1,"Reshape","Reshape","You have no penis to reshape.");
		addDisabledGhostButton(2,"Lengthen","Lengthen","You have no penis to lengthen.");
		addDisabledGhostButton(3,"Shorten","Shorten","You have no penis to shorten.");
		addDisabledGhostButton(5,"Remove 1","Remove One","You don’t have a penis to remove.");
		addDisabledGhostButton(6,"Remove All","Remove All","You don’t have a penis to remove.");
	}
	addGhostButton(14,"Back",gooCrotchCustomizer);
}

public function gooBallsMenu():void
{
	clearOutput2();
	output2("What would you like to change about your ");
	if(pc.balls == 0) output2("lack of balls?");
	else if(pc.balls == 1) output2("single testicle?");
	else output2("balls?");
	crotchStuff(pc);
	showBiomass();
	if(pc.balls < 6)
	{
		if(gooBiomass() >= nutGrowCost()) addGhostButton(0, "Grow Testicle", growSomeGooBalls,undefined,"Grow Testicle","Grow a new testicle.\n\n<b>" + nutGrowCost() + " mLs Biomass</b>");
		else addDisabledGhostButton(0,"Grow Testicle","Grow Testicle","You do not have enough biomass for this.\n\n<b>" + nutGrowCost() + " mLs Biomass</b>");
	}
	else addDisabledGhostButton(0,"Grow Testicle","Grow Testicle","You have as many testicles as possible.");
	if(pc.balls == 1 && (pc.hasStatusEffect("Mimbrane Balls") || 9999 == 0)) addGhostButton(1,"Remove",removeATesticle,undefined,"Remove","Something is preventing you from removing your only testicle.");
	else if(pc.balls == 1) addGhostButton(1,"Remove",removeATesticle,undefined,"Remove","Remove your testicle.");
	else if(pc.balls > 0) addGhostButton(1,"Remove 1",removeATesticle,undefined,"Remove One","Remove a testicle.");
	else addDisabledGhostButton(1,"Remove","Remove","You have no testicles to remove.");
	if(pc.balls > 0)
	{
		if(gooBiomass() >= nutExpansionCost()) addGhostButton(2,"Expand Balls",expandoNuts,undefined,"Expand Balls","Expand the diameter of your balls by approximately one inch.\n\n<b>" + nutExpansionCost() + " mLs Biomass</b>");
		else addDisabledGhostButton(2,"Expand Balls","Expand Balls","You don’t have the necessary biomass to expand your testicular endowments.\n\n<b>" + nutExpansionCost() + " mLs Biomass</b>");
		if(pc.ballSizeRaw > 0.5) addGhostButton(3,"Shrink Balls",nutShrinkGo,undefined,"Shrink Balls","Reduce the size of your testicular endowments significantly.");
		else addDisabledGhostButton(3,"Shrink Balls","Shrink Balls","You can’t get any smaller down there!");

		if(pc.hasStatusEffect("Uniball")) addGhostButton(5,"Loosen Sack",tautSackToggle,undefined,"Loosen Sack","Let your nutsack hang a little lower and freer.");
		else if(gooBiomass() >= 100) addGhostButton(5,"Tighten Sack",tautSackToggle,undefined,"Tighten Sack","Tighten up your nutsack into a nice, smooth bulge.\n\n<b>100 mLs Biomass</b>");
		else addDisabledGhostButton(5,"Tighten Sack","Tighten Sack","You don’t have enough biomass to tighten your sack into a nice, smooth bulge.");
		
		if(pc.hasStatusEffect("Special Scrotum"))
		{
			if(pc.statusEffectv1("Special Scrotum") != GLOBAL.FLAG_GOOEY) addGhostButton(6,"Convert Sack",gooSpecialSack,"convert","Convert Sack","Convert your nutsack into goo.");
			else addGhostButton(6,"Revert Sack",gooSpecialSack,"revert","Revert Sack","Remove your nutsack’s special properties.");
		}
	}
	else 
	{
		addDisabledGhostButton(2,"Expand Balls","Expand Balls","You don’t have balls to expand.");
		addDisabledGhostButton(3,"Shrink Balls","Shrink Balls","You don’t have any balls to shrink!");
		addDisabledGhostButton(5,"Sack Options","Sack Options","If you had balls, you could use this button to make your nutsack pull up high and tight or swing low and free.");
	}
	if(isNaN(pc.ballSize()) || pc.balls < 0 || pc.ballDiameter() < 0) addGhostButton(13, "Fix Balls", gooFixBalls, undefined, "Fix Balls", "Something is wrong here... maybe you should fix it?");
	addGhostButton(14,"Back",gooCrotchCustomizer);
}

public function gooFixBalls():void
{
	clearOutput2();
	
	output2("You concentrate hard on some weird anomalies near your crotch. After it bubbles, a feeling of normalcy runs through you. Your crotch anatomy has been corrected!");
	
	if(isNaN(pc.balls) || pc.balls < 0) pc.balls = 0;
	if(isNaN(pc.ballSizeRaw) || pc.ballSize() < 0) pc.ballSizeRaw = 0;
	if(isNaN(pc.ballSizeMod) || pc.ballSize() < 0) pc.ballSizeMod = 0;
	
	clearGhostMenu();
	addGhostButton(0,"Next",gooBallsMenu);
}
public function gooSpecialSack(response:String = "none"):void
{
	clearOutput2();
	
	switch(response)
	{
		case "convert":
			output2("You take a look at your [pc.sack]. Figuring, it looks a little wierd being " + (pc.statusEffectv1("Special Scrotum") == 0 ? "skin-covered, bald" : (GLOBAL.FLAG_NAMES[pc.statusEffectv1("Special Scrotum")]).toLowerCase()) + " and overal not-gooey, you decide to change that.");
			output2("\n\nBeads of goo congregate across the surface of your nutsack until it is covered completely. Then with a little jiggle, your scrotum is fully converted back to goo... however it retains some of its unique properties. You’ll have to try this again if you want to completely get rid of it.");
			
			pc.setStatusValue("Special Scrotum", 1, GLOBAL.FLAG_GOOEY);
			pc.setStatusTooltip("Special Scrotum", "");
			break;
		case "revert":
			output2("While it was good while it lasted, you decide not to keep the abilities of a special scrotum. With some concentration, the insides of your nutsack fizzes like a shaken soda bottle. Then, after all the little bubbles subside, your [pc.balls] feel");
			if(pc.balls == 1) output2("s");
			output2(" a little more normal. Still gooey, but normal.");
			
			pc.removeStatusEffect("Special Scrotum");
			break;
	}
	output2(" Luckily, this change has come at no cost to you!");
	
	clearGhostMenu();
	addGhostButton(0,"Next",gooBallsMenu);
}

//Shrink Down Nuts
//Solve for -1 diameter?
public function nutShrinkCost():Number
{

	//Figure out the new size of circumference in order to increase diameter by 1"
	var newSize:Number = (pc.ballSizeRaw/Math.PI-1) * Math.PI

	//Calc old size.
	var ballRadius:Number = pc.ballSizeRaw/Math.PI/2;
	var volume:Number = Math.round(4/3 * Math.PI * ballRadius * ballRadius * ballRadius);

	
	//Calc new size
	ballRadius = newSize/Math.PI/2;
	var newVolume:Number = Math.round(4/3 * Math.PI * ballRadius * ballRadius * ballRadius);

	//Figure out the difference
	var trueCost:int = volume - newVolume;
	if(trueCost < 10) trueCost = 10;
	//Only get 75% back!
	trueCost = Math.round(trueCost * .75);
	trace("NUTSHRINK PRE VOL: " + volume + " POSTVOL: " + newVolume + " TRUCOST: " + trueCost);
	return (trueCost * pc.balls);
}

public function nutShrinkGo():void
{
	clearOutput2();
	output2("You sag with relief as your body reabsorbs some of the weight from your [pc.sack]. Getting around will certainly be a little easier!");
	gooBiomass(nutShrinkCost());
	pc.ballSizeRaw = (pc.ballSizeRaw/Math.PI-1) * Math.PI;
	//Failsafe!
	if(pc.ballSizeRaw < 0.5) pc.ballSizeRaw = 0.5;
	trace("FINAL ACTUAL VOL: " + pc.ballVolume());
	clearGhostMenu();
	addGhostButton(0,"Next",gooBallsMenu);
}


//Solve for +1 diameter?
public function nutExpansionCost():Number
{
	//Figure out the new size of circumference in order to increase diameter by 1"
	var newSize:Number = (pc.ballSizeRaw/Math.PI+1) * Math.PI

	//Calc old size.
	var ballRadius:Number = pc.ballSizeRaw/Math.PI/2;
	var volume:Number = Math.round(4/3 * Math.PI * ballRadius * ballRadius * ballRadius);
	
	//Calc new size
	ballRadius = newSize/Math.PI/2;
	var newVolume:Number = Math.round(4/3 * Math.PI * ballRadius * ballRadius * ballRadius);

	//Figure out the difference
	var trueCost:int = newVolume - volume;
	if(trueCost < 10) trueCost = 10;
	trace("NUTGROW PRE VOL: " + volume + " POSTVOL: " + newVolume + " TRUCOST: " + trueCost);
	return (trueCost * pc.balls);
}

public function expandoNuts():void
{
	clearOutput2();
	if(pc.balls == 1)
	{
		if(pc.ballDiameter() < 1) output2("Your [pc.balls] abruptly puffs up with new mass, swelling on command. The addition of new biomass roughly doubles the size of your endowment, causing you to feel swollen and vaguely horny. You can probably cum so much right now!");
		else if(pc.ballDiameter() < 2) output2("A channel of syrupy biomass forms between your pubic mound and the low-hanging fruit of your loins, reinforcing your [pc.balls] with enough new weight to make it wobble and jiggle as it expands. The experience leaves you feeling vaguely horny.");
		else if(pc.ballDiameter() < 3) output2("Your plump nut wobbles as you focus on enhancing its girth, swelling out with new, virile goo with every beat of what you assume is your heart. The experience leaves you hot enough to melt - or try cumming a few times just to judge the effectiveness of your enhanced organ.");
		else if(pc.ballDiameter() < 5) output2("You’re more than big enough to be considered well-endowed by most galactic species, but you want your [pc.balls] to be bigger, heavier. You want your dripping-wet sack to jiggle with every step you make, to bulge your clothes and promise a swift impregnation to those daring enough to let you get too close.\n\nRipples roll across the surface of your expanding sperm-factory while it trembles and grows, flooding with fresh mass. You stagger, feeling light-headed from the effort of it all, but when the feeling passes, you’ve got a bigger, bulgier ball.");
		else if(pc.ballDiameter() < 10) output2("Forcing yet more goo into the overtaxed sack between your legs, you gradually expand your [pc.balls]. The bigger it gets, the heavier each expansion seems to be and the more wildly erotic your orgasms will become. You can only imagine the deluge you’ll release when you get off after this. You’re a one-" + pc.mf("man","woman") + " bukkake show, and if you keep this up, you’ll need to upgrade the ship’s plumbing.");
		else output2("If there are gods, out there in the void, they must have a [pc.balls] like yours. The melon-sized spunk-tank is constantly swaying and bouncing, jiggling wetly at the slightest contact. Merely pouring additional mass into your overstuffed sack has it threatening to throw you off balance with its ungainly wobbling.");
	}
	else
	{
		if(pc.ballDiameter() < 1) output2("Your [pc.balls] abruptly puff up with new mass, swelling on command. The addition of new biomass roughly doubles the size of your endowment, causing you to feel swollen and vaguely horny. You can probably cum so much right now!");
		else if(pc.ballDiameter() < 2) output2("Channels of syrupy biomass forms between your pubic mound and the low-hanging fruit of your loins, reinforcing your [pc.balls] with enough new weight to make them wobble and jiggle as they expand. The experience leaves you feeling vaguely horny.");
		else if(pc.ballDiameter() < 3) output2("Your plump nuts wobble as you focus on enhancing their girth, swelling out with new, virile goo with every beat of what you assume is your heart. The experience leaves you hot enough to melt - or squirt.");
		else if(pc.ballDiameter() < 5) output2("You’re more than big enough to be considered well-endowed by most galactic species, but you want your [pc.balls] to be bigger, heavier. You want your dripping-wet sack to jiggle with every step you make, to bulge your clothes and promise a swift impregnation to those daring enough to let you get too close.\n\nRipples roll across the surface of your expanding sperm-factories while they tremble and grow, flooding with fresh mass. You stagger, feeling light-headed from the effort of it all, but when the feeling passes, you’ve got bigger, bulgier balls.");
		else if(pc.ballDiameter() < 10) output2("Forcing yet more goo into the overtaxed sack between your legs, you gradually expand your [pc.balls]. The bigger they get, the more you have to push inside to make an appreciable difference in size, and the more wildly erotic your orgasms will become. You can only imagine the deluge you’ll release when you get off after this. You’re a one-" + pc.mf("man","woman") + " bukkake show, and if you keep this up, you’ll need to upgrade the ship’s plumbing.");
		else output2("If there are gods, out there in the void, they must have [pc.balls] like yours. The melon-sized spunk-tanks are constantly swaying and bouncing, jiggling wetly at the slightest contact. Merely pouring additional mass into your overstuffed sack has it threatening to throw you off balance with its ungainly wobbling.");
	}
	gooBiomass(nutExpansionCost() * -1);
	pc.ballSizeRaw = (pc.ballSizeRaw/Math.PI+1) * Math.PI;
	//Failsafe!
	if(pc.ballSizeRaw < 0.5) 
	{
		output2("\n\n<b>Something went wrong! BallSizeRaw reported as " + pc.ballSizeRaw + ". Too low. Resetting to 1. Please report this as a bug on the bug report forums with a copy/paste of this message as well as any other pertinent information.</b>");
		pc.ballSizeRaw = 1;
	}
	trace("FINAL ACTUAL VOL: " + pc.ballVolume());
	var lustAmt:Number = 15;
	while(pc.lust() + lustAmt < 33) { lustAmt += 5; }
	pc.changeLust(lustAmt);
	clearGhostMenu();
	addGhostButton(0,"Next",gooBallsMenu);
}

public function tautSackToggle():void
{
	clearOutput2();
	if(!pc.hasStatusEffect("Uniball")) 
	{
		pc.createStatusEffect("Uniball",0,0,0,0,true,"","",false,0);
		output2("Biomass flows into the lining of your gooey nutsack, reinforcing the lining and drawing it up tighter against your drippy crotch");
		if(pc.balls > 1) output2(", squeezing your balls together until your package appears almost spherical");
		else output2(", squeezing your package into a primly-packed, almost spherical bulge");
		output2(". You’ve got a tight, aesthetically pleasing nutsack. It shines as if polished.");
		gooBiomass(-100);
	}
	else 
	{
		pc.removeStatusEffect("Uniball");
		gooBiomass(75);
		output2("The complex weave of gelatinous lattices in your [pc.sack] collapses right on cue, allowing you to reabsorb most of the reinforcement and let your [pc.balls] swing low and heavy once more. No more tightly-packed testes for you, no sir!");
	}
	clearGhostMenu();
	addGhostButton(0,"Next",gooBallsMenu);
}

public function nutGrowCost():Number
{
	if(pc.balls > 0) 
	{
		var ballRadius:Number = pc.ballSizeRaw/Math.PI/2;
		var volume:Number = Math.round(4/3 * Math.PI * ballRadius * ballRadius * ballRadius);
		if(volume > 1700) volume = 1700;
		return volume + 300;
	}
	return 300;
}

public function nutLossCost():Number
{
	if(pc.balls > 1) 
	{
		var ballRadius:Number = pc.ballSizeRaw/Math.PI/2;
		var volume:Number = Math.round(4/3 * Math.PI * ballRadius * ballRadius * ballRadius * .75);
		return volume + 225;
	}
	return 225;
}


public function removeATesticle():void
{
	clearOutput2();
	output2("As easily as snapping your fingers, you’re down one testicle");
	if(pc.balls == 1) output2(", leaving your [pc.sack] to shrink back into the smooth fluid encompassing your pubic mound");
	output2(". Now you can put that biomass to better use...");
	gooBiomass(nutLossCost());
	pc.balls--;
	clearGhostMenu();
	addGhostButton(0,"Next",gooBallsMenu)
}

//1 nut = 300 biomass
public function growSomeGooBalls():void
{
	clearOutput2();
	if(pc.balls == 0) {
		if(!pc.hasCock()) output2("Other people might call you crazy for wanting a bulging ballsack without even a single penis to vent the sperm with, but you don’t care. You direct your amorphous crotch to fill out a gelatinous flap of skin, rolling a semi-solid lump of spunk-churning delightfulness.\n\nNow that you’ve got one perfect nut, perhaps you could give it a twin?");
		else output2("It’s never to late to gift your [pc.cocks] a weighty, spunk-churning companion. Gripping a fold of aqueous skin, you tug it, shaping it into an empty sack just in time for a nicely-rounded ball of gelatinous nutflesh to slide down into it.\n\nYou can already feel your single nut brewing up a fresh batch of [pc.cumNoun]. Maybe you should give it a companion?");
		pc.ballSizeRaw = 3.4;
	}
	else if(pc.balls == 1)
	{
		output2("Envisioning your [pc.sack] with a second, identical lump inside, you revel in the sensation of your slimy loins forging a second testicle, building an oblong organ up from the size of a marble until it’s big enough to match its brother.\n\nYou’ve got two gooey balls.");
	}
	else
	{
		output2("You grab hold of your slippery sack and give the semi-solid nuts inside a familiar squeeze. Why stop at " + num2Text(pc.balls) + " balls when you can have even more? You bid your reserves of organic matter to flow down into your [pc.sack], pumping it up with a dripping-wet orb, a syrupy-slick spunk-factory. You finish crafting the new testicle in a matter of seconds. It bulges");
		if(pc.legCount > 1) output2(" against your [pc.legs] ");
		else output2(" against your [pc.leg] ");
		output2("with every movement, a potent reminder of how egregiously sexual you’ve become.")
	}
	gooBiomass(-1*nutGrowCost());
	pc.balls++;
	clearGhostMenu();
	addGhostButton(0,"Next",gooBallsMenu);
}

//100
public function reshapeACaaaawk():void
{
	clearOutput2();
	output2("Changing the shape of a penis is as easy as a thought, but which will you change?\n");
	if(pc.cockTotal() == 1 && pc.cocks[0].hasFlag(GLOBAL.FLAG_GOOEY))
	{
		reshapeAGooCawkForReaaaaal(0);
		return;
	}
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("\n" + (x+1) + ": [pc.CockShape " + x + "]");
			addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),reshapeAGooCawkForReaaaaal,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Shift the shape of this penis.\n\n<b>100 mLs Biomass</b>");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.CockShape " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","This penis isn’t made of goo.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",gooCockRootMenu);
}
public function reshapeAGooCawkForReaaaaal(arg:int = 0):void
{
	clearOutput2();
	output2("What new shape would you like to give your [pc.cockNoun " + arg + "]?");
	
	reshapeAGooCawkMenu([arg, 0]);
}
public function reshapeAGooCawkMenu(arg:Array):void
{
	var iCock:int = arg[0];
	var offset:int = arg[1];
	
	clearGhostMenu();
	
	var cTypes:Array = [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_SNAKE, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_VULPINE];
	// Unlockables
	if(flags["MET_SERA"] != undefined)
		cTypes.push(GLOBAL.TYPE_DEMONIC);
	if(CodexManager.entryViewed("Venus Pitchers") || CodexManager.entryViewed("Cockvines"))
		cTypes.push(GLOBAL.TYPE_TENTACLE);
	if(CodexManager.entryViewed("Zil"))
		cTypes.push(GLOBAL.TYPE_BEE);
	if(CodexManager.entryViewed("Fanfir") || CodexManager.entryViewed("The Dragon's Hoard"))
		cTypes.push(GLOBAL.TYPE_DRACONIC);
	if(CodexManager.entryViewed("Gabilani"))
		cTypes.push(GLOBAL.TYPE_GABILANI);
	if(CodexManager.entryViewed("Nyrea"))
		cTypes.push(GLOBAL.TYPE_NYREA);
	if(flags["LIRIEL_MET"] != undefined)
		cTypes.push(GLOBAL.TYPE_HRAD);
	if(flags["AMBER_SEED_USED"] != undefined && (flags["AMBER_SEED_USED"] & AmberSeed.FLAG_GOO_COCK) == AmberSeed.FLAG_GOO_COCK)
		cTypes.push(GLOBAL.TYPE_AVIAN);
	if(CodexManager.entryViewed("Suulas"))
		cTypes.push(GLOBAL.TYPE_SIREN);
	if(CodexManager.entryViewed("Saurmorians"))
		cTypes.push(GLOBAL.TYPE_SAURIAN);
	if(flags["KNOW_JADES_NAME"] != undefined)
		cTypes.push(GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SWINE);
	if(flags["SEER_MET"] != undefined)
		cTypes.push(GLOBAL.TYPE_GOAT, GLOBAL.TYPE_MOTHRINE);
	
	var newType:Number = 0;
	var btnName:String = "";
	var btnSlot:int = 0;
	
	for(var x:int = offset; x < (offset + 10); x++)
	{
		if(x >= cTypes.length) break;
		
		newType = cTypes[x];
		if(newType == GLOBAL.TYPE_HUMAN) btnName = "Terran";
		else if(newType == GLOBAL.TYPE_SNAKE) btnName = "Snake-like";
		else if(newType == GLOBAL.TYPE_BEE) btnName = "Zil";
		else if(newType == GLOBAL.TYPE_AVIAN && (flags["AMBER_SEED_USED"] & AmberSeed.FLAG_COCK_GRIFFIN) == AmberSeed.FLAG_COCK_GRIFFIN) btnName = "Griffin"; 
		else btnName = GLOBAL.TYPE_NAMES[newType];
		if(pc.cocks[iCock].cType != newType) addGhostButton(btnSlot,btnName,seriouslyThoReshapeDatGooCock,[iCock,newType]);
		else addDisabledGhostButton(btnSlot,btnName,btnName,"The penis is already this shape.");
		btnSlot++;
	}
	
	if(offset >= 10)
		addGhostButton(10, "Prev Pg.", reshapeAGooCawkMenu, [iCock, (offset - 10)], "Previous Page", "View more penis types.");
	if(offset + 10 < cTypes.length)
		addGhostButton(12, "Next Pg.", reshapeAGooCawkMenu, [iCock, (offset + 10)], "Next Page", "View more penis types.");
	
	if(pc.cockTotal() == 1) addGhostButton(14,"Back",gooCockRootMenu);
	else addGhostButton(14,"Back",reshapeACaaaawk);
}
public function seriouslyThoReshapeDatGooCock(arg:Array):void
{
	clearOutput2();
	gooBiomass(-100);
	//Cause I'm turrible, fuck using the array any longer
	var type:int = arg[1];
	var x:int = arg[0];
	var colorStore:String = pc.cocks[x].cockColor;
	output2("Looking down at your " + pc.cockDescript(x) + ", you focus on giving it a new shape");
	if(type == GLOBAL.TYPE_HUMAN)
	{
		output2(". The flesh ripples obligingly, reforming into a familiar, human form.");
	}
	else if(type == GLOBAL.TYPE_EQUINE)
	{
		output2(", a turgid, bestial mast made to plow your mates wide-open. You nearly cum from the feeling of your semi-liquid dicktip fattening and bloating, filling with more and more biomass until you’ve got a flare any stallion would be proud of, to say nothing of the sheath that’s quietly crept up below!");
		pc.lust(10);
	}
	else if(type == GLOBAL.TYPE_CANINE || type == GLOBAL.TYPE_VULPINE)
	{
		output2(", one with a big fat knot to seal your [pc.cum] inside your mates. The fluid waves of your self-induced transformation are maddeningly exciting, and the slow flow of biomass into your inflating knot is both ecstasy and agony, like orgasming without ejaculation.");
		pc.lust(10);
	}
	else if(type == GLOBAL.TYPE_FELINE)
	{
		output2(". The whole thing wobbles like a plate of half-melted jello, gaining definition and features with every shake. It gradually reveals a feline shape, complete with rubbery spines to stimulate your lovers’ innermost folds.");
	}
	else if(type == GLOBAL.TYPE_BEE)
	{
		output2(", one with a nice thick foreskin and wonderfully fragrant pheromones. All you’ll have to do is whip it out and the ladies (or boys) will come running. You close your eyes and reach down to touch it, delighted to discover that it’s already changed to the appropriate shape. Marvelous")
	}
	else if(type == GLOBAL.TYPE_DRACONIC)
	{
		output2(". It flows like water, the slimy material bubbling as it ebbs the old shape away to build anew. You gasp and pant at the birth of your new member, unable to look away from the new-bulging knot or distinctly draconic shape of your freshly-minted phallus.");
	}
	else if(type == GLOBAL.TYPE_SNAKE)
	{
		output2(". The ease with which you can reshape your sex never ceases to amaze you. Flesh flows like liquid butter, forming a serious of bulbous protrusions with a slick, almost shiny surface. In no time flat, you have a turgid snake-cock hanging heavily");
		if(pc.legCount == 1) output2(" from your gooey loins.");
		else output2(" between your [pc.legOrLegs].");
	}
	else if(type == GLOBAL.TYPE_DEMONIC)
	{
		output2(". Fluid undulations roll along the shifting length, absorbing some details and revealing others. Studs stand out from the human-like length, the kind of corrupt-looking nodules you’d expect to see on lining a demon-lord’s prick. It’s perfect, just like you imagined... only slightly more drippy.");
	}
	else if(type == GLOBAL.TYPE_KUITAN)
	{
		output2(". Kui-tan always did have interesting phalli, what with all the bulbous knots, always threatening to bulge and twitch with their excessively virile jism. By the time you finish thinking about it, you realize that your liquid crotch has already supplied the transformation, giving you exactly the member from your mind.");
	}
	else
	{
		output2(". Few things are as rewarding as watching your own flesh dance to your every whim. The goo reshapes wildly, discarding old features and trading them in for new. Through it all is the pleasant tingle and undeniable sexual thrill of contact with your crotch. Your misfiring nerves can’t help but feed you pleasure until your cock is formed perfectly to your mental specification.")
	}
	
	pc.shiftCock(x,type);
	
	// Exceptional forms
	if(type == GLOBAL.TYPE_AVIAN && (flags["AMBER_SEED_USED"] & AmberSeed.FLAG_COCK_GRIFFIN) == AmberSeed.FLAG_COCK_GRIFFIN) {
		pc.cocks[x].cThicknessRatioRaw = 1.3;
		pc.cocks[x].knotMultiplier = 1.5;
		pc.cocks[x].addFlag(GLOBAL.FLAG_KNOTTED);
		pc.cocks[x].addFlag(GLOBAL.FLAG_NUBBY);
		pc.cocks[x].addFlag(GLOBAL.FLAG_SHEATHED);
	}
	
	pc.cocks[x].cockColor = colorStore;
	pc.cocks[x].addFlag(GLOBAL.FLAG_GOOEY);
	
	addGhostButton(0,"Next",gooCockRootMenu);
}

//Don’t need to write shit for most of these - it’ll all be code-generated shit, mostly.
public function growANewGooCock():void
{
	clearOutput2();
	//Grow new cock
	var x:int = pc.cocks.length;
	pc.createCock();
	//Make it all goopey!
	pc.cocks[x].addFlag(GLOBAL.FLAG_GOOEY);
	pc.cocks[x].cockColor = gooColor();
	output2("A little mental focus is all it takes to make your flesh ripple and part around a new length, allowing the semi-solid [pc.cockNoun " + x + "] to slip out of your body with an accompanying gasp of delight. Making yourself a new cock felt <i>good</i>.");
	gooBiomass(-500);
	//Disable? Maybe you should see how many you’d have to make to get yourself off from the act alone?");
	clearGhostMenu();
	addGhostButton(0,"Next",gooCockRootMenu);
}

//Remove cock
public function removeGooCockRoot():void
{
	if(pc.cockTotal() == 1 && pc.cocks[0].hasFlag(GLOBAL.FLAG_GOOEY))
	{
		removeDaChosenGooCock(0);
		return;
	}
	clearOutput2();
	output2("Which will you remove?\n");
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("\n" + (x+1) + ": [pc.Cock " + x + "]");
			if(!pc.removeCockUnlocked(x, 1)) addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Something is preventing this penis from being removed.");
			else addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),removeDaChosenGooCock,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Remove this penis.");
			
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Cock " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","This penis isn’t made of goo.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",gooCockRootMenu);
}

public function removeDaChosenGooCock(arg:int = 0):void
{
	clearOutput2();
	output2("You close your eyes and imagine your [pc.cockNoun " + arg + "] melding back into the pool at the base of your body. The feeling is a little disconcerting, but not quite as disconcerting as the ‘schlorp’ sound it makes.");
	//Biomass refund!
	gooBiomass(Math.round(pc.cockVolume(arg,false) * .75) + 375);
	pc.removeCock(arg,1);
	clearGhostMenu();
	addGhostButton(0,"Next",gooCockRootMenu);
}

//Remove cocks
public function removeAllGooCocks():void
{
	clearOutput2();
	output2("You close your eyes and imagine yourself without the jutting, drooling protrusions you now bear. The feeling of them melding back into your body is a little disconcerting, but not quite as disconcerting as the multitude of ‘schlorps’ that assault your ears. At least you’ve regained their weight in biomass.");
	var biomass:int = 0;
	for(var x:int = 0; x < pc.totalCocks(); x++)
	{
		biomass += pc.cockVolume(x,false) + 375;
	}
	//Get 75% biomass refund.
	biomass = Math.round(biomass * .75);
	gooBiomass(biomass);
	pc.removeCocks();
	clearGhostMenu();
	addGhostButton(0,"Next",gooCockRootMenu);
}

// Cock volume price
public function costGooCockLengthen(cIdx:int = 0, lChange:Number = 2):Number
{
	var costVolume:Number = 0;
	//Find the difference between new and old sizes:
	pc.cocks[cIdx].cLengthRaw += lChange;
	costVolume = pc.cockVolume(cIdx,false);
	pc.cocks[cIdx].cLengthRaw -= lChange;
	costVolume -= pc.cockVolume(cIdx,false);
	return Math.round(costVolume);
}

//Lengthen Cock
public function lengthenGooCock():void
{
	if(pc.totalCocks() == 1 && pc.cocks[0].hasFlag(GLOBAL.FLAG_GOOEY))
	{
		lengthenSelectedGooCock(0);
		return;
	}
	clearOutput2();
	output2("Which will you lengthen?\n");
	var cockCost:Number = 0;
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			cockCost = costGooCockLengthen(x, 2);
			output2("\n" + (x+1) + ": [pc.Cock " + x + "]");
			addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),lengthenSelectedGooCock,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Lengthen this penis.\n\n<b>" + cockCost + " mLs Biomass</b>");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Cock " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","This penis isn’t made of goo.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",gooCockRootMenu);
}

public function lengthenSelectedGooCock(arg:int = 0):void
{
	clearOutput2();
	var cChange:Number = 2;
	//Find the difference between new and old sizes:
	var biomassReq:Number = costGooCockLengthen(arg, cChange);
	//Is there enough? TF
	if(gooBiomass() >= biomassReq)
	{
		// Perk bonus (no extra cost!)
		if(pc.hasPerk("Hung")) cChange += 2;
		
		output2("Oh wow, as soon as you thought about your [pc.cockNoun " + arg + "] sticking a little farther out than normal, you could feel more cock pushing out of you, fucking its way out of your body on the path to full erectness. It feels quite good, good enough that you can’t help but imagining it a little bigger, a little thicker, and a lot more erect. By the time you reel yourself in, you’ve added");
		if(cChange == 1) output2(" one inch");
		else output2(" " + num2Text(cChange) + " inches");
		output2(" to your size.");
		pc.cocks[arg].cLengthRaw += cChange;
		gooBiomass(-1*biomassReq);
	}
	//NOT ENOUGH! ABORT!
	else
	{
		output2("No matter how hard you try, you can’t muster up anything more than an empty feeling inside yourself. It looks like you’ll need more biomass for this.");
	}
	clearGhostMenu();
	addGhostButton(0,"Next",gooCockRootMenu);
}

//Shorten cock
public function shortenADick():void
{
	if(pc.totalCocks() == 1 && pc.cocks[0].hasFlag(GLOBAL.FLAG_GOOEY))
	{
		shortenSelectedCock(0);
		return;
	}
	clearOutput2();
	output2("Which will you shorten?\n");
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("\n" + (x+1) + ": [pc.Cock " + x + "]");
			addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),shortenSelectedCock,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Shorten this penis.");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Cock " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","This penis isn’t made of goo.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",gooCockRootMenu);
}
public function shortenSelectedCock(arg:int = 0):void
{
	clearOutput2();
	
	if(pc.cocks[arg].cLengthRaw >= 3)
	{
		var cChange:Number = 2;
		var biomassDiff:Number = pc.cockVolume(arg);
		var perked:Boolean = false;
		
		pc.cocks[arg].cLengthRaw -= cChange;
		// Perk bonus (conservation of mass!)
		if(pc.hasPerk("Mini") && pc.cocks[arg].cLengthRaw >= 3)
		{
			pc.cocks[arg].cLengthRaw -= cChange;
			perked = true;
		}
		biomassDiff -= pc.cockVolume(arg);
		pc.cocks[arg].cLengthRaw += cChange;
		if(perked)
		{
			pc.cocks[arg].cLengthRaw += cChange;
			cChange += 2;
		}
		
		output2("Turns out that there can be too much of a good thing. You glance down at your [pc.cockNoun " + arg + "] and focus, willing it to become a little more reasonably sized.");
		if(pc.cocks[arg].cLengthRaw - cChange < 1) output2(" After losing enough mass until your tiny prick is about one-inch long");
		else if(cChange == 1) output2(" After losing about one inch");
		else output2(" After losing about " + num2Text(cChange) + " inches");
		output2(", you take a break to evaluate the results and decide if you should go any smaller.");
		
		if(pc.cocks[arg].cLengthRaw - cChange < 1) pc.cocks[arg].cLengthRaw = 1;
		else pc.cocks[arg].cLengthRaw -= cChange;
		gooBiomass(Math.round(biomassDiff * .75));
	}
	else if(pc.cocks[arg].cLengthRaw > 1)
	{
		output2("Turns out that there can be too much of a good thing. You glance down at your [pc.cockNoun " + arg + "] and focus, willing it to become a little more reasonably sized. After it shrinks down to about one inch, it suddenly stops... looks like you can’t get it any smaller than that without having to remove it.");
		pc.cocks[arg].cLengthRaw = 1;
	}
	else
	{
		output2("You try and try but you can’t quite shift the biomass of your [pc.cockNoun " + arg + "] to get it any smaller... You guess your pecker is as small as it’s going to get... unless you decide to remove it.");
		output2("\n\nDo you want to remove it?");
		
		clearGhostMenu();
		if(!pc.removeCockUnlocked(arg, 1)) addDisabledGhostButton(0,"Remove It","Remove It","Something is preventing your [pc.cock " + arg + "] from being removed.");
		else addGhostButton(0,"Remove It",removeDaChosenGooCock,arg,"Remove It","Remove your [pc.cock " + arg + "].");
		addGhostButton(1,"Nah",gooCockRootMenu);
		return;
	}

	clearGhostMenu();
	addGhostButton(0,"Next",gooCockRootMenu);
}

//Vagina
public function vaginaGooRootMenu():void
{
	clearOutput2();
	output2("What would you like to do?");
	crotchStuff(pc);
	showBiomass();
	//[Grow Vagina] [Remove Vag] [Remove Vags] [Reshape]
	clearGhostMenu();
	if(gooBiomass() >= 500)
	{
		if(pc.totalVaginas() < 3)
		{
			if(!pc.createVaginaUnlocked(pc.totalVaginas() + 1)) addDisabledGhostButton(0,"Grow Vagina","Grow Vagina","Something is preventing you from growing a vagina.");
			else addGhostButton(0,"Grow Vagina",growAGoogina,undefined,"Grow Vagina","Grow a new vagina.\n\n<b>500 mLs Biomass</b>");
		}
		else addDisabledGhostButton(0,"Grow Vagina","Grow Vagina","There’s no room for any more vaginas!");
	}
	else addDisabledGhostButton(0,"Grow Vagina","Grow Vagina","You don’t have enough biomass for that!\n\n<b>500 mLs Biomass</b>");

	if(gooBiomass() >= 200)
	{
		if(pc.hasVagina()) addGhostButton(1,"Reshape",shiftACuntYaCunt,undefined,"Reshape","Reshape your vagina into another form.\n\n<b>200 mLs Biomass</b>");
		else addDisabledGhostButton(1,"Reshape","Reshape","You don’t have a vagina to reshape.");
	}
	else addDisabledGhostButton(1,"Reshape","Reshape","You don’t have enough biomass to reshape your vagina.\n\n<b>200 mLs Biomass</b>");
	if(gooBiomass() >= 100)
	{
		if(pc.hasVagina()) addGhostButton(2,"Grow Clit",addClitGooMenu,undefined,"Grow Clit","Grow a new clitoris.\n\n<b>100 mLs Biomass</b>");
		else addDisabledGhostButton(2,"Grow Clit","Grow Clit","You have no vagina to add a clit to.");
	}
	else addDisabledGhostButton(2,"Grow Clit","Grow Clit","You do not have enough biomass for this.\n\n<b>100 mLs Biomass</b>");
	if(pc.totalVaginas() == 1 && pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY) && pc.vaginas[0].clits <= 1) addDisabledGhostButton(3,"Remove Clit","Remove Clit","You cannot remove your only clit. It just seems... wrong without it.");
	else if(pc.hasVagina()) addGhostButton(3,"Remove Clit",removeGooClitVagSelector,undefined,"Remove Clit","Remove an excess clitoris.");
	else addDisabledGhostButton(3,"Remove Clit","Remove Clit","You don’t have a vagina to remove a clit from.");
	
	var x:int = 0;
	if(pc.hasVagina())
	{
		var hymenCost:int = 0;
		for(x = 0; x < pc.totalVaginas(); x++)
		{
			if(!pc.vaginas[x].hymen) hymenCost += 50;
		}
		if(hymenCost <= 0) addDisabledGhostButton(4,"Regn.Hymen","Regenerate Hymens","You don’t have any hymens that need restoration.");
		else if(hymenCost <= gooBiomass()) addGhostButton(4,"Regn.Hymen",hymenRestorationForGoos,undefined,"Regenerate Hymens","Restore any and all hymens.\n\n<b>" + hymenCost + " mLs Biomass</b>");
		else addDisabledGhostButton(4,"Regn.Hymen","Regenerate Hymens","You do not have enough biomass for this.\n\n<b>" + hymenCost + " mLs Biomass</b>");
	}
	
	// Removal: Single vagina
	if(pc.totalVaginas() == 1)
	{
		if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			if(pc.isPregnant(0)) addDisabledGhostButton(5,"Remove Vag","Remove Vagina","Your vagina is pregnant and cannot be removed.");
			else if(!pc.removeVaginaUnlocked(0, 1)) addDisabledGhostButton(5,"Remove Vag","Remove Vagina","Something is preventing your vagina from being removed.");
			else addGhostButton(5,"Remove Vag",removeAVag,0,"Remove Vagina","Remove your vagina.");
	}
		else addDisabledGhostButton(5,"Remove Vag","Remove Vagina","Your vagina isn’t made of goo and cannot be removed.");
	}
	else if(!pc.hasVagina()) addDisabledGhostButton(5,"Remove Vag","Remove Vag","You have no vagina to remove.");
	
	// Removal: Multiple vaginas
	if(pc.totalVaginas() > 1)
	{
		if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			if(pc.isPregnant(0)) addDisabledGhostButton(5,"Remove Vag 1","Remove First Vagina","Your first vagina is pregnant and cannot be removed.");
			else if(!pc.removeVaginaUnlocked(0, 1)) addDisabledGhostButton(5,"Remove Vag 1","Remove First Vagina","Something is preventing this vagina from being removed.");
			else addGhostButton(5,"Remove Vag 1",removeAVag,0,"Remove First Vagina","Remove your first vagina.");
		}
		else addDisabledGhostButton(5,"Remove Vag 1","Remove First Vagina","This vagina isn’t made of goo and cannot be removed.");
		if(pc.vaginas[1].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			if(pc.isPregnant(1)) addDisabledGhostButton(6,"Remove Vag 2","Remove Second Vagina","Your second vagina is pregnant and cannot be removed.");
			else if(!pc.removeVaginaUnlocked(1, 1)) addDisabledGhostButton(6,"Remove Vag 2","Remove Second Vagina","Something is preventing this vagina from being removed.");
			else addGhostButton(6,"Remove Vag 2",removeAVag,1,"Remove Second Vagina","Remove your second vagina.");
		}
		else addDisabledGhostButton(6,"Remove Vag 2","Remove Second Vagina","This vagina isn’t made of goo and cannot be removed.");
	}
	//else addDisabledGhostButton(6,"Remove Vag 2","Remove Second Vagina","You have no vagina to remove.");
	if(pc.totalVaginas() > 2)
	{
		if(pc.vaginas[2].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			if(pc.isPregnant(2)) addDisabledGhostButton(7,"Remove Vag 3","Remove Third Vagina","Your third vagina is pregnant and cannot be removed.");
			else if(!pc.removeVaginaUnlocked(2, 1)) addDisabledGhostButton(7,"Remove Vag 3","Remove Third Vagina","Something is preventing this vagina from being removed.");
			else addGhostButton(7,"Remove Vag 3",removeAVag,2,"Remove Third Vagina","Remove your third vagina.");
		}
		else addDisabledGhostButton(7,"Remove Vag 3","Remove Third Vagina","This vagina isn’t made of goo and cannot be removed.");
	}
	//else addDisabledGhostButton(7,"Remove Vag 3","Remove Third Vagina","You have no vagina to remove.");
	
	var numGooVags:Number = 0;
	var numPregVags:Number = 0;
	var numPregTotal:Number = pc.totalPregnancies();
	if(pc.isPregnant(3)) numPregTotal--;
	
	for(x = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY)) numGooVags++;
		if(pc.isPregnant(x)) numPregVags++;
	}
	var lastPregIdx:int = -1;
	for(x = 0; x < pc.pregnancyData.length; x++)
	{
		if(x >= 3) break; // non-vag
		if(pc.pregnancyData[x].pregnancyType != "") lastPregIdx = x;
	}
	if(lastPregIdx < pc.totalVaginas()) lastPregIdx = -1; // have enough vags
	var nVagsToFix:Number = Math.max((numPregTotal - pc.totalVaginas()),(lastPregIdx + 1));
	
	if(nVagsToFix > 0)
	{
		addGhostButton(8,"Fix Wombs",fixAllVags,nVagsToFix,"Fix Wombs",((pc.totalVaginas() == 0 ? "You seem to have a pregnant womb and no vaginas..." : "You seem to have more pregnant wombs than you do vaginas...") + " You should fix this before something goes horribly wrong!\n\n<b>" + (nVagsToFix * 500) + " mLs Biomass</b>"));
	}
	else if(pc.totalVaginas() > 1)
	{
		if(pc.totalVaginas() == numGooVags)
		{
			if(numPregVags > 0) addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","Your vaginas cannot be removed at the same time because at least one of them is currently pregnant.");
			else if(!pc.removeVaginasUnlocked()) addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","Something is preventing your vaginas from being removed all the same time.");
			else addGhostButton(8,"Remove Vags",removeAllVags,undefined,"Remove Vaginas","Remove all vaginas.");
		}
		else addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","Your vaginas aren’t all made of goo and cannot be removed at the same time.");
	}
	else if(pc.totalVaginas() == 1) addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","You need multiple goo vaginas in order to try this.");
	//else addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","You have no vaginas to remove.");
	
	if(pc.hasVagina() && flags["SUKMASTRED"] != undefined) addGhostButton(9,"Puffiness",gooVaginaPuffMenu,undefined,"Vagina Puffiness","Increase or decrease the puffiness of your vagina.");
	
	addGhostButton(14,"Back",gooCrotchCustomizer);
}
//Grow Vag
public function growAGoogina():void
{
	clearOutput2();
	//Nocunt
	if(!pc.hasVagina())
	{
		output2("You decide that you’d like to have a pussy, something pretty you could slip your fingers into on a cold lonely night, among the stars. A new vagina takes shape on your body as rapidly as the idea forms in your head, soft and elastic, ready to stretch and deform around anything you’d like to put inside of it.");
	}
	//Gotcunt
	else 
	{
		output2("Why settle for only ");
		if(pc.totalVaginas() == 1) output2("one vagina");
		else output2("two vaginas");
		output2(" when you could have ");
		if(pc.totalVaginas() == 1) output2("two");
		else output2("three");
		output2(" eager cunts waiting for attention? There’s plenty of room there, you could just form one right... there. You touch your fingers to the spot, and moan as they sink into your pliant, syrupy skin, forming a tiny gap that grows with every passing second. You plunge in to the knuckle, aware of the formation of a [pc.clit] above, the press of lips on either side. You brush your other entrance");
		if(pc.totalVaginas() == 2) output2("s");
		output2(" and shudder, fighting the sensation to jill yourself on the spot.");
		output2("\n\nThere will be time for that later. You pull your fingers free and slowly lick them clean, wary of wasting your own biomass.");
	}
	gooBiomass(-500);
	pc.createVagina();
	pc.vaginas[pc.vaginas.length-1].addFlag(GLOBAL.FLAG_GOOEY);
	pc.vaginas[pc.vaginas.length-1].vaginaColor = gooColor();
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}

//Remove Vag
public function removeAVag(arg:int = 0):void
{
	clearOutput2();
	output2("Deciding that your [pc.vagina " + arg + "] is too much of a distraction, you focus your will on it, commanding the semi-liquid flesh of your loins to flow over it like water, dissolving it back into the formless reservoir of biomass within.");
	gooBiomass(375);
	pc.removeVagina(arg,1);
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}
//Remove Vags
public function removeAllVags():void
{
	clearOutput2();
	output2("Deciding that your [pc.vaginas] would serve you better by fading away into nothingness, you will the goo at your crotch to fold over the feminine creases and melt them back into nothingness once more.");
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		gooBiomass(375);
	}
	pc.removeVaginas();
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}

public function addClitGooMenu():void
{
	clearOutput2();
	output2("Which vagina will be gaining another clitoris?\n");
	clearGhostMenu();
	if(pc.totalVaginas() == 1 && pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY))
	{
		addGooClitNau(0);
		return;
	}
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - " + pc.vaginas[x].clits + " clits");
			addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),addGooClitNau,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","Grow a clit for this vagina.\n\n<b>100 mLs Biomass</b>");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","This vagina isn’t made of goo and cannot be morphed that way.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",vaginaGooRootMenu);
}

public function addGooClitNau(arg:int = 0):void
{
	clearOutput2();
	output2("Growing a clit is harder than you feel it ought to be - not because there’s anything special about that chunk of biomass, but because increasing the nerve density on the surface of the bud is maddeningly distracting. You push through until you’ve added another [pc.clit] to your [pc.vagina " + arg + "].");
	pc.vaginas[arg].clits++;
	gooBiomass(-100);
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}

public function removeGooClitVagSelector():void
{
	if(pc.totalVaginas() == 1 && pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY) && pc.vaginas[0].clits > 1)
	{
		removingClitSurgeryGoo(0);
		return;
	}
	clearOutput2();
	output2("Which vagina will you remove a clit from?");
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - " + pc.vaginas[x].clits + " clits");
			if(pc.vaginas[x].clits > 1) addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),removingClitSurgeryGoo,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","Remove a clit for this vagina.");
			else addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","You cannot remove your last clit for this vagina. It just seems... wrong without it.");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.upperCase(num2Text(x+1)),"This vagina isn’t made of goo and cannot be morphed that way.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",vaginaGooRootMenu);
}

public function removingClitSurgeryGoo(arg:int = 0):void
{
	clearOutput2();
	output2("Deciding to simplify things, you will one of your [pc.clits] to fade back into the gelatinous surface of your crotch. It disappears with a sudden cessation of sensation, leaving your [pc.vagina " + arg + "] a little less sensitive for the change.");
	gooBiomass(75);
	pc.vaginas[arg].clits--;
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}

//Shift cunt
public function shiftACuntYaCunt():void
{
	clearOutput2();
	output2("Which vagina will you change to a different type?");
	clearGhostMenu();
	if(pc.totalVaginas() == 1 && pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY))
	{
		pickNewCuntType(0);
		return;
	}
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - " + pc.vaginas[x].clits + " clits");
			addGhostButton(x,StringUtil.upperCase(num2Text(x+1)),pickNewCuntType,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","Shift the shape of this vagina.\n\n<b>200 mLs Biomass</b>");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,StringUtil.upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","This vagina isn’t made of goo and cannot be morphed.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",vaginaGooRootMenu);
}
public function pickNewCuntType(arg:int = 0):void
{
	clearOutput2();
	output2("What type of vagina will you change it into?");
	
	pickNewGooCuntMenu([arg, 0]);
}
public function pickNewGooCuntMenu(arg:Array):void
{
	var iCunt:int = arg[0];
	var offset:int = arg[1];
	
	clearGhostMenu();
	
	var vTypes:Array = [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_EQUINE];
	// Unlockables
	if(CodexManager.entryViewed("Naleen"))
		vTypes.push(GLOBAL.TYPE_SNAKE);
	if(CodexManager.entryViewed("Vanae"))
		vTypes.push(GLOBAL.TYPE_VANAE);
	if(CodexManager.entryViewed("Lapinara"))
		vTypes.push(GLOBAL.TYPE_LAPINARA);
	if(CodexManager.entryViewed("Gabilani"))
		vTypes.push(GLOBAL.TYPE_GABILANI);
	if(CodexManager.entryViewed("Nyrea"))
		vTypes.push(GLOBAL.TYPE_NYREA);
	if (flags["AMBER_SEED_USED"] != undefined && (flags["AMBER_SEED_USED"] & AmberSeed.FLAG_GOO_CUNT) == AmberSeed.FLAG_GOO_CUNT)
		vTypes.push(GLOBAL.TYPE_AVIAN);
	if(flags["KNOW_JADES_NAME"] != undefined)
		vTypes.push(GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SWINE);
	if(CodexManager.entryViewed("Venus Pitchers") || CodexManager.entryViewed("Cockvines"))
		vTypes.push(GLOBAL.TYPE_FLOWER);
	if(flags["MUFFSTICK_COLORED"] != undefined)
		vTypes.push(GLOBAL.TYPE_MOUTHGINA);
	
	var newType:Number = 0;
	var btnName:String = "";
	var btnSlot:int = 0;
	for(var x:int = offset; x < (offset + 10); x++)
	{
		if(x >= vTypes.length) break;
		
		newType = vTypes[x];
		if(newType == GLOBAL.TYPE_HUMAN) btnName = "Terran";
		else if(newType == GLOBAL.TYPE_SNAKE) btnName = "Snake-like";
		else btnName = GLOBAL.TYPE_NAMES[newType];
		if(pc.vaginas[iCunt].type != newType) addGhostButton(btnSlot,btnName,actuallyTFToNewCuntType,[iCunt,newType]);
		else addDisabledGhostButton(btnSlot,btnName,btnName,"The vagina is already this shape.");
		btnSlot++;
	}
	
	if(offset >= 10)
		addGhostButton(10, "Prev Pg.", pickNewGooCuntMenu, [iCunt, (offset - 10)], "Previous Page", "View more vagina types.");
	if(offset + 10 < vTypes.length)
		addGhostButton(12, "Next Pg.", pickNewGooCuntMenu, [iCunt, (offset + 10)], "Next Page", "View more vagina types.");
	
	if(pc.totalVaginas() == 1) addGhostButton(14,"Back",vaginaGooRootMenu);
	else addGhostButton(14,"Back",shiftACuntYaCunt);
}

public function actuallyTFToNewCuntType(args:Array):void
{
	clearOutput2();
	var x:int = args[0];
	var newType:int = args[1];
	var colorStore:String = pc.vaginas[x].vaginaColor;
	output2("One simple thought is all it takes to light a sizzle of erotic energies in your loins, burning through your old [pc.vagina " + x + "] and leaving a flush new vagina in its wake.");
	pc.lust(10);
	pc.shiftVagina(x,newType);
	pc.vaginas[x].vaginaColor = colorStore;
	pc.vaginas[x].addFlag(GLOBAL.FLAG_GOOEY);
	gooBiomass(-200);
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}

//Regrow Hymens
public function hymenRestorationForGoos():void
{
	clearOutput2();
	var hymens:int = 0;
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(!pc.vaginas[x].hymen) 
		{
			gooBiomass(-50);
			pc.vaginas[x].hymen = true;
			hymens++;
		}
	}
	if(hymens > 1) output2("You decide that you’d like to be a virgin once more, and like magic, it is so. Your hymens are restored.");
	else output2("You decide that you’d like to be a virgin once more, and like magic, it is so. Your hymen is restored.");
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}

//Fix Preg Vag
public function fixAllVags(nVagsToFix:Number = 0):void
{
	clearOutput2();
	gooBiomass();
	var numPregTotal:Number = pc.totalPregnancies();
	if(pc.isPregnant(3)) numPregTotal--;
	// For in-between wombs
	if(nVagsToFix <= 0 && pc.isPregnant(0)) nVagsToFix = 1;
	if(nVagsToFix <= 1 && pc.isPregnant(1)) nVagsToFix = 2;
	if(nVagsToFix <= 2 && pc.isPregnant(2)) nVagsToFix = 3;
	
	// Failsafe
	if(nVagsToFix <= 0)
	{
		output2("Your [pc.belly] rumbles, but nothing happens....");
		output2("\n\nWeird.");
	}
	// Grow new 'ginas
	else
	{
		output2("Your [pc.belly] feels funny... It churns and gurgles, clearly complaining about something.");
		output2("\n\nStrange sensations vibrate through your womb");
		if(numPregTotal > 1) output2("s");
		output2(". Your crotch suddenly lights up and a");
		if(pc.totalVaginas() > 0) output2(" second");
		output2(" pubic mound appears, growing and changing into a new gooey vagina!");
		if(nVagsToFix > 1) output2(" Another slimy growth forms quickly after the other, molding into yet another fresh vagina.");
		if(nVagsToFix > 2) output2(" A final one follows, completing the trio of pregnant vaginas.");
		output2("\n\nGoosebumps crawl underneath your [pc.skinFurScalesNoun] as your womb");
		if(nVagsToFix == 1) output2(" warms");
		else output2("s warm");
		output2(", pulling the much-needed material and energy into your fecund baby factor");
		if(nVagsToFix == 1) output2("y");
		else output2("ies");
		
		// Create new vags:
		var vIdx:int = (pc.vaginas.length);
		var totalVags:int = (vIdx + nVagsToFix);
		for(vIdx; vIdx < totalVags; vIdx++)
		{
			// failsafe!
			if(vIdx >= 3) break;
			
			pc.createVagina();
			pc.vaginas[vIdx].addFlag(GLOBAL.FLAG_GOOEY);
			pc.vaginas[vIdx].vaginaColor = gooColor();
			pc.energy(-25);
			// Take goo:
			flags["GOO_BIOMASS"] -= 500;
		}
		
		if(flags["GOO_BIOMASS"] < 0)
		{
			flags["GOO_BIOMASS"] = 0;
			output2(" and using up the rest of your biomass reserves in the process");
		}
		output2(", all to ensure that your new young gain the nutrients they need to grow--and more importantly, an orifice to exit from.");
		output2("\n\n<b>You have gained ");
		if(nVagsToFix == 1) output2("a new vagina");
		else output2(num2Text(nVagsToFix) + " new vaginas");
		output2("!</b>");
	}
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}
// PuffyAmiYumi
public function gooVaginaPuffMenu():void
{
	clearOutput2();
	if(pc.totalVaginas() == 1)
	{
		clearGhostMenu();
		if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("How do you want to change your vagina?\n");
			if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_PUMPED)) addDisabledGhostButton(0,"Inflate","Inflate Vagina","Your vagina is as puffy as it is going to get!");
			else if(gooBiomass() >= 100) addGhostButton(0,"Inflate",gooVaginaInflate,0,"Inflate Vagina","Inflate your vagina.\n\n<b>100 mLs Biomass</b>");
			else addDisabledGhostButton(0,"Inflate","Inflate Vagina","You do not have enough biomass for this!\n\n<b>100 mLs Biomass</b>");
			if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || pc.vaginas[0].hasFlag(GLOBAL.FLAG_PUMPED)) addGhostButton(5,"Deflate",gooVaginaDeflate,0,"Deflate Vagina","Deflate your vagina.");
			else addDisabledGhostButton(5,"Deflate","Deflate Vagina","Your vagina can’t get any less puffy than it is now!");
		}
		else
		{
			output2("It seems your vagina isn’t gooey enough to change...\n");
			addDisabledGhostButton(0,"Inflate","Inflate Vagina","Your vagina isn’t made of goo and cannot be morphed that way.");
			addDisabledGhostButton(5,"Deflate","Deflate Vagina","Your vagina isn’t made of goo and cannot be morphed that way.");
		}
		return;
	}
	
	output2("Which vagina will you like to change?\n");
	clearGhostMenu();
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - ");
			if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED)) {
				if(pc.vaginalPuffiness(x) > 2) output2(" Extremely and naturally puffy");
				else output2(" Obviously puffy");
			}
			else if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) {
				if(pc.vaginalPuffiness(x) > 1) output2(" Obviously and naturally puffy");
				else output2(" Slightly puffy");
			}
			else {
				if(pc.vaginalPuffiness(x) > 0) output2(" Naturally puffy");
				else output2(" Not puffy");
			}
			if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED)) addDisabledGhostButton(x,("Inflate #" + (x+1)),("Inflate " + StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina"),"This vagina is as puffy as it is going to get!");
			else if(gooBiomass() >= 100) addGhostButton(x,("Inflate #" + (x+1)),gooVaginaInflate,x,("Inflate " + StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina"),"Inflate this vagina.\n\n<b>100 mLs Biomass</b>");
			else addDisabledGhostButton(0,("Inflate #" + (x+1)),("Inflate " + StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina"),"You do not have enough biomass for this!\n\n<b>100 mLs Biomass</b>");
			if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED)) addGhostButton((x + 5),("Deflate #" + (x+1)),gooVaginaDeflate,x,("Deflate " + StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina"),"Deflate this vagina.");
			else addDisabledGhostButton(5,("Deflate #" + (x+1)),("Deflate " + StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina"),"This vagina can’t get any less puffy than it is now!");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,("Inflate #" + (x+1)),("Inflate " + StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina"),"This vagina isn’t made of goo and cannot be morphed that way.");
			addDisabledGhostButton((x + 5),("Deflate #" + (x+1)),("Deflate " + StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina"),"This vagina isn’t made of goo and cannot be morphed that way.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",vaginaGooRootMenu);
}
public function gooVaginaInflate(arg:int = 0):void
{
	clearOutput2();
	
	output2("You concentrate and watch your [pc.vagina " + arg + "] swell larger.");
	pc.inflateVagina(arg);
	if(pc.vaginas[arg].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) output2(" <b>Your vagina is now massively puffy!</b>");
	else if(pc.vaginas[arg].hasFlag(GLOBAL.FLAG_PUMPED)) output2(" <b>Your vagina is now obviously puffy!</b>");
	else if(pc.vaginas[arg].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output2(" <b>Your vagina is now slightly puffy!</b>");
	else output2(" <b>Your vagina is no longer puffy!</b>");
	gooBiomass(-100);
	
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}
public function gooVaginaDeflate(arg:int = 0):void
{
	clearOutput2();
	
	output2("You focus and feel your [pc.vagina " + arg + "] lose some mass.");
	pc.deflateVagina(arg);
	if(pc.vaginas[arg].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) output2(" <b>Your vagina is now massively puffy!</b>");
	else if(pc.vaginas[arg].hasFlag(GLOBAL.FLAG_PUMPED)) output2(" <b>Your vagina is now obviously puffy!</b>");
	else if(pc.vaginas[arg].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output2(" <b>Your vagina is now slightly puffy!</b>");
	else output2(" <b>Your vagina is no longer puffy!</b>");
	gooBiomass(75);
	
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}

// Cumflation options
public function gooCumflationOptions():void
{
	clearOutput2();
	
	var cumflate:Boolean = (!pc.hasStatusEffect("Cumflation Immune"));
	var leakage:Boolean = (!pc.hasStatusEffect("No Cum Leakage"));
	output2("Currently, you are " + (!cumflate ? "not allowing" : "allowing") + " your body to cumflate.");
	if(!cumflate) output2("\n\nThis means that when you take in a load, your body will automatically convert the fluids into goo biomass.");
	else
	{
		output2("\n\nAllowing your body to do this will prevent it from automatically absorbing some injected fluids.");
		if(!leakage) output2(" Fortunately, you have chosen not to let your body leak the fluids stored inside you.");
		else output2(" Be careful, however, since doing that may lead to leakage!");
		output2(" In any case, you can choose to <b>Ingest</b> the fluids if you like, preventing leaks by absorbing the fluids into your body and converting it to goo biomass.");
	}
	
	clearGhostMenu();
	
	addGhostButton(0, "Cumflate:" + (!cumflate ? "OFF" : "ON"), gooToggleCumflation, undefined, "Toggle Cumflation " + (!cumflate ? "On" : "Off"), (!cumflate ? "Activate the ability to cumflate." : "Disable cumflation and automatically absorb the loads put into you."));
	if (cumflate) addGhostButton(1, "Leaking:" + (!leakage ? "OFF" : "ON"), gooToggleLeaking, undefined, "Toggle Leaking " + (!leakage ? "On" : "Off"), (!leakage ? "Enable your body to leak your cumflated fluids." : "Prevent the cumflated fluids in your body from leaking out."));
	if (pc.isCumflated()) addGhostButton(2, "Ingest", gooAbsorbFluids, undefined, "Ingest Cumflation Fluids", "Absorb the fluids that have been pumped into you.");
	else addDisabledGhostButton(2, "Ingest", "Ingest Cumflation Fluids", "You are currently not inflated with any fluids.");
	
	addGhostButton(14, "Back", gooShiftMenu);
}
public function gooToggleCumflation():void
{
	if(!pc.hasStatusEffect("Cumflation Immune")) pc.createStatusEffect("Cumflation Immune");
	else pc.removeStatusEffect("Cumflation Immune");
	
	gooCumflationOptions();
}
public function gooToggleLeaking():void
{
	if(!pc.hasStatusEffect("No Cum Leakage")) pc.createStatusEffect("No Cum Leakage");
	else pc.removeStatusEffect("No Cum Leakage");
	
	gooCumflationOptions();
}
public function gooAbsorbFluids():void
{
	clearOutput2();
	
	var fluidQ:Number = pc.cumFlationAmount();
	
	output2("You notice your middle is a bit bigger than normal... and judging by the look of things, it is because you are currently filled with " + Math.round(fluidQ) + " mLs of sexual fluids.");
	output2("\n\nAre you sure you want to absorb the contents of your [pc.belly]?");
	
	clearGhostMenu();
	addGhostButton(0, "Yes", gooAbsorbFluidsGo, fluidQ);
	addGhostButton(1, "No", gooCumflationOptions);
}
public function gooAbsorbFluidsGo(fluidQ:Number):void
{
	clearOutput2();
	
	output2("You lick your [pc.lips]");
	if(pc.isBimbo()) output2(" and wiggle your [pc.hips]");
	output2(" at the thought of consuming");
	if(fluidQ < 100) output2(" a tiny snack");
	else if(fluidQ < 500) output2(" a small meal");
	else if(fluidQ < 1000) output2(" a good meal");
	else if(fluidQ < 5000) output2(" a heavy meal");
	else if(fluidQ < 10000) output2(" a full dinner");
	else if(fluidQ < 50000) output2(" a couple dinners");
	else output2(" a massive, multi-course dinner");
	output2(". Suddenly, you fizz from the inside, the contents in your [pc.belly] swirling, mixing, then turning into tiny bubbles that disperse outwards to be infused by the rest of your body. Your [pc.hair] tingles as your belly deflates, your");
	if(pc.hasStatusEffect("Gel Body")) output2(" gooey");
	output2(" body taking its fill to sate your appetite. Once the feeling subsides, the fluid volume is converted over to your biomass reserves and your middle is back to its normal size again");
	if(pc.isPregnant()) output2(", more or less");
	output2(".");
	output2("<i>" + (!pc.isBimbo() ? "Delicious!" : "Mmm, yummy!") + "</i>");
	
	gooBiomass(Math.round(fluidQ));
	pc.flushCumflation();
	
	clearGhostMenu();
	addGhostButton(0, "Next", gooShiftMenu);
}

// Absorbent skin
public function gooCleanSelf():void
{
	clearOutput2();
	
	output2("Your body is definitely covered in sexual fluids, making it obvious to anyone of what activities you have been involved in...");
	output2("\n\nDo you use your absorbent skin to clean yourself off?");
	
	clearGhostMenu();
	addGhostButton(0, "Yes", gooCleanSelfGo);
	addGhostButton(1, "No", gooShiftMenu);
}
public function gooCleanSelfGo():void
{
	clearOutput2();
	
	output2("With some concentration, you stimulate your [pc.skinNoun] to accept the fluids. Your body soaks it up like a sponge, wicking up the sex juices greedily and leaving you a little more cleansed - and a little more filled in the reserves.");
	
	var cumScale:Number = ((pc.statusEffectv1("Cum Soaked") + pc.statusEffectv1("Pussy Drenched")) / 60);
	
	gooBiomass(Math.round(500 * cumScale));
	if(pc.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) gooBiomass(Math.round(500 * cumScale));
	
	pc.removeStatusEffect("Cum Soaked");
	pc.removeStatusEffect("Pussy Drenched");
	
	clearGhostMenu();
	addGhostButton(0, "Next", gooShiftMenu);
}

// Fluid options
public function gooFluidOptions():void
{
	clearOutput2();
	clearGhostMenu();
	
	output2("Being able to manipulate your body, you have the ability to change your expressed fluids to goo at will.");
	
	if(!pc.canLactate() && !pc.hasCock() && !pc.hasVagina())
	{
		output2(" <b>Your body does not have any valid fluids to change at the moment!</b>");
	}
	else
	{
		output2(" Your current bodily fluids are as follows:");
		output2("\n");
		var gooCost:int = 200;
		var btnSlot:int = 0;
		if(pc.canLactate())
		{
			output2("\n<b>Lactation:</b> " + StringUtil.capitalize(pc.fluidColorSimple(pc.milkType)) + " " + GLOBAL.FLUID_TYPE_NAMES[pc.milkType]);
			if(pc.milkType != GLOBAL.FLUID_TYPE_SPECIAL_GOO)
			{
				if(gooBiomass() < gooCost) addDisabledGhostButton(btnSlot, "Goo Lact.", "Goo Lactation Fluid", "You don’t have enough biomass for that.\n\n<b>" + gooCost + " mLs Biomass</b>");
				else addGhostButton(btnSlot, "Goo Lact.", gooFluidOptionsRevert, "milk", "Goo Lactation Fluid", "Change your lactation fluid to goo.\n\n<b>" + gooCost + " mLs Biomass</b>");
			}
			else addDisabledGhostButton(btnSlot, "Goo Lact.", "Goo Lactation Fluid", "Your lactation fluid is already goo!");
			btnSlot++;
		}
		if(pc.hasCock())
		{
			output2("\n<b>Cum Type:</b> " + StringUtil.capitalize(pc.fluidColorSimple(pc.cumType)) + " " + GLOBAL.FLUID_TYPE_NAMES[pc.cumType]);
			if(pc.cumType != GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO)
			{
				if(gooBiomass() < gooCost) addDisabledGhostButton(btnSlot, "Goo Cum", "Goo Cum", "You don’t have enough biomass for that.\n\n<b>" + gooCost + " mLs Biomass</b>");
				else addGhostButton(btnSlot, "Goo Cum", gooFluidOptionsRevert, "cum", "Goo Cum", "Change your cum to goo.\n\n<b>" + gooCost + " mLs Biomass</b>");
			}
			else addDisabledGhostButton(btnSlot, "Goo Cum", "Goo Cum", "Your cum is already goo!");
			btnSlot++;
		}
		if(pc.hasVagina())
		{
			output2("\n<b>Girlcum Type:</b> " + StringUtil.capitalize(pc.fluidColorSimple(pc.girlCumType)) + " " + GLOBAL.FLUID_TYPE_NAMES[pc.girlCumType]);
			if(pc.girlCumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO)
			{
				if(gooBiomass() < gooCost) addDisabledGhostButton(btnSlot, "Goo Femcum", "Goo Girlcum", "You don’t have enough biomass for that.\n\n<b>" + gooCost + " mLs Biomass</b>");
				else addGhostButton(btnSlot, "Goo Femcum", gooFluidOptionsRevert, "girlcum", "Goo Girlcum", "Change your girlcum to goo.\n\n<b>" + gooCost + " mLs Biomass</b>");
			}
			else addDisabledGhostButton(btnSlot, "Goo Femcum", "Goo Girlcum", "Your girlcum is already goo!");
			btnSlot++;
		}
		showBiomass();
	}
	
	addGhostButton(14, "Back", gooShiftMenu);
}
public function gooFluidOptionsRevert(fluidType:String = "none"):void
{
	clearOutput2();
	
	output2("Closing your [pc.eyes] and applying some concentration, you focus your will into your");
	
	switch(fluidType)
	{
		case "milk":
			output2(" lactation glands. You can feel your chest fizz for a moment while your mind clouds, but it soon passes and your discover a change after softly pinching your [pc.nipple]...");
			pc.milkType = GLOBAL.FLUID_TYPE_SPECIAL_GOO;
			output2("\n\n<b>You now lactate [pc.milk] from your [pc.nipples]!</b>");
			break;
		case "cum":
			output2(" masculine glands. You can feel your prostate fizz for a moment while your mind clouds, but it soon passes and your discover a change after gently stroking [pc.oneCock]...");
			pc.cumType = GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO;
			output2("\n\n<b>You now expel [pc.cum] from your [pc.cocks]!</b>");
			break;
		case "girlcum":
			output2(" feminine glands. You can feel your female organs fizz for a moment while your mind clouds, but it soon passes and your discover a change after delicately slipping a finger into [pc.oneVagina]...");
			pc.girlCumType = GLOBAL.FLUID_TYPE_SPECIAL_GOO;
			output2("\n\n<b>You now expel [pc.girlCum] from your [pc.vaginas]!</b>");
			break;
		default:
			output2("... nothing. Welp. Something went wrong here--and you lost some goo to boot. Ack!");
			break;
	}
	
	gooBiomass(-200);
	
	clearGhostMenu();
	addGhostButton(0, "Next", gooShiftMenu);
}


/* Goo Ball Functions */
public function gooballUsed(gooBall:Class):void
{
	pc.destroyItemByClass(gooBall);
	
	clearMenu();
	addButton(0, "Next", useItemFunction);
}
public function gooballOption(arg:Array):void
{
	var gooBall:Class = arg[0];
	var response:String = (arg.length > 1 ? arg[1] : "intro");
	
	var gooColor:String = "";
	switch(gooBall)
	{
		case GooBallRed: gooColor = "red"; break;
		case GooBallOrange: gooColor = "orange"; break;
		case GooBallYellow: gooColor = "yellow"; break;
		case GooBallGreen: gooColor = "green"; break;
		case GooBallBlue: gooColor = "blue"; break;
		case GooBallPurple: gooColor = "purple"; break;
		case GooBallPink: gooColor = "pink"; break;
	}
	
	showName(gooColor.toUpperCase() + "\nGOO BALL");
	
	if(response == "intro")
	{
		output("You consider the blob of ganrael goo, which has formed a slight crust on its surface. If you wanted, you could probably smear it on something to stiffen it... your hair, for example.");
		if (pc.hairType == GLOBAL.HAIR_TYPE_GOO)
		{
			output(" It’d probably change your color if you did, since your hair is also goo.");
			if (pc.skinType == GLOBAL.SKIN_TYPE_GOO || pc.hasSkinFlag(GLOBAL.FLAG_GOOEY)) output(" For that matter, it’d work on your body, too.");
		}
		else if (pc.skinType == GLOBAL.SKIN_TYPE_GOO || pc.hasSkinFlag(GLOBAL.FLAG_GOOEY)) output(" It’d probably change the color of your body too, since your skin is gooey.");
		
		clearMenu();
		if (pc.hairStyle != "spikehawk")
		{
			if (pc.hairStyle == "mohawk") addButton(0, "Spikehawk", gooballOption, [gooBall, "spikehawk"], "Spikey Mohawk", "Shape your mohawk into a spikehawk.");
			else addDisabledButton(0, "Spikehawk", "Spikey Mohawk", "You don’t have a mohawk to spike.");
		}
		else addDisabledButton(0, "Spikehawk", "Spikey Mohawk", "Your hair is currently styled like this!");
		
		if (pc.hairStyle != "quiff")
		{
			if (pc.hairLength >= 5) addButton(1, "Quiff", gooballOption, [gooBall, "quiff"], "Quiff", "Shape your hair into a single sleek, tapered point.");
			else addDisabledButton(1, "Quiff", "Quiff", "Your hair’s too short for this style.");
		}
		else addDisabledButton(1, "Quiff", "Quiff", "Your hair is currently styled like this!");
		
		if (pc.hairStyle != "ringlets")
		{
			if (pc.hairLength >= 10) addButton(2, "Ringlets", gooballOption, [gooBall, "ringlets"], "Ringlets", "Shape your hair into helical loops.");
			else addDisabledButton(2, "Ringlets", "Ringlets", "Your hair’s too short for this style.");
		}
		else addDisabledButton(2, "Ringlets", "Ringlets", "Your hair is currently styled like this!");
		
		if (pc.hairStyle != "curtains")
		{
			if (pc.hairLength >= 10 && pc.hasAntennae()) addButton(3, "Curtains", gooballOption, [gooBall, "curtains"], "Curtains", "Glue your bangs to your antennae and make curtains you can wave around.");
			else if (pc.hairLength < 10) addDisabledButton(3, "Curtains", "Curtains", "You don’t have long enough hair.");
			else addDisabledButton(3, "Curtains", "Curtains", "You don’t have antennae.");
		}
		else addDisabledButton(3, "Curtains", "Curtains", "Your hair is currently styled like this!");
		
		if (pc.hairStyle != "fingerwave")
		{
			addButton(4, "Fingerwave", gooballOption, [gooBall, "fingerwave"], "Fingerwave", "Shape your hair into a wavy, close bob.");
		}
		else addDisabledButton(4, "Fingerwave", "Fingerwave", "Your hair is currently styled like this!");
		
		if (pc.hairStyle != "topknot")
		{
			if (pc.hairLength <= 6) addButton(5, "Topknot", gooballOption, [gooBall, "topknot"], "Topknot", "Put your hair up in an ironclad topknot.");
			else addDisabledButton(5, "Topknot", "Topknot", "You have too much hair for this style.");
		}
		else addDisabledButton(5, "Topknot", "Topknot", "Your hair is currently styled like this!");
		
		if (pc.hairType == GLOBAL.HAIR_TYPE_GOO && pc.hairColor != gooColor) addButton(6, "Dye Hair", gooballOption, [gooBall, "dye hair"], "Dye Hair", "Use the goo to dye your hair.");
		else if (pc.hairType != GLOBAL.HAIR_TYPE_GOO) addDisabledButton(6, "Dye Hair", "Dye Hair", "The gooball can only dye gooey hair types!");
		else addDisabledButton(6, "Dye Hair", "Dye Hair", "Your hair’s already the color of this ball of goo!");
		
		if ((pc.skinType == GLOBAL.SKIN_TYPE_GOO || pc.hasSkinFlag(GLOBAL.TYPE_GOOEY)) && pc.skinTone != gooColor) addButton(7, "Dye Body", gooballOption, [gooBall, "dye body"], "Dye Body", "Use the goo to dye your gooey body.");
		else if (pc.skinTone == gooColor) addDisabledButton(7, "Dye Body", "Dye Body", "Your body is already the same color as this ball of goo!");
		else addDisabledButton(7, "Dye Body", "Dye Body", "Eating this without a gooey body would result in one hell of a blockage.");
		
		addButton(14, "Back", useItemFunction);
		
		return;
	}
	
	clearOutput();
	author("Gardeford/Zeikfried");
	
	switch(response)
	{
		case "spikehawk":
			output("You apply the gel to your mohawk and pinch it into four vicious, punk spikes. The devil on your shoulder is going to get a poke in the eye next time you turn your head.");
			pc.hairStyle = "spikehawk";
			if (pc.hairType == GLOBAL.HAIR_TYPE_GOO && pc.hairColor != gooColor)
			{
				output(" The gel’s color also bleeds through, turning the points " + gooColor + ".");
				pc.hairColor = gooColor;
			}
			break;
		case "quiff":
			output("You slather gel into your " + pc.hairDescript(true, true) + " and, when it begins to harden, put it up into a big, tapered point! Your fans will adore it.");
			pc.hairStyle = "quiff";
			if (pc.hairType == GLOBAL.HAIR_TYPE_GOO && pc.hairColor != gooColor)
			{
				output(" The color also swamps your gooey locks, turning them " + gooColor + ".");
				pc.hairColor = gooColor;
			}
			break;
		case "ringlets":
			output("You slather your " + pc.hairDescript(true, true) +" one lock at a time and twist it around your fingers. The gel");
			pc.hairStyle = "ringlets";
			if (pc.hairType == GLOBAL.HAIR_TYPE_GOO && pc.hairColor != gooColor)
			{
				output(" bleeds color through your goopy drape and");
				pc.hairColor = gooColor;
			}
			output(" hardens your ‘do into " + pc.hairColor + ", bouncy ringlets. Cute!");
			break;
		case "curtains":
			output("You smear gel onto your antennae and then stick your bangs to them. The gel hardens, and you can move them to open your hair like drapes. Now you can flash people with your face!");
			pc.hairStyle = "curtains";
			if (pc.hairType == GLOBAL.HAIR_TYPE_GOO) pc.hairColor = gooColor;
			else if (pc.hairType == GLOBAL.HAIR_TYPE_TENTACLES) output(" Well, you could before, but now it looks theatrical.");
			break;
		case "fingerwave":
			output("You rub the gel into your " + pc.hairDescript(true, true) + " and crimp it into waves for a classy, classic look.");
			pc.hairStyle = "fingerwave";
			if (pc.hairType == GLOBAL.HAIR_TYPE_GOO && pc.hairColor != gooColor)
			{
				output(" The gel’s color also spreads, turning your gooey locks " + gooColor + ".");
				pc.hairColor = gooColor;
			}
			output(" <i>Très chic</i>.");
			break;
		case "topknot":
			output("You apply the gel to your " + pc.hairDescript(true, true) + " and then pin it up in a tight topknot. It’s solid enough to anchor a helmet");
			pc.hairStyle = "topknot";
			if (pc.hairType == GLOBAL.HAIR_TYPE_FEATHERS)
			{
				output(", and you even fan the tips of your feathers into a gingko leaf shape");
			}
			output("!");
			if (pc.hairType == GLOBAL.HAIR_TYPE_GOO && pc.hairColor != gooColor)
			{
				output(" The ball’s color also swamps your own, changing your hair to " + gooColor + ".");
				pc.hairColor = gooColor;
			}
			break;
		case "dye hair":
			output("You carefully work the gel into your " + pc.hairDescript(true, false) + ", doing your utmost not to disturb your hairstyle in the process. In a matter of seconds your locks begin to soak up the shade of the gel, changing your hair to " + gooColor + ".");
			pc.hairColor = gooColor;
			break;
		case "dye body":
			output("You stare down the glob like a horse pill and then throw it in your hatch. It feels like swallowing cotton. By the time it reaches your chest, it’s already begun to leak a cloud of color which radiates all over, making you stiff and slightly numb. <b>When full sensation comes back, your skin is " + gooColor + "!</b>");
			pc.skinTone = gooColor;
			break;
	}
	
	gooballUsed(gooBall);
}

