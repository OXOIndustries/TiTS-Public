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
	showName("\nZO'DEE");
}

public function zodeeGivesFirstGalomax():void
{
	showName("A\nSTRANGER");
	showBust("ZODEE");
	output("\n\nThere's another rusher here - a rahn by the looks of it. She's dressed in a pale white jumpsuit that hides most of her gleaming teal, gelatinous skin from view but does little to conceal the weighty jiggle of her chest. Her hands are in her pack, sorting through enough gleaming prizes to make your belly clench with envy, and her plump rump is positioned perfectly to entice you with its restless wiggles. Just how much did she find before you could get to here?");
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
	output("\n\nZo’dee shrugs nonchalantly, but your eyes are firmly drawn to the wiggle of her hips, brought out in stark relief by the glistening shine of her bodysuit, as she walks away. <i>“Maybe. Be careful with that GaloMax by the way. I hear it’s pretty permanent. Or get as much as you can, I don’t really care. Maybe I want you all gooey and slutty~?”</i>\n\n");
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
	pc.lust(5);
	flags["ZODEE_GALOQUEST"] = 2;
	//[Help Her] [Buy It] [Nope]
	clearMenu();
	addButton(2,"Nope",nopeZodeeIDontWantShit,undefined,"Nope","Turn down her offer and be on your way.");
	addButton(0,"Help Her",helpZodeeWithHerEggProblem,undefined,"Help Her","Help her squeeze out some eggs for GaloMax.");
	if(pc.credits >= 500) addButton(1,"Buy It",buyGaloMaxFromZodee,undefined,"Buy It","Offer to buy the GaloMax off her for 500 credits. That’s a good deal, right?\n\n<b>500 credits</b>");
	else addDisabledButton(1,"Buy It","Buy It","You could offer to buy the GaloMax off her for 500 credits... if only you had the money for it.\n\n<b>500 credits</b>");
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
	output("\n\nThe gelatinous girl is biting her lower lips and watching you with rapt attention, grunting and shaking her hips, slamming her spurting ovipositor into your fingers as hard as she can. She’s straight-up fucking your hand at this point. All you have to do is hold on and squeeze at the right moments to make the orgasmically addled alien moan and spurt. Ribbons of gooey relief intermingle with your squelching knuckles, filling the air with the lewdest slaps imaginable.");
	output("\n\nAnother egg lands in a rapidly expanding puddle with a squelch, kicking droplets of mixed ivory-emerald spunk onto your ");
	if(pc.hasToes()) output("toes");
	else output("[pc.footOrFeet]");
	output(". Zo’dee bucks powerfully another few times, expelling two more orbs, yet her frenetic motions die down afterward, expended. More eggs still lie within her. You can feel them rolling past your palm, pushed into position by whatever her race has in place of muscles. But Zo’dee seems spent. Her eyes are closed, her tongue is hanging free, and her antennae are drooping so low they verge on pressing against her face.");
	output("\n\nWeak twitches are the most your cummed-out companion can offer, but you did promise her you would help her with her egg problem. And there are still so many eggs to wring out of her.");
	output("\n\nShifting position, you ease Zo’dee onto the ground with her legs akimbo, splayed to either side of the puddle of eggs and rahn-butter. Then, squatting behind her, you get both hands on her still-stuffed ovipositor and work it over in earnest. She whimpers and cums again, splattering a half-dozen eggs onto the pile in rapid succession. You don’t pause or slow, mercilessly stroking her off, pumping her with sure, firm strokes until her body stops offering you more eggs - and the flood of creamy spooge tapers down to a drizzle.");
	output("\n\nZo’dee’s head lolls back, and she looks at you with dazzling smile. <i>“O-oh, I might have to keep you...”</i> She grabs your head and forcefully kisses you, popping free with a ‘Mwah~’");
	output("\n\nYou stumble up, a little confused at her sudden recovery and fumbling for your words.");
	output("\n\n<i>“Maybe next time I’ll have you suck me off even when I’m </i>not<i> full of eggs. I bet that mouth of yours is just as good as your hands.”</i> Zo’dee produces the bottle of GaloMax and chucks it your way. <i>“See ya around, slut.”</i>");
	output("\n\nYou catch the bottle and shake it. A single pill rattles around inside.");
	output("\n\nThe teal rahn is already on her feet and lacing up her jumpsuit. She favors you with a mischievous smile, stretches out like a cat, and prances off into the wilds, brandishing her pistol.");
	output("\n\nWeird.\n\n");
	pc.lust(15);
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
		if(pc.WQ() < 50) output("\n\nThrough sheer force of will, you drag your hands away before you can bloody your own pate. You grit your teeth and grunt, doing your best to ignore the way the throb in your head and the slowly growing burn of exotic, onsite genetic engineering. Just when you’re about to cave in and itch away, the sensory onslaught abates, leaving a cool wetness in its wake.");
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

		output("\n\nYou have to get a good look at it! Pulling out your Codex, you boot up the holocam and get your first look at your semi-solid locks, discovering a mop of " + pc.hairColor + " locks a few inches long. It looks like it’ll drip off you at any moment, but somehow the mass maintains its shape and position. It might look better parted another way, you muse.");
		output("\n\nAnd just like that, the part shifts from one side of your head to the other. You nearly drop the Codex in surprise. Somehow, you’re able to control the shape of your hair. What about the length? How would you look with a buzz cut or shoulder-length goo?");
		output("\n\nThe buzz cut is easy. You manage that in the blink of an eye, absorbing the extra mass back inside yourself, but when you imagine it longer, it merely returns to its old size, chased by the kind of full-body ache you might get after an entire day without a bite to eat. You’ll need to eat something to make it any longer... or find some other way to provide your goo with additional proteins and biomass.");
		if(pc.isTreated() && pc.isBro()) output(" You probably just need to top off the tank with some cow-girl milk. Nothing like a big-boobed slut in your lap to fill up the tank.");
		else if(pc.isBimbo()) 
		{
			output(" You lick your lip and giggle. This is nothing a little cock can’t fix. You’ll have beautiful, long goo hair in no time!");
			if(flags["MET_KIRO"] != undefined) output(" Maybe Kiro is in town?");
		}
		output("\n\nNo other changes seem forthcoming. You’ll need another GaloMax to get any gooeyer.");
		//Uncool hair colors are changed to green, blue, or some other standard goo color. Maybe consult codex to see what choices we have?
		pc.hairColor = colorSelect;
		pc.hairType = GLOBAL.HAIR_TYPE_GOO;
	}
	//Dose 2
	//Sexual fluids replaced with hairColor slime + biomass vent (increases cumQ or girlCumQ by biomass quantities. Toggled in goo submenu)
	else if(flags["GALOMAX_DOSES"] == 2)
	{
		output("This time, there is no itch. There is no painful ache slithering through your skull. Instead, your heart flutters, beating faster and harder. Is this it? Is your whole body going to go from solid to liquid in the span of a few minutes? Your [pc.skinNoun] doesn’t feel any different");
		if(pc.hasFur() || pc.hasScales() || pc.hasFeathers()) output(", nor your [pc.skinFurScales]");
		output(". You’re just getting... warm... kind of hot really. Like sitting in a tub with water that’s a touch too warm, or snuggling into a hot-blooded lover’s arms while the climate control is on the fritz. That warmth flows radiates out through your whole body, but most of it sinks down, a thick flow that settles deep into your crotch to glow with unnatural lust.");
		pc.girlCumType = GLOBAL.FLUID_TYPE_SPECIAL_GOO;
		pc.cumType = GLOBAL.FLUID_TYPE_SPECIAL_GOO;
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
			output("\n\n<b>You have a pussy! A hot one that’s apparently sprung a leak if the sopping squeeze around your fingertips is any indication.</b> You pry your dancing fingers away before they decide to wring an orgasm from your new-budding clit, and gasp at the fluid coating your fingers.");
			if(pc.fluidColorSimple(pc.girlCumType) != pc.hairColor) output(" It’s [pc.hairColor]! <b>Your sexual secretions have turned [pc.hairColor] and have an extremely slimy consistency.</b>");
			else output(" <b>Your sexual secretions are more slime-like than ever before, and the color is richer somehow, a slippery counterpart to your hair.</b>");
			output("\n\nThere’s no stopping the torrid flow from your new orifice either. It dribbles freely even without aid from your slick fingers or decidedly more libidinous mind. It’ll probably squirt from the tiniest of orgasms. Your hand twitches in anticipation, wondering if your new, extra-gooey cunny will give off a little jet of lust or a whorish splatter. Maybe, like with your hair, you could direct your body’s biomass to enhance the effect?");
			output("\n\nOnly one way to find out!");
		}
		//Dicks and Cunts
		if(pc.hasCock() && pc.hasVagina())
		{
			output("\n\nYou’re helpless against the tide of lust rolling into your nethers, steadily filling your [pc.cocks] and flooding your [pc.vaginas]. You get hard - rock hard. A boner this rigid could chop wood. And you’re wet, wetter than terran monsoon. Moisture ");
			if(!pc.isCrotchGarbed()) output("dribbles in thin streams down your thighs");
			else output("sticks to the inside of your [pc.lowerGarment]");
			output(", and you know that all you have to do is dip a finger inside to turn the trickles into streams of lusty drool. Biting your lip, you struggle to keep your hands away, but it’s a futile effort.");
			output("\n\nYour fingers know where they belong, know where they can touch to bring relief, where they can stroke to make your nerves dance pirouettes of bliss. They make the journey into ");
			if(pc.totalVaginas() == 1) output("your");
			else output("an");
			output(" oozing snatch before you’re consciously aware of it. ");
			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output("They don’t care that you’re in public, out where anyone could see you. If peacekeepers show up, they’ll have to pry them out with a crowbar.");
			else output("They don’t care a whit about your location. If you were out in public, they’d still be knuckle-deep inside you. The peacekeepers would have to pry them out of you with a crowbar");
			output(". Your other hand settles on [pc.oneCock] and begins to stroke, and pre-cum spills out in eager response. Everything feels so hot and wet, and the faster you masturbate, the slipperier you get.");
			output("\n\nYour boundless sex juices fill your palms to overflowing, and you instinctively smear it all over your genitals, your own slippery, gooey lubricant. It provides the perfect mix of slickness and friction, just enough to ease the passage of your hands’ back and forth motions. You squelch and stroke and whine, dribbling down your [pc.legOrLegs] - so wet... so very, very wet. Your cock");
			if(pc.cockTotal() > 1) output("s are fountains");
			else output("is a fountain");
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
			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output("They don’t care that you’re in public, out where anyone could see you. If peacekeepers show up, they’ll have to pry them off with a crowbar.");
			else output("They don’t care a whit about your location. If you were out in public, they’d still be wrapped around your length. The peacekeepers would have to pry them off of you with a crowbar");
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
			output("\n\nYou’re helpless against the tide of lust rolling into your nethers, steadily flooding your [pc.vaginas]. You get wet, wetter than terran monsoon. Whatever that GaloMax is doing to you, it’s doing a better job than a date with a porn star. Moisture ");
			if(!pc.isCrotchGarbed()) output("dribbles in thin streams down your thighs");
			else output("sticks to the inside of your [pc.lowerGarment]");
			output(", and you know that all you have to do is dip a finger inside to turn the trickles into streams of lusty drool. Biting your lip, you struggle to keep your hands away, but it’s a futile effort.");
			output("\n\nYour fingers know where they belong, know where they can touch to bring relief, where they can stroke to make your nerves dance pirouettes of bliss. They make the journey into ");
			if(pc.totalVaginas() == 1) output("your");
			else output("an");
			output(" oozing snatch before you’re consciously aware of it. ");
			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) output("They don’t care that you’re in public, out where anyone could see you. If peacekeepers show up, they’ll have to pry them out with a crowbar.");
			else output("They don’t care a whit about your location. If you were out in public, they’d still be knuckle-deep inside you. The peacekeepers would have to pry them out of you with a crowbar.");
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
		output(". Standing up seems to difficult, all of a sudden, and you drop to the floor");
		if(pc.isCrotchGarbed()) output(", shedding your [pc.lowerGarments] as you go");
		output(".");
		//Used haircolor since that’s what we’re setting gooshit off of.
		output("\n\nRibbons of viscous juice spill from your ");
		if(pc.hasCock()) 
		{
			output("[pc.cocks]");
			if(pc.hasVagina()) output(" and ");
		}
		if(pc.hasVagina()) output("[pc.vaginas]");
		output(", oozing along your bizarrely clenching ");
		if(pc.hasCock()) output("[pc.cockColor]");
		else output("[pc.vaginaColor]");
		output(" skin, painting it [pc.cumColor] in its wake. It almost looks like you’re cumming, but without the enjoyment the associated act would entail. Instead, you’re slumped on the floor, trying not to slump over while paradoxical contractions wreath you in tingling goo.");
		output("\n\nIt does feel kind of good, in an unusual kind of way. You feel like a passenger in a remote-controlled body, one that insists on making its crotch so hot that it threatens to liquefy under the deluge. It’d be maddening if you hadn’t expected something like this to happen. Rapid pants, whining gasps, and splatters fill the air with their lurid echoes. Aeons seem to pass while you lie there, fruitlessly twitching, bathing your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("crotch");
		output(" in goo. Just when you fear it will never end, the flow stops, and your head clears.");
		output("\n\nYou try to clean up, but no matter how much of the gooey slop you wipe away, there always seems to be more underneath. No amount of toweling off seems to help");
		if(pc.hasCock())
		{
			output(", and it isn’t until you see your fingers <i>through</i> ");
			if(pc.cockTotal() > 1) output("a");
			else output("your");
			output(" semi-transparent cock that you realize what’s happened.");
		}
		else output(", and it isn’t until you see the edge of a finger through a freshly-cleaned nether-lip that you realize what’s happened.");
		output(" <b>Your genitalia... your whole pubic mound, really, has become [pc.hairColor] and gooey, just like your hair.</b>");
		output("\n\n<i>Maybe you can shift things around down there too...</i>");
		pc.createStatusEffect("Goo Crotch");
		//Elasticity to 3
		//Cocks/Cunts to goo
		pc.elasticity = 3;
		for(var x:int = 0; x < pc.totalCocks(); x++)
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
	
	// PLACEHOLDER - Failsafe, Overlimit, What do?
	// 9999 (Fill this in with your content if necessary!)
	else
	{
		output("Oh...");
		output("\n\nOoh...");
		output("\n\nAnd... nothing happens.");
		output("\n\nSeems like that GaloMax pill didn't have any effect on you this time.");
		if(flags["GOO_BIOMASS"] != undefined && rand(2) == 0)
		{
			output("..");
			output("\n\nSuddenly, you feel a surge of biomass flow into your body. Well, it did have an effect after all!");
			flags["GOO_BIOMASS"] += 1000;
		}
	}
}

