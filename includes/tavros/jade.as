//TOC:
//NORMAL JADE
//TENTACLE NIPS EXPANSION

/*Jade the Panda-Girl
Fiddly Bits
Original Race: Orchan, a lithe, hairless species with no nipples or breasts.
Got a pet space hamster and was amazed at how awesome fur feels. Got into furry stuff as a result of some poorly worded extranet searches.
Red, horizontally slit eyes, the only remnant of her original race.
Absolutely adores having "cushion for the pushin'," and likes the breasts her transformation gave her almost as much. Sadly they didn't come with nipples.
Had sensitivity treatments done to her breasts to compensate for her lack of nipples. Went a bit too far down that road and is now so sensitive that she can come from a ten minute grope.
Doesn't cover her breasts because anything rubbing on them drives her nuts. Besides, without nipples, it isn't even obscene by human standards.
Has a short muzzle and stubby tongue, though her tongue is rather thick and muscular for its size. Tongue is pink.
Lips and genitals are black, inside of cooch fades to bright pink
Pussy is very elastic AND wet, giving her a good capacity.
*/

//Fur Effect Shop Description
//The sign declared this store to be "Fur Effect," and you can see why. Your [pc.feet] sink ankle-deep into thick, pink shag. The plush, pink rug covers the entire floor of the shop, giving way to a fuzzy-looking maroon wall treatment. Even the light sources appear to be wispy, vase-bound feathers, emitting a steady rainbow glow. There are also dozens of pictures and holos of attractive looking furred beings in various poses. One showcases a slinky ferret-girl bending her entire body backwards into an 'o' in a display of supreme flexibility. Another is a floating, holographic cow-girl modelling a straining set of overalls. Behind it, there is a velvety countertop and hardlight projected register.

//Jade Addition
public function furEffectBonusFunction():Boolean {
	
	flags["NAV_DISABLED"] = undefined;
	
	if(flags["JADE_NIPPLE_TF_QUEUED"] == 1)
	{
		jadeUsesNippleMod();
		return true;
	}
	else if(MailManager.isEntryViewed("jade_dumplings") && flags["JADE_MUFFLINGS"] != -1 && (flags["JADE_MUFFLINGS"] == undefined || (!pc.hasStatusEffect("MufflingsCD") && rand(10) == 0))) 
	{
		jadeMuffStuffedDumplingsOffer();
		return true;
	}
	
	output("The sign declared this store to be “Fur Effect,” and you can see why. Your");
	if (pc.isNaga()) output(" snake-like tail sliters through");
	else if (pc.isGoo()) output(" gooey pseudopods squish into");
	else if (pc.legCount == 1) output(" [pc.foot] sinks ankle-deep into");
	else output(" [pc.feet] sink ankle-deep into");
	output(" thick, pink shag. The plush, pink rug covers the entire floor of the shop, giving way to a fuzzy-looking maroon wall treatment. Even the light sources appear to be wispy, vase-bound feathers, emitting a steady rainbow glow. There are also dozens of pictures and holos of attractive looking furred beings in various poses. One showcases a slinky ferret-girl bending her entire body backwards into an ‘o’ in a display of supreme flexibility. Another is a floating, holographic cow-girl modelling a straining set of overalls. Behind it, there is a velvety countertop and hardlight projected register.");
	
	showJadeBust();
	
	//Don't know her name yet.
	if(flags["KNOW_JADES_NAME"] == undefined) output("\n\nA pudgy-looking panda-girl is standing behind it, wearing nothing other than a snug green skirt and a smile. She waves reflexively, chirping, <i>“Welcome to Fur Effect! Let me know if I can help you with anything.”</i>");
	//Met Jade
	else output("\n\nJade, the pudgy panda-girl is minding her shop, as always. Still wearing her skirt and nothing else, she graces you with a radiant smile. <i>“Let me know if you need anything!”</i>");
	
	if(flags["KNOW_JADES_NAME"] == undefined) addButton(0,"Panda",approachJade);
	else addButton(0,"Jade",approachJade);
	return false;
}

public function showJade(nude:Boolean = false):void 
{
	showJadeBust(nude);
	showName("\nJADE");
}
public function showJadeBust(nude:Boolean = false):void 
{
	var nipBonus:String = "";
	if(chars["JADE"].hasTentacleNipples()) nipBonus = "_NIPS";
	if(!nude) showBust("JADE"+nipBonus);
	else showBust("JADE" + nipBonus + "_NUDE");
}

//NORMAL JADE

//Jade Approach
public function approachJade():void {
	clearOutput();
	showJade();
	// Nipple TF not completed!
	if(flags["JADE_NIPPLE_TF_QUEUED"] == undefined || flags["JADE_NIPPLE_TF_QUEUED"] < 2)
	{
		if(!chars["JADE"].hasFlatNipples()) chars["JADE"].breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_FLAT;
	}
	else if(flags["JADE_NIPPLE_TF_QUEUED"] >= 2)
	{
		if(!chars["JADE"].hasTentacleNipples()) chars["JADE"].breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_TENTACLED;
	}
	//First Time
	if(flags["KNOW_JADES_NAME"] == undefined)
	{
		flags["KNOW_JADES_NAME"] = 1;
		output("Before you even reach the counter, the generously-endowed woman leans over it to greet you, creating quite the valley of unbound cleavage as she extends her paw your way. <i>“Welcome to my shop! My name’s Jade. Who do I have the pleasure of greeting?”</i> She displays a dazzling, winsome smile that contains far more teeth than any human and blinks her exotic, horizontally slit eyes, both obvious remnants of her previous race. Such a visage would normally be unnerving, but on such a soft, friendly-looking girl, it’s hard to do anything but smile back and respond in kind.");
		//Nice
		if(pc.isNice()) output("\n\n<i>“I’m [pc.name]. Pleasure to meet you, Jade.”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("\n\n<i>“It’s nice to find someone bear-able on this station. I’m [pc.name].”</i>");
		//Ass
		else output("\n\nSomehow, you manage. <i>“The name’s [pc.name].”</i>");

		//Merge
		output("\n\n<i>“Great! This is my little shop, so if you can’t find what you need, I can probably order it in for you. I specialize in furry splices, of course,”</i> she says as she shakes your hand. <i>“Would you believe I used to be an Orchan? I didn’t even have hair back then, let alone fur! I’m living proof of the effectiveness of my products,”</i> Jade explains with a note of pride in her voice. She whispers, <i>“I didn’t have tits either.”</i> as she brings up a holo-console for you to browse her wares with. <i>“Let me know if you need anything. Oh, and bear in mind we have two inventories - the traditional genetic splices and more... erotic choices, for the transformation enthusiast.”</i>");
		//[Buy][Sell][Talk][Appearance]
	}
	//Repeat Approach
	else
	{
		output("Just like last time, Jade is leaning over the counter to greet you before you’re even halfway to her. Her pendulous, fur-wrapped tits sway and jiggle from every subtle movement she makes, unrestrained by top or bra. Smiling when she sees you looking, the red-eyed panda-girl presses them together with her forearms. <i>“Which of my goods can I interest you in today?”</i>");
		output("\n\nThe girl could really work on her phrasing....");
	}

	processTime(2);
	
	shopkeep = chars["JADE"];
	//List prices and whatnot. Back should go back to Jade's main menu.
	//Sell Menu
	chars["JADE"].keeperSell = "Jade tilts her head to the side. <i>“You wanna sell me splices? Well, even if they don’t fit my niche, I can probably turn a profit on them, so why not?”</i> She looks at you inquisitively. <i>“What do you have for me?”</i>\n";
	chars["JADE"].keeperGreeting = "Jade extends her arm, gesturing towards the rest of her shop. <i>“See anything I can help you with?”</i>\n";
	
	//[Buy][Sell][Talk][Appearance]
	clearMenu();
	addButton(0,"Buy",jadeStoreSetup,undefined,"Buy","Buy some animal-themed transformation items.");
	addButton(1,"Buy(Erotic)",jadeAdvancedStoreSetup,undefined,"Buy","Buy some highly erotic transformations that may be unpredictably smutty - or otherwise very involved.");
	addButton(2,"Buy(Specific)",jadeSpecificStoreSetup,undefined,"Buy","Buy a gene-splice for a specific effect.")
	addButton(3,"Sell",sellItem);
	addButton(4,"Talk",talkToJade);
	addButton(6,"Appearance",jadeAppearance);
	if(pc.lust() >= 33 && flags["TALKED_WITH_JADE_ABOUT_HER_TITS"] == 1) addButton(5,"Sex",jadeSexMenu);
	else addDisabledButton(5,"Sex");
	addButton(14,"Back",mainGameMenu);
}
public function jadeStoreSetup():void 
{
	chars["JADE"].keeperBuy = "Jade’s console lists off the modification she has in stock along with their prices.\n";
	
	chars["JADE"].inventory = new Array();
	
	//Inventory sorta alphabetically, because I'm a boss.
	chars["JADE"].inventory.push(new AusarTreats());
	chars["JADE"].inventory.push(new Cackler());
	chars["JADE"].inventory.push(new CaninePoppers());
	chars["JADE"].inventory.push(new TauricoVenidaeLight());
	chars["JADE"].inventory.push(new DracoGuard());
	chars["JADE"].inventory.push(new MousearellaCheese());
	chars["JADE"].inventory.push(new SheepTF());
	chars["JADE"].inventory.push(new OvirAce());
	chars["JADE"].inventory.push(new OvirPositive());
	chars["JADE"].inventory.push(new PupperPoppers());
	chars["JADE"].inventory.push(new SharkBites());
	chars["JADE"].inventory.push(new Swineapple());
	//Nice, neat inventory complete :3
	
	//itemScreen = mainGameMenu;
	//lootScreen = mainGameMenu;
	//useItemFunction = mainGameMenu;
	
	buyItem();
}

public function jadeSpecificStoreSetup():void
{
	chars["JADE"].keeperBuy = "The console displays a list of Jade’s wares, focusing on specific, highly targeted splices.\n";
	
	chars["JADE"].inventory = new Array();
	
	chars["JADE"].inventory.push(new KnotAProblem());
	chars["JADE"].inventory.push(new Furball());
	
	buyItem();
}

public function jadeAdvancedStoreSetup():void
{
	chars["JADE"].keeperBuy = "Jade taps a few keys to bring you into the more... adult-oriented portion of her stock. Included is a long warning about unexpected, erotic side effects, increased libido, and unexpected occurrences of heat and/or rut.\n\n<b>These are the gene splices for the user who wants slow and sometimes unpredictable transformations that are full of sexual effects.</b>\n";
	
	chars["JADE"].inventory = new Array();
	if(pc.level >= 2)
	{
		chars["JADE"].inventory.push(new AmberSeed());
	}
	if(pc.level >= 3)
	{
		chars["JADE"].inventory.push(new Catnip());
	}
	if(pc.level >= 4)
	{
		chars["JADE"].inventory.push(new Foxfire());
	}
	chars["JADE"].inventory.push(new HorsePill());
	chars["JADE"].inventory.push(new LaquineEars());
	chars["JADE"].inventory.push(new NukiCookies());
	chars["JADE"].inventory.push(new Pandaneen());
	chars["JADE"].inventory.push(new PandaPro());
	chars["JADE"].inventory.push(new RedPandaneen());
	chars["JADE"].inventory.push(new RedPandaPro());
	
	buyItem();
}

//Appearance
public function jadeAppearance():void 
{
	clearOutput();
	showJade();
	output("Jade is a panda. That much is obvious, even at a glance. Her face has a short snout with a black nose, hiding most of her old facial features from view. Perhaps the only remains of her original race, orchan, are the number of teeth inside her maw and her exotic eye-shape. Slitted horizontally, her crimson irises bore into you, even when she gives you a smoldering look from lowered eyes. Her plump, sable lips are often pursed thoughtfully, gleaming like polished jet in the bright lights inside her shop. She either wears shiny gloss or takes moisturization very seriously, but neither accounts for their kissable-and-then-some size.");
	output("\n\nA mane of long, onyx-black hair cascades past her shoulders into a line of emerald clasps that bind it into an orderly, if long, ponytail. Elsewhere, she’s covered in a thick coat of shimmering white fur soft enough to remind you of cyberdown pillows. A few black splotches break up her alabaster coloration - one around each of her eyes, one on her right shoulder, a big one from the underside of her left breast down to her hip, and a few small ones on her legs.");
	if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined) output(" There might be more under her softly swaying skirt, but you’d have to talk her out of it first.");
	else output(" You know from experience there aren’t any more under her softly swaying skirt, but it wouldn’t hurt to check a second time.");
	output(" It isn’t a perfect match to real pandas’ coats, but over the counter transformatives aren’t known for being an exact science.")

	output("\n\nTo say that Jade is curvy would be an understatement. She’s big all over, but mostly in the hips and chest departments. Beneath her narrow shoulders, her torso blossoms out into a little bit of chub and a whole lot of boob. Her tits - with as big and shapely as they are, tits is the only word that comes to mind - jut out large and proud, jiggling and swaying enthusiastically with every move their owner makes, always coming to rest in a way that leaves no doubt in your mind; she doesn’t need a bra. Those plush, snuggly looking behemoths may bounce and quake, but they also sit up high when at rest.");
	if(!chars["JADE"].hasTentacleNipples()) output(" Interestingly, there are no nipples to top off Jade’s bountiful breasts, just smooth, even fur. The panda-girl is curiously devoid of areolae as well.");
	else
	{
		output("\n\nLarge, round black areolae cap each of Jade’s bountiful breasts, seemingly home to inverted nipples, just waiting for the right amount of stimulation to pop them out. You know from experience, however, that her nipples are far from ordinary inverted nipples; they’re actually incredibly sensitive prehensile tentacles, which can reach out long enough to fuck their owner in any hole she wishes. She can control them, to an extent, but sometimes they seem to have a mind of their own.");
	}

	output("\n\nShe has just enough fat on her to give her a little belly when she slouches, but her hips put it to shame, flaring out to support her bubbly backside. What a butt it is! Her plump derriere is the kind of ass a surveying team would get lost in and never escape from. The cheeks are superbly rounded, but they jiggle with such energy that you can see it through her skirt. When she flexes her sizeable thighs, the whole thing tenses up. Though you can’t see it, you’re sure there’s a pudgy little pucker in between her pillowy buns, right where it belongs. When Jade walks, it’s with a swiveling, heavy sway that makes it difficult to look away from her hypnotic ass, and the cute little puffball of a tail just above it makes it even harder to keep your gaze to a respectable area.");

	output("\n\nThe panda-woman’s thighs continue on about as you would expect on such a woman. They’re powerfully thick but carry more than enough cushion to make her lap an appealing rest stop, if you don’t mind being smothered in her plush softness. Jade’s feet, like her hands, are paw-like in appearance, with short, stubby digits capped by short, retractable claws. Little pads cover the undersides of her fingers and toes to enhance her grip, both as soft as the finest leather. She obviously takes care of herself.");

	output("\n\nAt 6\' 3\" tall, she’s well above the galactic average for beings classed as females, but she’s just too damned cuddly to be imposing.");
	clearMenu();
	addButton(0,"Next",approachJade);
}



