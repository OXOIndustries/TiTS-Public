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
	if(flags["GALOMAX_DOSES"]  == undefined) return "green";
	else if(flags["GALOMAX_DOSES"] < 4) return pc.hairColor;
	else return pc.skinTone;
}


public function zodeeGivesFirstGalomax():void
{
	showName("A\nSTRANGER");
	showBust("ZODEE");
	output("\n\nThere's another rusher here - a rahn by the looks of it. She's dressed in a pale white jumpsuit that hides most of her gleaming teal, gelatinous skin from view but does little to conceal the weighty jiggle of her chest. Her hands are in her pack, sorting through enough gleaming prizes to make your belly clench with envy, and her plump rump is positioned perfectly to entice you with its restless wiggles. Just how much did she find before you could get to here?");
	output("\n\nTossing items carelessly over her shoulder, the rahn seems blithely unaware of your presence until a pill-bottle smacks off your chest, rattling noisily. She draws in the blink of an eye, then lowers her weapon at the sight of another galactic traveler.");
	output("\n\n<i>“Oh, didn’t think I’d bump into another rusher out here. You can have the GaloMax if you want. Not much use to a girl like me.”</i> She eyeballs you from the crown of your head to the bottoms of your [pc.feet], blatantly evaluating every detail. You’ve had full-body scans that felt less invasive. <i>“You know, you just might make it out here, if you’re careful.”</i> Straightening and shouldering her bag, the alien woman licks her lips and grins. <i>“The name’s Zo’dee, by the way. Maybe we’ll bump into each other again sometime. Just don’t get mad when I score all the loot before you get there.”</i>");
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
	addButton(1,"Buy It",buyGaloMaxFromZodee,undefined,"Buy It","Offer to buy the GaloMax off her for 500 credits. That's a good deal, right?\n\n<b>500 credits</b>");
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
	output("\n\n{Your breath catches in your throat. It’s beautiful, even for like, a lady-cock./Your breath seems a little too fast even to your own ears. There’s something indescribably exciting about offering such salacious assistance.} You reach out and grab hold, marvelling at the smooth, almost slick texture of her gelatinous skin. It’s not quite as soft as you’d expect, tough and hard enough to make you doubt you’ll be much help at squeezing out all the eggs trapped inside, but Zo’dee’s blissful expression is all the encouragement you need to forge ahead.");
	output("\n\nExperimentally stroking, you squeeze it from the base to the tip, at first alarmed and then pleased when a whitish-green goo leaks from the tip to glaze your fingers. Zo’dee wobbles and gasps, leaning against you for support{, forced to hold onto your diminutive shoulders lest she pitch over on top of you.} You grin up at her and squeeze her near the base, forcing her prong to bloat bigger, the head greenish-blue. Its slitted tip is already starting to gape. More yoghurt-thick goop oozes out.");
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
			output("\n\nYour boundless sex juices fill your palms to overflowing, and you instinctively smear it all over your genitals, your own slippery, gooey lubricant. It provides the perfect mix of slickness and friction, just enough to ease the passage of your hands’ back and forth motions. You squelch and stroke and whine, dribbling down your [pc.legs] - so wet... so very very wet. Your cock");
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
			output("\n\nYour boundless sex juices fill your palms to overflowing, and you instinctively smear it all over your genitals, your own slippery, gooey lubricant. It provides the perfect mix of slickness and friction, just enough to ease the passage of your hands’ back and forth motions. You squelch and stroke and whine, dribbling down your [pc.legs] - so wet... so very very wet. Your cock");
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
			output("\n\nYour boundless sex juices fill your palms to overflowing, and you instinctively smear it all over your genitals, your own slippery, gooey lubricant. It provides the perfect mix of slickness and friction, just enough to ease the passage of your fingers. You squelch and stroke and whine, dribbling down your [pc.legs] - so wet... so very very wet. Your puss");
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
		else output("the tips of your [feetOrFoot]");
		output(" only to settle more and more of itself into your crotch. Your [pc.genitals] flood with it, plumping up with artificially-induced arousal. Your head swims, dizzied by the ");
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
		if(pc.hasCock()) output("[pc.cockSkinColor]");
		else output("[pc.vaginaSkinColor]");
		output(" skin, painting it [pc.cumColor] in its wake. It almost looks like you’re cumming, but without the enjoyment the associated act would entail. Instead, you’re slumped on the floor, trying not to slump over while paradoxical contractions wreath you in tingling goo.");
		output("\n\nIt does feel kind of good, in an unusual kind of way. You feel like a passenger in a remote-controlled body, one that insists on making its crotch so hot that it threatens to liquify under the deluge. It’d be maddening if you hadn’t expected something like this to happen. Rapid pants, whining gasps, and splatters fill the air with their lurid echos. Aeons seem to pass while you lie there, fruitlessly twitching, bathing your ");
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
			if(pc.hairType != GLOBAL.HAIR_TYPE_GOO) pc.cocks[x].cockColor = RandomInCollection[("green","emerald")];
		}
		for(x = 0; x < pc.totalVaginas(); x++)
		{
			if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY)) pc.vaginas[x].addFlag(GLOBAL.FLAG_GOOEY);
			pc.vaginas[x].vaginaColor = pc.hairColor;
			if(pc.hairType != GLOBAL.HAIR_TYPE_GOO) pc.vaginas[x].vaginaColor = RandomInCollection[("green","emerald")];
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
	output2("\n\n\tBiomass Reserve: " + flags["GOO_BIOMASS"]);
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
	addButton(0,"Penis",gooCockRootMenu,undefined,"Penis","Modify phallus parameters.");
	addButton(1,"Vagina",vaginaGooRootMenu,undefined,"Vagina","Modify vaginal parameters.");
	addButton(14,"Back",gooShiftMenu);
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
		if(pc.cockTotal() < 10) addGhostButton(0,"Grow One",growANewGooCock,undefined,"Grow One","Grow a new, gooey penis.\n\n<b>100 Biomass</b>");
		else addDisabledGhostButton(0,"Grow One","Grow One","There's not room for any more penises!");
	}
	else addDisabledGhostButton(0,"Grow One","Grow One","You don't have enough biomass for that.");

	if(pc.hasCock()) 
	{
		if(flags["GOO_BIOMASS"] >= 100) addGhostButton(1,"Reshape",reshapeACaaaawk,undefined,"Reshape","Change the shape of a penis.");
		else addDisabledGhostButton(1,"Reshape","Reshape","You lack sufficient biomass to reshape your penis.");
		addGhostButton(2,"Lengthen",lengthenGooCock,undefined,"Lengthen","Put some biomass to work making an endowment of your choice longer.");
		addGhostButton(3,"Shorten",shortenADick,undefined,"Shorten","Shorten a penis and reclaim some of its biomass.");
		addGhostButton(5,"Remove 1",removeGooCockRoot,undefined,"Remove 1","Remove one of your penises, returning it to plain goo.");
		addGhostButton(6,"Remove All",removeAllGooCocks,undefined,"Remove All","Remove all penises.");
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
			addGhostButton(x,upperCase(num2Text(x+1)),reshapeAGooCawkForReaaaaal,x);
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.CockShape " + x + "] - <b>Not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This penis isn't made of goo.");	
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
		if(pc.legCount == 1) output(" from your gooey loins.");
		else output(" between your [pc.legs].");
		
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
			output2("\n" + (x+1) + ": [pc.cock " + x + "]");
			addGhostButton(x,upperCase(num2Text(x+1)),removeDaChosenGooCock,x);
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.cock " + x + "] - <b>not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This penis isn't made of goo.");	
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
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_GOOEY))
		{
			output2("\n" + (x+1) + ": [pc.cock " + x + "]");
			addGhostButton(x,upperCase(num2Text(x+1)),lengthenSelectedGooCock,x);
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.cock " + x + "] - <b>not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This penis isn't made of goo.");	
		}
	}
	showBiomass();
}