//Goo Options submenu.
public function gooShiftMenu():void
{
	clearOutput2();
	output2("Now that you’re ");
	if(!pc.isGoo()) output2("part");
	else output2("a");
	output2(" goo creature, you can resize the goo’ed up parts of your form however you like. Which part of yourself will you focus on?");
	showBiomass();
	clearGhostMenu();
	if(pc.hairType == GLOBAL.HAIR_TYPE_GOO) addGhostButton(0, "Hair", gooHairAdjustmenu);
	else addDisabledGhostButton(0, "Hair");
	if(pc.hasStatusEffect("Goo Crotch")) addGhostButton(1,"Crotch",gooCrotchCustomizer);
	else addDisabledGhostButton(1,"Locked","Locked","It takes three doses of GaloMax to unluck this option.");
	//addGhostButton(1, "Male", setGenderPref, "male");
	//addGhostButton(2, "Auto", setGenderPref, "auto");
	if(pc.hasStatusEffect("Goo Vent")) addGhostButton(4,"ToggleVent",ventToggle,undefined,"Toggle Vent","Toggle on or off whether you would like to add excess biomass to your own orgasmic releases.");
	else addDisabledGhostButton(4,"Locked","Locked","It takes two doses of GaloMax to unlock this option.");
	addGhostButton(14, "Back", appearance, pc);
}

