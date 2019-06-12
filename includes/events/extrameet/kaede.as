public function extrameetKaedeDate():void
{
	if (flags["EM_KAEDE_DATE"] == undefined)
	{
		extrameetKaedeFirstTime();
	}
	else
	{
		extrameetKaedeRepeat();
	}
}

public function extrameetKaedeFirstTime():void
{
	showKaede();
	moveTo("BUNBAKERY");

	output("A split second after you electronically confirm the date, your Codex beeps with an incoming message - not over ExtraMeet, but over your personal comms. Sure enough, the incoming call displays an origin of <i>“Kaede Entara.”</i>");
	
	output("\n\nYou pick up and are instantly assaulted by the thunderous sounds of a crowded Tavros consumer deck. Kaede’s voice comes loud and clear, though: <i>“Ohmygod was... is that you on ExtraMeet right now?”</i>");
	
	output("\n\nYou say that it sure is. Where does she want to meet up?");
	
	output("\n\nKaede giggles, and the roar of the crowd dims somewhat. Maybe she’s ducked into a storefront. <i>“Uhhh, oh man, I honestly forgot Anno made me set that EM profile up. I haven’t gotten swiped on in forever and a half! D-do you really want to...?”</i>");
	
	output("\n\nYou can practically hear her blushing when you say that you do.");
	
	output("\n\n<i>“Wow! S-sure, I’d love to hang out, too. There’s a little confectionary up on the Res Deck I’ve always loved. Wanna meet up there? I’m just about to finish my shopping, so I can be there in just a few minutes.”</i>");
	
	output("\n\nSounds good to you. You tell her that you’ll be there.");

	processTime(30);

	clearMenu();
	addButton(0, "Next", extrameetKaedeFirstTimeII);
}

public function extrameetKaedeFirstTimeII():void
{
	showKaede();

	output("You’ve only just sat down at your table in the bustling little corner cafe when the door opens and a familiar ginger pup comes your way. Kaede’s wearing the same leather-and-jeans getup as in her profile pic, though she’s got a satchel slung on a shoulder with a big, smiling JoyCo logo on it and several plastic bags peeking up from inside. She’s breathing hard, tail battering the flood behind her.");

	output("\n\n<i>“Hi! Did I keep you long? The line was killer, so I ran straight here as soon as I got out.”</i>");
	
	output("\n\n<i>“It’s fine,”</i> you assure her, as Kaede plants a little kiss on your cheek and slides into the booth across from you. <i>“Just got here myself.”</i>");

	output("\n\nBefore long,");
	if (flags["MET_ILARIA"] != undefined) output(" Ilaria");
	else output(" a perky blue-haired girl with rabbit ears and a skirt that’s just a little too short to hide her hermaphroditism");
	output(" bounces up with a tablet under an arm, ready to take your order.");

	output("\n\n<i>“Heyya, Kaedypoo!”</i> the waitress beams, bouncing on her heels in a way that brings her dangerously close to exposing herself.");

	if (flags["ILARIA_TOTAL_KIDS"] != undefined)
	{
		output("\n\n<i>“Whatcha doin’ here with my mate, hmm?”</i>");
		
		output("\n\n<i>“Y-your mate?”</i> Kaede blinks, gulping.");
		
		output("\n\nIlaria giggles and leans down to plant a smooch on your cheek, right where Kaede did a moment ago. <i>“Yup. [pc.name] here’s my baby {daddy/mommy}. Don’t you worry, I’m not the jealous type. Well, maybe a little jealous of [pc.name] getting hands-on with you before I ever did.”</i>");
		
		output("\n\nSo you take it these two know each other.");
		
		output("\n\n<i>“Duh!”</i> Ilaria says. <i>“I’ve been living on Tavros since I was 10. There’s only one school on this tub, so, y’know.”</i>");
		
		output("\n\n<i>“And Ilaria’s why I love coming here. Plus it’s like a block from my apartment,”</i> Kaede admits. <i>“It’s nice seeing familiar faces.”</i>");
		
		output("\n\nIlaria grins. <i>“Aww, you too. Anyway, what can I get you cuties?”</i>");
	}
	else if (flags["FUCKED_ILARIA"] != undefined)
	{
		output("\n\n<i>“Whatcha doin’ here with my favorite backroom buddy, hmm?”</i>");
		
		output("\n\nKaede blinks. <i>“Your what?”</i>");
		
		output("\n\nIlaria giggles and leans down to plant a smooch on your cheek, right where Kaede did a moment ago. <i>“I dunno, that sounded more clever in my head. Nevermind.”</i>");
		
		output("\n\nSo you take it these two know each other.");
		
		output("\n\n<i>“Duh!”</i> Ilaria says. <i>“I’ve been living on Tavros since I was 10. There’s only one school on this tub, so, y’know.”</i>");
		
		output("\n\n<i>“And Ilaria’s why I love coming here. Plus it’s like a block from my apartment,”</i> Kaede admits. <i>“It’s nice seeing familiar faces.”</i>");
		
		output("\n\nIlaria grins. <i>“Aww, you too. Anyway, what can I get you cuties?”</i>");
	}
	else
	{
		output("\n\n<i>“What can I get you and your cutie date, hmm?”</i>");
		
		output("\n\nSo you take it these two know each other.");
		
		output("\n\nKaede giggles. <i>“Y-yeah, I mean, there’s only one school on Tavros so all us station kinds kinda do. Oh, uh, this is Ilaria. Ilaria, [pc.name].”</i>");
		
		output("\n\n<i>“Any friend of Kaede’s a friend of mine!”</i> the waitress says, rocking back on her heels. <i>“Especially the cute ones! You better snag [pc.himHer], Kaede, or I just might!”</i>");
		
		output("\n\nYour date blushes fiercely while the bunny girl laughs. <i>“Oh, I’m awful. So what’ll hit the spot, you two?”</i>");
	}

	//Display Ilaria's shop menu. No escape clause. Hit the player with the effect of their chosen dish, but combine whatever they choose into the following scene UNLESS they choose the Sinabunny and they've already had sex with Ilaria. That gets the "Kaede Surprise" scene...

	// Me: :catstare:
}

