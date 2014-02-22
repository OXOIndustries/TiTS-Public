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
function furEffectBonusFunction():Boolean {
	//Don't know her name yet.
	if(flags["KNOW_JADES_NAME"] == undefined) output("\n\nA pudgy-looking panda-girl is standing behind it, wearing nothing other than a snug green skirt and a smile. She waves reflexively, chirping, <i>\"Welcome to Fur Effect! Let me know if I can help you with anything.\"</i>");
	//Met Jade
	else output("\n\nJade, the pudgy panda-girl is minding her shop, as always. Still wearing her skirt and nothing else, she graces you with a radiant smile. <i>\"Let me know if you need anything!\"</i>");
	shopkeep = chars["JADE"];
	chars["JADE"].keeperBuy = "Jade's console lists off the modification she has in stock along with their prices.\n";
	//List prices and whatnot. Back should go back to Jade's main menu.
	//Sell Menu
	chars["JADE"].keeperSell = "Jade tilts her head to the side. <i>\"You wanna sell me splices? Well, even if they don't fit my niche, I can probably turn a profit on them, so why not.\"</i>  She looks at you inquisitively. <i>\"What do you have for me?\"</i>\n";
	
	if(flags["KNOW_JADES_NAME"] == undefined) addButton(0,"Panda",approachJade);
	else addButton(0,"Jade",approachJade);
	return false;
}

//Jade Approach
function approachJade():void {
	clearOutput();
	//First Time
	if(flags["KNOW_JADES_NAME"] == undefined)
	{
		flags["KNOW_JADES_NAME"] = 1;
		output("Before you even reach the counter, the generously-endowed woman leans over it to greet you, creating quite the valley of unbound cleavage as she extends her paw your way. <i>\"Welcome to my shop! My name's Jade. Who do I have the pleasure of greeting?\"</i>  She displays a dazzling, winsome smile that contains far more teeth than any human and blinks her exotic, horizontally slit eyes, both obvious remnants of her previous race. Such a visage would normally be unnerving, but on such a soft, friendly-looking girl, it's hard to do anything but smile back and respond in kind.");
		//Nice
		if(pc.isNice()) output("\n\n<i>\"I'm [pc.name]. Pleasure to meet you, Jade.\"</i>");
		//Mischievous
		else if(pc.isMischievous()) output("\n\n<i>\"It's nice to find someone bear-able on this station. I'm [pc.name].\"</i>");
		//Ass
		else output("\n\nSomehow, you manage. \"<i>The name's [pc.name].\"</i>");

		//Merge
		output("\n\n<i>\"Great! This is my little shop, so if you can't find what you need, I can probably order it in for you. I specialize in furry splices, of course,\"</i>  she says as she shakes your hand. <i>\"Would you believe I used to be an Orchan? I didn't even have hair back then, let alone fur! I'm living proof of the effectiveness of my products,\"</i>  Jade explains with a note of pride in her voice. She whispers, <i>\"I didn't have tits either.\"</i>  as she brings up a holo-console for you to browse her wares with. \"<i>Let me know if you need anything.\"</i>");
		//[Buy][Sell][Talk][Appearance]
	}
	//Repeat Approach
	else
	{
		output("Just like last time, Jade is leaning over the counter to greet you before you're even halfway to her. Her pendulous, fur-wrapped tits sway and jiggle from every subtle movement she makes, unrestrained by top or bra. Smiling when she sees you looking, the red-eyed panda-girl presses them together with her forearms. <i>\"Which of my goods can I interest you in today?</i>\"");
		output("\n\nThe girl could really work on her phrasing....");
	}
	processTime(2);
	//[Buy][Sell][Talk][Appearance]
	clearMenu();
	addButton(0,"Buy",buyItem);
	addButton(1,"Sell",sellItem);
	addButton(2,"Talk",talkToJade);
	addButton(3,"Appearance",jadeAppearance);
	if(pc.lust() >= 33 && flags["TALKED_WITH_JADE_ABOUT_HER_TITS"] == 1) addButton(4,"Sex",jadeSexMenu);
	else addDisabledButton(4,"Sex");
	addButton(14,"Back",mainGameMenu);
}

//Appearance
function jadeAppearance():void 
{
	clearOutput();
	output("Jade is a panda. That much is obvious, even at a short glance. Her face has a short snout with a black nose, hiding most of her old facial features from view. Perhaps the only remains of her original race, orchan, are the number of teeth inside her maw and her exotic eye-shape. Slitted horizontally, her crimson irises seem to bore right into you, even when she lowers them into a smoky glare. Her plump, sable lips are often pursed thoughtfully, gleaming like polished jet in the bright lights inside her shop. She either wears shiny gloss or takes moisturization very seriously, but neither accounts for their kissable-and-then-some size.");
	output("\n\nA mane of long, onyx-black hair cascades past her shoulders into a line of emerald clasps that bind it into an orderly, if long, ponytail. Elsewhere, she's covered in thick coat of shimmering white fur soft enough to remind you of cyberdown pillows. A few black splotches break up her alabster coloration - one around each of her eyes, one on her right shoulder, a big one one from the underside of her left breast down to her hip, and a few small ones on her legs.");
	if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined) output(" There might be more under her softly swaying skirt, but you'd have to talk her out of it first.");
	else output(" You know from experience there aren't any more under her softly swaying skirt, but it wouldn't hurt to check a second time.");
	output(" It isn't a perfect match to real pandas' coats, but over the counter transformatives aren't known for being an exact science.")

	output("\n\nTo say that Jade is curvy would be an understatement. She's big all over, but mostly in the hips and chest departments. Beneath her narrow shoulders, her torso blossoms out into a little bit of chub and a whole lot of boob. Her tits - with as big and shapely as they are, tits is the only word that comes to mind - jut out large and proud, jiggling and swaying enthusiastically with every move their owner makes, always coming to rest in a way that leaves no doubt in your mind; she doesn't need a bra. Those plush, snuggly looking behemoths may bounce and quake, but they also sit up high when at rest. Interestingly, there are no nipples to top off Jade's bountiful breasts, just smooth, even fur. The panda-girl is curiously devoid of areolae as well.");

	output("\n\nShe has just enough fat on her to give her a little belly when she slouches, but her hips put it to shame, flaring out to support her bubbly backside. What a butt it is! Her plump derriere is the kind of ass an surveying team would get lost in and never escape from. The cheeks are superbly rounded, but they jiggle with such energy that you can see it through her skirt. When she flexes her sizeable thighs, the whole thing tenses up. Though you can't see it, you're sure there's a pudgy little pucker in between her pillowy buns, right where it belongs. When Jade walks, it's with a swiveling, heavy sway that makes it difficult to look away from her hypnotic ass, and the cute little puffball of a tail just above it makes it even harder to keep your gaze to a respectable area.");

	output("\n\nThe panda-woman's thighs continue on about as you would expect on such a woman. They're powerfully thick but carry more than enough cushion to make her lap an appealing rest stop, if you don't mind being smothered in her plush softness. Jade's feet, like her hands, are paw-like in appearance, with short, stubby digits capped by short, retractable claws. Little pads cover the undersides of her fingers and toes to enhance her grip, both as soft as the finest leather. She obviously takes care of herself.");

	output("\n\nAt 6'3\" tall, she's well above the galactic average for beings classed as females, but she's just too damned cuddly to be imposing.");
	clearMenu();
	addButton(0,"Next",approachJade);
}