//Talk
public function talkToJade(display:Boolean = true):void {
	if(display)
	{
		clearOutput();
		showJade();
		output("<i>“A social call?”</i> Jade wonders aloud. <i>“Well, the store is empty. I’d be happy to talk.”</i> She vaults atop the counter with a little bit of awkwardness, barely crossing her legs in time to stop herself from giving you a glimpse upskirt, but giving you an eyeful of quaking breasts in the process. The panda’s quivering bosom is almost spellbinding, so much so that she has to cough to get your attention back to her face. <i>“So what do you want to talk about? I’m pretty much an open book.”</i>");
	}
	clearMenu();
	addButton(0,"Her Race",talkToJadeAboutHerRace);
	if(flags["TALKED_WITH_JADE_ABOUT_HER_RACE"] != undefined) addButton(1,"Why Furry?",talkWithJadeAboutHerFurFetish);
	else addDisabledButton(1,"Why Furry");
	if(flags["TALKED_WITH_JADE_ABOUT_FURRIES"] != undefined) addButton(2,"Her Shop",askJadeAboutHerShop);
	else addDisabledButton(2,"Her Shop");
	if(flags["TALKED_WITH_JADE_ABOUT_HER_SHOP"] != undefined) addButton(3,"Her Tits",askJadeAboutHerBigOlTatas);
	else addDisabledButton(3,"Her Tits");
	if(flags["CAN_SUGGEST_JADES_NIPPLE_TREATMENT"] == 1) addButton(4,"Nipples",talkToJadeAboutHerNipples);
	else addDisabledButton(4,"Nipples");
	addButton(14,"Back",approachJade);
}

//Her Race
public function talkToJadeAboutHerRace():void {
	clearOutput();
	showJade();
	flags["TALKED_WITH_JADE_ABOUT_HER_RACE"] = 1;
	output("<i>“I assume you mean my original race, orchan, and not panda,”</i> Jade offers with an inquisitive tone.");
	output("\n\nYou nod. She would probably talk about pandas all day if you let her.");
	output("\n\nSighing, the curvacious panda nervously looks at her claws as she gathers her thoughts. She bites her lip, thinking hard, and when she finally does talk, the suddenness of it seems to startle her as much as you. <i>“I used to be an orchan. We’re kind of a smaller race - usually shorter than humans and ausar... thinner too. Our homeworld is naturally warm, not hot, mind you, and food is plentiful. We didn’t need the insulation hair provides or to pack on much fat. Staying lean made it easy for us to maneuver through denser obstructions in the jungles we evolved from, I suppose.”</i> Jade nibbles on a finger. <i>“It’s strange talking about this stuff, now that I’m so... I’m so... different.”</i>");
	//Nice
	if(pc.isNice()) output("\n\nYou lean against her in a show of solidarity and encourage her to continue. <i>“Just because you’re different now doesn’t mean I don’t want to hear about where you came from.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nYou playfully tweak one of her round, bear-like ears, earning a squeak for your mischief. <i>“Come on, it’s just a story; it can’t hurt you,”</i> you say, <i>“but I might have to pinch you somewhere else if you stop!”</i>");
	//Ass
	else output("\n\nYou chuckle to yourself at her discomfort before glancing back her way expectantly.");

	//Merge
	output("\n\n<i>“Right,”</i> Jade exhales. <i>“So anyway, our race got discovered about two planet rushes back. We were already pretty civilized by that point, but we never developed much industrially. Orchan is a very verdant planet, so we were very, very careful not to damage our forests. Any advancement that was deemed damaging to the environment was shelved until it could be made to work without negative consequences.”</i> She shifts nervously, uncrossing and recrossing her thighs in a surprisingly demure gesture for such a large woman. <i>“To the ausar explorers that found us, we were practically primitives.”</i>");
	output("\n\nShe tugs nervously on her ponytail before flicking her odd red eyes your way again. <i>“We got lucky, though. We paraded out every discovery our scientists had made to the ausar and made them see our worth. They supported our bid to join the U.G.C. as an independent planet. It’s a good thing too, if they hadn’t we probably would’ve been taken over by the closest local power and inducted under someone else’s rule. As it is, we’re more or less left to rule ourselves, even if we have one of the lowest trading quotients in the confederacy.”</i>");
	output("\n\n<i>“Lucky break,”</i> you think out loud.");
	output("\n\nJade smiles. <i>“No kidding.”</i> She pulls her ponytail over her shoulder and threads it between her breasts, idly toying with the end of it as she talks, <i>“After that, things have stayed about the same. Sure, we’ve gotten better tech, but preserving our planet’s splendor has remained paramount. We aren’t important enough to see many off-worlders, and an orchan leaving? Well, let’s just say I surprised the whole colony when I saved up enough credits to leave.”</i> She casually adds, <i>“A colony is like an extended family unit - uncles, cousins, and even close family friends. They all typically share one large dwelling.”</i>");
	output("\n\nHer eyes drift closed, and a wide smile spreads across her face. <i>“I’ll never forget the feeling of the thrusters pushing me back into my seat when we blasted off. It was like the planet itself was trying to hold onto me, to drag me back down to the ground, but we got higher and higher until the sky turned black and starry.”</i> She tips her head back, lost in the memory. <i>“Gravity fell away until I felt like I was floating in my chair... at least, until the artificial gravity kicked on.”</i> Slowly opening her eyes, Jade sighs. <i>“I was free.”</i>");
	output("\n\nShe leans back and wriggles her toes. <i>“Anything else you want to know?”</i>");
	processTime(15);
	talkToJade(false);
	removeButton(0);
}
//Talk menu with no text.
//Why Furry?
public function talkWithJadeAboutHerFurFetish():void {
	clearOutput();
	showJade();
	flags["TALKED_WITH_JADE_ABOUT_FURRIES"] = 1;
	output("<i>“Why furry?”</i> you ask.");
	output("\n\nJade just sighs at this. <i>“I’ve answered this question more times than I can count, you know?”</i>");
	output("\n\nYou nod understandingly, though you still want to know, of course.");
	output("\n\n<i>“Why not?”</i> the plush panda retorts. <i>“Fur is awesome! Here...”</i> She grabs your hand and places it against the velvety-softness of her arm. <i>“Isn’t it amazing? It’s just so... so wonderful!”</i> She makes sure you get a good feel for her texture before letting go. <i>“When I got myself a Miniature Void Hamster and touched him for the first time, I was in heaven. I didn’t realize that growing little bristles out of your skin could make touching so... so good!”</i> Jade giggles a little at herself. <i>“So, I did the first thing anyone discovering something new does - I did some extranet research! You wouldn’t believe what I found!”</i>");
	output("\n\nJade glances around momentarily before giving a rueful smirk. <i>“I guess since you’re here, you probably would believe what I found. It turns out that searching for things like ‘furry’ can bring up a whole subculture of enthusiasts, not to mention the... uh... wilder things related to that culture.”</i> She casts a sly look in your direction and giggles nervously. <i>“Anyway, it looks like you humans had people wanting to adopt features from cute little animals long before you had the technology to do so, and that concept has caught on with a few other species as well. There’s some ausar into it, for example, even though they’re already pretty furry! If only their culture was more accepting about it; I hear having a snout carries something of a stigma over there.”</i>");
	output("\n\nYou chuckle at that. Humans aren’t exactly fond of furries, but by and large it’s become commonplace enough to ignore. Besides, it’s hard to carry a grudge against somebody with a muzzle when you live next door to someone who’s made of sentient goo or comprised of writhing tendrils. Not to mention that there are a few aliens out there who may as well be furries. Diversity is a bitch.");
	output("\n\nA fuzzy, well-padded elbow digs into your ribs. <i>“Still with me, [pc.name]?”</i>");
	output("\n\n<i>“Just thinking,”</i> you answer. <i>“What made you decide to make the change?”</i>");
	output("\n\nScrunching up her face and licking her nose, the big panda gal answers, <i>“Not much, actually. I had already broken away from my race to see the stars. I was out working odd jobs, learning technology, and trying to make it on my own when I decided to go for it. I had to land a good gig to afford it, of course. I found out I had a head for numbers and figures while working in a friend’s custom starship shop, even though my ‘in’ had been my ability to wriggle through small places. Within six months I was out of the grease pits and into an accountants office. A few months after that I was running the books for two other shops.”</i> She casually wraps her ponytail around her neck and over one shoulder. <i>“I made enough to get access to some of the good stuff.”</i>");
	output("\n\nJade kicks her feet out and wiggles her toes excitedly. <i>“It only took me a few hours for the fur to grow in, and I got so much taller and bigger all over! I must have eaten something like a meal an hour for the first two days. After my face finished reshaping, things slowed down, but I was still putting on weight and growing in places I hadn’t grown before.”</i> She gingerly prods her cushy bosom, and her mouth falls open into a happy smile, pink tongue lolling out.");
	output("\n\nIs she getting aroused by such benign contact? You don’t get a chance to ask.");
	output("\n\n<i>“I grew tits! Big, whomping titties!”</i> She looks so happy that you momentarily worry that she’s going to start bouncing and cheering. <i>“Orchan’s don’t have breasts... ever! We don’t even have nipples.”</i> She points back at herself. <i>“Now I’m a big girl with a luxurious coat and even bigger assets!”</i> Perhaps realizing that she’s strayed into a sexual territory, she lets the conversation drop off.");
	output("\n\nAfter a moment of companionable silence, Jade playfully punches your shoulder, but it doesn’t even hurt. She’s just too soft. <i>“That’s for making me explain that again.”</i>");
	processTime(15);
	talkToJade(false);
	removeButton(1);
}
	
//Her Shop
public function askJadeAboutHerShop():void {
	clearOutput();
	showJade();
	flags["TALKED_WITH_JADE_ABOUT_HER_SHOP"] = 1;
	output("<i>“My shop?”</i> Jade asks. <i>“I guess you could say that it’s like my hopes and dreams rolled together into my baby.”</i> She smirks a little. <i>“I wanted to share what I had discovered with everyone, and a shop seemed the best way to do it. I can support myself and meet furries all day long! Hell, I can even work with people that don’t have the credits to make the transformation on their own. You’d be amazed by what solid financial planning can accomplish.”</i>");
	output("\n\nTicking off one finger, Jade explains, <i>“First, I had to get the money for the place. I worked as an accountant another two years to save up enough to start up. It wasn’t easy, but I did. Next, I needed a location. I caught a lucky break with picking my location, though. The planet rush was coming up, and Tavros was positioned perfectly to catch a ton of lucrative trades with the new planets. That’s not even mentioning all the adventurers coming out of the new systems with wallets full of " + (isAprilFools() ? "dogecoins" : "credit chits") + ".”</i> She gestures at her shop. <i>“I’ve done well enough to redecorate twice, and each time I wind up making the place cozier. I’ve even managed to open up a few new locations out there on the rim.”</i> She sighs. <i>“I can’t run all of them personally of course. I mainly stay here... this place has kind of become my home.”</i> She brushes a stray strand of hair out of her eyes. <i>“Not much more to tell.”</i>");
	output("\n\nThe cuddly-looking woman begs a story or two out of you before saying, <i>“You’re easy to talk to, you know that? I can tell you’ve got at least one more question.”</i> She gives you a sultry blink. <i>“I saw you looking back when I touched them and talked about growing them...”</i> she says with a gesture at her breasts. <i>“Just ask. I won’t bite.”</i> She snaps her jaws. <i>“Much.”</i>");
	talkToJade(false);
	removeButton(2);
}
//Her... Breasts
public function askJadeAboutHerBigOlTatas():void {
	clearOutput();
	showJade();
	flags["TALKED_WITH_JADE_ABOUT_HER_TITS"] = 1;
	output("Well, you may as well take the bait. You ask her about her breasts.");
	output("\n\nJade smirks, running one pawed finger up and down the length of her expansive assets, shivering slightly at the sensation. <i>“I was hoping you’d ask.”</i> She squeezes one and pants, <i>“They’re my favorite part of the transformation. Whoever designed the splice made it with human expectations in mind, and humans expect, big, luxurious busts to go with a curvy figure.”</i> She gives a twirl and a shake, basking in your attention like a cat in the sun. <i>“It’s a shame it didn’t give me proper nipples. I compensated another way, and it worked out better than I could have ever imagined....”</i>");
	output("\n\n<i>“What’d you do?”</i> you ask, your curiosity overwhelming you.");
	output("\n\nLeaning back on the countertop, the plush panda smiles. <i>“Well, nipples are supposed to be incredibly sensitive, right?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“I decided, if I don’t have the nipples themselves, why not just make my breasts have nerves as densely packed as nipples? The tech is out there, though it’s often used for other purposes. It took a year’s worth of profits to afford the neuron growth serums and have them applied, but it was worth every penny!”</i> Jade rubs a breast once more, tongue lolling in obvious pleasure. <i>“You can... can see how successful it was....”</i> She shudders, and for a second, her tongue lolls out in a display of wanton enjoyment. <i>“The doctors... umm... said I responded better to the treatments than I- ooohhh... should have.”</i>");
	output("\n\nThe curvaceous shopkeep slides back behind her countertop, her thighs clenching tightly together. <i>“You can probably guess why I don’t wear a top now. All that fabric sliding and grinding and squeezing on my girls would drive me nuts with need. I’d probably wind up trying to proposition every customer that came in instead of selling them splices, and while that might be fun, I’m not sure I’m the right type of girl for that occupation.”</i> One of her hands drifts lazily towards her top before being stopped by Jade’s glare. She lowers her arm with a deep, regretful sigh.");
	output("\n\n<i>“As it is, I’m a hairsbreadth away from vaulting over this counter and forcing you to spend the next two hours motorboating me.”</i> Jade smiles lopsidedly, eyes cast low and lewd. <i>“With some regret, I’m going to have to ask you to give me a moment to get under control, I’ll be right back.”</i>");
	output("\n\nShe pirouettes away, rump swaying back and forth with pendulous momentum, thighs kept so close together that you can hear the swish of fur on fur with each step. Her display of willpower does little to hide the reflective sheen trailing down one flexing leg, nor does it conceal the fragrant trail of droplets that have accumulated on the rug behind her, filling her shop with her own feminine odor. Perhaps she pushed herself a little closer to the brink than she meant to. Her shop certainly didn’t seem layered with the smell of a woman in need when you arrived.");
	output("\n\nFrom behind a ‘staff only’ door, you hear surprisingly unmuffled moans, at first soft, like their creator is trying to stay quiet, but with gradually increasing enthusiasm. Soon, you’re wondering if passersby can hear her dulcet whimpers and cries. You certainly can, and they’re making your own heart beat a little faster in response, but just as you’re considering trying the door yourself, Jade’s ardor peaks. She cries out, thumping against something... perhaps the walls or the floor. You can’t be sure which. There’s some breathy panting, and then Jade emerges, practically glowing. Her skirt looks as perfect as when she left.... Did she masturbate without even touching herself down there?");
	output("\n\n<i>“[pc.name], I’m up here.”</i> Jade’s downy fingertips catch you under the chin and lift your eyes to hers, forcibly pulling your gaze away from her crotch. She chuckles to herself. <i>“Sorry, I got a little too excited there. Was there something else you wanted to talk about, or did you want to buy something?”</i>");
	pc.lust(20);
	processTime(20+rand(10));
	//Raise lust by 20.
	talkToJade(false);
	removeButton(3);
}

