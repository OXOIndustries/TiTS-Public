import classes.Items.Apparel.AnalPrincessPanties;
import classes.Items.Apparel.AssManBoxers;
import classes.Items.Apparel.BackdoorBoiSlutwear;
import classes.Items.Apparel.CumflationControlBoyshorts;
import classes.Items.Apparel.SlutSealThong;
/*
	LERRIS_TALKED_BACKROOM
		0/undefined -- not even attempted the talk scene
		1 			-- at least talked about it
		2 			-- been to the back room and seen the ~demo~
*/

public function showLerris(asNude:Boolean = false):void
{
	// Override bustDisplay to handle titty size, just append _NUDE if we're nude or not. MAGIC!
	showBust(lerris.bustDisplay + (asNude ? "_NUDE" : ""));
	author("Savin");
	showName((flags["MET_LERRIS"] == undefined ? "TAMANICORP\nEMPLOYEE" : "\nLERRIS"));
}

public function tavrosTamaniCorpStoreEntry():Boolean
{
	author("Savin");

	output("\n\n");
	if (flags["MET_LERRIS"] == undefined)
	{
		output("A kaithrit cat-girl dressed in the distinctive pink-and-purple TamaniCorp jumpsuit is prancing around the shop, rearranging product displays and dusting off bits of equipment. She stops for long pauses in front of a large display for a product called <i>“Lactaid,”</i> staring hungrily at the needles and pills on offer. She barely seems to notice you or the other customers that wander in, though whenever someone approaches the counter she comes bounding over to assist.");

		addButton(0, "Cat-girl", lerrisFirstApproach);
		return false;
	}
	else
	{
		output("Lerris is prancing about the place, wiggling her hips and tail to the soft pop tunes playing over the shop speakers. She gives you a flirtatious grin whenever you wander by");
		if (flags["FUCKED_LERRIS"] != undefined)
		{
			output(" before reaching down to a product on the floor to clean it off, putting her lush behind on full display beneath her skin-tight suit. Your eyes are drawn inexorably to her [lerris.chest], though, hanging down in front of her.");
			if (lerris.milkFullness <= 50) output(" The two perky, firm orbs look positively delicious.");
			else if (lerris.milkFullness <= 150) output(" The two big, weighty melons look like they’re just about full of sweet [lerris.milk].");
			else output(" Her massive, milky tits swing heavily under her, threatening to weigh her down to the ground. You can’t wait to see just how much she’s stored up for you now...");
		}
		else output(" before dancing off to clean another display or help another customer, making sure she doesn’t get in your way... even if the sway of her hips and her plush butt under the skin-tight suit is more than a little distracting.");

		addButton(0, "Lerris", lerrisRepeatApproach);
		return false;
	}

	return false;
}

public function lerrisFirstApproach():void
{
	clearOutput();
	showLerris();

	output("The moment you make your way to the shop’s counter, the kaithrit cat-girl who’s been prancing around comes bounding over with a smile and a jiggle of her very obvious assets: the skin-tight, pastel suit certainly draws the eyes to her handful of butt and the bouncing weight of what look like C-cup breasts. She flips a long mane of bright green hair back and slips behind the counter, bringing up a holo-display beside her.");
	
	output("\n\n<i>“Hey!”</i> she smiles, showing off painted lips the same color as the sleeves and legs of her jumpsuit. Her lip and nose both play home to a small ring piercing, and as you look her over, you notice she’s got a bar running under one of her eyebrows, and her tongue’s got a tiny stud near the tip that catches the light with every word. <i>“Welcome to TamaniCorp’s Tavros branch. I’m Lerris! If there’s anything from the shelves you’re interested in, just let me know. I’ve got <b>plenty</b> of hands-on experience with some of ‘em if you have questions, too!”</i>");
	
	output("\n\nWhile you introduce yourself back, she drums her fingers on the top of the holo-display, drawing your attention to the flickering list of products and prices. <i>“If you want anything, just swipe your data-device here and I’ll get it from the back room for you!”</i>");

	flags["MET_LERRIS"] = 1;

	processTime(3+rand(3));
	clearMenu();
	addButton(0, "Next", lerrisProducts);
}

public function lerrisRepeatApproach():void
{
	clearOutput();
	showLerris();

	if (flags["FUCKED_LERRIS"] == undefined)
	{
		output("You wander up to the front desk, and are quickly greeted by Lerris prancing over to the other side and flipping on the holo-projector.");
		
		output("\n\n<i>“Welcome back, [pc.name]”</i> she smiles, her pair of violet tails wiggling happily behind her. <i>“</i>Anything<i> you want, you let me know, okay?”</i>");
	}
	else
	{
		output("You saunter up to the shop counter, and as always, you’re greeted by the familiar, bouncing form of Lerris. She gives you a pink-lipped smile and wiggles her hips, her [lerris.tails] lifting in the air behind her. The way she languidly leans over the counter and presses up her [lerris.breasts], she looks more like she’s ready to bend over for you than to sell you cosmetics.");
		
		output("\n\n<i>“Hey, cutie,”</i> she purrs, stretching out like a kitten in heat. <i>“Anything I can get for you? Or were you hoping to get hands on with the merchandise again? I know which I want...”</i>");
	}
	
	processTime(3 + rand(3));
	lerrisMenu();
}

public function lerrisMenu():void
{
	clearMenu();
	addButton(0, "Buy", lerrisProducts);
	addButton(1, "Buy Dildo", lerrisDildos);
	addButton(2, "Talk", lerrisTalkMenu);
	if (flags["LERRIS_TALKED_LACTAID"] != undefined && flags["LERRIS_TALKED_LACTAID"] >= 2) addButton(3, "Back Room", lerrisBackRoom, undefined, "Back Room", "See if Lerris is up for another trip to the back room for a little private fun.");
	else addDisabledButton(3, "Back Room");

	if (flags["LERRIS_TALKED_LACTAID"] != undefined && flags["LERRIS_TALKED_LACTAID"] >= 2) addButton(10, "Appearance", lerrisAppearance);
	else addDisabledButton(10, "Appearance");
	
	addButton(14, "Leave", mainGameMenu);
}

public function lerrisProducts():void
{
	chars["LERRIS"].inventory = new Array();
	
	// Lerris after clearing Tarkus makes sense.
	if(flags["PLANET_3_UNLOCKED"] != undefined) chars["LERRIS"].inventory.push(new Anusoft());
	chars["LERRIS"].inventory.push(new NivasBionaHole());
	chars["LERRIS"].inventory.push(new TamaniBionaHole());
	chars["LERRIS"].inventory.push(new Bovinium());
	chars["LERRIS"].inventory.push(new BreedersBliss());
	chars["LERRIS"].inventory.push(new BubbleBuddy());
	// No point in it being sold again if it's already installed!
	if(flags["EGG_TRAINER_INSTALLED"] != 1) chars["LERRIS"].inventory.push(new EggTrainer());
	chars["LERRIS"].inventory.push(new FertitePlus());
	chars["LERRIS"].inventory.push(new FrontRackCream());
	chars["LERRIS"].inventory.push(new Lactaid());
	chars["LERRIS"].inventory.push(new LactaidMilkTank());
	chars["LERRIS"].inventory.push(new LactaidOverdrive());
	// Unlocks
	if(pc.level >= 2) chars["LERRIS"].inventory.push(new NukiNutbutter());
	if(pc.level >= 3) 
	{
		chars["LERRIS"].inventory.push(new SlutSealThong());
		chars["LERRIS"].inventory.push(new AnalPrincessPanties());
		chars["LERRIS"].inventory.push(new AssManBoxers());
		chars["LERRIS"].inventory.push(new BackdoorBoiSlutwear());
		chars["LERRIS"].inventory.push(new CumflationControlBoyshorts());
	}
	// Sera babies
	if(flags["MET_SERA"] != undefined) chars["LERRIS"].inventory.push(new Priapin());
	//chars["LERRIS"].inventory.push(new Sterilex());
	
	CodexManager.unlockEntry("Bubble Buddy");
	shopkeep = lerris;
	buyItem();
}

public function lerrisDildos():void
{
	chars["LERRIS"].inventory = [new DildoCanine(), new DildoEquine(), new DildoFeline(), new DildoTerran(), new DildoTerranCumlux()];
	shopkeep = lerris;
	buyItem();
}

public function lerrisAppearance():void
{
	clearOutput();
	showLerris();

	var cowKitty:Boolean = flags["LERRIS_BOVINIUMED"] != undefined;

	output("Lerris");
	if (!cowKitty) output(" is a punky-looking kaithrit cat-girl");
	else output(" is a punky looking mix between kaithrit cat-girl and buxom bovine");
	output(". She has long green-dyed hair worn loose down past her shoulders, parted by a pair of violet cat-ears");
	if (cowKitty) output(" and a pair of five-inch long, curving cow horns. Perfect for holding onto while you pound her from the front or back");
	output(". A pair of [lerris.tails] poke out from behind her, both the same bright purple as her ears and her slitted cat-eyes. Her body is otherwise completely hairless,");
	if (cowKitty) output(" nice and plump in all the right places with");
	else output(" her");
	output(" creamy skin as smooth as silk and utterly without blemish.");

	output("\n\nUnless you count piercings, anyway. Of those, she has several: a small gold ring runs through a nostril and her lower lip at opposite ends of her face, and she’s got a small silver bar running through one of her eyebrows. Her lips are full and pouty, painted the TamaniCorp pink, and hiding a slightly-coarse feline tongue that’s pierced with a silver ball stud that seems perfectly situated to rub against a glans or clit.");

	output("\n\nOf course, her most eye-catching feature are her [lerris.chest].");
	if (!lerris.hasVagina() && flags["FUCKED_LERRIS"] != undefined) output(" For a male, she’s got a damn fine rack!");
	if (lerris.biggestTitSize() < 7) output(" Her chest is high and perky on her torso, bouncing slightly with every step.");
	else if (lerris.biggestTitSize() < 15) output(" Her chest is heavy enough to sag just a touch, but is so soft and jiggly that it just begs for a grope and squeeze.");
	else if (lerris.biggestTitSize() < 22) output(" Lerris’s chest is absolutely huge, big enough to give a real cow-girl a run for her money. Her bra must be reinforced to keep up with all that weight, but she still jiggles obscenely with even the slightest motion.");
	else output(" Lerris’s chest is as big as she can possibly support on her small frame, enormous and heavy enough to make her even her breathing an utterly sensual affair, full of slight quakes and quivers of her enormous tit-flesh.");
	output(" Her breasts are, of course, swollen even further than normal by her full reserves of [lerris.milk], threatening to bubble up at the slightest touch. And, of course, readily squirting whenever you grope or suckle those broad, ever-hard teats of hers.");

	if (flags["FUCKED_LERRIS"] != undefined)
	{
		output("\n\nLerris isn’t very tall, not quite five-six, but even for what her race would call a smaller frame, her cock seems pitifully small. When soft, it’s almost invisible in her crotch, completely hidden by even her silky panties, much less actual clothing. Hard, she’s probably got a little less than five inches of bitch-clit to play with, though the crown is at least rung with nubs of feline pleasure-bulbs, all sensitive and ready to grind against a pussy’s walls. Lucky for her, she’s got a nice and sensitive prostate, more than able to make sure she cums and cums when she’s bent over and taking it hard from behind. A tiny, tight trap-pouch hugs her balls close to her crotch, making them seem like one small bulb of flesh more than a hanging sack full of virile seed.");
	}

	output("\n\nShe has a nice, thick rump, perfect for spanking and squeezing");
	if (flags["FUCKED_LERRIS"] != undefined) output(" - not to mention fucking - concealing a tight asshole, right where it belongs");
	output(".");

	output("\n\nWhen on duty, Lerris wears a skin-tight TamaniCorp bodysuit, largely purple and pink in color and equipped with a pair of high heels that make sure her plump derriere and [lerris.chest] shake with every step in her sexy gait. Underneath, a pair of lacy-white panties sit high her hips tightly, and she constrains her ample chest in a maternity-style bra meant to help control her heavy lactation.");
	if (lerris.milkFullness > 100) output(" It succeeds, most of the time, but sometimes you see little splotches of [lerris.milk] staining the front of her uniform.");

	addDisabledButton(10, "Appearance");
}