//Talk
function talkToJade(display:Boolean = true):void {
	if(display)
	{
		clearOutput();
		output("<i>\"A social call?\"</i>  Jade wonders aloud. <i>\"Well, the store is empty. I'd be happy to talk.\"</i>  She vaults atop the counter with a little bit of awkwardness, barely crossing her legs in time to stop herself from giving you an upskirt, but giving you an eyeful of quaking breasts in the process. The panda's quivering bosom is almost spellbinding, so much so that she has to cough to get your attention back to her face. <i>\"So what do you want to talk about? I'm pretty much an open book.\"</i>");
	}
	clearMenu();
	addButton(0,"Her Race",talkToJadeAboutHerRace);
	if(flags["TALKED_WITH_JADE_ABOUT_HER_RACE"] != undefined) addButton(1,"Why Furry?",talkWithJadeAboutHerFurFetish);
	else addDisabledButton(1,"Why Furry");
	if(flags["TALKED_WITH_JADE_ABOUT_FURRIES"] != undefined) addButton(2,"Her Shop",askJadeAboutHerShop);
	else addDisabledButton(2,"Her Shop");
	if(flags["TALKED_WITH_JADE_ABOUT_HER_SHOP"] != undefined) addButton(3,"Her Tits",askJadeAboutHerBigOlTatas);
	else addDisabledButton(3,"Her Tits");
	addButton(14,"Back",approachJade);
}

//Her Race
function talkToJadeAboutHerRace():void {
	clearOutput();
	flags["TALKED_WITH_JADE_ABOUT_HER_RACE"] = 1;
	output("<i>\"I assume you mean my original race, orchan, and not panda,\"</i>  Jade offers with an inquisitive tone.");
	output("\n\nYou nod. She would probably talk about pandas all day if you let her.");
	output("\n\nSighing, the curvacious panda nervously looks at her claws as she gathers her thoughts. She bites her lip for, thinking hard, and when she finally does talk, the suddenness of it seems to startle her as much as you. <i>\"I used to be an orchan. We're kind of a smaller race - usually shorter than humans and ausar... thinner too. Our homeworld is naturally warm, not hot, mind you, and food is plentiful. We didn't need the insulation hair provides or to pack on much fat. Staying lean made it easy for us to maneuver through denser obstructions in the jungles we evolved from, I suppose.\"</i>  Jade nibbles on a finger. <i>\"It's strange talking about this stuff, now that I'm so... I'm so... different.\"</i>");
	//Nice
	if(pc.isNice()) output("\n\nYou lean against her in a show of solidarity and encourage her to continue. <i>\"Just because you're different now doesn't mean I don't want to hear about where you came from.\"</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nYou playfully tweak one of her round, bear-like ears, earning a squeak for your mischief. <i>\"Come on, it's just a story; it can't hurt you,\"</i>  you say, \"<i>but I might have to pinch you somewhere else if you stop!\"</i>");
	//Ass
	else output("\n\nYou chuckle to yourself at her discomfort before glancing back her way expectantly.");

	//Merge
	output("\n\n<i>\"Right,</i>\"  Jade exhales. <i>\"So anyway, our race got discovered about two planet rushes back. We were already pretty civilized by that point, but we never developed much industrially. Orchan is a very verdant planet, so we were very, very careful not to damage our forests. Any advancement that was deemed damaging to the environment was shelved until it could be made to work without negative consequences.\"</i>  She shifts nervously, uncrossing and recrossing her thighs in a surprisingly demure gesture for such a large woman. <i>\"To the ausar explorers that found us, we were practically primitives.\"</i>");
	output("\n\nShe tugs nervously on her ponytail before flicking her odd red eyes your way again. <i>\"We got lucky, though. We paraded out every discovery our scientists had made to the ausar and made them see our worth. They supported our bid to join the U.G.C. as an independant planet. It's a good thing too, if they hadn't we probably would've been taken over by the closest local power and inducted under someone else's rule. As it is, we're more or less left to rule ourselves, even if we have one of the lowest trading quotients in the confederacy.\"</i>");
	output("\n\n<i>\"Lucky break,\"</i>  you think out loud.");
	output("\n\nJade smiles. <i>\"No kidding.\"</i>  She pulls her ponytail over her shoulder and threads it between her breasts, idly toying with the end of it as she talks, <i>\"After that, things have stayed about the same. Sure, we've gotten better tech, but preserving our planet's splendor has remained paramount. We aren't important enough to see many off-worlders, and an orchan leaving? Well, let's just say I surprised the whole colony when I saved up enough credits to leave.\"</i>  She casually adds, <i>\"A colony is like an extended family unit - uncles, cousins, and even close family friends. They all typically share one large dwelling.\"</i>");
	output("\n\nHer eyes drift closed, and a wide smile spreads across her face. <i>\"I'll never forget the feeling of the thrusters pushing back into my seat when we blasted off. It was like the planet itself was trying to hold onto me, to drag me back down to the ground, but we got higher and higher until the sky turned black and starry.\"</i>  She tips her head back, lost in the memory. <i>\"Gravity fell away until I felt like I was floating in my chair... at least, until the artificial gravity kicked on.\"</i>  Slowly opening her eyes, Jade sighs. <i>\"I was free.\"</i>");
	output("\n\nShe leans back and wriggles her toes. <i>\"Anything else you want to know?\"</i>");
	processTime(15);
	talkToJade(false);
	removeButton(0);
}
//Talk menu with no text.
//Why Furry?
function talkWithJadeAboutHerFurFetish():void {
	clearOutput();
	flags["TALKED_WITH_JADE_ABOUT_FURRIES"] = 1;
	output("<i>\"Why furry?</i>\" you ask.");
	output("\n\nJade just sighs at this. <i>\"I've answered this question more times than I can count, you know?\"</i>");
	output("\n\nYou nod understandingly, though you still want to know, of course.");
	output("\n\n<i>\"Why not?\"</i>  the plush panda retorts. <i>\"Fur is awesome! Here...</i>\"  She grabs your hand and places it against the velvety-softness of her arm. <i>\"Isn't it amazing? It's just so... so wonderful!\"</i>  She makes sure you get a good feel for her texture before letting go. <i>\"When I got myself a Miniature Void Hamster and touched him for the first time, I was in heaven. I didn't realize that growing little bristles out of your skin could make touching so... so good!\"</i>  Jade giggles a little at herself. <i>\"So, I did the first thing anyone discovering something new does - I did some extranet research! You wouldn't believe what I found!\"</i>");
	output("\n\nJade glances around momentarily before giving a rueful smirk. <i>\"I guess since you're here, you probably would believe what I found. It turns out that searching for things like 'furry' can bring up a whole subculture of enthusiasts, not to mention the... uh... wilder things related to that culture.\"</i>  She casts a sly look in your direction and giggles nervously. <i>\"Anyway, it looks like you humans had people wanting to adopt features from cute little animals long before you had the technology to do so, and that concept has caught on with a few other species as well. There's some ausar into it, for example, even though they're already pretty furry! If only their culture was more accepting about it; I hear having a snout carries something of a stigma over there.\"</i>");
	output("\n\nYou chuckle at that. Humans aren't exactly fond of furries, but by and large it's become commonplace enough to ignore. Besides, it's hard to carry a grudge against somebody with a muzzle when you live next door to someone who's made of sentient goo or comprised of writhing tendrils. Not to mention that there are a few aliens out there who may as well be furries. Diversity is a bitch.");
	output("\n\nA fuzzy, well-padded elbow digs into your ribs. <i>\"Still with me, [pc.name]?\"</i>");
	output("\n\n<i>\"Just thinking,</i>\"  you answer. <i>\"What made you decide to make the change?\"</i>");
	output("\n\nScrunching up her face and licking her nose, the big panda gal answers, <i>\"Not much, actually. I had already broken away from my race to see the stars. I was out working odd jobs, learning technology, and trying to make it on my own when I decided to go for it. I had to land a good gig to afford it, of course. I found out I had a head for numbers and figures while working in a friend's custom starship shop, even though my 'in' had been my ability to wriggle through small places. Within six months I was out of the grease pits and into an accountants office. A few months after that I was running the books for two other shops.\"</i>  She casually wraps her ponytail around her neck and over one shoulder. <i>\"I made enough to get access to some of the good stuff.\"</i>");
	output("\n\nJade kicks her feet out and wiggles her toes excitedly. <i>\"It only took me a few hours for the fur to grow in, and I got so much taller and bigger all over! I must have eaten something like a meal an hour for the first two days. After my face finished reshaping, things slowed down, but I was still putting on weight and growing in places I hadn't grown before.</i>\"  She gingerly prods her cushy bosom, and her mouth falls open into a happy smile, pink tongue lolling out.");
	output("\n\nIs she getting aroused by such benign contact? You don't get a chance to ask.");
	output("\n\n<i>\"I grew tits! Big, whomping titties!</i>\"  She looks so happy that you momentarily worry that she's going to start bouncing and cheering. <i>\"Orchan's don't have breasts... ever! We don't even have nipples.\"</i>  She points back at herself. <i>\"Now I'm a big girl with a luxurious coat and even bigger assets!\"</i>  Perhaps realizing that she's strayed into a sexual territory, she lets the conversation drop off.");
	output("\n\nAfter a moment of companionable silence, Jade playfully punches your shoulder, but it doesn't even hurt. She's just too soft. <i>\"That's for making me explain that again.\"</i>");
	processTime(15);
	talkToJade(false);
	removeButton(1);
}
	