//Sex
//Unlocked by having the breasts discussion
public function jadeSexMenu(display:Boolean = true):void {
	if(display)
	{
		clearOutput();
		showJade();
		//Hasn't had sex with her
		if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined)
		{
			output("You bring up her little foray to the ‘employee room’ and suggest that maybe next time she get a little help with her needs. You’re a pretty helpful " + pc.mfn("guy","gal","person") + " after all.");
			output("\n\nA knowing grin spreads across Jade’s short muzzle. <i>“Oh really? Sooo....”</i> She comes around the side of the counter to you, pulling you into a hug that crushes you into her cushy body");
			if(pc.tallness <= 60) output(", tits wrapped around your head");
			output(". <i>“...you think you can handle such big girls on your own?”</i>");
			output("\n\nYou grab her breasts and give a gentle squeeze, eliciting a moan of pussy-moistening pleasure from the panda. <i>“Ooooohhhh... yes you can.”</i> Her voluptuous form shudders against you. <i>“Come on, let’s do this.”</i>");
			output("\n\nShe drags you to the back room, her body grinding against you the entire way.");
		}
		//Has had sex with her
		else 
		{
			output("You suggest another trip to the employee room to take care of ‘the girls’.");
			//Low # of sexings
			if(flags["GOTTEN_INTIMATE_WITH_JADE"] <= 2) output("\n\nJade rounds the counter and takes you by the hand, pulling you towards the door. <i>“I’m okay with it if you are. I don’t think I’ll ever get tired of the feel of your fingers in my fur.”</i>");
			//Med # of sexings
			else if(flags["GOTTEN_INTIMATE_WITH_JADE"] <= 8) 
			{
				output("\n\nJade is around the counter in seconds, grabbing you and thrusting you deep into her valley-like cleavage. Her squishy boobs utterly encompass your head");
				if(pc.tallness >= 72) output(" once she pulls you down to their level");
				output(", and she drags you back towards the door like that, saying something about loving your visits.");
			}
			//High # of sexings
			else
			{
				output("\n\nJade grabs your hands and pulls them against her weighty chest, letting your fingers sink deep into the sumptuous mounds, her furred flesh bulging out around them, making your digits appear to vanish into the squishy surface. You can’t help but give them a squeeze, and while you are so distracted, she grabs your waist and practically drags you to the door, letting you grope her all the while.");
				output("\n\n<i>“Come on, " + pc.mfn("handsome","beautiful","my dear") + ", let’s go somewhere private so you can have some alone time with them.");
			}
		}
		//Merge
		output("\n\nWhat will you do?");
	}
	//Both show full sex menu
	clearMenu();
	if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined) {
		addButton(0,"Breast Play",jadeGetsAGropeGasm);
		addDisabledButton(1,"Titfuck");
		addDisabledButton(2,"RideHerFace");
		addDisabledButton(3,"Boob2Boob");
		addDisabledButton(4,"SuckNipples");
	}
	else 
	{
		addButton(0,"Breast Play",jadeGetsAGropeGasm);
		if(pc.hasCock()) addButton(1,"Titfuck",titfuckJade);
		else addDisabledButton(1,"Titfuck");
		if(pc.hasVagina()) addButton(2,"RideHerFace",sitOnjadesFace);
		else addDisabledButton(2,"RideHerFace");
		if(chars["JADE"].hasTentacleNipples())
		{
			//BoobToBoob
			//PC needs to be at least C-cup, or however much you feel is fair Fen.
			if(pc.biggestTitSize() >= 3) addButton(3,"Boob2Boob",boobToBoobSexathon);
			else addDisabledButton(3,"Boob2Boob");
			//SuckNipples
			//No requirement.
			addButton(4,"SuckNipples",suckJadesTentacleNipplesYouWeirdo);
		}
	}
}

//Gropegasm
//Omnigendered scene. PC stays closed and gropes the panda-girl to earthshaking orgasm after orgasm, leaving her with a puddle of pussy-juice and a serious tit-obsession
public function jadeGetsAGropeGasm():void {
	clearOutput();
	showJade();
	output("The two of you tumble back into a couch in the narrow back-room, hands roaming over one another’s body with little shame or restraint. Your own gropes, squeezes, and caresses rarely if ever leave her sumptuous breasts. They’re a feast for your fingers: soft, well-rounded, and oh-so squeezable. You have a hard time not just sitting there and rubbing them, feeling and fondling their expansive, plush... heavenly... mmmm.... Every touch makes Jade whimper and squirm. Every stroke earns a pleasured twitch.");
	if(pc.legCount != 2) output(" The awkward positioning of your body on the bipedally-designed sofa is a dim, unthought of concern next to your focus.");
	output("\n\nPanting madly, the plump panda-woman’s own explorations of your body rapidly die off. Her eyes drift partway closed, and her plush, black lips slowly part into a wanton ‘o’. You can practically see the pleasure from her tits colliding with her brain and sending her synapses into misfires of thought-obliterating ecstasy. A pleasant-sounding coo slips out of her maw as she relaxes into the chair, slowly sinking into more gradual expressions of physical excitement the longer you massage her sensitive mammaries.");
	output("\n\n");
	if(chars["JADE"].hasTentacleNipples()) showImage("JadeBreastplayNips");
	else showImage("JadeBreastplay");
	output("You take one hand-overflowing boob in each palm and shake them, squeezing them together and then apart before clapping them back together to set off a boobquake of epic proportions. The way her breasts jiggle and shake, you could film them and make a disaster holo out of it. Jade’s bosom, while big and bouncy, still sits fairly high on her body for all its size and weight. You suppose she hasn’t had them long enough for them to sag; she’s got tits that could shame a teenager for pertness and a surgically-altered cougar for size. In short, they’re a boob-lover’s dream, and they’re yours to play with as much as you like.");
	output("\n\nFrom the way Jade is moaning, eyes rolled back and vacant, she’s not going to stop you. You lean down to press your [pc.face] into her cushions, letting them wrap around to your [pc.ears], your hands holding them against you on either side. The silky softness of her fur is everywhere, completely surrounding you, wrapping you in a blanket of warm goodness. You twist back and forth, rubbing your face against one then the other, luxuriating in her plushness for a moment. Switching your focus, you let your hands resume groping their twin prizes.");
	output("\n\nThe overly-sensitive panda-girl immediately moans, though it sounds almost like a purr from how throatily it emerges from her mouth. You feel something wet against your [pc.leg] and reluctantly pull out of her smothering breasts to investigate.");
	output("\n\nJade’s emerald-toned skirt is plastered to her crotch like a second skin, made so transparent by her copious lubricants that the dusky lips of her sex are on full display. Her button-like clit protrudes upward, sheathed in a condom of green fabric, and a dark discoloration is slowly spreading through the couch below. You give her breasts a firm squeeze. Jade groans, her thighs quivering nervelessly, and her ebony netherlips visibly part, releasing a torrent of pheromonally-charged girl-cum. The room is getting increasingly thick with her scent. Has she been cumming this hard the whole time?");
	output("\n\nYou briefly consider asking her, but a quick look at her drool-slick lips and empty eyes tells you it would be a wasted effort. Instead, you go back to kneading Jade’s tits. Her gushing cunny enthusiastically declares the panda’s desire to continue, and you’re certainly having fun seeing just how much pleasure you can wring from her hand-swallowing titties. You grab one and squeeze it hard enough that it’s probably a little painful, letting your fingers completely vanish from view, lost in her silky fur.");
	output("\n\nJade gives an ear-shattering screech as every muscle in her body locks at once and begins to violently buck beneath you, throwing her hips up with enough force that you’re nearly sent flying. If it wasn’t for the tight grip on her bosom, you would’ve been bucked into the slick puddle that’s formed on the floor, accumulated from the rivulets of girl-honey that have been leaking down the furniture the past few moments. Her skirt is completely drenched by her violent orgasm, so much so that even the fur on her legs is plastered down by sticky secretions.");
	output("\n\nInspired, you reach under the drenched fabric and run your fingers across her quivering nether-lips, collecting a palmful of slick juice for your efforts, then bring it up to her heaving bosom. She’s gasping for breath, breasts quivering beautifully with every lungful of air she sucks in. You smile and rub her tits down with her own juice. In response, Jade’s tongue lolls, and her hips resume rocking, this time at a much more sedate pace. It seems that firmness earns violent, thrashing orgasms while gentler gropes and massages earn whimpering drools of feminine bliss.");
	output("\n\nYou give Jade’s sensitive bosom a slow massage to make up for your roughness earlier, fingers slipping and sliding through her cleavage with such ease that you can’t help but ");
	if(flags["TITFUCKED_JADE"] == undefined)
	{
		if(pc.hasCock()) output("wonder what a tit-fuck would be like with this girl");
		else output("wonder if she’s ever tried tit-fucking anyone");
	}
	else 
	{
		if(pc.hasCock()) output("wonder why you didn’t decide to titfuck her today");
		else output("wonder why you got rid of your dick");
	}
	output(". She’s a natural for it. You watch her gasping through climax after climax until her well-tended mammaries dry, reeking of cunt, each time going a little slower and gentler, giving her a slow, cummy come-down.");
	output("\n\nEventually, Jade starts lazily blinking, and she wipes the drool from the side of her maw on her shoulder. She seems to have trouble focusing at first. Her eyes lazily roam around the room while one of her paws instinctively cradles her sensitive chest, making her moan all over again. Slowly, she finds her way back to you, gracing you with an exhausted smile, not caring that her thighs are splayed out or that her cummed-out cunt is on full display. The panda-girl appears to be floating on an orgasm-induced cloud of euphoria. She slurs, <i>“C’mere,”</i> and pulls you back into her tits, not for a sensuous grope-fuck but for a affectionate, if slippery hug.");

	//FIRST TIME FORK:
	if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined) {
		output("\n\nShe holds you there, snuggling with you as her climax-lagged brain slowly boots back up. <i>“You... I... umm.... Wow.”</i> She suddenly kisses you. <i>“I uh... I haven’t done it that way before.”</i> Gingerly touching her thighs, she feels the wetness there.");
		output("\n\n<i>“How many times did I just come?”</i> The incredulity in her voice is as thick as the scent of lady-spunk in the air.");
		output("\n\n<i>“Uh, a lot,”</i> you answer. <i>“It was hard to keep track. You were basically quivering the entire time and I was busy giving you the rub-down you needed.”</i>");
		output("\n\nJade kisses you again, this time long and slow. The dance of her thick, muscular tongue against your own seems to go on for minutes before you pull apart. The curvy woman apologizes, <i>“I can’t thank you enough.... I didn’t know it could feel this good, and I didn’t even return the favor.”</i> You aren’t sure, but you’re pretty sure she’s blushing under her alabaster fur.");
		output("\n\nEventually, you both climb out of the ruined couch, careful not to slip on the slick floor, and break apart. The shopkeeper nervously shoos you out, saying something about having to treat the cushions and clean the floor.");
		output("\n\nYou go, but she does make a point to call out after the door has closed. <i>“Be sure and let me repay the favor sometime, okay?”</i>");
		output("\n\nYou might have to do that.");
	}
	//REPEAT FORK
	else
	{
		output("\n\nShe holds you there, snuggling with you as her climax-lagged brain slowly boots back up. <i>“You... uhm... again?”</i> She suddenly kisses you. <i>“I wasn’t sure it would be as intense after the first ");
		if(flags["GOTTEN_INTIMATE_WITH_JADE"] > 1 && flags["GOTTEN_INTIMATE_WITH_JADE"] != undefined) output("few times");
		else output("time");
		output(", but ugh... it’s hard to think right now. Everything just feels so... so... good!”</i> Jade kisses you again, longer and slower this time, luxuriating in it, letting her short, thick tongue press between your lips to tangle with your own.");
		output("\n\nA minute later, when she pulls back, you’re both smiling, but she speaks first. <i>“All right, go on and get up, [pc.name]. You made me soak the couch again, so I’ve got some cleaning to do.”</i> She slowly peels the skirt off, wrinkling her nose at how absolutely inundated with her pleasure-juices it is. <i>“A lot of cleaning....”</i>");
		//Nice
		if(pc.isNice()) output("\n\nYou stick around a while to help, not leaving until you’re both presentable and ready to step back out into her shop.");
		//Mischievous
		else if(pc.isMischievous()) output("\n\nYou help a while, cracking plenty wise about her orgasms and how wet they were until the whole place is clean. Then, you help her get dressed once more, being sure to cup her breast, just to get her motor going again.");
		//Hard
		else output("\n\nYou wave, [pc.walking] out the door with a smile on your face.");
		
		//Gropegasm Insight
		//Blurb to be displayed after the Gropegasm scene. Available after Gropegasmin 3 times.
		if(flags["GOTTEN_INTIMATE_WITH_JADE"] != undefined && flags["GOTTEN_INTIMATE_WITH_JADE"] > 2 && flags["CAN_SUGGEST_JADES_NIPPLE_TREATMENT"] == undefined)
		{
			output("<b>");
			//Kind:
			if(pc.isNice()) output("\n\nAs you leave the shop, you can’t help but reflect on how much Jade loves your hands on her tits. It’s almost a pity that she doesn’t have nipples; you’re sure that she’d love that. Hey, maybe you should ask her if she’s done any research into mods that could give her nipples? You’re sure you could help her get them, if that’s the case.");
			//Mischievous:
			else if(pc.isMischievous()) output("\n\nAs you leave, you reflect on what a pity it is that Jade just doesn’t have nipples. With her boobs being as sensitive as they are, imagine what they’d feel like with a pair of sensitive nipples to pinch, tug and suck. You have a feeling you’d enjoy it too. Maybe you should talk to her about it sometime.");
			//Hard:
			else output("\n\nAs you leave, your thoughts drift back to Jade’s breasts. Damn, it’s fun groping those delicious orbs until she’s a quivering mess. If only she had nipples, you could make things at least twice as good. You’re pretty sure there must be a mod capable of nipple growth out there. Maybe Jade knows something about it herself.");
			flags["CAN_SUGGEST_JADES_NIPPLE_TREATMENT"] = 1;
			output("</b>");
		}
	}
	sexedJade();
	processTime(20+rand(10));
	chars["JADE"].orgasm();
	chars["JADE"].orgasm();
	chars["JADE"].orgasm();
	pc.lust(30+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function sexedJade():void {
	if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined) flags["GOTTEN_INTIMATE_WITH_JADE"] = 0;
	flags["GOTTEN_INTIMATE_WITH_JADE"]++;
}