public function lerrisBackRoom():void
{
	clearOutput();
	showLerris();

	output("<i>“How about we go in back,”</i> you suggest, idly reaching across the counter to flick one of Lerris’s nipples through her jumpsuit. She gasps under her breath, ears tucking in against her head as she glances nervously around the shop to make sure nobody saw.");
	
	output("\n\nAfter a moment’s consideration, she nods and gives you a lustful smile. <i>“For my favorite customer? Absolutely </i>anything<i> is on offer. Follow me.”</i>");
	
	output("\n\nShe deactivates the manual terminal and spins on a high heel, strutting to the back room door in that slutty gait of hers, her plump ass jiggling obscenely under her skin-tight suit. It’s all you can do not to give in and just grab hold of it then and there, but you fight back the urge until the both of you are through the door, and Lerris has locked it behind you.");
	
	output("\n\nThen, though... then the dam breaks. You grab Lerris by the ass, shoving her against the nearest bulkhead and sinking both hands into her luscious ass. The milky kitty groans happily, twinned tails moving happily behind her. In front, her [lerris.chest] spreads out against the cold metal, nipples rapidly getting hard. Just like her tiny little boy-clit, you bet. A quick reach around confirms it, letting you feel the small shaft straining against her suit’s crotch.");
	
	output("\n\nYou use the momentum to reach up and grab her zipper, yanking it down around her [lerris.chest] and all the way until she’s able to get a hand free and wiggle her shoulders out of the latexy suit’s confines, letting it spill down around her flared hips. There, your hands go to work, pulling the suit down so you can easily grab at her fat rump, squeezing and kneading her cheeks while she steps out of the uniform and kicks it aside, standing bare except for her milk-maid’s bra and lacey panties.");
	
	output("\n\nLerris squirms around in your grasp, turning to face you and pulling at your gear. It isn’t long before you’re left completely bare, and Lerris is giving you a playful push");
	if (pc.isTaur()) output(" towards");
	else output(" onto");
	output(" the break room couch, sauntering after you with one hand on her full breasts and the other rubbing at her tiny little bitch-clit through her underwear.");
	
	output("\n\n<i>“So,”</i> she breathes, voice husky and full of desire. <i>“I’m all yours, [pc.name]. Anything you want...”</i>");

	//[Suckle] [Give Item] [Bend Her Over]
	clearMenu();
	addButton(0, "Suckle", lerrisSuckle, undefined, "Suckle", "Lerris is always eager to give you a sweet drink, straight from the taps!" +(pc.hasCock() ? " She might even reward you with a little reciprocal oral action..." : ""));
	
	var items:Object = hasItemForLerris();
	if (items.count > 0) addButton(1, "Items", lerrisGiveItems, items);
	else addDisabledButton(1, "Items");

	if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(2, "BendHerOver", lerrisBendHerOver, undefined, "Bend Her Over", "Bend her over and go to town!");
	else addDisabledButton(2, "BendHerOver", "Bend Her Over", "You’d need a cock- or cock-like equipment- to give her a proper seeing to...");
	
	addButton(14, "Back", lerrisMenu);
}

public function hasItemForLerris():Object
{
	var items:Object = { count:0 };
	for each (var item:ItemSlotClass in pc.inventory)
	{
		if (item is Lactaid)
		{ if (!items.Lactaid) ++items.count, items.Lactaid = item; }
		else if (item is Chocolac)
		{ if (!items.Chocolac && lerris.milkType != GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) ++items.count, items.Chocolac = item; }
		else if (item is Honeydew)
		{ if (!items.Honeydew && lerris.milkType != GLOBAL.FLUID_TYPE_HONEY) ++items.count, items.Honeydew = item; }
		else if (item is BoobswellPads)
		{ if (!items.BoobswellPads && lerris.breastRows[0].breastRatingRaw < 23.4) ++items.count, items.BoobswellPads = item; }
		else if (item is Tittyblossom)
		{ if (!items.Tittyblossom && lerris.breastRows[0].breastRatingRaw < 23.4) ++items.count, items.Tittyblossom = item; }
		else if (item is Nepeta)
		{ if (!items.Nepeta && lerris.breastRows[0].breastRatingRaw < 23.4) ++items.count, items.Nepeta = item; }
		// (Only if PC has found out she's a trap)
		else if (item is Pussybloom)
		{ if (flags["FUCKED_LERRIS"] != undefined && !lerris.hasVagina() && flags["LERRIS_ITEMS_GIVEN"] != undefined && !items.Pussybloom) ++items.count, items.Pussybloom = item; }
		else if (item is Bovinium)
		{ if (flags["FUCKED_LERRIS"] != undefined && flags["LERRIS_ITEMS_GIVEN"] != undefined && flags["LERRIS_BOVINIUMED"] == undefined && !items.Bovinium) ++items.count, items.Bovinium = item; }
	}
	return items;
}

public function lerrisGiveItems(items:Object):void
{
	clearOutput();
	showLerris();

	output("Before the two of you get started, you tell Lerris you have a present for her. Her big cat-eyes widen, and she makes a giddy little squeak. <i>“Ooh, what is it?”</i> she purrs, sniffing at your hand as you pull out your gift...");
	
	clearMenu();
	var i:int = 0;
	if (items.Lactaid) addButton(i++, items.Lactaid.shortName, lerrisConsumeItem, items.Lactaid, StringUtil.toDisplayCase(items.Lactaid.longName), items.Lactaid.tooltip);
	if (items.Chocolac) addButton(i++, items.Chocolac.shortName, lerrisConsumeItem, items.Chocolac, StringUtil.toDisplayCase(items.Chocolac.longName), items.Chocolac.tooltip);
	if (items.Honeydew) addButton(i++, items.Honeydew.shortName, lerrisConsumeItem, items.Honeydew, StringUtil.toDisplayCase(items.Honeydew.longName), items.Honeydew.tooltip);
	if (items.BoobswellPads) addButton(i++, items.BoobswellPads.shortName, lerrisConsumeItem, items.BoobswellPads, StringUtil.toDisplayCase(items.BoobswellPads.longName), items.BoobswellPads.tooltip);
	if (items.Tittyblossom) addButton(i++, items.Tittyblossom.shortName, lerrisConsumeItem, items.Tittyblossom, StringUtil.toDisplayCase(items.Tittyblossom.longName), items.Tittyblossom.tooltip);
	if (items.Nepeta) addButton(++i, items.Nepeta.shortName, lerrisConsumeItem, items.Nepeta, StringUtil.toDisplayCase(items.Nepeta.longName), items.Nepeta.tooltip);
	if (items.Pussybloom) addButton(i++, items.Pussybloom.shortName, lerrisConsumeItem, items.Pussybloom, StringUtil.toDisplayCase(items.Pussybloom.longName), items.Pussybloom.tooltip);
	if (items.Bovinium) addButton(i++, items.Bovinium.shortName, lerrisConsumeItem, items.Bovinium, StringUtil.toDisplayCase(items.Bovinium.longName), items.Bovinium.tooltip);
	addButton(14, "Back", lerrisBackRoom);
}

