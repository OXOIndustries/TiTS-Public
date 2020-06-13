// Vava Groom
// by Nonesuch

/*
Notes

* Run by a kalabast and his pet fhan'i: Cruff and Estie.

* Cruff has a hands-on, dog whisperer vibe. He’s a big animal lover and has a collection of exotic pets, some of which he carries with him, some of which are cared for by his other fhan’i pet back at home. Estie is perky and sweet.

* They’re mobile: Uveto just happens to be their most recent stop. They’ve stayed there a while because it’s obviously popular amongst the locals.

* They do grooming services for pets (tease boost for 24 hours?), what amounts to relationship advice/counseling for owners and pets, and more stringent obedience and sexual training tailored for subs looking to go the extra mile.

* Cruff will ask the PC who they own/are owned by, PC can talk about Anno, Erra, Sera etc. Plenty of scope for future events where the PC takes one of them/is taken to get a rigorous session here.

* Sex scenes? Think for the sexual training just vibes and prosthetics etc. used, and both of them get involved.

*/

// Location
// Intros
public function vavaGroomOutsideBonus():void
{
	// Not visited blurb
	if(flags["VAVA_GROOM_VISIT"] == undefined) output("\n\nThrough the reinforced windows to the west, you can see a bulky, medium-sized ship is docked to the station’s arm. Colorful holo advertisements run along its side for something called ‘Vava Groom’. The ecstatic cartoons receiving a vigorous brushing morph into " + plural(pc.raceShort()) + " when their programs clock you looking at them. The large airlock that attaches the ship to Uveto Station has all the trappings of a warmly lit shop front, and it seems to be attracting a bustle of huskar.");
	// Visited blurb
	else output("\n\nTo the west, the incongruously warm glow of Vava Groom beckons you.");
	return;
}
public function vavaGroomBonus():Boolean
{
	clearOutput();
	author("Nonesuch");
	// Visit first time
	if(flags["VAVA_GROOM_VISIT"] == undefined)
	{
		showBust("ESTIE");
		
		output("Two ausar males brush past you as you approach the airlock-cum-shop front; the collared one has an expression of dreamy content on his face, touching the immaculately styled and glossy fur on his head as he’s led away by the other.");
		output("\n\n<i>“Hello, and welcome to Vava Groom!”</i> chirps the neatly dressed, tentacle-haired albino girl at the counter, beyond the short, wide corridor connecting the ship to the station. She isn’t looking at you with her half-closed, tar black eyes; her finned ears twitch as you venture further inside.");
		// If never fhan’i and Vanae met:
		if(CodexManager.entryUnlocked("Vanae") && !CodexManager.entryUnlocked("Kalabast/Fhan’i")) output(" You frown at her. The hairless, albino skin, the large breasts swelling her shirt, the tentacle hair and webbed fingers, the obvious echolocation... that’s a vanae, surely? How on Terra did one wind up here, of all places? Blissfully unaware of your expression, she continues her patter.");
		output(" <i>“Master is just finishing up from his last client, and will be out in a second. Are you here for a styling, or to book a training slot?”</i>");
		output("\n\nYou notice she’s wearing a rather tight-looking metal collar.");
		
		processTime(1);
		
		flags["VAVA_GROOM_VISIT"] = 1;
		
		// [Vava Groom] [Her] [Appearance]
		clearMenu();
		addButton(0, "Vava Groom", vavaGroomIntro, undefined, "Vava Groom", "Ask about this place.");
		// Does not appear if PC has not encountered vanae
		if(CodexManager.entryUnlocked("Vanae") && !CodexManager.entryUnlocked("Kalabast/Fhan’i")) addButton(1, "Her", vavaGroomIntro, true, "Her", "So yeah, what exactly is a vanae doing here?");
		
		return true;
	}
	
	showBust("ESTIE", "CRUFF");
	
	// Visit repeat
	output("The reception area of Vava Groom is one of the ship’s cargo bays, fitted with a teak synth floor, lit warmly and decorated with aquariums, diplomas and pictures of various happy customers. There are chairs for waiting customers and a counter. The business end of the parlor resides behind closed doors, further within the craft. The aquariums have a remarkable range of creatures gliding and glinting their way around them: tiny iridescent squids, crabs shaped like horses, multi-headed eels...");
	output("\n\n<i>“Hello, [pc.name] Steele!”</i> says Estie in her singsong voice when you step through the wide airlock. <i>“Here for a grooming?”</i> Cruff is also here, " + RandomInCollection([
		"feeding the creatures in his aquariums",
		"tapping away at a holo board",
		"cleaning a set of clippers"
	]) + ". He simply dips his head to you.");
	
	vavaGroomMenu();
	
	return true;
}
public function vavaGroomIntro(vanae:Boolean = false):void
{
	clearOutput();
	author("Nonesuch");
	showBust("CRUFF", "ESTIE");
	
	if(vanae)
	{
		output("<i>“Um...”</i> you wonder if this isn’t quite a rude thing to ask, but you aren’t going to be able to concentrate until you get it off your tongue. <i>“You’re a vanae, right?”</i>");
		output("\n\n<i>“Fhan’i,”</i> the girl replies, with careful pronunciation. <i>“The emphasis is... oh, wait. You’ve come from the frontier, haven’t you?”</i> She leans forward with a grin, large breasts squeezed together as she bends her shoulders in. <i>“I know, isn’t it incredibly exciting! A race that is almost exactly like us, living native on a crazy jungle world. I only found out a week or so ago, and I’m still kinda wondering if someone is playing a big joke on me about it to be honest. If only we could talk to them! If only we knew if they keep histories, so we could - ”</i>");
		output("\n\n<i>“Estie, you aren’t nattering a customer’s ears off, are you? [pc.He] probably doesn’t use them as much as you do, but I imagine [pc.he] still needs them.”</i>");
		output("\n\nYou turn to take in the large, furry shape emerging from within the ship, drying his paw-like hands on a towel and extending one to you.");
	}
	else
	{
		output("<i>“Is this some kind of salon, then?”</i> you ask.");
		output("\n\n<i>“So much more!”</i> replies the girl eagerly, dolphin-like tail wagging. <i>“Here at Vava Groom, we tailor our service to meet your needs. A hair styling with complimentary head pats - that’s fine! Some obedience training for the frisky someone in your life - easily done! If you aren’t sure what you need, we’ll sit down with your pet and work out exactly...”</i>");
		output("\n\n<i>“Estie, the Doondaraichur is acting up again. Go and use your magic touch - oh, hello! A new costumer. Excellent.”</i>");
		output("\n\nYou turn to take in the large, furry shape emerging from within the ship, drying his paw-like hands on a towel and extending one to you.");
	}
	
	output("\n\n<i>“Hnnurrungun ven goor Cruff at your service, [pc.name] Steele,”</i> the heavily built, lion-like biped says in his deep, fruity voice, regarding you closely with four solemn, yellow eyes. He grips your forearm when you shake and holds you in his tufted grip for a moment, as if testing your muscles for something. <i>“Call me Cruff.”</i> He steps away and gestures at the room - what might have been a standard cargo bay at some point, but is now a clean, warmly lit area decorated by some rather remarkable looking aquariums. <i>“Vava Groom - the premier mobile pet grooming service. We are active wherever there are pets that require the attention they deserve. What, may I ask, do you require, [pc.name] Steele?”</i> Cruff leans on the counter, his apparently light, bluff tone counterweighted by his four solemn, unblinking eyes. <i>“I have time before my next appointment. Please - let’s talk.”</i>");
	// Kalabast/fhan’i not met:
	if(!CodexManager.entryUnlocked("Kalabast/Fhan’i"))
	{
		output("\n\n<b>Your codex clicks to politely inform you that it has downloaded information about Cruff and Estie’s races. Although it’s saying there’s only a single entry?</b>");
		CodexManager.unlockEntry("Kalabast/Fhan’i");
	}
	
	processTime(5);
	
	vavaGroomMenu();
}
public function vavaGroomMenu():void
{
	// [Services] [Talk] [Appearance] [Leave]
	clearMenu();
	if(flags["VAVA_GROOM_ROLE"] == undefined) addButton(0, "Services", vavaGroomServices, undefined, "Services", "So they... groom people?");
	else
	{
		// [Grooming]
		if(pc.credits >= 1000) addButton(0, "Grooming", vavaGroomServiceGrooming, undefined, "Grooming", "1000 credits for a thorough combing and glossing.");
		else addDisabledButton(0, "Grooming", "Grooming", "You don’t have enough credits to do this!\n\nCosts 1000 credits.");
		// [Obedience] [E. Training]
		if(flags["VAVA_GROOM_ROLE"] < 0)
		{
			// Perma-grey out for now
			if(9999 == 0) addButton(1, "Obedience", vavaGroomServiceObedience, undefined, "Obedience Training", "9999");
			else addDisabledButton(1, "Obedience", "Obedience Training", "Perhaps this option will become available later.");
			if(flags["VAVA_GROOM_SERVICE_EROTIC_TRAINING"] == undefined)
			{
				addButton(2, "E. Training", vavaGroomServiceEroticTraining, undefined, "Erotic Training", "Receive some submissive tutelage.");
			}
			else
			{
				if(pc.credits >= 1000) addButton(2, "E. Training", vavaGroomServiceEroticTraining, undefined, "Erotic Training", "Receive some submissive tutelage.");
				else addDisabledButton(2, "E. Training", "Erotic Training", "You don’t have enough credits to do this!\n\nCosts 1000 credits.");
			}
			if(pc.hasVagina() && pc.blockedVaginas() > 0) addDisabledButton(2,"E. Training","Erotic Training","You should come back after unburdening your femininity of any blockage.");
		}
	}
	addButton(5, "Talk", vavaGroomTalk, undefined);
	addButton(10, "Appearance", vavaGroomAppearance);
	addButton(14, "Leave", vavaGroomLeave);
}
public function vavaGroomLeave():void
{
	// Leave straight away/without using a service:
	if(vavaGroomTimesServiced() <= 0 && flags["VAVA_GROOM_VISIT"] < 2)
	{
		clearOutput();
		author("Nonesuch");
		showBust("CRUFF", "ESTIE");
		
		output("<i>“Some other time then,”</i> says Cruff, phlegmatic as you make your excuses. <i>“We shall be docked here at Uveto for a while yet. Duck in whenever you or your pet is feeling run down by the weather here. We can raise your spirits - I guarantee this.”</i>");
		
		flags["VAVA_GROOM_VISIT"] = 2;
		
		clearMenu();
		addButton(0, "Next", move, rooms[currentLocation].eastExit);
		return;
	}
	// Repeat leave just put the PC outside shop
	move(rooms[currentLocation].eastExit);
}