//Pandalicious Titfuck
//Requires a penis
public function titfuckJade():void {
	if(flags["TITFUCKED_JADE"] == undefined) flags["TITFUCKED_JADE"] = 1;
	else flags["TITFUCKED_JADE"]++;
	clearOutput();
	showJade(true);
	output("<i>“How about a titfuck?”</i> you suggest");
	if(pc.isNice()) output(" with an encouraging smile");
	else if(pc.isMischievous()) output(" with a mirthful grin");
	output(".");
	if(!pc.isCrotchExposed()) output(" A tightness in your [pc.lowerGarments] signals your " + possessive(pc.cocksDescript()) + " willingness to participate in such a plan.");
	else 
	{
		output(" A sudden upward surge from your [pc.cocks] signals ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" willingness to participate in such a plan.");
	}
	output(" There’s no use trying to hide the ready engorgement of your crotch from the cute panda-girl, so you don’t even try.");

	//First time
	if(flags["TITFUCKED_JADE"] == 1)
	{
		output("\n\nJade’s shiny black lips open in surprise, covered by her hand as she stares in shock. ");
		//Size variants(small)
		if(pc.biggestCockLength() < 5.5) output("<i>“You’re so... little! You’ll disappear into my cleavage with something that small, no problem.”</i>");
		//(Medium)
		else if(pc.biggestCockLength() <= 10) output("<i>“Oooh, that looks kind of nice. I could absolutely smother that thing in boob... just wrap it up in my big... cushy... breasts.”</i>");
		//(Big)
		else if(pc.biggestCockLength() <= 15) output("<i>“Wow, you’re big! I mean, with all the splices out there, I’ve seen some whoppers, but this... I bet you could ram the whole thing into my tits and bop me in the chin! I could smother you in tit and still take the time to polish your [pc.cockHeadBiggest].”</i>");
		//Huge
		else output("<i>“Holy-! You’re gigantic! Jeeze, do you need a sling just to carry that around? I don’t even think I could fit my breasts the whole way around that if I got an augmentation. Still...”</i> she pauses in thought, ”</i>...I bet having such sizable melons rubbing against you would feel way better than a paw or a mouth.”</i>");
		//Merge
		output(" She slowly pulls her alabaster-furred hand away from her mouth to reveal a greedy smile. <i>“I’ve actually never done this before. Usually guys just stick it in and grope me while they fuck. I guess pussy is a motivator that crosses most species’ bounds.”</i>");
	}
	//Repeat
	else
	{
		output("\n\nJade’s mouth curls into a knowing smile before asking, <i>“So you came back for ");
		if(flags["TITFUCKED_JADE"] == 2) output("seconds");
		else output("even more");
		output("? Didn’t get enough last time?”</i> She licks her lips at the memory, eyeing your crotch with unashamed lust. <i>“This is a service I’ll never mind providing you, [pc.name].”</i>");
	}
	//Merge
	output("\n\nDropping to her knees, the breast-obsessed panda beckons you closer. She’s already naked and on display, luring you in with her exposed cleavage, her arms crossed beneath her bust to maximize the lurid display. <i>“Come on then, let’s do this.”</i> She squeezes her breasts once more for encouragement before stretching behind her and coming up with a liter-sized bottle of lubricant. Upending it and drizzling her chest with slipperiness, Jade purrs, <i>“Come on then, I’m ready for you.”</i>");
	output("\n\nMaintaining a steady pace instead of rushing headlong takes every bit of your willpower. There’s nothing you’d like more than to slam your [pc.cockBiggest] right into her mammaries’ embrace, but you manage to swagger up and gently lay it into the welcoming, sensuous crevice with a degree of restraint. Your eagerness shows plainly in your eyes as you gaze down at Jade. She doesn’t seem to mind. In fact, her smile broadens at the first contact of your cock on her teats. <i>“Just make yourself at home and let me take care of you. It’ll feel like you’re fucking heaven itself.”</i>");
	output("\n\nWith the kind of goofy smile one inevitably gets when " + pc.mf("his","her") + " dick is about to be wrapped in tits, you give an excited nod, awaiting the panda’s pleasure.");
	output("\n\n");
	if(chars["JADE"].hasTentacleNipples()) showImage("JadeTitfuckNips");
	else showImage("JadeTitfuck");
	output("Jade carefully grabs her chest and presses her mammoth chest inward, compressing her boobs around your length");
	var length:Number = pc.biggestCockLength();
	if(length < 10) output(", making your entire [pc.cockBiggest] vanish into what feels like a sea of heaving, slick breasts, all pushing and rubbing up against you.");
	else if(length < 15) output(", making most of your [pc.cockBiggest] vanish into what feels like a sea of heaving, slick breasts, its [pc.cockHeadBiggest] sticking out of the top and pulsating happily.");
	else output(", making shivers of excitement traverse your mammoth manhood as it’s partially engulfed in a sea of heaving, slick breasts, its sheer size allowing it to press against the busty anthro-morph’s face as well as her chest.");
	output(" She");
	if(length >= 20) output(" leans around it to give");
	else output(" gives");
	output(" you a sultry wink, smiling broadly as she slides down to your ");
	if(pc.hasSheath(pc.biggestCockIndex())) output("sheath");
	else output("base");
	output(". The sound of her soaked tits slipping and sliding against your " + pc.mf("man","herm") + " hood is more than a little audible, squelching noisily as she starts to work on you, nearly drowning out the pleasured gasp you release at her naturally gifted cock-massage.");
	output("\n\n<i>“Atta " + pc.mf("boy","girl") + ",”</i> Jade moans back at you, visibly shuddering from the friction. <i>“You like this, doncha?”</i>");
	if(length >= 20) output(" She kisses and slurps along the underside of your [pc.cockBiggest], polishing you with long, wet licks, licking the flavored lubricants off you with each drag through her tits, mixing enough saliva in to make frothy bubbles form on her chest.");
	else if(length >= 10) output(" She kisses and slurps at your [pc.cockHeadBiggest], polishing you with long, wet licks, laying them on you with every downward slide she takes.");
	else output(" She blows you a kiss, licking her onyx-hued lips in between up-and-down undulates, letting some of her frothy saliva trickle down into her bosom to mix with the lube.");
	output(" Emerging from your cum-slit like a precious pearl, the first droplet of pre-jizz leaks from your enjoyment inundated system. It rolls down the bottom of your manhood, sped along by the shining moisture you’ve accumulated. She’s happy to catch it in her tits and bounce a little harder... and a little faster, making you that much firmer and that much more eager.");
	//Double dix?
	if(pc.cockTotal() == 2) output("\n\nWhile it feels great, your second phallus hasn’t even been touched yet. Jade, accommodating girl that she is, switches her boobs to a one-handed cradle, using the other to grab hold of your spare cock and start jacking. She keeps time with her own pendulous up-and-down bobs, giving you both a titfuck and a handjob in perfect sync. Your paired lengths twitch and throb for her. The panda-girl licks her lips and winks. <i>“With both of these, you might eve-ahhhh... might... might even cum before me!”</i>");
	//Triple+dix
	else if(pc.cockTotal() > 2) 
	{
		output("\n\nWhile it feels great, your other phalluses haven’t even been touched yet. Jade, accommodating girl that she is, arches her back and releases her tits, freeing her hands to grab hold of ");
		if(pc.cockTotal() > 3) output("two of ");
		output("your dicks and start jacking. Her breasts are big and firm enough that they still squeeze down on your [pc.cockBiggest] with more than enough force to keep tingles of gratification transmitting up your spine, and her hands keep perfect timing with the mammary assault. ");
		if(pc.cockTotal() == 3) output("All t");
		else output("T");
		output("hree of your dongs are getting served at once. They twitch and throb with eager intent at the panda-girl, wanting so desperately to spill their seed on her creamy fur. She licks her lips and winks, <i>“Hah, I think you might ac-ahh... Ahhh... AH! Mmm... you might cum before me, babe.”</i>");
	}
	output("\n\nYou cannot remain passive any longer. Your heart is beating like crazy. [pc.EachCock] is absolutely demanding you sate your pent-up need. Lurching forward, your [pc.hips] respond to your subconscious desires to fuck the bosomy pussy wrapped around your [pc.cockBiggest]. Jade’s velvety breasts wobble from the sudden thrust, practically vibrating around you from the hard fuck. You grab hold of them for stabilization and slide out, but only momentarily. You slam back in a second later, hilting yourself in supple titflesh, throbbing and dripping all over the ivory pillows, kneading them with your fingers to press them more firmly against your [pc.cockBiggest].");

	output("\n\nPerhaps because of your hungry, frenzied pounding, you miss out on the beginning of Jade’s orgasm. It isn’t until her voice has been moaning huskily for the better part of a minute that you realize what you’ve done. The panda-girl’s cushiony lips are pursed into an outspread ‘O’ of delight. ");
	if(length >= 20) output("You make sure to drag the underside of your [pc.cockBiggest] all over them as you thrust in and out, your totem-like cock smearing her face with its slippery surface. ");
	else if(length >= 10) output("You make sure to slide your [pc.cockHeadBiggest] past her parted cock-pillows and into her mouth with each thrust. Her spittle hangs in thick strings when you pull back, falling into her slick cleavage as additional lubrication. ");
	output("With her thighs quivering, Jade struggles to stay upright. Her pussy has gushed out a puddle of liquid satisfaction below, and it’s still trickling out one long string of sticky girl-goo.");

	output("\n\nYou feverishly hump against Jade’s bountiful bosom, making noisy squishing sounds with each pounding thrust, enjoying the velvet-soft embrace to its fullest. Your [pc.cockBiggest] throbs powerfully in the squishy embrace, languishing in the wonderful warmth. Yet, in spite of the pleasure, you feel the powerful need to cum rising up from inside of you, driving you to squeeze the twin orbs responsible for your pressure and fuck them with all your might. Jade, practically bubbling over with bliss, dopily smiles and manages to say, <i>“Cum on my tits, [pc.name]! Give it to me!”</i> before trailing back off into blissful mewls.");
	output("\n\n");
	//Balls
	if(pc.balls > 0) output("One of her hands finds its way to your [pc.balls] to give a reassuring squeeze. Your [pc.sack] clenches tight, starting the process of releasing your load.");
	//Pussy
	else if(pc.hasVagina())
	{
		output("One of her hands finds its way to [pc.oneVagina], penetrating it with two thick fingers");
		if(pc.hasClit()) output(" and resting a thumb upon [pc.oneClit]");
		output(". The sympathetic female pleasure is enough to make your body clench, starting the process of releasing your load.");
	}
	//Nothing
	else output("One of her hands finds its way to your [pc.butt] and worms a finger inside your [pc.asshole]. It twitches around inside, pressing against something exquisitely sensitive, and suddenly, your body is clenching, starting the process of releasing your load.");
	//Merge
	output(" You can feel the magma-like warmth spreading through you as your [pc.hips] automatically lurch forward, burying your [pc.cockBiggest] as deeply as possible into the quaking cleavage. Jade’s voice moans into a slowly crescendoing howl of pleasure herself, happy to be used as your cock milker for the night. Your [pc.cum] ");
	//Stuck in tits
	if(length < 10) {
		if(pc.cumQ() < 6) output("trickles out in tiny droplets that quickly abate, but that doesn’t stop [pc.eachCock] from quivering through spasms of climax. Perhaps you ought to give your body some time to brew up a fresh batch before humping away at the next piece of intergalactic tail.");
		else if(pc.cumQ() < 50) output("spurts directly into Jade’s already-soaked boobs. There, it mixes into a stew of slippery sex-juice, shining [pc.cumColor] against her fur.");
		else if(pc.cumQ() < 100) output("bursts out of you in thick gouts, quickly filling the panda’s cleavage with a small [pc.cumColor] pool. Some drips down Jade’s belly fur after escaping the imperfect seal of tit on dick.");
		else if(pc.cumQ() < 500) output("squirts out in inhumanly thick ropes, each so voluminous that it could form a puddle in her cleavage on its own. As your orgasm progresses, the valley of Jade’s impressive bust quickly overflows, allowing your roving hands to smear the liquid love across tremendous mammaries. By the time you stop, she’s painted with [pc.cum], and a small river of escaping sex-juice is drooling across her tummy.");
		else output("erupts with enough pressure to send a lance of love-juice into Jade’s open mouth and across her cheek. Rather than fighting it, the trembling panda closes her eyes, opens wider, and allows the treat to flood her lips with your flavor. There’s more than enough to thoroughly paint her furry tits as well, glazing them in a thick coat of [pc.cum] that drips and dribbles down her soft belly with every tit-quaking ejaculation.");
	}
	//Sticking out
	else
	{
		if(pc.cumQ() < 6) output("trickles out in a few drops before abating. They roll down your length and into Jade’s sloppy bosom, quickly subsumed by the sea of lubricants there. Even after, your quivering pole tries to launch ejaculate more, there’s just nothing to shoot out. Maybe you should give yourself a break in between intergalactic fucks?");
		else if(pc.cumQ() < 50) output("shoots a few long ropes up into the air. They hang there, glimmering in the light, before falling down across Jade’s nose, lips, and neckline. Her tongue darts out to grab a gob off her cheek.");
		else if(pc.cumQ() < 250) output("spurts out in nice, thick ropes. Each one hangs precipitously in the air for a moment before splattering down across Jade’s face, painting her into a [pc.cumColor] mask with a matching pearl necklace. She revels in it, opening her mouth to let you fill her mouth. Trickles of the stuff run down the nape of her neck to puddle in her cleavage, some leaking out the bottom to stain her belly.");
		else if(pc.cumQ() < 750) output("launches out in huge, sparkling arcs that seem perfectly aimed to fall upon the climaxing panda. She doesn’t move. She doesn’t resist. She just lets her eyelids close and her mouth open. Her tongue rolls out like a welcoming carpet, and your [pc.cum] rolls right on in, immediately flooding her maw with liquid love. Blind, she fails to catch the next shot inside. It splatters off her forehead and cheeks. The one after smothers her cheeks and neck. Each successive shot falls a little shorter until you’re flooding her tits with [pc.cum], enough that it rolls out over the sides in thick rivers. Strands of it drip down to her tummy, forming a tiny stream.");
		else 
		{
			output("erupts out, geyser like. The torrent of fluid hangs in the air above you both before coming back down atop Jade’s head. She manages to close her eyes and open her mouth, but that doesn’t do much to stop the splattering goo from making her look like she just spent an eight hour shifting working a glory hole. The next column of [pc.cum] creates a similar coating across her shoulders, neck, and breasts. The one after just piles onto the accumulated gunk, causing rivers of it to run down Jade’s belly, back, and ass. She shudders as she’s completely coated in your [pc.cumColor] release, one hand eagerly rubbing it into her fur");
			if(pc.cumQ() >= 2000) 
			{
				output(", but you’re far from done. You shoot and shoot until she’s sitting in a ");
				if(pc.cumQ() <= 3000) output("puddle");
				else if(pc.cumQ() <= 6000) output("deep puddle");
				else if(pc.cumQ() <= 9000) output("foot");
				else if(pc.cumQ() <= 18000) output("a knee-deep pool");
				else if(pc.cumQ() <= 25000) output("lake");
				else output("ocean");
				output(" of the stuff");
			}
			output(".");
		}
	}
	output(" She finds the sense to curl one arm underneath her dampening cleavage and squeeze it together, maximizing your enjoyment until you finally sag with relief.");

	output("\n\nJade lets you slip out of her soaked mammaries with a gasp of surprise, and together, the two of you take a tumble backwards onto a well-used couch. It’s comfortable and soft - the perfect place for two sexually sated individuals to come down on. The panda-woman doesn’t let you stay long. She seems keen to wash up, so you let her go ");
	if(pc.isNice()) output("with a quick kiss");
	else if(pc.isMischievous()) output("with a playful spank on her curvy rear");
	else output("with a smirk");
	output(". Making yourself presentable, you gather up your " + pc.armor.longName + " and dress before heading out into public. Jade follows not longer after, looking radiant and smelling vaguely of your tryst.");
	processTime(20+rand(10));
	chars["JADE"].orgasm();
	pc.orgasm();
	pc.shower();
	sexedJade();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Furious Face-Sitting
public function sitOnjadesFace():void {
	clearOutput();
	showJade(true);
	output("Smiling as wantonly as you can, you suggest that she put that snout to work in [pc.oneVagina] while you count how many orgasms your hands can wring from her breasts.");
	//First time
	if(flags["TIMES_SAT_ON_JADES_FACE"] == undefined)
	{
		flags["TIMES_SAT_ON_JADES_FACE"] = 1;
		output("\n\n<i>“To do that you... you’d have to sit on my face,”</i> Jade says, wide-eyed. Her brow lowers a second later. <i>“You knew that. Of course. I just hope you’re ready to handle my tongue.”</i> She waggles the thick, pink protrusion at you. It looks like it would fit nicely.");
	}
	//Repeats
	else
	{
		flags["TIMES_SAT_ON_JADES_FACE"]++;
		output("\n\n<i>“[pc.name], I’m starting to think you like holding down the big panda gal and abusing her tits,”</i> Jade says, smiling mirthfully. <i>“Well, I like having my boobs played with just as much, so let’s do this.”</i>");
	}
	output("\n\nThe full-figured woman lays herself back on a well-used couch, giggling nervously, before looking up at you and beckoning you over. You’re out of your [pc.gear] in an instant and ");
	if(pc.isNaga()) output("snaking up onto the edge of the couch to");
	else if(pc.legCount != 2) output("awkwardly positioning your [pc.butt] to");
	else output("climbing up onto the edge of the couch to");
	output(" align your [pc.vagina] with her onyx lips. Her pink tongue licks out, wetting her mouth in anticipation as you settle in, your ");
	if(pc.legCount == 1) output("[pc.leg] ");
	else output("[pc.legs] ");
	output("pressed against her head. You grab her breasts, not just out of desire but also for stability. Wetness and desire enflame your entrance");
	if(pc.vaginaTotal() > 1) output("s");
	output(" just before you touch down, feeling her hot breath a moment before her cold nose brushes against you.");
	output("\n\nThe contrasting temperatures momentarily paralyze you, but Jade’s softly padded paws pull you down by the [pc.hips], firmly pressing your womanly entrance against her hungry muzzle. Her girthy organ emerges from between her luscious lips to dive into yours, and you gasp in surprise at how nicely its warmth fills you. You start rubbing and squeezing the plush shopkeeper’s sizeable bust before you lose yourself in pleasure, letting your fingers sink deep into her soft flesh when you squeeze.");
	output("\n\nJade rewards you with a throaty purr of excitement. It isn’t feline in origin but it is enough to make her tongue vibrate pleasantly inside your increasingly wet channel. The panda works her short, thick length as far in as she can, then rapidly withdraws it before punching it in once more, fucking the first two inches of sensitive pussy. She twists and adjusts herself to make sure that her sable kissers get to brush");
	if(pc.hasClit()) output(" [pc.eachClit]");
	else output(" your female lips");
	output(" again and again, and soon, she has you whimpering and moaning, your juices running free and unrestrained.");
	output("\n\nLikewise, your palms are doing quite a number on her sensitive bosom. When you aren’t squeezing, you’re stroking, or caressing... or even pressing them together while your thumbs slide over her fur. You can see from your vantage just how much your curvy lover is appreciating the attention; her pussy practically gleams with leaking lust. Her hips are even beginning to undulate against an imaginary lover, though you are doing little better. You begin to grope her more aggressively in an effort to get her to cum first.");
	output("\n\nJade trembles beneath you, holding onto your [pc.hips] with such passion that the tips of her claws are pricking at your skin. She varies her movements, sometimes tongue-fucking you, other times dragging her slippery organ up and down across your entrance");
	if(pc.hasClit())
	{
		output(", sometimes suckling ");
		if(pc.totalClits() > 1) output("a ");
		else output("your ");
		output("bud");
	}
	output(", humming her muffled sounds of excitement into your mound. You’re grinding back against her in short order, watching her pussy leak in a way that likely mirrors your own until climax interposes itself between you and your rational thoughts.");
	output("\n\nYour back arches, but so does Jade’s, keeping her melons firmly in your spasming fingers for further molestation. [pc.EachVagina] ");
	if(pc.isSquirter()) output("erupts in gushes of [pc.girlCum], splattering the poor panda’s face.");
	else if(pc.wetness() <= 2) output("drips");
	else output("releases a river of");
	output(" [pc.girlCum], soaking the poor panda’s face. Her sable sex visibly engorges, and you can actually watch the streams of girl-honey escape from her depths, one after another. The sapphic climaxes speed both her tongue and your rough handling of her velvety boobs until the two of you dissolve into an uncoordinated pile of twitching, blissed-out pleasure.");
	output("\n\nJade stirs first, murmuring, <i>“Not bad, [pc.name].”</i> She cuts an interesting figure with her face covered in your [pc.girlCumColor] juices, but before you can comment on it, she wrangles you into a kiss, forcefully dragging your body into a cuddle whether you meant to or not. Your muscles are still a little slack from the orgasm, so resistance isn’t much of an option. She’s as passionate a kisser as she is a pussy-licker, and by the time she releases you, you’re nearly as stained as she is.");
	output("\n\nJade giggles, and smiles. <i>“I suppose we should get cleaned.”</i>\n\nYou nod.");
	if(pc.hasPerk("Ditz Speech")) 
	{
		output(" <i>“You lick pussy so well! You could be like, a galactic champion cunt-licker!”</i>");
		output("\n\nJade just shakes her head and smiles wistfully.");
	}
	output("\n\nThere’s a bathroom around a corner where you wash your face alongside the panda. You catch her lapping your juices off her face and fingers when she thinks you aren’t looking.");
	//Woo woo! Done.
	processTime(30+rand(10));
	chars["JADE"].orgasm();
	pc.orgasm();
	pc.shower();
	sexedJade();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//TENTACLE NIPS EXPANSION
//How to trigger
//Use the scene Gropegasm 3 times to trigger a scene where insight is provided to the PC. Open Nipples topic. Upon talking to her about Nipples, she will say there is a product on the market, but she doesn’t have enough money to get it for herself, so she asks the PC if they can’t pitch in and help her with get the mod. Promise to make it worth their while if they do.
//Value to be determined by Fen.
//Since this will ultimately lead to an unexpected mutation in Jade. A variant of the Nipples topic can be created where she explains she’s threatened to sue the company responsible for the mods and as a result she got a deal with them to sell their products. So she’d start stocking the mod.

//Tenta-nips TF to be done on demand. Providing said TF is not part of the scope of this project.


//Talk: Nipples
//Must have received the insight.
public function talkToJadeAboutHerNipples():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade();
	if(chars["JADE"].hasTentacleNipples())
	{
		//alk: Nipples (After Mod)
		//This replaces the normal Nipples topic after she gets modded.
		//It also enables the PC to access the tenta-nips related scenes.
		output("<i>“My new nipples, [pc.name]?”</i> the panda asks, a mischievous glint in her eyes. <i>“What about them?”</i>");
		//Kind:
		if(pc.isNice()) output("\n\nYou were wondering how they’ve been treating her. That mutation was pretty unexpected, and considering how sensitive she is, she’s bound to be having some trouble with them.");
		//Mischievous:
		else if(pc.isMischievous()) output("\n\nYou are concerned about how she’s adapting to them and their quirks. It’s not every lady that has such a fine pair of tentacle-nipples, after all. Plus considering how sensitive they are, she‘s bound to be having some trouble adapting, no?");
		//Hard:
		else output("\n\nHer mutation was pretty unexpected. You admit you’re curious as to how she’s adapting to her new tentacle-nipples, considering she’s so sensitive there.");

		output("\n\n<i>“Ah, so that’s what you were wondering about. I won’t deny they’re a little tricky - I mean, I wasn’t expecting nipples with minds of their own when I got modded - but, all in all, I’d say I’m adapting nicely,”</i> the panda replies with a giggle. <i>“Luckily, they didn’t amp up my normal boob sensitivity, or I’d never get them to go down,”</i> she declares, indicating the flatness of her areolae with her fingertip.");

		output("\n\nYou nod in understanding, then ask, <i>“So? Do you like them?”</i>");

		output("\n\nShe beams hugely and nods her head. <i>“I love them! I mean, don’t get me wrong, I did call up the company to complain about the mutation. I didn’t see ‘may cause tentacle nipples’ on the box, did you? But I certainly don’t intend to go and get them removed,”</i> she declares cheerfully. <i>“And before you ask, no, they don’t know why I had this happen to me either. They suggest it might have been because of my earlier mods, or my species, or even a combination of the two, but they still couldn’t figure it out. They’re actually interested in getting some DNA samples from me, see if they can’t make deliberate tenta-nipple mods,”</i> she notes, sounding very proud of that fact.");

		output("\n\nThings seem to be turning out okay for her then. She’s handling everything exceptionally well. Anyone else would’ve been pretty freaked out about the change she’s undergone. Does that mean she’s enjoying her mutation?");

		output("\n\n<i>“You bet your sweet fingers I am,”</i> Jade replies, grinning so wide it looks like her face is going to fall off. <i>“They might not listen to me most of the time, but I swear it’s like they know my body better than I do - it feels so damn good when they get to work!”</i> She closes her eyes and shudders in pleasure just thinking about it. <i>“Mmm, yeah, if you ever want to enjoy them too, all you need to do is ask. I’ll even let you prime them for me,”</i> she declares.");

		//First Time:
		if(flags["TALKED_WITH_JADE_ABOUT_NIPPLES_AFTER_NIPPLE_TF"] == undefined)
		{
			output("\n\nPrime them? You look at her in confusion.");
			output("\n\nAt your look, she explains, <i>“You can see how they’re all flat right now? Well, they go like that whenever I’m not horny, and I can’t control them well enough to make them pop out when I like. So, I need to get myself turned on first. Just keep on rubbing and touching my tits and out they pop, ready to get to work,”</i> she grins lecherously at the thought.");
		}
		else
		{
			//Kind:
			if(pc.isNice()) output("\n\nSure thing. If she enjoys it that much, then you’ll make sure to tease her nipples out as much as you can.\n\n<i>“You say the sweetest things,”</i> she giggles, looking very pleased at the prospect.");
			//Mischievous:
			else if(pc.isMischievous())
			{
				output("\n\nYou chuckle. Could it be that she’s developing a tentacle fetish now? Maybe she’d like it if you found a few holos on the subject? Maybe even one that has her being molested by a bunch of slimy, sticky appendages touching all over her body? Making out with her own tenta-nips?");
				output("\n\nShe smiles, looking a little distracted at the thought, then shakes her head. <i>“Don’t make promises you can’t keep, [pc.name], you big tease,”</i> she playfully chides you with a waving finger. <i>“But, either way, you’re always welcome to come and play with me....”</i>");
			}
			//Hard:
			else output("\n\nOf course you’ll have to prime them. You didn’t get her those nipples only for her benefit. So, you’ll just come and play with them whenever you feel like it.\n\n<i>“And what makes you think I’ll let you?”</i> she huffs indignantly, pouting in wounded pride. A heartbeat later, she giggles. <i>“Oh, who am I kidding? Of course I’ll let you. Come and play whenever you like - I like playing with you.”</i>");
		}	
		//back to talk menu
		talkToJade(false);
		removeButton(4);
	}
	else
	{
		//First Time
		if(flags["TALKED_WITH_JADE_ABOUT_TENTACLE_NIPPLES"] == undefined)
		{
			output("<i>“Yes? What about them?”</i> she asks politely, giving you a curious look.");
			//Kind:
			if(pc.isNice()) 
			{
				output("\n\nYou explain that you were wondering what she thinks about getting nipples of her own. No pressure, you’re just curious.");
				output("\n\n<i>“Getting nipples of my own?”</i> she asks slowly, then smiles. <i>“Truth be told? As much as I love my tits and their super-sensitivity, I’ve always wanted to get nipples to go with them. I mean, they just don’t quite look right without them... plus, if my boobs feel this good to touch now, then what will happen if I have nipples to play with too?”</i> She lets out a luxuriant purr at the thought, actually daring to caress the spot where a nipple would be with her finger, sending a pleasure-sparked quaking jiggle through her mighty cleavage.");
			}
			//Mischievous:
			else if(pc.isMischievous())
			{
				output("\n\nHer boobs feel great, and you love teasing and groping them. From what you can see, she loves it just as much as you do. The thing is, she’s lacking the proper equipment for you to properly tease her. Has she ever bothered to search for a mod to get a pair of buds for her mounds?");
				output("\n\n<i>“Mmm, yes, yes I have,”</i> she admits, a little sheepishly. <i>“I do love what my boobs can do, but the idea of adding nipples is really, really tempting.”</i> As if to emphasise it, her fingers gently trace where a nipple would be, the touch on her super-sensitive titflesh making her shudder in pleasure.");
			}
			//Hard:
			else
			{
				output("\n\nNo sense beating around the bush. You ask her if she knows of any mods that could cause nipple growth. If her breasts feel this good without a pair of sensitive nubs for you to pinch, you were wondering what they’d feel like if she did have them.");
				output("\n\n<i>“Probably wonderful,”</i> she admits absently, smiling wistfully as she imagines it. Her fingers brush where nipples should be and her boobs ripple deliciously at the resultant shudder of pleasure. <i>“Oh! Uh, yes, I know of a mod that could give them to me,”</i> she informs you, realizing you asked her another question first.");
			}
			output("\n\nIf she knows of something, then you’re willing to help her secure some of it.");
			output("\n\n<i>“Oh, but it’s so expensive - I can’t afford to buy a pack for myself, even with the profits this shop makes,”</i> Jade laments, shaking her head at the thought of it.");
			output("\n\n<i>“How much?”</i> you ask her.");
			output("\n\n<i>“It costs 4500 credits,”</i> she replies. She then blinks in surprise. <i>“Oh, [pc.name], you’re not suggesting you want to...? I couldn’t ask you for that!”</i> she protests.");
			processTime(2);
		}
		//Repeatable
		else
		{
			output("<i>“No, I still don’t have the funds to afford it,”</i> she sighs wistfully, shaking her head. <i>“And naturally I couldn’t ask you for money, so... I guess I’ll just have to put it off until I’ve saved up enough credits,”</i> she declares, shrugging her shoulders stoically at the thought.");
		}
		//[GiveCredits][No]
		clearMenu();
		addButton(1,"No",turnDownJadeNips);
		if(pc.credits >= 4500) addButton(0,"Give Credits",giveCredits);
		else addDisabledButton(0,"Give Credits");
	}

}

//[=No=]
public function turnDownJadeNips():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade();
	if(flags["TALKED_WITH_JADE_ABOUT_TENTACLE_NIPPLES"] == undefined)
	{
		flags["TALKED_WITH_JADE_ABOUT_TENTACLE_NIPPLES"] = 1;
		output("You were considering it, but right now you can’t afford to help her.");
		output("\n\n<i>“Seriously, [pc.name], you don’t need to do that,”</i> she insists. <i>“Even if you did have the money, really, I’m fine with just these - I would never ask for a hand-out of that nature.”</i>");
		output("\n\n<i>“That doesn’t mean I’m not grateful for the offer. Thank you, I really appreciate the gesture,”</i> she tells you sincerely, a smile on her face. <i>“Well, now; is there anything else I can do for you?”</i>");
	}
	else output("You still can’t afford to help her, so you don’t say anything.");
	talkToJade(false);
	removeButton(4);
}

//[=GiveCredits=]
public function giveCredits():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade();
	flags["TALKED_WITH_JADE_ABOUT_TENTACLE_NIPPLES"] = 1;
	output("You take your codex in hand and prepare to wire her the necessary credits.");
	output("\n\n<i>“[pc.Name]... really, you don’t need to do that; it’s far too generous!”</i> the panda protests.");
	//Kind:
	if(pc.isNice()) output("\n\nNonsense. A cute panda like her should definitely have some nipples of her own. You finish typing and hit the confirmation button, sending her the credits.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nIn that case all she has to do is show you how thankful she is for your donation. If it makes it any easier, she can think of that as an investment on things to come. You grin as you finish typing and hit the confirmation button, sending her the credits.");
	//Hard:
	else output("\n\nThis is as much for you as it is for her. You wouldn’t mind coming into the shop and having your eyes fall on a pair of luxurious boobs and perky nipples. It gives you something more to appreciate when you’re around. Plus, you’re pretty sure it’ll make things more interesting when you’re both having fun. You finish typing and hit the confirmation button, sending her the credits.");

	output("\n\nShe stares at you, then shakes her head, but takes up her codex and taps at it. <i>“Confirmation of transaction approved,”</i> she announces. She puts it away and then looks up to meet your eyes, grinning broadly. <i>“I cannot thank you enough for this generosity, [pc.name] - you really didn’t have to do this, but I’m so grateful that you did. I’ve got to go get this stuff, so let me close up a few minutes. Meet me back here in a bit, and I’ll show you the change, okay?”</i>");
	output("\n\nYou nod and step outside.");
	//(Fen how long it takes for her to acquire the mod is up to you. But ideally I’d like to trigger “Jade uses the mod” in the next visit to her shop.)
	pc.credits -= 4500;
	processTime(15);
	flags["JADE_NIPPLE_TF_QUEUED"] = 1;
	//Move to outside, pass 20m
	clearMenu();
	addButton(0,"Next",move,rooms["FUR EFFECT"].eastExit);
}

