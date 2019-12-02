//By Slavin

//Bakery/Confectionary run by a manic futa bunnygirl (formerly ausar). Breed-hungry. Likes to add her own special "icing" for willing customers. White ears/floof/puffball tail. Ice blue hair, worn long and messy. Husky build, big boobs, average ausar donger.
//Outfit: Black corset, collar and tie, thigh-high stockings with bows, garters, short skirt, high heels, arm-length gloves. Came here to work for Beth, got fed up with it, made her own place.
//The "ILARIA_PREG_EMAIL1" flag: 	1 = You both know she's pregnant
//									2 = You've talked about it in-person
//									3 = She gave you free food

public function showIlaria(nude:Boolean = false):void
{
	showName("\nILARIA");
	showBust(ilariaBustDisplay(nude));
}
public function ilariaBustDisplay(nude:Boolean = false):String
{
	var sBust:String = chars["ILARIA"].bustDisplay;
	if(nude) sBust += "_NUDE";
	
	return sBust;
}

//
//Room Descripts
public function bunnyBunsCumfectionaryBonus():void
{
	showBust(ilariaBustDisplay());
	output("The inside of Bunny’s Buns & Confectionary is an almost overwhelming assault on the senses: bright pastel colors and flashing lights adorn every wall, drawing your eye to dozens of different menu options each flickering on a holodisplay; booming bass-heavy music fills the air, accompanied by crooning female vocals in an ausari accent. Across from the entrance and big bay windows is an old-school Terran bar, complete with stools and polished until it shines, though behind it are several different flavors of ice-cream dispenser and a soda machine that runs all the way into the ceiling - like everything else, it pulses with electronic lights, showing off its wares in a garish holographic commercial that never ends.");
	output("\n\n");
	if(flags["MET_ILARIA"] != undefined) 
	{
		output("Ilaria");
		addButton(0,"Ilaria",approachIlaria);
	}
	else 
	{
		output("A curvaceous, almost albino-pale woman in what looks like some kind of bunny costume");
		addButton(0,"Bunny",approachIlaria);
	}
	output(" is bouncing around behind the bar, hopping from one customer to the next with a never-ending smile.");
}

//Greetings
public function approachIlaria():void
{
	clearOutput();
	showIlaria();
	author("Savin");
	//First Time
	if(flags["MET_ILARIA"] == undefined)
	{
		output("You’ve barely sauntered up to the counter before the one and only employee bounces over to you, springing on long, digitigrade legs behind the counter. Now that she’s a little closer, you’re not so sure it’s a bunny costume so much as some high-quality mod work she’s had done: a pair of fluffy white-and-pink rabbit’s ears swivel towards you atop her head, and a poof-ball of a tail wiggles like a jubilant ausar’s.");
		output("\n\n<i>“Hey there, sweet stuff,”</i> the bunny-woman croons, leaning over the counter in a way that makes her ample chest wobble against the polished surface, barely constrained by her showy black corset. <i>“What can I getcha?”</i>");
		output("\n\nYou notice a little name-tag is pinned to the stand-alone collar-and-bow-tie around her neck, reading on bubbly pink capitals: “ILARIA.”");
		
		flags["MET_ILARIA"] = 1;
	}
	//Repeat
	else if(flags["ILARIA_PREG_EMAIL1"] == 1)
	{
		output("<i>“[pc.name]!”</i> the bunny-babe yips, bounding over and hopping into your arms. She gives you a kiss and grabs your hand, directing it down to her [ilaria.belly]. <i>“I’m glad you came by. Really glad... my virile stud.”</i>");
		output("\n\nShe giggles, and nuzzles herself under your arm. <i>“Sorry, I’m terrible about the whole ‘romance’ thing, but I’m definitely excited! Super duper extra excited! I’ve " + (flags["ILARIA_TOTAL_KIDS"] > 0 ? "been waiting for the next happy accident you left in my pussy to take root -- the last time was awesome" : "never been pregnant before") + "!”</i>");
		output("\n\nIlaria squeals excitedly, bouncing on her bunny-like heels. Her excitement is infectious, and soon you’re allowing her to guide you into a barstool and enticing whatever your favorite order from the menu is -- her treat. Between her giddy ejaculations, you manage to " + (flags["ILARIA_TOTAL_KIDS"] > 0 ? "remind" : "inform") + " her of the nursery dedicated to you upstairs -- she’s free to make use of its facilities during and after her pregnancy. That, she says, takes what little weight she’d been feeling off her shoulders: a place that’ll take care of her children while she works will make this all the sweeter for her.");
		
		flags["ILARIA_PREG_EMAIL1"] = 2;
	}
	else if (ilariaSteelePregTalkTrigger()) ilariaSteelePregTalk();
	else
	{
		output("Ilaria bounds over to you with a smile. <i>“Welcome back!");
		if(flags["FUCKED_ILARIA"] != undefined) 
		{
			output("”</i> she murmurs huskily, leaning way over the counter to show you all of that delicious, milky cleavage of hers.");
			if(chars["ILARIA"].bellyRating() >= 25)
			{
				output(" One of her hands traces seductively over the ");
				if(chars["ILARIA"].isPregnant()) output("growing");
				output(" swell of her belly.");
			}
			output(" <i>“Just stopping in for a snack, or...?");
		}
		else output(" What looks good to you, sweetheart?");
		output("”</i>");
	}
	ilariaMenu();
}

//Ilaria Menu
public function ilariaMenu():void
{
	clearMenu();
	//[Order Up] [Leave]
	addButton(0,"Order Up",orderFromIlaria,undefined,"Order Up","Check out the menu!");
	if(flags["ILERIA_GLAZED"] != undefined)
	{
		if(pc.lust() >= 33) addButton(1,"Sex",sexWithIlaria,undefined,"Sex","Most of her scenes involve you “helping” her attached to her cock-milker, to save up some “special sauce.”");
		else addDisabledButton(1,"Sex","Sex","You are not aroused enough for this!");
	}
	else addDisabledButton(1,"Sex","Sex","She doesn’t seem like she’s ready for this just yet.");
	if(flags["ILERIA_GLAZED"] != undefined) addButton(2,"Appearance",ilariaAppearance,undefined,"Appearance","Take a look at her.");
	else addDisabledButton(2,"Appearance","Appearance","You haven’t seen <i>all</i> of her yet.");
	addButton(14,"Back",mainGameMenu);
}





//Order Up
//Check out the menu!
//Each item grants a progressively higher Thickness boost and a longer-lasting Home Cooking benefit, at progressively higher prices. Maybe 10bux for Sin-a-bunny, and +10 per tier.
public function orderFromIlaria():void
{
	clearOutput();
	showIlaria();
	author("Savin");
	output("What will you order?\n\n");

	output("(" + getOrderPrice("Sin-a-Bunny") + " C) <b>Sin-a-Bunny</b> - Ilaria’s famous cinnamon-sprinkle buns, served piping hot and sinfully soft straight from her oven. Best with a glaze of her special homemade cream!");
	output("\n(" + getOrderPrice("Vanilla Iced Teats") + " C) <b>Vanilla Iced Teats</b> - Ye olde ice cream, but with a milky twist! This designer brand is sourced from humanoid milk, but processed and flavored to be ten times tastier than a Terran bovine!");
	output("\n(" + getOrderPrice("Kaithrit Kittycake") + " C) <b>Kaithrit Kittycake</b> - Cheesecake, sort of. Made with a rich, thick cream that kaithrit go wild for, but condensed into a milky cake. Way more sugary than the Terran equivalent, it’ll melt in your mouth in the blink of an eye!");
	output("\n(" + getOrderPrice("Ausar Pup Pie") + " C) <b>Ausar Pup Pie</b> - A sweet, earthy pie made from Ausaril fruits and crust. Served in bite-sized cubes with individual flavorings - always piping hot!");
	output("\n(" + getOrderPrice("Dzaan Cream Smoothie") + " C) <b>Dzaan Cream Smoothie</b> - Called as such because it’s as addictive as a dzaan alpha - well, maybe not really, but one taste will have you begging for more of this sweet, creamy smoothy, guaranteed!");
	output("\n(" + getOrderPrice("Raxxian Road") + " C) <b>Raxxian Road</b> - A chunky whipped cream dessert filled with chocolate chunks and loaded down with cookie crumble and sprinkles. The favorite of kids on the station!");
	output("\n(" + getOrderPrice("Gryvain Jigglers") + " C) <b>Gryvain Jigglers</b> - A bowl of fruity gelatin from the gryvain homeworld of Vendiko. Kept in the planet’s dense, thick atmosphere, these treats all but dissolve on contact with your mouth, giving you a burst of flavor with every bite!");

	clearMenu();
	var free:Boolean = (flags["ILARIA_PREG_EMAIL1"] == 2);
	if(getOrderPrice("Sin-a-Bunny") <= pc.credits || free) addButton(0,"Sin-a-Bunny",actuallyOrderFromIlaria,"Sin-a-Bunny","Sin-a-Bunny","Ilaria’s famous cinnamon-sprinkle buns, served piping hot and sinfully soft straight from her oven. Best with a glaze of her special homemade cream!");
	else addDisabledButton(0,"Sin-a-Bunny","Sin-a-Bunny","You can’t afford this.");
	if(getOrderPrice("Vanilla Iced Teats") <= pc.credits || free) addButton(1,"Vanilla Ice C.",actuallyOrderFromIlaria,"Vanilla Iced Teats","Vanilla Iced Teats","Ye olde ice cream, but with a milky twist! This designer brand is sourced from humanoid milk, but processed and flavored to be ten times tastier than a Terran bovine!");
	else addDisabledButton(1,"Vanilla Iced Teats","Vanilla Iced Teats","You can’t afford this.");
	if(getOrderPrice("Kaithrit Kittycake") <= pc.credits || free) addButton(2,"Kaithrit Cake",actuallyOrderFromIlaria,"Kaithrit Kittycake","Kaithrit Kittycake","Cheesecake, sort of. Made with a rich, thick cream that kaithrit go wild for, but condensed into a milky cake. Way more sugary than the Terran equivalent, it’ll melt in your mouth in the blink of an eye!");
	else addDisabledButton(2,"Kaithrit Kittycake","Kaithrit Kittycake","You can’t afford this.");
	if(getOrderPrice("Ausar Pup Pie") <= pc.credits || free) addButton(3,"Ausar Pup Pie",actuallyOrderFromIlaria,"Ausar Pup Pie","Ausar Pup Pie","A sweet, earthy pie made from Ausaril fruits and crust. Served in bite-sized cubes with individual flavorings - always piping hot!");
	else addDisabledButton(3,"Ausar Pup Pie","Ausar Pup Pie","You can’t afford this.");
	if(getOrderPrice("Dzaan Cream Smoothie") <= pc.credits || free) addButton(4,"D. Smoothie",actuallyOrderFromIlaria,"Dzaan Cream Smoothie","Dzaan Cream Smoothie","Called as such because it’s as addictive as a dzaan alpha - well, maybe not really, but one taste will have you begging for more of this sweet, creamy smoothy, guaranteed!");
	else addDisabledButton(4,"Dzaan Cream Smoothie","Dzaan Cream Smoothie","You can’t afford this.");
	if(getOrderPrice("Raxxian Road") <= pc.credits || free) addButton(5,"Raxxian Road",actuallyOrderFromIlaria,"Raxxian Road","Raxxian Road","A chunky whipped cream dessert filled with chocolate chunks and loaded down with cookie crumble and sprinkles. The favorite of kids on the station!");
	else addDisabledButton(5,"Raxxian Road","Raxxian Road","You can’t afford this.");
	if(getOrderPrice("Gryvain Jigglers") <= pc.credits || free) addButton(6,"GryvainJiggler",actuallyOrderFromIlaria,"Gryvain Jigglers","Gryvain Jigglers","A bowl of fruity gelatin from the gryvain homeworld of Vendiko. Kept in the planet’s dense, thick atmosphere, these treats all but dissolve on contact with your mouth, giving you a burst of flavor with every bite!");
	else addDisabledButton(6,"Gryvain Jigglers","Gryvain Jigglers","You can’t afford this.");
	
	addButton(14,"Back",ilariaMenu);
}