public function showBiomass():void
{
	if(flags["GOO_BIOMASS"] == undefined) flags["GOO_BIOMASS"] = 0;
	output2("\n\n\tBiomass Reserve: " + flags["GOO_BIOMASS"] + " mLs");
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
	else output2("a " + pc.hairStyle);
	output2(" style. Will you do anything with it?");
	showBiomass();
	//[Lengthen] [Shorten] [Style]
	clearGhostMenu();
	addGhostButton(0,"Lengthen",lengthenHairGoo,undefined,"Lengthen","Put 100 mLs of biomass into adding an inch to your hair.");
	if(pc.hasHair()) addGhostButton(1,"Shorten",shortenHairGoo,undefined,"Shorten","Shorten your gooey hair, regaining a portion of its biomass.");
	else addDisabledGhostButton(1,"Shorten","Shorten","You've got to have hair in order to shorten it!");
	addGhostButton(2,"Style",newGooStyle,undefined,"Style","Style your hair into a more pleasing shape.");
	addGhostButton(14,"Back",gooShiftMenu);
	
}

//Lengthen
public function lengthenHairGoo():void
{
	clearOutput2();
	//Below 100 Biomass
	if(flags["GOO_BIOMASS"] < 100) 
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
		flags["GOO_BIOMASS"] -= 100;
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
	flags["GOO_BIOMASS"] += 75;
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
	else if(pc.hairStyle != "ponytail") addDisabledGhostButton(1,"Ponytail","Ponytail","Your hair isn't long enough to get put into a ponytail.");
	else addDisabledGhostButton(1,"Ponytail","Ponytail","You already have a ponytail.");
	//[Pigtails]
	if(pc.hairStyle != "pigtails" && pc.hairLength >= 5) addGhostButton(2,"Pigtails",gooStyle,"pigtails","Pigtails","Style your hair into pigtails.");
	else if(pc.hairStyle != "pigtails") addDisabledGhostButton(2,"Pigtails","Pigtails","Your hair isn't long enough to get put into pigtails.");
	else addDisabledGhostButton(2,"Pigtails","Pigtails","You already have a ponytail.");
	//[Curls]
	if(pc.hairStyle != "curls") addGhostButton(3,"Curls",gooStyle,"curls","Curls","Style your hair into curls.");
	else addDisabledGhostButton(3,"Curls","Curlse","You already have your hair curled.");
	//[Braided]
	if(pc.hairStyle != "braided" && pc.hairLength >= 5) addGhostButton(4,"Braided",gooStyle,"braided","Braided","Style your hair into a braid.");
	else if(pc.hairStyle != "braided") addDisabledGhostButton(4,"Braided","Braided","Your hair isn't long enough to be braided.");
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
	output2("You use your Codex’s Holocam to check your appearance as your hair miraculously assumes the chosen shape. There’s a certain thrill in being able to alter your looks so effortlessly on your own, without something as barbaric as a pair of clippers of styling gel. You’re your own styling gel!");
	pc.hairStyle = arg;
	output2("\n\n<b>You have a new hairstyle: " + pc.hairStyle + "</b>");
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
	if(flags["GOO_BIOMASS"] >= 500) 
	{
		if(pc.cockTotal() < 10) addGhostButton(0,"Grow One",growANewGooCock,undefined,"Grow One","Grow a new, gooey penis.\n\n<b>500 mLs Biomass</b>");
		else addDisabledGhostButton(0,"Grow One","Grow One","There's not room for any more penises!");
	}
	else addDisabledGhostButton(0,"Grow One","Grow One","You don't have enough biomass for that.\n\n<b>500 mLs Biomass</b>");

	if(pc.hasCock()) 
	{
		if(flags["GOO_BIOMASS"] >= 100 && pc.cockTotal() == 1 && pc.cocks[0].hasFlag(GLOBAL.FLAG_GOOEY)) addGhostButton(1,"Reshape",reshapeACaaaawk,undefined,"Reshape","Change the shape of your penis.\n\n<b>100 mLs Biomass</b>");
		else if(flags["GOO_BIOMASS"] >= 100) addGhostButton(1,"Reshape",reshapeACaaaawk,undefined,"Reshape","Change the shape of a penis.\n\n<b>100 mLs Biomass</b>");
		else addDisabledGhostButton(1,"Reshape","Reshape","You lack sufficient biomass to reshape your penis.\n\n<b>100 mLs Biomass</b>");
		if(pc.cockTotal() == 1 && pc.cocks[0].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			var cockCost:Number = costGooCockLengthen(0, 2);
			addGhostButton(2,"Lengthen",lengthenGooCock,undefined,"Lengthen","Put some biomass to work making your endowment longer.\n\n<b>" + cockCost + " mLs Biomass</b>");
			addGhostButton(3,"Shorten",shortenADick,undefined,"Shorten","Shorten your penis and reclaim some of its biomass.");
			addGhostButton(5,"Remove",removeGooCockRoot,undefined,"Remove","Remove your penis, returning it to plain goo.");
		}
		else
		{
			
			addGhostButton(2,"Lengthen",lengthenGooCock,undefined,"Lengthen","Put some biomass to work making an endowment of your choice longer.");
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
			if(pc.cockTotal() == numGooCocks) addGhostButton(6,"Remove All",removeAllGooCocks,undefined,"Remove All Cocks","Remove all penises.");
			else addDisabledGhostButton(6,"Remove All","Remove All","Your penises aren't all made of goo and cannot be removed at the same time.");
		}
		else addDisabledGhostButton(6,"Remove All","Remove All","You don't have multiple goo penises to try this.");
	}
	else
	{
		addDisabledGhostButton(1,"Reshape","Reshape","You have no penis to reshape.");
		addDisabledGhostButton(2,"Lengthen","Lengthen","You have no penis to lengthen.");
		addDisabledGhostButton(3,"Shorten","Shorten","You have no penis to shorten.");
		addDisabledGhostButton(5,"Remove 1","Remove 1","You don't have a penis to remove.");
		addDisabledGhostButton(6,"Remove All","Remove All","You don't have a penis to remove.");
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
		if(flags["GOO_BIOMASS"] >= nutGrowCost()) addGhostButton(0, "Grow Testicle", growSomeGooBalls,undefined,"Grow Testicle","Grow a new testicle.\n\n<b>" + nutGrowCost() + "mLs Biomass</b>");
		else addDisabledGhostButton(0,"Grow Testicle","Grow Testicle","You do not have enough biomass for this.\n\n<b>" + nutGrowCost() + "mLs Biomass</b>");
	}
	else addDisabledGhostButton(0,"Grow Testicle","Grow Testicle","You have as many testicles as possible.");
	if(pc.balls > 0) addGhostButton(1,"Remove One",removeATesticle,undefined,"Remove One","Remove a testicle.");
	else addDisabledGhostButton(1,"Remove One","Remove One","You have no testicles to remove.");
	if(pc.balls > 0)
	{
		if(flags["GOO_BIOMASS"] >= nutExpansionCost()) addGhostButton(2,"Expand Balls",expandoNuts,undefined,"Expand Balls","Expand the diameter of your balls by approximately one inch.\n\n<b>" + nutExpansionCost() + "</b>mLs Biomass</b>");
		else addDisabledGhostButton(2,"Expand Balls","Expand Balls","You don't have the necessary biomass to expand your testicular endowments.\n\n<b>" + nutExpansionCost() + "</b>mLs Biomass</b>");
		if(pc.ballDiameter() > 1) addGhostButton(3,"Shrink Balls",nutShrinkGo,undefined,"Shrink Balls","Reduce the size of your testicular endowments significantly.");
		else addDisabledGhostButton(3,"Shrink Balls","Shrink Balls","You can't get any smaller down there!");

		if(pc.hasStatusEffect("Uniball")) addGhostButton(5,"Loosen Sack",tautSackToggle,undefined,"Loosen Sack","Let your nutsack hang a little lower and freer.");
		else if(flags["GOO_BIOMASS"] >= 100) addGhostButton(5,"Tighten Sack",tautSackToggle,undefined,"Tighten Sack","Tighten up your nutsack into a nice, smooth bulge.\n\n<b>100mLs Biomass</b>");
		else addDisabledGhostButton(5,"Tighten Sack","Tighten Sack","You don't have enough biomass to tighten your sack into a nice, smooth bulge.");
	}
	else 
	{
		addDisabledGhostButton(2,"Expand Balls","Expand Balls","You don't have balls to expand.");
		addDisabledGhostButton(3,"Shrink Balls","Shrink Balls","You don't have any balls to shrink!");
		addDisabledGhostButton(5,"Sack Options","Sack Options","If you had balls, you could use this button to make your nutsack pull up high and tight or swing low and free.");
	}
	addGhostButton(14,"Back",gooShiftMenu);
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
	return trueCost;
}