//Her Shop
function askJadeAboutHerShop():void {
	clearOutput();
	flags["TALKED_WITH_JADE_ABOUT_HER_SHOP"] = 1;
	output("<i>\"My shop?\"</i> Jade asks. <i>\"I guess you could say that it's like my hopes and dreams rolled together into my baby.</i>\"  She smirks a little. <i>\"I wanted to share what I had discovered with everyone, and a shop seemed the best way to do it. I can support myself and meet furries all day long! Hell, I can even work with people that don't have the credits to make the transformation on their own. You'd be amazed by what solid financial planning can accomplish.\"</i>");
	output("\n\nTicking off one finger, Jade explains, <i>\"First, I had to get the money for the place. I worked as an accountant another two years to save up enough to start up. It wasn't easy, but I did. Next, I needed a location. I caught a lucky break with picking my location, though. The planet rush was coming up, and Tavros was positioned perfectly to catch a ton of lucrative trades with the new planets. That's not even mentioning all adventurers coming out of the new systems with wallets full of credit chits.\"</i>  She gestures at her shop. <i>\"I've done well enough to redecorate twice, and each time I wind up making the place cosier. I've even managed to open up a few new locations out there on the rim.</i>\"  She sighs. <i>\"I can't run all of them personally of course. I mainly stay here... this place has kind of become my home.\"</i>  She brushes a stray strand of hair out of her eyes. <i>\"Not much more to tell.\"</i>");
	output("\n\nThe cuddly-looking woman begs a story or two out of you before saying, <i>\"You're easy to talk to, you know that? I can tell you've got at least one more question.\"</i>  She gives you a sultry blink. <i>\"I saw you looking back when I touched them and talked about growing them...\"</i>  she says with a gesture at her breasts. <i>\"Just ask. I won't bite.\"</i>  She snaps her jaws. <i>\"Much.\"</i>");
	talkToJade(false);
	removeButton(2);
}
//Her... Breasts
function askJadeAboutHerBigOlTatas():void {
	clearOutput();
	flags["TALKED_WITH_JADE_ABOUT_HER_TITS"] = 1;
	output("Well, you may as well take the bait. You ask her about her breasts.");
	output("\n\nJade smirks, running one pawed finger up and down the length of her expansive assets, shivering slightly at the sensation. <i>\"I was hoping you'd ask.\"</i>  She squeezes one and pants, <i>\"They're my favorite part of the transformation. Whoever designed the splice made it with human expectations in mind, and humans expect, big, luxurious busts to go with a curvy figure.\"</i>  She gives a twirl and a shake, basking in your attention like a cat in the sun. <i>\"It's a shame it didn't give me proper nipples. I compensated another way, and it worked out better than I could have ever imagined....\"</i>");
	output("\n\n<i>\"What'd you do?\"</i>  you ask, your curiosity overwhelming you.");
	output("\n\nLeaning back on the countertop, the plush panda smiles. <i>\"Well, nipples are supposed to be incredibly sensitive, right?\"</i>");
	output("\n\nYou nod.");
	output("\n\n<i>\"I decided, if I don't have the nipples themselves, why not just make my breasts have nerves as densely packed as nipples? The tech is out there, though it's often used for other purposes. It took a year's worth of profits to afford the neuron growth serums and have them applied, but it was worth every penny!\"</i>  Jade rubs a breast once more, tongue lolling in obvious pleasure. <i>\"You can... can see how successful it was....\"</i>  She shudders, and for a second, her tongue lolls out in a display of wanton enjoyment. <i>\"The doctors... umm... said I responded better to the treatments than I- ooohhh... should have.\"</i>");
	output("\n\nThe curvaceous shopkeep slides back behind her countertop, her thighs clenching tightly together. <i>\"You can probably guess why I don't wear a top now. All that fabric sliding and grinding and squeezing on my girls would drive me nuts with need. I'd probably wind up trying to proposition every customer that came in instead of selling them splices, and while that might be fun, I'm not sure I'm the right type of girl for that occupation.\"</i>  One of her hands drifts lazily towards her top before being stopped by Jade's glare. She lowers her arm with a deep, regretful sigh.");
	output("\n\n<i>\"As it is, I'm a hairsbreadth away from vaulting over this counter and forcing you to spend the next two hours motorboating me.\"</i>  Jade smiles lopsidedly, eyes cast low and lewd. <i>\"With some regret, I'm going to have to ask you to give me a moment to get under control, I'll be right back.\"</i>");
	output("\n\nShe pirouettes away, rump swaying back and forth with pendulous momentum, thighs kept so close together that you can hear the swish of fur on fur with each step. Her display of willpower does little to hide the reflective sheen trailing down on flexing leg, nor does it conceal the fragrant trail of droplets that have accumulated on the rug behind her, filling her shop with her own feminine odor. Perhaps she pushed herself a little closer to the brink than she meant to. Her shop certainly didn't seem layered with the smell of a woman in need when you arrived.");
	output("\n\nFrom behind a 'staff only' door, you hear surprisingly unmuffled moans, at first soft, like their creator is trying to stay quiet, but with gradually increasing enthusiasm. Soon, you're wondering if passersby can hear her dulcet whimpers and cries. You certainly can, and they're making your own heart beat a little faster in response, but just as you're considering trying the door yourself, Jade's ardor peaks. She cries out, thumping against something... perhaps the walls or the floor. You can't be sure which. There's some breathy panting, and then Jade emerges, practically glowing. Her skirt looks as perfect as when she left.... Did she masturbate without even touching herself down there?");
	output("\n\n<i>\"[pc.name], I'm up here.\"</i>  Jade's downy fingertips catch you under the chin and lift your eyes to hers, forcibly pulling your gaze away from her crotch. She chuckles to herself. <i>\"Sorry, I got a little too excited there. Was there something else you wanted to talk about, or did you want to buy something?\"</i>");
	pc.lust(20);
	processTime(20+rand(10));
	//Raise lust by 20.
	talkToJade(false);
	removeButton(3);
}