public function setOrderTFAndDeets(order:String, glazed:Boolean = false):void
{
	var multi:Number = 0;
	switch (order)
	{
		//Sin-a-Bunny
		//Ilaria’s famous cinnamon-sprinkle buns, served piping hot and sinfully soft straight from her oven. Best with a glaze of her special homemade cream!
		case "Sin-a-Bunny":
			output(pc.modTone(-1));
			output(pc.modThickness(1));
			multi = 1;
			break;
		//Vanilla Iced Teats
		//Ye olde ice cream, but with a milky twist! This designer brand is sourced from humanoid milk, but processed and flavored to be ten times tastier than a Terran bovine!
		case "Vanilla Iced Teats":
			output(pc.modThickness(4));
			multi = 2;
			break;
		//Kaithrit Kittycake
		//Cheesecake, sort of. Made with a rich, thick cream that kaithrit go wild for, but condensed into a milky cake. Way more sugary than the Terran equivalent, it’ll melt in your mouth in the blink of an eye!
		case "Kaithrit Kittycake":
			output(pc.modTone(-2));
			output(pc.modThickness(2));
			multi = 3;
			break;
		//Ausar Pup Pie
		//A sweet, earthy pie made from Ausaril fruits and crust. Served in bite-sized cubes with individual flavorings - always piping hot!
		case "Ausar Pup Pie":
			output(pc.modThickness(2));
			multi = 4;
			break;
		//Dzaan Cream Smoothie
		//Called as such because it’s as addictive as a dzaan alpha - well, maybe not really, but one taste will have you begging for more of this sweet, creamy smoothy, guaranteed!
		case "Dzaan Cream Smoothie":
			output(pc.modTone(-1));
			output(pc.modThickness(1));
			multi = 5;
			break;
		//Raxxian Road
		//A chunky whipped cream dessert filled with chocolate chunks and loaded down with cookie crumble and sprinkles. The favorite of kids on the station!
		case "Raxxian Road":
			output(pc.modTone(-3));
			output(pc.modThickness(3));
			multi = 6;
			break;
		//Gryvain Jigglers
		//A bowl of fruity gelatin from the gryvain homeworld of Vendiko. Kept in the planet’s dense, thick atmosphere, these treats all but dissolve on contact with your mouth, giving you a burst of flavor with every bite!
		case "Gryvain Jigglers":
			output(pc.modTone(-10));
			multi = 7;
			break;
	}
	if(glazed)
	{
		multi *= 2;
		chars["ILARIA"].setPerkValue("Fixed CumQ", 1, 500);
		pc.loadInMouth(chars["ILARIA"]);
		chars["ILARIA"].setPerkValue("Fixed CumQ", 1, 50000);
	}
	if(!pc.hasStatusEffect("Home Cooking")) pc.createStatusEffect("Home Cooking", 50, 0, 0, 0, false, "Icon_Cooking", "While you are well fed, you recover more while resting.", false, (12*60+multi*2*60));
	else if(pc.getStatusMinutes("Home Cooking") < (12*60+multi*2*60)) pc.setStatusMinutes("Home Cooking",(12*60+multi*2*60));
}

public function getOrderPrice(order:String):Number
{
	
	switch (order)
	{
		//Sin-a-Bunny
		//Ilaria’s famous cinnamon-sprinkle buns, served piping hot and sinfully soft straight from her oven. Best with a glaze of her special homemade cream!
		case "Sin-a-Bunny":
			return 10;
		//Vanilla Iced Teats
		//Ye olde ice cream, but with a milky twist! This designer brand is sourced from humanoid milk, but processed and flavored to be ten times tastier than a Terran bovine!
		case "Vanilla Iced Teats":
			return 19;
		//Kaithrit Kittycake
		//Cheesecake, sort of. Made with a rich, thick cream that kaithrit go wild for, but condensed into a milky cake. Way more sugary than the Terran equivalent, it’ll melt in your mouth in the blink of an eye!
		case "Kaithrit Kittycake":
			return 29;
		//Ausar Pup Pie
		//A sweet, earthy pie made from Ausaril fruits and crust. Served in bite-sized cubes with individual flavorings - always piping hot!
		case "Ausar Pup Pie":
			return 39;
		//Dzaan Cream Smoothie
		//Called as such because it’s as addictive as a dzaan alpha - well, maybe not really, but one taste will have you begging for more of this sweet, creamy smoothy, guaranteed!
		case "Dzaan Cream Smoothie":
			return 49;
		//Raxxian Road
		//A chunky whipped cream dessert filled with chocolate chunks and loaded down with cookie crumble and sprinkles. The favorite of kids on the station!
		case "Raxxian Road":
			return 59;
		//Gryvain Jigglers
		//A bowl of fruity gelatin from the gryvain homeworld of Vendiko. Kept in the planet’s dense, thick atmosphere, these treats all but dissolve on contact with your mouth, giving you a burst of flavor with every bite!
		case "Gryvain Jigglers":
			return 75;
	}
	//This should ensure people talk about it if it breaks!
	return -100000;
}