public function nutShrinkGo():void
{
	clearOutput2();
	output2("You sag with relief as your body reabsorbs some of the weight from your [pc.sack]. Getting around will certainly be a little easier!");
	flags["GOO_BIOMASS"] += nutShrinkCost();
	pc.ballSizeRaw = (pc.ballSizeRaw/Math.PI-1) * Math.PI;
	trace("FINAL ACTUAL VOL: " + pc.ballVolume());
	clearMenu();
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
	return trueCost;
}

public function expandoNuts():void
{
	clearOutput2();
	if(pc.balls == 1)
	{
		if(pc.ballDiameter() < 1) output2("Your [pc.balls] abruptly puffs up with new mass, swelling on command. The addition of new biomass roughly doubles the size of your endowment, causing you to feel swollen and vaguely horny. You can probably cum so much right now!");
		else if(pc.ballDiameter() < 2) output2("A channel of syrupy biomass forms between your pubic mound and the low-hanging fruit of your loins, reinforcing your [pc.balls] with enough new weight to make it wobble and jiggle as it expands. The experience leaves you feeling vaguely horny.");
		else if(pc.ballDiameter() < 3) output2("Your plump nut wobbles as you focus on enhancing its girth, swelling out with new, virile goo with every beat of what you assume is your heart. The experience leaves you hot enough to melt - or try cumming a few times just to judge the effectiveness of your enhanced organ.");
		else if(pc.ballDiameter() < 5) output2("You're more than big enough to be considered well-endowed by most galactic species, but you want your [pc.balls] to be bigger, heavier. You want your dripping-wet sack to jiggle with every step you make, to bulge your clothes and promise a swift impregnation to those daring enough to let you get too close.\n\nRipples roll across the surface of your expanding sperm-factory while it trembles and grows, flooding with fresh mass. You stagger, feeling light-headed from the effort of it all, but when the feeling passes, you've got a bigger, bulgier ball.");
		else if(pc.ballDiameter() < 10) output2("Forcing yet more goo into the overtaxed sack between your legs, you gradually expand your [pc.balls]. The bigger it gets, the heavier each expansion seems to be and the more wildly erotic your orgasms will become. You can only imagine the deluge you'll release when you get off after this. You're a one-" + pc.mf("man","woman") + " bukkake show, and if you keep this up, you'll need to upgrade the ship's plumbing.");
		else output2("If there are gods, out there in the void, they must have a [pc.balls] like yours. The melon-sized spunk-tank is constantly swaying and bouncing, jiggling wetly at the slightest contact. Merely pouring additional mass into your overstuffed sack has it threatening to throw you off balance with its ungainly wobbling.");
	}
	else
	{
		if(pc.ballDiameter() < 1) output2("Your [pc.balls] abruptly puff up with new mass, swelling on command. The addition of new biomass roughly doubles the size of your endowment, causing you to feel swollen and vaguely horny. You can probably cum so much right now!");
		else if(pc.ballDiameter() < 2) output2("Channels of syrupy biomass forms between your pubic mound and the low-hanging fruit of your loins, reinforcing your [pc.balls] with enough new weight to make them wobble and jiggle as they expand. The experience leaves you feeling vaguely horny.");
		else if(pc.ballDiameter() < 3) output2("Your plump nuts wobble as you focus on enhancing their girth, swelling out with new, virile goo with every beat of what you assume is your heart. The experience leaves you hot enough to melt - or squirt.");
		else if(pc.ballDiameter() < 5) output2("You're more than big enough to be considered well-endowed by most galactic species, but you want your [pc.balls] to be bigger, heavier. You want your dripping-wet sack to jiggle with every step you make, to bulge your clothes and promise a swift impregnation to those daring enough to let you get too close.\n\nRipples roll across the surface of your expanding sperm-factories while they tremble and grow, flooding with fresh mass. You stagger, feeling light-headed from the effort of it all, but when the feeling passes, you've got bigger, bulgier balls.");
		else if(pc.ballDiameter() < 10) output2("Forcing yet more goo into the overtaxed sack between your legs, you gradually expand your [pc.balls]. The bigger they get, the more you have to push inside to make an appreciable difference in size, and the more wildly erotic your orgasms will become. You can only imagine the deluge you'll release when you get off after this. You're a one-" + pc.mf("man","woman") + " bukkake show, and if you keep this up, you'll need to upgrade the ship's plumbing.");
		else output2("If there are gods, out there in the void, they must have [pc.balls] like yours. The melon-sized spunk-tanks are constantly swaying and bouncing, jiggling wetly at the slightest contact. Merely pouring additional mass into your overstuffed sack has it threatening to throw you off balance with its ungainly wobbling.");
	}
	flags["GOO_BIOMASS"] -= nutExpansionCost();
	pc.ballSizeRaw = (pc.ballSizeRaw/Math.PI+1) * Math.PI;
	trace("FINAL ACTUAL VOL: " + pc.ballVolume());
	pc.lust(15);
	while(pc.lust() < 33) { pc.lust(5); }
	clearMenu();
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
		output2(". You've got a tight, aesthetically pleasing nutsack. It shines as if polished.");
		flags["GOO_BIOMASS"] -= 100;
	}
	else 
	{
		pc.removeStatusEffect("Uniball");
		flags["GOO_BIOMASS"] += 75;
		output2("The complex weave of gelatinous lattices in your [pc.sack] collapses right on cue, allowing you to reabsorb most of the reinforcement and let your [pc.balls] swing low and heavy once more. No more tightly-packed testes for you, no sir!");
	}
	clearMenu();
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
	output2("As easily as snapping your fingers, you're down one testicle");
	if(pc.balls == 1) output2(", leaving your [pc.sack] to shrink back into the smooth fluid encompassing your pubic mound");
	output2(". Now you can put that biomass to better use...");
	flags["GOO_BIOMASS"] += nutLossCost();
	pc.balls--;
	clearMenu();
	addGhostButton(0,"Next",gooBallsMenu)
}