//Jade uses mod
//Starts as soon as Jade has her mods and PC enters her shop.
public function jadeUsesNippleMod():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade();
	flags["JADE_NIPPLE_TF_QUEUED"] = 2;
	output("As you enter Jade’s shop, you see the panda-girl waving you down.");
	output("\n\n<i>“Hello! [pc.Name], I’m so glad to see you,”</i> she cheerily announces. <i>“It’s finally here! The mod you bought me finally got here. I’ve been just itching to apply it... but, since you were so nice as to pay for it in the first place, I, well, I wanted you to do the honors,”</i> she admits, looking a little sheepish as she smilingly tells you that. <i>“Please, won’t you come out the back with me? You can watch everything there without any... interruptions,”</i> she suggests.");
	output("\n\n<i>“Sounds like a plan,”</i> you reply.");
	output("\n\nOnce you’re sure no one will interrupt you, you take the box and examine it.");
	output("\n\nThe label says: “Nipplelux.”");
	output("\n\nContents: Two subdermal injectors and one anesthetic paste for application on sensitive flesh.");

	output("\n\nIt seems pretty straight forward. You read the instructions before removing the paste and popping the little tube open. <i>“Ready?”</i> you ask her.");

	output("\n\nShe nods her head eagerly. <i>“I certainly am.”</i>");

	output("\n\nFirst, you apply a small quantity of anesthetic to the center of each mound, then take one injector and press it against the paste, spreading it along the tip of the injector, as well as around Jade’s boobflesh.");
	output("\n\nThe panda smiles blissfully at the sensations, then blinks. <i>“Wow, that stuff really works; I’m losing feeling in my boobs.... Yep! Completely numb, now,”</i> she declares once you’ve finished.");

	output("\n\nYou press the trigger and with a little hiss and a beep the injector empties its contents. Jade jumps a bit in surprise. Though the anesthetic can numb the pain, or pleasure, on her sensitive breasts, you bet she can still feel the microsurgeons being injected somehow.");

	output("\n\nTaking the other injector, you repeat the process on her other mound. The instructions say it can take up to five minutes for the changes to start taking effect, so all you gotta do is wait.");

	output("\n\n<i>“Thank you so much for this, [pc.name]. Not just for buying it, I mean.... Ooh! I can feel it starting,”</i> she grins, arching her shoulders and lifting her breasts up so you can get a better view of the show.");

	output("\n\nHer soft fur starts flaking off the peak of her orbs, an ever expanding circle of ebony flesh forming into what you presume will be her aureoles. Looking at Jade, she seems to be panting as the changes take effect. <i>“Has the anesthetic worn off yet?”</i>");

	output("\n\n<i>“I - ah! - I guess it has,”</i> she pants, fingers flexing as she fights the urge to grope herself. <i>“I can feel it... tingling, but in a good sort of way.”</i>");

	output("\n\nIt takes a bit longer before a perky nub forms inside her aureole, completing her transformation. <b>Jade now has a pair of nipples.</b>");

	//Kind:
	if(pc.isNice()) 
	{
		output("\n\n<i>“Can I touch them?”</i> you ask.");
		output("\n\n<i>“Of course, [pc.name]; I’d never say no to you,”</i> she says, grinning at the thought.");
	}
	//Mischievous:
	else if(pc.isMischievous()) 
	{
		output("\n\nHovering your hands over her bosom and wiggling your fingers teasingly, you smile at her as you heft her breasts, slowly closing in on her new nipples as you do so.");
		output("\n\nShe purrs in pleasure at your touch, rolling her shoulders as she lets you carry some of the weight of her copious titflesh. <i>“Mmm... go right ahead, [pc.name]; I want to see what these babies can do,”</i> she groans.");
	}
	//Hard:
	else
	{
		output("\n\nYou reach out and circle one of her nipples with the tip of your finger, gently pinching and tugging on it.");
		output("\n\nA soft and sudden gasp of shocked pleasure explodes from her mouth, her eyes closing and her head tilting back as she basks in the sensations you’re giving her. <i>“Oh, yeah, that’s the stuff,”</i> she moans dreamily, an expression of bliss plastered on her face.");
	}
	output("\n\nSeeing no need to hold back, you begin actively groping her breast flesh. You can’t help but chuckle when you feel her little nubs hardening under your caress. In fact, they’re pretty hard, and... are they getting longer?");
	output("\n\n<i>“Oh... don’t stop, [pc.name], please; that feels so good,”</i> Jade moans, head tilting backwards and sighing rapturously, her own hands reaching under her mighty cleavage to help heft her boobs upright.");

	output("\n\nSomething doesn’t feel right. You remove your hands. To your surprise, Jade’s nipples seem to be growing bigger by the second, and wiggling, almost like tentacles!");
	output("\n\nThe panda is oblivious to this unnatural turn that her modification has taken. As you watch, the black, pointed tentacles reach out and out, looping back around her breasts and starting to squeeze and caress them. Jade’s eyes are screwed shut now, an expression of pure bliss on her face, panting heavily as her nipples milk her tits with freakish grace. She gasps, groans and shudders. <i>“I... I!”</i> she tries to say something, but it gives way to a whorish moan, the scent of sex filling the air as, with a body-wracking shudder, she creams herself, skirt visibly staining with her climax.");

	output("\n\nDespite her recent orgasm, her nipples continue their relentless assault on Jade. Maybe you should help her try to contain her new appendages? Then again, she seems to be enjoying herself...");

	chars["JADE"].breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_TENTACLED;
	processTime(10+rand(5));
	chars["JADE"].orgasm();
	clearMenu();
	addButton(0,"Help Her",helpJadeWithHerNewNipples);
	addButton(1,"Watch Her",watchJadesNewNipplesMolestHer);
}