//PC makes an Order
public function actuallyOrderFromIlaria(order:String = ""):void
{
	clearOutput();
	showIlaria();
	author("Savin");
	if(flags["ILARIA_PREG_EMAIL1"] == 2) flags["ILARIA_PREG_EMAIL1"] = 3;
	else pc.credits -= getOrderPrice(order);
	//Hasn’t Unlocked Sex; ordered anything but a Sin-A-Bunny
	if(flags["ILERIA_GLAZED"] == undefined && order != "Sin-a-Bunny")
	{
		output("<i>“Great choice!”</i> Ilaria beams, hopping up and doing a spin towards the machinery arrayed behind the bar. <i>“I’ll have your order in just a sec’, honey!”</i>");
		getFoodTextShit(order);
		setOrderTFAndDeets(order);
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Sin-A-Bunny {First time; after defaults to below}
	else if(flags["ILERIA_GLAZED"] == undefined)
	{
		//Unlocks Ilaria’s sex stuff.
		output("<i>“Oh, my speciality!”</i> Ilaria cheers, rocking back on her heels. Her towering bunny-ears crane towards you as she comes back your way, and she adds, <i>“Soooo, you gonna take that with my <b>special</b> sauce, sweetheart? I’ve got plenty saved up, nice and hot and creamy, just wait’n for you!”</i>");
		output("\n\n<i>“Special sauce?”</i> you ask. The menu did say something about a homemade cream, but...");
		output("\n\n<i>“O-oh! Whoops!”</i> the bunny giggles sheepishly, biting her lip. <i>“I figured you knew. Don’t mind me, sweetie, I’ll get your order...”</i>");
		output("\n\nYou ");
		if(pc.isBro() || pc.isAss()) output("grab");
		else output("gently brush");
		output(" her wrist, keeping her from hopping away. Ilaria blushes darkly, but her poof-ball tail wiggles so much that her ruffled skirts threaten to tear. <i>“What’s the special sauce?”</i> you ask again.");
		output("\n\nIlaria bounces on her feet, mulling it over a second. <i>“Oh, fine! You look like the kind of person who’d enjoy it: my sin-a-bunny sauce comes straight from under the skirt. From a thick, throbbing faucet. Y’know?”</i> she grins mischievously, leans in, and adds, <i>“Cock-sauce! A nice, creamy glaze of bunny-spunk to brighten your day and mine! Whadda ya say?”</i>");
		//[Sure] [Nope]
		processTime(2);
		clearMenu();
		addButton(1,"Nope",noBunnySpunkForMePlease,order,"Nope","That is not at all what you were wanting here. Nope!");
		addButton(0,"Sure",giveMeBunnySpunkOnMyFudz,order,"Sure","That sounds tasty...");
	}
	//Has Unlocked Sex; any order
	else
	{
		output("<i>“Sounds tasty!”</i> Ilaria grins, hopping up with a wiggle in her tail and a bounce in her breasts. <i>“Want some of my special sauce, sweetie, or is it gonna be a plain jane order today?”</i>");
		//[Plain] [Special]
		processTime(1);
		clearMenu();
		addButton(1,"Plain",plainFoodYouSlut,order,"Plain","No special sauce today.");
		addButton(0,"Special",specialBunnyGlazeRepeatsPlz,order,"Special","Oh, yeah. Let’s get a nice glaze of bunny cream to go on top.");
	}
}

public function getFoodTextShit(order:String):void
{
	output("\n\nShe bounces off, leaving you to wait for just a few moments while your hostess tends to a couple other customers, then disappears into a back room. While she’s gone, you’re left to ");
	if(pc.isBimbo()) output("groove along with");
	else output("“enjoy”");
	output(" the thumping, ausar-babe pop pounding over the speakers. You’re not sure anybody in here can hear anything said more than a couple feet from them - which doesn’t seem to bother anybody, as far as you can see. The younger patrons definitely are enjoying it.");

	output("\n\nWhen Ilaria comes back, she’s got a tray of orders balanced on one shoulder, passing out dishes to customer after customer as she makes her way down the bar. With her arms so occupied, you see that her stiletto heels give her a swaying gait, making her very broad hips sashay with every step, and her pushed-up breasts jiggle like water under the corset that barely rises high enough to cover up her nipples. When she bends to deliver your order, the black cloth slides down just enough to hint at a puffy pink mound, and you catch several other patrons enjoying the show from behind her: her skirt must be riding awfully high back there!");
	output("\n\n<i>“Dig in, honey!”</i> the bunny-babe grins, sliding your dish across to you.");
}

//[Nope]
//That is not at all what you were wanting here. Nope!
public function noBunnySpunkForMePlease(order:String):void
{
	clearOutput();
	showIlaria();
	author("Savin");
	output("<i>“Nope,”</i> you say, releasing her wrist. <i>“Just a normal bun, thanks.”</i>");
	output("\n\nIlaria shrugs lightly. <i>“Suit yourself! Change your mind, though, and the offer’s open!”</i>");

	//Append 2nd paragraph on of the no-sex scene, above.
	getFoodTextShit(order);
	setOrderTFAndDeets(order);
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Sure]
//That sounds tasty...
public function giveMeBunnySpunkOnMyFudz(order:String):void
{
	clearOutput();
	showIlaria();
	author("Savin");
	output("<i>“Sounds tasty,”</i> you grin. <i>“Sign me up.”</i>");
	output("\n\nIlaria licks her lips and smiles. <i>“One special sauce bun, cumming up!”</i>");
	output("\n\nShe starts to turn, then gives you a playful look over her shoulder, tail wiggling. <i>“Say, cutie... wanna help, um, make the stuff? I’m all rigged up and ready to go, just need someone like you to handle the controls.”</i>");
	output("\n\nYou cock an eyebrow, until she produces a bright pink remote from her cleavage and deposits it on the counter in front of you. <i>“Vibrators. Nipple pasties, ass and pussy bullets, cockring, ball clench... just play with the controls while I work, and I’ll be serving up your cream in no time!”</i>");
	processTime(2);
	//Go to Bunny Cream
	clearMenu();
	addButton(0,"Next",bunnyCreamCumBonanzaBullshitRemoteFuntimesExplosionIDunnoWhyThisFunctionNameIsSoLong,order);
}

//[Plain]
//No special sauce today.
public function plainFoodYouSlut(order:String):void
{
	clearOutput();
	showIlaria();
	author("Savin");
	output("<i>“Just the usual,”</i> you tell her.");
	output("\n\nThe bunny-babe nods without skipping a beat.");
	//Append no-sex order from second pg. on."
	getFoodTextShit(order);
	setOrderTFAndDeets(order);
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Special]
//Oh, yeah. Let’s get a nice glaze of bunny cream to go on top.
public function specialBunnyGlazeRepeatsPlz(order:String):void
{
	clearOutput();
	showIlaria();
	author("Savin");
	if(pc.isBimbo()) output("<i>“Like, totally!”</i> you cheer excitedly, bouncing on your seat. <i>“I love the taste of cum all over my food - it’s, like, the bestest topping!”</i>");
	else output("<i>“Sure,”</i> you grin, idly brushing a hand along the bunny’s curvy thigh. <i>“Let’s get some of that special sauce.”</i>");
	output("\n\n<i>“Great,”</i> Ilaria murmurs, flipping a bright pink remote out of her cleavage and sliding it across to you. <i>“Just play around with this while I work orders, and I’ll be sure to make you a nice, thick load of bunny-cream before you know it!”</i>");
	processTime(1);
	//Go to Bunny Cream
	clearMenu();
	addButton(0,"Next",bunnyCreamCumBonanzaBullshitRemoteFuntimesExplosionIDunnoWhyThisFunctionNameIsSoLong,order);
}

//Bunny Cream
//+Light Exhibitionism
public function bunnyCreamCumBonanzaBullshitRemoteFuntimesExplosionIDunnoWhyThisFunctionNameIsSoLong(order:String):void
{
	clearOutput();
	showIlaria(true);
	author("Savin");
	output("The bunny-girl gives you a playful wink and swivels on a high heel, turning back to some of the other patrons crowding the bakery. You watch that half-covered heart-shaped ass sashay off, her poof-ball tail wiggling away, before turning your attention to the remote on the counter. It’s a little sliver of pink plastic, dominated by a circular control dial marked zero to ten. There’s nothing for it but to run a finger along the contour, slowly bringing the counter up to the big, bold “<b>1</b>” setting.");
	output("\n\nFrom halfway across the restaurant, you hear Ilaria give a little gasp and miss a step in her sexy gait. The customer she’s serving, a ");
	if(rand(5) == 0) output("burly thraggen man with a golden nose-ring");
	else if(rand(4) == 0) output("red-haired spacer in a skin-tight bodysuit");
	else if(rand(3) == 0)
	{
		if(flags["MET_AINA"] != undefined) output("certain familiar centaur");
		else output("chestnut-colored centauress");
	}
	else if(rand(2) == 0) output("green-scaled gryvain in a pants suit");
	else output("fox-eared man with several glowing, furry tails");
	output(", cocks a curious eyebrow at her. Ilaria flushes and giggles, murmuring that she just tripped and can she get them a refill of anything?");
	output("\n\nYou just watch with a spreading grin, idly flicking the dial up to its second position.");
	output("\n\nIlaria bites her lower lip, squirming while she delivers another order. Leaning over the counter, you can see a tell-tale bulge forming at the front of her skirt, hefting up the hem with every step. She already had plenty of leg on display, but now her outfit’s positively scandalous - one wrong step and she’ll be showing off her package to the whole room! So much for the family-friendly side of the place...");
	output("\n\nThe bunny-girl flashes you a flirty little grin and bounces on her heels, quickly pressing her bulging front up against the inside of the counter when another customer tries to get her attention. She gives him a smile and leans over the counter, trying to draw the man’s attention to her chest instead of her crotch. You half expect he can hear the buzz of the vibrators - and just in case he can’t, you bump it up to setting three.");
	output("\n\nIlaria gasps, crossing her trembling legs.");
	output("\n\n<i>“Is everything okay?”</i> the guy she’s talking to asks, starting to look over the counter.");
	output("\n\nIlaria yelps, <i>“Yeah! Yeah! Everything’s fine. Lemme grab something from... ah, from the back!”</i>");
	output("\n\nFrom the back, huh? When she turns towards the door, you lock your eyes on Ilaria’s heart-shaped rump, watching it clench and quiver as the pair of bullet vibes buzz away inside her. One errant step gives you a view of her cum-swollen balls, a pair of grapefruit-sized orbs swinging with a heavy load of pent-up cum. Your soon-to-be snack!");
	output("\n\nThe cum-bunny bounces out of sight for a moment, disappearing into the back room to fetch a few orders from the ovens. While she’s gone, you flick things up another notch - and immediately hear a gasping cry from inside, almost inaudible over the thump of the restaurant’s music. Nobody else seems to notice, though a few customers are glancing amongst each other; some knowingly, others with concern. The former spy you with the controller and grin. Guess you’re hardly the first person to have indulged in Ilaria’s special sauce...");
	output("\n\nShe reappears a moment later with a spring in her step and a platter balanced over one shoulder. Her high heels clitter-clatter over the tile floor, an uneven staccato trying desperately not to tip their owner’s hand to the growing audience. More and more people are looking her way as Ilaria awkwardly delivers order after order, sliding plates down the bar with a trembling hand.");
	output("\n\nWhen she gets to you, though, Ilaria sashays back with a red-cheeked smile, carrying your dish personally. Rather than drop it off, though, the bunny-babe slips the plate under the counter, resting it on a hidden shelf before leaning over the counter with a flirtatious smile. <i>“Okay! Your sweet, creamy topping’s just... oh, it’s just about ready! Gimme a little more of the good stuff, sugar, and I’m ready to burst.”</i>");
	output("\n\nIlaria gives you a wink, and one of her hands vanishes under the counter. The intimation is clear, and you eagerly ply the controller up to the halfway point. The bunny-girl sucks in a sharp breath, suppressing a whimpering little moan, and her hand starts moving quickly just out of sight. She tries to be subtle, but the pleasure’s too much to keep <i>completely</i> silent; those customers who seemed clued-in to her lusty undertakings grin and chuckle.");
	output("\n\n<i>“Gonna... gonna...”</i> she murmurs, grabbing your [pc.arm] with her free hand. You grin and push the dial up, all the way this time. Ilaria’s eyes go wild, and her lips twist open in a silent cry of pleasure. Even over the ever-present smell of cinnamon and sugar that pervades the bakery, you catch a strong whiff of something musky and masculine wafting up to your nose. The cum-bunny’s breath catches, held for a long moment in her open throat before her eyes flutter, and she all but collapses over the bar. Her big breasts compress onto the cold metal, spreading out under her like pillows as she comes down off her orgasmic high. The vibrators milk out every sweet drop while you tune the controller down, slowly passing it back down through the settings until the notch finds the “Zero” once again.");
	output("\n\n<i>“Whew! That’s a double helping, I think,”</i> Ilaria giggles, slowly propping herself up on her elbows. <i>“Get it while it’s hot!”</i>");
	output("\n\nShe retrieves the plate, showing off ");
	if(order == "Gryvain Jigglers" || order == "Vanilla Iced Teats") output(order);
	else output(indefiniteArticle(order));
	output(" slathered with a thick glaze of glistening white “sauce,” so fresh its practically steaming. Locking eyes with the cum-bunny, you grab a set of plasticware from the dispenser and dig in, taking a great big gulping bite of your salty-sweet treat.");
	output("\n\n<i>“Delicious,”</i> you tell her, licking your [pc.lipsChaste].");
	output("\n\nIlaria giggles");
	//fuckd:
	if(flags["FUCKED_ILARIA"] != undefined) output(" and leans across, giving you a kiss that ends up snowballing a little of her own seed onto her tongue.");
	else output(" and gives you a wink");
	output(". <i>“Of course. A little secret ingredient goes a long way. And a <b>lot</b> of it goes... even further, I guess! Enjoy, sweet thing!”</i>");
	output("\n\nShe bounces off with a spring in her step, leaving you to enjoy your well-earned meal.");
	processTime(15);
	chars["ILARIA"].setPerkValue("Fixed CumQ", 1, 500);
	pc.loadInMouth(chars["ILARIA"]);
	chars["ILARIA"].setPerkValue("Fixed CumQ", 1, 50000);
	setOrderTFAndDeets(order,true);
	IncrementFlag("ILERIA_GLAZED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sex
//Add [Sex] to Ilaria’s basic menu once you’ve had her <i>“Special Sauce”</i> at least once.
//Most of her scenes involve you <i>“helping”</i> her attached to her cock-milker, to save up some <i>“special sauce.”</i>

public function sexWithIlaria():void
{
	clearOutput();
	showIlaria(true);
	author("Savin");
	output("Rather than placing an order, you lean in over the counter so that your [pc.face] is nearly brushing Ilaria’s. She wiggles her hips expectantly, letting her bunny-ears go flaccid so that one of them brushes the top of your head, and the other flops down to cover one of her eyes. <i>“What’s on your mind, sweet thing?”</i> she whispers, slowly running a hand down her [ilaria.belly].");
	output("\n\nWith a seductive smirk, you suggest the two of you abscond to the back room for a little private fun. As much as watching her secretly cream herself in front of her customers-cum-audience might be, you’d rather get hot and heavy with the busty bunny right now.");
	output("\n\n<i>“Oh, greedy " + pc.mf("boy","girl") + ", wanting me all to yourself!”</i> she teases. <i>“I love it. C’mon back - I could use a hand emptying out some... pent up pressure, anyway.”</i>");
	output("\n\nIlaria gives you a wink and takes you by the hand, leading you around the end of the bar and towards the little back-room door every shop on the station has. Everyone watches the two of you go; a few with jealousy, a few with arousal, but most with just silent interest or confusion. She’s barely closed the door before her corset’s straining strings are snapping open, letting those big, heavy breasts fall free - and right into your hands. You press yourself into the busty bunny’s back, kneading her heaving chest until she moans openly, pushing back against you and grinding her meaty ass into your crotch.");
	output("\n\nHer skirt’s the next obstacle, but it comes off with an elastic pop at your insistent yanks, leaving her puff-ball tail and smooth curves bare.");
	if(flags["FUCKED_ILARIA"] != undefined) output(" As always,");
	output(" Ilaria’s bare body is covered in vibrators: a pair of pasties covering her nipples, a pair of bullets spreading the lips of her drooling pussy and protruding half way from tight behind, a pair of vib-pads hugging her cum-swollen sack, and of course, a silver ring around ");
	//first time:
	if(flags["FUCKED_ILARIA"] == undefined) output("what turns out to be a throbbing, six-inch pillar of red ausar meat. Ilaria’s packing a puppy pecker!");
	else output("the knotty base of her red rocket.");
	output(" The bunny girl hops out of your embrace and grabs the universal pink remote from her discarded corset, clipping it onto the top of one of her high stockings before sashaying over towards ");
	//first time:
	if(flags["FUCKED_ILARIA"] == undefined) output("a huge machine against the back wall: a silver device with a pair of big tanks, a pair of stirrups and handholds, and a thick suction-cup hooked up to a hose. A cock-milker... and one that looks more made for a leithan stallion than a futa fuck-bunny.");
	else output("the industrial cock-milker dominating the back half of the room.");
	output("\n\nIlaria gives you a wink and picks up the milker, cupping it to her crotch and mounting it with one well-practiced thrust that leaves her lodged in all the way to the knot. She pushes a big red button on the side of the device, and gasps as the device immediately kicks in, sucking on her turgid rod. <i>“Ooh! A-alright, lover, I’m all yours. Dig in!”</i>");
	IncrementFlag("FUCKED_ILARIA");

	processTime(5);
	pc.lust(25);
	clearMenu();
	//[Munch Pussy] [Pound Her]
	//Munch Pussy
	addButton(0,"Munch Pussy",munchIlariasPussy,undefined,"Munch Pussy","Help yourself to a whole heaping helping of Ilaria’s pussy.");
	//Pound Her
	//Onecock Tooltip: Ilaria’s already hooked up and presenting - go ahead and slide into the lusty bunny’s welcoming hole while she cums buckets into her milker.
	//2+Cock Tooltip: Ilaria’s presenting two fine-looking holes to you - go ahead and pound both of them in while she dumps a fat load of bunny cream into her milker.
	if(pc.hasCock())
	{
		/*
		output("\n\nILARIA: " + chars["ILARIA"].vaginalCapacity(0));
		for(var i:int = 0; i < pc.cockTotal(); i++)
		{
			output("\nDICK No." + (i + 1) + ": " + pc.cockVolume(i));
		}
		*/
		if(pc.cockThatFits(chars["ILARIA"].vaginalCapacity(0)) >= 0)
		{
			if(pc.cockThatFits2(chars["ILARIA"].vaginalCapacity(0)) >= 0 && pc.cockTotal() > 1) addButton(1,"Pound Her",poundIlariaLikeMad,undefined,"Pound Her","Ilaria’s already hooked up and presenting - go ahead and slide into the lusty bunny’s welcoming hole while she cums buckets into her milker.");
			else addButton(1,"Pound Her",poundIlariaLikeMad,undefined,"Pound Her","Ilaria’s already hooked up and presenting - go ahead and slide into the lusty bunny’s welcoming hole while she cums buckets into her milker.");
		}
		else addDisabledButton(1,"Pound Her","Pound Her","You need a penis that will fit inside her for this.");
	}
	else addDisabledButton(1,"Pound Her","Pound Her","You need a penis for this.");
	addButton(2,"Urethral Suck",ilariaCumSlurp,undefined,"Urethral Suck","Suck Ilaria to a massive orgasm then siphon her cum directly out of her with a straw.");
}

public function ilariaCumSlurp():void
{
	clearOutput();
	showIlaria(true);
	author("Wsan");
	// [Blowjob]
	//tooltip: Suck Ilaria to a massive orgasm then siphon her cum directly out of her with a straw.
	output("<i>“Nuh uh,”</i> you say, shaking your head. Ilaria moans in disappointment as you take the milker off her from behind, but quickly recovers as you bend down to lick her between the legs.");
	output("\n\n<i>“Oh!”</i> she gasps, reaching back to " + (pc.hasHair() ? "stroke your [pc.hair]":"place her palm on your head") + ". <i>“I guess you wanna do things the hard way" + (flags["ILARIA_CUMSUCKED_URETHRAL"] != undefined ? " again":"") + ", huh?”</i>");
	output("\n\n<i>“You know it,”</i> you murmur, lashing your [pc.tongue] over her knot while she pulls herself out. She can’t resist holding herself in place for a few seconds of fun before extricating herself completely and turning around as you sink to your knees. <i>“I want to try something" + (flags["ILARIA_CUMSUCKED_URETHRAL"] == undefined ? " new..":"") + ".”</i>");
	output("\n\n<i>“I’m all yours, babe,”</i> Ilaria says, leaning back against the milker’s mount with an easy grin. <i>“" + (flags["ILARIA_CUMSUCKED_URETHRAL"] == undefined ? "Show me your stuff!":"Still gettin’ used to the straw thing, but last time was so much fun I can’t say no!") + "”</i>");
	output("\n\nShe lets out a quiet grunt as you plant your [pc.lipsChaste] on her swollen cock and suck, letting your tongue loll out along her underside. You give her some hard, loving sucks that make her shudder against you before you let her out of your mouth with a satisfied sigh and duck a little lower to tend to the heavy cumtanks hanging between her legs. Each one is big enough to give even an experienced partner pause, but not you.");
	output("\n\nYou gently drag your tongue along the underside of one of her fat, musky nuts, bigger than a grapefruit and every bit as plump. Lifting her red puppycock out of the way to really get at her hefty balls, you lick her up and down until you can feel them shifting in her sack, gaining liquid weight while you tantalize her. When she blows her load, it’s going to be monumental. Already you can feel her uncontrollably dripping all over your hand, sticky clear precum running over your fingers.");
	output("\n\nYou pull back and lick it off your hand with slow, deliberate motions of your tongue, swallowing hard after each one and revelling in the way Ilaria bites her lip while she watches. When you’ve finished with your fingers you tend to her swollen cock, tongue-bathing her until she’s veritably shining with saliva before resealing your lips around her dick, this time intent upon bringing her swift relief.");
	output("\n\n<i>“Oh- oh, that’s </i>good<i>,”</i> Ilaria moans, letting out a pant while she shakily grasps your " + (pc.hasLongHorns() ? "horns":"head") + ". <i>“I’m gonna c-cum pretty hard, [pc.name]! I huh-hope you’re ready!”</i>");
	output("\n\nYou reach for the controller to her vibrators and grin around her prick as she gasps, her very cock shaking in your mouth as shudders run throughout her entire body. Her thighs tighten and her hips begin to flick back and forth as she gives into the irresistible instinct of pure, animal pleasure. Grabbing handfuls of her curvy asscheeks, you let her start battering your face against her taut stomach, panting all the while.");
	output("\n\n<i>“Gonna cum,”</i> Ilaria whines needily, spittle flying from your lips as you’re rocked back and forth over the entire length of her throbbing dick. <i>“Oh fuck oh fuck oh fuck gonna cum gonna cum nnnh-!”</i>");
	output("\n\nRight on cue you switch the vibes to max and she suddenly doubles over, breath catching in her throat while her eyes go wide. The pause affords you the precious seconds you need to gently slide the straw you procured from a container earlier right down the first few inches of her shaft before she blows. She doesn’t even notice the intrusion, and in a flash you have your lips wrapped around the straw and suck <i>hard</i>.");
	
	chars["ILARIA"].cockHoleChange(0);
	
	output("\n\nYour effort almost makes you choke on her seed. Her cum doesn’t even come in loads, it just jets into your mouth as a high-pressure stream of hot, thick cream that you’re forced to chug lest it spill from your lips. Even so, you don’t let up on sucking it straight out of her churning balls for even a second. Her voice comes out in desperate, breathless utterances and wordless moans, the vibrators inside her keeping her trapped in endless orgasm.");
	output("\n\nThe flood of cum gushing into your mouth and down your overworked throat certainly <i>feels</i> endless, your stomach swelling with the sheer amount of her seed you’re swallowing down. It seems like she’ll never stop, and you’re not sure either of you want her to. You can feel her ass flexing in your grip, straining and squeezing down on the buzzing vibe set against her overactive prostate.");
	output("\n\n<i>“Cuh- can’t, stop,”</i> Ilaria pants. <i>“Nnnnnnngh!”</i>");
	output("\n\nFeeling overwhelmed, you let your concentration lapse for a moment and the straw slips past your lips and almost down your throat before you realize. Ilaria’s prodigious offering pumps straight down your unresisting throat, your gag reflex long since subdued in the wake of her ridiculous outpouring. By the time you get yourself repositioned your stomach has swollen a few extra inches outward.");
	output("\n\nWhen you finally enter the home stretch, it feels like you’ve both won. Shuddering violently, Ilaria leans back and spreads her legs wide with her head tilted back to look at the ceiling, relaxing at last. She pants while you dutifully suck every single last remnant out of her, letting out a long, tired moan when you’re done and withdraw your little straw.");
	output("\n\n<i>“Oh </i>man<i>,”</i> Ilaria huffs, breasts jiggling while she takes deep breaths. <i>“I do not regret letting you do that at all. I’ve never felt so light in my life!”</i>");
	output("\n\nAs if to emphasize the point, she puts her hand between her legs and gives her balls a gentle squeeze. You feel warmth splatter across your nose and blink in surprise, earning an abashed giggle from the bunnywoman.");
	output("\n\n<i>“Whoops! Sorry sugar. I guess I’ve always got a little left in the tank! Lemme get that for ya,”</i> she says, bending down to lick it off your cheek. <i>“Thanks for the suckjob, babe. I’ll meet you back outside after I get cleaned up!”</i>");
	IncrementFlag("ILARIA_CUMSUCKED_URETHRAL");
	processTime(20);
	pc.lust(10);
	chars["ILARIA"].setPerkValue("Fixed CumQ", 1, 15000);
	pc.loadInMouth(chars["ILARIA"]);
	chars["ILARIA"].setPerkValue("Fixed CumQ", 1, 50000);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Munch Pussy
//Help yourself to a whole heaping helping of Ilaria’s pussy.
public function munchIlariasPussy():void
{
	clearOutput();
	showIlaria(true);
	author("Savin");
	output("You saunter forward, licking your lips as the sweet scent of a pussy begging to be bred wafts up to your [pc.nose]. Seeing you coming, Ilaria steps up and into the stirrups of the cock-milker, leaving her knees bent forward and body resting against the bulk of the machine with her ass thrust back towards you. Her snowy poof-ball tail wiggles gleefully when your hands cup her plump buttocks, digging your fingers into the bunny’s doughy cheeks and spreading them apart.");
	output("\n\n<i>“Oooh, that feels nice,”</i> she murmurs breathily, though you’re not sure if she’s talking to you or the milker or both. Either way, you can hear the machine working on her, a pneumatic <i>thump-thump-thump</i> that reminds you of a strong, soothing heartbeat. Ilaria moans openly, chewing her lip and rocking against the stirrups and your hands, all but trembling already. You let a hand play down, brushing two fingers through the meaty cleft of her quim before reaching in and groping her swollen balls.");
	output("\n\nIlaria gasps, breath catching, then all but melts into moans and little wiggles, letting you roll her hefty testes between your fingers. They’re well and away bigger than a normal human’s, that’s for sure, like a pair of meaty grapefruits, so liquid-swollen that they compress and quake at your touch. A few squeezes and rough caresses have the bunny-girl trembling, knees buckling - the only thing keeping her upright are the stirrups, and your other hand firmly secured on her hip. You keep that up a moment more and are finally rewarded by a gasping cry, and then a liquid <i>squirt</i>ing sound. A thick flow of white bunny-cream shoots into the suction cup and then up the slender tube into the milker - and once it starts, the deluge doesn’t stop. The machine keeps sucking, and Ilaria seems to have more to give than a pent-up kui-tan!");
	output("\n\nNow that she’s gotten started, you slip down to your [pc.knees] behind her, spreading her quivering ass-cheeks to size up her sex. Ilaria’s pussy is a glistening rose-pink, with thick lips already glazed with her excitement. A gumdrop-like clit sits tucked just under her draining balls, and opposite it, a dark, winking star of a tail-hole just waiting to be violated.");
	if(!pc.hasCock()) output(" If only you had a cock or two...");
	output(" You slide your fingers back through the cleft of her pussy, spreading her thick lips just enough that you can poke your [pc.tongue] into her hot, clenching depths. Ilaria’s back arches, muscles gripping down around your intruding appendage, and you watch as the inside of the milker’s cup is completely coated by a sudden rush of milky cream.");
	output("\n\n<i>“That’s the stuff!”</i> the modded lagomorph swoons, thrusting forward against the milker. <i>“Deeper! Deeper, now!”</i>");
	output("\n\nYou dig deeper. Spreading Ilaria’s cheeks as wide as they’ll go, you dig your face into her hefty rump and thrust into her juicy slit. The bunny gasps and squirms, grinding her ass back against you to get more and more of your wriggling tongue inside her. The bunny’s fuck-tunnel is luridly wet already, and starts squirting when you drill into it, smearing your cheeks with a glaze of her aromatic juices.");
	output("\n\nBetween the cock-milker and your manual ministrations, Ilaria’s caught between two unyielding sources of pleasure. She’s practically boneless in her motions now, undulating and thrusting weakly, able to accomplish very little but to make her endless orgasm even more overwhelming. But that’s not enough for you... not when there’s so much more you could be subjecting her to. With a mischievous grin, you reach a hand to the remote clipped to Ilaria’s thigh-highs and roll your thumb around the circular intensity tuner.");
	output("\n\nYour [pc.tongue] gets a sudden thrill as the bullet vibe hums to life, sending trembling vibrations through the bunny-girl’s pussy. She yelps, arching her back and squeezing her eyes shut as one vibrator after another comes to life. The bullet peeking out of her tail-hole starts buzzing around, and you can feel the cock-ring thrumming around her turgid knot. Though her heaving breasts are well out of sight, you can only imagine the pair of pasties she’s wearing are going to work on her big pink nipples. Too bad her milker doesn’t have something to take care of those milky babies!");
	output("\n\nNot that she needs even <i>more</i> pleasure. Ilaria throws her head back with a cry of <i>“C-c-cumming!”</i> Even though she’s been pumping out jizz this whole time, you can feel her muscle spasms and pussy-squirts getting more and more desperate and intense as you ramp up the buzzers to their zenith. Her hips piston like mad, desperately jackhammering the milker like it’s a bitch in heat, and she’s the station’s alpha stud.");
	if(pc.hasVagina()) 
	{
		output("\n\nMmm, speaking of her being a big, virile stud... she’s got more than enough in that damn milker already. It would be easy to give that throbbing red rocket a yank out of the milker, and into your needy pussy...");
		processTime(12);
		pc.lust(25);
		//[Get Creampie] [Oral Finish]
		clearMenu();
		//[Get Creampie]
		if(pc.hasVagina()) addButton(1,"Get Creampie",collectACreampie,undefined,"Get Creampie","Get some bunny cream injected directly.");
		else addDisabledButton(1,"Get Creampie","Get Creampie","You need a vagina for this.");
		//[Oral Finish]
		addButton(0,"Oral Finish",oralFinishTheBunBunBun,undefined,"Oral Finish","Use your mouth to drive this lusty bun over the edge!");
	}
	else addButton(0,"Next",oralFinishTheBunBunBun);
}

//[Get Creampie]
//Get some bunny cream injected directly.
public function collectACreampie():void
{
	clearOutput();
	showIlaria(true);
	author("Savin");
	var x:int = rand(pc.totalVaginas());
	output("You hop up and grab Ilaria’s cock, squeezing it through the suction cup. <i>“Not yet,”</i> you command, slipping around the buckled-in bunny and swinging your [pc.leg] over the edge of the milking stall, presenting your [pc.butt] to the cum-drained lagomorph. She lets out a little whimper, thrusting weakly against your hand while you ");
	if(!pc.isCrotchExposed()) output("strip down and ");
	output("angle her captive shaft towards your [pc.cunt " + x + "].");

	output("\n\n<i>“H-hurry if you want it!”</i> she whines, biting her lips and grabbing your [pc.hips] in both hands. <i>“Gotta cum! Gotta cum so much so bad oh man!”</i>");
	output("\n\nYou yank the suction cup off her veiny red cock and let the desperate bunny do the rest. She grabs you and thrusts forward with all her might, bucking you up against the milker’s side and spearing you on her cock. Your [pc.cunt " + x + "] spreads open for her, eagerly accepting all six inches of ausar-meat, and the gush of wet heat from her still-spurting tip.");
	pc.cuntChange(x,chars["ILARIA"].cockVolume(0));
	output("\n\n<i>“Hold on for me, babe!”</i> she grunts, thrusting hard against your [pc.butt] and filling your slit with her steamy seed. Ilaria’s fist-sized knot pounds against your lower lips, demanding entrance, and she’s already pumped you full of so much cummy lube that your body can’t help but assent. This time it’s you crying out, mouth twisting open in pleasure and shock as the bunny-babe’s knot ties you, and her hands bend you completely over the milker while her hips keep grinding, thrusting with what little give and take she can still manage while buried near to the hilt.");
	output("\n\nThe vibrating cock-ring around her bitch-breaker hits a nerve deep inside you, pressing ");
	if(pc.hasCock() && pc.balls == 0) output("at once against your g-spot and through the walls of your pussy against your [pc.balls]");
	else if(pc.hasCock()) output("at once against your g-spot and through the walls of your pussy against your prostate");
	else output("against your most sensitive spot");
	output(". Your eyes go wide, and your cry of pleasure kicks up to an even higher register - one of sudden, unexpected orgasm.");

	output("\n\n<i>“That’s right. C-cum for me! Take all that cream!”</i> Ilaria moans, bending over you, pressing her tits into your back and wrapping her arms around your [pc.chest]. <i>“Take it all!”</i>");

	output("\n\nYour [pc.belly] feels like it’s swelling, bloating with the sheer volume of spunk you’re getting fucked full of. Oh, stars! You put a hand on your gut and moan, letting your clenching quim milk out every last drop from the bunny.");
	if(pc.hasCock()) output(" Your partner catches onto your orgasm just before it’s too late, and grabs the cock-milker’s cup. With a gasp, you feel its pneumatic, sucking seal form around your member, and suddenly you’re cumming, pumping a fat wad of [pc.cum] right into the milker’s tubes!");

	output("\n\nYour orgasm is hard and fast, every trembling spasm punctuated by your body being hammered from behind by the lusty bunny. You rock forward and back on your [pc.knees], rubbing your full belly against the cold metal until she’s finally finished, slowly calming down to a mere trickle of spunk flooding your [pc.cunt " + x + "].");

	output("\n\n<i>“Oh... oh wow oh wow!”</i> Ilaria giggles, resting against your back. <i>“You’re the best cum-dump a girl could ask for! Not to mention you eat pussy like a champ!”</i>");

	output("\n\nShe reaches down and ");
	if(pc.bellyRating() >= 45 && pc.isPregnant()) output("pats your bloated belly. <i>“Sorry, kids. Hope you don’t mind a little extra stuffing in there!”</i>");
	else output("squeezes your [pc.butt] - just hard enough to make a little trickle of white squirt around her knot.");
	//if Ilaria preggers & showing:
	if(chars["ILARIA"].bellyRating() >= 20) output(" She shifts slightly, resting the pregnant swell of her belly on your back a little more comfortably.");
	output(" <i>“Now we wait for my little bitch-breaker here to calm down. Try not to move too much... or do anything to make me horny again... or we’re gonna be here all night! One good-bad thing about all that ‘nuki cream I took: these balls’ll be recharged before you can blink!”</i>");

	processTime(20);
	pc.orgasm();
	pc.loadInCunt(chars["ILARIA"],x);
	processTime(35);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Oral Finish]
//Use your mouth to drive this lusty bun over the edge!
public function oralFinishTheBunBunBun():void
{
	clearOutput();
	showIlaria(true);
	author("Savin, King of Slutpuppies");
	output("You dig your fingers into those big breeder hips of hers and thrust your [pc.tongue] as deep into Ilaria’s fuckbox as you possibly can. She squeals in pleasure, knuckles going white around the handholds on her milker; you feel a sudden clench on her twat, and then the bunny’s cries of pleasure are echoing off the walls all around you.");
	output("\n\n<i>“Yeeeessss!”</i> she shrieks, fucking the milker as hard as she can, and dumping what looks like a solid gallon of pearlescent cream into its hungry suckers. <i>“Take it take it take it all!”</i>");
	output("\n\nYou let your hands wander up and grab her free-swinging balls, squeezing the now well and truly drained orbs to make sure every last drop squirts out that throbbing red pecker. Her body quickly goes rigid, then limp, then completely liquid - accompanied by a final, potent squirt of musky fem-cum onto your cheeks.");
	output("\n\nYou grin and turn off the vibes and milker, letting the machines slowly wind down their assault on Ilaria’s senses. When they’re finished, she moans and shudders, trying and failing to untangle herself from the milker’s stirrups. <i>“Stars above, that never gets old!”</i> she murmurs, finally propping herself up on her elbows. <i>“That’s enough cream for... oh, the rest of the shift, if none of my regulars come through. Better find some more ‘nuki cream for a quick refill...”</i>");
	output("\n\nThe bunny giggles and detaches herself from the machine with a loud <i>POP</i> that leaves her shivering, knees buckling. <i>“Oof. You, uh, you go on out, babe. I’ve gotta... catch my breath.”</i>");
	processTime(5);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Pound Her
//Onecock Tooltip: Ilaria’s already hooked up and presenting - go ahead and slide into the lusty bunny’s welcoming hole while she cums buckets into her milker.
//2+Cock Tooltip: Ilaria’s presenting two fine-looking holes to you - go ahead and pound both of them in while she dumps a fat load of bunny cream into her milker.
//var y:int = pc.cockThatFits2(chars["ILARIA"].vaginalCapacity(0));
public function poundIlariaLikeMad():void
{
	clearOutput();
	showIlaria(true);
	author("Savin, King of Slutpuppies");

	var x:int = pc.cockThatFits(chars["ILARIA"].vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = pc.cockThatFits2(chars["ILARIA"].vaginalCapacity(0));
	if(pc.cockTotal() == 1) y = -1;

	output("That’s an offer you can’t exactly refuse.");
	output("\n\nYou ");
	if(!pc.isCrotchExposed()) output("strip off your [pc.gear] and ");
	output("close the distance, grabbing your [pc.cock " + x + "]");
	if(y >= 0) output(" in one hand and your second shaft in the other");
	else output(" in one hand, and Ilaria’s heart-shaped ass with the other");
	output(". She gasps as your [pc.cockHead " + x + "] presses against her clenching hole, but it turns into a low, husky moan and a wiggle of her ample hips, grinding back against your crotch.");
	output("\n\n<i>“Oooh, gonna get it from the front and back, huh?”</i> the bunny-babe croons, giving you a playful wink over her shoulder. <i>“My favorite! Give it to me, sweet thing - hard as you can!”</i>");
	output("\n\nWell, if she insists. You rub your crown");
	if(y >= 0) output("s");
	output(" against her pussy");
	if(y >= 0) output(" and ass");
	output(", slowly adding pressure until the meaty pink lips of her pussy spread open. She’s a sultry wet mess inside, kissing your cockhead as you slowly press forward. ");
	if(y >= 0) output("Her ass, though, presents a more difficult prospect. Ilaria’s breath catches when you start prodding her tail-hole, and she whines something about <i>“H-hey! Wrong hole...”</i> but you don’t let that stop you. A little loving in that tender ass of hers, and more importantly, on her anal g-spot, is going to go a long way towards milking all that sweet cum out of her. It takes some doing, and a few quick dobs of spit-lube, before you’re finally able to spread her out around your [pc.cockHead " + y + "]. ");
	output("You sink into her, slowly at first, but picking up speed as she learns to relax a little around your entrance.");
	pc.cockChange();

	output("\n\n<i>“That’s the stuff, baby,”</i> she murmurs, arching her back and groping at one of her breasts. Ilaria’s cock throbs visibly, bouncing up and down to the beat of your crotch slapping at her full cheeks. You’ve only just hilted yourself when you feel her muscles start squeezing down, and then with a shuddering gasp, you see the first squirt of pearly cream jet out of Ilaria’s red rocket, only to be sucked away in an instant by the milker.");

	output("\n\nOnce you open that floodgate, there’s no closing it. Ilaria starts moaning, bucking her hips against the milker, which doubles to act like bouncing on your cock");
	if(y >= 0) output("s");
	output(". You sink your fingers into her hips, guiding her movements; she leans back and gives you a kiss over her shoulder, pulling you into the embrace by your [pc.hair]. Her tongue plays across your [pc.lips]; your [pc.cock " + x + "] spreads her wide, caressing her ");
	if(chars["ILARIA"].isPregnant()) output("full ");
	output("womb. Spunk all but pours out of her the longer you go, milked out in a constant stream of hot cream from the bunny-girl’s swollen balls.");

	output("\n\nWell, you’re back here for one reason, you remind yourself: to help Ilaria milk out every drop of that bunny-spunk. As nice as making out and grinding in her ");
	if(y >= 0) output("ass and ");
	output("pussy is, you’re not doing your job until you’ve got her bent over this machine and going crazy on your cock like a bitch in heat. You plant a hand between her shoulderblades and push her down, making her grip the milker’s hand-holds again");
	if(chars["ILARIA"].bellyRating() >= 25) output(" and wiggle her [ilaria.belly] around, trying to get comfortable wedged between you and the machine");
	output(".");

	output("\n\nHer heavy balls swing back and forth with the impacts of your crotch on her ass, slapping weightily against your [pc.thighs], and her poof-ball tail wiggles ninety miles an hour. Seeing the way it moves, buzzing ecstatically on her rump, gives you an idea. Between hilt-deep thrusts, you reach down to the top of one of Ilaria’s stockings and grab the pink controller clipped under the side-bow, rolling your thumb along the setting dial. Ilaria gasps, going as rigid as the cock");
	if(y >= 0) output("s");
	output(" spearing her. All the vibrators patched and clipped to her body buzz to life at once, sending shuddering quakes all through her lusty flesh.");

	output("\n\nThe busty bunny lets out a gasping cry and cums harder, plastering the inside of her milker cup with white cream. You can feel the reverberations in your ");
	if(y >= 0) output("[pc.cocks]");
	else output("[pc.cock " + x + "]");
	output(", surrounded by quivering, drooling pussy-flesh");
	if(y >= 0) output(" and trapped in the crushingly-tight prison of Ilaria’s ass");
	output(". The bullet vibe" + (y >= 0 ? " lodged in her hole doubles" : "s lodged in her holes double") + " down, working the both of you at once; the other toys on her balls, nips, and cock contribute only to your partner’s private pleasure and the growing deluge of cock-milk flooding into the machine.");
	output("\n\nYou don’t have to worry about getting Ilaria off at this point - she’s completely engrossed in pleasures of the flesh - so you’re left free to hammer away to your heart’s content, thrusting into her inviting, constantly-orgasming body as hard as you like. Between her climactic clenches and spasms, and the added rumble of the many vibrators, your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" subjected to a steady barrage of milking sensations that seem tailor-made to drain you, just as they’re doing your partner.");

	output("\n\nAnd just like Ilaria, you’re soon ready to blow your load.");

	output("\n\nThe way your [pc.cock " + x + "] starts throbbing, swelling with [pc.cum], tips Ilaria off just before the moment of truth. She moans and pushes back against you, taking you as deep inside as she can. <i>“Give it to me! Fill me up");
	if(chars["ILARIA"].isPregnant() && chars["ILARIA"].bellyRating() >= 25) output(" until I’m like, double pregnant!");
	else output(" like the cum-hungry slut I am!");
	output(" Y-yeah!”</i>");

	output("\n\nYou hilt her, and let nature take its course. With a grunt of pleasure and relief, you feel a surge of [pc.cum] travelling up your [pc.cock " + x + "] and unleashing into the waiting embrace of Ilaria’s ");
	if(y < 0) output("womb");
	else output("bowels, quickly followed by a second shot that floods her womb with your seed");
	output(". Your violent, orgasmic thrusts pound Ilaria into the machine, making her body rock forward on her [ilaria.belly]. The milking machine buzzes and rumbles, and she shrieks again in pleasure - you can see a constant, thick draw of cum from her to the machine, what looks like a solid gallon between your first pussy-filling spurt and the last.");

	output("\n\n<i>“Oof!”</i> Ilaria groans, struggling up to rest on her elbows. She switches the milker and vibrators off, but you’re both still squirting aftershots into your respective cock-sheaths. <i>“You really know how to get the most out of a girl, sweetheart! Gonna have to find some ‘nuki cream after a draining like that... my balls feel like black holes!”</i>");

	output("\n\nYou pull out and give the bunny-babe a smack on the ass, just hard enough to make a spurt of [pc.cumColor] eject from her parted pink lips and drool down her thighs. Ilaria giggles and wipes it up, cleaning it off her fingers with a long lick before starting to detach herself from the machine. <i>“Go on out, babe. I’ve gotta get cleaned up.”</i>");

	processTime(30);
	chars["ILARIA"].loadInCunt(pc, 0);
	//tryKnockUpIlaria(); moved to Ilaria.loadInCunt override function
	if(y >= 0) chars["ILARIA"].loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Appearance
//Unlocked along with sex options
public function ilariaAppearance():void
{
	clearOutput();
	showIlaria();
	output("Ilaria Ilgade appears at a glance to be a humanoid with rabbit-morph mods: she stands on digitigrade legs, covered from padded paws to the upper thighs in downy white fur. Her arms are likewise covered, as are the pair of perky, rabbit-like ears perched atop her head, and the cotton-ball tail wiggling excitedly just above her heart-shaped ass. A head of messy, ice-blue hair hangs down just past her shoulders in a wild and unkempt mane, which only seems to emphasise her reddish-brown eyes.");
	output("\n\nThe only hint as to her original race is tucked away below the belt. Or under skirt, rather.");
	output("\n\nIlaria’s wearing a show-bunny outfit like out of an old skin-tease magazine: thigh-high stockings with ribbon bows, a short skirt that leaves a wide gulf of bare flesh between them, and a black push-up corset that tightly hugs and emphasizes her already impressive rack. Without it, you’d guess the curvy bunny’s carrying around a pair of F-cups breasts, and the way they slosh and jiggle with every step leaves little doubt in your mind she’s made sure they’re nice and milky. It’s a safe bet that she bakes with her own milk!");

	if(chars["ILARIA"].bellyRating() >= 25)
	{
		output(" Her corset’s been modified with a seam down the middle front, allowing her [ilaria.belly] to show through.");
		if(chars["ILARIA"].isPregnant()) output(" She’s almost always got a hand on it, now, idly caressing herself whenever she has a free moment.");
	}
	else output(" Her outfit is rounded out by arm-length black gloves and a stand-alone collar and bow tie around her neck, with a name tag subtly clipped just beneath the tie.");

	output("\n\nUnder her clothes, Ilaria is packing a thick, tapered shaft of crimson canine meat, about six inches long when hard, but connected to a knot and pair of balls much, much larger than her otherwise average shaft would imply. When aroused, her knot is nearly fist-sized, and even when drained dry, her balls are easily the size of grapefruits. She’s clearly had a lot of mod work done down there, making her a one-woman cum-factory. In addition to her impressive masculinity, though, Ilaria also has a particularly stretchy, wet pussy tucked between her legs, with meaty lips and a rosy pink exterior, and of course, a tight, dark tail-hole between her jiggling butt-cheeks, right where it belongs.");
	clearMenu();
	addButton(0,"Next",approachIlaria);
}

//return 0-6 for number of babies she's impregnated with
//Also does the mechanical impregnation
public function tryKnockUpIlaria():int
{
	if(!ilaria.isPregnant())
	{
		if(pc.virility() == 0 || ilaria.fertility() == 0) return 0;
		var x:Number = (pc.virility() + ilaria.fertility())/2;
		var score:Number = (1 - Math.exp(-0.38*x))*10000;
		
		//roll for pregnancy
		if(rand(10000) <= score)
		{
			flags["ILARIA_PREG_TIMER"] = 0;
			pc.clearRut();
			
			x /= 2;
			
			//6 Babies!
			if(rand(10000) <= ((Math.atan(x - 5) + Math.PI/2)/Math.PI)*10000)
			{
				flags["ILARIA_NUM_BABIES"] = 6;
			}
			//5 Babies!
			else if(rand(10000) <= ((Math.atan(x - 4) + Math.PI/2)/Math.PI)*10000)
			{
				flags["ILARIA_NUM_BABIES"] = 5;
			}
			//4 Babies!
			else if(rand(10000) <= ((Math.atan(x - 3) + Math.PI/2)/Math.PI)*10000)
			{
				flags["ILARIA_NUM_BABIES"] = 4;
			}
			//3 Babies!
			else if(rand(10000) <= ((Math.atan(x - 2) + Math.PI/2)/Math.PI)*10000)
			{
				flags["ILARIA_NUM_BABIES"] = 3;
			}
			//2 Babies!
			else if(rand(10000) <= ((Math.atan(x - 1) + Math.PI/2)/Math.PI)*10000)
			{
				flags["ILARIA_NUM_BABIES"] = 2;
			}
			//1 Baby!
			else
			{
				flags["ILARIA_NUM_BABIES"] = 1;
			}
			
			//Lets roll for genders 50/50
			flags["ILARIA_BABY_GENDERS"] = new Array();
			for(var i:int = 0; i < flags["ILARIA_NUM_BABIES"]; i++)
			{
				if(rand(2) == 0) flags["ILARIA_BABY_GENDERS"].push("M");
				else flags["ILARIA_BABY_GENDERS"].push("F");
			}
			
			processTime(1);
			return flags["ILARIA_NUM_BABIES"];
		}
	}
	return 0;
}

public function ilariaBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var traitChar:Creature = chars["PC_BABY"];
	var c:UniqueChild = new IlariaUniqueChild();
	
	c.RaceType = GLOBAL.TYPE_CANINE;
	// 50% Male or Female
	for(var i:int = 0; i < flags["ILARIA_NUM_BABIES"]; i++)
	{
		if(flags["ILARIA_BABY_GENDERS"][i] == "M") c.NumMale += 1;
		else c.NumFemale += 1;
	}
	
	// Race modifier (if different races)
	c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
	
	// Adopt father's colors at random (if applicable):
	if(rand(2) == 0) c.skinTone = traitChar.skinTone;
	if(rand(2) == 0) c.lipColor = traitChar.lipColor;
	if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
	if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
	if(traitChar.hairColor != "NOT SET" && rand(2) == 0) c.hairColor = traitChar.hairColor;
	if(traitChar.furColor != "NOT SET" && rand(2) == 0) c.furColor = traitChar.furColor;
	
	c.MaturationRate = 1.0;
	c.BornTimestamp = birthTimestamp;
	ChildManager.addChild(c);
	
	StatTracking.track("pregnancy/ilaria sired", flags["ILARIA_NUM_BABIES"]);
	StatTracking.track("pregnancy/total sired", flags["ILARIA_NUM_BABIES"]);
	StatTracking.track("pregnancy/total day care", flags["ILARIA_NUM_BABIES"]);
	
	if(flags["ILARIA_TOTAL_KIDS"] == undefined) flags["ILARIA_TOTAL_KIDS"] = 0;
	flags["ILARIA_TOTAL_KIDS"] += flags["ILARIA_NUM_BABIES"];
	flags["ILARIA_PREG_TIMER"] = undefined;
	flags["ILARIA_NUM_BABIES"] = undefined;
	flags["ILARIA_BABY_GENDERS"] = undefined;
	flags["ILARIA_PREG_EMAIL1"] = undefined;
	ilaria.bellyRatingMod = 0;
}

public function processIlariaPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(ilaria.isPregnant())
	{
		flags["ILARIA_PREG_TIMER"] += totalDays;
		
		if(flags["ILARIA_PREG_EMAIL1"] == undefined && flags["ILARIA_PREG_TIMER"] >= 7)
		{
			var mailTimestamp:int = (GetGameTimestamp() + deltaT - (flags["ILARIA_PREG_TIMER"] * 24 * 60) + (7 * 24 * 60));
			resendMail("ilaria_preg1", mailTimestamp);
			flags["ILARIA_PREG_EMAIL1"] = 1;
			ilaria.bellyRatingMod = 10;
		}
		if(flags["ILARIA_PREG_TIMER"] >= 180)
		{
			var birthTimestamp:int = (GetGameTimestamp() + deltaT - (flags["ILARIA_PREG_TIMER"] * 24 * 60) + (180 * 24 * 60));
			resendMail("ilaria_preg2", birthTimestamp);
			ilariaBirth(birthTimestamp);
		}
		
		//belly stuff
		if(flags["ILARIA_PREG_TIMER"] > 7 && (int(flags["ILARIA_PREG_TIMER"]) % 5) == 0) ilaria.bellyRatingMod += (flags["ILARIA_NUM_BABIES"] > 3 ? 1.5 : 1);
	}
}

public function ilariaPreg1EmailText():String
{
	var eText:String = "";
	
	eText+=(!(flags["ILARIA_TOTAL_KIDS"] > 0) ? "Hope this is the right address, otherwise I’m gonna be real embarrassed!" : "Well, I’m emailing you, so I guess you know what that means by now~");
	eText+="\n\nI just got back from the station clinic. Missed a certain regular ausar-girl function, and... well... somebody’s going to be a daddy! I’d say “whoops” or something, but I’m just too excited! Yay! " + (!(flags["ILARIA_TOTAL_KIDS"] > 0) ? "I’ve always wanted to be a mom, even if it’s a happy lil’ accident with my favorite cock-milking assistant. I hope you’re not freaked out, but I’ve heard about that nursery upstairs... so we’ve got that taken care of, right? It’s all gonna be okay! " : "You keep breeding me, and I’ll keep pumping ‘em out, babe! ") + "Just thinking about swelling up all gravid and full of our litter is making me rock hard with anticipation!!!";
	eText+="\n\nCome on by the bakery and we’ll have some sweets to celebrate!";
	eText+="\n\n<3 <3 <3 <3 <3";
	eText+="\n-Ily";
	
	return doParse(eText);
}

public function ilariaPreg2EmailText():String
{
	var eText:String = "";
	
	eText+="Hello, [pc.Mr]. Steele, I’m writing on behalf of Ms. Ilaria Ilgade, who gave me this address and asked me to inform you that she arrived here at the medical center a few minutes ago, going into labor. Our staff is already tending to her, and according to our scans, you are about to be the father of " + flags["ILARIA_NUM_BABIES"] + " " + (pc.isAusar(true) ? "" : "half-") + "ausar pups. Per her request, they will be sent to the Steele Tech nursery after they and Ilaria have recovered. The mother should be able to leave later today.";
	eText+="\n\nCongratulations!";
	eText+="\n\nNurse Carter";
	eText+="\nTavros Residential Clinic, Deck 45";
	eText+="\n<i>Healthier living for tomorrow.</i>";
	
	return doParse(eText);
}
/*
//Pregshit
output("\n\n//AAaaaahhhhhhh");
output("\n\nIlaria has a very very high Fertility rating, and a low-average Virility rating. She has a generic human-ish pregnancy, lasting 6 months (ausar yay). She’ll either produce ausar or half-ausar, depending on the PC’s race (half if not ausar, full if the PC is at least half ausar themselves). Her litters are rand(2-6) pups.");
output("\n\n//Probably need to disable her knocking the PC up until we get the generic human-ish many-month pregnancy sorted out.");


output("\n\nIlaria Gets Knocked Up");
output("\n\n//Email to PC ~a week after a successful knocking-up check. Next time the PC orders something at the bakery, it’s free.");

output("\n\nFrom: Ilaria Ilgade (Ilaria@BunBunBakery.com)");
output("\n\nSubject: Surprise, Surprise!");

output("\n\nHi!");

output("\n\n{First time: Hope this is the right address, otherwise I’m gonna be real embarrassed! //else: Well, I’m emailing you, so I guess you know what that means by now~}");

output("\n\nI just got back from the station clinic. Missed a certain regular ausar-girl function, and... well... somebody’s going to be a daddy! I’d say <i>“whoops”</i> or something, but I’m just too excited! Yay! {First: I’ve always wanted to be a mom, even if it’s a happy lil’ accident with my favorite cock-milking assistant. I hope you’re not freaked out, but I’ve heard about that nursery upstairs... so we’ve got that taken care of, right? It’s all gonna be okay! //else: You keep breeding me, and I’ll keep pumping ‘em out, babe!} Just thinking about swelling up all gravid and full of our litter is making me rock hard with anticipation!!!");

output("\n\nCome on by the bakery and we’ll have some sweets to celebrate!");

output("\n\n<3 <3 <3 <3 <3");
output("\n\n-Ily");


output("\n\nIlaria Gives Birth");
output("\n\n//Email to PC when Ilaria pops. Shut down the Bakery for the rest of the day.");

output("\n\nFrom: Nurse Amanda Carter [A_Carter@TavrosMedical.net]");
output("\n\nTo: [pc.eamil]@SteeleTech.corp");
output("\n\nSubject: Ilaria Ilgade");

output("\n\nHello, [pc.mr]. Steele, I’m writing on behalf of Ms. Ilaria Ilgade, who gave me this address and asked me to inform you that she arrived here at the medical center a few minutes ago, going into labor. Our staff is already tending to her, and according to our scans, you are about to be the father of {X} {half-}ausar pups. Per her request, they will be sent to the Steele Tech nursery after they and Ilaria have recovered. The mother should be able to leave later today.");

output("\n\nCongratulations!");

output("\n\nNurse Carter");
output("\n\nTavros Residential Clinic, Deck 45");
output("\n\n<i>Healthier living for tomorrow.</i>");


output("\n\nIlaria - PC talks to for the first time during each pregnancy.");
output("\n\n<i>“[pc.name]!”</i> the bunny-babe yips, bounding over and hopping into your arms. She gives you a kiss and grabs your hand, directing it down to her [ilaria.belly]. <i>“I’m glad you came by. Really glad... my virile stud.”</i>");

output("\n\nShe giggles, and nuzzles herself under your arm. <i>“Sorry, I’m terrible about the whole ‘romance’ thing, but I’m definitely excited! Super duper extra excited! I’ve {never been pregnant before // been waiting for the next happy accident you left in my pussy to take root - the last time was awesome}!”</i>");

output("\n\nIlaria squeals excitedly, bouncing on her bunny-like heels. Her excitement is infectious, and soon you’re allowing her to guide you into a barstool and enticing whatever your favorite order from the menu is - her treat. Between her giddy ejaculations, you manage to {inform / remind} her of the nursery dedicated to you upstairs - she’s free to make use of its facilities during and after her pregnancy. That, she says, takes what little weight she’d been feeling off her shoulders: a place that’ll take care of her children while she works will make this all the sweeter for her.");

output("\n\n//Bakery Menu");

output("\n\nPC talks to Ilaria for the first time while carrying her pups");
output("\n\n<i>“Hey, [pc.name],”</i> Ilaria grins, sashaying over to you with that familiar, sexy high-heeled gait of hers and stretching out over the counter to plant a kiss on your cheek. <i>“You’re looking positively radiant today. How’s things, sweetie?”</i>");

output("\n\nYou shuffle awkwardly {in your seat // on your haunches} and tell Ilaria she might want to sit down. You’ve got some news for her.");

output("\n\n{If PC is visibly preggers:");
output("\n\n<i>“Don’t tell me!”</i> she gasps, looking between you and your [pc.belly]. <i>“That’s not... I didn’t knock you up, did I?”</i>");

output("\n\nWell, actually yeah, that’s pretty much exactly what she did.");

output("\n\n{Not visibly preggers:");
output("\n\nShe cranes her big bunny ears towards you. <i>“What’s up, babe?”</i>");

output("\n\nYou take her hand in yours and spill the beans: you’re pregnant. They’re hers.");
output("\n\n}");

output("\n\nIlaria blinks at you, then bursts out in a big, toothy smile. <i>“Really!? Ohmygod, [pc.name]!”</i> She tries to say something else, but it just devolves into an unintelligable, delighted squeal. She throws her arms around your neck and locks you in a death-grip of a hug, bouncing on her bunny-like feet.");

output("\n\n<i>“Ahhh! This is amazing! <b>AMAZING</b>!”</i>");

output("\n\nShe’s practically dancing, drawing every eye in the shop - as if her big ol’ jiggling tits didn’t serve that purpose already. Ilaria just grins at the voyeuristic patrons and announces, <i>“I’m gonna be a dad {again}!”</i>");

output("\n\nA round of applause starts up through the place, until your lover is beaming and you’re {low exhib: blushing //else: getting all hot and bothered} from the attention. When the crowd settles, Ilaria turns to you with another kiss. <i>“Now, how about we celebrate with some treats{first: while you tell me all about this famous Steele Tech nursery upstairs...}.”</i>");


*/
//should the steele preg talk trigger (will trigger for each new preg after a talk)
public function ilariaSteelePregTalkTrigger():Boolean
{
	if (flags["ILARIA_STEELE_PREG"] == undefined && pc.hasPregnancyOfType("IlariaPregnancy")) return true;
	if (pc.totalPregnanciesOfType("IlariaPregnancy") > flags["ILARIA_STEELE_PREG"]) return true;
	
	return false;
}
public function ilariaSteelePregTalk():void
{
	var firstTime:Boolean = true;
	if (StatTracking.getStat("pregnancy/ilaria births") > 0) firstTime = false;
	if (flags["ILARIA_STEELE_PREG"] != undefined) firstTime = false;
	flags["ILARIA_STEELE_PREG"] = pc.totalPregnanciesOfType("IlariaPregnancy");
	
	output("<i>“Hey, [pc.name],”</i> Ilaria grins, sashaying over to you with that familiar, sexy high-heeled gait of hers and stretching out over the counter to plant a kiss on your cheek. <i>“You’re looking positively radiant today. How’s things, sweetie?”</i>");
	output("\n\nYou shuffle awkwardly " + (pc.isTaur() || pc.isNaga() ? "on your haunches" : "in your seat") + " and tell Ilaria she might want to sit down. You’ve got some news for her.");
	
	if (pc.hasStatusEffect("Bulky Belly"))
	{
		output("\n\n<i>“Don’t tell me!”</i> she gasps, looking between you and your [pc.belly]. <i>“That’s not... I didn’t knock you up, did I?”</i>");
		output("\n\nWell, actually yeah, that’s pretty much exactly what she did.");
	}
	else
	{
		output("\n\nShe cranes her big bunny ears towards you. <i>“What’s up, babe?”</i>");
		output("\n\nYou take her hand in yours and spill the beans: you’re pregnant. They’re hers.");
	}
	
	output("\n\nIlaria blinks at you, then bursts out in a big, toothy smile. <i>“Really!? Ohmygod, [pc.name]!”</i> She tries to say something else, but it just devolves into an unintelligable, delighted squeal. She throws her arms around your neck and locks you in a death-grip of a hug, bouncing on her bunny-like feet.");
	output("\n\n<i>“Ahhh! This is amazing! <b>AMAZING</b>!”</i>");
	output("\n\nShe’s practically dancing, drawing every eye in the shop - as if her big ol’ jiggling tits didn’t serve that purpose already. Ilaria just grins at the voyeuristic patrons and announces, <i>“I’m gonna be a dad" + (firstTime ? "" : " again") + "!”</i>");
	output("\n\nA round of applause starts up through the place, until your lover is beaming and you’re " + (pc.exhibitionism() < 10 ? "blushing" : "getting all hot and bothered") + " from the attention. When the crowd settles, Ilaria turns to you with another kiss. <i>“Now, how about we celebrate with some treats" + (firstTime ? " while you tell me all about this famous Steele Tech nursery upstairs..." : "") + ".”</i>");
}
//this is for Ilaria's kids and is similar to ausarPregnancyEnds but there are some minor differences due to being a named npc and not a generic parent
public function ilariaPregnancyEnds():void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass = pc.getStatusEffect("Ilaria Pregnancy Ends");
	
	if(se == null)
	{
		output("ERROR: Status effect “Ilaria Pregnancy Ends” does not exist!");
		output("\n\nThis was an erroneouse pregnancy and the issue has been corrected.");
		output("\n\n");
		chars["ILARIA"].pregnancyData[0].reset();
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var babym:Boolean = (se.value4 == 1);

	pc.removeStatusEffect("Ilaria Pregnancy Ends");
	
	output("Pain in your gut bends you over and fluid spills");
	if (pc.isCrotchExposed())
	{
		if (InShipInterior()) output(" onto the deck");
		else output(" onto the ground");	
	}
	else output(" into your [pc.lowerUndergarment]");
	output(". Alarm grips you as you feel your cervix dilate. With as much calm as you can muster, you consider the best course of action.");
	
	if (InShipInterior()) output("\n\nAs quickly as you can, you waddle into your room, switch the auto-medkit on in the bathroom, carefully place yourself on the bed" + (pc.isCrotchExposed() ? ", rip off your [pc.gear]" : "") + " and spread your [pc.thighs], biological imperative virtually ordering you what to do.");
	else if (InRoomWithFlag(GLOBAL.HAZARD))	output("\n\nGroaning at the timing, you shed your [pc.gear] and position yourself the best you can in the inhospitable and non-hospital-able terrain. The wish that you’d stayed somewhere indoors and safe hums through your thoughts like a mosquito, but there’s no helping it now - you’ll have to deliver on your own.");
	else output("\n\nAs quickly as you can, you waddle into the nearest restroom, grab the medkit drone off the wall (frontier bathrooms are thankfully readily equipped for this sort of thing), lock yourself in a cubicle and spread your [pc.thighs], biological imperative virtually ordering you what to do.");

	if (InRoomWithFlag(GLOBAL.HAZARD)) output("\n\n");
	else output("\n\nThe medkit drone monitors your pulse and places a large sheet beneath your thighs, instructing you to bear down rhythmically with soft, wordless beeps. ");
	output("Spasms wrack your pregnant body for the next hour, and your mind almost shuts down from the pain, operating on biological autopilot. There’s no relief when the first baby finally emerges via one gigantic clench, wailing heartily, none at all - because you know, from the weight and wriggling in your womb, that that’s simply one of " + num2Text(numChildren) + ".");
	if (InRoomWithFlag(GLOBAL.HAZARD)) output(" You grit your teeth and bear down again.");
	else output(" The drone hovers down, snipping the umbilical cord and cradling the child to one side whilst you grit your teeth and bear down again.");
	
	output("\n\nAt long last, in a sweaty daze of utter exhaustion, you’re looking down at your tiny children, curled up in your arms " + (pc.isLactating() ? "nursing hungrily on your [pc.boobs]" : "and whining hungrily") + ". They’re " + (pc.isAusar(true) ? "full " : "half-") + "ausars, and as predicted, you’ve given birth to " + num2Text(numChildren) + " of them, all safe and sound. Their coloration definitely reminds you of Ilaria, who deserves an email after all this, you suppose.");
	output("\n\nYou spend a little time with the newborns first, cleaning them and playing with their cute pointed toes and brushing their nascent fur, drawing little whinnies and whines out of them. Tiny " + (pc.isAusar(true) ? "paw-" : "") + "hands touch your face and chest, exploring the world despite their blindness. Eventually, though, reality intrudes. With a heavy heart, you call up the incubation drone, which arrives altogether too fast, and carefully load the newborn pups into its protected belly. You watch the shuttle disappear, comforting yourself with the knowledge that you’ll be able to see them again soon at the Nursery.");
	
	processTime(60 + ((10 + rand(10)) * numChildren));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//for AusarPregnancyHandler, this is generic ausar preg
public function ausarPregnancyEnds():void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass = pc.getStatusEffect("Ausar Pregnancy Ends");
	
	if(se == null)
	{
		output("ERROR: Status effect “Ausar Pregnancy Ends” does not exist!");
		output("\n\n");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var babym:Boolean = (se.value4 == 1);

	pc.removeStatusEffect("Ausar Pregnancy Ends");
	
	output("Pain in your gut bends you over and fluid spills");
	if (pc.isCrotchExposed())
	{
		if (InShipInterior()) output(" onto the deck");
		else output(" onto the ground");	
	}
	else output(" into your [pc.lowerUndergarment]");
	output(". Alarm grips you as you feel your cervix dilate. With as much calm as you can muster, you consider the best course of action.");
	
	if (InShipInterior()) output("\n\nAs quickly as you can, you waddle into your room, switch the auto-medkit on in the bathroom, carefully place yourself on the bed" + (pc.isCrotchExposed() ? ", rip off your [pc.gear]" : "") + " and spread your [pc.thighs], biological imperative virtually ordering you what to do.");
	else if (InRoomWithFlag(GLOBAL.HAZARD))	output("\n\nGroaning at the timing, you shed your [pc.gear] and position yourself the best you can in the inhospitable and non-hospital-able terrain. The wish that you’d stayed somewhere indoors and safe hums through your thoughts like a mosquito, but there’s no helping it now - you’ll have to deliver on your own.");
	else output("\n\nAs quickly as you can, you waddle into the nearest restroom, grab the medkit drone off the wall (frontier bathrooms are thankfully readily equipped for this sort of thing), lock yourself in a cubicle and spread your [pc.thighs], biological imperative virtually ordering you what to do.");

	if (InRoomWithFlag(GLOBAL.HAZARD)) output("\n\n");
	else output("\n\nThe medkit drone monitors your pulse and places a large sheet beneath your thighs, instructing you to bear down rhythmically with soft, wordless beeps. ");
	output("Spasms wrack your pregnant body for the next hour, and your mind almost shuts down from the pain, operating on biological autopilot. There’s no relief when the first baby finally emerges via one gigantic clench, wailing heartily, none at all - because you know, from the weight and wriggling in your womb, that that’s simply one of " + num2Text(numChildren) + ".");
	if (InRoomWithFlag(GLOBAL.HAZARD)) output(" You grit your teeth and bear down again.");
	else output(" The drone hovers down, snipping the umbilical cord and cradling the child to one side whilst you grit your teeth and bear down again.");
	
	output("\n\nAt long last, in a sweaty daze of utter exhaustion, you’re looking down at your tiny children, curled up in your arms " + (pc.isLactating() ? "nursing hungrily on your [pc.boobs]" : "and whining hungrily") + ". They’re " + (pc.isAusar(true) ? "full " : "half-") + "ausars, and as predicted, you’ve given birth to " + num2Text(numChildren) + " of them, all safe and sound. Their coloration definitely reminds you of the father.");
	output("\n\nYou spend a little time with the newborns first, cleaning them and playing with their cute pointed toes and brushing their nascent fur, drawing little whinnies and whines out of them. Tiny " + (pc.isAusar(true) ? "paw-" : "") + "hands touch your face and chest, exploring the world despite their blindness. Eventually, though, reality intrudes. With a heavy heart, you call up the incubation drone, which arrives altogether too fast, and carefully load the newborn pups into its protected belly. You watch the shuttle disappear, comforting yourself with the knowledge that you’ll be able to see them again soon at the Nursery.");
	
	processTime(60 + ((10 + rand(10)) * numChildren));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}