//1 nut = 300 biomass
public function growSomeGooBalls():void
{
	clearOutput2();
	if(pc.balls == 0) {
		if(!pc.hasCock()) output2("Other people might call you crazy for wanting a bulging ballsack without even a single penis to vent the sperm with, but you don't care. You direct your amorphous crotch to fill out a gelatinous flap of skin, rolling a semi-solid lump of spunk-churning delightfulness.\n\nNow that you've got one perfect nut, perhaps you could give it a twin?");
		else output2("It's never to late to gift your [pc.cocks] a weighty, spunk-churning companion. Gripping a fold of aqueous skin, you tug it, shaping it into an empty sack just in time for a nicely-rounded ball of gelatinous nutflesh to slide down into it.\n\nYou can already feel your single nut brewing up a fresh batch of [pc.cumNoun]. Maybe you should give it a companion?");
		pc.ballSizeRaw = 3.4;
	}
	else if(pc.balls == 1)
	{
		output2("Envisioning your [pc.sack] with a second, identical lump inside, you revel in the sensation of your slimy loins forging a second testicle, building an oblong organ up from the size of a marble until it's big enough to match its brother.\n\nYou've got two gooey balls.");
	}
	else
	{
		output2("You grab hold of your slippery sack and give the semi-solid nuts inside a familiar squeeze. Why stop at " + num2Text(pc.balls) + " balls when you can have even more? You bid your reserves of organic matter to flow down into your [pc.sack], pumping it up with a dripping-wet orb, a syrupy-slick spunk-factory. You finish crafting the new testicle in a matter of seconds. It bulges");
		if(pc.legCount > 1) output2(" against your [pc.legs] ");
		else output2(" against your [pc.leg] ");
		output2("with every movement, a potent reminder of how egregiously sexual you've become.")
	}
	flags["GOO_BIOMASS"] -= nutGrowCost();
	pc.balls++;
	clearMenu();
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
			addGhostButton(x,upperCase(num2Text(x+1)),reshapeAGooCawkForReaaaaal,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Shift the shape of this penis.\n\n<b>100 mLs Biomass</b>");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.CockShape " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","This penis isn't made of goo.");	
		}
	}
	showBiomass();
	addGhostButton(14,"Back",gooCockRootMenu);
}
public function reshapeAGooCawkForReaaaaal(arg:int = 0):void
{
	clearOutput2();
	output2("What new shape would you like to give your [pc.cockNoun " + arg + "]?");
	clearGhostMenu();
	/*
	addGhostButton(0,"Terran",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_HUMAN]);
	addGhostButton(1,"Equine",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_EQUINE]);
	addGhostButton(2,"Canine",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_CANINE]);
	addGhostButton(3,"Feline",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_FELINE]);
	addGhostButton(4,"Vulpine",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_VULPINE]);
	addGhostButton(5,"Zil",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_BEE]);
	addGhostButton(6,"Draconic",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_DRACONIC]);
	addGhostButton(7,"Snake-like",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_SNAKE]);
	addGhostButton(8,"Demonic",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_DEMONIC]);
	addGhostButton(9,"Kui-tan",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_KUITAN]);
	addGhostButton(10,"Tentacle",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_TENTACLE]);
	*/
	
	var cTypes:Array = [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_SNAKE, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_VULPINE];
	// Unlockables
	if(flags["MET_SERA"] != undefined)
		cTypes.push(GLOBAL.TYPE_DEMONIC);
	if(CodexManager.entryViewed("Venus Pitchers") || CodexManager.entryUnlocked("Cockvines"))
		cTypes.push(GLOBAL.TYPE_TENTACLE);
	if(CodexManager.entryUnlocked("Zil"))
		cTypes.push(GLOBAL.TYPE_BEE);
	if(CodexManager.entryUnlocked("Fanfir") || CodexManager.entryViewed("The Dragon's Hoard"))
		cTypes.push(GLOBAL.TYPE_DRACONIC);
	
	var newType:Number = 0;
	for(var x:int = 0; x < cTypes.length; x++)
	{
		newType = cTypes[x];
		if(newType == GLOBAL.TYPE_HUMAN) addGhostButton(x,"Terran",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_HUMAN]);
		else if(newType == GLOBAL.TYPE_SNAKE) addGhostButton(x,"Snake-like",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_SNAKE]);
		else if(newType == GLOBAL.TYPE_BEE) addGhostButton(x,"Zil",seriouslyThoReshapeDatGooCock,[arg,GLOBAL.TYPE_BEE]);
		else if(pc.cocks[arg].cType != newType) addGhostButton(x,GLOBAL.TYPE_NAMES[newType],seriouslyThoReshapeDatGooCock,[arg,newType]);
		else addDisabledGhostButton(x,GLOBAL.TYPE_NAMES[newType],GLOBAL.TYPE_NAMES[newType],"The penis is already this shape.");
	}
	
	addGhostButton(14,"Back",reshapeACaaaawk);
}
public function seriouslyThoReshapeDatGooCock(arg:Array):void
{
	clearOutput2();
	flags["GOO_BIOMASS"] -= 100;
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
		output2(", a turgid, bestial mast made to plow your mates wide-open. You nearly cum from the feeling of your semi-liquid dicktip fattening and bloating, filling with more and more biomass until you've got a flare any stallion would be proud of, to say nothing of the sheath that's quietly crept up below!");
		pc.lust(10);
	}
	else if(type == GLOBAL.TYPE_CANINE || type == GLOBAL.TYPE_VULPINE)
	{
		output2(", one with a big fat knot to seal your [pc.cum] inside your mates. The fluid waves of your self-induced transformation are maddeningly exciting, and the slow flow of biomass into your inflating knot is both ecstasy and agony, like orgasming without ejaculation.");
		pc.lust(10);
	}
	else if(type == GLOBAL.TYPE_FELINE)
	{
		output2(". The whole thing wobbles like a plate of half-melted jello, gaining definition and features with every shake. It gradually reveals a feline shape, complete with rubbery spines to stimulate your lovers' innermost folds.");
	}
	else if(type == GLOBAL.TYPE_BEE)
	{
		output2(", one with a nice thick foreskin and wonderfully fragrant pheromones. All you'll have to do is whip it out and the ladies (or boys) will come running. You close your eyes and reach down to touch it, delighted to discover that it's already changed to the appropriate shape. Marvelous")
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
		output2(". Fluid undulations roll along the shifting length, absorbing some details and revealing others. Studs stand out from the human-like length, the kind of corrupt-looking nodules you'd expect to see on lining a demon-lord's prick. It's perfect, just like you imagined... only slightly more drippy.");
	}
	else if(type == GLOBAL.TYPE_KUITAN)
	{
		output2(". Kui-tan always did have interesting phalli, what with all the bulbous knots, always threatening to bulge and twitch with their excessively virile jism. By the time you finish thinking about it, you realize that your liquid crotch has already supplied the transformation, giving you exactly the member from your mind.");
	}
	else
	{
		output2(". Few things are as rewarding as watching your own flesh dance to your every whim. The goo reshapes wildly, discarding old features and trading them in for new. Through it all is the pleasant tingle and undeniable sexual thrill of contact with your crotch. Your misfiring nerves can't help but feed you pleasure until your cock is formed perfectly to your mental specification.")
	}
	pc.shiftCock(x,type);
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
	flags["GOO_BIOMASS"] -= 500;
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
			addGhostButton(x,upperCase(num2Text(x+1)),removeDaChosenGooCock,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Remove this penis.");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Cock " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","This penis isn't made of goo.");	
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
	flags["GOO_BIOMASS"] += Math.round(pc.cockVolume(arg,false) * .75) + 375;
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
	flags["GOO_BIOMASS"] += biomass;
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
			addGhostButton(x,upperCase(num2Text(x+1)),lengthenSelectedGooCock,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Lengthen this penis.\n\n<b>" + cockCost + " mLs Biomass</b>");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Cock " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","This penis isn't made of goo.");	
		}
	}
	showBiomass();
}