//Sex
//Unlocked by having the breasts discussion
function jadeSexMenu(display:Boolean = true):void {
	if(display)
	{
		clearOutput();
		//Hasn't had sex with her
		if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined)
		{
			output("You bring up her little foray to the 'employee room' and suggest that maybe next time she get a little help with her needs. You're a pretty helpful " + pc.mfn("guy","gal","person") + " after all.");
			output("\n\nA knowing grin spreads across Jade's short muzzle. <i>\"Oh really? Sooo....\"</i>  She comes around the side of the counter to you, pulling you into a hug that crushes you into her cushy body{, tits wrapped around your head}. \"<i>...you think you can handle such big girls on your own?\"</i>");
			output("\n\nYou grab her breasts and give a gentle squeeze, eliciting a moan of pussy-moistening pleasure from the panda. <i>\"Ooooohhhh... yes you can.\"</i>  Her voluptuous form shudders against you. <i>\"Come on, let's do this.\"</i>");
			output("\n\nShe drags you to the back room, her body grinding against you the entire way.");
		}
		//Has had sex with her
		else 
		{
			output("You suggest another trip to the employee room to take care of 'the girls'.");
			//Low # of sexings
			if(flags["GOTTEN_INTIMATE_WITH_JADE"] <= 2) output("\n\nJade rounds the counter and takes you by the hand, pulling you towards the door. <i>\"I'm okay with it if you are. I don't think I'll ever get tired of the feel of your fingers in my fur.\"</i>");
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
				output("\n\nJade grabs your hands and pulls them against her weighty chest, letting your fingers sink deep into the sumptuous mounds, her furred flesh bulging out around them, making your digits appear to vanish into the squishy surface. You can't help but give them a squeeze, and while you are so distracted, she grabs your waist and practically drags you to the door, letting you grope her all the while.");
				output("\n\n<i>\"Come on, " + pc.mfn("handsome","beautify","my dear") + ", lets get in private so you can have some alone time with them.");
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
	}
	else 
	{
		addButton(0,"Breast Play",jadeGetsAGropeGasm);
		if(pc.hasCock()) addButton(1,"Titfuck",titfuckJade);
		else addDisabledButton(1,"Titfuck");
		if(pc.hasVagina()) addButton(2,"RideHerFace",sitOnjadesFace);
		else addDisabledButton(2,"RideHerFace");
	}
}