// Appearance
public function vavaGroomAppearance():void
{
	clearOutput();
	author("Nonesuch");
	showBust("CRUFF", "ESTIE");
	
	output("Hnnurrungun ven goor Cruff is a 6\' 1\" Kalabast. He dresses simply and tightly in a white t-shirt and black jeans, out of which the well-padded bulk of his tawny, short-furred body fairly bursts. That fur grows in wavy abundance from his head and jaw, adding to his lion-like profile. He’s got it combed back out of the way, although there’s still a certain wildness to it all; savannah in motion. Out of it his two big, lynx-like ears reach. Although he lacks the saber teeth and his nose is probably too broad, here on Uveto it might just be able to mistake him for a milodan were it not for his four eyes. Although the kalabast generally has an affable, purposeful manner about him, those pale yellow orbs with their round black pupils have an odd solemnity to them.");
	output("\n\nCruff’s digitigrade legs and the heavy musculature in his back and shoulders give the impression that he could start padding around on all fours at any moment. Out of his pants a short, fluffy tail hangs. What might be <i>in</i> his pants is difficult to tell beyond a respectable bulge at crotch level, but you’d have to assume a kalabast owning a coterie of healthy fhan’i would have to have the equipment to back it up.");
	output("\n\nEstie is a 5\' 2\" Fhan’i. She dresses in a plain, pale green t-shirt with short, wide sleeves and matching long trousers. To this model of classic veterinarian garb her DD breasts add a considerable strain. Her nipples stand out quite clearly, evidently engorged by the rubbing material.");
	output("\n\nEstie’s skin is a ghostly, hairless white all across her body except at the tips of her webbed digits and shoulder-length tentacle hair, where it turns a bright purple. She’s got her tentacle hair styled in an asymmetric fashion, three or four of them slicing down one side of her face, the rest of them combed neatly behind her ear. Above the cute bottom giving some shape to her loose trousers, her long, limber tail curves outwards. With its horizontal fork at the end, it looks rather like a dolphin’s, but by its movements considerably more flexible.");
	output("\n\nThe fhan’i has a pretty, flat-nosed face with black, half-lidded eyes. She rarely turns to face the person she’s addressing; not quite sightless, but close. Her finned ears, constantly craning and twitching, are obviously doing most of her sensory work. She seems possessed by a tireless, perky energy, beaming at every person who enters the ship as if each were a beloved, seldom seen friend. Around her neck there is a slim, tight-fitting silver collar, with clasps both to the front and back.");
	output("\n\nAgain, there is nothing to indicate what kind of business she’s got going on genitalia-wise, but everything about her suggests she is a very normal young adult fhan’i.");
	
	addDisabledButton(10, "Appearance");
}

public function vavaGroomTimesServiced():int
{
	var services:int = 0;
	
	if(flags["VAVA_GROOM_SERVICE_GROOMING"] != undefined) services += flags["VAVA_GROOM_SERVICE_GROOMING"];
	if(flags["VAVA_GROOM_SERVICE_OBEDIENCE_TRAINING"] != undefined) services += flags["VAVA_GROOM_SERVICE_OBEDIENCE_TRAINING"];
	if(flags["VAVA_GROOM_SERVICE_EROTIC_TRAINING"] != undefined) services += flags["VAVA_GROOM_SERVICE_EROTIC_TRAINING"];
	
	return services;
}
public function vavaGroomPetLevel():int
{
	if(pc.isSubby()) return 100;
	
	var obedience:int = 0;
	var mult:int = 0;
	
	if(pc.personality <= 0) mult = 5;
	else if(pc.personality <= 25) mult = 4;
	else if(pc.personality <= 50) mult = 3;
	else if(pc.personality <= 75) mult = 2;
	else mult = 1;
	
	if(flags["VAVA_GROOM_SERVICE_OBEDIENCE_TRAINING"] != undefined) obedience += (flags["VAVA_GROOM_SERVICE_OBEDIENCE_TRAINING"] * mult);
	if(flags["VAVA_GROOM_SERVICE_EROTIC_TRAINING"] != undefined) obedience += (flags["VAVA_GROOM_SERVICE_EROTIC_TRAINING"] * mult);
	
	if(obedience < 0) obedience = 0;
	if(obedience > 100) obedience = 100;
	
	return obedience;
}

// Services first time
public function vavaGroomServices():void
{
	clearOutput();
	author("Nonesuch");
	showBust("CRUFF", "ESTIE");
	
	output("<i>“We take care of all pets,”</i> replies Cruff, meeting your querying gaze steadily. <i>“If you have a cat that needs spaying, a sloveatte that needs house training, a pexiga that needs declawing - we can do all of these things, kindly and efficiently.”</i>");
	output("\n\n<i>“You got a big doggie? They get a free treat when they come in and they’re good. Because they’re such good dogs!”</i> Estie puts in.");
	output("\n\n<i>“But yes, what we’re best known for are is our sapient pet tending,”</i> Cruff says. <i>“My people have a long tradition of owner-pet relationships - we believe they’re an incredibly healthy and fulfilling way for partners to express their love for one another, so long as they’re well managed.”</i>");
	output("\n\n<i>“That’s where we come in!”</i>");
	output("\n\n<i>“If you don’t mind me asking, [pc.name]...”</i> Cruff knits his paws and regards you closely. <i>“Do you consider yourself more of an owner, or a pet?”</i>");
	
	processTime(1);
	
	// [Owner] [Pet] [Neither] [Both]
	clearMenu();
	addButton(0, "Owner", vavaGroomRoleResponse, "owner", "Owner", "");
	addButton(1, "Pet", vavaGroomRoleResponse, "pet", "Pet", "");
	addButton(2, "Neither", vavaGroomRoleResponse, "neither", "Neither", "");
	addButton(3, "Both", vavaGroomRoleResponse, "both", "Both", "What kind of pleb doesn’t experience everything life has to offer?");
}

public function vavaGroomPets():Array
{
	var pets:Array = [];
	if(debug || annoRecruited() || annoIsPet()) pets.push("Anno");
	if(debug || erraCollared()) pets.push("Erra");
	if(debug || seraRecruited()) pets.push("Sera");
	if(debug || reahaRecruited()) pets.push("Reaha");
	if(debug || pexigaRecruited()) pets.push("Bimbo Pexiga");
	return pets;
}
public function vavaGroomMasters():Array
{
	var masters:Array = [];
	if(debug || seraIsMistress()) masters.push("Sera");
	if(debug || xantheIsDommingPC()) masters.push("Xanthe");
	if(debug || bothriocAddiction() >= 50) masters.push("Bothrioc");
	return masters;
}