public function lengthenSelectedGooCock(arg:int = 0):void
{
	clearOutput2();
	//Find the difference between new and old sizes:
	pc.cocks[arg].cLengthRaw += 2;
	var biomassReq:Number = pc.cockVolume(arg,false);
	pc.cocks[arg].cLengthRaw -= 2;
	biomassReq -= pc.cockVolume(arg,false);
	//Is there enough? TF
	if(flags["GOO_BIOMASS"] >= biomassReq)
	{
		output2("Oh wow, as soon as you thought about your [pc.cockNoun " + arg + "] sticking a little farther out than normal, you could feel more cock pushing out of you, fucking its way out of your body on the path to full erectness. It feels quite good, good enough that you can’t help but imagining it a little bigger, a little thicker, and a lot more erect. By the time you reel yourself in, you’ve added two inches to your size.");
		pc.cocks[arg].cLengthRaw += 2;
		flags["GOO_BIOMASS"] -= Math.round(biomassReq);
	}
	//NOT ENOUGH! ABORT!
	else
	{
		output2("No matter how hard you try, you can't muster up anything more than an empty feeling inside yourself. It looks like you'll need more biomass for this.");
	}
	clearGhostMenu();
	addButton(0,"Next",gooCockRootMenu);
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
			output2("\n" + (x+1) + ": [pc.cock " + x + "]");
			addGhostButton(x,upperCase(num2Text(x+1)),shortenSelectedCock,x);
		}
		else
		{
			output2("\n" + (x+1) + ": [pc.cock " + x + "] - <b>not goo</b>");
			addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This penis isn't made of goo.");	
		}
	}
	showBiomass();
}
public function shortenSelectedCock(arg:int = 0):void
{
	clearOutput2();
	output2("Turns out that there can be too much of a good thing. You glance down at your [pc.cockNoun " + x + "] and focus, willing it to become a little more reasonably sized. After losing about two inches. You take a break to evaluate the results, and decide if you should go any smaller.");
	var biomassDiff:Number = pc.cockVolume(arg);
	pc.cocks[arg].cLengthRaw -= 2;
	biomassDiff -= pc.cockVolume(arg);
	flags["GOO_BIOMASS"] += Math.round(biomassDiff * .75);

	clearGhostMenu();
	addButton(0,"Next",gooCockRootMenu);
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
		if(pc.totalVaginas() < 3) addButton(0,"Grow Vagina",growAGoogina,undefined,"Grow Vagina","Grow a new vagina.\n\n<b>500 Biomass</b>");
		else addDisabledGhostButton(0,"Grow Vagina","Grow Vagina","There's no more room for more vaginas!");
	}
	else addDisabledGhostButton(0,"Grow Vagina","Grow Vagina","You don't have enough biomass for that!");

	if(flags["GOO_BIOMASS"] >= 200)
	{
		if(pc.hasVagina()) addGhostButton(1,"Reshape",shiftACuntYaCunt,undefined,"Reshape","Reshape your vagina into another form.\n\n<b>200 biomass</b>");
		else addDisabledGhostButton(1,"Reshape","Reshape","You don't have a vagina to reshape.");
	}
	else addDisabledGhostButton(1,"Reshape","Reshape","You don't have enough biomass to reshape your vagina. You need 200.");
	if(flags["GOO_BIOMASS"] >= 100)
	{
		if(pc.hasVagina()) addGhostButton(2,"Grow Clit",addClitGooMenu,undefined,"Grow Clit","Grow a new clitoris.");
		else addDisabledGhostButton(2,"Grow Clit","Grow Clit","You have no vagina to add a clit to.");
	}
	else addDisabledGhostButton(2,"Grow Clit","Grow Clit","You have no vagina to add a clit to.");
	if(pc.hasVagina()) addGhostButton(3,"Remove Clit",removeGooClitVagSelector,undefined,"Grow Clit","Remove an excess clitoris.");
	else addDisabledGhostButton(3,"Remove Clit","Remove Clit","You don't have a vagina to remove a clit from.");

	if(pc.hasVagina())
	{
		var hymenCost:int = 0;
		for(var x:int = 0; x < pc.totalVaginas(); x++)
		{
			if(!pc.vaginas[x].hymen) hymenCost += 50;
		}
		if(hymenCost <= flags["GOO_BIOMASS"]) addGhostButton(4,"Regn.Hymen",hymenRestorationForGoos,undefined,"Regenerate Hymens","Restore any and all hymens.");
		else addDisabledGhostButton(4,"Regn.Hymen","Regenerate Hymens","You do not have enough biomass for this.");
	}
	if(pc.hasVagina()) addGhostButton(5,"Remove Vag 1",removeAVag,0,"Remove Vag 1","Remove your first vagina.");
	else addDisabledGhostButton(5,"Remove Vag 1","Remove Vag 1","You have no vagina to remove.");
	if(pc.totalVaginas() > 1) addGhostButton(6,"Remove Vag 2",removeAVag,1,"Remove Vag 2","Remove your second vagina.");
	else addDisabledGhostButton(6,"Remove Vag 2","Remove Vag 2","You have no vagina to remove.");
	if(pc.totalVaginas() > 2) addGhostButton(7,"Remove Vag 3",removeAVag,2,"Remove Vag 3","Remove your third vagina.");
	else addDisabledGhostButton(7,"Remove Vag 3","Remove Vag 3","You have no vagina to remove.");
	if(pc.hasVagina()) addGhostButton(8,"Remove Vags",removeAllVags,undefined,"Remove Vaginas","Remove all vaginas.");
	else addDisabledGhostButton(8,"Remove Vags","Remove Vaginas","You have no vaginas to remove.");
		
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
	addButton(0,"Next",vaginaGooRootMenu);
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
	addButton(0,"Next",vaginaGooRootMenu);	
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
			output2("\n" + (x+1) + ": [pc.vagina " + x + "] - " + pc.vaginas[x].clits + " clits");
			addGhostButton(x,upperCase(num2Text(x+1)),addGooClitNau,x);
		}
		else addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This vagina isn't made of goo and cannot be morphed that way.");
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
			output2("\n" + (x+1) + ": [pc.vagina " + x + "] - " + pc.vaginas[x].clits + " clits");
			if(pc.vaginas[x].clits > 1) addGhostButton(x,upperCase(num2Text(x+1)),addGooClitNau,x);
			else addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"You cannot remove your last clit. It just seems... wrong without it.");
		}
		else addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This vagina isn't made of goo and cannot be morphed that way.");
	}
	showBiomass();
	addGhostButton(14,"Back",vaginaGooRootMenu);
}