public function lengthenSelectedGooCock(arg:int = 0):void
{
	clearOutput2();
	var cChange:Number = 2;
	//Find the difference between new and old sizes:
	var biomassReq:Number = costGooCockLengthen(arg, cChange);
	//Is there enough? TF
	if(flags["GOO_BIOMASS"] >= biomassReq)
	{
		// Perk bonus (no extra cost!)
		if(pc.hasPerk("Hung")) cChange += 2;
		
		output2("Oh wow, as soon as you thought about your [pc.cockNoun " + arg + "] sticking a little farther out than normal, you could feel more cock pushing out of you, fucking its way out of your body on the path to full erectness. It feels quite good, good enough that you can’t help but imagining it a little bigger, a little thicker, and a lot more erect. By the time you reel yourself in, you’ve added");
		if(cChange == 1) output2(" one inch");
		else output2(" " + num2Text(cChange) + " inches");
		output2(" to your size.");
		pc.cocks[arg].cLengthRaw += cChange;
		flags["GOO_BIOMASS"] -= biomassReq;
	}
	//NOT ENOUGH! ABORT!
	else
	{
		output2("No matter how hard you try, you can't muster up anything more than an empty feeling inside yourself. It looks like you'll need more biomass for this.");
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
			addGhostButton(x,upperCase(num2Text(x+1)),shortenSelectedCock,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","Shorten this penis.");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Cock " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock","This penis isn't made of goo.");	
		}
	}
	showBiomass();
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
		flags["GOO_BIOMASS"] += Math.round(biomassDiff * .75);
	}
	else if(pc.cocks[arg].cLengthRaw > 1)
	{
		output2("Turns out that there can be too much of a good thing. You glance down at your [pc.cockNoun " + arg + "] and focus, willing it to become a little more reasonably sized. After it shrinks down to about one inch, it suddenly stops... looks like you can't get it any smaller than that without having to remove it.");
		pc.cocks[arg].cLengthRaw = 1;
	}
	else
	{
		output2("You try and try but you can't quite shift the biomass of your [pc.cockNoun " + arg + "] to get it any smaller... You guess your pecker as small as it's going to get... unless you decide to remove it.");
		output2("\n\nDo you want to remove it?");
		
		clearGhostMenu();
		addGhostButton(0,"Remove It",removeDaChosenGooCock,arg,"Remove It","Remove your [pc.cock " + arg + "].");
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
	if(flags["GOO_BIOMASS"] >= 500)
	{
		if(pc.totalVaginas() < 3) addGhostButton(0,"Grow Vagina",growAGoogina,undefined,"Grow Vagina","Grow a new vagina.\n\n<b>500 mLs Biomass</b>");
		else addDisabledGhostButton(0,"Grow Vagina","Grow Vagina","There's no more room for more vaginas!");
	}
	else addDisabledGhostButton(0,"Grow Vagina","Grow Vagina","You don't have enough biomass for that!\n\n<b>500 mLs Biomass</b>");

	if(flags["GOO_BIOMASS"] >= 200)
	{
		if(pc.hasVagina()) addGhostButton(1,"Reshape",shiftACuntYaCunt,undefined,"Reshape","Reshape your vagina into another form.\n\n<b>200 mLs Biomass</b>");
		else addDisabledGhostButton(1,"Reshape","Reshape","You don't have a vagina to reshape.");
	}
	else addDisabledGhostButton(1,"Reshape","Reshape","You don't have enough biomass to reshape your vagina.\n\n<b>200 mLs Biomass</b>");
	if(flags["GOO_BIOMASS"] >= 100)
	{
		if(pc.hasVagina()) addGhostButton(2,"Grow Clit",addClitGooMenu,undefined,"Grow Clit","Grow a new clitoris.\n\n<b>100 mLs Biomass</b>");
		else addDisabledGhostButton(2,"Grow Clit","Grow Clit","You have no vagina to add a clit to.");
	}
	else addDisabledGhostButton(2,"Grow Clit","Grow Clit","You do not have enough biomass for this.\n\n<b>100 mLs Biomass</b>");
	if(pc.totalVaginas() == 1 && pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY) && pc.vaginas[0].clits <= 1) addDisabledGhostButton(3,"Remove Clit","Remove Clit","You cannot remove your only clit. It just seems... wrong without it.");
	else if(pc.hasVagina()) addGhostButton(3,"Remove Clit",removeGooClitVagSelector,undefined,"Remove Clit","Remove an excess clitoris.");
	else addDisabledGhostButton(3,"Remove Clit","Remove Clit","You don't have a vagina to remove a clit from.");
	
	var x:int = 0;
	if(pc.hasVagina())
	{
		var hymenCost:int = 0;
		for(x = 0; x < pc.totalVaginas(); x++)
		{
			if(!pc.vaginas[x].hymen) hymenCost += 50;
		}
		if(hymenCost <= flags["GOO_BIOMASS"]) addGhostButton(4,"Regn.Hymen",hymenRestorationForGoos,undefined,"Regenerate Hymens","Restore any and all hymens.\n\n<b>" + hymenCost + " mLs Biomass</b>");
		else addDisabledGhostButton(4,"Regn.Hymen","Regenerate Hymens","You do not have enough biomass for this.\n\n<b>" + hymenCost + " mLs Biomass</b>");
	}
	
	// Removal: Single vagina
	if(pc.totalVaginas() == 1)
	{
		if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY)) addGhostButton(5,"Remove Vag",removeAVag,0,"Remove Vag","Remove your vagina.");
		else addDisabledGhostButton(5,"Remove Vag","Remove Vag","Your vagina isn't made of goo and cannot be removed.");
	}
	else if(!pc.hasVagina()) addDisabledGhostButton(5,"Remove Vag","Remove Vag","You have no vagina to remove.");
	
	// Removal: Multiple vaginas
	if(pc.totalVaginas() > 1)
	{
		if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY)) addGhostButton(5,"Remove Vag 1",removeAVag,0,"Remove Vag 1","Remove your first vagina.");
		else addDisabledGhostButton(5,"Remove Vag 1","Remove Vag 1","This vagina isn't made of goo and cannot be removed.");
		if(pc.vaginas[1].hasFlag(GLOBAL.FLAG_GOOEY)) addGhostButton(6,"Remove Vag 2",removeAVag,1,"Remove Vag 2","Remove your second vagina.");
		else addDisabledGhostButton(6,"Remove Vag 2","Remove Vag 2","This vagina isn't made of goo and cannot be removed.");
	}
	//else addDisabledGhostButton(6,"Remove Vag 2","Remove Vag 2","You have no vagina to remove.");
	if(pc.totalVaginas() > 2)
	{
		if(pc.vaginas[2].hasFlag(GLOBAL.FLAG_GOOEY)) addGhostButton(7,"Remove Vag 3",removeAVag,2,"Remove Vag 3","Remove your third vagina.");
		else addDisabledGhostButton(7,"Remove Vag 3","Remove Vag 3","This vagina isn't made of goo and cannot be removed.");
	}
	//else addDisabledGhostButton(7,"Remove Vag 3","Remove Vag 3","You have no vagina to remove.");
	if(pc.totalVaginas() > 1)
	{
		var numGooVags:Number = 0;
		for(x = 0; x < pc.totalVaginas(); x++)
		{
			if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY)) numGooVags++;
		}
		if(pc.totalVaginas() == numGooVags) addGhostButton(8,"Remove Vags",removeAllVags,undefined,"Remove Vaginas","Remove all vaginas.");
		else addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","Your vaginas aren't all made of goo and cannot be removed at the same time.");
	}
	else if(pc.totalVaginas() == 1) addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","You need multiple goo vaginas in order to try this.");
	//else addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","You have no vaginas to remove.");
	
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
	flags["GOO_BIOMASS"] -= 500;
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
	flags["GOO_BIOMASS"] += 375;
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
		flags["GOO_BIOMASS"] += 375;
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
			addGhostButton(x,upperCase(num2Text(x+1)),addGooClitNau,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","Grow a clit for this vagina.\n\n<b>100 mLs Biomass</b>");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This vagina isn't made of goo and cannot be morphed that way.");
		}
	}
	addGhostButton(14,"Back",gooCrotchCustomizer);
	showBiomass();
}