//Gropegasm
//Omnigendered scene. PC stays closed and gropes the panda-girl to earthshaking orgasm after orgasm, leaving her with a puddle of pussy-juice and a serious tit-obsession
function jadeGetsAGropeGasm():void {
	clearOutput();
	output("The two of you tumble back into a couch in the narrow back-room, hands roaming over one another's body with little shame or restraint. Your own gropes, squeezes, and caresses rarely if ever leave her sumptuous breasts. They're a feast for your fingers: soft, well-rounded, and oh-so squeezable. You have a hard time not just sitting there and rubbing them, feeling and fondling their expansive, plush... heavenly... mmmm.... Every touch makes Jade whimper and squirm. Every stroke earns a pleasured twitch.");
	if(pc.legCount != 2) output(" The awkward positioning of your body on the bipedally-designed sofa is a dim, unthought of concern next to your focus.");
	output("\n\nPanting madly, the plump panda-woman's own explorations of your body rapidly die off. Her eyes drift partway closed, and her plush, black lips slowly part into a wanton 'o'. You can practically see the pleasure from her tits colliding with her brain and sending her synapses into misfires of thought-obliterating ecstasy. A pleasant-sounding coo slips out of her maw as she relaxes into the chair, slowly sinking into more gradual expressions of physical excitement the longer you massage her sensitive mammaries.");
	output("\n\nYou take one hand-overflowing boob in each palm and shake them, squeezing them together and then apart before clapping them back together to set off a boobquake of epic proportions. The way her breasts jiggle and shake, you could film them and make a disaster holo out of it. Jade's bosom, while big and bouncy, still sits fairly high on her body for all its size and weight. You suppose she hasn't had them long enough for them to sag; she's got tits that could shame a teenager for pertness and a surgically-altered cougar for size. In short, they're a boob-lover's dream, and they're yours to play with as much as you like.");
	output("\n\nFrom the way Jade is moaning, eyes rolled back and vacant, she's not going to stop you. You lean down to press your [pc.face] into her cushions, letting them wrap around to your [pc.ears], your hands holding them against you on either side. The silky softness of her fur is everywhere, completely surrounding you, wrapping you in a blanket of warm goodness. You twist back and forth, rubbing your face against one then the other, luxuriating in her plushness for a moment. Switching your focus, you let your hands resume groping their twin prizes.");
	output("\n\nThe overly-sensitive panda-girl immediately moans, though it sounds almost like a purr from how throatily it emerges from her mouth. You feel something wet against your [pc.leg] and reluctantly pull out of her smothering breasts to investigate.");
	output("\n\nJade's emerald-toned skirt is plastered to her crotch like a second skin, made so transparent by her copious lubricants that the dusky lips of her sex are on full display. Her button-like clit protrudes upward, sheathed in a condom of green fabric, and a dark discoloration is slowly spreading through through the couch below. You give her breasts a firm squeeze. Jade groans, her thighs quivering nervelessly, and her ebony netherlips visibly part, releasing a torrent of pheremonally-charged girl-cum. The room is getting increasingly thick with her scent. Has she been cumming this hard the whole time?");
	output("\n\nYou briefly consider asking her, but a quick look at her drool-slick lips and empty eyes tells you it would be a wasted effort. Instead, you go back to kneading Jade's tits. Her gushing cunny enthusiastically declares the panda's desire to continue, and you're certainly having fun seeing just how much pleasure you can wring from her hand-swallowing titties. You grab one hard and squeeze it hard, enough that it's probably a little painful, letting your fingers completely vanish from view, lost in her silky fur.");
	output("\n\nJade gives an ear-shattering screech as every muscle in her body locks at once and begins to violently buck beneath you, throwing her hips up with enough force that you're nearly sent flying. If it wasn't for the tight grip on her bosom, you would've been bucked into the slick puddle that's formed on the floor, accumulated from the rivulets of girl-honey that have been leaking down the furniture the past few moments. Her skirt is completely drenched by her violent orgasm, so much so that even the fur on her legs is plastered down by sticky secretions.");
	output("\n\nInspired, you reach under the drenched fabric and run your fingers across her quivering nether-lips, collecting a palmful of slick juice for your efforts, then bring it up to her heaving bosom. She's gasping for breath, breasts quivering beautifully with every lungful of air she sucks in. You smile and rub her tits down with her own juice. In response, Jade's tongue lolls, and her hips resume rocking, this time at a much more sedate pace. It seems that firmness earns violent, thrashing orgasms while gentler gropes and massages earn whimpering drools of feminine bliss.");
	output("\n\nYou give Jade's sensitive bosom a slow massage to make up for your roughness earlier, fingers slipping and sliding through her cleavage with ease that you can't help but ");
	if(flags["TITFUCKED_JADE"] == undefined)
	{
		if(pc.hasCock()) output("wonder what a tit-fuck would be like with this girl");
		else output("wonder if she's ever tried tit-fucking anyone");
	}
	else 
	{
		if(pc.hasCock()) output("wonder why you didn't decide to titfuck her today");
		else output("wonder why you got rid of your dick");
	}
	output(". She's a natural for it. You watch her gasping through climax after climax until her well-tended mammaries dry, reeking of cunt, each time going a little slower and gentler, giving her a slow, cummy come-down.");
	output("\n\nEventually, Jade starts lazily blinking, and she wipes the drool from the side of her maw on her shoulder. She seems to have trouble focusing at first. Her eyes lazily room around the room while one of her paws instinctively cradles her sensitive chest, making her moan all over again. Slowly, she finds her way back to you, gracing you with an exhausted smile, not caring that her thighs are splayed or that her cummed-out cunt is on full display. The panda-girl appears to be floating on an orgasm-induced cloud of euphoria. She slurs, <i>\"C'mere,\"</i>  and pulls you back into her tits, not for a sensuous grope-fuck but for a affectionate, if slippery hug.");

	//FIRST TIME FORK:
	if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined) {
		output("\n\nShe holds you there, snuggling with you as her climax-lagged brain slowly boots back up. <i>\"You... I... umm.... Wow.\"</i>  She suddenly kisses you. <i>\"I uh... I haven't done it that way before.\"</i>  Gingerly touching her thighs, she feels the wetness there.");
		output("\n\n<i>\"How many times did I just come?\"</i>  The incredulity in her voice is as thick as the scent of lady-spunk in the air.");
		output("\n\n<i>\"Uh, a lot,\"</i>  you answer. <i>\"It was hard to keep track. You were basically quivering the entire time and I was busy giving you the rub-down you needed.\"</i>");
		output("\n\nJade kisses you again, this time long and slow. The dance of her thick, muscular tongue against your own seems to go on for minutes before you pull apart. The curvy woman apologizes, <i>\"I can't thank you enough.... I didn't know it could feel this good, and I didn't even return the favor.\"</i>  You aren't sure, but you're pretty sure she's blushing under her alabaster fur.");
		output("\n\nEventually, you both climb out of the ruined couch, careful not to slip on the slick floor, and break apart. The shopkeeper nervously shoos you out, saying something about having to treat the cushions and clean the floor.");
		output("\n\nYou go, but she does make a point to call out after the door has closed. <i>\"Be sure and let me repay the favor sometime, okay?\"</i>");
		output("\n\nYou might have to do that.");
	}
	//REPEAT FORK
	else
	{
		output("\n\nShe holds you there, snuggling with you as her climax-lagged brain slowly boots back up. <i>\"You... uhm... again?\"</i>  She suddenly kisses you. <i>\"I wasn't sure it would be as intense after the first ");
		if(flags["GOTTEN_INTIMATE_WITH_JADE"] > 1) output("few times");
		else output("time");
		output(", but ugh... it's hard to think right now. Everything just feels so... so... good!\"</i>  Jade kisses you again, longer and slower this time, luxuriating in it, letting her short, thick tongue press between your lips to tangle with your own.");
		output("\n\nA minute later, when she pulls back, you're both smiling, but she speaks first. <i>\"All right, go on and get up, [pc.name]. You made me soak the couch again, so I've got some cleaning to do.\"</i>  She slowly peels the skirt off, wrinkling her nose at how absolutely inundated with her pleasure-juices it is. <i>\"A lot of cleaning....\"</i>");
		//Nice
		if(pc.isNice()) output("\n\nYou stick around a while to help, not leaving until you're both presentable and ready to step back out into her shop.");
		//Mischievous
		else if(pc.isMischievous()) output("\n\nYou help a while, cracking plenty wise about her orgasms and how wet they were until the whole place is clean. Then, you help her get dressed once more, being sure to cup her breast, just to get her motor going again.");
		//Hard
		else output("\n\nYou wave, walking out the door with a smile on your face.");
	}
	sexedJade();
	processTime(20+rand(10));
	pc.lust(30+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

function sexedJade():void {
	if(flags["GOTTEN_INTIMATE_WITH_JADE"] == undefined) flags["GOTTEN_INTIMATE_WITH_JADE"] = 0;
	flags["GOTTEN_INTIMATE_WITH_JADE"]++;
}

//Pandalicious Titfuck
//Requires a penis
function titfuckJade():void {
	if(flags["TITFUCKED_JADE"] == undefined) flags["TITFUCKED_JADE"] = 1;
	else flags["TITFUCKED_JADE"]++;
	clearOutput();
	output("<i>\"How about a titfuck?\"</i>  you suggest");
	if(pc.isNice()) output(" with an encouraging smile");
	else if(pc.isMischievous()) output(" with a mirthful grin");
	output(".");
	if(pc.isCrotchGarbed()) output(" A tightness in your [pc.lowerGarments] signals your " + possessive(pc.cocksDescript()) + " willingness to participate in such a plan.");
	else 
	{
		output(" A sudden upward surge from your [pc.cocks] signals ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" willingness to participate in such a plan.");
	}
	output(" There's no use trying to hide the ready engorgement of your crotch from the cute panda-girl, so you don't even try.");

	//First time
	if(flags["TITFUCKED_JADE"] == 1)
	{
		output("\n\nJade's shiny black lips open in surprise, covered by her hand as she stares in shock. ");
		//Size variants(small)
		if(pc.biggestCockLength() < 5.5) output("<i>\"You're so... little! You'll disappear into my cleavage with something that small, no problem.\"</i>");
		//(Medium)
		else if(pc.biggestCockLength() <= 10) output("<i>\"Oooh, that looks kind of nice. I could absolutely smother that thing in boob... just wrap it up in my big... cushy... breasts.\"</i>");
		//(Big)
		else if(pc.biggestCockLength() <= 15) output("<i>\"Wow, you're big! I mean, with all the splices out there, I've seen some whoppers, but this... I bet you could ram the whole thing into my tits and bop me in the chin! I could smother you in tit and still take the time to polish your [pc.cockHeadBiggest].\"</i>");
		//Huge
		else output("<i>\"Holy-! You're gigantic! Jeeze, do you need a sling just to carry that around? I don't even think I could fit my breasts the whole way around that if I get an augmentation. Still...\"</i> she pauses in thought, \"</i>...I bet having such sizable melons rubbing against you would feel way better than a paw or a mouth.\"</i>");
		//Merge
		output("  She slowly pulls her alabaster-furred hand away from her mouth to reveal a greedy smile. <i>\"I've actually never done this before. Usually guys just stick it in and grope me while they fuck. I guess pussy is a motivator that crosses most species' bounds.\"</i>");
	}
	//Repeat
	else
	{
		output("\n\nJade's mouth curls into a knowing smile before asking, <i>\"So you came back for ");
		if(flags["TITFUCKED_JADE"] == 2) output("seconds");
		else output("even more");
		output("? Didn't get enough last time?\"</i>  She licks her lips at the memory, eyeing your crotch with unashamed lust. <i>\"This is a service I'll never mind providing you, [pc.name].\"</i>");
	}
	//Merge
	output("\n\nDropping to her knees, the breast-obsessed panda beckons you closer. She's already naked and on display, luring you in with her exposed cleavage, her arms crossed beneath her bust to maximize the lurid display. <i>\"Come on then, let's do this.\"</i>  She squeezes her breasts once more for encouragement before stretching behind her and coming up with a liter-sized bottle of lubricant. Upending it and drizzling her chest with slipperiness, Jade purrs, <i>\"Come on then, I'm ready for you.\"</i>");
	output("\n\nMaintaining a steady pace instead of rushing headlong takes every bit of your willpower. There's nothing you'd like more than to slam your [pc.cockBiggest] right into her mammaries' embrace, but you manage to swagger up and gently lay it into the welcoming, sensuous crevice with a degree of restraint. Your eagerness shows plainly in your eyes as you gaze down at Jade. She doesn't seem to mind. In fact, her smile broadens at the first contact of  your cock on her teats. <i>\"Just make yourself at home and let me take care of you. It'll feel like you're fucking heaven itself.\"</i>");
	output("\n\nWith the kind of goofy smile one inevitably gets when " + pc.mf("his","her") + " dick is about to be wrapped in tits, you give an excited nod, awaiting the panda's pleasure.");
	output("\n\nJade carefully grabs her chest and presses her mammoth chest inward, compressing her boobs around your length");
	var length:Number = pc.biggestCockLength();
	if(length < 10) output(", making your entire [pc.cockBiggest] vanish into what feels like a sea of heaving, slick breasts, all pushing and rubbing up against you.");
	else if(length < 15) output(", making most of your [pc.cockBiggest] vanish into what feels like a sea of heaving, slick breasts, its [pc.cockHeadBiggest] sticking out of the top and pulsating happily.");
	else output(", making shivers of excitement traverse your mammoth manhood as it's partially engulfed in a sea of heaving, slick breasts, its sheer size allowing it to press against the busty anthro-morph's face as well as her chest.");
	output(" She");
	if(length >= 20) output(" leans around it to give");
	else output(" gives");
	output(" you a sultry wink, smiling broadly as she slides down to your ");
	if(pc.hasSheath(pc.biggestCockIndex())) output("sheath");
	else output("base");
	output(". The sound of her soaked tits slipping and sliding against your " + pc.mf("man","herm") + " hood more than a little audible, squelching noisily as she starts to work on you, nearly drowning out the pleasured gasp you release at her naturally gifted cock-massage.");
	output("\n\n<i>\"Atta " + pc.mf("boy","girl") + ",\"</i>  Jade moans back at you, visibly shuddering from the friction. <i>\"You like this, doncha?\"</i>");
	if(length >= 20) output(" She kisses and slurps along the underside of your [pc.cockBiggest], polishing you with long, wet licks, licking the flavored lubricants off you with each drag through her tits, mixing enough saliva in to make frothy bubbles form on her chest.");
	else if(length >= 10) output(" She kisses and slurps at your [pc.cockHeadBiggest], polishing you with long, wet licks, laying them on you with every downward slide she takes.");
	else output(" She blows you a kiss, licking her onyx-hued lips in between up-and-down undulates, letting some of her frothy saliva trickle down into her bosom to mix with the lube.");
	output(" Emerging from your cum-slit like a precious pearl, the first droplet of pre-jizz leaks from your enjoyment inundated system. It rolls down the bottom of your manhood, sped along by the shining moisture you've accumulated. She's happy to catch it in her tits and bounce a little harder... and a little faster, making you that much firmer and that much more eager.");
	//Double dix?
	if(pc.cockTotal() == 2) output("\n\nWhile it feels great, your second phallus hasn't even been touched yet. Jade, accommodating girl that she is, switches her boobs to a one-handed cradle, using the other to grab hold of your spare cock and start jacking. She keeps time with her own pendulous up-and-down bobs, giving you both a titfuck and a handjob in perfect sync. Your paired lengths twitch and throb for her. The panda-girl licks her lips and winks. <i>\"With both of these, you might eve-ahhhh... might... might even cum before me!\"</i>");
	//Triple+dix
	else if(pc.cockTotal() > 2) 
	{
		output("\n\nWhile it feels great, your other phalluses haven't even been touched yet. Jade, accommodating girl that she is, arches her back and releases her tits, freeing her hands to grab hold of ");
		if(pc.cockTotal() > 3) output("two of ");
		output("your dicks and start jacking. Her breasts are big and firm enough that they still squeeze down on your [pc.cockBiggest] with more than enough force to keep tingles of gratification transmitting up your spine, and her hands keep perfect timing with the mammary assault. ");
		if(pc.cockTotal() == 3) output("All t");
		else output("T");
		output("hree of your dongs are getting served at once. They twitch and throb with eager intent at the panda-girl, wanting so desperately to spill their seed on her creamy fur. She licks her lips and winks, <i>\"Hah, I think you might ac-ahh... Ahhh... AH! Mmm... you might cum before me, babe.\"</i>");
	}
	output("\n\nYou cannot remain passive any longer. Your heart is beating like crazy. [pc.EachCock] is absolutely demanding you sate your pent-up need. Lurching forward, your [pc.hips] respond to your subconscious desires to fuck the bosomy pussy wrapped around your [pc.cockBiggest]. Jade's velvety breasts wobble from the sudden thrust, practically vibrating around you from the hard fuck. You grab hold of them for stabilization and slide out, but only momentarily. You slam back in a second later, hilting yourself in supple titflesh, throbbing and dripping all over the ivory pillows, kneading them with your fingers to press them more firmly against your [pc.cockBiggest].");

	output("\n\nPerhaps because of your hungry, frenzied pounding, you miss out on the beginning of Jade's orgasm. It isn't until her voice has been moaning huskily for the better part of a minute that you realize what you've done. The panda-girl's cushiony lips are pursed into an outspread 'O' of delight. ");
	if(length >= 20) output("You make sure to drag the underside of your [pc.cockBiggest] all over them as you thrust in and out, your totem-like cock smearing her face with its slippery surface. ");
	else if(length >= 10) output("You make sure to slide your [pc.cockHeadBiggest] past her parted cock-pillows and into her mouth with each thrust. Her spittle hangs in thick strings when you pull back, falling into her slick cleavage as additional lubrication. ");
	output("With her thighs quivering, Jade struggles to stay upright. Her pussy has gushed out a puddle of liquid satisfaction below, and it's still trickling out one long string of sticky girl-goo.");

	output("\n\nYou feverishly hump against Jade's bountiful bosom, making noisy squishing sounds with each pounding thrust, enjoying the velvet-soft embrace to its fullest. Your [pc.cockBiggest] throbs powerfully in the squishy embrace, languishing in the wonderful warmth. Yet, in spite of the pleasure, you feel the powerful need to cum rising up from inside of you, driving you to squeeze the twin orbs responsible for your pressure and fuck them with all your might. Jade, practically bubbling over with bliss, dopily smiles and manages to say, <i>\"Cum on my tits, [pc.name]! Give it to me!\"</i> before trailing back off into blissful mewls.");
	output("\n\n");
	//Balls
	if(pc.balls > 0) output("One of her hands finds its way to your [pc.balls] to give a reassuring squeeze. Your [pc.sack] clenches tight, starting the process of releasing your load.");
	//Pussy
	else if(pc.hasVagina()) output("One of her hands finds its way to [pc.oneVagina], penetrating it with two thick fingers and resting a thumb upon [pc.oneClit]. The sympathetic female pleasure is enough to make your body clench, starting the process of releasing your load.");
	//Nothing
	else output("One of her hands finds its way to your [pc.butt] and worms a finger inside your [pc.asshole]. It twitches around inside, pressing against something exquisitely sensitive, and suddenly, your body is clenching, starting the process of releasing your load.");
	//Merge
	output(" You can feel the magma-like warmth spreading through you as your [pc.hips] automatically lurch forward, burying your [pc.cockBiggest] as deeply as possible into the quaking cleavage. Jade's voice moans into a slowly crescendoing howl of pleasure herself, happy to be used as your cock milker for the night. Your [pc.cum] ");
	//Stuck in tits
	if(length < 10) {
		if(pc.cumQ() < 6) output("trickles out in tiny droplets that quickly abate, but that doesn't stop [pc.eachCock] from quivering through spasms of climax. Perhaps you ought to give your body some time to brew up a fresh batch before humping away at the next piece of intergalactic tail.");
		else if(pc.cumQ() < 50) output("spurts directly into Jade's already-soaked boobs. There, it mixes into a stew of slippery sex-juice, shining [pc.cumColor] against her fur.");
		else if(pc.cumQ() < 100) output("bursts out of you in thick gouts, quickly filling the panda's cleavage with a small [pc.cumColor] pool. Some drips down Jade's belly fur after escaping the imperfect seal of tit on dick.");
		else if(pc.cumQ() < 500) output("squirts out in inhumanly thick ropes, each so voluminous that it could form a puddle in her cleavage on its own. As your orgasm progresses, the valley of Jade's impressive bust quickly overflows, allowing your roving hands to smear the liquid love across tremendous mammaries. By the time you stop, she's painted with [pc.cum], and a small river of escaping sex-juice is drooling across her tummy.");
		else output("erupts with enough pressure to send a lance of love-juice into Jade's open mouth and across her cheek. Rather than fighting it, the trembling panda closes her eyes, opens wider, and allows the treat to flood her lips with your flavor. There's more than enough to thoroughly paint her furry tits as well, glazing them in a thick coat of [pc.cum] that drips and dribbles down her soft belly with every tit-quaking ejaculation.");
	}
	//Sticking out
	else
	{
		if(pc.cumQ() < 6) output("trickles out in a few drops before abating. They roll down your length and into Jade's sloppy bosom, quickly subsumed by the sea of lubricants there. Even after, your quivering pole tries to launch ejaculate more, there's just nothing to shoot out. Maybe you should give yourself a break in between intergalactic fucks?");
		else if(pc.cumQ() < 50) output("shoots a few long ropes up into the air. They hang there, glimmering in the light, before falling down across Jade's nose, lips, and neckline. Her tongue darts out to grab a gob off her cheek.");
		else if(pc.cumQ() < 250) output("spurts out in nice, thick ropes. Each one hangs in precipitously in the air for a moment before splattering down across Jade's face, painting her into a [pc.cumColor] mask with a matching pearl necklace. She revels in it, opening her mouth to let you fill her mouth. Trickles of the stuff run down the nape of her neck to puddle in her cleavage, some leaking out the bottom to stain her belly.");
		else if(pc.cumQ() < 750) output("launches out in huge, sparkling arcs that seem perfectly aimed to fall upon the climaxing panda. She doesn't move. She doesn't resist. She just lets her eyelids close and her mouth open. Her tongue rolls out like a welcoming carpet, and your [pc.cum] rolls right on in, immediately flooding her maw with liquid love. Blind, she fails to catch the next shot inside. It splatters off her forehead and cheeks. The one after smothers her cheeks and neck. Each successive shot falls a little shorter until you're flooding her tits with [pc.cum], enough that it rolls out over the sides in thick rivers. Strands of it drip down to her tummy, forming a tiny stream.");
		else 
		{
			output("erupts out, geyser like. The torrent of fluid hangs in the air above you both before coming back down atop Jade's head. She manages to close her eyes and open her mouth, but that doesn't do much to stop the splattering goo from making her look like she just spent an eight hour shifting working a glory hole. The next column of [pc.cum] creates a similar coating across her shoulders, neck, and breasts. The one after just piles onto the accumulated gunk, causing rivers of it to run down Jade's belly, back, and ass. She shudders as she's completely coated in your [pc.cumColor] release, one hand eagerly rubbing it into her fur");
			if(pc.cumQ() >= 2000) 
			{
				output(", but you're far from done. You shoot and shoot until she's sitting in a ");
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

	output("\n\nJade lets you slip out of her soaked mammaries with a gasp of surprise, and together, the two of you take a tumble backwards onto a well-used couch. It's comfortable and soft - the perfect place for two sexually sated individuals to come down on. The panda-woman doesn't let you stay long. She seems keen to wash up, so you let her go ");
	if(pc.isNice()) output("with a quick kiss");
	else if(pc.isMischievous()) output("with a playful spank on her curvy rear");
	else output("with a smirk");
	output(". Making yourself presentable, you gather up your [armor] and dress before heading out into public. Jade follows not longer after, looking radiant and smelling vaguely of your tryst.");
	processTime(20+rand(10));
	pc.orgasm();
	sexedJade();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Furious Face-Sitting
function sitOnjadesFace():void {
	clearOutput();
	output("Smiling as wantonly as you can, you suggest that she put that snout to work in [pc.oneVagina] while you count how many orgasms your hands can wring from her breasts.");
	//First time
	if(flags["TIMES_SAT_ON_JADES_FACE"] == undefined)
	{
		flags["TIMES_SAT_ON_JADES_FACE"] = 1;
		output("\n\n<i>\"To do that you... you'd have to sit on my face,\"</i>  Jade says, wide-eyed. Her brow lowers a second later. <i>\"You knew that. Of course. I just hope you're ready to handle my tongue.\"</i>  She waggles the thick, pink protrusion at you. It looks like it would fit nicely.");
	}
	//Repeats
	else
	{
		flags["TIMES_SAT_ON_JADES_FACE"]++;
		output("\n\n<i>\"[pc.name], I'm starting to think you like holding down the big panda gal and abusing her tits,\"</i>  Jade says, smiling mirthfully. <i>\"Well, I like having my boobs played with just as much, so let's do this.\"</i>");
	}
	output("\n\nThe full-figured woman lays herself back on a well-used couch, giggling nervously, before looking up at you and beckoning you over. You're out of your [pc.gear] in an instant and ");
	if(pc.isNaga()) output("snaking up onto the edge of the couch to");
	else if(pc.legCount != 2) output("awkwardly positioning your [pc.butt] to");
	else output("climbing up onto the edge of the couch to");
	output(" align your [pc.vagina] with her onyx lips. Her pink tongue licks out, wetting her mouth in anticipation as you settle in, your ");
	if(pc.legCount == 1) output("[pc.leg] ");
	else output("[pc.legs] ");
	output("pressed against her head. You grab her breasts, not just out of desire but also for stability. Wetness and desire enflame your entrance");
	if(pc.vaginaTotal() > 1) output("s");
	output(" just before you touch down, feeling her hot breath a moment before her cold nose brushes against you.");
	output("\n\nThe contrasting temperatures momentarily paralyze you, but Jade's softly padded paws pull you down by the [pc.hips], firmly pressing your womanly entrance against her hungry muzzle. Her girthy organ emerges from between her luscious lips to dive into yours, and gasp in surprise at how nicely its warmth fills you. You start rubbing and squeezing the plush shopkeeper's sizeable bust before you lose yourself in pleasure, letting your fingers sink deep into her soft flesh when you squeeze.");
	output("\n\nJade rewards you with a throaty purr of excitement. It isn't feline in origin but it is enough to make her tongue vibrate pleasantly inside your increasingly wet channel. The panda works her short, thick length as far in as she can, then rapidly withdraws it before punching it in once more, fucking the first two inches of sensitive pussy. She twists and adjusts herself to make sure that her sable kissers get to brush [pc.eachClit] again and again, and soon, she has you whimpering and moaning, your juices running free and unrestrained.");
	output("\n\nLikewise, your palms are doing quite a number on her sensitive bosom. When you aren't squeezing, you're stroking, or caressing... or even pressing them together while your thumbs slide over her fur. You can see from your vantage just how much your curvy lover is appreciating the attention; her pussy practically gleams with leaking lust. Her hips are even beginning to undulate against an imaginary lover, though you are doing little better. You begin to grope her more aggressively in an effort to get her first.");
	output("\n\nJade trembles beneath you, holding onto your [pc.hips] with such passion that the tips of her claws are pricking at your skin. She varies her movements, sometimes tongue-fucking you, other times dragging her slippery organ up and down across your entrance, sometimes suckling ");
	if(pc.totalClits() > 1) output("a ");
	else output("your ");
	output("bud humming her muffled screams of excitement into your mound. You're grinding back against her in short order, watching her pussy leak in a way that likely mirrors your own until climax interposes itself between you and your rational thoughts.");
	output("\n\nYour back arches, but so does Jade's, keeping her melons firmly in your spasming fingers for further molestation. [pc.EachVagina] ");
	if(pc.isSquirter()) output("erupts in gushes of [pc.girlCum], splattering the poor panda's face.");
	else if(pc.wetness() <= 2) output("drips");
	else output("releases a river of");
	output(" [pc.girlCum], soaking the poor panda's face. Her sable sex visibly engorges, and you can actually watch the streams of girl-honey escape from her depths, one after another. The sapphic climaxes speed both her tongue and your rough handling of her velvety boobs until the two of you dissolve into an uncoordinated pile of twitching, blissed-out pleasure.");
	output("\n\nJade stirs first, murmuring, <i>\"Not bad, [pc.name].\"</i>  She cuts an interesting figure with her face covered in your [pc.girlCumColor] juices, but before you can comment on it, she wrangles you into a kiss, forcefully dragging your body into a cuddle whether you meant to or not. Your muscles are still a little slack from the orgasm, so resistance isn't much of an option. She's as passionate a kisser as she is a pussy-licker, and by the time she releases you, you're nearly as stained as she is.");
	output("\n\nJade giggles, and smiles. <i>\"I suppose we should get cleaned.\"</i>\n\nYou nod.");
	if(pc.hasPerk("Ditz Speech")) 
	{
		output(" <i>\"You lick pussy, so well! You could be like, a galactic champion cunt-licker!\"</i>");
		output("\n\nJade just shakes her head and smiles wistfully.");
	}
	output("\n\nThere's a bathroom around a corner where you wash your face alongside the panda. You catch her lapping your juices off her face and fingers when she thinks you aren't looking.");
	//Woo woo! Done.
	processTime(30+rand(10));
	pc.orgasm();
	sexedJade();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}