public function removingClitSurgeryGoo(arg:int = 0):void
{
	clearOutput2();
	output2("Deciding to simplify things, you will one of your [pc.clits] to fade back into the gelatinous surface of your crotch. It disappears with a sudden cessation of sensation, leaving your [pc.vagina " + arg + "] a little less sensitive for the change.");
	flags["GOO_BIOMASS"] += 75;
	pc.vaginas[arg].clits++;
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
			output2("\n" + (x+1) + ": [pc.vagina " + x + "] - " + pc.vaginas[x].clits + " clits");
			addGhostButton(x,upperCase(num2Text(x+1)),pickNewCuntType,x);
		}
		else addDisabledGhostButton(x,upperCase(num2Text(x+1)),upperCase(num2Text(x+1)),"This vagina isn't made of goo and cannot be morphed.");
	}
	addGhostButton(14,"Back",vaginaGooRootMenu);
	showBiomass();
}

public function pickNewCuntType(arg:int = 0):void
{
	clearOutput2();
	output2("What type of vagina will you change it into?");
	clearGhostMenu();
	addGhostButton(0,"Terran",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_HUMAN]);
	addGhostButton(1,"Equine",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_EQUINE]);
	addGhostButton(2,"Canine",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_CANINE]);
	addGhostButton(3,"Lapinara",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_LAPINARA]);
	addGhostButton(4,"Vanae",actuallyTFToNewCuntType,[arg,GLOBAL.TYPE_VANAE]);
	addGhostButton(14,"Back",shiftACuntYaCunt);
}

public function actuallyTFToNewCuntType(args:Array):void
{
	clearOutput2();
	var x:int = args[0];
	var newType:int = args[1];
	var colorStore:String = pc.vaginas[x].vaginaColor;
	flags["GOO_BIOMASS"] -= 200;
	output2("One simple thought is all it takes to light a sizzle of erotic energies in your loins, burning through your old [pc.vagina " + x + "] and leaving a flush new vagina in its wake.");
	pc.lust(10);
	pc.shiftVagina(x,newType);
	pc.vaginas[x].vaginaColor = colorStore;
	pc.vaginas[x].addFlag(GLOBAL.FLAG_GOOEY);
	flags["GOO_BIOMASS"] -= 100;
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