public function kaedeDataIlariaMenu():void
{
	clearMenu();
	var free:Boolean = (flags["ILARIA_PREG_EMAIL1"] == 2);

	// Savin never accounted for the player having not enough credits, so I'm just
	// gonna swing this as a wink-nudge from Ilaria giving you the cheapy thing
	addButton(0,"Sin-a-Bunny",actuallyOrderFromIlaria,"Sin-a-Bunny","Sin-a-Bunny","Ilaria’s famous cinnamon-sprinkle buns, served piping hot and sinfully soft straight from her oven. Best with a glaze of her special homemade cream!");
	if(getOrderPrice("Vanilla Iced Teats") <= pc.credits) addButton(1,"Vanilla Ice C.",actuallyOrderFromIlaria,"Vanilla Iced Teats","Vanilla Iced Teats","Ye olde ice cream, but with a milky twist! This designer brand is sourced from humanoid milk, but processed and flavored to be ten times tastier than a Terran bovine!");
	else addDisabledButton(1,"Vanilla Iced Teats","Vanilla Iced Teats","You can’t afford this.");
	if(getOrderPrice("Kaithrit Kittycake") <= pc.credits) addButton(2,"Kaithrit Cake",actuallyOrderFromIlaria,"Kaithrit Kittycake","Kaithrit Kittycake","Cheesecake, sort of. Made with a rich, thick cream that kaithrit go wild for, but condensed into a milky cake. Way more sugary than the Terran equivalent, it’ll melt in your mouth in the blink of an eye!");
	else addDisabledButton(2,"Kaithrit Kittycake","Kaithrit Kittycake","You can’t afford this.");
	if(getOrderPrice("Ausar Pup Pie") <= pc.credits) addButton(3,"Ausar Pup Pie",actuallyOrderFromIlaria,"Ausar Pup Pie","Ausar Pup Pie","A sweet, earthy pie made from Ausaril fruits and crust. Served in bite-sized cubes with individual flavorings - always piping hot!");
	else addDisabledButton(3,"Ausar Pup Pie","Ausar Pup Pie","You can’t afford this.");
	if(getOrderPrice("Dzaan Cream Smoothie") <= pc.credits) addButton(4,"D. Smoothie",actuallyOrderFromIlaria,"Dzaan Cream Smoothie","Dzaan Cream Smoothie","Called as such because it’s as addictive as a dzaan alpha - well, maybe not really, but one taste will have you begging for more of this sweet, creamy smoothy, guaranteed!");
	else addDisabledButton(4,"Dzaan Cream Smoothie","Dzaan Cream Smoothie","You can’t afford this.");
	if(getOrderPrice("Raxxian Road") <= pc.credits) addButton(5,"Raxxian Road",actuallyOrderFromIlaria,"Raxxian Road","Raxxian Road","A chunky whipped cream dessert filled with chocolate chunks and loaded down with cookie crumble and sprinkles. The favorite of kids on the station!");
	else addDisabledButton(5,"Raxxian Road","Raxxian Road","You can’t afford this.");
	if(getOrderPrice("Gryvain Jigglers") <= pc.credits) addButton(6,"GryvainJiggler",actuallyOrderFromIlaria,"Gryvain Jigglers","Gryvain Jigglers","A bowl of fruity gelatin from the gryvain homeworld of Vendiko. Kept in the planet’s dense, thick atmosphere, these treats all but dissolve on contact with your mouth, giving you a burst of flavor with every bite!");
	else addDisabledButton(6,"Gryvain Jigglers","Gryvain Jigglers","You can’t afford this.");
}

