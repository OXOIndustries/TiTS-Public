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

public function galoMaxPartTwo():void
{
	output("\n\nThere's a pill bottle left on the ground here. <b>This is a placehoooolder.</b>\n\n");
	flags["ZODEE_GALOQUEST"] = 2;
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
		else output("the tips of your [pc.footOrFeet]");
		output(" only to settle more and more of itself into your crotch. Your [pc.groin] flood");
		if(pc.cockTotal() + pc.totalVaginas() == 1) output("s");
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

/*Crotch
output2("\n\n//Copy past crotch display from Appearance screen.");

output("\n\nDo you will your body to change anything?");
output("\n\n[Penis] [Vagina] [Balls] [Misc]");

output("\n\n//Penis");
output("\n\n//Show cocks desc");

output("\n\nWhat would you like to do?");
output("\n\n[Grow One] [Reshape] [Resize][Remove 1][Remove All]");
output("\n\n//Don’t need to write shit for most of these - it’ll all be code-generated shit, mostly.");
output("\n\n//Grow new cock");
output("\n\nA little mental focus is all it takes to make your flesh ripple and part around a new length, allowing the semi-solid [pc.cockNoun <i>“ + x + <i>“] to slip out of your body with an accompanying gasp of delight. Making yourself a new cock felt <i>good</i>. //Disable? Maybe you should see how many you’d have to make to get yourself off from the act alone?");
output("\n\n//Remove cock");
output("\n\nYou close your eyes and imagine your [pc.cockNoun <i>“ + x + <i>“] melding back into the pool at the base of your body. The feeling is a little disconcerting, but not quite as disconcerting as the ‘schlorp’ sound it makes.");
output("\n\n//Remove cocks");
output("\n\nYou close your eyes and imagine yourself without the jutting, drooling protrusions you now bear. The feeling of them melding back into your body is a little disconcerting, but not quite as disconcerting as the multitude of ‘schlorps’ that assault your ears. At least you’ve regained their weight in biomass.");
output("\n\n//Lengthen Cock");
output("\n\nOh wow, as soon as you thought about your [pc.cockNoun <i>“ + x + <i>“] sticking a little farther out than normal, you could feel more cock pushing out of you, fucking its way out of your body on the path to full erectness. It feels quite good, good enough that you can’t help but imagining it a little bigger, a little thicker, and a lot more erect. By the time you reel yourself in, you’ve added {2-5} inches to your size.");
output("\n\n//Shorten cock");
output("\n\nTurns out that there can be too much of a good thing. You glance down at your [pc.cockNoun <i>“ + x + <i>“] and focus, willing it to become a little more reasonably sized. After losing about two inches. You take a break to evaluate the results, and decide if you should go any smaller.");

output("\n\n//Vagina");
output("\n\n[Grow Vagina] [Remove Vag] [Remove Vags] [Reshape]");
output("\n\n//Grow Vag");
output("\n\n//Nocunt");
output("\n\nYou decide that you’d like to have a pussy, something pretty you could slip your fingers into on a cold lonely night, among the stars. A new vagina takes shape on your body as rapidly as the idea forms in your head, soft and elastic, ready to stretch and deform around anything you’d like to put inside of it.");
output("\n\n//Gotcunt");
output("\n\nWhy settle for only {one vagina/two vaginas} when you could have {two/three} eager cunts waiting for attention? There’s plenty of room there, you could just form one right... there. You touch your fingers to the spot, and moan as they sink into your pliant, syrupy skin, forming a tiny gap that grows with every passing second. You plunge in to the knuckle, aware of the formation of a [pc.clit] above, the press of lips on either side. You brush your other entrance{s} and shudder, fighting the sensation to jill yourself on the spot.");
output("\n\nThere will be time for that later. You pull your fingers free and slowly lick them clean, wary of wasting your own biomass.");
output("\n\n//Remove Vag");
output("\n\nDeciding that your [pc.vagina] is too much of a distraction, you focus your will on it, commanding the semi-liquid flesh of your loins to flow over it like water, dissolving it back into the formless reservoir of biomass within.");
output("\n\n//Remove Vags");
output("\n\nDeciding that your [pc.vaginas] would serve you better by fading away into nothingness, you will the goo at your crotch to fold over the feminine creases and melt them back into nothingness once more.");

*/