//Help Her
public function helpJadeWithHerNewNipples():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade(true);
	output("You try to grab the tentacles encircling her mounds, but all that you accomplish is getting them to wrap around your wrists instead and tug your hands towards Jade’s breasts. They don’t feel too strong; you bet you could pry them off with some insistence if you wanted, but that could hurt Jade. Well, since you seem to have gotten roped in on this, might as well as make the best of the situation and help Jade get her rocks off in the process.");
	output("\n\nFollowing the lead of the relentless tugs on your wrist, you let Jade’s tentacle-nips guide your hands to caress her breasts. More and more of her prehensile nipples wrap around your arms, the panda-girl long since reduced to a moaning pile of fuck. The only thing she can do is moan, groan, and cream herself as you continue to molest her.");
	output("\n\nA fleshy tip strokes your [pc.lips] and you look down to see that one of Jade’s nips seem to have made their way around your arm and up to your face. Having no reason to deny it, you open your mouth and let it crawl inside. This is... quite a weird way to lick someone’s nipples, but you suppose there are weirder ways to do it.");
	output("\n\nYou lose track of time as you watch Jade writhe under your ministrations....");
	processTime(5);
	chars["JADE"].orgasm();
	pc.lust(20+rand(15));
	clearMenu();
	addButton(0,"Next",jadesNippleTFEpilogue,true);
}
//Watch
public function watchJadesNewNipplesMolestHer():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade(true);
	output("Why bother when she seems to be enjoying it so much....");
	output("\n\nAs Jade opens her mouth in yet another moan, her nipples uncoil from around her boobs and spring back into action, evidently not sated yet. One squirms through the air and plunges boldly into her open mouth, plugging it up and muffling her voice as it forcefeeds itself into her. The other creeps down her belly, almost invisible against the black parts of her fur, and heads for her skirt, worming its way underneath. The lewd bulge it spreads downward through the green fabric, leaving no doubt as its progress, and a muffled cry manages to escape her mouth as it penetrates her. Within seconds of it doing so, she arches her back, her whole body quaking mightily in a second, heavy orgasm, drenching her skirt once more with her female cream.");
	output("\n\nJade seems to be stuck in nirvana.The sensitive nipples are rubbing all over her body and granting her unimaginable pleasure, reducing her to nothing more than a pile of moans, groans and cries of pleasure. The ever expanding puddle underneath her a testament to the amazing pleasure she’s been bound to. Frankly, the sight is quite hot. You feel yourself getting aroused as you watch her cum again and again....");
	processTime(5);
	chars["JADE"].orgasm();
	pc.lust(20+rand(15));
	clearMenu();
	addButton(0,"Next",jadesNippleTFEpilogue);
}
//Epilogue
//Both options rejoin here.
public function jadesNippleTFEpilogue(helped:Boolean = false):void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade(true);
	output("Jade’s nipples seem to have finally calmed down. They slowly retract back into her boobs. Once they are reduced to the little nubs you originally saw, they crawl inside her breast flesh, giving her inverted nipples.");
	output("\n\nWell, that was unexpected. You ask the panting, nearly passed-out panda if she’s alright.");

	output("\n\n<i>“Y-yeah, I’m alright,”</i> she pants, each heaving breath setting her mighty breasts a-quiver. <i>“I just need to - whew! - catch my breath, get my strength back. I’ll clean up and get back to work after I can walk again. Damn but that was intense! I mean, I never expected this to happen, but I’m not going to ask for a refund,”</i> she giggles, a dopey expression on her face.");

	//If PC helped:
	if(helped) output("\n\nShe shakes her head and gives you a sincere smile, a flirtatious light in her eyes. <i>“By the way... I didn’t miss you helping me deal with these,”</i> she points at her nipples. <i>“Thanks, and let me know if you ever want to give them another try.”</i>");

	//Kind:
	if(pc.isNice()) {
		output("\n\nSince you’re partially responsible for the mess, you decide to stick around and help her clean up. Plus you gotta thank her for the show too.");
		output("\n\nOnce you’re done, you leave her with a friendly smile.");
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nThat was quite a show. Very enjoyable. You decide to stick around and help Jade clean up after herself. Of course, you never miss an opportunity to tease her whenever she comes close. A little touch here and a little pinch there can really get the ball rolling again....");
		output("\n\nOnce you’re done you leave her with a mischievous smile. She seems a bit annoyed at your antics but waves you off with a sincere smile.");
	}
	//Hard:
	else
	{
		output("\n\nYou’d love to stay, but places to be, things to do. You bid her farewell and congratulate her on her newest acquisition, giving her breasts a parting flick as you leave.");
	}
	processTime(9+rand(4));
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].eastExit);
}