public function vavaGroomRoleResponse(response:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showBust("CRUFF", "ESTIE");
	
	var i:int = 0;
	var btnSlot:int = 0;
	
	switch(response)
	{
		case "neither":
			if(pc.isBro() || pc.isAss()) output("You make it very clear you’re not buying their particular brand of crazy juice.");
			else output("As politely as possible, you distance yourself from the entire dichotomy.");
			output("\n\n<i>“Fair enough,”</i> Cruff replies with a broad shrug, leaning back. <i>“It certainly isn’t for everyone. Even so - I urge you to try our standard grooming service once. You absolutely do not have to have the mindset to enjoy a pampering session. Especially if you’ve visited Uveto’s surface recently.”</i>");
			output("\n\n<i>“Brr!”</i> shudders Estie.");
			
			processTime(1);
			flags["VAVA_GROOM_ROLE"] = 0;
			
			vavaGroomMenu();
			break;
		case "owner":
			output("<i>“An owner, of course!”</i> you reply grandly.");
			output("\n\n<i>“Yeah?”</i> Cruff smiles broadly. <i>“Why don’t you tell us a bit about your special someone? Or are you an owner-in-waiting, so to speak.”</i>");
			
			processTime(1);
			flags["VAVA_GROOM_ROLE"] = 1;
			
			var pets:Array = vavaGroomPets();
			
			// [Anno] [Erra] [Sera] [Reaha] [Multiple] [In Waiting]
			clearMenu();
			var havePetBlurbs:Boolean = (pets.length > 0);
			if(pets.length == 1 && pets[0] == "Bimbo Pexiga") havePetBlurbs = false;
			if(havePetBlurbs)
			{
				for(i = 0; i < pets.length; i++)
				{
					switch(pets[i])
					{
						case "Anno": addButton(btnSlot++, "Anno", vavaGroomRoleResponse, "own anno", "Anno", "Fluffy white science good girl."); break;
						case "Erra": addButton(btnSlot++, "Erra", vavaGroomRoleResponse, "own erra", "Erra", "Sweet chocolate woofer."); break;
						case "Sera": addButton(btnSlot++, "Sera", vavaGroomRoleResponse, "own sera", "Sera", "Horny spiky bad girl."); break;
						case "Reaha": addButton(btnSlot++, "Reaha", vavaGroomRoleResponse, "own reaha", "Reaha", "Horny soft moomoo."); break;
					}
				}
				// Only appears if PC owns/has recruited two of the following: Anno, Erra, Reaha, Sera, Bimbo Pexiga
				if(pets.length > 1) addButton(btnSlot++, "Multiple", vavaGroomRoleResponse, "own multiple", "Multiple", "You’ve got plenty of sla... pets. Say as much.");
			}
			else
			{
				addButton(btnSlot++, "In Waiting", vavaGroomRoleResponse, "own waiting", "In Waiting", "It’s a sad reality to wake up to every morning.");
			}
			break;
		case "own waiting":
			output("<i>“Don’t despair,”</i> the kalabast replies, in a low, comforting growl. <i>“Something we do here is to match prospective pets and owners up. We pride ourselves on not stopping until we’ve found perfect matches. It’s a big galaxy out there, after all.”</i>");
			output("\n\n<i>“Like a lonely kennels club!”</i> says Estie, retrieving a holo form and handing it to you. <i>“Leave your details with us, as well as what you’re looking for in a pet - there’ll be someone out there for you, and we’ll find ‘em! Uh. Eventually.”</i>");
			output("\n\nIt couldn’t hurt, could it? And presumably there’s someone out there who’d be interested in subbing to a billionaire " + pc.mf("heir playboy", "heiress playgirl") + ". You fill out your details and a few of your likes and dislikes.");
			output("\n\n<i>“Whilst you’re here,”</i> Cruff goes on, <i>“why don’t you have a standard grooming session. Perk yourself up and make yourself look great for your future pets. Owners need pampering as well, after all.”</i>");
			output("\n\n<i>“They need it more, if you ask me,”</i> Estie says fervently.");
			
			flags["VAVA_GROOM_SPECIAL_PET"] = "None";
			
			processTime(2);
			vavaGroomMenu();
			break;
		case "own anno":
			output("You describe Anno, her bonhomie, book smarts and sexiness, your initial awkwardness giving way to enthusiasm as Cruff prods you along with interested questions. It’s actually really good to say out loud how much you enjoy teasing the ausar and scritching her ears!");
			output("\n\n<i>“She sounds lovely!”</i> enthuses Estie. <i>“You’re gonna bring her in, right [pc.name]? I love meeting good girls!”</i>");
			output("\n\n<i>“She doesn’t sound like she needs obedience training,”</i> growls Cruff. <i>“Although of course - you can still book her in for that, for the sheer fun of it. All of that fur you described though, that definitely does need frequent grooming. How about you, [pc.name]? Pampering sessions aren’t just for pets, you know.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_PET"] = "Anno";
			
			processTime(3);
			vavaGroomMenu();
			break;
		case "own erra":
			output("You describe Erra, how she sprang the whole pet thing on you herself, her archness that just melts in the bedroom. Your initial awkwardness gives way to enthusiasm as Cruff prods you along with interested questions. It’s actually really good to say out loud how much you enjoy taking charge of the ausar and scritching her ears!");
			output("\n\n<i>“She sounds lovely!”</i> enthuses Estie. <i>“You’re gonna bring her in, right [pc.name]? I love meeting good girls!”</i>");
			output("\n\n<i>“She sounds like she would love obedience training,”</i> growls Cruff. <i>“Although for what you’ve described, I doubt she really needs it. All of that fur though, that definitely does need frequent grooming. How about you, [pc.name]? Pampering sessions aren’t just for pets, you know.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_PET"] = "Erra";
			
			processTime(3);
			vavaGroomMenu();
			break;
		case "own sera":
			output("You describe Sera, how you bought her, how after long, patient training you eventually molded her into an eager (if frequently disobedient) sub. Your initial awkwardness gives way to enthusiasm as Cruff prods you along with interested questions. It’s actually really good to say out loud how proud you are to have gotten such an unpromising slut to sit up and beg for you!");
			output("\n\n<i>“Goodness,”</i> mumbles Estie, looking slightly daunted. <i>“I think we’ll need the, uh, heavy duty equipment for that one.”</i>");
			output("\n\n<i>“I don’t like indenturehood, never will,”</i> says Cruff baldly. <i>“However - we do service plenty of pets and owners that came together that way, and I like the way you brought discipline to this one’s chaotic life. She definitely would benefit from some obedience lessons, though. How about you, [pc.name]? Pampering sessions aren’t just for pets, you know.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_PET"] = "Sera";
			
			processTime(3);
			vavaGroomMenu();
			break;
		case "own reaha":
			output("You describe Reaha, how you rescued her from sexual servitude by buying her, how you");
			if(reahaIsCured()) output(" eventually trained her out of her pleasure patch habit");
			else output(" have been having all sorts of fun with the over-sensitive cowgirl ever since");
			output(". Your initial awkwardness gives way to enthusiasm as Cruff prods you along with interested questions. It’s actually really good to say out loud exactly how enjoyable the sound and impact of your hand on her big behind is!");
			output("\n\n<i>“I don’t like indenturehood, never will,”</i> says Cruff baldly. <i>“However - we do service plenty of pets and owners that came together that way, and it definitely sounds as if she’s a lot healthier under your care than in that brothel.");
			if(reahaIsCured()) output(" I am very impressed by the way you handled her drug problem - that’s how a true owner responds to a situation like that.");
			output(" She sounds a fine candidate for erotic training; we’d refine all the sexual experience she has into intense expertise. As for you, [pc.name] - why not enjoy a pampering session, whilst you’re here? They aren’t just for pets, you know.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_PET"] = "Reaha";
			
			processTime(3);
			vavaGroomMenu();
			break;
		case "own multiple":
			output("Pshaw. Do you look like some sort of single-pet-having rube? You describe your little harem, how you acquired them, how you trained them and how you keep them all happy. Any awkwardness you have gives way to enthusiasm as Cruff prods you along with interested questions. Saying out loud the pride you have about owning and maintaining so many cute sluts is really good!");
			output("\n\n<i>“Ooh my,”</i> quivers Estie. <i>“A true owner! I should have guessed by the way you move and hold yourself, " + pc.mf("sir", "ma’am") + ".”</i>");
			output("\n\n<i>“It is excellent that you chanced upon us here,”</i> growls Cruff, looking suitably impressed. <i>“If anything, I’m surprised you didn’t find us sooner. We stand ready to look after your promising-sounding harem. Whether it’s rewards for the obedient, training for the disobedient or erotic practice for the timid - whenever you feel like it’s getting a bit too much, come and see us. Whilst you’re here, why don’t you take a standard grooming session, experience it for yourself? Owners need pampering as well, after all.”</i>");
			output("\n\n<i>“They need it more, if you ask me,”</i> Estie says fervently.");
			
			flags["VAVA_GROOM_SPECIAL_PET"] = "Multiple";
			
			processTime(4);
			vavaGroomMenu();
			break;
		case "pet":
			output("<i>“Pet, I guess,”</i> you reply, trying not to blush.");
			output("\n\n<i>“Yeah?”</i> Cruff smiles broadly. <i>“Why don’t you tell us a bit about your special someone? Or are you a pet-in-waiting, so to speak.”</i>");
			
			processTime(1);
			flags["VAVA_GROOM_ROLE"] = -1;
			
			var masters:Array = vavaGroomMasters();
			
			// [Sera] [Xanthe] [Bothrioc] [Multiple] [In Waiting]
			clearMenu();
			if(masters.length > 0)
			{
				for(i = 0; i < masters.length; i++)
				{
					switch(masters[i])
					{
						case "Sera": addButton(btnSlot++, "Sera", vavaGroomRoleResponse, "pet sera", "Sera", "Purple, curvy and horny dominates your thoughts."); break;
						case "Xanthe": addButton(btnSlot++, "Xanthe", vavaGroomRoleResponse, "pet xanthe", "Xanthe", "Long, many-legged and hypnotic eyes. That spells owner to you."); break;
						case "Bothrioc": addButton(btnSlot++, "Bothrioc", vavaGroomRoleResponse, "pet bothrioc", "Bothrioc", "Why limit yourself to a single owner when an entire race can know you as their beloved possession?"); break;
					}
				}
				if(masters.length > 1) addButton(btnSlot++, "Multiple", vavaGroomRoleResponse, "pet multiple", "Multiple", "Owners can have multiple pets, why not the other way around?");
			}
			// Unlike with dom options PC can choose this if they qualify for other options if they wish
			addButton(14, "In Waiting", vavaGroomRoleResponse, "pet waiting", "In Waiting", "Maybe there isn’t anyone you’d consider that way. Or maybe you’re being discrete.");
			break;
		case "pet waiting":
			output("<i>“Don’t despair,”</i> the kalabast replies, in a low, comforting growl. <i>“Something we do here is to match prospective pets and owners up. We pride ourselves on not stopping until we’ve found perfect matches. It’s a big galaxy out there, after all.”</i>");
			output("\n\n<i>“Like a lonely kennels club!”</i> says Estie, retrieving a holo form and handing it to you. <i>“Leave your details with us, as well as what you’re looking for in an owner - there’ll be someone out there for you, and we’ll find ‘em! Uh. Eventually.”</i>");
			output("\n\nIt couldn’t hurt, could it? And presumably there’s someone out there who’d be interested in domming a millionaire " + pc.mf("heir playboy", "heiress playgirl") + ". You fill out your details and a few of your likes and dislikes.");
			output("\n\n<i>“Whilst you’re here,”</i> Cruff goes on, <i>“why don’t you have a standard grooming session. Perk yourself up, and make yourself look great for your future owner. They could be on this very station, after all.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_MASTER"] = "None";
			
			processTime(2);
			vavaGroomMenu();
			break;
		case "pet sera":
			output("You describe Sera, how you met her and how she came to dominate you in so many delightful ways");
			if(seraIsMerchant()) output(", and how you helped her make a success of her store");
			output(". You speak hesitantly at first but with increasing enthusiasm as Cruff prods you along with interested questions. It’s actually really cathartic to say out loud how much you enjoy being someone else’s plaything!");
			output("\n\n<i>“She sounds spicy,”</i> giggles Estie. <i>“I don’t know how well I’d do under someone like that, but you two sound like a cute couple!”</i>");
			output("\n\n<i>“I can see why she’s not out here with you, with a small business to run,”</i> says Cruff with an approving nod. <i>“Stars above I know how time-consuming that is. It’s nice you’ve made it work so well, despite how busy both of your lives are. Why don’t you give us her details? We’ll send her an email flyer, telling her you were in here and looking at some of the things we do. From what you’ve told us of her, I’m sure she’d be interested.”</i>");
			output("\n\nGood Void. Was he not listening when you were describing Sera’s sadism? But... you wouldn’t have described her in the first place if you weren’t an obedient slut at heart. With a slightly tremulous hand, you hand Estie her e-mail.");
			output("\n\n<i>“Since you’re here - why don’t you spruce yourself up with a grooming session?”</i> Cruff continues. <i>“You don’t need your owner here in order to receive a good pampering, you know.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_MASTER"] = "Sera";
			
			processTime(3);
			vavaGroomMenu();
			break;
		case "pet xanthe":
			output("You describe Xanthe, how you met her and how she came to tie you up in so many delightful ways. You speak hesitantly at first but with increasing enthusiasm as Cruff prods you along with interested questions. It’s actually really cathartic to say out loud how much you enjoy being someone else’s plaything!");
			output("\n\n<i>“She sounds amazing!”</i> cries Estie, eyes almost fully open. <i>“A whole race of people who see bondage as the most vanilla sex imaginable - oh, why haven’t we ever served any?”</i>");
			output("\n\n<i>“I’d guess because they’re already very experienced at looking after their pets,”</i> says Cruff, rubbing his shaggy chin thoughtfully. <i>“This Xanthe sounds like she knows what she’s doing. Still - her object is beauty, and her expertise is in fashion, not grooming. Give us her details, [pc.name]. We’ll send her an e-mail flyer, telling her you were in here and looking at some of the things we do. From what you’ve told us of her, I’m sure she’d be interested.”</i>");
			output("\n\nYou’re sure she would, too - although it’s difficult to imagine the caterpillar emerging quite <i>this</i> far from her cocoon. With a slightly tremulous hand, you hand Estie her e-mail.");
			output("\n\n<i>“Since you’re here - why don’t you spruce yourself up with a grooming session?”</i> Cruff continues. <i>“You don’t need your owner here in order to receive a good pampering, you know.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_MASTER"] = "Xanthe";
			
			processTime(3);
			vavaGroomMenu();
			break;
		case "pet bothrioc":
			output("You describe your discovery of the bothrioc deep within the crust of Myrellion, how they changed you, the wonderful serenity and sensuality you found in your new role as an egg slut");
			if(pc.hasPregnancyOfType("BothriocPregnancy")) output(", the fact that even as you speak you’re swollen with a bothrioc’s young");
			output(". You speak hesitantly at first but with increasing enthusiasm as Cruff prods you along with interested questions. It’s actually really cathartic to say out loud how much you enjoy being an entire race’s plaything!");
			output("\n\n<i>“Wow,”</i> murmurs Estie, sounding slightly taken aback. <i>“They sound scary, and... really sexy. Do you think you could get peeps not to blow that planet up? I want to meet them.”</i>");
			output("\n\n<i>“They don’t sound a million miles away from how the kalabast and the fhan’i used to be,”</i> growls Cruff, <i>“although we never chemically altered our breeders. Who are we to judge the ways of natives from such a hostile planet, though? It sounds as if they’ve made you very happy, [pc.name]. Shame we can’t really chat with your, hmm, owners. Perhaps you’d like a grooming session anyway? All things considered, you could do with a good pampering.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_MASTER"] = "Bothrioc";
			
			processTime(3);
			vavaGroomMenu();
			break;
		case "pet multiple":
			output("<i>“I play that kind of game with more than one person, actually,”</i> you grin.");
			output("\n\n<i>“Greedy!”</i> laughs Estie. <i>“Well, go on - tell us about THEM, then!”</i>");
			output("\n\nYou describe how you split your time between various different doms, always leading each to believe that they and they alone are completely in control of you. You speak hesitantly at first but with increasing enthusiasm as Cruff prods you along with interested questions. It’s actually really cathartic to say out loud the strange but incredibly satisfying sexual life you’ve been leading, playing the obedient little sub for so many sexy but over-confident parties!");
			output("\n\n<i>“You know, cases like yours are the rarest of all,”</i> growls Cruff with a wondering shake of the mane. <i>“I struggle to get into the mindset of a polyamorous pet. But fair play to you, [pc.name]. You know what you want and you’re smart and sexy enough to get it, I like that. With so many owners to please, I must insist you take a grooming session. Someone like you has to look their absolute best.”</i>");
			
			flags["VAVA_GROOM_SPECIAL_MASTER"] = "Multiple";
			
			processTime(4);
			vavaGroomMenu();
			break;
		case "both":
			output("You smile and say that you enjoy being either - it all depends on the situation. And the person.");
			output("\n\n<i>“Switches!”</i> says Estie, with laughing exasperation. <i>“The worst teases of them all! Could you not just play owner? The galaxy needs <b>way</b> more of those.”</i>");
			output("\n\n<i>“Shush. There’s nothing wrong with being a polymath,”</i> says Cruff. <i>“If anything, it means Steele can enjoy our services all the more. [pc.He] can try a grooming session, or even some erotic training, and know exactly what their pets will have in store for them. How about it?”</i>");
			
			flags["VAVA_GROOM_ROLE"] = -2;
			
			processTime(1);
			vavaGroomMenu();
			break;
	}
}