public function addGooClitNau(arg:int = 0):void
{
	clearOutput2();
	output2("Growing a clit is harder than you feel it ought to be - not because there's anything special about that chunk of biomass, but because increasing the nerve density on the surface of the bud is maddeningly distracting. You push through until you've added another [pc.clit] to your [pc.vagina " + arg + "].");
	pc.vaginas[arg].clits++;
	flags["GOO_BIOMASS"] -= 100;
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
			if(pc.vaginas[x].clits > 1) addGhostButton(x,upperCase(num2Text(x+1)),addGooClitNau,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","Remove a clit for this vagina.");
			else addDisabledGhostButton(x,upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","You cannot remove your last clit for this vagina. It just seems... wrong without it.");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This vagina isn't made of goo and cannot be morphed that way.");
		}
	}
	showBiomass();
	addGhostButton(14,"Back",vaginaGooRootMenu);
}

public function removingClitSurgeryGoo(arg:int = 0):void
{
	clearOutput2();
	output2("Deciding to simplify things, you will one of your [pc.clits] to fade back into the gelatinous surface of your crotch. It disappears with a sudden cessation of sensation, leaving your [pc.vagina " + arg + "] a little less sensitive for the change.");
	flags["GOO_BIOMASS"] += 75;
	pc.vaginas[arg].clits--;
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}