public function kaedeDataIlariaOrder(order:String):void
{
	clearOutput();
	showKaede();

	output("<i>“Ooh, that sounds good. Same for me.”</i>");
	
	output("\n\n<i>“’Kay!”</i> Ilaria grins, spinning on a heel. <i>“Be right up!”</i>");
	
	output("\n\nAs soon as she’s gone, Kaede claps her hands to her burning cheeks. <i>“Ahh, I didn’t think Lari would make a fuss. I’m sorry!”</i>");
	
	output("\n\nPerish the thought. Besides, Kaede’s always so cute when she’s embarrassed.");
	
	output("\n\nThat just makes her blush a little harder, sinking down in her seat. Before <i>all</i> her blood migrates to her cheeks, you figure you better change the subject: what was she getting at JoyCo earlier?");
	
	output("\n\n<i>“O-oh, just a few things for living ship-side. Ration bricks, bath scrub, sterilex, some of that fuzzy stuff you spray on engines if they get overheated. You know, nothing special. I had a few other places I was gonna go, but I wasn’t gonna miss an opportunity like this.”</i>");
	
	output("\n\nIs that right?");
	
	output("\n\nBefore you can press that button, Ilaria returns with a pair of plates laden down with treats. She slides them onto the table between you with a wink and a shake of her hips that brushes awfully close to Kaede’s face before leaving you two to enjoy your snack.");
	
	output("\n\n<i>“She’s such a flirt!”</i> Kaede says, somewhere between a laugh and a sigh as she takes a first bite. <i>“I wish I had her confidence...”</i>");
	
	output("\n\n{PC is Hard: What would she need with it? She’s already a babe magnet. //else: Nah, she’s perfect the way she is.}");
	
	output("\n\nKaede huffs, but her tail thumps side to side in the booth behind her. You grin at her as she stuffs her face with a few consolation bites, which are all it takes to lighten the mood back up again. Before long she’s chatting away at you, laughing about some embarrassing Anno moment back in college, then retelling an encounter between her little freighter and a dastardly crew of pirates that came close to ending her young career. By the time she’s talking about her strained relationship with her mother, your plates have been cleared off and Kaede’s leaning back in her chair with her hands on her stomach.");
	
	output("\n\n<i>“God, how long have I been rambling on?”</i> she gasps, looking past you at the changing street lights outside. <i>“You should have stopped me half an hour ago!”</i>");
	
	output("\n\nNonsense. It’s not often you get the chance to just sit back and relax with her, after all. Kaede laughs and wags her fluffy tail, staring into her empty soda glass for a moment before saying, <i>“You know, I could go for a stiffer drink... and my appartment’s a little closer than Anon’s. Care to, um... join me?”</i>");

	processTime(55+rand(11);

	setOrderTFAndDeets(order);

	clearMenu();
	addButton(0, "Next", kaedeDataIlariaOrderII);

}

public function kaedeDataIlariaOrderII():void
{
	clearOutput();
	showKaede();

	output("Kaede’s not kidding: her appartment’s only a stone’s throw away from Ilaria’s little restaurant, off the main thoroughfare in a cozy little block. As you’re walking, you ask her why she has it at all - doesn’t she basically live on <i>Talon Rogue</i>?");

	output("\n\nKaede scrunches her lips, thinking. <i>“I guess I do, yeah, but since I’m a Tavros native it’s cheap as hell to keep a small place here on the Res Decks. Thanks to your dad for pitching in so much funding for the station, I guess, cuz I know I’ve been reaping the benefits my whole life. Anyway, I don’t mind living shipboard, but sometimes it’s nice to have some solid ground under my feet, you know?”</i>");

	output("\n\n<i>“Solid ground... on a space station?”</i>");

	output("\n\n<i>“You know what I mean!”</i> she laughs. <i>“Being on an <b>actual</b> planet for too long makes me groundsick. Nah, space station living is the best the galaxy has to offer. All the benefits of stability and comfort with none of the giant open sky and horrible diseases. Ah, here we are...”</i>");

	output("\n\nKaede leads you up a short set of stairs to a little sliding door with her name printed beside it, surrounded by a floral pattern that’s gotten dusty with her absence. You follow her on inside, watching as the ginger pup shucks off her bags and flicks the lights on with the tip of her tail. As soon as the door slides shut behind her, a hologram snaps to life on a pillar beside the door, taking the form of a human woman in some kind of ancient toga and bronze armor.");

	output("\n\n<i>“Captain, you have new me- you have company, my apologies.”</i>");

	output("\n\n<i>“That’s fine, Athena. I’ll catch up later!”</i> Kaede calls, already disappearing into a side room. The hologram raises an eyebrow at you, then winks back out.");

	output("\n\nYou gotta ask, <i>“Who was that?”</i>");

	output("\n\nA moment passes. <i>“My ship’s A.I.,”</i> Kaede answers, coming back into view with a bottle of rum tucked under an arm. She’s shed her jacket, too, leaving pale, freckled flesh on display as she meanders over to the couch. <i>“Don’t mind her. She won’t interrupt again.”</i>");

	output("\n\nAlright, alright. You follow Kaede over, glancing around as you do. Her apartment’s small and spartan, with only a few comforts like the two-seat sofa and a cabinet full of holos around the wall-mounted screen, to prove that it’s been lived in at all. At least it’s well kept.");

	output("\n\nWhile you’re looking around, Kaede produces a pair of glasses and pours, raising hers for you to clink. <i>“To good friends and good booze!”</i> she cheers, leaning back into your shoulder and knocking back her drink. You slip your arm around her slender shoulders, letting the pretty pup nestle in close. Her tail flicks up onto your lap, draping across your crotch and swathing you in fluffy warmth.");

	output("\n\nWhen she finishes her drink, Kaede leans her head in against your shoulder, and one of her hands starts creeping its way across your [pc.chest]. You glance a hungry little smile playing across her lips, almost begging you to lean in and kiss them. Who are you to refuse? Cupping her chin in a hand, you bring them up to your [pc.lips] and lean into her, feeling the warmth of Kaede’s sweet breath against you.");

	output("\n\nWhen you break the kiss, Kaede pushes forward with uncharacteristic aggression. Her lips lock back against yours, and she swings a leg over to straddle you. You can feel her bulge grind against your [pc.belly], and instinctively your fingers find their way to her jeans’ zipper and start sliding it down. A moment later and there’s a throbbing red rocket rubbing on your stomach as Kaede’s hands desperately claw your [pc.gear] off between tongue-filled smooches.");

	output("\n\nThen her tail sweeps across the coffee table, clearing it off with one mighty wag.");

	output("\n\n<i>“Oops,”</i> Kaede giggles, biting a lip as her remotes go tumbling. <i>“Guess you better take me to the bedroom before I make more of a mess...”</i>");

	output("\n\nSo how’s the going to play out?");

	processTime(55+rand(11));

	clearMenu();
	if (pc.hasCock()) addButton(0, "Pound Her", extrameetKaedePoundHer);
	else addDisabledButton(0, "Pound Her", "Pound Her", "You need a wang-dangle to pound her!");

	addButton(1, "Blow&Bounce", extrameetKaedeBlowNBounce, undefined, "Blow & Bounce", "Actually, you like Kaede right where she is... with her dick out and in your hands.");
}

public function extrameetKaedeBlowNBounce():void
{
	clearOutput();
	showKaede(true);

	output("Actually, you like Kaede right where she is, and you let her know with a long kiss as you wrap your fingers around her knotty cock. She just moans into your mouth as you roll her over, putting her back into the couch while you slink down her svelte body and onto the floor between her trembling legs. She stares with awestruck eyes as you let your [pc.tongue] play out around the plump base of her dick, lapping at the swelling knot until its throbbing between your [pc.lips]. You slowly, sensually trace your mouth up her nearly eight inches of length until you’re kissing her slender spearhead.");
	
	output("\n\n<i>“O-ohhh, that’s good,”</i> Kaede murmurs, settling her hand on your head and gently guiding you down. You let her, just this once; it’s nice to know your mouth’s appreciated, and she moans with every inch you swallow. By the time you’re kissing her swell again and the crown has thrust past your tonsils, you can feel her veiny shaft throbbing with need against your [pc.tongue]. When you withdraw to the tip, she’s squirming and moaning... and when you go down again, her thighs clench around your [pc.ears].");
	
	output("\n\n<i>“Take it easy,”</i> Kaede whines, shivering for you. <i>“I... I haven’t cum for a bit. Don’t be so aggressive...”</i>");
	
	output("\n\n<i>Sorry, can’t hear you with your legs on my ears,</i> you think, starting to suck and writhe your tongue. Her knot engorges between your teeth, forcing your jaw open around her girth. You clench your thumb to fight down a gag as a thick stream of salty pre leaks down the back of your throat, heralding the inevitable consequences if you keep this up.");
	
	output("\n\nThat’s almost as much encouragement as anything. You swallow, letting your throat massage her top inches as your lips slavishly kiss and suckle on her knot. Though her tail’s wagging something fierce, Kaede’s voice comes out as a rasping whine: <i>“T-t-take it easy I’m gonna... gonna...”</i>");
	
	output("\n\nYeah, you know. Figuring you might as well cut to the chase, you slip a finger in through her open fly and press it into her tight little hole, prodding that prominent clit hidden just within. Kaede shrieks in surprise, and sure enough, you feel her veiny red rocket swell all the way down your throat. Hot, sticky juice flows down your gullet as Kaede’s legs kick and squirm over your shoulders, flailing like she’s lost all control of her body.");
	
	output("\n\nA wicked idea crosses your mind, and you pull yourself back up her shaft so that the latter half of her explosive orgasm ends up caught across your [pc.tongue]. You roll the thick, salty spooge around between your cheeks, gently sucking on her tip until every drop’s been spilled. When it’s done, you pull yourself off her knob and back onto the couch, straddling Kaede’s little hips to kiss her. The moment her lips open to accept your tongue, you feed her her own jizz. She gasps and squirms, but getting a mouthful of cum is basically her natural state, and her resistance fades into desperate horniness moments later. Her dick doesn’t bother softening, like it knows all the cum and drool clinging to it is only lube for what’s to come.");
	
	output("\n\nYou shed what’s left of your gear and lean down in Kaede’s lap, never breaking the kiss even as her spunk-slathered shaft slides into your [pc.vagOrAss]. The dog-girl swallows hard as you spear yourself on her cock, draining all that creamy cum you so generously gave her back with a ragged moan. By the time your [pc.butt] comes to rest on her thighs, her knot is throbbing {between the lips of your quim / in the ring of your ass}, threatening to sink inside if you don’t raise yourself back on your [pc.knees] and start riding that dick.");
	
	output("\n\n<i>“A-aah,”</i> Kaede moans, grabbing at your hips. <i>“You’re such a bully!”</i>");
	
	output("\n\nMaybe, but she loves having her dick bullied, doesn’t she?");
	
	output("\n\nThe ginger halfbreed blushes fiercely, but she can’t deny the charge with her rock-hard cock buried inside you. Instead, you guide her hands to your [pc.hips], getting her to help steady you while you start to ride that sweet shaft of hers. She’s so wet that it’s effortless to slide up and down her length, bouncing off her knot with every nadir. {PC has a cock: Your own [pc.cock] slaps against her stomach, smearing the space between her perky tits with your own pre.} Kaede’s sweet little moans echo through the spartan apartment, mixing with the wet slaps of flesh against flesh to form a lurid chorus.");
	
	output("\n\nYou play your hands up across Kaede’s chest, running your thumbs over her stiff teats; just a touch is enough to make her tremble, and her breasts perfectly fill your hands when you go to grope and squeeze them. Oh, they’re nice and tender, aren’t they? Perfect targets for your [pc.lips] to suckle and kiss.");
	
	output("\n\nWith just a little pressure on her chest, Kaede collapses back into the couch, taking you with her. Your bodies press together{, grinding against your [pc.cocks]}, and her thighs wrap around your waist. You just keep riding her, moaning into her tits every time her knot batters your [pc.vagOrAss]. It’s so hard to resist taking that incredible stretch... and why should you? Kaede’s already riding her edge again, and all you’d need to join her is to feel that bitchbreaker lodge itself inside your [pc.vagOrAss].");
	
	output("\n\nGrinning down at the panting pup, you raise yourself up as high as you can go without entirely drawing her all the way out of you. She has just enough time to blink at you before you drop yourself straight back down her throbbing red rocket. Her fist-sized knot punches straight through {your pussy’s lips // the ring of your ass}, forcing a scream of orgasmic pleasure from your [pc.lips]. Her dick immediately erupts, swelling within your walls as alabaster seed shoots up her rod and into your waiting {womb / gut}. {PC has cock: Your [pc.cock] gives her a shower in return, squirting all over her tits and face as you grind on her knot. She giggles as ropes of [pc.cumColor] slap her cheeks, licking it off her lips as it rains down on her. //else: Your [pc.vagOrAss] hugs her throbbing erection tighter with ever spurt, letting the lightning-bolts of ecstacy plow through your body to the beat of her ejaculation.");
	
	output("\n\n<i>“O-oh fuck,”</i> Kaede groans, {PC has boobs: hiding her face in your cleavage // covering her face in her hands}. <i>“I can’t feel my legs...”</i>");
	
	output("\n\nThat’s fine. She’s not going anywhere with that knot buried in you. So you push her back against the couch and lock lips, telling her that she’d better get some rest... unless she’s ready to go again.");
	
	output("\n\nKaede taps the side of the couch and pulls you in against her. <i>“I’m out... just stay still, or I’m never gonna deflate...”</i>");

}

public function extrameetKaedePoundHer():void
{
	clearOutput();
	showKaede(true);

	output("You grab Kaede’s tight behind in both hands, hefting her up off the couch with you. She squeals and giggles, wrapping her legs around your waist - and thrusting her naked cock against your belly with every step you take towards her bedroom. Like the rest of her apartment, it’s fairly spartan, but the bed is big and soft and makes a delightful <i>pomf</i> sound when you sprawl the wagging ginger out on her belly. Her boots and pants come off with a few good yanks, each punctuated by a grope or a firm spank that leaves Kaede moaning by the time you get both hands on her bare behind and spread it open.");
	
	output("\n\nWhile you’re busy molesting her butt, Kaede stretches out towards the nightstand and pulls out a bottle of clear oil <i>“Let me get you started?”</i>");
	
	output("\n\nAlright. You roll Kaede over onto her back and crawl onto the bed over her, letting your hardening [pc.cock] drag over her own member and then up her flat belly, eventually stopping with your head nestled between her breasts. Kaede grins and upends the bottle into her cleavage and pressing her shoulders together to smear it up both mounds. While she’s got her tits pressed tight, you ease your [pc.hips] forward, thrusting your [pc.cock] into her tits.");
	
	output("\n\nKaede grins ear to ear as you start going at ‘em. <i>“Haha, Anno teases me about being too small... but I can still give a titfuck!”</i>");
	
	output("\n\nShe’s just right. While her hands are keeping her lubed-up cleavage nice and tight, you lock your hands onto the bed on either side of her, getting the leverage you need to hammer those tits. Every thrust slathers your [pc.cock] with more and more lube, until your cock’s glistening with oil and drooling pre between Kaede’s tits. The puppyslut leans in and gives your sodden crown a wet lick, slurping up the glaze of [pc.cum] like it’s the sweetest thing in the world.");
	
	output("\n\nYou dismount her after that, drawing your hands down over her lubed-up chest and squeezing Kaede’s tits until she squirms. her little red rocket wobbles under its own hardness, throbbing in the wind while you sink your fingers into its owner’s boobs and play with her diamond-hard teats. Might as well show her a little mercy, you figure, and you let your hands trace down her flanks before wrapping them around her quivering pillar.");
	
	output("\n\nYour lover’s back arches off the bed amidst gasps of pleasure as your hands start riding up her length. Your own [pc.cock] rubs against her thigh, steadily pressing up against Kaede’s booty until you can’t take the tension anymore. Leaving one hand to keep jacking Kaede off, you use the other to align yourself with Kaede’s lonely hole, prodding her winking star your [pc.hips] can force it in.");
	
	output("\n\nKaede cries out, a girly shriek of pleasure that ends with white cream spilling down your fingers. She squirms, trembling until the last drop of seed has been spilled. <i>“Fuuuuuck, not already,”</i> she sighs. <i>“J-just fuck me, I can keep going...”</i>");
	
	output("\n\nIf she’s sure, you’re more than happy to start pounding the poor pup’s {silly|pooper|ass}. Her legs are already limp, easily spreading for you and letting you go [pc.knotBallsHilt]-deep. Kaede moans and claws at her bedsheets. Her whole body rocks backwards under the force of your thrust as you sheathe yourself inside her wickedly tight ass. Her cock can’t soften with you battering her prostate, and so it’s left to wobble back and forth every time you drive yourself into its owner, flicking bits of salty seed acros Kaede’s belly.");
	
	output("\n\nYou lean in and kiss her again, pressing her dick down between your bodies as your hands cup her cheeks.");
	
	output("\n\n<i>“You make me feel amazing,”</i> Kaede admits, grinning at you between kisses. <i>“Soooo good.”</i>");
	
	output("\n\nSame to her. While she’s all smiles and ecstacy, you take the opportunity to hook your arms around Kaede and flip her over, letting her finally plant her face in her pillows and wag her ass in the air for you. Her tail bats your cheeks until you pin it down over her back, giving you a peerless view of her cheeks spread around your [pc.cock]. Kaede grips her pillow in both hands, burying her face in its fluffy embrace while you resume pounding her ass.");
	
	output("\n\nHer hole accepts every thrust of your [pc.cock] with wet slurps and tight squeezes. Her dick bobs fore and back every time your [pc.hips] slap against her butt, dripping lube and pre down to the beat of your sodomy. Before long, you end up wrapping your arms around Kaede’s waist and lifting her up on her knees so you can kiss those sweet lips of hers again. She keeps hugging her pillow and moans whorishly until you get one hand around her dick and your [pc.lips] on hers.");
	
	output("\n\nHer body’s lean and light, and Kaede’s putty in your hands at the worst of times; while she’s in the throes of ecstacy you can man-handle her any which way you want. Whether it’s pile-driving her into the sheets, rolling her on her back and teething on those tits, or making her bounce in your lap, Kaede follows your lead without question. Her vigorous grip on your [pc.cock] ensures that by the time Kaede’s pressing herself against you and screaming that she’s cumming again, you’re finally ready to join her. You buck your [pc.hips] up into her taut rear, relishing in her screams of pleasure one last time{ as your [pc.knot] breaches her}.");
	
	output("\n\nAn arch of pearly white spooge flies from the tapered tip of Kaede’s cock, milked out by your relentless pounding of her ass-clitty. She grabs her breasts in both hands and bucks in your lap, pushing down to the hilt and squealing as your own [pc.cum] shoots inside her. Kaede’s whole body goes limp in your arms, all her muscles going slack while your empty your [pc.balls] into her. When her own orgasm runs dry, she just sinks back into your [pc.chest], letting you finish pumping her belly full of your own [pc.cumNoun].");
	
	output("\n\n<i>“I love this feeling...”</i> Kaede murmurs, interrupting herself with a little gasp as your [pc.cock] throbs inside her. <i>“Let me just stay like this...”</i>");

	//RESIDENTIAL DECK 17
}