// Talk
public function vavaGroomTalkMenu():void
{
	// [Them] [Animals] [Kalabast/Fhan’i] [Touring]
	clearMenu();
	addButton(0, "Them", vavaGroomTalk, "them", "Them", "Ask about the pair themselves.");
	if(flags["VAVA_GROOM_TALK"] != undefined) addButton(1, "Animals", vavaGroomTalk, "animals", "Animals", "Ask them about the aquariums.");
	else addDisabledButton(1, "Locked");
	addButton(2, "Their Race", vavaGroomTalk, "race", "Kalabast/Fhan’i", "Ask them about their races.");
	if(flags["VAVA_GROOM_TALK"] != undefined) addButton(3, "Touring", vavaGroomTalk, "touring", "Touring", "They must get to see quite a lot of the galaxy in this line of work.");
	else addDisabledButton(3, "Locked");
	addButton(14, "Back", vavaGroomMenu);
}
public function vavaGroomTalk(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	showBust("CRUFF", "ESTIE");
	
	switch(response)
	{
		case "intro":
			output("You ask if they have time for a chat.");
			output("\n\n<i>“Sure!”</i> says Estie. <i>“We’ve got a little time before our next appointment anyway.”</i>");
			output("\n\nCruff silently sweeps a paw, indicating the floor that you have.");
			
			processTime(1);
			
			vavaGroomTalkMenu();
			break;
		case "them":
			output("You suppose you should state the obvious first, just to break the ice.");
			output("\n\n<i>“So you two are owner and pet?”</i>");
			output("\n\n<i>“For going on five epochs now,”</i> Estie replies with a big smile. She plays with the front hasp of her collar, making it jingle. <i>“My first owner was kind of a douche, although I didn’t realize that at the time. You don’t make smart decisions when you’re six. I just assumed he knew what he was talking about when he said I should focus on cooking and cleaning when I couldn’t get very far with my studies, then kept bringing up how useless I was at anything else when I got frustrated with not getting out of the apartment much.”</i>");
			output("\n\n<i>“He wasn’t capable of seeing Hwnifwn der Estifaal’s potential,”</i> says Cruff, rubbing the fhan’i beneath her head tentacles fondly. She keens with pleasure, bending her head into it. <i>“She’s as smart as they come - she just needed the discipline and encouragement necessary to show it. Estie!”</i>");
			output("\n\n<i>“Yes!”</i> The fhan’i’s back is ramrod straight.");
			output("\n\n<i>“Thirty-two times fifteen, divided by two.”</i>");
			output("\n\n<i>“4... 240!”</i>");
			output("\n\n<i>“What is our next appointment?”</i>");
			output("\n\n<i>“Ms. Taimy. She wants a brush for herself and grade 3 erotic training for her Roman.”</i>");
			output("\n\n<i>“How would you medicate an Asheran vezzigal with a twisted stomach?”</i>");
			output("\n\n<i>“...which one? They have three.”</i>");
			output("\n\n<i>“Good girl.”</i> Estie whimpers slightly, as if those two syllables alone were enough to give her an erotic frisson.");
			output("\n\n<i>“That didn’t happen overnight,”</i> Cruff says, in his rich, composed tones. <i>“It took years of training, of building her self-confidence, holding her to a strict regimen of studying. That is what stands to be gained through sustained submission and dominance - aside from the amazing sex, I mean. Structure. A firm hand. The joy of nurturing.”</i>");
			output("\n\n<i>“Is she your only pet?”</i> you ask.");
			output("\n\n<i>“Jaikele usually stays at home, whilst we’re on tour. Somebody has to look after the animals which can’t be transported aboard our ship. It’s her that stays behind because...”</i>");
			output("\n\n<i>“Aw no Master, don’t,”</i> whines Estie, purple creeping further up her extremities.");
			output("\n\n<i>“...Estie pines something fierce,”</i> Cruff goes on, grinning broadly at her. <i>“Last time I took Jaikele with me I had to field three conference calls a day, otherwise somebody took to eating all of the ice cream in the house and playing Be Not My Last Tentacle Romance so loud the neighbours complained. Didn’t they?”</i>");
			output("\n\n<i>“Yes sir,”</i> mumbles the fhan’i, her head and hands entirely plum-colored.");
			
			processTime(5);
			
			// Unlocks animals and touring
			flags["VAVA_GROOM_TALK"] = 1;
			
			vavaGroomTalkMenu();
			addDisabledButton(0, "Them");
			break;
		case "animals":
			// Thoughts for later expansion: purchase actual pets off them for your ship.
			output("<i>“You seem to have a lot of pets,”</i> you say, indicating the various aquariums built into the walls of the reception area. <i>“The traditional type, I mean.”</i>");
			output("\n\n<i>“I love animals,”</i> says Cruff simply. He moves across to one of the tanks, flourishing his hand so that holographic displays circle three of his claws. A mouthless, undulating creature somewhere between a moray and a long piece of coral slinks out of the rocks, luminescent antlers glittering curiously. Cruff flashes a series of colors at it with twitches of his paws; the marine creature responds excitedly, a rainbow flashing across its appendages.");
			output("\n\n<i>“Upon every planet we visit, I try and obtain something tameable and unique,”</i> he continues, doing whatever it is he’s doing. Communicating? Petting? Feeding? <i>“Something that will be a challenge, if possible. So I can try out new techniques, see what works across different physiologies and types of mind, keep our food synthesizer guessing. I have to say that in this respect, Uveto has been a... challenge.”</i> He barks with laughter. <i>“There is a creature I’d heard rumours of, the Lureling, that sounded promising. Now I know slightly more about it, I’m going to have to set my sights a lot lower.”</i>");
			output("\n\nHe withdraws his hand. The creature extends a bony pedipalp to tap against the glass soulfully, before retracting back into its lair.");
			output("\n\n<i>“There is some cross-over of course, between caring for animals and sapient beings,”</i> Cruff says, looking back over at you. <i>“Instinctively recognising animal reactions, what’s making something unhappy or unhealthy - that’s an incredibly useful skill. Looking after sapient pets is a hundred times more rewarding, though. The joy of making the most of someone’s intelligence and personality by getting them to obey you, or helping others achieve such a thing - you can’t ever know it if you are merely a vet. Too many people retreat into themselves using animals, give up on their fellow beings as too complicated or cruel. It’s a sad thing.”</i>");
			output("\n\n<i>“He’s just saying that, you know,”</i> Estie giggles. <i>“I think if he could spend all of his time with his quags and his varmints, he would. They’re <i>good</i> quags.”</i>");
			
			processTime(4);
			vavaGroomTalkMenu();
			addDisabledButton(1, "Animals");
			break;
		case "race":
			output("You ask if this sort of relationship is common between the kalabast and fhan’i.");
			output("\n\n<i>“The only way it was, used to be,”</i> replies Cruff. <i>“The only way our two races could get along.”</i>");
			output("\n\n<i>“Denkozenne is our home, but fhan’i aren’t native to it,”</i> Estie says. <i>“Took us a while to figure that out, but it makes sense, since we’re different to pretty much everything else that lives there. Our crazy ancestors crash-landed there a long, long time ago, but couldn’t produce males for some reason. Still dunno why. So we stole other race’s males. Mostly the kalabast, owing to them not being feral like everything else.”</i>");
			output("\n\n<i>“The early history of our planet is one of endless strife,”</i> Cruff goes on. <i>“Wars of attrition. Terrible actions carried out by both sides. Look it up if you wish, I do not wish to talk of it. What you learn and see in school as a cub is enough to tell you that the end result - of the kalabast keeping the fhan’i as possessions, so that both races could endure - was better than what came before it. Perverse yes, wrong in many ways, but only when it became the norm did Denkozenne know planet-wide peace.”</i>");
			output("\n\n<i>“The kalabast were mad as heck cuz we wiped out all their females for all time,”</i> Estie says with a heartfelt sigh. <i>“You can kinda understand it.”</i>");
			output("\n\n<i>“Are things still the same way?”</i> you ask.");
			output("\n\n<i>“Stars no. The anatae wouldn’t allow sexual slavery just for starters.”</i>");
			if(!CodexManager.entryUnlocked("Anatae"))
			{
				output(" You give him a querying look. <i>“Whole different kettle of feathers. All you need to know is: they uplifted us, and that means something very different than being discovered by humans or the ausar.”</i>");
				CodexManager.unlockEntry("Anatae");
			}
			output(" Cruff shrugs, ponderous gold bulk in corn-like motion. <i>“The fhan’i have the same rights we do nowadays. The owner and pet roles are simply what we are used to, a cultural default if you like. As the kaithrit continue their matriarchal chauvinism, and humans continue their fifteen year long trysts the taboos and conditions of which are dictated by one party’s mother.”</i>");
			output("\n\n<i>“Call us traditionalists, if you like!”</i> Estie squeezes Cruff’s arm. <i>“It was definitely kinda weird to begin with, flying around and discovering what you’re told is true - what’s just normal for us is kinky and </i>dirty<i> for most others. People will ask why I’m ok with being owned and ordered around by big mean ol’ Cruff, and I’m like um? That ring around your finger, that means there’s things you aren’t allowed to do, right? Do you not do them because you’re forced to, or because you feel a duty towards the person you love? You can take it off and walk away if you don’t like it, right?”</i>");
			
			processTime(5);
			vavaGroomTalkMenu();
			addDisabledButton(2, "Their Race");
			break;
		case "touring":
			output("You ask them how long they’ve been here on Uveto.");
			output("\n\n<i>“Longer than we would usually stay,”</i> says Cruff. <i>“The huskar are big, they have a lot of fur, the mining operations provide them with a fair amount of income and there isn’t a massive amount else going on. Isolation aside, this is an ideal spot for us.”</i>");
			output("\n\n<i>“Except for the weather.”</i> Estie’s tentacles shudder. <i>“My studies told me that pet/owner relationships are only pronounced amongst ausar when humans are present too, but that’s soooo not the case. They’re at it with each other all the time on these remote colonies! I think human culture has imprinted the idea on them really strongly. It’s super cute - and, uh, really useful as far as we’re concerned.”</i>");
			output("\n\n<i>“Do the toves visit, too?”</i>");
			output("\n\n<i>“Oh yes!”</i> Estie claps her hands excitedly. <i>“They aren’t interested in the sexy stuff at all, but omistars are they fixated with their feathers or what? Luckily I had a lot of practice with anatae before we came here.”</i>");
			output("\n\n<i>“We have special dispensation to freely travel outside of the Empire,”</i> Cruff says, gesturing at one of the many signed and sealed documents on the wall. <i>“‘To Promote and Foster Imperial Values in the Hinter Regressia.’ The anatae like people like us travelling around the U.G.C. offering colourful goods and services, they believe it fights their public image of repressive lovers of massive concrete buildings. The money we earn returning home is obviously a bonus.”</i>");
			output("\n\n<i>“Any reason you aren’t touring the frontier?”</i>");
			output("\n\n<i>“Beyond the fact that rough, infant colonies rarely have much use for beauty treatments? I don’t like leading my pets into real danger, and the political situation on recently founded worlds is always a worry. Native opinion might turn in an instant, opportunistic pirates can come sweeping through, whichever power is in charge can hand down quarantines or confiscations at a moment’s notice. U.G.C. held worlds in particular... I don’t like the thought of it at all.”</i> Cruff sighs heavily. <i>“However, I’ve promised Estie we will visit the planet Mhen’ga at some point, because...”</i>");
			output("\n\n<i>“Because we’ve gotta see the vanae!”</i> Estie drums her fists on the desk with even greater excitement. <i>“You promised Master, c’mon! We’re gonna get there way before any of our scientists do, it’s gonna be so awesome! Imagine if I can communicate with them - the things we might be able to discover from them!”</i>");
			output("\n\n<i>“They are lethal, savage kidnappers, Estie. If we go looking for them at all it’s going to be in the company of at least five sentry droids. If.”</i> ");
			output("\n\nYou can see the kalabast is smiling underneath his mutton chops, though.");
			
			processTime(5);
			vavaGroomTalkMenu();
			addDisabledButton(3, "Touring");
			break;
	}
}