//SuckNipples
//No requirement.
public function suckJadesTentacleNipplesYouWeirdo():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade(true);
	output("Jade grins a knowing grin at your suggestion. <i>“Of course, [pc.name]; go ahead,”</i> she tells you, thrusting her ample bosom towards you and beckoning you with a crooked finger.");
	output("\n\nYou follow after her, and as soon as the door is closed you bring your hands to her breasts. Still as sensitive as ever.");
	output("\n\n<i>“Mmm, you haven’t lost your touch,”</i> Jade moans in glee, eyes closing as she savors the feeling.");
	output("\n\nThe smooth flesh of her areolae feels sublime. You tease around the opening of her inverted nipples, circling it with the tip of your finger. Then, finally, you stick the tip of your finger inside.");
	output("\n\nA quiet squeak of delight escapes the panda, her tongue momentarily lolling from her jaws at the feeling you penetrating her flesh in such a way.");
	output("\n\nYou can feel the nub inside, hardening, growing. It takes only a moment before your fingers are ejected by the excited nipples. Regardless, you press your advantage. You flick your [pc.tongue] on one nub, carefully encompassing it with your mouth, gently nibbling while you pinch and tug the other perky tip.");
	output("\n\nShe groans deep and low, her whole body quivering with delight. <i>“T-that’s the way to do it,”</i> she moans eagerly.");
	output("\n\nYou continue nursing, until you feel the nipple start growing inside your mouth. Not keen on deepthroating her just yet, you immediately switch to her other mound, giving it the same treatment.");
	output("\n\nBy the time you’re finished, Jade’s nipples are already small tentacles writhing on her jiggling bosom as she pants excitedly. Now... which one should you begin with?");
	output("\n\nJade gasps as you cup one of her breasts. Gently you wrap your fingers around a extended nipple, smiling as it coils delicately around your hand and your wrist. You stroke the underside of Jade’s other nipple and smile when you get a similar reaction.");
	output("\n\nBringing it closer to your [pc.face], you blow softly on her tentacle-nip. This earns you a shudder and a light moan. She’s so sensitive... teasing Jade is a lot of fun, but it’s time to take this a step further. Letting your [pc.tongue] hang loose, you give her sensitive tenta-nip a lick.");
	output("\n\n<i>“Oooh!”</i> she squeals, grinning widely as a shiver of pleasure literally ripples down her nipple, sending her tits quaking from the motion. The tentacle wriggles with momentary franticness, and then curls itself tightly up into a spiral shape, as if to protect itself from your teasing tongue.");
	output("\n\nYou deliver feather kisses along her coiled length, chuckling as each one causes the prehensile nipple to undulate in your grasp and become a little bit looser. Tentatively, you find the shuddering tip of her prehensile nip and tease it with the tip of your tongue.");
	output("\n\nThe panda moans gleefully, her nipple uncurling like the tentacle it is and starting to gently brush against your tongue and your lips with feather-light motions. Almost as if jealous, the other nipple worms over, coiling around your arm and pausing with its pointed tip in front of your face and undulating sinuously, expectantly even.");
	output("\n\nGrinning, you abandon her current nipple to give her other one a similar treatment. However this time you curl your tongue around it invitingly, the prehensile appendage dancing with your muscle as you hook it and bring it closer. When it’s close enough, you suck it in, smiling as the length of her nipple begins entering your mouth of its own accord.");
	output("\n\nA series of short, gasping moans escape Jade’s mouth, her head tilting back and her eyes screwing closed as the feelings you are giving her wash over her. Her legs visibly buckle, sending her stumbling back against a desk that she clutches frantically for support, her whole body quivering. She tenses hard, her legs clenching, even the nipple-tip between your lips suddenly rock hard against your tongue. The scent of sex fills the air as something wet spatters against the floor underneath her - she just came!");
	output("\n\n<i>“The first of many,”</i> you think to yourself. Returning to the task at hand, you continue to suckle her, wrapping your [pc.tongue] around her length as it writhes inside your mouth. While you do this, your other hand gently kneads her other extended nipple, slowly massaging and pinching it.");
	output("\n\nThe panda moans luxuriantly, her nipples writhing against you and her bosom quaking with pleasure. The nipple in your mouth squirms insistently, trying to wriggle its way deeper and deeper into your mouth so that more of it can be exposed to your tickling tongue and caressing lips. The other nipple curls gently around your shoulders, looping over the back of your neck and reaching up to brush affectionately against your cheek with the air of an attention-seeking kitten.");
	output("\n\nSince her other nipple is feeling left out, you decide to open your mouth in invitation. Jade’s nipples are narrow enough that you can probably take two of them at once. Plus, it’ll be fun watching the panda squirm in pleasure.");
	output("\n\nIn a characteristic display independence, the free nipple springs forward, extending further so that it remains looped around your neck, but slides forward to join its sister in diving into your mouth. Both nipples start to grow, pushing their way deeper into your mouth until they are wriggling their way down your throat.");
	output("\n\nHer insistent intrusion triggers your gag reflex, but you easily recover and adjust yourself so both her nips can go deeper into your neck. Now that your hands are free, you decide to lay them on her breasts. You fondle and squeeze her bosom, smiling to yourself as you feel the tentacles writhe inside your mouth due to Jade’s pleasure.");
	output("\n\nThe nipples squirm frantically inside your gullet, a rumbling cry echoing up Jade’s throat as her whole body quakes in a second climax. Her bosom jiggles most pleasingly with the force of her orgasm, her legs buckling to the extent that she can’t keep herself upright anymore. With a great groaning sigh of release, the panda slides slowly down onto the floor, falling flat on her cushiony great ass with a heavy thud, panting with exertion. Despite this, her nipples remain wedged in your mouth, still idly rippling and twitching.");

	output("\n\nIt looks like you really pushed her over the edge this time. Regardless of their owner’s state, her tentacles seem intent on continuing to writhe in your mouth....");

	//Kind:
	if(pc.isNice()) output("\n\nYou gently maneuver your arms, careful not hurt Jade with a careless tug on her coiled tenta-nips. Jade’s probably had enough. You don’t want to knock her out cold when she has a business to run.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nAs fun as that was, enough is enough. And while you could easily knock the panda out with a few more expert licks and sucks, she does have a business to run. You carefully move your arms to try and pry her clingy tentacles off you.");
	//Hard:
	else output("\n\nYou’ve had enough. It’s time to pry her little feelers from your mouth and end this. Maybe you’ll pleasure her again next time. With that, you maneuver yourself to start pulling her tenta-nips from your mouth.");

	output("\n\nWith a bit of work, particularly on her right nipple, you manage to get them out of your mouth. Jade shudders in pleasure as you handle her nipples, but otherwise doesn’t seem troubled that you’re ending this little venture. Once you’re done, her tentacles begin slowly receding back into her swells of flesh.");
	output("\n\nJade’s face is split the biggest, dopiest grin you’ve ever seen. <i>“Oh, thank you, [pc.name], that was... well, that was just incredible. I can barely feel my legs!”</i> she pants, sounding very pleased with that. <i>“Please, don’t be a stranger, alright? And don’t worry about cleaning up; I’ll take care of things later... when I can stand up again, anyway,”</i> she giggles. She slumps back against the desk leg with a satisfied sigh, still smiling away.");

	//Kind:
	if(pc.isNice()) output("\n\nYou helped her make the mess, so it’s only fair that you help her take care of it. You stay for a while longer, not leaving until everything is taken care of and she can stand again.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nYou’re not the type to have your fun and leave. You decide to help her clean up. This also gives you more time to tease and grope her whenever she comes within range. By the time you’re done, she announces she’ll need a bit more time before going back out to tend to her store. Chuckling, you bid her farewell, fully aware of what she’ll be doing by her lonesome in there.");
	//Hard:
	else output("\n\nYou tell her you’ll be back later, then proceed to leave the overpleasured panda-girl behind.");

	chars["JADE"].orgasm();
	chars["JADE"].orgasm();
	processTime(25+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//BoobToBoob
//PC needs to be at least C-cup, or however much you feel is fair Fen.
public function boobToBoobSexathon():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade(true);
	var x:int = pc.cockThatFits(chars["JADE"].vaginalCapacity());
	output("Jade’s eyes visibly light up, a smile pursing her lips. <i>“That sounds like it could be a lot of fun,”</i> she chortles. <i>“All right, strip off, and let’s have some fun,”</i> she declares happily; if the panda had a tail big enough for it, you’re certain she’d be wagging it.");
	output("\n\nYou immediately get to work on peeling off your [pc.gear]. By the time you’re done and turn to look back at Jade, she’s already stripped herself and folded her minimal clothes into a neat pile atop a nearby table.");
	if(pc.hasCock()) output(" A stirring in your loins giving away your appreciation of her naked form.");

	output("\n\nWith a seductive grin, the deliciously curvy panda girl advances towards you. Her swaying step emphasises the wide, womanly curves of her hips, and you know that from behind the view of her ass must be incredible. Each step towards you reveals tantalising flashes of her little black pussy, however, you certainly don’t feel cheated as she stops in front of you. With a mischievous tilt to her eyes, the buxom morpher reaches out and gently pushes at your [pc.chest]; not hard, but enough that you get what she wants and seat yourself upon the seat.");

	output("\n\n<i>“Now that you’re all ready,”</i> she coos, bending forward slightly so that you are staring down the vast canyon of her cleavage, <i>“perhaps you’d be willing to lend me a hand in getting ready myself?”</i> As if in emphasis, her hand darts forward to ");
	if(pc.hasCock()) output("trail teasingly across [pc.oneCock]");
	else if(pc.hasVagina()) output("caress your netherlips");
	else output("stroke the bare flesh between your thighs");
	output(".");

	output("\n\nSince she asked so nicely, you see no reason to refuse her. You cup her breasts, sliding your hands around their circumference as you approach the black areolae that hide her tentacle-nips. Jade gasps when you insert a digit inside each of them, teasing the prehensile appendage to come out and play. It barely takes a moment before you feel the telltale push of her emerging tentacles.");

	//if PC.Cock=TooBig:
	if(x < 0 && pc.hasCock())
	{
		output("\n\nJade simply grins at you as her tentacles tickle your fingertips, her own fingers trailing up and down your mammoth [pc.cockNounSimple " + pc.smallestCockIndex() + "]. <i>“Mmm... too bad this bad boy is too big for me, or we could have some real fun. I’ll make do, but maybe you should shrink that down before you come back next time?”</i> she suggests, winking at you.");
		output("\n\nNot giving you time to answer, the panda shifts in closer, pressing her pillowy boobs against your face when she slides her legs in to straddle you. As she slides down into your lap, you can feel the warm, soft fur of her thighs trailing ticklishly over your mighty " + pc.mf("man-meat","girl-cock") + " as she lowers herself. The softness of her pussy scrapes along the underside of your oversized shaft, polishing you with a vulva that is far too dainty to fit you.");
	}
	//else if PC.Cock=Else:
	else if(pc.hasCock())
	{
		output("\n\nAn appreciative hum escapes Jade’s lips and she swishes her bountiful figure forward, momentarily blinding you with her huge boobs as she straddles your waist. You can’t see it, but you can certainly feel it as her warm vulva tickles over your [pc.belly] and drops down to envelop your [pc.cock " + x + "]. Clearly no virgin, she swallows you to the hilt, groaning with pleasure as she seats herself firmly in your lap. You can feel her squeeze you a little, on instinct, but she makes no active move to ride you, instead letting your erection nestle comfortably in her warm love-canal.");
		//Take virginity
		pc.cockChange();
	}
	//else if PC.clit=BigEnough:
	else if(pc.hasVagina() && pc.hasClit() && pc.clitLength >= 4)
	{
		output("\n\nShe shakes her head gently from side to side, a playful grin on her lips. <i>“I’d personally prefer a cock... but I think this bad girl here might do the trick,”</i> she declares, tickling the tip of [pc.oneClit] with an index figure. Before you say anything, she steps forward, muffling your words and blocking your vision with her impressive cleavage as she slides in to straddle your waist.");
		output("\n\nYou can’t see it, but you can certainly feel it as her warm vulva tickles over your [pc.belly] and drops down to envelop your [pc.clit]. Clearly no virgin, she swallows you to the hilt, groaning with pleasure as she seats herself firmly in your lap. You can feel her squeeze you a little, on instinct, but she makes no active move to ride you, instead letting your feminine erection nestle comfortably in her warm love-canal.");
	}
	//else if PC.pussy:
	else if(pc.hasVagina())
	{
		output("\n\nA click of her tongue and she looks at you with an understanding smile. <i>“Cock’s fun to play with, but the two of us can have plenty of fun with just us girls, right?”</i> she declares");
		if(pc.hasClit()) output(", playfully pinching your [pc.clit]");
		output(". Before you say anything, she steps forward, muffling your words and blocking your vision with her impressive cleavage as she slides in to straddle your waist. The plush panda-girl slides in until she’s quite comfortablly seated atop you, her warm feminine treasure pressed plush and firm against your own.");
	}
	//genderless!
	else
	{
		output("\n\nShe shakes her head with a slight look of disbelief. <i>“It’s quite a universe, isn’t it? Okay, I guess this will feel good enough for you without any extra help,”</i> she declares.");
		output("\n\nBefore you say anything, she steps forward, muffling your words and blocking your vision with her impressive cleavage as she slides in to straddle your waist. The plush panda-girl settles into your lap until she is quite comfortable seated atop you, her warm feminine treasure pressed plush and firm against your own featureless loins.");
	}
	output("\n\nWith a smile, Jade wraps her arms around your back as best she can, squeezing her own voluptuous tits against your [pc.boobs], gently rubbing them together. Her mouth opens into an O-shape, a soft moan echoing up from her throat as her tentacle-like nipples stretch out and out, sliding up and down the valleys of your respective cleavages to wrap themselves around both pairs of pressed tits like perverse pythons encircling their prey.");

	output("\n\nYou join her with your own moans of pleasure. ");
	if(pc.hasCock() || (pc.hasVagina() && pc.hasClit() && pc.clitLength >= 4))
	{
		output(" Her pussy contracts around your ");
		if(pc.hasCock()) 
		{
			if(x < 0) output("[pc.cock " + pc.smallestCockIndex() + "");
			else output("[pc.cock " + x + "]");
		}
		else if(pc.hasVagina()) output("[pc.clit]");
		output(", milking you despite neither of you bothering to buck against one another. ");
	}
	output("Your arms wrap around her, pressing your breasts tight to one-another. It feels great! you can only imagine how great it must be feel for Jade. You gasp at a particularly good stroke from her tenta-nips.");

	output("\n\nJade’s face is so close to yours. Her hot breath washes over you as she pants and moans. Those black, puffy lips of hers too tempting a target for you to resist. Leaning forward you gently lick at her lips, asking for entrance. When she parts them for a moan, you strike, pressing your own [pc.lips] to hers and shoving your [pc.tongue] inside her all in one stroke. Not wasting any time, you invite her tongue for a dance with your own, an invitation she doesn’t refuse as the two of you moan, muffled by your kiss.");

	output("\n\nThe panda’s arms creep up and down your back, caressing every inch of you that they can reach as she mashes her boobs against your own, grinding her crotch against yours. You can feel her nipples expanding, rhythmically squeezing and milking your tits with their remaining length, even as the two questing tips trail across your surface, reaching inexorable towards your own [pc.nipples].");

	//if lipples:
	if(pc.hasLipples())
	{
		output("\n\nThe moment her tentacles find your [pc.nipples], you find their lips opening up to draw those wonderfully sensitive nubs in, giving them an impromptu blowjob. A boob-to-boob blowjob.");
		output("\n\nBoth you and Jade gasp in unison, eyes closed shut as you bask in each other’s heat. Sweat forms and mingles on your bodies, filling the room with the steamy scent of female in heat.");
	}
	//if fuckable-nips:
	else if(pc.hasFuckableNipples())
	{
		output("\n\nFinding the perverse holes that are your [pc.nipples], Jade’s questing tentacles don’t hesitate for a second, worming their way through the tiny, labial openings and sliding inside, feeding themselves into your tits like twisted, prehensile cocks.");
		output("\n\nYou gasp, moaning into Jade’s mouth as her broad tongue forces itself inside your mouth. Stroked, breast-fucked and tongue-kissed - what a wonderful combination.");
	}
	//else if tenta-nips:
	else if(pc.hasTentacleNipples())
	{
		output("\n\nA shudder of excitement seems to ripple through Jade’s nipples as they meet your own questing, writhing tentacles. Like snakes they strike out, twining themselves around your nipples, snaring them in coils of warm black flesh and being snared in turn as your nipples respond by coiling them.");
		output("\n\nThe two of you moan in mutual delight, filled with the wonders of sensitive nipple-flesh writhing against each other and squeezing each other.");
	}
	//else if dick-nipples:
	else if(pc.hasDickNipples())
	{
		output("\n\nMoans escape your mouth as her tentacles tickle your hard, erect nipple-dicks, jabbing Jade in the tits with them and drooling precum over the soft, warm fur of her boobs. Jade doesn’t seem to care, instead feeding you her tongue, even as her tentacles coil themselves around your titty-dicks and start to stroke up and down, a perverse handjob on each one.");
		output("\n\nYour [pc.nipples] leak pre as they jab Jade’s boobs. And you moan, repeatedly, even as your breasts start to turn mushy from your leaking pre. The scent of sex filling the room in a most enticing aroma.");
	}
	else
	{
		output("\n\nThough your own hard nubs may be less exotic than hers, Jade wastes no time in playing with them, tickling and caressing, stroking and squeezing with her own tentacular nipples, squeezing in a way very, very few others could.");
		output("\n\nYou voice your appreciation, partially muffled by Jade’s broad tongue. She pushes and strokes you like an expert lover. If this keeps up, you don’t know how much longer you’ll last.");
	}

	//if cock too big:
	if(pc.hasCock() && x < 0)
	{
		output("\n\nThough you’re not inside her, you can feel each spasm from her black-lipped pussy, drooling Jade’s juices to lube your [pc.cock " + pc.smallestCockIndex() + "] as she grinds into you. And you throb, pre leaking onto the floor as you border the edge of a massive orgasm.");
	}
	//else if cock:
	else if(pc.hasCock()) output("\n\nEach spasm, each little contraction, her leaking juices and her milking pussy... you can feel them all. Even if you’re not moving, everything that’s going both down inside her and up there with her lipples and tenta-nips is enough to nearly push you over. Your [pc.cock " + x + "] throbs in warning. Anytime now, you’ll be shooting your [pc.cum] into the receptive panda-girl’s womb, much to your mutual pleasure.");
	else output("\n\nYou can feel her spasming pussy against your crotch. You reckon neither of you are capable of going much longer before you both climax and reach nirvana.");

	output("\n\nJade breaks your kiss and arches her back, whole body quaking mightily as climax rips through her, spattering your thighs with her feminine juices as she cums heavily in your lap. Her tentacles squeeze and wriggle madly, flailing across your breasts");
	if(pc.hasFuckableNipples()) output(" and inside your [pc.nipples]");
	output(" from the feeling of orgasm.");
	output("\n\nThough she cums first, you don’t stay behind. Her climax being enough to trigger your own as you hug her tightly, crying out to join her in a symphony of joint pleasure.");

	//if cock too big:
	if(pc.hasCock() && x < 0)
	{
		output("\n\nJet upon jet of hot [pc.cum] fires from your [pc.cocks], painting the wall");
		if(pc.balls > 0)
		{
			output(" as your [pc.balls] churn");
			if(pc.balls == 1) output("s");
			output(", squeezing every little bit of seed contained within.");
		}
		else output(" as you’re milked by the panda-girl’s thighs for every little bit of seed you can muster.");
	}
	//else if cock:
	else if(pc.hasCock())
	{
		output("\n\nYou erupt with the force of a volcano, cumming far more than you thought yourself capable of.");
		if(pc.balls > 0)
		{
			output(" Your [pc.balls] churn");
			if(pc.balls == 1) output("s");
			output(", the liquid load burning a path through your cumvein as");
		}
		else output(" You feel pressure in the back of your spine as");
		output(" you unload all your [pc.cum] into her hungry, milking pussy.");
	}
	//else if pussy:
	else if(pc.hasVagina())
	{
		output("\n\n[pc.EachVagina] clenches in sympathetic orgasm.");
		if(pc.hasClit() && pc.clitLength >= 4) output(" You didn’t count on her pussy squeezing your [pc.clit] so tightly, tight enough to send you reeling as you scream to the heavens in a perverted symphony that is your orgasm.");
		output(" [pc.GirlCum] dampens the couch as the two of you contribute in equal parts to soil it with your excess fluids.");
	}
	//else
	else output("\n\nYou shudder and spasm, pleasure culminating into an orgasm even though you have no holes or poles. For a moment, your mind goes blank, and when you come to you’re not sure if the screams echoing around are yours or Jade’s.");

	output("\n\nThe two of you slump together, a sweaty, messy mass of fuck and pleasure, both panting, out of breath after this earth-shattering orgasm.");

	output("\n\nIt is Jade who stirs first, smiling and nuzzling against your cheek. <i>“Mmm... that was simply wonderful, [pc.name]. Best I’ve had in some time. Oh, don’t worry about the mess, I’ve a little sink back here that I can use to wash up. But first, I want to rest for a while, get my strength back.... I don’t suppose you’d like to stay and rest too?”</i> she suggests. <i>“You make a very comfy seat,”</i> she chuckles.");

	//Kind:
	if(pc.isNice()) output("\n\nYeah, rest sounds good. Nodding you let yourself relax for a spell, slipping into a comfy post-sex nap.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nYou’d like to play more, but Jade’s really worn your out this time. So you just nod softly as you feel your consciousness fading, aided by the warm feeling of your afterglow. Naptime....");
	//Hard:
	else output("\n\nYou really need to be going. But you’d be lying if you said you’re not even a bit tired. Maybe a short nap oughta help. Yes, a nap sounds good....");
	//[Next Page]
	processTime(15+rand(10));
	chars["JADE"].orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",epilogueOfNippleOnNippleJadeSex);
}