public function lerrisConsumeItem(itemInstance:ItemSlotClass):void
{
	clearOutput();
	showLerris();

	if (flags["LERRIS_ITEMS_GIVEN"] == undefined) flags["LERRIS_ITEMS_GIVEN"] = 0;
	flags["LERRIS_ITEMS_GIVEN"]++;

	if (itemInstance is Lactaid)
	{
		//Run effects of Lactaid on Lerris, including potential breast-size growth and milk increases.

		output("<i>“Oooh!”</i> Lerris coos as you present the Lactaid-band medipen. <i>“You really know what a girl wants, don’tcha, [pc.name]?”</i>");
		
		output("\n\nShe happily accepts your offering, plucking the pen out of your hand and squeezing you in a big, boob-filled hug. <i>“Thankyouthankyou<b>thankyou</b>”</i> she squeals, hopping out of your lap and unwrapping the medipen. She immediately presses it into one of her [lerris.breasts], gasping a little as the nanomachines flow into her weighty mammaries.");
		
		if (lerris.milkType != GLOBAL.FLUID_TYPE_MILK) lerris.milkType = GLOBAL.FLUID_TYPE_MILK;
		lerris.milkFullness += 100;

		output("\n\nIt doesn’t take more than a moment for you to see her breasts swell up, surging with milk. Her nipples stiffen and begin to bead droplets of [lerris.milk] without so much as a touch. Though she <i>does</i> start touching them, groping her boobs and kneading them like the udders they are, drawing her newly-refreshed cream out and into her milk-catching bra. The material bloats full in an instant, making her shiver as her body smears itself with warm kitty-cream. And, you notice, a distinctive tent has formed in the hem of her panties, even harder than when promised sex moment ago.");
		
		output("\n\n<i>“Ah, that’s awesome!”</i> Lerris says between little moans. <i>“My nips feel so sensitive now, I can almost cum just from feeling them squirt! Oh, I hope you’re thirsty, [pc.name],”</i> she adds, crawling back into your lap and planting a long train of kisses from your chest up to your neck.");

		pc.destroyItemByReference(itemInstance);
		clearMenu();
		addButton(0, "Next", lerrisSuckle);
	}
	else if (itemInstance is Chocolac || itemInstance is Honeydew)
	{
		output("<i>“What’s this?”</i> she asks, taking the proffered gift and holding it up to the dim station light overhead. Her lips scrunch up as she reads the label and she half-pouts, <i>“Aww, don’t you like my milk?”</i>");
		
		if (itemInstance is Chocolac) lerris.milkType = GLOBAL.FLUID_TYPE_CHOCOLATE_MILK;
		else if (itemInstance is Honeydew) lerris.milkType = GLOBAL.FLUID_TYPE_HONEY;

		output("\n\nYou insist that’s not the case, but that variety’s the spice of life. Besides, you’ve got a craving for [lerris.milk].");
		
		output("\n\n<i>“Well, I guess I can’t turn down free mods!”</i> she laughs, leaning in and giving you a quick kiss before unwrapping your milky gift. She takes it without a second thought, moaning softly as the mods start to take effect. You settle your hands on her hips and watch as Lerris’s nipple stiffen, leaking out a trickle of her pent-up old milk before starting to swell with a sudden abundance.");
		
		output("\n\nSlowly, your hands work their way up and onto her breasts, squeezing the pair of lush orbs until a stream of her new and improved [lerris.milk] squirts into the transparent hold of her bra. The translucent material bloats with the sheer volume even a few gentle squeezes can milk out.");
		
		output("\n\n<i>“I need to get that thing ported for a straw. Ooh, that’s nice,”</i> Lerris moans, pressing herself deeper into your groping grasp. <i>“Until then... why don’t you tear this off me and get your treat?”</i>");

		pc.destroyItemByReference(itemInstance);
		clearMenu();
		addButton(0, "Next", lerrisSuckle);
	}
	else if (itemInstance is BoobswellPads || itemInstance is Tittyblossom || itemInstance is Nepeta)
	{
		output("<i>“Now this is my kind of mod!”</i> Lerris giggles, taking the gifted mod from your hand and holding it up to the light. <i>“Mmm, the way we’re going, I’m gonna end up being the most stacked girl on the station... not that I’m complaining!”</i>");
		
		output("\n\nShe gives you a quick peck on the cheek and adjusts the straps on her bra, preemptively loosening it around her already ample rack. Once she’s made room for her soon-to-be bigger bust, Lerris");
		if (itemInstance is BoobswellPads) output(" sticks the pads under her [lerris.breasts]")
		else output(" pops your mod");
		output(" and wraps her arms around your shoulders, passing the wait with a slow exchange of kisses and gropes. It isn’t long before you feel her chest pressing against your own, even though she’s not moving herself; her rack fills out with added size and weight, stretching out her bra and starting to leak a little [lerris.milk]. And, of course, her bitch-clit is as hard as can be, grinding against your thigh and starting to bubble up a little white kitty-cream onto your lap.");

		lerris.breastRows[0].breastRatingRaw += 1;
		if (lerris.breastRows[0].breastRatingRaw > 23) lerris.breastRows[0].breastRatingRaw = 23.5;
		
		output("\n\nLerris purrs happily, pressing her [lerris.chest] into your face and wiggling her shoulders. The creamy weight slapping your cheeks has to have her up to "+ lerris.breastCup(0) + "s! You can only imagine how much [lerris.milk] she can store in those big jugs now!");
		
		output("\n\n<i>“So how’re you gonna use these... and me?”</i> she murmurs in your [pc.ear], grinding her tits in your face. Like she said earlier, everything’s on the menu with this slutty kitten!");
		
		pc.destroyItemByReference(itemInstance);
		clearMenu();
		addButton(0, "Suckle", lerrisSuckle, undefined, "Suckle", "Lerris is always eager to give you a sweet drink, straight from the taps!" +(pc.hasCock() ? " She might even reward you with a little reciprocal oral action..." : ""));
		if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(1, "BendHerOver", lerrisBendHerOver, undefined, "Bend Her Over", "Bend her over and go to town!");
		else addDisabledButton(1, "BendHerOver", "Bend Her Over", "You’d need a cock- or cock-like equipment- to give her a proper seeing to...");
	}
	else if (itemInstance is Pussybloom)
	{
		output("<i>“Another present?”</i> Lerris cheers, plucking the item from your hand and holding it up to the light. <i>“Thank- wait, what’s this?”</i>");
		
		output("\n\nYou grin up at her, saying that you remembered her having said she never got the mods to complete her transformation into a full-fledged dickgirl. So you thought you’d help her out with that... if she wants.");
		
		output("\n\nLerris glances between you and the pussy-growth drug. Her ears are tucked down against her scalp, and her twinned tails brush slowly against your [pc.leg]. <i>“Uhhh... wow,”</i> she breathes, chewing on her lip ring. <i>“[pc.name], that’s... that’s <b>so generous</b> of you. I don’t know what to say.”</i>");
		
		output("\n\nA yes or no to accepting it would be a start.");
		
		output("\n\n<i>“Y-yes!”</i> she cries, throwing her arms around you and hugging you so tight you have to beg for air. When she lets you go, there’s a huge smile on her lips. <i>“I-I-I’ve been saving up for a Pussybloom forever. Just could never scrape the money together. Oh, [pc.name], you’re the greatest!”</i>");
		
		output("\n\nLerris giggles with joy, clutching the pill packet to her jiggling chest. <i>“");
		if (pc.hasCock() || pc.hasHardLightEquipped()) output("Don’t worry, you’ll be the first to break it in with me!");
		else output("You sure you don’t want to go grab a hardlight from Mi Amour or something to break it in with me? Before my girlfriend beats you to it, anyway!");
		output("”</i>");
		
		output("\n\nShe gives you a kiss on the forehead before craning back on her knees, unwrapping the pill and hold it up to her lips.");
		
		output("\n\n<i>“Okay,”</i> she says, taking a deep breath. <i>“Now I’m finally gonna have something other than a boy-pussy to play with. Bottoms up!”</i>");
		
		output("\n\nLerris pops the pill in her mouth, washing it down by unlacing one of her breasts from her bra and taking a long swig of [lerris.milk] straight from the tap. When she’s finished, the cat-girl takes another long breath and closes her eyes, waiting. Though her chest rises and falls evenly for the first few moments, your eyes wander down in time to see her small cock rising up of its own accord, the nubbed glans peeking out from her lacy underwear and bubbling with pre. Lerris gasps, biting her lip as some hidden pleasure overtakes her, but she keeps her arms firmly on you - maybe she wants you to be the one to give her her first orgasm as a true hermaphrodite?");
		
		output("\n\nShe might not have much of a choice about it, though, as her whole body tenses and a whimper escapes her throat. Looking up, you can see her nipples stiffening, starting to bead with [lerris.milk], and a dark splotch starts spreading on her panties. <i>“O-oh stars,”</i> she whimpers, shivering in your arms. <i>“It... it feels like the biggest cock I’ve ever felt is tearing me apart! It feels </i>amazing<i>. So deep and tingling everywhere!”</i>");
		
		output("\n\nLerris’s head rolls back, breath coming in ragged shudders as a hole opens between her legs, nerves springing to life in an orgasmic cascade. When it passes, she collapses head-first into your [pc.chest], breathing hard and drooling cum from her nubby cock. <i>“P-please, [pc.name],”</i> she mewls, clutching at you with shaking hands. <i>“I’ll do anything you want, just get me off! Use me, please!”</i>");

		lerris.vaginas = [];
		lerris.vaginas.push(new VaginaClass());

		pc.destroyItemByReference(itemInstance);
		clearMenu();
		addButton(0, "Suckle", lerrisSuckle, undefined, "Suckle", "Lerris is always eager to give you a sweet drink, straight from the taps!" +(pc.hasCock() ? " She might even reward you with a little reciprocal oral action..." : ""));
		if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(1, "BendHerOver", lerrisBendHerOver, undefined, "Bend Her Over", "Bend her over and go to town!");
		else addDisabledButton(1, "BendHerOver", "Bend Her Over", "You’d need a cock- or cock-like equipment- to give her a proper seeing to...");
	}
	else if (itemInstance is Bovinium)
	{
		flags["LERRIS_BOVINIUMED"] = 1;

		output("You fish out the packet of gummy candies and dangle it in front of Lerris’s pretty face. A cute, milky kitty like her is practically a cow-girl already, so these should be right up her alley.");
		if (!lerris.hasVagina()) output(" Besides, there’s a good chance they might help her get that pussy she’s been craving for.");
		if (flags["MET_CASS"] != undefined) output(" After all, you’ve already met one awesome kitty-cow, so you can testify just how smoking hot they are!");
		output(" If nothing else, these things will give her lactation a heck of a boost!");

		output("\n\n<i>“Wait a minute,”</i> Lerris says, plucking the gummy bottle out of your hand and eyeing it suspiciously. <i>“We sell Bovinium! This does a loooot more than just turn you into a milky girl, [pc.name].”</i>");
		
		output("\n\nWell yeah. But it’s all the good stuff: thicker, wetter, milkier... everything a horny girl like her could want. Maybe she’ll even <i>grow</i> some horns!");
		
		output("\n\nLerris glances between you and the bottle, rubbing at one of her many piercings while she thinks. <i>“Weeeeell, I guess you did already buy it for me. And I know for a fact these are amazing for milk production.");
		if (!lerris.hasVagina()) output(" Not to mention being way cheaper than Pussybloom for getting a, uh, pussy. If I’m lucky!");
		output("”</i>");

		output("\n\nSomething told you she’d find it agreeable.");
		
		output("\n\n<i>“Okay, well, why not! Worst that can happen is somebody decides I need a cowbell instead of a kitty bell on my collar! Hehe, let’s see what happens.”</i>");
		
		output("\n\nLerris pops the top open and tips the bottle into her mouth, leaning back until its entire contents are spilled out.");

		output("\n\n<i>“Wait!”</i> you start to say, <i>“You’re only supposed to take one!”</i>");
		if (silly) output(" Why doesn’t anybody ever read directions!?!!?");

		output("\n\nHer eyes go wide. <i>“Uh... uh-oh.”</i>");

		if (lerris.breastRows[0].breastRatingRaw < 23.5)
		{
			output("\n\nNaturally, her tits are the first things to change. Lerris barely has enough time to yank her bra off before her chest starts swelling up, expanding with jiggling cellulose and filling with more and more [lerris.milk] than even before! She groans with mindless pleasure, groping and pinching at herself until an arc of [lerris.milk] spurts from between her fingers and all over your");
			if(pc.isChestExposed()) output(" bare");
			output(" chest!");
			
			lerris.breastRows[0].breastRatingRaw += 3;
			if (lerris.breastRows[0].breastRatingRaw > 23.5) lerris.breastRows[0].breastRatingRaw = 23.5;

			output("\n\nYou take it in stride, licking a few droplets off your lips and reaching up to cup the full mounds spilling off of Lerris’s chest. Once they’re firmly held in your veteran grasp, they soon stop growing, settling in at "+ lerris.breastCup(0) +"s, by your estimate. What a busty kitty you’ve got now!");
		}

		output("\n\nIt isn’t long before her buxom chest gets the milky upgrade Lerris wanted, beading with [lerris.milk] even when she isn’t eagerly groping herself. Though her tits don’t get any bigger now, you can feel them getting heavier, starting to sag on her chest just a little more as they gain so much more weight in pure lactic bounty. At the rate she’s swelling up now, you doubt she’s ever going to be able to <i>stop</i> lactating, even if she wanted to!");
		
		lerris.milkFullness = 200;
		lerris.milkMultiplier = 10;

		output("\n\nThough now that you look, her tits aren’t the only things to be putting on a little weight! While Lerris wasn’t exactly rail-thin when you met, she definitely cut a decidedly skinny figure. But when you reach down and run a hand across her belly, you can feel it getting just a touch softer and meatier. Her thighs and hips follow suit, gaining just that little extra thickness to make those huge tits of hers seem perfectly natural on her figure. Even her ass seems a little plumper - and, as you demonstrate, more spankable!");

		lerris.thickness += 20;
		lerris.buttRatingRaw += 30;
		lerris.hipRatingRaw += 30;
		
		output("\n\nLerris gasps, biting her lip hard as she’s assaulted with pleasure from all directions. Your fingers dig into her fat behind, squeezing the plush cheeks until you feel a spurt of hot precum splatter into your lap, and the kitten’s tail-hole is winking at the tips of your fingers, practically inviting you to slip a pair in and give her a thrill!");
		
		output("\n\nWhile your attention is focused on her behind, though, you watch with wide eyes as her twin feline tails bristle, then start to recede into themselves until they’re only perhaps three quarters their original thickness. The fur on their tips starts to fill out, growing thicker and softer until <b>they’ve formed a pair of adorable bovine poofs at the tips!</b> Lerris makes a concerned mewl, looking over her shoulder at her more cow-like tails, and sighs. <i>“A-at least they’re cute! Oh, Jessa’s never going to let this go now!”</i>");

		lerris.tailType = GLOBAL.TYPE_BOVINE;
		lerris.tailFlags = [];
		
		output("\n\nWell, she can just shave them down if she doesn’t like them, right? After all, aside from the changes to her breasts, there’s nothing making her look decidedly un-kaithrit yet.");
		
		output("\n\n...You say, immediately before Lerris yelps and grabs her temples, scratching at them with a madwoman’s vigor. <i>“Ohfuckohfuck it itches!”</i> she yelps, clawing at her scalp. To your horror, the skin right above her temples starts to flake away, coming out in patches with her claws. In their place, you see a pair of small bone-like nubs starting to come in. <b>Lerris is growing horns!</b>");

		lerris.hornType = GLOBAL.TYPE_BOVINE;
		lerris.hornLength = 5;
		lerris.horns = 2;
		
		output("\n\nYou reach up and restrain her hands, pulling them behind her back before she can actually hurt herself. Instead she squirms weakly in your grasp, still leaking a hefty flow of [lerris.milk] all over herself. The two nubs on her brow start really filling out once she’s finished clawing at them, steadily growing and growing, well past what an actual dairy cow should have! By the time they’re more or less finished, Lerris is sporting a pair of five inch curved handlebars on her head, complete with a slightly felty texture, yet at a touch seem as hard as bone.");
		if (pc.hasCock()) output(" You can’t wait to pound this kitty-cow’s pussy while holding onto these things!");
		
		output("\n\n<i>“Ugg,”</i> your lover manages to groan, blinking heavily. You release her hands, letting her wander up and touch her new bovine accoutrements. <i>“Horns! Wow, they’re <b>huge</b>.”</i>");
		
		output("\n\nYou tweak one of Lerris’s leaky nipples, asking if she minds such an obvious change.");
		
		output("\n\nShe answers with a soft laugh, pressing herself up against you. <i>“Not when I’m stacked like a leithan and swollen with so much [lerris.milk] that I can barely stand upright! Might as well just tell the whole world I’m just [pc.name]’s pretty little sex cow.”</i>");
		
		output("\n\n<i>“You’ll buy me a nice milker and a cow-bell, won’t you?”</i> she teases, rubbing her still-squirting breasts all along your [pc.chest]. <i>“Maybe a nice, hung stud bull to keep me company when you’re off sailing the galaxy? I.. o-oh!”</i>");

		if (!lerris.hasVagina())
		{
			output("\n\nYour eyes wander down in time to see her small cock rising up of its own accord, the nubbed glans peeking out from her lacy underwear and bubbling with pre. Lerris gasps, biting her lip as some hidden pleasure overtakes her, but she keeps her arms firmly on you - maybe she wants you to be the one to give her her first orgasm as a true hermaphrodite?");
			
			output("\n\nShe might not have much of a choice about it, though, as her whole body tenses and a whimper escapes her throat. Looking up, you can see her nipples stiffening, starting to bead with [lerris.milk], and a dark splotch starts spreading on her panties. <i>“O-oh stars,”</i> she whimpers, shivering in your arms. <i>“It... it feels like the biggest cock I’ve ever felt is tearing me apart! It feels </i>amazing<i>. So deep and tingling everywhere!”</i>");
			
			output("\n\nLerris’s head rolls back, breath coming in ragged shudders as a hole opens between her legs, nerves springing to life in an orgasmic cascade. When it passes, she collapses head-first into your [pc.chest], breathing hard and drooling cum from her nubby cock. <i>“P-please, [pc.name],”</i> she mewls, clutching at you with shaking hands. <i>“I’ll do anything you want, just get me off! Use me, please!”</i>");

			lerris.vaginas = [];
			lerris.vaginas.push(new VaginaClass());
		}
		else
		{
			output("\n\nLerris gasps, biting her lip as some hidden pleasure overtakes her, but she keeps her arms firmly on you, bucking in your lap. Her whole body tenses and a whimper escapes her throat. Looking up, you can see her nipples stiffening, starting to bead with [lerris.milk], and a dark splotch starts spreading on her panties.");
			
			output("\n\n<i>“O-oh stars,”</i> she whimpers, fingers digging into your shoulders. <i>“My pussy’s cumming on its own! It’s sooo wet, aahhh!”</i>");
			
			output("\n\nShe takes one long, ragged breath and fixes you with her eyes, wild with desperation. <i>“Wet and ready for you, [pc.name]. Gah, I’ll do anything you want, just get me off! This is just too much... I need it so bad!”</i>");

			lerris.vaginas[0].wetnessRaw = 4;
		}

		pc.destroyItemByReference(itemInstance);
		clearMenu();
		addButton(0, "Suckle", lerrisSuckle, undefined, "Suckle", "Lerris is always eager to give you a sweet drink, straight from the taps!" +(pc.hasCock() ? " She might even reward you with a little reciprocal oral action..." : ""));
		if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(1, "BendHerOver", lerrisBendHerOver, undefined, "Bend Her Over", "Bend her over and go to town!");
		else addDisabledButton(1, "BendHerOver", "Bend Her Over", "You’d need a cock- or cock-like equipment- to give her a proper seeing to...");
	}
	else
	{
		output("<b>Invalid item!!!</b>: " + itemInstance.shortName);
		output("\n\nPlease report a bug!");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function lerrisBendHerOver():void
{
	clearOutput();
	showLerris(true);

	var holeCap:int = (lerris.hasVagina() ? lerris.vaginalCapacity(0) : lerris.analCapacity());

	var cockIdx:int = -1;
	if (pc.hasCock())
	{
		cockIdx = pc.cockThatFits(holeCap);
		if (cockIdx == -1) cockIdx = pc.smallestCockIndex();
	}

	output("There’s only one thing you want, and sinking both your hands into Lerris’s cute little ass");
	if (pc.hasCock()) output(" while your [pc.cock " + cockIdx + "] rubs against her thigh");
	else output(" after flicking on your hardlight attachment");
	output(" is all you need do to get it. Lerris moans, teasing at her lip-ring as her back arches, booty shaking in your grasp.");
	
	output("\n\n<i>“Well, I did say </i>anything<i>,”</i> she mewls, reaching down and wrapping her hands around your [pc.cockOrStrapon " + cockIdx + "]. An electric surge of pleasure cascades up your spine as the milky kitty starts to caress your turgid length. <i>“You just happened to choose my second-favorite thing!”</i>");
	
	output("\n\nYou chuckle, kneading her plump behind with your fingers as encouragingly as you can. Every little moan and gasp you draw from Lerris translates into her wrist moving a little faster, until she’s pumping away with wild abandon. You roll your head back, relaxing against the cushions as the cat-girl goes to town, jacking you off and grinding in your lap. Her [lerris.breasts] bounce enticingly, puffy nipples all but rubbing in your face. You lean in and grab one with your lips, the slightest suckle drawing a flow of sweet [lerris.milk] into your mouth. A delicious treat for you that just makes the kitty-slut that much hornier, locked in an endless cycles of little gasps and moans.");

	output("\n\n<i>“G-gentle,”</i> Lerris moans, voice breaking. Every syllable is heavy and husky with desire. <i>“I... I...”</i>");

	output("\n\nYou peel yourself off from her breast to shush her, then transition to the other. One of your hands migrates from Lerris’s bouncing bubble-butt to the rock-hard bitch-clit peeking out of her panties, gently massaging the short little shaft. Her bucking hips thrust greedily into your grasp, almost as fast as what she’s doing to your own [pc.cockOrStrapon " + cockIdx + "]. The way she’s mewling, you don’t need much more heads up before you cap your thumb over the kitten’s petite cum-slit, pinning in the saltier cream she’s starting to leak.");
	
	output("\n\nLerris gasps, your last warning before a rush of warmth splatters over your hand, smearing across your palm and the cat-girl’s own thighs. You chuckle as she rolls her head back, crying out her pleasure and squirting milk and seed all over herself. What a mess! A nasty, sexy mess!");
	
	output("\n\n<i>“O-one of these days,”</i> she gasps, <i>“You’ll cum first!”</i>");

	output("\n\nNot when she makes you the sweetest lube on the station, free for the taking. You smear the salty stuff all over your hand, then brush hers aside to grab your [pc.cockOrStrapon " + cockIdx + "], evenly coating your tingling length with the kitty’s leakage as she herself goes soft, retracting into her messed panties. Grinning up at her between deep draughts of her milk, you start moving on to the main course: that delicious");
	if (flags["FUCKED_LERRIS"] == undefined || lerris.hasVagina()) output(" pussy");
	else output(" ass");
	output(" of hers!");

	if (flags["FUCKED_LERRIS"] == undefined)
	{
		output("\n\nYou pull the stained fabric of Lerris’s panties aside, thrusting your fingers into the gap between her legs... and finding solid flesh all the way from her trappy pouch to the tight little ring of her ass.");
		
		output("\n\nYou blink. <i>“Wait, you’re-”</i>");
		
		output("\n\n<i>“A girl. Shush,”</i> Lerris moans, urgently pushing her breasts back in your face. <i>“Just haven’t taken the mods to finish what Lactaid helped start. Don’t make me beg, now, put it in already!”</i>");
		
		output("\n\nYou’ve gone too far to really question it now, and you’re so hard now that you’re just as keen to stick it in Lerris’s ass as anything else!");
	}
	else
	{
		output("\n\nYou pull the stained fabric of Lerris’s panties aside, thrusting your fingers up into Lerris’s [lerris.vagOrAss].");
	}

	output("\n\nShe gasps as your fingers enter her with ease, glazed with her warm, salty lube as they are, and start to thrust into her.");
	if (!lerris.hasVagina()) output(" Her ass is nice and tight, only accepting one finger at first, then gradually two. You take your time smearing her creamy cum all around inside, glazing her sphincter with lube before pulling out.");
	else
	{
		output(" Her twat is just wide enough to slip three fingers inside to stretch her out, slowly smearing her own seed across the walls of her pussy. Lerris moans, bucking her hips against your thrusting hand.");
		if (silly || pc.IQ() <= 15) output(" Wonder if she can get knocked up by herself...");
	}

	output("\n\nOnce she’s nice and ready, you grab Lerris by the hips and roll her over, planting her on her knees beside you on the couch, hands braced on the back and ass in the air, presented for your inspection. You swing around behind her, grabbing your [pc.cockOrStrapon " + cockIdx + "] and flopping it into the cleft of her meaty derriere. Lerris’s [lerris.tails] raise invitingly, tickling your");
	if (pc.isGoo()) output(" gooey facade.");
	else if (pc.hasMuzzle()) output(" muzzle.");
	else output(" chin.");
	
	output("\n\nSpreading her cheeks wide, you plunge into the slimy embrace of Lerris’s [lerris.vagOrAss].");

	pc.cockChange(true, false);
	if (lerris.hasVagina()) lerris.cuntChange(0, (pc.hasCock() ? pc.cockVolume(cockIdx) : pc.hardLightVolume()), true, true, false);
	else lerris.buttChange((pc.hasCock() ? pc.cockVolume(cockIdx) : pc.hardLightVolume()), true, true, false);

	output(" She squeals, bucking forward under the sheer pressure of your entrance until her face is pressed against the back of the sofa. Her breasts bounce hypnotically while she moves, tempting you into reaching forward and taking them both in your hands, squeezing until she sprays milk between your fingers and her");
	if (lerris.hasVagina()) output(" pussy");
	else output(" ass");
	output(" is clenching like a wet fist around your");
	if (!pc.hasCock()) output(" holographic");
	output(" prick.");

	output("\n\nOnce you");
	if (!pc.hasCock() || pc.cockThatFits(holeCap) != -1) output("’re fully buried");
	else output("‘ve shoved as much cock as you possibly can");
	output(" inside the squirming kitty, you lean forward, pressing your [pc.chest] into her back, and ask what she wants. Lerris’s only answer at first are gasping little moans and clenches so hard around your cock that you can barely breathe. You give as good as you get, though, savaging her [lerris.breasts] until the couch is positively drenched - not to mention her!");
	
	output("\n\n<i>“What do you want?”</i> you repeat, squeezing down with every syllable.");
	
	output("\n\n<i>“F-f-f-”</i> she tries to answer, biting her lip hard as your [pc.hips] rock against her butt. <i>“Fuck me! Oh stars, [pc.name], fuck me!”</i>");
	
	output("\n\nYou’re more than happy to sate <i>that</i> desire, punctuating your acceptance with a long draw back that takes you out of Lerris’s [lerris.vagOrAss] until only your cockhead remains, spreading her hole open until you thrust back in.");
	
	output("\n\nLerris’s cock flops limply under her, bouncing with the impact of your hips battering against her ass. Your [pc.cockOrStrapon " + cockIdx + "] hammers her, pounding away at her slutty little hole. Before long her tongue lolls out of her mouth amid gasps and cries, showing her utter surrender to pleasure as you mercilessly ");
	if (!lerris.hasVagina()) output("ass-");
	output("fuck her.");

	output("\n\nShe’s loving every second of it.");

	if (lerris.hasHorns()) output("\n\nYour hands wander up and grab Lerris’s bovine horns, using them like the handlebars they are to keep her right where you want her while you pound her slutty hole.");
	else output("\n\nYour hands keep Lerris steady, pinning her against the sofa while she serves as your perfect cock-holster time and time again.");
	output(" Even with all the lube she made for you, she’s crushingly tight, perfectly molding her inner flesh to every inch of your [pc.cockOrStrapon " + cockIdx + "], squeezing you from crown to base.");

	output("\n\nWith Lerris still basting in her own cum and moaning like a whore, you don’t feel any obligation to hold back now. You start to feel a pressure building up, a tension in your loins roiling with your rising desire. Feeling the");
	if (pc.hasCock()) output(" heavy weight of seed rushing up your [pc.cock " + cockIdx + "]");
	else output(" mounting pleasure in your faux-cock, almost ready to overload your nerves with pleasure,");
	output(" makes you fuck her that much harder, pounding at her bouncy butt until your orgasm crashes into you like a tidal wave. You roar with pleasure, giving voice to your orgasm and slam yourself to the hilt into Lerris’s [lerris.vagOrAss].");
	if (pc.hasCock()) output(" The cat-girl’s back arches as the first wet squirts of your [pc.cumNoun] fill her, mixing with her own cum.");
	else output(" The false nerves in your faux-cock send electric shockwaves up your spine, crawling through your [pc.skinFurScales] like lightning.");

	output("\n\nLerris feels you cumming and manages to buck her hips against you, thrusting back to get as much cock in her as possible before your climax passes. The way her muscles contract around you, instinctively milking your throbbing");
	if (!pc.hasCock()) output(" holographic");
	output(" erection, you don’t need to see the lances of white cream shooting across the bottom of the couch to know that she’s joining you in orgasm.");

	output("\n\n<i>“O-oh, [pc.name],”</i> the kitten moans, resting her head on the back of the sex-soiled couch. You pull out of her,");
	if (pc.hasCock()) output(" unleashing a small trickle of spooge packed into her [lerris.vagOrAss]");
	else output(" flipping off your hardlight");
	output(". <i>“We really made a mess! Gonna have to find myself a galotian to get this place clean!”</i>");

	output("\n\nYou chuckle, patting her plump behind. It’s already turning a little red from your rough treatment, begging for a good smack");
	if (pc.hasCock()) output("... that sends another squirt of your cum splattering to the ground");
	output(". Lerris shivers, teasing your cheeks with her tails as she stretches out.");

	output("\n\n<i>“Show yourself out, mmm? I think I deserve a little cat nap after that.”</i>");

	output("\n\nYou do so, getting your gear back on and leaving the cat-girl with a parting grope.");

	if (flags["FUCKED_LERRIS"] == undefined) flags["FUCKED_LERRIS"] = 0;
	flags["FUCKED_LERRIS"]++;

	processTime(30+rand(11));
	pc.orgasm();
	lerris.orgasm();
	if (lerris.hasVagina()) lerris.loadInCunt(pc, 0);
	else lerris.loadInAss(pc);

	currentLocation = "9007";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lerrisSuckle():void
{
	clearOutput();
	showLerris(true);
	
	if (flags["SUCKLED_LERRIS"] == undefined) flags["SUCKLED_LERRIS"] = 0;
	flags["SUCKLED_LERRIS"]++;

	output("You’re mind is set on one thing, and one thing only: the pair of [lerris.breasts] flush with your face, begging to be sucked. They jiggle with Lerris’s husky breathing, rising and falling on her slender chest. Your hands slowly slide up her body, from her juicy hips and belly up to the full mounds of her tits.");
	
	output("\n\n<i>“Go ahead,”</i> she whispers, putting her hands on yours");
	if (lerris.milkFullness <= 50) output(" to completely cover her breasts");
	else if (lerris.milkFullness <= 150) output(", though even together you can’t cover her expansive chest");
	else output(", though even two pairs of hands can barely cover her broad, plate-like nipples, let alone her enormous bosom");
	output(". <i>“They’re so full!”</i>");
	
	output("\n\nThe barest touch has her big nipples stiffening under her bra, making a pair of moistened peaks beading with [lerris.milk]. You slip your fingers underneath the transluscent material, taking both big orbs in your hands and squeezing. The cat-girl gasps, cock stiffening against your thigh as your gently milk out a steady stream of kitty-cream into her custom bra. Giggling, she reaches back and unclasps it, letting the soiled garment flop to the floor in a puddle of her bounty.");
	
	output("\n\n<i>“Drink up,”</i> she purrs, wiggling her shoulders to make her leaking boobs bounce in your face, brushing a stiff pink teat across your [pc.lips]. You catch it, circling your tongue around it and sucking ever so gently. It takes absolutely no effort at all to get her milk flowing freely into your mouth, drawing in cheek-swelling gulps every two or three seconds. Damn, she’s full!");
	
	output("\n\nYou drink deep, swallowing her [lerris.milk] as fast as you can. Between sucks, you grope and squeeze her breasts, inching toward the other nipple to balance out the milky weight in the cat’s [lerris.chest].");
	
	output("\n\n<i>“O-oh yeah,”</i> the kitty purrs, biting a lip and rocking herself forward in your lap. Your face is completely surrounded by soft, milky kitty-titty, enveloped in boobflesh until you can’t see anything but scant glimpses of Lerris’s blissful face. <i>“Stars, that feels good. So good! Oh, [pc.name]!”</i>");
	
	output("\n\nJust from the pleasure of having her breasts swollen and drained of milk seems enough to drive this mammary-obsessed beauty over the edge. She gives you just enough warning for you to shift her in your lap, angling her hips away from you before a spurt of white cream jettisons from her panties, splattering luridly across the deck. The rest of her orgasm is wasted into her panties, bubbling up from her tiny, throbbing prick until a transparent stain has pretty much soaked the front of her underwear.");
	
	output("\n\nLerris lets out a cute little moan, her breath raggedly escaping her lips as she bucks her hips atop you. For such a small little package, she certainly can make a mess, but the real treat comes from up top. Her breasts ejaculate milk to the beat of her cumming cock, squirting way more sweet kitty cream into your mouth than before. You cough up [lerris.milkColor] cream, desperately switching breasts to keep from being completely flooded out.");
	
	output("\n\n<i>“Ah! I’m sorry,”</i> she whimpers, swishing her [lerris.tails] against your [pc.leg]. She bends down on herself like only a kaithrit can, lapping at a small puddle of her still-warm seed that’s splattered onto your thigh. <i>“They’re just so sensitive!”</i>");
	
	output("\n\nOh, you know alright. But now that she’s had her fun, maybe she could reciprocate a little?");
	if (pc.hasCock())
	{
		output(" Your [pc.cocks]");
		if (pc.cocks.length == 1) output(" is");
		else output(" are");
		output(" so stiff right now you can barely think!");
	}
	else output(" You are so flushed with arousal that you feel like you’re on fire!");
	output(" You need relief too!");
	
	output("\n\n<i>“Yes, "+ pc.mf("sir", "ma’am") +"!”</i> Lerris purrs obediently. <i>“Let me take care of everything!”</i>");

	processTime(15 + rand(6));
	pc.milkInMouth(lerris);
	pc.milkInMouth(lerris);

	//PC either has options if cock-wielder, else [Next] into continuation.
	if (pc.hasCock() || pc.hasHardLightEquipped())
	{
		clearMenu();
		addButton(0, "Get Blown", lerrisSuckleGetBlown, undefined, "Get Blown", "Have Lerris get down and put her mouth to good use...");
		addButton(1, "Milky 69", lerrisSuckleMilky69, undefined, "Milky 69", "Lie down on the couch and suckle from Lerris while she " + (pc.canLactate() ? "does the same to you!" : "uses her hands to help get you off!"));
	}
	else
	{
		clearMenu();
		addButton(0, "Next", lerrisSuckleMilky69);
	}
}

public function lerrisSuckleGetBlown():void
{
	clearOutput();
	showLerris(true);

	output("You grab your [pc.cockOrStrapon]");
	if (!pc.hasCock()) output(" and flip the device on, flopping the suddenly erect hardlight dong against her wilting boy-clit");
	else output(" and thump the tumescent shaft against her own cum-soaked member");
	output(". <i>“Oooh, I’ll take a piece of that!”</i> Lerris murmurs, wrapping her fingers around your");
	if (!pc.hasCock()) output(" faux");
	output(" schlong, running her slender digits from base to crown in slow, languid strokes. A little of her [lerris.milk] soon finds its way onto your shaft, lubing you up so she can move faster.");

	output("\n\nOr maybe she just wants something tasty to lick off? She slides down your body, sprawling out between your [pc.legs] and lazily dragging her coarse kitty-tongue across your glans, relishing the taste of her own sweetness mixing with your [pc.cumNoun]-laced pre.");
	if (lerris.milkFullness > 150) output(" With some effort,");
	output(" Lerris cups her breasts and hefts them into your lap, squirting a little extra lube from her seemingly endless reserves before wrapping the jiggly jugs themselves around your [pc.cockOrStrapon].");

	output("\n\nFeeling that much soft fullness around your member makes you shudder with pleasure, and again when Lerris’s lips wrap around your crown, suckling from your cum-slit while her hands work her tits along your throbbing length. No surprise, considering her obsessions, that she’s an absolute master of using her tits like this. Lerris’s breasts move at odds with one another, one up and the other down, pressing as tight together as a pussy and wetter than an ausar in heat. Her tongue works your crown between every stroke, circling it with the tip and suckling greedily at the slit.");

	output("\n\nYou murmur that she’s a good girl, reaching down and");
	if (lerris.hasHorns()) output(" grabbing the pretty little bovine horns on her brow");
	else output(" clasping your hands around her head, just below her feline ears");
	output(". With her head firmly in your command, you start to move as well, fucking her cleavage and mouth with short, strong strokes. She gasps when you start thrusting, but quickly settles into letting you take the lead. Her tits rest heavily on your [pc.legOrLegs], leaking every time your [pc.hips] thrust up against them - it isn’t long before that gets Lerris moaning around your [pc.cockOrStrapon], overtly enjoying the rough treatment of her heavy tits.");

	output("\n\nYour cock throbs with mounting need, a tension building in your loins. With a grunt, you tighten your hold on Lerris’s head and surge");
	if (pc.isNaga() || pc.isGoo()) output("upright");
	else output(" to your feet");
	output(". She moans lustily, clutching your [pc.hips] as they start to pound her mouth, using her like a milky onahole until the clutches of passion become too much to bear. Her claw-like nails dig into your ass, pulling you into her hungry mouth to the hilt before");
	if (pc.hasCock()) output(" your [pc.cock] erupts inside her, shooting a fat load of [pc.cum] down her throat");
	else output(" your hardlight’s feedback climaxes in a shockwave through your nerves, eliciting an orgasm that leaves you shuddering and gasping");
	output(". You buck your hips hard against Lerris’s plump lips, riding out your orgasm");
	if (pc.hasCock()) output(" until [pc.cum] bubbles out of her mouth, drooling down her chin");
	output(".");

	output("\n\nWhen your last");
	if (pc.hasCock()) output(" drop of spunk is spent");
	else output(" shudder passes");
	output(", you push Lerris off your cock, letting the kitty bask in the afterglow");
	if (pc.hasCock()) output(" and a few last dribbles that splatter onto her face");
	output(". Her hands go to her [lerris.breasts] immediately after you’ve finished with her, gently rubbing the stiff nipples for a few brief seconds until you see a squirt of white splatter across the floor from the tented lining of her panties, emptying her sack with her extra orgasm.");

	output("\n\nShe sighs contentedly, little cock throbbing until she’s spent. Then, like you, she softens back until it vanishes back into her clothes, completely invisible at a glance. <i>“Fair trade?”</i> she purrs");
	if (pc.hasCock()) output(", licking some of your cum off her chin");
	output(".");

	output("\n\nMore than fair. You grab your gear, leaving Lerris to lick herself clean in peace.");

	processTime(20 + rand(11));
	pc.orgasm();
	lerris.orgasm();

	lerris.milked(50);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lerrisSuckleMilky69():void
{
	clearOutput();
	showLerris();

	output("You gently roll Lerris off of you, setting the eager kitten aside for the moment while you sprawl out on your back half way up, letting your [pc.legs] dangle off the armrest. So situated, you tell Lerris to get on and start feeding you - and");
	if (pc.canLactate()) output(" get a drink for herself while she’s at it");
	else output(" put those hands to work");
	output("!");
	
	output("\n\nShe giggles girlishly as she clambers up on top of you, leaning from over your head so that her [lerris.breasts] hang over your [pc.face], dribbling onto your lips before you catch one and start to suckle. A gasp of pleasure shudders through the kitty-slut, but she dutifully runs her tongue across your own [pc.nipple] in turn, reaching a hand down to your crotch and");
	if (pc.hasVagina()) output(" caressing the lips of your cunt.");
	else if (pc.hasCock()) output(" wrapping her fingers around your [pc.cock].")
	else output(" circling a finger around your [pc.asshole].");
	
	output("\n\nGently but surely, Lerris sucks on your [pc.nipple]");
	if (pc.canLactate()) output(", drawing out a spurt of your own lactation");
	output(". The movements and minute caresses of her lips are so sure and confident that you’re sure that she must practice on herself, exploring every way a mouth can make a nipple sing with delight. Her hands, though... they’re the real pleasure, working your");
	if (!pc.hasCock()) output(" [pc.vagOrAss]");
	else output(" [pc.cock]");
	output(" with vigorous determination while you’re busy sucking on each other. Your back arches, eliciting a moan around Lerris’s breast as she devotes herself to your body.");
	
	if (pc.canLactate())
	{
		output("\n\n<i>“You taste delicious,”</i> your partner murmurs, licking at the beading droplets of [pc.milk] flowing from your chest. <i>“It’s so sweet!”</i>");
	
		output("\n\nWith one long, deep suck, you remind Lerris that you’re quite fond of her flavor as well. ");
	}
	else output("\n\n");
	output("The cat-girl’s [lerris.tails] swish playfully above you, drawing your attention up her supple frame and to the cum-stained lace of her panties. Lerris’s cock is already twitching again, peeking its feline crown out and dribbling watery white. You divert a hand, brushing her nubby glans until she’s nice and hard... and her body trembles with pleasure.");
	
	output("\n\nYour attentions only incentivize the kitten to work harder,");
	if (pc.hasCock()) output(" jerking you off");
	else if (pc.hasVagina()) output(" fingering your twat");
	else output(" teasing your ass");
	output(". Her fingers work quickly, finding your most sensitive spots and lavishing them with gentle caresses and firm thrusts, working her wrist back and forth until you’re gasping with desire right alongside her, ready to cum.");
	
	output("\n\n<i>“W-wait for me,”</i> Lerris breathes, bucking her hips against your hand. <i>“Wait for me!”</i>");
	
	output("\n\nOh, damn. You grit your teeth between suckles, clenching down");
	if (!pc.hasCock()) output(" around Lerris’s fingers");
	else output(" in her grasp");
	output(" to try and hold yourself back. Even as she’s begging you to keep yourself for her, Lerris’s fingers never let up. The tension in your loins burns, and your vision becomes a blurry haze, consumed by visions of bouncy kitty-titty and wasted [lerris.milk]. You moan with lust, gasping for breath as her [lerris.milk] floods your mouth in a sweet, sweet downpour.");
	
	output("\n\nThen you feel a wet heat shooting across your palm, and your resolve breaks. You throw your head back and roar with the pent-up ecstasy, cumming");
	if (!pc.hasCock()) output(" around");
	else output(" all over");
	output(" Lerris’s hard-working hand. She gasps, more in glee at your delayed orgasm than for her own pleasure, even as she’s thrusting her spasming boy-clit against your hand. Her own seed puddles in your palm, drooling onto the couch in thick, [lerris.cumColor] strands.");
	
	output("\n\n<i>“Messy... very messy!”</i> Lerris purrs, curling up on herself and lapping at the pool in your hand. In a few moments she has you spotless, though there’s little enough she can do to mask the scent of sex heavy on your [pc.skinFurScales]. You pull her down for a kiss once she’s finished, tasting");
	if (pc.hasCock()) output(" your seed and hers");
	else output(" her cum");
	output(" still fresh on her lips.");
	
	output("\n\nShe giggles, giving you a tight hug. <i>“Thanks for waiting for me a second time, lover. Now go get dressed - I gotta go find a galotian to clean this place up!”</i>");

	processTime(20 + rand(11));
	pc.orgasm();
	lerris.orgasm();
	lerris.milked(50);
	pc.milked(50);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lerrisTalkMenu(fromFunc:Function = null):void
{
	clearMenu();

	if (flags["LERRIS_TALKED_ABOUT_MODS"] == undefined) addButton(0, "Mods", lerrisTalkMods, undefined, "Mods", "Lerris mentioned she has some first-hand experience with TamaniCorp’s products. Ask her what she’s taken.");
	else if (flags["FUCKED_LERRIS"] == undefined)
	{
		if (fromFunc != lerrisTalkLactaid) addButton(0, "Lactaid", lerrisTalkLactaid, undefined, "Lactaid", "What about Lactaid attracted Lerris to take so much of it?");
		else addDisabledButton(0, "Lactaid");
	}
	else
	{
		if (fromFunc != lerrisTalkHerBody) addButton(0, "Her Body", lerrisTalkHerBody, undefined, "Her Body", "Ask the cute cat-babe about her body. You didn’t expect her -- him? -- to be equipped quite like that!");
		else addDisabledButton(0, "Her Body");
	}

	if (flags["SUCKLED_LERRIS"] != undefined)
	{
		if (flags["FUCKED_LERRIS"] == undefined)
		{
			if (fromFunc != lerrisTalkGirlfriend) addButton(1, "Her Girlfriend", lerrisTalkGirlfriend, undefined, "Her Girlfriend", "Ask Lerris about her girlfriend. She sounds like a real hard-ass of a mistress.");
			else addDisabledButton(1, "Her Girlfriend");
		}
		/*
		else
		{
			addDisabledButton(1, "Jessa"); // 9999 scenes not finished/present :V
		}
		*/
	}
	
	addButton(14, "Back", lerrisMenu);
}

public function lerrisTalkJessa():void
{
	clearOutput();
	showLerris();
}

public function lerrisTalkGirlfriend():void
{
	clearOutput();
	showLerris();

	output("\<i>“Mind telling me about your girlfriend?”</i> you ask.");
	
	output("\n\n<i>“Oh, sure,”</i> Lerris shrugs. <i>“I did mention her before, didn’t I? Particularly in relation to certain shared past-times of yours,”</i> she adds with a wiggle of her [lerris.chest], clearly indicating herself.");
	
	output("\n\nYou don’t manage to get her to continue until you take advantage of the jiggly cat-girl, reaching down to grab one of her breasts and give it a firm squeeze. She purrs happily, preening in your grasp. <i>“Her name’s Jessa. She’s an ‘asset negotiator’ for the Galactic Exchange, which I’m pretty sure is a nice way to say she runs hostile takeovers for corporations. Being a total hardass kinda comes with the territory there, though she totally works the power suit look. Total. Hottie.”</i>");
	
	output("\n\nLerris giggles, fingering the ring on her lip. <i>“Let’s see... we met at some big, fancy corporate party about, oh, four years ago? They were celebrating some big takeover or something, I guess. I was just waitressing for the gig, part time work and all, but Jessa was in my section and got freakin’ </i>hammered<i> that night. She’s a really funny, flirty drunk, and as the night went on we got to talking. Wasn’t hard for her to walk away with my number.”</i>");
	
	output("\n\nThe cat-girl sighs dreamily, and you suddenly realize your hand is still firmly planted on her chest, seemingly lost in the primitive pleasure of feeling up such a full breast. Flushing a little, you switch from one to the other.");
	if (pc.exhibitionism() <= 33) output(" Good thing you’re the only customer by the register now...");
	
	output("\n\n<i>“We’ve been dating ever since,”</i> Lerris continues once you’ve starting groping again, keen to lead you on with pleasuring her. <i>“Like I said earlier, though, she likes to share me around, soooo no worries for you, if I’m still your kinda girl.”</i>");
	
	output("\n\nJessa likes to share her girlfriend around, huh? Interesting.");
	
	output("\n\n<i>“I did say you’d get along,”</i> Lerris teases. <i>“I mean, I don’t want to come off as a </i>total<i> slut - it’s not like we do it all the time! - but she definitely likes hooking me up with her friends and co-workers. Jessa’s a total voyeur!”</i>");
	
	output("\n\nShe laughs, but your mind is filled with thoughts of the cute little kitty-trap getting pounded by some corporate jackoff while a big, strong kaithrit babe watches from the sidelines. Hot. Especially when your fantasy drifts over to you taking the guy’s place...");
	
	output("\n\nLerris purrs, watching your gaze go all lustful. <i>“Yeah, I should </i>totally<i> introduce you two.”</i>");
	
	output("\n\n<b>Maybe if you and Lerris go all the way, she might just do that...</b>");

	lerrisTalkMenu(lerrisTalkGirlfriend);
}

public function lerrisTalkHerBody():void
{
	clearOutput();
	showLerris();

	output("<i>“Sooo,”</i> you start off, eyes wandering up Lerris’s supple form. Packed into that skin-tight suit, even, she’s completely passable for female. You’d never know what was between her legs without peeling her out of that sexy outfit and seeing for yourself.");
	
	output("\n\nLerris huffs a little sigh as you broach the topic, but seems to have an answer ready before you finish asking. <i>“So I’m a male kaithrit. But I’m a girl, too! When a kaithrit girl gets pregnant, she starts putting off these pheromones, and it makes male bodies kind of go... well, girly. We soften up, grow tits, start lactating. Boys are supposed to be the tender child-rearing sex where we’re from, but out here on the frontier?”</i>");
	
	output("\n\nShe shrugs and reaches over to the lactaid display, casually fingering the medipens. <i>“After Jessa got pregnant, and I started changing... it turned out I really <b>liked</b> the changes. I liked so many men suddenly flirting with me, even playing grab-ass. I liked the way my boobs felt, all full of milk, and even more when my girlfriend tied me up and milked me like a cow. Then... then I found out I liked wearing pretty dresses and high heels. And when Jessa found that out, well, it wasn’t long before she made sure I found out that I liked big, strong men pinning me down in our bed and fucking me.”</i>");
	
	output("\n\n<i>“After that, well, I’m just glad my girl was bisexual to start with. She seemed pretty happy when I took a few Estroblooms and lactaid to make sure the changes were permanent. Shame I couldn’t just convince her being pregnant year-round would have been a way more fun way!”</i> Lerris laughs, stretching out across the counter and wiggling her hips enticingly for you in the process. <i>“So... that’s me! I really didn’t mean to surprise you... uh, more than once now... but back on Rosha I’m not exactly unique, y’know?”</i>");
	
	output("\n\nYou assure her it’s fine, though if she’s got any more surprises in store, this would be the time to say so.");
	
	output("\n\nLerris just giggles and leans across to plant a kiss on your cheek. <i>“You’re a saint. A");
	if (pc.tallness > lerris.tallness + 12) output(" big");
	output(" sexy saint,”</i> she murmurs, moving so that her [lerris.breasts] are resting heavily on the counter. <i>“Just treat me like any other girl, and I’ll keep treating you like my favorite fuckstick. And on that note, I think it’s time for my break. In the back room.”</i>");
	
	output("\n\nShe wiggles her [lerris.tails] meaningfully towards both you and the door at once, intentions clear.");

	lerrisTalkMenu(lerrisTalkHerBody);
}

public function lerrisTalkMods():void
{
	clearOutput();
	showLerris();

	flags["LERRIS_TALKED_ABOUT_MODS"] = 1;

	output("<i>“You said you’ve got some experience with the products?”</i> you ask, glancing around at everything from biotic sex-toys to ultra-strong fertility pills. Wonder what a cute cat like her has been getting into.");
	
	output("\n\n<i>“More than some, sweetie,”</i> she giggles playfully, flipping a lock of green hair behind a purple-hued cat-ear. As she does so, you can’t help but notice the way her bouncy C-cups push against the front of her jumpsuit. They’re as soft and shapely as a pair of tits can be, perfectly sculpted beneath the fabric. They look like they belong on a statue more than a girl working at a shop. Lerris sees you looking and smiles, shifting her shoulders a little. <i>“Yeah, I used to be kind of a mod fiend. I’ve had one of almost everything TamaniCorp sells here. At <b>least</b>!”</i>");
	
	output("\n\nLerris laughs gaily, her violet tails swishing behind her. Taking that as an invitation, you ask if she’s got any particular favorites. Maybe something she’s taken more than once...");
	
	output("\n\n<i>“Oh, there might be a couple,”</i> Lerris teases. While she speaks, she straightens up and runs one of her clawed hands along the front of her jumpsuit, cupping one of her perky tits. <i>“Trust me, TamaniCorp made my life a whole lot jigglier and, hehe, milkier after I started coming here.”</i>");
	
	output("\n\nYou follow her gaze toward the bright, white-lighted rack of products on display labeled <i>“LACTAID.”</i> You glance at the kaithrit’s bust, wondering just how - and what - those perky mounds are full of.");
	
	output("\n\n<i>“I’ve had so many of those...”</i> Lerris admits with a smile. <i>“Nothing better than feeling your chest swelling up with milk, so ready and desperate to come spraying out. But if that’s not your thing, I can also <b>highly</b> recommend Fertite, or getting some playtime with one of those hot little BionaHoles. Personally, I’d prefer a BionaDick to go with it, but hey. Can’t argue with a juicy pussy to play with, right?”</i>");
	
	output("\n\nShe wiggles her hips and squeezes her milky tits together, making you wonder if she meant herself...");

	lerrisTalkMenu();
}

public function lerrisTalkLactaid():void
{
	clearOutput();
	showLerris();

	if(flags["LERRIS_TALKED_LACTAID"] == undefined || flags["LERRIS_TALKED_LACTAID"] < 1) flags["LERRIS_TALKED_LACTAID"] = 1;

	output("<i>“So, tell me more about Lactaid,”</i> you prompt the milky kitty.");
	
	output("\n\n<i>“Ooh, my favorite subject!”</i> Lerris teases, flicking her twin tails behind her. <i>“Well, favorite work subject, anyway. I mentioned I was all about Lactaid already, right? Right. My girlfriend and I had a baby a couple of years ago, and we both started lactating on our own, like kaithrit do when we have kids. But she was so busy with her job, well, I ended up doing most of the leg work in the, uh, baby feeding department. Lactaid is hands down the best thing ever if you want to have kids the old fashioned way, trust me. It’s not like normal, where you just sort of dribble a little unless you use a milker - no way! Lactaid makes it like those cow-girl pornos off of New Texas, just gushing milk like you’ve got a pair of tanks in your chest!”</i>");
	
	output("\n\nYou");
	if (pc.libido() <= 33) output(" can’t help but blush as Lerris dumps that kind of detail on you.");
	else if (pc.isBro() || (pc.libido() >= 66 && pc.hasCock())) output(" feel a sudden rush in your crotch as Lerris dumps all that detail on you. Hot.");
	else output(" blink at the sudden data-dump, shifting around as an unbidden heat spreads out from your loins.");
	output(" Your eyes are drawn right to the cat-girl’s chest, and your thoughts flit inexorably to the milky bounty she’s hiding under her sexy jumpsuit.");
	
	output("\n\nLerris sticks her tongue out. <i>“Oh, don’t be that way. Half the stuff we sell here is lewd as heck, you know. Heh, now I want to see your face when you start asking about those toys over there,”</i> she teases, nodding her head towards the rack of company-brand sex toys.");
	
	output("\n\n<i>“Sorry, sorry. Anyway, Lactaid’s one of our best-selling products. And we’ve got some variations, too, that’ll help boost your capacity, boost productivity, and even change your flavors! That’s not really much for child-rearing, but if you’ve got a significant other that’s into lactation play, mmm...”</i> Lerris trails off, chewing her lip and staring through you into the middle distance. <i>“Nothing quite like seeing your girlfriend’s face when she comes in for a suckle, and suddenly she’s tasting sweet strawberries!”</i>");
	
	output("\n\nThe flush in your cheeks isn’t going away in a hurry while Lerris describes in detail her lactic lusts, occasionally giving longing glances towards the Lactaid display. She notices your continued attentions and her big feline eyes finally settle on you, her pink-painted lips curling into a smile.");
	
	output("\n\n<i>“If you’d like to know more, I wouldn’t mind giving you a, um...”</i> her smile gets a little wider, you can’t help but notice her nipples forming prominent peaks under her jumpsuit. <i>“A product demonstration, if you want.”</i>");
	
	output("\n\nThis could get... juicy.");

	clearMenu();
	addButton(0, "Demo", lerrisDemonstration, undefined, "Demonstration", "Take Lerris up on her offer and get a private showing of what Lactaid can do...");
	addButton(1, "No Thanks", lerrisNoDemoTY);
}

public function lerrisNoDemoTY():void
{
	clearOutput();
	showLerris();

	output("<i>“Maybe later,”</i> you say, forcing yourself to look away from the cat-girl’s eagerly displayed chest.");
	
	output("\n\nLerris’s tails coil down under her legs. <i>“Oh, uh, yeah. Sure! Anyway, uh, anything else I can help you with?”</i>");

	lerrisTalkMenu(lerrisTalkLactaid);
}

public function lerrisDemonstration():void
{
	clearOutput();
	showLerris(true);

	if(flags["LERRIS_TALKED_LACTAID"] == undefined || flags["LERRIS_TALKED_LACTAID"] < 2) flags["LERRIS_TALKED_LACTAID"] = 2;

	output("<i>“I’d love that,”</i> you say, eyeing the cat-babe’s sultry, milky form. You can’t wait to see what this demonstration entails.");
	
	output("\n\nShe grins and hops up, spinning on a heel towards a door behind the counter labeled <i>“STAFF ONLY.”</i> She crooks her tails at you in a kaithrit come-hither gesture. As she goes, you’re treated to an alluring show: turns out the femme version of TamaniCorp’s jumpsuit comes pre-packaged with high heels, making sure Lerris’s ample behind is sashaying back and forth all the way to the door. As she goes, she grabs a clear white medipen of Lactaid off the shelf. You follow her with a spring in your step, right through the door.");
	
	output("\n\nThe back room is about what you’d expect for a space station’s shop: compact and filled uncomfortably full of inventory boxes, with a couple of small cargo bots standing idly by to fill orders. A small break room, complete with a comfy-looking couch and a JoyCo soda machine, is tucked away in the corner. Lerris leads you over, telling you to");
	if (!pc.isTaur()) output(" have a seat on the couch");
	else output(" park yourself next to the couch for her");
	output(". Her request is music to your ears, and you quickly sprawl out, reclining against the sofa and watching her movements with interest.");
	
	output("\n\nLerris turns around, tails swishing quickly over her jiggly behind. Their owner gives you a sultry wink over her shoulder as you start to hear the tell-tale sound of a zipper sliding down. <i>“This will only take a second,”</i> she purrs, voice full of sultry promises.");

	output("\n\nThe");
	if (pc.hasCock()) output(" boner");
	else output(" fluster");
	output(" you’ve been dealing with since the cat-girl first made her offer only gets worse while you watch the shoulders of her pink-and-purple jumpsuit slip down, baring perfect, smooth shoulders and back, all the way down until her tails pops through the hole in the back. Her plump behind bounces out, hugged tightly by a pair of lacy off-white panties that practically beg you to grab hold of what the cute cat-girl’s packing.");
	
	output("\n\nWhich, it turns out, is a little more than you were expecting. Lerris drops her suit and kicks it away, turning around to face you in nothing but her underclothes. While her bluish-white bra conforms perfectly to her opulent chest, your focus is snagged instead by her panties, which are bulging forward ever so slightly around what can only be a distinctly masculine endowment. Even at full mast she couldn’t be very big - maybe four inches at most - and right now it’s sitting flaccidly above a compact pouch that peeks out half-and-half on either side of her panties’ crotch. Honestly, if she’d been wearing anything baggier, you’d probably never have even noticed her package.");
	
	output("\n\nLerris meets your gaze with a blush, crossing her legs awkwardly. <i>“Hey, uh, the show’s going to be up here, y’know,”</i> she says half-heartedly, putting both hands on her breasts and jiggling them through her bra. <i>“So, want me to take a hit of Lactaid for you? Show you what all the fuss is about?”</i>");

	output("\n\nYou recover your wits enough to nod, putting a smile on the green-haired trap’s face once more. <i>“Great. This one’s on the house... I’ll be honest, I’ve been kind of craving it,”</i> she says, peeling the medipen out of its packaging and running a fingertip around the tip of the hair-thin needle.");
	
	output("\n\n<i>“Don’t worry, it’s totally painless. The big heads mix in a little aphrodisiac with the painkiller, too. Just to make things interesting,”</i> Lerris adds, pressing the head of the medipen into the top of one of her high-sitting milk cans. You catch a faint hiss, almost beyond hearing, when Lerris pushes down the plunger and injects herself with the pen’s contents. She gasps with pleasure, letting the pen slip from her hand and clatter away as the nanomachine-laced drug takes hold.");

	output("\n\nYou can see the effects almost instantly: her palmable C-cups swell beneath their semi-transparent bra");
	if (flags["MET_ELLIE"] != undefined) output(" which, you realize, looks just like Ellie’s. Given Lerris’s fixation on Lactaid, you guess you can understand why she’d be wearing a maternity bra!");
	else output(". Now that you look at it, her top piece seems like something a milky porn star might wear, the kind special made to trap excess milk just in case.");
	output(" A good thing she’s wearing it, too - you barely have time to blink before her nipples stiffen into little pink mountains, straining against the translucent material... and then you see white cream begin bubbling up from their peaks. Lerris lets loose a little moan, bouncing on her high heels as what you can only assume is mindless pleasure rocks her body.");

	output("\n\n<i>“Ohh that’s good!”</i> she purrs, tails curling around her legs. <i>“So... so full! Unnf!”</i>");

	output("\n\nYou barely have time to react as the kaithrit’s legs give out from under her, and she tumbles");
	if (pc.isTaur()) output(" into your arms");
	else output(" onto your lap");
	output(". You just catch her, suddenly finding yourself with an armful of horny, milky cat-girl threatening to overflow even her maternity-style bra with sudden lactation. Her panties are just about ready to pop, too, with a four-inch pole of meat turning her crotch into a lacey pyramid.");
	
	output("\n\n<i>“Whoops,”</i> she manages to say between breathy gasps of pleasure. <i>“Thanks for the catch I-”</i>");
	
	output("\n\nShe manages a full-body shiver, and her bra strains against her growing titflesh and their overflowing lactic bounty. Her back arches, making her squirm until she manages to reach back and undo the clasp of her bra, letting it tumble to the wayside in a sodden heap. It wouldn’t do her much good, now, anyway: she’s got to be up to double-D cups now!");
	
	output("\n\nFreed of her painfully-strained bra, Lerris sighs and slips an arm around you, snuggling into your accidental embrace. The bulb-ringed crown of her tiny feline prick peeks up from the hem of her panties, making her arousal plain to see");
	if (pc.hasCock()) output(" - almost as plain as yours, with your [pc.cock] pressing urgently against her bare hip");
	output(".");
	
	output("\n\n<i>“So...”</i> she breathes huskily, groping at one of her breasts to keep the thick, rich milk flowing. <i>“Was that enough of a demonstration, or... do you need to see what it tastes like, too? Fresh from the tap and all. I’m going to be leaking for hours if you don’t,”</i> she adds, almost pleading.");

	clearMenu();
	addButton(0, "Drink", lerrisDrinkDatTittymilks, undefined, "Drink", "Help Lerris relieve some of her lactic excess. Considering how horny she obviously is, things might get out of hand...");
	addButton(1, "No Thanks", lerrisNoTyNoDrinks, undefined, "No Thanks", "You didn’t exactly sign up to nurse right from a kaithrit dick-girl when this started. How about no?");
}

public function lerrisNoTyNoDrinks():void
{
	clearOutput();
	showLerris(true);

	output("You politely excuse yourself, saying that you’ve gotten more than enough of a show already.");
	
	output("\n\n<i>“Y-you sure?”</i> the kitty-trap whines, cupping one of her large breasts up to her mouth and lapping up the milky excess. <i>“Okay. Show yourself back to the shop, would ya? I gotta... gotta find that wall banger I lost back here...”</i>");
	
	output("\n\nYou heft Lerris out of your lap and skedaddle while you can, hearing moans and wet sounds behind you until you’re back out of the shop.");

	pc.changeLust(30);

	currentLocation = "9007";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function lerrisDrinkDatTittymilks():void
{
	clearOutput();
	showLerris(true);
	
	if (flags["SUCKLED_LERRIS"] == undefined) flags["SUCKLED_LERRIS"] = 0;
	flags["SUCKLED_LERRIS"]++;

	output("You answer Lerris’s pleading request by wrapping your hands around her hips, propping her up in your lap so that she’s straddling you, breasts in your face and little boy-clit rubbing against your [pc.belly], squeezed between your two bodies.");
	if (pc.hasCock())
	{
		output(" Your own cock, meanwhile, is quickly becoming painfully erect");
		if (!pc.isCrotchExposed()) output(", so much so that before you do anything, you have to free it from its confines. Lerris doesn’t seem to mind at all");
		output(".")
	}
	output(" Once she’s situated just as you want her, you trace your hands up the kitten’s slender frame, working your way up until your hands find milk starting to trickle down from her tits and onto her taut belly below. Lerris, for her part, rolls her head back and moans, wrapping her hands around your neck to steady herself.");
	
	output("\n\n<i>“Drink up,”</i> she purrs, wiggling her shoulders to make her leaking boobs bounce in your face, brushing a stiff pink teat across your [pc.lips]. You catch it, circling your tongue around it and sucking ever so gently. It takes absolutely no effort at all to get her milk flowing freely into your mouth, drawing in cheek-swelling gulps every two or three seconds. Damn, she’s full!");
	
	output("\n\n<i>“O-oh yeah,”</i> the kitty purrs, biting a lip and rocking herself forward in your lap. Your face is completely surrounded by soft, milky kitty-titty, enveloped in boobflesh until you can’t see anything but scant glimpses of Lerris’s blissful face. <i>“Stars, that feels good. So good! Oh, [pc.name]!”</i>");
	
	output("\n\nJust from the pleasure of having her breasts swollen and drained of milk seems enough to drive this mammary-obsessed beauty over the edge. She gives you just enough warning for you to shift her in your lap, angling her hips away from you before a spurt of white cream jettisons from her panties, splattering luridly across the deck. The rest of her orgasm is wasted into her panties, bubbling up from her tiny, throbbing prick until a transparent stain has pretty much soaked the front of her underwear.");
	
	output("\n\nLerris lets out a cute little moan, her breath raggedly escaping her lips as she bucks her hips atop you. For such a small little package, she certainly can make a mess, but the real treat comes from up top. Her breasts ejaculate milk to the beat of her cumming cock, squirting way more sweet kitty cream into your mouth than before. You cough up whiteness, desperately switching breasts to keep from being completely flooded out.");

	if (pc.hasCock())
	{
		var cockIdx:int = pc.biggestCockIndex();

		output("\n\nEven as her own prick is still drooling watery aftershots onto her silky underthings, Lerris reaches down and wraps her fingers around your own throbbing erection, using a little of the excess milk as lube to start stroking you off. Slowly, she manages to recover enough to ask, <i>“I-is this okay? You don’t mind, do you?”</i>");
		
		output("\n\nYou stifle a grunt of your own, drowning out your pleasured noises in pliant, milky boob. Seeing Lerris cream herself from your suckling has only spurred on the boner you’ve been sporting since your got back here, and feeling her dainty little fingers lovingly caress it feels better than anything. A curt nod reassures the kaithrit that she’s more than welcome to jack you off, which elicits a happy squeal from her in return.");
		
		output("\n\n<i>“Just keep drinking,”</i> she says, more begging than commanding. <i>“Please!”</i>");
		
		output("\n\nShe doesn’t have to ask. You drink deep from her seemingly endless reserves, using one hand to milk the breast not plugged into your mouth, and the other to grope and squeeze at the kitten’s plump butt. She wiggles it excitedly in your grasp, rubbing back against your groping hand and grinding her soiled crotch against your pride’s veiny underside. Her wasted seed adds just that much more lubrication to her handjob, returning the pleasure you’re obviously giving her.");
		
		output("\n\nIt doesn’t take long before your own chest is heaving, breathing hard as you try and fight back the swelling pleasure in your [pc.cock "+cockIdx+"]. You just can’t take it any more - and if the way Lerris jacks you off more feverishly than before is any indication, she knows it. <i>“Don’t stop,”</i> she whispers.");
		if (pc.biggestCockLength() >= 12) output(" Punctuating her point, Lerris shifts your meat upwards, lodging the shaft between her milk-slathered tits. Now every slight motion her jiggling body makes just adds to your pleasure, a ceaseless titfucking that promises to drive you right over the edge.");
		
		output("\n\nSubject to Lerris’s constant tender touches, you don’t have a chance to hang out. You roll your head back, popping off her nipple in a sudden geyser of cream and cry out. Your voice echoes off the bulkheads, filling your ears with sensual sounds as your [pc.cock "+cockIdx+"] throbs with finality before erupting in Lerris’s grasp.");
		
		output("\n\n<i>“O-oh!”</i> she cries out as the first juicy glob splatters her cheeks, then her breasts, and then starts leaking down all over her belly. You keep cumming, pumping out every drop all over the milky kitty. She never stops moving, even when your lips stop suckling from her, clearly intent on bringing you to the fullest orgasm she can.");
		
		output("\n\nWhen she’s done, you’ve flopped back against the sofa, breathing hard. Cum trickles down from the cat-girl’s entire upper body, soaking her from green hair to spunk-soaked panties. She’s panting with effort herself, eventually sighing and resting her head against your [pc.chest].");
		
		output("\n\n<i>“Wow,”</i> she breathes, finally letting your softening pole of meat go. It flops heavily against her belly, rubbing in a mix of your spunk and hers. <i>“I didn’t... I didn’t mean for it to go that far. But...”</i>");
		
		output("\n\nSuddenly, you remember what you talked about before. <i>“Wait, don’t you have a girlfriend?”</i> you ask. Lerris seemed awfully eager to show off her goods to you, but didn’t she also say she started lactating in the first place because she’d had a kid?");
		
		output("\n\n<i>“Oh. Don’t... don’t worry about it,”</i> she chuckles, licking off an errant droplet of spooge from your shoulder. Her tongue feels like a thousand tiny bristles gently caressing your [pc.skinFurScales]. <i>“We </i>like<i> to share.");
		if (pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Between you and me, it’s usually her bringing over a big, ripped guy from work to take care of me while she watches.");
		output("”</i>");
		
		output("\n\nLerris giggles, reaching down to pat your [pc.cock "+cockIdx+"]. <i>“If you don’t mind big, tough women who know what they want and bust balls to get it... maybe I’ll introduce you sometime. I bet she’d love to see you putting this [pc.cock "+cockIdx+"] to better use. Preferably while she’s putting that hardlight strapon of hers to good use...”</i>");
		
		output("\n\nNow <i>that</i> would be something, all right.");
		
		output("\n\n<i>“Anyway,”</i> Lerris purrs, reaching up and trailing a few kisses along your collar. <i>“If you don’t have a problem with me and my, um... milk obsession... I’d love to do this again. It was a really pleasant surprise.”</i>");
		
		output("\n\n<i>“Surprise?”</i> you chuckle, idly fondling one of her breasts. Milk still trickles out at your touch, but not nearly as much as before. Did she really not plan this from the moment she offered to show you?");
		
		output("\n\nThe trappy kitty gives you a playful wink. <i>“Well, maybe. But that was just fantasy!”</i> she teases. <i>“And it wasn’t anywhere near as fun as the real thing.”</i>");
		
		output("\n\nShe sighs and rolls off your lap, glancing down at her nearly-bare body basted in cum and milk. <i>“Oof, I really wish we had a shower back here. I’m going to be wallowing in my suit after all this!”</i>");
		
		output("\n\nWait, she’s actually going to put that jumpsuit back on? Still covered in splooge? Dirty girl!");
		
		output("\n\nLerris just giggles lustily, giving you a gentle push from the couch. <i>“Go on back out so I can lick myself clean in peace. Kaithrit flexibility and all that!”</i>");
		
		output("\n\nSomething tells you that’s code for <i>“so I don’t get hard and start this all over again,”</i> but you relent and show yourself out, leaving Lerris to clean herself up as best she can.");
	}
	else
	{
		var vagIdx:int = -1;
		if(pc.hasVagina()) vagIdx = rand(pc.vaginas.length);
		
		output("\n\n<i>“S-sorry,”</i> Lerris whines as one of your hands makes disappointed rubs and caresses around her hips. <i>“Just keep drinking and I’ll be hard again in no time. If you want that, anyway...”</i>");
		
		output("\n\nOh, you do. Your heart is pounding in your chest, burning with desire. Watching the kitty cream herself just from your suckling has practically driven you wild with lust, and you’re soon roaming your hands all over her body, groping at breasts and buttocks and every other tender spot you can imagine while your lips keep drinking.");
		
		output("\n\n<i>“That’s it,”</i> Lerris moans, bucking her hips in your lap. <i>“Oh, stars, this feels so good. Wh-why am I such a milk-slut, [pc.name]? Why does it feel so <b>good</b>!?”</i>");
		
		output("\n\nYou can’t answer that question for her, but if the way she’s acting tells you anything, it’s that even in the twilight of her first climax, she’s still being overwhelmed with pleasure. You reach down and peel down the sticky front of her panties, getting your hand around the soft bitch-clit riding high on her crotch. She shivers when you touch it, but smeared with milk and cum as it is, it’s so easy to start stroking her that she’s hard again in seconds.");
		
		output("\n\nNow you’re getting somewhere. You grab Lerris by the hips and roll her over, planting her ass on the couch and moving overtop of her. She squirms, but quickly wraps her hands on");
		if (pc.biggestTitSize() >= 1) output(" your breasts");
		else output(" your hips");
		output(", steadying you as you straddle her. Your");
		if (!pc.isNude()) output(" clothes");
		else output(" equipment");
		output(" is tossed aside in the blink of an eye, leaving your [pc.vagOrAss " + vagIdx + "] rubbing into Lerris’s cum-stained lap. Your mouth returns to one of her breasts, pinning her against the cushion and sucking deep. The flow of sweet cream returns as if it had never stopped, filling your mouth as you line yourself up with Lerris’s minute erection. She’s so small that you’ll barely be getting anything inside, but lucky for you, her crown is ringed with feline nubs, perfect for rubbing around inside");
		if (pc.hasVagina()) output(" right at G-spot depth");
		output(".");
		
		output("\n\n<i>“C-come on already,”</i> Lerris mewls, biting her lip and groping helplessly at you. <i>“D-don’t just sit there and tease me! I might cum again if you keep it up!”</i>");
		
		output("\n\nDamn she’s sensitive! You shrug and glide down on her little shaft, eliciting a moan from both of you as you easily take Lerris’s cum-lubed shaft to the hilt.");
		if (pc.hasVagina()) pc.cuntChange(vagIdx, lerris.cockVolume(0));
		else pc.buttChange(lerris.cockVolume(0));
		output(" She squeals underneath you, legs squirming as you overwhelm her in pleasure. <i>“G-gotta... gotta...”</i>");
		
		output("\n\nYou shush her between moving from one breast to the other, knowing the poor thing’s so over-sensitive now that any little touch would set her off, to say nothing of your [pc.vagOrAss " + vagIdx + "] squeezing down on her throbbing clitty. So you just keep suckling, grinding your hips as you feel a rush of liquid heat spraying inside you, smearing across your inner walls and getting ground into your flesh by Lerris’s nubby crown. The cat-girl gasps and bucks her hips against your [pc.butt], emptying that little pouch of hers into you with every ounce of vigor she’s got left.");
		
		output("\n\nPretty soon, though, Lerris has gone boneless in your grasp, moaning softly and fluttering her eyes as you suck and fuck her. But she stays hard somehow, as much as she can, and you’re able to keep pounding your hips against her lap as you drain those big, bouncy tits of hers dry. By the time the constant flow of milk into your mouth finally starts to die down, she must have cum three or four times, completely soaking your [pc.vagOrAss " + vagIdx + "] and leaving both your crotches a shameful mess.");
		
		output("\n\nBreathing hard from the exertion, you finally pull yourself up off of Lerris’s chest and release your");
		if (pc.hasVagina()) output(" twat");
		else output(" ass");
		output("’s death-grip of her poor cock, letting the abused little member slip free in a deluge of seed. How’d she even have that much in that handful of a sack?");
		
		output("\n\n<i>“Wow,”</i> she breathes, gingerly caressing her spent member. Her fingers come away slick with watery cum, which she licks clean without hesitation. You roll off of her, letting the kitty rest her head on your shoulder. <i>“I didn’t... I didn’t mean for it to go that far. But...”</i>");
		
		output("\n\nSuddenly, you remember what you talked about before. <i>“Wait, don’t you have a girlfriend?”</i> you ask. Lerris seemed awfully eager to show off her goods to you, but didn’t she also say she started lactating in the first place because she’d had a kid?");
		
		output("\n\n<i>“Oh. Don’t... don’t worry about it,”</i> she chuckles, licking off an errant droplet of spooge from her slender digits. <i>“We </i>like<i> to share.");
		if (pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Between you and me, it’s usually her bringing over a big, ripped guy from work to take care of me while she watches.");
		output("”</i>");
		
		output("\n\nLerris giggles, reaching down to run a hand along your thigh. <i>“If you don’t mind big, tough women who know what they want and bust balls to get it... maybe I’ll introduce you sometime. She’s kind of a strapon queen, but I’d love to get sandwiched between you two beauties. Especially if you don’t mind a little bolted-on cock...”</i>");
		
		output("\n\nNow <i>that</i> would be something, all right.");
		
		output("\n\n<i>“Anyway,”</i> Lerris purrs, reaching up and trailing a few kisses along your collar. <i>“If you don’t have a problem with me and my, um... milk obsession... I’d love to do this again. It was a really pleasant surprise.”</i>");
		
		output("\n\n<i>“Surprise?”</i> you chuckle, idly fondling one of her breasts. Milk still trickles out at your touch, but not nearly as much as before. Did she really not plan this from the moment she offered to show you?");
		
		output("\n\nThe trappy kitty gives you a playful wink. <i>“Well, maybe. But that was just fantasy!”</i> she teases. <i>“And it wasn’t anywhere near as fun as the real thing.”</i>");
		
		output("\n\nShe sighs and glances down at her nearly-bare body basted in cum and milk. <i>“Oof, I really wish we had a shower back here. I’m going to be wallowing in my suit after all this!”</i>");
		
		output("\n\nWait, she’s actually going to put that jumpsuit back on? Still covered in splooge? Dirty girl!");
		
		output("\n\nLerris just giggles lustily, giving you a gentle push from the couch. <i>“Go on back out so I can lick myself clean in peace. Kaithrit flexibility and all that!”</i>");
		
		output("\n\nSomething tells you that’s code for <i>“so I don’t get hard and start this all over again,”</i> but you relent and show yourself out, leaving Lerris to clean herself up as best she can.");
	}
	
	processTime(20 + rand(11));
	// drinkin milks???
	pc.milkInMouth(lerris);
	pc.milkInMouth(lerris);
	pc.orgasm();
	lerris.orgasm();
	lerris.milked(50);

	currentLocation = "9007";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