// Services

// Grooming
public function vavaGroomServiceGrooming(page:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showBust("CRUFF", "ESTIE");
	clearMenu();
	
	switch(page)
	{
		case 0:
			output("Oh, why not. You tap your credit stick against the holo-pad Estie proffers you, and Cruff walks you into one of the rooms adjoining the cargo bay.");
			output("\n\nA pleasant herbal smell engulfs you as you enter. Warm light suffuses the room, and the walls crawl with dark green vines. Are they real? The rustle of leaves and sounds of a deep, sultry jungle surely can’t be. About twenty plush pads of various sizes float in the middle of the room like a giant, untethered mobile.");
			output("\n\n<i>“If you could");
			if(!pc.isNude()) output(" take your outer garments off and");
			output(" make yourself comfortable, Steele,”</i> says Cruff, examining a glittering array of clippers and combs on a table as Estie walks in with an armful of bottles.");
			if(pc.isBiped()) output(" You gingerly sit down on one of the larger floating pads, and instantly the rest form a chair for you, contouring perfectly to suit your frame and [pc.legs].");
			else if(pc.isNaga()) output(" You gingerly sit down on one of the larger floating pads, and instantly the rest form a chair for you, contouring perfectly to suit your frame. Smaller pads place themselves underneath your tail and lift it up, so eventually your whole serpentine frame is languorously stretched out.");
			else if(pc.isGoo()) output(" As you ooze over to the pads, they disperse to form buffers around you. You’re soon in the middle of a wide armchair-like arrangement perfect for your slimy bulk. You sigh as you relax back into it. Why don’t you have anything like this on your ship?");
			else if(pc.isTaur()) output(" As you trot over to the pads, they disperse, larger ones sliding themselves underneath your lower body, smaller ones swaddling themselves behind your joints. When you gingerly relax, you find the harness-like structure they’ve formed takes your weight easily. It probably looks very weird, but it’s relaxing to take the weight off your [pc.feet] for once.");
			if(!pc.isTaur()) output("\n\n<i>“Stage one, then,”</i> says Cruff. You experience a slight lurch in your belly as the pads rearrange themselves, slipping and sliding you carefully around as if you were a piece of gourmet food being transferred from tray to plate. You wind up on your back, arms and [pc.legOrLegs] held level.");
			output("\n\nCruff spends a long moment silently considering your [pc.skinFurScales], before turning to the selection of unguents Estie brought in. You sigh and empty your mind of niggling worry as you feel the soft, warm pads of his hands lay themselves upon your flanks, working the oil they’re slathered in into your [pc.skinFurScalesNoun] with firm, sweeping movements. As he’s doing that, Estie pops up in front of you with a jar of pale cream and circular pads.");
			output("\n\n<i>“No silly faces, please,”</i> she warns, her jovial smile the last thing you see before the pads are pressed over your [pc.eyes] and the rest of your face is caked in the cool cream. The fhan’i’s slim digits spread across your face at the same time as the kalabast’s wide paws massage your back, and the effect is one of deep relaxation - of all the knots of tension in your muscles and mind slowly being unwound and smoothed over. With your eyes covered and the peaceful jungle sounds in your ears you find yourself entering a pliant, dozy state, happy for the four masterful hands to roam around and touch your body as they wish.");
			output("\n\n");
			if(flags["VAVA_GROOM_SERVICE_GROOMING"] == undefined) output("Cruff spends some time massaging your back with sweeps and cusps of his strong hands, seeming to explore the lay of your muscles, creating a braille map of them that he then uses to tighten his focus on particular areas. Damn does that feel <i>good</i>. When he touches you just <i>there</i> you are almost driven to arch your back and groan, and when he runs his finger right up your spine a tiny pleasurable explosion goes off in your head. In the soft state you’ve sunken into, you kind of just want to lie here and let him do that forever. Because you’ve been good, haven’t you? You’re a good [pc.boy].");
			//else output("Cruff only needs a few moments to re-familiarize himself with your body with those sweeps and cusps of his strong hands, and your building anticipation is met when he starts intently focusing on those zones of your back and sides that are almost like erogenous zones when he treats them this way. You are almost driven to arch your back and groan, and when he runs his finger right up your spine a little pleasurable explosion goes off in your head. In the soft state you’ve sunken into, you kind of just want to lie here and let him do that forever. Because you’ve been a <i>very</i> good [pc.boy].");
			else output("Cruff only needs a few moments to re-familiarize himself with your body, sweeping across your back with the cusps of his strong hands. Your building anticipation is met when he starts focusing on the sensitive zones of your back and sides, and soon, under his skillful hands, your entire body becomes an erogenous zone. You are almost driven to arch your " + pc.mf("groan", "moan") + " when he runs his fingers along your spine, while pleasurable explosions are set off in your head as he works. In the soft state you’ve sunken into, you have few qualms with lying here and letting him work forever. After all, you’ve been a <i>very</i> good [pc.boy].");
			if(pc.hasFur()) output(" It gets even better when both of them pick up combs and get to work on your moistened fur, working out all the little mats and entanglements in wonderfully long, sensual slides through every square inch of your thick coat. You can’t stop your limbs flexing occasionally in response to it.");
			if(pc.isTaur()) output(" One picks up a curry comb, the other a dandy brush, and they get to work giving your tauric frame a thorough rub down. You can’t stop reflexively prancing a bit in response to it. Void, you really need to find some sort of way of getting this on your ship. Showers just don’t cut it for your frame.");
			
			processTime(12);
			//+ Lust
			pc.changeLust(35);
			pc.credits -= 1000;
			
			// PC not 100% HP:
			if(pc.HP() < pc.HPMax())
			{
				output("\n\n<i>“Ooh... look,”</i> murmurs Estie.");
				output("\n\n<i>“I can see,”</i> says Cruff. He gently touches the product of one of your recent bruising encounters in the field, and you flinch slightly in response. <i>“Get the bio-salve and antiseptic sheets. How did you get that, [pc.name]?”</i>");
				output("\n\nYou mumble an edited account of the frank exchange of hostilities which left that particular mark on you as the kalabast spreads another kind of goo over it, one that stings slightly as it sinks into you, before applying a patch. The stinging recedes into a tickling, stretching sensation, and then into nothing but blessed wholeness.");
				output("\n\n<i>“Be more careful out in the field, you mucky pup,”</i> tuts Estie as she takes the patch off. <i>“Some of the things on Uveto aren’t playing, you know.”</i>");
				
				processTime(1);
			}
			
			// [pb]
			addButton(0, "Next", vavaGroomServiceGrooming, 1);
			break;
		case 1:
			output("<i>“Stage 2,”</i> growls Cruff softly.");
			if(!pc.isTaur()) output(" You are shaken out of your reverie as the pads underneath you rearrange themselves so that you are slid back into the upright seated position.");
			output(" The pads serving as arm rest stretch out, allowing Estie to take hold of one of your hands and apply a file to the");
			if(pc.hasArmFlag(GLOBAL.FLAG_HOOVES)) output(" hooves");
			else if(pc.hasClawedHands()) output(" claws");
			else output(" nails");
			output(". The oil that was rubbed into your back and shoulders must be some sort of quick drying, dirt-absorbing agent; within moments of being flipped back up it feels like it’s faded away entirely from your [pc.skinFurScalesNoun], leaving behind it an aura of glossiness and health.");
			output("\n\n");
			if(!pc.hasHair()) output("You’ve barely had time to relish the feeling when the kalabast places his wide paws over your scalp, covered in some other type of oil. By the time he’s finished polishing your bald pate with attentive pushes and drags of his pads, he’s actually generating wet-finger-on-a-windowpane noises with it.");
			else
			{
				if(pc.hairType == GLOBAL.HAIR_TYPE_REGULAR) output("You’ve barely had time to relish the feeling when the kalabast’s wide paws lay themselves over your scalp, covered this time in shampoo. It’s lathered vigorously into your [pc.hair], every knot and tangle carefully pulled out with a slow curl of his claws.");
				else output("You’ve barely had time to relish the feeling when the kalabast’s wide paws lay themselves over your scalp, covered in some other type of oil. Each separate strand of your [pc.hair] is grasped and smoothed from base to tip with attentive drags of his pads, until each feels like it’s gleaming with health.");
			}
			// merge
			if(pc.hasTail())
			{
				output("\n\nWhilst Cruff does your " + (pc.hasHair() ? "hair" : "scalp" ) + ", warm, nimble fingers grasp your [pc.tails].");
				if(pc.hasTailGenital())
				{
					if(pc.tailCount == 1) output(" Estie seems utterly unfazed by the flagrantly sexual nature of it; she briskly cleans and oils it from tail to tip, making the thing thrum with arousal.");
					else output(" Estie seems utterly unfazed by the flagrantly sexual nature of them; she briskly cleans and oils them from tail to tip, making them thrum with arousal.");
					pc.changeLust(15);
				}
				else
				{
					if(pc.tailCount == 1) output(" Estie briskly cleans and " + ((pc.hasTailFlag(GLOBAL.FLAG_FURRED) || pc.hasTailFlag(GLOBAL.FLAG_FLUFFY) || pc.hasTailFlag(GLOBAL.FLAG_FEATHERED)) ? "combs it until the thing is curling up your back" : "oils it until the thing is slithery and sinuous") + " with prideful pleasure.");
					else output(" briskly cleans and " + ((pc.hasTailFlag(GLOBAL.FLAG_FURRED) || pc.hasTailFlag(GLOBAL.FLAG_FLUFFY) || pc.hasTailFlag(GLOBAL.FLAG_FEATHERED)) ? "combs them until they are curling up your back" : "briskly slathers them with oil until they are slithery and sinuous") + " with prideful pleasure.");
				}
			}
			if((pc.hasHair() && pc.hairType == GLOBAL.HAIR_TYPE_REGULAR) || pc.hasLongEars() || pc.hasEmoteEars()) output("\n\n");
			if(pc.hasHair() && pc.hairType == GLOBAL.HAIR_TYPE_REGULAR) output("Your head is dipped in warm water, and then Cruff sets about it with comb and brush. ");
			// Animal ears/elf ears:
			if(pc.hasLongEars() || pc.hasEmoteEars()) output("You don’t know if he spends an inordinate amount of time stroking behind your [pc.ears] on purpose - tightening his focus down until he’s applying just the right amount of pressure to make tingles run up your spine - but it’s intensely, almost shamefully pleasurable.");
			output("\n\nEstie scrapes away the cream on your face, and they both stand back to allow mechanical arms to reach down from the ceiling and blast you from all sides with warm, dry air.");
			if((pc.hasHair() && pc.hairType == GLOBAL.HAIR_TYPE_REGULAR) || pc.hasPartFur() || pc.hasPartFeathers()) output(" Cruff closes in for one last careful brushing.");
			output(" Finally, Estie takes the eye pads off, and both of them come around to hold up mirrors to your face and back, swiveling them so you can see everything.");
			
			processTime(15);
			
			// [pb]
			addButton(0, "Next", vavaGroomServiceGrooming, 2);
			break;
		case 2:
			output("You look the same as you always did - just <i>more</i>. Your [pc.skinFurScales] and face shine with health and a glowing, happy allure.");
			if(pc.mf("m", "f") == "m") output(" Any quiet doubt you had about all of the oiling and creaming sissifying you dissipate - all the grooming did was to sharpen and strengthen your features, setting your bold handsomeness into the foreground. Alright, so there is a certain boyband air about you now, but given the volume of young females you meet that’s no bad thing.");
			if(pc.hasHair())
			{
				output(" Cruff didn’t change your hairstyle, instead giving your [pc.hair] more shape");
				if(!InCollection(pc.hairType, GLOBAL.HAIR_TYPE_QUILLS, GLOBAL.HAIR_TYPE_TENTACLES)) output(" and working fresh growth into it");
				else output(" and giving the separate [pc.hairsNoun] greater definition");
				output(". It’s catwalk quality, and you feel a swell of confidence gazing at it.");
			}
			else output(" You touch your bald head slightly disbelievingly. Damn, people are going to have to wear snow goggles around you - that thing is catching the light something fierce.");
			output("\n\n<i>“Superb,”</i> says Cruff, admiring his and his partner’s handiwork with a small smile");
			if(pc.hasArmor()) output(" as you climb back into your [pc.armor]");
			else if(pc.canCoverSelf(false, "wings") && pc.statusEffectv1("Wing Position") == 1) output(" as you sweep your [pc.wings] back around you");
			output(". <i>“It’s good to work with such healthy material.”</i>");
			output("\n\n<i>“See you soon [pc.name]!”</i> says Estie after she leads you back to the reception area. You are going to practically bounce out of here - your whole body feels rested and refreshed. You just want to strut around, on Tavros maybe, see how many people you can make stare. <i>“");
			
			var estieFin:Array = [];
			
			if((flags["VAVA_GROOM_SPECIAL_PET"] != undefined && flags["VAVA_GROOM_SPECIAL_PET"] != "None") || (flags["VAVA_GROOM_ROLE"] == -2 && vavaGroomPets().length > 0))
				estieFin.push("Show your pets why they beg for you!");
			if(flags["VAVA_GROOM_SPECIAL_PET"] == "None" || flags["VAVA_GROOM_ROLE"] == -2)
				estieFin.push("You’re only going to have to smile at any pet-to-be to make ‘em roll over for you, trust me!");
			if((flags["VAVA_GROOM_SPECIAL_MASTER"] != undefined && flags["VAVA_GROOM_SPECIAL_MASTER"] != "None") || (flags["VAVA_GROOM_ROLE"] == -2 && vavaGroomMasters().length > 0))
				estieFin.push("Show your owner why <b>you’re</b> their favorite!");
			if(flags["VAVA_GROOM_SPECIAL_MASTER"] == "None" || flags["VAVA_GROOM_ROLE"] == -2)
				estieFin.push("You’re only going to have to smile at any self-respecting owner to make ‘em run over leash in hand, trust me!");
			
			if(estieFin.length > 0) output(RandomInCollection(estieFin));
			else output("Knock ‘em dead!");
			output("”</i>");
			
			processTime(17);
			
			// PC moved to square outside VVG
			// Health set to 120%
			// Tease damage buff 20% for 24 hours
			
			pc.createStatusEffect("Well-Groomed", 1.2, 1.2, 0, 0, false, "LustUp", "Your body feels extraordinarily rested and refreshed.\n\n+20% Max HP\n+20% Tease Damage", false, 1440);
			
			pc.maxOutHP();
			pc.maxOutEnergy();
			
			IncrementFlag("VAVA_GROOM_SERVICE_GROOMING");
			
			addButton(0, "Next", move, rooms[currentLocation].eastExit);
			break;
	}
}