public function epilogueOfNippleOnNippleJadeSex():void {
	clearOutput();
	author("Lukadoc & QBrowser");
	showJade();
	processTime(30+rand(10));
	output("When you come to, you note that Jade is absent, and though the room still smells like sweat and sex, it is surprisingly clean. It looks like Jade took care of everything while you were out. You find your [pc.gear] on the nearby table and quickly put it on, stepping out of the backroom.");
	output("\n\n<i>“Oh, hello, [pc.name],”</i> Jade calls to you as you, already back behind her counter. <i>“I hope you enjoyed yourself today. Please, come back any time,”</i> she says, the very picture of a courteous merchant, except, of course, for the very pleased look on her face as she waves you out the door.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Scene
public function jadeMuffStuffedDumplingsOffer():void
{
	clearOutput();
	showJade(true);
	author("Altair Hayes");
	output("You walk into Fur Effect, only to find the whole place empty save for a one of Jade’s legs, which promptly disappears into the employee room, chased by tittering laughter.");
	output("You follow after to find the plush panda sitting atop a countertop, facing away from you. She giggles again at the sound of your approach.");
	output("\n\n<i>“Hey [pc.name], I see you finally came for the dumplings,”</i> she then turns towards you, revealing her belly to look a few months pregnant. She starts to bite her lower lip, then shakes her head and straightens, looking you straight in the eye. <i>“Don’t be shy, they’re right here! I’m keeping them warm.”</i>");
	output("\n\nYou [pc.walk] towards her, suspicion slowly giving way to realization of what she’s done. When she sees your shift in expression slowly spreads her legs, clearly anxious about your reaction... up until a dumpling slips out of her plump panda pussy onto the counter, slick with her juices. At that, her legs fall completely open, revealing a well-stuffed and dribbling cunt.");
	output("\n\nYou stop in your tracks, should you continue?");

	processTime(2);
	clearMenu();
	addButton(0,"DigIn",eatMuffDumplings,undefined,"Dig In","She made these just for you, might as well eat a few... or a lot.");
	if(flags["JADE_MUFFLINGS"] == undefined) addButton(1,"YouJustAte",youJustAteJadesMuffInsWhatever,undefined,"You Just Ate","Politely pass up the free meal, claiming you’ve just ate. <b>You doubt she’ll ever offer again if you refuse.");
	else addButton(1,"YouJustAte",youJustAteJadesMuffInsWhatever,undefined,"You Just Ate","Politely pass up the free meal, claiming you’ve just ate. Maybe next time...");
}

//You Just Ate
public function youJustAteJadesMuffInsWhatever():void
{
	clearOutput();
	author("Altair Hayes");
	showJade(true);
	if(flags["JADE_MUFFLINGS"] == undefined) 
	{
		flags["JADE_MUFFLINGS"] = -1;
		output("<i>“Sorry Jade, I uh, just ate. Was just stopping by to say hi,”</i> you explain.");
		output("\n\nJade hangs her head and sighs heavily. After a pregnant pause, the dumpling-stuffed panda pushes her hair out of her eyes and doggedly straightens. <i>“That’s okay, I guess.”</i> She takes the cunt liquor-coated dumpling off the counter and tosses it in the trash. <i>“You’re missing out, though. They’re pretty damned good.”</i> Smirking now, she tosses her head in the direction of the door. <i>“Go on now. If you aren’t going to order from the menu, you’re not allowed in the restaurant. Chef’s orders.”</i>");
		output("\n\nYou get out while the getting is good.");
	}
	else
	{
		//7 Day CD.
		pc.createStatusEffect("MufflingsCD");
		pc.setStatusMinutes("MufflingsCD",10080);
		output("<i>“Sorry Jade, I uh, just ate. Was just stopping by to say hi,”</i> you explain.");
		output("\n\nJade furrows her brow and pouts her lips, before shrugging it off. <i>“That’s okay, more for me, or the next customer for that matter.”</i>");
		output("\n\nShe then takes the cunt liquor coated dumpling off of the counter and tosses it into her mouth. <i>“Thur rully good tho,”</i> she says with a full mouth, happily chewing as she lets loose another dumpling from her pussy and eats it. You leave her to it and exit Fur Effect.");
	}
	processTime(2);
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].eastExit);
}

//Dig In
public function eatMuffDumplings():void
{
	clearOutput();
	showJade(true);
	IncrementFlag("JADE_MUFFLINGS");
	author("Altair Hayes");
	//7 Day CD.
	pc.createStatusEffect("MufflingsCD");
	pc.setStatusMinutes("MufflingsCD",10080);
	sexedJade();
	output("With a greedy smile you rush towards the counter, more than happy to start eating.");
	output("\n\nYou start by sampling the one on the counter, the mixed tastes of pussy juice and a sweet fruity dumpling complementing each other quite nicely. As soon as you swallow the dumpling another one slides out of Jade’s hole, followed by a small squeak of pleasure. <i>“Oh fuck!”</i>");
	output("\n\nYou smirk at the idea that she’s getting off on the food she made to feed you, but you continue, eating the second dumpling, which tastes a bit airy and smoother than the last one - different flavors, you assume. You savor the flavor before you swallow, and, before Jade can squeeze another one out, you press your face against her pussy; providing a direct line of supply of dumplings. Taking your time with the varying flavors, you savor each one before swallowing.");
	output("\n\nJade seems to be more than a bit happy that you’re enjoying her cooking, stroking your ");
	if(pc.hasHair()) output("[pc.hair]");
	else output("head");
	output(" as you eat. Your hands snake up to her thighs, stroking them as she forces dumpling after dumpling out of her snatch, more and more cunt juice drooling out of her and down your chin, making quite a mess.");
	output("\n\n<i>“En-joying, yourself?”</i> Jade asks through thick breaths. <i>“They- oh fuck - took, a while, to make. E-eat up.”</i>");
	output("\n\nJade squeaks out in pleasure, her hips bucking a bit as another dumpling enters your mouth. Then, with shaky hands, she starts to push your face deeper in as she wraps her legs around your head for stability. The panda then moves a hand upward, taking some time to play with her ");
	if(chars["JADE"].breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) output("nipples");
	else output("breasts");
	output(" as she coos and moans from the fun going on downstairs. She holds you like this for a while, passing dumplings from her lips to yours as she basks in the euphoria.");
	output("\n\nEventually though, the stimulation from each serving of sweetness adds up, her moans becoming more audible as she finds herself on the precipice of climax. Noticing this, you decide to pass up on the dumplings, instead choosing to tongue her clit. You suck on her nub, gently bite it, and even grind it in between your teeth, careful not to cause more pain than pleasure. In due time your hard work pays off as you push her over the edge.");
	output("\n\nHer body quakes and quivers, her cries suppressed by your new pair of thigh shaped earmuffs. She lets go of your head and moves her hands to her ");
	if(chars["JADE"].breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) output("nipples");
	else output("breasts");
	output(", tears welling in her eyes as she rides out the orgasm, too strong for her legs to stay wrapped around you.");

	output("\n\nWhat’s more telling of her pleasure though, is the continuous stream of dumplings pelting you in the face. Each one covering your face with a generous amount of cunt liquor. You try and catch some in your mouth, but most either fall to the floor or end up hitting another part of your face.");
	output("\n\nSlowly though, her orgasm and the stream of dumplings die down, occasional aftershocks sending another dumpling out, but judging by her belly returning to it’s normal size, she’s empty.");
	output("\n\nYou get up and look at the mess before you, dumplings strewn across the floor, Jade unable to string together a syllable that doesn’t end in -uck, all tied together with a liter or two of her juices pooling at your feet. She doesn’t seem like she’s going to recover any time soon, so you lift her off the counter and set her down in a chair. You’re not entirely sure she notices your touch, as she has a thousand-mile stare, unable to focus on anything before her.");
	output("\n\nBefore you leave, you give her ");
	if(pc.isNice()) output("a gentle kiss on the cheek and head out.");
	else if(pc.isMischievous()) 
	{
		output("breasts");
		if(chars["JADE"].breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) output(" and nipples");
		output(" a groping session, forcing out another powerful orgasm, leaving her shivering and shaking.");
	}
	else output("clit a painful flicking session until it’s red and swollen, careful not to incite another orgasm.");
	output(pc.modThickness(10, true));
	processTime(20);
	//Plus 80 lust - FEN: Nope, 30 or 40 is fine.
	pc.lust(30+rand(11));
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].eastExit);
}