//Shift cunt
public function shiftACuntYaCunt():void
{
	clearOutput2();
	output2("Which vagina while you change to a different type?");
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
			addGhostButton(x,upperCase(num2Text(x+1)),pickNewCuntType,x,StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","Shift the shape of this vagina.\n\n<b>200 mLs Biomass</b>");
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.Vagina " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),StringUtil.capitalize(num2Ordinal(x + 1)) + " Vagina","This vagina isn't made of goo and cannot be morphed.");
		}
	}
	addGhostButton(14,"Back",vaginaGooRootMenu);
	showBiomass();
}

public function pickNewCuntType(arg:int = 0):void
{
	clearOutput2();
	output2("What type of vagina will you change it into?");
	clearGhostMenu();
	/*
	addGhostButton(0,"Terran",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_HUMAN]);
	addGhostButton(1,"Equine",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_EQUINE]);
	addGhostButton(2,"Canine",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_CANINE]);
	addGhostButton(3,"Lapinara",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_LAPINARA]);
	addGhostButton(4,"Vanae",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_VANAE]);
	*/
	
	var vTypes:Array = [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_EQUINE];
	// Unlockables
	if(CodexManager.entryUnlocked("Vanae"))
		vTypes.push(GLOBAL.TYPE_VANAE);
	if(CodexManager.entryUnlocked("Lapinara"))
		vTypes.push(GLOBAL.TYPE_LAPINARA);
	
	var newType:Number = 0;
	for(var x:int = 0; x < vTypes.length; x++)
	{
		newType = vTypes[x];
		if(newType == GLOBAL.TYPE_HUMAN) addGhostButton(x,"Terran",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_HUMAN]);
		else if(pc.vaginas[arg].type != newType) addGhostButton(x,GLOBAL.TYPE_NAMES[newType],actuallyTFToNewCuntType,[arg,newType]);
		else addDisabledGhostButton(x,GLOBAL.TYPE_NAMES[newType],GLOBAL.TYPE_NAMES[newType],"The vagina is already this shape.");
	}
	
	addGhostButton(14,"Back",shiftACuntYaCunt);
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
	flags["GOO_BIOMASS"] -= 200;
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
			flags["GOO_BIOMASS"] -= 50;
			pc.vaginas[x].hymen = true;
			hymens++;
		}
	}
	if(hymens > 1) output2("You decide that you'd like to be a virgin once more, and like magic, it is so. Your hymens are restored.");
	else output2("You decide that you'd like to be a virgin once more, and like magic, it is so. Your hymen is restored.");
	clearGhostMenu();
	addGhostButton(0,"Next",vaginaGooRootMenu);
}