// Obedience Training
public function vavaGroomServiceObedience():void
{
	/*
	
	IncrementFlag("VAVA_GROOM_SERVICE_OBEDIENCE_TRAINING");
	
	*/
}

// Erotic Training
public function vavaGroomServiceEroticTraining():void
{
	// If PC has never done it
	if(flags["VAVA_GROOM_SERVICE_EROTIC_TRAINING"] == undefined)
	{
		clearOutput();
		author("Nonesuch");
		showBust("CRUFF", "ESTIE");
		
		output("<i>“So... what exactly does erotic training entail?”</i> you ask.");
		output("\n\n<i>“You are trained to be a better sexual submissive,”</i> replies Cruff, in that frank manner of his. <i>“By two rigorously vetted experts.”</i> He gestures at the twin Imperial Four Star Erotic Instructor diplomas hanging on the wall. <i>“You will not end up with my dick up your backside, or with strange desires to give us money, if they are worries. Our reputation hangs upon how professionally we handle pets.”</i>");
		output("\n\n<i>“Ooh, it’s so much </i>fun<i>, [pc.name]!”</i> Estie bites her lip, tail twitching. <i>“I always envy first time pets. If you thought being a subby slut was fun before, just wait until you’ve had a few sessions with us!”</i>");
		output("\n\n<i>“I’ve studied many of the great minds who hypothesized the techniques we use today,”</i> says the kalabast, grave eyes slightly glazed in memory. <i>“Our Hrradurwarr gon-Steef and his Little Manual of Great Joy, of course. The ancient human philosopher Pavlov also had many interesting ideas about it.”</i>");
		
		processTime(2);
		
		// [Go for it] [Not today]
		clearMenu();
		if(pc.hasGenitals())
		{
			// Notes for future expansion: NPC Owners should be able to customize the experience according to their own wishes. PC should be able to get the Peace of Mind perk through persistent use.
			// Requirement: Genitals
			if(pc.credits >= 1000) addButton(0, "Go For It", vavaGroomEroticTraining, "go for it", "Go For It", "Pay 1000 credits to become a better sub.");
			else addDisabledButton(0, "Go For It", "Go For It", "You don’t have the money for this.\n\nCosts 1000 credits.");
		}
		else addDisabledButton(0, "Go For It", "Go For It", "You require genitals for this.");
		addButton(1, "Not Today", vavaGroomEroticTraining, "not today", "Not Today", "Sounds slightly scary.");
		return;
	}
	// If PC has done it go straight to scene
	else vavaGroomEroticTraining("go for it");
}
public function vavaGroomEroticTraining(response:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showBust("CRUFF", "ESTIE");
	
	switch(response)
	{
		case "not today":
			output("<i>“Of course [pc.name],”</i> says Cruff in an amiable purr, when you turn it down. <i>“It’s the most intense service we offer after all, and it can seem overly daunting, particularly for those on their own. Perhaps");
			if(flags["VAVA_GROOM_SPECIAL_MASTER"] != undefined && flags["VAVA_GROOM_SPECIAL_MASTER"] != "None") output(" when your owner decides you have a need for it, instead.");
			else output(" when you have an owner of your own, and you feel a need to really impress them.");
			output("”</i>");
			output("\n\n<i>“A grooming session instead?”</i> Estie suggests.");
			
			processTime(1);
			
			vavaGroomMenu();
			break;
		case "go for it":
			output("You would be lying if you said you don’t find the prospect of being molded into a better sub alluring. Ignoring the slight flutter in your gut, you tap your credit stick against Vava Groom’s payment screen.");
			output("\n\n<i>“Put this on,”</i> says Cruff, handing you a long curve of thin, silver-like material. Estie gives you an encouraging grin as she strides away through the doors leading further into the craft. <i>“Then come with me.”</i>");
			output("\n\nYou wrap the cool metal of the collar against your throat. The moment it touches your [pc.skinFurScales] it automatically tightens, clicking smoothly into place, leaving no seam. It’s quite comfortable, but every breath you take you are reminded of its fixed, unyielding presence. The hasp at the front tinkles as you follow Cruff’s bobbing tail into the back.");
			output("\n\nThe room you are taken to is semicircular and clear of any objects. Even on the walls and ceiling, the only things that stand out are two control panels on either side and a ring at the top like an air conditioning unit. Neutral colors, blues, yellows and greens, glow softly behind the featureless walls, and there’s a strange fuzzy sound emanating from somewhere, barely audible");
			if(pc.hasEmoteEars()) output(" even to your acute, craning ears");
			output(".");
			output("\n\n<i>“");
			if(flags["VAVA_GROOM_SPECIAL_MASTER"] != undefined)
			{
				if(flags["VAVA_GROOM_SPECIAL_MASTER"] == "Multiple") output("You stated you have many owners, [pc.name], none of whom ordered this");
				else if
				(	(flags["VAVA_GROOM_SPECIAL_MASTER"] == "Sera" && chars["SERA"].isHerm())
				||	(flags["VAVA_GROOM_SPECIAL_MASTER"] == "Xanthe" && xantheIsHerm())
				) output("Your stated owner is hermaphroditic, [pc.name], and they didn’t order this");
				else if(flags["VAVA_GROOM_SPECIAL_MASTER"] != "None") output("Your stated owner didn’t order this, [pc.name]");
				else output("You stated you don’t have an owner, [pc.name]");
			}
			else output("Shame that you don’t have an owner to set the rules, [pc.name]");
			output(",”</i> says the kalabast. He and Estie are positioned at a control panel each. In this intimate, secluded space, his growly, rich voice has an almost paternal impulsion to it that makes it hard to refuse. <i>“So we’re going to do a Level 1 General session, moderate and inclusive.");
			if(!pc.isNude()) output(" Take off your outer garments.");
			output("”</i>");
			if(!pc.isNude())
			{
				output("\n\nYou");
				if(pc.hasArmor()) output(" do so, sliding out of your [pc.armor] until you");
				output(" are bare under the soft, shifting lights");
				if(pc.hasUpperGarment() || pc.hasLowerGarment()) output(" but for your [pc.underGarments]");
				output(". There’s a slight but noticeable change in the atmosphere as you disrobe. The lights turn slightly warmer shades, and the barely perceptible grey noise seems to hit a slightly sweeter note. Perhaps you’re just imagining it.");
			}
			output("\n\n<i>“Now,”</i> says Cruff. Or Estie? It sounds as if they’re both speaking simultaneously. <i>“Kneel.”</i>");
			
			processTime(8);
			
			pc.credits -= 1000;
			
			// [Do It] [Don’t]
			clearMenu();
			addButton(0, "Do It", vavaGroomEroticTraining, "go do it");
			addButton(1, "Don’t", vavaGroomEroticTraining, "go don't");
			break;
		case "go don't":
			output("They can’t make you, right? And you’re quite curious about what the boundaries are in here. You paid to learn, after all. You remain defiantly upright, staring at Cruff with a challenging smirk.");
			output("\n\nNothing happens. He simply gazes back at you with those four solemn eyes of his. You feel a nagging regret, looking into those sad, thoughtful eyes, that reaches deeper the more the seconds drag by. The colors of the room reflect the mood - deep, somber blues, muddy greens and grays that speak of desolation and loneliness. There’s also a nagging unpleasant sensation coming from somewhere - not pain exactly, but something that creeps across your [pc.skin], making you feel itchy, anxious and on edge. Void, why do you feel so alone? Did you deserve this, somehow? You did. You’d do anything to put it right. To belong.");
			output("\n\n<i>“Kneel,”</i> says the combined voice again, after a few more black, lonely seconds have crawled by. This time, you do it without any hesitation, and the moment your [pc.knees] touch the floor a sigh of relief escapes your lips. That feels so <i>good</i>, like summer hitting your senses. The colors brighten to intense, wonderful yellows and reds, before fading into happy, background tones, as does the contented sensation. You’d do anything to feel that warm rush again.");
			
			processTime(3);
			
			pc.addHard(1);
			
			clearMenu();
			addButton(0, "Next", vavaGroomEroticTraining, "kneel");
			break;
		case "go do it":
			output("You follow the order, and the moment your [pc.knees] touch the floor you feel a gush of pleasure. A warm serenity washes across your [pc.skin] and the room’s colors brighten to intense, wonderful yellows and reds before fading into happy, background tones, as does the contented sensation. You smile dopily; you’d do anything to feel that warm rush again.");
			
			processTime(1);
			
			pc.addNice(1);
			
			clearMenu();
			addButton(0, "Next", vavaGroomEroticTraining, "kneel");
			break;
		case "kneel":
			output("There’s a click and a whirr above you, the ring in the ceiling extending downwards to allow a multitude of robotic limbs to telescope out around you. You look up to see wh--");
			output("\n\n<i>“Forward.”</i> The combined voice, calm and assured, seems to speaking directly into both of your ears. You instinctively follow the order, ducking your head back down to look directly ahead, and feel the warm, contented rush again, heady lust pulsing down to your [pc.groin]... although not as sustained last time. There’s a slight frustration in that; a burgeoning wish to do something that will warrant receiving the full effect.");
			output("\n\nA thin, sticky strip of opaque material is plastered over your [pc.eyes], two rubbery buds are pushed into your [pc.ears]. Instinctively you reach up to touch - and immediately the colors through the gauze turn miserable, grayish blues and greens, and a cold shiver runs across your [pc.skinFurScalesNoun]. You immediately put your hands down, and the colors change to happy, warm shades. You <i>feel</i> warm and happy, obeying the unspoken command. The more peaceful you are about this, letting what you see and hear be ruled, the hotter and more sensuous you are.");
			output("\n\n<i>“Position 1.”</i> The colors seem to swoop upwards and enlarge around you, taking on strong, commanding sharpness as they do. An inhalation builds in your ears, an expectant hush. These aren’t miserable sensation like before, not at all - but you feel very small, all of a sudden. Soft, firm, pressure is applied to your shoulder and thigh, and slowly you allow yourself to be pushed until you are lying on one side with your [pc.legOrLegs] behind you, prostrate and displaying every inch of yourself to the commanding presence above. The synaesthesia melts into sunny, glowing approval as you do it, and this time you feel a lusty blaze of arousal at the same time -");
			if(pc.hasCock()) output(" [pc.eachCock] engorging with submissive joy");
			if(pc.hasCock() && pc.hasVagina()) output(" and");
			if(pc.hasVagina()) output(" [pc.eachVagina] moistening with ready eagerness");
			output(". It slowly ebbs away, the colors and the arousal fading, leaving you dizzy and desperate to feel it again.");
			output("\n\n<i>“Position 2.”</i> The pressure is applied to your back and arms this time, coaxing you to sit up, and this time you follow the unspoken instructions without any hesitation.");
			if(pc.hasBreasts()) output(" You are made to place your hands under your [pc.boobs], cupping them at the same time as pressure runs up and down your spine until your back is straight as a ruler; it drags at your bottom lip until you open your [pc.lips] and lightly stick your [pc.tongue] out, presenting your breasts and mouth wantonly to the expectant light high above.");
			else output(" You are made to place your hands behind you, one hand holding the other’s wrist at the same time as pressure runs up and down your spine until your back is straight as a ruler; it drags at your bottom lip until you open your [pc.lips] and lightly stick your [pc.tongue] out, presenting your bare chest and mouth wantonly to the expectant light high above.");
			output(" Only then does the glow encompass you, fiercely this time, making");
			if(pc.hasCock()) output(" your " + (pc.cocks.length == 1 ? "cock strains" : "cocks strain") + " against your [pc.belly]");
			if(pc.hasCock() && pc.hasVagina()) output(" and");
			if(pc.hasVagina()) output(" your " + (pc.vaginas.length == 1 ? "pussy dribbles" : "pussies dribble") + " [pc.femcum] freely");
			output(" in overwhelming, captivating arousal. A slutty, happy moan escapes your open mouth.");
			output("\n\n<i>“Hands out.”</i> The colors fade, but seem to step inwards, becoming clearer. The white noise in your ears increases in volume. Are things being said, down there? Indistinct syllables swimming below the fuzz? It’s telling you how good it feels to... blindly you put your hands out. Shapes, smooth and of differing texture, are pushed into them. It’s impossible really to tell what they are from touch alone, but when you clasp the thing in your right hand the faintest spot of red appears, a tiny shiver of pleasure coursing down to your groin.");
			output("\n\nYou move your grip slowly over the objects, testing and caressing them, and as you do the all-encompassing synaesthesia shifts; when you do <i>this</i> there’s a tremor of disapproval, when you do <i>that</i> heat flares beneath your touch and erotic sensation pulses through you,");
			if(pc.hasErectNipples()) output(" hardening your [pc.nipples] to thickly engorged points");
			else output(" inflaming your [pc.nipples] so that they are dripping [pc.milk]");
			output(". You laugh as the objects shift and transmogrify underneath your hands, providing you with a new set of shapes to figure out how to touch and caress. Do you rub it like this? Or maybe if you hold it and press your thumb in like this... Yes! Glorious approval and erotic pleasure encompasses you and drowns out all thought...");
			
			processTime(12);
			
			// ++Lust
			pc.changeLust(35);
			
			// [pb]
			clearMenu();
			addButton(0, "Next", vavaGroomEroticTraining, "robocock");
			break;
		case "robocock":
			var vIdx:int = -1;
			if(pc.hasVagina()) vIdx = rand(pc.vaginas.length);
			
			output("When a warm, bulbous object presses against your [pc.lips], it’s simply a natural progression. You open your mouth and gladly accept its dense mass filling your mouth, withdrawing and then thrusting towards your throat with increasingly powerful pumps. The shapes in your hands are not taken away, and you find you have to continue to rub and stroke in order for the world to shine with that approval you’ve become intoxicated with. After a long, muffled period of frustration how to do it is imprinted on you, and you’re rubbing and fellating simultaneously with gusto.");
			output("\n\nIt feels so fucking <i>good</i>; you groan a muffled groan around the robo-cock filling your mouth as sheerest pleasure courses through you. It’s as if you were a conduit through which a current of purest sex runs through, your mind melting into a golden vat of submissive joy.... When the objects tremble beneath your fingers and [pc.tongue] and morph into hole-like structures - plush holes surrounded by their own little hillocks, lips, and nubs - you are desperate to work out exactly how to touch and lick them, exactly how to please them. Anything to keep the world blazing with heat, approval and sex. Soon enough you are lavisciously making out with the one plastered against your face, glorying in wave upon wave of ecstasy subsuming your mind and your [pc.groin], edging you to the precipice of orgasm but never quite over it.");
			output("\n\nYou " + (rand(2) == 0 ? "yelp" : "squeal") + " as two limbs suddenly grab you by the wrists and thighs and hoist you into the air, face down, ass up. The colors throb with dominant, lusty reds and purples as a thick, hard knob nestles itself against your [pc.vagOrAss " + vIdx + "], inexorably opening it up.");
			if(vIdx >= 0)
			{
				output(" You are so wet at this point it couldn’t have an easier time stretching your pussy lips wide and pushing deep into your sensitive insides. You can’t help but cry out in joy, flexing against the inhumanly strong hands holding you in place, as the appendage fills every inch of your passage, touching your cervix before thrusting in and out of you with heavy, certain strokes, forcing quivering sensation through your core.");
				
				pc.cuntChange(vIdx, 500);
			}
			else
			{
				if(pc.ass.wetness() >= 4) output(" You are so slick with your own oil at this point that it has no problem stretching your [pc.anus] wide and pushing deep into your back passage.");
				else output(" The thing is slathered with warm oil, and has no problem stretching your [pc.anus] wide and pushing deep into your back passage.");
				output(" You cry out and flex against the inhumanly strong hands holding you in place as incredibly intense sensation spreads further and further up you, touching sensitive spots within that make [pc.eachCock] strain and ooze pre. Uncaring to your tenderness, it’s soon thrusting in and out of you with heavy, certain strokes, forcing quivering sensation through your core.");
				
				pc.buttChange(500);
			}
			// merge
			output("\n\nEven now, whilst getting railed,");
			if(pc.hasBreasts())
			{
				output(" your [pc.boobs] bouncing wildly in thin air");
				if(pc.isLactating()) output(" as drops of milk escape your engorged nipples");
				output(",");
			}
			output(" you are being made to learn. The colors fade and the sound in your ears whisper anxiously until you clench your muscles, clamping down on the thrusting phallus so that you are giving it the tightest, wettest fuck possible. Then, your senses are bathed in glory; summery warmth and high esteem blotting out all thought. All that matters is making your owner happy, and you are getting better at that. Every day you will hone your sluttiness closer to keening perfection, and every day the blaze of approval will be yet more intense.");
			output("\n\n<i>“Cum,”</i> says the voice, and you do, immediately and brilliantly. You thrash in your bonds, the girthy dildo pumping into your [pc.vagOrAss " + vIdx + "] providing the perfect lever to wring out spasm after spasm of filthy, juicy ecstasy.");
			if(vIdx < 0)
			{
				if(pc.cumQ() < 2000) output(" You noisily spurt [pc.cum] across the floor, [pc.eachCock] continuing to flex dryly to the ceaseless milking of your prostate long after you’ve spent every last drop.");
				else output(" You noisily spurt great ropes of [pc.cum] across the floor, Pollocking the room with your vast, [pc.cumFlavor] reserves, and are still oozing it heavily from your wilting [pc.cocks] long after the relentless milking of your prostate has ceased.");
			}
			else output(" Fragrant [pc.girlCum] " + (!pc.isSquirter() ? "dribbles" : "spurts") + " onto the floor below as your orgasm is drawn out by shivers of the machine, until finally you are dangling from your bonds utterly spent, [pc.lips] open and eyes rolled back into your sockets.");
			
			processTime(21);
			
			// Lust + cum reset
			pc.lust(65);
			pc.orgasm();
			
			// [pb]
			clearMenu();
			addButton(0, "Next", vavaGroomEroticTraining, "finish");
			break;
		case "finish":
			output("Slowly, the phallus withdraws from your tenderized " + (!pc.hasVagina() ? "colon" : "twat") + "; slowly, the robotic limbs lower you to the floor. The colors beam contented oranges and lavenders at you, and there’s a sound like the distant sea in your ears. Something like a hand curls through your");
			if(pc.hasHair())
			{
				output(" sweaty hair");
				if(pc.hasEmoteEars()) output(" behind one of your [pc.ears]");
			}
			output(" reassuringly, and you practically purr to its stroke. The relaxing synaesthesia slowly fades, and with it, it seems, your utterly scattered thoughts return.");
			output("\n\nTwo pairs of hands carefully pick you up, pat you down with warm, scented towels, and peel away the blindfold.");
			output("\n\n<i>“Wasn’t that fun?”</i> says Estie with a big smile, handing you a hot, tea-like drink. <i>“You were great, [pc.name]! Oh, I can’t wait to work you into the more intense sessions");
			if(flags["VAVA_GROOM_SPECIAL_MASTER"] != undefined && flags["VAVA_GROOM_SPECIAL_MASTER"] != "None") output(", and get your owner involved too");
			output("!”</i>");
			output("\n\nAfter");
			if(!pc.isNude()) output(" redressing and");
			output(" a short period of slightly dazed rest, Cruff leads you back into Vava Zoom’s reception area. You feel stoned more than anything, still throbbing gently from the incredibly intense orgasm. Peacefulness permeates your body and mind.");
			output("\n\n<i>“It stands out to me that you are naturally suited to this, you know, [pc.name],”</i> growls Cruff. <i>“I would suggest the standard groomings or obedience lessons were it otherwise. Once");
			if(flags["VAVA_GROOM_SPECIAL_MASTER"] == undefined || flags["VAVA_GROOM_SPECIAL_MASTER"] == "None") output(" you have an owner");
			else output(" your owner gets in touch");
			output(", and we have a chat with them about their preferences, we’ll move on to more advanced sessions. How does that sound?”</i>");
			output("\n\nYou shiver slightly at the thought.");
			
			processTime(35);
			
			// Slow libido gain
			pc.slowStatGain("libido", 1);
			restHeal();
			
			/* 9999 -- Hidden until it has a purpose!
			if ((debug || vavaGroomPetLevel() >= 100) && !pc.hasPerk("Peace of Mind"))
			{
				output("\n\n(<b>Perk Gained: Peace of Mind</b> - Minimum lust is heightened. Enemies may peacefully surrender to you given their level--however, it may be very hard for you to resist enemies that peacefully demand you submit to them....)");
				
				pc.personality = 0;
				pc.createPerk("Peace of Mind", 0, 0, 0, 0, "You radiate an aura of Zen-like calm. You can offer enemies the chance to peacefully surrender. The lower their level, the better the chance will be. In turn, however, enemies that peacefully demand you submit to them may be very difficult to resist.... Additionally boosts minimum lust to 20.");
			}
			*/
			
			IncrementFlag("VAVA_GROOM_SERVICE_EROTIC_TRAINING");
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

